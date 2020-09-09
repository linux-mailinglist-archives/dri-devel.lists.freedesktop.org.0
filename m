Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8821263E99
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 09:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD286E23D;
	Thu, 10 Sep 2020 07:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF3B6ECAB
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 19:02:20 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a9so3470713wmm.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 12:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C5BanKhi0v3vlOO/CZA+lZIZgxy5a1H/JGqfzet+ZBg=;
 b=tUgY/1fYk5Kq+fvcwA0lHtkxZI0KcXPOUUiv4CLIsFYUhCg36sr+Nu8GRq1dChywgY
 QBMR7qdX/I7qDOmqr8bCf4B9leYrX1WtA2xyeWik/zA4Us606HG9fnd6hfalnKmI5oci
 5nRh8wK64RyBxLekIAcJAgErFVGD5flo5WayxD/DttKWoOWg+fDFV8aR0eNnuL0cvsUz
 2g2wZv6SB7E+4or2hdOgLwXymUHPSaRNeTk5BYHNGpSAIQVJ5F/5YdUaXaFhZAXPmII3
 BPx4ZO1KfaR9PIfDIcoYu95JjFt9lcJj8cUjkvJ5cM8RH9E3quhwUpaHtNPjDmy93/m9
 5rHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C5BanKhi0v3vlOO/CZA+lZIZgxy5a1H/JGqfzet+ZBg=;
 b=kjbLnidR4AbQW9iQR7RFc5Px0Gf41aHPE+9BfXNLNmVUGLn+9FIIqLj7anvlRMPiUX
 6DDohZ4drWJqg2V1KDbJ4wg4B1H9jsXW+V9jegk0LBHOU5XnDHdycE4ZT7eKkH2c1Qxp
 Kcs7JQY57RbojFGjU6HeAPcrUfFt122h1hODIywycYOziIjkouVlI4nUGPu7fUhXGLvQ
 BKtjdYbThKpeL2D7QpSUUpjjgPhe2O3ISBAqx/utD5IQyWNCkuViX/qQxnSipPY33MMi
 XyKOFoXgHaeWuduTRhbZ2N9hwb+MEFcKvbLTTDjd4k9MdLsI5SBpdGYJSKg4WO5CyUzs
 Gf9g==
X-Gm-Message-State: AOAM530CX7bdGnONub3ppRjphnDRopeQnjqxvbwGtnWtktWKi4B78gYT
 pAbHZ7CUW01zLBOK/b+oLME=
X-Google-Smtp-Source: ABdhPJwPBWKRAcgWTlrUQmnl/uCGo1O0YqG+z6a3TYA8X/Jkm6kTxwS/lTyuEMN5Yq9AedMRaZYfzg==
X-Received: by 2002:a1c:5641:: with SMTP id k62mr5238839wmb.13.1599678139157; 
 Wed, 09 Sep 2020 12:02:19 -0700 (PDT)
Received: from localhost.localdomain
 (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
 by smtp.gmail.com with ESMTPSA id f23sm593788wmc.3.2020.09.09.12.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 12:02:18 -0700 (PDT)
From: Alex Dewar <alex.dewar90@gmail.com>
To: 
Subject: [PATCH] drm/bridge: dw-mipi-dsi: Use kmemdup cf. kmalloc+memcpy
Date: Wed,  9 Sep 2020 20:02:08 +0100
Message-Id: <20200909190213.156302-1-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Sep 2020 07:22:25 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Antonio Borneo <antonio.borneo@st.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Philippe Cornu <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org,
 Markus Elfring <elfring@users.sourceforge.net>,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Alex Dewar <alex.dewar90@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kmemdup can be used instead of kmalloc+memcpy. Replace an occurrence of
this pattern.

Issue identified with Coccinelle.

Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 52f5c5a2ed64..7e9a62ad56e8 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -1049,12 +1049,10 @@ static void debugfs_create_files(void *data)
 	};
 	int i;
 
-	dsi->debugfs_vpg = kmalloc(sizeof(debugfs), GFP_KERNEL);
+	dsi->debugfs_vpg = kmemdup(debugfs, sizeof(debugfs), GFP_KERNEL);
 	if (!dsi->debugfs_vpg)
 		return;
 
-	memcpy(dsi->debugfs_vpg, debugfs, sizeof(debugfs));
-
 	for (i = 0; i < ARRAY_SIZE(debugfs); i++)
 		debugfs_create_file(dsi->debugfs_vpg[i].name, 0644,
 				    dsi->debugfs, &dsi->debugfs_vpg[i],
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
