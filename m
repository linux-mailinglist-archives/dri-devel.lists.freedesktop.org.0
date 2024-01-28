Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA12283F630
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 16:56:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FC21126B9;
	Sun, 28 Jan 2024 15:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 423 seconds by postgrey-1.36 at gabe;
 Sun, 28 Jan 2024 15:56:23 UTC
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91391126B9
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 15:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
 t=1706456954; bh=pIUGZH0WA/dnmasx5Fb75KygIBvTRFfwHo3C1qQyatU=;
 h=From:To:Cc:Subject:Date:From;
 b=ZCL1/V7gcX01+wyCS7/UsEozTQM9F/8MoG61d9vDsx88zcE31uxncRZKnVS6hRKB9
 J8DVsMPT9Aw0u/0iu7UUO+lA93PSoxc1puOYQHwUjBxiC3TJGFIjQomLyHxfnWOZ10
 LuFWN7KwDdaqnaWmdp2tiD0kG4TWJZ5zv2CvMBAD3vSUuFKq2+hLUM7hl0G3zEDXii
 Njb70xYcngVXJjQo46hpJJJoIhYi19COJJQ9ER0MDi91a6mtwLQyqbGsudFHXhSKST
 y0lACrc63WxEHpomV7MvUmrUOZNLvCstW2Z4uJSBjIhtPnX7icKBSMTA7DcNYikDHu
 s7SxWshdo+v5Q==
Received: by gofer.mess.org (Postfix, from userid 501)
 id F02E91007E3; Sun, 28 Jan 2024 15:49:14 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on gofer.mess.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU autolearn=unavailable
 autolearn_force=no version=4.0.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
 t=1706456953; bh=pIUGZH0WA/dnmasx5Fb75KygIBvTRFfwHo3C1qQyatU=;
 h=From:To:Cc:Subject:Date:From;
 b=BVNGuGDPkHcq680/07H+MZm6kSMUHplL3QA/QQ1CydeLArEadowfvbwxBbASXbF0n
 baez3+xNJuwljbqm8wU8V4zzh5hww0sWtfqzGOwJJDxcxOJdDHYe0uXx3dWQLTOSb+
 5tgaLO5pon+/1mF7hZ4q+c6qFSXEjv5qEVq8sMp/jbzKUsj8Nl2/BZD8j6GAB6Q2mk
 FDqCWXWGeJGkJhqdF035VBmEhOJEfIH6nFJyz3aGzhpzkFzZHtdW6srpYnvnsReaYI
 ovnTJGJudjBtRV9DhZOBpSSVlfhR9E+KBVQd+mQeF6H1qz3aiBoK8s3LTVMo4/WFgT
 AJmVh+swGsFtw==
Received: from bigcore.mess.org (bigcore.local
 [IPv6:2a02:8011:d000:212:bc3c:1b4a:a6fa:362f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by gofer.mess.org (Postfix) with ESMTPSA id 6CFC91000B2;
 Sun, 28 Jan 2024 15:49:13 +0000 (GMT)
From: Sean Young <sean@mess.org>
To: Flavio Suligoi <f.suligoi@asem.it>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH] backlight: mp3309c: Use pwm_apply_might_sleep()
Date: Sun, 28 Jan 2024 15:49:04 +0000
Message-ID: <20240128154905.407302-1-sean@mess.org>
X-Mailer: git-send-email 2.43.0
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Young <sean@mess.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

pwm_apply_state() is deprecated since commit c748a6d77c06a ("pwm: Rename
pwm_apply_state() to pwm_apply_might_sleep()"). This is the final user
in the tree.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/video/backlight/mp3309c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/mp3309c.c b/drivers/video/backlight/mp3309c.c
index 34d71259fac1d..b0d9aef6942b3 100644
--- a/drivers/video/backlight/mp3309c.c
+++ b/drivers/video/backlight/mp3309c.c
@@ -131,7 +131,7 @@ static int mp3309c_bl_update_status(struct backlight_device *bl)
 					    chip->pdata->levels[brightness],
 					    chip->pdata->levels[chip->pdata->max_brightness]);
 		pwmstate.enabled = true;
-		ret = pwm_apply_state(chip->pwmd, &pwmstate);
+		ret = pwm_apply_might_sleep(chip->pwmd, &pwmstate);
 		if (ret)
 			return ret;
 
@@ -393,7 +393,7 @@ static int mp3309c_probe(struct i2c_client *client)
 					    chip->pdata->default_brightness,
 					    chip->pdata->max_brightness);
 		pwmstate.enabled = true;
-		ret = pwm_apply_state(chip->pwmd, &pwmstate);
+		ret = pwm_apply_might_sleep(chip->pwmd, &pwmstate);
 		if (ret)
 			return dev_err_probe(chip->dev, ret,
 					     "error setting pwm device\n");
-- 
2.43.0

