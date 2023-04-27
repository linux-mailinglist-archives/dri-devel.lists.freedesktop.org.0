Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5439E6F0383
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 11:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4107A10EB17;
	Thu, 27 Apr 2023 09:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827B810EB14
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 09:39:58 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-94f9cd65b1aso235485166b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 02:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1682588394; x=1685180394;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ijOvNVXHQPQ7K3a8mfotlj3EqkLbm2iNVAzawaQHZIw=;
 b=kFa3Dgvsdqo+BXHl6yahcNl1383pNFvNtKjCwWMfHTj+Bit3JIwCGJEQDI6N/QU00j
 7X00IV28cyVTxMhXOHSSaNOtJlIO/f240AjyaV+PfAb4s7UETaAAtwNr4ZxvB9KF2UtB
 pZGfcxrFXB1KoRo0EnWbU8+HE3g7nM63d1OjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682588394; x=1685180394;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ijOvNVXHQPQ7K3a8mfotlj3EqkLbm2iNVAzawaQHZIw=;
 b=NtsqI2pOPC3xlngeq3a6yrLyeWZ5KhiU67YCeCD3JTPE5kBCn7MFkJU2JyWaXwUs5q
 +sWwfkeCvxRIXxKKhhwoV7BcqaLLH24fK29/sRa3c3Cch2LC8fsx+1BHRC5HCagrezb6
 /eWWpPD7FoAv7Eulc/kxRk9qwc7fkjUntaZMK0EsiQB6ZeLV9EkIITwradUzKJAFlyQL
 ys4GwWgONLmnna1vasZTmw8gW6pLwntgJJO24D5518OEdN0lTKkrB7ZOI9ZXL3XEGLu0
 zp2RBvBvz2OBOBkIVyo4/DhmZRGfbQhJqu5XomWIypdlDpXJKKol3TCES/njh1PM/SUl
 gyZA==
X-Gm-Message-State: AC+VfDy7Hg1aoxLbofbhzAy/tCacP+60yjdmscvcZgKvujvBMBNNtCYU
 BDGq+nuF1IE8H7vA2UchVvp3Ig==
X-Google-Smtp-Source: ACHHUZ7VSLJU2Bi7Vlppn+yZkQubTXq/4j3BnKk8IoW139u/a/w2x464xtiUeWCmvDcGrbJw+QXvuw==
X-Received: by 2002:a17:906:7491:b0:95f:db5f:73b7 with SMTP id
 e17-20020a170906749100b0095fdb5f73b7mr888891ejl.0.1682588393848; 
 Thu, 27 Apr 2023 02:39:53 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 jt11-20020a170906ca0b00b00958434d4ecesm6820771ejb.13.2023.04.27.02.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 02:39:53 -0700 (PDT)
Date: Thu, 27 Apr 2023 11:39:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [RFC 2/3] drm/msm: Rework get_comm_cmdline() helper
Message-ID: <ZEpC5xEZ4cueb881@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
References: <20230417201215.448099-1-robdclark@gmail.com>
 <20230417201215.448099-3-robdclark@gmail.com>
 <58977051-197b-f1f0-c795-9037e70d7a91@linux.intel.com>
 <ZD5WLMRNibbRkGQO@phenom.ffwll.local>
 <CAF6AEGugcuV08G_pxjUGvhTbp8DFFG4ws3=oiP5PpbRf=SJdhQ@mail.gmail.com>
 <CACvgo52gByHzwtm4gxqUxZ5yJGTQ5NucBmMHSO7nLPsba3rTfw@mail.gmail.com>
 <CAF6AEGtijkCt2uUx98auFcK0GQHY=5GV7CxbOejGz22no6J0GQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGtijkCt2uUx98auFcK0GQHY=5GV7CxbOejGz22no6J0GQ@mail.gmail.com>
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 07:47:26AM -0700, Rob Clark wrote:
> On Fri, Apr 21, 2023 at 2:33 AM Emil Velikov <emil.l.velikov@gmail.com> wrote:
> >
> > Greeting all,
> >
> > Sorry for the delay - Easter Holidays, food coma and all that :-)
> >
> > On Tue, 18 Apr 2023 at 15:31, Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Tue, Apr 18, 2023 at 1:34 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Tue, Apr 18, 2023 at 09:27:49AM +0100, Tvrtko Ursulin wrote:
> > > > >
> > > > > On 17/04/2023 21:12, Rob Clark wrote:
> > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > >
> > > > > > Make it work in terms of ctx so that it can be re-used for fdinfo.
> > > > > >
> > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > ---
> > > > > >   drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 ++--
> > > > > >   drivers/gpu/drm/msm/msm_drv.c           |  2 ++
> > > > > >   drivers/gpu/drm/msm/msm_gpu.c           | 13 ++++++-------
> > > > > >   drivers/gpu/drm/msm/msm_gpu.h           | 12 ++++++++++--
> > > > > >   drivers/gpu/drm/msm/msm_submitqueue.c   |  1 +
> > > > > >   5 files changed, 21 insertions(+), 11 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > > > > index bb38e728864d..43c4e1fea83f 100644
> > > > > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > > > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > > > > @@ -412,7 +412,7 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
> > > > > >             /* Ensure string is null terminated: */
> > > > > >             str[len] = '\0';
> > > > > > -           mutex_lock(&gpu->lock);
> > > > > > +           mutex_lock(&ctx->lock);
> > > > > >             if (param == MSM_PARAM_COMM) {
> > > > > >                     paramp = &ctx->comm;
> > > > > > @@ -423,7 +423,7 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
> > > > > >             kfree(*paramp);
> > > > > >             *paramp = str;
> > > > > > -           mutex_unlock(&gpu->lock);
> > > > > > +           mutex_unlock(&ctx->lock);
> > > > > >             return 0;
> > > > > >     }
> > > > > > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > > > > > index 3d73b98d6a9c..ca0e89e46e13 100644
> > > > > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > > > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > > > > @@ -581,6 +581,8 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
> > > > > >     rwlock_init(&ctx->queuelock);
> > > > > >     kref_init(&ctx->ref);
> > > > > > +   ctx->pid = get_pid(task_pid(current));
> > > > >
> > > > > Would it simplify things for msm if DRM core had an up to date file->pid as
> > > > > proposed in
> > > > > https://patchwork.freedesktop.org/patch/526752/?series=109902&rev=4 ? It
> > > > > gets updated if ioctl issuer is different than fd opener and this being
> > > > > context_init here reminded me of it. Maybe you wouldn't have to track the
> > > > > pid in msm?
> > >
> > > The problem is that we also need this for gpu devcore dumps, which
> > > could happen after the drm_file is closed.  The ctx can outlive the
> > > file.
> > >
> > I think we all kept forgetting about that. MSM had support for ages,
> > while AMDGPU is the second driver to land support - just a release
> > ago.
> >
> > > But the ctx->pid has the same problem as the existing file->pid when
> > > it comes to Xorg.. hopefully over time that problem just goes away.
> >
> > Out of curiosity: what do you mean with "when it comes to Xorg" - the
> > "was_master" handling or something else?
> 
> The problem is that Xorg is the one to open the drm fd, and then
> passes the fd to the client.. so the pid of drm_file is the Xorg pid,
> not the client.  Making it not terribly informative.
> 
> Tvrtko's patch he linked above would address that for drm_file, but
> not for other driver internal usages.  Maybe it could be wired up as a
> helper so that drivers don't have to re-invent that dance.  Idk, I
> have to think about it.
> 
> Btw, with my WIP drm sched fence signalling patch lockdep is unhappy
> when gpu devcore dumps are triggered.  I'm still pondering how to
> decouple the locking so that anything coming from fs (ie.
> show_fdinfo()) is decoupled from anything that happens in the fence
> signaling path.  But will repost this series once I get that sorted
> out.

So the cleanest imo is that you push most of the capturing into a worker
that's entirely decoupled. If you have terminal context (i.e. on first
hang they stop all further cmd submission, which is anyway what
vk/arb_robustness want), then you don't have to capture at tdr time,
because there's no subsequent batch that will wreck the state.

But it only works if your gpu ctx don't have recoverable semantics.

If you can't do that it's a _lot_ of GFP_ATOMIC and trylock and bailing
out if any fails :-/
-Daniel

> 
> BR,
> -R
> 
> >
> > > guess I could do a similar dance to your patch to update the pid
> > > whenever (for ex) a submitqueue is created.
> > >
> > > > Can we go one step further and let the drm fdinfo stuff print these new
> > > > additions? Consistency across drivers and all that.
> > >
> > > Hmm, I guess I could _also_ store the overridden comm/cmdline in
> > > drm_file.  I still need to track it in ctx (msm_file_private) because
> > > I could need it after the file is closed.
> > >
> > > Maybe it could be useful to have a gl extension to let the app set a
> > > name on the context so that this is useful beyond native-ctx (ie.
> > > maybe it would be nice to see that "chrome: lwn.net" is using less gpu
> > > memory than "chrome: phoronix.com", etc)
> > >
> >
> > /me awaits for the series to hit the respective websites ;-)
> >
> > But seriously - the series from Tvrtko (thanks for the link, will
> > check in a moment) makes sense. Although given the livespan issue
> > mentioned above, I don't think it's applicable here.
> >
> > So if it were me, I would consider the two orthogonal for the
> > short/mid term. Fwiw this and patch 1/3 are:
> > Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> >
> > HTH
> > -Emil

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
