Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECE8A70B05
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 21:07:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBCA10E5EE;
	Tue, 25 Mar 2025 20:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hwq/CkOq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B7510E5EE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 20:07:51 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6ecfc7ed0c1so20854086d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 13:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742933270; x=1743538070; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vUyKcLlRsxCPf3w4Hv0sykJZjBz7c3E/OZe1MEqXL5I=;
 b=hwq/CkOqn80Jclqa+kknme2dzh67cuv25JXp21tmGwPEBWLapg8DadZx/TXwgoac2a
 4uNVIK/iOYZqbmGY8cNcRcTyxFQhY85nig/3VfeGsko9OJbdjm3/762t1FfJ9AXQ1kr3
 qzWK+Xcqd5INXBDfBcxVUZiAHfvWUkQIlC2nmZDZoKiD179MuroXnkB/Z9xQFiUtInsp
 /DuPVCDe9YLAwdAAvcRhDkehyhV7LDtxHnbHIP3oAcf3bgc7vP7iRkcQpyguDY0bXkoM
 v1JmsE7HZpKgy5ho14teVLl/+/sSPwA/vYgnWqMwHThUqQvwsr8aiKEHlk6XgBWX3TZS
 yVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742933270; x=1743538070;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vUyKcLlRsxCPf3w4Hv0sykJZjBz7c3E/OZe1MEqXL5I=;
 b=KmuS05L4PCEG1SZ/pZD0gRE9EKbtllk/t6jhxVaEUhwuE71JY3lulmZ9Edw/YbeM+l
 eipOv/bZc0ptCb1TztjcPWfTCj+v6YpfpaWqycvZ225b3c4aazD7g93i8X1ud3RbuFNb
 eL7oaEDovY5nLrmsaWbh3CU1EZd+LLPiWiR1x1wT9fv0sEBgM9Om84mugZaJnTPURxbr
 KdP86SX1Cd4iTgTtRkOsfhb6lVDcJa4yuZhJBSozyvDo/+pZDndAXyMUDYtXCOHygddd
 BM0PFkg03asFJZj3S3srzLsYGM9k9P5ygCTWp7LgCI+XIMqxwRRslXxdB9XvFUNxPPn4
 prYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6UoYDRs9EoZEijSZJlBwx9aL6B1zrURBTRQdrsNfLIN6DOJASsyb0kXHhYqb3ZKZ/qTHqNXa8z6Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDWd4xuLvIsgudj9bbKzh26UP7Ro7tWvnop8Ygy0W128BudMLM
 DploE6TVLuku9s1e2Ok0VNuhzgJP97SF7xP72rCgTTL3Gmf+R/8MqBYI6yK4Uq0=
X-Gm-Gg: ASbGncsSDzm4Ex/xN1ZpFRHRqbG1hzLyQZbG5Q6iftDChNVgtKWpaLcpNadATJl+dtw
 mdUCBdEErOqlihrWnATUuPeJyeG2QgejsqbFFnApls8X0qZmWocMITWd/EON0M0oyl6Z2jRL/iU
 uG4OFIMmqPRBL6nei4MkbCT5CT2vZCIA7bpwCEfBiGQSf+d3DZ2b3jdeiyXsXq1ffA0+5KcfHm+
 r9RG4qGGe+d+yMfsE92adHSx4epvun2TFLcj7mYz2709ProHEjLolUgFZTKNBZHk2MqqMQdbKjC
 lQDnxLQZMF8fjUJKxNY/nzvFTK83p1qfeqdCwi6zRzegfALYWTAldKwBcGaKQHLmdS0TvHoVzJ+
 QhEKCCfMGnVSTnetmOACGZEZJR0eCWS+cX6y6W3/3hyNKE9ekvewHiw==
X-Google-Smtp-Source: AGHT+IF0FEVjkmBVxSw4zx3ID9z15/27aOJZzeAhYx7Krhmei89O1rW0ABUkTs86J2nx907JKAmhLQ==
X-Received: by 2002:a05:6214:4007:b0:6e8:9866:7398 with SMTP id
 6a1803df08f44-6eb3f2e5534mr243298056d6.22.1742933269992; 
 Tue, 25 Mar 2025 13:07:49 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2620:10d:c091:600::1:38f6]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6eb3ef31810sm59790316d6.64.2025.03.25.13.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 13:07:49 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 25 Mar 2025 16:07:41 -0400
Subject: [PATCH v7 1/7] rust: retain pointer mut-ness in `container_of!`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-ptr-as-ptr-v7-1-87ab452147b9@gmail.com>
References: <20250325-ptr-as-ptr-v7-0-87ab452147b9@gmail.com>
In-Reply-To: <20250325-ptr-as-ptr-v7-0-87ab452147b9@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
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

Avoid casting the input pointer to `*const _`, allowing the output
pointer to be `*mut` if the input is `*mut`. This allows a number of
`*const` to `*mut` conversions to be removed at the cost of slightly
worse ergonomics when the macro is used with a reference rather than a
pointer; the only example of this was in the macro's own doctest.

Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/lib.rs      |  5 ++---
 rust/kernel/pci.rs      |  2 +-
 rust/kernel/platform.rs |  2 +-
 rust/kernel/rbtree.rs   | 23 ++++++++++-------------
 4 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index ba0f3b0297b2..cffa0d837f06 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -190,7 +190,7 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
 /// }
 ///
 /// let test = Test { a: 10, b: 20 };
-/// let b_ptr = &test.b;
+/// let b_ptr: *const _ = &test.b;
 /// // SAFETY: The pointer points at the `b` field of a `Test`, so the resulting pointer will be
 /// // in-bounds of the same allocation as `b_ptr`.
 /// let test_alias = unsafe { container_of!(b_ptr, Test, b) };
@@ -199,9 +199,8 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
 #[macro_export]
 macro_rules! container_of {
     ($ptr:expr, $type:ty, $($f:tt)*) => {{
-        let ptr = $ptr as *const _ as *const u8;
         let offset: usize = ::core::mem::offset_of!($type, $($f)*);
-        ptr.sub(offset) as *const $type
+        $ptr.byte_sub(offset).cast::<$type>()
     }}
 }
 
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index f7b2743828ae..271a7690a9a0 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -364,7 +364,7 @@ pub unsafe fn from_dev(dev: ARef<device::Device>) -> Self {
     fn as_raw(&self) -> *mut bindings::pci_dev {
         // SAFETY: By the type invariant `self.0.as_raw` is a pointer to the `struct device`
         // embedded in `struct pci_dev`.
-        unsafe { container_of!(self.0.as_raw(), bindings::pci_dev, dev) as _ }
+        unsafe { container_of!(self.0.as_raw(), bindings::pci_dev, dev) }
     }
 
     /// Returns the PCI vendor ID.
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 1297f5292ba9..84a4ecc642a1 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -189,7 +189,7 @@ unsafe fn from_dev(dev: ARef<device::Device>) -> Self {
     fn as_raw(&self) -> *mut bindings::platform_device {
         // SAFETY: By the type invariant `self.0.as_raw` is a pointer to the `struct device`
         // embedded in `struct platform_device`.
-        unsafe { container_of!(self.0.as_raw(), bindings::platform_device, dev) }.cast_mut()
+        unsafe { container_of!(self.0.as_raw(), bindings::platform_device, dev) }
     }
 }
 
diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
index 5246b2c8a4ff..8d978c896747 100644
--- a/rust/kernel/rbtree.rs
+++ b/rust/kernel/rbtree.rs
@@ -424,7 +424,7 @@ pub fn cursor_lower_bound(&mut self, key: &K) -> Option<Cursor<'_, K, V>>
         while !node.is_null() {
             // SAFETY: By the type invariant of `Self`, all non-null `rb_node` pointers stored in `self`
             // point to the links field of `Node<K, V>` objects.
-            let this = unsafe { container_of!(node, Node<K, V>, links) }.cast_mut();
+            let this = unsafe { container_of!(node, Node<K, V>, links) };
             // SAFETY: `this` is a non-null node so it is valid by the type invariants.
             let this_key = unsafe { &(*this).key };
             // SAFETY: `node` is a non-null node so it is valid by the type invariants.
@@ -496,7 +496,7 @@ fn drop(&mut self) {
             // but it is not observable. The loop invariant is still maintained.
 
             // SAFETY: `this` is valid per the loop invariant.
-            unsafe { drop(KBox::from_raw(this.cast_mut())) };
+            unsafe { drop(KBox::from_raw(this)) };
         }
     }
 }
@@ -761,7 +761,7 @@ pub fn remove_current(self) -> (Option<Self>, RBTreeNode<K, V>) {
         let next = self.get_neighbor_raw(Direction::Next);
         // SAFETY: By the type invariant of `Self`, all non-null `rb_node` pointers stored in `self`
         // point to the links field of `Node<K, V>` objects.
-        let this = unsafe { container_of!(self.current.as_ptr(), Node<K, V>, links) }.cast_mut();
+        let this = unsafe { container_of!(self.current.as_ptr(), Node<K, V>, links) };
         // SAFETY: `this` is valid by the type invariants as described above.
         let node = unsafe { KBox::from_raw(this) };
         let node = RBTreeNode { node };
@@ -806,7 +806,7 @@ fn remove_neighbor(&mut self, direction: Direction) -> Option<RBTreeNode<K, V>>
             unsafe { bindings::rb_erase(neighbor, addr_of_mut!(self.tree.root)) };
             // SAFETY: By the type invariant of `Self`, all non-null `rb_node` pointers stored in `self`
             // point to the links field of `Node<K, V>` objects.
-            let this = unsafe { container_of!(neighbor, Node<K, V>, links) }.cast_mut();
+            let this = unsafe { container_of!(neighbor, Node<K, V>, links) };
             // SAFETY: `this` is valid by the type invariants as described above.
             let node = unsafe { KBox::from_raw(this) };
             return Some(RBTreeNode { node });
@@ -912,7 +912,7 @@ unsafe fn to_key_value_mut<'b>(node: NonNull<bindings::rb_node>) -> (&'b K, &'b
     unsafe fn to_key_value_raw<'b>(node: NonNull<bindings::rb_node>) -> (&'b K, *mut V) {
         // SAFETY: By the type invariant of `Self`, all non-null `rb_node` pointers stored in `self`
         // point to the links field of `Node<K, V>` objects.
-        let this = unsafe { container_of!(node.as_ptr(), Node<K, V>, links) }.cast_mut();
+        let this = unsafe { container_of!(node.as_ptr(), Node<K, V>, links) };
         // SAFETY: The passed `node` is the current node or a non-null neighbor,
         // thus `this` is valid by the type invariants.
         let k = unsafe { &(*this).key };
@@ -1021,7 +1021,7 @@ fn next(&mut self) -> Option<Self::Item> {
 
         // SAFETY: By the type invariant of `IterRaw`, `self.next` is a valid node in an `RBTree`,
         // and by the type invariant of `RBTree`, all nodes point to the links field of `Node<K, V>` objects.
-        let cur = unsafe { container_of!(self.next, Node<K, V>, links) }.cast_mut();
+        let cur = unsafe { container_of!(self.next, Node<K, V>, links) };
 
         // SAFETY: `self.next` is a valid tree node by the type invariants.
         self.next = unsafe { bindings::rb_next(self.next) };
@@ -1216,7 +1216,7 @@ pub fn get_mut(&mut self) -> &mut V {
         // SAFETY:
         // - `self.node_links` is a valid pointer to a node in the tree.
         // - We have exclusive access to the underlying tree, and can thus give out a mutable reference.
-        unsafe { &mut (*(container_of!(self.node_links, Node<K, V>, links).cast_mut())).value }
+        unsafe { &mut (*(container_of!(self.node_links, Node<K, V>, links))).value }
     }
 
     /// Converts the entry into a mutable reference to its value.
@@ -1226,7 +1226,7 @@ pub fn into_mut(self) -> &'a mut V {
         // SAFETY:
         // - `self.node_links` is a valid pointer to a node in the tree.
         // - This consumes the `&'a mut RBTree<K, V>`, therefore it can give out a mutable reference that lives for `'a`.
-        unsafe { &mut (*(container_of!(self.node_links, Node<K, V>, links).cast_mut())).value }
+        unsafe { &mut (*(container_of!(self.node_links, Node<K, V>, links))).value }
     }
 
     /// Remove this entry from the [`RBTree`].
@@ -1239,9 +1239,7 @@ pub fn remove_node(self) -> RBTreeNode<K, V> {
         RBTreeNode {
             // SAFETY: The node was a node in the tree, but we removed it, so we can convert it
             // back into a box.
-            node: unsafe {
-                KBox::from_raw(container_of!(self.node_links, Node<K, V>, links).cast_mut())
-            },
+            node: unsafe { KBox::from_raw(container_of!(self.node_links, Node<K, V>, links)) },
         }
     }
 
@@ -1272,8 +1270,7 @@ fn replace(self, node: RBTreeNode<K, V>) -> RBTreeNode<K, V> {
         // SAFETY:
         // - `self.node_ptr` produces a valid pointer to a node in the tree.
         // - Now that we removed this entry from the tree, we can convert the node to a box.
-        let old_node =
-            unsafe { KBox::from_raw(container_of!(self.node_links, Node<K, V>, links).cast_mut()) };
+        let old_node = unsafe { KBox::from_raw(container_of!(self.node_links, Node<K, V>, links)) };
 
         RBTreeNode { node: old_node }
     }

-- 
2.49.0

