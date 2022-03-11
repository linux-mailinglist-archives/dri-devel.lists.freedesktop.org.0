Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC93A4D578D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 02:50:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C9E10E64A;
	Fri, 11 Mar 2022 01:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CAC10E64A;
 Fri, 11 Mar 2022 01:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646963427; x=1678499427;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=iGaeeqylRqa/f/7RrzRu3D33XcDMtkPv0NM1hrGJLE4=;
 b=P4ijFK3zfKlS3xrX9nk9k1rQHD2m+UKyp2DYm8fUg+O1Ha2jGOsX2li9
 cfQgn3mWwKJrDHMdDPtbmJYL7820tdAobZJkunJDxl95baaa1DIhLZeIK
 SYOW+OzE/Ga9K26A/heEuxM06CdfCron6qwmGvBpqj14oLOnci5wY6bWZ 4=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 10 Mar 2022 17:50:27 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 17:50:26 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 10 Mar 2022 17:50:25 -0800
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 10 Mar 2022 17:50:25 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/6] drm: allow real encoder to be passed for
 drm_writeback_connector
Date: Thu, 10 Mar 2022 17:49:55 -0800
Message-ID: <1646963400-25606-2-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646963400-25606-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1646963400-25606-1-git-send-email-quic_abhinavk@quicinc.com>
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

For some vendor driver implementations, display hardware can
be shared between the encoder used for writeback and the physical
display.

In addition resources such as clocks and interrupts can
also be shared between writeback and the real encoder.

To accommodate such vendor drivers and hardware, allow
real encoder to be passed for drm_writeback_connector.

Co-developed-by: Kandpal Suraj <suraj.kandpal@intel.com>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/drm_writeback.c |  8 ++++----
 include/drm/drm_writeback.h     | 13 +++++++++++--
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index dccf4504..4dad687 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -189,8 +189,8 @@ int drm_writeback_connector_init(struct drm_device *dev,
 	if (IS_ERR(blob))
 		return PTR_ERR(blob);
 
-	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
-	ret = drm_encoder_init(dev, &wb_connector->encoder,
+	drm_encoder_helper_add(wb_connector->encoder, enc_helper_funcs);
+	ret = drm_encoder_init(dev, wb_connector->encoder,
 			       &drm_writeback_encoder_funcs,
 			       DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret)
@@ -204,7 +204,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
 		goto connector_fail;
 
 	ret = drm_connector_attach_encoder(connector,
-						&wb_connector->encoder);
+						wb_connector->encoder);
 	if (ret)
 		goto attach_fail;
 
@@ -233,7 +233,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
 attach_fail:
 	drm_connector_cleanup(connector);
 connector_fail:
-	drm_encoder_cleanup(&wb_connector->encoder);
+	drm_encoder_cleanup(wb_connector->encoder);
 fail:
 	drm_property_blob_put(blob);
 	return ret;
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index 9697d27..0ba266e 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -25,13 +25,22 @@ struct drm_writeback_connector {
 	struct drm_connector base;
 
 	/**
-	 * @encoder: Internal encoder used by the connector to fulfill
+	 * @encoder: handle to drm_encoder used by the connector to fulfill
 	 * the DRM framework requirements. The users of the
 	 * @drm_writeback_connector control the behaviour of the @encoder
 	 * by passing the @enc_funcs parameter to drm_writeback_connector_init()
 	 * function.
+	 *
+	 * For some vendor drivers, the hardware resources are shared between
+	 * writeback encoder and rest of the display pipeline.
+	 * To accommodate such cases, encoder is a handle to the real encoder
+	 * hardware.
+	 *
+	 * For current existing writeback users, this shall continue to be the
+	 * embedded encoder for the writeback connector.
+	 *
 	 */
-	struct drm_encoder encoder;
+	struct drm_encoder *encoder;
 
 	/**
 	 * @pixel_formats_blob_ptr:
-- 
2.7.4

