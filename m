Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C729F8A28
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 03:41:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FBA10EE3E;
	Fri, 20 Dec 2024 02:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="P/vOlVGz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A41410EE3B
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 02:40:57 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-3011c7b39c7so17466971fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 18:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734662455; x=1735267255; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jj0/+JoMZ17NUsO/ZKTRoawucSi6dpMQmNWszONhX+A=;
 b=P/vOlVGzV63+n7vcUfWe/dr0K4JRUL7+BDq46kkVDnBaVbNkxWZbH9mySSIm6w8Juc
 ahqn21sT/MUGRynqQBBQOB34jcXoq/P0GttGPPL2QLfW9QvC5LCwOle+DoL9Gn7uRWrP
 U3Pa/V82HdK8IaXvTb9prWkdN33vFrGN3s+5wrhpuPXjZMDkUZ7WD3Q52lugIKWoNCCQ
 vODUAbAntjby4no0lIA5IgZlhnnRqw7uu7U5ioglFGbISKefkDEB8B30z2vtrtWhE5+T
 MXSzTcZ9fmsENr1MIl9zGL4vkXqxtlTJr0hZ+go8oNdQ9W/hyxQirVGEd41MZw3/QP36
 7Z5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734662455; x=1735267255;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jj0/+JoMZ17NUsO/ZKTRoawucSi6dpMQmNWszONhX+A=;
 b=YO1Z1qvHPHacBy4jIP7BXgHqYYhfLf0/HMfdW8WII2C2BWx6DnEIV11tpGh29ehqal
 RkDBIovW1t8HXbMgozaUSKNxo2BZdZVfhuKO/7r6Xizdfx8GLHD3OSCMeDkPezqhx9YU
 kbdQH2gbB/M40ttN60LCRPxpmpLQZTmdnnWtc4K4dUlSj24NNB2nt65ne0TAg1X6P4CL
 pu2EbNe735SBpEtagx7SIbxwUUECfbt+/sQA+bxIecRtiEkOb8x5Gy6zEcdMLBbwAhOG
 SFApl85pi7/M0F4u5LhDUQrDCrEAhAyWVO9wjxpOj2If0awYe0EFLTKTzY/SXoYGgDFc
 r3wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXjiKnRsp+yikSFYzvZaGGUn3aIPBMe66+PhyjBla08UxyhH/hj8fBBZdbbFMiaEug3379eIt0wAU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwF8mp1t4SKwu0RuJMgxqp5kHwM+Mhlp8G2/0JOqgkfA9t6H8D
 dPMewRQrPfVpuLLHmoovXOfKkfJw21xYfFQVQOeseU9gkh9KHRw/EaysgOrOWFg=
X-Gm-Gg: ASbGncvjneWTqdgFG5XD2UHQS+dzbB9/2NPbnu2L3PXt59HY2CY+VBvfhi59i5xRS4X
 Cwm1kTdxqea3yJJUb7Gy+1bFf/VFGQh7IIGBbwOxakPPdEeP9sN4q8FujogeW+GCbJoh8gXZ2ve
 CB133Tal4u6IhL5V8KS6Ma1x9OTecs4cqxOy2lNxz+dly3eil2WnMhbkun79jtCToLQBX+twr6e
 JDTaMWUpmNsvjHagSAxZL89+5fEfWW6fOLsB2F6cWnA23s4CFWUNpmDvtgqzVgSISq/PyhzTUjx
 Q53cQ3wczTeY2AoO5yLhB50UEPYyaUHuXLUP
X-Google-Smtp-Source: AGHT+IEUtxddJ0Qtp8K+sqBvLg335FfoFSz3yowbgMd4Sr4LEg51Aq8dj7zo+GJF7reCRmcWomU+lg==
X-Received: by 2002:a2e:b8c5:0:b0:300:31db:a782 with SMTP id
 38308e7fff4ca-30468517676mr3478791fa.6.1734662455551; 
 Thu, 19 Dec 2024 18:40:55 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045adac5bbsm4064911fa.53.2024.12.19.18.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 18:40:54 -0800 (PST)
Date: Fri, 20 Dec 2024 04:40:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 08/25] drm/msm/dpu: fill CRTC resources in dpu_crtc.c
Message-ID: <pqy2qa2ikvadchox3jtrfuimmzeauuxkuyalpelzzfjzsddk3i@htband4aqjxr>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-8-fe220297a7f0@quicinc.com>
 <097a3d10-0992-46a4-8f89-aa54538c9776@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <097a3d10-0992-46a4-8f89-aa54538c9776@quicinc.com>
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

On Mon, Dec 16, 2024 at 05:39:15PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/16/2024 4:43 PM, Jessica Zhang wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Stop poking into CRTC state from dpu_encoder.c, fill CRTC HW resources
> > from dpu_crtc_assign_resources().
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > [quic_abhinavk@quicinc.com: cleaned up formatting]
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 29 +++++++++++++++++++++++++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 ++--
> >   2 files changed, 31 insertions(+), 2 deletions(-)
> > 
> 
> <snip>
> 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 2b999a0558b2a016644ed5d25bf54ab45c38d1d9..a895d48fe81ccc71d265e089992786e8b6268b1b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -1138,7 +1138,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >   	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
> >   	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> >   	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> > -	int num_ctl, num_pp, num_dsc;
> > +	int num_pp, num_dsc, num_ctl;
> >   	unsigned int dsc_mask = 0;
> >   	int i;
> > @@ -1166,7 +1166,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >   		drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
> >   		ARRAY_SIZE(hw_pp));
> >   	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > -		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > +			drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> >   	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> >   		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
> > 
> 
> This chunk of diff is unnecessary. You are just changing the order of
> defines and fixing alignment. Does not have to be in this change.

I can drop it while applying.

-- 
With best wishes
Dmitry
