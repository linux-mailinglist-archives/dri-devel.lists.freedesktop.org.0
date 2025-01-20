Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CD0A16664
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 06:39:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9064610E2A2;
	Mon, 20 Jan 2025 05:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00A110E2A2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 05:39:49 +0000 (UTC)
X-UUID: f178a3ded6f011efa216b1d71e6e1362-20250120
X-CTIC-Tags: HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME,
 HR_CTE_8B
 HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
 HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
 HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
 HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
 SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
 DMARC_NOPASS, CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS
 GTI_RG_INFO, GTI_C_BU, AMN_T1, AMN_GOOD, AMN_C_TI
 AMN_C_BU, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:05dce0e1-7210-4056-a315-bc1d4548aab4, IP:10,
 URL:0,TC:0,Content:29,EDM:0,RT:0,SF:-11,FILE:0,BULK:0,RULE:Release_Ham,ACT
 ION:release,TS:28
X-CID-INFO: VERSION:1.1.45, REQID:05dce0e1-7210-4056-a315-bc1d4548aab4, IP:10,
 UR
 L:0,TC:0,Content:29,EDM:0,RT:0,SF:-11,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:28
X-CID-META: VersionHash:6493067, CLOUDID:93a1a6a1ecc4074b73631bfe20313523,
 BulkI
 D:250120133942QQM5FX4G,BulkQuantity:0,Recheck:0,SF:17|19|25|38|44|66|78|10
 2,TC:nil,Content:4|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,B
 EC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS
X-UUID: f178a3ded6f011efa216b1d71e6e1362-20250120
X-User: yaolu@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw.kylinos.cn
 (envelope-from <yaolu@kylinos.cn>) (Generic MTA)
 with ESMTP id 1630771417; Mon, 20 Jan 2025 13:39:40 +0800
From: Lu Yao <yaolu@kylinos.cn>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Lu Yao <yaolu@kylinos.cn>
Subject: [PATCH] drm/i915: Handle null 'fb' in
 'intel_plane_atomic_check_with_state'
Date: Mon, 20 Jan 2025 13:39:08 +0800
Message-Id: <20250120053908.94339-1-yaolu@kylinos.cn>
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

Add null pointer check before use fb.
Reported by smatch.

Signed-off-by: Lu Yao <yaolu@kylinos.cn>
---
 drivers/gpu/drm/i915/display/intel_atomic_plane.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index d89630b2d5c1..20bfa9589ee7 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -640,18 +640,18 @@ int intel_plane_atomic_check_with_state(const struct intel_crtc_state *old_crtc_
 	    intel_plane_is_scaled(new_plane_state))
 		new_crtc_state->scaled_planes |= BIT(plane->id);
 
-	if (new_plane_state->uapi.visible &&
+	if (fb && new_plane_state->uapi.visible &&
 	    intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier))
 		new_crtc_state->nv12_planes |= BIT(plane->id);
 
-	if (new_plane_state->uapi.visible &&
+	if (fb && new_plane_state->uapi.visible &&
 	    fb->format->format == DRM_FORMAT_C8)
 		new_crtc_state->c8_planes |= BIT(plane->id);
 
 	if (new_plane_state->uapi.visible || old_plane_state->uapi.visible)
 		new_crtc_state->update_planes |= BIT(plane->id);
 
-	if (new_plane_state->uapi.visible &&
+	if (fb && new_plane_state->uapi.visible &&
 	    intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier)) {
 		new_crtc_state->data_rate_y[plane->id] =
 			intel_plane_data_rate(new_crtc_state, new_plane_state, 0);
-- 
2.25.1

