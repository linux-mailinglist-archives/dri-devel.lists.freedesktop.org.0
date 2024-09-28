Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F84F988FA5
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2024 16:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D22010E081;
	Sat, 28 Sep 2024 14:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="nLSDTbXA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr
 [80.12.242.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6A310E081
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2024 14:29:41 +0000 (UTC)
Received: from fedora.home ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id uYQysbPCMfghUuYQysPT8c; Sat, 28 Sep 2024 16:28:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1727533715;
 bh=faBUoY8IWHAosm+2lxACEFiJwibniF/ByuqHBImJHYw=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=nLSDTbXAG4WmOc53jIgq6NA53lVuJwZRRUfEd+C5eBpYBIa/8o5TDvbw9fWe7dCBn
 orZI+E62zjFGKK4ylSyy3VJJhixbXn7Aj/BcQFOQqUKeAmda7j/5gjusejxQMua1sm
 R3JJAEgwsoNDq6UkWgw54ZzZw5h3o9cZ5n1JNwhcmCKvx9MPdVBdDMQC7gZW8D2osG
 URVmbf0bHVBQc2N/1FgPqUxPwgEtkyFWZNVT3Mp8nLWb/cllk6/Dg9zotq9Ld/SvQ5
 CZSD9zB/MjdGkmluX5MIXwQvq21XSwczlE4CSjTtLBtRd+1Dz/vAJmT/ACmcEFeitZ
 dt4VgFn04XF2Q==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 28 Sep 2024 16:28:35 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/backlight: Remove a useless kstrdup_const()
Date: Sat, 28 Sep 2024 16:28:24 +0200
Message-ID: <3b3d3af8739e3016f3f80df0aa85b3c06230a385.1727533674.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"name" is allocated and freed in intel_backlight_device_register().
The initial allocation just duplicates "intel_backlight".

Later, if a device with this name has already been registered, another
dynamically generated one is allocated using kasprintf().

So at the end of the function, when "name" is freed, it can point either to
the initial static literal "intel_backlight" or to the kasprintf()'ed one.

So kfree_const() is used.

However, when built as a module, kstrdup_const() and kfree_const() don't
work as one would expect and are just plain kstrdup() and kfree().


Slightly change the logic and introduce a new variable to hold the
address returned by kasprintf() should it be used.

This saves a memory allocation/free and avoids these _const functions,
which names can be confusing when used with code built as module.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

For the records, this patch is a clean-up effort related to discussions at:
  - https://lore.kernel.org/all/ZvHurCYlCoi1ZTCX@skv.local/
  - https://lore.kernel.org/all/20240924050937.697118-1-senozhatsky@chromium.org/
---
 drivers/gpu/drm/i915/display/intel_backlight.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
index 9e05745d797d..bf7686aa044f 100644
--- a/drivers/gpu/drm/i915/display/intel_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_backlight.c
@@ -914,9 +914,9 @@ int intel_backlight_device_register(struct intel_connector *connector)
 {
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 	struct intel_panel *panel = &connector->panel;
+	const char *name, *new_name = NULL;
 	struct backlight_properties props;
 	struct backlight_device *bd;
-	const char *name;
 	int ret = 0;
 
 	if (WARN_ON(panel->backlight.device))
@@ -949,10 +949,7 @@ int intel_backlight_device_register(struct intel_connector *connector)
 	else
 		props.power = BACKLIGHT_POWER_OFF;
 
-	name = kstrdup_const("intel_backlight", GFP_KERNEL);
-	if (!name)
-		return -ENOMEM;
-
+	name = "intel_backlight";
 	bd = backlight_device_get_by_name(name);
 	if (bd) {
 		put_device(&bd->dev);
@@ -963,11 +960,11 @@ int intel_backlight_device_register(struct intel_connector *connector)
 		 * compatibility. Use unique names for subsequent backlight devices as a
 		 * fallback when the default name already exists.
 		 */
-		kfree_const(name);
-		name = kasprintf(GFP_KERNEL, "card%d-%s-backlight",
-				 i915->drm.primary->index, connector->base.name);
-		if (!name)
+		new_name = kasprintf(GFP_KERNEL, "card%d-%s-backlight",
+				     i915->drm.primary->index, connector->base.name);
+		if (!new_name)
 			return -ENOMEM;
+		name = new_name;
 	}
 	bd = backlight_device_register(name, connector->base.kdev, connector,
 				       &intel_backlight_device_ops, &props);
@@ -987,7 +984,7 @@ int intel_backlight_device_register(struct intel_connector *connector)
 		    connector->base.base.id, connector->base.name, name);
 
 out:
-	kfree_const(name);
+	kfree(new_name);
 
 	return ret;
 }
-- 
2.46.1

