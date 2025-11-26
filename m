Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A164EC89BFE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 13:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8934510E0CE;
	Wed, 26 Nov 2025 12:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jnTMA2J+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89C910E0CE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 12:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764160027; x=1795696027;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FGV3mO1dmDC36Y5ZwJqqYtuXmf3eRjhooAAD+j9O3po=;
 b=jnTMA2J+7M20jvqW4n7qgIClK+umYvYgokX40KitZouhoD6qhLHixJQF
 DMOJIm3HqgKoCqCm62H4gdMiqX0rDIH4FD4DbmVTZgmXr/xkF3ZQ1iHOk
 v7sjvkxYdWx8JIkkRDdbDUnZbN4R8aSq4McF4LibmAE+k0gDSISvlhDW4
 C40tZI8aD9tZ2A4rYkBCGocQLSOOCwftM3E+kar0omxPJF6zAt1OVLbna
 vP2L9XdypqqbY7uaMRBBxMzg9g3coksWpjVWGWzK8zCXvj0BSK9LCx6ID
 aRQ1jm6W66v+Ml3HYnCCckKMk+TbuqanDIbuiAD5sY486u0jdnh9kKQ+2 w==;
X-CSE-ConnectionGUID: bTbke/VySg+6K9ucoL8Osw==
X-CSE-MsgGUID: GWJnEfZnRgq702tCejbNOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="70060098"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208,223";a="70060098"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 04:27:07 -0800
X-CSE-ConnectionGUID: GtkyTZb0R9CO0SOLOOs9hw==
X-CSE-MsgGUID: X2b1Mji4QRK81e4yBy06JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
 d="scan'208,223";a="192068877"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO kuha) ([10.124.223.27])
 by orviesa006.jf.intel.com with SMTP; 26 Nov 2025 04:26:56 -0800
Received: by kuha (sSMTP sendmail emulation); Wed, 26 Nov 2025 14:26:49 +0200
Date: Wed, 26 Nov 2025 14:26:49 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <kernel@airkyi.com>,
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v10 01/11] usb: typec: Add notifier functions
Message-ID: <aSbyCR-vFo3mvZ3u@kuha>
References: <2025112402-unopposed-polio-e6e9@gregkh>
 <a80483de-518d-45d5-b46a-9b70cca5b236@rock-chips.com>
 <2025112448-brush-porcupine-c851@gregkh>
 <c9cb7b79-37c8-4fef-97a6-7d6b8898f9c4@rock-chips.com>
 <aSV_lQYJPxN7oBM-@kuha> <2025112554-uncaring-curator-642a@gregkh>
 <cbb38c08-6937-4b7d-a0b0-d5ca6c17f466@rock-chips.com>
 <aSbLkwPG0dUzZvql@kuha> <2025112656-dreamland-retreat-2a65@gregkh>
 <e48e1918-8ee0-4ffe-93d5-e096af241f77@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="G9XrtC05Z7lpB1j2"
Content-Disposition: inline
In-Reply-To: <e48e1918-8ee0-4ffe-93d5-e096af241f77@rock-chips.com>
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


--G9XrtC05Z7lpB1j2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Wed, Nov 26, 2025 at 07:51:33PM +0800, Chaoyi Chen kirjoitti:
> On 11/26/2025 7:44 PM, Greg Kroah-Hartman wrote:
> > On Wed, Nov 26, 2025 at 11:42:43AM +0200, Heikki Krogerus wrote:
> >> Wed, Nov 26, 2025 at 09:46:19AM +0800, Chaoyi Chen kirjoitti:
> >>> On 11/25/2025 7:49 PM, Greg Kroah-Hartman wrote:
> >>>>> +static umode_t typec_is_visible(struct kobject *kobj, struct attribute *attr, int n)
> >>>>> +{
> >>>>> +	if (is_typec_port(kobj_to_dev(kobj)->parent))
> >>>>
> >>>> Why look at the parent?  Doesn't the device have a type that should show
> >>>> this?
> >>>>
> >>>> Otherwise, looks good to me.
> >>>
> >>> They have same deivce type "typec_altmode_dev_type".
> >>> The parent device has a different device type to distinguish between
> >>> port device and partner device.
> >>
> >> I was already wondering would it make sense to provide separate device
> >> types for the port, and also plug, alternate modes, but I'm not sure
> >> if that's the right thing to do.
> >>
> >> There is a plan to register an "altmode" also for the USB4 mode,
> >> which of course is not an alternate mode. So USB4 will definitely need a
> >> separate device type.
> >>
> >> So if we supply separate device types for the port, plug and partner
> >> alternate modes, we need to supply separate device types for port, plug
> >> and partner USB4 mode as well.
> >>
> >> We certainly can still do that, but I'm just not sure if it makes
> >> sense?
> >>
> >> I'll prepare a new version for this and include a separate patch where
> >> instead of defining separate device types for the port and plug
> >> alternate modes I'll just supply helpers is_port_alternate_mode() and
> >> is_plug_alternate_mode().
> > 
> > That feels like it would be better in the long run as it would be
> > easier to "match" on the device type.
> >
> 
> It make sense. But now can we first use the current "match" device type
> operation and then modify them later?

Let's do this right from the beginning. Here's a version with the
dedicated device types.

-- 
heikki

--G9XrtC05Z7lpB1j2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename=0001-usb-typec-Set-the-bus-also-for-the-port-and-plug-alt.patch

From c0b2afa035cff0788c68869bf454c43eab2b201f Mon Sep 17 00:00:00 2001
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Tue, 25 Nov 2025 10:38:04 +0100
Subject: [PATCH v2] usb: typec: Set the bus also for the port and plug altmodes

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

v2: Added the dedicated device types.

---
 drivers/usb/typec/bus.c   | 24 +++++++++++++++++++++++-
 drivers/usb/typec/bus.h   |  8 ++++++--
 drivers/usb/typec/class.c | 33 ++++++++++++++++++++++-----------
 3 files changed, 51 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
index a884cec9ab7e..048c0edf6ca4 100644
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
@@ -469,6 +488,9 @@ static int typec_uevent(const struct device *dev, struct kobj_uevent_env *env)
 	if (add_uevent_var(env, "MODE=%u", altmode->mode))
 		return -ENOMEM;
 
+	if (!is_typec_partner_altmode(dev))
+		return 0;
+
 	return add_uevent_var(env, "MODALIAS=typec:id%04X", altmode->svid);
 }
 
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
2.50.1


--G9XrtC05Z7lpB1j2--
