Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 876A1B43EEF
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 16:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90C010E259;
	Thu,  4 Sep 2025 14:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o92AJnVr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE7710E259;
 Thu,  4 Sep 2025 14:35:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A12A6601AD;
 Thu,  4 Sep 2025 14:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7651AC4CEF0;
 Thu,  4 Sep 2025 14:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756996520;
 bh=8kIGznDy+yBjtOzEZBMp/gYRmqnIWETZTPphA2eOkh8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o92AJnVroMgO0xyUlw5zPy+0SOqoU8a73BKt5yk4HJ/rA6ZxM/Z4lnFBvkqCTCcUt
 g55GxGyJ4kUwstKETLKrzHpfRrXg1HXAFoT0g4qT6YMWzAA+sBlDYUwQKIxp3EWIAq
 qSjq8hUsOGyVnMDYJl6+EUFw/w0owqY6Wo9+MsgUIRgAJ5+NY8nrN2n+lOZRu8+feE
 eoTkxkplcOyrx0yLVoCoIHziOC/DHMYyRGcfgYBUVwTa4aZJwEGv9m6LNB7YRSjOhS
 PhPBCM5x3ORKjDJK7txAcwIKaho+KEKGM9LQ5AvnsrOOD6SmUSh3mB3CpmVsRjSDhP
 EgaYwvQIsFwSQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Robert Marko <robimarko@gmail.com>,
 Adam Skladowski <a_skl39@protonmail.com>,
 Sireesh Kodali <sireeshkodali@protonmail.com>,
 Das Srinagesh <quic_gurus@quicinc.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniil Titov <daniilt971@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dang Huynh <danct12@riseup.net>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v9 0/7] Initial support of MSM8937 and Xiaomi
 Redmi 3S
Date: Thu,  4 Sep 2025 09:35:13 -0500
Message-ID: <175699650574.2182703.5262816788916742029.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250903-msm8937-v9-0-a097c91c5801@mainlining.org>
References: <20250903-msm8937-v9-0-a097c91c5801@mainlining.org>
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


On Wed, 03 Sep 2025 23:08:20 +0200, Barnabás Czémán wrote:
> This patch series add initial support for MSM8937 SoC
> and Xiaomi Redmi 3S (land).
> 
> The series is extending the MSM8917 gcc and pinctrl drivers
> because they are sibling SoCs.
> MSM8937 have 4 more A53 cores and have one more dsi port then
> MSM8917.
> It implements little-big architecture and uses Adreno 505.
> 
> [...]

Applied, thanks!

[3/7] dt-bindings: firmware: qcom,scm: Add MSM8937
      commit: cf13bed78c90b2c0fc65774e86d564c868fa2a23

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
