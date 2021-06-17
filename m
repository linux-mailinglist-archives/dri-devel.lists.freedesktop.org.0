Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBE33AB262
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 13:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215976E8FA;
	Thu, 17 Jun 2021 11:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316A56E8FA
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 11:21:25 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id v12so2747715plo.10
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 04:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K6R0FEjF7oq2KNX8VeWTVUIbsW8u4UsYJd42ph9pC1A=;
 b=PcR1UbEaott76KwONcj2/b42uiSTpdpLzTRqYZ7Zis8SWGf7xyLwEn0GtL2ne1L+18
 wCfph9vmWzbdYnI6FcinYpwauKitP4wABDd1thfzdQ8MFeDrug5xwuCK70rswtCJV4kl
 DyuefhJG2uPvwl1t4tvgJJGOKBtsJ+NrjRPZ4oJn9/cEn8FHu2qmwqFwz9zjvKa8lX/i
 fcWd+mi4caT1DaltYD+vwJ7KtPfhHlDN3yGdgeXN9SwaHQAfYoJIdBj48lxEyzsWaN4Q
 W2A4uQo129ywnOx83HHPm7MFgLVrEPH3aSxiqUTThVhU3bwUVa7jhWMKMDxKgPdko1Iq
 NREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K6R0FEjF7oq2KNX8VeWTVUIbsW8u4UsYJd42ph9pC1A=;
 b=VbfcDjf1UbYUExmxCrflBB2MRUN2CiWYJdJ60uMUHZENh44nmFJ2Um3IXOruoJMT+Z
 WCWaYHf8k9aO7kGX8oEpnZONRr8x1v63KGNOIgTDAQTRmXTcTDa8L6FipgMAVaM3c+Fu
 su3cy499HHIGD9+KkSNJm7qi1ShZgXZXL18ndXJq28oj9YRe+5HZNM5+QyorMCqKg12+
 6KJpAXfi6pjQ7v/DXTXWM/sfuHEj5gwIJ8L+hHB2wzXO3hEH2VrwkWZwa1PKZLe+H4SF
 j2W1/PKl+jShJzCDB+OfWLU1B/qKpcuWSqgcG58qkQ3wwcPPnXSRNnmoxm8oidyx3A6a
 vzIw==
X-Gm-Message-State: AOAM533REbTldR9uw0XbRc4HhNJdzMySdpGdQvM4/jfqKbumHaAMRYg5
 eVIO5raRVW/sMlwAIGCLUbs=
X-Google-Smtp-Source: ABdhPJysJyKGyvAca3XdWxeEe9FRr9MA/N49yAGeiH7inBCWjDFaoXYUfLRacqfnq1+IFe3kS5rdsg==
X-Received: by 2002:a17:902:c407:b029:106:302e:534 with SMTP id
 k7-20020a170902c407b0290106302e0534mr4068908plk.17.1623928884766; 
 Thu, 17 Jun 2021 04:21:24 -0700 (PDT)
Received: from 167-179-157-192.a7b39d.syd.nbn.aussiebb.net
 (167-179-157-192.a7b39d.syd.nbn.aussiebb.net. [167.179.157.192])
 by smtp.gmail.com with ESMTPSA id v67sm5035585pfb.193.2021.06.17.04.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:21:24 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: ti-sn65dsi83: Fix null pointer dereference in
 remove callback
Date: Thu, 17 Jun 2021 21:19:25 +1000
Message-Id: <20210617111925.162120-1-net147@gmail.com>
X-Mailer: git-send-email 2.32.0
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
Cc: Marek Vasut <marex@denx.de>, Jonathan Liu <net147@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If attach has not been called, unloading the driver can result in a null
pointer dereference in mipi_dsi_detach as ctx->dsi has not been assigned
yet.

Fixes: ceb515ba29ba6b ("drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and SN65DSI84 driver")
Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 750f2172ef08..8e9f45c5c7c1 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -671,8 +671,11 @@ static int sn65dsi83_remove(struct i2c_client *client)
 {
 	struct sn65dsi83 *ctx = i2c_get_clientdata(client);
 
-	mipi_dsi_detach(ctx->dsi);
-	mipi_dsi_device_unregister(ctx->dsi);
+	if (ctx->dsi) {
+		mipi_dsi_detach(ctx->dsi);
+		mipi_dsi_device_unregister(ctx->dsi);
+	}
+
 	drm_bridge_remove(&ctx->bridge);
 	of_node_put(ctx->host_node);
 
-- 
2.32.0

