Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBMwHdTxpWn6IAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 21:23:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0032E1DF42C
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 21:23:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378F310E171;
	Mon,  2 Mar 2026 20:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="XzsGhd6J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08B410E171
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 20:23:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772483020; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=elOjR+LXzlUoQl9A/87V3aOpmy9UOjpb6h5DoCO+C/6AvYVX4APFE4P7a69gi+VjnYhc66ps9aq/ovt2V075HiH1nqjHnxAtYrvJLgfNUKSXR/ftbvPYV7VoHzAX/uuFU6J3oPTeEQt/XsuYFbkM/ibyW8yee9cuUE5nRV0rx2s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772483020;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=2P7cKmxKTtUWza3HVGpYgBF0W5BOF4ADlghlq0nZnXo=; 
 b=CbtbxahovGTUufjc1ULbSGpG14RsXnZXgkuubT4Jq+vLs5q6uzMfDOGenSR4PkxuzD22DcR4RSgx5ccAIwXZMfp51AQVKl99Y8gh0a/0wqn4c68L17gR2dgBdndnpjuxwYhq5RI3Z0e5VOhKFelvbDYrhbk5/Ipsb5cPYSpTMSY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772483019; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=2P7cKmxKTtUWza3HVGpYgBF0W5BOF4ADlghlq0nZnXo=;
 b=XzsGhd6JzEaomip6IvKAw69y9ks/sbfzHz2ixJmCUj+Uk6vKjE2QEkfzKXGnbuRX
 9y0jCna7a7Y/tZv5fG5Bqg5MxYOaOxx7Yt4sd8hLHFgIbbDRwjFe0SrYfSjUfuvhWWm
 tptwW0UuZ1m4Z1mKzLxnmkY6wolo38wBAURkRfiM=
Received: by mx.zohomail.com with SMTPS id 1772483017282302.4406533457385;
 Mon, 2 Mar 2026 12:23:37 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com, aliceryhl@google.com,
 boris.brezillon@collabora.com,
 Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH] drm/tyr: Use DRM device type alias across driver
Date: Mon,  2 Mar 2026 12:23:31 -0800
Message-ID: <20260302202331.176140-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.52.0
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
X-Rspamd-Queue-Id: 0032E1DF42C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Currently Tyr defines a convenience type alias for its DRM device type,
`TyrDrmDevice` but it does not use the alias outside of `tyr/driver.rs`.

Replace `drm::Device<TyrDrmDriver>` with the alias `TyrDrmDevice` across
the driver.

This change will ease future upstream Tyr development by reducing the
diffs when multiple series are touching these files.

No functional changes are intended.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/file.rs | 7 +++++--
 drivers/gpu/drm/tyr/gem.rs  | 7 +++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
index 450be5ab9aaf..31411da203c5 100644
--- a/drivers/gpu/drm/tyr/file.rs
+++ b/drivers/gpu/drm/tyr/file.rs
@@ -7,7 +7,10 @@
     uapi, //
 };
 
-use crate::driver::TyrDrmDriver;
+use crate::driver::{
+    TyrDrmDevice,
+    TyrDrmDriver, //
+};
 
 #[pin_data]
 pub(crate) struct TyrDrmFileData {}
@@ -25,7 +28,7 @@ fn open(_dev: &drm::Device<Self::Driver>) -> Result<Pin<KBox<Self>>> {
 
 impl TyrDrmFileData {
     pub(crate) fn dev_query(
-        ddev: &drm::Device<TyrDrmDriver>,
+        ddev: &TyrDrmDevice,
         devquery: &mut uapi::drm_panthor_dev_query,
         _file: &TyrDrmFile,
     ) -> Result<u32> {
diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
index 514524ae07ef..5cd0cd9585e8 100644
--- a/drivers/gpu/drm/tyr/gem.rs
+++ b/drivers/gpu/drm/tyr/gem.rs
@@ -5,7 +5,10 @@
     prelude::*, //
 };
 
-use crate::driver::TyrDrmDriver;
+use crate::driver::{
+    TyrDrmDevice,
+    TyrDrmDriver, //
+};
 
 /// GEM Object inner driver data
 #[pin_data]
@@ -14,7 +17,7 @@ pub(crate) struct TyrObject {}
 impl gem::DriverObject for TyrObject {
     type Driver = TyrDrmDriver;
 
-    fn new(_dev: &kernel::drm::Device<TyrDrmDriver>, _size: usize) -> impl PinInit<Self, Error> {
+    fn new(_dev: &TyrDrmDevice, _size: usize) -> impl PinInit<Self, Error> {
         try_pin_init!(TyrObject {})
     }
 }

base-commit: 15da5bc9f3adab7242867db0251fe451ac3ddb72
-- 
2.52.0

