Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D775FC2EAAE
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 01:58:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2916710E4F9;
	Tue,  4 Nov 2025 00:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DsFmLWGN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012030.outbound.protection.outlook.com [52.101.43.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A2710E0B8;
 Tue,  4 Nov 2025 00:58:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lDp3LShN9LptEj+K46L//9LGidL/NjtTv/JjHzclsdI5TXt0fNzfz4ckL/GrRhpRx31grT3llue950fObyHK7FLvScAoD2dcpTLfMgKjpvha+IgmHguMs7XM+/MLZ/g7EiDl/wBq73VNba3J32358lfX5309AEPId4DRsxs6WkEGIqqcD8ERG4b6Wa8PqUD4CoKuwpg8YD+WGgZw5mUuwc1A44K0DY69fDxdH3fib/pIpYZ9rUEqPyphu7ia7ZKznqCsaCH2mf88SO4shWmyKmKz6qZz/jFxhrNtpF38UK9P6nipFBKR0NOim/GjxKjSox4F6WENthPjaa0qbcutrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNYwstG8T01U/t3lVkshCDAVzj23u2i4YCZZhO49mT0=;
 b=F5G26Tyq3HfT1pG1yC2MCRqNdnHZyTifYa5ocCbrmHGWml8TokLx9Usu+6vaGR99pCfFW8CUll0DVrVcNvvqYcmVRy7W6Q/TqXfnzNpPEgwXsSojZ1feuH0HVND+KK3xxnRDQ+eCitVwYaXgh5TbXU60uPPyNORqzhCf1ByA13Nb9hYVwRD59tQ7DjBaoRby5jvC6G49IF2kuT8EZn6j07q+HgwSAX78yAyVxfEw9zFy/AWKGcl04YynmADvBLUEwExHfHAHLynI+NNELiGCWLJ8ZugOfiyqrjz+jAdRdXqy4wT9tqo+0nbqB+nYPhqSzcBnHOxjomYbusLN3M3yZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNYwstG8T01U/t3lVkshCDAVzj23u2i4YCZZhO49mT0=;
 b=DsFmLWGN7MbXx/3M5T4Trm2sLGPFWrEPv5DWUjlzKEdkIoc2nJjlF9Ht20WqWjy2TFLYGbsjgQH3ZGPhuZkEppAoR9nouoaU/0r0LXqIWylNt9oe9IPfp4Oj8WvaYVYWlFQmegSgoyme35fAypaJJ5arjGZt0755aQtZVhggah0Gv9M7hVys4pbPR4r/EM//wMJ1cyl0L5WVl2OjoyenkWkGOTMrkhQpoEgLVeU/DdeZTmxVI/vh5L5bCOicWigqeFoZhgGQ5t5wnci5Sl8aD0KUgik7qkNGKdMsT9791IX8V7OcgW9R4U//HfpGptE24p7quF94XDY6cAY0jkgkwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SA1PR12MB9470.namprd12.prod.outlook.com (2603:10b6:806:459::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 00:58:13 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 00:58:13 +0000
Date: Mon, 3 Nov 2025 19:58:12 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org,
 David Airlie <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, nouveau@lists.freedesktop.org,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH RFC 1/4] rust: clist: Add abstraction for iterating over
 C linked lists
Message-ID: <20251104005812.GA2101511@joelbox2>
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-2-joelagnelf@nvidia.com>
 <DDX1WYWQNTAB.BBEICMO8NM30@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDX1WYWQNTAB.BBEICMO8NM30@nvidia.com>
X-ClientProxiedBy: BL1PR13CA0146.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::31) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SA1PR12MB9470:EE_
X-MS-Office365-Filtering-Correlation-Id: 39c84352-f322-439f-3346-08de1b3d3af5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BKlvuN6lMWPiZZUXDw3FdtcfFLrtRsGae+3O9E2h3/22NNnsgAPeabFv8hTJ?=
 =?us-ascii?Q?zZcBNAYSUYCAxB4EmBzCIoHavI6YFnlRZHi9uBL9O5slmWt1ol+LeqeEhZEm?=
 =?us-ascii?Q?zWby4+I+yhFKJNS4Sl+/Q1pPLJnYDeSmYFS8t4jxXSG7oU5VF/L5KIu1umGn?=
 =?us-ascii?Q?q+OwzBl9TH5t5K9zQr9g3N+ZiZuzf+R9gm39IHho3ItxJixa3qyp6U5tMZ8a?=
 =?us-ascii?Q?Ys4pyMvohrmRh8muu8NNU7swJZJi9/zNmxKVAiJHB5X6t6yUMOQapsEFjxmV?=
 =?us-ascii?Q?DDW74P4QmiqfL82ZDk6uMFjP7oFAf1VNJrKIN5TAEbAcv6FgKAsD+yiAGb48?=
 =?us-ascii?Q?rOGTDFubKSb6F6S0WidZB+q1wVoZi1DHph08+yfRd3lp4qhvlUxFstCBh7/x?=
 =?us-ascii?Q?jgZkLXO5P20XdFfvrccmcZCtPCamO0LwzfnpSVe2Q3lZvcoiI0EeOZ8wf+qa?=
 =?us-ascii?Q?ZpBZf294+Q9Su7OVDkJP9ah99xNH8jJPfjdu1biwVIBWnNawGYLA8ccisz3W?=
 =?us-ascii?Q?kWFtPybex2Rwy/ySOS7NNd5XmUWEvo3AqWbDkt5WlhwIUItjdopTrxdsLg0W?=
 =?us-ascii?Q?VSCCi0iM+Wiu9ZhKisKKDgpvUl2WHCyKz7lEIv8O8O/+LRfaTS4tkoFvVI7I?=
 =?us-ascii?Q?72rLhZYYgrrXNu8gcxVAfQjb3WVx48VF+7L/WlBPh/J2DTXkMA1nvqaZiadT?=
 =?us-ascii?Q?HTHh7KKVZxCjX3Y94eNvc9nv5BiGK7Q9eme8n3tzm4+mEwSt92YofkmaQr7y?=
 =?us-ascii?Q?oGLTS9ichDYKgTx1vsTpy8BXVO6c/5m6WDIPnYwScjHwD4mBmxcbVzkw2yYK?=
 =?us-ascii?Q?APTt0ayJnRgp4//nXYM2qOa2CqumNQB5RqMPW8ABIShdC5V0epZLns5WkeHu?=
 =?us-ascii?Q?rIku6CkCsUVW6IRCmQr0hc3UNjbZLm5V6WNLxMm7xQaaKALba+FeX2b3O2Dp?=
 =?us-ascii?Q?K4pDPOZoTrPcmPjIDeSM6q7dELYPQaJEHnwAwxKPiFq7r0+t1SpG9aE0K9mC?=
 =?us-ascii?Q?1Mkd9Pes6Sztgwmi8K4AbnnXYpwlowu5KKhNQJ/Q0fWOm1L/5uq5xIAuWGcN?=
 =?us-ascii?Q?BlnS6zr+KCxDxZCw8wbiTF4Fb58SFFYsC2rTrmEeji/z4MB6rT/za0anLQM4?=
 =?us-ascii?Q?JJYb9aMThDcSypPSa/lx/cASK69yQidZpCEY7xNKK2rwXg4wp/SYfOhH7eIT?=
 =?us-ascii?Q?VTzQkALXo5vJN2vMWwXHmICU0i5hKO+WfFxUFNVi1wlZCyZ6ZPEEu1oVTb0n?=
 =?us-ascii?Q?38hpE95kmCEqsJDbdfNM1XWqxszcgT4yefDNm+Q7Dy9XFCi3el/5+5oSrutQ?=
 =?us-ascii?Q?YszNEbX1q/zZ4qn83AoCnuKx3sicS5ZZybRcbnuF1FD0LMD0hsvrBFgMBwR8?=
 =?us-ascii?Q?JT9ZS+nxPKjs0vitwnizrjcSyrEEHOVXakodAAS9rtYX6Mb7VjlGTPyGupES?=
 =?us-ascii?Q?NpMLP31x36DCBFmDEAS4Ch/LgzISLH3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AKmKXoRGkX6aCReK9sDanUre7MtQ9wE1Bx2nr6VKmtl2tpafW9uK9EXAJ6j8?=
 =?us-ascii?Q?l7vAXIhH5T3wlM2XjgsyvHHp+hzWZnFNjUOINDFIc3ljfeUPrAGycWcELJ3/?=
 =?us-ascii?Q?9TwKVzTPZX47D7HaO8OnL9qD1bNpPnlcMtvEwclTxK17lIVRITZwNeZnZkOe?=
 =?us-ascii?Q?7PIZn5lOxXMXcKgw4jlnPPtogu6DImtzDTLgVyPeseum1KsVqmLplOQQ2pjW?=
 =?us-ascii?Q?C97slMyCUflXW2nfQWzhSt+GrVAioIgeifZAVjcfPFsTVg7grfpzyL68Dher?=
 =?us-ascii?Q?gNY20Bv2mr8r9jmpeGkOxaG5ikXjPdJcghPV4povuoWr/VHnzOcI2wMYFrtn?=
 =?us-ascii?Q?88ZEpjTLJ66C0ZeIh8tYbW43T+Bq/kr6S9Zdlje9N1WUPL9cBpwpdkTBIO4M?=
 =?us-ascii?Q?BzZ7nK+DMfJ7Zj5QjJAf+tsvhS8BMe3CphPJo7zjsRb1E48t34X8RtRmiBb3?=
 =?us-ascii?Q?b8zmI+2I9ECezmxiMgsFM+8EvxwL2g4MPAwhjjkDwbnmKbuY0myOgv+tIgyA?=
 =?us-ascii?Q?QN+0UmnMlFmnGqziwm3t1IN3ie9a6mc4wcNyApNwkwd4ywz/GekaRDHkpnC0?=
 =?us-ascii?Q?UqM1HwMbbluOp9kPinmbCl9scm2ZCV8s/5wKB2TXK0dkDxh5z08IMXugQaJd?=
 =?us-ascii?Q?BX3IK4wbRn0obbaAYBPMJDkuiAPI4I1UlTVQW32JeZ5ltsrWA7wPpVdDRAk5?=
 =?us-ascii?Q?g+pFgrrDTKTX4LRLGED/SmM20wUWac8AxUoRDwT5bCSr80tGqJpFw0W8CwRk?=
 =?us-ascii?Q?AO46Sa9wMOHT1qSQU+JeB8Yarcf618f4PVBcgwBmM1Ew4xa2p7pr2OM+scSV?=
 =?us-ascii?Q?9oqvxBXnQdiDxsrewjN62wW8c264bZusaXu+JNk/bBZf7VqyJHQInyMaDaoG?=
 =?us-ascii?Q?Vjre1JF2P9urDSYqtGz7+u790SVHJ2uHlBCXvqe0xcFV+voK+nxU98nn+eUa?=
 =?us-ascii?Q?8diNRv7dRsF8sX7mWdkkIACguDFgZ+H5uDo2Uc1c4VfpRytQJmrn2N9qAYF4?=
 =?us-ascii?Q?CW4d72hz5WCzgv1O7khyRULyuaQjczPM1D46CvogDP6ct9jpSjuHxTPpC3zY?=
 =?us-ascii?Q?sqfvPTQ6EAcSa44kc50RJT61Og7Dqsskg5ndlidxa0exPd8r9mjjpChSLvL4?=
 =?us-ascii?Q?h7Vp7JvYmEDFtpjkt8BQF3yfomNd4ihjdKg+g6vfA+HeHwwLCur4zSlIk2HH?=
 =?us-ascii?Q?JLgPmrAKyMbjRu3Wqez7P/8WgX0/vApFH+Vwe5+NxU5qZSfzf9qGvuhD3FTG?=
 =?us-ascii?Q?7Iq0u4XkZD1e5ijwCwllGZLMuydOopPGDPKYV3mXARJyh5aQVv7a9KXaGGjG?=
 =?us-ascii?Q?0GBtxk/iDGFYy3pK2/qjWBZ8niJiZDsSFX+yf1iHSItIcpwZW/DMnoS9sEf3?=
 =?us-ascii?Q?ZY7e3f2bcm4z1YRvoyXcN5wEkTQNIW0sJGYofQ54+76NX3KyAF4YltXF0Lhd?=
 =?us-ascii?Q?NxW7/zoJWJ0Hgjkv/aU9ma1rz234B4cw0ozvuD5kWIMTErBas0GNJ8lO+mkA?=
 =?us-ascii?Q?b09OfP+nXn2/gJmgsLUXGwdQX44bl87HdEKRjZNTs0EGJZ+lC1kcllNy8k5S?=
 =?us-ascii?Q?pxLdqdcV7dubbSnOA2FfbG1EMpNN3UAg3N5k95AZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c84352-f322-439f-3346-08de1b3d3af5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 00:58:13.1734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 65f2KdL00aWD+vlQEz/mvRefDls9NBtez2byg/hgoKrgOx2VYwt7pwYiN7c5f10wXekD5qtES0gvCpaZdp0HZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9470
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

On Sat, Nov 01, 2025 at 12:51:32PM +0900, Alexandre Courbot wrote:
> Hi Joel,
> 
> On Fri Oct 31, 2025 at 4:06 AM JST, Joel Fernandes wrote:
> <snip>
> > diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
> > new file mode 100644
> > index 000000000000..e6a46974b1ba
> > --- /dev/null
> > +++ b/rust/kernel/clist.rs
> > @@ -0,0 +1,296 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! List processing module for C list_head linked lists.
> > +//!
> > +//! C header: [`include/linux/list.h`](srctree/include/linux/list.h)
> > +//!
> > +//! Provides a safe interface for iterating over C's intrusive `list_head` structures.
> > +//! At the moment, supports only read-only iteration.
> > +//!
> > +//! # Examples
> > +//!
> > +//! ```ignore
> 
> Examples pull double-duty as unit tests, and making them build and run
> ensures that they never fall out-of-date as the code evolves. Please
> make sure that they can be built and run. Supporting code that you don't
> want to show in the doc can be put behind `#`.

Sure, the reason I didn't do it was there are a couple of challenges:

1. For clist, there is a "C language" component" as well in the
sample, as these are lists coming from C. I am not sure how to do that as a
doc example, I might have to emulate a C struct containing a list_head in
Rust itself. Is that something we're Ok with? After all the purpose of a
sample, is to show how this could be used to interface with lists coming from
actual C code.

2. For DRM buddy, #1 is not an issue, however CONFIG_DRM_BUDDY has to be
enabled for the test to work. I have to figure out how to make a doc test be
kernel CONFIG dependent. What if the CONFIG required is disabled, is there a
standard way to make doc tests not fail for features that are disabled? Are the
doc tests skipped in such a situation? Just something I have to figure out.
Perhaps wrapping it is #cfg is sufficient.
Btw, I also realize my patch 3 introducing buddy.rs is not dependent on
CONFIG_DRM_BUDDY, which it should be. I was testing with CONFIG_DRM_BUDDY
always enabled, which is probably why I didn't catch this.

> > +//! use core::ptr::NonNull;
> > +//! use kernel::{
> > +//!     bindings,
> > +//!     clist,
> > +//!     container_of,
> > +//!     prelude::*, //
> > +//! };
> > +//!
> > +//! // Example C-side struct (typically from C bindings):
> > +//! // struct c_item {
> > +//! //     u64 offset;
> > +//! //     struct list_head link;
> > +//! //     /* ... other fields ... */
> > +//! // };
> > +//!
> > +//! // Rust-side struct to hold pointer to C-side struct.
> > +//! struct Item {
> > +//!     ptr: NonNull<bindings::c_item>,
> > +//! }
> 
> As Danilo suggested, using a e.g. `Entry` structure that just wraps
> `Self` inside an `Opaque` would allow capturing the lifetime as well.
> Look at how `SGEntry` and its `from_raw` method are done, it should look
> very similar.

Great ideas. I will look at SGEntry, at first look it seems a perfect fit
indeed.

> Doing so would also spare users the trouble of having to define a
> dedicated type.

True!

> > +//!
> > +//! impl clist::FromListHead for Item {
> > +//!     unsafe fn from_list_head(link: *const bindings::list_head) -> Self {
> > +//!         let item_ptr = container_of!(link, bindings::c_item, link) as *mut _;
> > +//!         Item { ptr: NonNull::new_unchecked(item_ptr) }
> > +//!     }
> > +//! }
> > +//!
> > +//! impl Item {
> > +//!     fn offset(&self) -> u64 {
> > +//!         unsafe { (*self.ptr.as_ptr()).offset }
> > +//!     }
> > +//! }
> > +//!
> > +//! // Get the list head from C code.
> > +//! let c_list_head = unsafe { bindings::get_item_list() };
> > +//!
> > +//! // Rust wraps and iterates over the list.
> > +//! let list = unsafe { clist::Clist::<Item>::new(c_list_head) };
> > +//!
> > +//! // Check if empty.
> > +//! if list.is_empty() {
> > +//!     pr_info!("List is empty\n");
> > +//! }
> > +//!
> > +//! // Iterate over items.
> > +//! for item in list.iter() {
> > +//!     pr_info!("Item offset: {}\n", item.offset());
> > +//! }
> > +//! ```
> > +
> > +use crate::bindings;
> > +use core::marker::PhantomData;
> > +
> > +/// Trait for types that can be constructed from a C list_head pointer.
> > +///
> > +/// This typically encapsulates `container_of` logic, allowing iterators to
> > +/// work with high-level types without knowing about C struct layout details.
> > +///
> > +/// # Safety
> > +///
> > +/// Implementors must ensure that `from_list_head` correctly converts the
> > +/// `list_head` pointer to the containing struct pointer using proper offset
> > +/// calculations (typically via container_of! macro).
> > +///
> > +/// # Examples
> > +///
> > +/// ```ignore
> > +/// impl FromListHead for MyItem {
> > +///     unsafe fn from_list_head(link: *const bindings::list_head) -> Self {
> > +///         let item_ptr = container_of!(link, bindings::my_c_struct, link_field) as *mut _;
> > +///         MyItem { ptr: NonNull::new_unchecked(item_ptr) }
> > +///     }
> > +/// }
> > +/// ```
> > +pub trait FromListHead: Sized {
> > +    /// Create instance from list_head pointer embedded in containing struct.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// Caller must ensure `link` points to a valid list_head embedded in the
> > +    /// containing struct, and that the containing struct is valid for the
> > +    /// lifetime of the returned instance.
> > +    unsafe fn from_list_head(link: *const bindings::list_head) -> Self;
> > +}
> 
> If we go with the `Entry` thing, this method would thus become:
> 
>     unsafe fn from_list_head<'a>(link: *const bindings::list_head) -> &'a Entry<Self>;

Sure.

> But that leaves an open question: how do we support items that have
> several lists embedded in them? This is a pretty common pattern. Maybe
> we can add a const parameter to `Entry` (with a default value) to
> discriminate them.

Ah, good point! as you mentioned, we could make it a parameter.

> > +
> > +/// Iterator over C list items.
> > +///
> > +/// Uses the [`FromListHead`] trait to convert list_head pointers to
> > +/// Rust types and iterate over them.
> > +///
> > +/// # Invariants
> 
> Missing empty line.

Ack.

> > +/// - `head` points to a valid, initialized list_head.
> > +/// - `current` points to a valid node in the list.
> > +/// - The list is not modified during iteration.
> > +///
> > +/// # Examples
> > +///
> > +/// ```ignore
> > +/// // Iterate over blocks in a C list_head
> > +/// for block in clist::iter_list_head::<Block>(&list_head) {
> > +///     // Process block
> > +/// }
> > +/// ```
> > +pub struct ClistIter<'a, T: FromListHead> {
> > +    current: *const bindings::list_head,
> > +    head: *const bindings::list_head,
> > +    _phantom: PhantomData<&'a T>,
> > +}
> > +
> > +// SAFETY: Safe to send iterator if T is Send.
> > +unsafe impl<'a, T: FromListHead + Send> Send for ClistIter<'a, T> {}
> > +
> > +impl<'a, T: FromListHead> Iterator for ClistIter<'a, T> {
> > +    type Item = T;
> > +
> > +    fn next(&mut self) -> Option<Self::Item> {
> > +        // SAFETY: Pointers are valid per the type's invariants. The list
> > +        // structure is valid and we traverse according to kernel list semantics.
> > +        unsafe {
> > +            self.current = (*self.current).next;
> > +
> > +            if self.current == self.head {
> > +                return None;
> > +            }
> > +
> > +            // Use the trait to convert list_head to T.
> > +            Some(T::from_list_head(self.current))
> > +        }
> > +    }
> > +}
> > +
> > +/// Create a read-only iterator over a C list_head.
> > +///
> > +/// This is a convenience function for creating iterators directly
> > +/// from a list_head reference.
> > +///
> > +/// # Safety
> > +///
> > +/// Caller must ensure:
> > +/// - `head` is a valid, initialized list_head.
> > +/// - All items in the list are valid instances that can be converted via [`FromListHead`].
> > +/// - The list is not modified during iteration.
> > +///
> > +/// # Examples
> > +///
> > +/// ```ignore
> > +/// // Iterate over items in a C list.
> > +/// for item in clist::iter_list_head::<Item>(&c_list_head) {
> > +///     // Process item
> > +/// }
> > +/// ```
> > +pub fn iter_list_head<'a, T: FromListHead>(head: &'a bindings::list_head) -> ClistIter<'a, T> {
> > +    ClistIter {
> > +        current: head as *const _,
> > +        head: head as *const _,
> > +        _phantom: PhantomData,
> > +    }
> > +}
> 
> Why do we need a function for this? The correct way to iterate should be
> through `CList`, so I'd just move its code to `CList::iter` and make all
> the examples use that.

Sure, I will move this function there. Are you saying we should also merge
`Clist` and `ClistIter` too or just move the function? I think we still want
to keep the 2 types separate as `ClistIter` stores the interation state
(current/head pointers).

> > +
> > +/// Check if a C list is empty.
> > +///
> > +/// # Safety
> > +///
> > +/// Caller must ensure `head` points to a valid, initialized list_head.
> > +#[inline]
> > +pub unsafe fn list_empty(head: *const bindings::list_head) -> bool {
> > +    // SAFETY: Caller ensures head is valid and initialized.
> > +    unsafe { bindings::list_empty(head) }
> > +}
> 
> Why not call `bindings::list_empty` directly from `is_empty`? I don't
> see what having an extra public function brings here.

Ok sure, yeah no reason not to do so :).

> > +
> > +/// Initialize a C list_head to an empty list.
> > +///
> > +/// # Safety
> > +///
> > +/// Caller must ensure `head` points to valid memory for a list_head.
> > +#[inline]
> > +pub unsafe fn init_list_head(head: *mut bindings::list_head) {
> > +    // SAFETY: Caller ensures head points to valid memory for a list_head.
> > +    unsafe { bindings::INIT_LIST_HEAD(head) }
> > +}
> 
> Since this patch adds read-only support, what do we need this function
> for? It also doesn't appear to be used anywhere in this series.

Ah, yes. I directly called the bindings in the DRM patch, instead of using
the wrapper. hmm from a readability PoV, bindings::INIT_LIST_HEAD() is itself
Ok so I'll just get rid of this function as well then.

> > +
> > +/// An interface to C list_head structures.
> > +///
> > +/// This provides an iterator-based interface for traversing C's intrusive
> > +/// linked lists. Items must implement the [`FromListHead`] trait.
> > +///
> > +/// Designed for iterating over lists created and managed by C code (e.g.,
> > +/// drm_buddy block lists). [`Clist`] does not own the `list_head` or the items.
> > +/// It's a non-owning view for iteration.
> > +///
> > +/// # Invariants
> 
> Missing empty line.

Ack.

> > +/// - `head` points to a valid, initialized list_head.
> > +/// - All items in the list are valid instances of `T`.
> > +/// - The list is not modified while iterating.
> > +///
> > +/// # Thread Safety
> 
> Here as well.

Ack.

> > +/// [`Clist`] can have its ownership transferred between threads ([`Send`]) if `T: Send`.
> > +/// But its never [`Sync`] - concurrent Rust threads with `&Clist` could call C FFI unsafely.
> > +/// For concurrent access, wrap in a `Mutex` or other synchronization primitive.
> > +///
> > +/// # Examples
> > +///
> > +/// ```ignore
> > +/// use kernel::clist::Clist;
> > +///
> > +/// // C code provides the populated list_head.
> > +/// let list = unsafe { Clist::<Item>::new(c_list_head) };
> > +///
> > +/// // Iterate over items.
> > +/// for item in list.iter() {
> > +///     // Process item.
> > +/// }
> > +/// ```
> > +pub struct Clist<T: FromListHead> {
> > +    head: *mut bindings::list_head,
> > +    _phantom: PhantomData<T>,
> > +}
> > +
> > +// SAFETY: Safe to send Clist if T is Send (pointer moves, C data stays in place).
> > +unsafe impl<T: FromListHead + Send> Send for Clist<T> {}
> > +
> > +impl<T: FromListHead> Clist<T> {
> > +    /// Wrap an existing C list_head pointer without taking ownership.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// Caller must ensure:
> > +    /// - `head` points to a valid, initialized list_head.
> > +    /// - `head` remains valid for the lifetime of the returned [`Clist`].
> > +    /// - The list is not modified by C code while [`Clist`] exists. Caller must
> > +    ///   implement mutual exclusion algorithms if required, to coordinate with C.
> > +    /// - Caller is responsible for requesting or working with C to free `head` if needed.
> > +    pub unsafe fn new(head: *mut bindings::list_head) -> Self {
> > +        // SAFETY: Caller ensures head is valid and initialized
> > +        Self {
> > +            head,
> > +            _phantom: PhantomData,
> > +        }
> > +    }
> 
> I am wondering whether `CList` serves an actual purpose beyond providing
> ` CListIter` to iterate on... Would it make sense to merge both types
> into a single one that implements `Iterator`?
> 

It would force us to store iteration state into `Clist`, I think for that
reason it would be great to keep them separate IMO.

thanks,

 - Joel

