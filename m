Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7455610467
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 23:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD7E10E6F4;
	Thu, 27 Oct 2022 21:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [IPv6:2607:f8b0:4864:20::104a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836B910E6F4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 21:29:02 +0000 (UTC)
Received: by mail-pj1-x104a.google.com with SMTP id
 b1-20020a17090a10c100b0020da29fa5e5so1536517pje.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 14:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=sogLxSdG4yhSyQPPmGTG1lTI5fUEQY8x224g/Iq10fc=;
 b=ZfPQ53qWiF9lKVX7A6P52Hq3jFTphhwqs712Act23LApJ68RGcZiAYyi9BwF+Zl+AV
 a0lM5zs8rBWPovdTteQVAHwN0wrzj990wBJBsnlaf4bKLExxEl9FQbxCP7mOphdTB0SB
 4BKGGYsX66p9ToTP9xG8ipeq8gBa0QZo5COoWeUFYvDhXpLmgu9BxECYUW4mXuSITOpb
 +vpq9LhO5MIkI9j7dtDMgAQyZHeo61lmrhSg7EERHcZrYcWZ4EGm9iALoA36WiLjOGdO
 4aats94IGSscqNdxVjuYSH/alw8dVwbFeaWq3H8BwPg0/SpFqo4IyJeTO2fvQ3cplfKt
 hhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sogLxSdG4yhSyQPPmGTG1lTI5fUEQY8x224g/Iq10fc=;
 b=6gcWWBcVLaFquHSMWOnGSjT/n4f+oPrIl97VZssRm8at1aYGHrFopbiYgmwFmZVP95
 mKXDIOqN9XqHOX6HpESWPktiD35o9DUfQDDsl4esTDuFAUFv7QucsXU50bqInXPj96pl
 VUa3PNbVJqFU+k3v4gpMYfJ7UuFBgEP4CT2pi7VazrOeU1hewJ7YMYfNcLdqtDQK1YiC
 Y0Nymc2hwDFP249ic7tZGBIZTxtj6XJnaZdzwwwKEoCR86Bss1REfqsOMDLKGjeB3cox
 bTBAIzEUp9oZMwhyv2TIfnL7sasmlFfm6//t4Itvagos7yLVVBkN6rr/1qg5XYOpHy9v
 1aXg==
X-Gm-Message-State: ACrzQf1m2WWHytADe9TX9PtHS9+37OuQLCrJyyEMNB0ujDXgeiJUtwYN
 D1MNvz5qqrPn2ukdYjPRlCyNLWGX0zlsnw==
X-Google-Smtp-Source: AMsMyM4uM4T1zCFb+ABPod5xJDsDwyQXMdmcaWbc/HvdOYvOkB3E/tAajIyRYpToivIpyzCGtz91zVTkXPrw3g==
X-Received: from wonchungspecialist.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1440])
 (user=wonchung job=sendgmr) by 2002:a05:6a00:150e:b0:56c:83b3:d148 with SMTP
 id q14-20020a056a00150e00b0056c83b3d148mr7337251pfu.48.1666906142035; Thu, 27
 Oct 2022 14:29:02 -0700 (PDT)
Date: Thu, 27 Oct 2022 21:28:54 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.1.273.g43a17bfeac-goog
Message-ID: <20221027212854.1083686-1-wonchung@google.com>
Subject: [PATCH v3] drm/sysfs: Link DRM connectors to corresponding Type-C
 connectors
From: Won Chung <wonchung@google.com>
To: wonchung@google.com, bleung@google.com, pmalani@chromium.org, 
 heikki.krogerus@linux.intel.com, imre.deak@intel.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@linux.ie, airlied@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Create a symlink pointing to USB Type-C connector for DRM connectors
when they are created. The link will be created only if the firmware is
able to describe the connection beween the two connectors.

Signed-off-by: Won Chung <wonchung@google.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Changes from v2:
- Resending the patch to dri-devel list

Changes from v1:
- Fix multiple lines to single line


 drivers/gpu/drm/drm_sysfs.c | 40 +++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 430e00b16eec..6a9904fa9186 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -11,12 +11,14 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/component.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/export.h>
 #include <linux/gfp.h>
 #include <linux/i2c.h>
 #include <linux/kdev_t.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 
 #include <drm/drm_connector.h>
@@ -95,6 +97,34 @@ static char *drm_devnode(struct device *dev, umode_t *mode)
 	return kasprintf(GFP_KERNEL, "dri/%s", dev_name(dev));
 }
 
+static int typec_connector_bind(struct device *dev,
+	struct device *typec_connector, void *data)
+{
+	int ret;
+
+	ret = sysfs_create_link(&dev->kobj, &typec_connector->kobj, "typec_connector");
+	if (ret)
+		return ret;
+
+	ret = sysfs_create_link(&typec_connector->kobj, &dev->kobj, "drm_connector");
+	if (ret)
+		sysfs_remove_link(&dev->kobj, "typec_connector");
+
+	return ret;
+}
+
+static void typec_connector_unbind(struct device *dev,
+	struct device *typec_connector, void *data)
+{
+	sysfs_remove_link(&typec_connector->kobj, "drm_connector");
+	sysfs_remove_link(&dev->kobj, "typec_connector");
+}
+
+static const struct component_ops typec_connector_ops = {
+	.bind = typec_connector_bind,
+	.unbind = typec_connector_unbind,
+};
+
 static CLASS_ATTR_STRING(version, S_IRUGO, "drm 1.1.0 20060810");
 
 /**
@@ -355,6 +385,13 @@ int drm_sysfs_connector_add(struct drm_connector *connector)
 	if (connector->ddc)
 		return sysfs_create_link(&connector->kdev->kobj,
 				 &connector->ddc->dev.kobj, "ddc");
+
+	if (dev_fwnode(kdev)) {
+		r = component_add(kdev, &typec_connector_ops);
+		if (r)
+			drm_err(dev, "failed to add component\n");
+	}
+
 	return 0;
 
 err_free:
@@ -367,6 +404,9 @@ void drm_sysfs_connector_remove(struct drm_connector *connector)
 	if (!connector->kdev)
 		return;
 
+	if (dev_fwnode(connector->kdev))
+		component_del(connector->kdev, &typec_connector_ops);
+
 	if (connector->ddc)
 		sysfs_remove_link(&connector->kdev->kobj, "ddc");
 
-- 
2.37.3.998.g577e59143f-goog

