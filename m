Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0C47EF7F7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 20:44:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A657C10E76B;
	Fri, 17 Nov 2023 19:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D9610E76B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 19:44:15 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3b6cfc62514so1143495b6e.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 11:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700250254; x=1700855054; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dm+B9LqpTKhZJZ6afsKQk2fW35ugV3YMPYGBr869QBA=;
 b=BzVRwBQIJUx65pnerJtqy2I+uE3g45fHDtT+U2SplGAfaU4M7ZJ0SQMepfy65YnyOT
 wdoxtaQ65TUk40gQC0iZNoQCMsc64aQXe9D26ToyE9fphflYUolFOu6wFuwlhYFirK06
 KiSkAV0E87L7sZgg5+BcqNfE/k0LekitDA27DS86Jwh9NdBmRwomHHcMXlCb61gUuwfq
 iPUna3BkNX+iNiffnTd88dBo6jEdLAbGNPcera41ZEIcM2/QHqT5n4lx1plf2f83s1JO
 ZM6reyzUkFteJ81ci40q3R2/Wdj36Z/Nv+tEiF7lRWlDSgU576jk44njUbYp4ZCHyCuc
 A/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700250254; x=1700855054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dm+B9LqpTKhZJZ6afsKQk2fW35ugV3YMPYGBr869QBA=;
 b=BEGltz1lxWag735q9bLxPmUdNSz8MS/DoyYq6q3ha2bUfMtksUleEymk9VXb8BlXlC
 vKOUXI2kKv0X05pBmUoX0N0GRiTrP5kh2XxFuqkDus6QmyHSKJT3cyTf69vwK1KcFUDQ
 nNqdd5fuiY9NhXkBcqfeYWfGQ2D5rCp3hb9YSRTXIukuYTJbCNuZ60nRCFEOKpACMh2N
 nWtuX4jQjTg/LhVklC+UE5Mk2F34QIqdmdSwrJbt7Fh6NcWTXg9Fq+fnofxFo5IagpeH
 UP+kl9gK5VSagn3VH5Ib5lDVYmzSeBalOsK+mOBfLCfe6HQrV83DCHx3yk+v7GhikR48
 Jc1A==
X-Gm-Message-State: AOJu0Yy7gPMZQB3eZ7firD0QwNY0xKsJ3J1yAg88HjAyXB4XJjtKswOY
 RsKU7oaFXvJukRoLkClrwtck4SorDdQ=
X-Google-Smtp-Source: AGHT+IGtvecZpvLRkI5fvhAzyW7c77PVwxoPyk7O2QfCWDl9Uh5UDWR8OWKBw+kMQX6hvXASREYHyw==
X-Received: by 2002:a05:6808:1a28:b0:3b2:db2f:9f2 with SMTP id
 bk40-20020a0568081a2800b003b2db2f09f2mr3037522oib.15.1700250252709; 
 Fri, 17 Nov 2023 11:44:12 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a056830108500b006cd099bb052sm338193oto.1.2023.11.17.11.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 11:44:12 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 4/5] drm/panel-elida-kd35t133: Drop shutdown logic
Date: Fri, 17 Nov 2023 13:44:04 -0600
Message-Id: <20231117194405.1386265-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231117194405.1386265-1-macroalpha82@gmail.com>
References: <20231117194405.1386265-1-macroalpha82@gmail.com>
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
Cc: quic_jesszhan@quicinc.com, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

The driver shutdown is duplicate as it calls drm_unprepare and
drm_disable which are called anyway when associated drivers are
shutdown/removed.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index 29b4ee63d83b..fea3d9e84905 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -296,27 +296,11 @@ static int kd35t133_probe(struct mipi_dsi_device *dsi)
 	return 0;
 }
 
-static void kd35t133_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct kd35t133 *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = drm_panel_unprepare(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to unprepare panel: %d\n", ret);
-
-	ret = drm_panel_disable(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to disable panel: %d\n", ret);
-}
-
 static void kd35t133_remove(struct mipi_dsi_device *dsi)
 {
 	struct kd35t133 *ctx = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	kd35t133_shutdown(dsi);
-
 	ret = mipi_dsi_detach(dsi);
 	if (ret < 0)
 		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
@@ -337,7 +321,6 @@ static struct mipi_dsi_driver kd35t133_driver = {
 	},
 	.probe	= kd35t133_probe,
 	.remove = kd35t133_remove,
-	.shutdown = kd35t133_shutdown,
 };
 module_mipi_dsi_driver(kd35t133_driver);
 
-- 
2.34.1

