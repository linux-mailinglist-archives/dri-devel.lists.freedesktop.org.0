Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F4C4C117E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 12:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407D710E8F1;
	Wed, 23 Feb 2022 11:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E501610E8F4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 11:40:15 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 8C2B33F78B;
 Wed, 23 Feb 2022 12:40:12 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org
Subject: [PATCH v2] drm/msm/dpu: Bind pingpong block to intf on active ctls in
 cmd encoder
Date: Wed, 23 Feb 2022 12:40:10 +0100
Message-Id: <20220223114011.219044-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.35.1
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
Cc: freedreno@lists.freedesktop.org, Pavel Dubrova <pashadubrova@gmail.com>,
 Jami Kettunen <jami.kettunen@somainline.org>, Bernard <bernard@vivo.com>,
 linux-arm-msm@vger.kernel.org, Zhen Lei <thunder.leizhen@huawei.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As per the specification of DPU_CTL_ACTIVE_CFG the configuration of
active blocks should be proactively specified, and the pingpong block is
no different.

The downstream display driver [1] confirms this by also calling
bind_pingpong_blk on CTL_ACTIVE_CFG.  Note that this else-if is always
entered, as setup_intf_cfg - unlike this mainline dpu driver that
combines both behind the same function pointer - is left NULL in favour
of using setup_intf_cfg_v1 when CTL_ACTIVE_CFG is set.

This solves continuous timeouts on at least the Qualcomm sm6125 SoC:

    [drm:dpu_encoder_frame_done_timeout:2091] [dpu error]enc31 frame done timeout
    [drm:_dpu_encoder_phys_cmd_handle_ppdone_timeout.isra.0] *ERROR* id:31 pp:0 kickoff timeout 0 cnt 1 koff_cnt 1
    [drm:dpu_encoder_phys_cmd_prepare_for_kickoff] *ERROR* failed wait_for_idle: id:31 ret:-110 pp:0

In the same way this pingpong block should also be unbound followed by
an interface flush when the encoder is disabled, according to the
downstream display driver [2].

[1]: https://source.codeaurora.org/quic/la/platform/vendor/opensource/display-drivers/tree/msm/sde/sde_encoder_phys_cmd.c?h=LA.UM.9.16.r1-08500-MANNAR.0#n167
[2]: https://source.codeaurora.org/quic/la/platform/vendor/opensource/display-drivers/tree/msm/sde/sde_encoder.c?h=LA.UM.9.16.r1-08500-MANNAR.0#n2986

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---

Changes since v1:
- Always unbind the pingpong block in dpu_encoder_phys_cmd_disable,
  instead of only if this encoder is the master.

v1: https://lore.kernel.org/lkml/20211222105513.44860-1-marijn.suijten@somainline.org/

 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 8e433af7aea4..1be01cbd960e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -71,6 +71,13 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
 	intf_cfg.stream_sel = cmd_enc->stream_sel;
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
 	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
+
+	/* setup which pp blk will connect to this intf */
+	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
+		phys_enc->hw_intf->ops.bind_pingpong_blk(
+				phys_enc->hw_intf,
+				true,
+				phys_enc->hw_pp->idx);
 }
 
 static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
@@ -507,6 +514,7 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_encoder_phys_cmd *cmd_enc =
 		to_dpu_encoder_phys_cmd(phys_enc);
+	struct dpu_hw_ctl *ctl;
 
 	if (!phys_enc->hw_pp) {
 		DPU_ERROR("invalid encoder\n");
@@ -523,6 +531,17 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
 
 	if (phys_enc->hw_pp->ops.enable_tearcheck)
 		phys_enc->hw_pp->ops.enable_tearcheck(phys_enc->hw_pp, false);
+
+	if (phys_enc->hw_intf->ops.bind_pingpong_blk) {
+		phys_enc->hw_intf->ops.bind_pingpong_blk(
+				phys_enc->hw_intf,
+				false,
+				phys_enc->hw_pp->idx);
+
+		ctl = phys_enc->hw_ctl;
+		ctl->ops.update_pending_flush_intf(ctl, phys_enc->intf_idx);
+	}
+
 	phys_enc->enable_state = DPU_ENC_DISABLED;
 }
 

base-commit: 3c30cf91b5ecc7272b3d2942ae0505dd8320b81c
-- 
2.35.1

