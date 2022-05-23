Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7444D5307BD
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 04:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE05410E202;
	Mon, 23 May 2022 02:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9ED610E28E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 02:38:11 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id q4so11849266plr.11
 for <dri-devel@lists.freedesktop.org>; Sun, 22 May 2022 19:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SCo+/6Dp4ecMyx6QNBbOhrueItFKCDaZsh/nXDu21/Q=;
 b=KGrKQnUUU7VYp7oY1krEq1Dxac6fcHVjyMu04Zlf5yf4eWdtjEzZyrrkpDQAE3bQdR
 zPNoDecL6J8lCvnvlFCaFO16fDRmHi1/8Mn9DahQQZMjUjLoaBdk8t1u0QI6T/6Nx3tO
 kojSMZ42poyxlAR5Nb58aO26fM6BV7VyFyNdfpSR6YCkOaBe7qtvB4sKS/WfQt98O3tS
 p5jQxyloh7VG6oRlRIHEg0GqETp5K5UXfWeEUZvlS7rUYM2lYyhDRnEab0MA+GeDuaKy
 i80fFaNLir+8GXMG+rEVqrwRIEqQS0Hh11+fxvZdOilmfjNauXtmMcAQYCAakvCh27PF
 /zqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SCo+/6Dp4ecMyx6QNBbOhrueItFKCDaZsh/nXDu21/Q=;
 b=l3UYh81JDOFUYiAvuodL2j2XISZcdtRiioMc34ifr/IxYmnLJYI7gTAlmXBnmWeyDp
 klc86c99rKMSHAbMTmwnunYMUKWRzD/TzzOzlvCzMnoh+Z+6eLKqlsSCn+QKMFw33gwt
 dZ5ke/86PoKhy55cp/mOBIanmgOzHRB2XDWP9FaXnuY699luysRXs8ay9//pFNLBGegd
 fZ/IYECEZtF9Hhsi/7/fR/DlzWQTBKucyVwhKiRUgdfPTEHam3h6PI9V/PrF2swMJkzA
 QKvqpjVsBeyBQlBFyzXT356bmytmswzpzWvwaIgbqIFZtoYwufaGGjdS5vDBYe/Yy9aI
 yhGA==
X-Gm-Message-State: AOAM532gh6QWXcC8NbqXZMtTJ25t9tnSf++2nYy5SEgzPB2qkLV4Chvb
 LtTZT6lDBGGTR9++ZW01v4g=
X-Google-Smtp-Source: ABdhPJyDVzE2P4ymfaOGVOOmfUl6s5sR7i3Bo99wlzNrSFcEA67aq2i5jvFGmxnaYPhaiREBxKGXsQ==
X-Received: by 2002:a17:902:f144:b0:15e:cd78:e36e with SMTP id
 d4-20020a170902f14400b0015ecd78e36emr21159798plb.144.1653273491169; 
 Sun, 22 May 2022 19:38:11 -0700 (PDT)
Received: from 167-179-157-192.a7b39d.syd.nbn.aussiebb.net
 (167-179-157-192.a7b39d.syd.nbn.aussiebb.net. [167.179.157.192])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a63be06000000b003c66480613esm3579768pgf.80.2022.05.22.19.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 19:38:10 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: bridge: icn6211: Adjust clock phase using SYS_CTRL_1
Date: Mon, 23 May 2022 12:38:00 +1000
Message-Id: <20220523023801.410050-1-net147@gmail.com>
X-Mailer: git-send-email 2.36.1
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
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The code from [1] sets SYS_CTRL_1 to different values depending on the
desired clock phase (0, 1/4, 1/2 or 3/4). A clock phase of 0 aligns the
positive edge of the clock with the pixel data while other values delay
the clock by a fraction of the clock period. A clock phase of 1/2 aligns
the negative edge of the clock with the pixel data.

The driver currently hard codes SYS_CTRL_1 to 0x88 which corresponds to
aligning the positive edge of the clock with the pixel data. This won't
work correctly for panels that require aligning the negative edge of the
clock with the pixel data.

Adjust the clock phase to 0 if DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE is
present in bus_flags, otherwise adjust the clock phase to 1/2 as
appropriate for DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE.

[1] https://github.com/tdjastrzebski/ICN6211-Configurator

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 47dea657a752..df0290059aa3 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -57,6 +57,10 @@
 #define BIST_CHESS_XY_H		0x30
 #define BIST_FRAME_TIME_L	0x31
 #define BIST_FRAME_TIME_H	0x32
+#define CLK_PHASE_0		0x88
+#define CLK_PHASE_1_4		0x98
+#define CLK_PHASE_1_2		0xa8
+#define CLK_PHASE_3_4		0xb8
 #define FIFO_MAX_ADDR_LOW	0x33
 #define SYNC_EVENT_DLY		0x34
 #define HSW_MIN			0x35
@@ -414,7 +418,11 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
 	chipone_configure_pll(icn, mode);
 
 	chipone_writeb(icn, SYS_CTRL(0), 0x40);
-	chipone_writeb(icn, SYS_CTRL(1), 0x88);
+
+	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE)
+		chipone_writeb(icn, SYS_CTRL(1), CLK_PHASE_0);
+	else
+		chipone_writeb(icn, SYS_CTRL(1), CLK_PHASE_1_2);
 
 	/* icn6211 specific sequence */
 	chipone_writeb(icn, MIPI_FORCE_0, 0x20);
-- 
2.36.1

