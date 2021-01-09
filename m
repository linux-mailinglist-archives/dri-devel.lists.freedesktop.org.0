Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2553A2F00A9
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jan 2021 16:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9D76E89E;
	Sat,  9 Jan 2021 15:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45426E84B
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jan 2021 13:44:56 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 369E23EF16;
 Sat,  9 Jan 2021 14:37:40 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH 6/9] drm/msm/dpu: Correctly configure vsync tearcheck for
 command mode
Date: Sat,  9 Jan 2021 14:37:33 +0100
Message-Id: <20210109133736.143469-7-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109133736.143469-1-angelogioacchino.delregno@somainline.org>
References: <20210109133736.143469-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 09 Jan 2021 15:13:22 +0000
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

When configuring the tearcheck, the parameters for the engine were
being set mostly as they should've been, but then it wasn't getting
configured to get the vsync indication from the TE GPIO input
because it was assumed that autorefresh could be enabled:
since a previous commit makes sure to disable the autorefresh bit
when committing to the cmd engine, it is now safe to just enable
the vsync pin input at tearcheck setup time (instead of erroneously
never enabling it).

Also, set the right sync_cfg_height to enable the DPU auto-generated
TE signal in order to avoid stalls in the event that we miss one
external TE signal: this will still trigger recovery mechanisms in
case the display is really unreachable.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index a367b093c888..c5cf59b5bd41 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -372,15 +372,12 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	tc_cfg.vsync_count = vsync_hz /
 				(mode->vtotal * drm_mode_vrefresh(mode));
 
-	/* enable external TE after kickoff to avoid premature autorefresh */
-	tc_cfg.hw_vsync_mode = 0;
-
 	/*
-	 * By setting sync_cfg_height to near max register value, we essentially
-	 * disable dpu hw generated TE signal, since hw TE will arrive first.
-	 * Only caveat is if due to error, we hit wrap-around.
+	 * Set the sync_cfg_height to twice vtotal so that if we lose a
+	 * TE event coming from the display TE pin we won't stall immediately
 	 */
-	tc_cfg.sync_cfg_height = 0xFFF0;
+	tc_cfg.hw_vsync_mode = 1;
+	tc_cfg.sync_cfg_height = mode->vtotal * 2;
 	tc_cfg.vsync_init_val = mode->vdisplay;
 	tc_cfg.sync_threshold_start = DEFAULT_TEARCHECK_SYNC_THRESH_START;
 	tc_cfg.sync_threshold_continue = DEFAULT_TEARCHECK_SYNC_THRESH_CONTINUE;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
