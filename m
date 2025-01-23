Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6FBA1A34D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 12:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A3310E7E7;
	Thu, 23 Jan 2025 11:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rRa+E4ZZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1311410E7E7
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 11:42:47 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-542af38ecd6so994522e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 03:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737632565; x=1738237365; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=i3P39NTqsEmG+qD3A8uUKR2alt74v//DeAhcZsNNbA0=;
 b=rRa+E4ZZqnsp3kQcaZmbe78Hw2vTwVyT6WGQkyedOYFhpH6D3TmUmcdEkk6UeH+QOU
 0J0EUeOQVOByXIsZ2wKonKzE7noI79VNx86gOmxlNsx0FxElLEF1IlZPweWptlWexuPC
 oxCAGvql4BImIT5w8TGt1TML3wWkEu4iCLRajgGX1HLKYses8PA5BMikyfSTKBJ2W7oe
 Z9Pbx9Xt/UTILGw84aE3Afn376HI2fEbYtr/UJ3PGSGfqYyB6VR5ft50UYHU+955OVRY
 NEkE7szGWyI0mJPGeyFJQWL6kHgiU1yrYK4Hx66LaKGR2I84ciT5uKIhFAnTDsLa11w+
 9qKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737632565; x=1738237365;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i3P39NTqsEmG+qD3A8uUKR2alt74v//DeAhcZsNNbA0=;
 b=sQKTNzwxlgk4eBXboVvcfcmpU7re/6fgQF7pAlYWjB4Qslz1Ukj8GnPx01E/9mS2Vd
 8Eea/q9Ds4moOpiP5qRROSfUnVXs1VyqhtqgnzW9TC9cjOt4W0D1IW7jX85tEMh4hcQD
 WkQuW767bVbVONJxPw/bQQ00oTVynGnVVEnNCbgd+w5W1OpaJ3DRE5gqACZkGJq53Gch
 d/sbVgCSkoEVmRObnSX1qNhr/+bvnNwhTLP6gUfH3GbE0YSN9IQUxv1/gzvUJJZ7GZtQ
 GTuj73uEj89GPWz0+j4mTSKkjn3ineyx/hwt7lerVsP89bvu/PfehBTAb7U19MTbL4g7
 srlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU2HfEsDr2rx36/gbVB+shm4kI2tnSxeL9ES/h3S2LKszKboEz0wdKB+gFVNoxzPBMaG5r+v0UHwM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz60R9TmN0MyU45WA24IUIMjdVxIktBV+O1gx17TS6tx69p8feR
 pXC5RLBuTUUbNt0mAA+uLbJ2LzLgT5+oen1vipii539Z/vNzpZaiaxJzuw3r/d8=
X-Gm-Gg: ASbGncvbgK1U09cKRk92qo59ez2BtlIQsD1VLU1ItRC7qRjt+ObJ/p3rKeOCV9nInYP
 0fYpxed/F8U1xEqOVv564o6ALPHv9xOUbiy3V7aYEOxDdEXDoO+rf1EsLHl04a8EXOPJnlddvPi
 /i5vVzN3lB+z6m8ydgbbuOOto59AyQQvzPuKq08uWdDZQvCaHTQxoxk8T1ObCFxCb3neuuHp0c6
 yFBckPuVCQ74qm+117f1B6zXFgjcnaiN6KESWr4yzaFO0M3eMUsFSUQEaJFMtK6cLxXoUB1oaFH
 hfm21AMnlOv5YhvAtdOup05n1Qg7Gnee9dQ/H4bWxfopgReYxtkFJYMiG6e8
X-Google-Smtp-Source: AGHT+IE+Ia87Yzw0G3ah3eRZORLnjYGt9PngsTrMv1Yrk3tLzpNB1AsQiaezzDF9LgUfWKQxNA3NSg==
X-Received: by 2002:a05:651c:896:b0:306:10d6:28b3 with SMTP id
 38308e7fff4ca-3072ca5da94mr102237171fa.1.1737632565289; 
 Thu, 23 Jan 2025 03:42:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a344579sm29966991fa.28.2025.01.23.03.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 03:42:44 -0800 (PST)
Date: Thu, 23 Jan 2025 13:42:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH RFC 08/11] drm/msm/dsi: Add support for SM8750
Message-ID: <uqolptkewqkavtnb6wkc5o6hq6nmqe62mi7y43uu7td7vz722d@ddouvp2z46ti>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
 <20250109-b4-sm8750-display-v1-8-b3f15faf4c97@linaro.org>
 <3p7kjok5jzwvgt7dxuad26xgdkjd52v4gbtuudvgkeoj33skqn@afl2ddtsq7s2>
 <4fc7fdd5-36cd-42e6-af4a-e0e429f9f50b@linaro.org>
 <7eupqawhdrbjgsj2p7e3ky7uj62m252i6dzkb6y23btocedp3q@qmw72nmbk2c4>
 <6ee02d22-7a00-4c7c-a5e9-63e91d7d84ba@linaro.org>
 <uyidfuh5ul5kcg4keeev6yagmjc5ksun626dyb6kdgwegc76d7@iu7ggdhgt5qr>
 <7255ae24-983d-452c-bd6d-85804c367f8f@linaro.org>
 <5irzvm4socrdjx3zqdxnogpai3bmfb52f63ddr3pisn5aa4jgf@mbc42kb3gyqd>
 <4adeffe7-ca07-4441-86fe-10a4891b7b4b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4adeffe7-ca07-4441-86fe-10a4891b7b4b@linaro.org>
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

On Thu, Jan 23, 2025 at 12:34:28PM +0100, Krzysztof Kozlowski wrote:
> On 13/01/2025 13:13, Dmitry Baryshkov wrote:
> > On Mon, Jan 13, 2025 at 12:02:54PM +0100, Krzysztof Kozlowski wrote:
> >> On 13/01/2025 09:29, Dmitry Baryshkov wrote:
> >>> On Fri, Jan 10, 2025 at 01:43:28PM +0100, Krzysztof Kozlowski wrote:
> >>>> On 10/01/2025 10:17, Dmitry Baryshkov wrote:
> >>>>> On Fri, Jan 10, 2025 at 09:59:26AM +0100, Krzysztof Kozlowski wrote:
> >>>>>> On 10/01/2025 00:18, Dmitry Baryshkov wrote:
> >>>>>>> On Thu, Jan 09, 2025 at 02:08:35PM +0100, Krzysztof Kozlowski wrote:
> >>>>>>>> Add support for DSI PHY v7.0 on Qualcomm SM8750 SoC which comes with two
> >>>>>>>> differences worth noting:
> >>>>>>>>
> >>>>>>>> 1. ICODE_ACCUM_STATUS_LOW and ALOG_OBSV_BUS_STATUS_1 registers - their
> >>>>>>>>    offsets were just switched.  Currently these registers are not used
> >>>>>>>>    in the driver, so the easiest is to document both but keep them
> >>>>>>>>    commented out to avoid conflict.
> >>>>>>>>
> >>>>>>>> 2. DSI PHY PLLs, the parents of pixel and byte clocks, cannot be used as
> >>>>>>>>    parents before they are prepared and initial rate is set.  Therefore
> >>>>>>>>    assigned-clock-parents are not working here and driver is responsible
> >>>>>>>>    for reparenting clocks with proper procedure: see dsi_clk_init_6g_v2_9().
> >>>>>>>
> >>>>>>> Isn't it a description of CLK_SET_PARENT_GATE and/or
> >>>>>>
> >>>>>> No - must be gated accross reparent - so opposite.
> >>>>>>
> >>>>>>> CLK_OPS_PARENT_ENABLE ?
> >>>>>>
> >>>>>> Yes, but does not work. Probably enabling parent, before
> >>>>>> assigned-clocks-parents, happens still too early:
> >>>>>>
> >>>>>> [    1.623554] DSI PLL(0) lock failed, status=0x00000000
> >>>>>> [    1.623556] PLL(0) lock failed
> >>>>>> [    1.624650] ------------[ cut here ]------------
> >>>>>> [    1.624651] disp_cc_mdss_byte0_clk_src: rcg didn't update its
> >>>>>> configuration.
> >>>>>>
> >>>>>> Or maybe something is missing in the DSI PHY PLL driver?
> >>>>>
> >>>>> Do you have the no-zero-freq workaround?
> >>>>
> >>>> Yes, it is necessary also for my variant. I did not include it here, but
> >>>> I should mention it in the cover letter.
> >>>
> >>> Could you please possibly backtrace the corresponding enable() calls?
> >>
> >>
> >> It's the same backtrace I shared some time ago in internal discussions:
> >> https://pastebin.com/kxUFgzD9
> >> Unless you ask for some other backtrace?
> >>
> >>> I'd let Stephen and/or Bjorn or Konrad to correct me, but I think that
> >>> such requirement should be handled by the framework instead of having
> >>> the drivers to manually reparent the clocks.
> >>
> >> I don't know how exactly you would like to solve it. The clocks can be
> >> reparented only after some other device specific enable sequence. It's
> >> the third device here, but not reflected in the clocks hierarchy. Maybe
> >> it's the result how entire Display device nodes were designed in the
> >> first place?
> >>
> >> Assigned clocks are between DSI PHY and DISP cc, but they are a property
> >> of DSI controller. This looks exactly too specific for core to handle
> >> and drivers, not framework, should manually reparent such clocks.
> >> Otherwise we need
> >> "clk_pre_prepare_callback_if_we_are_called_when_phy_is_disabled" sort of
> >> callback.
> > 
> > What kind of PHY programming is required? Is enabling the PLL enough or
> > does it need anything else? Are the PLL supplies properly enabled at
> > this point?
> > 
> 
> I don't know exactly and checking is tricky. I tried to use
> CLK_OPS_PARENT_ENABLE - with equivalent code, setting proper parents but
> without enabling the DSI PHY PLL manually just with
> CLK_OPS_PARENT_ENABLE - but then you have multiple:
> 
> dsi0_pll_bit_clk: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set

This really looks as if a part of the DSI PHY is unpowered. If you are
sure about your DSI and DSI PHY supplies (and power domains) then I also
have no other ideas.

Abhinav? Any input from your side? Or from Taniya Das?

> 
> So how do you supposed to test it? Any assigned-clocks-xxx will be way
> too early. Moving code around? Well, if I move preparing the DSI PLL
> clocks out of dsi_link_clk_set_rate_6g, then dsi_link_clk_set_rate_6g()
> will fail. Always and CLK_OPS_PARENT_ENABLE does not help because of above.
> 
> If you have specific code in mind, I can try it, but I don't see easy
> methods to see what has to be enabled exactly because of how everything
> is entangled together.
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry
