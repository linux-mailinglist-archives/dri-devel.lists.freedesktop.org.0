Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA125F2198
	for <lists+dri-devel@lfdr.de>; Sun,  2 Oct 2022 08:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4746C10E0E5;
	Sun,  2 Oct 2022 06:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19B310E061
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Oct 2022 06:45:46 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id b2so16553943eja.6
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 23:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=+EFb6uk4cTnqBeI+5KKFVfi8qmpv//hil6I+XjIEg10=;
 b=Z6eZABtXZW25w/5ZyMrjoGibSALBRFTBPOZ3m9ciR8K5cg5YYtOx+uYUCdFWVGG7vC
 Fj8IrV/vXJ8t6J+fMB+I2+mkQIsc0hz6XEZxe/ffAXYEafz21v/MVLnMLO77sabS2aSm
 ma9lsFZUE903KWzEhReXmALwvDgy4P3ehuLBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+EFb6uk4cTnqBeI+5KKFVfi8qmpv//hil6I+XjIEg10=;
 b=lxABqcO1GJ7EoUNcetmZQjcjj8hdT26mIi6pBE02lyJ1Oe1Z+veYSnRbpCizP0DRn0
 9HAMJvJy+TWnyiH701epXwsr68O0RhgAiQV832s8zghpzyf7wj0w3cr6M8+20bYp0akO
 8Df+T6jlmZNe2H5oI8Rtn0wD2z1O3cRk81JdsYR6TaEMygKWiRzGxJQ6nbw+vpwVAN4g
 lh9o1UAIR56DC2DEmz462xMJv33+pY2RpKwB3FHy0j8479j0/4J3h4BePD/rpWJx8TEY
 t8UGowjzGqIwbnaX2ynRcuWon5tyxtiuxxMZBlYBeGMgh+ZY/BGVqLgJsW6/Ba3pEmkt
 G3AA==
X-Gm-Message-State: ACrzQf1UYywMyVdZ5AltzDTuyU7ZRcn248TC1IqA34ghgp55jMH5Dabx
 gDy8cK1UFPxpix0icONJpWYsMw==
X-Google-Smtp-Source: AMsMyM4B5NnmV+Vv6ol70KZMuL8JEVXI/URE4cg0VGwaJQnYUbGUUGOKtgaodi64X9B7RZP0ZmTX1Q==
X-Received: by 2002:a17:907:160d:b0:782:bc5d:162e with SMTP id
 hb13-20020a170907160d00b00782bc5d162emr11502660ejc.291.1664693145088; 
 Sat, 01 Oct 2022 23:45:45 -0700 (PDT)
Received: from panicking.. ([109.52.206.103]) by smtp.gmail.com with ESMTPSA id
 26-20020a170906329a00b0077f5e96129fsm3569894ejw.158.2022.10.01.23.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 23:45:44 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [RFC PATCH 1/4] phy: add PHY_MODE_TTL
Date: Sun,  2 Oct 2022 08:45:37 +0200
Message-Id: <20221002064540.2500257-2-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221002064540.2500257-1-michael@amarulasolutions.com>
References: <20221002064540.2500257-1-michael@amarulasolutions.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org,
 Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are combo phys out there that can be switched between doing
dsi, lvds, and ttl. So add a mode definition for it.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 include/linux/phy/phy.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index b1413757fcc3..87ae8c27ec57 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -42,7 +42,8 @@ enum phy_mode {
 	PHY_MODE_MIPI_DPHY,
 	PHY_MODE_SATA,
 	PHY_MODE_LVDS,
-	PHY_MODE_DP
+	PHY_MODE_DP,
+	PHY_MODE_TTL
 };
 
 enum phy_media {
-- 
2.34.1

