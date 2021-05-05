Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7C4373F8F
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 18:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D380F6EB62;
	Wed,  5 May 2021 16:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17F96EB5E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 16:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620231870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rrsxG+ZtySlDZ/RxEXmF2oO/z1ehxbrFD4tyFcVOiq8=;
 b=YmcHzYnS/sy1ts9Q2Ew7aJR672ZkkL3UjwNZE+uyI7IpFosCz7ln3E7WcWGMgawjyzRDVD
 4ecnP1fiWeDWWlIfFE66Nv531VthGS6pmhYZ07yhxfc5q9j9W5QrmSHusmj3mjno6vQJS7
 5ME/I9wkoGxaO4PB3vpYRqiTRXobMno=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-kt466NRzMYqpOe-3N6MNWg-1; Wed, 05 May 2021 12:24:26 -0400
X-MC-Unique: kt466NRzMYqpOe-3N6MNWg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B22371008064;
 Wed,  5 May 2021 16:24:24 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-71.ams2.redhat.com [10.36.112.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 576EA5C5DF;
 Wed,  5 May 2021 16:24:21 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Imre Deak <imre.deak@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 1/8] drm/connector: Give connector sysfs devices there own
 device_type
Date: Wed,  5 May 2021 18:24:08 +0200
Message-Id: <20210505162415.531876-2-hdegoede@redhat.com>
In-Reply-To: <20210505162415.531876-1-hdegoede@redhat.com>
References: <20210505162415.531876-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Give connector sysfs devices there own device_type, this allows us to
check if a device passed to functions dealing with generic devices is
a drm_connector or not.

A check like this is necessary in the drm_connector_acpi_bus_match()
function added in the next patch in this series.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_sysfs.c | 50 +++++++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 968a9560b4aa..f9d92bbb1f98 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -50,6 +50,10 @@ static struct device_type drm_sysfs_device_minor = {
 	.name = "drm_minor"
 };
 
+static struct device_type drm_sysfs_device_connector = {
+	.name = "drm_connector",
+};
+
 struct class *drm_class;
 
 static char *drm_devnode(struct device *dev, umode_t *mode)
@@ -102,6 +106,11 @@ void drm_sysfs_destroy(void)
 	drm_class = NULL;
 }
 
+static void drm_sysfs_release(struct device *dev)
+{
+	kfree(dev);
+}
+
 /*
  * Connector properties
  */
@@ -273,27 +282,47 @@ static const struct attribute_group *connector_dev_groups[] = {
 int drm_sysfs_connector_add(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
+	struct device *kdev;
+	int r;
 
 	if (connector->kdev)
 		return 0;
 
-	connector->kdev =
-		device_create_with_groups(drm_class, dev->primary->kdev, 0,
-					  connector, connector_dev_groups,
-					  "card%d-%s", dev->primary->index,
-					  connector->name);
+	kdev = kzalloc(sizeof(*kdev), GFP_KERNEL);
+	if (!kdev)
+		return -ENOMEM;
+
+	device_initialize(kdev);
+	kdev->class = drm_class;
+	kdev->type = &drm_sysfs_device_connector;
+	kdev->parent = dev->primary->kdev;
+	kdev->groups = connector_dev_groups;
+	kdev->release = drm_sysfs_release;
+	dev_set_drvdata(kdev, connector);
+
+	r = dev_set_name(kdev, "card%d-%s", dev->primary->index, connector->name);
+	if (r)
+		goto err_free;
+
 	DRM_DEBUG("adding \"%s\" to sysfs\n",
 		  connector->name);
 
-	if (IS_ERR(connector->kdev)) {
-		DRM_ERROR("failed to register connector device: %ld\n", PTR_ERR(connector->kdev));
-		return PTR_ERR(connector->kdev);
+	r = device_add(kdev);
+	if (r) {
+		DRM_ERROR("failed to register connector device: %d\n", r);
+		goto err_free;
 	}
 
+	connector->kdev = kdev;
+
 	if (connector->ddc)
 		return sysfs_create_link(&connector->kdev->kobj,
 				 &connector->ddc->dev.kobj, "ddc");
 	return 0;
+
+err_free:
+	put_device(kdev);
+	return r;
 }
 
 void drm_sysfs_connector_remove(struct drm_connector *connector)
@@ -374,11 +403,6 @@ void drm_sysfs_connector_status_event(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_sysfs_connector_status_event);
 
-static void drm_sysfs_release(struct device *dev)
-{
-	kfree(dev);
-}
-
 struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
 {
 	const char *minor_str;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
