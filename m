Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DCB92A4AE
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 16:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30FA10E37B;
	Mon,  8 Jul 2024 14:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qH4/G02J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD3F10E37B;
 Mon,  8 Jul 2024 14:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1720449022;
 bh=UK1alpRLVojcjqHEMZmxpNsz5oT0x+BMwmb8zL2rljs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qH4/G02JPZf6ORUyvihDWgmTXxaRGQkoJHgQhA8/6V8aH9d+9K7wpl0FLOH02ktfL
 TtP6QEBx2u6tFNWtK9NcDM5aaHSOPkyzkD10KZs+PFI682EPyd53ilE7GiKvRywgbw
 8DZbYc+Rdg0XipfpfLid+GjVdkPBvW8pxVIUa2nlKF7w+KIqgW1b7dh39AF6vxS/mF
 DlRibNlH5CYI0oDI5rJdZ2NMAXDy4S0/mjRr/I19KDzilORWeewoe/ObabbnXE8QO3
 j+daDceJz+rZlYMy+PHbbIOuVpRxTkIxIvptFYOHiVQsRt1ezMef0qBTu6gUdHwv+p
 B2c7u9d8Viwqw==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D322937811CD;
 Mon,  8 Jul 2024 14:30:20 +0000 (UTC)
Message-ID: <21750085-dbb0-4fc5-8644-ebed5373dde9@collabora.com>
Date: Mon, 8 Jul 2024 17:30:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/qxl: Pin buffer objects for internal mappings
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 kraxel@redhat.com, zack.rusin@broadcom.com, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 david.kaplan@amd.com, christian.koenig@amd.com
Cc: regressions@leemhuis.info, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20240708142208.194361-1-tzimmermann@suse.de>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20240708142208.194361-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 7/8/24 17:21, Thomas Zimmermann wrote:
> Add qxl_bo_pin_and_vmap() that pins and vmaps a buffer object in one
> step. Update callers of the regular qxl_bo_vmap(). Fixes a bug where
> qxl accesses an unpinned buffer object while it is being moved; such
> as with the monitor-description BO. An typical error is shown below.
> 
> [    4.303586] [drm:drm_atomic_helper_commit_planes] *ERROR* head 1 wrong: 65376256x16777216+0+0
> [    4.586883] [drm:drm_atomic_helper_commit_planes] *ERROR* head 1 wrong: 65376256x16777216+0+0
> [    4.904036] [drm:drm_atomic_helper_commit_planes] *ERROR* head 1 wrong: 65335296x16777216+0+0
> [    5.374347] [drm:qxl_release_from_id_locked] *ERROR* failed to find id in release_idr
> 
> Commit b33651a5c98d ("drm/qxl: Do not pin buffer objects for vmap")
> removed the implicit pin operation from qxl's vmap code. This is the
> correct behavior for GEM and PRIME interfaces, but the pin is still
> needed for qxl internal operation.
> 
> Also add a corresponding function qxl_bo_vunmap_and_unpin() and remove
> the old qxl_bo_vmap() helpers.
> 
> Future directions: BOs should not be pinned or vmapped unnecessarily.
> The pin-and-vmap operation should be removed from the driver and a
> temporary mapping should be established with a vmap_local-like helper.
> See the client helper drm_client_buffer_vmap_local() for semantics.
> 
> v2:
> - unreserve BO on errors in qxl_bo_pin_and_vmap() (Dmitry)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: b33651a5c98d ("drm/qxl: Do not pin buffer objects for vmap")
> Reported-by: David Kaplan <david.kaplan@amd.com>
> Closes: https://lore.kernel.org/dri-devel/ab0fb17d-0f96-4ee6-8b21-65d02bb02655@suse.de/
> Tested-by: David Kaplan <david.kaplan@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: virtualization@lists.linux.dev
> Cc: spice-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/qxl/qxl_display.c | 14 +++++++-------
>  drivers/gpu/drm/qxl/qxl_object.c  | 13 +++++++++++--
>  drivers/gpu/drm/qxl/qxl_object.h  |  4 ++--
>  3 files changed, 20 insertions(+), 11 deletions(-)

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

