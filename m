Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAEE86005D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 19:07:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C9810E9E0;
	Thu, 22 Feb 2024 18:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nOj4Yd1j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F1E10E9DE;
 Thu, 22 Feb 2024 18:07:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 29A1CCE28A9;
 Thu, 22 Feb 2024 18:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1C1C433C7;
 Thu, 22 Feb 2024 18:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708625218;
 bh=lBeRCmby1gUQMllOcKWPl1MR8+1XX3jNUKV55GgSZAs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nOj4Yd1jSGV/rjAPstPTsYiX+lJPz6EK1NrTGv2/aKwxPtNlK3XwRyBkMo2xXsyU7
 ZwP1xxts/KJzXw/q2GLcL0qJKGA8sqCttvVHRLDYP543X2ZKIrP5l2h+pCsMICnhMt
 e9j9u43vWXrN1kcjmvE8GYsSaRLw2+oMCAyW5Xgcm5fJSSPBXDZdVXWgA+eyBhd8/R
 rwFR6MgB5qq07jMnfwASdMorZ21XXlunJxKEGF0zcbNs7ZzLyA+lrHr9bP9jhjzfVR
 c+DG0836DiJFLKJ06sWpb/3wztPPnoTAPxIwMnYk9M2p9SJrYI0wD2M8tWQm2K2AHG
 j2KkN8BtsSSBg==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>
Cc: catalin.marinas@arm.com, kernel-team@android.com,
 Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 iommu@lists.linux.dev, linux-clk@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/8] A702 support
Date: Thu, 22 Feb 2024 18:06:24 +0000
Message-Id: <170861662823.1923805.14686424405847288477.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
References: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
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

On Mon, 19 Feb 2024 14:35:45 +0100, Konrad Dybcio wrote:
> Bit of a megaseries, bunched together for your testing convenience..
> Needs mesa!27665 [1] on the userland part, kmscube happily spins.
> 
> I'm feeling quite lukewarm about the memory barriers in patch 3..
> 
> Patch 1 for Will/smmu, 5-6 for drm/msm, rest for qcom
> 
> [...]

Applied SMMU bindings patch to will (for-joerg/arm-smmu/bindings), thanks!

[1/8] dt-bindings: arm-smmu: Add QCM2290 GPU SMMU
      https://git.kernel.org/will/c/0eca305f8e0d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
