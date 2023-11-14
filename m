Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF8F7EA8C5
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 03:44:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E33610E17C;
	Tue, 14 Nov 2023 02:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D6610E17C;
 Tue, 14 Nov 2023 02:44:06 +0000 (UTC)
X-UUID: 26bfdf990ac844479c482bc4dafd3440-20231114
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32, REQID:057b3a47-a8d6-4999-a647-aa790bf2bff1, IP:15,
 URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:1
X-CID-INFO: VERSION:1.1.32, REQID:057b3a47-a8d6-4999-a647-aa790bf2bff1, IP:15,
 UR
 L:0,TC:0,Content:-5,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:1
X-CID-META: VersionHash:5f78ec9, CLOUDID:6e5e5b95-10ce-4e4b-85c2-c9b5229ff92b,
 B
 ulkID:231114103432VTG881I7,BulkQuantity:1,Recheck:0,SF:24|17|19|45|66|102,
 TC:nil,Content:0,EDM:-3,IP:-2,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL
 :0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN, TF_CID_SPAM_SNR, TF_CID_SPAM_FAS,
 TF_CID_SPAM_FSD, TF_CID_SPAM_FSI
X-UUID: 26bfdf990ac844479c482bc4dafd3440-20231114
X-User: heminhong@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <heminhong@kylinos.cn>) (Generic MTA)
 with ESMTP id 1319809308; Tue, 14 Nov 2023 10:43:57 +0800
From: heminhong <heminhong@kylinos.cn>
To: heminhong@kylinos.cn
Subject: [PATCH v2] drm/i915: correct the input parameter on
 _intel_dsb_commit()
Date: Tue, 14 Nov 2023 10:43:41 +0800
Message-Id: <20231114024341.14524-1-heminhong@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231113033613.30339-1-heminhong@kylinos.cn>
References: <20231113033613.30339-1-heminhong@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: tvrtko.ursulin@linux.intel.com, kernel test robot <lkp@intel.com>,
 animesh.manna@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Uma Shankar <uma.shankar@intel.com>,
 rodrigo.vivi@intel.com, ankit.k.nautiyal@intel.com,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Current, the dewake_scanline variable is defined as unsigned int,
an unsigned int variable that is always greater than or equal to 0.
when _intel_dsb_commit function is called by intel_dsb_commit function,
the dewake_scanline variable may have an int value.
So the dewake_scanline variable is necessary to defined as an int.

Fixes: f83b94d23770 ("drm/i915/dsb: Use DEwake to combat PkgC latency")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202310052201.AnVbpgPr-lkp@intel.com/
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>

Signed-off-by: heminhong <heminhong@kylinos.cn>
---
 drivers/gpu/drm/i915/display/intel_dsb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index 78b6fe24dcd8..7fd6280c54a7 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -340,7 +340,7 @@ static int intel_dsb_dewake_scanline(const struct intel_crtc_state *crtc_state)
 }
 
 static void _intel_dsb_commit(struct intel_dsb *dsb, u32 ctrl,
-			      unsigned int dewake_scanline)
+			      int dewake_scanline)
 {
 	struct intel_crtc *crtc = dsb->crtc;
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
-- 
2.25.1

