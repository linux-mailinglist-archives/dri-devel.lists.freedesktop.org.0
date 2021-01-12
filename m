Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B612F4617
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02F86E0BA;
	Wed, 13 Jan 2021 08:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6E989F27
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 19:26:50 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E4DB03EA5A;
 Tue, 12 Jan 2021 20:26:47 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 3/7] drm/msm/dpu: Add prog_fetch_lines_worst_case to
 INTF_BLK macro
Date: Tue, 12 Jan 2021 20:26:28 +0100
Message-Id: <20210112192632.502897-4-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112192632.502897-1-angelogioacchino.delregno@somainline.org>
References: <20210112192632.502897-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:21:20 +0000
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
Cc: freedreno@lists.freedesktop.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 martin.botka@somainline.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 marijn.suijten@somainline.org, phone-devel@vger.kernel.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not all DPU interface sub-block versions need the same value for
prog_fetch_lines_worst_case: add this to the INTF_BLK macro, so
that it becomes possible to vary it for other INTF versions.

For example, this is needed to implement support for older SoCs,
like MSM8998 and SDM630/660 and most probably will also be needed
for future SoCs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 7a17ebaf635c..48d490f65840 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -624,33 +624,33 @@ static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
 /*************************************************************
  * INTF sub blocks config
  *************************************************************/
-#define INTF_BLK(_name, _id, _base, _type, _ctrl_id, _features) \
+#define INTF_BLK(_name, _id, _base, _type, _ctrl_id, _progfetch, _features) \
 	{\
 	.name = _name, .id = _id, \
 	.base = _base, .len = 0x280, \
 	.features = _features, \
 	.type = _type, \
 	.controller_id = _ctrl_id, \
-	.prog_fetch_lines_worst_case = 24 \
+	.prog_fetch_lines_worst_case = _progfetch \
 	}
 
 static const struct dpu_intf_cfg sdm845_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, INTF_SDM845_MASK),
-	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, INTF_SDM845_MASK),
-	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, INTF_SDM845_MASK),
-	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, INTF_SDM845_MASK),
+	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SDM845_MASK),
+	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SDM845_MASK),
+	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SDM845_MASK),
+	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, 24, INTF_SDM845_MASK),
 };
 
 static const struct dpu_intf_cfg sc7180_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, INTF_SC7180_MASK),
-	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, INTF_SC7180_MASK),
+	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SC7180_MASK),
+	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK),
 };
 
 static const struct dpu_intf_cfg sm8150_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, INTF_SC7180_MASK),
-	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, INTF_SC7180_MASK),
-	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, INTF_SC7180_MASK),
-	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, INTF_SC7180_MASK),
+	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SC7180_MASK),
+	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK),
+	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC7180_MASK),
+	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, 24, INTF_SC7180_MASK),
 };
 
 /*************************************************************
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
