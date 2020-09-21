Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23249271ED9
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 11:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E5289DDD;
	Mon, 21 Sep 2020 09:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C951F89DDD
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 09:23:26 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k18so11811973wmj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 02:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=r0BavX5ktoh6Vs4OL+2bxumJ//sw0ZwBr7uYUERuihg=;
 b=PElfAlC3OPhRi6eU5C4qVFy/5AHz02Yj8sQCW8E7TG7rB5IAXqj7bquWEjjrQeRc/y
 H5SO4bCIcUyRI3HBGnU7NyhftLwR5fCm5fjL2N+xLR1bQrTtcItvpGP++YR0jtWPhwy8
 3P/lcTsR5lE5DITforu8F2U8TZxikxGsPLmnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=r0BavX5ktoh6Vs4OL+2bxumJ//sw0ZwBr7uYUERuihg=;
 b=GOM3+4qhir+7U1u/DVuqVz1FqEmQ24BSR65D2pBb/Za/e+9KaiLolVj77ydOk3Jw4Z
 heHPVIq+OgW0wBHghVo0C2yXcjJDdajXlfJoBRJM6PaJfiphOcs3mW75N0CPiflzBRNZ
 dTa25n5IbFG5s7yJhCzjymT6NDMe5rw9PRa4SE6O1vaye0TLxr6yGJ5asH+5ZYF/JssR
 4/CPSVr3z5h8Iccc8BAR3oRa0Wj8D1McO3EpGTWvCLHlHUA+DDcpB/qbwC7hX2G7v/Hi
 +oso2Uss7QpZAtY0X2G8ynLvCexS+aPL+ZObge2jYsaf9pZp50UCFBVjCwEuoHYXT+lM
 3R3w==
X-Gm-Message-State: AOAM5317z8wLxqUUEdW+yCWGs2sALbPJQ/iv1seSQ4zUJWxAZQazkRVM
 W3vCaChZ91D9rZTxly0QEA/gIw==
X-Google-Smtp-Source: ABdhPJxqIw2NCD3wLW18OIZqRasZfmP7ChcqvG9Kwi0FajnlKRQwrQvrAhzYxkkFLqlP84lS869EIA==
X-Received: by 2002:a05:600c:4142:: with SMTP id
 h2mr28727565wmm.128.1600680205457; 
 Mon, 21 Sep 2020 02:23:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r14sm19253720wrn.56.2020.09.21.02.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 02:23:24 -0700 (PDT)
Date: Mon, 21 Sep 2020 11:23:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 2/3] drm/atomic: Use kthread worker for nonblocking commits
Message-ID: <20200921092322.GK438822@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>,
 timmurray@google.com, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>
References: <20200919193727.2093945-1-robdclark@gmail.com>
 <20200919193727.2093945-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200919193727.2093945-3-robdclark@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 timmurray@google.com, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Sep 19, 2020 at 12:37:25PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This will allow us to more easily switch scheduling rules based on what
> userspace wants.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

I still think switching to the highpriority systemwq as a start (like i915
already does) would be a good first step no matter what we end up doing
for the android thing.
-Daniel

> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 13 ++++++++----
>  include/drm/drm_atomic.h            | 31 +++++++++++++++++++++++++++++
>  2 files changed, 40 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 9e1ad493e689..75eeec5e7b10 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1659,11 +1659,11 @@ static void commit_tail(struct drm_atomic_state *old_state)
>  	drm_atomic_state_put(old_state);
>  }
>  
> -static void commit_work(struct work_struct *work)
> +static void commit_work(struct kthread_work *work)
>  {
>  	struct drm_atomic_state *state = container_of(work,
>  						      struct drm_atomic_state,
> -						      commit_work);
> +						      commit_kwork);
>  	commit_tail(state);
>  }
>  
> @@ -1797,6 +1797,7 @@ int drm_atomic_helper_commit(struct drm_device *dev,
>  			     struct drm_atomic_state *state,
>  			     bool nonblock)
>  {
> +	struct kthread_worker *worker = NULL;
>  	int ret;
>  
>  	if (state->async_update) {
> @@ -1814,7 +1815,7 @@ int drm_atomic_helper_commit(struct drm_device *dev,
>  	if (ret)
>  		return ret;
>  
> -	INIT_WORK(&state->commit_work, commit_work);
> +	kthread_init_work(&state->commit_kwork, commit_work);
>  
>  	ret = drm_atomic_helper_prepare_planes(dev, state);
>  	if (ret)
> @@ -1857,8 +1858,12 @@ int drm_atomic_helper_commit(struct drm_device *dev,
>  	 */
>  
>  	drm_atomic_state_get(state);
> +
>  	if (nonblock)
> -		queue_work(system_unbound_wq, &state->commit_work);
> +		worker = drm_atomic_pick_worker(state);
> +
> +	if (worker)
> +		kthread_queue_work(worker, &state->commit_kwork);
>  	else
>  		commit_tail(state);
>  
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index d07c851d255b..8d0ee19953df 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -373,8 +373,18 @@ struct drm_atomic_state {
>  	 *
>  	 * Work item which can be used by the driver or helpers to execute the
>  	 * commit without blocking.
> +	 *
> +	 * This is deprecated, use commit_kwork.
>  	 */
>  	struct work_struct commit_work;
> +
> +	/**
> +	 * @commit_kwork:
> +	 *
> +	 * Work item which can be used by the driver or helpers to execute the
> +	 * commit without blocking.
> +	 */
> +	struct kthread_work commit_kwork;
>  };
>  
>  void __drm_crtc_commit_free(struct kref *kref);
> @@ -954,6 +964,27 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
>  		      (new_obj_state) = (__state)->private_objs[__i].new_state, 1); \
>  	     (__i)++)
>  
> +/**
> + * drm_atomic_pick_worker - helper to get kworker to use for nonblocking commit
> + * @state: the &drm_atomic_state for the commit
> + *
> + * Pick an appropriate worker for a given atomic update.  The first CRTC
> + * invovled in the atomic update is used to pick the worker, to prevent
> + * serializing multiple pageflips / atomic-updates on indenpendent CRTCs.
> + */
> +static inline struct kthread_worker *
> +drm_atomic_pick_worker(const struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_crtc *crtc;
> +	unsigned i;
> +
> +	for_each_new_crtc_in_state(state, crtc, crtc_state, i)
> +		return crtc->worker;
> +
> +	return NULL;
> +}
> +
>  /**
>   * drm_atomic_crtc_needs_modeset - compute combined modeset need
>   * @state: &drm_crtc_state for the CRTC
> -- 
> 2.26.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
