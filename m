Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAlTOGocpmmeKQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 00:25:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FA41E69C5
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 00:25:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C5E10E600;
	Mon,  2 Mar 2026 23:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="A/Vs6wzf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A28110E5F7
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 23:25:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772493919; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mEwmkm2f8JnbUahmYXx8Swf7b71UURStnqDPmxMfFUO1iXIj5HsUZmLnY1qxBNu7X/U85dKFSGkiI/XBgs4kPLecXhZ5uT6hlNoemuVxu2oozxWuHuVPuWrQP67y9Q8Pxf9lqfsQtm39qCrZchPyX6byiwWsnydDQ86Gxi4s1t0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772493919;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=aBbHOBSXTeliGOU5Oc0Kzn4Z7GZaOQcKGVXuhvfgw/A=; 
 b=XE6iDgkIVwzz4tOKYHXfy46hS3tV/P8so/0p3yuosVUsYxOVTHn2jHROipxaGbq1r6TXZXE5UiGjELTX7oSuHoqCX/1oMHX8ihjGtNlLunwSa7wECG6ARo06LpdidQsuWT0yaAI/Du9c4BuBP5PxMpSXx7wfnGSuthXzCOW2k4w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772493919; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=aBbHOBSXTeliGOU5Oc0Kzn4Z7GZaOQcKGVXuhvfgw/A=;
 b=A/Vs6wzfFj+i4f6dvg0NaCKQqZR85JDV9Rm0rSb/Qt5YnAcSH/tb9phRJRJZ8l7e
 Ck94dph44+7lKvPKL0nndAU5l8BTR+AwdhTkQIWtUJtdVTrdu+zvYg7z/SwZjBzXSBQ
 xPR2gVBqDVy5ltrdSOWVE91hFLSwpBgJ8SLgbwog=
Received: by mx.zohomail.com with SMTPS id 1772493917436159.6550940802922;
 Mon, 2 Mar 2026 15:25:17 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com, aliceryhl@google.com,
 boris.brezillon@collabora.com, beata.michalska@arm.com, lyude@redhat.com,
 work@onurozkan.dev, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 10/12] drm/tyr: add a kernel buffer object
Date: Mon,  2 Mar 2026 15:24:58 -0800
Message-ID: <20260302232500.244489-11-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260302232500.244489-1-deborah.brouwer@collabora.com>
References: <20260302232500.244489-1-deborah.brouwer@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 91FA41E69C5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Introduce a buffer object type (KernelBo) for internal driver allocations
that are managed by the kernel rather than userspace.

KernelBo wraps a GEM shmem object and automatically handles GPU virtual
address space mapping during creation and unmapping on drop. This provides
a safe and convenient way for the driver to both allocate and clean up
internal buffers for kernel-managed resources.

Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
Changes in v2:
- Add documentation.
- Add allocation strategy option for kernel buffer objects.

 drivers/gpu/drm/tyr/gem.rs | 119 ++++++++++++++++++++++++++++++++++---
 1 file changed, 112 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
index 111acf33993f..f3bb58ef5eae 100644
--- a/drivers/gpu/drm/tyr/gem.rs
+++ b/drivers/gpu/drm/tyr/gem.rs
@@ -4,6 +4,8 @@
 //! This module provides buffer object (BO) management functionality using
 //! DRM's GEM subsystem with shmem backing.
 
+use core::ops::Range;
+
 use kernel::{
     drm::{
         gem,
@@ -11,23 +13,41 @@
         DeviceContext, //
     },
     prelude::*,
-    sync::aref::ARef, //
+    sync::{
+        aref::ARef,
+        Arc,
+        ArcBorrow, //
+    },
 };
 
-use crate::driver::{
-    TyrDrmDevice,
-    TyrDrmDriver, //
+use crate::{
+    driver::{
+        TyrDrmDevice,
+        TyrDrmDriver, //
+    },
+    vm::{
+        Vm,
+        VmMapFlags, //
+    },
 };
 
-/// Tyr's DriverObject type for GEM objects.
+/// Driver-specific data for Tyr GEM buffer objects.
+///
+/// This structure contains Tyr-specific metadata associated with each GEM object.
+/// It implements [`gem::DriverObject`] to provide driver-specific behavior for
+/// buffer object creation and management.
 #[pin_data]
 pub(crate) struct BoData {
+    /// Buffer object creation flags (currently unused).
     flags: u32,
 }
 
-/// Provides a way to pass arguments when creating BoData
-/// as required by the gem::DriverObject trait.
+/// Arguments for creating a [`BoData`] instance.
+///
+/// This structure is used to pass creation parameters when instantiating
+/// a new buffer object, as required by the [`gem::DriverObject`] trait.
 pub(crate) struct BoCreateArgs {
+    /// Buffer object creation flags (currently unused).
     flags: u32,
 }
 
@@ -35,6 +55,12 @@ impl gem::DriverObject for BoData {
     type Driver = TyrDrmDriver;
     type Args = BoCreateArgs;
 
+    /// Constructs a new [`BoData`] instance for a GEM object.
+    ///
+    /// This function is called by the GEM subsystem when creating a new buffer
+    /// object. It initializes the driver-specific data with the provided flags.
+    /// The device and size parameters are currently unused but required by the
+    /// [`gem::DriverObject`] trait.
     fn new<Ctx: DeviceContext>(
         _dev: &TyrDrmDevice<Ctx>,
         _size: usize,
@@ -61,3 +87,82 @@ pub(crate) fn new_dummy_object<Ctx: DeviceContext>(ddev: &TyrDrmDevice<Ctx>) ->
 
     Ok(bo)
 }
+
+/// VA allocation strategy for kernel buffer objects.
+///
+/// Specifies how the GPU virtual address should be determined when creating
+/// a [`KernelBo`]. An automatic VA allocation strategy will be added in the future.
+pub(crate) enum KernelBoVaAlloc {
+    /// Explicit VA address specified by the caller.
+    #[expect(dead_code)]
+    Explicit(u64),
+}
+
+/// A kernel-owned buffer object with automatic GPU virtual address mapping.
+///
+/// This structure represents a buffer object that is created and managed entirely
+/// by the kernel driver, as opposed to userspace-created GEM objects. It combines
+/// a GEM object with automatic GPU virtual address (VA) space mapping and cleanup.
+///
+/// When dropped, the buffer is automatically unmapped from the GPU VA space.
+pub(crate) struct KernelBo {
+    /// The underlying GEM buffer object.
+    #[expect(dead_code)]
+    pub(crate) bo: ARef<Bo>,
+    /// The GPU VM this buffer is mapped into.
+    vm: Arc<Vm>,
+    /// The GPU VA range occupied by this buffer.
+    va_range: Range<u64>,
+}
+
+impl KernelBo {
+    /// Creates a new kernel-owned buffer object and maps it into GPU VA space.
+    ///
+    /// This function allocates a new shmem-backed GEM object and immediately maps
+    /// it into the specified GPU virtual memory space. The mapping is automatically
+    /// cleaned up when the [`KernelBo`] is dropped.
+    #[expect(dead_code)]
+    pub(crate) fn new<Ctx: DeviceContext>(
+        ddev: &TyrDrmDevice<Ctx>,
+        vm: ArcBorrow<'_, Vm>,
+        size: u64,
+        va_alloc: KernelBoVaAlloc,
+        flags: VmMapFlags,
+    ) -> Result<Self> {
+        let KernelBoVaAlloc::Explicit(va) = va_alloc;
+
+        let bo = gem::shmem::Object::<BoData>::new(
+            ddev,
+            size as usize,
+            shmem::ObjectConfig {
+                map_wc: true,
+                parent_resv_obj: None,
+            },
+            BoCreateArgs { flags: 0 },
+        )?;
+
+        vm.map_bo_range(&bo, 0, size, va, flags)?;
+
+        Ok(KernelBo {
+            bo,
+            vm: vm.into(),
+            va_range: va..(va + size),
+        })
+    }
+}
+
+impl Drop for KernelBo {
+    fn drop(&mut self) {
+        let va = self.va_range.start;
+        let size = self.va_range.end - self.va_range.start;
+
+        if let Err(e) = self.vm.unmap_range(va, size) {
+            pr_err!(
+                "Failed to unmap KernelBo range {:#x}..{:#x}: {:?}\n",
+                self.va_range.start,
+                self.va_range.end,
+                e
+            );
+        }
+    }
+}
-- 
2.52.0

