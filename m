Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBF9BAD05E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 15:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B7210E5D1;
	Tue, 30 Sep 2025 13:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qDpYJZdG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010045.outbound.protection.outlook.com [52.101.61.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749CF10E5BE;
 Tue, 30 Sep 2025 13:18:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GWcd9kaWu/fqfsn8huuXhefbuPYLR8va2auuhHqyV8tAl4pg5BX07KcdQWQ0MbyE7iDigRL7TdyEPxeuR0ypV3RxTwWaB2j4XM42sSI5d4n6Gh5u+gjZ6lo3+3zmCh5OpJaiZ3xJVzpuh1D7kCU7Q3sh9zixy583mQBUysA45UGXT/+wa2rNZPr0iuvuh1pg6ib9itI1uNIDxkKEkUYuytsDojRduwMTjNEXtEbl6bqReo3wQq9sAo6ybcHKJC0Uc7fIlw5Fwdj1YcVzYwagi/EAhHP28iQKyzuZkWuCdLM2iHvKVUfoN0jQK2v6vjY4lMWgL6Y1hEOpuivqLndyQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEZf3JJzsFcUy+z5G4iw3eCyvasB4gA71DX9zer8bMg=;
 b=qSky/SNWpVO2jQhdpO23gUutjmb5GEZktM9DFnJxbQoMV9TCraLuyVdSzFNo13Nu7gc0AcZrb1I0mFeggYgO+hLUOw62HeFU7pfYW4dsUrWnTCILJ9IowtuvV4JdQgWcfKi52PkUR+xvIssgsdeMaxcUxFxQCC6xiwDn5QBkG7r0aVUKw4KJhOM8TQ189gR4PA/zSUMGdUUIM9hl6V5nYeO33gpFzXcXZ4RDPov5qzlE/O3NZ2uihCp7gulGsgu6L1rMFscwgKONRo3PTuyB3h5fY75qz+1TbS7YqIiMR7yWpfW73JEcoimmE3jHmxSmhM173TWx9h/HeLWJ3NVvCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEZf3JJzsFcUy+z5G4iw3eCyvasB4gA71DX9zer8bMg=;
 b=qDpYJZdGFGihEizDQBWwFx4KJ1egWek2iMbCFescs0FiPBXbfMQCdCOniEU03Y1QoDiulRxVkcgIaFDxdTV1233A8XsCkHqeBImFw9iQvfK7MAdjte0TVQwZi5dpJ2xKEkX4Nv3opp10yzC0xfrFoArkCb2/7yZoGUZS3GQOzHpiXwGlfFS40DHcEI7C5Aee1M0ZJOE3mo/jnahZV2mzdrF/CbR+gSJ49sMnx4vg4AOgLQaaCqJQaIGuVStKNR038iTXjnhCF1qZZmtLd3A9ozBcnk2WbmtPepyQKZlSK8Wn36qEHOb9x7NQEBsgFfR3MqAaWtihUOdmiDyWrP34RA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 MN0PR12MB6078.namprd12.prod.outlook.com (2603:10b6:208:3ca::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.17; Tue, 30 Sep 2025 13:18:05 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 13:18:04 +0000
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
Subject: [PATCH v3 13/13] nova-core: gsp: Boot GSP
Date: Tue, 30 Sep 2025 23:16:46 +1000
Message-ID: <20250930131648.411720-14-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250930131648.411720-1-apopple@nvidia.com>
References: <20250930131648.411720-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P300CA0056.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1fe::20) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|MN0PR12MB6078:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c012c62-706a-4327-7da0-08de0023c9b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?92crMHweUd2b66LF6rsl3PDnDckXlN5VvQdpuoeMrme5In407mlljdDhRDLq?=
 =?us-ascii?Q?Kre4chYvs1fqsDtP+/T0QPssfmX7dOouNimG0CxkdW8nliysf5+1rFv2FgW/?=
 =?us-ascii?Q?674MCMLc0iDXT+pZUoQMi7XGYEKUDhkX3nBtb6BEdAiWTPfYHj/+Zne63uvb?=
 =?us-ascii?Q?RCqfBaLXhNj2lJVFVkVNI2EgqFUKwyXRwGQ8aQcU2k7ZaPQFPo8ZvLEHTq1h?=
 =?us-ascii?Q?ZPTBtbUXISnkpyfT1TiJdioq2kPk34nLO43rWmuEJyCX3geQQh2jHVzWeBRs?=
 =?us-ascii?Q?FKg9Y0nl37xrYk/RUyiCOSM5gJlNEJWnwQHPVp4SIlfx/81SdTrO9ZxuOXkX?=
 =?us-ascii?Q?dfKv5v3RH6ApVfF/aAqDrB4iUa5XqjLLw8oDTsSWvZzx0ZRqrskCV/PPTI2B?=
 =?us-ascii?Q?bPUW3k1KsmmkM/l7UZcPU6PCnbxLYzMhJY9gOUZudM32+e1DRjZJq1wNhVV0?=
 =?us-ascii?Q?N12AqT0SfAK7SR1pFhyKq30vNGFfWzJ04VKAKHMug+Dcuu1t8bPJ9lJqpT1w?=
 =?us-ascii?Q?Y11nSfXjGalP9xPrzsgdqIBS8WX5y8hF7/jOhb+iAuzbBr1u0wzX91B0gyYB?=
 =?us-ascii?Q?oMk6EcDR2ZeqjKb9tHI1yQu0gWf+PWTJoepuyt8K/nT/7WUMTqmdIDsGMbiK?=
 =?us-ascii?Q?EzEk6ZTS9ZUIzq68l4mj61hlhPq0lRHfA69ZuEF8/S3dc1XdwuxMG0S6WaFE?=
 =?us-ascii?Q?yCER1NanrooKPAKUDUrI1mr9IVxJkUg61ZAa5+MV9UbUcbSFZtsFYkp6PHrA?=
 =?us-ascii?Q?xl4v8rheXG1UjlvdqiASmHyPg3+itawasI7ptb+jbaSGQ0nm0v6WjFr2vkUZ?=
 =?us-ascii?Q?/2ZmRyLzxOi1cvi1leOYZ6Pb078Kg5hOctflcKHVK5Zy1Y6fwkJe9+854h4f?=
 =?us-ascii?Q?Bol8YMCVRCO+39unCTik23/e2S/Ff6RCDN0rtNjVP2AUFGVzd+t1bUD9VXpE?=
 =?us-ascii?Q?76BP6jNoXJh2J5051BFAZZW52oHD26ltUVbRzIjBQwKtdhWe8fDgXFRIvl3w?=
 =?us-ascii?Q?hwOudnqcMrmv93yRM8+0AJgTn+M/nygdkXbjOi581dhv3I450WZg/g64QUeo?=
 =?us-ascii?Q?GrneCG1dUc+o+yPeDWk2YRAoG2M7MG3/ikHNfLDifRvnuRu6NI3zWUCwuRzC?=
 =?us-ascii?Q?pQqj/1yQnIbZuwbhzmm/lcjs1DyKCW0wRSK+lb62Cr068AWbwR6rBewg5O7C?=
 =?us-ascii?Q?2A3mMs3nUe5wUVnJq9JhQ3bfqEAHGoE1dSjBfYytC+MNEWDf9GVwD8Co77Hb?=
 =?us-ascii?Q?eXcBpqL7Fx3J4pPDBhvN418CaTvgjnUZ5ijBmYFcwRRxyMWHL0rfzobRuvsi?=
 =?us-ascii?Q?LNUoAAbbzQCXxn/Tx53j+iTk2Fk+f46L18Hz08souIxnebTdWrvOQglQjsZ2?=
 =?us-ascii?Q?kpeM4PfnBAndc1hWLkETKnbL4VVHDaaht3Glqtuxw5jrPbzqQ//l3Jc9IXAd?=
 =?us-ascii?Q?Pdu3R39JOO3nXCZ30mx/gzlTllWrj2Hy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eMMkdMrUYryxXgZxKSEQiQrAsehpao3WuvhWEG8PlSPdvxThxJx4XoBuN84u?=
 =?us-ascii?Q?wug6Mgb7TZB/0tqlur86wlAu3oWSVNJSIK6vQcx0YGJV4/nuycB6WXhTy89S?=
 =?us-ascii?Q?resIFyASgCwJBCybsfHncTCvNQUMtzIIk2jM8dxoTY+wtpvrhekHf1YkA238?=
 =?us-ascii?Q?tD+J1FeONIPeeBY3ng4VkrLsibaSlAG20WpxrvZfzm21zzGsbwBZhRlyiN7L?=
 =?us-ascii?Q?kHCrkxpRLkAMhT00MV+uvzQiJfP0UktXDPfUyTtKpxhIXq7EKTgzz0kyxz8U?=
 =?us-ascii?Q?AvNn4Pe0km0voeT++B9JPyZPyzr5ydUoh/vGujiBWaJ+2nesYsAvLaIHjFzU?=
 =?us-ascii?Q?Wc6f+daCxzL7lhpjHASywAjcLf8cj14uLJc+u4b1Lnojd2Gv+gkxhRf1/LFg?=
 =?us-ascii?Q?iB5Y1XlUSN5TWuVQAVgsmAdsht/mFZItoFz/DfqJ+YgH+aFWKmqSdiNP9t58?=
 =?us-ascii?Q?LP7sjDm8vSd7PlK2mUFsO1xZNJAe67DMSrTeVCpAGqkYNh0gWX4SRJzlQ/dY?=
 =?us-ascii?Q?cpf+QH6QLxeTUkfBxz5JwuacPTCVLJUaR27nWUTgP5M3FEiz+t9FCjS65rk7?=
 =?us-ascii?Q?/sO0zImO/VpKAvZzn/E3jc1UaY9N1A02m53eok3/vzh4VoORLuZPx6fRyH03?=
 =?us-ascii?Q?lD8c9ZFRbaEfF7ModVmDRYMWx+cXx7S856Y9/elpV+IrFGSpX08v9Q484Vob?=
 =?us-ascii?Q?F0da2cc6FyDO6bsWLb91UPFXj7qXYmpb7DhLmB359swTESUvB5quqXkG4evK?=
 =?us-ascii?Q?660ROunNknutJXnXlsdRRWWyfJYrr3xRqswolxWfuTYWD8QQK8gfx6lDRgxr?=
 =?us-ascii?Q?MicGmXSHMXZds34g1LAtNLcQfY9wAca44+rXiKElL6UPo0Fgn3cU2OUyyhlo?=
 =?us-ascii?Q?X54013mzUNt/vtEz3aHpzH84DHabH3pLxeurlbO2WrRvQvj8Kx+2UTRHQAJZ?=
 =?us-ascii?Q?DLvVFONT7XXTApf5k+OKKONu1DBs9LMH2kdgGYawY4vOW2c2dVlro6+xiUiM?=
 =?us-ascii?Q?36+bGaNGld1Yr6jsLdeSXw3t3zAFPbDN7LsUb3hThb5hiMd2FnBQdRJ3v6j6?=
 =?us-ascii?Q?62QbRt6pFgifxdtG3rg74EOxsPmBwN/E2I1pMx3+YQFZD/nnLdpE4RWlQcUh?=
 =?us-ascii?Q?yOhnHMU7AAbkydRJBiwyfEz8K7YLPc/49eErp595/m1tQIDODMw1XCXwCH0h?=
 =?us-ascii?Q?0VG5XFmXVX6Zg6cQsVhp9j9idb8x/QHz73X40WigofkO3/+bO2lFsEsVRG4N?=
 =?us-ascii?Q?0QLVpNSlkmlBq84Vz/NP6UJADCWZtVzt106b7adSp/CLzwYF8aMNzBF25D+y?=
 =?us-ascii?Q?y3Q19+BxL2oPT9ykvkt5sGWfupc70f9OH6OefYo0S4o4tMO48T0kI7gFvvoc?=
 =?us-ascii?Q?h5E7qkOYugJUVmHo+2or4Oagvnun/mpSBjVxjVWyUcF3bHHT5ptpFYnFB/BX?=
 =?us-ascii?Q?9ujuOpvRFBDAmkxwA8xOL35BaXDn2VhhUUwrtx4VFiy1i5AhOov4CsCh7l/c?=
 =?us-ascii?Q?Lwuh3G6ao/ixRjs+Y9rYZdu5CcUSuVjdDiKV2qh0Deyu8ABoZo6zIO5LTzA5?=
 =?us-ascii?Q?myFsEd8rz28or7Df337eqgjRschz+suw4iluXihl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c012c62-706a-4327-7da0-08de0023c9b0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 13:18:04.6604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rq8kKKpypH9r3sCdDUP5Alsosm+uGRF+qhdgoh3+sBboL+8EzHFv7agQ4zqO6d4dEfHD9k5T1I4uw1su8tsjxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6078
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

Changes for v3:
 - Fixed minor nit from John
 - Added booter load error thanks to Timur's suggestion

Changes for v2:
 - Rebased on Alex's latest tree
---
 drivers/gpu/nova-core/falcon.rs         |  2 -
 drivers/gpu/nova-core/firmware/riscv.rs |  3 +-
 drivers/gpu/nova-core/gsp.rs            |  2 +-
 drivers/gpu/nova-core/gsp/boot.rs       | 64 ++++++++++++++++++++++++-
 4 files changed, 65 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 0cb7821341ed..960801f74bf1 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -614,14 +614,12 @@ pub(crate) fn signature_reg_fuse_version(
     /// Check if the RISC-V core is active.
     ///
     /// Returns `true` if the RISC-V core is active, `false` otherwise.
-    #[expect(unused)]
     pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> Result<bool> {
         let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
         Ok(cpuctl.active_stat())
     }
 
     /// Write the application version to the OS register.
-    #[expect(dead_code)]
     pub(crate) fn write_os_version(&self, bar: &Bar0, app_version: u32) -> Result<()> {
         regs::NV_PFALCON_FALCON_OS::default()
             .set_value(app_version)
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index dec33d2b631a..d1a9e027bac3 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -50,7 +50,6 @@ fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
 }
 
 /// A parsed firmware for a RISC-V core, ready to be loaded and run.
-#[expect(unused)]
 pub(crate) struct RiscvFirmware {
     /// Offset at which the code starts in the firmware image.
     pub code_offset: u32,
@@ -59,7 +58,7 @@ pub(crate) struct RiscvFirmware {
     /// Offset at which the manifest starts in the firmware image.
     pub manifest_offset: u32,
     /// Application version.
-    app_version: u32,
+    pub app_version: u32,
     /// Device-mapped firmware image.
     pub ucode: DmaObject,
 }
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 1d5544d9dfb4..d5a33fbf8fb6 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -34,7 +34,7 @@
 /// GSP runtime data.
 #[pin_data]
 pub(crate) struct Gsp {
-    libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
+    pub libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
     pub loginit: CoherentAllocation<u8>,
     pub logintr: CoherentAllocation<u8>,
     pub logrm: CoherentAllocation<u8>,
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 0b306313ec53..77e9adf80f20 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -5,6 +5,7 @@
 use kernel::dma_write;
 use kernel::pci;
 use kernel::prelude::*;
+use kernel::time::Delta;
 
 use crate::driver::Bar0;
 use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
@@ -19,6 +20,7 @@
 use crate::gsp::commands::{build_registry, set_system_info};
 use crate::gsp::GspFwWprMeta;
 use crate::regs;
+use crate::util;
 use crate::vbios::Vbios;
 
 impl super::Gsp {
@@ -127,7 +129,7 @@ pub(crate) fn boot(
 
         Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
 
-        let _booter_loader = BooterFirmware::new(
+        let booter_loader = BooterFirmware::new(
             dev,
             BooterKind::Loader,
             chipset,
@@ -143,6 +145,66 @@ pub(crate) fn boot(
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
+        gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version)?;
+
+        // Poll for RISC-V to become active before running sequencer
+        util::wait_on(Delta::from_secs(5), || {
+            if gsp_falcon.is_riscv_active(bar).unwrap_or(false) {
+                Some(())
+            } else {
+                None
+            }
+        })?;
+
+        dev_dbg!(
+            pdev.as_ref(),
+            "RISC-V active? {}\n",
+            gsp_falcon.is_riscv_active(bar)?,
+        );
+
         Ok(())
     }
 }
-- 
2.50.1

