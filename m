Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B59AAA237CE
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 00:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF04410E9F7;
	Thu, 30 Jan 2025 23:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kYMtaWze";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3BF10E9EE;
 Thu, 30 Jan 2025 23:28:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XUWLRB4OtSdGCAuZUZVfASOuvaLu3NXy2lcaKJlwpyNkG+PqVz7SqBPF1DDxuDB4d3omqq9eqZ47nT55fpL013ePN/URzVWPi+ND8WJh2twcN/1qFgPLXR5+IRalZIj9jpO+ezMMFp/2QYGFwgTNq5j2w8t4/93080A9sH6GmslCtsONQfvo6x/2mvoqjUsgmrkvpgiMbkyF/fL0enjVRywILT149WH7+9FChvG72JhPFJO10vWw3yck5tcm3CKpfGSh51BLiAeOjdZiGNQkS8hMmSBCPLgv+9buGr/N46c14W559mbVdX/SjjcJQpGT2R3RQR7oEUuAhYk106uaVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i62BICeCmMsX+SSgaFMLacWhxpQwoY4mnKKbhV+O+18=;
 b=J8MyhESoLqDAqn+cKxhuJ2AtGgdZTkcC0VIUwwSQ4wWagII1GP2m4xwDnQyFokS86qan3reWvfKz37Bx93bM3IwIUO5pgm+m9cQNhTV9K89UGVc631ebcHcPhMe5mNNZXCapsLUgmBOD1PqHBzNfhtBx2vtrpxgaAViKVg2+E1b5Mhh1Qo6TfHVeKZY5BTLbVz2JKl2hULci/7dSCDB2o4KwxGgjbbcYlpU0jXielXDJGpLk29BmBiTt8jC3+bDt6tfSY3b/U2e1rE1RSu2/P/5vlQ5YollwfC+qvrWnW4CRM7OxxQw0dbQsyOzQCe+EMaw02nwghdBSO6Nyx6C0xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i62BICeCmMsX+SSgaFMLacWhxpQwoY4mnKKbhV+O+18=;
 b=kYMtaWzeDg2IiWvet+U+xjp5ALwtcZ1Svgf/ANhiv0hpYWzu7c1xegBCt8Jf7kcVWwTMv+m02I2GpPF1LhBievYm0lgXLxWpg7P1F3hVoHmVq60aRHj3zOzfJQ9G2v30rmYaVuzyyC72UNenEHKwcKjLHfNbgMkcIRE1NyDCNB5VFX/Ke4kcsgI9oJxxnq0yyyifWc/myVSz/7b/efzUe25TKt1O2sTENaMi4OwNSqbtoGNGkqcMltd2kFCe6BCLUf+53vbcx1uE85B9AwplkCuFvgAITV10gEGDiZftrSkshcXhEj5g3FWIr33UD/mXLUOiwWzl0hogzatD6Xhusg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 IA1PR12MB8407.namprd12.prod.outlook.com (2603:10b6:208:3d9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 23:28:33 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8398.017; Thu, 30 Jan 2025
 23:28:32 +0000
Date: Fri, 31 Jan 2025 10:28:28 +1100
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
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 06/12] mm: use single SWP_DEVICE_EXCLUSIVE entry type
Message-ID: <5rsaabu5vznqejwwcntwabyqjjmxm325x4rz335jrjozvqvsij@mt4eobxi6j5e>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-7-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129115411.2077152-7-david@redhat.com>
X-ClientProxiedBy: SY5P282CA0012.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:208::13) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|IA1PR12MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: a07de21c-657e-41a5-0882-08dd4185cf76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XmSo4EF5xRbmruY8k2F4rUhUjFlani/Vp056iMUY6D9xk74PbnJq/z/TX5ds?=
 =?us-ascii?Q?m3Fp03/0BEmOn8U2Gz8OApsqm77TWEempMVJrul5iUuZMOnV/BggTxauZ2vz?=
 =?us-ascii?Q?uxmFRefiChn40FnXK7y6CJQszZiXMr3XqCwzDDF56WdvGY7LwKKJ6kgszjlS?=
 =?us-ascii?Q?ubtdEc2ISJLzOTdF+Wwy2Gw4A3bTrUb9JHcxq8aQopXD2hcy/YO656Y3QxBr?=
 =?us-ascii?Q?Fd4aPQcZzI5+Lf1FAWr4k7TMCtAGet7TMamiYoee04yJ8bwtRZCJnFCc9uTB?=
 =?us-ascii?Q?VRCR4jx+GQOlhXHai6WVC6RNO2d3/dMJmpYNsf3fLJhRDJaZLsIOUqkNKhvR?=
 =?us-ascii?Q?svP1w9mQ4lRfI20zeJQWqtyNfhEbV7y3bpnuquUWLSGZqW+GDqUl/DO7YDbf?=
 =?us-ascii?Q?Q9zihg9NZ1jTneJEkPN4ikp0ENbyj2TP1lk4bF/LZJiD274QN83+FxMWL+BK?=
 =?us-ascii?Q?/+ow2tXbGI6x91t5yOhrRcHlfLeElV0UVkcXHY4s5cgm4xQ9qkeHZ2824xKy?=
 =?us-ascii?Q?R85qbBr7s8ggM7LHLE+8ezZYvinuunr3+GarTm2Chuotu5V8pPsnnSS3vI9s?=
 =?us-ascii?Q?mtY/NEQkvJpSt1dSk3k2oor5ngt1iizzAFQARpuV0WxrMO8bKh+z2NNEYWvY?=
 =?us-ascii?Q?r+whrzmz44N1ybDSG8UolJ0Arz/AGt8chm4xVvY71se805DdImKVqU760f1e?=
 =?us-ascii?Q?v4KqvvCHMa0QRARlUpqfSfvWw2/MzY2A/zLDCVBQk9lLqPu2QmMMBb8BcAha?=
 =?us-ascii?Q?VKxrhyiWVJIZzEiVkR5dS3EjaylFmXsOoxPmkCy+FdkI1RlOhkQJatx+Dbkd?=
 =?us-ascii?Q?FK0vgPU47bAcFKGAnnxi8i2TcCnNPX/CMT9gGfULdxSbEJ89yhw4zS1VXN4l?=
 =?us-ascii?Q?H3lWYQw4HgN/LaHNz6KPQhdQgpU9MEBnSDhWtqXkkMPRup1bTKnKMGlXfRWc?=
 =?us-ascii?Q?jhBAO/3dRKKR7sjjekuX9k1sgYTJjyhwhscr17YdU2mGMxEqv7tVL+aqyauw?=
 =?us-ascii?Q?SzckFEEdLm5LNMFiZl3h4x09cpnChWSr93RvAPONl07AqvssmJbQs7GSpeoW?=
 =?us-ascii?Q?9SIQB0uNe8a8ArkIpWX5Xr0NFjqpsMBAhPK3xpAhN/sh8a4mwZS27cjG5xRp?=
 =?us-ascii?Q?Zp8kQHC3hIl9R580y0yDpHQjLAjFn9uMQY7VHgdkcrg/MSSgmYHLx5acBest?=
 =?us-ascii?Q?yjNnz3qQe6IRoepsKtCO4soD0voIYgUCQoU9BIF614qSqbHfW/T9N8+hM+3H?=
 =?us-ascii?Q?CcN/AoyU8e1iYijuGGbCLmTwy7AC0qwqgcDPR3izuYWQcFta2e0qiXuxDjLJ?=
 =?us-ascii?Q?RNaESreSxp9U9QKpubkAFwmf3jr8Dqvi58vKPPwqGQxiH+f5Z6eHkBDUBuCy?=
 =?us-ascii?Q?3zAxHvqeLHCALeUTWaJIJZwOSFMA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ILhu+6xPTTelzAzwzTXy2SgdbTvWVsvMZC+NPvVJ4A43C/qz7HT6Kw3XmDg1?=
 =?us-ascii?Q?NfUQY8ER/CCDMW+EJ6SZjp3biVhDv1ht0IGGG9welrRkM7Ddv/OCq3Hcr8Y2?=
 =?us-ascii?Q?CKiKciVRPAvp3Ibbl3lNGrLITR8OUy6ewSq9ZiLqoVBTyiRt1r5cML/oGQE7?=
 =?us-ascii?Q?RFZ45DkxT62GnzwFfFmTRdSaiDQQMWsvDPYrD1HNcDtGc+SssxPog3irVIaK?=
 =?us-ascii?Q?bVpu5BkRUUUekDHjfO55w4IcoHPs9ZS1JR8jMpyxIiQUNZ6un1fF3WS2IxA4?=
 =?us-ascii?Q?f11vSOZ6+oIK9R9a+u+h+r4IvZcPWYA2iJiAdYTGL22FjCfe8emR4Ce5UjiE?=
 =?us-ascii?Q?O0Zpb3A88NYHsHt6OO0oXyzZL3YS0UeAH1n5Ta9fzzFgDmCP1T7pLsV2U66M?=
 =?us-ascii?Q?WJO6K1s+aqO61978fAZhJc1PEOPN2Kwg4dDrHn9Xu8glGvx9ZhJjUaNTKzzb?=
 =?us-ascii?Q?7+jhQY7cq8WNRVC4Xh4Q9z/ejcovkWcPHBa8LIJL2MIjwz5+ze125aRh1Og9?=
 =?us-ascii?Q?XzgsBVtNQX2Oowlv8aB68nqK3gffV0zEk2PYCG6OcQJ31kuYxd3/2Lj26mJx?=
 =?us-ascii?Q?/wJze3CE0W0DatJIsxog06QcDZISiH8tSrQpXtusObZN82a2xSpCQLzER9Mz?=
 =?us-ascii?Q?doLaropWmbBjjq//OeV6HeBcQMNSeaAhucOztYKFpEuC24bqeySG3R+9KMR/?=
 =?us-ascii?Q?f5YpeZWLHRIPS2hi3s204A/k/2LR4n74sIZ8I7xFpwThOCQck/g0y7B1DbZT?=
 =?us-ascii?Q?inXmWCXKE3lTA7SscasFVCTDsqfmd0JT4fjHeVgyeROuCkJjWIIp33Ce9J04?=
 =?us-ascii?Q?p2I+o9mVGUNpC/b5gZqAS8vpMy2bZG9aZ1EEgGCie8AZFa6VenzH1If+M1UA?=
 =?us-ascii?Q?MTbEoqwEREGI8OkxBXw9m7iJm4+lrQbh4kn7SKlT8/7vzOEQcV/tesIYu9aY?=
 =?us-ascii?Q?8n9bf1dymx/3tmZ9Ppb1p87O7FZfUt/EKMYClNO3uajaImlzQYigQetKmQUn?=
 =?us-ascii?Q?0O/OaCjjdu7A1vJfHMAZDYOfKPFyA2/eH3j0u7at3ueUbaiFBNCrEVxPLicw?=
 =?us-ascii?Q?wuWd6a99R9YrfFV4RLUMhEPFyrODI4Kr049NgKZk4kRDuZGkjRW/uL3qs2vz?=
 =?us-ascii?Q?nkHJJYg4UVatorOFbRhGr4XYx7DcGrFgfqhEdjYDIZI/QnKyNEpDpJwpJU+J?=
 =?us-ascii?Q?SVM0KKaYjETl+/LRsw8E21pKYFYHnjid/YCEYZQL5qwpVq/ZcN/kwxWCsagS?=
 =?us-ascii?Q?bfcxjjaBlBA4hi6xmFZybwe/zcaGV88oI8JCg54lfna3gEZ9J0N2riHUyVtI?=
 =?us-ascii?Q?qfuOF0uomwcYrK6StbbzO39A5Ywdjgw9a1IxK5gPf6zTqhA2uPg7ztg33eyy?=
 =?us-ascii?Q?6VTvM4q1H7Z/tb7POH1PFuWtL5M+uH2nOootcOIgObMmvgzRVbA+JU7PJcmv?=
 =?us-ascii?Q?iHNCuLdAMXQFnZ4BhKL89KiEBe4Gpb1Bx2dRk/SCetekXVdsRxGyGMN9lyU6?=
 =?us-ascii?Q?aR9k0p25zaq8lZswz0srfCgF1sqvrw9MkBdB9EouJdCQAdJZmGj6IPlG44UV?=
 =?us-ascii?Q?qAfJsUsEPKvhhePYLr+sU5SVS/i/UlBlF3lhXMMU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a07de21c-657e-41a5-0882-08dd4185cf76
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 23:28:32.7099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/4y8ymVRLmqbJCefOn4ZG+H2GjTQBuKntlDInWjK2gXgSbmjhCT5AckkodFx/80MIl7z64BHOz65JSHtdlzcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8407
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

On Wed, Jan 29, 2025 at 12:54:04PM +0100, David Hildenbrand wrote:
> There is no need for the distinction anymore; let's merge the readable
> and writable device-exclusive entries into a single device-exclusive
> entry type.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/linux/swap.h    |  7 +++----
>  include/linux/swapops.h | 27 ++++-----------------------
>  mm/mprotect.c           |  8 --------
>  mm/page_table_check.c   |  5 ++---
>  mm/rmap.c               |  2 +-
>  5 files changed, 10 insertions(+), 39 deletions(-)
> 
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index 91b30701274e..9a48e79a0a52 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -74,14 +74,13 @@ static inline int current_is_kswapd(void)
>   * to a special SWP_DEVICE_{READ|WRITE} entry.
>   *
>   * When a page is mapped by the device for exclusive access we set the CPU page
> - * table entries to special SWP_DEVICE_EXCLUSIVE_* entries.
> + * table entries to a special SWP_DEVICE_EXCLUSIVE entry.
>   */
>  #ifdef CONFIG_DEVICE_PRIVATE
> -#define SWP_DEVICE_NUM 4
> +#define SWP_DEVICE_NUM 3
>  #define SWP_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM)
>  #define SWP_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+1)
> -#define SWP_DEVICE_EXCLUSIVE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
> -#define SWP_DEVICE_EXCLUSIVE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
> +#define SWP_DEVICE_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
>  #else
>  #define SWP_DEVICE_NUM 0
>  #endif
> diff --git a/include/linux/swapops.h b/include/linux/swapops.h
> index 96f26e29fefe..64ea151a7ae3 100644
> --- a/include/linux/swapops.h
> +++ b/include/linux/swapops.h
> @@ -186,26 +186,16 @@ static inline bool is_writable_device_private_entry(swp_entry_t entry)
>  	return unlikely(swp_type(entry) == SWP_DEVICE_WRITE);
>  }
>  
> -static inline swp_entry_t make_readable_device_exclusive_entry(pgoff_t offset)
> +static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
>  {
> -	return swp_entry(SWP_DEVICE_EXCLUSIVE_READ, offset);
> -}
> -
> -static inline swp_entry_t make_writable_device_exclusive_entry(pgoff_t offset)
> -{
> -	return swp_entry(SWP_DEVICE_EXCLUSIVE_WRITE, offset);
> +	return swp_entry(SWP_DEVICE_EXCLUSIVE, offset);
>  }
>  
>  static inline bool is_device_exclusive_entry(swp_entry_t entry)
>  {
> -	return swp_type(entry) == SWP_DEVICE_EXCLUSIVE_READ ||
> -		swp_type(entry) == SWP_DEVICE_EXCLUSIVE_WRITE;
> +	return swp_type(entry) == SWP_DEVICE_EXCLUSIVE;
>  }
>  
> -static inline bool is_writable_device_exclusive_entry(swp_entry_t entry)
> -{
> -	return unlikely(swp_type(entry) == SWP_DEVICE_EXCLUSIVE_WRITE);
> -}
>  #else /* CONFIG_DEVICE_PRIVATE */
>  static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
>  {
> @@ -227,12 +217,7 @@ static inline bool is_writable_device_private_entry(swp_entry_t entry)
>  	return false;
>  }
>  
> -static inline swp_entry_t make_readable_device_exclusive_entry(pgoff_t offset)
> -{
> -	return swp_entry(0, 0);
> -}
> -
> -static inline swp_entry_t make_writable_device_exclusive_entry(pgoff_t offset)
> +static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
>  {
>  	return swp_entry(0, 0);
>  }
> @@ -242,10 +227,6 @@ static inline bool is_device_exclusive_entry(swp_entry_t entry)
>  	return false;
>  }
>  
> -static inline bool is_writable_device_exclusive_entry(swp_entry_t entry)
> -{
> -	return false;
> -}
>  #endif /* CONFIG_DEVICE_PRIVATE */
>  
>  #ifdef CONFIG_MIGRATION
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 516b1d847e2c..9cb6ab7c4048 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -225,14 +225,6 @@ static long change_pte_range(struct mmu_gather *tlb,
>  				newpte = swp_entry_to_pte(entry);
>  				if (pte_swp_uffd_wp(oldpte))
>  					newpte = pte_swp_mkuffd_wp(newpte);
> -			} else if (is_writable_device_exclusive_entry(entry)) {
> -				entry = make_readable_device_exclusive_entry(
> -							swp_offset(entry));
> -				newpte = swp_entry_to_pte(entry);
> -				if (pte_swp_soft_dirty(oldpte))
> -					newpte = pte_swp_mksoft_dirty(newpte);
> -				if (pte_swp_uffd_wp(oldpte))
> -					newpte = pte_swp_mkuffd_wp(newpte);

So just to check my understanding the idea is we now check vma->vm_flags in
restore_exclusive_pte() to restore them as read-only in the case of mprotect()
write protecting the range? That makes sense to me, so assuming that's true:

Reviewed-by: Alistair Popple <apopple@nvidia.com>

>  			} else if (is_pte_marker_entry(entry)) {
>  				/*
>  				 * Ignore error swap entries unconditionally,
> diff --git a/mm/page_table_check.c b/mm/page_table_check.c
> index 509c6ef8de40..c2b3600429a0 100644
> --- a/mm/page_table_check.c
> +++ b/mm/page_table_check.c
> @@ -196,9 +196,8 @@ EXPORT_SYMBOL(__page_table_check_pud_clear);
>  /* Whether the swap entry cached writable information */
>  static inline bool swap_cached_writable(swp_entry_t entry)
>  {
> -	return is_writable_device_exclusive_entry(entry) ||
> -	    is_writable_device_private_entry(entry) ||
> -	    is_writable_migration_entry(entry);
> +	return is_writable_device_private_entry(entry) ||
> +	       is_writable_migration_entry(entry);
>  }
>  
>  static inline void page_table_check_pte_flags(pte_t pte)
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 49ffac6d27f8..65d9bbea16d0 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2470,7 +2470,7 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
>  	 * do_swap_page() will trigger the conversion back while holding the
>  	 * folio lock.
>  	 */
> -	entry = make_writable_device_exclusive_entry(page_to_pfn(page));
> +	entry = make_device_exclusive_entry(page_to_pfn(page));
>  	swp_pte = swp_entry_to_pte(entry);
>  	if (pte_soft_dirty(fw.pte))
>  		swp_pte = pte_swp_mksoft_dirty(swp_pte);
> -- 
> 2.48.1
> 
