Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0F48BB60E
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D755A112A0C;
	Fri,  3 May 2024 21:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="kaguv1m6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029821132A3
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:37:51 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1ec5387aed9so1022235ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772271; x=1715377071;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rL+8TR+FVEOGHEmIclktS5Eo1OM2fp+pjfqU2SfLZsA=;
 b=kaguv1m68kEa2Fqi/Wvpr5LjSRxLgwD+5b4oxTI8kyhAd/wkOP14g53S7NEdj2uzay
 8cvhlBI8nsq432QcC+m1CXnmharN6mMHheJ8LaySVlr7I+bgvFuX9RK3kHMO4X/qO5x5
 Nq/WVgGTU4r1H2Pdq/cGXLiL1R8l0e9LLjms4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772271; x=1715377071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rL+8TR+FVEOGHEmIclktS5Eo1OM2fp+pjfqU2SfLZsA=;
 b=ge5494kF6Jw5hKsbfasuu7vVAhYPoxxmfmfvHR/jxFLhHdMvN+mVCN30/W3VYxHuTG
 q+zSr8ucJljtzY/IRwQ9b1m9q22dSnZIrsgC4FmaVJeZ3T5J/1FVmNfvXQUlfUJ1mcLl
 YJymNnqGyt0Xs5qgKQVkH7Oe4fGqMLCodDmpm5LM3B6qu3XYwkhGllYjE4zyls7KvePf
 x8hsMuaDj0X/SGkDLFS7/TkipgVr3KA1i5/ck0/dZiVIMJ9d/poC2Ye9xfpu5h+wrJMT
 nFNyGb0c2CIB97ukGpn/roJhDKqKFAK8bi3+dRWPFC732QLsWTEjue+dwduYejlvQsU2
 uj4A==
X-Gm-Message-State: AOJu0Yz7d7LcuCZBtVkzDcD+b/EB7RFw3DWEOkAkNr6JgvUWSWNXiuvQ
 /Ob5TB1pwU6/5du5rl6Ai2TnP68lpL2ttQLvAhIsEIMEAz99O833ENSNaXod5w47wXN9eebsPAY
 8DQ==
X-Google-Smtp-Source: AGHT+IGqOILtOMpTQpdNPww4A4HTkoN+afOAFJGfdSt9UtYlGc1IDjYPsnnRSAg9cfQkss7IrOZqZQ==
X-Received: by 2002:a17:902:b495:b0:1ea:f7d4:cf2b with SMTP id
 y21-20020a170902b49500b001eaf7d4cf2bmr3601945plr.17.1714772271011; 
 Fri, 03 May 2024 14:37:51 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:37:50 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Marco Franchi <marco.franchi@nxp.com>, Fabio Estevam <festevam@denx.de>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 37/48] drm/panel: seiko-43wvf1g: Don't call disable at
 shutdown/remove
Date: Fri,  3 May 2024 14:33:18 -0700
Message-ID: <20240503143327.RFT.v2.37.Ief712fb6720cb98bdf9ec8644362d028b6554f9b@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240503213441.177109-1-dianders@chromium.org>
References: <20240503213441.177109-1-dianders@chromium.org>
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

It's the responsibility of a correctly written DRM modeset driver to
call drm_atomic_helper_shutdown() at shutdown time and that should be
disabling / unpreparing the panel if needed. Panel drivers shouldn't
be calling these functions themselves.

A recent effort was made to fix as many DRM modeset drivers as
possible [1] [2] [3] and most drivers are fixed now.

A grep through mainline for compatible strings used by this driver
indicates that it is used by IMX boards. As far as I can tell, all IMX
boards are now correctly calling drm_atomic_helper_shutdown() so we
can remove the calls.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Cc: Marco Franchi <marco.franchi@nxp.com>
Cc: Fabio Estevam <festevam@denx.de>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: imx@lists.linux.dev
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
index 98480904126c..8a3fe531c641 100644
--- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
+++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
@@ -243,14 +243,6 @@ static void seiko_panel_remove(struct platform_device *pdev)
 	struct seiko_panel *panel = platform_get_drvdata(pdev);
 
 	drm_panel_remove(&panel->base);
-	drm_panel_disable(&panel->base);
-}
-
-static void seiko_panel_shutdown(struct platform_device *pdev)
-{
-	struct seiko_panel *panel = platform_get_drvdata(pdev);
-
-	drm_panel_disable(&panel->base);
 }
 
 static const struct display_timing seiko_43wvf1g_timing = {
@@ -306,7 +298,6 @@ static struct platform_driver seiko_panel_platform_driver = {
 	},
 	.probe = seiko_panel_platform_probe,
 	.remove_new = seiko_panel_remove,
-	.shutdown = seiko_panel_shutdown,
 };
 module_platform_driver(seiko_panel_platform_driver);
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

