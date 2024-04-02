Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE025894CB8
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 09:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF0910FAE8;
	Tue,  2 Apr 2024 07:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kQRv9HKA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A5010FAEB
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 07:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712043397;
 bh=uiZD/GIpS541nuZOCp2PJe4nnDJEbZbjHYbmpb2l66M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kQRv9HKAwqjQpXQwBNL/epJsVOR2c0HmcVrJN6NrH/divBlGwLcjycHI8AmVsysVT
 W/QEfpE91ucf2jrdqZr7CS92x3w7ncwb9bK15uiGqpOn9V8GxUlL+ojREUw+/tkTnz
 yuV+fnnYCj2vfyJCLIc/pBUf35K5iyuiRImNbz8+FleQakCFwzEoVidvoLmlFqx/vq
 Yfkv4rfhlHMIujANKhUkLznRPgNCVaveVhzoW3B81yAPG3qxzh07B3kF5yMcHPnGPy
 5zOQhMVmk47IhFkL0rLotKM3GAkk4QTTCa5cknEK7mcXX5wCVp3wWncz5yAeoIjfxC
 TwyWV7dGZv4Ag==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9A17F378045F;
 Tue,  2 Apr 2024 07:36:36 +0000 (UTC)
Date: Tue, 2 Apr 2024 09:36:35 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, "Lukas F .
 Hartmann" <lukas@mntmn.com>
Subject: Re: [PATCH v3 1/3] drm/panthor: Fix IO-page mmap() for 32-bit
 userspace on 64-bit kernel
Message-ID: <20240402093635.056bd8dc@collabora.com>
In-Reply-To: <20240326111205.510019-1-boris.brezillon@collabora.com>
References: <20240326111205.510019-1-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 26 Mar 2024 12:12:03 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> When mapping an IO region, the pseudo-file offset is dependent on the
> userspace architecture. panthor_device_mmio_offset() abstracts that
> away for us by turning a userspace MMIO offset into its kernel
> equivalent, but we were not updating vm_area_struct::vm_pgoff
> accordingly, leading us to attach the MMIO region to the wrong file
> offset.
>=20
> This has implications when we start mixing 64 bit and 32 bit apps, but
> that's only really a problem when we start having more that 2^43 bytes of
> memory allocated, which is very unlikely to happen.
>=20
> What's more problematic is the fact this turns our
> unmap_mapping_range(DRM_PANTHOR_USER_MMIO_OFFSET) calls, which are
> supposed to kill the MMIO mapping when entering suspend, into NOPs.
> Which means we either keep the dummy flush_id mapping active at all
> times, or we risk a BUS_FAULT if the MMIO region was mapped, and the
> GPU is suspended after that.
>=20
> Solve that by patching vm_pgoff early in panthor_mmap(). With
> this in place, we no longer need the panthor_device_mmio_offset()
> helper.
>=20
> v3:
> - No changes
>=20
> v2:
> - Kill panthor_device_mmio_offset()
>=20
> Fixes: 5fe909cae118 ("drm/panthor: Add the device logical block")
> Reported-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> Reported-by: Lukas F. Hartmann <lukas@mntmn.com>
> Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/10835
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

All 3 patches queued to drm-misc-next.
