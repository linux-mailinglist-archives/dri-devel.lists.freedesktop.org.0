Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4214C11EB8E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 21:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F3F6ECFE;
	Fri, 13 Dec 2019 20:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A9F6ECF0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 20:08:52 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id w8so56504wmd.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 12:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=H4QwAX578NY4fhI+sexkPafex0WzGNL1MXJ3Dsnaavg=;
 b=ClR4vATi0lm/uR4AjmPvrLE1sJpqCemORzYcQ1ZyCMyMDz9nHE7MjkPPAbq2CwQUh4
 oCFzPzHDk+crtp1Wxw0tE8XY30FJKStbV5hn/qEcio8bHD8pIbcEYMlxJwKeeleN9dY2
 TdkBmKhNDVwIPzaUbzRIdJqvttbpH6SBk6j+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=H4QwAX578NY4fhI+sexkPafex0WzGNL1MXJ3Dsnaavg=;
 b=k486S8lC1y/ibOnyeJ6YLl46hSQpXcHaiL+LL7hyqzS5gh2ATupSdkvH7xYRinPIAx
 E8Mk+V8f0ybRcXcDht2fFJF5Fg/kBP8lriBLLLp3s0v4erFSofOMlCB3LogcK8FCDJ90
 xxwoqVf/o74KWCy95IKBB+1Sne6S3D4zA3abMrj42syUe1mdOp+GCWS9Fa83K4rNjEC1
 h8NnZIPeQqYeAHNxq+i7XGoSPEEyrct2Mon6rhCfYMSPGvV2dg6BHI8KXbyxsLSlI7yZ
 Px/O4Nx3Ig3lMwQplHhE6q33KmpmkWMwCXxQqE6sF7Tr90+OmLhZ8xH2WClib17FIJ6D
 qQ2A==
X-Gm-Message-State: APjAAAU8DspRQj1B01ExFxab9i0dHpIqBF3ByhyDACjGlqsR2LILXFeD
 TkwsQoBwbK/bihW6pPIAo/Q0YAFUE7w=
X-Google-Smtp-Source: APXvYqzX6tiAiCD80RNWHMwm27uqrP0XdXvT5VcypsRlEX/9sHkfmDkuq4dAFfmPiG9IIWxysxsJ7A==
X-Received: by 2002:a05:600c:388:: with SMTP id
 w8mr15123380wmd.177.1576267730921; 
 Fri, 13 Dec 2019 12:08:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id f1sm11018229wru.6.2019.12.13.12.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 12:08:50 -0800 (PST)
Date: Fri, 13 Dec 2019 21:08:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/msm: Use dma_resv locking wrappers
Message-ID: <20191213200848.GL624164@phenom.ffwll.local>
References: <20191125094356.161941-1-daniel.vetter@ffwll.ch>
 <20191125094356.161941-4-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191125094356.161941-4-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: freedreno@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 25, 2019 at 10:43:55AM +0100, Daniel Vetter wrote:
> I'll add more fancy logic to them soon, so everyone really has to use
> them. Plus they already provide some nice additional debug
> infrastructure on top of direct ww_mutex usage for the fences tracked
> by dma_resv.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org

Ping for some review/acks.

Thanks, Daniel

> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 7d04c47d0023..385d4965a8d0 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -157,7 +157,7 @@ static void submit_unlock_unpin_bo(struct msm_gem_submit *submit,
>  		msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
>  
>  	if (submit->bos[i].flags & BO_LOCKED)
> -		ww_mutex_unlock(&msm_obj->base.resv->lock);
> +		dma_resv_unlock(msm_obj->base.resv);
>  
>  	if (backoff && !(submit->bos[i].flags & BO_VALID))
>  		submit->bos[i].iova = 0;
> @@ -180,8 +180,8 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
>  		contended = i;
>  
>  		if (!(submit->bos[i].flags & BO_LOCKED)) {
> -			ret = ww_mutex_lock_interruptible(&msm_obj->base.resv->lock,
> -					&submit->ticket);
> +			ret = dma_resv_lock_interruptible(msm_obj->base.resv,
> +							  &submit->ticket);
>  			if (ret)
>  				goto fail;
>  			submit->bos[i].flags |= BO_LOCKED;
> @@ -202,8 +202,8 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
>  	if (ret == -EDEADLK) {
>  		struct msm_gem_object *msm_obj = submit->bos[contended].obj;
>  		/* we lost out in a seqno race, lock and retry.. */
> -		ret = ww_mutex_lock_slow_interruptible(&msm_obj->base.resv->lock,
> -				&submit->ticket);
> +		ret = dma_resv_lock_slow_interruptible(msm_obj->base.resv,
> +						       &submit->ticket);
>  		if (!ret) {
>  			submit->bos[contended].flags |= BO_LOCKED;
>  			slow_locked = contended;
> -- 
> 2.24.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
