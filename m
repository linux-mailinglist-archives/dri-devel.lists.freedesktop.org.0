Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MbIEuUpnGl1AAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 11:20:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A506C174BB7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 11:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C7410E2C0;
	Mon, 23 Feb 2026 10:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="1Gvypfiv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A334E10E2C0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 10:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1771842015; x=1803378015;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HYWBr38iHIjb+NSx2zGe9SgBNR2/Jd2Z4h5rS9bUVNw=;
 b=1Gvypfiv/FF1FPs2chwrlawO320JMdCE8cD6uzzl+yHX0f91UfgP+AiG
 N/h7qLjXDEcxO7ZLMk1F4GQCdStgiPAzuwGADI1WxtkDG4sWfZqqyAWep
 g34EKJR8F/Ox8rJclyTzrQtRK7YD9zrAQDhXyVwyp87k5rw4iTICnHOi5
 Xp+q4Au6ugDhRMFRuPP22wsuBkOsYNzYkoobdR6e8WIlqZo+Z2s0cqZKJ
 Ols9nsXkWmde8AnD000XF5vuqgAt+b6VL8nzeZl/c8IdBI5MkFTI81Rg+
 /9kM1Aku8HN2SjTJnv2bv+JWz78IBRjRitXQMbW4PxwA2Qx+0nb068cHL w==;
X-CSE-ConnectionGUID: Pkelvpk5TzC1b4CVtpcYwQ==
X-CSE-MsgGUID: v51EDN1ETbOmCom1RI3NQw==
X-IronPort-AV: E=Sophos;i="6.21,306,1763449200"; d="scan'208";a="220994658"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Feb 2026 03:20:14 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 23 Feb 2026 03:19:54 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 23 Feb 2026 03:19:49 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>, Dharma Balasubiramani
 <dharma.b@microchip.com>
Subject: [PATCH v3 1/4] mfd: atmel-hlcdc: fetch LVDS PLL clock for LVDS display
Date: Mon, 23 Feb 2026 15:49:17 +0530
Message-ID: <20260223101920.284697-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260223101920.284697-1-manikandan.m@microchip.com>
References: <20260223101920.284697-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:lee@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:manikandan.m@microchip.com,m:dharma.b@microchip.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,microchip.com,bootlin.com,tuxon.dev,lists.freedesktop.org,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[manikandan.m@microchip.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[manikandan.m@microchip.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A506C174BB7
X-Rspamd-Action: no action

The XLCDC IP supports parallel RGB, MIPI DSI and LVDS Display.
The LCD Generic clock (sys_clk) is used for Parallel RGB and MIPI
displays, while the LVDS PLL clock (lvds_pll_clk) is used for LVDS
displays.Since both the clocks cannot co-exist together in the DT
for a given display, this patch tries sys_clk first (RGB/MIPI),
fallback to lvds_pll_clk (LVDS).

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
changes in v3:
- Rephrase the comments, err logs.
- assign NULL to sys_clk to avoid Oops error when
referenced in pwm-atmel-hlcdc.c

changes in v2:
- Rephrase the comments, commit message and err logs
- Replace dev_err wwith dev_warn
- Remove Initializing sys_clk and lvds_pll_clk to NULL post
devm_kzalloc() call
---
 drivers/mfd/atmel-hlcdc.c       | 13 +++++++++++--
 include/linux/mfd/atmel-hlcdc.h |  1 +
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/atmel-hlcdc.c b/drivers/mfd/atmel-hlcdc.c
index 4c4e35d404f3..0f83ad7ba15c 100644
--- a/drivers/mfd/atmel-hlcdc.c
+++ b/drivers/mfd/atmel-hlcdc.c
@@ -108,10 +108,19 @@ static int atmel_hlcdc_probe(struct platform_device *pdev)
 		return PTR_ERR(hlcdc->periph_clk);
 	}
 
+	/*
+	 * Retrieve one of the primary clocks required for LCD operation:
+	 * prefer sys_clk (for RGB/MIPI), and
+	 * fall back to lvds_pll_clk (for LVDS) if needed.
+	 */
 	hlcdc->sys_clk = devm_clk_get(dev, "sys_clk");
 	if (IS_ERR(hlcdc->sys_clk)) {
-		dev_err(dev, "failed to get system clock\n");
-		return PTR_ERR(hlcdc->sys_clk);
+		hlcdc->sys_clk = NULL;
+		hlcdc->lvds_pll_clk = devm_clk_get(dev, "lvds_pll_clk");
+		if (IS_ERR(hlcdc->lvds_pll_clk)) {
+			dev_err(dev, "Failed to obtain both the LCDC (generic) and LVDS PLL clocks\n");
+			return PTR_ERR(hlcdc->lvds_pll_clk);
+		}
 	}
 
 	hlcdc->slow_clk = devm_clk_get(dev, "slow_clk");
diff --git a/include/linux/mfd/atmel-hlcdc.h b/include/linux/mfd/atmel-hlcdc.h
index 80d675a03b39..07c2081867fd 100644
--- a/include/linux/mfd/atmel-hlcdc.h
+++ b/include/linux/mfd/atmel-hlcdc.h
@@ -75,6 +75,7 @@
  */
 struct atmel_hlcdc {
 	struct regmap *regmap;
+	struct clk *lvds_pll_clk;
 	struct clk *periph_clk;
 	struct clk *sys_clk;
 	struct clk *slow_clk;
-- 
2.25.1

