Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C89584E20F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 14:38:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE14810E13F;
	Thu,  8 Feb 2024 13:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FTZK/0po";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0C410E13F
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 13:37:54 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-55fe4534e9bso2206749a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Feb 2024 05:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707399473; x=1708004273; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=p28vv63s2/cv9zUdQKuXCFX/dJkkk/3pPlOtbrZYMXE=;
 b=FTZK/0poGHcqGvizTT9nX30LdYcrjsZsA9KE+hj/W7AF+SXrOuXfref8eV7gnuT8s5
 8M2Ysh5mMQjt6ce3YVP58c/zAFhjAmVax17y+7LCQpRrjtzP1CjYqN5LsZfeXnDpHbC3
 m0dYOJNT+6y/T8Lrh+WfqYDveJBDT42+RevdRcjiMSw4iTa7Nffc22KcV0x45EznpiDY
 PZbaw/rzDLo6YqU9NV0oPOv7nVlMGr8T2ggudWgUC7r+rZ4WeGaumrMLbcQuj0FKupHg
 cKysXbv+IeuKCKSP13FzxGQT7QhSn2HBy5bL5ERqld1S/JIWDmimtFhM4KLF/gLGxNeQ
 V3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707399473; x=1708004273;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p28vv63s2/cv9zUdQKuXCFX/dJkkk/3pPlOtbrZYMXE=;
 b=kZrB/GDV6EV/YTttR4sOMqCJZXSBcHdGiiHrFH4Ja0zLh/korbNzWoncc9nUVokmXi
 ykauiI0s/XfXBMJiElnbGjno/ArnPlwKEIxZV/PBQna7+fYycA+O+zioL+bNTW9UsOZf
 5QothEKLDgWRnH/CEMJRTWVXY1Jt37hQHOPYPqknxjgXnqY276rMCDrfKLO1IS9jCvCi
 +uiM1NynMbB27vw6lQRYiGb4bQ6JfFYCq/CCcyps8w2mgG/MDp5Dw2m53B5DMl++REZT
 szDjhJodsLCB2bjuxOufFaDLlZ1kCHAx7WllURBSDim6HpsTOEgwznmn6YwrAwiZroLg
 dKnQ==
X-Gm-Message-State: AOJu0Yz3HbDoSpLpW1bxVXZLOgiTzn2S+GyT9Hud9BYC9rPHjLddyszF
 ujgU4q1Te3kIM/t4iqJ6Bk6ag6WLpJ6UeWdSCbWtIHQnTuWI91rbW/VLGYgyEnk=
X-Google-Smtp-Source: AGHT+IGp93U2IHf7DpwYHNPt1pK52y49QAMI+oxxjZGbDXXT5TsL+pX9I6v9sXTEdNzAMlaNpb7vXg==
X-Received: by 2002:a05:6402:322:b0:561:123f:a98f with SMTP id
 q2-20020a056402032200b00561123fa98fmr1059559edw.24.1707399473378; 
 Thu, 08 Feb 2024 05:37:53 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXRIw9jXsWnTERowFWcTJ0k/8IDzNxP1SXRPVN3mJF3KKZEqIsZc0PMSakI45/4EZJ0p3Mgc4IhE0Ye3F2hvLSYLGrWdUJyA6cYS+kqh0dp7G4e9IbWst4U9GW9yemCzPUhZW4PpkN8ZZiSMMrzjNcVeOO+mFyO+vlX3PcQcHOT6CcFs6qsAt2iHlFU/G0x9/SqyMQM5QuHpAOLN0cvW03GUFNcuc4qux9c4/zdghGh186h537IYCtYA+Tqr4vLFHnytths282McRT+p4Oyfsu853wSYw4pBSEZNn1Je+kZdw7QjwitwhOkuuugDQMxXLddDQthywjrNS9LkHim7ZauTOpCa8cLs7EE/asP+4Inc3N0B48isV0so6q+nYdUjnDKNtDRlr/ANc18VzrIrZUhH/zDdjsUF0DTKK4G1NrvjEcCRlC6Od1inTZPw//0lHbHTkp8MJu39aatmMXowyyy3pCRKfBDa9xjQVvdKV4B/eRLwVX33eYZprycBpdniM31hbBJgU1onF180ALj47HGFPA/ez/DMepBiVbelzpbcFKzZMT77MEma4SWhdL9EHBHJ85rCpiHRZAWTZZPmxpZJdzkXEmWfo5KXfdz1RZ5FVbD0MzCQBNNFsEgJNw3CBpk0Vvfo86oOXWcIw==
Received: from linaro.org ([62.231.97.49]) by smtp.gmail.com with ESMTPSA id
 ev12-20020a056402540c00b00560f611ce2bsm813058edb.10.2024.02.08.05.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 05:37:52 -0800 (PST)
Date: Thu, 8 Feb 2024 15:37:51 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/msm: mdss: Add X1E80100 support
Message-ID: <ZcTZL+fls7A8O9P0@linaro.org>
References: <20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org>
 <20240129-x1e80100-display-v1-3-0d9eb8254df0@linaro.org>
 <CAA8EJponbo2vvuj2ftCQuxtrZp0w7JQqJ_ADF80Wd2y1V74BzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJponbo2vvuj2ftCQuxtrZp0w7JQqJ_ADF80Wd2y1V74BzA@mail.gmail.com>
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

On 24-01-29 17:11:25, Dmitry Baryshkov wrote:
> On Mon, 29 Jan 2024 at 15:19, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > Add support for MDSS on X1E80100.
> >
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/msm_mdss.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index 455b2e3a0cdd..eddf7fdbb60a 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -564,6 +564,15 @@ static const struct msm_mdss_data sdm670_data = {
> >         .highest_bank_bit = 1,
> >  };
> >
> > +static const struct msm_mdss_data x1e80100_data = {
> > +       .ubwc_enc_version = UBWC_4_0,
> > +       .ubwc_dec_version = UBWC_4_3,
> > +       .ubwc_swizzle = 6,
> > +       .ubwc_static = 1,
> > +       .highest_bank_bit = 2,
> > +       .macrotile_mode = 1,
> 
> Missing .reg_bus_bw, LGTM otherwise

Dmitry, I do not have the exact value yet.

Can I come back with a subsequent (different) patch to add it at a later stage
when I have that information?

I see no point in holding display support any further since it works
fine with the default bandwith.

If yes, I'll respin this series right away, but without the reg_bus_bw.

> 
> > +};
> > +
> >  static const struct msm_mdss_data sdm845_data = {
> >         .ubwc_enc_version = UBWC_2_0,
> >         .ubwc_dec_version = UBWC_2_0,
> > @@ -655,6 +664,7 @@ static const struct of_device_id mdss_dt_match[] = {
> >         { .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
> >         { .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
> >         { .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
> > +       { .compatible = "qcom,x1e80100-mdss", .data = &x1e80100_data},
> >         {}
> >  };
> >  MODULE_DEVICE_TABLE(of, mdss_dt_match);
> >
> > --
> > 2.34.1
> >
> 
> 
> -- 
> With best wishes
> Dmitry
