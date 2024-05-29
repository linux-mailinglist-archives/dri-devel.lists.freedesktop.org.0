Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD31A8D2E48
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 09:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA1010E46B;
	Wed, 29 May 2024 07:32:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="BrZRV001";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D19110E46B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 07:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716967939;
 bh=cADutWs2Dsx1o9inKNPez5xFnY+sOuOUeUDqJ44drFk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BrZRV001CJRtCqhATXy9C/FXVikr+5BdllJGZ2rStBbfQk7E4RecsGhHyLUYYTaIX
 DdX1+wJBWQFYV5tjrx9nrd9tQQJymjFfZSy6VjmJioLWGMpiRHvVXQcCdNqEjHg2nc
 5Ofxh4snXgHT9f0visanV+QcHJiyJBN05ySKzTc3bXeWPSMtlxnPKH6PZ80J06d8dh
 S9WP60/wwTTEDRUGmWqBV3OvWMlJ/QKPqS3N9XUPm0tVd+j32q0IXhPWDAzVjl0jg6
 RjMI6caeXqeU15q9tG1E37Yw3kWZXMAASFBGSEMNh/yZchKQ5k8TQK7AdofrfG5BSK
 Nino7JsVpA7dA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0DFB63780627;
 Wed, 29 May 2024 07:32:18 +0000 (UTC)
Date: Wed, 29 May 2024 09:32:16 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Zack Rusin <zack.rusin@broadcom.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 0/3] drm: Fix dma_resv deadlock at drm object pin time
Message-ID: <20240529093216.6640d05d@collabora.com>
In-Reply-To: <20240523113236.432585-1-adrian.larumbe@collabora.com>
References: <20240523113236.432585-1-adrian.larumbe@collabora.com>
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

On Thu, 23 May 2024 12:32:16 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> This is v4 of https://lore.kernel.org/lkml/20240521181817.097af5e1@collab=
ora.com/T/
>=20
> The goal of this patch series is fixing a deadlock upon locking the dma r=
eservation
> of a DRM gem object when pinning it, at a prime import operation.
>=20
> Changelog:
> v3:
>  - Split driver fixes into separate commits for Panfrost and Lima
>  - Make drivers call drm_gem_shmem_pin_locked instead of drm_gem_shmem_ob=
ject_pin
>  - Improved commit message for first patch to explain why dma resv lockin=
g in the=20
>  pin callback is no longer necessary.
> v2:
>  - Removed comment explaining reason why an already-locked
> pin function replaced the locked variant inside Panfrost's
> object pin callback.
>  - Moved already-assigned attachment warning into generic
> already-locked gem object pin function
>=20
>=20
> Adri=C3=A1n Larumbe (3):
>   drm/panfrost: Fix dma_resv deadlock at drm object pin time
>   drm/lima: Fix dma_resv deadlock at drm object pin time
>   drm/gem-shmem: Add import attachment warning to locked pin function

Queued to drm-misc-fixes.

Thanks!

Boris
