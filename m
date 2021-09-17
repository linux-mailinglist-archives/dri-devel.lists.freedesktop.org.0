Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C60640FADD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 16:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB506ED29;
	Fri, 17 Sep 2021 14:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9976E6ED29
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 14:55:53 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id g8so31118222edt.7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 07:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=C3fVriQhyhLcrcdu/qOBtJVaOvb8K1d7euQOmBJPamw=;
 b=OAMIjxM70eMdm+wOTlV6mJ5g0YFIqjwqNt9rw3/ZrVUF58MR0n8mZiii1VSbnWTYyd
 HWC94C7HwwBCXhKKQXpBwRzXQoORyN+ZPVDYmXqLDr/lsZ27SxhgdrXbU/zgj1PaPYDe
 2KW9KGDMU3N2Bdl8+WvyQbf0sjbgRKx0AlkVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=C3fVriQhyhLcrcdu/qOBtJVaOvb8K1d7euQOmBJPamw=;
 b=gKWavGjVcjFrTaLS+hX7q5voo2ufjIgdxA386rv9CXDXRqh/hHPdYJoczRL1jRtIB8
 7TtsWSQfJ/mT9XbmQiLbDFODwXGic2Zk0Lpm36OnoWOPtkqPRftm/l6aW7/XEfXc/TdS
 JGXKcKVuaStcBvFRkt+4RDSyNNxYrDS91zm7eikfqHkTF/5eg7JGgqxr8NRL6zDsU+++
 LLqJSnbxhPaOL1QyLOa55EjhQzwLBXuaYpAojmHwzmy6zzBgRk3NQwy4j4vf9+BWDQNm
 x2p4/vx8K4EG8OrGQY+HodPIvIt1QAn+T3RlqqegJ5ldLRsDOfITfHx0k5u4ylz1nKFl
 3bRA==
X-Gm-Message-State: AOAM530ku+CNWWHVRrhO8TAvNPFUT5Tg5RCSqUhptWrX0XLs6bXjZ2DZ
 HdOTYT7tLF1IjL8aQe5I2MWdLe29o6y8tA==
X-Google-Smtp-Source: ABdhPJy84j69je6oUuVzQ8QL7Dd0rshCTE9DeszWKX/tqoJPbBlAp/hxVJJanqu6suLVrlakwZ1ZrA==
X-Received: by 2002:a17:907:7844:: with SMTP id
 lb4mr12598077ejc.381.1631890552068; 
 Fri, 17 Sep 2021 07:55:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r26sm2397972ejd.85.2021.09.17.07.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 07:55:51 -0700 (PDT)
Date: Fri, 17 Sep 2021 16:55:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 daniel@ffwll.ch
Subject: Re: [PATCH 21/26] drm: use new iterator in
 drm_gem_plane_helper_prepare_fb v2
Message-ID: <YUSsdbTxvJwaRv9x@phenom.ffwll.local>
References: <20210917123513.1106-1-christian.koenig@amd.com>
 <20210917123513.1106-22-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210917123513.1106-22-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Fri, Sep 17, 2021 at 02:35:08PM +0200, Christian König wrote:
> Makes the handling a bit more complex, but avoids the use of
> dma_resv_get_excl_unlocked().
> 
> v2: add missing rcu_read_lock()/unlock()
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/drm_gem_atomic_helper.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
> index e570398abd78..d8f9c6432544 100644
> --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
> @@ -143,6 +143,7 @@
>   */
>  int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
>  {
> +	struct dma_resv_iter cursor;
>  	struct drm_gem_object *obj;
>  	struct dma_fence *fence;
>  
> @@ -150,9 +151,18 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_st
>  		return 0;
>  
>  	obj = drm_gem_fb_get_obj(state->fb, 0);
> -	fence = dma_resv_get_excl_unlocked(obj->resv);
> -	drm_atomic_set_fence_for_plane(state, fence);
> +	rcu_read_lock();
> +	dma_resv_iter_begin(&cursor, obj->resv, false);
> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> +		rcu_read_unlock();
> +		/* TODO: We only use the first write fence here */
> +		drm_atomic_set_fence_for_plane(state, fence);

Yeah I wonder whether we should/need to collate them all together. But I
guesss whomever hits that first with their funny multi-plane yuv or
whatever gets to do that. Or I'm not clear on what exactly your TODO here
means?

> +		return 0;
> +	}
> +	dma_resv_iter_end(&cursor);
> +	rcu_read_unlock();

Imo we should do full dma_resv_lock here. atomic helpers are designed to
allow this, and it simplifies things. Also it really doesn't matter for
atomic, we should be able to do 60fps*a few planes easily :-)
-Daniel

>  
> +	drm_atomic_set_fence_for_plane(state, NULL);
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
