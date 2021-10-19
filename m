Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD94432EA4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 08:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DDD56E8A4;
	Tue, 19 Oct 2021 06:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D386E5B2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 06:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634626377; x=1666162377;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OexUDrCO45DT7y8Xa3ppCIZxrceYdrcYeP4z6z7CHck=;
 b=YJABcKgySqeoquDrAWslF+huzF/Mv/CRbbufm/6p75W1swSDJyTqNF4+
 FeuqL3maVo6GrEFPmlPkKjqB3LEp8WJllXq3akJxo2IVT1Vcy7j06iWI6
 /fL5eN2hRCq5T2cl1BRpZEeB39qs+J48ITdg4I29uqumIMMj4evaZb3vG
 jlS0e59vTYLTbJnNZ6DQ85RbWuI9j+cFBeE65ayWa6XmMTHZQgr7fdkO3
 TjHiPxTrD4eu5rMSDqotEeDwhArFlYczo9CYJqpawRHvIQ8e4ip01jDQq
 5lMXvPiT6bF7gyZv8Mx6UJDPA5Bk+RUkWnba5pxzkxrN6B2Dvvh9UqijV Q==;
X-IronPort-AV: E=Sophos;i="5.85,383,1624312800"; d="scan'208";a="20119999"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 19 Oct 2021 08:52:52 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 19 Oct 2021 08:52:53 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 19 Oct 2021 08:52:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634626372; x=1666162372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OexUDrCO45DT7y8Xa3ppCIZxrceYdrcYeP4z6z7CHck=;
 b=RVb0cOlijvaAElciX3+E/nmSL5AY41/ydYk99Y5ag9lytwloO4TrixPR
 9rsTiqdeyQNO4zc7tW35daq2K3um8tTlw7X0vrkgltKAub2l6IGFd83UW
 ymOMd90zXUkH8eLF+muKEeTbj5VGcANadN7/EJpFnYli6sGDDS1guK77+
 RiloZJU6F5DzBuuurGZxArza6XpuVR3UjISOAaaDJIIR+iqYmcXyp+rT0
 IlPz5p+QvdNgQBJbtmRSZ/Ro2R/yCbgR/kPJJ1mVFoZga5503WI9g525D
 OWW60Iyv2cwz73n5Xi3Hrrs63WkHvy0ZVPWm7r0+A0csTrCIOIx2Jtrs3 g==;
X-IronPort-AV: E=Sophos;i="5.85,383,1624312800"; d="scan'208";a="20119998"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 19 Oct 2021 08:52:52 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8ACF8280065;
 Tue, 19 Oct 2021 08:52:52 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 2/4] drm/bridge: ti-sn65dsi83: Make enable GPIO optional
Date: Tue, 19 Oct 2021 08:52:37 +0200
Message-Id: <20211019065239.969988-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019065239.969988-1-alexander.stein@ew.tq-group.com>
References: <20211019065239.969988-1-alexander.stein@ew.tq-group.com>
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
index a32f70bc68ea..9072342566f3 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -671,7 +671,8 @@ static int sn65dsi83_probe(struct i2c_client *client,
 		model = id->driver_data;
 	}
 
-	ctx->enable_gpio = devm_gpiod_get(ctx->dev, "enable", GPIOD_OUT_LOW);
+	ctx->enable_gpio = devm_gpiod_get_optional(ctx->dev, "enable",
+						   GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->enable_gpio))
 		return PTR_ERR(ctx->enable_gpio);
 
-- 
2.25.1

