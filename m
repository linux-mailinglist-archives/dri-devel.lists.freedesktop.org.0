Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA123780F8
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 12:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF66089D83;
	Mon, 10 May 2021 10:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 964 seconds by postgrey-1.36 at gabe;
 Mon, 10 May 2021 10:13:26 UTC
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi
 [62.142.5.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7600D89D83
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 10:13:26 +0000 (UTC)
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
 by fgw20.mail.saunalahti.fi (Halon) with ESMTP
 id 1b869fa5-b176-11eb-ba24-005056bd6ce9;
 Mon, 10 May 2021 12:57:20 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Lee Jones <lee.jones@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] backlight: lm3630a_bl: Put fwnode in error case during
 ->probe()
Date: Mon, 10 May 2021 12:57:16 +0300
Message-Id: <20210510095716.3302910-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Dan Murphy <dmurphy@ti.com>,
 Brian Masney <masneyb@onstation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

device_for_each_child_node() bumps a reference counting of a returned variable.
We have to balance it whenever we return to the caller.

Fixes: 8fbce8efe15cd ("backlight: lm3630a: Add firmware node support")
Cc: Brian Masney <masneyb@onstation.org>
Cc: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/video/backlight/lm3630a_bl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
index e88a2b0e5904..662029d6a3dc 100644
--- a/drivers/video/backlight/lm3630a_bl.c
+++ b/drivers/video/backlight/lm3630a_bl.c
@@ -482,8 +482,10 @@ static int lm3630a_parse_node(struct lm3630a_chip *pchip,
 
 	device_for_each_child_node(pchip->dev, node) {
 		ret = lm3630a_parse_bank(pdata, node, &seen_led_sources);
-		if (ret)
+		if (ret) {
+			fwnode_handle_put(node);
 			return ret;
+		}
 	}
 
 	return ret;
-- 
2.31.1

