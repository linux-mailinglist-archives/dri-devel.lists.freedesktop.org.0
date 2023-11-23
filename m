Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 180BE7F5BDA
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 11:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DC510E70F;
	Thu, 23 Nov 2023 10:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A74410E70F;
 Thu, 23 Nov 2023 10:04:43 +0000 (UTC)
X-UUID: 45b75c6c6c9349d5831b991b6399ad29-20231123
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:be4ee2f1-65f7-4a0c-ab90-1b02997ae812, IP:5,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-10
X-CID-INFO: VERSION:1.1.32, REQID:be4ee2f1-65f7-4a0c-ab90-1b02997ae812, IP:5,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:-10
X-CID-META: VersionHash:5f78ec9, CLOUDID:d0a0ba95-10ce-4e4b-85c2-c9b5229ff92b,
 B
 ulkID:231123180438RZ9HIN08,BulkQuantity:0,Recheck:0,SF:17|19|44|66|38|24|1
 02,TC:nil,Content:0,EDM:-3,IP:-2,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil
 ,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI, TF_CID_SPAM_ULN, TF_CID_SPAM_SNR,
 TF_CID_SPAM_FAS, TF_CID_SPAM_FSD
X-UUID: 45b75c6c6c9349d5831b991b6399ad29-20231123
X-User: chentao@kylinos.cn
Received: from vt.. [(116.128.244.169)] by mailgw
 (envelope-from <chentao@kylinos.cn>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1212061847; Thu, 23 Nov 2023 18:04:36 +0800
From: Kunwu Chan <chentao@kylinos.cn>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH] drm/i915/display: Fix null pointer dereference in
 intel_dp_aux_wait_done and intel_dp_aux_xfer
Date: Thu, 23 Nov 2023 18:04:31 +0800
Message-Id: <20231123100431.34453-1-chentao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
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
Cc: Kunwu Chan <chentao@kylinos.cn>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kunwu.chan@hotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kasprintf() returns a pointer to dynamically allocated memory
which can be NULL upon failure. When "intel_dp->aux.name" is NULL,
 these error messages will trigger the null pointer dereference issue.

Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 drivers/gpu/drm/i915/display/intel_dp_aux.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index 2e2af71bcd5a..398c9064eb09 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -67,7 +67,7 @@ intel_dp_aux_wait_done(struct intel_dp *intel_dp)
 	if (ret == -ETIMEDOUT)
 		drm_err(&i915->drm,
 			"%s: did not complete or timeout within %ums (status 0x%08x)\n",
-			intel_dp->aux.name, timeout_ms, status);
+			intel_dp->aux.name ? intel_dp->aux.name : "", timeout_ms, status);
 
 	return status;
 }
@@ -302,7 +302,7 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 		if (status != intel_dp->aux_busy_last_status) {
 			drm_WARN(&i915->drm, 1,
 				 "%s: not started (status 0x%08x)\n",
-				 intel_dp->aux.name, status);
+				 intel_dp->aux.name ? intel_dp->aux.name : "", status);
 			intel_dp->aux_busy_last_status = status;
 		}
 
@@ -362,7 +362,7 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 
 	if ((status & DP_AUX_CH_CTL_DONE) == 0) {
 		drm_err(&i915->drm, "%s: not done (status 0x%08x)\n",
-			intel_dp->aux.name, status);
+			intel_dp->aux.name ? intel_dp->aux.name : "", status);
 		ret = -EBUSY;
 		goto out;
 	}
@@ -374,7 +374,7 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 	 */
 	if (status & DP_AUX_CH_CTL_RECEIVE_ERROR) {
 		drm_err(&i915->drm, "%s: receive error (status 0x%08x)\n",
-			intel_dp->aux.name, status);
+			intel_dp->aux.name ? intel_dp->aux.name : "", status);
 		ret = -EIO;
 		goto out;
 	}
@@ -385,7 +385,7 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 	 */
 	if (status & DP_AUX_CH_CTL_TIME_OUT_ERROR) {
 		drm_dbg_kms(&i915->drm, "%s: timeout (status 0x%08x)\n",
-			    intel_dp->aux.name, status);
+			    intel_dp->aux.name ? intel_dp->aux.name : "", status);
 		ret = -ETIMEDOUT;
 		goto out;
 	}
@@ -401,7 +401,7 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 	if (recv_bytes == 0 || recv_bytes > 20) {
 		drm_dbg_kms(&i915->drm,
 			    "%s: Forbidden recv_bytes = %d on aux transaction\n",
-			    intel_dp->aux.name, recv_bytes);
+			    intel_dp->aux.name ? intel_dp->aux.name : "", recv_bytes);
 		ret = -EBUSY;
 		goto out;
 	}
-- 
2.34.1

