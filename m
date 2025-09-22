Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 210E5B90607
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 13:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF8710E43A;
	Mon, 22 Sep 2025 11:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EPRtSoFh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013050.outbound.protection.outlook.com
 [40.93.201.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73DD10E43A;
 Mon, 22 Sep 2025 11:31:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D9CFG83YG5s2VWjwrhGnsqTEe3tODwvBEkW34rBhbq/atPG7NHyEbrkK2sUlmJi6d4fLFtj3Xi+LtLo4u/vPWveCbTS/gJ5LjVCKSjP/8bjzdBsGrYnpu56LAA/R8oaV0SXsvRX8zGP6BV6zOrYeacWNZTC5w6v7LbKhS5C7ZLXzM36qH3cy/t7+EkPIkagcr2AhZhMBTCGzRFPF5TSSHrPxdiHXN3LfyqNHysbxa0brl5DtN1xfYhPwapJmL5/W3KIOdbNUUwyEgXdbKaJmtAzDJlhltevtcIW1jYpkRr2u1pMsr2pMENL8UHS0/+IFe1l6G+Uw7e4rbZCl10BDvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OZe67qDC7MUuO1AR+5grGQuQF2ZobHQM4kb43163zo=;
 b=MWiuF7/Hen4lSNk40s1iIw+Qje8cETYRjhU8AavqNPHJHl5T7WFBdo9iqoAD+NVX6lfwuQoKzfIKIW6D3n9FrdLOnH6x8SgWYcqiMDU+ScT9n8mGtmmVbDajeCaQYZ0bCd/T+pb+axYqxoxLLbKqy+SioeNhUUOUg7ZxAlaY2f7HghtWaCmmYGFj+8wXrQYcWkFHZWtzJj6Qv1nzVAvBUb9ppNhLD4LUjExg4zReaL2GPre/QUpbeSNg9Zp5PUU2K35TWCBl9p2Z4Bu6B/I1Y5Xa5lj5RUBR7BwFN2AOYWdyxdNE4+L80fdMhJRKTHnVLfs8zP4a4SVt9V2Pqo7W2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OZe67qDC7MUuO1AR+5grGQuQF2ZobHQM4kb43163zo=;
 b=EPRtSoFhC/gJRs+fBjO2lb3HlbVcfVBURrFwXTCgX6mlJhnHZwd33hn/ykTanRIDcRpkO1kLvdEXVuAHI53gsAqPAUrhz9u6SaxNPh9B917jMe04gW+2s+iW7bEUgw3ARGnmsKlex1gNeSlJUK2pFut8DEhf/pFbcNoWBwlXsl3SbZrWEGYpRR12Bm242AKTGQcg3RiODG/uRw+AKx+gwQtGPOdfZSSMW4Mp9FeGclSHAxmdDbwo79oJEgIkabltZpFYKFfz8oMT/qznDpHyiwfzUx91666b35k3T9qu3b1Vi+rXEr3ilG0iK0kGMtupc7Fpl4CVfd53DZqhDze5/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CY8PR12MB7683.namprd12.prod.outlook.com (2603:10b6:930:86::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.14; Mon, 22 Sep 2025 11:31:09 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 11:31:09 +0000
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
Subject: [PATCH v2 05/10] gpu: nova-core: gsp: Add GSP command queue handling
Date: Mon, 22 Sep 2025 21:30:21 +1000
Message-ID: <20250922113026.3083103-6-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250922113026.3083103-1-apopple@nvidia.com>
References: <20250922113026.3083103-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYBPR01CA0193.ausprd01.prod.outlook.com
 (2603:10c6:10:16::13) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CY8PR12MB7683:EE_
X-MS-Office365-Filtering-Correlation-Id: 4139f1fe-b5f6-446f-38c5-08ddf9cb86be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?y+led79cQAu/b5R+ZGhH4GRZ6z40yHhDE3vYm8GWG0p0mi1lPbFJY58ZrVh0?=
 =?us-ascii?Q?UgPfAcWZEH4MN4+8tl6a9LFTD04qWiRCCll2t6J4JZ1swX561WDplt6D9VuD?=
 =?us-ascii?Q?aFLxvZqPPXkHJTFfW32By7qFrohoRfR4MQSf3gF6XD7U8Oy0/si8gUU0Qenk?=
 =?us-ascii?Q?f+Wsssi+ee8mY74NPDB2STYfmGI0c61tufLmZrgR1bXT/1Ldi8YErh6ttPhu?=
 =?us-ascii?Q?FTCzw0xgy8LuHTTCn6S9t//8BHGz3pq4P7yYIImLt7E6uf9bvdFzJQEkN6J/?=
 =?us-ascii?Q?fRuKgV8fi/EJ2O51EGjGUGSv6T5hESCTscFVEYlH8VSCkZTv26kv/hVIpnIw?=
 =?us-ascii?Q?DWVLn4o3QWfy79EGBI8Qt09p0ivj9A8LFL0phBFGEsFtmbeM6tUkxxh/8Aia?=
 =?us-ascii?Q?4VmnSp1CBE4kQmsu5CxKcYPxLaF2k2gNIzRzmzbykPz4gmEhTQwYxAUxqvf5?=
 =?us-ascii?Q?pEkAd/94LgcEuoWgYK3wkdwpJVVrJl6ma1V5BPaHQnNKhp9reLllEriC5WQu?=
 =?us-ascii?Q?PZZnOQU9Wpirp7mhCzkVDheHQh26P+C7zv1z9zpBzDKRMK7FxK9PWBkwsaSE?=
 =?us-ascii?Q?clI/2HX3ZnEOc/jjuSFQuDjUPG2Si/MFE9OfuHiDfAhtKroTlFuylba2PALN?=
 =?us-ascii?Q?HWWBBOf4M2k2YzZOdxiC3Ct4+Ab8xMydNIl+UphKKQ93+ym90nXbC8RuSYEk?=
 =?us-ascii?Q?65g/GZwvq//8GIj+ZwbZVzUh+5X2BPQt5AduIc0M9TApreLjy2bU2HR67w/B?=
 =?us-ascii?Q?UtpE58t+Kyjx6xcVsn4mFu/VZBqcFUAFojXYz8Fj0UCo8KZ6M/1U4wa8CcyU?=
 =?us-ascii?Q?JM0KnU+zq9ZAb95DxVvMlFau29OiXkpxBO9K+uSzNC1b/wgRMiTVuOizbn/8?=
 =?us-ascii?Q?YeOvjnbDa7vM1JhRo6NQQI4W5xZGRaeKfoX6lEM7ytWwbI4LKqWOd1ZHV6TT?=
 =?us-ascii?Q?bDx3uCtFvpQD2+8HNqVYWh4HonQFRZnP4j4k59g3X9yrpJf5xmRASgicS4n0?=
 =?us-ascii?Q?JCrxSqLkGKWm+pgbZkWOeqm9wRp/lEbbV9DX1T0NQg15QomCO+IcylzFwfR5?=
 =?us-ascii?Q?DZ1pBFndgWpcIGA97PViNKjFdDfZ0rOKSkXxKKC8kT5n0NGYOEvx7lFImZRU?=
 =?us-ascii?Q?gxG4rq7vF7tzNKMO5SfJeC8gUP/P5ttX810zz+0G/2rpa75Pt+E5lx36GmAh?=
 =?us-ascii?Q?VLuOvAnpgYGMo/sECOA0pl0RtmRN23yylCmnhRrgVF8VeqZwNVpq+RX+QbzH?=
 =?us-ascii?Q?pIpVLhBRjb49fPmIQZE4ufVx2irG3BIA9bm7BrRhvQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WHBmUCu+j5z81UPoPAuNnmb4tuZXqbopnoooQ6cXhyjB2E82bVj5Q2U0eooY?=
 =?us-ascii?Q?9UcF+BQDIWjvuHhIIJdI3I7E8Hr11f+UIEfn4Say2zfoWG0NYlTf06ZziXR8?=
 =?us-ascii?Q?XXXsA+BWoI3W6jhNFZkBMXTkzSLwPw/stanF++i44JY45P+e4HZOhQ7cdicE?=
 =?us-ascii?Q?VQ6ddcj0oDt85OZIguqGL4FkkTt8XE1aGrCLeOgKVUT+wS3PuvCP0hEpbMTZ?=
 =?us-ascii?Q?JXxEZymwAHMa66xKi1QzBVDUOtpntrF1K/9H4tcPSa6iGLuRK5xt2vtUqFSp?=
 =?us-ascii?Q?LaDgAe0197A0/YaxYLgNNIqt03Z3KT+D4iebJ/dMqOli/V4CRZ/1QHeYeShE?=
 =?us-ascii?Q?rqXYK/lHhnvAI/BNsqwQ8foJ26eRUUYcmzSoP/h6of6F2NYO9eVC2qemKexj?=
 =?us-ascii?Q?H/G97pbokofj8CMNKlzPqUEcBgNtEkNFCwXTkjCODVG6ipgap8kg2e6nro7A?=
 =?us-ascii?Q?3ftqKugttBGLOte+XBok5qvy0oDBPBqmZ2SuW/M7PqVg2dWAN67wID7J+5Nv?=
 =?us-ascii?Q?jLB5cokfLSeA0V8JmyMnkw5kXinGG7Hog9436il00eButvMOKeulVCtTNqqM?=
 =?us-ascii?Q?GHMivRrIhDTy83SOBQLx+mmLxq5KQPnalPuf/psqCLqOLaHbEpAL8Q7p0ct8?=
 =?us-ascii?Q?lXzBHl081mIU+ub0fY/ZQbJ2a4bEi8NaflE+nCUtjrNgkojjBwx8DIjRoWq8?=
 =?us-ascii?Q?bMTgeV9/kXtqj4ej9qF0sBNqTQgc/kGpLqUwXrIyZtcYduzaBt60KT2w3s4R?=
 =?us-ascii?Q?GyzGWr6eEybw1OhqTVnpg8x9fwpEyZlUt7C1Y3fcmvsvZqivsC6pGWSHXu5H?=
 =?us-ascii?Q?vsW8XtxEnyk6WvvhjDuuvbic3t7b6dprllDinzd7emHy3Bk1aEYAXxYOYk7k?=
 =?us-ascii?Q?L5cQFTM4v7Z0yf4Y3eCcMvAD68c2izCXnrGckX9vTMvVuTn/Hxyar/tZZ6uE?=
 =?us-ascii?Q?/RnzBMXD8vjK6qdtCQHmzcsuXSgdyr+E45t9WYiE2PxxkUmVEb8yFCMH3gAQ?=
 =?us-ascii?Q?CK40HY8uTRxKODffPpbENAWP1oyzh4BOnMof13mcs2Baf+5sVP4gEK9P62/7?=
 =?us-ascii?Q?+VLJiqQgWrvJ2QsORia/30Mlopt6psQ2DiIjUz0PZgbw7Mco1vKtZXt/WP+h?=
 =?us-ascii?Q?QIslYxwwCzgZ2E+iSoeyPQmr4V6TZUZ9xfnUkKOPveBaIEFVGP6SmNQ8O6H2?=
 =?us-ascii?Q?cIS6ux/w4g1I9qgwYWzqNrDrVbcqTQLNuy0Z0+TTtdI/3AphdtM292WsxCkj?=
 =?us-ascii?Q?Oey9xcmKouFWv6/Imw5WNbDoNABXrISUVLQIPrImlHfu05EQN2GgKFJU+q2+?=
 =?us-ascii?Q?5NCCz/xolHS0paArSonyaEXeOnuiO1K9iaQ+Mtd6NacF9OSzMl52mKmN+Kib?=
 =?us-ascii?Q?UdULXGo4TA0vBHy+/rQQ2tSpwaxlwvD96BcjgPj8RD5GMTpAscJ+snn3cDan?=
 =?us-ascii?Q?zHIRFwTykq8GnOzL58SIybOuOGNywa0nV+0X/y8d4Ciot2zwmlzNrca3j+Rr?=
 =?us-ascii?Q?og08ZXLEXjE9doKoDNf2VKvFh/EHJEdaWHrxiCNkLj6cJtoTW1IwnE2JSYpK?=
 =?us-ascii?Q?pT+dK/NxYMaThRyu9sprsWVlMGkB3E3JqyGCL6ZL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4139f1fe-b5f6-446f-38c5-08ddf9cb86be
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 11:31:09.5110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 29g5KJKind2Du/8DSW9RleYQH2GAwRXcQU6Ti+LeYPaBZFmAAOQsRCHpC/PZcEKpkOw3qsCFkTUu/cfKGQ1Crw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7683
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

This commit introduces core infrastructure for handling GSP command and
message queues in the nova-core driver. The command queue system enables
bidirectional communication between the host driver and GSP firmware
through a remote message passing interface.

The interface is based on passing serialised data structures over a ring
buffer with separate transmit and receive queues. Commands are sent by
writing to the CPU transmit queue and waiting for completion via the
receive queue.

To ensure safety mutable or immutable (depending on whether it is a send
or receive operation) references are taken on the command queue when
allocating the message to write/read to. This ensures message memory
remains valid and the command queue can't be mutated whilst an operation
is in progress.

Currently this is only used by the probe() routine and therefore can
only used by a single thread of execution. Locking to enable safe access
from multiple threads will be introduced in a future series when that
becomes necessary.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Changes for v2:
 - Rebased on Alex's latest series
---
 drivers/gpu/nova-core/gsp.rs                  |  20 +-
 drivers/gpu/nova-core/gsp/cmdq.rs             | 423 ++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs               | 116 +++++
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 374 ++++++++++++++++
 drivers/gpu/nova-core/regs.rs                 |   4 +
 drivers/gpu/nova-core/sbuffer.rs              |   2 -
 6 files changed, 932 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/cmdq.rs

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 2daa46f2a514..3d4028d67d2e 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -5,6 +5,7 @@
 
 pub(crate) use fw::{GspFwWprMeta, LibosParams};
 
+use kernel::alloc::flags::GFP_KERNEL;
 use kernel::device;
 use kernel::dma::CoherentAllocation;
 use kernel::dma_write;
@@ -14,8 +15,12 @@
 use kernel::transmute::{AsBytes, FromBytes};
 
 use crate::fb::FbLayout;
+use crate::gsp::cmdq::GspCmdq;
+
 use fw::LibosMemoryRegionInitArgument;
 
+pub(crate) mod cmdq;
+
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
 pub(crate) const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
@@ -27,10 +32,11 @@ pub(crate) struct Gsp {
     pub loginit: CoherentAllocation<u8>,
     pub logintr: CoherentAllocation<u8>,
     pub logrm: CoherentAllocation<u8>,
+    pub cmdq: GspCmdq,
 }
 
 /// Creates a self-mapping page table for `obj` at its beginning.
-fn create_pte_array(obj: &mut CoherentAllocation<u8>) {
+fn create_pte_array<T: AsBytes + FromBytes>(obj: &mut CoherentAllocation<T>, skip: usize) {
     let num_pages = obj.size().div_ceil(GSP_PAGE_SIZE);
     let handle = obj.dma_handle();
 
@@ -42,7 +48,7 @@ fn create_pte_array(obj: &mut CoherentAllocation<u8>) {
     //  - The allocation size is at least as long as 8 * num_pages as
     //    GSP_PAGE_SIZE is larger than 8 bytes.
     let ptes = unsafe {
-        let ptr = obj.start_ptr_mut().cast::<u64>().add(1);
+        let ptr = obj.start_ptr_mut().cast::<u64>().add(skip);
         core::slice::from_raw_parts_mut(ptr, num_pages)
     };
 
@@ -76,17 +82,21 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self
             GFP_KERNEL | __GFP_ZERO,
         )?;
         let mut loginit = create_coherent_dma_object::<u8>(dev, "LOGINIT", 0x10000, &mut libos, 0)?;
-        create_pte_array(&mut loginit);
+        create_pte_array(&mut loginit, 1);
         let mut logintr = create_coherent_dma_object::<u8>(dev, "LOGINTR", 0x10000, &mut libos, 1)?;
-        create_pte_array(&mut logintr);
+        create_pte_array(&mut logintr, 1);
         let mut logrm = create_coherent_dma_object::<u8>(dev, "LOGRM", 0x10000, &mut libos, 2)?;
-        create_pte_array(&mut logrm);
+        create_pte_array(&mut logrm, 1);
+
+        // Creates its own PTE array
+        let cmdq = GspCmdq::new(dev)?;
 
         Ok(try_pin_init!(Self {
             libos,
             loginit,
             logintr,
             logrm,
+            cmdq,
         }))
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
new file mode 100644
index 000000000000..a9ba1a4c73d8
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -0,0 +1,423 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::mem::offset_of;
+use core::sync::atomic::fence;
+use core::sync::atomic::Ordering;
+
+use kernel::alloc::flags::GFP_KERNEL;
+use kernel::device;
+use kernel::dma::{CoherentAllocation, DmaAddress};
+use kernel::prelude::*;
+use kernel::sync::aref::ARef;
+use kernel::time::Delta;
+use kernel::transmute::{AsBytes, FromBytes};
+use kernel::{dma_read, dma_write};
+
+use super::fw::{
+    NV_VGPU_MSG_EVENT_GSP_INIT_DONE, NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE,
+    NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD, NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER,
+    NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED, NV_VGPU_MSG_EVENT_OS_ERROR_LOG,
+    NV_VGPU_MSG_EVENT_POST_EVENT, NV_VGPU_MSG_EVENT_RC_TRIGGERED,
+    NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT, NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA,
+    NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA, NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE,
+    NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY, NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT,
+    NV_VGPU_MSG_FUNCTION_ALLOC_ROOT, NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA, NV_VGPU_MSG_FUNCTION_FREE,
+    NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO, NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
+    NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU, NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL,
+    NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO, NV_VGPU_MSG_FUNCTION_LOG,
+    NV_VGPU_MSG_FUNCTION_MAP_MEMORY, NV_VGPU_MSG_FUNCTION_NOP,
+    NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO, NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
+};
+use crate::driver::Bar0;
+use crate::gsp::create_pte_array;
+use crate::gsp::fw::{GspMsgElement, MsgqRxHeader, MsgqTxHeader};
+use crate::gsp::{GSP_PAGE_SHIFT, GSP_PAGE_SIZE};
+use crate::regs::NV_PGSP_QUEUE_HEAD;
+use crate::sbuffer::SBuffer;
+use crate::util::wait_on;
+
+pub(crate) trait GspCommandToGsp: Sized + FromBytes + AsBytes {
+    const FUNCTION: u32;
+}
+
+pub(crate) trait GspMessageFromGsp: Sized + FromBytes + AsBytes {
+    const FUNCTION: u32;
+}
+
+/// Number of GSP pages making the Msgq.
+pub(crate) const MSGQ_NUM_PAGES: u32 = 0x3f;
+
+#[repr(C, align(0x1000))]
+#[derive(Debug)]
+struct MsgqData {
+    data: [[u8; GSP_PAGE_SIZE]; MSGQ_NUM_PAGES as usize],
+}
+
+// Annoyingly there is no real equivalent of #define so we're forced to use a
+// literal to specify the alignment above. So check that against the actual GSP
+// page size here.
+static_assert!(align_of::<MsgqData>() == GSP_PAGE_SIZE);
+
+// There is no struct defined for this in the open-gpu-kernel-source headers.
+// Instead it is defined by code in GspMsgQueuesInit().
+#[repr(C)]
+struct Msgq {
+    tx: MsgqTxHeader,
+    rx: MsgqRxHeader,
+    msgq: MsgqData,
+}
+
+#[repr(C)]
+struct GspMem {
+    ptes: [u8; GSP_PAGE_SIZE],
+    cpuq: Msgq,
+    gspq: Msgq,
+}
+
+// SAFETY: These structs don't meet the no-padding requirements of AsBytes but
+// that is not a problem because they are not used outside the kernel.
+unsafe impl AsBytes for GspMem {}
+
+// SAFETY: These structs don't meet the no-padding requirements of FromBytes but
+// that is not a problem because they are not used outside the kernel.
+unsafe impl FromBytes for GspMem {}
+
+/// `GspMem` struct that is shared with the GSP.
+struct DmaGspMem(CoherentAllocation<GspMem>);
+
+impl DmaGspMem {
+    fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
+        const MSGQ_SIZE: u32 = size_of::<Msgq>() as u32;
+        const RX_HDR_OFF: u32 = offset_of!(Msgq, rx) as u32;
+
+        let mut gsp_mem =
+            CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
+        create_pte_array(&mut gsp_mem, 0);
+        dma_write!(gsp_mem[0].cpuq.tx = MsgqTxHeader::new(MSGQ_SIZE, RX_HDR_OFF))?;
+        dma_write!(gsp_mem[0].cpuq.rx = MsgqRxHeader::new())?;
+
+        Ok(Self(gsp_mem))
+    }
+
+    #[expect(unused)]
+    fn dma_handle(&self) -> DmaAddress {
+        self.0.dma_handle()
+    }
+
+    /// # Safety
+    ///
+    /// The caller must ensure that the device doesn't access the parts of the [`GspMem`] it works
+    /// with.
+    unsafe fn access_mut(&mut self) -> &mut GspMem {
+        // SAFETY:
+        // - The [`CoherentAllocation`] contains exactly one object.
+        // - Per the safety statement of the function, no concurrent access wil be performed.
+        &mut unsafe { self.0.as_slice_mut(0, 1) }.unwrap()[0]
+    }
+
+    /// # Safety
+    ///
+    /// The caller must ensure that the device doesn't access the parts of the [`GspMem`] it works
+    /// with.
+    unsafe fn access(&self) -> &GspMem {
+        // SAFETY:
+        // - The [`CoherentAllocation`] contains exactly one object.
+        // - Per the safety statement of the function, no concurrent access wil be performed.
+        &unsafe { self.0.as_slice(0, 1) }.unwrap()[0]
+    }
+
+    fn driver_write_area(&mut self) -> (&mut [[u8; GSP_PAGE_SIZE]], &mut [[u8; GSP_PAGE_SIZE]]) {
+        let tx = self.cpu_write_ptr() as usize;
+        let rx = self.gsp_read_ptr() as usize;
+
+        // SAFETY: we will only access the driver-owned part of the shared memory.
+        let gsp_mem = unsafe { self.access_mut() };
+        let (before_tx, after_tx) = gsp_mem.cpuq.msgq.data.split_at_mut(tx);
+
+        if rx <= tx {
+            // The area from `tx` up to the end of the ring, and from the beginning of the ring up
+            // to `rx`, minus one unit, belongs to the driver.
+            if rx == 0 {
+                let last = after_tx.len() - 1;
+                (&mut after_tx[..last], &mut before_tx[0..0])
+            } else {
+                (after_tx, &mut before_tx[..rx])
+            }
+        } else {
+            // The area from `tx` to `rx`, minus one unit, belongs to the driver.
+            (after_tx.split_at_mut(rx - tx).0, &mut before_tx[0..0])
+        }
+    }
+
+    fn driver_read_area(&self) -> (&[[u8; GSP_PAGE_SIZE]], &[[u8; GSP_PAGE_SIZE]]) {
+        let tx = self.gsp_write_ptr() as usize;
+        let rx = self.cpu_read_ptr() as usize;
+
+        // SAFETY: we will only access the driver-owned part of the shared memory.
+        let gsp_mem = unsafe { self.access() };
+        let (before_rx, after_rx) = gsp_mem.gspq.msgq.data.split_at(rx);
+
+        if tx <= rx {
+            // The area from `rx` up to the end of the ring, and from the beginning of the ring up
+            // to `tx`, minus one unit, belongs to the driver.
+            if tx == 0 {
+                let last = after_rx.len() - 1;
+                (&after_rx[..last], &before_rx[0..0])
+            } else {
+                (after_rx, &before_rx[..tx])
+            }
+        } else {
+            // The area from `rx` to `tx`, minus one unit, belongs to the driver.
+            (after_rx.split_at(tx - rx).0, &before_rx[0..0])
+        }
+    }
+
+    fn gsp_write_ptr(&self) -> u32 {
+        let gsp_mem = &self.0;
+        dma_read!(gsp_mem[0].gspq.tx.writePtr).unwrap() % MSGQ_NUM_PAGES
+    }
+
+    fn gsp_read_ptr(&self) -> u32 {
+        let gsp_mem = &self.0;
+        dma_read!(gsp_mem[0].gspq.rx.readPtr).unwrap() % MSGQ_NUM_PAGES
+    }
+
+    fn cpu_read_ptr(&self) -> u32 {
+        let gsp_mem = &self.0;
+        dma_read!(gsp_mem[0].cpuq.rx.readPtr).unwrap() % MSGQ_NUM_PAGES
+    }
+
+    /// Inform the GSP that it can send `elem_count` new pages into the message queue.
+    fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
+        let gsp_mem = &self.0;
+        let rptr = self.cpu_read_ptr().wrapping_add(elem_count) % MSGQ_NUM_PAGES;
+
+        // Ensure read pointer is properly ordered
+        fence(Ordering::SeqCst);
+
+        dma_write!(gsp_mem[0].cpuq.rx.readPtr = rptr).unwrap();
+    }
+
+    fn cpu_write_ptr(&self) -> u32 {
+        let gsp_mem = &self.0;
+        dma_read!(gsp_mem[0].cpuq.tx.writePtr).unwrap() % MSGQ_NUM_PAGES
+    }
+
+    /// Inform the GSP that it can process `elem_count` new pages from the command queue.
+    fn advance_cpu_write_ptr(&mut self, elem_count: u32) {
+        let gsp_mem = &self.0;
+        let wptr = self.cpu_write_ptr().wrapping_add(elem_count) & MSGQ_NUM_PAGES;
+        dma_write!(gsp_mem[0].cpuq.tx.writePtr = wptr).unwrap();
+
+        // Ensure all command data is visible before triggering the GSP read
+        fence(Ordering::SeqCst);
+    }
+}
+
+pub(crate) struct GspCmdq {
+    dev: ARef<device::Device>,
+    seq: u32,
+    gsp_mem: DmaGspMem,
+    pub _nr_ptes: u32,
+}
+
+impl GspCmdq {
+    pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<GspCmdq> {
+        let gsp_mem = DmaGspMem::new(dev)?;
+        let nr_ptes = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
+        build_assert!(nr_ptes * size_of::<u64>() <= GSP_PAGE_SIZE);
+
+        Ok(GspCmdq {
+            dev: dev.into(),
+            seq: 0,
+            gsp_mem,
+            _nr_ptes: nr_ptes as u32,
+        })
+    }
+
+    fn calculate_checksum<T: Iterator<Item = u8>>(it: T) -> u32 {
+        let sum64 = it
+            .enumerate()
+            .map(|(idx, byte)| (((idx % 8) * 8) as u32, byte))
+            .fold(0, |acc, (rol, byte)| acc ^ u64::from(byte).rotate_left(rol));
+
+        ((sum64 >> 32) as u32) ^ (sum64 as u32)
+    }
+
+    #[expect(unused)]
+    pub(crate) fn send_gsp_command<M: GspCommandToGsp>(
+        &mut self,
+        bar: &Bar0,
+        payload_size: usize,
+        init: impl FnOnce(&mut M, SBuffer<core::array::IntoIter<&mut [u8], 2>>) -> Result,
+    ) -> Result {
+        // TODO: a method that extracts the regions for a given command?
+        // ... and another that reduces the region to a given number of bytes!
+        let driver_area = self.gsp_mem.driver_write_area();
+        let free_tx_pages = driver_area.0.len() + driver_area.1.len();
+
+        // Total size of the message, including the headers, command, and optional payload.
+        let msg_size = size_of::<GspMsgElement>() + size_of::<M>() + payload_size;
+        if free_tx_pages < msg_size.div_ceil(GSP_PAGE_SIZE) {
+            return Err(EAGAIN);
+        }
+
+        let (msg_header, cmd, payload_1, payload_2) = {
+            // TODO: find an alternative to as_flattened_mut()
+            #[allow(clippy::incompatible_msrv)]
+            let (msg_header_slice, slice_1) = driver_area
+                .0
+                .as_flattened_mut()
+                .split_at_mut(size_of::<GspMsgElement>());
+            let msg_header = GspMsgElement::from_bytes_mut(msg_header_slice).ok_or(EINVAL)?;
+            let (cmd_slice, payload_1) = slice_1.split_at_mut(size_of::<M>());
+            let cmd = M::from_bytes_mut(cmd_slice).ok_or(EINVAL)?;
+            // TODO: find an alternative to as_flattened_mut()
+            #[allow(clippy::incompatible_msrv)]
+            let payload_2 = driver_area.1.as_flattened_mut();
+            // TODO: Replace this workaround to cut the payload size.
+            let (payload_1, payload_2) = match payload_size.checked_sub(payload_1.len()) {
+                // The payload is longer than `payload_1`, set `payload_2` size to the difference.
+                Some(payload_2_len) => (payload_1, &mut payload_2[..payload_2_len]),
+                // `payload_1` is longer than the payload, we need to reduce its size.
+                None => (&mut payload_1[..payload_size], payload_2),
+            };
+
+            (msg_header, cmd, payload_1, payload_2)
+        };
+
+        let sbuffer = SBuffer::new_writer([&mut payload_1[..], &mut payload_2[..]]);
+        init(cmd, sbuffer)?;
+
+        *msg_header = GspMsgElement::new(self.seq, size_of::<M>() + payload_size, M::FUNCTION);
+        msg_header.checkSum = GspCmdq::calculate_checksum(SBuffer::new_reader([
+            msg_header.as_bytes(),
+            cmd.as_bytes(),
+            payload_1,
+            payload_2,
+        ]));
+
+        let rpc_header = &msg_header.rpc;
+        dev_info!(
+            &self.dev,
+            "GSP RPC: send: seq# {}, function=0x{:x} ({}), length=0x{:x}\n",
+            self.seq,
+            rpc_header.function,
+            decode_gsp_function(rpc_header.function),
+            rpc_header.length,
+        );
+
+        let elem_count = msg_header.elemCount;
+        self.seq += 1;
+        self.gsp_mem.advance_cpu_write_ptr(elem_count);
+        NV_PGSP_QUEUE_HEAD::default().set_address(0).write(bar);
+
+        Ok(())
+    }
+
+    #[expect(unused)]
+    pub(crate) fn receive_msg_from_gsp<M: GspMessageFromGsp, R>(
+        &mut self,
+        timeout: Delta,
+        init: impl FnOnce(&M, SBuffer<core::array::IntoIter<&[u8], 2>>) -> Result<R>,
+    ) -> Result<R> {
+        let (driver_area, msg_header, slice_1) = wait_on(timeout, || {
+            let driver_area = self.gsp_mem.driver_read_area();
+            // TODO: find an alternative to as_flattened()
+            #[allow(clippy::incompatible_msrv)]
+            let (msg_header_slice, slice_1) = driver_area
+                .0
+                .as_flattened()
+                .split_at(size_of::<GspMsgElement>());
+
+            // Can't fail because msg_slice will always be
+            // size_of::<GspMsgElement>() bytes long by the above split.
+            let msg_header = GspMsgElement::from_bytes(msg_header_slice).unwrap();
+            if msg_header.rpc.length < size_of::<M>() as u32 {
+                return None;
+            }
+
+            Some((driver_area, msg_header, slice_1))
+        })?;
+
+        let (cmd_slice, payload_1) = slice_1.split_at(size_of::<M>());
+        let cmd = M::from_bytes(cmd_slice).ok_or(EINVAL)?;
+        // TODO: find an alternative to as_flattened()
+        #[allow(clippy::incompatible_msrv)]
+        let payload_2 = driver_area.1.as_flattened();
+
+        // Log RPC receive with message type decoding
+        dev_info!(
+            self.dev,
+            "GSP RPC: receive: seq# {}, function=0x{:x} ({}), length=0x{:x}\n",
+            msg_header.rpc.sequence,
+            msg_header.rpc.function,
+            decode_gsp_function(msg_header.rpc.function),
+            msg_header.rpc.length,
+        );
+
+        if GspCmdq::calculate_checksum(SBuffer::new_reader([
+            msg_header.as_bytes(),
+            cmd.as_bytes(),
+            payload_1,
+            payload_2,
+        ])) != 0
+        {
+            dev_err!(
+                self.dev,
+                "GSP RPC: receive: Call {} - bad checksum",
+                msg_header.rpc.sequence
+            );
+            return Err(EIO);
+        }
+
+        let result = if msg_header.rpc.function == M::FUNCTION {
+            let sbuffer = SBuffer::new_reader([payload_1, payload_2]);
+            init(cmd, sbuffer)
+        } else {
+            Err(ERANGE)
+        };
+
+        self.gsp_mem
+            .advance_cpu_read_ptr(msg_header.rpc.length.div_ceil(GSP_PAGE_SIZE as u32));
+        result
+    }
+}
+
+fn decode_gsp_function(function: u32) -> &'static str {
+    match function {
+        // Common function codes
+        NV_VGPU_MSG_FUNCTION_NOP => "NOP",
+        NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO => "SET_GUEST_SYSTEM_INFO",
+        NV_VGPU_MSG_FUNCTION_ALLOC_ROOT => "ALLOC_ROOT",
+        NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE => "ALLOC_DEVICE",
+        NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY => "ALLOC_MEMORY",
+        NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA => "ALLOC_CTX_DMA",
+        NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA => "ALLOC_CHANNEL_DMA",
+        NV_VGPU_MSG_FUNCTION_MAP_MEMORY => "MAP_MEMORY",
+        NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA => "BIND_CTX_DMA",
+        NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT => "ALLOC_OBJECT",
+        NV_VGPU_MSG_FUNCTION_FREE => "FREE",
+        NV_VGPU_MSG_FUNCTION_LOG => "LOG",
+        NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO => "GET_GSP_STATIC_INFO",
+        NV_VGPU_MSG_FUNCTION_SET_REGISTRY => "SET_REGISTRY",
+        NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO => "GSP_SET_SYSTEM_INFO",
+        NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU => "GSP_INIT_POST_OBJGPU",
+        NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL => "GSP_RM_CONTROL",
+        NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO => "GET_STATIC_INFO",
+
+        // Event codes
+        NV_VGPU_MSG_EVENT_GSP_INIT_DONE => "INIT_DONE",
+        NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER => "RUN_CPU_SEQUENCER",
+        NV_VGPU_MSG_EVENT_POST_EVENT => "POST_EVENT",
+        NV_VGPU_MSG_EVENT_RC_TRIGGERED => "RC_TRIGGERED",
+        NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED => "MMU_FAULT_QUEUED",
+        NV_VGPU_MSG_EVENT_OS_ERROR_LOG => "OS_ERROR_LOG",
+        NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD => "NOCAT",
+        NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE => "LOCKDOWN_NOTICE",
+        NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT => "LIBOS_PRINT",
+
+        // Default for unknown codes
+        _ => "UNKNOWN",
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 7f4fe684ddaf..2e4255301e58 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -15,7 +15,9 @@
 use crate::firmware::gsp::GspFirmware;
 use crate::gpu::Chipset;
 use crate::gsp;
+use crate::gsp::cmdq::MSGQ_NUM_PAGES;
 use crate::gsp::FbLayout;
+use crate::gsp::GSP_PAGE_SIZE;
 
 /// Dummy type to group methods related to heap parameters for running the GSP firmware.
 pub(crate) struct GspFwHeapParams(());
@@ -159,6 +161,37 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
     // GSP firmware constants
     GSP_FW_WPR_META_MAGIC,
     GSP_FW_WPR_META_REVISION,
+
+    // GSP events
+    NV_VGPU_MSG_EVENT_GSP_INIT_DONE,
+    NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE,
+    NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD,
+    NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER,
+    NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED,
+    NV_VGPU_MSG_EVENT_OS_ERROR_LOG,
+    NV_VGPU_MSG_EVENT_POST_EVENT,
+    NV_VGPU_MSG_EVENT_RC_TRIGGERED,
+    NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT,
+
+    // GSP function calls
+    NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA,
+    NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA,
+    NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE,
+    NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY,
+    NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT,
+    NV_VGPU_MSG_FUNCTION_ALLOC_ROOT,
+    NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA,
+    NV_VGPU_MSG_FUNCTION_FREE,
+    NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO,
+    NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
+    NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU,
+    NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL,
+    NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO,
+    NV_VGPU_MSG_FUNCTION_LOG,
+    NV_VGPU_MSG_FUNCTION_MAP_MEMORY,
+    NV_VGPU_MSG_FUNCTION_NOP,
+    NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO,
+    NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
 };
 
 #[repr(transparent)]
@@ -197,3 +230,86 @@ fn id8(name: &str) -> u64 {
         })
     }
 }
+
+pub(crate) type MsgqTxHeader = bindings::msgqTxHeader;
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for MsgqTxHeader {}
+
+impl MsgqTxHeader {
+    pub(crate) fn new(msgq_size: u32, rx_hdr_offset: u32) -> Self {
+        Self {
+            version: 0,
+            size: msgq_size,
+            msgSize: GSP_PAGE_SIZE as u32,
+            msgCount: MSGQ_NUM_PAGES,
+            writePtr: 0,
+            flags: 1,
+            rxHdrOff: rx_hdr_offset,
+            entryOff: GSP_PAGE_SIZE as u32,
+        }
+    }
+}
+
+/// RX header for setting up a message queue with the GSP.
+///
+/// # Invariants
+///
+/// [`Self::read_ptr`] is guaranteed to return a value in the range `0..NUM_PAGES`.
+pub(crate) type MsgqRxHeader = bindings::msgqRxHeader;
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for MsgqRxHeader {}
+
+impl MsgqRxHeader {
+    pub(crate) fn new() -> Self {
+        Default::default()
+    }
+}
+
+pub(crate) type GspRpcHeader = bindings::rpc_message_header_v;
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GspRpcHeader {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for GspRpcHeader {}
+
+impl GspRpcHeader {
+    pub(crate) fn new(cmd_size: u32, function: u32) -> Self {
+        Self {
+            // TODO: magic number
+            header_version: 0x03000000,
+            signature: bindings::NV_VGPU_MSG_SIGNATURE_VALID,
+            function,
+            // TODO: overflow check?
+            length: size_of::<Self>() as u32 + cmd_size,
+            rpc_result: 0xffffffff,
+            rpc_result_private: 0xffffffff,
+            ..Default::default()
+        }
+    }
+}
+
+pub(crate) type GspMsgElement = bindings::GSP_MSG_QUEUE_ELEMENT;
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GspMsgElement {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for GspMsgElement {}
+
+impl GspMsgElement {
+    pub(crate) fn new(sequence: u32, cmd_size: usize, function: u32) -> Self {
+        Self {
+            seqNum: sequence,
+            // TODO: overflow check and fallible div?
+            elemCount: (size_of::<Self>() + cmd_size).div_ceil(GSP_PAGE_SIZE) as u32,
+            // TODO: fallible conversion.
+            rpc: GspRpcHeader::new(cmd_size as u32, function),
+            ..Default::default()
+        }
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 392b25dc6991..3d96d91e5b12 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -1,5 +1,36 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#[repr(C)]
+#[derive(Default)]
+pub struct __IncompleteArrayField<T>(::core::marker::PhantomData<T>, [T; 0]);
+impl<T> __IncompleteArrayField<T> {
+    #[inline]
+    pub const fn new() -> Self {
+        __IncompleteArrayField(::core::marker::PhantomData, [])
+    }
+    #[inline]
+    pub fn as_ptr(&self) -> *const T {
+        self as *const _ as *const T
+    }
+    #[inline]
+    pub fn as_mut_ptr(&mut self) -> *mut T {
+        self as *mut _ as *mut T
+    }
+    #[inline]
+    pub unsafe fn as_slice(&self, len: usize) -> &[T] {
+        ::core::slice::from_raw_parts(self.as_ptr(), len)
+    }
+    #[inline]
+    pub unsafe fn as_mut_slice(&mut self, len: usize) -> &mut [T] {
+        ::core::slice::from_raw_parts_mut(self.as_mut_ptr(), len)
+    }
+}
+impl<T> ::core::fmt::Debug for __IncompleteArrayField<T> {
+    fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
+        fmt.write_str("__IncompleteArrayField")
+    }
+}
+pub const NV_VGPU_MSG_SIGNATURE_VALID: u32 = 1129337430;
 pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2: u32 = 0;
 pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL: u32 = 23068672;
 pub const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X: u32 = 8388608;
@@ -19,6 +50,312 @@
 pub type u16_ = __u16;
 pub type u32_ = __u32;
 pub type u64_ = __u64;
+pub const NV_VGPU_MSG_FUNCTION_NOP: _bindgen_ty_2 = 0;
+pub const NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO: _bindgen_ty_2 = 1;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_ROOT: _bindgen_ty_2 = 2;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE: _bindgen_ty_2 = 3;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY: _bindgen_ty_2 = 4;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA: _bindgen_ty_2 = 5;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA: _bindgen_ty_2 = 6;
+pub const NV_VGPU_MSG_FUNCTION_MAP_MEMORY: _bindgen_ty_2 = 7;
+pub const NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA: _bindgen_ty_2 = 8;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT: _bindgen_ty_2 = 9;
+pub const NV_VGPU_MSG_FUNCTION_FREE: _bindgen_ty_2 = 10;
+pub const NV_VGPU_MSG_FUNCTION_LOG: _bindgen_ty_2 = 11;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_VIDMEM: _bindgen_ty_2 = 12;
+pub const NV_VGPU_MSG_FUNCTION_UNMAP_MEMORY: _bindgen_ty_2 = 13;
+pub const NV_VGPU_MSG_FUNCTION_MAP_MEMORY_DMA: _bindgen_ty_2 = 14;
+pub const NV_VGPU_MSG_FUNCTION_UNMAP_MEMORY_DMA: _bindgen_ty_2 = 15;
+pub const NV_VGPU_MSG_FUNCTION_GET_EDID: _bindgen_ty_2 = 16;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_DISP_CHANNEL: _bindgen_ty_2 = 17;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_DISP_OBJECT: _bindgen_ty_2 = 18;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_SUBDEVICE: _bindgen_ty_2 = 19;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_DYNAMIC_MEMORY: _bindgen_ty_2 = 20;
+pub const NV_VGPU_MSG_FUNCTION_DUP_OBJECT: _bindgen_ty_2 = 21;
+pub const NV_VGPU_MSG_FUNCTION_IDLE_CHANNELS: _bindgen_ty_2 = 22;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_EVENT: _bindgen_ty_2 = 23;
+pub const NV_VGPU_MSG_FUNCTION_SEND_EVENT: _bindgen_ty_2 = 24;
+pub const NV_VGPU_MSG_FUNCTION_REMAPPER_CONTROL: _bindgen_ty_2 = 25;
+pub const NV_VGPU_MSG_FUNCTION_DMA_CONTROL: _bindgen_ty_2 = 26;
+pub const NV_VGPU_MSG_FUNCTION_DMA_FILL_PTE_MEM: _bindgen_ty_2 = 27;
+pub const NV_VGPU_MSG_FUNCTION_MANAGE_HW_RESOURCE: _bindgen_ty_2 = 28;
+pub const NV_VGPU_MSG_FUNCTION_BIND_ARBITRARY_CTX_DMA: _bindgen_ty_2 = 29;
+pub const NV_VGPU_MSG_FUNCTION_CREATE_FB_SEGMENT: _bindgen_ty_2 = 30;
+pub const NV_VGPU_MSG_FUNCTION_DESTROY_FB_SEGMENT: _bindgen_ty_2 = 31;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_SHARE_DEVICE: _bindgen_ty_2 = 32;
+pub const NV_VGPU_MSG_FUNCTION_DEFERRED_API_CONTROL: _bindgen_ty_2 = 33;
+pub const NV_VGPU_MSG_FUNCTION_REMOVE_DEFERRED_API: _bindgen_ty_2 = 34;
+pub const NV_VGPU_MSG_FUNCTION_SIM_ESCAPE_READ: _bindgen_ty_2 = 35;
+pub const NV_VGPU_MSG_FUNCTION_SIM_ESCAPE_WRITE: _bindgen_ty_2 = 36;
+pub const NV_VGPU_MSG_FUNCTION_SIM_MANAGE_DISPLAY_CONTEXT_DMA: _bindgen_ty_2 = 37;
+pub const NV_VGPU_MSG_FUNCTION_FREE_VIDMEM_VIRT: _bindgen_ty_2 = 38;
+pub const NV_VGPU_MSG_FUNCTION_PERF_GET_PSTATE_INFO: _bindgen_ty_2 = 39;
+pub const NV_VGPU_MSG_FUNCTION_PERF_GET_PERFMON_SAMPLE: _bindgen_ty_2 = 40;
+pub const NV_VGPU_MSG_FUNCTION_PERF_GET_VIRTUAL_PSTATE_INFO: _bindgen_ty_2 = 41;
+pub const NV_VGPU_MSG_FUNCTION_PERF_GET_LEVEL_INFO: _bindgen_ty_2 = 42;
+pub const NV_VGPU_MSG_FUNCTION_MAP_SEMA_MEMORY: _bindgen_ty_2 = 43;
+pub const NV_VGPU_MSG_FUNCTION_UNMAP_SEMA_MEMORY: _bindgen_ty_2 = 44;
+pub const NV_VGPU_MSG_FUNCTION_SET_SURFACE_PROPERTIES: _bindgen_ty_2 = 45;
+pub const NV_VGPU_MSG_FUNCTION_CLEANUP_SURFACE: _bindgen_ty_2 = 46;
+pub const NV_VGPU_MSG_FUNCTION_UNLOADING_GUEST_DRIVER: _bindgen_ty_2 = 47;
+pub const NV_VGPU_MSG_FUNCTION_TDR_SET_TIMEOUT_STATE: _bindgen_ty_2 = 48;
+pub const NV_VGPU_MSG_FUNCTION_SWITCH_TO_VGA: _bindgen_ty_2 = 49;
+pub const NV_VGPU_MSG_FUNCTION_GPU_EXEC_REG_OPS: _bindgen_ty_2 = 50;
+pub const NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO: _bindgen_ty_2 = 51;
+pub const NV_VGPU_MSG_FUNCTION_ALLOC_VIRTMEM: _bindgen_ty_2 = 52;
+pub const NV_VGPU_MSG_FUNCTION_UPDATE_PDE_2: _bindgen_ty_2 = 53;
+pub const NV_VGPU_MSG_FUNCTION_SET_PAGE_DIRECTORY: _bindgen_ty_2 = 54;
+pub const NV_VGPU_MSG_FUNCTION_GET_STATIC_PSTATE_INFO: _bindgen_ty_2 = 55;
+pub const NV_VGPU_MSG_FUNCTION_TRANSLATE_GUEST_GPU_PTES: _bindgen_ty_2 = 56;
+pub const NV_VGPU_MSG_FUNCTION_RESERVED_57: _bindgen_ty_2 = 57;
+pub const NV_VGPU_MSG_FUNCTION_RESET_CURRENT_GR_CONTEXT: _bindgen_ty_2 = 58;
+pub const NV_VGPU_MSG_FUNCTION_SET_SEMA_MEM_VALIDATION_STATE: _bindgen_ty_2 = 59;
+pub const NV_VGPU_MSG_FUNCTION_GET_ENGINE_UTILIZATION: _bindgen_ty_2 = 60;
+pub const NV_VGPU_MSG_FUNCTION_UPDATE_GPU_PDES: _bindgen_ty_2 = 61;
+pub const NV_VGPU_MSG_FUNCTION_GET_ENCODER_CAPACITY: _bindgen_ty_2 = 62;
+pub const NV_VGPU_MSG_FUNCTION_VGPU_PF_REG_READ32: _bindgen_ty_2 = 63;
+pub const NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO_EXT: _bindgen_ty_2 = 64;
+pub const NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO: _bindgen_ty_2 = 65;
+pub const NV_VGPU_MSG_FUNCTION_RMFS_INIT: _bindgen_ty_2 = 66;
+pub const NV_VGPU_MSG_FUNCTION_RMFS_CLOSE_QUEUE: _bindgen_ty_2 = 67;
+pub const NV_VGPU_MSG_FUNCTION_RMFS_CLEANUP: _bindgen_ty_2 = 68;
+pub const NV_VGPU_MSG_FUNCTION_RMFS_TEST: _bindgen_ty_2 = 69;
+pub const NV_VGPU_MSG_FUNCTION_UPDATE_BAR_PDE: _bindgen_ty_2 = 70;
+pub const NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD: _bindgen_ty_2 = 71;
+pub const NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO: _bindgen_ty_2 = 72;
+pub const NV_VGPU_MSG_FUNCTION_SET_REGISTRY: _bindgen_ty_2 = 73;
+pub const NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU: _bindgen_ty_2 = 74;
+pub const NV_VGPU_MSG_FUNCTION_SUBDEV_EVENT_SET_NOTIFICATION: _bindgen_ty_2 = 75;
+pub const NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL: _bindgen_ty_2 = 76;
+pub const NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO2: _bindgen_ty_2 = 77;
+pub const NV_VGPU_MSG_FUNCTION_DUMP_PROTOBUF_COMPONENT: _bindgen_ty_2 = 78;
+pub const NV_VGPU_MSG_FUNCTION_UNSET_PAGE_DIRECTORY: _bindgen_ty_2 = 79;
+pub const NV_VGPU_MSG_FUNCTION_GET_CONSOLIDATED_STATIC_INFO: _bindgen_ty_2 = 80;
+pub const NV_VGPU_MSG_FUNCTION_GMMU_REGISTER_FAULT_BUFFER: _bindgen_ty_2 = 81;
+pub const NV_VGPU_MSG_FUNCTION_GMMU_UNREGISTER_FAULT_BUFFER: _bindgen_ty_2 = 82;
+pub const NV_VGPU_MSG_FUNCTION_GMMU_REGISTER_CLIENT_SHADOW_FAULT_BUFFER: _bindgen_ty_2 = 83;
+pub const NV_VGPU_MSG_FUNCTION_GMMU_UNREGISTER_CLIENT_SHADOW_FAULT_BUFFER: _bindgen_ty_2 = 84;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_VGPU_FB_USAGE: _bindgen_ty_2 = 85;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_NVFBC_SW_SESSION_UPDATE_INFO: _bindgen_ty_2 = 86;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_NVENC_SW_SESSION_UPDATE_INFO: _bindgen_ty_2 = 87;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RESET_CHANNEL: _bindgen_ty_2 = 88;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RESET_ISOLATED_CHANNEL: _bindgen_ty_2 = 89;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_HANDLE_VF_PRI_FAULT: _bindgen_ty_2 = 90;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CLK_GET_EXTENDED_INFO: _bindgen_ty_2 = 91;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PERF_BOOST: _bindgen_ty_2 = 92;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PERF_VPSTATES_GET_CONTROL: _bindgen_ty_2 = 93;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_ZBC_CLEAR_TABLE: _bindgen_ty_2 = 94;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_ZBC_COLOR_CLEAR: _bindgen_ty_2 = 95;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_ZBC_DEPTH_CLEAR: _bindgen_ty_2 = 96;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPFIFO_SCHEDULE: _bindgen_ty_2 = 97;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_TIMESLICE: _bindgen_ty_2 = 98;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PREEMPT: _bindgen_ty_2 = 99;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FIFO_DISABLE_CHANNELS: _bindgen_ty_2 = 100;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_TSG_INTERLEAVE_LEVEL: _bindgen_ty_2 = 101;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_CHANNEL_INTERLEAVE_LEVEL: _bindgen_ty_2 = 102;
+pub const NV_VGPU_MSG_FUNCTION_GSP_RM_ALLOC: _bindgen_ty_2 = 103;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_P2P_CAPS_V2: _bindgen_ty_2 = 104;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CIPHER_AES_ENCRYPT: _bindgen_ty_2 = 105;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CIPHER_SESSION_KEY: _bindgen_ty_2 = 106;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CIPHER_SESSION_KEY_STATUS: _bindgen_ty_2 = 107;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_CLEAR_ALL_SM_ERROR_STATES: _bindgen_ty_2 = 108;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_READ_ALL_SM_ERROR_STATES: _bindgen_ty_2 = 109;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SET_EXCEPTION_MASK: _bindgen_ty_2 = 110;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_PROMOTE_CTX: _bindgen_ty_2 = 111;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_CTXSW_PREEMPTION_BIND: _bindgen_ty_2 = 112;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_SET_CTXSW_PREEMPTION_MODE: _bindgen_ty_2 = 113;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_CTXSW_ZCULL_BIND: _bindgen_ty_2 = 114;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_INITIALIZE_CTX: _bindgen_ty_2 = 115;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_VASPACE_COPY_SERVER_RESERVED_PDES: _bindgen_ty_2 = 116;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FIFO_CLEAR_FAULTED_BIT: _bindgen_ty_2 = 117;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_LATEST_ECC_ADDRESSES: _bindgen_ty_2 = 118;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_MC_SERVICE_INTERRUPTS: _bindgen_ty_2 = 119;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DMA_SET_DEFAULT_VASPACE: _bindgen_ty_2 = 120;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_CE_PCE_MASK: _bindgen_ty_2 = 121;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_ZBC_CLEAR_TABLE_ENTRY: _bindgen_ty_2 = 122;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_NVLINK_PEER_ID_MASK: _bindgen_ty_2 = 123;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_NVLINK_STATUS: _bindgen_ty_2 = 124;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_P2P_CAPS: _bindgen_ty_2 = 125;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_P2P_CAPS_MATRIX: _bindgen_ty_2 = 126;
+pub const NV_VGPU_MSG_FUNCTION_RESERVED_0: _bindgen_ty_2 = 127;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RESERVE_PM_AREA_SMPC: _bindgen_ty_2 = 128;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RESERVE_HWPM_LEGACY: _bindgen_ty_2 = 129;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_B0CC_EXEC_REG_OPS: _bindgen_ty_2 = 130;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_BIND_PM_RESOURCES: _bindgen_ty_2 = 131;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SUSPEND_CONTEXT: _bindgen_ty_2 = 132;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_RESUME_CONTEXT: _bindgen_ty_2 = 133;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_EXEC_REG_OPS: _bindgen_ty_2 = 134;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SET_MODE_MMU_DEBUG: _bindgen_ty_2 = 135;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_READ_SINGLE_SM_ERROR_STATE: _bindgen_ty_2 = 136;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_CLEAR_SINGLE_SM_ERROR_STATE: _bindgen_ty_2 = 137;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SET_MODE_ERRBAR_DEBUG: _bindgen_ty_2 = 138;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SET_NEXT_STOP_TRIGGER_TYPE: _bindgen_ty_2 = 139;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_ALLOC_PMA_STREAM: _bindgen_ty_2 = 140;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PMA_STREAM_UPDATE_GET_PUT: _bindgen_ty_2 = 141;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FB_GET_INFO_V2: _bindgen_ty_2 = 142;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FIFO_SET_CHANNEL_PROPERTIES: _bindgen_ty_2 = 143;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_GET_CTX_BUFFER_INFO: _bindgen_ty_2 = 144;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_KGR_GET_CTX_BUFFER_PTES: _bindgen_ty_2 = 145;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_EVICT_CTX: _bindgen_ty_2 = 146;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FB_GET_FS_INFO: _bindgen_ty_2 = 147;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GRMGR_GET_GR_FS_INFO: _bindgen_ty_2 = 148;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_STOP_CHANNEL: _bindgen_ty_2 = 149;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_PC_SAMPLING_MODE: _bindgen_ty_2 = 150;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PERF_RATED_TDP_GET_STATUS: _bindgen_ty_2 = 151;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PERF_RATED_TDP_SET_CONTROL: _bindgen_ty_2 = 152;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FREE_PMA_STREAM: _bindgen_ty_2 = 153;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_TIMER_SET_GR_TICK_FREQ: _bindgen_ty_2 = 154;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FIFO_SETUP_VF_ZOMBIE_SUBCTX_PDB: _bindgen_ty_2 = 155;
+pub const NV_VGPU_MSG_FUNCTION_GET_CONSOLIDATED_GR_STATIC_INFO: _bindgen_ty_2 = 156;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SET_SINGLE_SM_SINGLE_STEP: _bindgen_ty_2 = 157;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_GET_TPC_PARTITION_MODE: _bindgen_ty_2 = 158;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GR_SET_TPC_PARTITION_MODE: _bindgen_ty_2 = 159;
+pub const NV_VGPU_MSG_FUNCTION_UVM_PAGING_CHANNEL_ALLOCATE: _bindgen_ty_2 = 160;
+pub const NV_VGPU_MSG_FUNCTION_UVM_PAGING_CHANNEL_DESTROY: _bindgen_ty_2 = 161;
+pub const NV_VGPU_MSG_FUNCTION_UVM_PAGING_CHANNEL_MAP: _bindgen_ty_2 = 162;
+pub const NV_VGPU_MSG_FUNCTION_UVM_PAGING_CHANNEL_UNMAP: _bindgen_ty_2 = 163;
+pub const NV_VGPU_MSG_FUNCTION_UVM_PAGING_CHANNEL_PUSH_STREAM: _bindgen_ty_2 = 164;
+pub const NV_VGPU_MSG_FUNCTION_UVM_PAGING_CHANNEL_SET_HANDLES: _bindgen_ty_2 = 165;
+pub const NV_VGPU_MSG_FUNCTION_UVM_METHOD_STREAM_GUEST_PAGES_OPERATION: _bindgen_ty_2 = 166;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_INTERNAL_QUIESCE_PMA_CHANNEL: _bindgen_ty_2 = 167;
+pub const NV_VGPU_MSG_FUNCTION_DCE_RM_INIT: _bindgen_ty_2 = 168;
+pub const NV_VGPU_MSG_FUNCTION_REGISTER_VIRTUAL_EVENT_BUFFER: _bindgen_ty_2 = 169;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_EVENT_BUFFER_UPDATE_GET: _bindgen_ty_2 = 170;
+pub const NV_VGPU_MSG_FUNCTION_GET_PLCABLE_ADDRESS_KIND: _bindgen_ty_2 = 171;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PERF_LIMITS_SET_STATUS_V2: _bindgen_ty_2 = 172;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_INTERNAL_SRIOV_PROMOTE_PMA_STREAM: _bindgen_ty_2 = 173;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_MMU_DEBUG_MODE: _bindgen_ty_2 = 174;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_INTERNAL_PROMOTE_FAULT_METHOD_BUFFERS: _bindgen_ty_2 = 175;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FLCN_GET_CTX_BUFFER_SIZE: _bindgen_ty_2 = 176;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FLCN_GET_CTX_BUFFER_INFO: _bindgen_ty_2 = 177;
+pub const NV_VGPU_MSG_FUNCTION_DISABLE_CHANNELS: _bindgen_ty_2 = 178;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FABRIC_MEMORY_DESCRIBE: _bindgen_ty_2 = 179;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FABRIC_MEM_STATS: _bindgen_ty_2 = 180;
+pub const NV_VGPU_MSG_FUNCTION_SAVE_HIBERNATION_DATA: _bindgen_ty_2 = 181;
+pub const NV_VGPU_MSG_FUNCTION_RESTORE_HIBERNATION_DATA: _bindgen_ty_2 = 182;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_INTERNAL_MEMSYS_SET_ZBC_REFERENCED: _bindgen_ty_2 = 183;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_EXEC_PARTITIONS_CREATE: _bindgen_ty_2 = 184;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_EXEC_PARTITIONS_DELETE: _bindgen_ty_2 = 185;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPFIFO_GET_WORK_SUBMIT_TOKEN: _bindgen_ty_2 = 186;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPFIFO_SET_WORK_SUBMIT_TOKEN_NOTIF_INDEX: _bindgen_ty_2 = 187;
+pub const NV_VGPU_MSG_FUNCTION_PMA_SCRUBBER_SHARED_BUFFER_GUEST_PAGES_OPERATION: _bindgen_ty_2 =
+    188;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_MASTER_GET_VIRTUAL_FUNCTION_ERROR_CONT_INTR_MASK:
+    _bindgen_ty_2 = 189;
+pub const NV_VGPU_MSG_FUNCTION_SET_SYSMEM_DIRTY_PAGE_TRACKING_BUFFER: _bindgen_ty_2 = 190;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SUBDEVICE_GET_P2P_CAPS: _bindgen_ty_2 = 191;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_BUS_SET_P2P_MAPPING: _bindgen_ty_2 = 192;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_BUS_UNSET_P2P_MAPPING: _bindgen_ty_2 = 193;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_FLA_SETUP_INSTANCE_MEM_BLOCK: _bindgen_ty_2 = 194;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_MIGRATABLE_OPS: _bindgen_ty_2 = 195;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_TOTAL_HS_CREDITS: _bindgen_ty_2 = 196;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GET_HS_CREDITS: _bindgen_ty_2 = 197;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_HS_CREDITS: _bindgen_ty_2 = 198;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_PM_AREA_PC_SAMPLER: _bindgen_ty_2 = 199;
+pub const NV_VGPU_MSG_FUNCTION_INVALIDATE_TLB: _bindgen_ty_2 = 200;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_QUERY_ECC_STATUS: _bindgen_ty_2 = 201;
+pub const NV_VGPU_MSG_FUNCTION_ECC_NOTIFIER_WRITE_ACK: _bindgen_ty_2 = 202;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_GET_MODE_MMU_DEBUG: _bindgen_ty_2 = 203;
+pub const NV_VGPU_MSG_FUNCTION_RM_API_CONTROL: _bindgen_ty_2 = 204;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CMD_INTERNAL_GPU_START_FABRIC_PROBE: _bindgen_ty_2 = 205;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_NVLINK_GET_INBAND_RECEIVED_DATA: _bindgen_ty_2 = 206;
+pub const NV_VGPU_MSG_FUNCTION_GET_STATIC_DATA: _bindgen_ty_2 = 207;
+pub const NV_VGPU_MSG_FUNCTION_RESERVED_208: _bindgen_ty_2 = 208;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_GPU_GET_INFO_V2: _bindgen_ty_2 = 209;
+pub const NV_VGPU_MSG_FUNCTION_GET_BRAND_CAPS: _bindgen_ty_2 = 210;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CMD_NVLINK_INBAND_SEND_DATA: _bindgen_ty_2 = 211;
+pub const NV_VGPU_MSG_FUNCTION_UPDATE_GPM_GUEST_BUFFER_INFO: _bindgen_ty_2 = 212;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CMD_INTERNAL_CONTROL_GSP_TRACE: _bindgen_ty_2 = 213;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SET_ZBC_STENCIL_CLEAR: _bindgen_ty_2 = 214;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SUBDEVICE_GET_VGPU_HEAP_STATS: _bindgen_ty_2 = 215;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_SUBDEVICE_GET_LIBOS_HEAP_STATS: _bindgen_ty_2 = 216;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_SET_MODE_MMU_GCC_DEBUG: _bindgen_ty_2 = 217;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_DBG_GET_MODE_MMU_GCC_DEBUG: _bindgen_ty_2 = 218;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RESERVE_HES: _bindgen_ty_2 = 219;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RELEASE_HES: _bindgen_ty_2 = 220;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RESERVE_CCU_PROF: _bindgen_ty_2 = 221;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_RELEASE_CCU_PROF: _bindgen_ty_2 = 222;
+pub const NV_VGPU_MSG_FUNCTION_RESERVED: _bindgen_ty_2 = 223;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CMD_GET_CHIPLET_HS_CREDIT_POOL: _bindgen_ty_2 = 224;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_CMD_GET_HS_CREDITS_MAPPING: _bindgen_ty_2 = 225;
+pub const NV_VGPU_MSG_FUNCTION_CTRL_EXEC_PARTITIONS_EXPORT: _bindgen_ty_2 = 226;
+pub const NV_VGPU_MSG_FUNCTION_NUM_FUNCTIONS: _bindgen_ty_2 = 227;
+pub type _bindgen_ty_2 = ffi::c_uint;
+pub const NV_VGPU_MSG_EVENT_FIRST_EVENT: _bindgen_ty_3 = 4096;
+pub const NV_VGPU_MSG_EVENT_GSP_INIT_DONE: _bindgen_ty_3 = 4097;
+pub const NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER: _bindgen_ty_3 = 4098;
+pub const NV_VGPU_MSG_EVENT_POST_EVENT: _bindgen_ty_3 = 4099;
+pub const NV_VGPU_MSG_EVENT_RC_TRIGGERED: _bindgen_ty_3 = 4100;
+pub const NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED: _bindgen_ty_3 = 4101;
+pub const NV_VGPU_MSG_EVENT_OS_ERROR_LOG: _bindgen_ty_3 = 4102;
+pub const NV_VGPU_MSG_EVENT_RG_LINE_INTR: _bindgen_ty_3 = 4103;
+pub const NV_VGPU_MSG_EVENT_GPUACCT_PERFMON_UTIL_SAMPLES: _bindgen_ty_3 = 4104;
+pub const NV_VGPU_MSG_EVENT_SIM_READ: _bindgen_ty_3 = 4105;
+pub const NV_VGPU_MSG_EVENT_SIM_WRITE: _bindgen_ty_3 = 4106;
+pub const NV_VGPU_MSG_EVENT_SEMAPHORE_SCHEDULE_CALLBACK: _bindgen_ty_3 = 4107;
+pub const NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT: _bindgen_ty_3 = 4108;
+pub const NV_VGPU_MSG_EVENT_VGPU_GSP_PLUGIN_TRIGGERED: _bindgen_ty_3 = 4109;
+pub const NV_VGPU_MSG_EVENT_PERF_GPU_BOOST_SYNC_LIMITS_CALLBACK: _bindgen_ty_3 = 4110;
+pub const NV_VGPU_MSG_EVENT_PERF_BRIDGELESS_INFO_UPDATE: _bindgen_ty_3 = 4111;
+pub const NV_VGPU_MSG_EVENT_VGPU_CONFIG: _bindgen_ty_3 = 4112;
+pub const NV_VGPU_MSG_EVENT_DISPLAY_MODESET: _bindgen_ty_3 = 4113;
+pub const NV_VGPU_MSG_EVENT_EXTDEV_INTR_SERVICE: _bindgen_ty_3 = 4114;
+pub const NV_VGPU_MSG_EVENT_NVLINK_INBAND_RECEIVED_DATA_256: _bindgen_ty_3 = 4115;
+pub const NV_VGPU_MSG_EVENT_NVLINK_INBAND_RECEIVED_DATA_512: _bindgen_ty_3 = 4116;
+pub const NV_VGPU_MSG_EVENT_NVLINK_INBAND_RECEIVED_DATA_1024: _bindgen_ty_3 = 4117;
+pub const NV_VGPU_MSG_EVENT_NVLINK_INBAND_RECEIVED_DATA_2048: _bindgen_ty_3 = 4118;
+pub const NV_VGPU_MSG_EVENT_NVLINK_INBAND_RECEIVED_DATA_4096: _bindgen_ty_3 = 4119;
+pub const NV_VGPU_MSG_EVENT_TIMED_SEMAPHORE_RELEASE: _bindgen_ty_3 = 4120;
+pub const NV_VGPU_MSG_EVENT_NVLINK_IS_GPU_DEGRADED: _bindgen_ty_3 = 4121;
+pub const NV_VGPU_MSG_EVENT_PFM_REQ_HNDLR_STATE_SYNC_CALLBACK: _bindgen_ty_3 = 4122;
+pub const NV_VGPU_MSG_EVENT_NVLINK_FAULT_UP: _bindgen_ty_3 = 4123;
+pub const NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE: _bindgen_ty_3 = 4124;
+pub const NV_VGPU_MSG_EVENT_MIG_CI_CONFIG_UPDATE: _bindgen_ty_3 = 4125;
+pub const NV_VGPU_MSG_EVENT_UPDATE_GSP_TRACE: _bindgen_ty_3 = 4126;
+pub const NV_VGPU_MSG_EVENT_NVLINK_FATAL_ERROR_RECOVERY: _bindgen_ty_3 = 4127;
+pub const NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD: _bindgen_ty_3 = 4128;
+pub const NV_VGPU_MSG_EVENT_FECS_ERROR: _bindgen_ty_3 = 4129;
+pub const NV_VGPU_MSG_EVENT_RECOVERY_ACTION: _bindgen_ty_3 = 4130;
+pub const NV_VGPU_MSG_EVENT_NUM_EVENTS: _bindgen_ty_3 = 4131;
+pub type _bindgen_ty_3 = ffi::c_uint;
+#[repr(C)]
+#[derive(Copy, Clone)]
+pub union rpc_message_rpc_union_field_v03_00 {
+    pub spare: u32_,
+    pub cpuRmGfid: u32_,
+}
+impl Default for rpc_message_rpc_union_field_v03_00 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+pub type rpc_message_rpc_union_field_v = rpc_message_rpc_union_field_v03_00;
+#[repr(C)]
+pub struct rpc_message_header_v03_00 {
+    pub header_version: u32_,
+    pub signature: u32_,
+    pub length: u32_,
+    pub function: u32_,
+    pub rpc_result: u32_,
+    pub rpc_result_private: u32_,
+    pub sequence: u32_,
+    pub u: rpc_message_rpc_union_field_v,
+    pub rpc_message_data: __IncompleteArrayField<u8_>,
+}
+impl Default for rpc_message_header_v03_00 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+pub type rpc_message_header_v = rpc_message_header_v03_00;
 #[repr(C)]
 #[derive(Copy, Clone)]
 pub struct GspFwWprMeta {
@@ -145,3 +482,40 @@ pub struct LibosMemoryRegionInitArgument {
     pub loc: u8_,
     pub __bindgen_padding_0: [u8; 6usize],
 }
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct msgqTxHeader {
+    pub version: u32_,
+    pub size: u32_,
+    pub msgSize: u32_,
+    pub msgCount: u32_,
+    pub writePtr: u32_,
+    pub flags: u32_,
+    pub rxHdrOff: u32_,
+    pub entryOff: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct msgqRxHeader {
+    pub readPtr: u32_,
+}
+#[repr(C)]
+#[repr(align(8))]
+pub struct GSP_MSG_QUEUE_ELEMENT {
+    pub authTagBuffer: [u8_; 16usize],
+    pub aadBuffer: [u8_; 16usize],
+    pub checkSum: u32_,
+    pub seqNum: u32_,
+    pub elemCount: u32_,
+    pub __bindgen_padding_0: [u8; 4usize],
+    pub rpc: rpc_message_header_v,
+}
+impl Default for GSP_MSG_QUEUE_ELEMENT {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 206dab2e1335..0585699ae951 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -71,6 +71,10 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
     30:30   ecc_mode_enabled as bool;
 });
 
+register!(NV_PGSP_QUEUE_HEAD @ 0x00110c00 {
+    31:0    address as u32;
+});
+
 impl NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE {
     /// Returns the usable framebuffer size, in bytes.
     pub(crate) fn usable_fb_size(self) -> u64 {
diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbuffer.rs
index e768e4f1cb7d..e6b18ecb7a55 100644
--- a/drivers/gpu/nova-core/sbuffer.rs
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -37,7 +37,6 @@ impl<'a, I> SBuffer<I>
 where
     I: Iterator,
 {
-    #[expect(unused)]
     pub(crate) fn new_reader(slices: impl IntoIterator<IntoIter = I>) -> Self
     where
         I: Iterator<Item = &'a [u8]>,
@@ -45,7 +44,6 @@ pub(crate) fn new_reader(slices: impl IntoIterator<IntoIter = I>) -> Self
         Self::new(slices)
     }
 
-    #[expect(unused)]
     pub(crate) fn new_writer(slices: impl IntoIterator<IntoIter = I>) -> Self
     where
         I: Iterator<Item = &'a mut [u8]>,
-- 
2.50.1

