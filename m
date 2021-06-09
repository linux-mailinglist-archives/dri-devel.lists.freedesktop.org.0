Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 985BD3A0B82
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 06:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183186ECCC;
	Wed,  9 Jun 2021 04:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4886ECCA
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 04:36:53 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 mp5-20020a17090b1905b029016dd057935fso638808pjb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 21:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mfTUnnmzC+4kX4IlEDIBAe5S8rQxYLu6F9Reh4TlnaE=;
 b=y2AitrvLVaDG1t9rHHgkh962NUskvKOHsDbWk+Llf+gflUtyAxfrsxEG3NIPbn0MUd
 dBbEgYUHtYexe3yWLj1914OLLWvNAAQ1YZADuSPECY1U2DceO5lRC/im+/lD1HZg0vQj
 iWP2SO08Lx/mNTYXQp770RoU42OR+h1LfUBX8Lp31sjC1LvDBVRt9WCYsIWHbfnIJiVO
 clBLjx7Bsc7Q5V2AoYZaIHdVBtjrpPZE5kBhnthIrrprtehKlQsQ3BFzUljHBXH60Lar
 LTqg06Ic7wEB+8R40E53PSd7AuqM+tUsL7k09evhfW2F3JnsB/iJR0T8COsPCodxtcyw
 vwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mfTUnnmzC+4kX4IlEDIBAe5S8rQxYLu6F9Reh4TlnaE=;
 b=VwDwxIB2KHamMbnn+JlHEmdL9LTiRijCV1L8P9GBVxnan46jbpr9HeuTWqbiD6S+hp
 3XkT/xPq3oM9tdf0m0j2DRW2zIitEA2Reti66zch1/GxKZB7XNknmbbPDkSsEoNuKwoe
 8sw9FcpVTsA2jPQ8otjXWIZ3nKBc2MLfGvUMbpcfQdYFSZlQpSJvs9n9owxmjsjSic1Z
 KFIiF/h30pkPGK2F9U1srpDZnS+2JUlv6ISJTLZ0VSMmSXay33jrQWcp2ogW7AcA54Pe
 oP9bVyOdtxwd8gK3h3OErHAjrR59GewjgHtYFfv8WLXVBLoXZbvB5JP73NcnHM0/pzXF
 4HNQ==
X-Gm-Message-State: AOAM531ov2wCAQIpCrBlPZKTBNQngzKfgrxrzhgebtltCenzW9ROSwpU
 w1dTqa2TjP5D9iZXBGCTB3omjOQVVVzntw==
X-Google-Smtp-Source: ABdhPJyZS/BkZTtL/HuOYrqrAMfl3bmrSG13wqZww6zkIIzWAIgpd/54JHXdIf2QzCxp9HQdTR4hGg==
X-Received: by 2002:a17:90b:4d89:: with SMTP id
 oj9mr29769827pjb.9.1623213412962; 
 Tue, 08 Jun 2021 21:36:52 -0700 (PDT)
Received: from omlet.com (jfdmzpr06-ext.jf.intel.com. [134.134.137.75])
 by smtp.gmail.com with ESMTPSA id t5sm11991612pfe.116.2021.06.08.21.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 21:36:52 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 19/31] drm/i915: Add an i915_gem_vm_lookup helper
Date: Tue,  8 Jun 2021 23:36:01 -0500
Message-Id: <20210609043613.102962-20-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609043613.102962-1-jason@jlekstrand.net>
References: <20210609043613.102962-1-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the VM equivalent of i915_gem_context_lookup.  It's only used
once in this patch but future patches will need to duplicate this lookup
code so it's better to have it in a helper.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c |  6 +-----
 drivers/gpu/drm/i915/i915_drv.h             | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 972d1d3f9a17e..8df284dcfcf3a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1351,11 +1351,7 @@ static int set_ppgtt(struct drm_i915_file_private *file_priv,
 	if (upper_32_bits(args->value))
 		return -ENOENT;
 
-	rcu_read_lock();
-	vm = xa_load(&file_priv->vm_xa, args->value);
-	if (vm && !kref_get_unless_zero(&vm->ref))
-		vm = NULL;
-	rcu_read_unlock();
+	vm = i915_gem_vm_lookup(file_priv, args->value);
 	if (!vm)
 		return -ENOENT;
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index fed14ffc52437..b191946229746 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1864,6 +1864,20 @@ i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id)
 	return ctx;
 }
 
+static inline struct i915_address_space *
+i915_gem_vm_lookup(struct drm_i915_file_private *file_priv, u32 id)
+{
+	struct i915_address_space *vm;
+
+	rcu_read_lock();
+	vm = xa_load(&file_priv->vm_xa, id);
+	if (vm && !kref_get_unless_zero(&vm->ref))
+		vm = NULL;
+	rcu_read_unlock();
+
+	return vm;
+}
+
 /* i915_gem_evict.c */
 int __must_check i915_gem_evict_something(struct i915_address_space *vm,
 					  u64 min_size, u64 alignment,
-- 
2.31.1

