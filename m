Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E96797008B
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 09:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D01810E1D2;
	Sat,  7 Sep 2024 07:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="GFeOfRaV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 90328 seconds by postgrey-1.36 at gabe;
 Sat, 07 Sep 2024 07:14:00 UTC
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.64.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1421E10E1D2
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Sep 2024 07:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1725693200;
 bh=7wmBvLIf+7VxxIKLN2n6bgLn+1DR5ZfTO8tJ4CJQlek=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=GFeOfRaVYsPr2i8WD9Y3JZG67paygGonfodvPlOWoJpyjzYf8MO4qPjesPI+DDdTN
 rYpgBtQ/dcPoG2NBonCVty9ofFAHejHOn67y7uoFDOttKK3B3xJCwOI9Xs2hCW/UuM
 gPPPgz4LJAvAj/vdvIkqBG7SsKKZpgKa6wIqmR9k=
X-QQ-mid: bizesmtpsz10t1725693194tzjajl
X-QQ-Originating-IP: i8sSZCS+iou7eafb46pHc6Yylys551YFfi7GwCQvpxs=
Received: from localhost.localdomain ( [221.226.144.218])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 07 Sep 2024 15:13:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15511716791803928476
From: He Lugang <helugang@uniontech.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	He Lugang <helugang@uniontech.com>
Subject: [PATCH 3/3] drm/i2c/tda9950: use devm_add_action_or_reset() helper
Date: Sat,  7 Sep 2024 15:13:05 +0800
Message-ID: <FBFE856A095C6232+20240907071305.1663440-1-helugang@uniontech.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz7a-0
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

Use devm_add_action_or_reset() to release resources in case of failure,
because the cleanup function will be automatically called.

Signed-off-by: He Lugang <helugang@uniontech.com>
---
 drivers/gpu/drm/i2c/tda9950.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i2c/tda9950.c b/drivers/gpu/drm/i2c/tda9950.c
index 82d618c40dce..e9dae19d7acd 100644
--- a/drivers/gpu/drm/i2c/tda9950.c
+++ b/drivers/gpu/drm/i2c/tda9950.c
@@ -361,11 +361,7 @@ static int tda9950_devm_glue_init(struct device *dev, struct tda9950_glue *glue)
 			return ret;
 	}
 
-	ret = devm_add_action(dev, tda9950_devm_glue_exit, glue);
-	if (ret)
-		tda9950_devm_glue_exit(glue);
-
-	return ret;
+	return devm_add_action_or_reset(dev, tda9950_devm_glue_exit, glue);
 }
 
 static void tda9950_cec_del(void *data)
@@ -425,11 +421,9 @@ static int tda9950_probe(struct i2c_client *client)
 	if (IS_ERR(priv->adap))
 		return PTR_ERR(priv->adap);
 
-	ret = devm_add_action(dev, tda9950_cec_del, priv);
-	if (ret) {
-		cec_delete_adapter(priv->adap);
+	ret = devm_add_action_or_reset(dev, tda9950_cec_del, priv);
+	if (ret)
 		return ret;
-	}
 
 	ret = tda9950_devm_glue_init(dev, glue);
 	if (ret)
-- 
2.45.2

