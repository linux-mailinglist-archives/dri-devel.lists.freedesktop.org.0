Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CE4ACE5F1
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 23:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E702A10E085;
	Wed,  4 Jun 2025 21:03:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PwwqrDkO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C2910E085;
 Wed,  4 Jun 2025 21:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749071005; x=1780607005;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=Fybfpl+9NRRoM+EOI6O4wAg0E8lwrxs97y3QuiCUKKc=;
 b=PwwqrDkOdDf4lur1GQn0OCPyRUP81u6VmqjzHw3zAOlrfDsiJXjUfGwS
 aItTJzD/QC9ED5jQ10uYmtV9CzHNcFOU1qbibxzcsMvwqKqpqHoqaytWv
 Gtd7t5Eiy473/6SCjh8rRNzQKXHAleW4LxGDp9fmWN+AftKssoYFOn3z4
 1Zg73YAVou2LQMdPUUMRSkrzLqoiN+yOcL7A6hGCkHgpFprwIdeh6sPXc
 vdRhg+HIwLmmjPdl84xdWH7ubU2jVRku+KTdGiQmkcoDWp7/xEoqNBZHK
 iC1188LqpT5CtaUq8lncHJYogJHz/R+yjL+7flfb0T5scAZUfpjKDOetq g==;
X-CSE-ConnectionGUID: OBbAMt+HRjWIM/OclY4k/g==
X-CSE-MsgGUID: JWwkaMprQfat0iapnbgmaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="62530238"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="62530238"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 14:03:24 -0700
X-CSE-ConnectionGUID: eCszTzyTRlSkawbUpvgRjA==
X-CSE-MsgGUID: wuNqWI6ITYWCMQl6HrIc3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="176178606"
Received: from jekeller-desk.jf.intel.com ([10.166.241.15])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 14:03:24 -0700
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Wed, 04 Jun 2025 14:03:15 -0700
Subject: [PATCH] drm/nouveau/bl: Use kasprintf for interface name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250604-jk-nouveua-drm-bl-snprintf-fix-v1-1-79b1593ad664@intel.com>
X-B4-Tracking: v=1; b=H4sIAJO0QGgC/x2NMQ6DMAwAv4I811JqGoZ+peoQEqc1bQ1yACEh/
 k7U8W6426GwCRe4NzsYr1Jk1ArXSwPxHfTFKKkykCPvOnfD4YM6LisvAZP9sP9i0clE54xZNow
 Ugycf2kQZamQyrvo/eDyP4wR50NWVcAAAAA==
X-Change-ID: 20250604-jk-nouveua-drm-bl-snprintf-fix-c2ca525a3d2f
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Ben Skeggs <bskeggs@redhat.com>, Pierre Moreau <pierre.morrow@free.fr>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Philip Li <philip.li@intel.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.14.2
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

The nouveau_get_backlight_name() function generates a unique name for the
backlight interface, appending an id from 1 to 99 for all backlight devices
after the first.

GCC 15 (and likely other compilers) produce the following
-Wformat-truncation warning:

nouveau_backlight.c: In function ‘nouveau_backlight_init’:
nouveau_backlight.c:56:69: error: ‘%d’ directive output may be truncated writing between 1 and 10 bytes into a region of size 3 [-Werror=format-truncation=]
   56 |                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
      |                                                                     ^~
In function ‘nouveau_get_backlight_name’,
    inlined from ‘nouveau_backlight_init’ at nouveau_backlight.c:351:7:
nouveau_backlight.c:56:56: note: directive argument in the range [1, 2147483647]
   56 |                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
      |                                                        ^~~~~~~~~~~~~~~~
nouveau_backlight.c:56:17: note: ‘snprintf’ output between 14 and 23 bytes into a destination of size 15
   56 |                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The warning started appearing after commit ab244be47a8f ("drm/nouveau:
Fix a potential theorical leak in nouveau_get_backlight_name()") This fix
for the ida usage removed the explicit value check for ids larger than 99.
The compiler is unable to intuit that the ida_alloc_max() limits the
returned value range between 0 and 99.

The warning has gone unfixed for some time, with at least one kernel test
robot report. The code breaks W=1 builds, which is especially frustrating
with the introduction of CONFIG_WERROR.

Refactor the function to avoid the fixed-length buffer entirely. Use
kasprintf to allocate a buffer of appropriate size. This avoids the need
for BL_NAME_SIZE and resolves the -Wformat-truncation warning, fixing W=1
builds.

Compile tested only.

Fixes: ab244be47a8f ("drm/nouveau: Fix a potential theorical leak in nouveau_get_backlight_name()")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312050324.0kv4PnfZ-lkp@intel.com/
Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
---
This could also be fixed by simply increasing BL_NAME_SIZE to 24, making it
large enough to fit any size integer into its format string, or by checking
the return value of snprintf.
---
 drivers/gpu/drm/nouveau/nouveau_backlight.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index d47442125fa183146135f3725eae161c68e2a900..d3cf69fe2eeb33c24ee698db19b34a56a72f51cb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -42,22 +42,21 @@
 #include "nouveau_acpi.h"
 
 static struct ida bl_ida;
-#define BL_NAME_SIZE 15 // 12 for name + 2 for digits + 1 for '\0'
 
-static bool
-nouveau_get_backlight_name(char backlight_name[BL_NAME_SIZE],
-			   struct nouveau_backlight *bl)
+static char *
+nouveau_get_backlight_name(struct nouveau_backlight *bl)
 {
 	const int nb = ida_alloc_max(&bl_ida, 99, GFP_KERNEL);
 
 	if (nb < 0)
-		return false;
-	if (nb > 0)
-		snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
-	else
-		snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight");
+		return NULL;
+
 	bl->id = nb;
-	return true;
+
+	if (nb > 0)
+		return kasprintf(GFP_KERNEL, "nv_backlight%d", nb);
+	else
+		return kasprintf(GFP_KERNEL, "nv_backlight");
 }
 
 static int
@@ -293,9 +292,9 @@ nouveau_backlight_init(struct drm_connector *connector)
 	struct nouveau_backlight *bl;
 	struct nouveau_encoder *nv_encoder = NULL;
 	struct nvif_device *device = &drm->client.device;
-	char backlight_name[BL_NAME_SIZE];
 	struct backlight_properties props = {0};
 	const struct backlight_ops *ops;
+	char *backlight_name;
 	int ret;
 
 	if (apple_gmux_present()) {
@@ -348,7 +347,8 @@ nouveau_backlight_init(struct drm_connector *connector)
 		goto fail_alloc;
 	}
 
-	if (!nouveau_get_backlight_name(backlight_name, bl)) {
+	backlight_name = nouveau_get_backlight_name(bl);
+	if (!backlight_name) {
 		NV_ERROR(drm, "Failed to retrieve a unique name for the backlight interface\n");
 		goto fail_alloc;
 	}
@@ -356,6 +356,7 @@ nouveau_backlight_init(struct drm_connector *connector)
 	props.type = BACKLIGHT_RAW;
 	bl->dev = backlight_device_register(backlight_name, connector->kdev,
 					    nv_encoder, ops, &props);
+	kfree(backlight_name);
 	if (IS_ERR(bl->dev)) {
 		if (bl->id >= 0)
 			ida_free(&bl_ida, bl->id);

---
base-commit: 90b83efa6701656e02c86e7df2cb1765ea602d07
change-id: 20250604-jk-nouveua-drm-bl-snprintf-fix-c2ca525a3d2f

Best regards,
-- 
Jacob Keller <jacob.e.keller@intel.com>

