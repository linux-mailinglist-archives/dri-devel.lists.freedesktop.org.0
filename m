Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C0043DC27
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 09:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E5056E91F;
	Thu, 28 Oct 2021 07:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2F66E5C5;
 Thu, 28 Oct 2021 02:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635386516; x=1666922516;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=PumI7KYEnaLZedKWySsRxRR6/fjZlsD1mJD7/WiWdxk=;
 b=wQ19L+XCl/67TUm6cI1vbAGHm+Ao+OLFUELegU9UODSeSMAI3WS6ryTd
 wbeBNFtylxNzPEDuhuVHIFRamUu35dCLAExF6giilfOUCS1k/E4ATwHiT
 JNc2+zW3uAv3gsOKxOnonVC4DDQ4HvQarIp/nN/z8QxQzRo1qngelY51L g=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 27 Oct 2021 18:55:52 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 18:55:51 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Wed, 27 Oct 2021 18:55:51 -0700
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Wed, 27 Oct 2021 18:55:46 -0700
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: Sankeerth Billakanti <quic_sbillaka@quicinc.com>, <robdclark@gmail.com>,
 <seanpaul@chromium.org>, <swboyd@chromium.org>, <kalyan_t@codeaurora.org>,
 <abhinavk@codeaurora.org>, <dianders@chromium.org>, <khsieh@codeaurora.org>,
 <mkrishn@codeaurora.org>, <sbillaka@codeaurora.org>
Subject: [PATCH v3 6/6] drm/msm/dp: Remove the hpd init delay for eDP
Date: Thu, 28 Oct 2021 07:24:48 +0530
Message-ID: <1635386088-18089-7-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635386088-18089-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1635386088-18089-1-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Mailman-Approved-At: Thu, 28 Oct 2021 07:35:12 +0000
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

DP driver needs a 10 second delay before phy_init so that
the usb combo phy initializes and sets up the necessary
clocks for usb devices such as keyboard and mouse.

eDP controller uses a standalone phy and need not wait for
phy initialization from any other component. This change
will remove the delay for eDP controller.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 61385d6..de6a1fd 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1430,6 +1430,7 @@ void __exit msm_dp_unregister(void)
 void msm_dp_irq_postinstall(struct msm_dp *dp_display)
 {
 	struct dp_display_private *dp;
+	u8 delay;
 
 	if (!dp_display)
 		return;
@@ -1438,7 +1439,15 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
 
 	dp_hpd_event_setup(dp);
 
-	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
+	if (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP) {
+		/* eDP does not need any delay before phy init */
+		delay = 0;
+	} else {
+		/* DP needs 10 second delay to let usb combo phy initialize */
+		delay = 100;
+	}
+
+	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, delay);
 }
 
 void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
-- 
2.7.4

