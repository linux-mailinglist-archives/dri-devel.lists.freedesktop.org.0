Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F19ECBC30C4
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 02:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5628E10E0CF;
	Wed,  8 Oct 2025 00:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pOd5hePl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010021.outbound.protection.outlook.com
 [52.101.193.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB50810E721;
 Wed,  8 Oct 2025 00:13:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6O+DVr+4bA2Zlin1GNCxFzoUGpPlKdLfV0PD+hOD1NiGKcVZ2/RgRfECEu3RNigdxp/A6WSAdHaksN2W3QS1U1bYKloqfbXPMHxiTSIivHHBKri7JrAfhrQGbkS0De2URSP51ZVDBD8IWEPlUWQwmijJaBgaV0ctYgbzyIl0cePb/D0+p59wdS8fy09B3eeHR9kOhW9a1cI3zkuvvRlmjMOmGgX+6L/FWDRCTH2G5AOSeIBdMfJ0Kty9/qnvYihY3DqQWG36S3AWe3izQOZ8G0S2NjIUvQt7fBjFAe4qsdgUgL+Xisg05UlnDJaBJ4A9LxFfbQ3ML2oGT5o5WVsbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOWlqySJYqmaqVVjJ9kbX2P7Epwe6TjAUQ7JG9gSIjM=;
 b=ndXK30PHDoLcVHbxIyVreS3/yV7sHATB8CDV2M4G0a1MYy4I8fmaqPPynBeA8RumHqyAI7GFitn3/+ceqQ78SvPLZHvFhUpdQuPAFWq9NfzEo80wSLHC9MW7irSR6Luqe7i4BeJJltNYrefQ7Dkk1bAF2Frwx/qn+u9e4RdajmFu7qjY6UH5s3+qZ25ulehbN228osEdcjMZkT57X+kEzOQGTFsipI/PTitzWlXAOGPOZYB3ubpzRsRFnZVWZ44Qv96j630C9eR/krg3LPh4jOL6k4dILqMpVgMuS3RUaHT4AaJOy3uNwGFeds+Z8tzhyfjZgQtyfb+oSU/NCiMliA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOWlqySJYqmaqVVjJ9kbX2P7Epwe6TjAUQ7JG9gSIjM=;
 b=pOd5hePlPqvsJAFIHxLvzAv/n9LmeeSl4for5TtpS3uCZHSKxoEeDLdyBJrak4Vr6QfsZyAxEtQvZrNs+23o1fkOuShe1A5KWyTFvKKTLHItA25zaXDAXU0ffVi3n7q7aV4OsQv4yxKJYqhqFPSngmn8BPnGH/S038PmxGFQWUN6viWQS4ypc339cJYFUuoWFG5jysuFlOlHeEU/r/fayMz8o+LO+TFMrVxldIbjP4GRk/+b4GH7+WoWM+OaZTWHtqDa9P8iIiMhyxaO2AkackjeClR0VCn79zkEGKw24Uko2gCMQ52a3Wo3r96Bry8wbzc7WYy7gLfLEWlS7bbrFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH2PR12MB4071.namprd12.prod.outlook.com (2603:10b6:610:7b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9; Wed, 8 Oct 2025 00:13:21 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 00:13:21 +0000
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
Subject: [PATCH v4 04/13] gpu: nova-core: Add a slice-buffer (sbuffer)
 datastructure
Date: Wed,  8 Oct 2025 11:12:43 +1100
Message-ID: <20251008001253.437911-5-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251008001253.437911-1-apopple@nvidia.com>
References: <20251008001253.437911-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0143.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:205::15) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH2PR12MB4071:EE_
X-MS-Office365-Filtering-Correlation-Id: c4ca3e54-6b48-4bcf-364e-08de05ff7d4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mxTcvmCWsLliMx5yyTWO0sXoq3TheHFc3vWCR6a8S+oiA1YOARo4Bsqi+iTp?=
 =?us-ascii?Q?Rw/aqEJ2/zD1eou3UypAxWgEGU0G8n7nBHa6Y9eS0QvklbPm+mM7uixlzfMF?=
 =?us-ascii?Q?LPPrhhZ/vIE08YNrH8z/el8koZlwvVUe3i3nz3vqoZGRTvZRO4vyaJt7k/0A?=
 =?us-ascii?Q?B4WNLooWc7EpRx6owl4cd7OxatR2/8PyorH0ZdaTON6xRLoPmuromBS1J3Zf?=
 =?us-ascii?Q?5Wc/8IS+f5YszmSBZmtcpZ4BgbeaZ3YLuzx91xuXqOzCQ3eo8ouBTu5nxG/b?=
 =?us-ascii?Q?jbOpHnUikhqpTMIQPo+d6Fcdvf5LAfoTiicV5c4TpV6SJ6y9sDLdaDlEnsta?=
 =?us-ascii?Q?xCJSLpQqVsf3gyoqEkxgTLRbTBLxu1LH+4W7/RlccBxq8n7aYP9blanFMcR1?=
 =?us-ascii?Q?7HSmf+4mrbCj00pG4Ilco+MsNn6GFzcPxEF0XhjEYU9Wrd5cKm26/y+Cs2iw?=
 =?us-ascii?Q?F0HLOMtsYFfdol+wUJj4X35ZM8nF2dHYteT1UP/YRwfm79L6C1Qugkg+djz7?=
 =?us-ascii?Q?YwaOZpJzpJiS8PZXapaeQ/uQYbZYzyWd4xDzROSVRWeTVr4zse1dfowoYrSj?=
 =?us-ascii?Q?U67V50vbTAi16tbn/Sl9RDcDeMkMinkcDJ8J1lHhuvcqbYemYOMNiDIftoxG?=
 =?us-ascii?Q?Cx0qtPRODpO6MDPHNKj86BZOvkmGCpQfffk6abHKKPEX0ay8G5+4cve23uua?=
 =?us-ascii?Q?GgdRCA98Ny/OHHdHlX7eJgKZDqfNYrSJkWNeV09d5mDc/HfNMeYfwtLxOXQ+?=
 =?us-ascii?Q?bwV+vy+lh9IIdycybCuK5L9e2s1ztcMJeNfHIO1fxG21IEcpvhSKYmoEbpi1?=
 =?us-ascii?Q?NjK5TImYd91VtJEH0Sh1LY3UXbBtU6LrrvkSEqp88MgCWN41Z8wzkB5YTXFa?=
 =?us-ascii?Q?n5ZC0ka2OLf4gTcIR1qvxKthnwv0GKrXGElLo27GSXFe31nhrt6AR1ZOxGw9?=
 =?us-ascii?Q?cJk+gPffPINaKP007E4AZ+Ixubp7ghWCGtolEBAXXYC3bTWGwbOZrf0GZk4l?=
 =?us-ascii?Q?GbMZKi5y7gcvCfRSHmtM5bZlABH5VB13NeHgjmfwuLA4VivlUAZ1BNpn3Kr2?=
 =?us-ascii?Q?BdSfrIYnd1z22d0RV8EvzTt7tLfuR2xlIYayYDIyqxgrQtW2lameasb3QjCr?=
 =?us-ascii?Q?GBUD0KjMgoLmlZQ4V11vTii3ucvVRGI9KIZgV4sLGiaH+T8sGxnzth57IfoH?=
 =?us-ascii?Q?6de5X8jBw8UK7JQICgMKyrp/Cnq9sI9G6IdfgJMPgu95skWvwcBk6Lafc60C?=
 =?us-ascii?Q?GmXvZALYyj4CSAIcPiMMiwXwaMbBYSCy4R3rOBPCIkIAb1mDAYBxfS6L3LMU?=
 =?us-ascii?Q?P79CVvNruI3hqKp2rDBZQAucc58vfxtvAT8QiKjURiaMBN/UQCWGb13D7fuc?=
 =?us-ascii?Q?IuTy2cwIPTbGUyzlkW0jsZr/rFgxhJLH5kKZl8VpwH9LaHYdd6C1twV3QBgb?=
 =?us-ascii?Q?On9g58KLySzIVl+7UWYwrAs3ZaJv4O7Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bIWwQ8LibSfiZVzZ8rwAkG0wvu2jBB6rzyIgABmKnDixBYx5h6e21Me7YQVv?=
 =?us-ascii?Q?iJXhavgbdzVrk5SIXP0New2mfSgJ20e0C/bhz7cZrVUcZDxmoVJlKKyb4RRt?=
 =?us-ascii?Q?1T2ybS3gMy24Kt+z8F29TpIWAdW10Z5ljFP5YhH7gWI5y1jDsR6Gv98+dicB?=
 =?us-ascii?Q?EhFTaqUhuzeG+HpeHN33MD22D+ttqn5jbgfrOBe+3XpCQW2rpM6nyQksWWhj?=
 =?us-ascii?Q?CqmYLCuGNCce31vk/poN8pqM+v/zzhlZpb6h/oP2mqYx59BsYju4AN2CzYbD?=
 =?us-ascii?Q?i2BqE2Gn0fZ9M792pXyp7QLFJCt/P2d6sGbWE0jaf2clylbCNwTYI9zBGXxH?=
 =?us-ascii?Q?kLVGExDgwj6/m99s+pWOiy34X02hXKyEnJ9skbcTUXZY1Ie6gxD8OW86I2hD?=
 =?us-ascii?Q?cIfPZmBbAGZ8zBFOq13gW+NRowWFFiRtWgpUVLcwNtfp8BB0Ec4aA5sjaP1W?=
 =?us-ascii?Q?7k6n3Ms2cmwOSbYtPeXdp1/XIlOvtppOEPltQNDXPFpVMb1sqdLtbDIXTjT/?=
 =?us-ascii?Q?YG1dAtLGRygGVA+9u1akU1t77E4aiKWXitIYiUihlz2lkY0bSbyeekyd+4hh?=
 =?us-ascii?Q?FifAmd94uccHCmiWeD95MPmFHr5timbAbiKGqr4BqEFFpuQ45fVGEhZtYv1B?=
 =?us-ascii?Q?/G7fxn4Ihg2dSUIlt69jEeHgU4xCJhiCAvgTYI72NGiVV/yD7I/46++5MWAp?=
 =?us-ascii?Q?G0n5kZe7YLzOM2Cfdk5Cz3ELYGdshW8OQC4XRYvT6UhVs2ctvUQ3Yop3xM+h?=
 =?us-ascii?Q?e2jKmEUeyPxB8ODDVbN6sQBke0jX0uIJQWrdx2JMpQmHt1t1bA0RQU5xeIbg?=
 =?us-ascii?Q?//fWebBkJh41yd22eCJnu86zhvY8eNN9iPbjP9eoJlkFdmo+vmQ/DWBxGIEb?=
 =?us-ascii?Q?EWqQdQKfaa205DvTNg2yIaGPoG6vyVayWRJVjRwIQhYv0D82zZ7bDYjBGxcn?=
 =?us-ascii?Q?EIomDOxt92UyV0e4gk6dhwEer3+tx0BcC+WUVnUnZQzlYPW2mh3NcWkS3ax/?=
 =?us-ascii?Q?Y+qpgdY1U/gfvqRmW52qmQGL9Gbj16/nnxuIZ4NOyL0VWXg7gtPkOaF+t8YQ?=
 =?us-ascii?Q?lpWaEjgDcIjVpb28PvFes1e6oWT5G7sid/Erb7Kie4AHnL9dks+IcBaKdu6D?=
 =?us-ascii?Q?v5hgsmTM7dsOeJLgeBMQrGsD9wh6A6ivFXqyX7LuofKyzYHoqTOHdDP7vsEE?=
 =?us-ascii?Q?88fBWcVV1iV27JNO0jsf0FGsk4KoSokn1+7/XThf7QYGtORLLF68AHq6sj9i?=
 =?us-ascii?Q?0tFrx4k31hkkgsU7DJ6EhLsUGKTaPVVqk61VUD2I4KEHO73KEs8l1dv5PEYF?=
 =?us-ascii?Q?8c/vt8AvSeuolemER8eNRuWXXY3ngZ1A/bsghFJLZWLpZ5GbePEEQOiOBy/u?=
 =?us-ascii?Q?/ie/oqSZHOPkH4dAkihySphlkn/uYX1x+6Y0UMtGrehBm1L+7lRJk8iSSKKF?=
 =?us-ascii?Q?easHBI5QHqljtA0he9FuFwwQyj9Fhwb8l7Hs9W+OmsgSymuuHcCcQq9naL3B?=
 =?us-ascii?Q?xLZV/0YKEXw4jO8ZzLbsSjmTCHEyN/osJE9IntH/tK9pkuVn/Z4/spaVkhhe?=
 =?us-ascii?Q?OILcKG7E+yZYDV4lVS3pwvnEMJqByINUCPUSsrMd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ca3e54-6b48-4bcf-364e-08de05ff7d4d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 00:13:21.3495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/ZfdFZBKmAFVb6gkNrkiuBj5L0ydkjUcmEVdgnMaoizjlVKRlIoRddqPmPwwRz2UbzPCdUvExBrBYlkn0FMeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4071
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

Changes for v3:
 - Addressed minor review comment from Lyude
---
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/sbuffer.rs   | 191 +++++++++++++++++++++++++++++
 2 files changed, 192 insertions(+)
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
index 000000000000..e82f9d97ad21
--- /dev/null
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -0,0 +1,191 @@
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
+/// as a single stream-like read/write buffer.
+///
+/// Example:
+///
+/// let mut buf1 = [0u8; 3];
+/// let mut buf2 = [0u8; 5];
+/// let mut sbuffer = SWriteBuffer::new([&buf1, &buf2]);
+///
+/// let data = b"hellowo";
+/// let result = sbuffer.write_all(0, data);
+///
+/// A sliding window of slices to proceed.
+///
+/// Both read and write buffers are implemented in terms of operating on slices of a requested
+/// size. This base class implements logic that can be shared between the two to support that.
+///
+/// `S` is a slice type, `I` is an iterator yielding `S`.
+pub(crate) struct SBuffer<I: Iterator> {
+    /// `Some` if we are not at the end of the data yet.
+    cur_slice: Option<I::Item>,
+    /// All the slices remaining after `cur_slice`.
+    slices: I,
+}
+
+impl<'a, I> SBuffer<I>
+where
+    I: Iterator,
+{
+    #[expect(unused)]
+    pub(crate) fn new_reader(slices: impl IntoIterator<IntoIter = I>) -> Self
+    where
+        I: Iterator<Item = &'a [u8]>,
+    {
+        Self::new(slices)
+    }
+
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
+            // Skip empty slices to avoid trouble down the road.
+            cur_slice: slices.find(|s| !s.deref().is_empty()),
+            slices,
+        }
+    }
+
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
+impl<'a, I> SBuffer<I>
+where
+    I: Iterator<Item = &'a [u8]>,
+{
+    /// Returns a slice of at most `len` bytes, or `None` if we are at the end of the data.
+    ///
+    /// If a slice shorter than `len` bytes has been returned, the caller can call this method
+    /// again until it returns `None` to try and obtain the remainder of the data.
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
+                None => return Err(ETOOSMALL),
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
+    /// Read all the remaining data into a `KVec`.
+    ///
+    /// `self` will be empty after this operation.
+    #[expect(unused)]
+    pub(crate) fn read_into_kvec(&mut self, flags: kernel::alloc::Flags) -> Result<KVec<u8>> {
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
+impl<'a, I> SBuffer<I>
+where
+    I: Iterator<Item = &'a mut [u8]>,
+{
+    /// Returns a mutable slice of at most `len` bytes, or `None` if we are at the end of the data.
+    ///
+    /// If a slice shorter than `len` bytes has been returned, the caller can call this method
+    /// again until it returns `None` to try and obtain the remainder of the data.
+    fn get_slice_mut(&mut self, len: usize) -> Option<&'a mut [u8]> {
+        self.get_slice_internal(len, |s, pos| s.split_at_mut(pos))
+    }
+
+    /// Ideally we would implement `Write`, but it is not available in `core`.
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
+impl<'a, I> Iterator for SBuffer<I>
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

