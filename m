Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA739EB457
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 16:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28C910E8FA;
	Tue, 10 Dec 2024 15:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W0GXBK16";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2DE10E8FA
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 15:09:25 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-30219437e63so24804971fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 07:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733843363; x=1734448163; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ONPoAWCr/z6lJfjDFKtgqfFAw1BGCZer+GCPiaXmPhw=;
 b=W0GXBK16LisKO2CNSUVY89xaF3GVq0jl+t1/fOJptjx9oRlFhhaAiTU0kQ3UXMM0MH
 zvzPX2hLOtlSTlSXIsbik/w+qa8WNUoXcRb5AOaIxsuUeXx+oYMOfaY2h1LgMYYSnWQm
 ACw0Ttjpe3Dt59qQR92Khbs0bTBjvN3lXJP4gdJKyQUxpwUJSSIXEny9xO5J+FHcP3e9
 BfpKZidQmM0XI+xJeZ+xE4TvawqTpcHNk7cSnkeTxDYItEkt59srYjGsraodWvei4dwC
 PveaL2Pr26NVyvkQbogfcSuTqDkNmx00jpUJSN9a/ikbE2xVwU+51trvyfA26bde0y0F
 ilZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733843363; x=1734448163;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ONPoAWCr/z6lJfjDFKtgqfFAw1BGCZer+GCPiaXmPhw=;
 b=I6ftPbNyI3oMn2Sw9BsnBVSW0UuqDX/uuXammxUxEf/H9GDt0Rm+8IsLaEvhVePxG7
 UHIfjyyO0Ka2GEwfdcEq+gOHIVpfdlC9ztbjqbFj2muBkzHho3yApzifmV4Tva6bszJH
 +YjWYep0nQ3h0hekZMLtgogOQEUVPb+izBUWO8vgRaXz8iAZeo/CUjXWrTCP6NabGaYv
 Gl8/TTOPSXDql2e3lvplSOlsdHXrFlw6EkKy1dNRdjxuiD9PCtb3xgvDWIKLKzSLksNY
 lY1J8lEOeUWQwdIISi5uvVhfLJtToS3osLRUw/VtzrNMdmW4im+QupmXaAu2E0UpKK6Z
 VeSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeLjXYGBA8IG05yRd88JsKvdEui8KLNGdQn3xDJ82NUBKAec+KCC5pd+CUatbgW1F3Kks7Jpt3XlA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8z+kZ8enatQOm7ZQXtzpqT1IHY6DCkb2Z1Al+3ik3493T8wgx
 fo8/TYj3nnbpFHLPD4b672PvjjQg3jUJBGxYvKq2QiqUAetPCZyDSZ5NzEwdG1I=
X-Gm-Gg: ASbGncvUuR+8ylxsX6f79G/O+qT0bk+zPD5SPEJ5DapmHvBawdWsZZfGX89NV2l39AD
 udFTWB+QZnDW1kN4qdL6hBY2ytXp1mOCc/G7FRk52bKJTveOfaW0J4dps/wj5oEvKl8hkPfNz90
 zJR6tVOi21R0KccLlJmofoy4tVB1tfQeyDU1tW/X0bxQEc3J4gj0WSg92OV7UYPwKDM+6HWVNjy
 hYBvnbGebgHx1UEKLqb1OGoYGccj2IKo2Cpt7yvFzQFiHTS5N+9uCxhlItg+Iv0qDbqqySQ4WM7
 fbWg8YA7tDkUxU74l9ECiZDiSkt/bJjHYg==
X-Google-Smtp-Source: AGHT+IH4LG5o5SbyEh1Vovj71WLwSfFbBGhk7NJh/k58qLpSj2p2TBBGrOFSDDq9rnPlmsaGShNmLg==
X-Received: by 2002:a2e:be0b:0:b0:2ff:b8f5:5a17 with SMTP id
 38308e7fff4ca-3023282c1femr12568441fa.5.1733843363188; 
 Tue, 10 Dec 2024 07:09:23 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-302259416c5sm5907321fa.6.2024.12.10.07.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 07:09:22 -0800 (PST)
Date: Tue, 10 Dec 2024 17:09:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
 quic_fangez@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/8] phy: qcom: qmp-usbc: Add DP phy mode support on QCS615
Message-ID: <iqcofcntirmlwcpyfr4yabymqfcgyrij57bibf337tmxpa73t6@npkt6wquenf6>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-3-09a4338d93ef@quicinc.com>
 <CAA8EJppOR_UXoVpMt-dhfWdCz3UNfsXGdz8X9NqpaSmYj3AZDg@mail.gmail.com>
 <5ea14162-567b-462d-be02-b73b954b7507@quicinc.com>
 <5whv4z7u6fkfwlv5muox5dmv6fow4mga76ammapw7wph7vwv3f@xibcjdfqorgf>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5whv4z7u6fkfwlv5muox5dmv6fow4mga76ammapw7wph7vwv3f@xibcjdfqorgf>
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

On Thu, Dec 05, 2024 at 08:31:24PM +0200, Dmitry Baryshkov wrote:
> On Thu, Dec 05, 2024 at 09:26:47PM +0800, Xiangxu Yin wrote:
> > 
> > 
> > On 11/29/2024 10:33 PM, Dmitry Baryshkov wrote:
> > > On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
> > >>
> > >> Extended DP support for QCS615 USB or DP phy. Differentiated between
> > >> USBC and DP PHY using the match table’s type, dynamically generating
> > >> different types of cfg and layout attributes during initialization based
> > >> on this type. Static variables are stored in cfg, while parsed values
> > >> are organized into the layout structure.
> > > 
> > > We didn't have an understanding / conclusion whether
> > > qcom,usb-ssphy-qmp-usb3-or-dp PHYs are actually a single device / PHY
> > > or two PHYs being placed next to each other. Could you please start
> > > your commit message by explaining it? Or even better, make that a part
> > > of the cover letter for a new series touching just the USBC PHY
> > > driver. DP changes don't have anything in common with the PHY changes,
> > > so you can split the series into two.
> > > 
> > Before implement DP extension, we have discussed with abhinav and krishna about whether use combo, usbc or separate phy.
> 
> What is "DP extension"?
> 
> > 
> > We identified that DP and USB share some common controls for phy_mode and orientation.
> > Specifically, 'TCSR_USB3_0_DP_PHYMODE' controls who must use the lanes - USB or DP,
> > while PERIPH_SS_USB0_USB3PHY_PCS_MISC_TYPEC_CTRL controls the orientation.
> > It would be more efficient for a single driver to manage these controls. 
> 
> The question is about the hardware, not about the driver.
> 
> > Additionally, this PHY does not support Alt Mode, and the two control registers are located in separate address spaces. 
> > Therefore, even though the orientation for DP on this platform is always normal and connected to the video output board, 
> > we still decided to base it on the USBC extension.
> 
> Could you please clarify, do usb3-or-dp PHYs support DP-over-USB-C? I
> thought that usbc-or-dp platforms support that, but they don't
> support DP+USB pin configuration. Note, the question is broader than
> just QCS615, it covers the PHY type itself.
> 
> Also, is TCSR configuration read/write or read-only? Are we supposed to
> set the register from OS or are we supposed to read it and thus detemine
> the PHY mode?

Any updates on these two topics?

-- 
With best wishes
Dmitry
