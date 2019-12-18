Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8758125171
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 20:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B76656EA55;
	Wed, 18 Dec 2019 19:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1071F6EA55
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 19:10:50 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id q10so1731078pfs.6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 11:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c+shghrwvHSuaCCAe91cOcF/cABrNe9ZFXBpEs6T1pk=;
 b=pZ8uPDUyofDjdToN5t1zFX7EOUoQHgElefAtWAY2a0xE3C+UzywVgYFh1cRo//8ldK
 dkxGA87VEybp7sOpx7eGEyvPyE02cVpzJh0Sz7GwLzhuxvhmE39bwoNFOrYIt6IIko8w
 59oJZCYsccwqdnIMNu4JjudoACBiEOxWsVD3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c+shghrwvHSuaCCAe91cOcF/cABrNe9ZFXBpEs6T1pk=;
 b=XKd8AOpxQXuSfWhAfDpE4cIYD/TdoMhyr1uDmfBnil3qrOEkbshjVrN5XhrloEfMce
 kOpFiWQcnlhZtOuPLIu/sblRI/j0BGYYEK44IoXzZHsbZRDjzNTvuNC1zhCk2eW64TFA
 +OdP47ua2ZjXfCr73Wtuu6UrOg6f+GaYJvANd1ddhrzdANRIT9f84WoA/e68MItBaX3s
 wI/KNEiALTuGFh8ueNOsWfcTGPBLsyhAv/j4C7PKjKq1sqq89zh33dcFd0ECi/IumYDP
 aPbzu9yfNUyTdJc1A6afoWEpIkdvASSmolD8qa5FsmiGFwoXYkNu2G/Hi+mRkrsGxVII
 7P2Q==
X-Gm-Message-State: APjAAAV66bfkrnIZDqBZyv8FJatj2BRnZNS9qr1h+gOapNehsy54F+hX
 P2OjopFMuLUfTORw2JQcqaK7Gg==
X-Google-Smtp-Source: APXvYqzWo+135srItLCIbQetR6+zfji/31rxO3bMV0dn+U+qlizWEE04ek5zqZbLuYJfUG+Gr29Dsw==
X-Received: by 2002:a62:c541:: with SMTP id j62mr4808803pfg.237.1576696249620; 
 Wed, 18 Dec 2019 11:10:49 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c809:c7d5:78ea:e014:edb4:e862])
 by smtp.gmail.com with ESMTPSA id q7sm3745855pjd.3.2019.12.18.11.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 11:10:49 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v13 5/7] drm/sun4i: dsi: Add Allwinner A64 MIPI DSI support
Date: Thu, 19 Dec 2019 00:40:15 +0530
Message-Id: <20191218191017.2895-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191218191017.2895-1-jagan@amarulasolutions.com>
References: <20191218191017.2895-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MIPI DSI controller in Allwinner A64 is similar to A33.

But unlike A33, A64 doesn't have DSI_SCLK gating so add compatible
for Allwinner A64 with uninitialized has_mod_clk driver.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Merlijn Wajer <merlijn@wizzup.org>
---
Changes for v13:
- update the changes since has_mod_clk is dropped in previous patch

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index de8955fbeb00..8669d5f0e744 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -1264,6 +1264,7 @@ static const struct dev_pm_ops sun6i_dsi_pm_ops = {
 
 static const struct of_device_id sun6i_dsi_of_table[] = {
 	{ .compatible = "allwinner,sun6i-a31-mipi-dsi" },
+	{ .compatible = "allwinner,sun50i-a64-mipi-dsi" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun6i_dsi_of_table);
-- 
2.18.0.321.gffc6fa0e3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
