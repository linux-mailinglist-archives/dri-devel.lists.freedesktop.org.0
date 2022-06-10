Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F21546F88
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 00:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9267311A538;
	Fri, 10 Jun 2022 22:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 493 seconds by postgrey-1.36 at gabe;
 Fri, 10 Jun 2022 22:12:07 UTC
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B2211A538;
 Fri, 10 Jun 2022 22:12:07 +0000 (UTC)
Received: from g550jk.arnhem.chello.nl (31-151-115-246.dynamic.upc.nl
 [31.151.115.246])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id D570BCD36F;
 Fri, 10 Jun 2022 22:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
 t=1654898602; bh=oeZz0OZexmMdYCMRKOgZDLEiOr1iNRAvEG7wdfdbtkA=;
 h=From:To:Cc:Subject:Date;
 b=NX/NiUfTnfYpFcspTrCqQqLYTDiBAp68cj/OwnswFvHiRrhRP4cfBBAXg9t4OhIIz
 BKUm2xllrZ+U40OITYYIUKP08W3QwAlAEw5X4IGrdB82TeWjPDy7lDiB8Oli5jA6Sv
 9Krvp4OZLjN0bo+hPBCcnZrAhJPFNUuTeKFe81B8=
From: Luca Weiss <luca@z3ntu.xyz>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/dsi: Use single function for reset
Date: Sat, 11 Jun 2022 00:02:57 +0200
Message-Id: <20220610220259.220622-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.36.1
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
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Luca Weiss <luca@z3ntu.xyz>, freedreno@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, phone-devel@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vladimir Lypak <vladimir.lypak@gmail.com>

There is currently two function for performing reset: dsi_sw_reset and
dsi_sw_reset_restore. Only difference betwean those is that latter one
assumes that DSI controller is enabled. In contrary former one assumes
that controller is disabled and executed during power-on. However this
assumtion is not true mobile devices which have boot splash set up by
boot-loader.

This patch removes dsi_sw_reset_restore and makes dsi_sw_reset disable
DSI controller during reset sequence if it's enabled.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 48 +++++++++++++-----------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index a95d5df52653..bab2634ebd11 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1080,12 +1080,32 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 static void dsi_sw_reset(struct msm_dsi_host *msm_host)
 {
+	u32 ctrl;
+
+	ctrl = dsi_read(msm_host, REG_DSI_CTRL);
+
+	if (ctrl & DSI_CTRL_ENABLE) {
+		dsi_write(msm_host, REG_DSI_CTRL, ctrl & ~DSI_CTRL_ENABLE);
+		/*
+		 * dsi controller need to be disabled before
+		 * clocks turned on
+		 */
+		wmb();
+	}
+
 	dsi_write(msm_host, REG_DSI_CLK_CTRL, DSI_CLK_CTRL_ENABLE_CLKS);
 	wmb(); /* clocks need to be enabled before reset */
 
+	/* dsi controller can only be reset while clocks are running */
 	dsi_write(msm_host, REG_DSI_RESET, 1);
 	msleep(DSI_RESET_TOGGLE_DELAY_MS); /* make sure reset happen */
 	dsi_write(msm_host, REG_DSI_RESET, 0);
+	wmb(); /* controller out of reset */
+
+	if (ctrl & DSI_CTRL_ENABLE) {
+		dsi_write(msm_host, REG_DSI_CTRL, ctrl);
+		wmb();	/* make sure dsi controller enabled again */
+	}
 }
 
 static void dsi_op_mode_config(struct msm_dsi_host *msm_host,
@@ -1478,32 +1498,6 @@ static int dsi_cmds2buf_tx(struct msm_dsi_host *msm_host,
 	return len;
 }
 
-static void dsi_sw_reset_restore(struct msm_dsi_host *msm_host)
-{
-	u32 data0, data1;
-
-	data0 = dsi_read(msm_host, REG_DSI_CTRL);
-	data1 = data0;
-	data1 &= ~DSI_CTRL_ENABLE;
-	dsi_write(msm_host, REG_DSI_CTRL, data1);
-	/*
-	 * dsi controller need to be disabled before
-	 * clocks turned on
-	 */
-	wmb();
-
-	dsi_write(msm_host, REG_DSI_CLK_CTRL, DSI_CLK_CTRL_ENABLE_CLKS);
-	wmb();	/* make sure clocks enabled */
-
-	/* dsi controller can only be reset while clocks are running */
-	dsi_write(msm_host, REG_DSI_RESET, 1);
-	msleep(DSI_RESET_TOGGLE_DELAY_MS); /* make sure reset happen */
-	dsi_write(msm_host, REG_DSI_RESET, 0);
-	wmb();	/* controller out of reset */
-	dsi_write(msm_host, REG_DSI_CTRL, data0);
-	wmb();	/* make sure dsi controller enabled again */
-}
-
 static void dsi_hpd_worker(struct work_struct *work)
 {
 	struct msm_dsi_host *msm_host =
@@ -1520,7 +1514,7 @@ static void dsi_err_worker(struct work_struct *work)
 
 	pr_err_ratelimited("%s: status=%x\n", __func__, status);
 	if (status & DSI_ERR_STATE_MDP_FIFO_UNDERFLOW)
-		dsi_sw_reset_restore(msm_host);
+		dsi_sw_reset(msm_host);
 
 	/* It is safe to clear here because error irq is disabled. */
 	msm_host->err_work_state = 0;
-- 
2.36.1

