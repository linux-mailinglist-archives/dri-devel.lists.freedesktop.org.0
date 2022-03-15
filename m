Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1F04DA617
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 00:12:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D32F10E435;
	Tue, 15 Mar 2022 23:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B514610E423;
 Tue, 15 Mar 2022 23:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647385943; x=1678921943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=YdPxezJ2FNwYHT/nd/yrYxh3Bgg1JfK0RS5ajq6s29E=;
 b=pEN11c5a73uobzHFFQEUPl34oyTsSeT16+CJ3ebyv45F1+zSjWpAtKYI
 ceCR7uqX9b79Cd5wkJJCX2X4X0wQKDWjMjVnWwmynZG2wZRNk5HIXPHx1
 VBDOx36iW7tguaGErTsFK6nzOTUvVXAo8IdrCsM9fazm7ZK+1WY5McdLg Y=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 15 Mar 2022 16:12:23 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 16:12:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Mar 2022 16:12:22 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 15 Mar 2022 16:12:21 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 6/6] drm/malidp: pass possible_crtcs as parameter for
 drm_writeback_connector
Date: Tue, 15 Mar 2022 16:12:02 -0700
Message-ID: <1647385922-31539-7-git-send-email-quic_abhinavk@quicinc.com>
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
for malidp writeback driver.

changes in v2:
      - pass possible_crtcs parameter for drm_writeback_connector_init()

Co-developed-by: Kandpal Suraj <suraj.kandpal@intel.com>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/arm/malidp_mw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index f5847a7..b882066 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -208,11 +208,12 @@ int malidp_mw_connector_init(struct drm_device *drm)
 	struct malidp_drm *malidp = drm->dev_private;
 	u32 *formats;
 	int ret, n_formats;
+	uint32_t possible_crtcs;
 
 	if (!malidp->dev->hw->enable_memwrite)
 		return 0;
 
-	malidp->mw_connector.encoder.possible_crtcs = 1 << drm_crtc_index(&malidp->crtc);
+	possible_crtcs = 1 << drm_crtc_index(&malidp->crtc);
 	drm_connector_helper_add(&malidp->mw_connector.base,
 				 &malidp_mw_connector_helper_funcs);
 
@@ -223,7 +224,7 @@ int malidp_mw_connector_init(struct drm_device *drm)
 	ret = drm_writeback_connector_init(drm, &malidp->mw_connector,
 					   &malidp_mw_connector_funcs,
 					   &malidp_mw_encoder_helper_funcs,
-					   formats, n_formats);
+					   formats, n_formats, possible_crtcs);
 	kfree(formats);
 	if (ret)
 		return ret;
-- 
2.7.4

