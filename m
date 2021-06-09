Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DD93A0B8F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 06:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB4C6ECD9;
	Wed,  9 Jun 2021 04:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA97D6ECC5
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 04:37:00 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id i34so11956409pgl.9
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 21:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lsc56SzoOEd/BCSfLfK8ytkSRwjAVkdeXZAyirihj3g=;
 b=GT7izzUcWkvAItIKv4EUCXCs6JgQNU0aWGb+v/70qg+Rc2u9iK1SxnFK1oaXM1uOKl
 9ufpYKDwUap3s70m2XM+X3GWsBM/xQw8zg9Dta9lzfJKUYrExC8tu4wuYGykuude8BMj
 jn9DREJtR9heIURNOkU1hTqqWKKlfSfPeKh2noOyztZPmQa9bvHuAfr2lc6sLUOwOmVS
 vDmnNehK4fKjwci7H5mppflFRBu7m3dnoRZ0iZsmpYBljNixlKUqPpdrnqT8ilvZrjW+
 KxKWo5xNRfCeHtrNShzBvOcfvEdJqWn6fbBXGmiJk5UMdpPkAyffcAuObRgBq0aaCU6u
 QRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lsc56SzoOEd/BCSfLfK8ytkSRwjAVkdeXZAyirihj3g=;
 b=lT/nYIbtANYHMRc+OfP9lKiu7GYYppRu+dUlpjai5Kmgi2+T6CNmrFuNzK8EQAzbLg
 xVlK1ZzuD5wb/Qm7k6PjH+IbACk9m4T13UdlDzlvk+wJtafpfmvZPpI6Igk+a1EPGZK0
 UzvcHC1JAyCV/4G4zXvBfJ+JIXGIO89Uo1a1Z4xnPBKkhGNtBmMMWrq/wTLHaBnjDh2y
 3gotq4kubED0QRpRYmyR1vkheR2DRvEuayxQD4QHvx6TQUFp/CXizruo2BE1D2aSD1Jt
 0E2Z23tleGFHNiCWRJVkLLLobAfT1SkwiLLucrSjlQVETI15LMsHAAmacitYmsGX5PWC
 A5rA==
X-Gm-Message-State: AOAM532AEgfeDE7Sx6mmvD6PCVcSLbwLoH9mYwrLZKgugY6NlGD3zMdb
 AmshVfjqVVxp0s+jLKtM4SmnaKqcMjTwZA==
X-Google-Smtp-Source: ABdhPJwWtmvCzSFX6KYRMj9xLtYRrzv9i2uJTjyUdq/SsH9VQ0pMmJ30/vNh1RQDrROiD6EpbJX99Q==
X-Received: by 2002:a62:d7:0:b029:2ec:d7cf:583b with SMTP id
 206-20020a6200d70000b02902ecd7cf583bmr3437180pfa.73.1623213420102; 
 Tue, 08 Jun 2021 21:37:00 -0700 (PDT)
Received: from omlet.com (jfdmzpr06-ext.jf.intel.com. [134.134.137.75])
 by smtp.gmail.com with ESMTPSA id t5sm11991612pfe.116.2021.06.08.21.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 21:36:59 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 23/31] drm/i915/gt: Drop i915_address_space::file (v2)
Date: Tue,  8 Jun 2021 23:36:05 -0500
Message-Id: <20210609043613.102962-24-jason@jlekstrand.net>
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

There's a big comment saying how useful it is but no one is using this
for anything anymore.

It was added in 2bfa996e031b ("drm/i915: Store owning file on the
i915_address_space") and used for debugfs at the time as well as telling
the difference between the global GTT and a PPGTT.  In f6e8aa387171
("drm/i915: Report the number of closed vma held by each context in
debugfs") we removed one use of it by switching to a context walk and
comparing with the VM in the context.  Finally, VM stats for debugfs
were entirely nuked in db80a1294c23 ("drm/i915/gem: Remove per-client
stats from debugfs/i915_gem_objects")

v2 (Daniel Vetter):
 - Delete a struct drm_i915_file_private pre-declaration
 - Add a comment to the commit message about history

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c |  9 ---------
 drivers/gpu/drm/i915/gt/intel_gtt.h         | 11 -----------
 drivers/gpu/drm/i915/selftests/mock_gtt.c   |  1 -
 3 files changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 7045e3afa7113..5a1402544d48d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1453,17 +1453,10 @@ static int gem_context_register(struct i915_gem_context *ctx,
 				u32 *id)
 {
 	struct drm_i915_private *i915 = ctx->i915;
-	struct i915_address_space *vm;
 	int ret;
 
 	ctx->file_priv = fpriv;
 
-	mutex_lock(&ctx->mutex);
-	vm = i915_gem_context_vm(ctx);
-	if (vm)
-		WRITE_ONCE(vm->file, fpriv); /* XXX */
-	mutex_unlock(&ctx->mutex);
-
 	ctx->pid = get_task_pid(current, PIDTYPE_PID);
 	snprintf(ctx->name, sizeof(ctx->name), "%s[%d]",
 		 current->comm, pid_nr(ctx->pid));
@@ -1562,8 +1555,6 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (IS_ERR(ppgtt))
 		return PTR_ERR(ppgtt);
 
-	ppgtt->vm.file = file_priv;
-
 	if (args->extensions) {
 		err = i915_user_extensions(u64_to_user_ptr(args->extensions),
 					   NULL, 0,
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index edea95b97c36e..474eae483ab0e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -140,7 +140,6 @@ typedef u64 gen8_pte_t;
 
 enum i915_cache_level;
 
-struct drm_i915_file_private;
 struct drm_i915_gem_object;
 struct i915_fence_reg;
 struct i915_vma;
@@ -220,16 +219,6 @@ struct i915_address_space {
 	struct intel_gt *gt;
 	struct drm_i915_private *i915;
 	struct device *dma;
-	/*
-	 * Every address space belongs to a struct file - except for the global
-	 * GTT that is owned by the driver (and so @file is set to NULL). In
-	 * principle, no information should leak from one context to another
-	 * (or between files/processes etc) unless explicitly shared by the
-	 * owner. Tracking the owner is important in order to free up per-file
-	 * objects along with the file, to aide resource tracking, and to
-	 * assign blame.
-	 */
-	struct drm_i915_file_private *file;
 	u64 total;		/* size addr space maps (ex. 2GB for ggtt) */
 	u64 reserved;		/* size addr space reserved */
 
diff --git a/drivers/gpu/drm/i915/selftests/mock_gtt.c b/drivers/gpu/drm/i915/selftests/mock_gtt.c
index 5c7ae40bba634..cc047ec594f93 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gtt.c
@@ -73,7 +73,6 @@ struct i915_ppgtt *mock_ppgtt(struct drm_i915_private *i915, const char *name)
 	ppgtt->vm.gt = &i915->gt;
 	ppgtt->vm.i915 = i915;
 	ppgtt->vm.total = round_down(U64_MAX, PAGE_SIZE);
-	ppgtt->vm.file = ERR_PTR(-ENODEV);
 	ppgtt->vm.dma = i915->drm.dev;
 
 	i915_address_space_init(&ppgtt->vm, VM_CLASS_PPGTT);
-- 
2.31.1

