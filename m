Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C37E9C9093D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 03:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1677110E8A5;
	Fri, 28 Nov 2025 02:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="prFfQ4eO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B89710E8A5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 02:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1764295638;
 bh=HACn86zdCcEj7sYdICgJjI01+m/bWEVtdDOphGhu1lA=;
 h=From:To:Subject:Date:Message-Id;
 b=prFfQ4eOrLXuzJjnAF6AUH0ha0kqPFgZyxisIomdyNeUPqL2xdHcFY2LOI+qFiFBy
 pQhQXStkJEPTEgG2NDXDjAkWKRjsSctP2nvMfW0klKIJlB/ZlyBPNPpju5awjdRJAm
 8Cj5q8uCYS01xWx5SYWhvCgZBouRF1wjrxUPjdRw=
X-QQ-mid: esmtpsz21t1764295461t91f06378
X-QQ-Originating-IP: fhbY41yQeB4lJVNR28w6HWtzkSKTp8yaiorSXifwU2Q=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 28 Nov 2025 10:04:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8558268278780288437
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Amit Sunil Dhamne <amitsd@google.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v11 01/11] usb: typec: Set the bus also for the port and plug
 altmodes
Date: Fri, 28 Nov 2025 10:03:55 +0800
Message-Id: <20251128020405.90-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251128020405.90-1-kernel@airkyi.com>
References: <20251128020405.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OZebYClYfzV+aPo3T3bEUA0XyxzMKrgFsZbSN5EoClNbc4+ARVt5/rhI
 XogF/BD3H70T6Fjo4ywm8H5ch9xDCHGifERkwN53EFyw4lBQxZhp2fGuMU+Fzuc5nEys1mw
 MFAG84ZFPTjXuaiP3wahJJVB5/xN0VejnmCXTjFidMhHRDOAY7vF8EgWk+WxjW8OhPom6Xt
 MK+IlTepzLlOG3+OyQvX4tgn3+e59njVWAgb+75GBKn0DCM+DY85rlhZTO/3X92Ix4YlNaa
 bQ74gvh4hBDrPIJaERi9ulZWot4jCUygNzdB8WCW6K0d5s/n7GZF1vnYXrnNvOkSopc5ZP6
 cODLGrs7HsNaAKUgXl2fqlpry+9/FXXctgHWOGT9SJ+H7apBifPeGGDfRwxrdm5ByTKKWoI
 E62l1v6b69m17GR0JkRBulgmFYBeEntkNigQurusS1Fnoya3JxhDkp/ol3JF/wZ/elcmbZt
 HU1wPd/pwOhdrCr8CcDDWESHphW+hVv/hwRK3qcIYBqU1bRgXu0jcAzS0lzOvTOmeRnJ50x
 nn5BjNjv8ivgD5sYFV8B0CvdF9lqOODtjdfo4ttAXIauaPtrDvvM/QGcBNfJ9ghGLD793j9
 xl6CbEtq8OalnyNole/Aq/zbvNmeislVTWZTx2ECWlB9O3RHP+bcQyJz0/pd41apsnwGXVF
 qAvsLVsqUnX9+YS6OcLUgZUHuQTX9nEId6kZK9zxX65ehmxIwtVLEGCMWLmEl67NYjDrhGm
 20EjLfZGXvs7mUbKXxf+28ojIxtsAHXSogpdPNjYMB+f5RCDbqn13ayYp+QAdWGtb/Ewcd8
 wbcZe97g/J+0xL1+HTXh7LSIT+7i+ggj8rvcIxviQMyIijzCJrwuI5K/m069xRfhAc55Ne6
 +qEHibfnz4tQ2zdydMJbjHBSEhnVwxQr6xcudLHOvLeNlYrU0xiF0eUX5Bw5c8lrWxDgVLL
 4xEr+9fSuMa8/3X8JhIMxovz1I8rLXCX188P6wD7+zFm7DqKMLc0p0rbLmSIbyfghaSJmiH
 OiHHmmvghUGmqkCG3vhp0vaxmdj0DTWBy1469on4T8lMuRizOmjUqGIvjUPAQ=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
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

From: Heikki Krogerus <heikki.krogerus@linux.intel.com>

The port and plug altmodes can't be bound to the altmode
drivers because the altmode drivers are meant for partner
communication using the VDM (vendor defined messages), but
they can still be part of the bus. The bus will make sure
that the normal bus notifications are available also with
the port altmodes.

The previously used common device type for all alternate
modes is replaced with separate dedicated device types for
port, plug, and partner alternate modes.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/bus.c   | 24 +++++++++++++++++++++++-
 drivers/usb/typec/bus.h   |  8 ++++++--
 drivers/usb/typec/class.c | 33 ++++++++++++++++++++++-----------
 3 files changed, 51 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
index a884cec9ab7e..a33da7f458a5 100644
--- a/drivers/usb/typec/bus.c
+++ b/drivers/usb/typec/bus.c
@@ -445,7 +445,23 @@ static struct attribute *typec_attrs[] = {
 	&dev_attr_description.attr,
 	NULL
 };
-ATTRIBUTE_GROUPS(typec);
+
+static umode_t typec_is_visible(struct kobject *kobj, struct attribute *attr, int n)
+{
+	if (is_typec_partner_altmode(kobj_to_dev(kobj)))
+		return attr->mode;
+	return 0;
+}
+
+static const struct attribute_group typec_group = {
+	.is_visible = typec_is_visible,
+	.attrs = typec_attrs,
+};
+
+static const struct attribute_group *typec_groups[] = {
+	&typec_group,
+	NULL
+};
 
 static int typec_match(struct device *dev, const struct device_driver *driver)
 {
@@ -453,6 +469,9 @@ static int typec_match(struct device *dev, const struct device_driver *driver)
 	struct typec_altmode *altmode = to_typec_altmode(dev);
 	const struct typec_device_id *id;
 
+	if (!is_typec_partner_altmode(dev))
+		return 0;
+
 	for (id = drv->id_table; id->svid; id++)
 		if (id->svid == altmode->svid)
 			return 1;
@@ -463,6 +482,9 @@ static int typec_uevent(const struct device *dev, struct kobj_uevent_env *env)
 {
 	const struct typec_altmode *altmode = to_typec_altmode(dev);
 
+	if (!is_typec_partner_altmode(dev))
+		return 0;
+
 	if (add_uevent_var(env, "SVID=%04X", altmode->svid))
 		return -ENOMEM;
 
diff --git a/drivers/usb/typec/bus.h b/drivers/usb/typec/bus.h
index 643b8c81786d..b58e131450d1 100644
--- a/drivers/usb/typec/bus.h
+++ b/drivers/usb/typec/bus.h
@@ -29,8 +29,12 @@ struct altmode {
 #define to_altmode(d) container_of(d, struct altmode, adev)
 
 extern const struct bus_type typec_bus;
-extern const struct device_type typec_altmode_dev_type;
+extern const struct device_type typec_port_altmode_dev_type;
+extern const struct device_type typec_plug_altmode_dev_type;
+extern const struct device_type typec_partner_altmode_dev_type;
 
-#define is_typec_altmode(_dev_) (_dev_->type == &typec_altmode_dev_type)
+#define is_typec_port_altmode(dev) ((dev)->type == &typec_port_altmode_dev_type)
+#define is_typec_plug_altmode(dev) ((dev)->type == &typec_plug_altmode_dev_type)
+#define is_typec_partner_altmode(dev) ((dev)->type == &typec_partner_altmode_dev_type)
 
 #endif /* __USB_TYPEC_ALTMODE_H__ */
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 9b2647cb199b..d6b88317f8a4 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -235,7 +235,7 @@ static int altmode_match(struct device *dev, const void *data)
 	struct typec_altmode *adev = to_typec_altmode(dev);
 	const struct typec_device_id *id = data;
 
-	if (!is_typec_altmode(dev))
+	if (!is_typec_port_altmode(dev))
 		return 0;
 
 	return (adev->svid == id->svid);
@@ -532,15 +532,28 @@ static void typec_altmode_release(struct device *dev)
 	kfree(alt);
 }
 
-const struct device_type typec_altmode_dev_type = {
-	.name = "typec_alternate_mode",
+const struct device_type typec_port_altmode_dev_type = {
+	.name = "typec_port_alternate_mode",
+	.groups = typec_altmode_groups,
+	.release = typec_altmode_release,
+};
+
+const struct device_type typec_plug_altmode_dev_type = {
+	.name = "typec_plug_alternate_mode",
+	.groups = typec_altmode_groups,
+	.release = typec_altmode_release,
+};
+
+const struct device_type typec_partner_altmode_dev_type = {
+	.name = "typec_partner_alternate_mode",
 	.groups = typec_altmode_groups,
 	.release = typec_altmode_release,
 };
 
 static struct typec_altmode *
 typec_register_altmode(struct device *parent,
-		       const struct typec_altmode_desc *desc)
+		       const struct typec_altmode_desc *desc,
+		       const struct device_type *type)
 {
 	unsigned int id = altmode_id_get(parent);
 	bool is_port = is_typec_port(parent);
@@ -575,7 +588,7 @@ typec_register_altmode(struct device *parent,
 
 	alt->adev.dev.parent = parent;
 	alt->adev.dev.groups = alt->groups;
-	alt->adev.dev.type = &typec_altmode_dev_type;
+	alt->adev.dev.type = type;
 	dev_set_name(&alt->adev.dev, "%s.%u", dev_name(parent), id);
 
 	get_device(alt->adev.dev.parent);
@@ -584,9 +597,7 @@ typec_register_altmode(struct device *parent,
 	if (!is_port)
 		typec_altmode_set_partner(alt);
 
-	/* The partners are bind to drivers */
-	if (is_typec_partner(parent))
-		alt->adev.dev.bus = &typec_bus;
+	alt->adev.dev.bus = &typec_bus;
 
 	/* Plug alt modes need a class to generate udev events. */
 	if (is_typec_plug(parent))
@@ -963,7 +974,7 @@ struct typec_altmode *
 typec_partner_register_altmode(struct typec_partner *partner,
 			       const struct typec_altmode_desc *desc)
 {
-	return typec_register_altmode(&partner->dev, desc);
+	return typec_register_altmode(&partner->dev, desc, &typec_partner_altmode_dev_type);
 }
 EXPORT_SYMBOL_GPL(typec_partner_register_altmode);
 
@@ -1193,7 +1204,7 @@ struct typec_altmode *
 typec_plug_register_altmode(struct typec_plug *plug,
 			    const struct typec_altmode_desc *desc)
 {
-	return typec_register_altmode(&plug->dev, desc);
+	return typec_register_altmode(&plug->dev, desc, &typec_plug_altmode_dev_type);
 }
 EXPORT_SYMBOL_GPL(typec_plug_register_altmode);
 
@@ -2493,7 +2504,7 @@ typec_port_register_altmode(struct typec_port *port,
 		return ERR_CAST(retimer);
 	}
 
-	adev = typec_register_altmode(&port->dev, desc);
+	adev = typec_register_altmode(&port->dev, desc, &typec_port_altmode_dev_type);
 	if (IS_ERR(adev)) {
 		typec_retimer_put(retimer);
 		typec_mux_put(mux);
-- 
2.51.1

