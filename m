Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FF28AADD2
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 13:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB7910FB52;
	Fri, 19 Apr 2024 11:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=t-argos.ru header.i=@t-argos.ru header.b="ifhZew8n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.t-argos.ru (mx1.t-argos.ru [109.73.34.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C2410FB52
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 11:41:18 +0000 (UTC)
Received: from mx1.t-argos.ru (localhost [127.0.0.1])
 by mx1.t-argos.ru (Postfix) with ESMTP id 74111100002;
 Fri, 19 Apr 2024 14:41:00 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-argos.ru; s=mail;
 t=1713526860; bh=Oz98kO5d2CRgHIhhts09UkblHczkJlM9GxaDLSU3MbM=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=ifhZew8n+bJoZAJVgEmZ3QT13pxjZS/p1IixrY7L5mnBHI+yGIkW6dvgJZqnL++aw
 UcQW+EoxYfZwyDtqDw5WZ3XqBsj2W5vq+CLuSj6S/zVV7Yhspj60GBBBFJW8ASoNCv
 jeH9kZfWTKk0WD0Qf3TrMzv/Sungw9WP7zumMvmmpK0JVY0462OpOyDpev7/hhjlh1
 zVrnKQ5exRrHuEfhL1de4X0uOBhq50YJDkN3rEl0njAtcHvkEM60NATMYzDaauM38k
 P2f0i2QfDQHTEkYRepezUa7iJec0H9uKY4y6a0sQ0h0SXmy+NKWr8YBg/Wlm+9mSwR
 eDTDeZ3/QBYsQ==
Received: from mx1.t-argos.ru.ru (mail.t-argos.ru [172.17.13.212])
 by mx1.t-argos.ru (Postfix) with ESMTP;
 Fri, 19 Apr 2024 14:37:07 +0300 (MSK)
Received: from localhost.localdomain (172.17.215.6) by ta-mail-02
 (172.17.13.212) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Apr
 2024 14:36:45 +0300
From: Aleksandr Mishin <amishin@t-argos.ru>
To: Robert Foss <rfoss@kernel.org>
CC: Aleksandr Mishin <amishin@t-argos.ru>, Swapnil Jakhade
 <sjakhade@cadence.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Nikhil
 Devshatwar <nikhil.nd@ti.com>, Aradhya Bhatia <a-bhatia1@ti.com>, Jani Nikula
 <jani.nikula@intel.com>, Rob Herring <robh@kernel.org>, Zhu Wang
 <wangzhu9@huawei.com>, Yuti Amonkar <yamonkar@cadence.com>, Jyri Sarha
 <jsarha@ti.com>, Quentin Schulz <quentin.schulz@free-electrons.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <lvc-project@linuxtesting.org>
Subject: [PATCH] drm: bridge: cdns-mhdp8546: Fix missing mutex unlock on error
 path
Date: Fri, 19 Apr 2024 14:36:37 +0300
Message-ID: <20240419113637.25745-1-amishin@t-argos.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.215.6]
X-ClientProxiedBy: ta-mail-02.ta.t-argos.ru (172.17.13.212) To ta-mail-02
 (172.17.13.212)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184806 [Apr 19 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: amishin@t-argos.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 18 0.3.18
 b9d6ada76958f07c6a68617a7ac8df800bc4166c,
 {Tracking_from_domain_doesnt_match_to},
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; 127.0.0.199:7.1.2;
 mx1.t-argos.ru.ru:7.1.1; t-argos.ru:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/04/19 08:04:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2024/04/19 07:11:00 #24870208
X-KSMG-AntiVirus-Status: Clean, skipped
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

In cdns_mhdp_atomic_enable(), there is an error return on failure of
drm_mode_duplicate() which leads to the mutex remaining locked.
Add a mutex unlock call.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 935a92a1c400 ("drm: bridge: cdns-mhdp8546: Fix possible null pointer dereference")
Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
---
This patch is against drm-misc-next branch of drm-misc repo.

 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 8a91ef0ae065..65a4bd09d9c6 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2059,8 +2059,10 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
 	mhdp_state = to_cdns_mhdp_bridge_state(new_state);
 
 	mhdp_state->current_mode = drm_mode_duplicate(bridge->dev, mode);
-	if (!mhdp_state->current_mode)
-		return;
+	if (!mhdp_state->current_mode) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	drm_mode_set_name(mhdp_state->current_mode);
 
-- 
2.30.2

