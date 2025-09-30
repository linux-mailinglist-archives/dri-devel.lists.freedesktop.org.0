Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A626FBAD058
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 15:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F6510E5D9;
	Tue, 30 Sep 2025 13:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nPwQEO2c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011053.outbound.protection.outlook.com
 [40.93.194.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E368C10E5BE;
 Tue, 30 Sep 2025 13:18:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tfkd1AMlqE0CfH8x7xPO28AYB+wuMtlO/l2YxODcjFrBeATv27xdJ2McAQjtqJh23KThuVMADJpNyo/ruFDBulIuICTjRUX6KKh8yCB75EJEsWP8b6CbCVac7AQrpwbtsrrJlZuCG9zC4kr/E57tDjJ63d6w2r8ZWz0Ba0EOwlgLqMFllfrwHKdaRvX2FktlhwudXM/RSJZepzy6U+mARiOx1W7Sia7tcW88it/YqjdTJdab9biECeNeHcDmbxlkXMZTKuLTuQuIMm4QdNOavbKISdfjOhs4WYXQpUA253GAA6t1ViOUuwikD+H6VBa9VQ0rdqOaSqc94w/ad1LPPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8iNE3qwD2bAO8V4D1NXg9uAto3X4KV26hNNIhF+Sn8=;
 b=tezJyqG/Dw1WO3ZkMJuXf0Jy0IhBWLCeiDQYllIrxdKKLCeHwP7aoznAAX/eqMlh252IIqAmRsiRTA2fhV/FXJ5rNRgDom7moQXlpeUOvJMtS6vUvsQnseGdTjdd/Vr3khRLwsvGJp3O5D75OcUoDRO1b9k+iY2hDa75v+YrXtC+JuwU5iBreMW7+VYEDLUClH1ecLmgQU0PRPikVpBos8e5I5EUfTqa5MkipgVNrTiMAj8tF/VtuNz39V/t6AbrVYkvYQkGYTwGhwkzXiCY/BAA3etUaDmkpOl2yxvN8xgzOifzze2VX/N78ZxWtT6eO+1dwFcpnrAvjuGqPAf10Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8iNE3qwD2bAO8V4D1NXg9uAto3X4KV26hNNIhF+Sn8=;
 b=nPwQEO2cQXFOIjjNAu3N4sy7A97KVhFq0eGCAhQJwWjsK0C1mXhQZDQduXcW1N0bTVKTfQJ80Lo7MBUhDcQ3i8Ms3c3GFxuXDLsNDQ9lh5uUL0uOQgekZLR+VtQhnM+ksaXquh7uotqxmmAxi5FhhKGSz50CYAhqxlGMmd97xB7MKf6u1SqXRGCSl3CIlI/dOj8JoAOPtwcYe70FJ6GIXh7Zir4aUeIc4/W32wBmBvAf7PgujLWfID283ScOauAVBNzNMfPpECibOlSfmHnveiWzV25r9rFaQErPmBGrAr4V36BjCRRl2sDfJssyI94NKylVsTQlsjTYvbMXBNgQJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 LV9PR12MB9758.namprd12.prod.outlook.com (2603:10b6:408:2bd::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.17; Tue, 30 Sep 2025 13:17:59 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 13:17:59 +0000
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
Subject: [PATCH v3 12/13] nova-core: falcon: Add support to write firmware
 version
Date: Tue, 30 Sep 2025 23:16:45 +1000
Message-ID: <20250930131648.411720-13-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250930131648.411720-1-apopple@nvidia.com>
References: <20250930131648.411720-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0076.ausprd01.prod.outlook.com
 (2603:10c6:10:1f5::6) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|LV9PR12MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: 78cb6e86-237b-4e5b-c5f9-08de0023c6e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0D3+8xCXxg14O69Y/9Zli1gt10FS7nC53qZ1UVPjWqdhH4IIgN6o1K8JAtg1?=
 =?us-ascii?Q?O6SwxXC/b51Cx+WMJF8QPL4R7W+DC4ciLZXcOxYRp5x7yPnXgRk/2oXvg2MC?=
 =?us-ascii?Q?9HvJ8Neq15dX/+IznaAmz2BHqgn38GCfpYQ+bOM4yu2LmbLecJggsR6XyWIk?=
 =?us-ascii?Q?eUrnz7uXhNz8lQDXGtAk4dIcOTW79CDbvTBHfztZ3arlQwfT1bkHCWAtBBmV?=
 =?us-ascii?Q?40gjluRwHRjmFIyKwJTtnL6RR39n4KrQqtCMi04ha4IpImfABC0I5gccp5ca?=
 =?us-ascii?Q?pGI25xMCNFD/wGOyUBeWBBwZ7FPWkCvpCB6hMUqAm8zOqSh5B3hE71G9dQAs?=
 =?us-ascii?Q?8yq3vDWhZBGb2nIWSBby/X0f6S0myj0zFy6dzRA38DENaKLXQqRz+ZaU2UQb?=
 =?us-ascii?Q?xsAlH6KNWsl5GslCby4LnOeJjUK2CD3ME6xHeisfVE0XCROiczbWgUUNO+Ys?=
 =?us-ascii?Q?DQotijhyxgnofagFwqa6gsi1mUvw3RqYPUaBMaeEaDDxdPuWFPfP43NkJ+X1?=
 =?us-ascii?Q?fvV6F9ww9JOwVHEch8umhtPjjQzVclMdMASa8mWe2t6UOhMbB1RSOMkGBem0?=
 =?us-ascii?Q?AN1BN+10+lWp44Wp1HrRh18naEJo4XeDjwXwO+rKN4+7Uao9Phy8iUjLA2AL?=
 =?us-ascii?Q?zRWvgBN90XgbgPLHAoWBZB+0a/dvMk7SwI82XLEeM9gUXBFvfj2bqxLjzvUQ?=
 =?us-ascii?Q?BfqnamG0UHnT+3ak1io3dehuotDR6DJ9jqTVcPwMtbp/L/6be+BVhzxgpYyx?=
 =?us-ascii?Q?0WAPuVH1zfq1Rwe4N1ERTnyVRdEl7Q/zHNdtDixPa8CTXCDayhXH97Jt0ZSY?=
 =?us-ascii?Q?ZG53jZyvB74gbBV6pblfDSxyktx1lOCOtFpM9+V/urCLmAf72Ue4vp4/mpLr?=
 =?us-ascii?Q?U5+ZXVNN5VWCNJYKVlQ7yF/nQ0hkmn1scLGJ0aPAzny5/uToXzZh9OpCcyqd?=
 =?us-ascii?Q?MxFooB2V0eV0XLQ7t+2tMn1u6T0wYm2JaQoogdFrb1psf6KtKCFD+7GJX0j4?=
 =?us-ascii?Q?6aYUA4VTNr6XtjFW3gsbFbUWt5WTImTZIa3TI1LmCeiZsKXH/zBv8hj20X2I?=
 =?us-ascii?Q?JCI0GURn+Q/Zi8HMorUp+mYMr5qIgOhSH/Pd/0XSdmUDEXg95w6aAEdpvdeR?=
 =?us-ascii?Q?9wUmHubYm5DZx6dw+pJQIpwSKZVRU8mW4/3vxuSO4t+rHopcdhJr61o+cGHM?=
 =?us-ascii?Q?v5xf0f0rz6U2H/jdYKgU5ARALVXM9YUM8z/77iZV6pIimFYn3/bGYVAGEHCR?=
 =?us-ascii?Q?SatT0b+y7K3++vBJYa/aU7KHKtFTRdji0Q9rCIKsZuZ6oyHdvP4Os4GRuoWV?=
 =?us-ascii?Q?HAODHJNj4gFpJ5Xd3q20s5vg3YTtqjF7V32MzvduXf8PA3vjs3RVEIpQmt66?=
 =?us-ascii?Q?Q+bAGhZQYFvOb5m3bk2PGy9EVkCsq5DatL9aAABQFq8uDs1zPrT0BnwajPds?=
 =?us-ascii?Q?1VU/3kma57uFSG09nvuiltHMEJ4Dmqo1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oNF7d1ny+cIE3eYqzmJ9RZIPgzlhpAr7+BqxMzad030OVQRPF2CozNQb+HHB?=
 =?us-ascii?Q?YTkRIrtqJkN+MrWj4hbk889k8MFWaQSexyujo8jCHGFgDL2D64xltUqgJwQV?=
 =?us-ascii?Q?FDQTOFtHBdAdhPOWyMni8K2O9Tt8Ua4uQUDDZPIrKy17GCYGRW0jer+VGG9b?=
 =?us-ascii?Q?LtYgsRs/FUibXWOYX5U9nSwPevyoL1RgvT5HqXraalcVaqV3OLU66m3ivoOV?=
 =?us-ascii?Q?/w7JDSqUDUgIHJK38hPQFgy2xpGgI6hMFfx8wtJC6PRTPpgfAYNASADn1M8f?=
 =?us-ascii?Q?QjNlnlYf7/GQ30wGUo/iAFLNAPVERmEA2WcLuo7T+lRWt1n7aFU2Gam+fl/v?=
 =?us-ascii?Q?UzXN3Z4b5d+XDRd2uM3f7Ts/C3lmf1d4bUwyFS4Fbn3/XO2FH3RWEXGv64cZ?=
 =?us-ascii?Q?KgPTRFwBEBFEEsr1uhi9rge4S25LaK94d5n+ik4sbcUBq35aV0StPUoPYL+c?=
 =?us-ascii?Q?fSbHJULdIDJyBP+BgiPbkUj7QhXYZmp0NjdRWUwZAYEt0SsVyR32kfjXIayg?=
 =?us-ascii?Q?Agszv13ychcAHtELc19TtwjfemA/CXbbU/DleDJFZSL+iEvx24raAb/NkIUi?=
 =?us-ascii?Q?s+dOBaucSMZcxcEGMq1VW7zypUhvKCrhebdl2WqhlZa0io+ZHzos0eaXqme9?=
 =?us-ascii?Q?9/ExcjGpc4wKXVvKpTUYjBuAkaDXKc6ysYQa+bPHqzZQJhGj0zEHLDJX6XPc?=
 =?us-ascii?Q?x5pWIMk7SxTw4KvJNPJBHU3aEcETb3oopKFNru38TvvbUlyZHPWlRM9iZsfs?=
 =?us-ascii?Q?B7rTD+RZ/EyLe6O9NtSDiRtgHCiVu/wVgquYg4/gbR/Xan9ncx51bbRphVPc?=
 =?us-ascii?Q?hpkqPZDUKZZbhiyK+YLeKcxhb4uKsAbX0m+lZ1zNsKz58PGbaGa/rEePNUGc?=
 =?us-ascii?Q?RcIGc7x0Z9lSucrS0xP+ljQWYDUTyo3N1EakHPRhpkQGy0hpoh6P2rtPS4Oj?=
 =?us-ascii?Q?C2jeDC0DFIeNAeE7Q4CYFdnkRwsRCzfVGUoIaJ6fgUwB1uNVNrKi9t2keofC?=
 =?us-ascii?Q?TmH7iKSEx/Uc8nTcOBgu8ALm/9Zro03RJdo5inhU+XAezd62qONFQ5CtU86B?=
 =?us-ascii?Q?dBn5QTKiLurh7mI3hhcpX0iHOnEq8IkzofVkfMmJp5nsgNPpBL4aXbj5STCz?=
 =?us-ascii?Q?gjkPa7ImVJfCrnEqy1FXxbUuLAGLD/B21ZS6joOUrXnclqJ+2wZH5Zgvw2lX?=
 =?us-ascii?Q?afIDqgk8GcW6Lu9qYsoFyjzjJBYuh100CvqbxbPzeDOc1LJl8192yHmDdvyu?=
 =?us-ascii?Q?RVwQ3xvo/JBZnnhM9gy8hYuS5eSWbi2/dVTcZEwySMCsei5KUHaIyRKpOlNP?=
 =?us-ascii?Q?eaEWJVLI461BehGzkM5thTd05VnS79s18jh0afv5ywr0HHlfO/1qVY+HeuGk?=
 =?us-ascii?Q?s4mWSkcHLgo+qxZ/ykZP2R1yY7Gws/QlPuQDckakL+P8n5yCxHm9SrLT2IT4?=
 =?us-ascii?Q?RBy1dssJ0hBLAwL3zMgGFR1EspyCIDCLZXTpNt3tBajNdnVIfMiDqSAErxc7?=
 =?us-ascii?Q?Mipj2/fLrnRT/ib2OCCaYAr8mtCrCy0WIHqwrCeUqbEziIRVJj7P71tAuELC?=
 =?us-ascii?Q?x5UqUQHftRRbqKTa5GZNB5hAhVsHQGN6K2UsQkK3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78cb6e86-237b-4e5b-c5f9-08de0023c6e3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 13:17:59.6793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3qaEIx0EUaQQYz6u2kVmxeBPg1T4KwQX2ZQKwrieeLAEdgtlMEDrDKRSbxSOutJ4DOMI/fi08XBHAy6Ak8JQEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9758
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

From: Joel Fernandes <joelagnelf@nvidia.com>

This will be needed by both the GSP boot code as well as GSP resume code
in the sequencer.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/nova-core/falcon.rs | 9 +++++++++
 drivers/gpu/nova-core/regs.rs   | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index c7907f16bcf4..0cb7821341ed 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -619,4 +619,13 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> Result<bool> {
         let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
         Ok(cpuctl.active_stat())
     }
+
+    /// Write the application version to the OS register.
+    #[expect(dead_code)]
+    pub(crate) fn write_os_version(&self, bar: &Bar0, app_version: u32) -> Result<()> {
+        regs::NV_PFALCON_FALCON_OS::default()
+            .set_value(app_version)
+            .write(bar, &E::ID);
+        Ok(())
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 5df6a2bf42ad..d9212fa50197 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -215,6 +215,12 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
     31:0    value as u32;
 });
 
+// Used to store version information about the firmware running
+// on the Falcon processor.
+register!(NV_PFALCON_FALCON_OS @ PFalconBase[0x00000080] {
+    31:0    value as u32;
+});
+
 register!(NV_PFALCON_FALCON_RM @ PFalconBase[0x00000084] {
     31:0    value as u32;
 });
-- 
2.50.1

