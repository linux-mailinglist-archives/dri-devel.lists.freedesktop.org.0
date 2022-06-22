Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DF2555227
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 19:18:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61CE810F3BF;
	Wed, 22 Jun 2022 17:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C2A10F3BF;
 Wed, 22 Jun 2022 17:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655918326; x=1687454326;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MCltD1GuiNBiuU855fvJPvYWGHrZTUCn4ItFS1w1tCA=;
 b=EzTa0lFB7YIIB9JC4/LaXTmGDpHZWNgtEmXLWJyn3iI2LmYkofJ9/KFD
 RvVoYTKetP4XzwVbdHwq9PEdMLahNIU2smfNxws3nzBiM3ydlA7YB3Jo9
 2Hsbz6g+GGfafMIfIjGQlJ8hJj6OfI54MTsclZfFCKpirJOR0TOmkDX9x Y=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 22 Jun 2022 10:18:46 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 10:18:46 -0700
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 22 Jun 2022 10:18:45 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v4 0/4] Expand CRC to support interface blocks
Date: Wed, 22 Jun 2022 10:18:31 -0700
Message-ID: <20220622171835.7558-1-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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

Changes since V2:
- Separate dpu_hw_util changes into a separate patch
- Revert back to using a static array and define a macro for MAX_CRC_ENTRIES

Changes since V3:
- Move crcs array into block-specific get_crc helper methods
- Rename "enc" source string to "encoder"

Jessica Zhang (4):
  drm/msm/dpu: Move LM CRC code into separate method
  drm/msm/dpu: Move MISR methods to dpu_hw_util
  drm/msm/dpu: Add MISR register support for interface
  drm/msm/dpu: Add interface support for CRC debugfs

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 111 +++++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |   5 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  64 +++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  22 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  19 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |  42 +-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c |  49 ++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  16 +++
 9 files changed, 269 insertions(+), 67 deletions(-)

-- 
2.35.1

