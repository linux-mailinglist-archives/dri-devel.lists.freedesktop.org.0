Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0C5BAEF6D
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 03:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E715910E330;
	Wed,  1 Oct 2025 01:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZAjoNTj9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010003.outbound.protection.outlook.com
 [40.93.198.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE0610E2E8;
 Wed,  1 Oct 2025 01:42:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DcKlm3QQn6IqnPAha6neDjtakx/h/8o5M3uQtnAtWYNJfM/y9oLA50NLSfpjrJoqwEY9xoi95PCdATokNEmVXMghd2vSwuGfCOKyCQ86LWBTS6vgzd1P+haJuS8hCk2xIB9fSi1hzAcwY44qNuaD45TE6Hnrxyc8LtkPLZm6dDTz4pLRf1zdt3rKBJni6prBqEiZ5JUFjVSgYk3ncBCNFVqYDVz4T5u9czOuNDKNm1pufRsFAbpCgFRJUcml4OVbrll3LBa8YyEEzkI7+jR45z1t7uAfjFechG23RBi4960IlvA2x6GylohjreOsPTASWkM3A7zfnB0tpfymz+lYcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6NJf6GsvDyuxMBrLKNCabUa3Km1kkYWqB2W1PAvV2U=;
 b=Eh3Ea9UdShYeI1I9Srf9yY1sCRLQ2evP596CvZ7UdfFM6SfNIbmClAn1sdSBd5WqBQaqWcJXpfPnoLUyq1eTWgZrb2mIxt6PfbSPCaTpxSE4Ylg7iSVY1PxTKBUM+07yv8mX5CFV74VCgx5E+kkDm3L6ZQZSp1Te00kF1f77p197De0RBI6GS7SjGeBqye8ixYChLvrg1FGV7PQsVx3t6ZuDJ93B79cw9J8r2eQIMeFTdi5ReJfIjeUByWqDMyKk9JaYnSORKYgw4Edp/+qDqzQ4Z/N37ujREfGTZBd/2twfH6NVcfCnzlff4qTorEoKt1PJFnQ9rv1puF5b1zN5Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6NJf6GsvDyuxMBrLKNCabUa3Km1kkYWqB2W1PAvV2U=;
 b=ZAjoNTj92WCypPzYi9rjU2Ljz2H2GcfQEytVLgdbQUzrE9iXbF/jueDhOtqF/4j6QGaZf2UaM6fjVCJEaoVQPDvmfAJAedwAiETbkynlWREaF0u/onaYyfe6yK+4Lperz0DhMqa8F8/Wd/bviiEYTLNiIwsB7A+3CjVnbM+osxSdv7CrGTFhr72sVkPty+ly/Yp3HjUFLhyAVNMRI4CHrMJFSD9EzsiI6jxjsM47X2kmM4Y0+4nReMo6/YhVBu1HSYH+vfP1RpmMNRj5m9Ww7e9p3zLJFe43lq+TnvVOvIvV+HIUHLZtgwHSL2Lek0eemI2tDKIzmcAVV95RwzVnoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CY8PR12MB7436.namprd12.prod.outlook.com (2603:10b6:930:50::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.17; Wed, 1 Oct 2025 01:42:44 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 01:42:44 +0000
Date: Wed, 1 Oct 2025 11:42:39 +1000
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
Subject: Re: [PATCH v3 01/13] gpu: nova-core: Set correct DMA mask
Message-ID: <ljesevy2hkryskvrtjtjzubybzc2o35wdrz6tgsodc6ljiv27j@mvyi6gqiryvz>
References: <20250930131648.411720-1-apopple@nvidia.com>
 <20250930131648.411720-2-apopple@nvidia.com>
 <94bbd268-efbe-4ff6-ba09-e6254709d981@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94bbd268-efbe-4ff6-ba09-e6254709d981@kernel.org>
X-ClientProxiedBy: SY5P282CA0176.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:249::12) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CY8PR12MB7436:EE_
X-MS-Office365-Filtering-Correlation-Id: d7263bcd-fb3e-4042-8961-08de008bd0e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8jovgnDCjtouh7IyDREr5OTTweww+6gTzLp84SolljS44o5bgHDBH34vwlo9?=
 =?us-ascii?Q?idb0gdRFJ81dXM5HmJCDyRfoHm3iaPxIHbVv3K2tEk9r9As3T7aSb2TMn0EK?=
 =?us-ascii?Q?Pl/l7RqkXS6wlhplePLIljQeFHgeJCgdYHQasPQ12rMSEUxngbm2IRRtwcjg?=
 =?us-ascii?Q?TroDbJUZyEYCQjxbkycbI1zOjWhhBuodL7kHGgyrJtk1qJGUCAJt6VNW4MRu?=
 =?us-ascii?Q?rkxEeP920axdmEWMUV4ViFJ/VSKAiTUSESRAzN7d6GFx7V8eGWwMRfDwr+wz?=
 =?us-ascii?Q?KlS+O1rCMiQhoUO64HIo2Qnw/P5pxlYBNGXQGiUuhWlc2nFihXLHVZrV+Woh?=
 =?us-ascii?Q?U7UY4wjhv9u0IbDPOAKaNSmUGf/pdsHo+1dVXv6o223dPpPBdTt0UBajeifq?=
 =?us-ascii?Q?Bltab0DL4hcYcNVCOAk6VdE3P8I8x0rzRO5HfcKC0uFjFSqntw78M0z7Ip0w?=
 =?us-ascii?Q?+fZ54KPu0T6gwX5eSTdor22l7VMnBNeYOjqlKcga99UV2wp5blemznHQorbe?=
 =?us-ascii?Q?dhrQZBb2XXWxKj/JVAjqyfiWBllQUdsRxWvJYW+wiVTE0XYVSd/mdFz5p0hz?=
 =?us-ascii?Q?mQ2ccRxRSDsBr+vzYPmvrSl/+w1iTRkgMNbbANhIfzAS/2cTAw6ujm9k5bcQ?=
 =?us-ascii?Q?z36w6GFKLtfpa2iX1QHXhqieqNUYXgc3sdeFeHVRa+JAykW9sOJmUiD1UxBZ?=
 =?us-ascii?Q?HbywLLRJSwEfPaypAsXm+/hEBAxujBTtoeE/weddUCn3YwnbMVDN2zaw5bJf?=
 =?us-ascii?Q?QKcinh7xoGVufrqZYsjNv1OKTPmB9RcY3mLD9x7wcw1e+9H83J03Yu8ZLdnK?=
 =?us-ascii?Q?psevjIWC3xUcfcKBjPSBOgnpQfOILkXUBYx6RHTlZFEFa8CQQlqSl8VheXXp?=
 =?us-ascii?Q?k+hKIiYKniNrX1l2AJU0daFrvMewtGbOafm12vrg6vKlPclRkvP1a+70U5+r?=
 =?us-ascii?Q?3aF6zwCdOipuEN729Wr1+fraMClCWxditBYiK4KQVPtCMv4Fcmcum7e2QHBA?=
 =?us-ascii?Q?/hL3OZonjU8If2VROVv1sUB0HsHr9BkozxiNOHVZJVNyE/kRav4V2rD4TuqY?=
 =?us-ascii?Q?41+FazuYHduyEXcqg78YeVgNXwPp5u6Ok2/R6OIZ3q99rvf1NTJSaiNhoxn0?=
 =?us-ascii?Q?/M6mUvf9vkuF5V6k7RmO4Q8Hcy5CG2aNNFFeDDBx0rH+zTmMyK2OYeXLNyWJ?=
 =?us-ascii?Q?lgBLFaVEnapvSbIhqNgpt+/J7NVBBt8i1T65K/6J1G5EV0cIY43gfKsHuDHV?=
 =?us-ascii?Q?nsjT83F1VCjWr+E0Papl4czMkiqQkODbH965YnslnxF9xWlQ/gGN2XHYMu9z?=
 =?us-ascii?Q?9tECm2pcCXsSCvIgsLtSZkgTGmo/xCSRcIwOn1mu+EYv2NzZH7Y09zQMhRoY?=
 =?us-ascii?Q?sMFCcxJDiUdSSjQuxDuI5/FaJq5qcxr/OKaEJLo9oAPeeh1lhJ1Sht2GSZQW?=
 =?us-ascii?Q?r+tOUx6P5B/r2KhrHEnAL+E/U1DUyfyh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SXuVDBc6INnCUMMlewn5Alx4pTj9LbRqmaj6inYAwAAwPqhCfZtdN62gMGqM?=
 =?us-ascii?Q?RJjOYtzlh9HbgEx4FsCeKMMD99QLt+/+Kvq+z5QkxWgSRX71kqdefsDVKeK/?=
 =?us-ascii?Q?+2NS8RR46vb6HjK8Ipfatg5qxAKQF6S8DjTzrOLAlp/WF74dBtHkjMVtmTm/?=
 =?us-ascii?Q?lOrsT1FLxuedl94bUz1rxdfuJw72NsF1hbs1VluW3wmwX6Pq+rRtdviBwwlS?=
 =?us-ascii?Q?jYeG228fp6vVKZKfTJNrE0NxB+1SMvHrLil4cVA3KGzVitHYzz3AAt8LaiKW?=
 =?us-ascii?Q?0b3O+mWoliXwLlopWd92F2MySmR4pjXk90nj8qGjk/PnaYWZpIanlQJ5vO1p?=
 =?us-ascii?Q?YwdZyfQxPFTQ1ajAG79hlxzoOedIEH8C5qHzQu5C4oN35pbU1X0DZdBN7cix?=
 =?us-ascii?Q?tN5zh40vm5GpiMnEgU4xo9Kr6kh9zXIh/BHc8ReYPXEabIdKD4LPLvR3Se4y?=
 =?us-ascii?Q?ETCkvKR0WyGYNp2w6kT0iXlN9SPz8ZWcHqoG3pqICGy5cTpQnWNrUiBptKeU?=
 =?us-ascii?Q?ncZ/JjRKXd1ARXF6cw+UHRjAjWoXGS3aMYbs+Xr1Kn5GvYZQd8+hb8E8g2U0?=
 =?us-ascii?Q?uT5f5yIG+90RY+3+ubQqQ2wpEpuofb6m7JVOdjHc4BLdon70J0nK88VCrCfN?=
 =?us-ascii?Q?h2BA5eNmjUnzqZxRo1g/lIdyDlE6eqlRr3bvPFc1h+Zx7NF9aMYdNi8y4+KO?=
 =?us-ascii?Q?bVQkZN51prdPYMKC4EYMKSz40rKzCs+8hfaksZ0frMaABtAzrlaEuoDUN11H?=
 =?us-ascii?Q?FuMicZP8gry0lDMJAeRhR+W3NKN8AstzBKGesDxOeBF4hJH8q8px9G/YShy6?=
 =?us-ascii?Q?9FUh5ss+0raeLKco0wOMzVu/0C6E38a/3skSYRX3f3tbYkxcWuEvSUo2T1eL?=
 =?us-ascii?Q?eJtMx8l/FZXSQJnYKjuE4NraD3LoAzleGIrcFWxICAHxfi7WK6nyxWjXDskz?=
 =?us-ascii?Q?cbt8VkvS8k5UuZvyKhAGtceRI2BIYUIMjmASz5FceAkeN57mgjBfAij4fMnh?=
 =?us-ascii?Q?AuiIQQbkO3Mz5d2gSUh2klJvgjO7vuOj1dVjDAtQSE1AwmL+qO0/FpZej8D9?=
 =?us-ascii?Q?KGX6M2HxnilhBXcUP46qo7M11jZ47tc7OmzGAbg4tELi6QM34Q1rVYOMsAO5?=
 =?us-ascii?Q?l+pProXZaqEeC6LjLZVuwE/H5V2tAQPaU5RzaIlia22eiqxFCM1lOJcOc8Jz?=
 =?us-ascii?Q?6NX3zltRKNdhsWvj1uTUsEYNT2VFdQjFagISvdtCW5y1i7AFYZ1KdcVQuMJE?=
 =?us-ascii?Q?N+QtjlsUA2UCPcKjHZj2zAdM+yy6Vyxzuk4EaeBRNQMz89w8SNubV1Gb/tO+?=
 =?us-ascii?Q?rZgcjaEDypXSu4uEjLcvk5AI9qevCjIEV1kZ4hc1HCs1u2xVEihynceqYyOt?=
 =?us-ascii?Q?uRKlJeNfQ4FxoMIOEZOL8ePs7a0rcKDUna7QsrYFQjM1C7rYqKXTazaW9eQn?=
 =?us-ascii?Q?Yapt0iqWIYI3RP4NdtfRfy3xid1By8x0hTE/nuWWpkC3qf0huW3877f0SrRf?=
 =?us-ascii?Q?uYMITN+eiiqhGCxHJ6KNMB/RwMpRsMoQq8hCI/ozBxyaTxm89KIv0n1fVxy5?=
 =?us-ascii?Q?kVoSP02/15dDtiB2gcAv8shrAbvKBPmy2aWyQfJh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7263bcd-fb3e-4042-8961-08de008bd0e5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 01:42:44.1012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iMi2/lYtzRdiB1SS/mXOkDeDjJOMG5ByB5ykY+JWD/uP+LWHtYtOXe6B9cJBJrRu6euPiIwH4usMXezmsiZc7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7436
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

On 2025-09-30 at 23:29 +1000, Danilo Krummrich <dakr@kernel.org> wrote...
> On 9/30/25 3:16 PM, Alistair Popple wrote:
> > +        // SAFETY: No DMA allocations have been made yet
> > +        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<47>())? };
> 
> I think you forgot to derive the value from the relevant sources, i.e. physical
> bus, DMA controller and MMU capabilities.
> 
> I assume not all GPU architectures / generations have the exact same capabilities?

Right. Long term we need a HAL for this, and I believe John was going to look
at that. In the short term everything we care about supports the same 47-bit
address width. And when I say "everything" I mean Turing and Ampere, although
I'm pretty sure 47-bits goes back to at least Pascal.

Newer GPU architectures (Hopper+) support greater widths (52-bits), but there's
no real impact to constraining these for now until a proper HAL is in place.

And that sounds like an excellent addition that I should make to the commit
logs and/or the comment on the constant definition, which fell off my radar when
reworking the rest of this series but will fix for v4.
