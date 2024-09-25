Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE359852D7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 08:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55A310E79A;
	Wed, 25 Sep 2024 06:19:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="ZXlqI8zt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F7E10E79A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 06:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1727245109;
 bh=JdpwLofFHHFw+pQeQ4pD+Yd49zMXkAlfUQf/4uvZLQI=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=ZXlqI8zt3l9EeSAjah88C3pvLDB2/EHxSfibkR2v+p3J8feWfOmIOap5OfOEv4SNH
 w1hacIhKepyIiejyQ+EGAWnEJUt9D4aey0nlXr9TyzR2FY4kxSRaQ6WWFCBKVTBq65
 vUDMP3hvo7YUepFLCKc0gtOiOJec8HUZGRjufMPM=
X-QQ-mid: bizesmtpsz8t1727245105t89jvg4
X-QQ-Originating-IP: WNOKzVX+rrzzG9/49WaxRS32/wvy7Iykz4AiiCr+OUo=
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 25 Sep 2024 14:18:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11086714327097597551
From: He Lugang <helugang@uniontech.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, He Lugang <helugang@uniontech.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [RESEND PATCH] drm/i2c/tda9950: use devm_add_action_or_reset() helper
Date: Wed, 25 Sep 2024 14:18:19 +0800
Message-ID: <F8054A8509C09C5E+20240925061819.729842-1-helugang@uniontech.com>
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

