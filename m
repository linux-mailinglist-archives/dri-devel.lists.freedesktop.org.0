Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73136C11BAE
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 23:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A3810E043;
	Mon, 27 Oct 2025 22:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dz4qRStE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F0510E043;
 Mon, 27 Oct 2025 22:34:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E163948283;
 Mon, 27 Oct 2025 22:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F929C4CEF1;
 Mon, 27 Oct 2025 22:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761604486;
 bh=vzBr+yxDuWYssqy8HhgZk1oBeKR5UFQrHdnJ7mJAUFA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dz4qRStEXx2NFtUH12/+N/Vs1bM7fWpdAIU9keu76nte39i7cBX559wW38xvW4wTy
 ANH5zm1C4NuH6A1f5OrKkyOZCWyWixCKf7raO5HXvQ9hMu8E6PBfceTy3une2AJnCx
 58j4D8f7Its92U1e7myipmcfZticYtpEPm9I4g3ajCnPGuY6Kcg5vEVvHiNLDAmELz
 i7M1lvl6HJZxRP2JeWL0WqAlTd1bdkkJU5P4ybYbpWaDxJDy9IrJ8IXUmqNWoSkNgt
 q8ofNzUZJt9iXLVrWLdmun26QpXwBrCtXniao8qvKGPpCQgBX0rB2ii54avZBnOAtB
 AOhpJ9cWo89ZA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/7] drm/msm: Add display support for Glymur
 platform
Date: Mon, 27 Oct 2025 17:36:42 -0500
Message-ID: <176160465226.73268.4378641662848766051.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
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


On Tue, 14 Oct 2025 15:38:25 +0300, Abel Vesa wrote:
> The Glymur MDSS is based on the one found in SM8750, with 2 minor number
> version bump. Differences are mostly in the DPU IP blocks numbers.
> 
> 

Applied, thanks!

[7/7] soc: qcom: ubwc: Add configuration Glymur platform
      commit: 9b21c3bd24803e4ebab9f91bd812aa10576d8220

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
