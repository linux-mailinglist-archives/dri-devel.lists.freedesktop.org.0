Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D173933D5
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 18:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B85E6F457;
	Thu, 27 May 2021 16:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC946F447
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 16:27:22 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 o17-20020a17090a9f91b029015cef5b3c50so2690354pjp.4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 09:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EPrV16RaPmALH4oatSSI5SAl4kh8PAG4UQRi2PA7exU=;
 b=ceK0QtC+UVwJ/ljEpdTvt1h1L92LWD+aFLzgPzv2/YQKyatbWZjqCoC4LWLJdEtGxS
 Mt4dVEEEFWqn1CGLMwri0N7jskPw2XQQcjFzi3PwvOKMCyWCwYDmxGRPC1xG62fNKECB
 tfgvwtq0bp3dj/GsUJiUIOm4C6a7tlFbFuB+ETgG+wk3P3pruyhhUKedQ4Xb6ODXoidi
 BwkjAMkQbLtcGQ+oBJo0ip9pofvP4yi3XI8msP9Gnx3/dQDSHGbdHwggJcZGH523DaGn
 j7g8YA4a++f/2zkzdp28tHakqN9+HjM5V/Iin0t7mEdTKYNAGZoRhlf5ImkVKUsU17ga
 KdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EPrV16RaPmALH4oatSSI5SAl4kh8PAG4UQRi2PA7exU=;
 b=X0e0XTVr/zLr/1QJCPQfzExGz/DHwJlHUM0ERSKm3XFL/g5WwUTQdIBTEiO1PpRS5v
 31KeyM9Uamzfr4l6SH1xl0l50FJ2nzGVWn02KTRiZF41g8KwyKN1kIFGEcE60FaCAbor
 Svr6VeKAlhpUdEcRm9VhcD2AWU1TrenuvX1sa8YOmxWGHDBXurB6QTQDhjPjlzVv+74v
 Cv4mBulUY3yVT6gmpalch7i0+5MPTI3s8PdegKwpTanXOaYaNO9cEsdu4Rw4HKd/psjm
 K4x29Hv8kvMpYbJYCw+vhEdkKXATHM4S9HwPS687e20BkSt8pq32QcJaN7AZb/PPUr0T
 hk+A==
X-Gm-Message-State: AOAM533O3xk134F6V0Z9V9WqHpmpn8mdvI9MyJCMdZxMt+GDo930V7GM
 cslwFpSnu8FtAsZ9JbvTDCQwLOlPky9p/Q==
X-Google-Smtp-Source: ABdhPJxHZwk49PfkeHb5QZjFhkX5zXmH+dj5exzymzr+eCuggCKBw/S+JsJlI/L2eSh1SzFzxc/LvQ==
X-Received: by 2002:a17:902:c94a:b029:f4:ad23:7e59 with SMTP id
 i10-20020a170902c94ab02900f4ad237e59mr3793882pla.73.1622132842075; 
 Thu, 27 May 2021 09:27:22 -0700 (PDT)
Received: from omlet.com ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id h9sm2298711pja.42.2021.05.27.09.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 09:27:21 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 19/29] drm/i915: Add an i915_gem_vm_lookup helper
Date: Thu, 27 May 2021 11:26:40 -0500
Message-Id: <20210527162650.1182544-20-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210527162650.1182544-1-jason@jlekstrand.net>
References: <20210527162650.1182544-1-jason@jlekstrand.net>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the VM equivalent of i915_gem_context_lookup.  It's only used
once in this patch but future patches will need to duplicate this lookup
code so it's better to have it in a helper.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c |  6 +-----
 drivers/gpu/drm/i915/i915_drv.h             | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index d247fb223aac7..12a148ba421b6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1346,11 +1346,7 @@ static int set_ppgtt(struct drm_i915_file_private *file_priv,
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
index 48316d273af66..fee2342219da1 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1871,6 +1871,20 @@ i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id)
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

