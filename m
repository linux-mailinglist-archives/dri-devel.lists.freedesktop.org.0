Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F844557E4
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 10:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B386EC70;
	Thu, 18 Nov 2021 09:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0266EC71
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 09:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1637227215; x=1668763215;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NmZSdW+5LVfKmAVPKZKf41GorbnUuDSvFzzyCMsfbWk=;
 b=OrlkAz4e3oaANM5qKU8Osu5bJqgcTkRZErg+7POs7eiyine32JZ32vk0
 P73HCA+GpWMbOH/MVCsJbTcTqXYcadoEgS1xnU1zBY3zV8gnz/AYT5/di
 an9gMNThOUT24WJctUM/u4QTO/ZHpj5xIPRLIBWtOqnsSDKLQmCevQ91w
 Da32NsUDpKkGZl/nJRUDsHsQWd06KUOaVuSMnnuq1NwdU4dzDRcm4Ntih
 FAo6XXY9yddJCAbINl5+HMtFivxHMiQi9iuwS6l/0rFFDmnchGLWAZADS
 CkQQsLyDLPXq+ttw7LTfa2YI5GBMWc+yQ3LvqmvlJ2kOIqZAPfsdBnSG4 Q==;
X-IronPort-AV: E=Sophos;i="5.87,244,1631570400"; d="scan'208";a="20534723"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 18 Nov 2021 10:20:04 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 18 Nov 2021 10:20:05 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 18 Nov 2021 10:20:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1637227205; x=1668763205;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NmZSdW+5LVfKmAVPKZKf41GorbnUuDSvFzzyCMsfbWk=;
 b=obUpin4bO7+TZ9kixzEElsGKqf2eohEGNlhKB9cwJDEUakg1x6LvR9Hc
 NWS1plOM5zM9sToTtXQa/xNCZxlAbZLaw08IM0XyCqif1soBWLJ03y7ej
 kIzE5To0qt6cu5g5DrCRjY7jI/e28RUkHFVvMDojEkdPBQmMyrHS90UsQ
 uhNxoZ1eXP1y2wY1q7yC5VV03gMs8djrzbRhPKM2v3xu84ADVLAPjj4Lk
 qLKr3TfmcsBOolLorbcQ1tyRh5CbTgzExAKTHr6yNJSbnSaCZ4D4C7xEX
 Pj2kFd7p6UCx7G5+Ov/OQRrrU4VunhdWERR2IlUeUAWux23FwkVqIA8F8 Q==;
X-IronPort-AV: E=Sophos;i="5.87,244,1631570400"; d="scan'208";a="20534713"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 18 Nov 2021 10:20:03 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 2C80F280078;
 Thu, 18 Nov 2021 10:20:02 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v4 2/4] drm/bridge: ti-sn65dsi83: Make enable GPIO optional
Date: Thu, 18 Nov 2021 10:19:53 +0100
Message-Id: <20211118091955.3009900-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211118091955.3009900-1-alexander.stein@ew.tq-group.com>
References: <20211118091955.3009900-1-alexander.stein@ew.tq-group.com>
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

