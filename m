Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C46D74438CF
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 23:55:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 139E67390F;
	Tue,  2 Nov 2021 22:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06087390F
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 22:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635893732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=in9V/I6P5nWl0b1aEtKrhnbWkSaRhk1SKLF5QfaiNRA=;
 b=RYoKqC/2II6PJ0rThsmrypbRF1lJOCzJ0CVDiTRCF2hZZz/pr6r9dglM2p0/ym3wghcHN9
 0JZqi7he1vnNnxcwhjdumU9dc8NLBar/ZZB7gDw5uibsqmtdb11R5qyZ1BNwiAhbxcUe8F
 Fb8huAB0coYxcU32oX1JQpypIomfR3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-fylSlgtvNQy1V-2NcFpYlw-1; Tue, 02 Nov 2021 18:55:31 -0400
X-MC-Unique: fylSlgtvNQy1V-2NcFpYlw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6837E10A8E00;
 Tue,  2 Nov 2021 22:55:30 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1103A60657;
 Tue,  2 Nov 2021 22:55:28 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH v2 2/3] backlight: lp855x: Add dev helper variable to
 lp855x_probe()
Date: Tue,  2 Nov 2021 23:55:03 +0100
Message-Id: <20211102225504.18920-2-hdegoede@redhat.com>
In-Reply-To: <20211102225504.18920-1-hdegoede@redhat.com>
References: <20211102225504.18920-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tsuchiya Yuto <kitakar@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a dev local variable to the lp855x_probe(), to replace "&cl->dev"
and "lp->dev" in various places.

Also switch to dev_err_probe() in one case which takes care of not
printing -EPROBE_DEFER errors for us.

This is mostly a preparation for adding ACPI enumeration support which
will use the new "dev" variable more.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/video/backlight/lp855x_bl.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
index 808ff00b2003..d1d27d5eb0f2 100644
--- a/drivers/video/backlight/lp855x_bl.c
+++ b/drivers/video/backlight/lp855x_bl.c
@@ -381,21 +381,22 @@ static int lp855x_parse_dt(struct lp855x *lp)
 
 static int lp855x_probe(struct i2c_client *cl, const struct i2c_device_id *id)
 {
+	struct device *dev = &cl->dev;
 	struct lp855x *lp;
 	int ret;
 
 	if (!i2c_check_functionality(cl->adapter, I2C_FUNC_SMBUS_I2C_BLOCK))
 		return -EIO;
 
-	lp = devm_kzalloc(&cl->dev, sizeof(struct lp855x), GFP_KERNEL);
+	lp = devm_kzalloc(dev, sizeof(struct lp855x), GFP_KERNEL);
 	if (!lp)
 		return -ENOMEM;
 
 	lp->client = cl;
-	lp->dev = &cl->dev;
+	lp->dev = dev;
 	lp->chipname = id->name;
 	lp->chip_id = id->driver_data;
-	lp->pdata = dev_get_platdata(&cl->dev);
+	lp->pdata = dev_get_platdata(dev);
 
 	switch (lp->chip_id) {
 	case LP8550:
@@ -424,30 +425,27 @@ static int lp855x_probe(struct i2c_client *cl, const struct i2c_device_id *id)
 	else
 		lp->mode = REGISTER_BASED;
 
-	lp->supply = devm_regulator_get(lp->dev, "power");
+	lp->supply = devm_regulator_get(dev, "power");
 	if (IS_ERR(lp->supply)) {
 		if (PTR_ERR(lp->supply) == -EPROBE_DEFER)
 			return -EPROBE_DEFER;
 		lp->supply = NULL;
 	}
 
-	lp->enable = devm_regulator_get_optional(lp->dev, "enable");
+	lp->enable = devm_regulator_get_optional(dev, "enable");
 	if (IS_ERR(lp->enable)) {
 		ret = PTR_ERR(lp->enable);
 		if (ret == -ENODEV) {
 			lp->enable = NULL;
 		} else {
-			if (ret != -EPROBE_DEFER)
-				dev_err(lp->dev, "error getting enable regulator: %d\n",
-					ret);
-			return ret;
+			return dev_err_probe(dev, ret, "getting enable regulator\n");
 		}
 	}
 
 	if (lp->supply) {
 		ret = regulator_enable(lp->supply);
 		if (ret < 0) {
-			dev_err(&cl->dev, "failed to enable supply: %d\n", ret);
+			dev_err(dev, "failed to enable supply: %d\n", ret);
 			return ret;
 		}
 	}
@@ -455,7 +453,7 @@ static int lp855x_probe(struct i2c_client *cl, const struct i2c_device_id *id)
 	if (lp->enable) {
 		ret = regulator_enable(lp->enable);
 		if (ret < 0) {
-			dev_err(lp->dev, "failed to enable vddio: %d\n", ret);
+			dev_err(dev, "failed to enable vddio: %d\n", ret);
 			goto disable_supply;
 		}
 
@@ -470,20 +468,19 @@ static int lp855x_probe(struct i2c_client *cl, const struct i2c_device_id *id)
 
 	ret = lp855x_configure(lp);
 	if (ret) {
-		dev_err(lp->dev, "device config err: %d", ret);
+		dev_err(dev, "device config err: %d", ret);
 		goto disable_vddio;
 	}
 
 	ret = lp855x_backlight_register(lp);
 	if (ret) {
-		dev_err(lp->dev,
-			"failed to register backlight. err: %d\n", ret);
+		dev_err(dev, "failed to register backlight. err: %d\n", ret);
 		goto disable_vddio;
 	}
 
-	ret = sysfs_create_group(&lp->dev->kobj, &lp855x_attr_group);
+	ret = sysfs_create_group(&dev->kobj, &lp855x_attr_group);
 	if (ret) {
-		dev_err(lp->dev, "failed to register sysfs. err: %d\n", ret);
+		dev_err(dev, "failed to register sysfs. err: %d\n", ret);
 		goto disable_vddio;
 	}
 
-- 
2.31.1

