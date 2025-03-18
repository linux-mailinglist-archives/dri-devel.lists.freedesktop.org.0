Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1145A66B48
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 08:10:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D88710E02B;
	Tue, 18 Mar 2025 07:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Tue, 18 Mar 2025 07:10:13 UTC
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D432710E02B;
 Tue, 18 Mar 2025 07:10:13 +0000 (UTC)
X-UUID: 4f57fb3203c711f0a216b1d71e6e1362-20250318
X-CTIC-Tags: HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME,
 HR_CTE_8B
 HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
 HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
 HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
 HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
 SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
 DMARC_NOPASS, CIE_BAD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
 GTI_C_BU, AMN_T1, AMN_GOOD, AMN_C_TI, AMN_C_BU ABX_MISS_RDNS
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:85aa7888-d63a-4a57-a857-a3ba91eaaf8d, IP:10,
 URL:0,TC:0,Content:0,EDM:0,RT:0,SF:12,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:22
X-CID-INFO: VERSION:1.1.45, REQID:85aa7888-d63a-4a57-a857-a3ba91eaaf8d, IP:10,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:12,FILE:0,BULK:0,RULE:Release_HamU,ACTION
 :release,TS:22
X-CID-META: VersionHash:6493067, CLOUDID:53507ddbc0bb982542202a760e475476,
 BulkI
 D:250318150502PDHC138U,BulkQuantity:0,Recheck:0,SF:16|19|25|38|44|66|78|10
 2,TC:nil,Content:0|50,EDM:-3,IP:-2,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:ni
 l,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:
 0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_USA, TF_CID_SPAM_FSD, TF_CID_SPAM_FSI,
 TF_CID_SPAM_ULN, TF_CID_SPAM_SNR
X-UUID: 4f57fb3203c711f0a216b1d71e6e1362-20250318
X-User: yaolu@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw.kylinos.cn
 (envelope-from <yaolu@kylinos.cn>) (Generic MTA)
 with ESMTP id 2139052546; Tue, 18 Mar 2025 15:05:01 +0800
From: Lu Yao <yaolu@kylinos.cn>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Lu Yao <yaolu@kylinos.cn>
Subject: [PATCH] drm/i915/display: add audio dis/enable when connector hotplug
Date: Tue, 18 Mar 2025 15:04:35 +0800
Message-Id: <20250318070435.347383-1-yaolu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Now audio enable/disable depends on an atomic commit, it doesn't make
sence. For wayland, there will trigering an atomic commit, so it
works well. But for Xorg using modesetting, there won't. In this
case, unplug the HDMI/DP and the audio jack event is not triggered,
resulting in still having a HDMI/DP audio output choice.

Signed-off-by: Lu Yao <yaolu@kylinos.cn>
---
 drivers/gpu/drm/i915/display/intel_hotplug.c | 31 ++++++++++++++++++++
 1 file changed, 31 insertions(+)
---
Test hardware:
  CPU: i5-12500
  GPU: UHD Graphics 770


diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
index 3adc791d3776..332d6e1a99cd 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
@@ -32,6 +32,7 @@
 #include "intel_display_types.h"
 #include "intel_hotplug.h"
 #include "intel_hotplug_irq.h"
+#include "intel_audio.h"
 
 /**
  * DOC: Hotplug
@@ -415,6 +416,35 @@ void intel_hpd_trigger_irq(struct intel_digital_port *dig_port)
 	queue_work(i915->display.hotplug.dp_wq, &i915->display.hotplug.dig_port_work);
 }
 
+/*
+ * when connector hotplug state changed, audio need changed too.
+ */
+static void i915_audio_hotplug(struct intel_connector *connector)
+{
+	struct drm_crtc *crtc;
+	struct drm_device *dev = connector->base.dev;
+
+	drm_for_each_crtc(crtc, dev) {
+		if (connector->base.state->crtc == crtc) {
+			struct intel_crtc *intel_crtc = to_intel_crtc(crtc);
+			struct intel_crtc_state *pipe_config =
+				to_intel_crtc_state(intel_crtc->base.state);
+			struct intel_encoder *encoder =
+				intel_attached_encoder(connector);
+
+			if (pipe_config && pipe_config->has_audio) {
+				if (connector->base.status == connector_status_disconnected)
+					intel_audio_codec_disable(encoder, pipe_config,
+								  connector->base.state);
+				else if (connector->base.status == connector_status_connected)
+					intel_audio_codec_enable(encoder, pipe_config,
+								 connector->base.state);
+			}
+			break;
+		}
+	}
+}
+
 /*
  * Handle hotplug events outside the interrupt handler proper.
  */
@@ -487,6 +517,7 @@ static void i915_hotplug_work_func(struct work_struct *work)
 					drm_connector_get(&connector->base);
 					first_changed_connector = &connector->base;
 				}
+				i915_audio_hotplug(connector);
 				break;
 			case INTEL_HOTPLUG_RETRY:
 				retry |= hpd_bit;
-- 
2.25.1

