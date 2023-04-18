Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D49B6E5C20
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 10:35:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB35A10E6F1;
	Tue, 18 Apr 2023 08:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82FB510E6F1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 08:34:56 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f16f792384so5118295e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 01:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681806894; x=1684398894;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fK3y0BUQpGH7irvo8NU0fynJnPut9qQ7xlfoCq4CYng=;
 b=gu1Jw5Z+VkRdweBK6KngJhdDB6l0cbDx53nX/TFfWMHLBAxDzS4iiwlhVoYR2WfLG8
 BO8ZxxDSiYGuOUbSxOY9eBe0m1WZw7Ady93EXQop79Ezst8xg2i36ulaVH6lVGELc/A6
 tbWqGXG4mPfSxgfd/BXLIBwym6jER/1MprzWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681806894; x=1684398894;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fK3y0BUQpGH7irvo8NU0fynJnPut9qQ7xlfoCq4CYng=;
 b=lWW0nY+TAN/pY7cxyYT3U4JTm7YGmufDCnRfgds+8pJQpZuLFetIlqZMtC2Ce3jw3H
 EJ+2pvna9256JXBLQdC8f5WtWFH/EcB7IyxBxyU7bzahje3USx3UOifzu+j5WsRhayTr
 Sr/gFcuJVDQ/JeQmJdFtpqS/lA/62HgMSWGJ4YEToK1HBt+IG8Cw4+h0cH0B8Q72rDbD
 8MS4aeQyCeN0yBzlluvcx22+zCJ6VOHxGJ9yY7VqDgG8GaBUUI5fQzTg14m4EBibEcTM
 4CU1SHGTd+UKgMWkQFTeVgwELdvqHkFhherKuAOj+DVkJFX9sO3ePhogy+RuQDHoRAac
 xcwg==
X-Gm-Message-State: AAQBX9fmDFru6Ekd3Fr0OcGXFPm8fEUw/arkNqEDG9y9/1CCAUiD4ML2
 A07DJy3wAlpYHlUGw3mwOPge1Z2TfWmJsSOGuR0=
X-Google-Smtp-Source: AKy350Zb/Pmk6fjTuOI1X1TU5gGYDQL8J50cM0uidBzPbaCHSu3IUJ7zuzjH7UgjDGJDOY0mLfD57w==
X-Received: by 2002:a05:600c:6025:b0:3f1:75a5:a369 with SMTP id
 az37-20020a05600c602500b003f175a5a369mr3356980wmb.3.1681806894329; 
 Tue, 18 Apr 2023 01:34:54 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 s16-20020a05600c319000b003f17122587bsm7222453wmp.36.2023.04.18.01.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 01:34:53 -0700 (PDT)
Date: Tue, 18 Apr 2023 10:34:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [RFC 2/3] drm/msm: Rework get_comm_cmdline() helper
Message-ID: <ZD5WLMRNibbRkGQO@phenom.ffwll.local>
Mail-Followup-To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Chia-I Wu <olvaffe@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20230417201215.448099-1-robdclark@gmail.com>
 <20230417201215.448099-3-robdclark@gmail.com>
 <58977051-197b-f1f0-c795-9037e70d7a91@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58977051-197b-f1f0-c795-9037e70d7a91@linux.intel.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 18, 2023 at 09:27:49AM +0100, Tvrtko Ursulin wrote:
> 
> On 17/04/2023 21:12, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> > 
> > Make it work in terms of ctx so that it can be re-used for fdinfo.
> > 
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 ++--
> >   drivers/gpu/drm/msm/msm_drv.c           |  2 ++
> >   drivers/gpu/drm/msm/msm_gpu.c           | 13 ++++++-------
> >   drivers/gpu/drm/msm/msm_gpu.h           | 12 ++++++++++--
> >   drivers/gpu/drm/msm/msm_submitqueue.c   |  1 +
> >   5 files changed, 21 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > index bb38e728864d..43c4e1fea83f 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -412,7 +412,7 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
> >   		/* Ensure string is null terminated: */
> >   		str[len] = '\0';
> > -		mutex_lock(&gpu->lock);
> > +		mutex_lock(&ctx->lock);
> >   		if (param == MSM_PARAM_COMM) {
> >   			paramp = &ctx->comm;
> > @@ -423,7 +423,7 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
> >   		kfree(*paramp);
> >   		*paramp = str;
> > -		mutex_unlock(&gpu->lock);
> > +		mutex_unlock(&ctx->lock);
> >   		return 0;
> >   	}
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index 3d73b98d6a9c..ca0e89e46e13 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -581,6 +581,8 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
> >   	rwlock_init(&ctx->queuelock);
> >   	kref_init(&ctx->ref);
> > +	ctx->pid = get_pid(task_pid(current));
> 
> Would it simplify things for msm if DRM core had an up to date file->pid as
> proposed in
> https://patchwork.freedesktop.org/patch/526752/?series=109902&rev=4 ? It
> gets updated if ioctl issuer is different than fd opener and this being
> context_init here reminded me of it. Maybe you wouldn't have to track the
> pid in msm?

Can we go one step further and let the drm fdinfo stuff print these new
additions? Consistency across drivers and all that.

Also for a generic trigger I think any driver ioctl is good enough (we
only really need to avoid the auth dance when you're not on a render
node).
-Daniel

> 
> Regards,
> 
> Tvrtko
> 
> > +	mutex_init(&ctx->lock);
> >   	msm_submitqueue_init(dev, ctx);
> >   	ctx->aspace = msm_gpu_create_private_address_space(priv->gpu, current);
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> > index c403912d13ab..f0f4f845c32d 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -327,18 +327,17 @@ find_submit(struct msm_ringbuffer *ring, uint32_t fence)
> >   static void retire_submits(struct msm_gpu *gpu);
> > -static void get_comm_cmdline(struct msm_gem_submit *submit, char **comm, char **cmd)
> > +static void get_comm_cmdline(struct msm_file_private *ctx, char **comm, char **cmd)
> >   {
> > -	struct msm_file_private *ctx = submit->queue->ctx;
> >   	struct task_struct *task;
> > -	WARN_ON(!mutex_is_locked(&submit->gpu->lock));
> > -
> >   	/* Note that kstrdup will return NULL if argument is NULL: */
> > +	mutex_lock(&ctx->lock);
> >   	*comm = kstrdup(ctx->comm, GFP_KERNEL);
> >   	*cmd  = kstrdup(ctx->cmdline, GFP_KERNEL);
> > +	mutex_unlock(&ctx->lock);
> > -	task = get_pid_task(submit->pid, PIDTYPE_PID);
> > +	task = get_pid_task(ctx->pid, PIDTYPE_PID);
> >   	if (!task)
> >   		return;
> > @@ -372,7 +371,7 @@ static void recover_worker(struct kthread_work *work)
> >   		if (submit->aspace)
> >   			submit->aspace->faults++;
> > -		get_comm_cmdline(submit, &comm, &cmd);
> > +		get_comm_cmdline(submit->queue->ctx, &comm, &cmd);
> >   		if (comm && cmd) {
> >   			DRM_DEV_ERROR(dev->dev, "%s: offending task: %s (%s)\n",
> > @@ -460,7 +459,7 @@ static void fault_worker(struct kthread_work *work)
> >   		goto resume_smmu;
> >   	if (submit) {
> > -		get_comm_cmdline(submit, &comm, &cmd);
> > +		get_comm_cmdline(submit->queue->ctx, &comm, &cmd);
> >   		/*
> >   		 * When we get GPU iova faults, we can get 1000s of them,
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> > index 7a4fa1b8655b..b2023a42116b 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.h
> > +++ b/drivers/gpu/drm/msm/msm_gpu.h
> > @@ -377,17 +377,25 @@ struct msm_file_private {
> >   	 */
> >   	int sysprof;
> > +	/** @pid: Process that opened this file. */
> > +	struct pid *pid;
> > +
> > +	/**
> > +	 * lock: Protects comm and cmdline
> > +	 */
> > +	struct mutex lock;
> > +
> >   	/**
> >   	 * comm: Overridden task comm, see MSM_PARAM_COMM
> >   	 *
> > -	 * Accessed under msm_gpu::lock
> > +	 * Accessed under msm_file_private::lock
> >   	 */
> >   	char *comm;
> >   	/**
> >   	 * cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE
> >   	 *
> > -	 * Accessed under msm_gpu::lock
> > +	 * Accessed under msm_file_private::lock
> >   	 */
> >   	char *cmdline;
> > diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
> > index 0e803125a325..0444ba04fa06 100644
> > --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> > +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> > @@ -61,6 +61,7 @@ void __msm_file_private_destroy(struct kref *kref)
> >   	}
> >   	msm_gem_address_space_put(ctx->aspace);
> > +	put_pid(ctx->pid);
> >   	kfree(ctx->comm);
> >   	kfree(ctx->cmdline);
> >   	kfree(ctx);

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
