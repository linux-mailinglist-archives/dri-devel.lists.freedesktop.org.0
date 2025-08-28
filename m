Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB66B3AAD9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 21:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18F510EAA1;
	Thu, 28 Aug 2025 19:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hNdgAhox";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB4410E03A;
 Thu, 28 Aug 2025 19:24:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3A44144B14;
 Thu, 28 Aug 2025 19:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9843FC4CEF4;
 Thu, 28 Aug 2025 19:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756409046;
 bh=kj+qLm0IXzBNLGOLwFFX+4io3j7Sj5+HCcStzPHPSGs=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=hNdgAhoxWwknjnIsOl6bj/01t3BMYMxbdCsAMIsJZjJo0JjARFbexVpIEGRnSPY/F
 /r9ZjrUUNZ5y49NVQTcwAZrB1imTan3iXHIlnm3NFs03jeJkEZO31u+xWQVLAXG1/D
 ov8tyFg6exfTDdOp70wNjoPqHDN6DK/PsXdm5pGmlZOxafH9LQYNVOLFM7+C5+OdKI
 nc9WYr+26ERVttMoHozmm8iQXvQgWsQJXjyrhSVHX6aIv5GQsSrReRg9+MlZdAEseS
 vpTslNNMrKuuMhE+3t/vY/YXSjQhvW34o1g+JMo2KR26LqJMN3MbiUxpS+7M1lkqtM
 VD4GJ72nvi6Gw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 Aug 2025 21:24:02 +0200
Message-Id: <DCEB1J2P3MZS.3IGXEYP0MAC5H@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Miguel Ojeda" <ojeda@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: gpu: nova-core: arm32 build errors
References: <20250828160247.37492-1-ojeda@kernel.org>
 <b680c343-ba97-4eb4-b426-56e318dce492@kernel.org>
In-Reply-To: <b680c343-ba97-4eb4-b426-56e318dce492@kernel.org>
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

On Thu Aug 28, 2025 at 7:54 PM CEST, Danilo Krummrich wrote:
> On 8/28/25 6:02 PM, Miguel Ojeda wrote:
>> Similar to another one I sent, I hope it helps -- it may be useful to ma=
ke it
>> build in 32-bit as a test for those kinds of platforms.
>
> Agreed.

Maybe I spoke too soon, it's actually pretty painful to keep 32-bit
compatibility, even though it would be nice for testing purposes.

I'll paste the diff to fix it below, I think that makes it obvious why I sa=
y
that.

Instead, we should really just depend on CONFIG_64BIT (which implies
ARCH_DMA_ADDR_T_64BIT).

--

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon=
.rs
index 50437c67c14a..e6a22834e317 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -466,7 +466,7 @@ fn dma_wr<F: FalconFirmware<Target =3D E>>(
             .set_base((dma_start >> 8) as u32)
             .write(bar, E::BASE);
         regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
-            .set_base((dma_start >> 40) as u16)
+            .set_base((dma_start.checked_shr(40).unwrap_or(0)) as u16)
             .write(bar, E::BASE);

         let cmd =3D regs::NV_PFALCON_FALCON_DMATRFCMD::default()
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal=
.rs
index 2f914948bb9a..710491ee445a 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0

+use kernel::bindings::dma_addr_t as DmaAddress;
 use kernel::prelude::*;

 use crate::driver::Bar0;
@@ -11,12 +12,12 @@

 pub(crate) trait FbHal {
     /// Returns the address of the currently-registered sysmem flush page.
-    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64;
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> DmaAddress;

     /// Register `addr` as the address of the sysmem flush page.
     ///
     /// This might fail if the address is too large for the receiving regi=
ster.
-    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result;
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: DmaAddress) -> Res=
ult;

     /// Returns `true` is display is supported.
     fn supports_display(&self, bar: &Bar0) -> bool;
diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-core/=
fb/hal/ga100.rs
index 871c42bf033a..c4ae172b4ed4 100644
--- a/drivers/gpu/nova-core/fb/hal/ga100.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
@@ -2,6 +2,7 @@

 struct Ga100;

+use kernel::bindings::dma_addr_t as DmaAddress;
 use kernel::prelude::*;

 use crate::driver::Bar0;
@@ -10,13 +11,22 @@

 use super::tu102::FLUSH_SYSMEM_ADDR_SHIFT;

-pub(super) fn read_sysmem_flush_page_ga100(bar: &Bar0) -> u64 {
-    u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::read(bar).adr_39_08()) =
<< FLUSH_SYSMEM_ADDR_SHIFT
+pub(super) fn read_sysmem_flush_page_ga100(bar: &Bar0) -> DmaAddress {
+    let addr =3D u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::read(bar).=
adr_39_08())
+        << FLUSH_SYSMEM_ADDR_SHIFT
         | u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::read(bar).adr_=
63_40())
-            << FLUSH_SYSMEM_ADDR_SHIFT_HI
+            << FLUSH_SYSMEM_ADDR_SHIFT_HI;
+
+    addr.try_into().unwrap_or_else(|_| {
+        kernel::warn_on!(true);
+
+        0
+    })
 }

-pub(super) fn write_sysmem_flush_page_ga100(bar: &Bar0, addr: u64) {
+pub(super) fn write_sysmem_flush_page_ga100(bar: &Bar0, addr: DmaAddress) =
{
+    let addr =3D Into::<u64>::into(addr);
+
     regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::default()
         .set_adr_63_40((addr >> FLUSH_SYSMEM_ADDR_SHIFT_HI) as u32)
         .write(bar);
@@ -34,11 +44,11 @@ pub(super) fn display_enabled_ga100(bar: &Bar0) -> bool=
 {
 const FLUSH_SYSMEM_ADDR_SHIFT_HI: u32 =3D 40;

 impl FbHal for Ga100 {
-    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> DmaAddress {
         read_sysmem_flush_page_ga100(bar)
     }

-    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: DmaAddress) -> Res=
ult {
         write_sysmem_flush_page_ga100(bar, addr);

         Ok(())
diff --git a/drivers/gpu/nova-core/fb/hal/ga102.rs b/drivers/gpu/nova-core/=
fb/hal/ga102.rs
index a73b77e39715..271dfd522b3c 100644
--- a/drivers/gpu/nova-core/fb/hal/ga102.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0

+use kernel::bindings::dma_addr_t as DmaAddress;
 use kernel::prelude::*;

 use crate::driver::Bar0;
@@ -13,11 +14,11 @@ fn vidmem_size_ga102(bar: &Bar0) -> u64 {
 struct Ga102;

 impl FbHal for Ga102 {
-    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> DmaAddress {
         super::ga100::read_sysmem_flush_page_ga100(bar)
     }

-    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: DmaAddress) -> Res=
ult {
         super::ga100::write_sysmem_flush_page_ga100(bar, addr);

         Ok(())
diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-core/=
fb/hal/tu102.rs
index b022c781caf4..157342411596 100644
--- a/drivers/gpu/nova-core/fb/hal/tu102.rs
+++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
@@ -3,17 +3,28 @@
 use crate::driver::Bar0;
 use crate::fb::hal::FbHal;
 use crate::regs;
+
+use kernel::bindings::dma_addr_t as DmaAddress;
 use kernel::prelude::*;

 /// Shift applied to the sysmem address before it is written into `NV_PFB_=
NISO_FLUSH_SYSMEM_ADDR`,
 /// to be used by HALs.
 pub(super) const FLUSH_SYSMEM_ADDR_SHIFT: u32 =3D 8;

-pub(super) fn read_sysmem_flush_page_gm107(bar: &Bar0) -> u64 {
-    u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::read(bar).adr_39_08()) =
<< FLUSH_SYSMEM_ADDR_SHIFT
+pub(super) fn read_sysmem_flush_page_gm107(bar: &Bar0) -> DmaAddress {
+    let addr =3D u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::read(bar).=
adr_39_08())
+        << FLUSH_SYSMEM_ADDR_SHIFT;
+
+    addr.try_into().unwrap_or_else(|_| {
+        kernel::warn_on!(true);
+
+        0
+    })
 }

-pub(super) fn write_sysmem_flush_page_gm107(bar: &Bar0, addr: u64) -> Resu=
lt {
+pub(super) fn write_sysmem_flush_page_gm107(bar: &Bar0, addr: DmaAddress) =
-> Result {
+    let addr =3D Into::<u64>::into(addr);
+
     // Check that the address doesn't overflow the receiving 32-bit regist=
er.
     if addr >> (u32::BITS + FLUSH_SYSMEM_ADDR_SHIFT) =3D=3D 0 {
         regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
@@ -37,11 +48,11 @@ pub(super) fn vidmem_size_gp102(bar: &Bar0) -> u64 {
 struct Tu102;

 impl FbHal for Tu102 {
-    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> DmaAddress {
         read_sysmem_flush_page_gm107(bar)
     }

-    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: DmaAddress) -> Res=
ult {
         write_sysmem_flush_page_gm107(bar, addr)
     }

