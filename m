Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 928223D3E74
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 19:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0DD66F600;
	Fri, 23 Jul 2021 17:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF7D6F5FC
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 17:21:47 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 u9-20020a17090a1f09b029017554809f35so9865583pja.5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 10:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dn9g+cLxV3IfLVplvs+iNQyIBoevRLmHSwhuhNVkefk=;
 b=mmWUDuiw++PxMFeGxl/kkG05R2NWOEmaVPWb46dqK/4d06dyosxbaOqbv4+/WtLYTR
 TEucxUZUMsyTwvnJeYM5fVJf7Ll8/W4YIoGRuHYd56G84CEHKzBfO5KBMjgvKIyRES0e
 VyY6yufiW0FxteRWygLKf4KFohCGcD8UXxXUbQjkxPNrT0PbOzijThGTR/wtdfIF0rtu
 Q+fK9Bs9Be6BAJWqXu95DeKetXnqhaN/5BvayCm5YicNgMhEsxE1T/mfTT8dhktBiTdl
 N3+XsSz2NE6eTt2foIp/UaJrHjWPgzljyszkfZIQDTsUiL9lBAEtVRfoaqaoiC+ss8sL
 Gs2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dn9g+cLxV3IfLVplvs+iNQyIBoevRLmHSwhuhNVkefk=;
 b=Q9RGKymJESac4YYu/9/9pJbE1+pRcYv7vLV8VpMMNL0Nk8WojLrmPXx4ywOvbLB3fA
 FtTnvo7h3N/vcfDy4Iynl1U2ZFXiTG/C4JFTK4xFEkQUeZEglY4zkBr3CAUwvu0jSTY+
 QxaIHAwXkyE66KTNii9XEvc5ExrCiSw48YSAmE7J1jS1IDqCoDLMrq3bznkZRUVhYSjK
 9L4mnOJJhTRrgdjf1daKnMT/EpSTYzg9A+DNe79LfnTQFAbDtFO1FpRP3Hd04NdumBB4
 u2GZv/XV/0897VkSDX8epXcfXGgz956H5c+nudHs9p9wXCjTRhFpD9MHB56PDS94fMYY
 u3IQ==
X-Gm-Message-State: AOAM530u8X6RYmVVkrvL7Xpp6ZCG8NQp7bLB9WKnIdXXBcc5/1bLFuT3
 Xlrx01piUrCAt5Ut8DD7R8slEg==
X-Google-Smtp-Source: ABdhPJwNdEjcge2zywMI/MI8RfHilzL4WMcVIlyTraImIwpYLH/Yn33A9ENKGkPUXRuow60G2kQnyA==
X-Received: by 2002:aa7:810d:0:b029:363:7359:f355 with SMTP id
 b13-20020aa7810d0000b02903637359f355mr5477100pfi.64.1627060907438; 
 Fri, 23 Jul 2021 10:21:47 -0700 (PDT)
Received: from omlet.lan ([134.134.137.86])
 by smtp.gmail.com with ESMTPSA id s36sm24288648pgl.8.2021.07.23.10.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:21:47 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/8] drm/i915/gem: Check object_can_migrate from object_migrate
Date: Fri, 23 Jul 2021 12:21:35 -0500
Message-Id: <20210723172142.3273510-2-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723172142.3273510-1-jason@jlekstrand.net>
References: <20210723172142.3273510-1-jason@jlekstrand.net>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We don't roll them together entirely because there are still a couple
cases where we want a separate can_migrate check.  For instance, the
display code checks that you can migrate a buffer to LMEM before it
accepts it in fb_create.  The dma-buf import code also uses it to do an
early check and return a different error code if someone tries to attach
a LMEM-only dma-buf to another driver.

However, no one actually wants to call object_migrate when can_migrate
has failed.  The stated intention is for self-tests but none of those
actually take advantage of this unsafe migration.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Daniel Vetter <daniel@ffwll.ch>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c        | 13 ++-----------
 .../gpu/drm/i915/gem/selftests/i915_gem_migrate.c | 15 ---------------
 2 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 5c21cff33199e..d09bd9bdb38ac 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -584,12 +584,6 @@ bool i915_gem_object_can_migrate(struct drm_i915_gem_object *obj,
  * completed yet, and to accomplish that, i915_gem_object_wait_migration()
  * must be called.
  *
- * This function is a bit more permissive than i915_gem_object_can_migrate()
- * to allow for migrating objects where the caller knows exactly what is
- * happening. For example within selftests. More specifically this
- * function allows migrating I915_BO_ALLOC_USER objects to regions
- * that are not in the list of allowable regions.
- *
  * Note: the @ww parameter is not used yet, but included to make sure
  * callers put some effort into obtaining a valid ww ctx if one is
  * available.
@@ -616,11 +610,8 @@ int i915_gem_object_migrate(struct drm_i915_gem_object *obj,
 	if (obj->mm.region == mr)
 		return 0;
 
-	if (!i915_gem_object_evictable(obj))
-		return -EBUSY;
-
-	if (!obj->ops->migrate)
-		return -EOPNOTSUPP;
+	if (!i915_gem_object_can_migrate(obj, id))
+		return -EINVAL;
 
 	return obj->ops->migrate(obj, mr);
 }
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
index 0b7144d2991ca..28a700f08b49a 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
@@ -61,11 +61,6 @@ static int igt_create_migrate(struct intel_gt *gt, enum intel_region_id src,
 		if (err)
 			continue;
 
-		if (!i915_gem_object_can_migrate(obj, dst)) {
-			err = -EINVAL;
-			continue;
-		}
-
 		err = i915_gem_object_migrate(obj, &ww, dst);
 		if (err)
 			continue;
@@ -114,11 +109,6 @@ static int lmem_pages_migrate_one(struct i915_gem_ww_ctx *ww,
 		return err;
 
 	if (i915_gem_object_is_lmem(obj)) {
-		if (!i915_gem_object_can_migrate(obj, INTEL_REGION_SMEM)) {
-			pr_err("object can't migrate to smem.\n");
-			return -EINVAL;
-		}
-
 		err = i915_gem_object_migrate(obj, ww, INTEL_REGION_SMEM);
 		if (err) {
 			pr_err("Object failed migration to smem\n");
@@ -137,11 +127,6 @@ static int lmem_pages_migrate_one(struct i915_gem_ww_ctx *ww,
 		}
 
 	} else {
-		if (!i915_gem_object_can_migrate(obj, INTEL_REGION_LMEM)) {
-			pr_err("object can't migrate to lmem.\n");
-			return -EINVAL;
-		}
-
 		err = i915_gem_object_migrate(obj, ww, INTEL_REGION_LMEM);
 		if (err) {
 			pr_err("Object failed migration to lmem\n");
-- 
2.31.1

