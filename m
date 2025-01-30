Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B93A228B0
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 06:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB87110E8EB;
	Thu, 30 Jan 2025 05:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZyFf2RS/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2044.outbound.protection.outlook.com [40.107.236.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1C110E8E6;
 Thu, 30 Jan 2025 05:47:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RJ6wf/TMfVOz6UZQBpzpfEv7MrdzlUtnxqis5bTudvsmVx+SnLy8zhfX2WYl2HpkG9Nl0vR8xcESNGLbntn7wHh90BcuRO7dGITfHpT99AtbKWmVyn32LpMVuZaZld3j82QTQs/N3o5TRD7C0qQ4nDWULWgCoWY4ktgyOoMoGC/23RHt4r0BcopZ4eZGhUsz21BVCQgKKrWgSrLAw2FHeYhN/WVm6wMXebtI9t/hbODZjjtt5afWRu040b9XsKc2SBTKHdJy/NPZqa7VGLEPZKVz3yaeE85NZqr5EZO/IZU3pn24Vu90I8vOMx3C69XAD/FsSCAEGGqqKwGQo2wfMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQEpA+v76YyQHGuXBJkgg9yooHGvhvW/LUzKSezrIRs=;
 b=gofcYeUVrdTqmBfawZxb3cqlRX/DOPlcMMC7h/sJKymvJ1efXicLL/RX66RfGFCFpMhpX61/xVnzqTrcyPQ/cfuZPE1VOOTAUwOp2NSIh418TPiDX717eE254iI9Gu8NLJsVJf2zGPrKSPP83cR98ZEyaSUF0bq9PoP5ZhP1HG0Dgd5bIlZ8gxKPuWLMF4VIGxRmUGLeSKCNru0Uvmck1N5/7MxtcYVFg52zRxUVDNSHC2d6Ax6HpR8v8/H/fARoj2IMBpThpf9qISdthPVwX2gBSvVdRt0x1TmbaYv6GvsUg4qNYaMF59JNvcyJ+iqWPPE711iHOAaSh/3QPHaBUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQEpA+v76YyQHGuXBJkgg9yooHGvhvW/LUzKSezrIRs=;
 b=ZyFf2RS/BjZr6CSlV7YZetnKNCCRoLCe6FwsFnvLrGLHGlfnDAxPjMTmeXF6fgAsxS5Lz5Lo2ssKWRFP2c5q08CIyYwb7m01q5+fnJ5OVGojN5s5mPWj1M0B9jAjyDbTKXPyvq+Ve+HMJPjSHhRIVGrT68ENyLzWeGmeupWicRgbX5DhW6cxcHImJ9uC7Qh9Vl5G00FI/fF7LnEFrVUgJI2H6hNPtnFSe0rQYdMVrX0pIuU7qsVomuBWYuOW3EKiqvYGL9AMfPd1xe0QDa3eZZOgnx7chEvm6RMtUv5e7L0u8uo5OfJNDUElbS+BMwljlCg6UPgNog3FrPN04fQRTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA1PR12MB7520.namprd12.prod.outlook.com (2603:10b6:208:42f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.18; Thu, 30 Jan 2025 05:47:25 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8398.017; Thu, 30 Jan 2025
 05:47:25 +0000
Date: Thu, 30 Jan 2025 16:47:21 +1100
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, stable@vger.kernel.org
Subject: Re: [PATCH v1 02/12] mm/rmap: reject hugetlb folios in
 folio_make_device_exclusive()
Message-ID: <bebw2umawadkua25fqupud4ku6t7wsawpapsxfh7lqfzrjxigi@6y6ja2t5polc>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-3-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129115411.2077152-3-david@redhat.com>
X-ClientProxiedBy: SY6PR01CA0029.ausprd01.prod.outlook.com
 (2603:10c6:10:eb::16) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA1PR12MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: 8556c2b7-8b3e-4723-8867-08dd40f192b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WVzQ70JrhiB527AqiQXKGBX4kASRhXaynD25/GldoBss19vHE1rS35HNTcMt?=
 =?us-ascii?Q?+s2a5hHxlEH9fT2QAEnSptRofX62Liwob2yWexQF7Vw/JKje20ks4maBUwxR?=
 =?us-ascii?Q?hGNM732KMTurlzNHC+ZVKkGFVsZvoucxiRvsevR8zhuIPYVaEzxuyTJaAuz0?=
 =?us-ascii?Q?n8SmQK7yTlzP6TW6H9R3nRWDQ1qUo7MLiEUcNXJgL182zX0bWgYoeEb1p6mV?=
 =?us-ascii?Q?f3LMtbPOg6q5tjtrK2XnKCWU/boNUdpvpmo24r6ZZemOPkU3QmiHtYsS6Si+?=
 =?us-ascii?Q?AGjGksx7H/ECKKgHp9uXIdsTxJOFogUtt2WiRttgwrBn2pTC4myrcKQoJIED?=
 =?us-ascii?Q?03DHit6ThfmEEzMCddzCPrAW6x4QrzSbXO49U4fC66F6/U9EKke3CJbHCNFd?=
 =?us-ascii?Q?IXTfSLBThRniXX+WrRLAjQsJne81k2xHjql0ZvsOpipcu9fFJM6XFMWwtcS+?=
 =?us-ascii?Q?y2IYIHVyPfVWFr+uIL7h0ny541w+kgecoNj4doGX1yow4cE+JZ2EyS5YLrMC?=
 =?us-ascii?Q?yghae4MxvWv9hp/pxneIwUDuX4J1QYaad5hRPEURp65gR3DDdkG/6JbcjtVX?=
 =?us-ascii?Q?WuN7Pk9YLw3X7Z2vtv9jQtvuAleiYHfx4+IaLz8GNlwF5fDZiVNwY0umDj+a?=
 =?us-ascii?Q?3Ulhq0RMzqdM53vTSHVKpalQSZpe9De0OIt9baOIJiCnOv2/ANJsMLDJLZ7k?=
 =?us-ascii?Q?O15wGw+dMro8lHgBG5oAbZATKkx1YbFVhNvkr3RYT8G65Accy5JDjsdefEex?=
 =?us-ascii?Q?1XHmnp72G3jt7wauNzGiJXyofo5RhqYi6LK7xvpO/XyJyUOWz/jeaUG6J9Nm?=
 =?us-ascii?Q?5xRAqMhLXHIAw6GQVPdsHBfKlQuafbqgekcu0o6rT1cHKx+ISupbmzONExR3?=
 =?us-ascii?Q?05lNG2Gr1DLOcPx8hTPRjx6Oo43/SICCLXXKok3KDbrMPr0lLdGHrO+G+ksT?=
 =?us-ascii?Q?8ew/J6lbXtStnhf1DiXq69AydsIBVXJ6amoHffoAV9h7eqp+KnllB6e0rKwc?=
 =?us-ascii?Q?w9RsZmgg62XPobXpFdrOURsNMzcM+hkFhMMoOlr0Dmxjgp9k0KYKLu9VZMs8?=
 =?us-ascii?Q?5TU/AZhpbEJxOBZLRAaHapwW8C/ma9Qpbj8qcW27wJWnIIJOEyJ3y8HNVwyV?=
 =?us-ascii?Q?j4Y52hOSslAtHYygwQHRw3A5dFmMhOZhgmw0MtaS4tVHfL8IlXHXuoYHVRFK?=
 =?us-ascii?Q?JW1ri4ofM9wsP7Gzy544Ce20A1bG0y7+9MD2n0fJItXW3XcllWUe7VmzGgEg?=
 =?us-ascii?Q?w1FzKC5s3bUZGDJpZCmS1Vn4kSY1Wiubsc7ESoGYzghHi4morp+dsM55L03w?=
 =?us-ascii?Q?62n7fVPHQAy+CEybfOsx4mZXBTLlqtvIWCeCJ1IrlXIWBlLlbFe2pQg8t3Od?=
 =?us-ascii?Q?7/CAnNAkndAAn3uJ9PfnuWSQRKub?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sESZVSH3YMg34rrAwiQ/LF3/Y75imDFpeUvVHEQRvjjWYEGX5RxsvbRDptSH?=
 =?us-ascii?Q?BD7vXQ7rvd39OT6LzRE0FASuqXh5ccFYwI0gE6H+abz+3w7pe7Q5ukPAjF0Q?=
 =?us-ascii?Q?RVaHXN96iWHJGQ1U6cOB9wenDBzwy1sFGflHzOJS/yABMA2U4ULlqic+DCSG?=
 =?us-ascii?Q?4j9RIX95HoWIskz4NJEGZHMGWM89W429dDJyVa2q4o3Z0dWHsIfbz5c1wWOg?=
 =?us-ascii?Q?jwMUU6VQFwCyW8d51VlRRCvpl8OfkUGh/tvxK4ZAIuPzcw0WZN62l6A/q2Q7?=
 =?us-ascii?Q?1cIO+XFllTUxs8uWi4NrXJH1pwASPGmAHBX57NXPPpsxXgcLJo9JoLBqA4td?=
 =?us-ascii?Q?JBdkJSJsgWYJMkcLMeBIGdW6mJ8XN5kiuV4gTNGBJnOIFxAbkj7rIOEcTlKs?=
 =?us-ascii?Q?iIJyRwb0tvC+mzE24MOUYzPILozGu+gIwc2pduTYGI59rA7Z4c4Gedmifeah?=
 =?us-ascii?Q?8qyi2AD9YWIwHpnDUEFfpyo9hidG0xv5MQFnxb/JnG1QsuXAc8cK9FxYNBsM?=
 =?us-ascii?Q?lhN0mFappS+rhis+IEpmsvVGtBGqujp2zyMUrOG0Hb3uMuVJ3JNq4Ge1TsbQ?=
 =?us-ascii?Q?p85qnHiUJxzrJr/3ZFrmbOthFj4rohl49Rfd4UHSMmEo1TUcMqW+hRxvfWt+?=
 =?us-ascii?Q?95s6oifaHPzif+cEc1rh62kqsK8OP/PIbI6PFg/MoGsCY1v3Wu/m5LbLFXDy?=
 =?us-ascii?Q?0goNBzWxWGfddz3vCqNFhv0/wwOhZLGZvje+rgfFFwuXzlbwLybwCdqldRrP?=
 =?us-ascii?Q?P1dZA8eEhT4pmz3vIA+18aWXWBy5CoE1dW/1uxJxoADvveJ5VFXG5tbsaQ4l?=
 =?us-ascii?Q?/A68LDsDwcQXkhWswhopwKI1SE+JgS4B8IDNeUdFHXPJPKdTvZoK5V6tjZJi?=
 =?us-ascii?Q?CwBePLVQZWZmCNyvVFv1s7PNXppGiNndNE74X9gyghi1oDPgoVBHG5njShGw?=
 =?us-ascii?Q?Gh41MPAQ8VIe01i8dLfGAC2SG1Rvexa42HuNNJDuA9hq/GSjVI3IDVfgjAEW?=
 =?us-ascii?Q?+6UJHnPRDCZ5uuuXErJaPu7JEe4/ChECxHzvODDLlo8wehizwL45yfIy8Wdl?=
 =?us-ascii?Q?1bWloXG+cdvuRrwwyH0QIBaDkb7WTBLMdWWE7L6eER0vv/NwMhpEx79BivMh?=
 =?us-ascii?Q?G5yUtLHY+x/JpCGIloze0qOvqd0S+FKYeoJKnW61cC5q5k6WLwKxPhQi+4Ut?=
 =?us-ascii?Q?NpijIZ0Fmtruw+0TPsqnVFgnfVbOFAAPA00+6QPpWiolORQ/tA2hif2zGK//?=
 =?us-ascii?Q?6/PWlWLwU2uo/+lEZ4HwH56yOaZWFIaQBe/Fn+BWtotCY8Z1O2fX4ysvjnAb?=
 =?us-ascii?Q?il7EFn/JMjiQc0rkzmj3nWwaqe9BHzgaoA6KA5wkkIrIIDODGn6GDiCRO6eR?=
 =?us-ascii?Q?zEPym3BW9N8KkMqHGZH2Qb0i7z+6cGO9IxnZNTZFCoa+5O67iV0e8s0LB6k4?=
 =?us-ascii?Q?3EBqKtwBAB6a5HkefgN42QPxNaFbbk8WVnxrm8+mHENPLec1CVDd+lKqz9ms?=
 =?us-ascii?Q?pjTtJQPibA91mGF7y3KKYivwvy81yzEm0JV+72+3Ji/fTSvLognrV/y1GUT+?=
 =?us-ascii?Q?jPA9i5SIVqBh0SYrBpfCR7SmzvRfi5HVHZ9/xoa2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8556c2b7-8b3e-4723-8867-08dd40f192b1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 05:47:25.0097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wFKs6Ebz+DGIAeLJscb2bARYoWB4tsdmj4LxtxYskSpL1LAmj8JwzqcIj+DR8Vpg3GPxmrQRbCkEDhhJFN7YCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7520
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

On Wed, Jan 29, 2025 at 12:54:00PM +0100, David Hildenbrand wrote:
> Even though FOLL_SPLIT_PMD on hugetlb now always fails with -EOPNOTSUPP,
> let's add a safety net in case FOLL_SPLIT_PMD usage would ever be reworked.
> 
> In particular, before commit 9cb28da54643 ("mm/gup: handle hugetlb in the
> generic follow_page_mask code"), GUP(FOLL_SPLIT_PMD) would just have
> returned a page. In particular, hugetlb folios that are not PMD-sized
> would never have been prone to FOLL_SPLIT_PMD.
> 
> hugetlb folios can be anonymous, and page_make_device_exclusive_one() is
> not really prepared for handling them at all. So let's spell that out.

Agreed, thanks for fixing.

Reviewed-by: Alistair Popple <apopple@nvidia.com>

> Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/rmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/rmap.c b/mm/rmap.c
> index c6c4d4ea29a7..17fbfa61f7ef 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2499,7 +2499,7 @@ static bool folio_make_device_exclusive(struct folio *folio,
>  	 * Restrict to anonymous folios for now to avoid potential writeback
>  	 * issues.
>  	 */
> -	if (!folio_test_anon(folio))
> +	if (!folio_test_anon(folio) || folio_test_hugetlb(folio))
>  		return false;
>  
>  	rmap_walk(folio, &rwc);
> -- 
> 2.48.1
> 
