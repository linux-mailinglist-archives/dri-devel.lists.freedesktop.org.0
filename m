Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4724FC288
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 18:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B175010EAF0;
	Mon, 11 Apr 2022 16:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F07410E5B3;
 Mon, 11 Apr 2022 16:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649695039; x=1681231039;
 h=from:to:cc:subject:date:message-id;
 bh=mtE2O+IGOhI4fPN3hDjLHvmi5++/ZnWEsB0kf034Y9I=;
 b=LSh62J8jXJldwdnVXs3z+EkBiZrkapSELJXcaBNjNlzhukwYKuuGtWJZ
 dXzjTWrhC5xMtZBWl+b763iVCOMs9O1ooKCOzgTnfM502zVVc9lGLNECv
 7Z2SS+2G4QYtWSlmOPiWv+cMctP5/e7nG4ttl//O85ZOzHYN6WNFhMyAo 8=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 11 Apr 2022 09:37:18 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 11 Apr 2022 09:37:16 -0700
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg02-blr.qualcomm.com with ESMTP; 11 Apr 2022 22:07:04 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id 75AC655E9; Mon, 11 Apr 2022 22:07:03 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v8 0/2] Add inline rotation support for sc7280 
Date: Mon, 11 Apr 2022 22:06:59 +0530
Message-Id: <1649695021-19132-1-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes in RFC:
- Rebase changes to the latest code base.
- Append rotation config variables with v2 and
remove unused variables.(Dmitry)
- Move pixel_ext setup separately from scaler3 config.(Dmitry)
- Add 270 degree rotation to supported rotation list.(Dmitry)

Changes in V2:
- Remove unused macros and fix indentation.
- Add check if 90 rotation is supported and
add supported rotations to rot_cfg.

Changes in V3:
- Fix indentation.
- Move rot_supported to sspp capabilities. (Dmitry)
- Config pixel_ext based on src_h/src_w directly. (Dmitry)
- Misc changes.

Changes in V4:
- Pass boolean value to sspp blk based on supported rotations for each hw.

Changes in V5:
- Update boolean value to true/false and add it for qcm2290.

Changes in V6:
- Add changes that are missed as part of v5.
- Add dpu_find_format inline function to find valid format. (Dmitry)

Changes in V7:
- Move dpu_find_format inline function to separate commit. (Dmitry)
- Remove rot_cfg from SSPP_BLK and use DPU_SSPP_INLINE_ROTATION caps
to append supported rotations. (Dmitry)
- Misc Changes.

Changes in V8:
- Misc changes.

Co-developed-by: Kalyan Thota <quic_kalyant@quicinc.com>
Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Vinod Polimera (2):
  drm/msm/disp/dpu1: add inline function to validate format support
  drm/msm/disp/dpu1: add inline rotation support for sc7280

 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h    |  22 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  43 +++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  16 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 139 +++++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |   2 +
 5 files changed, 186 insertions(+), 36 deletions(-)

-- 
2.7.4

