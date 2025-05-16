Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C75CABA1AE
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 19:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A0A310EB48;
	Fri, 16 May 2025 17:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HXnvrgfU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7055D10EB5E
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 17:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747415469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BurJjKs9pzCfRcZrN7FMvrlgbm4PDmTtPhaZqqv4ewc=;
 b=HXnvrgfUp+OAbzU4TQwKNoNvwSfq2Gf1EwES8n6eotsNFRxu5ukrVozUrO67/a8B5GBymN
 HdsfljTaPffNlsSncu82TBOiansE298q1SNNMyVxCj3ZeKpliSw9WLhy/8y0Hu8DiM2dMT
 jQFTLcW56Jg4JqUrhpEnQJCQkb/gf78=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-444-EtoQMW1HOhuyezN1Q6cgpg-1; Fri,
 16 May 2025 13:11:03 -0400
X-MC-Unique: EtoQMW1HOhuyezN1Q6cgpg-1
X-Mimecast-MFC-AGG-ID: EtoQMW1HOhuyezN1Q6cgpg_1747415460
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6FF69195608E; Fri, 16 May 2025 17:11:00 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.82.40])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1178419560B2; Fri, 16 May 2025 17:10:55 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
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
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Asahi Lina <lina@asahilina.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: [PATCH v2 3/4] rust: drm: gem: Add ObjectFile type alias
Date: Fri, 16 May 2025 13:09:18 -0400
Message-ID: <20250516171030.776924-4-lyude@redhat.com>
In-Reply-To: <20250516171030.776924-1-lyude@redhat.com>
References: <20250516171030.776924-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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

Just to reduce the clutter with the File<…> types in gem.rs.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/gem/mod.rs | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index c17b36948bae3..2b81298d29765 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -17,6 +17,13 @@
 /// A type alias for the Object type in use by a [`drm::Driver`].
 pub type DriverObject<T> = <<T as BaseDriverObject>::Driver as drm::Driver>::Object;
 
+/// A type alias for retrieving a [`Driver`]s [`DriverFile`] implementation from its
+/// [`DriverObject`] implementation.
+///
+/// [`Driver`]: drm::Driver
+/// [`DriverFile`]: drm::file::DriverFile
+pub type ObjectFile<T> = drm::File<<<T as BaseDriverObject>::Driver as drm::Driver>::File>;
+
 /// GEM object functions, which must be implemented by drivers.
 pub trait BaseDriverObject: Sync + Send + Sized {
     /// Parent `Driver` for this object.
@@ -26,15 +33,12 @@ pub trait BaseDriverObject: Sync + Send + Sized {
     fn new(dev: &drm::Device<Self::Driver>, size: usize) -> impl PinInit<Self, Error>;
 
     /// Open a new handle to an existing object, associated with a File.
-    fn open(
-        _obj: &DriverObject<Self>,
-        _file: &drm::File<<Self::Driver as drm::Driver>::File>,
-    ) -> Result {
+    fn open(_obj: &DriverObject<Self>, _file: &ObjectFile<Self>) -> Result {
         Ok(())
     }
 
     /// Close a handle to an existing object, associated with a File.
-    fn close(_obj: &DriverObject<Self>, _file: &drm::File<<Self::Driver as drm::Driver>::File>) {}
+    fn close(_obj: &DriverObject<Self>, _file: &ObjectFile<Self>) {}
 }
 
 /// Trait that represents a GEM object subtype
@@ -78,7 +82,8 @@ extern "C" fn open_callback<T: BaseDriverObject>(
     raw_file: *mut bindings::drm_file,
 ) -> core::ffi::c_int {
     // SAFETY: `open_callback` is only ever called with a valid pointer to a `struct drm_file`.
-    let file = unsafe { drm::File::<<T::Driver as drm::Driver>::File>::as_ref(raw_file) };
+    let file = unsafe { ObjectFile::<T>::as_ref(raw_file) };
+
     // SAFETY: `open_callback` is specified in the AllocOps structure for `DriverObject<T>`,
     // ensuring that `raw_obj` is contained within a `DriverObject<T>`
     let obj = unsafe { DriverObject::<T>::as_ref(raw_obj) };
@@ -94,7 +99,7 @@ extern "C" fn close_callback<T: BaseDriverObject>(
     raw_file: *mut bindings::drm_file,
 ) {
     // SAFETY: `open_callback` is only ever called with a valid pointer to a `struct drm_file`.
-    let file = unsafe { drm::File::<<T::Driver as drm::Driver>::File>::as_ref(raw_file) };
+    let file = unsafe { ObjectFile::<T>::as_ref(raw_file) };
 
     // SAFETY: `close_callback` is specified in the AllocOps structure for `Object<T>`, ensuring
     // that `raw_obj` is indeed contained within a `Object<T>`.
@@ -125,7 +130,7 @@ fn size(&self) -> usize {
 
     /// Creates a new handle for the object associated with a given `File`
     /// (or returns an existing one).
-    fn create_handle(&self, file: &drm::File<<Self::Driver as drm::Driver>::File>) -> Result<u32>
+    fn create_handle(&self, file: &ObjectFile<Self>) -> Result<u32>
     where
         Self: BaseDriverObject,
     {
@@ -138,10 +143,7 @@ fn create_handle(&self, file: &drm::File<<Self::Driver as drm::Driver>::File>) -
     }
 
     /// Looks up an object by its handle for a given `File`.
-    fn lookup_handle(
-        file: &drm::File<<Self::Driver as drm::Driver>::File>,
-        handle: u32,
-    ) -> Result<ARef<Self>>
+    fn lookup_handle(file: &ObjectFile<Self>, handle: u32) -> Result<ARef<Self>>
     where
         Self: BaseDriverObject,
     {
-- 
2.49.0

