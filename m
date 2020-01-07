Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C44431320ED
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 09:05:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A967589A1F;
	Tue,  7 Jan 2020 08:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-blr-01.qualcomm.com (alexa-out-blr-01.qualcomm.com
 [103.229.18.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7466E245;
 Tue,  7 Jan 2020 05:41:27 +0000 (UTC)
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA;
 07 Jan 2020 11:10:43 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
 by ironmsg02-blr.qualcomm.com with ESMTP; 07 Jan 2020 11:10:11 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
 id 2F2FC256D; Tue,  7 Jan 2020 11:10:10 +0530 (IST)
From: Harigovindan P <harigovi@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v2] drm/msm: update LANE_CTRL register value from default value
Date: Tue,  7 Jan 2020 11:10:08 +0530
Message-Id: <1578375608-28995-1-git-send-email-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 07 Jan 2020 08:05:10 +0000
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
Cc: Harigovindan P <harigovi@codeaurora.org>, abhinavk@codeaurora.org,
 linux-kernel@vger.kernel.org, seanpaul@chromium.org, hoegsberg@chromium.org,
 chandanu@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LANE_CTRL register in latest version of DSI controller (v2.2)
has additional functionality introduced to enable/disable HS
signalling with default value set to enabled. To accommodate this
change, LANE_CTRL register should be read and bit wise ORed to enable
non continuous clock mode. Without this change, if register is written
directly, HS signalling will be disabled resulting in black screen.

Changes in v1:
	-Update LANE_CTRL register value
Changes in v2:
	-Changing commit message accordingly.

Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e6289a3..d3c5233 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -816,7 +816,7 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
 	u32 flags = msm_host->mode_flags;
 	enum mipi_dsi_pixel_format mipi_fmt = msm_host->format;
 	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
-	u32 data = 0;
+	u32 data = 0, lane_ctrl = 0;
 
 	if (!enable) {
 		dsi_write(msm_host, REG_DSI_CTRL, 0);
@@ -904,9 +904,11 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
 	dsi_write(msm_host, REG_DSI_LANE_SWAP_CTRL,
 		  DSI_LANE_SWAP_CTRL_DLN_SWAP_SEL(msm_host->dlane_swap));
 
-	if (!(flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
+	if (!(flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)) {
+		lane_ctrl = dsi_read(msm_host, REG_DSI_LANE_CTRL);
 		dsi_write(msm_host, REG_DSI_LANE_CTRL,
-			DSI_LANE_CTRL_CLKLN_HS_FORCE_REQUEST);
+			lane_ctrl | DSI_LANE_CTRL_CLKLN_HS_FORCE_REQUEST);
+	}
 
 	data |= DSI_CTRL_ENABLE;
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
