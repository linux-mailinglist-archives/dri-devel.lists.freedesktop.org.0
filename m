Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A29F83933DE
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 18:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A666F45B;
	Thu, 27 May 2021 16:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91626F45B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 16:27:29 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id d78so964531pfd.10
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 09:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z+kupztDt55FIfQBcZiIwj4xobYiGoYLjThlQD2+X1s=;
 b=JDqso+5wNKwere+c+22OT1EHsP8J3v1gtJJVA4gc5dRKbb8hcClbOFwaxLaUXOxY4i
 7HFDUwSqW3x2g6OvChBvGsBNvg1m0/jD5Xsk9cwUJdThCi1h0USGd0p6TktRsrTPaHdS
 XhRCkiIznE9VQrLMFL63UuGAnFrPKKZ94LWXCYIVpWqzpIgk1s63QbRwKwNPTT7XRnz/
 W8a1qkha3xrd1jFUDOYMabfRC0djQZ07pH8OmEOMW6lKkubLGNiECk+johP/abb4MUMg
 KY1JTcUgBioEradJlKxL8BMpcO26LWaM3uZgtsbjIOGZE3aAe60L9pdAnkMhYA5x1SGc
 6upw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z+kupztDt55FIfQBcZiIwj4xobYiGoYLjThlQD2+X1s=;
 b=DGKHUNZJ1lxMqCTbiE7iNEk4OA6KVk3mxfqbYtsZEX33gL/qw+MbbUfVa3Kp0KyeJ/
 ra3Aq6A187ursyvw3g4Vl/DbiOnEHJkcyEg+d2tY+ZhOH5FFYkcNgh1ALNvVhLCFJhHq
 X8B9YpMoBPq/lYpzT1A84N7ER6Yq0EVRPSczEit0OL03anKoc63DIS41DBquXkHBq2Jz
 1GDPe1ta68zgxS/QZ+4vOc+4To6LRp9EK8cDO1+7Jvy4ybJxCUGVLYi3sZoI3NrafNhS
 8EkA0rmxuehocJ6cmZbef22WKVDrAeFxw9nz/U1tTK6aVT1P3OmtbXAdcF1NBieFCeys
 KAMA==
X-Gm-Message-State: AOAM533y/6FCO1iu/zZH8eOISMs6VZvZCeZaimsQX+QhjiimU7uBrgFW
 lFVLpuoNCW4Cq/rQE0t99GgOLsiwi3hcqQ==
X-Google-Smtp-Source: ABdhPJzdf9lnTv44CLqzxVUbEuU53mMW1NCS0AurEXint2bviFacNijQl2Aqvg6flLH7qGTF/0mUww==
X-Received: by 2002:a63:fe4b:: with SMTP id x11mr4472077pgj.263.1622132849164; 
 Thu, 27 May 2021 09:27:29 -0700 (PDT)
Received: from omlet.com ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id h9sm2298711pja.42.2021.05.27.09.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 09:27:28 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 24/29] drm/i915/gem: Delay context creation
Date: Thu, 27 May 2021 11:26:45 -0500
Message-Id: <20210527162650.1182544-25-jason@jlekstrand.net>
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

The current context uAPI allows for two methods of setting context
parameters: SET_CONTEXT_PARAM and CONTEXT_CREATE_EXT_SETPARAM.  The
former is allowed to be called at any time while the later happens as
part of GEM_CONTEXT_CREATE.  Currently, everything settable via one is
settable via the other.  While some params are fairly simple and setting
them on a live context is harmless such the context priority, others are
far trickier such as the VM or the set of engines.  In order to swap out
the VM, for instance, we have to delay until all current in-flight work
is complete, swap in the new VM, and then continue.  This leads to a
plethora of potential race conditions we'd really rather avoid.

In previous patches, we added a i915_gem_proto_context struct which is
capable of storing and tracking all such create parameters.  This commit
delays the creation of the actual context until after the client is done
configuring it with SET_CONTEXT_PARAM.  From the perspective of the
client, it has the same u32 context ID the whole time.  From the
perspective of i915, however, it's an i915_gem_proto_context right up
until the point where we attempt to do something which the proto-context
can't handle at which point the real context gets created.

This is accomplished via a little xarray dance.  When GEM_CONTEXT_CREATE
is called, we create a proto-context, reserve a slot in context_xa but
leave it NULL, the proto-context in the corresponding slot in
proto_context_xa.  Then, whenever we go to look up a context, we first
check context_xa.  If it's there, we return the i915_gem_context and
we're done.  If it's not, we look in proto_context_xa and, if we find it
there, we create the actual context and kill the proto-context.

In order for this dance to work properly, everything which ever touches
a proto-context is guarded by drm_i915_file_private::proto_context_lock,
including context creation.  Yes, this means context creation now takes
a giant global lock but it can't really be helped and that should never
be on any driver's fast-path anyway.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 211 ++++++++++++++----
 drivers/gpu/drm/i915/gem/i915_gem_context.h   |   3 +
 .../gpu/drm/i915/gem/i915_gem_context_types.h |  54 +++++
 .../gpu/drm/i915/gem/selftests/mock_context.c |   5 +-
 drivers/gpu/drm/i915/i915_drv.h               |  24 +-
 5 files changed, 239 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 8288af0d33245..f7c83730ee07f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -298,6 +298,42 @@ proto_context_create(struct drm_i915_private *i915, unsigned int flags)
 	return err;
 }
 
+static int proto_context_register_locked(struct drm_i915_file_private *fpriv,
+					 struct i915_gem_proto_context *pc,
+					 u32 *id)
+{
+	int ret;
+	void *old;
+
+	lockdep_assert_held(&fpriv->proto_context_lock);
+
+	ret = xa_alloc(&fpriv->context_xa, id, NULL, xa_limit_32b, GFP_KERNEL);
+	if (ret)
+		return ret;
+
+	old = xa_store(&fpriv->proto_context_xa, *id, pc, GFP_KERNEL);
+	if (xa_is_err(old)) {
+		xa_erase(&fpriv->context_xa, *id);
+		return xa_err(old);
+	}
+	GEM_BUG_ON(old);
+
+	return 0;
+}
+
+static int proto_context_register(struct drm_i915_file_private *fpriv,
+				  struct i915_gem_proto_context *pc,
+				  u32 *id)
+{
+	int ret;
+
+	mutex_lock(&fpriv->proto_context_lock);
+	ret = proto_context_register_locked(fpriv, pc, id);
+	mutex_unlock(&fpriv->proto_context_lock);
+
+	return ret;
+}
+
 static int set_proto_ctx_vm(struct drm_i915_file_private *fpriv,
 			    struct i915_gem_proto_context *pc,
 			    const struct drm_i915_gem_context_param *args)
@@ -1448,12 +1484,12 @@ void i915_gem_init__contexts(struct drm_i915_private *i915)
 	init_contexts(&i915->gem.contexts);
 }
 
-static int gem_context_register(struct i915_gem_context *ctx,
-				struct drm_i915_file_private *fpriv,
-				u32 *id)
+static void gem_context_register(struct i915_gem_context *ctx,
+				 struct drm_i915_file_private *fpriv,
+				 u32 id)
 {
 	struct drm_i915_private *i915 = ctx->i915;
-	int ret;
+	void *old;
 
 	ctx->file_priv = fpriv;
 
@@ -1462,19 +1498,12 @@ static int gem_context_register(struct i915_gem_context *ctx,
 		 current->comm, pid_nr(ctx->pid));
 
 	/* And finally expose ourselves to userspace via the idr */
-	ret = xa_alloc(&fpriv->context_xa, id, ctx, xa_limit_32b, GFP_KERNEL);
-	if (ret)
-		goto err_pid;
+	old = xa_store(&fpriv->context_xa, id, ctx, GFP_KERNEL);
+	GEM_BUG_ON(old);
 
 	spin_lock(&i915->gem.contexts.lock);
 	list_add_tail(&ctx->link, &i915->gem.contexts.list);
 	spin_unlock(&i915->gem.contexts.lock);
-
-	return 0;
-
-err_pid:
-	put_pid(fetch_and_zero(&ctx->pid));
-	return ret;
 }
 
 int i915_gem_context_open(struct drm_i915_private *i915,
@@ -1484,9 +1513,12 @@ int i915_gem_context_open(struct drm_i915_private *i915,
 	struct i915_gem_proto_context *pc;
 	struct i915_gem_context *ctx;
 	int err;
-	u32 id;
 
-	xa_init_flags(&file_priv->context_xa, XA_FLAGS_ALLOC);
+	mutex_init(&file_priv->proto_context_lock);
+	xa_init_flags(&file_priv->proto_context_xa, XA_FLAGS_ALLOC);
+
+	/* 0 reserved for the default context */
+	xa_init_flags(&file_priv->context_xa, XA_FLAGS_ALLOC1);
 
 	/* 0 reserved for invalid/unassigned ppgtt */
 	xa_init_flags(&file_priv->vm_xa, XA_FLAGS_ALLOC1);
@@ -1504,28 +1536,31 @@ int i915_gem_context_open(struct drm_i915_private *i915,
 		goto err;
 	}
 
-	err = gem_context_register(ctx, file_priv, &id);
-	if (err < 0)
-		goto err_ctx;
+	gem_context_register(ctx, file_priv, 0);
 
-	GEM_BUG_ON(id);
 	return 0;
 
-err_ctx:
-	context_close(ctx);
 err:
 	xa_destroy(&file_priv->vm_xa);
 	xa_destroy(&file_priv->context_xa);
+	xa_destroy(&file_priv->proto_context_xa);
+	mutex_destroy(&file_priv->proto_context_lock);
 	return err;
 }
 
 void i915_gem_context_close(struct drm_file *file)
 {
 	struct drm_i915_file_private *file_priv = file->driver_priv;
+	struct i915_gem_proto_context *pc;
 	struct i915_address_space *vm;
 	struct i915_gem_context *ctx;
 	unsigned long idx;
 
+	xa_for_each(&file_priv->proto_context_xa, idx, pc)
+		proto_context_close(pc);
+	xa_destroy(&file_priv->proto_context_xa);
+	mutex_destroy(&file_priv->proto_context_lock);
+
 	xa_for_each(&file_priv->context_xa, idx, ctx)
 		context_close(ctx);
 	xa_destroy(&file_priv->context_xa);
@@ -2480,12 +2515,73 @@ static bool client_is_banned(struct drm_i915_file_private *file_priv)
 	return atomic_read(&file_priv->ban_score) >= I915_CLIENT_SCORE_BANNED;
 }
 
+static inline struct i915_gem_context *
+__context_lookup(struct drm_i915_file_private *file_priv, u32 id)
+{
+	struct i915_gem_context *ctx;
+
+	rcu_read_lock();
+	ctx = xa_load(&file_priv->context_xa, id);
+	if (ctx && !kref_get_unless_zero(&ctx->ref))
+		ctx = NULL;
+	rcu_read_unlock();
+
+	return ctx;
+}
+
+struct i915_gem_context *
+lazy_create_context_locked(struct drm_i915_file_private *file_priv,
+			   struct i915_gem_proto_context *pc, u32 id)
+{
+	struct i915_gem_context *ctx;
+	void *old;
+
+	lockdep_assert_held(&file_priv->proto_context_lock);
+
+	ctx = i915_gem_create_context(file_priv->dev_priv, pc);
+	if (IS_ERR(ctx))
+		return ctx;
+
+	gem_context_register(ctx, file_priv, id);
+
+	old = xa_erase(&file_priv->proto_context_xa, id);
+	GEM_BUG_ON(old != pc);
+	proto_context_close(pc);
+
+	/* One for the xarray and one for the caller */
+	return i915_gem_context_get(ctx);
+}
+
+struct i915_gem_context *
+i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id)
+{
+	struct i915_gem_proto_context *pc;
+	struct i915_gem_context *ctx;
+
+	ctx = __context_lookup(file_priv, id);
+	if (ctx)
+		return ctx;
+
+	mutex_lock(&file_priv->proto_context_lock);
+	/* Try one more time under the lock */
+	ctx = __context_lookup(file_priv, id);
+	if (!ctx) {
+		pc = xa_load(&file_priv->proto_context_xa, id);
+		if (!pc)
+			ctx = ERR_PTR(-ENOENT);
+		else
+			ctx = lazy_create_context_locked(file_priv, pc, id);
+	}
+	mutex_unlock(&file_priv->proto_context_lock);
+
+	return ctx;
+}
+
 int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
 				  struct drm_file *file)
 {
 	struct drm_i915_private *i915 = to_i915(dev);
 	struct drm_i915_gem_context_create_ext *args = data;
-	struct i915_gem_context *ctx;
 	struct create_ext ext_data;
 	int ret;
 	u32 id;
@@ -2517,28 +2613,21 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
 					   create_extensions,
 					   ARRAY_SIZE(create_extensions),
 					   &ext_data);
-		if (ret) {
-			proto_context_close(ext_data.pc);
-			return ret;
-		}
+		if (ret)
+			goto err_pc;
 	}
 
-	ctx = i915_gem_create_context(i915, ext_data.pc);
-	proto_context_close(ext_data.pc);
-	if (IS_ERR(ctx))
-		return PTR_ERR(ctx);
-
-	ret = gem_context_register(ctx, ext_data.fpriv, &id);
+	ret = proto_context_register(ext_data.fpriv, ext_data.pc, &id);
 	if (ret < 0)
-		goto err_ctx;
+		goto err_pc;
 
 	args->ctx_id = id;
 	drm_dbg(&i915->drm, "HW context %d created\n", args->ctx_id);
 
 	return 0;
 
-err_ctx:
-	context_close(ctx);
+err_pc:
+	proto_context_close(ext_data.pc);
 	return ret;
 }
 
@@ -2547,6 +2636,7 @@ int i915_gem_context_destroy_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_i915_gem_context_destroy *args = data;
 	struct drm_i915_file_private *file_priv = file->driver_priv;
+	struct i915_gem_proto_context *pc;
 	struct i915_gem_context *ctx;
 
 	if (args->pad != 0)
@@ -2555,11 +2645,21 @@ int i915_gem_context_destroy_ioctl(struct drm_device *dev, void *data,
 	if (!args->ctx_id)
 		return -ENOENT;
 
+	mutex_lock(&file_priv->proto_context_lock);
 	ctx = xa_erase(&file_priv->context_xa, args->ctx_id);
-	if (!ctx)
+	pc = xa_erase(&file_priv->proto_context_xa, args->ctx_id);
+	mutex_unlock(&file_priv->proto_context_lock);
+
+	if (!ctx && !pc)
 		return -ENOENT;
+	GEM_WARN_ON(ctx && pc);
+
+	if (pc)
+		proto_context_close(pc);
+
+	if (ctx)
+		context_close(ctx);
 
-	context_close(ctx);
 	return 0;
 }
 
@@ -2692,16 +2792,41 @@ int i915_gem_context_setparam_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_i915_file_private *file_priv = file->driver_priv;
 	struct drm_i915_gem_context_param *args = data;
+	struct i915_gem_proto_context *pc;
 	struct i915_gem_context *ctx;
-	int ret;
+	int ret = 0;
 
-	ctx = i915_gem_context_lookup(file_priv, args->ctx_id);
-	if (IS_ERR(ctx))
-		return PTR_ERR(ctx);
+	ctx = __context_lookup(file_priv, args->ctx_id);
+	if (ctx)
+		goto set_ctx_param;
 
-	ret = ctx_setparam(file_priv, ctx, args);
+	mutex_lock(&file_priv->proto_context_lock);
+	ctx = __context_lookup(file_priv, args->ctx_id);
+	if (ctx)
+		goto unlock;
+
+	pc = xa_load(&file_priv->proto_context_xa, args->ctx_id);
+	if (!pc) {
+		ret = -ENOENT;
+		goto unlock;
+	}
+
+	/* FIXME: We should consider disallowing SET_CONTEXT_PARAM for most
+	 * things on future platforms.  Clients should be using
+	 * CONTEXT_CREATE_EXT_PARAM instead.
+	 */
+	ret = set_proto_ctx_param(file_priv, pc, args);
+
+unlock:
+	mutex_unlock(&file_priv->proto_context_lock);
+
+set_ctx_param:
+	if (!ret && ctx)
+		ret = ctx_setparam(file_priv, ctx, args);
+
+	if (ctx)
+		i915_gem_context_put(ctx);
 
-	i915_gem_context_put(ctx);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
index b5c908f3f4f22..20411db84914a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
@@ -133,6 +133,9 @@ int i915_gem_context_setparam_ioctl(struct drm_device *dev, void *data,
 int i915_gem_context_reset_stats_ioctl(struct drm_device *dev, void *data,
 				       struct drm_file *file);
 
+struct i915_gem_context *
+i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id);
+
 static inline struct i915_gem_context *
 i915_gem_context_get(struct i915_gem_context *ctx)
 {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index 2ac341f805c8f..b673061f4f5ba 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -122,6 +122,60 @@ struct i915_gem_proto_engine {
  * an i915_gem_context.  This is used to gather parameters provided either
  * through creation flags or via SET_CONTEXT_PARAM so that, when we create
  * the final i915_gem_context, those parameters can be immutable.
+ *
+ * The context uAPI allows for two methods of setting context parameters:
+ * SET_CONTEXT_PARAM and CONTEXT_CREATE_EXT_SETPARAM.  The former is
+ * allowed to be called at any time while the later happens as part of
+ * GEM_CONTEXT_CREATE.  When these were initially added, Currently,
+ * everything settable via one is settable via the other.  While some
+ * params are fairly simple and setting them on a live context is harmless
+ * such the context priority, others are far trickier such as the VM or the
+ * set of engines.  To avoid some truly nasty race conditions, we don't
+ * allow setting the VM or the set of engines on live contexts.
+ *
+ * The way we dealt with this without breaking older userspace that sets
+ * the VM or engine set via SET_CONTEXT_PARAM is to delay the creation of
+ * the actual context until after the client is done configuring it with
+ * SET_CONTEXT_PARAM.  From the perspective of the client, it has the same
+ * u32 context ID the whole time.  From the perspective of i915, however,
+ * it's an i915_gem_proto_context right up until the point where we attempt
+ * to do something which the proto-context can't handle at which point the
+ * real context gets created.
+ *
+ * This is accomplished via a little xarray dance.  When GEM_CONTEXT_CREATE
+ * is called, we create a proto-context, reserve a slot in context_xa but
+ * leave it NULL, the proto-context in the corresponding slot in
+ * proto_context_xa.  Then, whenever we go to look up a context, we first
+ * check context_xa.  If it's there, we return the i915_gem_context and
+ * we're done.  If it's not, we look in proto_context_xa and, if we find it
+ * there, we create the actual context and kill the proto-context.
+ *
+ * At the time we made this change (April, 2021), we did a fairly complete
+ * audit of existing userspace to ensure this wouldn't break anything:
+ *
+ *  - Mesa/i965 didn't use the engines or VM APIs at all
+ *
+ *  - Mesa/ANV used the engines API but via CONTEXT_CREATE_EXT_SETPARAM and
+ *    didn't use the VM API.
+ *
+ *  - Mesa/iris didn't use the engines or VM APIs at all
+ *
+ *  - The open-source compute-runtime didn't yet use the engines API but
+ *    did use the VM API via SET_CONTEXT_PARAM.  However, CONTEXT_SETPARAM
+ *    was always the second ioctl on that context, immediately following
+ *    GEM_CONTEXT_CREATE.
+ *
+ *  - The media driver sets engines and bonding/balancing via
+ *    SET_CONTEXT_PARAM.  However, CONTEXT_SETPARAM to set the VM was
+ *    always the second ioctl on that context, immediately following
+ *    GEM_CONTEXT_CREATE and setting engines immediately followed that.
+ *
+ * In order for this dance to work properly, any modification to an
+ * i915_gem_proto_context that is exposed to the client via
+ * drm_i915_file_private::proto_context_xa must be guarded by
+ * drm_i915_file_private::proto_context_lock.  The exception is when a
+ * proto-context has not yet been exposed such as when handling
+ * CONTEXT_CREATE_SET_PARAM during GEM_CONTEXT_CREATE.
  */
 struct i915_gem_proto_context {
 	/** @vm: See i915_gem_context::vm */
diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
index cbeefd060e97b..61aaac4a334cf 100644
--- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
@@ -81,6 +81,7 @@ void mock_init_contexts(struct drm_i915_private *i915)
 struct i915_gem_context *
 live_context(struct drm_i915_private *i915, struct file *file)
 {
+	struct drm_i915_file_private *fpriv = to_drm_file(file)->driver_priv;
 	struct i915_gem_proto_context *pc;
 	struct i915_gem_context *ctx;
 	int err;
@@ -97,10 +98,12 @@ live_context(struct drm_i915_private *i915, struct file *file)
 
 	i915_gem_context_set_no_error_capture(ctx);
 
-	err = gem_context_register(ctx, to_drm_file(file)->driver_priv, &id);
+	err = xa_alloc(&fpriv->context_xa, &id, NULL, xa_limit_32b, GFP_KERNEL);
 	if (err < 0)
 		goto err_ctx;
 
+	gem_context_register(ctx, fpriv, id);
+
 	return ctx;
 
 err_ctx:
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index d7bd732ceacfc..8b00292e1ae56 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -201,6 +201,16 @@ struct drm_i915_file_private {
 		struct rcu_head rcu;
 	};
 
+	/** @proto_context_lock: Guards all i915_gem_proto_context operations
+	 *
+	 * See i915_gem_proto_context.
+	 */
+	struct mutex proto_context_lock;
+
+	/** @proto_context_xa: xarray of i915_gem_proto_context */
+	struct xarray proto_context_xa;
+
+	/** @context_xa: xarray of fully created i915_gem_context */
 	struct xarray context_xa;
 	struct xarray vm_xa;
 
@@ -1857,20 +1867,6 @@ struct drm_gem_object *i915_gem_prime_import(struct drm_device *dev,
 
 struct dma_buf *i915_gem_prime_export(struct drm_gem_object *gem_obj, int flags);
 
-static inline struct i915_gem_context *
-i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id)
-{
-	struct i915_gem_context *ctx;
-
-	rcu_read_lock();
-	ctx = xa_load(&file_priv->context_xa, id);
-	if (ctx && !kref_get_unless_zero(&ctx->ref))
-		ctx = NULL;
-	rcu_read_unlock();
-
-	return ctx ? ctx : ERR_PTR(-ENOENT);
-}
-
 static inline struct i915_address_space *
 i915_gem_vm_lookup(struct drm_i915_file_private *file_priv, u32 id)
 {
-- 
2.31.1

