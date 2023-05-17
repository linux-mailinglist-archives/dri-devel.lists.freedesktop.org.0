Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB654706154
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 09:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F1C10E0B9;
	Wed, 17 May 2023 07:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D2610E0B9
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 07:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1684309019; x=1715845019;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CxUj6AFEjbHX5fYczbKG6dlLshFOiDgXWSAu65pAkgE=;
 b=FjnZmVuBrkK0FV5CJQT4LhpvTpw+lJjUIehniOXbbVjPbglrso5Wxat4
 L9Rs3vvh43JH2VdmCnq1HKFMiS77PVbxyTI425q/+R17Hlpl7y5p7YG3e
 2EQuNmMvo/LY/2Zw3NqSzPUAJ8mVG9+IEUYgcIwNyyDaz20ncwiX6exEN
 AONtCfzO+So1JsmsyzuzVIAdaAgzV67v788AfmNY/jGGZmYe965vFabPA
 b/QT+KOm00N4ieQBNyEdBnseo/rxFAnipolYAmhbZFYyclYq+RyCRnlJ2
 yhyGQ45tJtOQvtIeuPBV2EuzWpEG5Pc8y/eadNm27mOW0wsmG2iYuvFOz w==;
X-IronPort-AV: E=Sophos;i="5.99,281,1677538800"; d="scan'208";a="30951775"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 17 May 2023 09:36:56 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 17 May 2023 09:36:56 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 17 May 2023 09:36:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1684309016; x=1715845016;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CxUj6AFEjbHX5fYczbKG6dlLshFOiDgXWSAu65pAkgE=;
 b=gMaFQoNBtBuikq/h8+fz+ER/PozhbskUdvj67QWGmgyEuMnGWFkR2R+Y
 tSVErWibcCUo9BOWXvGlrqnaGym4JNI1oBVk4Dr2emywHqxnbmlktCl5b
 VE7qq4d3tX9KQ6oi/UBHEcSeY1+8oNUAWmIMrberOrdXSZ+MuLhgmU+aV
 I0TsXqzHuYfQAU55bgGd9bdmJsyzfi2nXpLeNUCsbQb0zou4eP0oljYk7
 ywajAzU5xfeLP4dJsdhmPWU9fCyu7Zw4Lez/bEC5xX0aewYpvjiLLYROs
 Bp0/uJgayz0DlUCqtinw8kegUqJ99dohU4dhr2Yrjpur8J88S1UtekUsa g==;
X-IronPort-AV: E=Sophos;i="5.99,281,1677538800"; d="scan'208";a="30951774"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 17 May 2023 09:36:56 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 16267280087;
 Wed, 17 May 2023 09:36:56 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/1] media: tc358743: register v4l2 async device only after
 successful setup
Date: Wed, 17 May 2023 09:36:54 +0200
Message-Id: <20230517073654.1263973-1-alexander.stein@ew.tq-group.com>
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ensure the device has been setup correctly before registering the v4l2
async device, thus allowing userspace to access.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Change in v2:
* New approach: Register async device as last step

This superseeds the patch at [1], but has a different subject due to new
solution.

[1] https://lore.kernel.org/linux-media/20230502140612.2256850-1-alexander.stein@ew.tq-group.com/

 drivers/media/i2c/tc358743.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index ad6a72b2bcf5..9d4bd73469bf 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -2091,9 +2091,6 @@ static int tc358743_probe(struct i2c_client *client)
 	state->mbus_fmt_code = MEDIA_BUS_FMT_RGB888_1X24;
 
 	sd->dev = &client->dev;
-	err = v4l2_async_register_subdev(sd);
-	if (err < 0)
-		goto err_hdl;
 
 	mutex_init(&state->confctl_mutex);
 
@@ -2151,6 +2148,10 @@ static int tc358743_probe(struct i2c_client *client)
 	if (err)
 		goto err_work_queues;
 
+	err = v4l2_async_register_subdev(sd);
+	if (err < 0)
+		goto err_work_queues;
+
 	v4l2_info(sd, "%s found @ 0x%x (%s)\n", client->name,
 		  client->addr << 1, client->adapter->name);
 
-- 
2.34.1

