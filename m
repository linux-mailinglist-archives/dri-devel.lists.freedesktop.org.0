Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BAB704630
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 09:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E53910E2F9;
	Tue, 16 May 2023 07:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A940410E2F9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 07:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1684221594; x=1715757594;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zsil0wQenxKUxZ9//tX+iP27Tp++b+IWmCCHT7p8wyU=;
 b=AeLEJM+Sn1Mw6VAY3yNlDgDSNwK+cKfoy6O694Ot9DFz43n8VXCkqzZc
 pSt0DHtChAhxN4U2TPt/LQNlaPeDr8z/9XZgwXTQnNP4POtL78HYsARQj
 FwH1XJQFGUrRNOE6eR2eNV2Y8uQMmCpclJdl+mUXI3y6I0/bjYgwk+9p7
 0KcmaEBEhlcaZfn3UBDsQdQLAgg9JH2afIqD3xSFM8dSGrDTOZgKUf5qf
 zIIpJJfHExU1qwTCUTpqqUrGGILGjc+/Msnudqa6FvOlnCRC/D0QR5Uq6
 J1oufawDSRaFWqvxZCycxRyvzgovaDyI9F/yboWXjGKYai0Goh5Ns/zV4 Q==;
X-IronPort-AV: E=Sophos;i="5.99,278,1677538800"; d="scan'208";a="30924837"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 16 May 2023 09:19:52 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 16 May 2023 09:19:52 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 16 May 2023 09:19:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1684221592; x=1715757592;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zsil0wQenxKUxZ9//tX+iP27Tp++b+IWmCCHT7p8wyU=;
 b=qV/rkGE550gu+xbyyVgsN4PabXQKbfoo8xRbrEe4jII9Yu373lrAUW0K
 Uc5Kkmy2VRDYkYkcFafDkb830wizqj76rRJB5dX404kYNHZdySDyECbl7
 F7TtneByTemXpnkWTMSEHkVIoSPcy4xHZAOv5SFUaOUCmFnFR5HSebMin
 ffQarsjmhV5HI0HjwyQuBrJlzVtnin6nwn8AFpAlhEJa4dLNHw2vINmHE
 PSd/n4sPl77ySdeTAOxvFcjoXaHMy1chunrrudvmeyNVALd1hNg0Pt9Sl
 nIQ/kQZwHiv1y29Kyrz4wpny6KO/yRl1+ATdXHan08hRjNhfiYnP45Cxs w==;
X-IronPort-AV: E=Sophos;i="5.99,278,1677538800"; d="scan'208";a="30924836"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 16 May 2023 09:19:51 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7DAD2280056;
 Tue, 16 May 2023 09:19:51 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/1] drm/bridge: tc358767: explicitly set readable registers
Date: Tue, 16 May 2023 09:19:49 +0200
Message-Id: <20230516071949.375264-1-alexander.stein@ew.tq-group.com>
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This map was created from register map from datasheet (section 5.1.2).
Unused registers are stated by address, so they show up in debugfs as well.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
When dumping the registers in debugfs there are a lot of unused and/or
undocumented addresses. Instead explicitly state each readable register.

 drivers/gpu/drm/bridge/tc358767.c | 195 +++++++++++++++++++++++++++++-
 1 file changed, 194 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 91f7cb56a654..954881ad5bdc 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1781,7 +1781,200 @@ static const struct drm_bridge_funcs tc_edp_bridge_funcs = {
 
 static bool tc_readable_reg(struct device *dev, unsigned int reg)
 {
-	return reg != SYSCTRL;
+	switch (reg) {
+	/* DSI D-PHY Layer */
+	case 0x004:
+	case 0x020:
+	case 0x024:
+	case 0x028:
+	case 0x02c:
+	case 0x030:
+	case 0x038:
+	case 0x040:
+	case 0x044:
+	case 0x048:
+	case 0x04c:
+	case 0x050:
+	case 0x054:
+	/* DSI PPI Layer */
+	case PPI_STARTPPI:
+	case 0x108:
+	case 0x110:
+	case PPI_LPTXTIMECNT:
+	case PPI_LANEENABLE:
+	case PPI_TX_RX_TA:
+	case 0x140:
+	case PPI_D0S_ATMR:
+	case PPI_D1S_ATMR:
+	case 0x14c:
+	case 0x150:
+	case PPI_D0S_CLRSIPOCOUNT:
+	case PPI_D1S_CLRSIPOCOUNT:
+	case PPI_D2S_CLRSIPOCOUNT:
+	case PPI_D3S_CLRSIPOCOUNT:
+	case 0x180:
+	case 0x184:
+	case 0x188:
+	case 0x18c:
+	case 0x190:
+	case 0x1a0:
+	case 0x1a4:
+	case 0x1a8:
+	case 0x1ac:
+	case 0x1b0:
+	case 0x1c0:
+	case 0x1c4:
+	case 0x1c8:
+	case 0x1cc:
+	case 0x1d0:
+	case 0x1e0:
+	case 0x1e4:
+	case 0x1f0:
+	case 0x1f4:
+	/* DSI Protocol Layer */
+	case DSI_STARTDSI:
+	case 0x208:
+	case DSI_LANEENABLE:
+	case 0x214:
+	case 0x218:
+	case 0x220:
+	case 0x224:
+	case 0x228:
+	case 0x230:
+	/* DSI General */
+	case 0x300:
+	/* DSI Application Layer */
+	case 0x400:
+	case 0x404:
+	/* DPI */
+	case DPIPXLFMT:
+	/* Parallel Output */
+	case POCTRL:
+	/* Video Path0 Configuration */
+	case VPCTRL0:
+	case HTIM01:
+	case HTIM02:
+	case VTIM01:
+	case VTIM02:
+	case VFUEN0:
+	/* System */
+	case TC_IDREG:
+	case 0x504:
+	case SYSSTAT:
+	case SYSRSTENB:
+	case SYSCTRL:
+	/* I2C */
+	case 0x520:
+	/* GPIO */
+	case GPIOM:
+	case GPIOC:
+	case GPIOO:
+	case GPIOI:
+	/* Interrupt */
+	case INTCTL_G:
+	case INTSTS_G:
+	case 0x570:
+	case 0x574:
+	case INT_GP0_LCNT:
+	case INT_GP1_LCNT:
+	/* DisplayPort Control */
+	case DP0CTL:
+	/* DisplayPort Clock */
+	case DP0_VIDMNGEN0:
+	case DP0_VIDMNGEN1:
+	case DP0_VMNGENSTATUS:
+	case 0x628:
+	case 0x62c:
+	case 0x630:
+	/* DisplayPort Main Channel */
+	case DP0_SECSAMPLE:
+	case DP0_VIDSYNCDELAY:
+	case DP0_TOTALVAL:
+	case DP0_STARTVAL:
+	case DP0_ACTIVEVAL:
+	case DP0_SYNCVAL:
+	case DP0_MISC:
+	/* DisplayPort Aux Channel */
+	case DP0_AUXCFG0:
+	case DP0_AUXCFG1:
+	case DP0_AUXADDR:
+	case 0x66c:
+	case 0x670:
+	case 0x674:
+	case 0x678:
+	case 0x67c:
+	case 0x680:
+	case 0x684:
+	case 0x688:
+	case DP0_AUXSTATUS:
+	case DP0_AUXI2CADR:
+	/* DisplayPort Link Training */
+	case DP0_SRCCTRL:
+	case DP0_LTSTAT:
+	case DP0_SNKLTCHGREQ:
+	case DP0_LTLOOPCTRL:
+	case DP0_SNKLTCTRL:
+	case 0x6e8:
+	case 0x6ec:
+	case 0x6f0:
+	case 0x6f4:
+	/* DisplayPort Audio */
+	case 0x700:
+	case 0x704:
+	case 0x708:
+	case 0x70c:
+	case 0x710:
+	case 0x714:
+	case 0x718:
+	case 0x71c:
+	case 0x720:
+	/* DisplayPort Source Control */
+	case DP1_SRCCTRL:
+	/* DisplayPort PHY */
+	case DP_PHY_CTRL:
+	case 0x810:
+	case 0x814:
+	case 0x820:
+	case 0x840:
+	/* I2S */
+	case 0x880:
+	case 0x888:
+	case 0x88c:
+	case 0x890:
+	case 0x894:
+	case 0x898:
+	case 0x89c:
+	case 0x8a0:
+	case 0x8a4:
+	case 0x8a8:
+	case 0x8ac:
+	case 0x8b0:
+	case 0x8b4:
+	/* PLL */
+	case DP0_PLLCTRL:
+	case DP1_PLLCTRL:
+	case PXL_PLLCTRL:
+	case PXL_PLLPARAM:
+	case SYS_PLLPARAM:
+	/* HDCP */
+	case 0x980:
+	case 0x984:
+	case 0x988:
+	case 0x98c:
+	case 0x990:
+	case 0x994:
+	case 0x998:
+	case 0x99c:
+	case 0x9a0:
+	case 0x9a4:
+	case 0x9a8:
+	case 0x9ac:
+	/* Debug */
+	case TSTCTL:
+	case PLL_DBG:
+		return true;
+	}
+	return false;
 }
 
 static const struct regmap_range tc_volatile_ranges[] = {
-- 
2.34.1

