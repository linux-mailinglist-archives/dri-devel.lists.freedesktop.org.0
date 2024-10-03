Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC3E98F56C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 19:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5775B10E8C1;
	Thu,  3 Oct 2024 17:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="q7OTvF1l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr
 [80.12.242.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D54710E113;
 Thu,  3 Oct 2024 17:42:18 +0000 (UTC)
Received: from fedora.home ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id wPq8swhqS7qAjwPq8sLNUA; Thu, 03 Oct 2024 19:42:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1727977336;
 bh=LhnrapA1svnmlMx7xGYpTi5BLYj0TEUzRvNk0AItb2s=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=q7OTvF1l62ehUvp8N5YxrlB6RCO6AOPpdfa7wRMrXMlm93JNTsppGGLP9A8sHnIb+
 TBo21exNKKTSnk8bsTG/tEfJxIs86mw/w4CCW/8LczKq5xPprFXZj0ntGDHZ4UB7Gz
 hxGNQrO9HY1sIqTZrMGrCJRkRQBxCsv0BpNr8CPPbPGHe5lg+ZFyVcuJ4W+qgz4SAv
 4pWMJa/9P9xHm4cJfbSecW6SFoZJ7z8uyUrBwyBa5K3DIH5pCgaUWTLOJk/Qne7SA/
 l2MSKn7Q7681nyR0gSt51hlH2iXFI5ttMw7DiuM0UUKSzwjxzbbhzefjPOtVVSO06c
 ghuSldIi556sQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 03 Oct 2024 19:42:16 +0200
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
Subject: [PATCH] drm/i915/display: Remove kstrdup_const() and kfree_const()
 usage
Date: Thu,  3 Oct 2024 19:41:08 +0200
Message-ID: <f82be2ee3ac7d18dd9982b5368a88a5bf2aeb777.1727977199.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.2
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

kstrdup_const() and kfree_const() can be confusing in code built as a
module. In such a case, it does not do what one could expect from the name
of the functions.

The code is not wrong by itself, but in such a case, it is equivalent to
kstrdup() and kfree().

So, keep thinks simple and straightforward.

This reverts commit 379b63e7e682 ("drm/i915/display: Save a few bytes of
memory in intel_backlight_device_register()")

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/i915/display/intel_backlight.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
index 9e05745d797d..3f81a726cc7d 100644
--- a/drivers/gpu/drm/i915/display/intel_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_backlight.c
@@ -949,7 +949,7 @@ int intel_backlight_device_register(struct intel_connector *connector)
 	else
 		props.power = BACKLIGHT_POWER_OFF;
 
-	name = kstrdup_const("intel_backlight", GFP_KERNEL);
+	name = kstrdup("intel_backlight", GFP_KERNEL);
 	if (!name)
 		return -ENOMEM;
 
@@ -963,7 +963,7 @@ int intel_backlight_device_register(struct intel_connector *connector)
 		 * compatibility. Use unique names for subsequent backlight devices as a
 		 * fallback when the default name already exists.
 		 */
-		kfree_const(name);
+		kfree(name);
 		name = kasprintf(GFP_KERNEL, "card%d-%s-backlight",
 				 i915->drm.primary->index, connector->base.name);
 		if (!name)
@@ -987,7 +987,7 @@ int intel_backlight_device_register(struct intel_connector *connector)
 		    connector->base.base.id, connector->base.name, name);
 
 out:
-	kfree_const(name);
+	kfree(name);
 
 	return ret;
 }
-- 
2.46.2

