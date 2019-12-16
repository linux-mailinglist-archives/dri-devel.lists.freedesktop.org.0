Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09077121B34
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 21:51:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE2B6E88D;
	Mon, 16 Dec 2019 20:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812296E890
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 20:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576529491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pvjquvCkoze0MtjNw3nKGvgtAe0VvOjNZaCP9z525sw=;
 b=I1bwQtUI5Ic2Pmoe2RzFp9jvmNjgje/KcRULXdfRFLzVr2L7/xiVYluC48kpRBxrAeH2Jn
 f5PA+nPMTvC8Nx27+pLJMZw7IWyhYxJ1wjPF1oPSP6s3+Lx0RvU0Ge/uid3QI0jr4HHqte
 zVmNZJwpZ8V6k30NXQG5uFUeHzB1BCY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-0P7U2uBGPNaQW1ifvJCavQ-1; Mon, 16 Dec 2019 15:51:30 -0500
X-MC-Unique: 0P7U2uBGPNaQW1ifvJCavQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20B9C107ACC4;
 Mon, 16 Dec 2019 20:51:28 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6A2A1001B00;
 Mon, 16 Dec 2019 20:51:25 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Lee Jones <lee.jones@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 1/5] pinctrl: Allow modules to use
 pinctrl_[un]register_mappings
Date: Mon, 16 Dec 2019 21:51:18 +0100
Message-Id: <20191216205122.1850923-2-hdegoede@redhat.com>
In-Reply-To: <20191216205122.1850923-1-hdegoede@redhat.com>
References: <20191216205122.1850923-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently only the drivers/pinctrl/devicetree.c code allows registering
pinctrl-mappings which may later be unregistered, all other mappings
are assumed to be permanent.

Non-dt platforms may also want to register pinctrl mappings from code which
is build as a module, which requires being able to unregister the mapping
when the module is unloaded to avoid dangling pointers.

To allow unregistering the mappings the devicetree code uses 2 internal
functions: pinctrl_register_map and pinctrl_unregister_map.

pinctrl_register_map allows the devicetree code to tell the core to
not memdup the mappings as it retains ownership of them and
pinctrl_unregister_map does the unregistering, note this only works
when the mappings where not memdupped.

The only code relying on the memdup/shallow-copy done by
pinctrl_register_mappings is arch/arm/mach-u300/core.c this commit
replaces the __initdata with const, so that the shallow-copy is no
longer necessary.

After that we can get rid of the internal pinctrl_unregister_map function
and just use pinctrl_register_mappings directly everywhere.

This commit also renames pinctrl_unregister_map to
pinctrl_unregister_mappings so that its naming matches its
pinctrl_register_mappings counter-part and exports it.

Together these 2 changes will allow non-dt platform code to
register pinctrl-mappings from modules without breaking things on
module unload (as they can now unregister the mapping on unload).

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
-Drop __initdata from arch/arm/mach-u300/core.c pinctrl-map, so
 that we can drop the dup behavior for non device-tree callers
-Stop memdupping the pinctrl-maps in some cases, remove all code for
 dealing with dupped maps, including the extra coded added for this in v1
 of this patch
-Drop the private (non-dupping) pinctrl_register_map function, now that
 our public pinctrl_register_mappings does not dup we can simply use it
 everywhere
---
 arch/arm/mach-u300/core.c       |  2 +-
 drivers/pinctrl/core.c          | 41 +++++++++++++--------------------
 drivers/pinctrl/core.h          |  4 ----
 drivers/pinctrl/devicetree.c    |  4 ++--
 include/linux/pinctrl/machine.h |  5 ++++
 5 files changed, 24 insertions(+), 32 deletions(-)

diff --git a/arch/arm/mach-u300/core.c b/arch/arm/mach-u300/core.c
index a79fa3b0c8ed..a1694d977ec9 100644
--- a/arch/arm/mach-u300/core.c
+++ b/arch/arm/mach-u300/core.c
@@ -201,7 +201,7 @@ static unsigned long pin_highz_conf[] = {
 };
 
 /* Pin control settings */
-static struct pinctrl_map __initdata u300_pinmux_map[] = {
+static const struct pinctrl_map u300_pinmux_map[] = {
 	/* anonymous maps for chip power and EMIFs */
 	PIN_MAP_MUX_GROUP_HOG_DEFAULT("pinctrl-u300", NULL, "power"),
 	PIN_MAP_MUX_GROUP_HOG_DEFAULT("pinctrl-u300", NULL, "emif0"),
diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 2bbd8ee93507..b0eea728455d 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1376,8 +1376,15 @@ void devm_pinctrl_put(struct pinctrl *p)
 }
 EXPORT_SYMBOL_GPL(devm_pinctrl_put);
 
-int pinctrl_register_map(const struct pinctrl_map *maps, unsigned num_maps,
-			 bool dup)
+/**
+ * pinctrl_register_mappings() - register a set of pin controller mappings
+ * @maps: the pincontrol mappings table to register. Note the pinctrl-core
+ *	keeps a reference to the passed in maps, so they should _not_ be
+ *	marked with __initdata.
+ * @num_maps: the number of maps in the mapping table
+ */
+int pinctrl_register_mappings(const struct pinctrl_map *maps,
+			      unsigned num_maps)
 {
 	int i, ret;
 	struct pinctrl_maps *maps_node;
@@ -1430,17 +1437,8 @@ int pinctrl_register_map(const struct pinctrl_map *maps, unsigned num_maps,
 	if (!maps_node)
 		return -ENOMEM;
 
+	maps_node->maps = maps;
 	maps_node->num_maps = num_maps;
-	if (dup) {
-		maps_node->maps = kmemdup(maps, sizeof(*maps) * num_maps,
-					  GFP_KERNEL);
-		if (!maps_node->maps) {
-			kfree(maps_node);
-			return -ENOMEM;
-		}
-	} else {
-		maps_node->maps = maps;
-	}
 
 	mutex_lock(&pinctrl_maps_mutex);
 	list_add_tail(&maps_node->node, &pinctrl_maps);
@@ -1448,22 +1446,14 @@ int pinctrl_register_map(const struct pinctrl_map *maps, unsigned num_maps,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(pinctrl_register_mappings);
 
 /**
- * pinctrl_register_mappings() - register a set of pin controller mappings
- * @maps: the pincontrol mappings table to register. This should probably be
- *	marked with __initdata so it can be discarded after boot. This
- *	function will perform a shallow copy for the mapping entries.
- * @num_maps: the number of maps in the mapping table
+ * pinctrl_unregister_mappings() - unregister a set of pin controller mappings
+ * @maps: the pincontrol mappings table passed to pinctrl_register_mappings()
+ *	when registering the mappings.
  */
-int pinctrl_register_mappings(const struct pinctrl_map *maps,
-			      unsigned num_maps)
-{
-	return pinctrl_register_map(maps, num_maps, true);
-}
-EXPORT_SYMBOL_GPL(pinctrl_register_mappings);
-
-void pinctrl_unregister_map(const struct pinctrl_map *map)
+void pinctrl_unregister_mappings(const struct pinctrl_map *map)
 {
 	struct pinctrl_maps *maps_node;
 
@@ -1478,6 +1468,7 @@ void pinctrl_unregister_map(const struct pinctrl_map *map)
 	}
 	mutex_unlock(&pinctrl_maps_mutex);
 }
+EXPORT_SYMBOL_GPL(pinctrl_unregister_mappings);
 
 /**
  * pinctrl_force_sleep() - turn a given controller device into sleep state
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 7f34167a0405..840103c40c14 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -236,10 +236,6 @@ extern struct pinctrl_gpio_range *
 pinctrl_find_gpio_range_from_pin_nolock(struct pinctrl_dev *pctldev,
 					unsigned int pin);
 
-int pinctrl_register_map(const struct pinctrl_map *maps, unsigned num_maps,
-			 bool dup);
-void pinctrl_unregister_map(const struct pinctrl_map *map);
-
 extern int pinctrl_force_sleep(struct pinctrl_dev *pctldev);
 extern int pinctrl_force_default(struct pinctrl_dev *pctldev);
 
diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index 674920daac26..9357f7c46cf3 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -51,7 +51,7 @@ void pinctrl_dt_free_maps(struct pinctrl *p)
 	struct pinctrl_dt_map *dt_map, *n1;
 
 	list_for_each_entry_safe(dt_map, n1, &p->dt_maps, node) {
-		pinctrl_unregister_map(dt_map->map);
+		pinctrl_unregister_mappings(dt_map->map);
 		list_del(&dt_map->node);
 		dt_free_map(dt_map->pctldev, dt_map->map,
 			    dt_map->num_maps);
@@ -92,7 +92,7 @@ static int dt_remember_or_free_map(struct pinctrl *p, const char *statename,
 	dt_map->num_maps = num_maps;
 	list_add_tail(&dt_map->node, &p->dt_maps);
 
-	return pinctrl_register_map(map, num_maps, false);
+	return pinctrl_register_mappings(map, num_maps);
 
 err_free_map:
 	dt_free_map(pctldev, map, num_maps);
diff --git a/include/linux/pinctrl/machine.h b/include/linux/pinctrl/machine.h
index ddd1b2773431..e987dc9fd2af 100644
--- a/include/linux/pinctrl/machine.h
+++ b/include/linux/pinctrl/machine.h
@@ -153,6 +153,7 @@ struct pinctrl_map {
 
 extern int pinctrl_register_mappings(const struct pinctrl_map *map,
 				unsigned num_maps);
+extern void pinctrl_unregister_mappings(const struct pinctrl_map *map);
 extern void pinctrl_provide_dummies(void);
 #else
 
@@ -162,6 +163,10 @@ static inline int pinctrl_register_mappings(const struct pinctrl_map *map,
 	return 0;
 }
 
+static inline void pinctrl_unregister_mappings(const struct pinctrl_map *map)
+{
+}
+
 static inline void pinctrl_provide_dummies(void)
 {
 }
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
