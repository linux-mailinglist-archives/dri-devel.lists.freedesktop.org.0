Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F5F334A19
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 22:50:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D274E6E3AA;
	Wed, 10 Mar 2021 21:50:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F305F6E3AA
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 21:50:12 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id ha17so1625006pjb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 13:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uxMDwMTpaikMlU+GoHBppWJvZIgmfGEWKHRy2R9Ueq8=;
 b=IolaremwRbiEmq9WH6RP+Q443wruKjjJ0tgVxHjysBVeK6yPnaF0il5W/DmEtsNqQ/
 K1orAGfPig3ZHQajB6p/jpG7mvK41Al0eBS5UGsy2wLTd8b74l3ZSfN6IOFf4fAXnXse
 Fnts+6GnRQkqxviG3pTV05XQOXYz7qoJcC1ryW0Rn2QZcswLc0xYzJ3m+G9H9gbroMjL
 cU6p1RgIHpTGcGqNsZRPGoncrqDjhfM/pDUH1gBWCk34+N1nHa1Nde6KiTmA0RrFz/zD
 94PG5p5xaz7I1gA4TUe3dQF0MFxL2vhdeVbrJSvkMuUkvoAcwXy1dyHtUMP78ZL/0rM3
 NNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uxMDwMTpaikMlU+GoHBppWJvZIgmfGEWKHRy2R9Ueq8=;
 b=cWwJtONpjuSqWebaHfM40k8FPji6mtcJr/rGDQ5KaKIoyVk/7OqD552/1HEagXh+UV
 Z6tciy7hGFzREfeLjE40CEe2/RZee/0Xeg+Y1ByBK/egqX2O5PQuup1nWpncrJV9uPgA
 wDHfiFM3lbxa9ibKEclApn5kwE4NS1xqXj+3IzUk0Xd+q9iRrAmagVROw7NccvCyie+N
 bGxiTMrZ3acURcry3a88nCbx/MUSIrgLXqNWyAT5dX9NRsETJuIgzVy8VcD4CWPKj4X2
 gP/8ea2lm8HHnoROdGtaeXqR8X3dg4KLpNf3qgiaPN7EyVCQ94GBIX6YsSkA3XkxQbxw
 TG8g==
X-Gm-Message-State: AOAM5304b9Pb53VOvz0kyRJxj9ydmfjJI0R6J9vYje4of5B53sbAC/i3
 FiMKEj042VSUhA0d0cE3Gud3lMop9ASHNA==
X-Google-Smtp-Source: ABdhPJx8nApr+XvkXmbBJ/opaTzqBDDU5ibyMgNMAAexr+JLKzFypburPn/KLkQdaRnnYaWHsL9h/A==
X-Received: by 2002:a17:90a:d911:: with SMTP id
 c17mr5297578pjv.98.1615413012371; 
 Wed, 10 Mar 2021 13:50:12 -0800 (PST)
Received: from omlet.lan (jfdmzpr06-ext.jf.intel.com. [134.134.137.75])
 by smtp.gmail.com with ESMTPSA id t6sm410933pgp.57.2021.03.10.13.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 13:50:11 -0800 (PST)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] i915: Drop relocation support on all new hardware (v3)
Date: Wed, 10 Mar 2021 15:50:07 -0600
Message-Id: <20210310215007.782649-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310212606.766121-1-jason@jlekstrand.net>
References: <20210310212606.766121-1-jason@jlekstrand.net>
MIME-Version: 1.0
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
Cc: Dave Airlie <airlied@redhat.com>, Jason Ekstrand <jason@jlekstrand.net>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Vulkan driver in Mesa for Intel hardware never uses relocations if
it's running on a version of i915 that supports at least softpin which
all versions of i915 supporting Gen12 do.  On the OpenGL side, Gen12+ is
only supported by iris which never uses relocations.  The older i965
driver in Mesa does use relocations but it only supports Intel hardware
through Gen11 and has been deprecated for all hardware Gen9+.  The
compute driver also never uses relocations.  This only leaves the media
driver which is supposed to be switching to softpin going forward.
Making softpin a requirement for all future hardware seems reasonable.

Rejecting relocations starting with Gen12 has the benefit that we don't
have to bother supporting it on platforms with local memory.  Given how
much CPU touching of memory is required for relocations, not having to
do so on platforms where not all memory is directly CPU-accessible
carries significant advantages.

v2 (Jason Ekstrand):
 - Allow TGL-LP platforms as they've already shipped

v3 (Jason Ekstrand):
 - WARN_ON platforms with LMEM support in case the check is wrong

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 99772f37bff60..b02dbd16bfa03 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1764,7 +1764,8 @@ eb_relocate_vma_slow(struct i915_execbuffer *eb, struct eb_vma *ev)
 	return err;
 }
 
-static int check_relocations(const struct drm_i915_gem_exec_object2 *entry)
+static int check_relocations(const struct i915_execbuffer *eb,
+			     const struct drm_i915_gem_exec_object2 *entry)
 {
 	const char __user *addr, *end;
 	unsigned long size;
@@ -1774,6 +1775,14 @@ static int check_relocations(const struct drm_i915_gem_exec_object2 *entry)
 	if (size == 0)
 		return 0;
 
+	/* Relocations are disallowed for all platforms after TGL-LP */
+	if (INTEL_GEN(eb->i915) >= 12 && !IS_TIGERLAKE(eb->i915))
+		return -EINVAL;
+
+	/* All discrete memory platforms are Gen12 or above */
+	if (WARN_ON(HAS_LMEM(eb->i915)))
+		return -EINVAL;
+
 	if (size > N_RELOC(ULONG_MAX))
 		return -EINVAL;
 
@@ -1807,7 +1816,7 @@ static int eb_copy_relocations(const struct i915_execbuffer *eb)
 		if (nreloc == 0)
 			continue;
 
-		err = check_relocations(&eb->exec[i]);
+		err = check_relocations(eb, &eb->exec[i]);
 		if (err)
 			goto err;
 
@@ -1880,7 +1889,7 @@ static int eb_prefault_relocations(const struct i915_execbuffer *eb)
 	for (i = 0; i < count; i++) {
 		int err;
 
-		err = check_relocations(&eb->exec[i]);
+		err = check_relocations(eb, &eb->exec[i]);
 		if (err)
 			return err;
 	}
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
