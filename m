Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2C5A04D69
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 00:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D88510E1BE;
	Tue,  7 Jan 2025 23:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ANXiuk8p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF0210E1BE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 23:22:58 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5d3bdccba49so29513846a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 15:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736292117; x=1736896917; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mMn+z48n5sDePMLHOThKGK3HUHhS6YpHtjLFF5FzZzw=;
 b=ANXiuk8pidZo8FFeNrsmZSWUnGJz/khCojPEzvzu1N1CySpHSXW2q2I6BV7Y8jqAVV
 Q2DBljrBqAxk0qCwWRcJnmxIfIkDbGq5DJUbbejg2iLbGme4v4sNVDTty57rnNjRskVw
 vSiem9PAoacwmxFTbRZnz5pTLKaDIFU55qzADuQ/3sNuIcLygv4OXHWXQhkit2n/on/g
 J6ytsme6N+D2Q4T+9kISM3oOpu30pFwBHvLQ6+i2fYxcsiqWsa+U7qi9dz0IeIKlGiAO
 zvLrB+4fgeqYTPgXoPPiBDPYmwnqqYH8CXoe0t3xRF0Sjl4lpCPCkDJNEBDMSmeh63wk
 337Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736292117; x=1736896917;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mMn+z48n5sDePMLHOThKGK3HUHhS6YpHtjLFF5FzZzw=;
 b=KS6eG7Ht8MA3hl3l2O9nU/9fKPwPV6g6ZJF52QghgTWWUaT0Ylv28y3wv8tM8Sdwhd
 w0vC3Kl3+v7RKC09ft5FqndG4nzLnXcOhTiC4HeluVncAyQu/qphfSyovozmxipQmrBn
 r9So1pb4QoyBEiCdYwfQPf33foW+SGP5qm+5mmuZprzsNjq8wYs+0aGww8lEuqnYP5Hk
 jBhbZGL7K1nEo9Bbuycp6EPbuWyOuUGA5fh72hnfVXgXuD3qgC8+iOH2QzXobX0WH1iu
 EGk498eTssbsQV3A6guMILEJXPkWC7sgSIpMhvJhU9vErBCoQRN28kzVtO/dQ6iY78zj
 +p2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrtfPziR3GCreRGF9HRrqw7jtBWiHaPsExXrxS4Iq2y0AhhDU35Ruw+Nuet7NQNOxXKPeNdGDlZb0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxy83nFEY9o6E04qk8p8sZGWX+NfAHNdNWTG4S1o6sw4IMC5wlh
 EZv2mMuIWZ7TG8J2jK+1qc5/HGLftcKDVxKKK8BOoznZKSmcbM9fdH24WQ6azqDL4E7jobHHA0/
 I
X-Gm-Gg: ASbGncsQCNQXc0mQl/2iqaE1GKTZCJgryVk6+1zbcXsLeI05C0jtrdsMC8uvpbUuhdn
 KOQysg1iKVNhhY4U9bq7AsTfb+I05QmucYqENYlNgQ5vODmGOvTIVHtd47rAgPiJ0DeV7S8fKeR
 +6TDGzo0LdBt1IFMDomNCxvt9Q1/jv8mtJ6axBUTM6lMFtWys6b5VrJVGK9xEGZBw9mFDVbykTw
 g9yn1jE6HQ2qJ/DIs07AaXMeUq5okW1/m/r0ZHV4rPtZcCB8fhKBVcQOy8MXSKaK6+W0CvCXdJE
 3s8TSfKAvrlCPkOdcBQL3bPwBYcsi/HMhO4G
X-Google-Smtp-Source: AGHT+IFCpSE+6bYHg6NHBaB8kARffXJeZAVotzbF1jSuppzcHd7AtPj85AqoS/RBH5MSht9AXr1DdA==
X-Received: by 2002:a05:6512:2803:b0:542:29b6:9c26 with SMTP id
 2adb3069b0e04-542848108femr117742e87.47.1736288750743; 
 Tue, 07 Jan 2025 14:25:50 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f6002sm5357569e87.36.2025.01.07.14.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 14:25:49 -0800 (PST)
Date: Wed, 8 Jan 2025 00:25:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 15/15] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
Message-ID: <mo45zzcmr56grnj42o5rc57t2xdj3rq27chryaqbiwzcbzhjdh@4cvk6er7fr3g>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-15-92c7c0a228e3@linaro.org>
 <etci547cjykqlqfswhkzdbdfx7cuyrszzswxv2qaghzu2fnu3y@fgitftlhe3oh>
 <CABymUCNxSKAzNq34evjOdWQy5EmRLg96_S=2O1EUguNFztFgVw@mail.gmail.com>
 <eshnauruu4sybpgsfrrwlvk3cpb2zg4mykg4agwong3dbiduic@nvupoe6aoyzu>
 <CABymUCPXnXYgwemODHOP-Ez3TpGfX3X8ZrOWx7j1a81XzNSjSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCPXnXYgwemODHOP-Ez3TpGfX3X8ZrOWx7j1a81XzNSjSA@mail.gmail.com>
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

On Mon, Jan 06, 2025 at 04:21:43PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年1月4日周六 01:51写道：
> >
> > On Fri, Jan 03, 2025 at 11:49:07PM +0800, Jun Nie wrote:
> > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2024年12月20日周五 07:46写道：
> > > >
> > > > On Thu, Dec 19, 2024 at 03:49:33PM +0800, Jun Nie wrote:
> > > >
> > > > >  #ifndef DPU_MAX_DE_CURVES
> > > > >  #define DPU_MAX_DE_CURVES            3
> > > > >  #endif
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > > index 57ccb73c45683..b5c1ad2a75594 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > > @@ -1474,7 +1474,7 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
> > > > >               trace_dpu_plane_disable(DRMID(plane), false,
> > > > >                                       pstate->pipe[i].multirect_mode);
> > > > >
> > > > > -             if (pipe->sspp && i == 1) {
> > > > > +             if (pipe->sspp && pipe->multirect_index == DPU_SSPP_RECT_1) {
> > > >
> > > > Separate change, please. Also I'm not sure how does that work with the
> > > > shared SSPP case that I pointed to in one of the previous replies.
> > >
> > > Maybe we can add a peer member in the pipe to reference each other, then we have
> > > chance to use multirect across all pipes in all planes.
> >
> > I'd rather not. We have pairs of pipes. I'd rather see the code stay the
> > same way: processing one pair at the same time.
> 
> I mean only use the peer only when the SSPP multi-rect pips cross
> planes. This shall not change
> too much to current SSPP management.

Still no. Please please don't add extra 'peer' member. There should be
no need to have one.


> >
> > >
> > >
> > > >
> > > > >                       pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > > >                       pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > > >

-- 
With best wishes
Dmitry
