Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2935BC717F
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 03:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722B210E8F7;
	Thu,  9 Oct 2025 01:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Bh5aPmHu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012007.outbound.protection.outlook.com [40.107.209.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C6C10E04A;
 Thu,  9 Oct 2025 01:15:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RogY9nGp9zxNi86ZoW1G8Xt2C7HdRfYOos8MLUzgNILRDbbPJrckhovKrD3NithiBA/5xAUkqphzRSKbCV6Dj1UVAwdwb+kJ05QKgo0bSp5tz5VrMIfG/2DpJCwSoghw+LlmhgRZInWds7vDJSW6k6s97O4POSKOfinAwAwAR+XpkrktYZcqhhdjZr74XajUFifCISvgUC4GVi0TD+uv8Vy8f/TjAdfEMLb4jzZAmvSbK99ojhWIYXn6D1g+sIwbbqywbYV+5lrvpzB3zheqbUt6f1jrICAJBJp7xdd7BiNP7xSmwmfz/6aLayJC5UoWGp20+UTnFpgLEsNxBjInJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g892Y3v+lIqHVS3UqKVP6Gw8egb+fvk/ElwraJJncFg=;
 b=sNRdEO9SgJP8wA3dc05D5B5HL01fA8kGb93EgDNRDHl6iZriC5jdzClwZzZ06+WHFyV41i1jxjdEkDltOs7zs43eaeXXY4EienTLaZLTQLRnLoGQjlf3c8UiO+it3gTsGQttdINDwALyCHVGw5lJfjbT4bjRwKhA/0V5ovAmd6GuFT4qDJSryKLGAgJzrQhDuiJqibIrDGNUo8pjubEo8yWXbsJkb/A9poYf2ti11vwKiNHNlC3eu7nxcAH1e+d0FPyxxqcNB/Wpvpa0Rav9XEzo7Fkn/kSEDqD7YQycufgPBRXst3CzIMfuFqswHAmPxb2lhWwmkhmBPtvSybb7YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g892Y3v+lIqHVS3UqKVP6Gw8egb+fvk/ElwraJJncFg=;
 b=Bh5aPmHuFvK/dKv0JrgTXf7tNe9czZ5JNvRcnRaUhIAzkdqa3wNoOH25SkvxNaieD1ThIfPSXlUy3BGjrpFdX75LbqPapRgfY7YLPKj8qXIDMPeb6K+xBXr3MULT/TVRT1QODXtJVWnPVd8wc3aUWCsqqvV/EDZ0NBcNc2tZmzG5JviPGXnkwe7CUOwrbsk16rFeFjZ0M1EnSEIgPOulqiB4C15afnO+Gw5DOv1dlwfNducXJawPkWOtHph0MxwIgOKjimJw+6GuRxAnZC4d4kxgrnGu+NBj3fXQmPnrB/o02UxkPkvGpDGr9T5Zonhtlru04uhB+Z5kdZFylRQYPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SJ0PR12MB6902.namprd12.prod.outlook.com (2603:10b6:a03:484::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.20; Thu, 9 Oct 2025 01:15:01 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 01:15:01 +0000
Date: Thu, 9 Oct 2025 12:14:55 +1100
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
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v4 02/13] gpu: nova-core: Create initial Gsp
Message-ID: <oi5mksfhvuumriuqtld4hhd46gcghawtemaxnv4qs7cx76ecio@6rp3taivotiw>
References: <20251008001253.437911-1-apopple@nvidia.com>
 <20251008001253.437911-3-apopple@nvidia.com>
 <DDD2F1NSSTVN.1VDRSX5O9ZIKM@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDD2F1NSSTVN.1VDRSX5O9ZIKM@kernel.org>
X-ClientProxiedBy: SY5P282CA0150.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:205::17) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SJ0PR12MB6902:EE_
X-MS-Office365-Filtering-Correlation-Id: 90701be0-4c3f-4f75-5485-08de06d14544
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pgABugFXxfgAN2JRDmhfjfStMWXTsj8skv1t413PPIgMYxkrja7JoJx1SHBn?=
 =?us-ascii?Q?4kbtGKhVmKyp2UXi84j10KQnzgEiMGAPycV4P2x9euovt3tr/lGjo9U3+qMl?=
 =?us-ascii?Q?uNXXTMqsXKwtvfMcrx3WFQtsalNoKdivSUYRmaNwCg4JQD/WMF3tTIqQ31Ku?=
 =?us-ascii?Q?YGI61BBvmFH2CyaqkuqOqoJKF4tcXHZOISI7tCaMJD+nKynjTvCYZ1FmRiNb?=
 =?us-ascii?Q?PyGEmFGRk7kAEJCNvi4kq/eag/QEPFNyrEi5lcis5AXFkU5ODa6OV41DPtjO?=
 =?us-ascii?Q?zKyEpoyILwGfdVRNfGQwoEMWUN9H6jT4ZtVZL8V7iC6DvXoJ+M7eA2D80r7E?=
 =?us-ascii?Q?76vw3Q2cvApCddqQ909UujdmGqybze4JDiht6sJNbhsh2ESn9XWjNO1GeAZO?=
 =?us-ascii?Q?B+q3xUPzm/+Lby8NNc/6C8q+v9AvrlsKHRjQpqmNGQsa79pGI5ew+qPxda6K?=
 =?us-ascii?Q?MHDXNw+INUG+hlx5sa4En5iRva9zwkUfFWv1GevZfbxrddAR1Mt4PGrU5BxX?=
 =?us-ascii?Q?P5zdbY+PkZhLJUiQCzEyxLzulnZDvU5TXeKbfJPr9nngAg+M+uNUERZNnrsD?=
 =?us-ascii?Q?xvBINhPNDRFMIqxoN9vFPFHl3LPdT8xVTy+aaFF8Oll2+8b/GwvXR5TWCd1+?=
 =?us-ascii?Q?++ZhBp4Cm5oIerA9aUfXV6YAUNk0WVA6VJcwMtkiERZS7e14LIcrFsNhLQMl?=
 =?us-ascii?Q?3U9/vqjLyvaPpx8s59VXZ+sLFeeNfr8Z/HFh3wgyib2vHdrv+WZmscLOVUBO?=
 =?us-ascii?Q?8dpey7b8RxIaRKqV0dMmX38wNHwcBsINAkqGXN88EOujmeYwnPuyi9QJ4oNP?=
 =?us-ascii?Q?CpcpF/ztzvf3qfbagH9I6u8F1hpXoB+SDv0FruMKB7DqhFhsUxYsaApb/Qo0?=
 =?us-ascii?Q?MwLyOxFBvZ8eIZTxnbKVLu6YFjKJHeNrYhykljMM3fRvFtXedbchvS3odl9M?=
 =?us-ascii?Q?XJDkcsQQlU3tS8UvUQiPQra66Yzk9E6VBxdZYp+f+Vk+j3TQp9yZKiDwqEg5?=
 =?us-ascii?Q?prxAdAbD9oB6ba5p1ua+rVg+WZC0H3056WUF9Ez37C0M7Ig5tZL07z+Gu4DF?=
 =?us-ascii?Q?0WpvhvXV4zy4Oxt9PHjDNwVKaC09zplOSE0RVP2vcV0SgiiefvcCDDCcQSK0?=
 =?us-ascii?Q?zvU4Vh9E5Mn/wskNeOqXRvjQ40zYgTDw6+Bw3AWI7qbmvy1QaLL8sGwSCoG3?=
 =?us-ascii?Q?V3sAG0XCGPMKfSAUCcln6+P8ZXU6YiAyEvDRA7ZmcMtHJJlkYIvBB456xnwx?=
 =?us-ascii?Q?wxdGJZE9Fo8NyRiOeAPcY+y//2LKWGHcuAsFpKrA3NfdnjHw95JP9OiEHhnQ?=
 =?us-ascii?Q?KzMLWWuWOpeMJvCX5TNxUKqwqelgxlj/ENkZxjgyNfnGdARJteufeHUJlOUO?=
 =?us-ascii?Q?tn1nxlDbG/pgF0aUlqPHzxXjH/OtU5nljqwoYHW7YtEKMox7Rzd1RcQtSOu1?=
 =?us-ascii?Q?41IV/81pbNGmlLXrY+mT4jJKPvSF8FSn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6QnBLte6RamhORJ5gMNxPyCF3b49qCvbZt/AsgrHiXH2eXt6VE6DpR6K3mq5?=
 =?us-ascii?Q?ywLA5VpIobbdxp3v5v2HT2kGNz/Ox/0+/kO6A5vk9PWbGyJVQN8UpnCBd+T5?=
 =?us-ascii?Q?16nyP7N5bvsq8d1HpbEX2UOefXm7dalfoMyG9JdACGafOhoXFomB0Wiq7jgo?=
 =?us-ascii?Q?YtgfhpHMeMpqNJA3JCFbkD2HgM2ktxwjAvUghE0g5cT4kiMaEbYxkmcgppMI?=
 =?us-ascii?Q?EGj6UWj3h5Tm8d85hF7Jp0ZWhLMzvcRXPBp9iwy890JOYCUGBapkg/cvz3fC?=
 =?us-ascii?Q?Upi53u1rBOYLcN6tXYJCS19MbYGB1WCWqGujOz0Waf6OleTHj18H/P3e5d/p?=
 =?us-ascii?Q?IBIGCIVPyWSFGY8cf7fT7dNFaXZShcy/QZhxldgYKMcNLayd5+YdvRrd5HRS?=
 =?us-ascii?Q?JN5CsLuwHl/+NtMeEHcMse8QLmtLxYd/FTDZDv3JIFWkFfCuo3AsKY6W0cuU?=
 =?us-ascii?Q?GIwhAbuneKAHxrpQv67TBmzMCPh22fm83QgreBn9JwB9HJ8zRi6o7Ic1T9F2?=
 =?us-ascii?Q?NpZ9xMmtaWBd0VzS1tu/y9xXQ+cpMZL9w6XjbEypBxz7ml5uztWpBTPCQD3U?=
 =?us-ascii?Q?c4K6t3SiRjGHFzfPEwwYta+H/cDChYLBW/HJs1vCk+pWFsF5P6AW/k5/lCBN?=
 =?us-ascii?Q?rcAZNN98YW4Ny+XycgmgzvdHz++I02wejMcTeAn2ai+WMVyWS+cmGVQ5rDN2?=
 =?us-ascii?Q?a/HUM5eM2ttZVCGH1M8j5riLP0hTcBSfYsizelGJqaNoQS+r52RKE0+lrJy7?=
 =?us-ascii?Q?Ytk6SPoY179DL8iGbFZNMgIWHRkyOAF1qZ5J/EI3qX8LAYX1ZqYzxZmPIpCv?=
 =?us-ascii?Q?EuAqfKRBhIpwXjshv2Sx+HJgcwK5TI03O44tqhd1Itt/qETPK1lKJTyn0b4A?=
 =?us-ascii?Q?N0Nt2WdQp0DTEsBDAwdOM5l9WJVp9m8kZV/5eWRV0KPGTRzN/J/mRXki+cGU?=
 =?us-ascii?Q?agpdTqFd7lRh7Q/rEiHkNwKCmaDis4E+oLVHSkwWdu0g/e6gMx9ukWPVtul8?=
 =?us-ascii?Q?zmM11+j/+6AFd/LhzCoCYx2/ONYohE0bhZ/k+H6gDjjrfT2E4LMyumlymNH8?=
 =?us-ascii?Q?PLihg20bkkrWiqggTUNINAglPLgPiiQPf6UR9VJhl0ql8rsXddl3kYvMQcof?=
 =?us-ascii?Q?u4gRSzi0dBEBMr4AQ4+x9NZ/OtgKFzVtpKlG0q1PMVI36NiAFK2qgOOHk6B8?=
 =?us-ascii?Q?WjkeX1bsW5Rhxm0XEzioOtEGo8B4Cfv+8bgmHQcViVlYknY14Hhqa74bIbFC?=
 =?us-ascii?Q?Y1+gzPu2YeLRUhEkv4wbQjJBvHzz0QUr66YfKTzdeyzuJMiTdqgm+2ivfgAK?=
 =?us-ascii?Q?D+VwQB9h3NDtSAkryqxIi5lpqa/2O6ixQ3pQZI/Xo9NOPt40uaabh8u5XJI2?=
 =?us-ascii?Q?m+riCUjBhbOtInmVBUew4caUwZvji0EsV7yT5fXtATMz5GPikNM7W1TJUG3v?=
 =?us-ascii?Q?dXFWG3sIigICNpEc7lH4ZAkwz0LlQwjCq90yML7Np7d0PoYY0TGlsvAw3S/L?=
 =?us-ascii?Q?LW6I92QIHQNwKbfY92oQBa7j+Hbr465zm9MhehratO9KJgZNNQFgM1d5zhAt?=
 =?us-ascii?Q?dAnvBXo+KZRc6NI7zEgXpP51npvNkaYT8sjVMJc/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90701be0-4c3f-4f75-5485-08de06d14544
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 01:15:01.5930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +JXdi6h+AYPMdWkpps8VHVtQwScrWECjn8oBHg3NZniwaA08/r7HrYLitnq/j7SnuCMLFopYLLwahQMStRPV3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6902
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

On 2025-10-09 at 03:01 +1100, Danilo Krummrich <dakr@kernel.org> wrote...
> On Wed Oct 8, 2025 at 2:12 AM CEST, Alistair Popple wrote:
> > diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> > index 221281da1a45..63099df77348 100644
> > --- a/drivers/gpu/nova-core/gsp.rs
> > +++ b/drivers/gpu/nova-core/gsp.rs
> > @@ -2,25 +2,94 @@
> >  
> >  mod boot;
> >  
> > +use kernel::device;
> > +use kernel::dma::CoherentAllocation;
> > +use kernel::dma::DmaAddress;
> > +use kernel::dma_write;
> > +use kernel::pci;
> >  use kernel::prelude::*;
> >  use kernel::ptr::Alignment;
> > +use kernel::transmute::AsBytes;
> >  
> >  pub(crate) use fw::{GspFwWprMeta, LibosParams};
> >  
> >  mod fw;
> >  
> > +use fw::LibosMemoryRegionInitArgument;
> > +
> >  pub(crate) const GSP_PAGE_SHIFT: usize = 12;
> >  pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
> >  pub(crate) const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
> 
> This looks like it could depend on the firmware version in the future, hence it
> should probably defined somewhere in fw/ with a corresponding comment. The
> actual version switch is fine to omit for now of course (we agreed to add the
> infrastructure for the version switch subsequently).

Ok.
 
> > +/// Number of GSP pages to use in a RM log buffer.
> > +const RM_LOG_BUFFER_NUM_PAGES: usize = 0x10;
> 
> Why 0x10? Is there a specific reason?

No real reason other than 64K seems appropriate. It also happens to match what
Nouveau does.
 
> > +
> >  /// GSP runtime data.
> > -///
> > -/// This is an empty pinned placeholder for now.
> >  #[pin_data]
> > -pub(crate) struct Gsp {}
> > +pub(crate) struct Gsp {
> > +    libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
> > +    pub loginit: CoherentAllocation<u8>,
> > +    pub logintr: CoherentAllocation<u8>,
> > +    pub logrm: CoherentAllocation<u8>,
> 
> This creates warnings for older compiler version, please use pub(crate) instead.

Ok. In fact I'm not even sure these need to public (for this series at least).

> > +}
> > +
> > +#[repr(C)]
> > +struct PteArray<const NUM_ENTRIES: usize>([u64; NUM_ENTRIES]);
> > +/// SAFETY: arrays of `u64` implement `AsBytes` and we are but a wrapper around it.
> > +unsafe impl<const NUM_ENTRIES: usize> AsBytes for PteArray<NUM_ENTRIES> {}
> 
> Please separate struct definitions and impl blocks with an empty line.

Done.

> > +impl<const NUM_PAGES: usize> PteArray<NUM_PAGES> {
> > +    fn new(handle: DmaAddress) -> Self {
> 
> No check that NUM_PAGES actually fits the size of the DMA buffer handle passed
> in? What happens if they do not match?

If it's bigger there's no issue, we just initialise a few more PTEs than
necessary that don't get copied. If it's smaller there will be uninitialised
PTEs. For v5 I've added another const to keep these the same.

> > +        let mut ptes = [0u64; NUM_PAGES];
> > +        for (i, pte) in ptes.iter_mut().enumerate() {
> > +            *pte = handle + ((i as u64) << GSP_PAGE_SHIFT);
> 
> I think this should be handle.checked_add(). Additionally we should add the
> following compile time check to make sure that the shift can never overflow:

Sure.

> 	const _MAX_OFFSET: usize = NUM_PAGES << GSP_PAGE_SHIFT;

Hmm. My Rust wasn't good enough to make this work:

impl<const NUM_PAGES: usize> PteArray<NUM_PAGES> {
    fn new(handle: DmaAddress) -> Result<Self> {
        // Compile time check to ensure the shift below never overflows.
        const _MAX_OFFSET: usize = NUM_PAGES << GSP_PAGE_SHIFT;

Results in:

error[E0401]: can't use generic parameters from outer item

Maybe I'm missing something (the documentation for E0401 didn't really enlighten
me I'm afraid).

> > +        }
> > +
> > +        Self(ptes)
> > +    }
> > +}
> > +
> > +/// Creates a new `CoherentAllocation<A>` with `name` of `size` elements, and
> > +/// register it into the `libos` object at argument position `libos_arg_nr`.
> > +fn create_logbuffer_dma_object(
> > +    dev: &device::Device<device::Bound>,
> > +) -> Result<CoherentAllocation<u8>> {
> > +    let mut obj = CoherentAllocation::<u8>::alloc_coherent(
> > +        dev,
> > +        RM_LOG_BUFFER_NUM_PAGES * GSP_PAGE_SIZE,
> > +        GFP_KERNEL | __GFP_ZERO,
> > +    )?;
> > +    let ptes = PteArray::<RM_LOG_BUFFER_NUM_PAGES>::new(obj.dma_handle());
> > +
> > +    // SAFETY: `obj` has just been created and we are its sole user.
> > +    unsafe {
> > +        // Copy the self-mapping PTE at the expected location.
> > +        obj.as_slice_mut(size_of::<u64>(), size_of_val(&ptes))?
> > +            .copy_from_slice(ptes.as_bytes())
> > +    };
> > +
> > +    Ok(obj)
> > +}
> 
> I think we should just create a new gsp::Logbuffer type for this rather than
> have a function as object constructor.

Have done for v5.

> >  
> >  impl Gsp {
> > -    pub(crate) fn new() -> impl PinInit<Self> {
> > -        pin_init!(Self {})
> > +    pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self, Error>> {
> > +        let dev = pdev.as_ref();
> > +        let libos = CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
> > +            dev,
> > +            GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
> > +            GFP_KERNEL | __GFP_ZERO,
> > +        )?;
> > +        let loginit = create_logbuffer_dma_object(dev)?;
> > +        dma_write!(libos[0] = LibosMemoryRegionInitArgument::new("LOGINIT", &loginit))?;
> > +        let logintr = create_logbuffer_dma_object(dev)?;
> > +        dma_write!(libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr))?;
> > +        let logrm = create_logbuffer_dma_object(dev)?;
> > +        dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm))?;
> > +
> > +        Ok(try_pin_init!(Self {
> > +            libos,
> > +            loginit,
> > +            logintr,
> > +            logrm,
> > +        }))
> >      }
> >  }
> > diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
> > index 181baa401770..dd1e7fc85d85 100644
> > --- a/drivers/gpu/nova-core/gsp/fw.rs
> > +++ b/drivers/gpu/nova-core/gsp/fw.rs
> > @@ -7,8 +7,10 @@
> >  
> >  use core::ops::Range;
> >  
> > +use kernel::dma::CoherentAllocation;
> >  use kernel::ptr::Alignable;
> >  use kernel::sizes::SZ_1M;
> > +use kernel::transmute::{AsBytes, FromBytes};
> >  
> >  use crate::gpu::Chipset;
> >  use crate::gsp;
> > @@ -99,3 +101,40 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
> >  /// addresses of the GSP bootloader and firmware.
> >  #[repr(transparent)]
> >  pub(crate) struct GspFwWprMeta(bindings::GspFwWprMeta);
> > +
> > +#[repr(transparent)]
> > +pub(crate) struct LibosMemoryRegionInitArgument(bindings::LibosMemoryRegionInitArgument);
> 
> Please add some documentation for the type.

Ok, I have shamelessly stolen some from Nouveau for v5.

> > +
> > +// SAFETY: Padding is explicit and will not contain uninitialized data.
> > +unsafe impl AsBytes for LibosMemoryRegionInitArgument {}
> > +
> > +// SAFETY: This struct only contains integer types for which all bit patterns
> > +// are valid.
> > +unsafe impl FromBytes for LibosMemoryRegionInitArgument {}
> > +
> > +impl LibosMemoryRegionInitArgument {
> > +    pub(crate) fn new<A: AsBytes + FromBytes>(
> > +        name: &'static str,
> > +        obj: &CoherentAllocation<A>,
> > +    ) -> Self {
> > +        /// Generates the `ID8` identifier required for some GSP objects.
> > +        fn id8(name: &str) -> u64 {
> > +            let mut bytes = [0u8; core::mem::size_of::<u64>()];
> > +
> > +            for (c, b) in name.bytes().rev().zip(&mut bytes) {
> > +                *b = c;
> > +            }
> > +
> > +            u64::from_ne_bytes(bytes)
> > +        }
> > +
> > +        Self(bindings::LibosMemoryRegionInitArgument {
> > +            id8: id8(name),
> > +            pa: obj.dma_handle(),
> > +            size: obj.size() as u64,
> > +            kind: bindings::LibosMemoryRegionKind_LIBOS_MEMORY_REGION_CONTIGUOUS as u8,
> > +            loc: bindings::LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC_SYSMEM as u8,
> 
> Please prefer into() if possible.

In this case it won't work because obviously From<u32> isn't implemented
for u8. It's kind of redundant, because hopefully our bindings are sane, but
I've changed this to try_into() and made LibosMemoryRegionInitArgument::new()
failable for v5.
