Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B45874025EA
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 11:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DEC89A8B;
	Tue,  7 Sep 2021 09:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E942189949
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 09:05:58 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso1224222wmb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 02:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=9vYdDd8X0lBhnoXWTjXmd+qDgl8UgZ4vjdFNESohV+c=;
 b=AavmxG3vZRSVGG0YeqrAZg5OvtfcNg/ok+H2xaRJi9jnsS/cn+pyA+hK4oF86K9kJH
 GCbxKEaLf5/+KZ/Gkgm17IPEQHiJOQaJNG7Lz9F/NJDvYoBaxjsSUJS0TUOZP4LAJ1nV
 6r5RQq/wkLCqorark6Iat/lVRhfKTSp26i6xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9vYdDd8X0lBhnoXWTjXmd+qDgl8UgZ4vjdFNESohV+c=;
 b=IqYqoESwIoygj/tFl0or92ZqeYXzZt/8WTId5Ub26wswNmDbj8SkmB4gFGygf4Kl4V
 1/7xYkQmBqACVK4Sl1jFzTXv/McZ5/B+HCVDqqIoDS1HB5xKz2OiQnf/bABkHFvTdLrb
 gmF2kapeUZxCfd9ZKDEZvFU0JLFdBMPd3w1StEvSU311fuuRCn9g3re7D40ITax0KPOd
 x/3pt82624z9X3eScz3B2wUiJkxbvl7ykyS6ws9ukFXJ1h80FwwXO+/0yqdUxrUeABGs
 E4fcqKyFNvkuvE4K3NRPgF1nMvJurLYcMpOYR2a7U/h5yEPwzAR135xIP6n+QhiSzZpg
 7s6w==
X-Gm-Message-State: AOAM532DrSLmx8Y02v3obcR2U9bhaHyrIBlBfiuUxdNrAro0BMErk91x
 bmzwpKwKpuaH+U9IEyAgTs/2/j5Zz1Yktg==
X-Google-Smtp-Source: ABdhPJwo4tVF4Qk9OhdkzaEuokKaigsbodEipflSfp5oYEAy6XPRhP3ONe4FQjuXF1WU7PoAq7OGbQ==
X-Received: by 2002:a1c:f414:: with SMTP id z20mr2898015wma.94.1631005557501; 
 Tue, 07 Sep 2021 02:05:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m6sm5691102wrw.0.2021.09.07.02.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 02:05:57 -0700 (PDT)
Date: Tue, 7 Sep 2021 11:05:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: xinhui pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [resend PATCH] drm/ttm: Fix a deadlock if the target BO is not
 idle during swap
Message-ID: <YTcrcw+hxWuyyl4C@phenom.ffwll.local>
References: <20210907040832.1107747-1-xinhui.pan@amd.com>
 <074efe24-db7a-df68-3624-05989596f44a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <074efe24-db7a-df68-3624-05989596f44a@amd.com>
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

On Tue, Sep 07, 2021 at 08:22:20AM +0200, Christian König wrote:
> Added a Fixes tag and pushed this to drm-misc-fixes.

We're in the merge window, this should have been drm-misc-next-fixes. I'll
poke misc maintainers so it's not lost.
-Daniel

> 
> It will take a while until it cycles back into the development branches, so
> feel free to push some version to amd-staging-drm-next as well. Just ping
> Alex when you do this.
> 
> Thanks,
> Christian.
> 
> Am 07.09.21 um 06:08 schrieb xinhui pan:
> > The ret value might be -EBUSY, caller will think lru lock is still
> > locked but actually NOT. So return -ENOSPC instead. Otherwise we hit
> > list corruption.
> > 
> > ttm_bo_cleanup_refs might fail too if BO is not idle. If we return 0,
> > caller(ttm_tt_populate -> ttm_global_swapout ->ttm_device_swapout) will
> > be stuck as we actually did not free any BO memory. This usually happens
> > when the fence is not signaled for a long time.
> > 
> > Signed-off-by: xinhui pan <xinhui.pan@amd.com>
> > Reviewed-by: Christian König <christian.koenig@amd.com>
> > ---
> >   drivers/gpu/drm/ttm/ttm_bo.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> > index 8d7fd65ccced..23f906941ac9 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -1152,9 +1152,9 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
> >   	}
> >   	if (bo->deleted) {
> > -		ttm_bo_cleanup_refs(bo, false, false, locked);
> > +		ret = ttm_bo_cleanup_refs(bo, false, false, locked);
> >   		ttm_bo_put(bo);
> > -		return 0;
> > +		return ret == -EBUSY ? -ENOSPC : ret;
> >   	}
> >   	ttm_bo_del_from_lru(bo);
> > @@ -1208,7 +1208,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
> >   	if (locked)
> >   		dma_resv_unlock(bo->base.resv);
> >   	ttm_bo_put(bo);
> > -	return ret;
> > +	return ret == -EBUSY ? -ENOSPC : ret;
> >   }
> >   void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
