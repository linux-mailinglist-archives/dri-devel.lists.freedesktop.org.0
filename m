Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8A4433B46
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 17:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7017C6E16F;
	Tue, 19 Oct 2021 15:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED2D6E16F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 15:53:03 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id y10so350039qkp.9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 08:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bob0Tm0hIP2HTFKrFxEk/0E7roQxECXmiqtYRxqYzx8=;
 b=txnXSm72izF/umXW7pS/1I1fY1Jm8SKkXyctJzTcb0Ypz1SY6Y3N01Xf7T0uskdus2
 vpt/QqFXb85JhzmEWKSPJ065DLdAfzrl7FgtYQvlJoqEyXY3magNT76XtyHgpBuvzlmZ
 PC0AI3mcA6dJ1kEm4z54+HSKMuFlgThPRm+/d4EysBslovH9xFtpmze9S93eeatqzuSP
 IYHJKqnCNPUeeAJrgA2KS7Zz4O2hguI1/bRajbOUQ35eAa/movR8N5GvJ331lgPCYdvP
 pl1J0F7oZpgHJHBJ/m5PRo4EucqyccM46A4yuQe6R2k38BaAWWECM0qch28IDCevE4qV
 YyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bob0Tm0hIP2HTFKrFxEk/0E7roQxECXmiqtYRxqYzx8=;
 b=KeVDl5UPUiel+iqETO4C4ZCBoT6FtF7fjm+Jix+ZxlIIKypB/t2GsGxFEzuRM+BEc0
 a5l+x/X4j4iSxsEnEkgrsHWEezyTCGdeAiHu+RsIBZI50PZ8TYIZ+bN45P0UQ6ZDOX3F
 E3I+yo5eFsghlTfxzdwYhx5e02XVwO0z1qOrGYa827GIoigJlFpDN3ZTmeFwOuGIg1Q9
 5tWq0vO6QumF0IZ4sBjsjn3vAV91jefGc3FaTSrYvHYcHtCXkTSBj6x7iXCkwYd3QM+2
 5LWYtd5ymAzWPMMSGfEBme4xAeXJSlc9PKNGIHZTpkYd4mtA/QQLMtEXUXxwFxqHgUaD
 DL3w==
X-Gm-Message-State: AOAM53198zqUw8mq38jvjacR7Vfy6GIvi4Xzs7QvkMqNJG1fJ9dCUIyk
 8LIecZnummpZFOIT2yLFaJ4dwI0IINglNDBV6H63rw==
X-Google-Smtp-Source: ABdhPJwpFNhYWXDb/DzF5v8VV25OUExn8Buf7i5lwqgaX4fpFPV3/6c9goK2M4HSHXCOSKeZxeg7CcSMg0fOiMKxmQ8=
X-Received: by 2002:a05:620a:1a05:: with SMTP id
 bk5mr615795qkb.195.1634658782471; 
 Tue, 19 Oct 2021 08:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211007070900.456044-1-vkoul@kernel.org>
 <20211007070900.456044-5-vkoul@kernel.org>
 <d249d880-1137-d5cc-6d96-83a730f7de29@linaro.org> <YW7koEt85EVMcUDs@matsya>
In-Reply-To: <YW7koEt85EVMcUDs@matsya>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Oct 2021 18:52:51 +0300
Message-ID: <CAA8EJprNTUrh66yqaOCoReWdwLcBc9LfMm=WNDi54o9nzd8RRA@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] drm/msm/disp/dpu1: Add DSC support in RM
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 19 Oct 2021 at 18:30, Vinod Koul <vkoul@kernel.org> wrote:
>
> On 14-10-21, 17:11, Dmitry Baryshkov wrote:
> > On 07/10/2021 10:08, Vinod Koul wrote:
>
> > > +static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> > > +                          struct dpu_global_state *global_state,
> > > +                          struct drm_encoder *enc)
> > > +{
> > > +   struct msm_drm_private *priv;
> > > +
> > > +   priv = enc->dev->dev_private;
> > > +
> > > +   if (!priv)
> > > +           return -EIO;
> > > +
> > > +   /* check if DSC is supported */
> > > +   if (!priv->dsc)
> > > +           return 0;
> > > +
> > > +   /* check if DSC 0 & 1 and allocated or not */
> > > +   if (global_state->dsc_to_enc_id[0] || global_state->dsc_to_enc_id[1]) {
> > > +           DPU_ERROR("DSC 0|1 is already allocated\n");
> > > +           return -EIO;
> > > +   }
> > > +
> > > +   global_state->dsc_to_enc_id[0] = enc->base.id;
> > > +   global_state->dsc_to_enc_id[1] = enc->base.id;
> >
> > Still hardcoding DSC_0 and DSC_1.
>
> Yes!
>
> > Could you please add num_dsc to the topology and allocate the requested
> > amount of DSC blocks? Otherwise this would break for the DSI + DP case.
>
> It wont as we check for dsc and dont proceed, so it cant make an impact
> in non dsc case.
>
> Nevertheless I agree with you, so I am making it based on dsc defined in
> topology. Do we need additional field for num_dsc in topology, num_enc
> should be it, right?

I'd vote for the separate num_dsc.

-- 
With best wishes
Dmitry
