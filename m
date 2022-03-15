Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A174DA60D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 00:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5089389DED;
	Tue, 15 Mar 2022 23:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92ADD89DE5;
 Tue, 15 Mar 2022 23:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647385935; x=1678921935;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=ITeC/LzfRWxHy9wC8pIqhLWQaZlZnQky9am5zgdEzOc=;
 b=bRem/Ah9IN+Kf7KIQ3JUbr5bVNSo0E2CsYbrerVr61UeqSYACS8odKCt
 VBRvmcr0McTKUQcIkuQUL78gHfTqUXvnnJRrFRL6okZJiPi6zevBhfGEw
 SiqBbnKegFVC63CZugUrIKBjV4sD7vmHujSrdXhOJWeAvBqEPhnLmgQbA c=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 15 Mar 2022 16:12:14 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 16:12:13 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Mar 2022 16:12:12 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 15 Mar 2022 16:12:11 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 0/6] Allow drm_writeback_connector to accept pointer to
 drm_encoder
Date: Tue, 15 Mar 2022 16:11:56 -0700
Message-ID: <1647385922-31539-1-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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

changes in v2:
    - introduce a new API drm_writeback_connector_init_with_encoder()
    - allow passing possible_crtcs for existing users of
      drm_writeback_connector_init()

Abhinav Kumar (6):
  drm: allow real encoder to be passed for drm_writeback_connector
  drm/komeda: pass possible_crtcs as parameter for
    drm_writeback_connector
  drm/vkms: pass possible_crtcs as parameter for drm_writeback_connector
  drm/vc4: change vc4 driver to use
    drm_writeback_connector_init_with_encoder()
  drm/rcar_du: pass possible_crtcs as parameter for
    drm_writeback_connector
  drm/malidp: pass possible_crtcs as parameter for
    drm_writeback_connector

 .../drm/arm/display/komeda/komeda_wb_connector.c   |   3 +-
 drivers/gpu/drm/arm/malidp_mw.c                    |   5 +-
 drivers/gpu/drm/drm_writeback.c                    | 144 +++++++++++++++------
 drivers/gpu/drm/rcar-du/rcar_du_writeback.c        |   5 +-
 drivers/gpu/drm/vc4/vc4_txp.c                      |  30 ++++-
 drivers/gpu/drm/vkms/vkms_writeback.c              |   3 +-
 include/drm/drm_writeback.h                        |  27 +++-
 7 files changed, 161 insertions(+), 56 deletions(-)

-- 
2.7.4

