Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 690329A0072
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 07:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA78C10E675;
	Wed, 16 Oct 2024 05:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dQAxcPo3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C9710E671;
 Wed, 16 Oct 2024 05:12:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fsatg+eXFN8kdDzUrnMFF7/ZtHQShyQCvhwsFtteJst6CZJngw7d5OdYd/dCDqa2xVVs3MH+jDMH/HjtQlLuvGxFHs+9Lyk+zOgUsfespG28+51mVhcAJOn0cK4lYvDZyJGrdCUjYkEl8tsXUqHh0gE/7xshkzaE3JzX529eM2UV+EsbM6d5tSzeJCBiI02Yr6AMu42r00u38h9+/TrcdgXE2oUxolUzEOO0I/IAm8VRphPMdm/1l5Egi6VPTXmJQwBEMV+c/eFTky/HHfYdFHmDf4PqaW3OGmhdSv1+CsB8A8qWpTlfPLTMY8xy+livMQQxshVL/udLlvOBxjg8yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rkh5te4LxCtQkwLlHtvAMYkYJ0RMHk1kQsPViqctlhw=;
 b=dNwjMFZgSM+/OK5vfPgcGvia80nmfjiaLhrBWH1BzYx/vH1NI9Tg8PUxe0X+VmKWG+H+bF/nTc+J/uLuDIIptBQJuWKC5SLvqyP4hJo3SH7mo49xlpXgARDqn2Tz4pLLkbDBorQw9T1cL6oIujnQAqmVXGljCSk/CZY6bZxNq6oHDmhJWSOdHvfHmd+WUcbrYvR5sARNJcvEx3csqSWXbcNF/EkLULTnATLBHZTB43YXoLdVwa0xmPk5QZHxvVvANBq9dFX3J5GRot0m5qrZ0QyYys4M4UqLnq6x7nP4hWcWmeKA54dnTwmcukGJGw0uyOts/cAm4ag4BKDP+Vv4cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rkh5te4LxCtQkwLlHtvAMYkYJ0RMHk1kQsPViqctlhw=;
 b=dQAxcPo3VmjUEfDpRNnn1EQmo/VyxClsz7eBik3QmNkUQ3x3+5CrFQQu1GD5uhEmFOmqJ6RCQ+qACjat0U6fiMRkmPd0G0aAmDoyd7Qs9UYwEkQLXrjOOlzwgXFri1H/DvVcaINNA+mEbHDIKOYeUOYvBQIGdNNPhrO+wjfQbjyHrguKNeUL7XqmqEOkLmZUBBrvShRKbKcU56gwSiZe27wpOGfF7QRhKG1ynKTNcMKJGEp4HRVRXHtntrCyFuExieGoVMynVquiZWOdeh9iTJyNQzSsIQBq7Oe9yqfELHchCk+9Gsmik0qNpgxrxj9dhrRn95v+6Nc+IoQxtjLKSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SA1PR12MB6946.namprd12.prod.outlook.com (2603:10b6:806:24d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Wed, 16 Oct
 2024 05:11:58 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 05:11:56 +0000
References: <20241015152348.3055360-1-ymaman@nvidia.com>
 <20241015152348.3055360-2-ymaman@nvidia.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Alistair Popple <apopple@nvidia.com>
To: Yonatan Maman <ymaman@nvidia.com>
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-mm@kvack.org, herbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 jgg@ziepe.ca, leon@kernel.org, jglisse@redhat.com,
 akpm@linux-foundation.org, dri-devel@lists.freedesktop.org,
 bskeggs@nvidia.com, Gal Shalom <GalShalom@Nvidia.com>
Subject: Re: [PATCH v1 1/4] mm/hmm: HMM API for P2P DMA to device zone pages
Date: Wed, 16 Oct 2024 16:10:53 +1100
In-reply-to: <20241015152348.3055360-2-ymaman@nvidia.com>
Message-ID: <87frow8wdk.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SYAPR01CA0020.ausprd01.prod.outlook.com (2603:10c6:1::32)
 To DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SA1PR12MB6946:EE_
X-MS-Office365-Filtering-Correlation-Id: b34f0ae1-4097-4bc8-c299-08dceda10dbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?76RwKOjYY1flTQiA4nzuuorJqxFac9VOI7IPmojgX3DMn0hZ0BH1YMs+pqJl?=
 =?us-ascii?Q?Riy0FpbsNKDlnb82FTmyy2ciYZiNiHryqqcQz5eE1DILYvXJgItV9gGakZZV?=
 =?us-ascii?Q?fB7d4ipwMfHAO8xbtrA+XNZ/gJAxU78R3inpJRDm/0pLrsiX5hWO6FxkRcdQ?=
 =?us-ascii?Q?7m6nEJD77PUXsBKaECcj+Y0/dkd0BtfpUvxNpCAFwB4R8/Hxn6gFzN11gEJl?=
 =?us-ascii?Q?gVS8MNzE2s4t8HQzUIbff9xaTTdQsdiVhukGSx4KyJMwreVjO/9jPm1oZWMU?=
 =?us-ascii?Q?5JzFxi1xMW1X0JrvYo5vTbGR4Y7xZ/zDc56vHD4RzZ48fch2OGxJIGrudOMU?=
 =?us-ascii?Q?7O1TJh1lPKo+tw2Q7mtowuluA1xoaMjA3UIl6QPsGml1BBGE/CCW8v/+kb69?=
 =?us-ascii?Q?h10CjIr5IZJkWne5Ev9fBzGMp/3bAG0pLxvEw1on7QsY2J8uyqxMKpxKU2iL?=
 =?us-ascii?Q?sn0KhB09tYl3PivUtosc+bqusO+p9Ewzzs4GrQS6Pf4vSwjWpFpH9aQ+lRYF?=
 =?us-ascii?Q?NB/3sYpUGjixGRNNufuyOM1aVeSu/n8IKISPstuN/afyjiMKA9g41ZpKDrWJ?=
 =?us-ascii?Q?w03JytZu2gq8a5lE2DlufGLWTtq4cc+vLqqB/9czrj2mWZ6zoR77Zj1pcujA?=
 =?us-ascii?Q?tbk7/e6OAkLQYEpvb37A1RADGXaURa2W0Gee46iWyy7PuMXsc6sXhHy4V8Sv?=
 =?us-ascii?Q?oYWtU4KdCNDHC+Wz1XUhzDZvAzCVNmIlXGB+o38z4XAUQulenoRElJoq+wPM?=
 =?us-ascii?Q?ssABAPc+zqGqVnl0g1DT8h0WflyexdgME6hwQ97oBSJWbiqhyNRZVHC5n0VL?=
 =?us-ascii?Q?ke8+FAn4nyetbHXAOGHlqPheWgnB6sYXv51HVMT+5TliGUUrefP7gaKxeu7V?=
 =?us-ascii?Q?wg549ugNFUPXV0PTzAjdPq45TcAbqDjYNUSOax9Hbnvbi1enwLSWamDqUdfq?=
 =?us-ascii?Q?wUQLrFiy9dukYiBMQZxt5tbsvWyY0uLd3TKXmiI0vMq6bfBG31PE8nlb+ABK?=
 =?us-ascii?Q?A50AI33usxyZmId7Pw0HENvOQQ1TfNSSYeQnMgrpbYssegJ+cqh8ka8sncOd?=
 =?us-ascii?Q?y+a44YAHicA9PGlHsfm8et8+dQFibSTa26bGsbCBEP4LGKpuxP8CcmaxKI3/?=
 =?us-ascii?Q?n+NAN42KLy78RmeHv2JTf5eW9LzZW0dZFi7jKuze/iqdTKCsjZCd5ptxiJLF?=
 =?us-ascii?Q?0XQLqA7C2cc1BmnLvBJ4SWgMV8dA8iGFJKYgF8UQ4vwW0Ig1PNEybnc8OaFB?=
 =?us-ascii?Q?reURMGgK8jQ7Fykm1yg7SvG3ASdbFEPGXNNPBDfEDQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mOXcr/UXt0EjBjbklBWg8LiYLUYCSgX+3o+/NYnQ1Fjf+GSlKEL8zlrndbCZ?=
 =?us-ascii?Q?2CB4hPCifGpQM3Cr3krGPAW4FqRfapJpHnun26UuC3o0kUcV/CcJ05B17ICm?=
 =?us-ascii?Q?UAFZPOpqP3l9u4bDtJQvADyMEeWjOz/yMlJMyUir4S4i1PsIuLZwRbpRipLo?=
 =?us-ascii?Q?PVKcdLqqCrngQ3nUknXsRwpwPNMAnuO0iK9/fYy6afzmlXQs/f+q1eRVtjK7?=
 =?us-ascii?Q?5h30lSTYjjfhLaLSatwMUczPbAevpH50gwlhWpUfFK0D+aox594+Pj10JQ1E?=
 =?us-ascii?Q?Hui1dLKAtkxtoWh+LM4V0lqM1CxnUDpd4OZZBEE4RMYdOdL0TrpsaXrDVej8?=
 =?us-ascii?Q?K9mPWswMeMj466FkA6vHwpLKryLJxjXMLnlg4WmqRGib9smrl7ZlsTcnztGt?=
 =?us-ascii?Q?jVvdRomP1rjyJTvVJjiqX0N7reBV3lQ5EV9NA9F+zFcKcyZynoqvVwO9c8t6?=
 =?us-ascii?Q?VscSLCeI+NsmCz1KrrtQ/O0wTH9vq5TtHT4GbPnZYakspgjwedAwVh+a5ly8?=
 =?us-ascii?Q?y1VbHj+/t0LF7g3oUrpVUrAnVeqOoFem12xXopz9co4P+gknEV3bw5QBnct0?=
 =?us-ascii?Q?OPo7VG+MWQyhZ691TvTkRqBz5yxd22Zsbdvuc4wlWzOtRSBAVwaeABddWUIw?=
 =?us-ascii?Q?Lwl8S/EBtW9XhdwMzwrKuLm6a0avrBp+Ntt33ILOw2++KCVva0mGyigWeeMw?=
 =?us-ascii?Q?q3l+tCh3iNg8DwmmGrxqIKLoDxPCv0c2uI376vk6APaN6MSYG8M5tIc5QSRs?=
 =?us-ascii?Q?I1aqgejnOqc4LX5OKTzVQHhcXGJ46GoowUbNQerIdV8TLAL6b+lB3cWV+0yJ?=
 =?us-ascii?Q?S0vhrEiGjYJhDf50CIi7S6VAZyorJ4uMgV4bJtO8UpSkVhGpXaPXy7x9Fdks?=
 =?us-ascii?Q?PuWFWfpiDE5pQ0TOCYU6UxJrq1jrORI39m0RVWJdgalAV7lYh4rgXsn5A6Wn?=
 =?us-ascii?Q?3s9YnZTVZyNNri43bpGZwdcz4AWS2a7XiTcQ6dcvn3b3icT4O1d3nfNik1Ec?=
 =?us-ascii?Q?/LlL8zmR2cUCcuTzbe7dBCVYNImf+P4/Vv0/I/grwjATE4UUxcClNCE/HHCw?=
 =?us-ascii?Q?26fuIE3NY107FkqIzwmRDgTX7BrT2sTD77Faq7KyCnpODKNgugPPVPj4ytDU?=
 =?us-ascii?Q?Jm9G4nR7sXnEHFt2ibBiGsq/B4Ndra2b9yi/yg/LvNLamKI/mJMBQ9thLEtX?=
 =?us-ascii?Q?ijVVuJrM6jCqZ1pEZhgzsGQ9C7D7T+7I3n+al2WMjrwIWYbAYe7St3U6YG0M?=
 =?us-ascii?Q?0SZaD4haLBmNe9yg6yx+X80A4aVD/kdlmaoyUBWv1QHjxmKtRPlbKo2LtHQt?=
 =?us-ascii?Q?eTUsiX/3mpfIOKG7FvLvnBv3GTprzA7rFFWRp9hV8Lt7sxjdOaMS9qLrjjQf?=
 =?us-ascii?Q?Q6ENsvMZOWMAkeKZc80dCNK7YiutPZ7E8eypf+duagzpxHr5NFg02fFCOSFF?=
 =?us-ascii?Q?GHYyQy9YJaFZ5urASNIJITlh/UkcGhzGhSNeGGygN8ik2Nv7S1ZcTsvTBvWo?=
 =?us-ascii?Q?G52iyxBTfIq6to+fVckdVSIlCPH3zO8SYsHWvEJEX5w6h+YoNbiIV/kx00Xc?=
 =?us-ascii?Q?gRILbkQQehBrSBjHZYtp1VUjPmXv36CkEIz5joUa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b34f0ae1-4097-4bc8-c299-08dceda10dbc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 05:11:55.9954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tNnVPjgbYEmScEIWzxBgAkdS/HMi7YbTMmnDOzdI8LEIaupSec83i9015kjHhd82rmIraeEJgN9lht3juQ5M5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6946
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


Yonatan Maman <ymaman@nvidia.com> writes:

> From: Yonatan Maman <Ymaman@Nvidia.com>
>
> hmm_range_fault() natively triggers a page fault on device private
> pages, migrating them to RAM. In some cases, such as with RDMA devices,
> the migration overhead between the device (e.g., GPU) and the CPU, and
> vice-versa, significantly damages performance. Thus, enabling Peer-to-
> Peer (P2P) DMA access for device private page might be crucial for
> minimizing data transfer overhead.
>
> This change introduces an API to support P2P connections for device
> private pages by implementing the following:
>
>  - Leveraging the struct pagemap_ops for P2P Page Callbacks. This
>    callback involves mapping the page to MMIO and returning the
>    corresponding PCI_P2P page.
>
>  - Utilizing hmm_range_fault for Initializing P2P Connections. The API
>    also adds the HMM_PFN_REQ_TRY_P2P flag option for the
>    hmm_range_fault caller to initialize P2P. If set, hmm_range_fault
>    attempts initializing the P2P connection first, if the owner device
>    supports P2P, using p2p_page. In case of failure or lack of support,
>    hmm_range_fault will continue with the regular flow of migrating the
>    page to RAM.
>
> This change does not affect previous use-cases of hmm_range_fault,
> because both the caller and the page owner must explicitly request and
> support it to initialize P2P connection.
>
> Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
> Reviewed-by: Gal Shalom <GalShalom@Nvidia.com>
> ---
>  include/linux/hmm.h      |  2 ++
>  include/linux/memremap.h |  7 +++++++
>  mm/hmm.c                 | 28 ++++++++++++++++++++++++++++
>  3 files changed, 37 insertions(+)
>
> diff --git a/include/linux/hmm.h b/include/linux/hmm.h
> index 126a36571667..7154f5ed73a1 100644
> --- a/include/linux/hmm.h
> +++ b/include/linux/hmm.h
> @@ -41,6 +41,8 @@ enum hmm_pfn_flags {
>  	/* Input flags */
>  	HMM_PFN_REQ_FAULT = HMM_PFN_VALID,
>  	HMM_PFN_REQ_WRITE = HMM_PFN_WRITE,
> +	/* allow returning PCI P2PDMA pages */
> +	HMM_PFN_REQ_ALLOW_P2P = 1,
>  
>  	HMM_PFN_FLAGS = 0xFFUL << HMM_PFN_ORDER_SHIFT,
>  };
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index 3f7143ade32c..0ecfd3d191fa 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -89,6 +89,13 @@ struct dev_pagemap_ops {
>  	 */
>  	vm_fault_t (*migrate_to_ram)(struct vm_fault *vmf);
>  
> +	/*
> +	 * Used for private (un-addressable) device memory only. Return a
> +	 * corresponding struct page, that can be mapped to device
> +	 * (e.g using dma_map_page)
> +	 */
> +	struct page *(*get_dma_page_for_device)(struct page *private_page);

It would be nice to add some documentation about this feature to
Documentation/mm/hmm.rst. In particular some notes on the page
lifetime/refcounting rules.

On that note how is the refcounting of the returned p2pdma page expected
to work? We don't want the driver calling hmm_range_fault() to be able
to pin the page with eg. get_page(), so the returned p2pdma page should
have a zero refcount to enforce that.

> +
>  	/*
>  	 * Handle the memory failure happens on a range of pfns.  Notify the
>  	 * processes who are using these pfns, and try to recover the data on
> diff --git a/mm/hmm.c b/mm/hmm.c
> index 7e0229ae4a5a..987dd143d697 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -230,6 +230,8 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
>  	unsigned long cpu_flags;
>  	pte_t pte = ptep_get(ptep);
>  	uint64_t pfn_req_flags = *hmm_pfn;
> +	struct page *(*get_dma_page_handler)(struct page *private_page);
> +	struct page *dma_page;
>  
>  	if (pte_none_mostly(pte)) {
>  		required_fault =
> @@ -257,6 +259,32 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
>  			return 0;
>  		}
>  
> +		/*
> +		 * P2P for supported pages, and according to caller request
> +		 * translate the private page to the match P2P page if it fails
> +		 * continue with the regular flow
> +		 */
> +		if (is_device_private_entry(entry)) {
> +			get_dma_page_handler =
> +				pfn_swap_entry_to_page(entry)
> +					->pgmap->ops->get_dma_page_for_device;
> +			if ((hmm_vma_walk->range->default_flags &
> +			    HMM_PFN_REQ_ALLOW_P2P) &&
> +			    get_dma_page_handler) {
> +				dma_page = get_dma_page_handler(
> +					pfn_swap_entry_to_page(entry));
> +				if (!IS_ERR(dma_page)) {
> +					cpu_flags = HMM_PFN_VALID;
> +					if (is_writable_device_private_entry(
> +						    entry))
> +						cpu_flags |= HMM_PFN_WRITE;
> +					*hmm_pfn = page_to_pfn(dma_page) |
> +						   cpu_flags;
> +					return 0;
> +				}
> +			}
> +		}
> +
>  		required_fault =
>  			hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, 0);
>  		if (!required_fault) {

