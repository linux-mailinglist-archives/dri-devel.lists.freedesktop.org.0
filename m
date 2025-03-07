Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D6AA55FA2
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 05:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B91810E271;
	Fri,  7 Mar 2025 04:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ULo03jYg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A8B10E271;
 Fri,  7 Mar 2025 04:56:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 858175C3A5A;
 Fri,  7 Mar 2025 04:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A0EC4CEE2;
 Fri,  7 Mar 2025 04:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741323362;
 bh=XWXNbvIxximv5SHxdHtGkkmkTEQ52Z6C89taO57X5vg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ULo03jYgTl/A7Sx10Lga84AvKwy1O12N+xCjWJyIPIArQaZa5HBodckhx42j5xwIr
 6AoZldOCszwDEgq1EMj6SJKsz70+HZmADYyW7vbcd8RHYp4Fz8FozS0bKTgUnU5NmP
 LGOxjePjhQvnjV598JHP/+GZ27VSh8VBWFFwqKiJWvKgaNOjcGCWT6sEJJiVJ/uFOI
 Q32kIV+6yErdgDDa8ZglQJvyk25+3yd5M5k+jaWRDibXba4DJhPcp/3XuuZVQGDvj2
 0la0QWB+sfqL3gddVr9NgVGCIkemlp+3zyeTv4adp1eFo/pJ0iPtCVyH/RLlDnv/Z6
 YIAtiLLFZN4Gg==
From: Dmitry Baryshkov <lumag@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Archit Taneja <architt@codeaurora.org>,
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v2 0/4] drm/msm/dpu: follow rules for
 drm_atomic_helper_check_modeset()
Date: Fri,  7 Mar 2025 06:55:46 +0200
Message-Id: <174132327775.1133698.7325717045129206986.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org>
References: <20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org>
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


On Thu, 23 Jan 2025 14:43:32 +0200, Dmitry Baryshkov wrote:
> As pointed out by Simona, the drm_atomic_helper_check_modeset() and
> drm_atomic_helper_check() require the former function is rerun if the
> driver's callbacks modify crtc_state->mode_changed. MSM is one of the
> drivers which failed to follow this requirement.
> 
> Rework the MSM / DPU driver to follow the requirements of the
> drm_atomic_helper_check_modeset() helper function.
> 
> [...]

Applied, thanks!

[1/4] drm/msm/dpu: don't use active in atomic_check()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/25b4614843bc
[2/4] drm/msm/dpu: move needs_cdm setting to dpu_encoder_get_topology()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7d39f5bb82c0
[3/4] drm/msm/dpu: simplify dpu_encoder_get_topology() interface
      https://gitlab.freedesktop.org/lumag/msm/-/commit/41921f231abf
[4/4] drm/msm/dpu: don't set crtc_state->mode_changed from atomic_check()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2dde2aadaed1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
