Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50776BAACED
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 02:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F0810E261;
	Tue, 30 Sep 2025 00:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="n6O9pFIU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012016.outbound.protection.outlook.com [52.101.53.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DA010E038;
 Tue, 30 Sep 2025 00:37:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMEUX9X8n5grXpbKQF26Xha1Yv+QltE5K+45FeN/Uoi4eEU9rBbYR0a7M+EGhgd3TFrRcPnyCH9i3swZDOEIhvMoNPjOrEjLbC+oBYZ7JmFLP9hFPJoU3fEoM1LQvcCWSAgjLJ9819oS4akl0llS3OqjnMzCiAaJYN2lcHKlWCg/6xLHX46Vk72rC0JLYEwTnI1nEvvotDfYIOpT38KWioj5Z51AxD2PodUlcmjgngw76IEmbfYJL2Mu+YJzRNbQY9WpzCIDuHGRtMAaV1hOQZt5NZ6Dlf0V8X8RSFS/xVtZ5trWpzuK2AamAhJJljoQcKFpl3iUfB66ge2gKtZsWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1IK4cYxyPOdcnSzOWMWOZ0YaBLyXJs8fZNzBb7BKrY=;
 b=BMf4yMG/rtKqM4srqi9IiV15ACQlAqm+b8b3BkSsQp95rMB8whn8+05Doey9NkcPcSAa09f0S43ANgaLfnliP5Bfnzu20CEIMNeyT0B0I6lWrdPAvpY02wnJcITkOeWezU4x8QHFxBtG8Yt68+AQUxaT8dz3wMSSY7pbWphFgXpQthtfM3qBE0s2pxzJpXyRtmfrqUvSG5h/TR+0F2u+0sZ6rB8JxBLvprGSVIKvcdLWApFb7X+Uqr10jc+Nd/+uH5Is4rD1cLH65Lv7k0ITH8z5goj9HxLnxaQiiZre2X5KDhHrgGRwFAaE4sl+RbTiGGSJ5rwbHZLR3Zz0IEb5Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1IK4cYxyPOdcnSzOWMWOZ0YaBLyXJs8fZNzBb7BKrY=;
 b=n6O9pFIUlO3aHRIGmYm2GhPevXB4ZNgQJ6OziSzRwSuLwhawt41LTw6p4IhvXstCpeUj0JyW0FO0eJ+ghClt2lLFoMs6ROEslWEQREwpDBB6zv/nMt3axc5Nc4aOJlRhI6KjP6Q/0eOewHsiXGMORAV0eJkQmyKNtK7ZxF3CPRqn/j8aklbwkdpzAYsTqhEYIZIKbdM7HuqnR/BDVUG/JxmE/qqP/2HELqcWLzJLHg1RM1qOFFZQpzngvapvKrBh/tJ7u9m6Mi8embL57St9kspTQ/L0/SQlMo68rDQXkbSwpopjhn6M6K8QfzXkrfM6oF2sGMOIfQ7Zzf1hj6k2Kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA1PR12MB9530.namprd12.prod.outlook.com (2603:10b6:208:593::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Tue, 30 Sep
 2025 00:37:03 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 00:37:03 +0000
Date: Tue, 30 Sep 2025 10:36:57 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
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
Subject: Re: [PATCH v2 05/10] gpu: nova-core: gsp: Add GSP command queue
 handling
Message-ID: <qwqmek35wzu3chimtfsoftqvt4lw4g7btbvqzoc6qb4hoce3zq@pdu57fdxfb23>
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-6-apopple@nvidia.com>
 <DD2GCDGQ7Q4W.1CSFYSETFSN5H@nvidia.com>
 <7brvf66smc3ltqrw7tm7smth6wnefeqykdm2n4qahi5xnr6d5o@4l5xfdbznlp3>
 <DD5CXDR294YD.2RL474PWBDWTV@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DD5CXDR294YD.2RL474PWBDWTV@nvidia.com>
X-ClientProxiedBy: SYBPR01CA0187.ausprd01.prod.outlook.com
 (2603:10c6:10:52::31) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA1PR12MB9530:EE_
X-MS-Office365-Filtering-Correlation-Id: 555e5e0c-4302-4ede-b57e-08ddffb9797f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qj55XgQ7r9QrURcLmsS2FsrdNXq/rQpzkVB+88w60lXyjxoxIGwrMsYcAByS?=
 =?us-ascii?Q?sXLcSx7a7XxgxFjia0ihL26n9Mq78q1/DJCKhgJRJ6I4j3lAKmL7xd3Rlp7r?=
 =?us-ascii?Q?yEHLNETE+OpPuPIpifjEaWezfqUcJaoH+6pjpVaOdVoYqzbb1ed3uhzge1qi?=
 =?us-ascii?Q?nl4kPF4IfoVASO9Q3RS9uHUxNMt7lMESYLINDliADojdK8VuzB1PyKhLT7Ip?=
 =?us-ascii?Q?HyIHQPdT1C5tm6KffXJ2mrbPXaBlEONbkGzNjYmwzl0fyeaM4pOM9PByuiO7?=
 =?us-ascii?Q?glPB5oPMh90s+qVYUSgRS8CPzJrJ9mcC19vEb4c1nvJyvuTNDm4GtTpkju/X?=
 =?us-ascii?Q?am921TvgmuZzOXXOlbqN+TiVzFrYUhJUxzQHsZPw4kKH4EES1En6yHQBNOaY?=
 =?us-ascii?Q?PizGQ+1RN+wuF3NhDuFD65S5sXIZwXfmNh0Y+lOp0N8yBFBJci48xUnD3J4W?=
 =?us-ascii?Q?Wu1qeGQmaWloKavTaDdd4ZyR8tlcuYJqQz+wk9VobFwbAmu8RVSlOgkvBWR0?=
 =?us-ascii?Q?DCQB+kCss1Kgc938qjpv5Rz5HqbsBpMR8SQCc7RMw5tzdQdgCfqwkcn2et6L?=
 =?us-ascii?Q?I39TDpSD2GTCmTa6ti/EGjKexa96/7Yz4jfL0xa+TMZeuZ7aHHQ63mu7L5ea?=
 =?us-ascii?Q?3UiMMT3WcQgnwVtHGESQwMvn5YDSFRjujU3ThFafEalIXCx61R38xCxZWYK0?=
 =?us-ascii?Q?OmIV550tPDq8eHchXeiIvWSCt9pGihwIkWGFEW21rIGJ21POzh0DQpAEDBQ7?=
 =?us-ascii?Q?XwivzVNTR32SXOG7BunFISXhkrPzc+h0fDARRk6HEDASM5+GOlepcZ2pF/sX?=
 =?us-ascii?Q?yk6Wq5DnuLMNYLeJjuhK6yWaUsOTKVYp7LgT8ELvt0jL9P4hid8K8p5QzOgW?=
 =?us-ascii?Q?eYSeQ32p+tOtXzZaeQ/rt6Z3F6s+m+DQNbT8pQF6AF53ZimZ09i7G9oXUMfq?=
 =?us-ascii?Q?TBu1aKf/eYNhcaeRvycF3NPcpgnfnOULiRQZDhnS3Voo1HRhXi9dvuYL+blh?=
 =?us-ascii?Q?KVae1ZKKK1dDHtRkr/UB/inUgOZj9M0wCARnMbTkFEHJbacr6vPAMzu+pmBy?=
 =?us-ascii?Q?ejV6DyU3YyJJSWNXRGV/c8zUeMMdSudXgdY3k5rLPOpwBf0maLuPhjrREgYh?=
 =?us-ascii?Q?LvEFX1Hg3tt5lUFmUuFIwK8tn1GRZbuJtMq1r15Yka0vnv5hluhSU9fugduu?=
 =?us-ascii?Q?W9e73dnngsXTkXSW8rmd3sPpDfRgFC4PnUXdvRixLOpnWVIQaoIurzf8H1H3?=
 =?us-ascii?Q?7N1v3TeKZ5j5wm/PtvpGt7xWkwA1BreFJczBXPrL+xF7FYi//B4E+IUsprQY?=
 =?us-ascii?Q?n1Mj/BzoiB5nq3jOYv4ZxVFWu0jGRUzwudpYbfHKZmlAuZFj30e8YqSqqx6h?=
 =?us-ascii?Q?uWxfOhNjhGh6l48ziFyKmksbvBceXrKz+pa/j6ASK2de3M54+3vC5WtIOO+u?=
 =?us-ascii?Q?wAG6cSqCB6OWFkith8l5l/5NH8jGRCDMjgs5tj4OttptCrekZj5XPg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZPIM5cRV0rEfWBB2eJfKg8LNaWCTAIxw8HtUx2HhAt8dlhLL8diC07CuIkmj?=
 =?us-ascii?Q?TPvd+i2ufQJRrpq1HSn/RzaUQVQZlNVIt3TaCO3XcFPM3nQ3DH28J5ZHFyex?=
 =?us-ascii?Q?VnV/wQxXp4yecseBJdPPbXyARrI+o2xyB4D1QMk7qRJFOqehnSnuq7skEPJT?=
 =?us-ascii?Q?kz6SWoapaKnGzVZUV2uJH/qbYIiv93iWXdiE9eUmLFHBVnpBrXdd8cfeT6ph?=
 =?us-ascii?Q?6DDjNmQ9uhwpTD552xWa9ptGUCirdPZKh+ei99zk0Q2cXRgEcVkUpK48oNN8?=
 =?us-ascii?Q?ayOdcuPTB9kSo8NPYFDxBOa02HOY7JorzTxFKFzOogyWL0tYnPNk3leP7HkK?=
 =?us-ascii?Q?qcHN9jlLA+CjclQxzCaE9PUXPiOcn8Fbo63/tq/u9Iui4IGzPQJ6CbAH45bs?=
 =?us-ascii?Q?ziznE2bQDoOavXXXMRkS/MV1xBWQ9YgyKoLp12oXw40nKBIeinZmeR7TGFvd?=
 =?us-ascii?Q?uXBDDNWXSe4OUqSX0T/1VjngLT18eqDwkZXLv/NCvPqYl883GE5qdFzAp4NB?=
 =?us-ascii?Q?nWsYJ5HGiSo0R8+61bhRzPbz64CA4ZAsnSEvoYCQjInzwfjoX/9eNjDwBCoN?=
 =?us-ascii?Q?+lsNR42yacZHY00SKheM7f+rjNH8caqnJ0R+55w3UFcVqanyoV81QSpncavH?=
 =?us-ascii?Q?MVcSrhaplLuXmTun2Ke4PvX2WaaIHpL6IoWY5viDsra+INN5uEnZ7OfMK6G2?=
 =?us-ascii?Q?SvW5xu3xUXna66O8B/BaCvxK9dNwOEJbZN09XWsFvqre/NFjlMtFembhsf3r?=
 =?us-ascii?Q?Rs/fMdNe6OjzjybwEVU2mUYjfp01PewkhMdIOvsIleNBfPV0IvuyaARC5Ct7?=
 =?us-ascii?Q?6SY3fwK4be7gZ9dJSeCEBQVa3d4B6BTUJUSCOK7FivoHQZdTcfNYK+9nDj0/?=
 =?us-ascii?Q?lc0/JzeqerB1SHJbh+JbCuKPC/ltyMTozJ49NIC/b6k4/qgR/SRQeASRZhU6?=
 =?us-ascii?Q?sMso7VWcg5Dma5mIU3MsuNZTiLIHGoDgrtj+wyiHIGPho0B1t4bWdBKYJRdl?=
 =?us-ascii?Q?dt+Qh/EOFBKyfo6zoSXDYW/0YIALerbE/w4v8pYMP2tESisOzZUY51nIKRDg?=
 =?us-ascii?Q?L2Ab1PkB89vPA2MApYcgfkhFKhCWeGhSdJTLeHgI8QE/rE0rV3dgRm8bynxh?=
 =?us-ascii?Q?nadoa0mXtTG3XNLvklOUFO2iSNIl2v3HVxouhOctONbH9jrRWxt45aPkZbg7?=
 =?us-ascii?Q?IgWA49xll28aed+tRgLFJLXdnUbdI6Bk5Gs2exvYq484cmDF/7jDMYOD5sPb?=
 =?us-ascii?Q?DMA3rfVDG7P5nM8dbxuodIY2EZVNjzglfnkxIqdOH2QhQ3JzjvbkhDNX7AxF?=
 =?us-ascii?Q?DSfUCCZXle++Ik0nBkEDWjOT99ciQ3B0Qa2EPBDpI1CjZnRECOAf401a8NmB?=
 =?us-ascii?Q?o6p6RnCEp1dgsrgAvHb2NZwUJswL0m35RoD18QMm0bJUVmkfNTX9s5KuKnJ8?=
 =?us-ascii?Q?Awzxa72WaZOZcxTebeQBxym+achNAHl32czOxwJqZlhsVXV4nuo5MeXpb0Wm?=
 =?us-ascii?Q?7OjaXHvyfKKBrgpl1WgVXJJWmMEeEJqpPmtCtCNmz2SiiYuTbLXXWhOmARgj?=
 =?us-ascii?Q?54STcv1L706IykZYLfq+b4N7MuuyfdH9SnUPORK4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 555e5e0c-4302-4ede-b57e-08ddffb9797f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 00:37:03.3130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6aeDwAH5sAusUpi7FPnhi1q0ObSz1eyx7fkpWh4Dppl9alpjrgZAc6WbhFsp6aD/TCFX7piOMaZFJCxLhxO1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9530
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

On 2025-09-30 at 00:34 +1000, Alexandre Courbot <acourbot@nvidia.com> wrote...
> On Mon Sep 29, 2025 at 3:19 PM JST, Alistair Popple wrote:
> <snip>
> >> > +
> >> > +/// Number of GSP pages making the Msgq.
> >> > +pub(crate) const MSGQ_NUM_PAGES: u32 = 0x3f;
> >> > +
> >> > +#[repr(C, align(0x1000))]
> >> > +#[derive(Debug)]
> >> > +struct MsgqData {
> >> > +    data: [[u8; GSP_PAGE_SIZE]; MSGQ_NUM_PAGES as usize],
> >> > +}
> >> > +
> >> > +// Annoyingly there is no real equivalent of #define so we're forced to use a
> >> > +// literal to specify the alignment above. So check that against the actual GSP
> >> > +// page size here.
> >> > +static_assert!(align_of::<MsgqData>() == GSP_PAGE_SIZE);
> >> > +
> >> > +// There is no struct defined for this in the open-gpu-kernel-source headers.
> >> > +// Instead it is defined by code in GspMsgQueuesInit().
> >> > +#[repr(C)]
> >> > +struct Msgq {
> >> > +    tx: MsgqTxHeader,
> >> > +    rx: MsgqRxHeader,
> >> > +    msgq: MsgqData,
> >> > +}
> >> > +
> >> > +#[repr(C)]
> >> > +struct GspMem {
> >> > +    ptes: [u8; GSP_PAGE_SIZE],
> >> > +    cpuq: Msgq,
> >> > +    gspq: Msgq,
> >> > +}
> >> > +
> >> > +// SAFETY: These structs don't meet the no-padding requirements of AsBytes but
> >> > +// that is not a problem because they are not used outside the kernel.
> >> > +unsafe impl AsBytes for GspMem {}
> >> > +
> >> > +// SAFETY: These structs don't meet the no-padding requirements of FromBytes but
> >> > +// that is not a problem because they are not used outside the kernel.
> >> > +unsafe impl FromBytes for GspMem {}
> >> 
> >> These ARE used outside the kernel, since they are shared with the GSP.
> >> :) I'd say the reason these are safe is just because we satisfy the
> >> requirements of AsBytes and FromBytes:
> >
> > Yes, and they're actually old safety comments that I missed updating to be the
> > same as the rest.
> >  
> >> - No initialized bytes,
> >> - No interior mutability,
> >> - All bytes patterns are valid (for some generous definition of
> >>   "valid" limited to not triggering UB).
> >
> > I was under the impression that that's all `unsafe` is really marking - code
> > the compiler can't prove won't trigger UB. So I'd assume that's all we'd have to
> > prove in safety comments anyway.
> 
> A good rule of thumb for writing `SAFETY` statements is to look at the
> `Safety` section of the unsafe code we call (here `FromBytes`), and
> justify why our calling code satisfies each of these.

Oh that's usually where I get my inspiration for them from. This was more a
statement of my understanding of the language design, that unsafe is mostly
about UB rather than overall struct validity. After all I think it is still
possible to have safe code initialise fields of a struct in "invalid" ways
(depending on the struct).

> >> > +    dev: ARef<device::Device>,
> >> > +    seq: u32,
> >> > +    gsp_mem: DmaGspMem,
> >> > +    pub _nr_ptes: u32,
> >> > +}
> >> > +
> >> > +impl GspCmdq {
> >> > +    pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<GspCmdq> {
> >> > +        let gsp_mem = DmaGspMem::new(dev)?;
> >> > +        let nr_ptes = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
> >> > +        build_assert!(nr_ptes * size_of::<u64>() <= GSP_PAGE_SIZE);
> >> > +
> >> > +        Ok(GspCmdq {
> >> > +            dev: dev.into(),
> >> > +            seq: 0,
> >> > +            gsp_mem,
> >> > +            _nr_ptes: nr_ptes as u32,
> >> > +        })
> >> > +    }
> >> > +
> >> > +    fn calculate_checksum<T: Iterator<Item = u8>>(it: T) -> u32 {
> >> > +        let sum64 = it
> >> > +            .enumerate()
> >> > +            .map(|(idx, byte)| (((idx % 8) * 8) as u32, byte))
> >> > +            .fold(0, |acc, (rol, byte)| acc ^ u64::from(byte).rotate_left(rol));
> >> > +
> >> > +        ((sum64 >> 32) as u32) ^ (sum64 as u32)
> >> > +    }
> >> > +
> >> > +    #[expect(unused)]
> >> > +    pub(crate) fn send_gsp_command<M: GspCommandToGsp>(
> >> > +        &mut self,
> >> > +        bar: &Bar0,
> >> > +        payload_size: usize,
> >> > +        init: impl FnOnce(&mut M, SBuffer<core::array::IntoIter<&mut [u8], 2>>) -> Result,
> >> 
> >> This works pretty well for in-place initialization.
> >> 
> >> There a couple of small drawbacks though: `M` must implement `FromBytes`
> >> even though we only send it, and (more serious) there is no guarantee
> >
> > Yes, that detail annoyed me slightly too.
> >
> >> that `init` will fully initialize the command - a forgetful caller can
> >> omit some of its fields, or even the whole structure, and in that case
> >> we will send a command with what happened to be at that position of the
> >> queue at that time.
> >
> > Good timing as I was just looking to see if there wasn't some way of ensuring
> > this happened, or at least was much more explicit than what we currently do.
> >
> >> I think this is a good case for using the `Init` trait: it's like
> >> `PinInit`, but without the `Pin`, and it ensures that the whole argument
> >> is initialized. So this method would change into something like:
> >> 
> >>     pub(crate) fn send_gsp_command<M: GspCommandToGsp>(
> >>         &mut self,
> >>         bar: &Bar0,
> >>         payload_size: usize,
> >>         init: impl Init<M, Error>,
> >>         init_sbuf: impl FnOnce(SBuffer<core::array::IntoIter<&mut [u8], 2>>) -> Result,
> >> 
> >> This also allows us to drop the `FromBytes` requirement on
> >> `GspCommandToGsp`! But also requires us to use `unsafe` to call
> >> `Init::__init` on the pointer to the command. I think it's worth it
> >> though, as this removes the risk of sending partially-uninitialized
> >> commands.
> >
> > Agree on it being worth the unsafe call, especially because it is unsafe if the
> > caller doesn't do what it's supposed to regardless. But how does this contrast
> > with `MaybeUninit`? I was wondering if something like this would work:
> >
> >     pub(crate) fn send_gsp_command<M: GspCommandToGsp>(
> >         &mut self,
> >         bar: &Bar0,
> >         payload_size: usize,
> >         init: impl FnOnce(MaybeUninit<&mut M>, SBuffer<core::array::IntoIter<&mut [u8], 2>>) -> Result<&M>,
> >
> > Note I'm not sure we could actually make that work as I haven't tried it yet. I
> > suspect I've missed something with lifetimes there :-)
> 
> The difference with using `MaybeUninit` is that the unsafe code would
> need to be *within* each `init` argument - IOW, within each caller. It
> also does not provide any guarantee that the whole `M` is initialized,
> we have to trust each caller for doing that properly.

I suggested it because I was actually thinking that would be a feature :-) After
all callers are the ones doing the initialisation and so have to be trusted to
do that, and the unsafe call to `assume_init()` would be the indication they
have to do something right.

But I'm not particularly tied to using that, it was an idle thought/question. I
do wonder how Init gets around callers having to guarantee the whole of `M` is
initialised, so will have to go study it a bit more closely.

> I've tried implementing using `Init` and it works even better than I
> thought. Each type actually automatically implement `Init` on itself,
> which means that instead of implicitly calling init!() as in
> 
>   cmdq.send_gsp_command(bar, init!(MyCommand {
>     foo: ...,
>   }), ...);
> 
> You can just pass an object as a stack argument and it will also work!
> 
>   cmdq.send_gsp_command(bar, MyCommand {
>     foo: ...,
>   }, ...);

Nice!

> Of course in this case the `MyCommand` instance is first passed on the
> stack before being copied into the command-queue, but for small commands
> this is pretty convenient. Larger ones can use the `init!` syntax for
> full in-place initialization.

Yeah I think that's fine. Most commands are small and should fit on the stack
anyway.

> >
> >
> >> Then there is what to do with the `SBuffer`. I'd like to think a bit
> >> more about this, as not all commands require it, and those that do
> >> typically send arrays of particular types. I think we should be able to
> >> use the type system to have more control over this, but let's keep that
> >> for the next revision.
> >
> > Sure. You are correct that not all (most?) commands don't need it, and it's a
> > shame we don't have proper bindings for them anyway. Although in some cases that
> > still wouldn't work anyway (eg. for registry keys) where it really is just a
> > packed variable number of variable length strings. Not sure what a Rust native
> > representation of that would be.
> 
> For now the best I could think of is to have not one but two traits for
> GSP commands: one for commands with payload and another one for commands
> without payload. And two variants of `send_gsp_command` for each case.
> That way we can at least guarantee that we won't pass a payload where we
> shouldn't, or forget one where we should.

We can't guarantee that (at least with the current bindings) because we
still need to manually mark up the types with the correct traits. But if the
majority of commands don't have a payload I agree it would provide some nice
simplifications for callers.

> I got a prototype of this working and along with the `Init` thing it
> feels pretty right.
> 
> >
> >> > +    ) -> Result {
> >> > +        // TODO: a method that extracts the regions for a given command?
> >> > +        // ... and another that reduces the region to a given number of bytes!
> >> > +        let driver_area = self.gsp_mem.driver_write_area();
> >> > +        let free_tx_pages = driver_area.0.len() + driver_area.1.len();
> >> > +
> >> > +        // Total size of the message, including the headers, command, and optional payload.
> >> > +        let msg_size = size_of::<GspMsgElement>() + size_of::<M>() + payload_size;
> >> > +        if free_tx_pages < msg_size.div_ceil(GSP_PAGE_SIZE) {
> >> > +            return Err(EAGAIN);
> >> > +        }
> >> > +
> >> > +        let (msg_header, cmd, payload_1, payload_2) = {
> >> > +            // TODO: find an alternative to as_flattened_mut()
> >> 
> >> I think we can use it if we enable the "slice_flatten" feature (stable
> >> since 1.80, introduced in 1.67).
> >
> > Ok, will try that. Hopefully explicitly using the feature also makes clippy
> > happy but if not I guess we can leave the over-rides below.
> 
> I think you will also need to explicitly enable the feature somewhere -
> for the kernel crate it is in `rust/kernel/lib.rs`, but Nova being a
> different crate I am not sure where we are supposed to do it...
> 
> <snip>
> >> > +
> >> > +            (msg_header, cmd, payload_1, payload_2)
> >> > +        };
> >> > +
> >> > +        let sbuffer = SBuffer::new_writer([&mut payload_1[..], &mut payload_2[..]]);
> >> > +        init(cmd, sbuffer)?;
> >> > +
> >> > +        *msg_header = GspMsgElement::new(self.seq, size_of::<M>() + payload_size, M::FUNCTION);
> >> > +        msg_header.checkSum = GspCmdq::calculate_checksum(SBuffer::new_reader([
> >> > +            msg_header.as_bytes(),
> >> > +            cmd.as_bytes(),
> >> > +            payload_1,
> >> > +            payload_2,
> >> > +        ]));
> >> > +
> >> > +        let rpc_header = &msg_header.rpc;
> >> > +        dev_info!(
> >> > +            &self.dev,
> >> > +            "GSP RPC: send: seq# {}, function=0x{:x} ({}), length=0x{:x}\n",
> >> > +            self.seq,
> >> > +            rpc_header.function,
> >> > +            decode_gsp_function(rpc_header.function),
> >> > +            rpc_header.length,
> >> > +        );
> >> > +
> >> > +        let elem_count = msg_header.elemCount;
> >> > +        self.seq += 1;
> >> > +        self.gsp_mem.advance_cpu_write_ptr(elem_count);
> >> > +        NV_PGSP_QUEUE_HEAD::default().set_address(0).write(bar);
> >> 
> >> I'm a bit surprised that we always write `0` here, can we document this
> >> behavior, maybe in the definition of `NV_PGSP_QUEUE_HEAD`?
> >
> > I was also suprised the value doesn't matter but this is what both Nouveau and
> > OpenRM do. I guess it just triggers some kind of notification on the GSP and the
> > actual queue head is read from the shared memory pointers.
> 
> In that case I think we should definitely document this - or even
> better, if it nevers makes sense to write anything else than 0 to
> `NV_PGSP_QUEUE_HEAD`, to add an explicit method (e.g. `kick`?) that does
> this for us. Can you try and go to the bottom of this?

Sure, I'll put a kick method on the command queue and some documentation
covering that.

> >> > +
> >> > +            // Can't fail because msg_slice will always be
> >> > +            // size_of::<GspMsgElement>() bytes long by the above split.
> >> > +            let msg_header = GspMsgElement::from_bytes(msg_header_slice).unwrap();
> >> > +            if msg_header.rpc.length < size_of::<M>() as u32 {
> >> > +                return None;
> >> > +            }
> >> 
> >> If we have a message in the queue and this condition doesn't hold, I
> >> don't think we can hope that it will in a further iteration - this
> >> should be an error.
> >
> > I was thinking messages may get partially written and we'd see this state, but
> > you're right - the shared pointers shouldn't be updated until the entire message
> > is written so this should be an error.
> >
> > That will require the `wait_on_result()` function, because `wait_on()` doesn't
> > allow the closure to return a failure. We could just return Option<Result<_>>
> > from the closure but that's a bit gross, because wait_on() would then return
> > Result<Option<Result<_>>>.
> 
> We can now use `read_poll_timeout` (from `kernel::io::poll`) which
> separates the acquisition of the state and the test of the condition
> into two separate closures - the first one returns a `Result`, and its
> error is propagated as-is, which is what we want in this case.

Oh nice. That looks like it should do the job.

> Actually this reminded me that I should send a patch to remove `wait_on`
> altogether now that we have a better alternative! :)

I guess the implies we shouldn't add new callers of `wait_on` ... not sure
if there are others in this series but will take a look and convert them to
read_poll_timeout.

> >> > diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
> >> > index 7f4fe684ddaf..2e4255301e58 100644
> >> > --- a/drivers/gpu/nova-core/gsp/fw.rs
> >> > +++ b/drivers/gpu/nova-core/gsp/fw.rs
> >> > @@ -15,7 +15,9 @@
> >> >  use crate::firmware::gsp::GspFirmware;
> >> >  use crate::gpu::Chipset;
> >> >  use crate::gsp;
> >> > +use crate::gsp::cmdq::MSGQ_NUM_PAGES;
> >> 
> >> I guess the number of pages in the message queue is firmware-dependent,
> >> so would it make sense to move its declaration to this module?
> >
> > It's not firmware dependent - it appears we can set it to whatever we reasonably
> > want (for some value of "reasonable) so long as we allocate the right buffer
> > sizes, etc. I noticed and tested this a while back when removing some magic
> > numbers.
> >
> > That said 0x3f is what I chose because that's what Nouveau and I think OpenRM
> > use.
> 
> Ah, that's great and makes perfect sense! So I suppose the
> `pageTableEntryCount` member of the `MESSAGE_QUEUE_INIT_ARGUMENT` is to
> pass the total size of the message queue. I'm starting to think about a
> version of the command queue where its size would be a generic argument,
> but let's keep that for a later patch, if we ever want it at all. :)

Ha. A fun coding project for sure but I'm not sure we'd ever really use it.

> >
> >> >  use crate::gsp::FbLayout;
> >> > +use crate::gsp::GSP_PAGE_SIZE;
> >> >  
> >> >  /// Dummy type to group methods related to heap parameters for running the GSP firmware.
> >> >  pub(crate) struct GspFwHeapParams(());
> >> > @@ -159,6 +161,37 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
> >> >      // GSP firmware constants
> >> >      GSP_FW_WPR_META_MAGIC,
> >> >      GSP_FW_WPR_META_REVISION,
> >> > +
> >> > +    // GSP events
> >> > +    NV_VGPU_MSG_EVENT_GSP_INIT_DONE,
> >> > +    NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE,
> >> > +    NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD,
> >> > +    NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER,
> >> > +    NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED,
> >> > +    NV_VGPU_MSG_EVENT_OS_ERROR_LOG,
> >> > +    NV_VGPU_MSG_EVENT_POST_EVENT,
> >> > +    NV_VGPU_MSG_EVENT_RC_TRIGGERED,
> >> > +    NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT,
> >> > +
> >> > +    // GSP function calls
> >> > +    NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA,
> >> > +    NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA,
> >> > +    NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE,
> >> > +    NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY,
> >> > +    NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT,
> >> > +    NV_VGPU_MSG_FUNCTION_ALLOC_ROOT,
> >> > +    NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA,
> >> > +    NV_VGPU_MSG_FUNCTION_FREE,
> >> > +    NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO,
> >> > +    NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
> >> > +    NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU,
> >> > +    NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL,
> >> > +    NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO,
> >> > +    NV_VGPU_MSG_FUNCTION_LOG,
> >> > +    NV_VGPU_MSG_FUNCTION_MAP_MEMORY,
> >> > +    NV_VGPU_MSG_FUNCTION_NOP,
> >> > +    NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO,
> >> > +    NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
> >> >  };
> >> >  
> >> >  #[repr(transparent)]
> >> > @@ -197,3 +230,86 @@ fn id8(name: &str) -> u64 {
> >> >          })
> >> >      }
> >> >  }
> >> > +
> >> > +pub(crate) type MsgqTxHeader = bindings::msgqTxHeader;
> >> 
> >> This should be wrapped into a newtype that provides the exact set of
> >> features required by the gsp module, like what is done for
> >> `LibosMemoryRegionInitArgument`. For this type we just need two things:
> >> return the `writePtr`, and advance it by a given value. That's all
> >> the parent module needs to see.
> >
> > Except that doesn't actually work, because we need to use DMA access methods on
> > bindings::msgqTxHeader which we can't do from an accessor.
> 
> If the accessor uses `read_volatile` and `write_volatile` then I guess
> it should work? These are unsafe though, so this is not ideal, but at
> least they would be contained into the `fw` module and limited to one
> getter and one setter.

Sure, `read_volatile()` and `write_volatile` would work but then we're adding
more unsafe calls and going around the DMA subsystem which has special
exceptions for justifying the SAFETY comments.

> >
> >> By just aliasing this type, we make all its members visible to the `gsp`
> >> module. This increases its dependency on a given firmware version,
> >> carries a risk that the GSP module will mess with what it is not
> >> supposed to, and introduces inconsistency in how we abstract the
> >> firmware types - some are wrapped, others are not. Let's be consistent
> >> and make all bindings completely opaque outside of `fw.rs`.
> >
> > I can't see how accessors in `fw.rs` for every firmware binding we use is useful
> > though[1]? In what way does that reduce dependency on a given firmware version?
> > I can't see how it isn't just adding boiler plate for every struct field we want
> > to access.
> 
> While the main point of this remains hiding stuff other modules don't
> need to see, it also allows us to choose stable method names that are
> independent from the firmware.

So the concern is firmware will rename struct fields?

> >
> > We already have higher level abstractions (eg. DmaGspMem) to ensure the GSP
> > won't mess with what it isn't supposed to, and these higher level abstractions
> > also provide more options to reduce dependency on a given firmware version as
> > the logic isn't as tightly coupled to the binding representation. It also allows
> > us to access the fields using the proper DMA access methods.
> 
> `DmaGspMem` is a special case - it is in shared memory and requires
> volatile reads and writes at runtime. And yes it also provides a
> higher-level abstraction to access the driver's readable and writable
> areas of the ring buffer - I think these are at the right place in
> `cmdq.rs`.
> 
> But we also have other types that we build on the stack, even if we move
> them to a DmaObject afterwards. `fw.rs` should provide constructors and
> simple primitives for these, on top of which the command queue logic can
> be built. Right now we are initializing their fields in `cmdq` and I
> think we can agree this is not very portable.

I agree but I also can't see where we are doing that in `cmdq`? I already added
constructors for those after the last round of review but maybe I missed one?

> To clarify further, our sole business with half of the bindings types is
> initializing them to some value that makes sense and put it somewhere.
> For this we only need a constructor. We don't need to know the names of
> their fields, and we don't want to know.

So an example of that would be GspSystemInfo right? I can see why a constructor
would be helpful for that, but does it have to go in fw.rs? What is wrong with
having the constructor implementation in eg. commands.rs where it is
currently[1]? That would help us split up fw.rs so it doesn't become unwieldy.

[1] - Admittedly there isn't an explicit constructor at the moment, because
initialisation needs to happen in place in the closure, but conceptually it
could have one and serves as an example.

> Other bindings types are message-related, and we need to access their
> contents. You discuss these in more detail below so let's address them
> there.
> 
> Then the last kind are the types related to the command queue runtime
> operation - namely the Rx/Tx headers and their read/write pointers, and
> the message headers that we need to read and write. For the former we
> only need to poke at their pointers using volatile accesses, which is
> two methods that I propose to have for that purpose. For the latter we
> only need to access a handful of fields, some of which can be tricky
> (like `length`). In any case, we are talking about a handful of methods
> here to keep the abstraction opaque.

It's largely the whole concept of keeping the details of the command queue
opaque from the thing implementing the command queue (the cmdq module) that
seems strange to me. If anything in the firmware command queue changes it's
unlikely the command queue implementation will remain the same.

> More on messages below as you make an interesting point on them.
> 
> > [1] - Except for maybe removing some nonRustySnakeyNames
> >
> >> > +
> >> > +// SAFETY: Padding is explicit and will not contain uninitialized data.
> >> > +unsafe impl AsBytes for MsgqTxHeader {}
> >> > +
> >> > +impl MsgqTxHeader {
> >> > +    pub(crate) fn new(msgq_size: u32, rx_hdr_offset: u32) -> Self {
> >> > +        Self {
> >> > +            version: 0,
> >> > +            size: msgq_size,
> >> > +            msgSize: GSP_PAGE_SIZE as u32,
> >> > +            msgCount: MSGQ_NUM_PAGES,
> >> > +            writePtr: 0,
> >> > +            flags: 1,
> >> > +            rxHdrOff: rx_hdr_offset,
> >> > +            entryOff: GSP_PAGE_SIZE as u32,
> >> > +        }
> >> > +    }
> >> > +}
> >> > +
> >> > +/// RX header for setting up a message queue with the GSP.
> >> > +///
> >> > +/// # Invariants
> >> > +///
> >> > +/// [`Self::read_ptr`] is guaranteed to return a value in the range `0..NUM_PAGES`.
> >> > +pub(crate) type MsgqRxHeader = bindings::msgqRxHeader;
> >> > +
> >> > +// SAFETY: Padding is explicit and will not contain uninitialized data.
> >> > +unsafe impl AsBytes for MsgqRxHeader {}
> >> > +
> >> > +impl MsgqRxHeader {
> >> > +    pub(crate) fn new() -> Self {
> >> > +        Default::default()
> >> > +    }
> >> > +}
> >> > +
> >> > +pub(crate) type GspRpcHeader = bindings::rpc_message_header_v;
> >> 
> >> This type too is another good illustration of why we should make our
> >> bindings opaque. In `cmdq.rs` we access `GspRpcHeader::length` multiple
> >> times, ignoring the fact that it also includes the size of the RPC
> >> header itself - not just what comes after it! Since it doesn't come with
> >> any documentation, we can be forgiven for assuming the obvious - that it
> >> is just the size of what follows, but it is not.
> >
> > This has nothing to do with the bindings being opaque or not though. I can
> > almost gurantee that after writing ten brain dead accessor functions that the
> > eleventh would have looked pretty similar and included the same bug!
> 
> It does very much have to do with making the binding opaque. If it is
> not opaque, and the original `length` is accessible, what is preventing
> code from using it and repeating the same mistake again?

Nothing, and nothing is preventing someone writing an accessor to access the
length or some other field and using it incorrectly if that's what they think
they need. Making the fields opaque just means more code and more code generally
means more bugs and more maintenance when things inevitably change.

> I don't quite get where the "ten brain dead accessor functions" would
> come from. I propose we write one, that returns a value that makes sense
> (contrary to the original member), and most importantly is documented so
> users can know exactly what it does. Tell me what is brain-dead about
> that? This very patch misused the `length` member on at least two
> different occasions, isn't the benefit clear?

To be clear I'm not disagreeing with the need for a method to get the length
of a message - I'm disagreeing with the requirement to make the binding fields
opaque to the rest of the Gsp module that needs them (as distinct from the rest
of nova-core - bindings should definitely not leak outside the Gsp abstraction).

The "ten brain dead accessor functions" comes from an assumption that eventually
we will need to access most fields in these structs (otherwise why would they
exist?) which would require many accessor functions to simply read/write the
fields. This is still an early implementation and I imagine as we grow to
support more features most of the fields will be needed.

> >
> >> What we actually want is a method on `GspMsgElement` that returns what
> >> we actually want (and is documented as such): the actual size of the
> >> payload following the whole header. That way there can be no room for
> >> mistake.
> >
> > The length calculation can just be a method on GspRpcHeader without requiring
> > the rest of the fields to need accessor functions as welli though.
> >
> > Take for example a structure that we will need in future, GspStaticConfigInfo_t.
> > This currently has 53 fields, although to be fair maybe we only care about half
> > of them.
> >
> > My proposal[2] is to convert them into an abstract nova-core specific type,
> > GspConfigInfo, that contains the specific details Nova users care about.
> > Following the implied rule that no field accessors shall leak from fw.rs would
> > require accessors for all fields. That's at least another 78 lines (assuming a
> > minimal 3 line accessor function) of boiler plate for one FW structure. Multiply
> > that by many structures and you now have a lot of boiler plate for no real gain
> > and a very large fw.rs (note my example[2] only contains one field, but I expect
> > we will need a lot more if not most of them).
> >
> > [2] - https://github.com/apopple-nvidia/linux/blob/nova-core-unstable/drivers/gpu/nova-core/gsp/commands.rs#L32
> 
> I am not opposed to having a nova-core specific type, and in the case of
> GspStaticConfigInfo_t is certainly seems to make sense. Actually it even
> does what we want here, since with that design this type should not be
> visible outside of the `fw` module, right?

I feel like this is largely where the confusion/disagreement lies - what the
`gsp` module provides versus what the `fw` module provides. My thinking is that
the types don't leak outside the `gsp` module, the `fw` is really just providing
raw binding information that the `gsp` module turns into something nice/abstract
for the rest of nova-core in the form of functions (or types) to do whatever
is needed.

> Now to be fair, one needs to also consider that this new
> GspStaticConfigInfo type will also need its own boilerplate-y code to
> initialize itself from the original GspStaticConfigInfo_t, field by
> field. But in the end we would have a type that provides us with the
> abstraction that we need for the GSP module, while making the bindings
> type invisible - this fits the bill, and looks arguably nicer than
> having too many accessors so why not!
> 
> One can even argue that the wrapping pattern is just a simpler version
> of this - we create a new type to hide the bindings' internals and
> provide us with the right interface. It is just that for many
> commands/messages the payload is so small that it is actually less code
> to just wrap it and provide a few utility methods. GspStaticConfigInfo_t
> is certainly an exception.

Exactly! Although it would be nice if we could wrap without needing all the
accessors, hence the suggestion of a type alias which could easily be turned
into a separate struct. If say the firmware binding type changed we could easily
construct the old struct from whatever the new type(s) are (which could even
involve extra GSP RPC calls or something else for example).

> >
> >> > +
> >> > +// SAFETY: Padding is explicit and will not contain uninitialized data.
> >> > +unsafe impl AsBytes for GspRpcHeader {}
> >> > +
> >> > +// SAFETY: This struct only contains integer types for which all bit patterns
> >> > +// are valid.
> >> > +unsafe impl FromBytes for GspRpcHeader {}
> >> > +
> >> > +impl GspRpcHeader {
> >> > +    pub(crate) fn new(cmd_size: u32, function: u32) -> Self {
> >> > +        Self {
> >> > +            // TODO: magic number
> >> > +            header_version: 0x03000000,
> >> > +            signature: bindings::NV_VGPU_MSG_SIGNATURE_VALID,
> >> > +            function,
> >> > +            // TODO: overflow check?
> >> > +            length: size_of::<Self>() as u32 + cmd_size,
> >> > +            rpc_result: 0xffffffff,
> >> > +            rpc_result_private: 0xffffffff,
> >> > +            ..Default::default()
> >> > +        }
> >> > +    }
> >> > +}
> >> > +
> >> > +pub(crate) type GspMsgElement = bindings::GSP_MSG_QUEUE_ELEMENT;
> >> 
> >> Hammering my previous argument a bit more: in `cmdq.rs`, we do the
> >> following:
> >> 
> >>     let msg_header = GspMsgElement::from_bytes(msg_header_slice).unwrap();
> >> 
> >> Even though we explicitly used `GspMsgElement`, `msg_header` appears as
> >> being of type `GSP_MSG_QUEUE_ELEMENT` in LSP. That's super confusing and
> >> can be avoided by using the newtype pattern.
> >
> > That's surprising. I would have hoped the LSP would be more helpful than that.
> >
> >> Lastly, the bindings generated from C headers are supposed to be temporary, and
> >> we eventually want to replace them with direct IDL-to-Rust bindings. Not
> >> leaking the C types let us design `fw.rs` as a blueprint for the ideal
> >> interface we would want to generate - so the limited extra labor that
> >> comes with wrapping these types would also pay off in that respect.
> >
> > I agree with this - `fw.rs` should be the blueprint for the ideal bindings
> > that we could conceivably generate directly from IDL. But this is also why
> > I'm pushing back against the idea of putting any kind of logic (in the form of
> > accessors/constructors) into `fw.rs` - I doubt you will ever be able to generate
> > those from IDL.
> 
> `fw.rs` should contain the minimum required to build the logic on top of
> it, agreed. Doing so might require having another type on top of the one
> defined in `fw` to implement said logic - if you remember I did
> something like that for MsgqTxHeader and you thought that was too
> convulated. :)

Types (plural) yes, but a type I have no problem with :-)

My thinking is DmaGspMem is that type. In other words things like the
read/writePtr accessors (which if I recall correctly you had spread across 3
types) can just live there - we don't need to hide them behind some opaque type
in fw.rs (and indeed doing so introduces more unsafe code as discussed above).

> >
> > For example I doubt it would be possible to generate the length logic, and I'm
> > even more doubtful we could figure out how to generate the constructors based on
> > Rust type.
> 
> Where to put the length logic depends on how our firmware interface is
> defined. If we agree that `length` is "The size of the RPC header, the
> following command, and its payload but oh wait we don't include the rest
> of the message element which includes the RPC header so don't forget to
> add it" then we can just return or use the member as-is. But it's a bad
> and error-prone interface. We can document it, and that in itself would
> be an improvement, but it would still require some mental gymnastic to
> use and is just a giant footgun.

Oh yeah, for sure. I'm not arguing against a method to calculate the length
we want. I'm just thinking it lives on the binding type as a method. Eg:

impl bindings::GSP_MSG_QUEUE_ELEMENT {
    pub(crate) fn message_length(self) -> u32 {
        (size_of::<Self>() as u32 - size_of::<GspRpcHeader>() as u32 + self.rpc.length)
    }
}

And that probably lives in the cmdq code in order to keep any non-generatable
logic out of fw.rs (but I could be convinced otherwise). And yes the name is
horrible, but we can fix that easily enough in the binding generation.

> What is safe and useful is the length of the entire message, header,
> command and payload included, because that's how we use it in the code.
> It's also trivial to produce, and if we do it here we only do that
> operation on one place instead of at each calling site. So yes, it
> belongs here, as part of the firmware abstraction, and if we have to
> write it by hand then so be it.

Just to re-iterate, I am not insane enough to want that mistake spread
everywhere. I just don't understand the advantage of putting this in fw.rs
rather than in the code using it and providing the abstraction (cmdq.rs),
nor the need to hide the rest of the rpc message header fields from the thing
implementing the abstraction.

IOW the rpc header shouldn't be used outside the cmdq.rs code anyway so why jump
through hoops in fw.rs to hide the fields.

> The same goes for the constructor. Of course there will be some manual
> work needed to include a new incompatible firmware version. But if you
> don't do it here, you will have to do that work somewhere else anyway -
> probably `gsp` or `cmdq`, except without the elegance of a method
> containing that code. How is that better?

Again, not against the methods at all. Just that we should add them as needed
rather than force them for every single field that will probably never change
anyway.

> >
> > So to summarise where I think we're at we have two proposals for how to
> > treat/use the generated bindings:
> >
> > 1) Make them all a newtype[3] using a transparent wrapper to make the fields
> > opaque and accessor functions to implement the logic. This would all be in fw.rs
> > to stop the C types leaking out.
> >
> > 2) Build a completely new type based on the underlying bindings plus whatever
> > other logic is needed. The C types could be used within the `gsp` module to
> > implement the new types but would not leak further than that.
> >
> > Using GspStaticConfigInfo_t as a concrete example I think option (1) looks like
> > this:
> >
> > In fw.rs:
> >
> > #[repr(transparent)]
> > pub(crate) struct GspStaticConfigInfo(bindings::GspStaticConfigInfo_t);
> >
> > impl GspStaticConfigInfo {
> >     pub(crate) fn new(gsp: &mut Gsp) -> Result<Self> {
> >         // Create GspStaticConfigInfo sending whatever messages needed to the Gsp.
> >     }
> >     
> >     pub(crate) fn gpu_name(self) -> String {
> >         ...
> >     }    
> >
> >     pub(crate) fn sriov_max_gfid(self) -> u32 {
> >         self.0.sriovMaxGfid
> >     }
> >
> >     pub(crate) fn fb_length(self) -> u64 {
> >        self.0.fb_length
> >     }
> >
> >     pub(crate) fn ats_supported(self> -> bool {
> >         self.0.bAtsSupported != 0
> >     }
> >
> >     // More for every field we need
> >     ...
> > }
> >
> > And Option (2) could look more like this:
> >
> > In commands.rs:
> >
> > pub(crate) struct GspStaticConfigInfo {
> >     pub gpu_name: String,
> >     pub sriov_max_gfid: u32,
> >     pub fb_length: u64,
> >     pub ats_supported: bool,
> > }
> >
> > impl GspStaticConfigInfo {
> >     pub(crate) fn new(gsp: &mut Gsp) -> Result<Self> {
> >         // Create GspStaticConfigInfo sending whatever messages needed to the Gsp.
> >     }
> > }
> 
> To make a fair comparison your Option (2) should include this:
> 
> impl TryFrom<GspStaticConfigInfo_t> for GspStaticConfigInfo {
>   type Error = kernel::Error;
> 
>   fn try_from(value: GspStaticConfigInfo_t) -> Result<Self, Self::Error>
>   {
>     let gpu_name = // extract gpu string from `value`.
>     ...
> 
>     Ok(Self {
>       gpu_name,
>       sriov_max_fgid: value.sriovMaxGid,
>       fb_length: value.fb_length,
>       ats_supported: value.bAtsSupported != 0,
>       // More for every field we need
>     })
>   }
> }
> 
> Because you are not only going to create this type from the `Gsp`, but
> also from a message you have received as per the code.

Hmm. I hadn't thought of TryFrom! I like this idea - but if I'm understanding
your previous comments correctly this would also have to live fw.rs rather than
commands.rs?

> >
> > Peronally I favour option (2) because it is more concise and allows us to
> > split the code up more. It is also more resilient to FW changes as it doesn't
> > depend on the underlying representation at all. However based on your feedback
> > I think you favour option (1) more so I want to make sure I'm understanding
> > it correctly.
> 
> My constraints are that I want the binding types to be opaque and
> abstracted in a way that is portable and makes sense for the higher
> levels. If Option (2) satisfies these constraints (and in the case of
> GspStaticConfigInfo_t I believe it does), then I'm fine with it where is
> makes sense, and for large types with many fields I think we can make
> the case that it does.
> 
> I also think this really only applies to messages received from the GSP,
> as commands NEED to be laid out in-place in the format that the firmware
> expects, so there is little room for using a temporary type where we can
> have an in-place constructor that is just as convenient and will use
> less stack space. Still, in theory we could also use that technique for
> e.g. very complex commands that would benefit from the constructor
> pattern.
> 
> But for messages from the GSP, why not. There is an additional cost to
> consider related to the conversion from one type to the other, and that
> will require extra complexity like an associated type in the
> MessageFromGsp trait, so for very simple messages a wrapper might be a
> better fit, but otherwise, I think it's fair game.

I suppose what I'm looking for (and maybe I've read too much into previous
comments) is a design for how we want to deal with all of this and I was
extrapolating it from the comments on "bindings shall not leak out of fw.rs".

It seems this may be being done in a piece meal manner as we're merging patches,
so maybe it would be helpful to get a design or some guidelines written up here?
