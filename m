Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFDBB53EE5
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 01:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD9510EBA4;
	Thu, 11 Sep 2025 23:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TW4ZNleh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91B710E3ED
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 23:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757631746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oki6K+pbJ2z7ZPJUTxki20bybBrN7tk4yeB2QThY9ug=;
 b=TW4ZNlehcGaA5TgqEysfnC9OKNrLzKblfighz9NRXVSLmk5Lyx2mZpGSq+I+UbUbbVtQY2
 STxbCDMYpNsP1TR7u9v9XJfOUFRAPtclCvEwIUt7HM37q4fBK9a9pFZ+TXzfYQeYtVAKPR
 VeVcpaYR5Ofcd+zbts2U58rSQr+z7fs=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-558-XX4uhEhoOXOhFIOjDA4c5A-1; Thu,
 11 Sep 2025 19:02:20 -0400
X-MC-Unique: XX4uhEhoOXOhFIOjDA4c5A-1
X-Mimecast-MFC-AGG-ID: XX4uhEhoOXOhFIOjDA4c5A_1757631738
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F3C7519107DB; Thu, 11 Sep 2025 23:02:17 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.64.100])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CE1E01944CCA; Thu, 11 Sep 2025 23:02:13 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v4 2/3] drm/gem/shmem: Extract drm_gem_shmem_release() from
 drm_gem_shmem_free()
Date: Thu, 11 Sep 2025 18:57:39 -0400
Message-ID: <20250911230147.650077-3-lyude@redhat.com>
In-Reply-To: <20250911230147.650077-1-lyude@redhat.com>
References: <20250911230147.650077-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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

At the moment, the way that we currently free gem shmem objects is not
ideal for rust bindings. drm_gem_shmem_free() releases all of the
associated memory with a gem shmem object with kfree(), which means that
for us to correctly release a gem shmem object in rust we have to manually
drop all of the contents of our gem object structure in-place by hand
before finally calling drm_gem_shmem_free() to release the shmem resources
and the allocation for the gem object.

Since the only reason this is an issue is because of drm_gem_shmem_free()
calling kfree(), we can fix this by splitting drm_gem_shmem_free() out into
itself and drm_gem_shmem_release(), where drm_gem_shmem_release() releases
the various gem shmem resources without freeing the structure itself. With
this, we can safely re-acquire the KBox for the gem object's memory
allocation and let rust handle cleaning up all of the other struct members
automatically.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

---
V4:
* Fix accidental word salad that made it into the commit message

 drivers/gpu/drm/drm_gem_shmem_helper.c | 23 ++++++++++++++++++-----
 include/drm/drm_gem_shmem_helper.h     |  1 +
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index b20a7b75c7228..50594cf8e17cc 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -175,13 +175,13 @@ struct drm_gem_shmem_object *drm_gem_shmem_create_with_mnt(struct drm_device *de
 EXPORT_SYMBOL_GPL(drm_gem_shmem_create_with_mnt);
 
 /**
- * drm_gem_shmem_free - Free resources associated with a shmem GEM object
- * @shmem: shmem GEM object to free
+ * drm_gem_shmem_release - Release resources associated with a shmem GEM object.
+ * @shmem: shmem GEM object
  *
- * This function cleans up the GEM object state and frees the memory used to
- * store the object itself.
+ * This function cleans up the GEM object state, but does not free the memory used to store the
+ * object itself. This function is meant to be a dedicated helper for the Rust GEM bindings.
  */
-void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
+void drm_gem_shmem_release(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
@@ -208,6 +208,19 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 	}
 
 	drm_gem_object_release(obj);
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_release);
+
+/**
+ * drm_gem_shmem_free - Free resources associated with a shmem GEM object
+ * @shmem: shmem GEM object to free
+ *
+ * This function cleans up the GEM object state and frees the memory used to
+ * store the object itself.
+ */
+void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
+{
+	drm_gem_shmem_release(shmem);
 	kfree(shmem);
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_free);
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 235dc33127b9a..589f7bfe7506e 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -112,6 +112,7 @@ struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t
 struct drm_gem_shmem_object *drm_gem_shmem_create_with_mnt(struct drm_device *dev,
 							   size_t size,
 							   struct vfsmount *gemfs);
+void drm_gem_shmem_release(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem);
 
 void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem);
-- 
2.51.0

