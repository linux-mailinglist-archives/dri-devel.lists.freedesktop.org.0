Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E59B37D90
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 10:21:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC0110E771;
	Wed, 27 Aug 2025 08:20:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="p1+c/GlC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C36510E76F;
 Wed, 27 Aug 2025 08:20:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5a5kn5sHpjItBVsZbjVTCVqr1dz++CRG+qsINsXVXzed/4Cu2BnPJHjxe2byMiSt2zfhp6w2k6MwdfF0yrThnbleyiYbhSQmerjoGvI1xB1ZsosSV15reyRJ4SPqqdnvDefQ2bxJVeZauaVwDQniQiywA8LyKbV7OPGe88Xvm2PwPzxDY20KC+6kAkSjjtyZM4B1EN+rI+ax4x/uv2wOquFHB+oAN6yqeJlbrQYRJnYVY18sWBW1zbdXgE5jBIrD7glSVcQc0TiirYLXek94uXCayvoLP8aoNawhVd5AAoMR9AI/ff4UIQzKSoVlOKE15tXiAM9cszGXrkpZRBtJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULqwBuQAIXptemHuqpJXpssSqrg/je62NgT8Oghz+9M=;
 b=D54n+9oYcl5vlpXKpMmubPJHLxlOajIcuiTf2x8XSJXKRYqUDW7o9paYICgM0eE4faY6UX0FVDVa1k64274kUslzokmiKgi4K6Sw9F891NM0v33TcVJmU3BTtZo5c/UxRYfO3I2cmdXWJepnpdkIm0X1Xel/Ek4BhCwPzmDG2zyd/sndv+xdBbVtjvTNYeOhsDL6Zebw0LDPYt664DGRml1N45bSfDRwUBgUWPMoBZRf3tuh3uZ0N9G16J7Go0HKN1+MPmoyuQx+uO1d4c2S9i2ueJNDu2avIVclAW93aYHKr03VH5hCNDj4dhCKPU6qlVLN9HI+z8APMdr/Cyi4UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULqwBuQAIXptemHuqpJXpssSqrg/je62NgT8Oghz+9M=;
 b=p1+c/GlCWZ/NlRyZ18jUA5YtmzysPwhEv/LjexXfDWxOLGlWPGUcnCaceZPnsrkYk4pnjZbSyDzugQtDdN8YR+PkxM1IY9s8S1lGx9XmDs+qSbuVb9c/W156N1wUIeREEBgAJuVC0JLwuy5DtYWsEGYApZ30SPq+q2f1I8TGvtPX3otJAgBQSSkLMNShDkX/Mkm/tmMVf691uNCfi0cm7p8avy+eoi9g2sNiRE0egU3V+ojJdeBQTwBuaq/ryBD7wXuvgbS2N1EmF6kkLcOaF8cWcl17DrriBD1bXAuf1S1U/qI7vVw8fyUCzI+ii0Vcojg9G6dLWQ9iv3zjR5nsKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB7709.namprd12.prod.outlook.com (2603:10b6:208:423::15)
 by DS2PR12MB9592.namprd12.prod.outlook.com (2603:10b6:8:27c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 08:20:51 +0000
Received: from IA1PR12MB7709.namprd12.prod.outlook.com
 ([fe80::5312:ce8b:bdf5:aa31]) by IA1PR12MB7709.namprd12.prod.outlook.com
 ([fe80::5312:ce8b:bdf5:aa31%5]) with mapi id 15.20.8989.018; Wed, 27 Aug 2025
 08:20:51 +0000
From: Alistair Popple <apopple@nvidia.com>
To: dri-devel@lists.freedesktop.org,
	dakr@kernel.org,
	acourbot@nvidia.com
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
Subject: [PATCH 05/10] gpu: nova-core: gsp: Add GSP command queue handling
Date: Wed, 27 Aug 2025 18:20:02 +1000
Message-ID: <20250827082015.959430-6-apopple@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250827082015.959430-1-apopple@nvidia.com>
References: <20250827082015.959430-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ME0PR01CA0030.ausprd01.prod.outlook.com
 (2603:10c6:220:210::17) To IA1PR12MB7709.namprd12.prod.outlook.com
 (2603:10b6:208:423::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB7709:EE_|DS2PR12MB9592:EE_
X-MS-Office365-Filtering-Correlation-Id: fad2f7f4-38b0-4e25-6966-08dde542a242
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YoVgTvYSjatd/g5NAtRYWJIYf4r9EoYlvW4ht8XCs/aKNxUf9HctX+M7D9Kg?=
 =?us-ascii?Q?1ouDalWJx14M855onZyWBKIvcEZRIcpuNAcReViphQXLQM3ZuQMfIbt0DIVj?=
 =?us-ascii?Q?3N3dKPl/KldgIA6pRt664hx/YHcHNAZ0U9Jk/BVB5lQUrHIZVX5bqIqookMs?=
 =?us-ascii?Q?sgv0v/hFKmpmWWvN2zwxIsvTXqNa5y97ELPf5YPSngGltlWCumq3ExrfY0Sl?=
 =?us-ascii?Q?pt/S/DBBFWrg7hv05u23Ca2TSmclA8MMbfcwX9sO/YeLLk3Y9T9aEmlgsRR6?=
 =?us-ascii?Q?QOY8vLrqG9mnSVVJjmIil5LCyiP+5m4uTrJrTqGdqk0GmBcDkFZFIj/vQqNO?=
 =?us-ascii?Q?+f63/KWronjVDYVnN8MVrZGXvjOOgJQX8JJPBoDEU1YHeKIlMhIntXUyL3dF?=
 =?us-ascii?Q?/yIkbu3NV69xmlcCdRTJQjRsnsINk1s2H/B8upVlVlR+cF9Ugj5fd9m0cler?=
 =?us-ascii?Q?WGhCFXlyJTrNjA0dnYKm0yh4B52A1cDzcc9NUkUhIP7+9tjJw/kt5uKD0W0/?=
 =?us-ascii?Q?juh8ZCKGqxC6JArjYIzErzwBOgG8fcHqIKiJ0CQsRmGl6rHtFMiiKgKvEs1N?=
 =?us-ascii?Q?uQ24yZ2YZuI8b9UgsMhTAskS6ZU12qDnxkvRxXhJY92R3R3fEpyY99hPpaY9?=
 =?us-ascii?Q?ZpXpO/PCW5kQV6t5virtidE+eTQKliFzceEgsr4lkwjZYSfHFmOeeaYFTB0q?=
 =?us-ascii?Q?7SZunUGsrrRb13vQGd62MYBLVI6ZZ1whoGGBJcmeywA3A1+CmM7gcCgYXLfm?=
 =?us-ascii?Q?M9Qdk2K9IhvQYPb5Lk1czFR/+okvRQN+522cOTANfq+9hWdYJe490jPujwyD?=
 =?us-ascii?Q?Wu5BczhaoKhT7AXw0IKoO2pnhoHDwnHtlUq5KbYUMV58hs0LeEY2PQicyZce?=
 =?us-ascii?Q?FAlw8yYfI+4V3jBe4kpjhzZ0/H1l17rGu0GKRL7WHxUeBwhhCiPbvhKa66L6?=
 =?us-ascii?Q?wqoswfJKPSJQO0Lq49dgynOR9hpV/7/zidj+FKX5Z21Q3YqdCQ09VNy90VKV?=
 =?us-ascii?Q?E+J7kTXbDJS7LQX3Du0l5Ia2m+tAyEpAk3a1NWp+EBmk8ynWUzUBfxPagZzt?=
 =?us-ascii?Q?LOJZMbH3WNiFwruvgI1oqzKrATWPnXBhLNH69XJY7fv1/imRbTgKiZQ+v8qb?=
 =?us-ascii?Q?jxsnWN4i2mhGywtH7ZQwQNfkG8V8ur/z57DACxkI+fsf2wCVoSLw3UAyB50p?=
 =?us-ascii?Q?x9N2HIl514bBwiKWIQvTvhe7y8JG2P+GRhQzk69gWOKdSWM8+Fq5y2FsQx84?=
 =?us-ascii?Q?7SFmpcpPcgKXJBxkgunIZdhjvnYKgOqcDIoYbbsBvkp3y+JgrCxH2dT3wiBG?=
 =?us-ascii?Q?zQ4W8AdDVQNiP/wt1MlUQcqgYwKD7daCiOx5WL2+sbX2+0KRqHiIHT5KRt9R?=
 =?us-ascii?Q?6nNBR/wwECsG9CtO6RDdWOc/2gha7k0gTCpUzgEVsezxF2uYv/+D2y9B/Sxa?=
 =?us-ascii?Q?VGQvG99O7LU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB7709.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HmeqyS42O2Mn9AMj+BZfO3h3p23Ve4qII3WArmt7g8w2BRB2iRzUM+ZZn7tf?=
 =?us-ascii?Q?55ss3sGZXQNBon2/MGLvkmOFQEz+bJN7YtPvoYq9IgZKQTYUtLKwG58i/Hvl?=
 =?us-ascii?Q?o6xFI+8b+ipFp7s0KSxWlOUN9P1ufyUZOLwCzoCkulGSSF/agy9mbRhbe1Cs?=
 =?us-ascii?Q?lBNAq2GaLyQvYILJ45GqsPaJ4lwwtBpXmw2gXQLTlozAhVBWoIium1wpRxPY?=
 =?us-ascii?Q?vmJXo/bsnPGeDOubMK0jpBbg8IwQuEP2B3vpi9CNSmfSFnZvN8yd7z6obI8C?=
 =?us-ascii?Q?WpxSZJM3xnEF0cV7DVcwZ7mXObfjF9TykcG/XOFIVICX7Wn3sYtjgz2CZTjP?=
 =?us-ascii?Q?FSmyp20COMencnYw6SJKa/LJu0OerKPoPHTLfeJ8dxLQbRuG6d5KNzRKxhPO?=
 =?us-ascii?Q?BF6U6GJaOIrTOWAf+BCbPbCr5Ui9QqWlNcbNG5uPhn8katKTixcWy4JqwDCe?=
 =?us-ascii?Q?40jsmlcQxBI6LK+5qZ79+/uFS/aOm33bismWNW3BBwWoAzA265g7LP8nJpd4?=
 =?us-ascii?Q?CeHR5YgmlAUjI6158BThSqTVgRt/AbQzKRgqbo77/tvw4yqs2Mp+WG8BCXl9?=
 =?us-ascii?Q?2g3MJbS91T6qSFxp/8jmMWfU2ow5C3Cui9ETJSpLUCP3HaCV3TBQ6L1twkM6?=
 =?us-ascii?Q?gHlyzxgQKYwW8Y0lqCYLRJ4WaPg6gunGt+/Iji3rvDzCF0awOV//LN5pGNcr?=
 =?us-ascii?Q?/Vo7RKk4ObSar2XBN/m/14FmCmxUaXXJCS54CAS+Gxl9iXUCQH2uR2jxawhf?=
 =?us-ascii?Q?oUnHn8y0nigM3faUWPY0hFG8pM7bPBAf1Ugau6JcEit9fhM8UubO8G3RAqi8?=
 =?us-ascii?Q?ALiJ5hC0oIeDn+7x+GHVQj2bwK0uSoPk0yh6LRza5M7TRpmSY5RAinj0EX6j?=
 =?us-ascii?Q?4hQTKWWkOdEJxOTcwkPyN4tmkaGoun/VWB54e1vAioWJsxZGkvzkleV8rxcj?=
 =?us-ascii?Q?ZtmZa3FbET3sYMMf7UZUsP+1bi6ys15+v6IeQ+TSoTaFCdFN95dA1L9y0I6v?=
 =?us-ascii?Q?0lsGsJu510pKCjmRceF8utmgoslcVHyNRqvv9hAaJYYTfQF5Vpe5aPN2tVRT?=
 =?us-ascii?Q?kCFs1go2ixYaN8Z/PNVNw67zzfy7buyOxtMAsgnD1wVWEG5LhhwIPC5dTtbf?=
 =?us-ascii?Q?buaK/NOS9cC6CY9kjONsF5K1pWFtaXv6LmE3rGCRiud6rsmNeOUsSxcndn9g?=
 =?us-ascii?Q?0sMmt0+fiD4oIjd7yhwg5KsPF+gklcuG6D7g/UjGCyUdELhq+z+6xMa5l1QM?=
 =?us-ascii?Q?Jh82Pos4V/Z7w+D7kjy9/LC1Wh/GaR4jK9FcWxYmDtLfCWgP2A3C+argCjnp?=
 =?us-ascii?Q?FBLtfJqKGN0XSj3K3VaElTTLIDQT75VMksqg7jngxt/geMo5KI7dC6aHqgHB?=
 =?us-ascii?Q?nRkk8GCtjCrEbwbIzk+7piezNx0Ksx6HlTru184uYTRehcW/yw+JzdczOEem?=
 =?us-ascii?Q?lXIpRazzVvXAUeMCmJ7u8gFvu7llSuwg0ZyYs0PCknQDZUQNlbt6LwjfLt9i?=
 =?us-ascii?Q?apnZUNOJrnehMqLRaVNCKjW3+Fety1A+W9BbxxB4ffhACxp8r8iUqmQTSKWo?=
 =?us-ascii?Q?TG/bFPOeoybEa3nL8hFINHVHui9yfwbRurkqdnB2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fad2f7f4-38b0-4e25-6966-08dde542a242
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB7709.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 08:20:51.4036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wnz7bGf99394hFpzb3lpe963IzjWJWOV6bghfJdFSISdEgvUd+fZRpdqTUxhFXV2PNhJ/+RcReItiqvCaLDahQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9592
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
 drivers/gpu/nova-core/gsp.rs                  |  20 +-
 drivers/gpu/nova-core/gsp/cmdq.rs             | 695 ++++++++++++++++++
 drivers/gpu/nova-core/nvfw.rs                 |  31 +
 .../gpu/nova-core/nvfw/r570_144_bindings.rs   | 268 +++++++
 drivers/gpu/nova-core/regs.rs                 |   4 +
 5 files changed, 1012 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/cmdq.rs

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 1f51e354b9569..41a88087d9baa 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use kernel::alloc::flags::GFP_KERNEL;
 use kernel::bindings;
 use kernel::device;
 use kernel::dma::CoherentAllocation;
@@ -12,6 +13,7 @@
 
 use crate::fb::FbLayout;
 use crate::firmware::Firmware;
+use crate::gsp::cmdq::GspCmdq;
 use crate::nvfw::{
     GspFwWprMeta, GspFwWprMetaBootInfo, GspFwWprMetaBootResumeInfo, LibosMemoryRegionInitArgument,
     LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS,
@@ -19,6 +21,8 @@
     GSP_FW_WPR_META_REVISION,
 };
 
+pub(crate) mod cmdq;
+
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
 pub(crate) const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new(1 << 20);
@@ -44,6 +48,7 @@ pub(crate) struct GspMemObjects {
     pub logintr: CoherentAllocation<u8>,
     pub logrm: CoherentAllocation<u8>,
     pub wpr_meta: CoherentAllocation<GspFwWprMeta>,
+    pub cmdq: GspCmdq,
 }
 
 pub(crate) fn build_wpr_meta(
@@ -107,7 +112,7 @@ fn id8(name: &str) -> u64 {
 }
 
 /// Creates a self-mapping page table for `obj` at its beginning.
-fn create_pte_array(obj: &mut CoherentAllocation<u8>) {
+fn create_pte_array<T: AsBytes + FromBytes>(obj: &mut CoherentAllocation<T>, skip: usize) {
     let num_pages = obj.size().div_ceil(GSP_PAGE_SIZE);
     let handle = obj.dma_handle();
 
@@ -119,7 +124,7 @@ fn create_pte_array(obj: &mut CoherentAllocation<u8>) {
     //  - The allocation size is at least as long as 8 * num_pages as
     //    GSP_PAGE_SIZE is larger than 8 bytes.
     let ptes = unsafe {
-        let ptr = obj.start_ptr_mut().cast::<u64>().add(1);
+        let ptr = obj.start_ptr_mut().cast::<u64>().add(skip);
         core::slice::from_raw_parts_mut(ptr, num_pages)
     };
 
@@ -166,20 +171,23 @@ pub(crate) fn new(
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
-
+        create_pte_array(&mut logrm, 1);
         let wpr_meta = build_wpr_meta(dev, fw, fb_layout)?;
 
+        // Creates its own PTE array
+        let cmdq = GspCmdq::new(dev)?;
+
         Ok(GspMemObjects {
             libos,
             loginit,
             logintr,
             logrm,
             wpr_meta,
+            cmdq,
         })
     }
 
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
new file mode 100644
index 0000000000000..3f5d31c8e68f2
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -0,0 +1,695 @@
+// SPDX-License-Identifier: GPL-2.0
+use core::mem::offset_of;
+use core::ptr;
+use core::sync::atomic::{fence, Ordering};
+
+use kernel::alloc::flags::GFP_KERNEL;
+use kernel::device;
+use kernel::dma::CoherentAllocation;
+use kernel::prelude::*;
+use kernel::sync::aref::ARef;
+use kernel::time::Delta;
+use kernel::transmute::{AsBytes, FromBytes};
+use kernel::{dma_read, dma_write};
+
+use crate::driver::Bar0;
+use crate::gsp::create_pte_array;
+use crate::gsp::{GSP_PAGE_SHIFT, GSP_PAGE_SIZE};
+use crate::nvfw::{
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
+use crate::regs::NV_PGSP_QUEUE_HEAD;
+use crate::sbuffer::SBuffer;
+use crate::util::wait_on;
+
+const GSP_COMMAND_TIMEOUT: i64 = 5;
+
+pub(crate) trait GspCommandToGsp: Sized {
+    const FUNCTION: u32;
+}
+
+pub(crate) trait GspMessageFromGsp: Sized {
+    const FUNCTION: u32;
+}
+
+// This next section contains constants and structures hand-coded from the GSP
+// headers We could replace these with bindgen versions, but that's a bit of a
+// pain because they basically end up pulling in the world (ie. definitions for
+// every rpc method). So for now the hand-coded ones are fine. They are just
+// structs so we can easily move to bindgen generated ones if/when we want to.
+
+// A GSP RPC header
+#[repr(C)]
+#[derive(Debug, Clone)]
+struct GspRpcHeader {
+    header_version: u32,
+    signature: u32,
+    length: u32,
+    function: u32,
+    rpc_result: u32,
+    rpc_result_private: u32,
+    sequence: u32,
+    cpu_rm_gfid: u32,
+}
+
+// SAFETY: These structs don't meet the no-padding requirements of AsBytes but
+//         that is not a problem because they are not used outside the kernel.
+unsafe impl AsBytes for GspRpcHeader {}
+
+// SAFETY: These structs don't meet the no-padding requirements of FromBytes but
+//         that is not a problem because they are not used outside the kernel.
+unsafe impl FromBytes for GspRpcHeader {}
+
+// A GSP message element header
+#[repr(C)]
+#[derive(Debug, Clone)]
+struct GspMsgHeader {
+    auth_tag_buffer: [u8; 16],
+    aad_buffer: [u8; 16],
+    checksum: u32,
+    sequence: u32,
+    elem_count: u32,
+    pad: u32,
+}
+
+// SAFETY: These structs don't meet the no-padding requirements of AsBytes but
+//         that is not a problem because they are not used outside the kernel.
+unsafe impl AsBytes for GspMsgHeader {}
+
+// SAFETY: These structs don't meet the no-padding requirements of FromBytes but
+//         that is not a problem because they are not used outside the kernel.
+unsafe impl FromBytes for GspMsgHeader {}
+
+// These next two structs come from msgq_priv.h. Hopefully the will never
+// need updating once the ABI is stabalised.
+#[repr(C)]
+#[derive(Debug)]
+struct MsgqTxHeader {
+    version: u32,    // queue version
+    size: u32,       // bytes, page aligned
+    msg_size: u32,   // entry size, bytes, must be power-of-2, 16 is minimum
+    msg_count: u32,  // number of entries in queue
+    write_ptr: u32,  // message id of next slot
+    flags: u32,      // if set it means "i want to swap RX"
+    rx_hdr_off: u32, // Offset of msgqRxHeader from start of backing store
+    entry_off: u32,  // Offset of entries from start of backing store
+}
+
+// SAFETY: These structs don't meet the no-padding requirements of AsBytes but
+//         that is not a problem because they are not used outside the kernel.
+unsafe impl AsBytes for MsgqTxHeader {}
+
+#[repr(C)]
+#[derive(Debug)]
+struct MsgqRxHeader {
+    read_ptr: u32, // message id of last message read
+}
+
+/// Number of GSP pages making the Msgq.
+const MSGQ_NUM_PAGES: usize = 0x3f;
+
+#[repr(C, align(0x1000))]
+#[derive(Debug)]
+struct MsgqData {
+    data: [[u8; GSP_PAGE_SIZE]; MSGQ_NUM_PAGES],
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
+#[derive(Debug)]
+struct Msgq {
+    tx: MsgqTxHeader,
+    rx: MsgqRxHeader,
+    msgq: MsgqData,
+}
+
+#[repr(C)]
+#[derive(Debug)]
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
+pub(crate) struct GspCmdq {
+    dev: ARef<device::Device>,
+    msg_count: u32,
+    seq: u32,
+    gsp_mem: CoherentAllocation<GspMem>,
+    pub _nr_ptes: u32,
+}
+
+// A reference to a message currently sitting in the GSP command queue. May
+// contain two slices as the command queue is a circular buffer which may have
+// wrapped.
+//
+// INVARIANT: The underlying message data cannot change because the struct holds
+// a reference to the command queue which prevents command queue manipulation
+// until the GspQueueMessage is dropped.
+pub(crate) struct GspQueueMessage<'a> {
+    cmdq: &'a mut GspCmdq,
+    rpc_header: &'a GspRpcHeader,
+    slice_1: &'a [u8],
+    slice_2: Option<&'a [u8]>,
+}
+
+type GspQueueMessageData<'a, M> = (&'a M, Option<SBuffer<core::array::IntoIter<&'a [u8], 2>>>);
+
+impl<'a> GspQueueMessage<'a> {
+    #[expect(unused)]
+    pub(crate) fn try_as<M: GspMessageFromGsp>(&'a self) -> Result<GspQueueMessageData<'a, M>> {
+        if self.rpc_header.function != M::FUNCTION {
+            return Err(ERANGE);
+        }
+
+        // SAFETY: The slice references the cmdq message memory which is
+        // guaranteed to outlive the returned GspQueueMessageData by the
+        // invariants of GspQueueMessage and the lifetime 'a.
+        let msg = unsafe { &*(self.slice_1.as_ptr().cast::<M>()) };
+        let data = &self.slice_1[size_of::<M>()..];
+        let data_size =
+            self.rpc_header.length as usize - size_of::<GspRpcHeader>() - size_of::<M>();
+        let sbuf = if data_size > 0 {
+            Some(SBuffer::new_reader([data, self.slice_2.unwrap_or(&[])]))
+        } else {
+            None
+        };
+
+        Ok((msg, sbuf))
+    }
+
+    #[expect(unused)]
+    pub(crate) fn ack(self) -> Result {
+        self.cmdq.ack_msg(self.rpc_header.length)?;
+
+        Ok(())
+    }
+}
+
+// The same as GspQueueMessage except the fields are mutable for constructing a
+// message to the GSP.
+pub(crate) struct GspQueueCommand<'a> {
+    cmdq: &'a mut GspCmdq,
+    msg_header: &'a mut GspMsgHeader,
+    rpc_header: &'a mut GspRpcHeader,
+    slice_1: &'a mut [u8],
+    slice_2: &'a mut [u8],
+}
+
+type GspQueueCommandData<'a, M> = (
+    &'a mut M,
+    Option<SBuffer<core::array::IntoIter<&'a mut [u8], 2>>>,
+);
+
+impl<'a> GspQueueCommand<'a> {
+    #[expect(unused)]
+    pub(crate) fn try_as<'b, M: GspCommandToGsp>(&'b mut self) -> GspQueueCommandData<'b, M> {
+        // SAFETY: The slice references the cmdq message memory which is
+        // guaranteed to outlive the returned GspQueueCommandData by the
+        // invariants of GspQueueCommand and the lifetime 'a.
+        let msg = unsafe { &mut *(self.slice_1.as_mut_ptr().cast::<M>()) };
+        let data = &mut self.slice_1[size_of::<M>()..];
+        let data_size =
+            self.rpc_header.length as usize - size_of::<GspRpcHeader>() - size_of::<M>();
+        let sbuf = if data_size > 0 {
+            Some(SBuffer::new_writer([data, self.slice_2]))
+        } else {
+            None
+        };
+        self.rpc_header.function = M::FUNCTION;
+
+        (msg, sbuf)
+    }
+
+    #[expect(unused)]
+    pub(crate) fn send_to_gsp(self, bar: &Bar0) -> Result {
+        self.cmdq.wait_for_free_cmd_to_gsp(
+            Delta::from_secs(GSP_COMMAND_TIMEOUT),
+            self.rpc_header.length as usize + size_of::<GspMsgHeader>(),
+        )?;
+        GspCmdq::send_cmd_to_gsp(self, bar)?;
+        Ok(())
+    }
+}
+
+impl GspCmdq {
+    pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<GspCmdq> {
+        let mut gsp_mem =
+            CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
+
+        let nr_ptes = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
+        build_assert!(nr_ptes * size_of::<u64>() <= GSP_PAGE_SIZE);
+
+        create_pte_array(&mut gsp_mem, 0);
+
+        const MSGQ_SIZE: u32 = size_of::<Msgq>() as u32;
+        const MSG_COUNT: u32 = ((MSGQ_SIZE as usize - GSP_PAGE_SIZE) / GSP_PAGE_SIZE) as u32;
+        const RX_HDR_OFF: u32 = offset_of!(Msgq, rx) as u32;
+        dma_write!(
+            gsp_mem[0].cpuq.tx = MsgqTxHeader {
+                version: 0,
+                size: MSGQ_SIZE,
+                entry_off: GSP_PAGE_SIZE as u32,
+                msg_size: GSP_PAGE_SIZE as u32,
+                msg_count: MSG_COUNT,
+                write_ptr: 0,
+                flags: 1,
+                rx_hdr_off: RX_HDR_OFF,
+            }
+        )?;
+
+        Ok(GspCmdq {
+            dev: dev.into(),
+            msg_count: MSG_COUNT,
+            seq: 0,
+            gsp_mem,
+            _nr_ptes: nr_ptes as u32,
+        })
+    }
+
+    fn cpu_wptr(&self) -> u32 {
+        // SAFETY: index `0` is valid as `gsp_mem` has been allocated accordingly, thus the access
+        // cannot fail.
+        unsafe { dma_read!(self.gsp_mem[0].cpuq.tx.write_ptr).unwrap_unchecked() }
+    }
+
+    fn gsp_rptr(&self) -> u32 {
+        // SAFETY: index `0` is valid as `gsp_mem` has been allocated accordingly, thus the access
+        // cannot fail.
+        unsafe { dma_read!(self.gsp_mem[0].gspq.rx.read_ptr).unwrap_unchecked() }
+    }
+
+    fn cpu_rptr(&self) -> u32 {
+        // SAFETY: index `0` is valid as `gsp_mem` has been allocated accordingly, thus the access
+        // cannot fail.
+        unsafe { dma_read!(self.gsp_mem[0].cpuq.rx.read_ptr).unwrap_unchecked() }
+    }
+
+    fn gsp_wptr(&self) -> u32 {
+        // SAFETY: index `0` is valid as `gsp_mem` has been allocated accordingly, thus the access
+        // cannot fail.
+        unsafe { dma_read!(self.gsp_mem[0].gspq.tx.write_ptr).unwrap_unchecked() }
+    }
+
+    // Returns the numbers of pages free for sending an RPC to GSP.
+    fn free_tx_pages(&self) -> u32 {
+        let wptr = self.cpu_wptr();
+        let rptr = self.gsp_rptr();
+        let mut free = rptr + self.msg_count - wptr - 1;
+
+        if free >= self.msg_count {
+            free -= self.msg_count;
+        }
+
+        free
+    }
+
+    // Returns the number of pages the GSP has written to the queue.
+    fn used_rx_pages(&self) -> u32 {
+        let rptr = self.cpu_rptr();
+        let wptr = self.gsp_wptr();
+        let mut used = wptr + self.msg_count - rptr;
+        if used >= self.msg_count {
+            used -= self.msg_count;
+        }
+
+        used
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
+    pub(crate) fn wait_for_free_cmd_to_gsp(&self, timeout: Delta, size: usize) -> Result {
+        wait_on(timeout, || {
+            if self.free_tx_pages() < size.div_ceil(GSP_PAGE_SIZE) as u32 {
+                None
+            } else {
+                Some(())
+            }
+        })
+    }
+
+    #[expect(unused)]
+    pub(crate) fn alloc_gsp_queue_command<'a>(
+        &'a mut self,
+        cmd_size: usize,
+    ) -> Result<GspQueueCommand<'a>> {
+        const HEADER_SIZE: usize = size_of::<GspMsgHeader>() + size_of::<GspRpcHeader>();
+        let msg_size = size_of::<GspMsgHeader>() + size_of::<GspRpcHeader>() + cmd_size;
+        if self.free_tx_pages() < msg_size.div_ceil(GSP_PAGE_SIZE) as u32 {
+            return Err(EAGAIN);
+        }
+        let wptr = self.cpu_wptr() as usize;
+
+        // SAFETY: By the invariants of CoherentAllocation gsp_mem.start_ptr_mut() is valid.
+        let ptr = unsafe {
+            core::ptr::addr_of_mut!((*self.gsp_mem.start_ptr_mut()).cpuq.msgq.data[wptr])
+        };
+
+        // SAFETY: ptr points to at least one GSP_PAGE_SIZE bytes of contiguous
+        // memory which is larger than GspMsgHeader.
+        let msg_header_slice: &mut [u8] =
+            unsafe { core::slice::from_raw_parts_mut(ptr.cast::<u8>(), size_of::<GspMsgHeader>()) };
+        msg_header_slice.fill(0);
+        let msg_header = GspMsgHeader::from_bytes_mut(msg_header_slice).ok_or(EINVAL)?;
+        msg_header.auth_tag_buffer = [0; 16];
+        msg_header.aad_buffer = [0; 16];
+        msg_header.checksum = 0;
+        msg_header.sequence = self.seq;
+        msg_header.elem_count = (HEADER_SIZE + cmd_size).div_ceil(GSP_PAGE_SIZE) as u32;
+        msg_header.pad = 0;
+        self.seq += 1;
+
+        // SAFETY: ptr points to GSP_PAGE_SIZE bytes of memory which is larger
+        // than both GspMsgHeader and GspRpcHeader combined.
+        let rpc_header_slice: &mut [u8] = unsafe {
+            core::slice::from_raw_parts_mut(
+                ptr.cast::<u8>().add(size_of::<GspMsgHeader>()),
+                size_of::<GspRpcHeader>(),
+            )
+        };
+        rpc_header_slice.fill(0);
+        let rpc_header = GspRpcHeader::from_bytes_mut(rpc_header_slice).ok_or(EINVAL)?;
+        rpc_header.header_version = 0x03000000;
+        rpc_header.signature = 0x43505256;
+        rpc_header.length = (size_of::<GspRpcHeader>() + cmd_size) as u32;
+        rpc_header.rpc_result = 0xffffffff;
+        rpc_header.rpc_result_private = 0xffffffff;
+        rpc_header.sequence = 0;
+        rpc_header.cpu_rm_gfid = 0;
+
+        // Number of bytes left before we have to wrap the buffer
+        let remaining = ((self.msg_count as usize - wptr) << GSP_PAGE_SHIFT) - HEADER_SIZE;
+
+        let (slice_1, slice_2) = if cmd_size <= remaining {
+            // SAFETY: ptr points to a region of contiguous memory at least
+            // cmd_size + HEADER_SIZE long.
+            let slice_1: &mut [u8] = unsafe {
+                core::slice::from_raw_parts_mut(ptr.cast::<u8>().add(HEADER_SIZE), cmd_size)
+            };
+            slice_1.fill(0);
+            (slice_1, &mut [] as &mut [u8])
+        } else {
+            // SAFETY: ptr points to a region of contiguous memory remaining +
+            // HEADER_SIZE bytes long.
+            let slice_1: &mut [u8] = unsafe {
+                core::slice::from_raw_parts_mut(ptr.cast::<u8>().add(HEADER_SIZE), remaining)
+            };
+            // SAFETY: By the invariants of CoherentAllocation gsp_mem.start_ptr_mut() is valid.
+            let ptr = unsafe {
+                core::ptr::addr_of_mut!((*self.gsp_mem.start_ptr_mut()).gspq.msgq.data[0])
+            };
+            // SAFETY: ptr points to a region of contiguous memory
+            // self.msg_count GSP_PAGE_SIZE pages long.
+            let slice_2: &mut [u8] =
+                unsafe { core::slice::from_raw_parts_mut(ptr.cast::<u8>(), remaining - cmd_size) };
+            slice_1.fill(0);
+            (slice_1, slice_2)
+        };
+
+        Ok(GspQueueCommand {
+            cmdq: self,
+            msg_header,
+            rpc_header,
+            slice_1,
+            slice_2,
+        })
+    }
+
+    pub(crate) fn send_cmd_to_gsp(cmd: GspQueueCommand<'_>, bar: &Bar0) -> Result {
+        // Find the start of the message. We could also re-read the HW pointer.
+        // SAFETY: The command was previously allocated and initialised on the
+        // queue and is therefore not-NULL and aligned.
+        let slice_1: &[u8] = unsafe {
+            core::slice::from_raw_parts(
+                ptr::from_ref(cmd.msg_header).cast::<u8>(),
+                size_of::<GspMsgHeader>() + size_of::<GspRpcHeader>() + cmd.slice_1.len(),
+            )
+        };
+
+        dev_info!(
+            &cmd.cmdq.dev,
+            "GSP RPC: send: seq# {}, function=0x{:x} ({}), length=0x{:x}\n",
+            cmd.cmdq.seq - 1,
+            cmd.rpc_header.function,
+            decode_gsp_function(cmd.rpc_header.function),
+            cmd.rpc_header.length,
+        );
+
+        // Calculate checksum over the entire message
+        cmd.msg_header.checksum =
+            GspCmdq::calculate_checksum(SBuffer::new_reader([slice_1, &cmd.slice_2[..]]));
+
+        let mut wptr = cmd.cmdq.cpu_wptr();
+        wptr += cmd.msg_header.elem_count;
+        wptr %= MSGQ_NUM_PAGES as u32;
+
+        // SAFETY: index `0` is valid as `gsp_mem` has been allocated accordingly, thus the access
+        // cannot fail.
+        unsafe { dma_write!(cmd.cmdq.gsp_mem[0].cpuq.tx.write_ptr = wptr).unwrap_unchecked() };
+
+        // Ensure all command data is visible before triggering the GSP read
+        fence(Ordering::SeqCst);
+
+        NV_PGSP_QUEUE_HEAD::default().set_address(0).write(bar);
+
+        Ok(())
+    }
+
+    pub(crate) fn msg_from_gsp_available(&self) -> bool {
+        const HEADER_SIZE: u32 = (size_of::<GspMsgHeader>() + size_of::<GspRpcHeader>()) as u32;
+
+        // Used pages contains the total number of pages available to consume
+        let used_pages = self.used_rx_pages();
+        if used_pages < HEADER_SIZE.div_ceil(GSP_PAGE_SIZE as u32) {
+            return false;
+        }
+
+        let rptr = self.cpu_rptr();
+        // SAFETY: By the invariants of CoherentAllocation gsp_mem.start_ptr() is valid.
+        let ptr = unsafe {
+            core::ptr::addr_of!((*self.gsp_mem.start_ptr()).gspq.msgq.data[rptr as usize])
+        };
+
+        // SAFETY: ptr points to at least GSP_PAGE_SIZE bytes of memory which is
+        // larger than GspRpcHeader.
+        let rpc = unsafe {
+            &*(ptr
+                .cast::<u8>()
+                .add(size_of::<GspMsgHeader>())
+                .cast::<GspRpcHeader>())
+        };
+
+        // Not all pages of the message have made it to the queue so bail and
+        // let the caller retry. Note rpc.length includes the rpc header size
+        // but not the message header size.
+        if used_pages << GSP_PAGE_SHIFT < size_of::<GspMsgHeader>() as u32 + rpc.length {
+            return false;
+        }
+
+        true
+    }
+
+    #[expect(unused)]
+    pub(crate) fn wait_for_msg_from_gsp(&self, timeout: Delta) -> Result {
+        wait_on(timeout, || {
+            if self.msg_from_gsp_available() {
+                Some(())
+            } else {
+                None
+            }
+        })
+    }
+
+    #[expect(unused)]
+    pub(crate) fn receive_msg_from_gsp<'a>(&'a mut self) -> Result<GspQueueMessage<'a>> {
+        const HEADER_SIZE: u32 = (size_of::<GspMsgHeader>() + size_of::<GspRpcHeader>()) as u32;
+
+        // Used pages contains the total number of pages available to consume
+        let used_pages = self.used_rx_pages();
+        if used_pages < HEADER_SIZE.div_ceil(GSP_PAGE_SIZE as u32) {
+            return Err(EAGAIN);
+        }
+
+        let rptr = self.cpu_rptr();
+
+        // Remaining number of bytes left before we have to wrap
+        let remaining = if rptr + used_pages > self.msg_count {
+            (self.msg_count - rptr) << GSP_PAGE_SHIFT
+        } else {
+            used_pages << GSP_PAGE_SHIFT
+        };
+
+        // SAFETY: By the invariants of CoherentAllocation gsp_mem.start_ptr_mut() is valid.
+        let ptr = unsafe {
+            core::ptr::addr_of_mut!((*self.gsp_mem.start_ptr_mut()).gspq.msgq.data[rptr as usize])
+        };
+
+        // SAFETY: ptr points to a region of memory remaining bytes long.
+        let msg_slice =
+            unsafe { core::slice::from_raw_parts(ptr as *const u8, remaining as usize) };
+
+        let msg_header =
+            GspMsgHeader::from_bytes(&msg_slice[0..size_of::<GspMsgHeader>()]).ok_or(EINVAL)?;
+        let rpc_header = GspRpcHeader::from_bytes(
+            &msg_slice
+                [size_of::<GspMsgHeader>()..size_of::<GspMsgHeader>() + size_of::<GspRpcHeader>()],
+        )
+        .ok_or(EINVAL)?;
+
+        if rpc_header.length >= self.msg_count << GSP_PAGE_SHIFT {
+            return Err(E2BIG);
+        }
+
+        // rpc.length includes the size of the GspRpcHeader. Remove it to make
+        // the rest of the code a bit easier to follow.
+        let rpc_data_length = rpc_header.length - size_of::<GspRpcHeader>() as u32;
+
+        // Log RPC receive with message type decoding
+        dev_info!(
+            self.dev,
+            "GSP RPC: receive: seq# {}, function=0x{:x} ({}), length=0x{:x}\n",
+            rpc_header.sequence,
+            rpc_header.function,
+            decode_gsp_function(rpc_header.function),
+            rpc_header.length,
+        );
+
+        // Should never happen if `wait_on_message()` has been called but we need to check.
+        if used_pages << GSP_PAGE_SHIFT < HEADER_SIZE + rpc_data_length {
+            return Err(EAGAIN);
+        }
+
+        let (slice_1, slice_2) = if rpc_data_length + HEADER_SIZE < remaining {
+            (
+                &msg_slice[(HEADER_SIZE as usize)..(HEADER_SIZE + rpc_data_length) as usize],
+                None,
+            )
+        } else {
+            let slice_1 = &msg_slice[(HEADER_SIZE as usize)..(HEADER_SIZE + remaining) as usize];
+            // SAFETY: By the invariants of CoherentAllocation gsp_mem.start_ptr_mut() is valid and
+            // large enough to hold gsp_mem.
+            let ptr =
+                unsafe { core::ptr::addr_of!((*self.gsp_mem.start_ptr_mut()).gspq.msgq.data[0]) };
+            // SAFETY: ptr pointers to self.msg_count GSP_PAGE_SIZE bytes of memory which by the
+            // earlier check is greater than rpc_data_length.
+            let slice_2 = unsafe {
+                core::slice::from_raw_parts(
+                    ptr.cast::<u8>(),
+                    rpc_data_length as usize - slice_1.len(),
+                )
+            };
+            (slice_1, Some(slice_2))
+        };
+
+        if GspCmdq::calculate_checksum(SBuffer::new_reader([
+            msg_header.as_bytes(),
+            rpc_header.as_bytes(),
+            slice_1,
+            slice_2.unwrap_or(&[]),
+        ])) != 0
+        {
+            dev_err!(
+                self.dev,
+                "GSP RPC: receive: Call {} - bad checksum",
+                rpc_header.sequence
+            );
+            return Err(EIO);
+        }
+
+        let gspq_msg = GspQueueMessage {
+            cmdq: self,
+            slice_1,
+            slice_2,
+            rpc_header,
+        };
+
+        Ok(gspq_msg)
+    }
+
+    fn ack_msg(&mut self, length: u32) -> Result {
+        const HEADER_SIZE: u32 = (size_of::<GspMsgHeader>() + size_of::<GspRpcHeader>()) as u32;
+        let mut rptr = self.cpu_rptr();
+        rptr += (HEADER_SIZE + length).div_ceil(GSP_PAGE_SIZE as u32);
+        rptr %= MSGQ_NUM_PAGES as u32;
+
+        // Ensure read pointer is properly ordered
+        fence(Ordering::SeqCst);
+
+        // SAFETY: index `0` is valid as `gsp_mem` has been allocated accordingly, thus the access
+        // cannot fail.
+        unsafe { dma_write!(self.gsp_mem[0].cpuq.rx.read_ptr = rptr).unwrap_unchecked() };
+
+        Ok(())
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
diff --git a/drivers/gpu/nova-core/nvfw.rs b/drivers/gpu/nova-core/nvfw.rs
index c04b8e218758b..0db4e18f7dc97 100644
--- a/drivers/gpu/nova-core/nvfw.rs
+++ b/drivers/gpu/nova-core/nvfw.rs
@@ -50,6 +50,37 @@ pub(crate) struct LibosParams {
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
 
 pub(crate) type GspFwWprMetaBootResumeInfo = r570_144::GspFwWprMeta__bindgen_ty_1;
diff --git a/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs b/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
index 392b25dc6991a..8820c488cd25f 100644
--- a/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
+++ b/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
@@ -19,6 +19,274 @@
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
 #[repr(C)]
 #[derive(Copy, Clone)]
 pub struct GspFwWprMeta {
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 206dab2e13351..0585699ae9511 100644
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
-- 
2.47.2

