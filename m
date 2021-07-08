Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 617CA3C1673
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 17:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F426E914;
	Thu,  8 Jul 2021 15:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31AD26E910
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 15:49:02 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id l26so8307027oic.7
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 08:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SEuf6jhm/Mly3x9eqh/fh6ExA0Yao3LBN0Ua318o2gc=;
 b=QvfvlTB09azVDdYubCyNdT6hWvNQhcCHfSgAFMNoxs8tiFgCJVVyj8FlpmGtXfAc7V
 SnKtls3xG3s9QfgXDvNsKgczDmnrTJoivJjF9lXT9zhN2X3NB4jiDfDt0PTknMjPPPVB
 PV7iw3bXU9eiXZy6MtG3tQu+EfqwsqWvCaf2F2RTYm7wk9ak7g3T6d4M266GX9KyGAZL
 g9e8iuXT3WqS5+jUzyGMQ7c4qeXAyaB1kO7+uqYWxzR4ReIr/4dzVszAfWIF0M6XjLZQ
 qkrVuFuEIkjq3SKqSEiHODywx7GHo1fWK4/rFMopVj1Yp7nhstpk6f1ba6+RawSkREZl
 /sjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SEuf6jhm/Mly3x9eqh/fh6ExA0Yao3LBN0Ua318o2gc=;
 b=m7WRUk4+IgYG9tjq791ZFEo55K3nWag7+ipJ975Hx7wcgBfHlkFWOuepXKc6rf0x4i
 +mTkc832NVWriY5GAAJSONEqviX4g13AVVwgPmJqFPtl5zewvpXY+BttIjEUH9Va0tNQ
 8t68sbXS5X98UJqo0NUZ/kmfh73XWrwKUY6HEvccDEj/Ib32nfFKXkLBlBb2i+fAI763
 nYzPKWcAdgVYECyE0w4JyZQsEDC9gjZ5WjUWnHyVsetOS+S8I7sZOCPvi9KIzrYA2OS9
 WwrnWTcwiM2PME56Y1Chg6ySqmGhcnMsj2oJ4oTk8tqDC+/PLglr36a1yrFVcmljCc2v
 XL5w==
X-Gm-Message-State: AOAM531fe+ZwMdha1gl9nvVFfQ3Q4EQDd0tSjMgWESNuTKePxcwqdizD
 aCDKp1jXnOQDLs/2tbmKkUMX4A==
X-Google-Smtp-Source: ABdhPJwvNnWk1L2wTRqg6E0ziUK2bHr0CYeIIu7q74rRFYeb3L7y/n7cYEP1dm59I+1oZvIuIV6ldg==
X-Received: by 2002:a54:4f83:: with SMTP id g3mr4164668oiy.46.1625759341390;
 Thu, 08 Jul 2021 08:49:01 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id d20sm548356otq.62.2021.07.08.08.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:49:00 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 19/30] drm/i915: Add an i915_gem_vm_lookup helper
Date: Thu,  8 Jul 2021 10:48:24 -0500
Message-Id: <20210708154835.528166-20-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708154835.528166-1-jason@jlekstrand.net>
References: <20210708154835.528166-1-jason@jlekstrand.net>
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
index 206721dccd24e..3c59d1e4080c4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1311,11 +1311,7 @@ static int set_ppgtt(struct drm_i915_file_private *file_priv,
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
index ae45ea7b26997..8c1994c16b920 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1867,6 +1867,20 @@ i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id)
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

