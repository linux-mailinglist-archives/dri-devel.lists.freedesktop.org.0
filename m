Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899C44DD283
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 02:45:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0953B10E906;
	Fri, 18 Mar 2022 01:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD73110E906;
 Fri, 18 Mar 2022 01:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647567954; x=1679103954;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=4lwIXDcllDbw681TJdouVk9vZ5fCkgmpsQufhgHrZ3Q=;
 b=T6BurFi7D6ypntkpGotBmbIGEpdQjbAkJYlQIkvAQHphA+i4VLYOurB2
 DNIh1TkeGCGr5k96aLIif0GuP+LqdSIFUbvS54jOynPsXu0rj71sEzRCR
 sEAIZ4PCoMKaubDjnL/Kv6WrmZkPcBIsg/nG0XcyNYrPR7TZIBB54oGqP 4=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 17 Mar 2022 18:45:54 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 18:45:52 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 17 Mar 2022 18:45:52 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 17 Mar 2022 18:45:51 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 0/4] Allow drm_writeback_connector to accept pointer to
 drm_encoder
Date: Thu, 17 Mar 2022 18:45:32 -0700
Message-ID: <1647567936-11971-1-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: hamohammed.sa@gmail.com, suraj.kandpal@intel.com, emma@anholt.net,
 rodrigosiqueiramelo@gmail.com, jani.nikula@intel.com, liviu.dudau@arm.com,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, swboyd@chromium.org,
 melissa.srw@gmail.com, nganji@codeaurora.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, dmitry.baryshkov@linaro.org,
 james.qian.wang@arm.com, quic_aravindh@quicinc.com, mihail.atanassov@arm.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are some vendor drivers for which the writeback encoder shares
hardware resources such as clocks and interrupts with the rest of the
display pipeline. In addition, there can be use-cases where the
writeback encoder could be a shared encoder between the physical display
path and the writeback path.

To accommodate for such cases, change the drm_writeback_connector to
accept a pointer to drm_encoder.

For existing users of drm_writeback_connector there will not be any
change in functionality due to this change.

This approach was first posted by Suraj Kandpal here [1] for both
encoder and connector. But after discussions [2], the consensus was
reached to split this change for the drm_encoder first and the
drm_connector part can be reworked in a subsequent change later.

Validation of this change was done using igt_writeback tests on
MSM based RB5 board using the changes posted here [3].

For all other chipsets, these changes were compile-tested.

[1] https://patchwork.kernel.org/project/dri-devel/patch/20220202081702.22119-1-suraj.kandpal@intel.com/
[2] https://patchwork.kernel.org/project/dri-devel/patch/20220202085429.22261-6-suraj.kandpal@intel.com/
[3] https://patchwork.freedesktop.org/series/99724/

changes in v4:
		-  split the changes more according to functionality

Abhinav Kumar (4):
  drm: allow passing possible_crtcs to drm_writeback_connector_init()
  drm: allow real encoder to be passed for drm_writeback_connector
  drm: introduce drm_writeback_connector_init_with_encoder() API
  drm/vc4: change vc4 driver to use
    drm_writeback_connector_init_with_encoder()

 .../drm/arm/display/komeda/komeda_wb_connector.c   |   3 +-
 drivers/gpu/drm/arm/malidp_mw.c                    |   4 +-
 drivers/gpu/drm/drm_writeback.c                    | 143 +++++++++++++++------
 drivers/gpu/drm/rcar-du/rcar_du_writeback.c        |   4 +-
 drivers/gpu/drm/vc4/vc4_txp.c                      |  36 ++++--
 drivers/gpu/drm/vkms/vkms_writeback.c              |   4 +-
 include/drm/drm_writeback.h                        |  25 +++-
 7 files changed, 161 insertions(+), 58 deletions(-)

-- 
2.7.4

