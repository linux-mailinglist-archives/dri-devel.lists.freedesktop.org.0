Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 628B896BB91
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 14:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3B610E776;
	Wed,  4 Sep 2024 12:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="WUdbyL1K";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="mZXwE9sr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033DF10E776
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 12:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1725451567; x=1756987567;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d5Md8bHzoNzLwbzoZBJBctmmy6rpnRNZXRRNsmdR80A=;
 b=WUdbyL1KzDPv6fJpK90JDDVmGJiuGZIsFi7GHHgofpuRmFABiJUZowhK
 My7q9U7bA76sCEn+xcQMVvLcOK2E+6RCZHGdk1AkE/hTNolhEXOFwUjk/
 XID7du7OEhJRouj+m6QAqF+LLj4MaHG9YOtNmYxoD6km1RDdC07JiLlm9
 UIf4M9IP6AvLDHHZYxxrIofWbZdhcp6WG3et7i/lTcKj+G2KwEXwTrQpq
 C5w1WxWfTB8m7D5sA5NVCZLceBc4rjkCXYUksM1Ace44wKUjcNKqMAuf6
 0gZyIfeM8LVNn+iMzI50dQRXVCZb+2jc0aH6sNKTtRCJSeCvmiF87NN5E A==;
X-CSE-ConnectionGUID: sGVoKHSITN6Yi/ND3hv12g==
X-CSE-MsgGUID: MeWdwC68Q7iKf38XIjDxpw==
X-IronPort-AV: E=Sophos;i="6.10,201,1719871200"; d="scan'208";a="38762447"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 04 Sep 2024 14:06:06 +0200
X-CheckPoint: {66D84D2E-1E-6568578B-E2E34638}
X-MAIL-CPID: 224E837B4563D50180A4D2595120254A_3
X-Control-Analysis: str=0001.0A782F18.66D84D2E.0133, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C7C9B160024; Wed,  4 Sep 2024 14:06:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1725451562; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=d5Md8bHzoNzLwbzoZBJBctmmy6rpnRNZXRRNsmdR80A=;
 b=mZXwE9srDpVPK4vusd1EIw1J/Nq/EsMxEb2XR2h9C55c1ibJAjgREedv9YoXLQHhj4mBUU
 DY98wSXReoqsw908xBedZtSSX8D8zX2cO1PQmuyOnqYbRn91N4Jsv3+DHFuMf/JEvy/xpD
 8Qudxn1jJep61CqBfh8GVI9xFIlya4I+up9rW7hVYJws5q0z4jfX9WIQXVJsKr3FEXxaYq
 n7CmQTVSL6uFRrQHdAWIPnoLFfjKtugL56Mwb/bHYntrP+ZiozVKwGIvu/W3dc+CVF/VD3
 cQ3KDx2USyvw12/P4WQHetuOGqjaVMYBsCnWGlEUEVu/vaL9ECqlBOYEs92t5g==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] drm/bridge: tc358767: Only print GPIO debug output if
 they actually occur
Date: Wed,  4 Sep 2024 14:05:44 +0200
Message-Id: <20240904120546.1845856-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904120546.1845856-1-alexander.stein@ew.tq-group.com>
References: <20240904120546.1845856-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

Currently the output the following output is printed upon each interrupt:
 tc358767 1-000f: GPIO0:
This spams the kernel log while debugging an IRQ storm from the bridge.
Only print the debug output if the GPIO hotplug event actually happened.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Robert Foss <rfoss@kernel.org>
---
 drivers/gpu/drm/bridge/tc358767.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 5ef33ce33dcaa..1c42c8c6e632e 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2229,11 +2229,11 @@ static irqreturn_t tc_irq_handler(int irq, void *arg)
 		bool h = val & INT_GPIO_H(tc->hpd_pin);
 		bool lc = val & INT_GPIO_LC(tc->hpd_pin);
 
-		dev_dbg(tc->dev, "GPIO%d: %s %s\n", tc->hpd_pin,
-			h ? "H" : "", lc ? "LC" : "");
-
-		if (h || lc)
+		if (h || lc) {
+			dev_dbg(tc->dev, "GPIO%d: %s %s\n", tc->hpd_pin,
+				h ? "H" : "", lc ? "LC" : "");
 			drm_kms_helper_hotplug_event(tc->bridge.dev);
+		}
 	}
 
 	regmap_write(tc->regmap, INTSTS_G, val);
-- 
2.34.1

