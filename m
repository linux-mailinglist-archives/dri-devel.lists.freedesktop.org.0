Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD40677F182
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 09:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C578D10E1C4;
	Thu, 17 Aug 2023 07:52:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCD310E1BD
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 07:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1692258759; x=1723794759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1opuc7UbiZ6e9xxBngBW670+B2sfEzCgYTvBypTtAoI=;
 b=fcZ9gZqoZcorIw2vcvVj7bEoViIhAyJRiRYJ1V3hDlPURGn2QzLSsh91
 TJNgJwZXhDMGzQwHPF3wgBr852T5dYUz7ijH07ayzByL9eg3py3PHCVGk
 9zFaSLu326SotYjMl6STJAss1p6ivYhLwSfaXOVK/3M6kXtUGsZZDNqE3
 RgbKp7MurCdd058kBzSZUgYAkI/sy4RHbA/yFJXCPgu7EGI1mj02u5HQH
 uFyC4/GZ0+rkCRekxR3pI8Raxy677VS8m2u6v8RoPluAhAgh9DZfWJE0b
 1p5zP1BOO8Fp1gbJPxgHSu8RfPVRSerL6TmxLoPAdt5WIfJqliKQbiRnT A==;
X-IronPort-AV: E=Sophos;i="6.01,179,1684792800"; d="scan'208";a="32486940"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 17 Aug 2023 09:52:35 +0200
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id BE2CA280085;
 Thu, 17 Aug 2023 09:52:35 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] drm: bridge: tc358767: Only print GPIO debug output if
 they actually occur
Date: Thu, 17 Aug 2023 09:52:34 +0200
Message-Id: <20230817075234.1075736-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817075234.1075736-1-alexander.stein@ew.tq-group.com>
References: <20230817075234.1075736-1-alexander.stein@ew.tq-group.com>
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

Currently the output the following output is printed upon each interrupt:
 tc358767 1-000f: GPIO0:
This spams the kernel log while debugging an IRQ storm from the bridge.
Only print the debug output if the GPIO hotplug event actually happened.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/tc358767.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index c07312ea9dc05..91534941a6d49 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2044,11 +2044,11 @@ static irqreturn_t tc_irq_handler(int irq, void *arg)
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

