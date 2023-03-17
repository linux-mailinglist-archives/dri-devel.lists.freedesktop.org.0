Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEAE6BE8FF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 13:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E58310EF02;
	Fri, 17 Mar 2023 12:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE8B10EF02
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 12:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YVEnRR/qQQunfEktPJrIHOIoV5MpZURwVPi1B2rMWCI=; b=OPvgHMMGoOZU3zXOpaM4pBey5G
 lS1U4yJN8OV/Lq66djgyDIp4Lkv8Znz98tj0VywYzEv8cU4RyFS/MW1AcRMuQrF8OlrnvOse4pldd
 o/YBs7Yh2HR/Ms2H5X4+OJSplA1MGwBD3lfKeo0sDZKJv4RbetINeL1RWYYbbmaU645frSoNVtS0f
 4lLRn91LffP/PWa4pFx+prp6DVAHflGevnAC9FXcmdUIpE1JeVTT5yku/ImTE38/fhTNN75QYKPNs
 /3I4jXkh8YBX+BoVM1bcdVl/tLB5sqkXTynA9/P3/nySvwqOAJ3GLpn5DcKr9d5CMESy04whhvk7A
 a091Rouw==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pd8xq-00FrGz-Mz; Fri, 17 Mar 2023 13:13:43 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Asahi Lina <lina@asahilina.net>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: [RFC PATCH 8/9] drm/rustgem: implement timeout to prevent hangs
Date: Fri, 17 Mar 2023 09:12:12 -0300
Message-Id: <20230317121213.93991-9-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230317121213.93991-1-mcanal@igalia.com>
References: <20230317121213.93991-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to prevent possible hangs, if the fence is not signaled for
more than 10 seconds, force the fence to expire by being signaled.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/rustgem/fence.rs | 31 +++++++++++++++++++++++++++++--
 drivers/gpu/drm/rustgem/file.rs  |  7 +++++++
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rustgem/fence.rs b/drivers/gpu/drm/rustgem/fence.rs
index 9ef1399548e2..eb1d7faa7e8e 100644
--- a/drivers/gpu/drm/rustgem/fence.rs
+++ b/drivers/gpu/drm/rustgem/fence.rs
@@ -2,10 +2,13 @@
 
 use core::fmt::Write;
 use core::ops::Deref;
-use kernel::c_str;
+use core::time::Duration;
 use kernel::dma_fence::*;
 use kernel::prelude::*;
 use kernel::sync::Arc;
+use kernel::time::timer::*;
+use kernel::time::*;
+use kernel::{bindings, c_str, timer_init};
 
 static QUEUE_NAME: &CStr = c_str!("vgem_fence");
 static QUEUE_CLASS_KEY: kernel::sync::LockClassKey = kernel::sync::LockClassKey::new();
@@ -36,6 +39,7 @@ impl FenceOps for Fence {
 
 pub(crate) struct VgemFence {
     fence: Arc<UniqueFence<Fence>>,
+    _timer: Box<FnTimer<Box<dyn FnMut() -> Result<Next> + Sync>>>,
 }
 
 impl VgemFence {
@@ -43,7 +47,30 @@ impl VgemFence {
         let fence_ctx = FenceContexts::new(1, QUEUE_NAME, &QUEUE_CLASS_KEY)?;
         let fence = Arc::try_new(fence_ctx.new_fence(0, Fence {})?)?;
 
-        Ok(Self { fence })
+        // SAFETY: The caller calls [`FnTimer::init_timer`] before using the timer.
+        let t = Box::try_new(unsafe {
+            FnTimer::new(Box::try_new({
+                let fence = fence.clone();
+                move || {
+                    let _ = fence.signal();
+                    Ok(Next::Done)
+                }
+            })? as Box<_>)
+        })?;
+
+        // SAFETY: As FnTimer is inside a Box, it won't be moved.
+        let ptr = unsafe { core::pin::Pin::new_unchecked(&*t) };
+
+        timer_init!(ptr, 0, "vgem_timer");
+
+        // SAFETY: Duration.as_millis() returns a valid total number of whole milliseconds.
+        let timeout =
+            unsafe { bindings::msecs_to_jiffies(Duration::from_secs(10).as_millis().try_into()?) };
+
+        // We force the fence to expire within 10s to prevent driver hangs
+        ptr.raw_timer().schedule_at(jiffies_later(timeout));
+
+        Ok(Self { fence, _timer: t })
     }
 }
 
diff --git a/drivers/gpu/drm/rustgem/file.rs b/drivers/gpu/drm/rustgem/file.rs
index 2552c7892b0e..a3714e8ca206 100644
--- a/drivers/gpu/drm/rustgem/file.rs
+++ b/drivers/gpu/drm/rustgem/file.rs
@@ -33,6 +33,10 @@ impl File {
     /// via the dma-buf reservation object and visible to consumers of the exported
     /// dma-buf.
     ///
+    /// This returns the handle for the new fence that must be signaled within 10
+    /// seconds (or otherwise it will automatically expire). See
+    /// signal (DRM_IOCTL_VGEM_FENCE_SIGNAL).
+    ///
     /// If the vGEM handle does not exist, attach returns -ENOENT.
     ///
     pub(crate) fn attach(
@@ -84,6 +88,9 @@ impl File {
     /// Signal and consume a fence earlier attached to a vGEM handle using
     /// attach (DRM_IOCTL_VGEM_FENCE_ATTACH).
     ///
+    /// All fences must be signaled within 10s of attachment or otherwise they
+    /// will automatically expire (and signal returns -ETIMEDOUT).
+    ///
     /// Signaling a fence indicates to all consumers of the dma-buf that the
     /// client has completed the operation associated with the fence, and that the
     /// buffer is then ready for consumption.
-- 
2.39.2

