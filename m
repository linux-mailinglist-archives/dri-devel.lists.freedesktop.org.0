Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB0A9EC998
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 10:46:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BAF10EAD7;
	Wed, 11 Dec 2024 09:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ATPw4TUv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778B210E130
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 09:46:09 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5401c52000fso3101233e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 01:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733910367; x=1734515167; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tea4vIJiGPJWHixoiDd5FPFnMHQTgOFRwTGQIe3zrGg=;
 b=ATPw4TUv5jkI34MUgcIVLfUbwR3sCkhh7Em9iyHf48yuu7CoMXP70E8Aq6XWs0CEfF
 J4LJFKiTgdNsis4VOSxIRJ1mUOT3Ka0GycpQvbvS7jSbcxcP2wfWxR22njtOxexg1K8K
 r7qmXJu5LhvhbLSVxrvn35AnVWA508F8Tzh4d7LPDqrUIX7BoYtsXyOV5Orn+vPVFCNg
 fdElFSPGZ0xZgCiZipg86PzQQYFkW2ydW3EYCSrn8KYPlq4EEiEF/iAjb5ASUFn8FuDw
 yS9f1nCC/7nHLnaduozAi1e7BPzcH3M3abTd/UFYD79vUIDl3yE95aSEprMIjv3N5Dsd
 erPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733910367; x=1734515167;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tea4vIJiGPJWHixoiDd5FPFnMHQTgOFRwTGQIe3zrGg=;
 b=wwWwH4u0BVN1fjhUKgkdnc5XnPoGzYAtr4pbp3koShBNPIvaq2AJ1z2VHOHE6cW22h
 nrldvFfECzCii7xEgBwID+QkWXDBF7bxq0vOwtIS5nRc8AcQzcPE4AKGIxLqkW15WdiH
 2fbh+z2blhTRq8i+KQiC7ilKWLKlYfAOBwzOmATkOzmfOCZw1h+WWwBLsECfgJv+KA12
 h7knVl/qwhjRPtqL+FIQeITrgQO7Q0BDtzom5lUDv94CYAYLfwTNgMNt6ctJ1J2KVoak
 9gCPqQLuP8LQUiMKGVrZXrUEuadO3UTSoFkTQLzh3J9m+vWmTYV/9z3oVEXSCeSgxAH6
 dQBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3fvK78sANNvDW6ZXw/ExoBrODVHjZxs+jC3+mgj98fxOrk4h6IuhlbX0hvQx9zpmNrnH4tFf1Lao=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIuxuMTsea8CF5JOWUozT+melqKE92kOPkAo9Hg34DB++oTYkK
 vw+/ULyo0e4mZboG3vQHaQjQeTiPZQXacmJAyuqzm7BK/k83WW3cjuWQW1h8SaE=
X-Gm-Gg: ASbGncvDRiPHGebTWy7Kuqp4wSbFKDZ83BMoAis1SKOOBg2Hw9DrK0HqaBhX4ifkxXy
 ImvpoIv+f68937VNRPr2Jd080cmlsdGGMmlMXVi9TdnNhOmtoqLzw6pxFI70NKWZy6yr4553Rtr
 aFTAiBlsRxtCSJ0V1uZNVVLmC4jdllDIyQWFK6ej35+Q2dAs07RB1qri3LZPgaPe8+cmGHqpMFM
 lH8y86cfx/n6rEiQbxbtpxgnh1yNJHDSxQiiXx+bmVQ3zpfClxxLGwUPMXtRA3S2vHFaIi7C8Jt
 YZq9elx+5XR7MyBS4iGalsunPskMrzXobw==
X-Google-Smtp-Source: AGHT+IEtlbI01qtT4hElvvQMyeb/TKdaC5qWfnqkdfHb5ztyN2VBFJ9f2yMWhkC3MvVYmq106RrFMw==
X-Received: by 2002:a05:6512:3c85:b0:53e:1c3e:34 with SMTP id
 2adb3069b0e04-5402a6056a1mr671998e87.38.1733910367530; 
 Wed, 11 Dec 2024 01:46:07 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e22974f2bsm1973804e87.99.2024.12.11.01.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 01:46:06 -0800 (PST)
Date: Wed, 11 Dec 2024 11:46:03 +0200
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
Message-ID: <t5vcjlf44fhae4f2h75cfs3f7r6tdstw4ysmkapvvawj6xp23x@xnxqnxvyhshe>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-3-09a4338d93ef@quicinc.com>
 <CAA8EJppOR_UXoVpMt-dhfWdCz3UNfsXGdz8X9NqpaSmYj3AZDg@mail.gmail.com>
 <5ea14162-567b-462d-be02-b73b954b7507@quicinc.com>
 <5whv4z7u6fkfwlv5muox5dmv6fow4mga76ammapw7wph7vwv3f@xibcjdfqorgf>
 <iqcofcntirmlwcpyfr4yabymqfcgyrij57bibf337tmxpa73t6@npkt6wquenf6>
 <527baded-f348-48a8-81cd-3f84c0ff1077@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <527baded-f348-48a8-81cd-3f84c0ff1077@quicinc.com>
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

On Wed, Dec 11, 2024 at 08:46:16AM +0800, Xiangxu Yin wrote:
> 
> 
> On 12/10/2024 11:09 PM, Dmitry Baryshkov wrote:
> > On Thu, Dec 05, 2024 at 08:31:24PM +0200, Dmitry Baryshkov wrote:
> >> On Thu, Dec 05, 2024 at 09:26:47PM +0800, Xiangxu Yin wrote:
> >>>
> >>>
> >>> On 11/29/2024 10:33 PM, Dmitry Baryshkov wrote:
> >>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
> >>>>>
> >>>>> Extended DP support for QCS615 USB or DP phy. Differentiated between
> >>>>> USBC and DP PHY using the match table’s type, dynamically generating
> >>>>> different types of cfg and layout attributes during initialization based
> >>>>> on this type. Static variables are stored in cfg, while parsed values
> >>>>> are organized into the layout structure.
> >>>>
> >>>> We didn't have an understanding / conclusion whether
> >>>> qcom,usb-ssphy-qmp-usb3-or-dp PHYs are actually a single device / PHY
> >>>> or two PHYs being placed next to each other. Could you please start
> >>>> your commit message by explaining it? Or even better, make that a part
> >>>> of the cover letter for a new series touching just the USBC PHY
> >>>> driver. DP changes don't have anything in common with the PHY changes,
> >>>> so you can split the series into two.
> >>>>
> >>> Before implement DP extension, we have discussed with abhinav and krishna about whether use combo, usbc or separate phy.
> >>
> >> What is "DP extension"?
> >>
> I'm sorry confusion casued by my description. It's means extend DP implemnt for USBC phy driver.
> >>>
> >>> We identified that DP and USB share some common controls for phy_mode and orientation.
> >>> Specifically, 'TCSR_USB3_0_DP_PHYMODE' controls who must use the lanes - USB or DP,
> >>> while PERIPH_SS_USB0_USB3PHY_PCS_MISC_TYPEC_CTRL controls the orientation.
> >>> It would be more efficient for a single driver to manage these controls. 
> >>
> >> The question is about the hardware, not about the driver.
> >>
> >>> Additionally, this PHY does not support Alt Mode, and the two control registers are located in separate address spaces. 
> >>> Therefore, even though the orientation for DP on this platform is always normal and connected to the video output board, 
> >>> we still decided to base it on the USBC extension.
> >>
> >> Could you please clarify, do usb3-or-dp PHYs support DP-over-USB-C? I
> >> thought that usbc-or-dp platforms support that, but they don't
> >> support DP+USB pin configuration. Note, the question is broader than
> >> just QCS615, it covers the PHY type itself.
> >>
> >> Also, is TCSR configuration read/write or read-only? Are we supposed to
> >> set the register from OS or are we supposed to read it and thus detemine
> >> the PHY mode?
> > 
> > Any updates on these two topics?
> > 
> Still confirming detail info with HW & design team.
> I’ll update the information that has been confirmed so far.
> This phy support DP-over-USB-C,but it's not support alt-mode which 2 lane work for DP, other 2 lane work for USB.
> TCSR phy mode is read/write reg and we can read for determine phy mode.

Ok, thanks for the explanation. From my point of view:

- Implement the DP PHY to be a part of the same driver. Each device
  supported by the usbc driver should get both PHYs.

- Make sure not to break the ABI: #phy-cells = <0> should still work and
  return USB PHY, keeping backwards compatibility. Newer devices or
  upgraded DT for old devices should return USB PHY for <... 0> and DP
  PHY for <... 1>.

- I'm not shure how to handle the USB and DP coexistence, especially in
  your case of the USB-or-DP PHY.

-- 
With best wishes
Dmitry
