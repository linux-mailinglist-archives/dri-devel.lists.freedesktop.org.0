Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE35669BDD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 16:22:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4166910EA1E;
	Fri, 13 Jan 2023 15:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6774B10EA1E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 15:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l89XFavmNjAE5UF/LHKsUhVmZj6Vfe+y8cLdn2NUvEs=; b=J7PZqkzkKBELDCDLebSqBlrNEH
 8VTJlhHy07+Cby9uo53gQ/91HAfphS5I53halQvc6BsJ1zT40a6p2t0nhb4BrbjNtMwDZRUNALwKO
 Mgd61Q5cmyvt0aEs7ZKCQCzehAsa9isat51YyVWneHjVazJIjisqfabEW49G/x//QLBZjZTVxu1Pi
 fgt3uKLIOS4G9m/MHQDFld7RBaIacbi9CLtfUh1J56NZD2d/5Qkock+OYWXQW0daaRQUKwDOtSAq/
 cN0P3lG3ogn/7Wb+9+tG38ept0Meou/4FZxCyzT5cLfsgWP51o/IZMoK2/U5aAYgrn3Im6VaV8tYp
 Rf8l6pzQ==;
Received: from [200.233.54.74] (helo=[192.168.15.16])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pGLt5-007Dvh-Jp; Fri, 13 Jan 2023 16:22:35 +0100
Message-ID: <6fe571a6-5c6f-e64b-efcb-b1967e7501a1@igalia.com>
Date: Fri, 13 Jan 2023 12:22:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] drm/vc4: replace obj lookup steps with
 drm_gem_objects_lookup
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
References: <20230102124535.139202-1-mcanal@igalia.com>
 <20230102124535.139202-3-mcanal@igalia.com>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20230102124535.139202-3-mcanal@igalia.com>
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
Cc: Emma Anholt <emma@anholt.net>, dri-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maíra,

Thank you for your patch, it really simplifies the code.

I think it's OK as it is, so I'll give my

     Reviewed-by: André Almeida <andrealmeid@igalia.com>

for this series. But I would also like to notice that VC4 had some extra 
DRM_ log functions that the DRM version hasn't, so I think they would be 
a good addition in a different patch.

On 1/2/23 09:45, Maíra Canal wrote:
> As vc4_cl_lookup_bos() performs the same steps as drm_gem_objects_lookup(),
> replace the open-coded implementation in vc4 to simply use the DRM function.
>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/vc4/vc4_gem.c | 43 ++---------------------------------
>   1 file changed, 2 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
> index d6985d067e34..03648f954985 100644
> --- a/drivers/gpu/drm/vc4/vc4_gem.c
> +++ b/drivers/gpu/drm/vc4/vc4_gem.c
> @@ -746,7 +746,6 @@ vc4_cl_lookup_bos(struct drm_device *dev,
>   		  struct vc4_exec_info *exec)
>   {
>   	struct drm_vc4_submit_cl *args = exec->args;
> -	uint32_t *handles;
>   	int ret = 0;
>   	int i;
>   
> @@ -760,43 +759,8 @@ vc4_cl_lookup_bos(struct drm_device *dev,
>   		return -EINVAL;
>   	}
>   
> -	exec->bo = kvmalloc_array(exec->bo_count,
> -				    sizeof(struct drm_gem_dma_object *),
> -				    GFP_KERNEL | __GFP_ZERO);
> -	if (!exec->bo) {
> -		DRM_ERROR("Failed to allocate validated BO pointers\n");
> -		return -ENOMEM;
> -	}
> -
> -	handles = kvmalloc_array(exec->bo_count, sizeof(uint32_t), GFP_KERNEL);
> -	if (!handles) {
> -		ret = -ENOMEM;
> -		DRM_ERROR("Failed to allocate incoming GEM handles\n");
> -		goto fail;
> -	}
> -
> -	if (copy_from_user(handles, u64_to_user_ptr(args->bo_handles),
> -			   exec->bo_count * sizeof(uint32_t))) {
> -		ret = -EFAULT;
> -		DRM_ERROR("Failed to copy in GEM handles\n");
> -		goto fail;
> -	}
> -
> -	spin_lock(&file_priv->table_lock);
> -	for (i = 0; i < exec->bo_count; i++) {
> -		struct drm_gem_object *bo = idr_find(&file_priv->object_idr,
> -						     handles[i]);
> -		if (!bo) {
> -			DRM_DEBUG("Failed to look up GEM BO %d: %d\n",
> -				  i, handles[i]);
> -			ret = -EINVAL;
> -			break;
> -		}
> -
> -		drm_gem_object_get(bo);
> -		exec->bo[i] = bo;
> -	}
> -	spin_unlock(&file_priv->table_lock);
> +	ret = drm_gem_objects_lookup(file_priv, u64_to_user_ptr(args->bo_handles),
> +				     exec->bo_count, &exec->bo);
>   
>   	if (ret)
>   		goto fail_put_bo;
> @@ -807,7 +771,6 @@ vc4_cl_lookup_bos(struct drm_device *dev,
>   			goto fail_dec_usecnt;
>   	}
>   
> -	kvfree(handles);
>   	return 0;
>   
>   fail_dec_usecnt:
> @@ -827,8 +790,6 @@ vc4_cl_lookup_bos(struct drm_device *dev,
>   	for (i = 0; i < exec->bo_count && exec->bo[i]; i++)
>   		drm_gem_object_put(exec->bo[i]);
>   
> -fail:
> -	kvfree(handles);
>   	kvfree(exec->bo);
>   	exec->bo = NULL;
>   	return ret;
