Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8247B4AED5B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 09:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24AC310E61A;
	Wed,  9 Feb 2022 08:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A3F10E61A;
 Wed,  9 Feb 2022 08:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644396976; x=1675932976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=7uuMRIDyHWtBbMVy5anPlSxVR+2/pPBwu/N/1DkHSCQ=;
 b=MXGfrgRiiYW4DqToixMBZ1UhI9mwAUKHER3ROuMCEdFWE486huKmk+cu
 oBzrn7OfaNWI2zVVXsyuyiSGFiwlppOUX6VoiZE4xDoF/pFsK4NgpoV7E
 9m/Vztrwvmy558BpDfVFzwAQGUAActkM3waf80VAmWjKHVvu5QbjPqvph 0=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 09 Feb 2022 00:56:15 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 00:56:15 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 9 Feb 2022 00:56:14 -0800
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 9 Feb 2022 00:56:08 -0800
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <agross@kernel.org>,
 <bjorn.andersson@linaro.org>, <robh+dt@kernel.org>, <robdclark@gmail.com>,
 <seanpaul@chromium.org>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <krzysztof.kozlowski@canonical.com>, <thierry.reding@gmail.com>,
 <sam@ravnborg.org>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v3 3/4] drm/panel-edp: Add eDP sharp panel support
Date: Wed, 9 Feb 2022 14:25:31 +0530
Message-ID: <1644396932-17932-4-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644396932-17932-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1644396932-17932-1-git-send-email-quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 quic_vproddut@quicinc.com, quic_abhinavk@quicinc.com, quic_khsieh@quicinc.com,
 quic_mkrishn@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the 14" sharp,lq140m1jw46 eDP panel.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
---

Changes in v3:
  None

 drivers/gpu/drm/panel/panel-edp.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index a394a15..5d13ccc 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1605,6 +1605,34 @@ static const struct panel_desc sharp_lq123p1jx31 = {
 	},
 };
 
+static const struct drm_display_mode sharp_lq140m1jw46_mode = {
+	.clock = 144370,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 48,
+	.hsync_end = 1920 + 48 + 32,
+	.htotal = 1920 + 48 + 32 + 80,
+	.vdisplay = 1080,
+	.vsync_start = 1080 + 3,
+	.vsync_end = 1080 + 3 + 5,
+	.vtotal = 1080 + 3 + 5 + 69,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc sharp_lq140m1jw46 = {
+	.modes = &sharp_lq140m1jw46_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 309,
+		.height = 174,
+	},
+	.delay = {
+		.hpd_absent = 80,
+		.enable = 50,
+		.unprepare = 500,
+	},
+};
+
 static const struct drm_display_mode starry_kr122ea0sra_mode = {
 	.clock = 147000,
 	.hdisplay = 1920,
@@ -1719,6 +1747,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "sharp,lq123p1jx31",
 		.data = &sharp_lq123p1jx31,
 	}, {
+		.compatible = "sharp,lq140m1jw46",
+		.data = &sharp_lq140m1jw46,
+	}, {
 		.compatible = "starry,kr122ea0sra",
 		.data = &starry_kr122ea0sra,
 	}, {
-- 
2.7.4

