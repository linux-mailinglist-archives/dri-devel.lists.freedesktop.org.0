Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A8B472D7D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 14:36:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A7910E7C7;
	Mon, 13 Dec 2021 13:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9B010E717
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 13:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1639402598; x=1670938598;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NmZSdW+5LVfKmAVPKZKf41GorbnUuDSvFzzyCMsfbWk=;
 b=DxHDCXcPehiTyiMlj4peewGKOKsW3Z0fHEMApgCUrXqejZUVe85dmGpe
 goffVOJQzH5c2N8BkX78+ononzfFc6dD1qBTkuL8blACWIk4LN01/7nzG
 mQj5hogyRoyo4uaJpYeZPnXdlKEEee81nLCbQ243AaRkAmzBbUgjudfwf
 /jT/Vw7xGrxXWjTu8iwQEHGnzeXihgBDuMLLy5rIa5jkLqx0ISb1A4KPS
 C2b9tqyZglIf28OfFMY3dhE3h7uWzJ0PqHW9jv54HNa7Ypo8XNGFPBIP+
 u1Cg6RPQr7TCqKyGtDZRDlSwrg/yEjxKmqpqsXzEa26P/hB00pi27jwUw A==;
X-IronPort-AV: E=Sophos;i="5.88,202,1635199200"; d="scan'208";a="21012624"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 13 Dec 2021 14:36:34 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Mon, 13 Dec 2021 14:36:34 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Mon, 13 Dec 2021 14:36:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1639402594; x=1670938594;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NmZSdW+5LVfKmAVPKZKf41GorbnUuDSvFzzyCMsfbWk=;
 b=Zop98oTzMsSSGvBHCFRovQoJG3cg0lGmyHvzmmihnsW8R6ahxsOSDyfJ
 tQQ+9Z0gXPFgVkz2TsJXcXA11HXThBZx7B6IAVq+Cb5oAPchokfqjVNpD
 WYEkcVoE9xxrtPCV4+mbA6E+AOVhExFo2Ed0aVKdbyMbHhwVh+T3z6SH8
 j6qM+cJRp5gMnu1EQDQOeVbJYRZDpR+eq7/3zmXZIqRrjR9JBsobx/RDx
 Wu0D6PEjYhcQnNIejDcoaNaVIw3EltlOfgxgtbulu93JfFl2n9lSkH99D
 Ocif6SJFHxV9xlJoU0JqpuQJqz/2sdQzdyWMRmPzszu7QuARiHQF7tUl6 A==;
X-IronPort-AV: E=Sophos;i="5.88,202,1635199200"; d="scan'208";a="21012623"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 13 Dec 2021 14:36:34 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 78F6E280065;
 Mon, 13 Dec 2021 14:36:34 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v5 2/4] drm/bridge: ti-sn65dsi83: Make enable GPIO optional
Date: Mon, 13 Dec 2021 14:36:24 +0100
Message-Id: <20211213133626.2498056-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213133626.2498056-1-alexander.stein@ew.tq-group.com>
References: <20211213133626.2498056-1-alexander.stein@ew.tq-group.com>
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
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The enable signal may not be controllable by the kernel. Make it
optional.
This is a similar to commit bbda1704fc15 ("drm/bridge: ti-sn65dsi86: Make
enable GPIO optional")

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 945f08de45f1..065610edc37a 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -662,7 +662,8 @@ static int sn65dsi83_probe(struct i2c_client *client,
 	}
 
 	/* Put the chip in reset, pull EN line low, and assure 10ms reset low timing. */
-	ctx->enable_gpio = devm_gpiod_get(ctx->dev, "enable", GPIOD_OUT_LOW);
+	ctx->enable_gpio = devm_gpiod_get_optional(ctx->dev, "enable",
+						   GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->enable_gpio))
 		return PTR_ERR(ctx->enable_gpio);
 
-- 
2.25.1

