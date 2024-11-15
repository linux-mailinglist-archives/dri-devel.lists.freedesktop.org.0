Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE5E9CF1F2
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 17:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D87F310E8A4;
	Fri, 15 Nov 2024 16:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="UHJnlDmt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr
 [80.12.242.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A602E10E8A7
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 16:45:02 +0000 (UTC)
Received: from localhost.localdomain ([90.11.132.44])
 by smtp.orange.fr with ESMTPA
 id BzRKt9S50PqyaBzRKtzdae; Fri, 15 Nov 2024 17:45:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1731689100;
 bh=g8Wzp5+7fJS/vNhoxSgPrU0/wiW6HwJG9NHcRVskjnA=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=UHJnlDmtghCt+DMn9DMXGCZ7Gil6JVGU9YC9L3LHs7vp6stA5ABULWORq+tDjWDlw
 Tc4k1iYJCnvJHpZD8tilknCJL9DQT3JmzL5vnh4AbRRHTWMbm/RacwVf8l4k8Uy3X8
 Iu0GEF8mqrY9diLsqMWhGMQBajm0fSJ3Ee5/XJAVqaYsL6T0IAgK7yFdlSFexSt7zr
 OpKOcULXJ8/koIo0CnIHn58bDrihkcvdLJiOpoa69IlIHqTRCPnKH/fNDt1NeMq1ZF
 ee/dedxkmslMOTKhNNYCvZNtd+9KOeI/Ium9eVKuwJ4Y4LQWbZJbtg1IiWoYcmrwol
 HP+nNmdwBza1g==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 15 Nov 2024 17:45:00 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i2c: tda9950: Constify struct i2c_device_id
Date: Fri, 15 Nov 2024 17:44:27 +0100
Message-ID: <d0f63418af53a887cec0ad0e7d9741ffeb2a7a8e.1731689044.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
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

'struct i2c_device_id' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  12136	    822	      0	  12958	   329e	drivers/gpu/drm/i2c/tda9950.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  12200	    758	      0	  12958	   329e	drivers/gpu/drm/i2c/tda9950.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 drivers/gpu/drm/i2c/tda9950.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i2c/tda9950.c b/drivers/gpu/drm/i2c/tda9950.c
index 82d618c40dce..5065d6212fe4 100644
--- a/drivers/gpu/drm/i2c/tda9950.c
+++ b/drivers/gpu/drm/i2c/tda9950.c
@@ -485,7 +485,7 @@ static void tda9950_remove(struct i2c_client *client)
 	cec_unregister_adapter(priv->adap);
 }
 
-static struct i2c_device_id tda9950_ids[] = {
+static  struct i2c_device_id tda9950_ids[] = {
 	{ "tda9950", 0 },
 	{ },
 };
-- 
2.47.0

