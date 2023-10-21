Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B267D1B70
	for <lists+dri-devel@lfdr.de>; Sat, 21 Oct 2023 08:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C13910E070;
	Sat, 21 Oct 2023 06:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr
 [80.12.242.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C5E10E070
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Oct 2023 06:53:43 +0000 (UTC)
Received: from pop-os.home ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id u5reqyZLtd4Wtu5rfqqNO4; Sat, 21 Oct 2023 08:53:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1697871220;
 bh=q+6YiMf4FjJqpY2woNDtEvfJ1SZWEDzhFtZ1+ypv620=;
 h=From:To:Cc:Subject:Date;
 b=EysZyvuNjvivikTZz1HV6uPNxwar1FxYeIW3ZPl6RB94dHadJkAhx/cMu/4K4ad/V
 N1VEKRFwKHTh8ZUL5HRXQptbuvrhFE3V+gUP/lZ+2mpFJoKjKpgpcB9uEdNttXL8dW
 FEYGs7+OdgBqoZ86yNQ6UFX0tz2V0Lky44jfLSnysdNY4nth95725mV4TlqLVEiToW
 fvX6Z+teSxGjh1Tb5asFg2GSfGrbpwongRfMXRnXjDc4vAWv8GbbK2jydBIPoNdnTe
 0vl8DSe2v/n3hiR7lqTtgo/V7vctb5Qjlzc55Nkmgqm66B2/+EDwU8wGR/38okyH8y
 hSOtX7pWH5BaA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 21 Oct 2023 08:53:40 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH] fbdev/offb: Simplify offb_init_fb()
Date: Sat, 21 Oct 2023 08:53:37 +0200
Message-Id: <1c94c99117617c1a844f6551b7bca27f23c5f0c8.1697871190.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Turn a strcpy()+strncat()+'\0' into an equivalent snprintf().

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is *not* even compile tested because cross-compiling leads to
some errors like on my machine:
   cc1: error: cannot load plugin ./scripts/gcc-plugins/randomize_layout_plugin.so: ./scripts/gcc-plugins/randomize_layout_plugin.so: undefined symbol: _ZNK6frange6acceptERK14vrange_visitor

So review with care!
---
 drivers/video/fbdev/offb.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/offb.c b/drivers/video/fbdev/offb.c
index dcb1b81d35db..b421b46d88ef 100644
--- a/drivers/video/fbdev/offb.c
+++ b/drivers/video/fbdev/offb.c
@@ -423,11 +423,9 @@ static void offb_init_fb(struct platform_device *parent, const char *name,
 	fix = &info->fix;
 	var = &info->var;
 
-	if (name) {
-		strcpy(fix->id, "OFfb ");
-		strncat(fix->id, name, sizeof(fix->id) - sizeof("OFfb "));
-		fix->id[sizeof(fix->id) - 1] = '\0';
-	} else
+	if (name)
+		snprintf(fix->id, sizeof(fix->id), "OFfb %s", name);
+	else
 		snprintf(fix->id, sizeof(fix->id), "OFfb %pOFn", dp);
 
 
-- 
2.34.1

