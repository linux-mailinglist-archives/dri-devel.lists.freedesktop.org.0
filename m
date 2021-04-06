Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1634D355E2A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 23:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F106E8C7;
	Tue,  6 Apr 2021 21:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590826E8C7
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Apr 2021 21:47:43 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 3C8833F3F1;
 Tue,  6 Apr 2021 23:47:41 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org
Subject: [PATCH 2/3] drm/msm/mdp5: Do not multiply vclk line count by 100
Date: Tue,  6 Apr 2021 23:47:25 +0200
Message-Id: <20210406214726.131534-3-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406214726.131534-1-marijn.suijten@somainline.org>
References: <20210406214726.131534-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
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
Cc: freedreno@lists.freedesktop.org,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Neither vtotal nor drm_mode_vrefresh contain a value that is
premultiplied by 100 making the x100 variable name incorrect and
resulting in vclks_line to become 100 times larger than it is supposed
to be.  The hardware counts 100 clockticks too many before tearcheck,
leading to severe panel issues on at least the Sony Xperia lineup.

This is likely an artifact from the original MDSS DSI panel driver where
the calculation [1] corrected for a premultiplied reference framerate by
100 [2].  It does not appear that the above values were ever
premultiplied in the history of the DRM MDP5 driver.

With this change applied the value written to the SYNC_CONFIG_VSYNC
register is now identical to downstream kernels.

[1]: https://source.codeaurora.org/quic/la/kernel/msm-3.18/tree/drivers/video/msm/mdss/mdss_mdp_intf_cmd.c?h=LA.UM.8.6.c26-02400-89xx.0#n288
[2]: https://source.codeaurora.org/quic/la/kernel/msm-3.18/tree/drivers/video/msm/mdss/mdss_dsi_panel.c?h=LA.UM.8.6.c26-02400-89xx.0#n1648

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
index 2d5ac03dbc17..0bda4257823a 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
@@ -20,7 +20,7 @@ static int pingpong_tearcheck_setup(struct drm_encoder *encoder,
 {
 	struct mdp5_kms *mdp5_kms = get_kms(encoder);
 	struct device *dev = encoder->dev->dev;
-	u32 total_lines_x100, vclks_line, cfg;
+	u32 total_lines, vclks_line, cfg;
 	long vsync_clk_speed;
 	struct mdp5_hw_mixer *mixer = mdp5_crtc_get_mixer(encoder->crtc);
 	int pp_id = mixer->pp;
@@ -30,8 +30,8 @@ static int pingpong_tearcheck_setup(struct drm_encoder *encoder,
 		return -EINVAL;
 	}
 
-	total_lines_x100 = mode->vtotal * drm_mode_vrefresh(mode);
-	if (!total_lines_x100) {
+	total_lines = mode->vtotal * drm_mode_vrefresh(mode);
+	if (!total_lines) {
 		DRM_DEV_ERROR(dev, "%s: vtotal(%d) or vrefresh(%d) is 0\n",
 			      __func__, mode->vtotal, drm_mode_vrefresh(mode));
 		return -EINVAL;
@@ -43,7 +43,7 @@ static int pingpong_tearcheck_setup(struct drm_encoder *encoder,
 							vsync_clk_speed);
 		return -EINVAL;
 	}
-	vclks_line = vsync_clk_speed * 100 / total_lines_x100;
+	vclks_line = vsync_clk_speed / total_lines;
 
 	cfg = MDP5_PP_SYNC_CONFIG_VSYNC_COUNTER_EN
 		| MDP5_PP_SYNC_CONFIG_VSYNC_IN_EN;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
