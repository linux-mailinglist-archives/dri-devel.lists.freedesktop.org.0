Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E32EBC71C8
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 03:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB27010E8E9;
	Thu,  9 Oct 2025 01:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="beY4Xu2v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012006.outbound.protection.outlook.com [40.107.209.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0441610E04A;
 Thu,  9 Oct 2025 01:29:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wv3c2cWkKWJIimg8Z+XU5szLagabd6rEiLYDnc0ixrH/WZti3zNhv5OWodNzg3zNLkE3Qphq4M41MGaIZwbmy//aO791QXqIajWgUpHKodQBw3C2IArkQ3h07WDrxWSz97jFRb8ErooSZZp4fdpiL5ng5BCL+RL+uIZxViurgJIdBsahdwtZJJ8H+PVnyF5Z82V2evbfZScPQmoVQ8947Q9KLctR2YjQ8NC/mNs5D2wx4RArJEGQa3Rq03O+iikxuNluBpGmYqBVbJY0uGZmjYw0tUNmH02cdpcLOayL0QAASXjYsRI8uA2I3tyS/ftC6wOP0gvArIld/1UunWeKLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZfF4/ehcRbxmrga7GWwKak51b2/jsH6tToEEcuGPQ4=;
 b=VVOEIxhCs+BGS5jCJI6+O/3yJPAMmEbgkzShj+8Ex06JV2aWfYIksT5MNkgZ7bHpiwswS0mYxaCztFN3Cm3nzsor6kC7UxhIGcU7iXXheCt3rKiw/VT9YQ0H1QFbZRDMCBpuTBYh9KOGaEcGy+YAXQx0oe7p9W46btFpByVkt2a+ysqtr5IEwXfveR6uBvGJLcb0ky2cGLQRMFtyW8My9ssr0a9XJ0MSpHmrC2C6pJOg2rFe8c0K519jQwwthjs4VlDoCRB0fnb3D99uajRgu7grq0wxuIYjMNP4av+KsFwFRgSpxSPgZXO8gmkvjgalwz0/M22s9vqRJ2QuygkItw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZfF4/ehcRbxmrga7GWwKak51b2/jsH6tToEEcuGPQ4=;
 b=beY4Xu2v24D36U+8rnQ8/sqh5XFiav+86hSPRZOyCtygzR/NFZ99zGR+PydGYLjpxDgrvmAiCyz/gl/k5s1xCP0+slhNP2Iiaj3mtlc6JGS1NgrTvjTplWi5uJAjjljNAWjDxzbWd9u2lIAzN1Uhn+5jxqdq2LU13rskXMQZLidHCL+4EFS4bQv680HNsAkyLnpSs8YhHkYffP7xh9cfz2Jhj2W+SvWJh9z87aQk7070We9s2cJzYfvEnK/sWeTPblkstykJ6y6Ox682YQcdiyUEYADrbRoJmA4Z/Fyu9gqmMxFVcIhOm/rtYlVW69XEP/7ykIOSqRYM5BQHAPQXwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9; Thu, 9 Oct 2025 01:29:29 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 01:29:29 +0000
Date: Thu, 9 Oct 2025 12:29:19 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 acourbot@nvidia.com, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v4 04/13] gpu: nova-core: Add a slice-buffer (sbuffer)
 datastructure
Message-ID: <giebtcmzt46msfmplgfdb2jgfz7ujt5upo35mbngy2hxjt4w3a@daxmfxuucdpm>
References: <20251008001253.437911-1-apopple@nvidia.com>
 <20251008001253.437911-5-apopple@nvidia.com>
 <DDD39JHAI4ED.2BGLWYNIRA987@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDD39JHAI4ED.2BGLWYNIRA987@kernel.org>
X-ClientProxiedBy: SYBPR01CA0073.ausprd01.prod.outlook.com
 (2603:10c6:10:3::13) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d2f3652-58f6-489a-c0c9-08de06d34ab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007|27256017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7oYypjE+ui/mc+Am0gvGdMwavwsSTJqCj0QNABCFcL8iQVfCg2T5U9om5jfB?=
 =?us-ascii?Q?taVgMMGwYKSDYSgL6QyST27cCrGruV3AeoOwWDYK+IkE2O3f2BuU8lBYhx7T?=
 =?us-ascii?Q?ge0RRG3uYT1joTffW+9IcSOxFgsMU3QEJVQR8cTPG8bXJB8atq+7/BhaXlAf?=
 =?us-ascii?Q?9vhqtrwXB/uyMaxRWdShQUGZxy0EQkRosSBENUEiY7qxvGdwXrfmfczsbSCe?=
 =?us-ascii?Q?JikxFXNvVkb1281E7ZNXED7o3lTLBUUL6ckjjOgebWLeaLVuiG5U9TjZkyAC?=
 =?us-ascii?Q?+bqfpMPWQsgc5m5NeUkYKDEoc5Hbknh1LmPWiKNGD+nprKxElzPl/NpeoYQr?=
 =?us-ascii?Q?Mv0pCHVXomk5ASzoJjpFDrZdix7ZSyRxPNZkiUXSadh1WrskeZ2TV/LeWPGm?=
 =?us-ascii?Q?PN9KuqltHIUpYEtgE79mac00knec8PUMH3Em3AqT0LpT0emhxtU2RLuaUWWQ?=
 =?us-ascii?Q?seI8Js/4LTfj9Iadfl8iqmkrkElk8360jEYgB4rjp4R0kEn+iWJ3UDs9tG1m?=
 =?us-ascii?Q?4TeCBAvwI3mF8kIyq/MlpAEGjsDJLIp9hExImMcgiQwX0FCC/88Kg/eipcHk?=
 =?us-ascii?Q?JTTCImzPGy5pbM4DJSEalXzMjSYD07Jq8eyVER5s40GPeUVjEZ7FcYuC4lEs?=
 =?us-ascii?Q?Z9oBIbI1W3Sq30pPBHYExEHge1qLfPbNYtLWuBdnNChLxGFWIdGM9WV6JxgN?=
 =?us-ascii?Q?ZcSaRlHXoYkjllR3Efl0GL9c2Xa37CQ3yJiZzYJKxnpzy8ocMCOX0qDCebgt?=
 =?us-ascii?Q?06ZYhHaT5eBRy62lDp57m/+IpGmQSGdSmM0S4/SOyViecGl0m7sAP/jdbU2F?=
 =?us-ascii?Q?BV2uXAWbUcOKJukTGjOzBtBYhTM7WXbJ6OUpnYtmVxqySLYjmlNk+fkZL7hW?=
 =?us-ascii?Q?L/ztNnzMgz8fdmzbvONHXi0aoe9cldzGQBgA8QfFKbAhzCPnZPXbWK6NvWcp?=
 =?us-ascii?Q?BFD16ydGZ4d5EZmGhlxfS1fTvmm7ZOzpZqS7Su7qq39h0XAMkoKiSsYR3Q1V?=
 =?us-ascii?Q?t16a8OzibL25vQ0T/Ymg9gDSEk62rk/EbQsMEeFfBWuDAPZ7G/3pF9M/UOFZ?=
 =?us-ascii?Q?ch2+EmaugMbIbiaOkzvaLtRI0y6yO08rhPcjCDdvmE1+Wawcq5m+ukVdoq8q?=
 =?us-ascii?Q?A5ZfjHKxUJqnO9nkytmCM2mzT2Kpq2GAdMvNcUZu1CBfOaHfQmU8C+jX37cF?=
 =?us-ascii?Q?g+AxPj8SqNFc2BYBbxaMEQv6F0fBFCFFq3RmUjoAEbPIx710xPEdGGOnT/rK?=
 =?us-ascii?Q?SZQsy1TqxCFlqWALm2fmBEKuzdwyk6lYaDxfGVZOsa6MWUTPmVHeLTddZhMd?=
 =?us-ascii?Q?H9K5Zna9M6OdtwYfMYwjOqyrud6auRbs3q+bKupTbPKQParzU7l2lPA1Ab5Z?=
 =?us-ascii?Q?AkWD+OevcdrJ70MY0kN3DeWXTgW8Jah33StxQD5q8w6TUUy8O9+0Lo0yHoT7?=
 =?us-ascii?Q?dy07qodq7X6+qXR0wHT2wV4FNO+ZtpaU93JKAX8xysUAw+7kWcuuus55YPAW?=
 =?us-ascii?Q?HKUak6W1Wn4cjKvEc0RuNvV0G5kTxyaCCCf/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007)(27256017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wUGvjhjFw8FoV0wl+HtKJCJbEdVTk2LL+1nvkWtrvhA/xHzGMECMyNZlYo/M?=
 =?us-ascii?Q?wDebCNnxUMjzYrq2kwfMatuzM4g/5CsOkTQdgk7NVWyAK2AdDbHuPyUJJwYk?=
 =?us-ascii?Q?XPUgyNDMEu2hqMEu7sHY/x3PYgURhuvqagR7hwJnOi+WJeK2iOGhaGru5as5?=
 =?us-ascii?Q?IgBI4fsOcjuUHeep/4ITy9gUDPPz3ml6ONieTRWhSyp3/vHsUIa2kMbl7/xB?=
 =?us-ascii?Q?+XMsQ6DKeNKrawN+XiN2fea9O8m1RPm1Hf2Tr1m0H33cvVx/V3tr1y6W2gDP?=
 =?us-ascii?Q?M33Fhtswqq3k29OLM5tJncmMRolzTvkzhBpM+OAYYYFZOwFThM3FLxoCwBja?=
 =?us-ascii?Q?KqllapxnJBoky+agfNjE4kS1t0quIL+i5PuAlZmGNzdZDfuTROoTnqKOSkp+?=
 =?us-ascii?Q?kr2flZBKLd683Rd4vObY+UX8XYpscw6fQreM5YUAOoob5zOflrXab0XL4i6l?=
 =?us-ascii?Q?3SL3r7Rz0RKY7EOVOVLpCh3W+7PY+Dch9bDEQ8oa2r9XyreCh6Bu8pdi1ROA?=
 =?us-ascii?Q?8hMBQyR4lUKsFeR9rW5vlczaYnnk4t7U+2NBc+5ppZmcYl1wQDNTkrszKUIU?=
 =?us-ascii?Q?MXngbd47oXQ/0iu4JOfR4wZeF1IHKF32FYZ6QU2CDQjll4uq+tE/FWHV/VUa?=
 =?us-ascii?Q?876OSVjUT2end0b4cGUJO93DxJSUSu4EPLEmcjeJ7BSKiU6Akj1PSwiT+pvq?=
 =?us-ascii?Q?euxX91PhSRO7WFnDaqKAu4Kb/1AOH6ZnqkywjdZ21d4zAjbPd6TxHQw04QZQ?=
 =?us-ascii?Q?Ns2nM17jf+3g5G/NUswynkfTLfFb0FZVp4QPu4iPwaoav2em1j3VAf7Qri40?=
 =?us-ascii?Q?5vmY1UBN3jMeCowJLjp/m1zKxo6iudlZ0wVNzCgQTSs/BhrMWp6CuFlSXwpB?=
 =?us-ascii?Q?Cikig4jlBMrTUKV5MkUDEvOUqcdpEbx5/c42RomMupCdHNfRiLomuLbDVkNg?=
 =?us-ascii?Q?7wSSHsjUqFt95tATSOALxyLVAmc8beyUQ0JyVmL9CzMmhUthiQOE0o9t2HHH?=
 =?us-ascii?Q?PhzZNmU3kU+FdEe+Tn4VlXGV1ZpY6z/GYibccF5zt61x/D+UHcuidol2KN8C?=
 =?us-ascii?Q?MuG9ww7PpqUIymch/USsF4Bu1qOZ9vZBN+pp7+MRI3yrCUynmCgNpm0Y6dqp?=
 =?us-ascii?Q?mb032L+THGJUNtqDyFVLJKgjwz10KO5EIrfuUem1QqqaP4o7ARvkPpiUSbB9?=
 =?us-ascii?Q?AftYSiDJcTFlOuZvSQIBpiGCS8C+Q+bBGWTduBHnwFeSqajp8GCatNJRbxUz?=
 =?us-ascii?Q?50VIRLWiVGy8MiTKSzyuz66jsLkZZ8MszxxfRGvNS2Z6J8lTUzXwERZGduF5?=
 =?us-ascii?Q?MlP3Zp7uQVpSo8vkfTdYpNKRulDuVii0QQyo38TjCa32JpmIumRqI41JQGCg?=
 =?us-ascii?Q?eEg+JmioXp9o+TttgS7e2gb7j7DUDnumQy67Vl6da53kUTH5he3Hpok5oiAr?=
 =?us-ascii?Q?JqOAJkqNkHUZK4VobWGcmHF5Fs+QTi8tLtiWEtetXswzPDnsoZAoOEnfpDIC?=
 =?us-ascii?Q?8uoeKnOKNX5AUJmy2y+G1Gzrk1Ir28wHRYm0hVzUvV2XLXKNhuYlknQ+LyUa?=
 =?us-ascii?Q?zbnAuoi0lyUzm6XWs7CuKrPEO3B5/xU7QFYwG4a7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2f3652-58f6-489a-c0c9-08de06d34ab6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 01:29:29.6785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o2GbJyZGNSJcodR7AFQvRXIqFC/TkL4zPCs6vwJNeWMIMaqgs5Kp6MDr6Wgvt0CkviVjMGN6Pg9bN52iZi+6lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863
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

On 2025-10-09 at 03:41 +1100, Danilo Krummrich <dakr@kernel.org> wrote...
> On Wed Oct 8, 2025 at 2:12 AM CEST, Alistair Popple wrote:
> > diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbuffer.rs
> > new file mode 100644
> > index 000000000000..e82f9d97ad21
> > --- /dev/null
> > +++ b/drivers/gpu/nova-core/sbuffer.rs
> > @@ -0,0 +1,191 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +use core::ops::Deref;
> > +
> > +use kernel::alloc::KVec;
> > +use kernel::error::code::*;
> > +use kernel::prelude::*;
> > +
> > +/// A buffer abstraction for discontiguous byte slices.
> > +///
> > +/// This allows you to treat multiple non-contiguous `&mut [u8]` slices
> > +/// as a single stream-like read/write buffer.
> > +///
> > +/// Example:
> > +///
> > +/// let mut buf1 = [0u8; 3];
> > +/// let mut buf2 = [0u8; 5];
> > +/// let mut sbuffer = SWriteBuffer::new([&buf1, &buf2]);
> > +///
> > +/// let data = b"hellowo";
> 
> Not that it matters, but "hellowo"? :)

Ugh. I fixed that in the commit message but not here!

> > +/// let result = sbuffer.write_all(0, data);
> > +///
> > +/// A sliding window of slices to proceed.
> > +///
> > +/// Both read and write buffers are implemented in terms of operating on slices of a requested
> > +/// size. This base class implements logic that can be shared between the two to support that.
> > +///
> > +/// `S` is a slice type, `I` is an iterator yielding `S`.
> > +pub(crate) struct SBuffer<I: Iterator> {
> > +    /// `Some` if we are not at the end of the data yet.
> > +    cur_slice: Option<I::Item>,
> > +    /// All the slices remaining after `cur_slice`.
> > +    slices: I,
> > +}
> 
> Does it make sense to split SBuffer into itself and a separate SBufferIter that
> keeps a reference to the SBuffer? If not, I'd rename it to SBufferIter to make
> it obvious to the user that it is an iterator type.

We had that originally before this was sent to the list for review but there
wasn't a use for it so will rename it. If memory serves me Alex removed the
separate SBuffer so maybe he can comment further why we removed it.

> > +impl<'a, I> SBuffer<I>
> > +where
> > +    I: Iterator,
> > +{
> > +    #[expect(unused)]
> > +    pub(crate) fn new_reader(slices: impl IntoIterator<IntoIter = I>) -> Self
> > +    where
> > +        I: Iterator<Item = &'a [u8]>,
> > +    {
> > +        Self::new(slices)
> > +    }
> > +
> > +    #[expect(unused)]
> > +    pub(crate) fn new_writer(slices: impl IntoIterator<IntoIter = I>) -> Self
> > +    where
> > +        I: Iterator<Item = &'a mut [u8]>,
> > +    {
> > +        Self::new(slices)
> > +    }
> 
> Please add some documentation for the constructors.

Ok.

> > +    fn new(slices: impl IntoIterator<IntoIter = I>) -> Self
> > +    where
> > +        I::Item: Deref<Target = [u8]>,
> > +    {
> > +        let mut slices = slices.into_iter();
> > +
> > +        Self {
> > +            // Skip empty slices to avoid trouble down the road.
> > +            cur_slice: slices.find(|s| !s.deref().is_empty()),
> > +            slices,
> > +        }
> > +    }
> > +
> > +    fn get_slice_internal(
> > +        &mut self,
> > +        len: usize,
> > +        mut f: impl FnMut(I::Item, usize) -> (I::Item, I::Item),
> > +    ) -> Option<I::Item>
> > +    where
> > +        I::Item: Deref<Target = [u8]>,
> > +    {
> > +        match self.cur_slice.take() {
> > +            None => None,
> > +            Some(cur_slice) => {
> > +                if len >= cur_slice.len() {
> > +                    // Caller requested more data than is in the current slice, return it entirely
> > +                    // and prepare the following slice for being used. Skip empty slices to avoid
> > +                    // trouble.
> > +                    self.cur_slice = self.slices.find(|s| !s.is_empty());
> > +
> > +                    Some(cur_slice)
> > +                } else {
> > +                    // The current slice can satisfy the request, split it and return a slice of
> > +                    // the requested size.
> > +                    let (ret, next) = f(cur_slice, len);
> > +                    self.cur_slice = Some(next);
> > +
> > +                    Some(ret)
> > +                }
> > +            }
> > +        }
> > +    }
> > +}
> > +
> > +/// Provides a way to get non-mutable slices of data to read from.
> > +impl<'a, I> SBuffer<I>
> > +where
> > +    I: Iterator<Item = &'a [u8]>,
> > +{
> > +    /// Returns a slice of at most `len` bytes, or `None` if we are at the end of the data.
> > +    ///
> > +    /// If a slice shorter than `len` bytes has been returned, the caller can call this method
> > +    /// again until it returns `None` to try and obtain the remainder of the data.
> > +    fn get_slice(&mut self, len: usize) -> Option<&'a [u8]> {
> > +        self.get_slice_internal(len, |s, pos| s.split_at(pos))
> > +    }
> > +
> > +    /// Ideally we would implement `Read`, but it is not available in `core`.
> > +    /// So mimic `std::io::Read::read_exact`.
> > +    #[expect(unused)]
> > +    pub(crate) fn read_exact(&mut self, mut dst: &mut [u8]) -> Result {
> > +        while !dst.is_empty() {
> > +            match self.get_slice(dst.len()) {
> > +                None => return Err(ETOOSMALL),
> 
> ETOOSMALL is an NFS error code (it should also never be exposed to userspace). I
> suggest to implement a custom error type instead and make it resolve to ENOSPC
> or probably just EINVAL instead.

Will do.

> > +                Some(src) => {
> > +                    let dst_slice;
> > +                    (dst_slice, dst) = dst.split_at_mut(src.len());
> > +                    dst_slice.copy_from_slice(src);
> > +                }
> > +            }
> > +        }
> > +
> > +        Ok(())
> > +    }
> > +
> > +    /// Read all the remaining data into a `KVec`.
> > +    ///
> > +    /// `self` will be empty after this operation.
> > +    #[expect(unused)]
> > +    pub(crate) fn read_into_kvec(&mut self, flags: kernel::alloc::Flags) -> Result<KVec<u8>> {
> > +        let mut buf = KVec::<u8>::new();
> > +
> > +        if let Some(slice) = core::mem::take(&mut self.cur_slice) {
> > +            buf.extend_from_slice(slice, flags)?;
> > +        }
> > +        for slice in &mut self.slices {
> > +            buf.extend_from_slice(slice, flags)?;
> > +        }
> > +
> > +        Ok(buf)
> > +    }
> > +}
> > +
> > +/// Provides a way to get mutable slices of data to write into.
> > +impl<'a, I> SBuffer<I>
> > +where
> > +    I: Iterator<Item = &'a mut [u8]>,
> > +{
> > +    /// Returns a mutable slice of at most `len` bytes, or `None` if we are at the end of the data.
> > +    ///
> > +    /// If a slice shorter than `len` bytes has been returned, the caller can call this method
> > +    /// again until it returns `None` to try and obtain the remainder of the data.
> > +    fn get_slice_mut(&mut self, len: usize) -> Option<&'a mut [u8]> {
> > +        self.get_slice_internal(len, |s, pos| s.split_at_mut(pos))
> > +    }
> > +
> > +    /// Ideally we would implement `Write`, but it is not available in `core`.
> > +    /// So mimic `std::io::Write::write_all`.
> > +    #[expect(unused)]
> > +    pub(crate) fn write_all(&mut self, mut src: &[u8]) -> Result {
> > +        while !src.is_empty() {
> > +            match self.get_slice_mut(src.len()) {
> > +                None => return Err(ETOOSMALL),
> > +                Some(dst) => {
> > +                    let src_slice;
> > +                    (src_slice, src) = src.split_at(dst.len());
> > +                    dst.copy_from_slice(src_slice);
> > +                }
> > +            }
> > +        }
> > +
> > +        Ok(())
> > +    }
> > +}
> > +
> > +impl<'a, I> Iterator for SBuffer<I>
> > +where
> > +    I: Iterator<Item = &'a [u8]>,
> > +{
> > +    type Item = u8;
> > +
> > +    fn next(&mut self) -> Option<Self::Item> {
> > +        // Returned slices are guaranteed to not be empty so we can safely index the first entry.
> > +        self.get_slice(1).map(|s| s[0])
> > +    }
> > +}
> > -- 
> > 2.50.1
> 
