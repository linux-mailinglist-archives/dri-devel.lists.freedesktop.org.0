Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 476F38AC1B1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 00:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C57F11259F;
	Sun, 21 Apr 2024 22:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i8JAMcn7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1994F1125A0;
 Sun, 21 Apr 2024 22:29:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C2339601BA;
 Sun, 21 Apr 2024 22:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0313C32782;
 Sun, 21 Apr 2024 22:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713738583;
 bh=pAMG5KWKT7pt63O48mYKDd15e3VnQ/Lf8St05kDp1TY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i8JAMcn7seJdgleCJhiekoejDhAOqEPqyXOk1N2payJSQm6DtGzsVEJ6nnmllv+Z/
 BiGywAKfeRchCapQ1foS8grMUVC9QFPnFTK1yDdVwlk9+vT7SrF0fAg0aotGYvpOQi
 pPKMt6SOADLfYRF2Kvi5BelVTjeNHsqKyz3lpp1YyJgwzB9Oh+ySzC33xT6MsV8OCq
 AJH0JzI8hf4P7DrEZ9LmFlkxtrT6XTFOxpmeQwUQ9pjOWu7a2MO63BtzgI9xW9x4hR
 zkWY6bO2SxmbSwlIGs/VsWUjKJIPWiOkPwuEYn/zizHdb6yBEHlepyB2kpfNLErFdf
 avoMLjQtTBuKw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/3] DisplayPort support for SM6350/SM7225
Date: Sun, 21 Apr 2024 17:29:17 -0500
Message-ID: <171373856758.1196479.7387802929964223775.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329-sm6350-dp-v2-0-e46dceb32ef5@fairphone.com>
References: <20240329-sm6350-dp-v2-0-e46dceb32ef5@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Fri, 29 Mar 2024 08:45:53 +0100, Luca Weiss wrote:
> Add the required changes to support DisplayPort (normally(?) available
> via the USB-C connector) on the SM6350/SM7225 SoC.
> 
> This has been tested on a Fairphone 4 smartphone with additional changes
> not included in this series (mostly just wiring up TCPM and the SBU
> mux).
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: sm6350: Add DisplayPort controller
      commit: 62f87a3cac4e70fa916914a359d3f045a5ad8b9b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
