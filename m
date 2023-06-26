Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8AE73DFE3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 14:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5DE10E1FA;
	Mon, 26 Jun 2023 12:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DA210E1F9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 12:57:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0oFp2IqITbFvNo7byY9BXfLIQSrNBoHKmYJk8lvbnTxDnwhjFOuKLro7e4yMCmd8f+TtzkUl5pTrKDX/tEUty+KxD/lXlJvNb5ca1u9xJBKPi22gSwJ2rQmb5eg8K/D5lhsqnGKXZshJE6qIxHlaOfGNCu5kzdwIhKYr1P4tIlLo4u9H0tfdK05Wlb7AAKt9RsiGZpwXiYTqT82TAVqsM/l7288t3kmTzPNzqqwuqsDv2OQsWGaoWGmxIGN8JKjp7yz78juv89sv1RNivdk9gYIA/C1zm3TbBt1/KOYXjDc8J1VI0iw6V8xaJQf2ekR57fomvBn1itmmdPwq+OP/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xqAmZxJHxAvUbNQArnCyQ4z1URUUUD3i7Q+7BOCQi0=;
 b=i7pJiITl0faQMLKD6fjuA28EUwHWjymONhpmz0zk6nSS6JNGN2XCHg18kIJtDwS/Cw0ChmH5bh5yzSICCW9zw4tMMsE6C6/sp5xV2jPBSLbCBfLfth1zRDMDx+gAJuuUrX5FcSTqY5A0DPND0SZgWnQMknEGWuQh+CGS6Psx2tQtJ0aG4VngGERWKekEr81SdJYDBihswodiYmGDsgWJzFWOICsTb+Hj321/J+D9vVkWih46WowPY4gaV/w5NR1FMcP3dXEYGXtNkBW1eRL1AyPp5pY8xar+9fv0pT0rMR308ugJ2LObRB5IOK708mxQhw+EGETezJ8kkq88oJu2Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xqAmZxJHxAvUbNQArnCyQ4z1URUUUD3i7Q+7BOCQi0=;
 b=Ahlfg9aFpEGVMpQhVQSJuZrZAoP4lmecGEco0DrEy6WORvp0LS4SS53P/FK30nwh7STxHrdLAqo2ZKHfRxTcq2xpml5R5H686IAGFE/IJVhk1L+8Tv8q3UlofBhcUxq3GWx+D/okvdFE5rixD5UsXs+A/5VzAgs0apuhMiSrgNvfaTtbvSxI8g0NSu5g+UdR25cte55WCwS7VZhD2953qYQBKZ07R/kl0JtSmFaAbAKfx1e29ZzubyTMacV7eLLxdM/Tsx6Beg/y24HaX/JcfR6F7YtD60nQ6mPIbnQ1fm6alHAOABhZ5u1qQqrGxWWeQQeypxDHI3nUe+dfCcmfvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH3PR12MB8728.namprd12.prod.outlook.com (2603:10b6:610:171::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 12:57:30 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 12:57:30 +0000
Date: Mon, 26 Jun 2023 09:57:29 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1 0/2] udmabuf: Add back support for mapping hugetlb pages
Message-ID: <ZJmLOTEg0WQF0VCk@nvidia.com>
References: <20230622072710.3707315-1-vivek.kasireddy@intel.com>
 <6e429fbc-e0e6-53c0-c545-2e2cbbe757de@redhat.com>
 <IA0PR11MB718510999F2C0E2B70914E2AF823A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZJXJ4ULRKVN5JPyv@x1n> <ZJXKZkxDKYxaJI/1@nvidia.com>
 <ZJXWOCwcms1DjN8w@x1n>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJXWOCwcms1DjN8w@x1n>
X-ClientProxiedBy: MN2PR17CA0008.namprd17.prod.outlook.com
 (2603:10b6:208:15e::21) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH3PR12MB8728:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5c6e95-0696-4c0a-d5f4-08db7644e68f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KFI5sRVuMS52Wz+jX5o12ky1ZqrA1FOGwDQx1RlzWkY0nUD3FLzhD+3PsBzxtb/3MqjbqzVchgYB6DR3RxTlw71fCo4QXPXuG59N3mjMEhF4sQ+XM5ToGI30wcq5aQlvOTZ9uodJkQ9JtTjX0veAWy5A6mm8WZv3J4GCqSgekzaa54anPMskBeuJfnaG6xLBxuuyZ2kiEu6UehmladaOBfH84yBcUyQZgt+BkFztsUEFoz6z0jl+hxuoYJzvg3dIaYnZTdqLZkf3DZh4/hQKQ3r0gD0tE0sAx1gILY+cLTyKVWtviQx/HYL/2MO0xIMTf6p9ajtQpas3I5OM3dcKkMqUpHfSL9iKlvs1VemmQtATVUVTk1vabkKKZHmi10LnWjKOwzTzpAjXqXXpr+zQ5gNDLtOte0ZvjsAVvBIRpl8h5klNGPDLqMx2UnuMilQUulDmaFQU4A+Wqh2mK5oCdv5eK7+DmclMoGUxX9jZG+0WUdGldNemzCRvlD5AwcwWqcNIBm6s16dGVaqiyfKdl/D5Uco7Dy/NLAdXABSqd27gCqBlxg3JYp+HLc0LzCuDlYaEHL/x1C+Bo9/OmZ8tOYw+fRIVrjN5bxpf6KSZZ/E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(451199021)(966005)(6486002)(478600001)(54906003)(107886003)(2906002)(6512007)(26005)(186003)(4744005)(6506007)(66476007)(66556008)(66946007)(7416002)(316002)(8676002)(41300700001)(5660300002)(8936002)(38100700002)(36756003)(6916009)(4326008)(86362001)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QaSSFl8sLiPv1EyUggqb9zn/AwSQmJTTfVj7da4X7Ibb4L1hRtyfq8+O/fn1?=
 =?us-ascii?Q?9vaSKqRkGl6afHndTvbe+6m0jx4e4cqGeAY+uM6u5wRTYF0MHAN/omk2Y3eD?=
 =?us-ascii?Q?m75YjN/5MkofoWuGoo1aHsOa9uCV5ja1U6UTqiEYNA8VzgVx54yFHOPmTvbq?=
 =?us-ascii?Q?zMrFRpW5/mW/FjwAT/MD4X02Z/Zw7hMNGz2Bob3zUiTwZVB4DqXtrt5Ahskn?=
 =?us-ascii?Q?VV7zsUP+aEOP6mFab2QQVlOFqrhAx5lQ7+F04WsM1AWhLPLbrxAEewRqLPU8?=
 =?us-ascii?Q?TZTq1oAb6kOXOit/pmhFOAFlEKE72l3DsOVtQxS+PPH2+vunzIkUKd8Qd5Es?=
 =?us-ascii?Q?pcRpF+P8bK4+SM0XCRwWiEsnArGmz9ykaeXQ4rvhuMVPnwOroFXIu0co8105?=
 =?us-ascii?Q?fvhvz7U/ACfldt1FZJ5/gpfabC/8GbIa0VMucqk4IbGaabIAm1lAHMAnJeLr?=
 =?us-ascii?Q?t6IfrvSHX3FkfhFuOwNT4NhD6D3geqlKG6pJ6A+DlUu958QG7c2RIX37PFTV?=
 =?us-ascii?Q?S/2Ho+kCT8eUM17HHKkyUgvf6vrM2rTNxZ5IqysdFEtjUXUwq5bP0imsLJXF?=
 =?us-ascii?Q?BfQ5jPhTjNACv7hWUg1b7sj7Ct8CZDiAJ7vac1+yKueQOSKCO5qmAtavUxsf?=
 =?us-ascii?Q?6HHjiIBa0Ohtn159oiXeelHKH1AoqH9JmywY4qwLtxpxPA3upgkWRxFe2LVT?=
 =?us-ascii?Q?AXa7nf6e/+LZJfDtJYxboo6sxKr6S8S4Yc27smbOrty+etkJqltBaWdjjgC0?=
 =?us-ascii?Q?yVWj6pLxIVumrKJr7ho08b3YzDN8kcngLQU56BMrAFWHgotSt9GrXheY953p?=
 =?us-ascii?Q?AJ+/1SLgnKUw/QSRAwwBhRRv8C2UbC807C2oVQE4wH7r57/0x2SThP3hBf/q?=
 =?us-ascii?Q?pm2OccDWoMNfhxv4JqULtfUsZqG/O8yTPkL/g5mRPP1LAHVlT2tE1Od74AEw?=
 =?us-ascii?Q?TUawVmwV5wSo7WeHFAsb791xGOOz7ql8+VQRaPsMLw5UCOU8DHVYVy4T5RQA?=
 =?us-ascii?Q?P0z4non2p4v1q311E6Stl8BtEnetDOEx8IQAH0xODGwkfUyNXdCnwPMmvW0i?=
 =?us-ascii?Q?SCFomXl6SfdCx+nYxBIzP7hTBC5GbXMgHQpg/KxhtFpQ6eRTLBn9oXlIl2aF?=
 =?us-ascii?Q?S2aIe9IQ18FwQarxQ8Xcn8Mibppv061wIS9Br5OUKQintUhDPWIziiGuo1sV?=
 =?us-ascii?Q?Z3xG3kw7NYZ9qyJp3nLbN7lnxsLCFqqS8sIEYcnG8bQIxmkr6ZTN4ib7rMHl?=
 =?us-ascii?Q?8I4emONYLY8KG1uocVChl6/0qCFPislY827SPrxp8nWRO+kL3VY4ubHvYalJ?=
 =?us-ascii?Q?UKIxiYmxY9PqNmx8FB6JcO3wqSZeBsloxwUqhbYrxRu3oSWSEWKMwxWSq2Kt?=
 =?us-ascii?Q?bGonYImqyTOownIf6PuLbaKgLmhDoizKxxNzd1Xw4KH06lj+RQGJBU5Y0zKP?=
 =?us-ascii?Q?wecccvshyTxiifA/CRJMIer1T7O/FCdrOctUDnEya7ChKgEXzNj4XwFwgai9?=
 =?us-ascii?Q?/22EtwVY1aTdUa5l8vjlcdD180oO0Ij0WeGr/ZVZ3/ugERkSYclHWKyhxZ7S?=
 =?us-ascii?Q?dkbCD0/oScY6RgrNYCx2rQT+NkLYFjTd/i0E7cK3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5c6e95-0696-4c0a-d5f4-08db7644e68f
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 12:57:30.2689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JQ/e3TczNUMjt3cDjs05xdrB2pxgnq9thiFHRw6dA6D7qu4I0UUElbsBqSplQGgU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8728
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
Cc: James Houghton <jthoughton@google.com>,
 Jerome Marchand <jmarchan@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Muchun Song <muchun.song@linux.dev>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "Hocko, Michal" <mhocko@suse.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 23, 2023 at 01:28:24PM -0400, Peter Xu wrote:
> On Fri, Jun 23, 2023 at 01:37:58PM -0300, Jason Gunthorpe wrote:
> > On Fri, Jun 23, 2023 at 12:35:45PM -0400, Peter Xu wrote:
> > 
> > > It seems the previous concern on using gup was majorly fork(), if this is it:
> > > 
> > > https://patchwork.freedesktop.org/patch/210992/?series=39879&rev=2#comment_414213
> > 
> > Fork and GUP have been fixed since that comment anyhow there is no
> > longer a problem using GUP and fork together.
> 
> Ah, I read it previously as a requirement that the child will also be able
> the see the same / coherent page when manipulating the dmabuf later after
> fork(), e.g., the udmabuf can be created before fork().

That always worked, just use MAP_SHARED.

Jason
