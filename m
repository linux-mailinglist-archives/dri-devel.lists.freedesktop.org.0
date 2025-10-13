Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D964BD1A13
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 08:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7610110E3AC;
	Mon, 13 Oct 2025 06:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rhU7UH8K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012019.outbound.protection.outlook.com [52.101.48.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3329110E3BC;
 Mon, 13 Oct 2025 06:21:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0xYLRci7dojidQQr2am8jbBMwD2N9PrFa2CCMLDaBxxg+EsLCOGvQVBtjM42LIBsal+OTO7S1/XfjKQgzt2zijne7LgNYOceZF53Ndyl+tZNikgyRMrMZAEirZ5aybGwRuCNJ3F2w6q9r4an799ymiJloOhjZfQdgHEaRS6fpe9Zr5DlfpoJdOXE424bbgmP66jqjhMpGcOyUJ+gTFZdAf58gGMLYggHhoRliG5N6BKt7fhx4fWcsM1lt4Rl8Zzn+QgCVIbrVP1QqF2vDR+zulJA7jkmJve5t7acn7CbRfs9Scwd+7WQoa2krj6CMokQXrLlVdbH/v5UzjlaTpU0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLz1QhCIFP82GWkik7ChbAd+vH063WGwsP71i+eiib8=;
 b=J6RVkIYGpWjy5elACzkAJm9+Oo/etWp1p/Ao9ZgelB9iHU2EC8Z43vD98bfS9YS2ytG3KXGpPsoZQC8a8nV/li0VBs3Z4/vGr+mCvWTNbUEh3DcfYI9gxrIPcUk691IXuMn2Ps0rD+knq5KWytrXzSy6XHajkQXFOQaIYnoYCbC6trwQA3+g0CGHuwNKTtl3TC2piHWsl6yEM8OGUZNvd2GgtVpB9yYA/SiKsIP8SbBvz+ofgs3Kj1DSJhVIEp+JQu0oH7G7q09SM1My1aoloYHPyXO60TS0DV8BpbeWHTouHOKcdLQjctW+Wbl1T7ULC+EzQDcAF0HTwLtf/xx9vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLz1QhCIFP82GWkik7ChbAd+vH063WGwsP71i+eiib8=;
 b=rhU7UH8KyaBL1CM49tTTpNPEVuKGuDYF+n3czyD/Ajef5ke36dRy5iL2Uv6Iy2Khq35ewvlaquznsAmCAeXGxHdg0uhnNv0zptXyykeUjiGDHWIzxZJ7OqFkfwBNmdKsvsHGavGgfL3s/xsoG7k7E2lLPIJ2AfRSxEZ3xHL58TPu5yjjdIzkN766OVqfiigvtFczXqMNQJgHuS4v0f0Uep1DZaq0jrUvSni4tmYtDPa36L2xUQEPzckfJRePsqt+ypi3REEwSi5PIrp5YKXKQaWZYjKo8OOxAUTmuJRzPdUzuhja3DVKknVcpsQXg5CchLjSv6rh/IvGMFKCk/CPKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS0PR12MB8218.namprd12.prod.outlook.com (2603:10b6:8:f2::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.13; Mon, 13 Oct 2025 06:21:25 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 06:21:25 +0000
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
 nouveau@lists.freedesktop.org
Subject: [PATCH v5 08/14] gpu: nova-core: gsp: Create rmargs
Date: Mon, 13 Oct 2025 17:20:34 +1100
Message-ID: <20251013062041.1639529-9-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251013062041.1639529-1-apopple@nvidia.com>
References: <20251013062041.1639529-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY4P282CA0013.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:a0::23) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS0PR12MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: 97fba280-f0e6-4947-9bf2-08de0a20bcbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3iou1QJsYWF3Uqh1qmMpKWeDJ8NB7OtctfbXUfGwXnQsPjCZ1egfJhyitZfs?=
 =?us-ascii?Q?K0XhNyxZhsOhiBcmExRScGzCb6Xmwk6HTxUqv9Xn7HYcWvMP4yKMH3mvA+A5?=
 =?us-ascii?Q?VN7GJLJtzQXHWl/PqqfEzlhp2boPLNBflBOapoMYHKYjU3MwuL8ElsJ9ZVVk?=
 =?us-ascii?Q?qcYzsC4MnfL46LfeevzOZVLVZEnbDCRdmAPW651LKe7S3bVC6eoascmbQR92?=
 =?us-ascii?Q?jw1R4IMCRwnJQfPRHURAmOTHRltNqu/Mfz9c1mdO88XDcxvkWMSE8Ks0jHDX?=
 =?us-ascii?Q?9u2B7SP/7AeHOixnR4jxuAC017mTWIVkTcye8H6BRh7oRVbakI9i8fkFY0Ac?=
 =?us-ascii?Q?wc9AjdKY8vDYDubYEebgd9BmeIs6+fo9T2wwgFX6cZNDUIM83WuhR2Tniimx?=
 =?us-ascii?Q?aWvOsBRPh6PQmDODqLeXYnYEOqW62697PPnhDPovLXfFq9qctlQ33+JgSnVy?=
 =?us-ascii?Q?kVSjs2sty7JKryEay9rQ4Hd+1sxXc7ELzMGSMv+u/zpqSUe9LZJOMHsq+vvh?=
 =?us-ascii?Q?4VXLN9hCoOhyVLrktcNrXgl8s5xlp5RDP4dv3KOmYq40cNribtuTN3TV8v2C?=
 =?us-ascii?Q?keSeorbToaibAFLaZx/6LV0fccelLJEMZLoImq/KrZ26w4cqxnP8NZhk4KnU?=
 =?us-ascii?Q?xH3nhkqmddmz+DB9/l1BhLGFgCw/HT3S2FFxILmlkpPWkiqYfCmlLxRlCzD7?=
 =?us-ascii?Q?IZ6WvDKyW+gbHQ/Ceiwoo3ttwdJCW5mlAn8XPHyJixFdS2r5K213NRLOZ/F9?=
 =?us-ascii?Q?2ERtKoogoHJJlwMQcUUfO9vzTz1Y8mD5kpNEYaBHoOEv3oFNIT0eSlzcnS8B?=
 =?us-ascii?Q?EODVerLi0f7EVArDO+3nmpJGAOXZagty95KCZeDDj3VCdPGqXqbeEV6p3np6?=
 =?us-ascii?Q?VOdF7zaoAMZv6ruO43phoxeMn5Gxfz4ZEQb+9sb74YzT//8LeUIvUwsrUWg9?=
 =?us-ascii?Q?fwYfH5nJthQOm+MlsGtlCxbaaWoVmTrfspzLhR+s9P8nR+dNG8uTndxzCtVn?=
 =?us-ascii?Q?uud9B4NaXw5Ayj6mfLSr0+RqkkJg5Gq+eRmdD4ALwqRPvV/PHgBwWvBqIbgq?=
 =?us-ascii?Q?JFESWp3XyMIpIzmV6P/aJabXOGGuWBV6E4U6BeADMVVye2L6UUo75ZlrCnCr?=
 =?us-ascii?Q?BOB3FSvzJNpyzJ9ojviynFyNBEUgP1xC3QZE/IAfFlSAC0Y/ZyHDWBwWrMRk?=
 =?us-ascii?Q?y5QoTDv/3bpf0vFXcgs/JU/p7k+0mzrsesO14hZoDlMgIiYUh2I7u7vtUJ1j?=
 =?us-ascii?Q?xk+1VmHt605FQ3D9+24c9z6bEwwXOXK4ZwkeaIF418ufWW3idfU5z2G2AGE8?=
 =?us-ascii?Q?taEWDKp2YpyrQMfLMXUjF6cFCUH1G1JtVLcLtC2JwQulRvMjfHI1E+Xt/Ewb?=
 =?us-ascii?Q?Qboaq49cSJyjnkdLErX1kCSF5003fZB+D9PiZMZmc9CnPAP8mA8G4XQ97yWI?=
 =?us-ascii?Q?gZLUSsBZaYwOhPryAfy6cC4LXwvxVq1Y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3dAN1jBtcvsr6RvAP3yS4Bdtcwo1thWxVdb1tKjw0NCY8C6xawqTQQA/Z20Y?=
 =?us-ascii?Q?Byf9u6/nEwfVuqwN2MQvxF5WH7pk82pI/QjtK8FD4uSKPNyH0s9sJXASMRto?=
 =?us-ascii?Q?ZG9KTa+UBqoGdBEGvKUxnUH2cQWTivhg5EJnEsiLA1o12d0JzKdsdRIdx3AF?=
 =?us-ascii?Q?V1tg0fTapEJUmB5xhdjfP/WOKNvPikcxJSnqKdKXoj0/Xdv4palj74IaoEE3?=
 =?us-ascii?Q?mBeGZGCAhx3APTHg88fSfd3Jx2f7FpbioOT5ixY7fERsddV0b169xCjVlI0H?=
 =?us-ascii?Q?6PPIonaObAEk/BGL2F7IYylnrU5IhwzIMy4Ei4+MpScwza7kB0XNbX/Wf3/C?=
 =?us-ascii?Q?K7TNuXKYnZu4hMp8bOLl4iUdIIHNNAd9qMlwbBTkXqifZ8oOmGukRc7fRsY2?=
 =?us-ascii?Q?k/clPVRxPQaqIo6/73C8CmndsxKqpjp5aAjoDuIh+EUWw3Wp64IWe+6c5gNd?=
 =?us-ascii?Q?XKYjOTGC7bi2uhgGvtq18gS4KCErPltpQ/fDyfJ9yZhpF43CQ1AXvxq4f/bE?=
 =?us-ascii?Q?AUWzoMcluVO7v3eoxrNSsxyh9SMBPi7XZhvv4zdARoK0ed+PfveohmgdcNNg?=
 =?us-ascii?Q?Ehvexo7/DU+9xtNKpKBGonfko0U8lV/FOD34lNgIbMhk3K8bnBeVM3phKXJs?=
 =?us-ascii?Q?Zsiwz8qzCsBAtkM+2oGzm5arntq9aJFkkL1uzkJVv7A+lS8YwLCt0ZQrKEuK?=
 =?us-ascii?Q?mU74ArsXyMxdG0K2J+9joNcjJdpm74dl//bw2qiN5tyqAfQLDezrOHyYx5wN?=
 =?us-ascii?Q?jALr0EbdS8OFPBfszIBbHB29g2S9Q6fZyxJRmJN0XQDIo6yiSj6NrC1Gpemu?=
 =?us-ascii?Q?YzfQ1UBqUsgOLCX91b7HxItHHapuqQPyag5KdhzJp6T4MrO0F64Xb3tWftyl?=
 =?us-ascii?Q?eqhWXJ2usaD98KkS83AEN7+cv7q/K1S1YGVaJ0a4hiifJsAeKzHPwlvnCKLn?=
 =?us-ascii?Q?uXip/5wETgYBq+4yGrJjGXeM6aTalw+U2A7Lje9oSerO+McTdxj8NEoN0j5l?=
 =?us-ascii?Q?k1FLj5jTWK1G8jkQng5FFyQLjAbMcFg8ZYq77cWZS3V2jybtzF2UHEEkJZtl?=
 =?us-ascii?Q?bjkoEk66jV13QlXT3tA682hC075xxBHOuJ65hiViq8PkPMuNPocEJydkn5mH?=
 =?us-ascii?Q?OZXdL/ssiG7uc6b5OXIylC2fcvj8o3cmUk7HhV+nN3+HZdRimOMnZtklle4r?=
 =?us-ascii?Q?ozCJLCyje8VX74ag03YooYrTsYpQ34Dj3memQ2r6F3a0vYRnpDtg1O4eDQWZ?=
 =?us-ascii?Q?Mk/XcmOfHvAqni6tmybMXm7jVvpTxdtLT9u4D3pLxEI1YuVdV212FS6JBMX7?=
 =?us-ascii?Q?4bAVWl29X/MjzjUF9Vu2eNFqTccvhhEfls9wko+SEouPI2wkJGboHMpZ1LOg?=
 =?us-ascii?Q?6OiZ8KCpQRHiU3hRQYf1E/g5G5EloAzfA24VdTsNa0ERqvVhhIkL3rQTlTH2?=
 =?us-ascii?Q?DqM+0WDjUnKCXiWyFdzirKcr0zJ/IG76sQvKbs4oW72TQbXrsqek8WkLYaLe?=
 =?us-ascii?Q?zpy+YHl00/v1TFhilXS+Es9v2vgU6CfRJFVtQ9fDN4nki2jMffelb2NskEDu?=
 =?us-ascii?Q?T4kk6ZjJRQjzjUsg4W+E2LmiGEQkxw3K/Ug+WQK6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97fba280-f0e6-4947-9bf2-08de0a20bcbe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 06:21:25.6775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iUryp/HDrOd2gluQTV2kYRLkFEzC0/4dTnkJl53Ck8gQ4ycpZvxwa6dis1k/4fmYqKvrolg7rgYi+hzUw99Csg==
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

Initialise the GSP resource manager arguments (rmargs) which provide
initialisation parameters to the GSP firmware during boot. The rmargs
structure contains arguments to configure the GSP message/command queue
location.

These are mapped for coherent DMA and added to the libos data structure
for access when booting GSP.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Changes for v5:
 - Derive Zeroable trait

Changes for v2:
 - Rebased on Alex's latest series
---
 drivers/gpu/nova-core/gsp.rs                  |  16 +++
 drivers/gpu/nova-core/gsp/cmdq.rs             |  24 +++-
 drivers/gpu/nova-core/gsp/fw.rs               |  60 ++++++++
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 132 ------------------
 4 files changed, 97 insertions(+), 135 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 1d472c5fad7a..58b595b8badd 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -19,6 +19,7 @@
 mod fw;
 
 use fw::LibosMemoryRegionInitArgument;
+use fw::GspArgumentsCached;
 
 pub(crate) mod cmdq;
 
@@ -36,6 +37,7 @@ pub(crate) struct Gsp {
     logintr: LogBuffer,
     logrm: LogBuffer,
     pub(crate) cmdq: Cmdq,
+    rmargs: CoherentAllocation<GspArgumentsCached>,
 }
 
 #[repr(C)]
@@ -117,12 +119,26 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self
 
         // Creates its own PTE array.
         let cmdq = Cmdq::new(dev)?;
+        let rmargs = CoherentAllocation::<GspArgumentsCached>::alloc_coherent(
+            dev,
+            1,
+            GFP_KERNEL | __GFP_ZERO,
+        )?;
+        dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", &rmargs)?)?;
+
+        dma_write!(
+            rmargs[0] = fw::GspArgumentsCached::new(
+                fw::MessageQueueInitArguments::new(&cmdq),
+                fw::GspSrInitArguments::new()
+            )
+        )?;
 
         Ok(try_pin_init!(Self {
             libos,
             loginit,
             logintr,
             logrm,
+            rmargs,
             cmdq,
         }))
     }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 3f8cb7a35922..da074a2ed0d9 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -6,7 +6,7 @@
 
 use kernel::alloc::flags::GFP_KERNEL;
 use kernel::device;
-use kernel::dma::CoherentAllocation;
+use kernel::dma::{CoherentAllocation, DmaAddress};
 use kernel::dma_write;
 use kernel::io::poll::read_poll_timeout;
 use kernel::prelude::*;
@@ -247,10 +247,25 @@ pub(crate) struct Cmdq {
     dev: ARef<device::Device>,
     seq: u32,
     gsp_mem: DmaGspMem,
-    pub _nr_ptes: u32,
 }
 
 impl Cmdq {
+    /// Offset of the data after the PTEs.
+    const POST_PTE_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq);
+
+    /// Offset of command queue ring buffer.
+    pub(crate) const CMDQ_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq)
+        + core::mem::offset_of!(Msgq, msgq)
+        - Self::POST_PTE_OFFSET;
+
+    /// Offset of message queue ring buffer.
+    pub(crate) const STATQ_OFFSET: usize = core::mem::offset_of!(GspMem, gspq)
+        + core::mem::offset_of!(Msgq, msgq)
+        - Self::POST_PTE_OFFSET;
+
+    /// Number of page table entries for the GSP shared region.
+    pub(crate) const NUM_PTES: usize = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
+
     pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmdq> {
         let gsp_mem = DmaGspMem::new(dev)?;
         let nr_ptes = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
@@ -260,7 +275,6 @@ pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmdq> {
             dev: dev.into(),
             seq: 0,
             gsp_mem,
-            _nr_ptes: nr_ptes as u32,
         })
     }
 
@@ -490,4 +504,8 @@ pub(crate) fn receive_msg_from_gsp<M: MessageFromGsp, R>(
             .advance_cpu_read_ptr(msg_header.length().div_ceil(GSP_PAGE_SIZE as u32));
         result
     }
+
+    pub(crate) fn dma_handle(&self) -> DmaAddress {
+        self.gsp_mem.0.dma_handle()
+    }
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index a2ce570ddfaf..70abda1c2af8 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -16,6 +16,7 @@
 
 use crate::firmware::gsp::GspFirmware;
 use crate::gpu::Chipset;
+use crate::gsp::cmdq::Cmdq;
 use crate::gsp::FbLayout;
 use crate::gsp::GSP_PAGE_SIZE;
 
@@ -483,3 +484,62 @@ unsafe impl AsBytes for GspMsgElement {}
 // SAFETY: This struct only contains integer types for which all bit patterns
 // are valid.
 unsafe impl FromBytes for GspMsgElement {}
+
+#[repr(transparent)]
+pub(crate) struct GspArgumentsCached(bindings::GSP_ARGUMENTS_CACHED);
+
+impl GspArgumentsCached {
+    pub(crate) fn new(
+        queue_arguments: MessageQueueInitArguments,
+        sr_arguments: GspSrInitArguments,
+    ) -> Self {
+        Self(bindings::GSP_ARGUMENTS_CACHED {
+            messageQueueInitArguments: queue_arguments.0,
+            srInitArguments: sr_arguments.0,
+            bDmemStack: 1,
+            ..Default::default()
+        })
+    }
+}
+
+impl From<GspArgumentsCached> for bindings::GSP_ARGUMENTS_CACHED {
+    fn from(value: GspArgumentsCached) -> Self {
+        value.0
+    }
+}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GspArgumentsCached {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for GspArgumentsCached {}
+
+#[repr(transparent)]
+pub(crate) struct MessageQueueInitArguments(bindings::MESSAGE_QUEUE_INIT_ARGUMENTS);
+
+impl MessageQueueInitArguments {
+    pub(crate) fn new(cmdq: &Cmdq) -> Self {
+        Self(bindings::MESSAGE_QUEUE_INIT_ARGUMENTS {
+            sharedMemPhysAddr: cmdq.dma_handle(),
+            pageTableEntryCount: Cmdq::NUM_PTES as u32,
+            cmdQueueOffset: Cmdq::CMDQ_OFFSET as u64,
+            statQueueOffset: Cmdq::STATQ_OFFSET as u64,
+            ..Default::default()
+        })
+    }
+}
+
+#[repr(transparent)]
+pub(crate) struct GspSrInitArguments(bindings::GSP_SR_INIT_ARGUMENTS);
+
+impl GspSrInitArguments {
+    pub(crate) fn new() -> Self {
+        Self(bindings::GSP_SR_INIT_ARGUMENTS {
+            oldLevel: 0,
+            flags: 0,
+            bInPMTransition: 0,
+            ..Default::default()
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 1251b0c313ce..17fb2392ec3c 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -321,138 +321,6 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub type _bindgen_ty_3 = ffi::c_uint;
 #[repr(C)]
 #[derive(Debug, Default, Copy, Clone, Zeroable)]
-pub struct DOD_METHOD_DATA {
-    pub status: u32_,
-    pub acpiIdListLen: u32_,
-    pub acpiIdList: [u32_; 16usize],
-}
-#[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
-pub struct JT_METHOD_DATA {
-    pub status: u32_,
-    pub jtCaps: u32_,
-    pub jtRevId: u16_,
-    pub bSBIOSCaps: u8_,
-    pub __bindgen_padding_0: u8,
-}
-#[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
-pub struct MUX_METHOD_DATA_ELEMENT {
-    pub acpiId: u32_,
-    pub mode: u32_,
-    pub status: u32_,
-}
-#[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
-pub struct MUX_METHOD_DATA {
-    pub tableLen: u32_,
-    pub acpiIdMuxModeTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
-    pub acpiIdMuxPartTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
-    pub acpiIdMuxStateTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
-}
-#[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
-pub struct CAPS_METHOD_DATA {
-    pub status: u32_,
-    pub optimusCaps: u32_,
-}
-#[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
-pub struct ACPI_METHOD_DATA {
-    pub bValid: u8_,
-    pub __bindgen_padding_0: [u8; 3usize],
-    pub dodMethodData: DOD_METHOD_DATA,
-    pub jtMethodData: JT_METHOD_DATA,
-    pub muxMethodData: MUX_METHOD_DATA,
-    pub capsMethodData: CAPS_METHOD_DATA,
-}
-#[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
-pub struct BUSINFO {
-    pub deviceID: u16_,
-    pub vendorID: u16_,
-    pub subdeviceID: u16_,
-    pub subvendorID: u16_,
-    pub revisionID: u8_,
-    pub __bindgen_padding_0: u8,
-}
-#[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
-pub struct GSP_VF_INFO {
-    pub totalVFs: u32_,
-    pub firstVFOffset: u32_,
-    pub FirstVFBar0Address: u64_,
-    pub FirstVFBar1Address: u64_,
-    pub FirstVFBar2Address: u64_,
-    pub b64bitBar0: u8_,
-    pub b64bitBar1: u8_,
-    pub b64bitBar2: u8_,
-    pub __bindgen_padding_0: [u8; 5usize],
-}
-#[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
-pub struct GSP_PCIE_CONFIG_REG {
-    pub linkCap: u32_,
-}
-#[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
-pub struct GspSystemInfo {
-    pub gpuPhysAddr: u64_,
-    pub gpuPhysFbAddr: u64_,
-    pub gpuPhysInstAddr: u64_,
-    pub gpuPhysIoAddr: u64_,
-    pub nvDomainBusDeviceFunc: u64_,
-    pub simAccessBufPhysAddr: u64_,
-    pub notifyOpSharedSurfacePhysAddr: u64_,
-    pub pcieAtomicsOpMask: u64_,
-    pub consoleMemSize: u64_,
-    pub maxUserVa: u64_,
-    pub pciConfigMirrorBase: u32_,
-    pub pciConfigMirrorSize: u32_,
-    pub PCIDeviceID: u32_,
-    pub PCISubDeviceID: u32_,
-    pub PCIRevisionID: u32_,
-    pub pcieAtomicsCplDeviceCapMask: u32_,
-    pub oorArch: u8_,
-    pub __bindgen_padding_0: [u8; 7usize],
-    pub clPdbProperties: u64_,
-    pub Chipset: u32_,
-    pub bGpuBehindBridge: u8_,
-    pub bFlrSupported: u8_,
-    pub b64bBar0Supported: u8_,
-    pub bMnocAvailable: u8_,
-    pub chipsetL1ssEnable: u32_,
-    pub bUpstreamL0sUnsupported: u8_,
-    pub bUpstreamL1Unsupported: u8_,
-    pub bUpstreamL1PorSupported: u8_,
-    pub bUpstreamL1PorMobileOnly: u8_,
-    pub bSystemHasMux: u8_,
-    pub upstreamAddressValid: u8_,
-    pub FHBBusInfo: BUSINFO,
-    pub chipsetIDInfo: BUSINFO,
-    pub __bindgen_padding_1: [u8; 2usize],
-    pub acpiMethodData: ACPI_METHOD_DATA,
-    pub hypervisorType: u32_,
-    pub bIsPassthru: u8_,
-    pub __bindgen_padding_2: [u8; 7usize],
-    pub sysTimerOffsetNs: u64_,
-    pub gspVFInfo: GSP_VF_INFO,
-    pub bIsPrimary: u8_,
-    pub isGridBuild: u8_,
-    pub __bindgen_padding_3: [u8; 2usize],
-    pub pcieConfigReg: GSP_PCIE_CONFIG_REG,
-    pub gridBuildCsp: u32_,
-    pub bPreserveVideoMemoryAllocations: u8_,
-    pub bTdrEventSupported: u8_,
-    pub bFeatureStretchVblankCapable: u8_,
-    pub bEnableDynamicGranularityPageArrays: u8_,
-    pub bClockBoostSupported: u8_,
-    pub bRouteDispIntrsToCPU: u8_,
-    pub __bindgen_padding_4: [u8; 6usize],
-    pub hostPageSize: u64_,
-}
-#[repr(C)]
-#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct MESSAGE_QUEUE_INIT_ARGUMENTS {
     pub sharedMemPhysAddr: u64_,
     pub pageTableEntryCount: u32_,
-- 
2.50.1

