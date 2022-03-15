Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA444DA610
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 00:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48D510E0E3;
	Tue, 15 Mar 2022 23:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354BF89E0E;
 Tue, 15 Mar 2022 23:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647385938; x=1678921938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=XJo5JY+wuDbb68e+2PYQdKVdYIkB/5QskW20YtThOFk=;
 b=hWhpsgJiyyG99ozlzwppVbiYcNfYxXBo0pr9TFlIaGmWIqUPI19BzFrR
 HB5aR/6fFYPW2PgT0IDLVsCUfsi2eF4OdRv1YeCjQJZXHkWirv5gvrueW
 buyle3wdXyY95axhjnhEHiwV5+mrIBlRC1n4YnB1vUQM1km6Li8T2l9vy A=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Mar 2022 16:12:18 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 16:12:17 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Mar 2022 16:12:17 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 15 Mar 2022 16:12:16 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 2/6] drm/komeda: pass possible_crtcs as parameter for
 drm_writeback_connector
Date: Tue, 15 Mar 2022 16:11:58 -0700
Message-ID: <1647385922-31539-3-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1647385922-31539-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1647385922-31539-1-git-send-email-quic_abhinavk@quicinc.com>
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

As part of this series, drm_writeback_connector_init() allows
passing possible_crtcs as a parameter so that the API can
internally create and setup the encoder.

Pass possible_crtcs parameter for drm_writeback_connector_init()
for komeda driver.

changes in v2:
   - pass possible_crtcs parameter for drm_writeback_connector_init()

Co-developed-by: Kandpal Suraj <suraj.kandpal@intel.com>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
index e465cc4..40774e6 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
@@ -155,7 +155,6 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 	kwb_conn->wb_layer = kcrtc->master->wb_layer;
 
 	wb_conn = &kwb_conn->base;
-	wb_conn->encoder.possible_crtcs = BIT(drm_crtc_index(&kcrtc->base));
 
 	formats = komeda_get_layer_fourcc_list(&mdev->fmt_tbl,
 					       kwb_conn->wb_layer->layer_type,
@@ -164,7 +163,7 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 	err = drm_writeback_connector_init(&kms->base, wb_conn,
 					   &komeda_wb_connector_funcs,
 					   &komeda_wb_encoder_helper_funcs,
-					   formats, n_formats);
+					   formats, n_formats, BIT(drm_crtc_index(&kcrtc->base)));
 	komeda_put_fourcc_list(formats);
 	if (err) {
 		kfree(kwb_conn);
-- 
2.7.4

