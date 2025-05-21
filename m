Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBA1ABFE41
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 22:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0C610E767;
	Wed, 21 May 2025 20:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eoqYFfhr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D35C10E767
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 20:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747860464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WZFnjWwVw3G9FTHb5RE01lQ8HhDpRBWEySGBEF+FoVQ=;
 b=eoqYFfhrQAiZAwkTtLjeSoNh6auo156SAIpjWTstK7s4izHqY/DdROt7PkxpFsx/GB3j6c
 daU51N9mlAfFktXIv2dmmgWr3yIwRWgB5A4/t2QqbLwDBJK8rwVjmVijwsfj6GHDUMoZy/
 foqGTfNsxfc2R48kEe5TgUv/9p8MZEc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-363-Gsrj4wuoMHGmCvM2fLFDuA-1; Wed,
 21 May 2025 16:47:38 -0400
X-MC-Unique: Gsrj4wuoMHGmCvM2fLFDuA-1
X-Mimecast-MFC-AGG-ID: Gsrj4wuoMHGmCvM2fLFDuA_1747860456
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 744FD180036E; Wed, 21 May 2025 20:47:36 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.80.100])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 602931956066; Wed, 21 May 2025 20:47:32 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 03/12] drm/gem/shmem: Extract drm_gem_shmem_init() from
 drm_gem_shmem_create()
Date: Wed, 21 May 2025 16:29:10 -0400
Message-ID: <20250521204654.1610607-4-lyude@redhat.com>
In-Reply-To: <20250521204654.1610607-1-lyude@redhat.com>
References: <20250521204654.1610607-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With gem objects in rust, the most ideal way for us to be able to handle
gem shmem object creation is to be able to handle the memory allocation of
a gem object ourselves - and then have the DRM gem shmem helpers initialize
the object we've allocated afterwards. So, let's spit out
drm_gem_shmem_init() from drm_gem_shmem_create() to allow for doing this.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 75 +++++++++++++++++---------
 include/drm/drm_gem_shmem_helper.h     |  1 +
 2 files changed, 51 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index a4144e0ef67ef..f3e88fb579b52 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -48,28 +48,12 @@ static const struct drm_gem_object_funcs drm_gem_shmem_funcs = {
 	.vm_ops = &drm_gem_shmem_vm_ops,
 };
 
-static struct drm_gem_shmem_object *
-__drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private,
-		       struct vfsmount *gemfs)
+static int __drm_gem_shmem_init(struct drm_device *dev, struct drm_gem_shmem_object *shmem,
+				size_t size, bool private, struct vfsmount *gemfs)
 {
-	struct drm_gem_shmem_object *shmem;
-	struct drm_gem_object *obj;
+	struct drm_gem_object *obj = &shmem->base;
 	int ret = 0;
 
-	size = PAGE_ALIGN(size);
-
-	if (dev->driver->gem_create_object) {
-		obj = dev->driver->gem_create_object(dev, size);
-		if (IS_ERR(obj))
-			return ERR_CAST(obj);
-		shmem = to_drm_gem_shmem_obj(obj);
-	} else {
-		shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
-		if (!shmem)
-			return ERR_PTR(-ENOMEM);
-		obj = &shmem->base;
-	}
-
 	if (!obj->funcs)
 		obj->funcs = &drm_gem_shmem_funcs;
 
@@ -81,7 +65,7 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private,
 	}
 	if (ret) {
 		drm_gem_private_object_fini(obj);
-		goto err_free;
+		return ret;
 	}
 
 	ret = drm_gem_create_mmap_offset(obj);
@@ -102,14 +86,55 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private,
 				     __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
 	}
 
-	return shmem;
-
+	return 0;
 err_release:
 	drm_gem_object_release(obj);
-err_free:
-	kfree(obj);
+	return ret;
+}
 
-	return ERR_PTR(ret);
+/**
+ * drm_gem_shmem_init - Initialize an allocated object.
+ * @dev: DRM device
+ * @obj: The allocated shmem GEM object.
+ *
+ * Returns:
+ * 0 on success, or a negative error code on failure.
+ */
+int drm_gem_shmem_init(struct drm_device *dev, struct drm_gem_shmem_object *shmem, size_t size)
+{
+	return __drm_gem_shmem_init(dev, shmem, size, false, NULL);
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_init);
+
+static struct drm_gem_shmem_object *
+__drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private,
+		       struct vfsmount *gemfs)
+{
+	struct drm_gem_shmem_object *shmem;
+	struct drm_gem_object *obj;
+	int ret = 0;
+
+	size = PAGE_ALIGN(size);
+
+	if (dev->driver->gem_create_object) {
+		obj = dev->driver->gem_create_object(dev, size);
+		if (IS_ERR(obj))
+			return ERR_CAST(obj);
+		shmem = to_drm_gem_shmem_obj(obj);
+	} else {
+		shmem = kzalloc(sizeof(*shmem), GFP_KERNEL);
+		if (!shmem)
+			return ERR_PTR(-ENOMEM);
+		obj = &shmem->base;
+	}
+
+	ret = __drm_gem_shmem_init(dev, shmem, size, private, gemfs);
+	if (ret) {
+		kfree(obj);
+		return ERR_PTR(ret);
+	}
+
+	return shmem;
 }
 /**
  * drm_gem_shmem_create - Allocate an object with the given size
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index cef5a6b5a4d63..ea0785d1700a5 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -96,6 +96,7 @@ struct drm_gem_shmem_object {
 #define to_drm_gem_shmem_obj(obj) \
 	container_of(obj, struct drm_gem_shmem_object, base)
 
+int drm_gem_shmem_init(struct drm_device *dev, struct drm_gem_shmem_object *shmem, size_t size);
 struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t size);
 struct drm_gem_shmem_object *drm_gem_shmem_create_with_mnt(struct drm_device *dev,
 							   size_t size,
-- 
2.49.0

