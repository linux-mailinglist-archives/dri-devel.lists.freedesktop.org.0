Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 699A79B3F44
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 01:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9AF10E08E;
	Tue, 29 Oct 2024 00:41:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="WsOo4j2Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C0EF10E08E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 00:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8Dq2glZ0NfqhvV5y6suDwt/Z1dbtk682WCmFRR6oDqs=; b=WsOo4j2YQHKycPmIT2RZgxRVav
 vk1RYMj3ZTACmClMc5CN9VtyG9MLN2Uc5CvNXCbRXKds1yTrW8c7jjMIymSq/fGmWo2lHLnDeKiHB
 pLA+xNGnFjwutMRHOXRuBPtlPMGCzJLpGYzLb1M1W5/G7b0ucRPKDPyjfo6oARiosotTFHz0SAf9Z
 XzO3d0RWTCOfrIyjNzuxVwQoUihzoQV02dCYUrpBHPztw/TQWNmKeMOkZEB+006VktgrrgE0JK/b6
 eVRvGKZrn6OWWhoihHlQlAKMQYmHl03LXe0TU6Ymx7m4+drqiVw4UCAf1buwy7lxOVECYxHhCcrDz
 hr8IdSww==;
Received: from [187.36.213.55] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1t5aIj-00GJ8x-Lu; Tue, 29 Oct 2024 01:41:37 +0100
Message-ID: <38486268-ad83-4719-8ad5-ead05935d02d@igalia.com>
Date: Mon, 28 Oct 2024 21:41:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/v3d: Drop allocation of object without mountpoint
To: matthias.bgg@kernel.org, Melissa Wen <mwen@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20241028-v3d-v1-1-907bee355edf@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20241028-v3d-v1-1-907bee355edf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Matthias,

Thanks for your patch!

On 28/10/24 11:27, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Function drm_gem_shmem_create_with_mnt() creates an object
> without using the mountpoint if gemfs is NULL.
> 
> Drop the else branch calling drm_gem_shmem_create().
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>   drivers/gpu/drm/v3d/v3d_bo.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
> index 7055f7c7bcfe5700aee10b09ecc0005197323b01..f6df9e0947b6ee06043cdbb42c4f98a71bdeba4d 100644
> --- a/drivers/gpu/drm/v3d/v3d_bo.c
> +++ b/drivers/gpu/drm/v3d/v3d_bo.c
> @@ -157,13 +157,8 @@ struct v3d_bo *v3d_bo_create(struct drm_device *dev, struct drm_file *file_priv,
>   	struct v3d_bo *bo;
>   	int ret;
>   
> -	/* Let the user opt out of allocating the BOs with THP */
> -	if (v3d->gemfs)
> -		shmem_obj = drm_gem_shmem_create_with_mnt(dev, unaligned_size,
> +	shmem_obj = drm_gem_shmem_create_with_mnt(dev, unaligned_size,
>   							  v3d->gemfs);

Please, run scripts/checkpatch.pl before sending the patch.

Best Regards,
- Maíra

> -	else
> -		shmem_obj = drm_gem_shmem_create(dev, unaligned_size);
> -
>   	if (IS_ERR(shmem_obj))
>   		return ERR_CAST(shmem_obj);
>   	bo = to_v3d_bo(&shmem_obj->base);
> 
> ---
> base-commit: dec9255a128e19c5fcc3bdb18175d78094cc624d
> change-id: 20241028-v3d-1d2546ed92d7
> 
> Best regards,

