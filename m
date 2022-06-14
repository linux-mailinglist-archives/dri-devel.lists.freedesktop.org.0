Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1491454BC99
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 23:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EADE112F3F;
	Tue, 14 Jun 2022 21:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89A5112F38;
 Tue, 14 Jun 2022 21:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655241230; x=1686777230;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D30YOo59Lolu2XreNR4NFOlhIsldQjJgePvQV7/JBi8=;
 b=JK8E3w5bCvUhSpZmzKxosZVYN/eLe5uzqmXpA9JEis58un0hzVg8Ri9U
 T4PPxSRD/7TQm5AHQEzDRBeKY69YuxhlIohWVPshiv+FBX7r3UkDDshmj
 YKqa3Rp3BhVo9XBWF1ly/sjI4z1dgiQmWtezQ2ByNfEKTTTAZeqx0TLr9 s=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Jun 2022 14:13:50 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 14:13:50 -0700
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 14 Jun 2022 14:13:49 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v2 0/3] Expand CRC to support interface blocks
Date: Tue, 14 Jun 2022 14:13:25 -0700
Message-ID: <20220614211328.216-1-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Refactor existing CRC code for layer mixer and add CRC support for interface blocks

Changes since V1:
- Create helper methods for collect_misr and setup_misr in dpu_hw_util.c
- Move common bitmasks into dpu_hw_util.h
- Update copyrights
- Create a dynamically allocated crcs array in dpu_crtc_state
- Collect CRCs for all drm_encoders connected to the crtc

Jessica Zhang (3):
  drm/msm/dpu: Move LM CRC code into separate method
  drm/msm/dpu: Add MISR register support for interface
  drm/msm/dpu: Add interface support for CRC debugfs

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 131 +++++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |   7 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  63 ++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  22 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  19 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |  42 +------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c |  46 ++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  16 +++
 9 files changed, 279 insertions(+), 75 deletions(-)

-- 
2.35.1

