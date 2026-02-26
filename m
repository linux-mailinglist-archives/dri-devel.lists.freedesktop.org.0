Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wF92DwxqoGk3jgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 16:43:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9C71A8FC8
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 16:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A1A10E98C;
	Thu, 26 Feb 2026 15:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="O31xLEWm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 385 seconds by postgrey-1.36 at gabe;
 Thu, 26 Feb 2026 15:43:03 UTC
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com
 [91.218.175.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDFA10E98C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 15:43:03 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1772120196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=51ZMPK39d+NqCAdM+A9eB7m2u+Sa269r3UqA289rv3k=;
 b=O31xLEWmBexQsCGYnLe9WSf32tptm7eW7oZKcx3KH7bYyHz+PQaSHJRyJAPR6gnLnaAoYh
 DjM7JCIGc8Zj9sJ85QM4XJz1d/4dnyokf7wauSlV63MVhfMYa4/WGIwc6p1EXiffAxYGIr
 Mnqjyqmp4UYKNlrnp7DCGEWjz5B9O5k=
From: Artem Lytkin <artem.lytkin@linux.dev>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/tyr: read all four texture_features registers
Date: Thu, 26 Feb 2026 18:36:09 +0300
Message-ID: <20260226153609.8745-1-artem.lytkin@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[artem.lytkin@linux.dev,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AB9C71A8FC8
X-Rspamd-Action: no action


Read GPU_TEXTURE_FEATURES registers 1 through 3 in addition to
register 0, matching the C Panthor driver's behavior. Previously only
texture_features[0] was read from hardware while [1], [2], and [3]
were hardcoded to zero.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/gpu/drm/tyr/gpu.rs  | 10 +++++++---
 drivers/gpu/drm/tyr/regs.rs |  3 +++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index 6c582910dd5d..480cad86a602 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -58,7 +58,12 @@ pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<Self> {
         let thread_max_barrier_size = regs::GPU_THREAD_MAX_BARRIER_SIZE.read(dev, iomem)?;
         let coherency_features = regs::GPU_COHERENCY_FEATURES.read(dev, iomem)?;
 
-        let texture_features = regs::GPU_TEXTURE_FEATURES0.read(dev, iomem)?;
+        let texture_features = [
+            regs::GPU_TEXTURE_FEATURES0.read(dev, iomem)?,
+            regs::GPU_TEXTURE_FEATURES1.read(dev, iomem)?,
+            regs::GPU_TEXTURE_FEATURES2.read(dev, iomem)?,
+            regs::GPU_TEXTURE_FEATURES3.read(dev, iomem)?,
+        ];
 
         let as_present = regs::GPU_AS_PRESENT.read(dev, iomem)?;
 
@@ -86,8 +91,7 @@ pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<Self> {
             thread_max_workgroup_size,
             thread_max_barrier_size,
             coherency_features,
-            // TODO: Add texture_features_{1,2,3}.
-            texture_features: [texture_features, 0, 0, 0],
+            texture_features,
             as_present,
             pad0: 0,
             shader_present,
diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
index f46933aaa221..b51e09fe2fc4 100644
--- a/drivers/gpu/drm/tyr/regs.rs
+++ b/drivers/gpu/drm/tyr/regs.rs
@@ -67,6 +67,9 @@ pub(crate) fn write(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>, value: u3
 pub(crate) const GPU_THREAD_MAX_WORKGROUP_SIZE: Register<0xa4> = Register;
 pub(crate) const GPU_THREAD_MAX_BARRIER_SIZE: Register<0xa8> = Register;
 pub(crate) const GPU_TEXTURE_FEATURES0: Register<0xb0> = Register;
+pub(crate) const GPU_TEXTURE_FEATURES1: Register<0xb4> = Register;
+pub(crate) const GPU_TEXTURE_FEATURES2: Register<0xb8> = Register;
+pub(crate) const GPU_TEXTURE_FEATURES3: Register<0xbc> = Register;
 pub(crate) const GPU_SHADER_PRESENT_LO: Register<0x100> = Register;
 pub(crate) const GPU_SHADER_PRESENT_HI: Register<0x104> = Register;
 pub(crate) const GPU_TILER_PRESENT_LO: Register<0x110> = Register;
-- 
2.43.0

