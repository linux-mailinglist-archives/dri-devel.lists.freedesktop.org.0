Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDL1H+0ujWk/zwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 02:37:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34248129019
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 02:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CC410E6B8;
	Thu, 12 Feb 2026 01:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="AQDZ0NFp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBAA10E6B8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 01:37:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770860263; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=WENxZRI5ARoyOHmuXvQU51JK0V12y1bBm+Rfej7Rtb++SW6XXHcmBdsBQjuKMOas/ogpQaauDftF2N14W5v8Jlbq4YHw6eW1Jvh2oyeP5yj+h7ngmJ3Dw+PmFLnBh1T9hKLVoOmwzWp9u0jBo/Ebq7cN5AzhAXT8tgWpR3I8pQY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770860263;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=arvc3A7kVKOZImIISEA7QoPqP9daySKhh4Mbr1901II=; 
 b=Jr04evUz7aeXZaQP4XO4zmEtRG43SUbDz/T48xVuLHvBDvBe0dmri7cw2L+cM4eIh+REhWCh3Y9F9PA0GYTHtNtnQoGJx2o20CWWgh3tARckwIxPxLux410XYepfM6hCsSrT3HK7r/FqNsgCo69Kj5ROiQjFhboGMweInVHvDOs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770860263; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=arvc3A7kVKOZImIISEA7QoPqP9daySKhh4Mbr1901II=;
 b=AQDZ0NFpkkbnmbDpsM+P2kfrCD3+XD8+HGXrmYaEk/GnTXtB8D+wIhBs29c61wix
 36rPIYs/8niCAzZj5W16Z1Jttxi05mhEC97Yx1e9ayxE2PoVayylnROozVm9vMIhbhs
 HVl+Pgu1xiu7xetzajseADSdD2qfvAxMx62l2gQ0=
Received: by mx.zohomail.com with SMTPS id 1770860261379801.9602771459028;
 Wed, 11 Feb 2026 17:37:41 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com, aliceryhl@google.com,
 boris.brezillon@collabora.com, beata.michalska@arm.com, lyude@redhat.com,
 Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 06/12] drm/tyr: add shmem backing for GEM objects
Date: Wed, 11 Feb 2026 17:37:07 -0800
Message-ID: <20260212013713.304343-7-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212013713.304343-1-deborah.brouwer@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 34248129019
X-Rspamd-Action: no action

Add support for GEM buffer objects backed by shared memory.

This introduces the BoCreateArgs structure for passing creation parameters
including flags, and adds a flags field to BoData. A new_dummy_object()
helper is provided to create a dummy GEM object for use as a GPUVM root.

The Bo type alias is added to simplify working with Tyr's shmem-backed
GEM objects throughout the driver.

Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/gem.rs | 52 ++++++++++++++++++++++++++++++++------
 1 file changed, 44 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
index c1208d332dea..6a58f2da88d3 100644
--- a/drivers/gpu/drm/tyr/gem.rs
+++ b/drivers/gpu/drm/tyr/gem.rs
@@ -1,28 +1,64 @@
 // SPDX-License-Identifier: GPL-2.0 or MIT
+//! GEM buffer object management for the Tyr driver.
+//!
+//! This module provides buffer object (BO) management functionality using
+//! DRM's GEM subsystem with shmem backing.
 
 use kernel::{
     drm::{
         gem,
+        gem::shmem,
         DeviceContext, //
     },
-    prelude::*, //
+    prelude::*,
+    sync::aref::ARef, //
 };
 
-use crate::driver::TyrDrmDriver;
+use crate::driver::{
+    TyrDrmDevice,
+    TyrDrmDriver, //
+};
 
-/// GEM Object inner driver data
+/// Tyr's DriverObject type for GEM objects.
 #[pin_data]
-pub(crate) struct BoData {}
+pub(crate) struct BoData {
+    flags: u32,
+}
+
+/// Provides a way to pass arguments when creating BoData
+/// as required by the gem::DriverObject trait.
+pub(crate) struct BoCreateArgs {
+    flags: u32,
+}
 
 impl gem::DriverObject for BoData {
     type Driver = TyrDrmDriver;
-    type Args = ();
+    type Args = BoCreateArgs;
 
     fn new<Ctx: DeviceContext>(
-        _dev: &kernel::drm::Device<TyrDrmDriver, Ctx>,
+        _dev: &TyrDrmDevice<Ctx>,
         _size: usize,
-        _args: (),
+        args: BoCreateArgs,
     ) -> impl PinInit<Self, Error> {
-        try_pin_init!(BoData {})
+        try_pin_init!(Self { flags: args.flags })
     }
 }
+
+/// Type alias for Tyr GEM buffer objects.
+pub(crate) type Bo = gem::shmem::Object<BoData>;
+
+/// Creates a dummy GEM object to serve as the root of a GPUVM.
+#[expect(dead_code)]
+pub(crate) fn new_dummy_object<Ctx: DeviceContext>(ddev: &TyrDrmDevice<Ctx>) -> Result<ARef<Bo>> {
+    let bo = gem::shmem::Object::<BoData>::new(
+        ddev,
+        4096,
+        shmem::ObjectConfig {
+            map_wc: true,
+            parent_resv_obj: None,
+        },
+        BoCreateArgs { flags: 0 },
+    )?;
+
+    Ok(bo)
+}
-- 
2.52.0

