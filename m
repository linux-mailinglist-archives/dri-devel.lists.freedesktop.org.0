Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E918CA146
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 19:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0503010E68C;
	Mon, 20 May 2024 17:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IXUGSiwk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF8210E412
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 17:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716225880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R1uvJC2Mq9SvQNSQvh/w7bRnmCNYpn+qhaqdYh6qMzY=;
 b=IXUGSiwkwa+ebeM9b2p9a0Fe6A8xMODDbHDDkSm/AgPKSfEfX+4qYjUneXTs9nUApU5Gfn
 32X7TIb9iIeL/LPdqyGA79DOwLbfUbAux0+zxIIhSIyJnDQg4fuNjYrxiC0eVmMuQEGhFN
 tzhJpoHOQ5YxkRSoid81NF8LKm5+j4o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-tgWbKyw8MNesOeSax1Ys8w-1; Mon, 20 May 2024 13:24:39 -0400
X-MC-Unique: tgWbKyw8MNesOeSax1Ys8w-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-34d9deebf38so7323879f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 10:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716225878; x=1716830678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R1uvJC2Mq9SvQNSQvh/w7bRnmCNYpn+qhaqdYh6qMzY=;
 b=AueX/KW+5Of47F7oTiEblrmu0+kBc7E6vHxU/enALwja/vROcDgyn7MYTIMOZA0TgR
 1xzsX/ClBFN4TIKqCvVIi6OvX6A0f7+IosLh7ph3zsQDFSOfv3PZ67bChCV1MC8U3GYj
 4Jhe0uIBw/ovKplvCDdE1dvB6avLndonlWNOWLez1vbV2XPNI7HHAwU7sNsWUMyg7ZTa
 DE6Zt1EvScpnuqIksuwofpap3o8aolrCahswoujf4SGAfbUjnXGzAm3nDNW+zXedisRo
 7zTm7p57uV1l62K3OLZT2Ecs3MCr7Wa0C6/3QRvp/DSJfWqE1N7nFF52F+7Zz5Zv1Oes
 NCxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4hpSqsFdb9KNtsd/L0SnSdVfnGBjAxqizDdh0CjTWRIPE60WOrlv3ME2HEhST8aysIQ8hOGuhnrnsUIbwq5udf4d2TsvTf4W2wx6YK8pN
X-Gm-Message-State: AOJu0YyZDqnmqPwqeVp33zfkvmVTe2vkpPDZhhIWKE5MWyMXMRF8iLmV
 /fXmFmXh26RCp+zOtEDwUc3IrNwZrNiRecnK2iRQj/TGWicf1gG0z+9heCq+bJcpfCPhYiK/SmQ
 dBn6lgU7M8Mb2hmiQ7+OY5T31RIwRIJp4BY+yNtrgcF9RSgRiBBWW9q4L/u+OW44Mtg==
X-Received: by 2002:a05:6000:2a0d:b0:354:c786:ec45 with SMTP id
 ffacd0b85a97d-354c786ee7bmr4132800f8f.54.1716225877971; 
 Mon, 20 May 2024 10:24:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcWqcLANszjl04U+bkoNunNlSQySDkg7W2o6Ua7wxiL9y4ovZR1M87Rj5yMsP46zjxw1PslA==
X-Received: by 2002:a05:6000:2a0d:b0:354:c786:ec45 with SMTP id
 ffacd0b85a97d-354c786ee7bmr4132777f8f.54.1716225877632; 
 Mon, 20 May 2024 10:24:37 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b79bc6csm29555004f8f.21.2024.05.20.10.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 10:24:36 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, fujita.tomonori@gmail.com,
 lina@asahilina.net, pstanner@redhat.com, ajanulgu@redhat.com,
 lyude@redhat.com, gregkh@linuxfoundation.org
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [RFC PATCH 7/8] rust: add firmware abstractions
Date: Mon, 20 May 2024 19:24:19 +0200
Message-ID: <20240520172422.181763-4-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520172059.181256-1-dakr@redhat.com>
References: <20240520172059.181256-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

Add an abstraction around the kernels firmware API to request firmware
images. The abstraction provides functions to access the firmware
buffer and / or copy it to a new buffer allocated with a given allocator
backend.

The firmware is released once the abstraction is dropped.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/firmware.rs         | 74 +++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  1 +
 3 files changed, 76 insertions(+)
 create mode 100644 rust/kernel/firmware.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index b245db8d5a87..e4ffc47da5ec 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -14,6 +14,7 @@
 #include <kunit/test.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
+#include <linux/firmware.h>
 #include <linux/jiffies.h>
 #include <linux/mdio.h>
 #include <linux/pci.h>
diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
new file mode 100644
index 000000000000..700504fb3c9c
--- /dev/null
+++ b/rust/kernel/firmware.rs
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Firmware abstraction
+//!
+//! C header: [`include/linux/firmware.h`](../../../../include/linux/firmware.h")
+
+use crate::{bindings, device::Device, error::Error, error::Result, str::CStr, types::Opaque};
+
+/// Abstraction around a C firmware struct.
+///
+/// This is a simple abstraction around the C firmware API. Just like with the C API, firmware can
+/// be requested. Once requested the abstraction provides direct access to the firmware buffer as
+/// `&[u8]`. Alternatively, the firmware can be copied to a new buffer using `Firmware::copy`. The
+/// firmware is released once [`Firmware`] is dropped.
+///
+/// # Examples
+///
+/// ```
+/// let fw = Firmware::request("path/to/firmware.bin", dev.as_ref())?;
+/// driver_load_firmware(fw.data());
+/// ```
+pub struct Firmware(Opaque<*const bindings::firmware>);
+
+impl Firmware {
+    /// Send a firmware request and wait for it. See also `bindings::request_firmware`.
+    pub fn request(name: &CStr, dev: &Device) -> Result<Self> {
+        let fw = Opaque::uninit();
+
+        let ret = unsafe { bindings::request_firmware(fw.get(), name.as_char_ptr(), dev.as_raw()) };
+        if ret != 0 {
+            return Err(Error::from_errno(ret));
+        }
+
+        Ok(Firmware(fw))
+    }
+
+    /// Send a request for an optional fw module. See also `bindings::request_firmware_nowarn`.
+    pub fn request_nowarn(name: &CStr, dev: &Device) -> Result<Self> {
+        let fw = Opaque::uninit();
+
+        let ret = unsafe {
+            bindings::firmware_request_nowarn(fw.get(), name.as_char_ptr(), dev.as_raw())
+        };
+        if ret != 0 {
+            return Err(Error::from_errno(ret));
+        }
+
+        Ok(Firmware(fw))
+    }
+
+    /// Returns the size of the requested firmware in bytes.
+    pub fn size(&self) -> usize {
+        unsafe { (*(*self.0.get())).size }
+    }
+
+    /// Returns the requested firmware as `&[u8]`.
+    pub fn data(&self) -> &[u8] {
+        unsafe { core::slice::from_raw_parts((*(*self.0.get())).data, self.size()) }
+    }
+}
+
+impl Drop for Firmware {
+    fn drop(&mut self) {
+        unsafe { bindings::release_firmware(*self.0.get()) };
+    }
+}
+
+// SAFETY: `Firmware` only holds a pointer to a C firmware struct, which is safe to be used from any
+// thread.
+unsafe impl Send for Firmware {}
+
+// SAFETY: `Firmware` only holds a pointer to a C firmware struct, references to which are safe to
+// be used from any thread.
+unsafe impl Sync for Firmware {}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6415968ee3b8..ed97d131661a 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -35,6 +35,7 @@
 #[cfg(CONFIG_DRM = "y")]
 pub mod drm;
 pub mod error;
+pub mod firmware;
 pub mod init;
 pub mod ioctl;
 #[cfg(CONFIG_KUNIT)]
-- 
2.45.1

