Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCBFA55FAA
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 05:56:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE05610E29D;
	Fri,  7 Mar 2025 04:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gCqzSpnV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6145710E25E;
 Fri,  7 Mar 2025 04:56:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D5ACDA4542F;
 Fri,  7 Mar 2025 04:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A67C4CEED;
 Fri,  7 Mar 2025 04:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741323373;
 bh=4xLy65/spHre+03tx2cdZR4rwWKdBdEO/nb63/hdqH0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gCqzSpnV5l3TxpFJ8JWy1SFW2c7RaV/SQ26BWp2Uw5Lm8O50WuADCRku9vNICtt9L
 pV0jV/nFK29dhWVXD0FnHLx3jA1nTQs8s/Ix98hw7/Wp/iY+mIjbBu6ibFrTSxDiMI
 JZ44WduDtFYznFjWSZuakd2e/zlI6ypIWu0CoE3hdrVIbCCgAqi7sbH46CQqSI8Hw/
 0KnMivzo+PHxTjYi2xW6nhiux3wZlfrX6Fsyy9BsBN4TTiLnM+ahYvYN/kR7PU5qnq
 Gvo6RcvGECspyVkeNxsxgiW+LU74kP3//TsVuPC4nqKL+28daELOF1SfeePNfLnMu4
 B537fUGk8K2EA==
From: Dmitry Baryshkov <lumag@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/7] drm/msm: make use of the HDMI connector
 infrastructure
Date: Fri,  7 Mar 2025 06:55:49 +0200
Message-Id: <174132327776.1133698.4430380274517103098.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250226-bridge-hdmi-connector-v8-0-340af24b35cc@linaro.org>
References: <20250226-bridge-hdmi-connector-v8-0-340af24b35cc@linaro.org>
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


On Wed, 26 Feb 2025 10:59:23 +0200, Dmitry Baryshkov wrote:
> This patchset sits on top Maxime's HDMI connector patchset ([1]).
> 
> Currently this is an RFC exploring the interface between HDMI bridges
> and HDMI connector code. This has been lightly verified on the Qualcomm
> DB820c, which has native HDMI output. If this approach is considered to
> be acceptable, I'll finish MSM HDMI bridge conversion (reworking the
> Audio Infoframe code). Other bridges can follow the same approach (we
> have lt9611 / lt9611uxc / adv7511 on Qualcomm hardware).
> 
> [...]

Applied, thanks!

[1/7] drm/msm/hdmi: switch to atomic bridge callbacks
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8ae7192e7a00
[2/7] drm/msm/hdmi: program HDMI timings during atomic_pre_enable
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d309bda67172
[3/7] drm/msm/hdmi: make use of the drm_connector_hdmi framework
      https://gitlab.freedesktop.org/lumag/msm/-/commit/384d2b03d0a1
[4/7] drm/msm/hdmi: get rid of hdmi_mode
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d840a2162112
[5/7] drm/msm/hdmi: update HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE definition
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e92573638792
[6/7] drm/msm/hdmi: also send the SPD and HDMI Vendor Specific InfoFrames
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d7d57ecfcf52
[7/7] drm/msm/hdmi: use DRM HDMI Audio framework
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ea54cfac0f8c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
