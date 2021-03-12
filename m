Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD31338846
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 10:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45EC56F4F9;
	Fri, 12 Mar 2021 09:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9C16F4F9
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 09:08:52 +0000 (UTC)
IronPort-SDR: wXztXQBLXjicH7SR9X3TM9qHL/QtDgd+8EcgsKBatdAHmzbq4C9jfUMT1Okn9/uUamJFAKF07O
 YhtToia3CxNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="175928365"
X-IronPort-AV: E=Sophos;i="5.81,243,1610438400"; d="scan'208";a="175928365"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 01:08:49 -0800
IronPort-SDR: XGEgW8kBzvb2hUY/Tah2ebAu7FWkOG/75IT9RPleuhTHe4pkSYVXbMecC4Ut2UsQIPXh65/hEY
 klz5X0Pf2/0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,243,1610438400"; d="scan'208";a="431889914"
Received: from jsia-hp-z620-workstation.png.intel.com ([10.221.118.135])
 by fmsmga004.fm.intel.com with ESMTP; 12 Mar 2021 01:08:45 -0800
From: Sia Jee Heng <jee.heng.sia@intel.com>
To: dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 narmstrong@baylibre.com, jonas@kwiboo.se, a.hajda@samsung.com
Subject: [PATCH] drm: bridge: adv7511: Support I2S IEC958 encoded PCM format
Date: Fri, 12 Mar 2021 16:52:03 +0800
Message-Id: <20210312085203.13556-1-jee.heng.sia@intel.com>
X-Mailer: git-send-email 2.18.0
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
Cc: pierre-louis.bossart@linux.intel.com, jee.heng.sia@intel.com,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support IEC958 encoded PCM format for ADV7511 so that ADV7511 HDMI
audio driver can accept the IEC958 data from the I2S input.

Signed-off-by: Sia Jee Heng <jee.heng.sia@intel.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h       | 1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index a9bb734366ae..05e3abb5a0c9 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -191,6 +191,7 @@
 #define ADV7511_I2S_FORMAT_I2S			0
 #define ADV7511_I2S_FORMAT_RIGHT_J		1
 #define ADV7511_I2S_FORMAT_LEFT_J		2
+#define ADV7511_I2S_IEC958_DIRECT		3
 
 #define ADV7511_PACKET(p, x)	    ((p) * 0x20 + (x))
 #define ADV7511_PACKET_SDP(x)	    ADV7511_PACKET(0, x)
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
index 45838bd08d37..61f4a38e7d2b 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
@@ -101,6 +101,10 @@ static int adv7511_hdmi_hw_params(struct device *dev, void *data,
 	case 20:
 		len = ADV7511_I2S_SAMPLE_LEN_20;
 		break;
+	case 32:
+		if (fmt->bit_fmt != SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE)
+			return -EINVAL;
+		fallthrough;
 	case 24:
 		len = ADV7511_I2S_SAMPLE_LEN_24;
 		break;
@@ -112,6 +116,8 @@ static int adv7511_hdmi_hw_params(struct device *dev, void *data,
 	case HDMI_I2S:
 		audio_source = ADV7511_AUDIO_SOURCE_I2S;
 		i2s_format = ADV7511_I2S_FORMAT_I2S;
+		if (fmt->bit_fmt == SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE)
+			i2s_format = ADV7511_I2S_IEC958_DIRECT;
 		break;
 	case HDMI_RIGHT_J:
 		audio_source = ADV7511_AUDIO_SOURCE_I2S;

base-commit: de066e116306baf3a6a62691ac63cfc0b1dabddb
-- 
2.18.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
