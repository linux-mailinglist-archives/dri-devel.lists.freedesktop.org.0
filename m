Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5F69613B7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 18:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E069D10E372;
	Tue, 27 Aug 2024 16:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=tuxon.dev header.i=@tuxon.dev header.b="BviZhr6r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3852110E36F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 16:12:47 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a86933829dcso647138166b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 09:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1724775165; x=1725379965; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=41QfeVXp3bRAaO6YVHwo1Hn8U4dlul/y2Bh2kt4jOQ0=;
 b=BviZhr6rgQEZjzmRYvyBphU1JQHCtl5dam9FEFvcvrf6DCNImdTP+atoKvJuyZDq8f
 qSkHLtDZZzdKyBe/oDpLZ3I60rqW4yXiLL77ruGTmSFSP6YoqRvIwXqIuDiMFEEHVFy9
 oxPZvcsnAJTUcPJsbKwf0VjkzfVEE7HjtgYDPP5b+STfBt4kwN0YesGBvkOnmkDYAg/q
 9AUgaPnOJxYrwNqb9Jn+01BPeaU+7yd3XXiIRqVyiF8JqeEwdU0UP0buj+YRn1EBKBIL
 5UaQ7LjyyR/xVexohnQLqBZmbTXzI3/qtfj1wWuozrYXbS09cFcASrvozdeSwJPIzTM3
 v4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724775165; x=1725379965;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=41QfeVXp3bRAaO6YVHwo1Hn8U4dlul/y2Bh2kt4jOQ0=;
 b=bv9cCFE+/+HpG59q1kwRiyxsow7eEN2okCiq5WCfo4fPT6RwNbqQqPlUIFQkjcbK9q
 x7Ivq4e5g8hdWPOxUeoGQfeWk7oMQfxOGZzm8AyuYrLsR/LlUVvZOXHj3Or/hgHe4c9F
 sNaxE5VncgIQxhyXTamrgAOlicADuKDrBwCcyJvdjzc75bfDKr0zdAD6gmMJBgBDKBq8
 t1oyNSEtweKSohJMA4bCuivZPNGw3o10EpZeqxms5wd228vhd9s8bsKAs5Sj1aY0z/e+
 KD2FG/JAkxIOljsv2LcevU1AlopYStCICsWborRu3d4B+/lr8mB4QZICgt210TOaAGTU
 2hiQ==
X-Gm-Message-State: AOJu0YwYPiBOVYgFIDGOFy1J1vpsxygNIfEv4dIfz2PGkYyBMQ8q1Rvz
 ZbTbOaizzIrsi1IPIRlEK7QCwpNTDB/7zoez+PpiZdb5BcyKuMC9Jz/jXv3IvoM=
X-Google-Smtp-Source: AGHT+IF7Sm59AQfRh7cKuFyeiTLq5Ik6e0LG6qqZKMbHSfWuyELRqfPU3FbNqtC11ZbZBKOAMALa8w==
X-Received: by 2002:a17:907:971d:b0:a77:eb34:3b4e with SMTP id
 a640c23a62f3a-a86a518b26amr1091013566b.7.1724775165553; 
 Tue, 27 Aug 2024 09:12:45 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e54b50dbsm127893966b.93.2024.08.27.09.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 09:12:45 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: manikandan.m@microchip.com, dharma.b@microchip.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, hari.prasathge@microchip.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 claudiu.beznea@tuxon.dev
Subject: [PATCH 1/3] drm/bridge: microchip-lvds: Revert clk_prepare_enable()
 in case of failure
Date: Tue, 27 Aug 2024 19:12:21 +0300
Message-Id: <20240827161223.4152195-2-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827161223.4152195-1-claudiu.beznea@tuxon.dev>
References: <20240827161223.4152195-1-claudiu.beznea@tuxon.dev>
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

In case pm_runtime_get_sync() fails the clock remains enabled. Disable
it to save power on this failure scenario.

Fixes: 179b0769fc5f ("drm/bridge: add lvds controller support for sam9x7")
Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/gpu/drm/bridge/microchip-lvds.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
index b8313dad6072..027292ab0197 100644
--- a/drivers/gpu/drm/bridge/microchip-lvds.c
+++ b/drivers/gpu/drm/bridge/microchip-lvds.c
@@ -125,6 +125,7 @@ static void mchp_lvds_enable(struct drm_bridge *bridge)
 
 	ret = pm_runtime_get_sync(lvds->dev);
 	if (ret < 0) {
+		clk_disable_unprepare(lvds->pclk);
 		dev_err(lvds->dev, "failed to get pm runtime: %d\n", ret);
 		return;
 	}
-- 
2.39.2

