Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 837DB8952D0
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 14:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB36710FCD0;
	Tue,  2 Apr 2024 12:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="tVizRN1e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B90710FCCD
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 12:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712060480;
 bh=HfpmeKZnkkFXaCQeRtGNvX0DALTE60IDykW4I9/bvKc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tVizRN1eaG/A4k20L4YfTkZgs+JGOXCVd1K8Vq0dFZlAvnMmJ08sAA2gXSIfJ2+vG
 EqSIWOY/xh7ZFbTpTU9Xk5t9TzcjgGKWIZhUarLwPkPSexkexlrIb/nxGoAJ6sbPeJ
 Yh8F02PTp9oFl05I2bmYZ6RLi6CtEz7nRDL5Ydb0gzQ1IzhYKutA8cGYOX8fGMOvhX
 BL5bDBWg6tSwRsx1nyAJTfvgxjZzFvsQ2vBNiIAdOLJ6SLAYBLpKZvE4tvDydyhmyT
 IB9myNMIf3Edp7t9hqgk41FZru2H923YDBBagB1K0Bt8pvYoMM0horwhFk3ezEFG4J
 GqCnhb00u9bNQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2E67F3781144;
 Tue,  2 Apr 2024 12:21:20 +0000 (UTC)
Date: Tue, 2 Apr 2024 14:21:19 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Heiko Stuebner
 <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Fix off by one in panthor_fw_get_cs_iface()
Message-ID: <20240402142119.436dcfb6@collabora.com>
In-Reply-To: <62835c16-c85c-483d-a8fe-63be78d49d15@moroto.mountain>
References: <62835c16-c85c-483d-a8fe-63be78d49d15@moroto.mountain>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
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

On Tue, 2 Apr 2024 12:56:42 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> The ->iface.streams[csg_slot][] array has MAX_CS_PER_CSG elements so
> this > comparison needs to be >= to prevent an out of bounds access.
> 
> Fixes: 2718d91816ee ("drm/panthor: Add the FW logical block")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_fw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 33c87a59834e..181395e2859a 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -308,7 +308,7 @@ panthor_fw_get_csg_iface(struct panthor_device *ptdev, u32 csg_slot)
>  struct panthor_fw_cs_iface *
>  panthor_fw_get_cs_iface(struct panthor_device *ptdev, u32 csg_slot, u32 cs_slot)
>  {
> -	if (drm_WARN_ON(&ptdev->base, csg_slot >= MAX_CSGS || cs_slot > MAX_CS_PER_CSG))
> +	if (drm_WARN_ON(&ptdev->base, csg_slot >= MAX_CSGS || cs_slot >= MAX_CS_PER_CSG))
>  		return NULL;
>  
>  	return &ptdev->fw->iface.streams[csg_slot][cs_slot];

