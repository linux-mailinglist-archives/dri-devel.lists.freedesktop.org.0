Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E6EBD1A38
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 08:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6C110E3B8;
	Mon, 13 Oct 2025 06:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WP7xW64T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010019.outbound.protection.outlook.com [52.101.61.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C9310E3B8;
 Mon, 13 Oct 2025 06:21:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D6qRumfPjKHFVHBhSIxBWYxHGLHpgivHgxCnUlG3IAU065abHUwb+D5HfgWB91v1TaN7BBfsEhck7soWu9lGEEGoPYeYarBZUMtjAV2Vtt4pEO7+l3JdMCMz4HbCmMbWVpa1861SN8l9MFd6TOEp6D89sAnQXMU7/aHCwjwTkti9BV0r+rQagGDF9tlDR+LHzLzDyjty9iw1L9lKQGoS0FpMWqXOrua1Hb5reQoY3fr9qUlOF4WxELPQXwlPL+JuCJNurG1VetgzqMYI7Pc3OwFezZDJgTyyMqf9nt9MpChpgAITq4RhB+ytBt9dBdhfIHrPN/rr3pCmLTmVd9xwwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HrsBoLXeh8/z2S2xIQFjHEKI1CrDNvW5IC0FLs0gUZA=;
 b=WMaoWHtYM1Jeu+fTsaG7L7Vo6+8YsVrG8i26nA3pi/K3jbLUEuitXCUov2YmI/wg8pS92vUPRXXIBDooaA/Zg9HS8vcNh2ya0Vkmetl222C+BmXWCJuihPm7aFDoQWFEomPG+YRGzDRUOjYdnNd3jrcTFq0Ct1h2Oj4fvSzYTH8fJCALHLo59qUXpU+AeKGH/GoDbZBBvvXHzQer8tKfRrHA9vTV+k3Y3EVcg8y6xiQ4XbaG9TCwVB6wHfv8inNpzyZEpAlf2qT+7zLnrJzQW8RkwKqP1unpn0Q94Xcivu2kOU8D5SPfNRJgkg/ZYyd+ud0+/b6ZmU4UhT890GDcHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrsBoLXeh8/z2S2xIQFjHEKI1CrDNvW5IC0FLs0gUZA=;
 b=WP7xW64TNPIIYr9pNpXhEo0D8Wvlyu/oSShiEVbwJHFTfVajqcPR3aGZyyk0rufzzTUvY/mrf/A3U/6fdPj3VpnxBbUVA514SEREXA+ggzudxSaFsk8Cj6unLsvV0Ld1ecneW0SPmkIVdpfpvh8iPDVvD6iDFDaXu8nRbvwbqV3ShpSBjwU9bYW2K3aXEcC+JHMUqgzJi0l/+kHugYwbfRXuiQMa/5yLtJFZD0yJebZYAMqq3zOx5gZlNlTY2f5B4RQoOzxpHEm2W8juxIEKokSuhV/UdDaGUpN9PEuvVJ+4k+nGZxf6PJTKHjxfLOU5RFhe7Hf1whU5dcuw5DEjaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS0PR12MB8218.namprd12.prod.outlook.com (2603:10b6:8:f2::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.13; Mon, 13 Oct 2025 06:21:55 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 06:21:55 +0000
From: Alistair Popple <apopple@nvidia.com>
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Subject: [PATCH v5 14/14] nova-core: gsp: Boot GSP
Date: Mon, 13 Oct 2025 17:20:40 +1100
Message-ID: <20251013062041.1639529-15-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251013062041.1639529-1-apopple@nvidia.com>
References: <20251013062041.1639529-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0022.ausprd01.prod.outlook.com
 (2603:10c6:10:1f9::14) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS0PR12MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: 5353eb66-d795-4840-817a-08de0a20ce81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JYi4AmBp2YgV2zF+3UYiirGmQ1AjNSluQbXUgOYF3Lgz6GROasIY8lotn4q0?=
 =?us-ascii?Q?QbqRTGNVUuPOwGg6QC0vlLAshIHUS82rMN3/NpAEwpOSjLROT4QrQPF1UujO?=
 =?us-ascii?Q?a3eXehKn8ML5sSIbkQWsZ+kIraHP6hjRK1i7S6uYKOKcVaT8QWDhxVRIvKXA?=
 =?us-ascii?Q?3zbMGK0tSM/EvqSlfYY+E8PagpN5tvfMGhLCPKjFZOmc7bVhA5aei6r2F63b?=
 =?us-ascii?Q?7/lqvTiYsAqq4vabXwY3ooIvGt/KbUWSThjdF8JFfnAuBzeHC9KUC6vLmw0u?=
 =?us-ascii?Q?AEDGzrBwwa0O2WIPcsF1qu68AYX+0M0HprgAqHyX3ivJIN9t9Gg2BougBGXf?=
 =?us-ascii?Q?F+OopXkBmE93rULzC+8IRBXOFNm81k0PQ+Z/e0vAdBISp2umqlJgd2jIPKV8?=
 =?us-ascii?Q?yf8anBunzf9gbZ+0tzgu3JQAhJYZxP6r2rwYLREKRdFFcxlx6cIZ/ffyv+/0?=
 =?us-ascii?Q?wop0XVusp3sFdZQz5KJgMBiMVPg+WIKPosGW24ZzXw5ICcKcQopQ+/6Bjm8U?=
 =?us-ascii?Q?v7DGJmxA5IAhfzbLr2HVcRlGmc/ejI3zFbfD04mARM3/nRypaQhVVPPUxooH?=
 =?us-ascii?Q?BDQEXknPHQLvYnnOPv7rCu4tjo0DtQpUf/jCRn8pCYUjg0Ju6BPjRA/TykVS?=
 =?us-ascii?Q?8mg8iL2AlN+SOryVp3rZ1Z8y4XmgwTweEbZvd12SqGK7TpZS0cl4qbBrLg/C?=
 =?us-ascii?Q?lonidzl3koADaBPA5rjqa8Aej+1rPkNPOmI2UtqUPMYsyKhWEa7k4poAuIgs?=
 =?us-ascii?Q?ltl2lQ/04qNwCQ43BpO7iPaTbdVFYH4OuT67veeOtM8U5e/OPwpqGLRIkikh?=
 =?us-ascii?Q?yrh3YHNda/9bEllUzGKV7mPjr5NxzlxYyBVZc/A44Q73akCqBkt1mCemaRAH?=
 =?us-ascii?Q?Pw2unJFsuv4t1sHdVSoMBFwk5+omxFZ2ksZ9zqG07j5yoIDAsc3+OMFKvFcY?=
 =?us-ascii?Q?A+zNSET4Dr9+s/+S3wjy9862MMspTIWM+/JF/GVCygk5Zl7PIOnjr8Ncezo0?=
 =?us-ascii?Q?tlSSh8QSQ7H3msUBFX4y97qZcgRjbrfprbQ/zItD3Pj2+x/7d2FKgH/2mPDq?=
 =?us-ascii?Q?QwfMlivrajWaaVH8wcWEdi+InxDWgZRp+IQL5cd3kplIxSswWfmKJpwVb7CM?=
 =?us-ascii?Q?etMwAJBIZymg/ZF6chMnJVcZOpRHLO+uxNR+myEaGGe5GyJatw8JQKJfkEWD?=
 =?us-ascii?Q?hc88i8y2eDF06qeDb2lPpylxb+LxGpCPmOch1vn/tuBte3Atr+ZaGziNuBki?=
 =?us-ascii?Q?fOc1IOYidR0xrlDvgZFuRZ320qm9dQjuT/ViDU0GyjSCy6/ynbIFONxu23vu?=
 =?us-ascii?Q?3a/jvDD6cGUT/hP9cczubOcGH8K+1Bx43h7XTK0RIIPMaO48wocu99B0Z7GF?=
 =?us-ascii?Q?aoB71nPQt4IYqeK3fTjPCTWJjIOgLiPXxLWaz8AjVPGAmelp6+NJNEr0Zdab?=
 =?us-ascii?Q?FC+wYPhTDFX8jNxMKw0qq8C99+XXOIyh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AGFQ4FP73MSOi7dScUKpMrwW06I+fsMIonmD1SRpHLxovhFEnZakrjhXMgp6?=
 =?us-ascii?Q?A18PVY8mmmO062H4MiSCDcDnyLAoy3+1RUaFjIhTF/yfvQVwxSfPll5u3b7W?=
 =?us-ascii?Q?BAdVFY0qXpnasHhJdelhmKNtTR1dy81vavoxM9fKqOElVxvlyGbyFLreoM5q?=
 =?us-ascii?Q?TdFCWOYcK2dwG6B+0llQsdDmOQwK7s5fDZZ0NDO3bnH4Ii4zCjazgQEW9XRp?=
 =?us-ascii?Q?hYhOCFFG2TUK1NfsPM6E6U4Jkw8qslwj/t2aH7mwb9B5G12LG8kEtbQC/rHU?=
 =?us-ascii?Q?wINzFIAKSbsMxhBHwheIvQ5XeKF59AYYeXpqGAqu2vRpk3343iJpgibaAWAs?=
 =?us-ascii?Q?xJj+WNThy/JQTPqlsCZrUeixUA2StbOQOFUAoZtysGb5ogvIKImv0DnshbDC?=
 =?us-ascii?Q?Zh+FTVLsvX27yQrAxk9vWepMAtM/f8cuKFNfYvZRnp4wWUrsEtCWuxSQJmgM?=
 =?us-ascii?Q?HnXENZdoFT7YpMYj5ptj5M2WabV9jjYnqNuHD4hUJ4VILZUGRZa/MsZB/Md6?=
 =?us-ascii?Q?29Q8B9qv95ntznIsFQsKAPhIT2YSGmUrpESnPIsjmJmVASglUfifUSzhYh1e?=
 =?us-ascii?Q?1SIdceQW2+Kl+UwqOy4CzxbI7wC3u+sucEaVVdCLpOVCAn8ShC/RwW6Iwjb2?=
 =?us-ascii?Q?WAi/fFeZOmxTIAyaFj0V0oS9+KlINcMu2tztRQnH0RNBvvjmO7U73xtI28A5?=
 =?us-ascii?Q?YKzGtutZtSu/dbHUnOnTO+OJ0r9zwmpANLF7qYFtOStUMz2YxROkyKf1rPrz?=
 =?us-ascii?Q?eP65merR7znmfLOAaehGEsYLFVVwwj2IHidvOZCq7gxh9Z73a7zk5Y5u1JTe?=
 =?us-ascii?Q?ZXdVKa+AahGWeF5jtm41sRaROlTYtI83s9C/92Vs3EOhlWGGd13Dn9t9CcgM?=
 =?us-ascii?Q?mani8JcUj4Iq+aEol2tJUoSFQeVgdE0AQOyatrWQ0KmGk5CKqwP1cfL90Anf?=
 =?us-ascii?Q?+y+d/LUAUPWSXL2iFmJmN1FLPzLZBthvQD9k6McTFSrAiwFIucBDUjVGg7VL?=
 =?us-ascii?Q?hDpY6fEp+MaQdnPdgri+kuXmh/pzI3GIfqxQwJdl9Vn/0CVmKk+IKiJhoStb?=
 =?us-ascii?Q?9T/CAXsbzNuC19CahoCyEXIglWV8FUSY/mTRjn8/R6R0zDPaLZR4Bi//sOHJ?=
 =?us-ascii?Q?xTFi0r5cX9vO8HkRxasphp//w91ZhTHfBImnl27pH4YIWepmw0Tfla+S1lg8?=
 =?us-ascii?Q?1LBq2G4qX/54Fk/vSAKpphoLfxM9/hYFn4qRG4s1qBakCoBUO/ajLgfsX2oD?=
 =?us-ascii?Q?5heyGoz3nNokl0h6a5CIyFkcqCnLyFSivxelqYad7T4/+6ggOOz6xzi46aGT?=
 =?us-ascii?Q?4+ifrwQjwlNvBEi84OvhD+xL5mgZHhMrZTI5raydHx6KATsjB86eRiRkn/1V?=
 =?us-ascii?Q?TQTwFnDIJRcUP3IwR7dMEqeI6nmjoAbjr0n7CwN/pG2Kh2GjAtRCUx3Qr+wu?=
 =?us-ascii?Q?rZFpqjmhYJOjkeo8dJsnp3/Uv4tKY+ZHc13nddJhfKTZTkWrRWrGUI95Ekmk?=
 =?us-ascii?Q?2Sizwidr/g5KOcgedgUHORtfQZSX+3qhOWtYa/AvpqLm3HexdiasX8EhvTha?=
 =?us-ascii?Q?9ZD8FFc+Z+oCwrWxxLzzS8o6+eaJ2I8Ufbl0xRGH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5353eb66-d795-4840-817a-08de0a20ce81
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 06:21:55.6529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gQ/EE5sEPfivTxPmT+Y1n3UxvcDy130DZasQ2j087q2q9YAFnSIhGWuhYB50v5V2Xo35IJSSNG+L36eoHor5gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8218
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

Boot the GSP to the RISC-V active state. Completing the boot requires
running the CPU sequencer which will be added in a future commit.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>

---

Changes for v4:
 - Switch wait_on to read_poll_timeout

Changes for v3:
 - Fixed minor nit from John
 - Added booter load error thanks to Timur's suggestion

Changes for v2:
 - Rebased on Alex's latest tree
---
 drivers/gpu/nova-core/falcon.rs         |  2 -
 drivers/gpu/nova-core/firmware/riscv.rs |  3 +-
 drivers/gpu/nova-core/gsp/boot.rs       | 63 ++++++++++++++++++++++++-
 3 files changed, 63 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index c871fd061987..98ad75b93ea2 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -510,14 +510,12 @@ pub(crate) fn signature_reg_fuse_version(
     /// Check if the RISC-V core is active.
     ///
     /// Returns `true` if the RISC-V core is active, `false` otherwise.
-    #[expect(unused)]
     pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
         let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
         cpuctl.active_stat()
     }
 
     /// Write the application version to the OS register.
-    #[expect(dead_code)]
     pub(crate) fn write_os_version(&self, bar: &Bar0, app_version: u32) {
         regs::NV_PFALCON_FALCON_OS::default()
             .set_value(app_version)
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index 115b5f5355a1..98be14263366 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -52,7 +52,6 @@ fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
 }
 
 /// A parsed firmware for a RISC-V core, ready to be loaded and run.
-#[expect(unused)]
 pub(crate) struct RiscvFirmware {
     /// Offset at which the code starts in the firmware image.
     pub(crate) code_offset: u32,
@@ -61,7 +60,7 @@ pub(crate) struct RiscvFirmware {
     /// Offset at which the manifest starts in the firmware image.
     pub(crate) manifest_offset: u32,
     /// Application version.
-    app_version: u32,
+    pub app_version: u32,
     /// Device-mapped firmware image.
     pub ucode: DmaObject,
 }
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 0b306313ec53..649c758eda70 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -3,8 +3,10 @@
 use kernel::device;
 use kernel::dma::CoherentAllocation;
 use kernel::dma_write;
+use kernel::io::poll::read_poll_timeout;
 use kernel::pci;
 use kernel::prelude::*;
+use kernel::time::Delta;
 
 use crate::driver::Bar0;
 use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
@@ -127,7 +129,7 @@ pub(crate) fn boot(
 
         Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
 
-        let _booter_loader = BooterFirmware::new(
+        let booter_loader = BooterFirmware::new(
             dev,
             BooterKind::Loader,
             chipset,
@@ -143,6 +145,65 @@ pub(crate) fn boot(
         set_system_info(&mut self.cmdq, pdev, bar)?;
         build_registry(&mut self.cmdq, bar)?;
 
+        gsp_falcon.reset(bar)?;
+        let libos_handle = self.libos.dma_handle();
+        let (mbox0, mbox1) = gsp_falcon.boot(
+            bar,
+            Some(libos_handle as u32),
+            Some((libos_handle >> 32) as u32),
+        )?;
+        dev_dbg!(
+            pdev.as_ref(),
+            "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
+            mbox0,
+            mbox1
+        );
+
+        dev_dbg!(
+            pdev.as_ref(),
+            "Using SEC2 to load and run the booter_load firmware...\n"
+        );
+
+        sec2_falcon.reset(bar)?;
+        sec2_falcon.dma_load(bar, &booter_loader)?;
+        let wpr_handle = wpr_meta.dma_handle();
+        let (mbox0, mbox1) = sec2_falcon.boot(
+            bar,
+            Some(wpr_handle as u32),
+            Some((wpr_handle >> 32) as u32),
+        )?;
+        dev_dbg!(
+            pdev.as_ref(),
+            "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n",
+            mbox0,
+            mbox1
+        );
+
+        if mbox0 != 0 {
+            dev_err!(
+                pdev.as_ref(),
+                "Booter-load failed with error {:#x}\n",
+                mbox0
+            );
+            return Err(ENODEV);
+        }
+
+        gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
+
+        // Poll for RISC-V to become active before running sequencer
+        read_poll_timeout(
+            || Ok(gsp_falcon.is_riscv_active(bar)),
+            |val: &bool| *val,
+            Delta::from_millis(10),
+            Delta::from_secs(5),
+        )?;
+
+        dev_dbg!(
+            pdev.as_ref(),
+            "RISC-V active? {}\n",
+            gsp_falcon.is_riscv_active(bar),
+        );
+
         Ok(())
     }
 }
-- 
2.50.1

