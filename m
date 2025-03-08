Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0809AA57883
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 06:38:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C792810E02B;
	Sat,  8 Mar 2025 05:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ipgi055W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DED10E02B;
 Sat,  8 Mar 2025 05:38:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 59EE0A45400;
 Sat,  8 Mar 2025 05:33:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A50C4CEE0;
 Sat,  8 Mar 2025 05:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741412310;
 bh=Y64VWnB0mpfc4K99JO0fOYXs+4MSOcIJZ9h7nUvXgt8=;
 h=From:Subject:Date:To:Cc:From;
 b=Ipgi055WQ3+1L2ANYsq8rdw3ifpQvLiEV/d0vj6Yd4hGyKwU2jOhSWMeCEDKezVPq
 J36qdcumrNp8sdMQWWsxZi4uQ+MJHs28/oxoByYxS/0+0FfkApppFabDfudTowYa6/
 B0ymK7OCEcUQcHYQhdXPHFKDiET8ptyE81wSYwqRBUWmJwuKaQedBhvvEDnkRuISq6
 LTljdknxfPQrVfR/ULCPLmvpuhRoAzSE5WH+emZZP6RVz9tOojO9TwJ/RrDBjIc2hD
 hoCB8IosQNsy3VPSqs3jot6X/snzUS9lK2wKqdQ5diwLNpErP5HLFQFRY/k0TQEehO
 uCy3TDvsJ3fMQ==
From: Dmitry Baryshkov <lumag@kernel.org>
Subject: [PATCH 0/5] drm/msm/dpu: update SmartDMA feature masks
Date: Sat, 08 Mar 2025 07:38:23 +0200
Message-Id: <20250308-dpu-rework-vig-masks-v1-0-f1b5d101ae0b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANDXy2cC/yXMQQqDMBCF4auEWXdoqi0Ur1JcxGRiB0liJ9EK4
 t0b6vJ/8L4dMglThk7tILRy5hRr3C4K7NvEkZBdbWh089CtfqKbFxT6Jplw5RGDyVNG68hrf/f
 tQBbqdRbyvP3ZV3+20GepejlHGEwmtCkELp2KtJVrlQoJ9MfxA29iqJyVAAAA
X-Change-ID: 20250308-dpu-rework-vig-masks-cdef0f4f3bec
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1847;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Y64VWnB0mpfc4K99JO0fOYXs+4MSOcIJZ9h7nUvXgt8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBny9fSzLS6V5lAxOaAWiiUkRHKz+vOXPQxadv46
 mCk8JPM7XuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8vX0gAKCRCLPIo+Aiko
 1W85B/96lqDIyD65wMNdHFxvwIkz55JCESTJlUI9Cme72XWzHZvxpwDCca9wJuVgZwxPyjOwqiV
 6QVfbk4TV8Rj6FCEQz8cBVR+6nXMKBJbuJLft9/fGim1z9J1u4URQq8mLERHBzN1RYy7sx/CAGw
 BVQzjtRmjU/hGFqLbQU0WVcE46EKUy3Oa5fThlCJsIyg3ZUr8c1vSVgly94zQrKUblkZnyjogJP
 5bochxj8u3U02P8D46V1H7j355Ew3tZ2AvsMrfO8LLsMWzx8ULFhiS9ORk9qI5LnuYo/X8TlwZV
 R4uh3LKmjNKzbrfkPeR8GjG2dELjkFIXKgvSDOFrMIQHWvai
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

It is easy to skip or ignore the fact that the default SSPP feature
masks for SDM845+ don't include the SmartDMA bit (both during
development and during the review stage).

Enable SmartDMA on SC8180X, SC8280XP, SM8150 and SM8550. Then rename
SSPP feature masks to make it more explicit that using non-SmartDMA
masks should not be an exception rather than the rule.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Abhinav Kumar (2):
      drm/msm/dpu: enable SmartDMA on SC8280XP
      drm/msm/dpu: enable SmartDMA on SM8550

Dmitry Baryshkov (3):
      drm/msm/dpu: enable SmartDMA on SM8150
      drm/msm/dpu: enable SmartDMA on SC8180X
      drm/msm/dpu: rename non-SmartDMA feature masks to be more explicit

 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 16 ++++++++--------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 16 ++++++++--------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 10 +++++-----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   |  6 +++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 16 ++++++++--------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 20 ++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c       | 16 ++++++++--------
 12 files changed, 63 insertions(+), 63 deletions(-)
---
base-commit: 0a2f889128969dab41861b6e40111aa03dc57014
change-id: 20250308-dpu-rework-vig-masks-cdef0f4f3bec

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

