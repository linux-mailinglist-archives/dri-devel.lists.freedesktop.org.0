Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD31B1860E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 18:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5521810E2EF;
	Fri,  1 Aug 2025 16:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OWyLJg6D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2053.outbound.protection.outlook.com [40.107.96.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CB010E2EF;
 Fri,  1 Aug 2025 16:53:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wwcWz6n0SZ/1Mya0UBbErLGJmLD1B0VqJ/OzeWfqzh/QlCffqsphn5/dkG3D/Pt4NAZBZE+Drr5cF9HJteeETDe2i9gMpyzC6Z+9VsNrSemEEdmEMEjwWxqdC/Ndsy/vxDNPY/JrXPGbmUk8ULUMlMmhxOEX9Nu/z/pmzlfdyBPnerNIjt1vN6AieS0Yp6tCwxVHPYD0kJ/3YaX5uSHtziBKnw00PplpVuZZWGaY3mSnwIOIBDwM3UAE7OHqzNTHKGD6gJ6jCPLCp/VXzPyKZKk8sGImt1VO0T1SiPNMF5IgrIU2B1rx9VySlN4cWoqopyTEPBCOV03kGK/srd46Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTzqg5kpTfnmlZ/+wFgnQFBqph6h0Rma6qUhiO9piIU=;
 b=eaiI4xJpttIW0+S8IoyLn0E5ry8rmw34LdeeEAjUrkJI9eHbo9jkGfgTlJodJhbNFhwTj7maL6lZzMmM+4eZ4J19Sf1Uug/40crVuyltjL/O/mNOBG8RSOz0qlWljJDZvFW1wgzcEYN0+BJw8U4VHw+xSWsPKu2QZjLT7LV/yk4qh0yAdhUzhjKfq/+xFBg8wKt7t4O9dtGyTEWA2x6XRpmyEDRkgmpAH9Mfmot+Xh3n3RVCxlkrDkx78y4SeAoYWOpEwW1BBQptUfD71F6TrplTzDVT1/qwfGM9qEJQjoWAF3GBQotRVPTt4KePMrjBnDjEgeYirSGimf4nnxGlVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTzqg5kpTfnmlZ/+wFgnQFBqph6h0Rma6qUhiO9piIU=;
 b=OWyLJg6DvP5pToRFtoQM0374PzrAf32ssKUO48oRX+hmVnp5C6lafVr+MG0z3vuZcd9a5nEOCKf8FJSTDjmDh7yCw8MiF6TyQpQwF9DgdViiKKTxgVU7N5+e/pYXLQrBThBfHHBcyNJXYqz+jfozEeD1bJu5c2e0zJ1KRrxl3lVW1Mvjbv6r7Y1OhC+lsMa7X8LnW29SbWpb/Q5p1xdyeABFDDUXbTxf1zGGpdqNUmuH4fi8RFuREiHznSLT/iJdyEomLDAoxSP8b/aQQrCwcXcxGEsI7ZC5m6ejlTQaaFaXcVHkvPDUpPGXHfMijA+b+FE0WCiAHvbz5cCKvTGG4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by BN5PR12MB9537.namprd12.prod.outlook.com (2603:10b6:408:2a9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 16:53:01 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8989.011; Fri, 1 Aug 2025
 16:53:01 +0000
Date: Fri, 1 Aug 2025 13:52:59 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Yonatan Maman <ymaman@nvidia.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Leon Romanovsky <leon@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple <apopple@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Michael Guralnik <michaelgur@nvidia.com>,
 Or Har-Toov <ohartoov@nvidia.com>,
 Daisuke Matsuda <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>,
 linux-mm@kvack.org, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v2 1/5] mm/hmm: HMM API to enable P2P DMA for device
 private pages
Message-ID: <20250801165259.GA250572@nvidia.com>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
 <20250718115112.3881129-2-ymaman@nvidia.com>
 <aH3lPnIUGn29HJFo@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aH3lPnIUGn29HJFo@infradead.org>
X-ClientProxiedBy: YT4PR01CA0297.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::22) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|BN5PR12MB9537:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ec2be63-5c5e-4690-81f0-08ddd11be016
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MsQuxU/E3leQ0iRphRpUFYVhwzrkwsZKF8OdSsVProdTXJNfUgGdr5QIMuD4?=
 =?us-ascii?Q?Z/xHGs54G8UvmMwSNmKOP+JCoqo8m0pQW/QPh7wO6GId6vYwYaLwFWxJ4Ri8?=
 =?us-ascii?Q?jQ+Ujn5SA8+K9IJvCygwHYa+D3Dn1XaV2TYcQpITT2GiZ7kogvV/3HDiwHh7?=
 =?us-ascii?Q?x6QcMRU3KBUO4SCth2GbX9VXnlidB0woM1f4+ZwghtPXJmtFv4W4IvQRnxTZ?=
 =?us-ascii?Q?ehoYLzjzwfbF9ZscB76FoqFcE5nWWEwrh3LIO9BxkSYn2OsnVpdZmwfW2kuN?=
 =?us-ascii?Q?YSmu8PsZZnZK6aABjNcLohGKU/Uz1XbhvRqC7xwIii2fAOKTtxM1PcoO6Exh?=
 =?us-ascii?Q?OJ3Y7/fFfvevludd5iszvPZhKJPbw48Q2eUiKImHTPIPxUJL2rrrRxDNfohM?=
 =?us-ascii?Q?d9upU7Cfv9On4DhOqg1dVPnCSe11qhpEcoRVtKMyWuZlR5g3PxQCPjLfaVVl?=
 =?us-ascii?Q?cS8D5rqjZ2tNYnAVWmgA6nVwNe58SWdMJcrUpbhQ+9qCUNehq8ISQprU1k/A?=
 =?us-ascii?Q?bReJzwTlpGMAEaQAvg8HAFSGgAUAeprBjheVoB2tXU9ekKh3qGPGXC3UBCAK?=
 =?us-ascii?Q?CoVV+IqRu2Aky+DCHG2SRFwqHGj3PYmzgkvJFt36Gkxx0bgkZfAQ1GKoCpVO?=
 =?us-ascii?Q?B315jv4mOtkBbUjm+xIx/+nnfos+GkPzpejyPCbqmexhYPwo8spXhBqWmJsP?=
 =?us-ascii?Q?qkQoV+5WDC5M9pc4dbzYOZjfJZWu/4SNb15uQJYX+I8WlHji+0qHgh+QIwte?=
 =?us-ascii?Q?0d2mSsm0eaIfCFQgQEi7Sw1Z4In+rNT844rmIuQ2wZe/PWKxVSqK4V9ji3PV?=
 =?us-ascii?Q?ZIKndUnd/m84b6udm3ggB8e4orBc7Awi8gB5VfJPvQaBumBelSSin9RP8lwO?=
 =?us-ascii?Q?MUXT5wqtNLC2IU8BsBUIuWk9rjdZ8TwbPJhyLRHdHYWAQKV5oRhgpg942GEA?=
 =?us-ascii?Q?O5cFvzIdyfKC7dvVmup1QuVq1hR7fG+y5zSjUcXdOKeGx7a6R6ZE0E53zzCw?=
 =?us-ascii?Q?jww6V8uKWZMvcVoCSoBGaITcFiGS4gVSaVeAD7gFs/0VdBpZhNJ4uFlwiwlu?=
 =?us-ascii?Q?48Ay6UEdG5YMluxDSgahR4ypfX879bTgVMJXa+dBQe8iJeT7DsqIdbWsTmgT?=
 =?us-ascii?Q?tioqTIIZR4AlkgBNaHt0nmTWfy84vmTfuneWd1g+IM+WLv2/jK4D9Oi1mD/8?=
 =?us-ascii?Q?QKUt6CM39RWq60rXnTeqZmqcHXJ+hPO0WEyBWQUPkZE9fRCOJD+upTrZz53v?=
 =?us-ascii?Q?FOsPV00myi+Y9eVoXmlLSnVgy3vgwtr8uRsu7uKDfUUNDXoCyYg5Rvl69Yc8?=
 =?us-ascii?Q?0gPGXuvplXlxzZ2/AmuPeV/qnbzSWtJuNj8njqSGZsjNO4xua89YX0cFyYHg?=
 =?us-ascii?Q?vfAOXQ19peJVDGzkkZf6+a+maLew+isvtRD2Ass9VoUoU1OIdwfH4tD5rZEn?=
 =?us-ascii?Q?Pf04Ir20sGI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gaPTtiW+oyviLR1zUB1/Otw2vZUdQKcnGsw3j+GBhN8HuewTZqRb/ov/P2S0?=
 =?us-ascii?Q?vz8x1JOWdX/Ktotavb9puOT9xRTqjo4MF25fvdZgS8UKmHdGulxhW0KuALz8?=
 =?us-ascii?Q?yo9iOS1bc185TThx4fiKdAPRFWVs0FllRBkUct3uLKdCj+qmY+MLdthhJxgc?=
 =?us-ascii?Q?zVfd8+W3d1VHA87e9p0BQ/w5o0Pe9fKXTPvjNpZA42Fl61p5ylXHIiVQ92TE?=
 =?us-ascii?Q?EOWabhN3dDKoR77MJhbhMklRRSxT2+2h0KyNd9+2aNsXunTwF9GIdiQTsAyF?=
 =?us-ascii?Q?5wlm7TxkSYHsQQXnupHbdcKpkQDFpzZSdfrxH103CMsnWx4igQnu78dlXYe3?=
 =?us-ascii?Q?t/lAgtAbvHgcPEHj58KthSDgDJE+x3qkFfuXz+lj+16NcDTTgc2RiOkGlzPT?=
 =?us-ascii?Q?+gfbXGu7bZokuKGQAteA3uGJ9SuJoTYZe9h1326yAVvHBc5JAVSIhN33eRt1?=
 =?us-ascii?Q?XgVxXI0O++kBXjDfuvSG/c411MjbRH5FiLlYbt5rAjGZHOaTJF2bamF0V8eG?=
 =?us-ascii?Q?HlZkRyw3J6dI1HFxf0v25hKFMbkoZohEPflK6NY5CQAJFs8a+ycSAuB8bTRK?=
 =?us-ascii?Q?Npu+2PQovhwy09hsrpHLPdIamcYW+f+se69GFZ52PEKj6l16adCWb5UhyIbO?=
 =?us-ascii?Q?L+IThhqaX+k65mB45qPOic9c3dvSk9Z1et9/k8QB40zsjXnW93C+yjYqUM6f?=
 =?us-ascii?Q?WTScHu1XpTI322Ggm3iDwH1GoxsLPW3uaBng+y1uh63eloBq/CF75fJ9iPYh?=
 =?us-ascii?Q?Ldhl42i4XfaurZ78x8PBVeA/mMRpDdMr5Zz1+50/3lIC9X6B2gKNJXThdRsQ?=
 =?us-ascii?Q?E+y6HoiOyXmgTWUoIlCregBlfqoll/mxqtrIt78q5b9mp/V/h28wAWRqgKEc?=
 =?us-ascii?Q?RKVlc77GDsns/zZC2SKwDvpRXUAvFOfhGHfDUez4D4gRc6p+MQg8etWK2fGP?=
 =?us-ascii?Q?dEFjT7H1JxsgUygNdNlUkNVg0Lwh40dOrU0Kj/baL4OfVscDAEBPtG+wYMxQ?=
 =?us-ascii?Q?qVWgwEUkpHJdV+rQA1zFKzylT/p4Cx1diIFGMRB7KuLYJlGpnwITNBBjeRgf?=
 =?us-ascii?Q?df1q0u2LBb8whGnoz8iMkWBe01n6VjuWe2EvRrk2BDzcnkWIF8saI+1g3+eH?=
 =?us-ascii?Q?uL5/jQ1PVrzcTFppu5NtKDpOII6Q2FOS1NeKSFtT7b/bdk1mFW/jZmSZvtJJ?=
 =?us-ascii?Q?P9kaLOq93IWFkYfZB01VDhxAp6My+1fVUDeihIRnuJywnEr3uQImF2DLEX3N?=
 =?us-ascii?Q?Bm9bwEGG1K/PcldSlpcijjFEdf40zIef1dEMn2hCWp96ZBuEcaCue77TmYd/?=
 =?us-ascii?Q?Gbu2iBp+/xkyq37Jr2Tlvn/3pK8N8jyLIh/Nm2LL7EejRYVGfi+8QcURGs6K?=
 =?us-ascii?Q?IxPdND22vk7R7noRW37WHYuQJ0c9c4KaHZRjloRCmbG1ZT3w/OOsWSjTeCed?=
 =?us-ascii?Q?lzCffg1WKA5fcRnoE5uYdBgA5wvCyl3c7qfzoqJmagOb60YembCwUOQCpuwh?=
 =?us-ascii?Q?2nwmcPSlgiNeC/TTrZb4fU5twLyL1+NDKWutAKJR7b6NN7nH3GGsPghKzOQR?=
 =?us-ascii?Q?IZ5AuAuNh1UpBPSEnM0=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ec2be63-5c5e-4690-81f0-08ddd11be016
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 16:53:01.3084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yKSKe0QGMrF7tsKhbuPfh2J4t9Kqcj0OgyCKDDZJXZn3RToQthrTx7KMEuuGQYsH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9537
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

On Sun, Jul 20, 2025 at 11:59:10PM -0700, Christoph Hellwig wrote:
> > +	/*
> > +	 * Don't fault in device private pages owned by the caller,
> > +	 * just report the PFN.
> > +	 */
> > +	if (pgmap->owner == range->dev_private_owner) {
> > +		*hmm_pfn = swp_offset_pfn(entry);
> > +		goto found;
> 
> This is dangerous because it mixes actual DMAable alias PFNs with the
> device private fake PFNs.  Maybe your hardware / driver can handle
> it, but just leaking this out is not a good idea.

For better or worse that is how the hmm API works today.

Recall the result is an array of unsigned long with a pfn and flags:

enum hmm_pfn_flags {
	/* Output fields and flags */
	HMM_PFN_VALID = 1UL << (BITS_PER_LONG - 1),
	HMM_PFN_WRITE = 1UL << (BITS_PER_LONG - 2),
	HMM_PFN_ERROR = 1UL << (BITS_PER_LONG - 3),

The only promise is that every pfn has a struct page behind it.

If the caller specifies dev_private_owner then it must also look into
the struct page of every returned pfn to see if it is device private
or not.

hmm_dma_map_pfn() already unconditionally calls pci_p2pdma_state()
which checks for P2P struct pages.

It does sound like a good improvement to return the type of the pfn
(normal, p2p, private) in the flags bits as well to optimize away
these extra struct page lookups.

But this is a different project..

Jason
