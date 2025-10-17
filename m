Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EE3BE676D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 07:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1357B10EB0A;
	Fri, 17 Oct 2025 05:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mdNehrwn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012008.outbound.protection.outlook.com
 [40.93.195.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD6010EB0C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 05:48:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4453AAD70a43E7VW7gSiSoL/JLzsw3CBGutqvwNF6uIIM3q9aDxNYr0Pqz0alyxK4l++sU/OLd3eLbwamqV6QkDO25VMYafzdAhDZ984YhWKjdNE9BVMYFUqsZ8AD63eK1ITK4NrVki6VJC/xURWzBUD+3pPXC3e99spRHaXqujBpeV+nVlenEulaQj5F+rmzh7Pw7R83A2XWStPaxFPKVGri7MWV/B9TIM8/bT2+OlVRz352ddRzollB2U92lKjhjNleVZm/Ygu8ro/sSdJJ70oo+LK4WHWzGjK9lBdxt2CzmO9W0DA4xqUBoiQ2a55b02qNB3xr328qrGbV9Qxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f34eB6VyAvxfQLVnEOWcmYXzirPZ576L3zXLHLSFJ0o=;
 b=XcaQx9g71arhQSYpnhZXe7CoLy5txbnWes5+Fcrxaxeot3C8pTeXvyDz6KlWg+mGfzvaxsUros17DZ7W5VZapxP8fdYiMkdIet9YSm8YX8+6cb/LIDjEOpTg7rCAAs1ZlxTz0ds70ndZz6Qt0xoXkAe/PJgzd5AjyEgs9BEk0Vg7RmsRyRhjXBGX5bNS9qhG6S6KnOjZiTzfbm0fQ0yJQ6KDSl9tlM23+9vOs79IhNjg3o/snxoeNQ/IZ6IQ9lbuZX1IWApAvcxTkR/hCV1G9EKsl2NRFa9+WIbYuo1GZXoFemXCwsUiWt8xswq4K9WUgvnhHenDdQsBgIP7nb0khQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f34eB6VyAvxfQLVnEOWcmYXzirPZ576L3zXLHLSFJ0o=;
 b=mdNehrwnTGXjj9ga2JmzrsGu/66YPVlV6xpbokMZAYhNUJHiHowtvrCchtEfS6Mps8HQi2Hx413XdLuqwVDtvVSwENNUDsSvecOrbiQe5y16KD9Y59uLmqqiKK55vUqTDdbP7FO44VIrRJ/zthO6cv0gtVEokH1ccSJ58A3e1LjZywKu22dkoj+YDUZ4DJG5O9eo75O6GWoMM8mWY/M5VFR40zoy947+2TT7jApXy42dHiV8u3rHc6rFBRS66SgzhHEanxVSy8OdM3wwZTZ3DZJR3AUkUhekXRZdCaF5NKUFN7sTnBRJtSs66LnwYh8Re4l7fmNAp2ZG899KkT9gNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH7PR12MB7819.namprd12.prod.outlook.com (2603:10b6:510:27f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.12; Fri, 17 Oct 2025 05:48:04 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 05:48:04 +0000
From: Alistair Popple <apopple@nvidia.com>
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Lyude Paul <lyude@redhat.com>
Subject: [PATCH v6 04/11] gpu: nova-core: Add a slice-buffer (sbuffer)
 datastructure
Date: Fri, 17 Oct 2025 16:47:29 +1100
Message-ID: <20251017054736.2984332-5-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251017054736.2984332-1-apopple@nvidia.com>
References: <20251017054736.2984332-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0004.ausprd01.prod.outlook.com
 (2603:10c6:10:1fa::8) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH7PR12MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d85a6af-9b31-4df9-9e8a-08de0d40bdbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mU3dTGm9m+UNSxZ2xvMqEE/tJWCOy/hD6GwkPJq+v1/onNi7kYBPIsjinRtz?=
 =?us-ascii?Q?tE3SB7FLV+fpmr8knhmGK6JKIKtYRwTXHFSjSX5/uYhnJ/E6GG0psA16YwDo?=
 =?us-ascii?Q?ntK5W16Jx4q8lJQbNrWvvnvLfg6ce4EMQYlGLi1hpKathOZxxbtOIr+QSYSB?=
 =?us-ascii?Q?GRh98hMQcFKjrceiLjrGxpBnLcXw6OljRcWojOWsaR+vZ+alvofoE0Omayer?=
 =?us-ascii?Q?6rsPbX6GRs/ZZmkTn301rCVckiJPJRFamw6ZKmQT4ptTlTEhuT9aRJyvQHs8?=
 =?us-ascii?Q?CvWNGElEMvKmMGYAtQ88qmUKiEDXQLwoEoXQO0dmHoJnpxA8KQ3PHlY2kClL?=
 =?us-ascii?Q?b3gk1Zorc++r1cG2AHy9kUyJP8mSHEzdm9Ua9wClSMXwJxGqwYWnnU+wnQiC?=
 =?us-ascii?Q?0ML2LE/yZ6rGb0rSmafV+NZnsw0Du4U3fjuFhnRxfd0I31boy609m3kWHWi7?=
 =?us-ascii?Q?Xl0f77RvY/WgYwDs9Jpodj10EGWgwF8UNUilY7iAfIgMkEZ2mgzfai5/ODpv?=
 =?us-ascii?Q?BuQPdaFLG5URj8f60ez594UCt1z6zg+jQfxqVG0YiLVlq3E1I4nagczCX30W?=
 =?us-ascii?Q?EP9l09wazzivshqv0UYlieK+mtLH0gAz6AMfIabho4/7NzyLICE3LLByWx5N?=
 =?us-ascii?Q?drcvbPhbqnMW6H+GAT0j3YCgLhSyhH7+MXY2dBPGz9jdDrJ/vNuQZ8fUe70A?=
 =?us-ascii?Q?THrR3LjhwpwHtrGc2yM1E2Bn96+CJ7vL4IPpaH10ywfRK2m4b7FpElaznsGp?=
 =?us-ascii?Q?Ld3SnSKV9qiAAeMl23H04qSPB3mBQe582obFdM2fFYgA3TvXw+OQGiImeA5s?=
 =?us-ascii?Q?ANkCc4dJEaWCWXTq4IkMBEB7pej0fihgTXytPIeqlFpc+uncS7Wktiml8Scn?=
 =?us-ascii?Q?1h6yYdLaT41KzpVvZ4RG5nzLPagDEkGJPCpst+pjucZ8/RqPXR1SbroaGZ1A?=
 =?us-ascii?Q?ZW4UHaN7JKblfP2FUvZNCrymRAoXQ3ZAKWjI/67yp+iNhaqAd0VVkF85xtth?=
 =?us-ascii?Q?j+sW6Jyb/0ewaSjo+yoQ4wjdyg+CUKhkUOimv9LA1Yvt03xlk/gDGdo1t6rh?=
 =?us-ascii?Q?4voznwwnlILsbvK+33dGvWB1Wn/loynLqfNucejbmPetPL12VJu2RFLfWx65?=
 =?us-ascii?Q?pDQV96Hu25Ic9KxCZPRGuex1t871XSatfp7jpypRP8vikGGlavpBqzTWxH5H?=
 =?us-ascii?Q?2hBFXRZrDYFNDZaorL+MUMkaRjhrriKJOGR8ykgUK6kMrdGMePz0nUL0RBi2?=
 =?us-ascii?Q?jbm+iy0sK1uEuWqLUA06MrWAXJYMrGaXkBT9sncB5sSWOmBnBE5xKcsYUJZC?=
 =?us-ascii?Q?30FInHyx2HHBuFVASSjdC5I9Zmd2tI5oS25u28K1eJA68XkXMA6Zo9jjTKJu?=
 =?us-ascii?Q?7zy+mefXB9t8Mt70yR+ONsjd38kD9+/oeu2f/JAdfehNl3VReF8FHPMkcXul?=
 =?us-ascii?Q?8S8mGmSyDkq3K4HW9acLHIRdJ0akRmnL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yxI+rLB5pb6HlYBouUU7wVGWtDU/1hsKlCCSbuqyqHUms/swlX8QdXihlEA7?=
 =?us-ascii?Q?8srMVk6Vu6SIA9lH6rwcg+ArnJUVHzb+NSIH1tnrns2oX/yPXbiv6PWDYmQK?=
 =?us-ascii?Q?2fWOeTCLBD0FNabbM51xfVZdy87NrVzY2WuZvRSBwLPyfHlNJ+IULdhfy3zx?=
 =?us-ascii?Q?blivQCWpsi9vecGPNXSgAMg4lW8SJIaz+UeX8r7R5eCk1vHTYPoe34yD5ulC?=
 =?us-ascii?Q?xRjUbYjmIzw4cMl+eZHkoI/U3vF1ZW1BV4GY81d5BcrU5I7/o2JVuV2WHa1d?=
 =?us-ascii?Q?DFCWCPqNZD5x0+0sgPlNz3onZtI0QuOaV4bwKPRZ5VoBL1Udd6YtDkMboyA+?=
 =?us-ascii?Q?qbfPdvOvwQuenK0MTbuxkEIeUD1CRp1e1nK26KrsQGUZzadpj0wWynr1019W?=
 =?us-ascii?Q?hlltG5CX4Z9E/NcerEcIjDF22dIk+ceYuKSnRLgpSr7p70aRxu9NSHvC+oY4?=
 =?us-ascii?Q?H/Yw1HGT3sQEGSi2g9+xNcGvxOZr/eH0D+n16m0s1TUO7qWx3i0JUqEb9Cg7?=
 =?us-ascii?Q?nF8L0y5g4I1zxRaqgnpBeHPJO/fIgxgNkJeoDQjTH+V8TetpNgDhowELkfV3?=
 =?us-ascii?Q?rww9sLH99GgdMHJlFVsh4BP3ZRRRkrNJ5pzvyUuCAALMFxG+H3cgPpgL8L2j?=
 =?us-ascii?Q?1PF4hF+6ZqYCjpCdGl6ZUzCHhf4M9aTQMw/Ze6tLJU1lvOBR5FQSF5LYZuaO?=
 =?us-ascii?Q?yVNKr8GnXw9kRMgyEjDNMI2IWPaph0bXgIOucIrAk3m2SEUg86e4CEv3dQdQ?=
 =?us-ascii?Q?VXuEFd9VMhRmydn+zFModzx0vofeQvVujNgxWnYQ5vLbntfyLu4wN+qJbSKb?=
 =?us-ascii?Q?aDNDGZGQE4vMW5gJktdIel+iHajh+NdRKsfRNjCyxDEkoQh6pDwqZwJnmOTG?=
 =?us-ascii?Q?tZJU5ByBgZ80ORTTAiRNwBCbhrR+XXwVkXNX6Acv6lveVFAge/cKsOwawTio?=
 =?us-ascii?Q?DceN462836lxREJYVKD05FA8sKbJ804UrcRLdXn3SDNtMGFhxxRPS+6a7898?=
 =?us-ascii?Q?N6YC+P6Lp8QhyFduk3HkfyjaDWeAY1wQzp6EFuhqb9DUYE7YaBEfu7k+fweK?=
 =?us-ascii?Q?RMJu6k0GrIEy8QwWQhu/+7HrpK/pLlyJAmy8XbG3cSOwKob9G3EpaD8EfXEy?=
 =?us-ascii?Q?mKJs47fabrKZmyl3cZwK03bKlylPwWesC2Its6kJf3vvDMBF+NHUB1U6MzRl?=
 =?us-ascii?Q?nFbuuAtrK/YNpTaVMPd1hdhUYaMXMlFPPFuR5Is7EpNGiGydKPyr38kZ6pXK?=
 =?us-ascii?Q?iothmq/2r+fZfLWHIe8UTl0UkJPmGLfUhSzLDUTIwBuWG/xob9+MU4p24bmg?=
 =?us-ascii?Q?dwaVjp6HvcOPhyk66TuX6OLHxsPBcIKZfQyzbJzV8I12k17my5Z1ZEqOIENk?=
 =?us-ascii?Q?PMGU4W7xJx+wk2F/aLMYqMO/VnNU4qjXJgTU89EbWg6MQ2W+x1ikYtuuqerW?=
 =?us-ascii?Q?7bYe3QOVMYUXxhjwZBmVDltjSLr/qU6OTNKjkcMn+JH119BkT8XK8G9PhLU8?=
 =?us-ascii?Q?b6KhVsRQgX8UX6WWigGZq96yfsFxrWr3OUX3zWP1BFY7MxiQRYy+ZnKxaBcg?=
 =?us-ascii?Q?fvCrHqI3pIdQ5zYRiybmQfKGPNvdtjvhXftBTBOG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d85a6af-9b31-4df9-9e8a-08de0d40bdbd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 05:48:04.7595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ghJgDpQ57poTdAUNPkLQnaGjCYX2YN0eRF/J6l2dFm5cJIBXYanBeuTm3kCi4IHByKr2eSIpQ1Nf9pno6wsPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7819
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

A data structure that can be used to write across multiple slices which
may be out of order in memory. This lets SBuffer user correctly and
safely write out of memory order, without error-prone tracking of
pointers/offsets.

 let mut buf1 = [0u8; 3];
 let mut buf2 = [0u8; 5];
 let mut sbuffer = SBuffer::new([&mut buf1[..], &mut buf2[..]]);

 let data = b"hello";
 let result = sbuffer.write(data);

An internal conversion of gsp.rs to use this resulted in a nice -ve delta:
gsp.rs: 37 insertions(+), 99 deletions(-)

Co-developed-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>

---

Changes for v5:
 - Typos
 - s/ETOOSMALL/EINVAL/
 - Add documentation
 - Fix up examples

Changes for v3:
 - Addressed minor review comment from Lyude
---
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/sbuffer.rs   | 225 +++++++++++++++++++++++++++++
 2 files changed, 226 insertions(+)
 create mode 100644 drivers/gpu/nova-core/sbuffer.rs

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index fffcaee2249f..a6feeba6254c 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -11,6 +11,7 @@
 mod gpu;
 mod gsp;
 mod regs;
+mod sbuffer;
 mod util;
 mod vbios;
 
diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbuffer.rs
new file mode 100644
index 000000000000..39c973ee3e10
--- /dev/null
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -0,0 +1,225 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::ops::Deref;
+
+use kernel::alloc::KVec;
+use kernel::error::code::*;
+use kernel::prelude::*;
+
+/// A buffer abstraction for discontiguous byte slices.
+///
+/// This allows you to treat multiple non-contiguous `&mut [u8]` slices
+/// of the same length as a single stream-like read/write buffer.
+///
+/// # Examples
+///
+/// ```
+// let mut buf1 = [0u8; 5];
+/// let mut buf2 = [0u8; 5];
+/// let mut sbuffer = SBufferIter::new_writer([&mut buf1[..], &mut buf2[..]]);
+///
+/// let data = b"hi world!";
+/// sbuffer.write_all(data)?;
+/// drop(sbuffer);
+///
+/// assert_eq!(buf1, *b"hi wo");
+/// assert_eq!(buf2, *b"rld!\0");
+///
+/// # Ok::<(), Error>(())
+/// ```
+pub(crate) struct SBufferIter<I: Iterator> {
+    // [`Some`] if we are not at the end of the data yet.
+    cur_slice: Option<I::Item>,
+    // All the slices remaining after `cur_slice`.
+    slices: I,
+}
+
+impl<'a, I> SBufferIter<I>
+where
+    I: Iterator,
+{
+    /// Creates a reader buffer for a discontiguous set of byte slices.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let buf1: [u8; 5] = [0, 1, 2, 3, 4];
+    /// let buf2: [u8; 5] = [5, 6, 7, 8, 9];
+    /// let sbuffer = SBufferIter::new_reader([&buf1[..], &buf2[..]]);
+    /// let sum: u8 = sbuffer.sum();
+    /// assert_eq!(sum, 45);
+    /// ```
+    #[expect(unused)]
+    pub(crate) fn new_reader(slices: impl IntoIterator<IntoIter = I>) -> Self
+    where
+        I: Iterator<Item = &'a [u8]>,
+    {
+        Self::new(slices)
+    }
+
+    /// Creates a writeable buffer for a discontiguous set of byte slices.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut buf1 = [0u8; 5];
+    /// let mut buf2 = [0u8; 5];
+    /// let mut sbuffer = SBufferIter::new_writer([&mut buf1[..], &mut buf2[..]]);
+    /// sbuffer.write_all(&[0u8, 1, 2, 3, 4, 5, 6, 7, 8, 9][..])?;
+    /// drop(sbuffer);
+    /// assert_eq!(buf1, [0, 1, 2, 3, 4]);
+    /// assert_eq!(buf2, [5, 6, 7, 8, 9]);
+    ///
+    /// ```
+    #[expect(unused)]
+    pub(crate) fn new_writer(slices: impl IntoIterator<IntoIter = I>) -> Self
+    where
+        I: Iterator<Item = &'a mut [u8]>,
+    {
+        Self::new(slices)
+    }
+
+    fn new(slices: impl IntoIterator<IntoIter = I>) -> Self
+    where
+        I::Item: Deref<Target = [u8]>,
+    {
+        let mut slices = slices.into_iter();
+
+        Self {
+            // Skip empty slices.
+            cur_slice: slices.find(|s| !s.deref().is_empty()),
+            slices,
+        }
+    }
+
+    /// Returns a slice of at most `len` bytes, or [`None`] if we are at the end of the data.
+    ///
+    /// If a slice shorter than `len` bytes has been returned, the caller can call this method
+    /// again until it returns [`None`] to try and obtain the remainder of the data.
+    ///
+    /// The closure `f` should split the slice received in it's first parameter
+    /// at the position given in the second parameter.
+    fn get_slice_internal(
+        &mut self,
+        len: usize,
+        mut f: impl FnMut(I::Item, usize) -> (I::Item, I::Item),
+    ) -> Option<I::Item>
+    where
+        I::Item: Deref<Target = [u8]>,
+    {
+        match self.cur_slice.take() {
+            None => None,
+            Some(cur_slice) => {
+                if len >= cur_slice.len() {
+                    // Caller requested more data than is in the current slice, return it entirely
+                    // and prepare the following slice for being used. Skip empty slices to avoid
+                    // trouble.
+                    self.cur_slice = self.slices.find(|s| !s.is_empty());
+
+                    Some(cur_slice)
+                } else {
+                    // The current slice can satisfy the request, split it and return a slice of
+                    // the requested size.
+                    let (ret, next) = f(cur_slice, len);
+                    self.cur_slice = Some(next);
+
+                    Some(ret)
+                }
+            }
+        }
+    }
+}
+
+/// Provides a way to get non-mutable slices of data to read from.
+impl<'a, I> SBufferIter<I>
+where
+    I: Iterator<Item = &'a [u8]>,
+{
+    /// Returns a slice of at most `len` bytes, or [`None`] if we are at the end of the data.
+    ///
+    /// If a slice shorter than `len` bytes has been returned, the caller can call this method
+    /// again until it returns [`None`] to try and obtain the remainder of the data.
+    fn get_slice(&mut self, len: usize) -> Option<&'a [u8]> {
+        self.get_slice_internal(len, |s, pos| s.split_at(pos))
+    }
+
+    /// Ideally we would implement `Read`, but it is not available in `core`.
+    /// So mimic `std::io::Read::read_exact`.
+    #[expect(unused)]
+    pub(crate) fn read_exact(&mut self, mut dst: &mut [u8]) -> Result {
+        while !dst.is_empty() {
+            match self.get_slice(dst.len()) {
+                None => return Err(EINVAL),
+                Some(src) => {
+                    let dst_slice;
+                    (dst_slice, dst) = dst.split_at_mut(src.len());
+                    dst_slice.copy_from_slice(src);
+                }
+            }
+        }
+
+        Ok(())
+    }
+
+    /// Read all the remaining data into a [`KVec`].
+    ///
+    /// `self` will be empty after this operation.
+    #[expect(unused)]
+    pub(crate) fn flush_into_kvec(&mut self, flags: kernel::alloc::Flags) -> Result<KVec<u8>> {
+        let mut buf = KVec::<u8>::new();
+
+        if let Some(slice) = core::mem::take(&mut self.cur_slice) {
+            buf.extend_from_slice(slice, flags)?;
+        }
+        for slice in &mut self.slices {
+            buf.extend_from_slice(slice, flags)?;
+        }
+
+        Ok(buf)
+    }
+}
+
+/// Provides a way to get mutable slices of data to write into.
+impl<'a, I> SBufferIter<I>
+where
+    I: Iterator<Item = &'a mut [u8]>,
+{
+    /// Returns a mutable slice of at most `len` bytes, or [`None`] if we are at the end of the
+    /// data.
+    ///
+    /// If a slice shorter than `len` bytes has been returned, the caller can call this method
+    /// again until it returns `None` to try and obtain the remainder of the data.
+    fn get_slice_mut(&mut self, len: usize) -> Option<&'a mut [u8]> {
+        self.get_slice_internal(len, |s, pos| s.split_at_mut(pos))
+    }
+
+    /// Ideally we would implement [`Write`], but it is not available in `core`.
+    /// So mimic `std::io::Write::write_all`.
+    #[expect(unused)]
+    pub(crate) fn write_all(&mut self, mut src: &[u8]) -> Result {
+        while !src.is_empty() {
+            match self.get_slice_mut(src.len()) {
+                None => return Err(ETOOSMALL),
+                Some(dst) => {
+                    let src_slice;
+                    (src_slice, src) = src.split_at(dst.len());
+                    dst.copy_from_slice(src_slice);
+                }
+            }
+        }
+
+        Ok(())
+    }
+}
+
+impl<'a, I> Iterator for SBufferIter<I>
+where
+    I: Iterator<Item = &'a [u8]>,
+{
+    type Item = u8;
+
+    fn next(&mut self) -> Option<Self::Item> {
+        // Returned slices are guaranteed to not be empty so we can safely index the first entry.
+        self.get_slice(1).map(|s| s[0])
+    }
+}
-- 
2.50.1

