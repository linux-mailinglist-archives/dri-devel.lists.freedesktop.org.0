Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2184F34DF
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 15:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5567A10E6C2;
	Tue,  5 Apr 2022 13:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5059910E6C2;
 Tue,  5 Apr 2022 13:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649166109; x=1680702109;
 h=from:to:cc:subject:date:message-id;
 bh=n/LaXP9MDFd1wNqtjihKRMVq+Y8jFqhWp4guYXGha6E=;
 b=iZxEug3AHTeWe1TkuVuON+D+vg/wfImcPOrEmzUUdZbX3ZVmMBu4dXr+
 tKkERh0VtZmEg8fi7tR1XcfjTB+ubLsZZGNbfJVNP99nnYKmRaqpzcZw9
 74GFQ0wQqWCTfNjh/I6RopioX42ugZOsmNwD4iu4IPvDEYgzjRXn2nvL0 s=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 05 Apr 2022 06:41:49 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 05 Apr 2022 06:41:47 -0700
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg02-blr.qualcomm.com with ESMTP; 05 Apr 2022 19:11:34 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id 94F25551E; Tue,  5 Apr 2022 19:11:33 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v7 0/2] Add inline rotation support for sc7280
Date: Tue,  5 Apr 2022 19:11:29 +0530
Message-Id: <1649166091-18032-1-git-send-email-quic_vpolimer@quicinc.com>
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

Co-developed-by: Kalyan Thota <quic_kalyant@quicinc.com>
Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Vinod Polimera (2):
  drm/msm/disp/dpu1: add inline function to validate format support
  drm/msm/disp/dpu1: add inline rotation support for sc7280

 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h    |  22 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 173 +++++++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  16 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 139 +++++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |   2 +
 5 files changed, 251 insertions(+), 101 deletions(-)

-- 
2.7.4

