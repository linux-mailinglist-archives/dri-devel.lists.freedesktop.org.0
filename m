Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7265F13E999
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 18:39:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A203C6EE5B;
	Thu, 16 Jan 2020 17:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6B06EE5B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 17:39:05 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6AB4E246EF;
 Thu, 16 Jan 2020 17:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579196345;
 bh=GXrOPGzs1i6dk8/vbBQRhdqLFf9BkLkpKVr1wvZMRy8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U+tbg7/MZK5FJqEfgdSpCPPmHt0Nh13qMJCbFzmBxJ12KDgmSHLbUO7THLvOO/HJR
 KFYzRnhDNsR65PSvE6J6/uzCdvLrTFhIUQbUWKjmlHPx/L4EK33oWu90ZZ5HqobM/q
 y+P+I3679eGfdLJp3DIHH8RsZOECUmidcqAImXdo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 141/251] backlight: lm3630a: Return 0 on success
 in update_status functions
Date: Thu, 16 Jan 2020 12:34:50 -0500
Message-Id: <20200116173641.22137-101-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116173641.22137-1-sashal@kernel.org>
References: <20200116173641.22137-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Brian Masney <masneyb@onstation.org>

[ Upstream commit d3f48ec0954c6aac736ab21c34a35d7554409112 ]

lm3630a_bank_a_update_status() and lm3630a_bank_b_update_status()
both return the brightness value if the brightness was successfully
updated. Writing to these attributes via sysfs would cause a 'Bad
address' error to be returned. These functions should return 0 on
success, so let's change it to correct that error.

Fixes: 28e64a68a2ef ("backlight: lm3630: apply chip revision")
Signed-off-by: Brian Masney <masneyb@onstation.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/backlight/lm3630a_bl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
index 60d6c2ac87aa..1771220b2437 100644
--- a/drivers/video/backlight/lm3630a_bl.c
+++ b/drivers/video/backlight/lm3630a_bl.c
@@ -200,7 +200,7 @@ static int lm3630a_bank_a_update_status(struct backlight_device *bl)
 				      LM3630A_LEDA_ENABLE, LM3630A_LEDA_ENABLE);
 	if (ret < 0)
 		goto out_i2c_err;
-	return bl->props.brightness;
+	return 0;
 
 out_i2c_err:
 	dev_err(pchip->dev, "i2c failed to access\n");
@@ -277,7 +277,7 @@ static int lm3630a_bank_b_update_status(struct backlight_device *bl)
 				      LM3630A_LEDB_ENABLE, LM3630A_LEDB_ENABLE);
 	if (ret < 0)
 		goto out_i2c_err;
-	return bl->props.brightness;
+	return 0;
 
 out_i2c_err:
 	dev_err(pchip->dev, "i2c failed to access REG_CTRL\n");
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
