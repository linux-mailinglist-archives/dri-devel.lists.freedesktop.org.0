Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B100A6E69B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 23:33:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9921F10E15C;
	Mon, 24 Mar 2025 22:32:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="F5A1duqC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8E610E15C
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 22:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1WdlTi1d7o18R2KP/8euIUCry/Dqwu8cuZ/o13ePFU8=; b=F5A1duqC9Qk8Hg3SLTTqj2Lkjk
 XVM8inQxV+2cjh3eXQOqEJGbZ00MleVnueo5gJXZqSKRJFgcH6Ot0vJaTiY9jE89Db5CmjHab6wEu
 hdDdEtAJOkzgsyQVLsiQfGP+qZwIBAW7uDkOldr4iOsjBaz5eho6gMr6piqB87bC+ZGS3Qw5BX3SH
 tW+XUB/OXCJcY6b79atNQRneomsmZyQPJ/5Z9o3HC3Z9KB3TpQZoZ6bTvnzGf/UFiyln2JJph2xYZ
 qJjTWESuI5VrRIRuEW157H2VY//IOCoujJ3zlstTEhHPyA1ieMTrgV5hgVqrmBH4Fp8KlM3NzorAN
 lW6dOAkw==;
Received: from [189.7.87.178] (helo=[192.168.0.224])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1twqLn-005uVX-Pg; Mon, 24 Mar 2025 23:32:56 +0100
Message-ID: <ed004911-dc1f-4e15-9df0-a43e0334fcb1@igalia.com>
Date: Mon, 24 Mar 2025 19:32:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/syncobj: Use put_user in drm_syncobj_query_ioctl
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com
References: <20250318155424.78552-1-tvrtko.ursulin@igalia.com>
 <20250318155424.78552-5-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250318155424.78552-5-tvrtko.ursulin@igalia.com>
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

Hi Tvrtko,

On 18/03/25 12:54, Tvrtko Ursulin wrote:
> Since the query loop is using copy_to_user() to write out a single u64 at
> a time it feels more natural (and is a tiny bit more compact) to replace
> it with put_user().
> 
> Access_ok() check is added to the input checking for an early bailout in
> case of a bad buffer passed in.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/drm_syncobj.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index cdda2df06bec..74d1dc0d1f8b 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -1643,6 +1643,9 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>   	if (args->count_handles == 0)
>   		return -EINVAL;
>   
> +	if (!access_ok(points, args->count_handles * sizeof(*points)))
> +		return -EFAULT;
> +
>   	ret = drm_syncobj_array_find(file_private,
>   				     u64_to_user_ptr(args->handles),
>   				     args->count_handles,
> @@ -1684,10 +1687,10 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>   			point = 0;
>   		}
>   		dma_fence_put(fence);
> -		ret = copy_to_user(&points[i], &point, sizeof(uint64_t));
> -		ret = ret ? -EFAULT : 0;
> -		if (ret)
> +		if (__put_user(point, points++)) {
> +			ret = -EFAULT;
>   			break;
> +		}
>   	}
>   	drm_syncobj_array_free(syncobjs, args->count_handles);
>   

