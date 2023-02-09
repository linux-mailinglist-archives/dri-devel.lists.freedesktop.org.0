Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29241690585
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 11:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9E110E08C;
	Thu,  9 Feb 2023 10:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5C410E08C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 10:46:21 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id j23so1365706wra.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 02:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C6vCcZKIbCf5nxQIZegRS63EM/jfTgwbwqB48H2p5lw=;
 b=YolBCpVOKw3RdkmGIvS6TkDoXc8A/up9kzXS8OsOY7+lnFCdcg6qqJ9bmeqJJC2Utb
 E9BC8n10c2A24yQwW4zF5sAiWicMsq517hOZd5l9jTvX++vvn3Pq9XbqIyHCUIBaM2kr
 aBEdc6HVNeO7PEfcTamkXkFXgWDhPU+YSOMaDTa+p8akz8NOTUzlBvzerKlBiBhteo/6
 5azWtwuQAPWm9wuGPltuSxZo58EfkriUv88RlAHVp+wWqzbZ7jKZzPdYhcZ/a9a2ZKFO
 j3pxpw5L+9uHj/D6+LjrimPo7pOmC1xG77zu1CXdHCeOu6MJWKvOsuQkmitjLn67Adif
 srjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C6vCcZKIbCf5nxQIZegRS63EM/jfTgwbwqB48H2p5lw=;
 b=vYJs/1w7EoDdlI6IfJfC3HKmAqmmh5fU4kTXqRh2CoCJr7ZNaPD3VUdiN9RFZ4oMTm
 Yf7lCcvITXhnpaZjTqlsHQyEyXGkP2y9lg5wsKNkW0Msl6pBdXTPI8sgmBxm+hBOa7k8
 JRXEGZ95oLJcTYT3xzlykZm/2d7YeNifGPOAltpgBTBHTPoUJeF9r2dfSUSBRyvDznyA
 eAW5e+33OuIUxbIWHCL1gHYRfvN2nokRa6Zsc8SP9+aqAWzNUSS6Bzvh0aPZTFg4/aIj
 ANqDDJXwpU8mZGLxnI8JfYP8e79rhdg/5Viu5+qrFZAdFeRvoB6g3beRFswpyZKXwlk8
 ID0Q==
X-Gm-Message-State: AO0yUKVkk/X3Nrq7GTagQAbp4JOJ6s9nj1YUS/BMGkvl/NXLJhLkTVjC
 G9vmJFcM37dgtnlldLIsJjgOGXjzbeI=
X-Google-Smtp-Source: AK7set+FDFE2u+uSIzy24xdfCR37FA+0vVDHaHkS3X1n8UQ16LJHO02mzL9dXutxjSF3MsEsSAsXRA==
X-Received: by 2002:adf:e5cb:0:b0:2c4:626:acd4 with SMTP id
 a11-20020adfe5cb000000b002c40626acd4mr4111367wrn.13.1675939580091; 
 Thu, 09 Feb 2023 02:46:20 -0800 (PST)
Received: from [192.168.2.181] (46-10-148-90.ip.btc-net.bg. [46.10.148.90])
 by smtp.gmail.com with ESMTPSA id
 n10-20020adffe0a000000b002c3ec35f360sm904126wrr.56.2023.02.09.02.46.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 02:46:19 -0800 (PST)
Message-ID: <b0a2486b-3dbb-a7f3-4079-7ff3b8208c09@gmail.com>
Date: Thu, 9 Feb 2023 12:46:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/vmwgfx: Do not drop the reference to the handle too
 soon
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20230208215340.2103955-1-zack@kde.org>
Content-Language: en-US
From: "Martin Krastev (VMware)" <martinkrastev768@gmail.com>
In-Reply-To: <20230208215340.2103955-1-zack@kde.org>
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com, banackm@vmware.com,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Krastev <krastevm@vmware.com>


Looks good to me.
Reviewed-by: Martin Krastev <krastevm@vmware.com>


Regards,
Martin


On 8.02.23 г. 23:53 ч., Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
>
> It is possible for userspace to predict the next buffer handle and
> to destroy the buffer while it's still used by the kernel. Delay
> dropping the internal reference on the buffers until kernel is done
> with them.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Fixes: 8afa13a0583f ("drm/vmwgfx: Implement DRIVER_GEM")
> Cc: <stable@vger.kernel.org> # v5.17+
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_bo.c      | 3 ++-
>   drivers/gpu/drm/vmwgfx/vmwgfx_gem.c     | 4 ++--
>   drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 1 -
>   3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> index 43ffa5c7acbd..65bd88c8fef9 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -708,7 +708,8 @@ int vmw_dumb_create(struct drm_file *file_priv,
>   	ret = vmw_gem_object_create_with_handle(dev_priv, file_priv,
>   						args->size, &args->handle,
>   						&vbo);
> -
> +	/* drop reference from allocate - handle holds it now */
> +	drm_gem_object_put(&vbo->tbo.base);
>   	return ret;
>   }
>   
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> index 51bd1f8c5cc4..d6baf73a6458 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> @@ -133,8 +133,6 @@ int vmw_gem_object_create_with_handle(struct vmw_private *dev_priv,
>   	(*p_vbo)->tbo.base.funcs = &vmw_gem_object_funcs;
>   
>   	ret = drm_gem_handle_create(filp, &(*p_vbo)->tbo.base, handle);
> -	/* drop reference from allocate - handle holds it now */
> -	drm_gem_object_put(&(*p_vbo)->tbo.base);
>   out_no_bo:
>   	return ret;
>   }
> @@ -161,6 +159,8 @@ int vmw_gem_object_create_ioctl(struct drm_device *dev, void *data,
>   	rep->map_handle = drm_vma_node_offset_addr(&vbo->tbo.base.vma_node);
>   	rep->cur_gmr_id = handle;
>   	rep->cur_gmr_offset = 0;
> +	/* drop reference from allocate - handle holds it now */
> +	drm_gem_object_put(&vbo->tbo.base);
>   out_no_bo:
>   	return ret;
>   }
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> index 9d4ae9623a00..d18fec953fa7 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> @@ -867,7 +867,6 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
>   			goto out_unlock;
>   		}
>   		vmw_bo_reference(res->guest_memory_bo);
> -		drm_gem_object_get(&res->guest_memory_bo->tbo.base);
>   	}
>   
>   	tmp = vmw_resource_reference(&srf->res);
