Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C86A21F5D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 15:40:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932F910E806;
	Wed, 29 Jan 2025 14:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="DGfwX0nO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F32A10E806
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 14:40:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1738161606; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DfbcYJ5AR+R8DsGvqmcb+/2BWUAKv8DnfNQzqyla9hmVme5gBFj4gfbGRJp9OW0N+PvAYxNlUOC49Q9zeesnNrBgRrpzsy687JigqHVPENfj9Z/pZmuChFgMCTg9mkPesWEOvfiRvkxLc5mvUSDaaaRGeqrHxoupnm8NDNMQlDg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1738161606;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=PoONWoZjAfKHvZcII9BT/PJegJNZ5m/T3eW5vIBqcYw=; 
 b=Bmmy9FDwFhlJp3622EBINBRcPwqOUZ2NWcijtiyP2e53LdSA8I5GHIoKBPrm/wkcv4gwgbdcfpkRtY77p4FD9kTEFbh8jgpGOOAjuPo33hoLdtoUIgMnEX2CMNKxaVcvw/lK0OTDfmQyWIVPw/tdNNV2Z3PSemWF5AjT4To5GZw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738161606; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=PoONWoZjAfKHvZcII9BT/PJegJNZ5m/T3eW5vIBqcYw=;
 b=DGfwX0nOYwu5rhfFE+Binp3fTXeWAIuqEtGuP25N2CKiT/bx2R2K5KTZqdaIibNV
 /+wyJCWhy9BWGlKnTYqglka44eSX7oRooH1xlY3kkldkuKbbQeBu+yzTAJqOAP+iO8P
 8XPOqOnMnZOtiaBN4gJn+PZ0/RkAWVg36EERXTSI=
Received: by mx.zohomail.com with SMTPS id 17381615971231003.7746563217795;
 Wed, 29 Jan 2025 06:39:57 -0800 (PST)
Message-ID: <2f3394a5-0c63-49bf-bc85-f43388050ab8@collabora.com>
Date: Wed, 29 Jan 2025 17:39:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/virtio: Align host mapping request to maximum
 platform page size
To: fnkl.kernel@gmail.com, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
References: <20250125-virtgpu-mixed-page-size-v2-1-c40c555cf276@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250125-virtgpu-mixed-page-size-v2-1-c40c555cf276@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 1/26/25 00:08, Sasha Finkelstein via B4 Relay wrote:
> --- a/drivers/gpu/drm/virtio/virtgpu_vram.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vram.c
> @@ -150,8 +150,8 @@ static int virtio_gpu_vram_map(struct virtio_gpu_object *bo)
>  		return -EINVAL;
>  
>  	spin_lock(&vgdev->host_visible_lock);
> -	ret = drm_mm_insert_node(&vgdev->host_visible_mm, &vram->vram_node,
> -				 bo->base.base.size);
> +	ret = drm_mm_insert_node_generic(&vgdev->host_visible_mm, &vram->vram_node,
> +					 bo->base.base.size, MAX_PAGE_SIZE, 0, 0);
>  	spin_unlock(&vgdev->host_visible_lock);

The BO size is already aligned, no need to align it second time.

Anyways, we first should wait for a reply from Rob RE potential impact
of this change on Freedreno and other non-x86 drivers and non-nctx contexts.

Otherwise, the proper solution would be to pass info about host's page
size to guest using extended virtio protocol. This is very doable if you
have time to work on this useful feature and want to contribute/learn more.

-- 
Best regards,
Dmitry

