Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 137F520FBB3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 20:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C076E0CB;
	Tue, 30 Jun 2020 18:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4624C6E0CB
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 18:26:48 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id v8so21986390iox.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 11:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zHkMrF1WG28iaGTof2SgLVlAgajf1uvvDa148L1A4YA=;
 b=F4bRlhY7JPlFE5MOJNhH06ubJD/AwLxDSHTkK8prEd7WJaNbBFDvroFyM7nSqG00Qh
 zC5d+FeO3qACgBJISvU47GGOic70oP3x22flzistdPNasJi0UKqQxS4c4S1sc7PWUUi4
 xJ1Vr0NWy8FyYXBmzQVtBjQ+nMkcbeOXGvwpb547MFCGBgXdN5rR+2y2OdZGN+iUAOax
 eyGf3xANMO+ot5QApAld1RaJ+fkECK+TohwDhBwwPWS5JKI4p9uLq/W1X0CN884zX3Zo
 rQx7fAnGqeoTgkMm1dwc6vbRGEP8aYycGvJWlI2LbF5LRtP3K6WJKWVy90C2pYHUjGyL
 CApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zHkMrF1WG28iaGTof2SgLVlAgajf1uvvDa148L1A4YA=;
 b=nX+iRpbVVQBDrtRhGDhdtElET/zxnHNO62FFgKOOG3I7Cd/pVngUfeCaAm2fKf3ift
 7tIlRYhZvjSe7mVHq87FVf/7lfVOwTv6EzMXK0yxLjpIlB/YWwGeUfP6DM5szRtJy+SO
 T0QzBMzE1ynXI5B2mcuVnNcbr5FKLWsgi1cStdjm8PqVBTlYaUHeCXGh+9SXmKVyJp+a
 /SF1loSXQ+ZH+dOeaCc13a7No09sMFOaLc40V6RP/zt2Q3KakvmCkLCms5NdvLzGYUmZ
 FjFjFBJs9/TuDtr0eAm8/tkBQeYzCsP5dZAFsRVgx9CMfmxIImEB5tuiFEBXWx/QhzmP
 zgqQ==
X-Gm-Message-State: AOAM532v3jaFm9wtdwnNGBA/obNk/xQb2KNb7cPEogp6+90DCjr4XdJ2
 7jLnNXO3rtl9AWBivwoj2Zk=
X-Google-Smtp-Source: ABdhPJyAPNjOe2Euzd0n2GEPfkpD1dt5csCv1TH57jPtERYO/b5rK+8mNMNPSrE+XyMWMLNVkpw8xA==
X-Received: by 2002:a6b:d809:: with SMTP id y9mr23557963iob.209.1593541607533; 
 Tue, 30 Jun 2020 11:26:47 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan (c-73-37-219-234.hsd1.mn.comcast.net.
 [73.37.219.234])
 by smtp.gmail.com with ESMTPSA id u6sm1966164ilg.32.2020.06.30.11.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 11:26:46 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-fbdev@vger.kernel.org
Subject: [PATCH] omapfb: dss: Fix max fclk divider for omap36xx
Date: Tue, 30 Jun 2020 13:26:36 -0500
Message-Id: <20200630182636.439015-1-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm/omap driver was fixed to correct an issue where using a
divider of 32 breaks the DSS despite the TRM stating 32 is a valid
number.  Through experimentation, it appears that 31 works, and
it is consistent with the value used by the drm/omap driver.

This patch fixes the divider for fbdev driver instead of the drm.

Fixes: f76ee892a99e ("omapfb: copy omapdss & displays for omapfb")

Cc: <stable@vger.kernel.org> #4.9+
Signed-off-by: Adam Ford <aford173@gmail.com>
---
Linux 4.4 will need a similar patch, but it doesn't apply cleanly.

The DRM version of this same fix is:
e2c4ed148cf3 ("drm/omap: fix max fclk divider for omap36xx")


diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss.c b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
index 7252d22dd117..bfc5c4c5a26a 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
@@ -833,7 +833,7 @@ static const struct dss_features omap34xx_dss_feats = {
 };
 
 static const struct dss_features omap3630_dss_feats = {
-	.fck_div_max		=	32,
+	.fck_div_max		=	31,
 	.dss_fck_multiplier	=	1,
 	.parent_clk_name	=	"dpll4_ck",
 	.dpi_select_source	=	&dss_dpi_select_source_omap2_omap3,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
