Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5BF4438D1
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 23:55:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D0773910;
	Tue,  2 Nov 2021 22:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 100782 seconds by postgrey-1.36 at gabe;
 Tue, 02 Nov 2021 22:55:34 UTC
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BAB7390F
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 22:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635893733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Fy+8FMWEkbUGkl/aK9LgOKbIU9Rw5ScB9WxKjqG0/jw=;
 b=PwzpJ39+aAizSR3JrBzjVOUmcDZi6QtI1aSW+rzvqKMgnHXwEUKwNEcrU6jVyOYfyASsVf
 QkJ5RiZfUSVU7TVcW62tIa9OBYdWavnIk8cFubqm1Ha/CYhgDO6koSCgNiEKNXhP5gNRwX
 WSuI/yCpZHo4xpvU8ii5nvOXV4r0NQU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-kevJjX-iMu-TQDc1PN7qbA-1; Tue, 02 Nov 2021 18:55:30 -0400
X-MC-Unique: kevJjX-iMu-TQDc1PN7qbA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD34BBBEE0;
 Tue,  2 Nov 2021 22:55:28 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE7AA57CB9;
 Tue,  2 Nov 2021 22:55:05 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH v2 1/3] backlight: lp855x: Move device_config setting out of
 lp855x_configure()
Date: Tue,  2 Nov 2021 23:55:02 +0100
Message-Id: <20211102225504.18920-1-hdegoede@redhat.com>
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

Move the setting of the lp->cfg pointer to the chip specific
lp855x_device_config struct from lp855x_configure() to
lp855x_probe(), before calling lp855x_parse_dt().

This is a preperation patch for adding ACPI enumeration support.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/video/backlight/lp855x_bl.c | 32 ++++++++++++++---------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
index e94932c69f54..808ff00b2003 100644
--- a/drivers/video/backlight/lp855x_bl.c
+++ b/drivers/video/backlight/lp855x_bl.c
@@ -170,22 +170,6 @@ static int lp855x_configure(struct lp855x *lp)
 	int i, ret;
 	struct lp855x_platform_data *pd = lp->pdata;
 
-	switch (lp->chip_id) {
-	case LP8550:
-	case LP8551:
-	case LP8552:
-	case LP8553:
-	case LP8556:
-		lp->cfg = &lp855x_dev_cfg;
-		break;
-	case LP8555:
-	case LP8557:
-		lp->cfg = &lp8557_dev_cfg;
-		break;
-	default:
-		return -EINVAL;
-	}
-
 	if (lp->cfg->pre_init_device) {
 		ret = lp->cfg->pre_init_device(lp);
 		if (ret) {
@@ -413,6 +397,22 @@ static int lp855x_probe(struct i2c_client *cl, const struct i2c_device_id *id)
 	lp->chip_id = id->driver_data;
 	lp->pdata = dev_get_platdata(&cl->dev);
 
+	switch (lp->chip_id) {
+	case LP8550:
+	case LP8551:
+	case LP8552:
+	case LP8553:
+	case LP8556:
+		lp->cfg = &lp855x_dev_cfg;
+		break;
+	case LP8555:
+	case LP8557:
+		lp->cfg = &lp8557_dev_cfg;
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	if (!lp->pdata) {
 		ret = lp855x_parse_dt(lp);
 		if (ret < 0)
-- 
2.31.1

