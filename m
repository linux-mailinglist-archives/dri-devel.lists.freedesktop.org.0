Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AEB299C00
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 00:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8DB6EA8B;
	Mon, 26 Oct 2020 23:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4736EA8B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 23:55:50 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 984F72151B;
 Mon, 26 Oct 2020 23:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603756550;
 bh=scenCdaykCIS9/ktaWIti9ZG+4PJN2VqVmUcyHrSsnY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fVdfFg7hfPt8pFEvX1tzyuSDmiuSsg5/ZaRKrk0YSYWdhp29Sj/KJU9xKbZCs5EFb
 S/5WX82c5mFf3NYylfixTAbqXtAxHIZi/MB9nOXWn0sW1i5+wX3hZDQ/qsIJ8JzU+F
 KCtrvGnoCH/rSIN/K19NYXmn+AMkyRvBa+NitGI4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 27/80] drm/bridge/synopsys: dsi: add support for
 non-continuous HS clock
Date: Mon, 26 Oct 2020 19:54:23 -0400
Message-Id: <20201026235516.1025100-27-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026235516.1025100-1-sashal@kernel.org>
References: <20201026235516.1025100-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Antonio Borneo <antonio.borneo@st.com>, Sasha Levin <sashal@kernel.org>,
 Philippe Cornu <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Antonio Borneo <antonio.borneo@st.com>

[ Upstream commit c6d94e37bdbb6dfe7e581e937a915ab58399b8a5 ]

Current code enables the HS clock when video mode is started or to
send out a HS command, and disables the HS clock to send out a LP
command. This is not what DSI spec specify.

Enable HS clock either in command and in video mode.
Set automatic HS clock management for panels and devices that
support non-continuous HS clock.

Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
Tested-by: Philippe Cornu <philippe.cornu@st.com>
Reviewed-by: Philippe Cornu <philippe.cornu@st.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20200701194234.18123-1-yannick.fertre@st.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 675442bfc1bd7..77384c49fb8dd 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -365,7 +365,6 @@ static void dw_mipi_message_config(struct dw_mipi_dsi *dsi,
 	if (lpm)
 		val |= CMD_MODE_ALL_LP;
 
-	dsi_write(dsi, DSI_LPCLK_CTRL, lpm ? 0 : PHY_TXREQUESTCLKHS);
 	dsi_write(dsi, DSI_CMD_MODE_CFG, val);
 }
 
@@ -541,16 +540,22 @@ static void dw_mipi_dsi_video_mode_config(struct dw_mipi_dsi *dsi)
 static void dw_mipi_dsi_set_mode(struct dw_mipi_dsi *dsi,
 				 unsigned long mode_flags)
 {
+	u32 val;
+
 	dsi_write(dsi, DSI_PWR_UP, RESET);
 
 	if (mode_flags & MIPI_DSI_MODE_VIDEO) {
 		dsi_write(dsi, DSI_MODE_CFG, ENABLE_VIDEO_MODE);
 		dw_mipi_dsi_video_mode_config(dsi);
-		dsi_write(dsi, DSI_LPCLK_CTRL, PHY_TXREQUESTCLKHS);
 	} else {
 		dsi_write(dsi, DSI_MODE_CFG, ENABLE_CMD_MODE);
 	}
 
+	val = PHY_TXREQUESTCLKHS;
+	if (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
+		val |= AUTO_CLKLANE_CTRL;
+	dsi_write(dsi, DSI_LPCLK_CTRL, val);
+
 	dsi_write(dsi, DSI_PWR_UP, POWERUP);
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
