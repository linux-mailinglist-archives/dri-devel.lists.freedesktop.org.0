Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA57779093
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 15:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B204210E0D5;
	Fri, 11 Aug 2023 13:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5073C10E0D5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 13:16:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CBB566541D;
 Fri, 11 Aug 2023 13:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D0F1C433C8;
 Fri, 11 Aug 2023 13:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691759767;
 bh=nukkFSLL4P8Jr+p/dmzT3QsEQ0EGjj5/yMaNaTXyids=;
 h=From:To:Cc:Subject:Date:From;
 b=Kk9odl1YytqoGOgtcDfjLlBMzw5GoL/OKM8j6hffFD3mw5FMyFVc3K9ILEbj2+081
 pudtq1NP5/tZa9Wexobiem93LieQudBbg0eQ0ZtMTvKFqc/JUIXG6/7qQjCcf4XzNO
 5HfPJF5svI+wL9XINgVDjKLj+ckSslUBaPJoyy+uVJLR8O3KII72czlYyb76JV7EOm
 AFgBt9FpIcTgeCBFdobX/DABISbmdUwwujnwPNSjjI9WjKlkrk+JK0VZEm5PCb11Hi
 EtP7oD+qUTFnYSRNGYNqoxIOGxzf4R8xlVmVvhkwsnprLvdBRmpN7sd1mlIcRaQ5Qq
 EkitZ1qtawnaw==
From: Arnd Bergmann <arnd@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH] backlight: lp855x: fix unintialized function return
Date: Fri, 11 Aug 2023 15:15:53 +0200
Message-Id: <20230811131600.2380519-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The function now returns an error code in some cases, but fails to initialize
it in others:

drivers/video/backlight/lp855x_bl.c:252:11: error: variable 'ret' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
        else if (lp->mode == REGISTER_BASED)
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/video/backlight/lp855x_bl.c:256:9: note: uninitialized use occurs here
        return ret;
               ^~~
drivers/video/backlight/lp855x_bl.c:252:7: note: remove the 'if' if its condition is always true
        else if (lp->mode == REGISTER_BASED)
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Since this case should not actually happen, return the -EINVAL code.

Fixes: 5145531be5fba ("backlight: lp855x: Catch errors when changing brightness")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/backlight/lp855x_bl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
index 61a7f45bfad84..ea4fa69e49a70 100644
--- a/drivers/video/backlight/lp855x_bl.c
+++ b/drivers/video/backlight/lp855x_bl.c
@@ -252,6 +252,8 @@ static int lp855x_bl_update_status(struct backlight_device *bl)
 	else if (lp->mode == REGISTER_BASED)
 		ret = lp855x_write_byte(lp, lp->cfg->reg_brightness,
 					(u8)brightness);
+	else
+		ret = -EINVAL;
 
 	return ret;
 }
-- 
2.39.2

