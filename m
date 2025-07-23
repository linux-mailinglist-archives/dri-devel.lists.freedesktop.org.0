Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17594B0E971
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 06:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB0C10E32B;
	Wed, 23 Jul 2025 04:10:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DTfAbcFm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7034410E282;
 Wed, 23 Jul 2025 04:10:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y3xeYct4sJfCe9cHVS7OD/gA4ygh2xT/RVxHEB59DheWpYU7Xsw6xzYzRKKC9X0MSSmJKM/Rh+h7OpufnqXcfCc4yzWxmgUPmhSPAm0SEiEVJF7ev6SD81XVhNsaDYbed4QIBKSS1kZZh3n+Rmogtrj2VXK0CiF5q9emstZCsn4bIq2J7E6efWB8Wn+EudEdR5YoIG1A7lkuc+PakyGJ5DHsosY5jsKNoN94vfmShFarehmPn4VUQea33EF8+R8nIvERi3iXL4CB4qPK4RSDdON+xijB81t2O0NprDJwYs94D+3qmJdRP4wZaEpVHka2jDLIppAtBZZZRSZhsyX0QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGHprAqErLb1PdMrvKX6uDkJ0qnPbrYL1w6RisqPOhk=;
 b=u4aEK8e+yk7nJPMsPqD6cZ5Fd241zW3fcP9VPmQwSZ6vix4z8HZrms7YB2uIB5A4pCoaToWQZdIZUDCSf2YhjLkb596UVg9QzBmiK5vjr6lWmwzlpiJmYGSFyw5MwX1ej2FFyaciW5Nor8fdx0Tb41dBxGYZCeD6JCo3H7RcTLUaUJ0wSKWUI4u+c7VaNFBhbgP2WnLU4DarL6gEGt/8Xojprc9IaPyxG0GZvnot7mRT/SvmQAuod+9ba4LyWPC4hl3W+4+gpA88JfaNOjAd8Y0wxEA+7Va7u6tcZCOAQrvfPZ2YaZ8Hv3kiknj0FTNC3KhMp50zNq78W5MzdVOYCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGHprAqErLb1PdMrvKX6uDkJ0qnPbrYL1w6RisqPOhk=;
 b=DTfAbcFmaiVym7EIi0nNuF6nqelVhWm1FYIcNOd+0j2UNZT4FVcbn2EZpD7d7dvwaD0wfTotC/98TQTAQk6c4tGUvftoyWd/NPpp4/8eCs+sZYe0ncYhhaIEqMTrSwBlRxLoUq5qi4Cy6yU7fY1TDElIBIb3Fw+oHam1TtzKd74go/vfMFy/pOK2a0VGxiRHldLFB+T+L+A/rv6k04j4hkACNWk9XzkWX958sY3bcQlLfNDQwaiy06kTiFv8ogvaAd2Ou3vp+0swsYb038t+3SmYvjAtMhi3hiAIgBWpJQ8P4tOjzQCKSgnvaRgjX7lzLKiUq1tXtM0NnNicBhZ6Kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SJ1PR12MB6243.namprd12.prod.outlook.com (2603:10b6:a03:456::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 04:10:06 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 04:10:06 +0000
Date: Wed, 23 Jul 2025 14:10:01 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Matthew Wilcox <willy@infradead.org>, Yonatan Maman <ymaman@nvidia.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Leon Romanovsky <leon@kernel.org>,
 Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Ben Skeggs <bskeggs@nvidia.com>, 
 Michael Guralnik <michaelgur@nvidia.com>, Or Har-Toov <ohartoov@nvidia.com>, 
 Daisuke Matsuda <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>,
 linux-mm@kvack.org, 
 linux-rdma@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v2 1/5] mm/hmm: HMM API to enable P2P DMA for device
 private pages
Message-ID: <cn7hcxskr5prkc3jnd4vzzeau5weevzumcspzfayeiwdexkkfe@ovvgraqo7svh>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
 <20250718115112.3881129-2-ymaman@nvidia.com>
 <aHpXXKTaqp8FUhmq@casper.infradead.org>
 <20250718144442.GG2206214@ziepe.ca>
 <aH4_QaNtIJMrPqOw@casper.infradead.org>
 <7lvduvov3rvfsgixbkyyinnzz3plpp3szxam46ccgjmh6v5d7q@zoz4k723vs3d>
 <aIBcTpC9Te7YIe4J@ziepe.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIBcTpC9Te7YIe4J@ziepe.ca>
X-ClientProxiedBy: MEVPR01CA0060.ausprd01.prod.outlook.com
 (2603:10c6:220:1fd::12) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SJ1PR12MB6243:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aad5eb1-71db-4158-cab1-08ddc99ece26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OKp/3YVUKkUTdfWJFnbvFIgaJNEb4EGvjBljKzdf/BD0VynQbXwolGZsbaTT?=
 =?us-ascii?Q?X+bxrv+4Cdf1BYgW3+H/RhKdmMTulQGcVmcAEEuVlg6K1cMSLyYHg6DwfdYp?=
 =?us-ascii?Q?lUvw8SvLsADFMzrAnhjtQ+geloFUYKte4CaWGjNJK8sfZEmxf4S8oZwT3vHy?=
 =?us-ascii?Q?YdwKlbAAiTXHyKfogwAE+h+HZp9+2RzeVAwG7mr946Qa3J5snvj067eulLza?=
 =?us-ascii?Q?v2qmuCSKITYDs/nBprGQnHaupOQXAA8qPIyHmb3lRZNsozTY0cMtpdAY48Jb?=
 =?us-ascii?Q?3rFNeOupF9mpTx/gzp4hnmTFWe7nqxhdzXSGWBoMjo8upvPhCE90f6gYtA9M?=
 =?us-ascii?Q?75jdW+O+xlO+ubQhjUVf3OhWfZjgh2dNk/1x5pDXVTXfmHYtJ+DsFs6mEi5i?=
 =?us-ascii?Q?Ge5fWq+rl9e6/IoIpzGm+rL3JvqnpV/nub0Vl635GL/qTnZY1sUpJubUNPf6?=
 =?us-ascii?Q?ztfxCTPpEzObWpeAmfw7h1uI2XSOMxyi1K/V4eHrcfbvvELujbXpDkCoO68V?=
 =?us-ascii?Q?Bdjk4JY8CDqCrBw3IFKXNLzTZhcEO3wP6qzyeFu5/TMy+F3JlPvekTymX+ll?=
 =?us-ascii?Q?yi/rc41zDBlxnZIs+DlSXj5DIbp+dZbszQhiISvxuXDw/0oorna5M/AssLqZ?=
 =?us-ascii?Q?1zBcMl1kPce3sMIpTTxS7bcqXIMUfx1lpTSU6FEvBxovZ2W3mYYKxtkfjep2?=
 =?us-ascii?Q?1pNCPAiVkefFBzmNmvPKxP7dvRn/oVfbvLCt35FRyUlxm2tQArEb11iyroqj?=
 =?us-ascii?Q?wBkP5jq6o3T1Ih4m/wmkUEWiOWQ+LpkVI4Gq8hfpdg5Dcblwy8TGrnSuBUFH?=
 =?us-ascii?Q?Y0yzdAAJH6VqMQvGryTNvUMecZCozpWn4ubmwAdpX7jjWORS7n4OKhhqDzYC?=
 =?us-ascii?Q?XlDOpQn+7j/ykJLSZ9ZrAaOpfuyCKDbZAfXe3QJ93Daxirs4YlNpDL016g5U?=
 =?us-ascii?Q?+xaOqS0+sVVEKH26/SVEfDqSneuxiXW3Zb8wS4CA4Mfdu0dZxXvCaEx8fyAe?=
 =?us-ascii?Q?XdHN5328KMCZu5yC2hfypZHSlN9uqVJdovYGp0yXVt/dA5y8IZETPm9ecYi/?=
 =?us-ascii?Q?KySoitdxdnV9pqKdI0n+JYmrUwJry0kU7E3rXLu5SQDG/ysEzPl4CcggLhKf?=
 =?us-ascii?Q?q18VbdKPSNG6LzrMJbZBq+IuJM4E4L1PtpkBIW0bV8nPLz/okCLnwgauBwQ4?=
 =?us-ascii?Q?yWlGb7CfQkgETNlQrkFTTpe7Sj9hL9Ivn9A5/Mmf7z9kpLexWvprWsumGQCZ?=
 =?us-ascii?Q?4MypGyZyOJCPyTQgV6IrdL3BQTlFZzdU/NQAMPedXW4S4a6gJSj3ymZIw/6H?=
 =?us-ascii?Q?jhLeh8ukmbY/WTp4kfNHkcbTfTGEzH93CT5CyZkWuiFd40ufjpJRvtjE86fG?=
 =?us-ascii?Q?ip8zZfdB3x0sn2JCIByN4m7Hz69hCcMV8E4Upa0fe2ID0UUKhw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yg0ztLYdordK+fxdiviKIWjfg2HGGkJ8GFQq9hf+OYuf97WWgHg2rAikTnpb?=
 =?us-ascii?Q?MIbhJWABqIZJALUg2l/Dtj+mBi4kx0QwDMHfEsIOtA5Looxi3UOAVARKIFB2?=
 =?us-ascii?Q?FpmgzALLS8ncRK4bEqBPdj1UfopUQax4+06Lzuv640Bpi4AHWy41g0GmtVok?=
 =?us-ascii?Q?HxtqQ6kQVI6Q1M6BGsHEdMw25xtTLK90RYwImhRSANMkLEttow6l6huDQuT9?=
 =?us-ascii?Q?5CZK8W/gyTGQQyVhhJCoI/RCMKHDiGo1olGWeQkYQCGEB2YEqnlgX6viHp2U?=
 =?us-ascii?Q?kDZj2OJbaEgh3i3dLoWnbCcyfTXpy1AF6v9RnVDEXGEKXiK/3iRQizTGYZvy?=
 =?us-ascii?Q?NQSSNtvJ8FDakInMm3UpLw4pAT5bC/PoPj17n+4CxzVpdSPHRpmosHtM1laE?=
 =?us-ascii?Q?Z38hzbNwkzHQKXvLMGuvY82HfjRdIAtQcIX0p0t7tnD8KOPI+oKxplvsZdpk?=
 =?us-ascii?Q?kdaVuyCHyT9AUlRrCxTJWJJwk08MSic/HZTgPKpptznlFVLxVFvWg1yXz4tA?=
 =?us-ascii?Q?CoYJllw7wp7dy/dKiZ0PxGHMak8R6c46MfK4H7fBi6/+NSpZT08AiwitCNhu?=
 =?us-ascii?Q?AIYjIoc+EF0IgsmE60JaQMnAEWV6ojomSfc7yO9WoTc0f6D41KSHUdof/8xg?=
 =?us-ascii?Q?qI0cVQuYOLGfqAHyF1WYpAQFH8MDyLNthubHYe3dRdPJXK5DAJYtIYj8YArI?=
 =?us-ascii?Q?dInwesAhS3ErStQQT84HRCyWgs0xSzv+L22zehRiYHEonOqlCkwyxG+xTLAv?=
 =?us-ascii?Q?KRY7t1yOeYB0a3R6KLuqPfJBEmi0XqENTRcJ/Xuf4t0UQ6P8e+C6EILXqiPJ?=
 =?us-ascii?Q?FgvXvQcuffguSjLbonr73CoXgRJRpWQBPWbMGCCmOmsR+tbkjc/T5lc0zjOp?=
 =?us-ascii?Q?/W+kLDpGaxTjhM6ph5mFgyONvIzL0kX6l4XKM5WuxnzhRE5Sr2suSYbMkGmE?=
 =?us-ascii?Q?R27iXklpmguJ4I4xhYHyckVUij/BtqrX1YY7rlNKFmOaaek2a6fS1YLWsnc2?=
 =?us-ascii?Q?eBa8WMAe6Iz59AjtSqNGW/GL3tud/jaujGORvxIpC0tV9YsaEfSb5ZUp0Wv8?=
 =?us-ascii?Q?V6ECTFARXM69q5y5VmzKZuQAvcKvy04z9ZCTmYemnCy8SBcEnbhCehw8B3Wd?=
 =?us-ascii?Q?Ltn2BaosZKKwLUAR3ZpDH4XohdwsgsGyojJaEyg/UHERamKeMAKhoKZvcsXH?=
 =?us-ascii?Q?sbgPXXGe44cc6e1kzXiIJhbWyLqfgYdgk9MBU2zjg45ekuyljhzrMOql2s+t?=
 =?us-ascii?Q?xnb/31Q/U6YGo1NRy5dSBecehZMXOIDt1BHxxge2Q4jo9Zb3gmox7e6+nfvw?=
 =?us-ascii?Q?/MzxjpMWnrMqcyl5FRWcnt6I/K9rRiJOYeoe46mzYdqIOEDeNuz6CC3AYKCh?=
 =?us-ascii?Q?+8c3v8iIZyWT4EanuMitxZdhKd+FE50jReOYUdP5jlVcvYkCMxKU7oBLm27c?=
 =?us-ascii?Q?eYdL4gJNUEtYLdpDTydHBeb7QqTsJaOIICyTyna4q+RnHhWHj1itUo2q9QPQ?=
 =?us-ascii?Q?xpXoZJRsQu04GZfg98deY6JJv+CUHp+37C9f/OEL/ytjO0d1Dx1SQBd5zbzs?=
 =?us-ascii?Q?7cU6ftP41YyOZGz1bgmsC2e0F5jfK+9Xg3rxUsRf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aad5eb1-71db-4158-cab1-08ddc99ece26
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 04:10:05.9467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FG58aM0qfccyhF/Ebw/CKBwyK0LKeJjYPg56CghYLm7xHcZCA7+4k0yo3gGbtZmSrQgd1MIZsjXnpqwbxquEUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6243
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

On Wed, Jul 23, 2025 at 12:51:42AM -0300, Jason Gunthorpe wrote:
> On Tue, Jul 22, 2025 at 10:49:10AM +1000, Alistair Popple wrote:
> > > So what is it?
> > 
> > IMHO a hack, because obviously we shouldn't require real physical addresses for
> > something the CPU can't actually address anyway and this causes real
> > problems
> 
> IMHO what DEVICE PRIVATE really boils down to is a way to have swap
> entries that point to some kind of opaque driver managed memory.
> 
> We have alot of assumptions all over about pfn/phys to page
> relationships so anything that has a struct page also has to come with
> a fake PFN today..

Hmm ... maybe. To get that PFN though we have to come from either a special
swap entry which we already have special cases for, or a struct page (which is
a device private page) which we mostly have to handle specially anyway. I'm not
sure there's too many places that can sensibly handle a fake PFN without somehow
already knowing it is device-private PFN.

> > (eg. it doesn't actually work on anything other than x86_64). There's no reason
> > the "PFN" we store in device-private entries couldn't instead just be an index
> > into some data structure holding pointers to the struct pages. So instead of
> > using pfn_to_page()/page_to_pfn() we would use device_private_index_to_page()
> > and page_to_device_private_index().
> 
> It could work, but any of the pfn conversions would have to be tracked
> down.. Could be troublesome.

I looked at this a while back and I'm reasonably optimistic that this is doable
because we already have to treat these specially everywhere anyway. The proof
will be writing the patches of course.

 - Alistair

> Jason
