Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F31ABFE61
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 22:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F0710E7A6;
	Wed, 21 May 2025 20:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="F5RSK14n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD8C10E7A6
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 20:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747860537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YfYUdTNb5Gc7ulEphuHVddFPp9Ry0HXZjmcMzmLE0DM=;
 b=F5RSK14n4i8LG1gz4WscgQjwG8ks/YK+DbVg3076xY9DqcaQIAs86EAxy00otmit4Yb93k
 c7UKg2kkSSpfrnZsrv0CyfQD+y8glbiEQ+TvUVc6Gl/rAVS9yPyL6KykiCIAfH/gVltb4G
 vyy159s7gG+ukZojsfrY0z9IYqQAUMA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-634-A5lh2k0lPK6iSSvRo02qvg-1; Wed,
 21 May 2025 16:48:51 -0400
X-MC-Unique: A5lh2k0lPK6iSSvRo02qvg-1
X-Mimecast-MFC-AGG-ID: A5lh2k0lPK6iSSvRo02qvg_1747860528
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 92A671800368; Wed, 21 May 2025 20:48:48 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.80.100])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id F37131956066; Wed, 21 May 2025 20:48:43 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Asahi Lina <lina@asahilina.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-media@vger.kernel.org (open list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b), 
 linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v2 12/12] rust: drm: gem: Add BaseObject::prime_export()
Date: Wed, 21 May 2025 16:29:19 -0400
Message-ID: <20250521204654.1610607-13-lyude@redhat.com>
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

We just added an export() callback that GEM objects can implement, but
without any way of actually exporting a DmaBuf<T>. So let's add one by
introducing bindings for drm_gem_prime_export().

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/gem/mod.rs | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index ef697f323e52c..ee74b9bdb7a1f 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -225,6 +225,29 @@ fn lookup_handle<D, F, O>(file: &drm::File<F>, handle: u32) -> Result<ARef<Self>
         Ok(unsafe { ARef::from_raw(obj.into()) })
     }
 
+    /// Export a [`DmaBuf`] for this GEM object using the DRM prime helper library.
+    ///
+    /// `flags` should be a set of flags from [`fs::file::flags`](kernel::fs::file::flags).
+    fn prime_export(&self, flags: u32) -> Result<DmaBuf<Self>> {
+        // SAFETY:
+        // - `as_raw()` always returns a valid pointer to a `drm_gem_object`.
+        // - `drm_gem_prime_export()` returns either an error pointer, or a valid pointer to an
+        //   initialized `dma_buf` on success.
+        let dma_ptr = from_err_ptr(unsafe {
+            bindings::drm_gem_prime_export(self.as_raw(), flags as _)
+        })?;
+
+        // SAFETY:
+        // - We checked that dma_ptr is not an error, so it must point to an initialized dma_buf
+        // - We used drm_gem_prime_export(), so `dma_ptr` will remain valid until a call to
+        //   `drm_gem_prime_release()` which we don't call here.
+        let dma_buf = unsafe { dma_buf::DmaBuf::as_ref(dma_ptr) };
+
+        // INVARIANT: We used drm_gem_prime_export() to create this dma_buf, fulfilling the
+        // invariant that this dma_buf came from a GEM object of type `Self`.
+        Ok(DmaBuf(dma_buf.into(), PhantomData))
+    }
+
     /// Creates an mmap offset to map the object from userspace.
     fn create_mmap_offset(&self) -> Result<u64> {
         // SAFETY: The arguments are valid per the type invariant.
-- 
2.49.0

