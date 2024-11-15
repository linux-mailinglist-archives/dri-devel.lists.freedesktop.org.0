Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BDA9CF2A6
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 18:17:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2F110E8B1;
	Fri, 15 Nov 2024 17:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="oBd6nc/Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr
 [80.12.242.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756A010E8AC
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 17:17:55 +0000 (UTC)
Received: from localhost.localdomain ([90.11.132.44])
 by smtp.orange.fr with ESMTPA
 id Bzx9tMAAh8AEMBzx9t85Ul; Fri, 15 Nov 2024 18:17:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1731691074;
 bh=ISPrq17danPOpPQ4NpNMvjghXiy3pfLupLJvQtzC6JE=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=oBd6nc/YARXreRA3M9Pq2t+jvnNX3qzxwdqosxR/EPoYRzBDDWOAMc/bbXjeB4EuQ
 ZuUvWnIXFQVccJm+/ga018jdZdcvZ0o/LBC4b3ldYFA96bLHSxncOHAUJYJhab5f4z
 8KKQDI6kn02UkBesWS9NBz0zqBxvEc9wemi91qkcuzHXT20PRU34FuJHvuyt9uEbvv
 dU+0/Dewjp2a4C2P7bmG6pBBlH2nAXoYtjBiQzLOleC9jk4QrUIA4WIFD36cNMRsvp
 XxvOhp8b8y9ny6Vl4ySHm1aZcJcqpQnlThMSTDlJfbaj5jjhIqjY65dDZAcguqtQ6L
 h/F6Nf3jNXWtA==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 15 Nov 2024 18:17:54 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: linux@weissschuh.net, broonie@kernel.org, lee@kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/i2c: tda9950: Constify struct i2c_device_id
Date: Fri, 15 Nov 2024 18:17:27 +0100
Message-ID: <d0f63518a053a817cec0ad0e7d9241f9eb2a4a8e.1731689044.git.christophe.jaillet@wanadoo.fr>
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

v2: fix missing const :(
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
+static const struct i2c_device_id tda9950_ids[] = {
 	{ "tda9950", 0 },
 	{ },
 };
-- 
2.47.0

