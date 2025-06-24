Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7E3AE662E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 15:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E8910E5A2;
	Tue, 24 Jun 2025 13:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vJzSrMNA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1528610E5A0;
 Tue, 24 Jun 2025 13:23:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1D23A5C6635;
 Tue, 24 Jun 2025 13:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8398C4CEE3;
 Tue, 24 Jun 2025 13:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750771421;
 bh=h5Vf97QwxyKe+yNcylMxZVkNtzsYZhyma36/1ByXmx4=;
 h=From:To:Cc:Subject:Date:From;
 b=vJzSrMNAr9Jc4JZbyJQ6rYcH/6DEeHiMszr2ub56ROFugcPjN40yBcZ2SCll0sYu5
 0NjHeRrBLD9hTmKJryDOoAN6ZIlGUgVetyn0WYe3G/E0XBFjXz+x3dTwfqAvbTo7JY
 sAcgl9K+zYys3ftWuOgeDp5/pCx9yMBjgqkPfWiY+WJgjNPYc11oloXllP3s2yfJIB
 R7WBOWG5segbIgyUoBSTDgPzAHg2cy3fWPu88lnh/sFeTMwQN0d5vvWPtzokdfkQHP
 RUo2AZCOiids3WBc8AQVFRRKnZUYoV45r8kj4SO77Hh3b8sRZBiTt5m32a3UriPFfU
 Koz9bpMqMHlUw==
From: Danilo Krummrich <dakr@kernel.org>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH 1/2] gpu: nova-core: impl From for u32 for enums used from
 register!
Date: Tue, 24 Jun 2025 15:23:22 +0200
Message-ID: <20250624132337.2242-1-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
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

Implement From for u32 for all enum types used within the register!()
macro.

This avoids a conflict with [1] as reported in [2].

Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/r/20250615-ptr-as-ptr-v12-5-f43b024581e8@gmail.com [1]
Link: https://lore.kernel.org/all/20250624173114.3be38990@canb.auug.org.au/ [2]
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/falcon.rs | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 07be1c30668c..1affffb109ec 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -20,6 +20,16 @@
 mod hal;
 pub(crate) mod sec2;
 
+macro_rules! impl_from_enum_to_u32 {
+    ($enum_type:ty) => {
+        impl From<$enum_type> for u32 {
+            fn from(value: $enum_type) -> Self {
+                value as u32
+            }
+        }
+    };
+}
+
 /// Revision number of a falcon core, used in the [`crate::regs::NV_PFALCON_FALCON_HWCFG1`]
 /// register.
 #[repr(u8)]
@@ -34,6 +44,7 @@ pub(crate) enum FalconCoreRev {
     Rev6 = 6,
     Rev7 = 7,
 }
+impl_from_enum_to_u32!(FalconCoreRev);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconCoreRev {
@@ -68,6 +79,7 @@ pub(crate) enum FalconCoreRevSubversion {
     Subversion2 = 2,
     Subversion3 = 3,
 }
+impl_from_enum_to_u32!(FalconCoreRevSubversion);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconCoreRevSubversion {
@@ -102,6 +114,7 @@ pub(crate) enum FalconSecurityModel {
     /// High-Secure: runs signed code with full privileges. Signature is validated by boot ROM.
     Heavy = 3,
 }
+impl_from_enum_to_u32!(FalconSecurityModel);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconSecurityModel {
@@ -130,6 +143,7 @@ pub(crate) enum FalconModSelAlgo {
     #[default]
     Rsa3k = 1,
 }
+impl_from_enum_to_u32!(FalconModSelAlgo);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconModSelAlgo {
@@ -151,6 +165,7 @@ pub(crate) enum DmaTrfCmdSize {
     #[default]
     Size256B = 0x6,
 }
+impl_from_enum_to_u32!(DmaTrfCmdSize);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for DmaTrfCmdSize {
@@ -173,6 +188,7 @@ pub(crate) enum PeregrineCoreSelect {
     /// RISC-V core is active.
     Riscv = 1,
 }
+impl_from_enum_to_u32!(PeregrineCoreSelect);
 
 impl From<bool> for PeregrineCoreSelect {
     fn from(value: bool) -> Self {
@@ -203,6 +219,7 @@ pub(crate) enum FalconFbifTarget {
     /// Non-coherent system memory.
     NoncoherentSysmem = 2,
 }
+impl_from_enum_to_u32!(FalconFbifTarget);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconFbifTarget {
@@ -229,6 +246,7 @@ pub(crate) enum FalconFbifMemType {
     /// Physical memory addresses.
     Physical = 1,
 }
+impl_from_enum_to_u32!(FalconFbifMemType);
 
 /// Conversion from a single-bit register field.
 impl From<bool> for FalconFbifMemType {

base-commit: 3606620b316c29e3de8ff87b40828c722086a9c9
-- 
2.49.0

