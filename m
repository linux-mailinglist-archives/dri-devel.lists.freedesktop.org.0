Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E063A1C30
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 19:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDBD6EAD5;
	Wed,  9 Jun 2021 17:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658276EAAD
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 17:44:56 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 o17-20020a17090a9f91b029015cef5b3c50so1873126pjp.4
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 10:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w4afPRq0pG7ofjrZ6pAHNiPrcBns9byCh7t0sCfFpp4=;
 b=JXLx45FmPSn45ewzSJeSCtBelau1WHnPtZuwO5qqDg/2tjX7I/X8cokZOSJDMAikHa
 JXrF4C2ZlDy64wQDQJ7F830NNSu7d+psl5rgOm75hltGJ/TahcbyYeajvtODnGYE7oUL
 +Bo41k5yKMuzUMGiQ9oiPbj2kB+0HYrSNx4QKVqCdudpYliKzE/glJJx+IV5j83Gmyvh
 tFgtqvXmcvHlGF+jpqh2v8iZnRYu3ZgR7o1HoJJZ4hJzrTh1B7K2fExCU43yDvMfAMkC
 t0Jz76a400g3DN4EMvaJ2nLWE8hl+2ln2IsOtPSyYbG9xcqxCW/MAZi7H3g0cI/ZXa1b
 ueZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w4afPRq0pG7ofjrZ6pAHNiPrcBns9byCh7t0sCfFpp4=;
 b=E2520wQ5MEZfNr5nnE+YgDJUawZeqWfelBTTS1SBjhM3jMG1xd01GEj+8VLJUqT081
 NCQfqyvSVM31Ip6YujGwI2Zta2XVUeXp2Qvn4wYQYgOfq6D+TRL7J6T8fMcorf+uFwCm
 U97whSnYKoF/Jd+/58zyv/JNh/1piLupUngkh1yOwmnghFsaJpkTmCEBOXDSVqTcvvEF
 5z/RKv/dhJZ+48zdjXBIFBSaXgCE1hHBLZt7OavHxc+h9GmCCIW3p95k0a7bNDDg4agX
 5nKh0PsA8kL4scuhMAkD1FPJ5GRQp31j33MfEdV1dKBPpS9a2JjZh9NExnoLoBRQSNf2
 TD8A==
X-Gm-Message-State: AOAM532sPRUONq+Ybec1bWoE859IILC8yWqQXZM77ixivohJerZms8vF
 fOGMrEkiGXu7S6+dCfuXXmhIu4s46weH1Q==
X-Google-Smtp-Source: ABdhPJyV0GwJRc3oAUYrw/Y5MceQR9NSVPtHbk2AnvSJuQXU/TASwDPP0yZM4kWuMOSsYgBd7Os7vQ==
X-Received: by 2002:a17:902:d3c3:b029:101:af83:cb1f with SMTP id
 w3-20020a170902d3c3b0290101af83cb1fmr840413plb.80.1623260695676; 
 Wed, 09 Jun 2021 10:44:55 -0700 (PDT)
Received: from omlet.lan (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id b10sm208619pfi.122.2021.06.09.10.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 10:44:55 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 19/31] drm/i915: Add an i915_gem_vm_lookup helper
Date: Wed,  9 Jun 2021 12:44:06 -0500
Message-Id: <20210609174418.249585-20-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609174418.249585-1-jason@jlekstrand.net>
References: <20210609174418.249585-1-jason@jlekstrand.net>
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
index e62482477c771..8e7c0e3f070ed 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1352,11 +1352,7 @@ static int set_ppgtt(struct drm_i915_file_private *file_priv,
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

