Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FE26E6732
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 16:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525A110E7D2;
	Tue, 18 Apr 2023 14:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA5910E7C9;
 Tue, 18 Apr 2023 14:31:33 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-187df75c907so310652fac.2; 
 Tue, 18 Apr 2023 07:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681828292; x=1684420292;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l5ACrXrGwITOLTD4dccqngzAY+kQ6PuMFiv2tu/9e90=;
 b=HDG3wPhsu14GZOZbzagsY1x1sk+Kdmr/rua4nDTIL8VZWi1SnNdirRCkg6AlOpaFbe
 kNr6Qg5EZOw8DLgOy9r+OeJGmlf2hnoObFtzRb1Dz+NHhR/kNK7A+uGgvePxyWeMx9cN
 E6MwLh1CqXcsJ+3TZD9v46gyQe4ryV6kPOvatzk28DkgTb1+kQ1A7cQtxHxl5KDh4XhS
 kbThLZR6nIDd3JGBm1tlH8lADFcb25tRDludRZ11Hb4iTGmMoU6n6n9VFnlM+kmlQcHw
 1IoSssNRoPqOYk1UyyP0FKA41CjUoyzaDPzSAJfP+To3lDYRuXVXHe+PwUzRJr56D40t
 lNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681828292; x=1684420292;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l5ACrXrGwITOLTD4dccqngzAY+kQ6PuMFiv2tu/9e90=;
 b=WqTdjaIuZG3qI32G70SqlkS43foqup6n616ZHaV2JTVId4IYlSW6+0IRzYHfWzYveW
 8zkjQugySIJVewV9f1z41eKxp4ysReFgm8C/Meb/I1FB1h7rM0CsHMGJ3c2bncfvB78b
 bRUE9gW+XgID5XPZcWnGhjP7EPGVDi4KLXDcLREK7/ppUSunx2xJcXu6Ubt4GhTGt68X
 dpR6U8nvh/+Thm9Q7tEoO0FWuIxeNmGVApn725svpmgL42NwQK8XYDV5h1WmSLwTXYXS
 N4fSnrotK+h3ExyVziZv92I7QnCXamZNrUSb9+KicNYPYcWNZMVSEJvuK73Kh/dmgrQU
 PYOg==
X-Gm-Message-State: AAQBX9dM3F8LcodvV8Dv7vefvtA6Kk0PjlyvkUGD83BeUW9Zv/hn+x3V
 iGAR773ky9EndGe6jVHdLObhO8wYzyne1I4+4B0=
X-Google-Smtp-Source: AKy350aAs+nlCTwr3Bx+LCW+MDhg5c40W8a2nTsaDwXoGoGkBI0MbdGRg43BSQC/ynXheSqyV4A8zoqCX5LyHngHTDo=
X-Received: by 2002:a05:6870:11cf:b0:184:2097:e64f with SMTP id
 15-20020a05687011cf00b001842097e64fmr1140305oav.5.1681828291977; Tue, 18 Apr
 2023 07:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230417201215.448099-1-robdclark@gmail.com>
 <20230417201215.448099-3-robdclark@gmail.com>
 <58977051-197b-f1f0-c795-9037e70d7a91@linux.intel.com>
 <ZD5WLMRNibbRkGQO@phenom.ffwll.local>
In-Reply-To: <ZD5WLMRNibbRkGQO@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 18 Apr 2023 07:31:21 -0700
Message-ID: <CAF6AEGugcuV08G_pxjUGvhTbp8DFFG4ws3=oiP5PpbRf=SJdhQ@mail.gmail.com>
Subject: Re: [RFC 2/3] drm/msm: Rework get_comm_cmdline() helper
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, 
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Chia-I Wu <olvaffe@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Apr 18, 2023 at 1:34=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wro=
te:
>
> On Tue, Apr 18, 2023 at 09:27:49AM +0100, Tvrtko Ursulin wrote:
> >
> > On 17/04/2023 21:12, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Make it work in terms of ctx so that it can be re-used for fdinfo.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >   drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 ++--
> > >   drivers/gpu/drm/msm/msm_drv.c           |  2 ++
> > >   drivers/gpu/drm/msm/msm_gpu.c           | 13 ++++++-------
> > >   drivers/gpu/drm/msm/msm_gpu.h           | 12 ++++++++++--
> > >   drivers/gpu/drm/msm/msm_submitqueue.c   |  1 +
> > >   5 files changed, 21 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/dr=
m/msm/adreno/adreno_gpu.c
> > > index bb38e728864d..43c4e1fea83f 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > @@ -412,7 +412,7 @@ int adreno_set_param(struct msm_gpu *gpu, struct =
msm_file_private *ctx,
> > >             /* Ensure string is null terminated: */
> > >             str[len] =3D '\0';
> > > -           mutex_lock(&gpu->lock);
> > > +           mutex_lock(&ctx->lock);
> > >             if (param =3D=3D MSM_PARAM_COMM) {
> > >                     paramp =3D &ctx->comm;
> > > @@ -423,7 +423,7 @@ int adreno_set_param(struct msm_gpu *gpu, struct =
msm_file_private *ctx,
> > >             kfree(*paramp);
> > >             *paramp =3D str;
> > > -           mutex_unlock(&gpu->lock);
> > > +           mutex_unlock(&ctx->lock);
> > >             return 0;
> > >     }
> > > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_=
drv.c
> > > index 3d73b98d6a9c..ca0e89e46e13 100644
> > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > @@ -581,6 +581,8 @@ static int context_init(struct drm_device *dev, s=
truct drm_file *file)
> > >     rwlock_init(&ctx->queuelock);
> > >     kref_init(&ctx->ref);
> > > +   ctx->pid =3D get_pid(task_pid(current));
> >
> > Would it simplify things for msm if DRM core had an up to date file->pi=
d as
> > proposed in
> > https://patchwork.freedesktop.org/patch/526752/?series=3D109902&rev=3D4=
 ? It
> > gets updated if ioctl issuer is different than fd opener and this being
> > context_init here reminded me of it. Maybe you wouldn't have to track t=
he
> > pid in msm?

The problem is that we also need this for gpu devcore dumps, which
could happen after the drm_file is closed.  The ctx can outlive the
file.

But the ctx->pid has the same problem as the existing file->pid when
it comes to Xorg.. hopefully over time that problem just goes away.  I
guess I could do a similar dance to your patch to update the pid
whenever (for ex) a submitqueue is created.

> Can we go one step further and let the drm fdinfo stuff print these new
> additions? Consistency across drivers and all that.

Hmm, I guess I could _also_ store the overridden comm/cmdline in
drm_file.  I still need to track it in ctx (msm_file_private) because
I could need it after the file is closed.

Maybe it could be useful to have a gl extension to let the app set a
name on the context so that this is useful beyond native-ctx (ie.
maybe it would be nice to see that "chrome: lwn.net" is using less gpu
memory than "chrome: phoronix.com", etc)

BR,
-R

> Also for a generic trigger I think any driver ioctl is good enough (we
> only really need to avoid the auth dance when you're not on a render
> node).
> -Daniel
>
> >
> > Regards,
> >
> > Tvrtko
> >
> > > +   mutex_init(&ctx->lock);
> > >     msm_submitqueue_init(dev, ctx);
> > >     ctx->aspace =3D msm_gpu_create_private_address_space(priv->gpu, c=
urrent);
> > > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_=
gpu.c
> > > index c403912d13ab..f0f4f845c32d 100644
> > > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > > @@ -327,18 +327,17 @@ find_submit(struct msm_ringbuffer *ring, uint32=
_t fence)
> > >   static void retire_submits(struct msm_gpu *gpu);
> > > -static void get_comm_cmdline(struct msm_gem_submit *submit, char **c=
omm, char **cmd)
> > > +static void get_comm_cmdline(struct msm_file_private *ctx, char **co=
mm, char **cmd)
> > >   {
> > > -   struct msm_file_private *ctx =3D submit->queue->ctx;
> > >     struct task_struct *task;
> > > -   WARN_ON(!mutex_is_locked(&submit->gpu->lock));
> > > -
> > >     /* Note that kstrdup will return NULL if argument is NULL: */
> > > +   mutex_lock(&ctx->lock);
> > >     *comm =3D kstrdup(ctx->comm, GFP_KERNEL);
> > >     *cmd  =3D kstrdup(ctx->cmdline, GFP_KERNEL);
> > > +   mutex_unlock(&ctx->lock);
> > > -   task =3D get_pid_task(submit->pid, PIDTYPE_PID);
> > > +   task =3D get_pid_task(ctx->pid, PIDTYPE_PID);
> > >     if (!task)
> > >             return;
> > > @@ -372,7 +371,7 @@ static void recover_worker(struct kthread_work *w=
ork)
> > >             if (submit->aspace)
> > >                     submit->aspace->faults++;
> > > -           get_comm_cmdline(submit, &comm, &cmd);
> > > +           get_comm_cmdline(submit->queue->ctx, &comm, &cmd);
> > >             if (comm && cmd) {
> > >                     DRM_DEV_ERROR(dev->dev, "%s: offending task: %s (=
%s)\n",
> > > @@ -460,7 +459,7 @@ static void fault_worker(struct kthread_work *wor=
k)
> > >             goto resume_smmu;
> > >     if (submit) {
> > > -           get_comm_cmdline(submit, &comm, &cmd);
> > > +           get_comm_cmdline(submit->queue->ctx, &comm, &cmd);
> > >             /*
> > >              * When we get GPU iova faults, we can get 1000s of them,
> > > diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_=
gpu.h
> > > index 7a4fa1b8655b..b2023a42116b 100644
> > > --- a/drivers/gpu/drm/msm/msm_gpu.h
> > > +++ b/drivers/gpu/drm/msm/msm_gpu.h
> > > @@ -377,17 +377,25 @@ struct msm_file_private {
> > >      */
> > >     int sysprof;
> > > +   /** @pid: Process that opened this file. */
> > > +   struct pid *pid;
> > > +
> > > +   /**
> > > +    * lock: Protects comm and cmdline
> > > +    */
> > > +   struct mutex lock;
> > > +
> > >     /**
> > >      * comm: Overridden task comm, see MSM_PARAM_COMM
> > >      *
> > > -    * Accessed under msm_gpu::lock
> > > +    * Accessed under msm_file_private::lock
> > >      */
> > >     char *comm;
> > >     /**
> > >      * cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE
> > >      *
> > > -    * Accessed under msm_gpu::lock
> > > +    * Accessed under msm_file_private::lock
> > >      */
> > >     char *cmdline;
> > > diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/=
msm/msm_submitqueue.c
> > > index 0e803125a325..0444ba04fa06 100644
> > > --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> > > +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> > > @@ -61,6 +61,7 @@ void __msm_file_private_destroy(struct kref *kref)
> > >     }
> > >     msm_gem_address_space_put(ctx->aspace);
> > > +   put_pid(ctx->pid);
> > >     kfree(ctx->comm);
> > >     kfree(ctx->cmdline);
> > >     kfree(ctx);
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
