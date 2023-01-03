Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A022C65CA90
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 00:50:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A46B10E41A;
	Tue,  3 Jan 2023 23:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDF310E415;
 Tue,  3 Jan 2023 23:50:07 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id b2so34289531pld.7;
 Tue, 03 Jan 2023 15:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zQnU0ECVT+dQJ7sR8SG4+GexJhlU25T9FqYe8rjLTKY=;
 b=e73Thfnoz4SFEpjmH9KHhQUwNlNGkZNP9KeQqQk9FqpYgcFXDcpgCTa/VjhO9lcDys
 UW7szsViVc5SLrUAMqx7eDU0kyRcaq8LcQfcc5ikJOhBkfyla1zipbs29GDyAnIvSBBS
 KP+fnov4T1MNTpUkSsQoH6MwJ2zb8f2WdtTK7RnjEk6De0ODYH6/SxUz9NYsiNyUDNtY
 N1JCne/SWolLkyRYckgFOHfEBVENlDdmuahFAxnE0LT3LapU4bBxtfOYiOYHJ8SQzDWy
 sffcALiAJyNFdxkGAT6gCNLsXb968lzVQ9UqosNCO9QkpzdFiGx9zqCRkdyrvsVTy2Qu
 dEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zQnU0ECVT+dQJ7sR8SG4+GexJhlU25T9FqYe8rjLTKY=;
 b=m53RLVh+kWHEWkUbOp973OVPqRpl3eqsA9iDosh1BpeQHM91fKCo5x91soPAm2P8xk
 GV6MBKtCyduvwtuK1dlmHdz0cqiHCC1Vxcq+I0RadSOcT3ZFStcbjlcLkuyI1NK9eMR8
 dCPK8pnyx9hb4VSdcesY/OSRd+iOSwZYxpWhEp612KP+3B9Kxz5PBVgct+frXUhhIFkj
 dyYyAUSqPA1NSQyYEfg5Z1Nzt2mf97mkOh6DLf/sr+2Js9N2T7Qq62UR9oReBCrBbRre
 viAheH7WwSeg7CP5JEOE4JsOBk5KwmN3/O/OajQYp6yUR1cZQTmdTtchlk1H3KsthbRE
 0tbg==
X-Gm-Message-State: AFqh2kopzVud54n5Hhbcwso7NuDPzyV8fGilqO8sC+v8tv+x6ZAe4XPz
 jsZpzFj11OKAO9i34NsP+47sAvksxT4=
X-Google-Smtp-Source: AMrXdXsy6k/E7f9XcAebsHie9PSjmY4Ie44xw2EYsZyt5n0Sr2WEKBmcHkFM+UeNsmFffIA/SalRgQ==
X-Received: by 2002:a17:903:186:b0:188:d2b3:26c1 with SMTP id
 z6-20020a170903018600b00188d2b326c1mr63172199plg.10.1672789806528; 
 Tue, 03 Jan 2023 15:50:06 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a170902e80c00b0018968d1c6f3sm22889770plg.59.2023.01.03.15.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 15:50:06 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Fix potential context UAFs
Date: Tue,  3 Jan 2023 15:49:46 -0800
Message-Id: <20230103234948.1218393-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "open list:INTEL DRM DRIVERS" <intel-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, katrinzhou <katrinzhou@tencent.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

gem_context_register() makes the context visible to userspace, and which
point a separate thread can trigger the I915_GEM_CONTEXT_DESTROY ioctl.
So we need to ensure that nothing uses the ctx ptr after this.  And we
need to ensure that adding the ctx to the xarray is the *last* thing
that gem_context_register() does with the ctx pointer.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 24 +++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 7f2831efc798..6250de9b9196 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1688,6 +1688,10 @@ void i915_gem_init__contexts(struct drm_i915_private *i915)
 	init_contexts(&i915->gem.contexts);
 }
 
+/*
+ * Note that this implicitly consumes the ctx reference, by placing
+ * the ctx in the context_xa.
+ */
 static void gem_context_register(struct i915_gem_context *ctx,
 				 struct drm_i915_file_private *fpriv,
 				 u32 id)
@@ -1703,10 +1707,6 @@ static void gem_context_register(struct i915_gem_context *ctx,
 	snprintf(ctx->name, sizeof(ctx->name), "%s[%d]",
 		 current->comm, pid_nr(ctx->pid));
 
-	/* And finally expose ourselves to userspace via the idr */
-	old = xa_store(&fpriv->context_xa, id, ctx, GFP_KERNEL);
-	WARN_ON(old);
-
 	spin_lock(&ctx->client->ctx_lock);
 	list_add_tail_rcu(&ctx->client_link, &ctx->client->ctx_list);
 	spin_unlock(&ctx->client->ctx_lock);
@@ -1714,6 +1714,10 @@ static void gem_context_register(struct i915_gem_context *ctx,
 	spin_lock(&i915->gem.contexts.lock);
 	list_add_tail(&ctx->link, &i915->gem.contexts.list);
 	spin_unlock(&i915->gem.contexts.lock);
+
+	/* And finally expose ourselves to userspace via the idr */
+	old = xa_store(&fpriv->context_xa, id, ctx, GFP_KERNEL);
+	WARN_ON(old);
 }
 
 int i915_gem_context_open(struct drm_i915_private *i915,
@@ -2199,14 +2203,22 @@ finalize_create_context_locked(struct drm_i915_file_private *file_priv,
 	if (IS_ERR(ctx))
 		return ctx;
 
+	/*
+	 * One for the xarray and one for the caller.  We need to grab
+	 * the reference *prior* to making the ctx visble to userspace
+	 * in gem_context_register(), as at any point after that
+	 * userspace can try to race us with another thread destroying
+	 * the context under our feet.
+	 */
+	i915_gem_context_get(ctx);
+
 	gem_context_register(ctx, file_priv, id);
 
 	old = xa_erase(&file_priv->proto_context_xa, id);
 	GEM_BUG_ON(old != pc);
 	proto_context_close(file_priv->dev_priv, pc);
 
-	/* One for the xarray and one for the caller */
-	return i915_gem_context_get(ctx);
+	return ctx;
 }
 
 struct i915_gem_context *
-- 
2.38.1

