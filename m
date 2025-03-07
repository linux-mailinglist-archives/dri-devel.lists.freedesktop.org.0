Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF78A560BC
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 07:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B072510EAEB;
	Fri,  7 Mar 2025 06:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gCjYjSpC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAD510E0A8;
 Fri,  7 Mar 2025 06:24:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 121D0A4544A;
 Fri,  7 Mar 2025 06:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04933C4CED1;
 Fri,  7 Mar 2025 06:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741328696;
 bh=OhnevS0yjPAh9IfYEi70Vj0NzmzZFYRG0Y6dMvvdbps=;
 h=From:Subject:Date:To:Cc:From;
 b=gCjYjSpCBRT24c26wKgBDWgcnZGUIBIKSWF7ZlQFkzehRRTsxIDCJdayC5eDUdyXr
 sR0p6eIh4P4bF8Oq1fhXs39sXDc34uI45LUR4+ktKEIlsU3XyuOA45JwTzipGBguE3
 N3z7rwLfRmmRZRPtLj8a8k/jejeNQCiSuPiAkHTCF0VmxYEdk7zW2/V5DxPt6R14hB
 51bYnL+9wXlhK+S2CrRmGl3LlGqJt7lYIpJCyse4nyy/diTR43WXGdVfCw6iZeCXzg
 dy270sgObU+vEiBHQkR0kBbXlZyQpYsxFilbbwDFXCJKnMM4QpHfvgyvTKK72uEA9j
 MFseUW4gwutEg==
From: Dmitry Baryshkov <lumag@kernel.org>
Subject: [PATCH v3 0/8] drm/msm/dpu: improve CTL handling on DPU >= 5.0
 platforms
Date: Fri, 07 Mar 2025 08:24:48 +0200
Message-Id: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADCRymcC/2XMSw6CMBSF4a2Qjq1py6t15D6Mg2t7gZsQIC02G
 sLeLcSBj+E5yf8tLKAnDOyULcxjpEDjkEZ+yJjtYGiRk0ubKaFKoYThbrpzsDNF5HbuudDWQuH
 0TWhgKZo8NvTYwcs17Y7CPPrn7ke5vW9KiV8qSi54LS1UNZRV0ehzTwP48Tj6lm1WVJ+9/utV6
 g0Y1yjEUpr8q1/X9QU+FoOx7QAAAA==
X-Change-ID: 20250209-dpu-active-ctl-08cca4d8b08a
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2793;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OhnevS0yjPAh9IfYEi70Vj0NzmzZFYRG0Y6dMvvdbps=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnypEzq6PX4jb0sw/7v51d+IYnAFNlX/ooVBZMo
 QxDD1ov8qCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8qRMwAKCRCLPIo+Aiko
 1X5EB/0VUG/MQqtatCn087kw0gnuje3o8i4wDbOrn2aUdX42nH0lwpnBkqJf3JWGv8QaR9YmzvS
 9iaFVIFlL6d5xqad+e6C/WkBoz45HSzClQGRomaVQ5KpFuV0FIHHEbLxVKMkkvW7myesC3Skzy5
 Yga6pCMm713rDjL5Gv/Eks1mkfZC2Zb3MMY33ZmWcHnDrXt/4eBwZQ6FxSkaX4cYBrAXr0GhHoE
 QBLgtC6nkbTUC1BdA6GvituMDVLBDRrC7g1FNzwJ3JIlcZPGsn7PXXfU9kQFfiJWgmUoJgVQsXx
 GS+elem72JzaVcC2jzEkvRbfQziRavJ94Ad/zCuHWljmYpNH
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

Since version 5.0 the DPU got an improved way of handling multi-output
configurations. It is now possible to program all pending changes
through a single CTL and flush everything at the same time.

Implement corresponding changes in the DPU driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Rebased on top of msm-next
- Link to v2: https://lore.kernel.org/r/20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org

Changes in v2:
- Made CTL_MERGE_3D_ACTIVE writes unconditional (Marijn)
- Added CTL_INTF_MASTER clearing in dpu_hw_ctl_reset_intf_cfg_v1
  (Marijn)
- Added a patch to drop extra rm->has_legacy_ctls condition (and an
  explanation why it can not be folded in an earlier patch).
- Link to v1: https://lore.kernel.org/r/20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org

---
Dmitry Baryshkov (8):
      drm/msm/dpu: don't overwrite CTL_MERGE_3D_ACTIVE register
      drm/msm/dpu: program master INTF value
      drm/msm/dpu: pass master interface to CTL configuration
      drm/msm/dpu: use single CTL if it is the only CTL returned by RM
      drm/msm/dpu: don't select single flush for active CTL blocks
      drm/msm/dpu: allocate single CTL for DPU >= 5.0
      drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from CTL blocks on DPU >= 5.0
      drm/msm/dpu: drop now-unused condition for has_legacy_ctls

 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  5 ++---
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  5 ++---
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  5 ++---
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  5 ++---
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  6 +++++-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  2 ++
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         | 20 ++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 25 +++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  2 ++
 18 files changed, 67 insertions(+), 48 deletions(-)
---
base-commit: 565351ae7e0cee80e9b5ed84452a5b13644ffc4d
change-id: 20250209-dpu-active-ctl-08cca4d8b08a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

