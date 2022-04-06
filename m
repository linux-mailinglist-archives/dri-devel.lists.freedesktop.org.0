Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F4C4F4E3C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 03:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A0610E0F7;
	Wed,  6 Apr 2022 01:43:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF5C10E0F7
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 01:43:20 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 07D1783608;
 Wed,  6 Apr 2022 03:43:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1649209398;
 bh=TLmnBzjX2gXdl2W7zyE1J/LlowQLvpYiOzm48fDtAs0=;
 h=From:To:Cc:Subject:Date:From;
 b=gnRqxb445Qk4kHp+n10DdPBCZAT89SqZPV77yunkkfeQ+039D5vXCwU9ZlxXsrpbC
 yflZUV4E2MhOZTmjBqqJAOg5wTP3JPJz5LQiGJ9y2wWyS1w/eX/poXXB6n8zQReqar
 WCHTuR4FYEKJW1Po9y1T4e0B0QmnNHwPY3TLFVWKef3Gm5YxnIaszl0qpTh73WskaK
 atU0zfvvZvI6dXD5K2nuuBVFb79Cp9R1aM4Q2FU9wvMoEAFdUX3RlEjzOm7XuEYWub
 599HdftDk3sJBTCI0KjjG+TSzrMWSihclhpTC0fKWnYgunNtU5/i2hbwCOS1fTt311
 A3AtOZZR1nBuQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: bridge: icn6211: Mark module exit callback with __exit
Date: Wed,  6 Apr 2022 03:42:50 +0200
Message-Id: <20220406014250.902187-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Stephen Rothwell <sfr@canb.auug.org.au>,
 robert.foss@linaro.org, Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix copy-paste error, module exit function should be marked with __exit
instead of __init.

Fixes: 8dde6f7452a1 ("drm: bridge: icn6211: Add I2C configuration support")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index c4d2f6d811bf1..b9cc0fac26686 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -787,7 +787,7 @@ static int __init chipone_init(void)
 }
 module_init(chipone_init);
 
-static void __init chipone_exit(void)
+static void __exit chipone_exit(void)
 {
 	i2c_del_driver(&chipone_i2c_driver);
 
-- 
2.35.1

