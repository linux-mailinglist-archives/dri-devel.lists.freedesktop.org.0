Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 777983933DD
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 18:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8C66F458;
	Thu, 27 May 2021 16:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A3A6F458
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 16:27:28 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id h12so209672plf.11
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 09:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lwY80Qh/Ku4n62+xqya4H7AsrnCd0VgJ+cA8sF+L/E4=;
 b=bSS+CVQD6mVayBTHtVZ+0q12CsaHkU7sgbl9lRWBaHz0OskVuXW6dX+DQZ0JJU1bxQ
 VLFDLVMbtAG7Q3j1+BprwYupOLQiGdXjY/im8pELMTFejxUcK/gwTCwb9RymeTAXFIgv
 3UfQRfnGjKZSSD47kTLgKzKITg2/Bp17k8WQ0OfqcEeMYrUU2vH5XMqImGSBNH+TL3xB
 s130O0u/hOwWJByY3mDjZ/vmEUghzKIgoqGpgjuqnwT//mZy3tXjOFSvRH9jHju407p8
 zFC87ahg7rX7EX2zE6tSjI9lgarNlVVBxeGB3vVw2OhFsOu93uxnwD1SsqA1xWy0HKf0
 J1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lwY80Qh/Ku4n62+xqya4H7AsrnCd0VgJ+cA8sF+L/E4=;
 b=uBg9owVvqMoNMc8RsNpqAvkJHi9e7Jp9h1HzXHY3kPYJqLGkJBVeWElgdOKLibIlst
 GJyH2V1MMBngGSJvIhNpCfkqQE3bRihjoRwOdCG7X9v6XmhKaJ/B+5p+ybxaZIXJrk0i
 0kv1AKdrbPFx7LF21MlKIvz8XNzyV+kvrWk4ZfHynk19Lmi28WkPx9c3dVB62Lf2gcA1
 ox8Ur9rhWZq8FPysdrtgW+TUOicUJl6aoSmB5ymwE86HbWTwM2uCwWb3t2x77Z9iHUWz
 6XPE5oPAqunLWW10OBJegFIB0uhUmMowWuE/yGKSwnDFwlK52V0vPZoq/hVIPcSsuX30
 i28A==
X-Gm-Message-State: AOAM533g73nzNa4NBpufneHcXN6eL34egm/ikdY1mhJRWGJhGVGJLaWi
 B0+Gj8DjjTHpXZth3h5f7IJu5P6WwXKmUA==
X-Google-Smtp-Source: ABdhPJxJqHpH6Y5624J/wMObfrh9VirAK7IK/Hm5q6U5G0aj7LIHJLFNSlQ5Muc/G4+va+MNZGz8mQ==
X-Received: by 2002:a17:90a:ac04:: with SMTP id
 o4mr4489740pjq.114.1622132847726; 
 Thu, 27 May 2021 09:27:27 -0700 (PDT)
Received: from omlet.com ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id h9sm2298711pja.42.2021.05.27.09.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 09:27:27 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 23/29] drm/i915/gt: Drop i915_address_space::file (v2)
Date: Thu, 27 May 2021 11:26:44 -0500
Message-Id: <20210527162650.1182544-24-jason@jlekstrand.net>
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
index 76662175e6980..8288af0d33245 100644
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
index ca00b45827b74..cbd89fded6f2a 100644
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

