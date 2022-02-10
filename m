Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8914B0CF2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 12:58:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106B810E826;
	Thu, 10 Feb 2022 11:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9202910E82E;
 Thu, 10 Feb 2022 11:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644494307; x=1676030307;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=byGm30trr+ftjZSNJVDV3jvraOo2jtOVZ2ftABvtjI4=;
 b=YoBMGl6x47zp/0EvRzflwa31YDPUE8+fOscM3cCu0RPDKcHvZVm1h4l2
 6wppzSzV6F6x+UiYee8+VBCWCV8jzfx3viGCMaji9z5M43ti55ZFEFdnI
 7RQvRxxFqJwUjyNbhrsIihTFiwl2pKVaucu6Oyny925Mawgy8nKNXxZ9N 4=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 10 Feb 2022 03:58:27 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 03:58:26 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 10 Feb 2022 03:58:26 -0800
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 10 Feb 2022 03:58:19 -0800
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <agross@kernel.org>,
 <bjorn.andersson@linaro.org>, <robh+dt@kernel.org>, <robdclark@gmail.com>,
 <seanpaul@chromium.org>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <krzysztof.kozlowski@canonical.com>, <thierry.reding@gmail.com>,
 <sam@ravnborg.org>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v4 4/5] drm/panel-edp: Add eDP sharp panel support
Date: Thu, 10 Feb 2022 17:27:34 +0530
Message-ID: <1644494255-6632-5-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644494255-6632-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1644494255-6632-1-git-send-email-quic_sbillaka@quicinc.com>
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
00 ff ff ff ff ff ff 00 4d 10 23 15 00 00 00 00
35 1e 01 04 a5 1f 11 78 07 de 50 a3 54 4c 99 26
0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 5a 87 80 a0 70 38 4d 40 30 20
35 00 35 ae 10 00 00 18 65 38 80 a0 70 38 4d 40
30 20 35 00 35 ae 10 00 00 18 00 00 00 fd 00 30
90 a7 a7 23 01 00 00 00 00 00 00 00 00 00 00 fc
00 4c 51 31 34 30 4d 31 4a 57 34 39 0a 20 00 77

----------------

Block 0, Base EDID:
  EDID Structure Version & Revision: 1.4
  Vendor & Product Identification:
    Manufacturer: SHP
    Model: 5411
    Made in: week 53 of 2020
  Basic Display Parameters & Features:
    Digital display
    Bits per primary color channel: 8
    DisplayPort interface
    Maximum image size: 31 cm x 17 cm
    Gamma: 2.20
    Supported color formats: RGB 4:4:4
    Default (sRGB) color space is primary color space
    First detailed timing includes the native pixel format and preferred refresh rate
    Display is continuous frequency
  Color Characteristics:
    Red  : 0.6396, 0.3291
    Green: 0.2998, 0.5996
    Blue : 0.1494, 0.0595
    White: 0.3125, 0.3281
  Established Timings I & II: none
  Standard Timings: none
  Detailed Timing Descriptors:
    DTD 1:  1920x1080  143.981 Hz  16:9   166.587 kHz  346.500 MHz (309 mm x 174 mm)
                 Hfront   48 Hsync  32 Hback  80 Hpol N
                 Vfront    3 Vsync   5 Vback  69 Vpol N
    DTD 2:  1920x1080   59.990 Hz  16:9    69.409 kHz  144.370 MHz (309 mm x 174 mm)
                 Hfront   48 Hsync  32 Hback  80 Hpol N
                 Vfront    3 Vsync   5 Vback  69 Vpol N
  Display Range Limits:
    Monitor ranges (Bare Limits): 48-144 Hz V, 167-167 kHz H, max dotclock 350 MHz
    Display Product Name: 'LQ140M1JW49'
Checksum: 0x77

Changes in v4:
  -Add all modes from EDID
  -Provide EDID blob

Changes in v3:
  None

 drivers/gpu/drm/panel/panel-edp.c | 44 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index a394a15..f9355b2 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1605,6 +1605,47 @@ static const struct panel_desc sharp_lq123p1jx31 = {
 	},
 };
 
+static const struct drm_display_mode sharp_lq140m1jw46_mode[] = {
+	{
+		.clock = 346500,
+		.hdisplay = 1920,
+		.hsync_start = 1920 + 48,
+		.hsync_end = 1920 + 48 + 32,
+		.htotal = 1920 + 48 + 32 + 80,
+		.vdisplay = 1080,
+		.vsync_start = 1080 + 3,
+		.vsync_end = 1080 + 3 + 5,
+		.vtotal = 1080 + 3 + 5 + 69,
+		.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+	}, {
+		.clock = 144370,
+		.hdisplay = 1920,
+		.hsync_start = 1920 + 48,
+		.hsync_end = 1920 + 48 + 32,
+		.htotal = 1920 + 48 + 32 + 80,
+		.vdisplay = 1080,
+		.vsync_start = 1080 + 3,
+		.vsync_end = 1080 + 3 + 5,
+		.vtotal = 1080 + 3 + 5 + 69,
+		.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+	},
+};
+
+static const struct panel_desc sharp_lq140m1jw46 = {
+	.modes = sharp_lq140m1jw46_mode,
+	.num_modes = ARRAY_SIZE(sharp_lq140m1jw46_mode),
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
@@ -1719,6 +1760,9 @@ static const struct of_device_id platform_of_match[] = {
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

