Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D93209B683A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 16:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFC010E7C3;
	Wed, 30 Oct 2024 15:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="AV9tuxag";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEEDE10E7C3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 15:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730303176;
 bh=iwWqp3Y98GN4kgNN8JxNiGNWIwHzlZkanMeWzBrEf6k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AV9tuxagUxLHRDHkj7WLbNyUDRSpfcLxNda6MXaDvdkmJSqWVxmXpWUd740Yx4Be4
 F2RN3j+pHcPHRBtmI5A8irAXLRK9QCiXf49uYAzTodwmRWv1k3EsynVYe0WBr29uTS
 78V7RAoxGV5hblnSmV75f/blPkAcDEEXszUq0n0OmD0xH5qD6eB9lCb+sGRGEXxtRM
 X+CBrddrSAO4R6MfMf3VDSmEOLD5ZvXkQn43F3v47nkUX/VFNETzWbr+ZCWQr5QGCx
 E/7tXCFiGGFhqGe/UUsuz1VG6NluaEQ1MDCGn/8aIDLeY5p64Q0hIvWxgllPjXNJPL
 3XuwVQhBty3Gg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CEFEB17E365E;
 Wed, 30 Oct 2024 16:46:15 +0100 (CET)
Date: Wed, 30 Oct 2024 16:46:12 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Akash Goel <akash.goel@arm.com>
Cc: liviu.dudau@arm.com, steven.price@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mihail.atanassov@arm.com, ketil.johnsen@arm.com, florent.tomasin@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
Subject: Re: [PATCH 0/3] drm/panthor: Coherency related fixes
Message-ID: <20241030164612.42835f3c@collabora.com>
In-Reply-To: <20241024145432.934086-1-akash.goel@arm.com>
References: <20241024145432.934086-1-akash.goel@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 24 Oct 2024 15:54:29 +0100
Akash Goel <akash.goel@arm.com> wrote:

> This patch series contains 3 cache coherency related fixes for the
> Panthor driver.
> - The first fix, regarding the Inner-shareability, is mandatory to
>   ensure things work on all platforms (including Juno FPGA) when
>   no_coherency protocol is selected.
> - The second fix regarding the coherency feature/enable register is
>   required to avoid potential misalignment on certain platforms.
> - The third fix, regarding the potential overwrite of buffer objects,
>   has been prepared speculatively & it may not be required in practice.
>   Please provide feedback on it.
> 
> Akash Goel (3):
>   drm/panthor: Update memattr programing to align with GPU spec
>   drm/panthor: Explicitly set the coherency mode
>   drm/panthor: Prevent potential overwrite of buffer objects

For some reason, our replies didn't make it to patchwork [1], meaning I
don't have the R-b tags when I apply the patch. Could you send a v2
with the R-bs added, so I can at least apply the first two patches to
drm-misc-fixes?

[1]https://patchwork.freedesktop.org/series/140498/

> 
>  drivers/gpu/drm/panthor/panthor_device.c | 22 ++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_gem.h    | 10 +++++++++
>  drivers/gpu/drm/panthor/panthor_gpu.c    |  9 ++++++++
>  drivers/gpu/drm/panthor/panthor_mmu.c    | 28 +++++++++++++++++-------
>  4 files changed, 60 insertions(+), 9 deletions(-)
> 

