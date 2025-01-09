Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9DBA0757E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 13:16:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7364610ED9B;
	Thu,  9 Jan 2025 12:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EZNOV9Hh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D664310ED92
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 12:16:54 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5401d3ea5a1so843993e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 04:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736424953; x=1737029753; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=51fiBQGJpPcUuo5vlJJmT51EBH56olvKE7bUWMTUTdc=;
 b=EZNOV9HhnPdsIxxbnUMofwGlfh2rt79E4wT3IYRJQ9X5U7/0td7VJd9F7l0mDsQOlY
 nGtn9lqObad7PrHjMhcGGil3fxGSHhYqNi81EsrbPEEbuOsMVxVY+wZOynNcXYj/n6iV
 5kA29A4ABM2Y+fQ2ANk8H8cSaELK8gP0syobsNJgl5v8FgiOBquZIw0gWkI68pOhd/m9
 dehMELLN21YmG7hsgGfkZh1X3gBYsehYexMvUrMylVxpULChUQnVtEaCfkRK+OHA4H3o
 SPLG+jmka3JaVAZBEhsoztMkwrRzn1Sbq4c+856w8XnjAOXcQ7qgCeh4nPhvMyCjBlXN
 PEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736424953; x=1737029753;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=51fiBQGJpPcUuo5vlJJmT51EBH56olvKE7bUWMTUTdc=;
 b=v9EmN/0PIUSKQr0TWNVDg6iUA4Fzx4d3ozeQf3VwJ9kGL9lnSUuvHcUu8gnqcLN1eG
 fDmW4QRK9we5E6Roh5U/OgdZrCCkLBpMpi7TwpLLCn809J0zO7YbEGbYX6lU7n2bKbMZ
 ef0sUvkyz7e6Pr3bL7ICEqW6RvqKIvJ0eQCBEMBbL8K1UADKHfb9vrEIwQu4ds7R/CnF
 p7nV90+ZDMQE6SSuAeJUmlMpeEwQ8kWR3D3Hh7EhMdLFAvQHtTahbDkr8k4q8JaoFaEm
 w4rMRVhKRSyHap6y78OOzPZ73P8jYbE/o/ZlD49wACGk3AL0UxTxv5VRRCfboSyU9MBh
 3jjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSeLCQL5Kizkul3kIDs99LDrLie/EsYMIfdt8GWoEK2AaMtZFuFWje0YZpW3P+y1mOYjQTWMfpzpk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyB74WYFG7Vxw9prQxnDWw3ALWWiIbgZmvIVPAkWccuTYqjR4M
 99aqAVO2TdyLO+KYR0PFnLjvkMT8+P3diDZat7aw4Xgd2WuiQ/HC1D7LbFgCqvU=
X-Gm-Gg: ASbGncuX8qPI2lSmxBD/aMzkhDB+QsGb12uq2jVzpS5FOBuljXDC2+uBcoNLS+5zECL
 kjTp9I4/buaaFtpCL3KvuXKKQTcrQlP3uBrZyLHA8YJB++fE2EmIFGjV2dsE92jp+EkHYJDoZ+6
 pkFOMfuBB8glPkAJp5qxeFNVHspuT/aeLq0x0Ox7qyH2pA9l+ROg+UlXfFxVtXl7tZqCIrCd5iH
 JD57028c/qAaTZbxc+1dUL80TwPNddxwNAnYjaGKZ/Zw/wM8H2jI4C6K3KWNCM/yYUIiPHLRn3A
 tWDINumj878OAiMLqwUr5axgfWa7Ir1bsy/s
X-Google-Smtp-Source: AGHT+IH5j6fZ8mHbuQ1cCJLcbUHN8wITNN/T+GeApB/Zpmg3LUDNE3p8F7Pix0g3oCHAp6x7GNOU5w==
X-Received: by 2002:a05:6512:2351:b0:542:2192:3eb6 with SMTP id
 2adb3069b0e04-542845c08a7mr1977249e87.52.1736424953245; 
 Thu, 09 Jan 2025 04:15:53 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be4996fsm182328e87.56.2025.01.09.04.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 04:15:52 -0800 (PST)
Date: Thu, 9 Jan 2025 14:15:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/15] drm/msm/dpu: fix mixer number counter on
 allocation
Message-ID: <k2tf3tnaquagm7stxho7lrqj5oylbti4jisenm6t53hj5kvyhs@degtp25bmkj5>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-5-92c7c0a228e3@linaro.org>
 <da270bd6-3f7a-4100-8352-acbf14b62db5@quicinc.com>
 <CABymUCPm-+RYVGx6aXXPqgEcg+x7vhrN_HanJvvNrFkJj6o5Aw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCPm-+RYVGx6aXXPqgEcg+x7vhrN_HanJvvNrFkJj6o5Aw@mail.gmail.com>
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

On Thu, Jan 09, 2025 at 12:40:23PM +0800, Jun Nie wrote:
> Jessica Zhang <quic_jesszhan@quicinc.com> 于2025年1月9日周四 09:29写道：
> >
> >
> >
> > On 12/18/2024 11:49 PM, Jun Nie wrote:
> > > Add the case to reserve multiple pairs mixers for high resolution.
> > > Current code only supports one pair of mixer usage case. To support
> > > quad-pipe usage case, two pairs of mixers are needed.
> > >
> > > Current code resets number of mixer on failure of pair's peer test and
> > > retry on another pair. If two pairs are needed, the failure on the test
> > > of 2nd pair results clearing to the 1st pair. This patch only clear the
> > > bit for the 2nd pair allocation before retry on another pair.
> >
> > Hi Jun,
> >
> > I think the commit message wording is a bit unclear. Maybe something
> > like "Reset the current lm_count to an even number instead of completely
> > clearing it. This prevents all pairs from being cleared in cases where
> > multiple LM pairs are needed"
> 
> Thanks for the suggestion! Will adopt it.
> >
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
> > >   1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > index cde3c5616f9bc..a8b01b78c02c7 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > > @@ -316,7 +316,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
> > >               if (!rm->mixer_blks[i])
> > >                       continue;
> > >
> > > -             lm_count = 0;
> > > +             /*
> > > +              * Clear the last bit to drop the previous primary mixer if
> > > +              * fail to find its peer.
> >
> > Same here can we reword it to something like "Reset lm_count to an even
> > index. This will drop the previous primary mixer if ..."
> 
> Will do.
> 
> >
> > > +              */
> > > +             lm_count &= 0xfe;
> >
> > Nit: Can we directly clear the first bit instead of doing an 8-bit bitmask?
> 
> Could you elaborate on it? Or you are suggesting to mask 0xFFFFFFFE?

I assume it is &= ~1

> 
> - Jun
> 
> >
> > Thanks,
> >
> > Jessica Zhang
> >
> > >               lm_idx[lm_count] = i;
> > >
> > >               if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,
> > >
> > > --
> > > 2.34.1
> > >
> >

-- 
With best wishes
Dmitry
