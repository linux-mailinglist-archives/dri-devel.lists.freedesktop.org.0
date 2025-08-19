Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9AEB2BE5A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 12:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E462710E58A;
	Tue, 19 Aug 2025 10:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hOByNF2u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2EC10E588;
 Tue, 19 Aug 2025 10:03:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QUNSCFRBhurTU/CNM/z/1AaFNFmpveR7SJNbRXb8nkYQCpt4RQ/PVj4RgoZAWklRvVdD4a95WV8LUcrfmVIOOFUGoyxZqheVonWhcfzgzqIc0FoVexGmqY5tL5P9TzcyhpHRHgPgKQu5CsUIjBx68Mt0MJOhj7fHB6Su2zOKtcYbtgWNrwICcxTSnOQzTHNRKk12WloSL6UV8ZbSE7L5Bd1AmbaISwDbYJ+YbV6Az6q+FUfoptq06Do9XRweEk+6DZl8YniyEI2ajwJzoKIrQ3gdAqYzGX/vEN8JgsQzPq0WCprnx6PLGSm6BARprUYOsB5y6aIunR5N/SpGySJpXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SumC/VSzvpwE1LHGvoFyRPRuH37QUOL8/IN8OMRO4P4=;
 b=CKx0SXLUx7FwkvMDasIym93sWoyXSpEeQw5YGV+Q8qb7Tu0WZO6YJWaIBTeGs23KCSCChF/SOeEQdKe1uEwvxOsWYQ1kUAU24wfQ3NiPe0DBQxWEafVhgWLNvy8ptvvXvhEOE3oDZVqfR7vepovWQMVSKNdePYsWEYqLHxXrwL3joPwjj7shZspze/ESIDrqnMnMMv80GwhzQgRS1b8Dwyt+lNemvCQLnwqHN7IbbVnhyTfKvo3ZRjx5pfS4sO+FwUnYfjUwyy4VZ3rRZ0xfBdipZqCEEUmfeb/LbI51bfpk9lCyKqUwvkSvZbMTTJ99bbjzcaqLYi5Xa0dpKjJaqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SumC/VSzvpwE1LHGvoFyRPRuH37QUOL8/IN8OMRO4P4=;
 b=hOByNF2uqa3vAtJk2Qmxb8M0uufZYfwDrbcfMjr64E6C7ialrJfz7o4JxajQNvSjlLETo9kn73QVXaL7udsR/NLiTKAv/klddOm/+LDAN16Q8l+uhP6+Lm1wK0sREPzHMxAV/YYf6MsXQzkDIFPWjQjytF2dHGCbabVNVgA3/hWV4CBRr7+MKjtXj+lhDSNUgxPrD9cHMlWiB/Hq/vq+0uzcd2EoIxs+aHFqpapQyczyrhvFbHCG/aeAKGGmSyGi2nHJ6rAyGtRI3Cr4ziBqCing6uVEoghtykTN4xvif46S0EzAekoruW+SStdaTQbkGLcFBN0UnFKAs++NtDFjqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7705.namprd12.prod.outlook.com (2603:10b6:930:84::9)
 by IA0PR12MB8207.namprd12.prod.outlook.com (2603:10b6:208:401::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 10:03:13 +0000
Received: from CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6]) by CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6%7]) with mapi id 15.20.9009.017; Tue, 19 Aug 2025
 10:03:13 +0000
Date: Tue, 19 Aug 2025 20:03:08 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Matthew Brost <matthew.brost@intel.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [RFC PATCH 1/6] mm/mmu_notifier: Allow multiple struct
 mmu_interval_notifier passes
Message-ID: <yzgn3nbaeftrthqwddwt3gap4uni4api2r2uik2gxoimnpdiy7@hty77udv6un2>
References: <20250809135137.259427-1-thomas.hellstrom@linux.intel.com>
 <20250809135137.259427-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250809135137.259427-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MEVP282CA0068.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:202::12) To CY8PR12MB7705.namprd12.prod.outlook.com
 (2603:10b6:930:84::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7705:EE_|IA0PR12MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: c29403ce-3ca0-4eca-38f4-08dddf079c3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Q/ezvpKl1oTp6BYtuQc7sRsXChLhCoJLGYSuhJo5eaAHNdtPlA7MwB2Shp?=
 =?iso-8859-1?Q?cv0oFrIAyk37CmANdXAWIfMXdya8HcLQUCpvaKy0RXLkO1KEydYMtNMmRx?=
 =?iso-8859-1?Q?wlL/u5sqDmR+AC9z3wtSgHAapTzTMDTWlbm/RX3bYAUY6Co0vyCUjMovhw?=
 =?iso-8859-1?Q?n9s+f2okXOVzEHfUZxmTz3az3A4GU0n2i2ZcDDoffFOpsvBaJY4XVpXhc2?=
 =?iso-8859-1?Q?s4sv+z0FSXVQuYg5L9RVuV6GR6DUNCX1lv6Rd4kUOsRxvGLq2wvb87E8yw?=
 =?iso-8859-1?Q?Uh8aEOA6iKpaiAchTb7aR4CdtyS4P4AfWVb2AbMFEH0Dliqln1uWkoP5Bo?=
 =?iso-8859-1?Q?cEXgD5LsWcCpIl5LKRgpDm/Adjcb5HMyB9OvVt2+BPHeWp5lxIrkefqeGY?=
 =?iso-8859-1?Q?vxYtRnG+92FMKF7Cjl1IKA5xj23Zenux3cu2YRcQCNbHs1f7efxG9lknNL?=
 =?iso-8859-1?Q?CNtDZ/xc91xyuz56Mx3+FyK9JZaMHPC9f1tfmQkXIGfvlL1p6PvVM7DY4S?=
 =?iso-8859-1?Q?SAq50gJJA8N49cBKDK8jbNMfKzQfKBCKXJSzs0U/IutTLx0/DmhnUpui+2?=
 =?iso-8859-1?Q?hXZ7axQwjXT+Pp0hcbVlDguMZc6VvC6Xe091h9KetK44aX20QcB8+WOY1s?=
 =?iso-8859-1?Q?Zx5RUOhxmOviEfknalJQrF0/PvP/GHkQ1+ByytEOFMh9IFrJ13G3XZoEoj?=
 =?iso-8859-1?Q?sKO9U/MT3OPoxJA7siNi3waGqp/fn0AhFJ1TQp2nKSb60fnwa62sIHGIbr?=
 =?iso-8859-1?Q?Aryyi/6nmxFPZzALaurGoq6RFN33nsWJl9+TULk4IpIE/IU0XRdHBYAcx0?=
 =?iso-8859-1?Q?tBJCiACrj8kylxUxuHTCKtCRlthN1sqUrjPZ3aXgEHIkwK59qtUc+VhBmD?=
 =?iso-8859-1?Q?lQ2HpwE5rWWH4DAUqItyL84U3qegj3NObKZsb8Cqi4gD+HnrUVVy54geRT?=
 =?iso-8859-1?Q?rx7yBjr7wASMSOhNSl7DFBYcMGKZrV1LtrCMKLt9cbnVfuNMCDBzWLidd4?=
 =?iso-8859-1?Q?5L+SZNtEwiPP4NVs1XNuzjTTt8eOc8SVfldpjTTv/i6vAUVGbBBtgpm7xv?=
 =?iso-8859-1?Q?1ZnklEytSKvbzUklIcozyRJhrolZdXuaCHfyM8Dug6taNjZmoqjRbdKHh5?=
 =?iso-8859-1?Q?oOeIFWWcWLrlQYri0ooH/oeDO+7LUXQS8n1CVWV1xKzjsrr3o74SLW5JhJ?=
 =?iso-8859-1?Q?LvNsQ+ssmHNmrMhNgBhgmasHJ5eYSo2nXk/tdtelr89MQJGNbF/9L/SCfO?=
 =?iso-8859-1?Q?Ypwe2UrqW85ssdKl4HHKR6lMtvhqw47Mr+ioSaFVGEPTx10B8hoxVcyNAD?=
 =?iso-8859-1?Q?G0QmKh0tuw+hNyAQvgqMSIHctFfA3DyYl3VqT7vI29INTgzF/RmOnt9nwm?=
 =?iso-8859-1?Q?QCydp0rMmVsnmCnqPs1t+WaZsxXnclqymCzNLl51fV5ulWYfxmyiwd/lRB?=
 =?iso-8859-1?Q?B5Z3zNjuTjfZOhAZjV0GjLTaVCS7XVlrEcQuESPEQGF47/WYwANXF0RRV8?=
 =?iso-8859-1?Q?E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR12MB7705.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xdxL5euI9JcKZFG0W2hICIpyif9S4SaDFzuM09y33QvWOHlzZQ9JuRVsOk?=
 =?iso-8859-1?Q?YjSJbfYf8oan48VPvPo5rb5GlU18OiN3C5EbzhizUxz4No2z9OS5aPEaR7?=
 =?iso-8859-1?Q?cJ3qKNsXvPVVvC3XQ12BcmjgQTm92BupMPNnnOuY95TZkQcmHg2XX87RF6?=
 =?iso-8859-1?Q?UeZXf0IyBhMebzsLJM30OYXZHO1pTDfWnGBHOJYh+Z0hWcQu+FEtDaH4a+?=
 =?iso-8859-1?Q?PYDmJB1v4I4HO4ISCznuhoBstFsKxPJCa9PFj5/g5AMVggroHnIRHJWeoi?=
 =?iso-8859-1?Q?DgMhdr5MvhosIlCbhkjok5pjfZWefbGV1zyyy9/nEUUYJ5IM19Qwz23eO7?=
 =?iso-8859-1?Q?M7Jbw+v0SJrrJl+6Ud5anpbcJRL+JwHnnmOXqN0u2ATwBDZKTNjZYSC+qR?=
 =?iso-8859-1?Q?HBKjtw/GHuH75wkbB1i+sHtJT3U21RHJu9OREpesp2EfoU/62ZkynZhjWw?=
 =?iso-8859-1?Q?WW+QQ4VsSLKfOEDyIdxqDfYi+5Y5EoDdEyNw895sh+ZsfkGfd+sx9u0Ojp?=
 =?iso-8859-1?Q?fW17bOVvcmgaDLCwrsU7p6iC1AB8YgoyGax2seZTevWcRiHEU4Rih8Qm0r?=
 =?iso-8859-1?Q?rn4JjXKsBAHI5xqfkf4A0kQu0SL0tbtIy3CRv7tYyFGihaMuew0gegmo3b?=
 =?iso-8859-1?Q?AhN8MiCpv52ZwJCCA5BNvExq+KvyY/luMim0Z6O/7GZXiNwysr+uPp45Xx?=
 =?iso-8859-1?Q?IQRl2idP6yOpLDZCLs82Fu3Fwww49d4gLYVaBXK17xqBViwnADxs1JW0FX?=
 =?iso-8859-1?Q?ftRiorA0ts55xyKM2QZsl2h/fNHS3f9Kd3Qv2mv3jdgPH06FjKghJJJSCN?=
 =?iso-8859-1?Q?Dw6Di3OLIA/In49qEhEEVRkVxUWSopm695Gk72LyCJHHtmFyH5b1FDkIwj?=
 =?iso-8859-1?Q?3O2k6Bhwi77Na/D8ZLtL4nW6lhpqhvt6UudkDE7krChVsOvEyj90ZMzgHq?=
 =?iso-8859-1?Q?Hb74dO6I86AdqtUXU/VcuRXJhLPub6gIPQial95an4BBISh8u8i7rqA23M?=
 =?iso-8859-1?Q?CDG8swnwCW7z4uB5F2Z0Ova8TZWgAs7zg5AlZT1IpdJ+jgXlnFabLVbPnY?=
 =?iso-8859-1?Q?1297PMxWxPhp9UCiIqsMrEzMNSZw8LSngQGhnaHbb6td0KrnaLUMYv8j+1?=
 =?iso-8859-1?Q?Sr2+h0MBPTVKkoC6TLV2YeRZBlbotOU56baDP+/A9pU/IXJf8n/KIxXxBD?=
 =?iso-8859-1?Q?8e6ZAKJta+hgqcdLTFDzlApBNcVkKsaXfAyyYzvU2lA94fRwG4kwjsTOEv?=
 =?iso-8859-1?Q?IyyloUCZABJsLDbikBTAn0xSmcB6kkpy5aFi2UrKJ2S1tsvLwWfmmYPoF3?=
 =?iso-8859-1?Q?2Mv7AvpSEAqHG0masEM9n34R0TPW3EZ1TJUJOmp8iCYIWM9nZCXPZuNwS5?=
 =?iso-8859-1?Q?fIsAUBnLAJBNqqfKZul5XbHj1oQGD28ja+H0Y3weGANbPN8G3f1wA2GOpX?=
 =?iso-8859-1?Q?e+MC/MsHp9iRhNbDMvw+uKf1Kn77xMo4d4Ru0ozF7TbioXyHXjW7t4xDfK?=
 =?iso-8859-1?Q?gggfz568FKkImDBtS7ELn/rTaBdXAZSblY4dsxzmJD0Lf935lW0WZIRn8Q?=
 =?iso-8859-1?Q?w5TMlc1PVq0od6fJXgAaUClPlRCcHAgintpvZ4k55wu35eZUtNmQ2kdiD5?=
 =?iso-8859-1?Q?UHRRHHCousM8PC82QT+cDBoSJqzKB7Zom0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c29403ce-3ca0-4eca-38f4-08dddf079c3a
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 10:03:13.8027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R8p83f+86GxI1M7F2+w6ciD0ljRF1/peipv5s1keX37zkmxfYgpfdRIxg+YQzqOFOztnK7LBfkl/qtdf7zvS+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8207
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

On Sat, Aug 09, 2025 at 03:51:32PM +0200, Thomas Hellström wrote:
> GPU use-cases for mmu_interval_notifiers with hmm often involve
> starting a gpu operation and then waiting for it to complete.
> These operations are typically context preemption or TLB flushing.
> 
> With single-pass notifiers per GPU this doesn't scale in
> multi-gpu scenarios. In those scenarios we'd want to first start
> preemption- or TLB flushing on all GPUs and as a second pass wait
> for them to complete on all gpus.
> 
> One can do this on per-driver basis multiplexing per-driver
> notifiers but that would mean sharing the notifier "user" lock
> across all GPUs and that doesn't scale well either, so adding support
> for multi-pass in the core appears like the right choice.
> 
> Implement multi-pass capability in the mmu_interval_notifier. Use a
> linked list for the additional passes to minimize the impact for
> use-cases that don't need the multi-pass functionality.
> 
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Cc: <linux-mm@kvack.org>
> Cc: <linux-kernel@vger.kernel.org>
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  include/linux/mmu_notifier.h | 30 ++++++++++++++++
>  mm/mmu_notifier.c            | 67 +++++++++++++++++++++++++++++++-----
>  2 files changed, 88 insertions(+), 9 deletions(-)
> 
> diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
> index d1094c2d5fb6..1107a8eafd8a 100644
> --- a/include/linux/mmu_notifier.h
> +++ b/include/linux/mmu_notifier.h
> @@ -233,6 +233,32 @@ struct mmu_notifier {
>  	unsigned int users;
>  };
>  
> +/**
> + * struct mmu_interval_notifier_pass - mmu_interval_notifier multi-pass abstraction
> + * @link: List link for the notifiers pending pass list
> + *
> + * Allocate, typically using GFP_NOWAIT in the interval notifier's first pass.
> + * If allocation fails (which is not unlikely under memory pressure), fall back
> + * to single-pass operation.
> + */
> +struct mmu_interval_notifier_pass {

If we limit the number of passes to two maybe call this
`mmu_interval_notifier_finish()`? ...

> +	struct list_head link;
> +	/**
> +	 * @pass: Driver callback for additionall pass.
> +	 * @additional_pass: Pointer to the mmu_interval_notifier_pass structure.
> +	 * @range: The mmu_notifier_range.
> +	 * @cur_seq: The current sequence set by the first pass.
> +	 *
> +	 * Return: Either a pointer to a valid mmu_interval_notifier_pass for
> +	 * another pass to be called, or %NULL if processing is complete for this
> +	 * notifier. There is no error reporting mechanism for additional passes.
> +	 */
> +	struct mmu_interval_notifier_pass *
> +	(*pass) (struct mmu_interval_notifier_pass *additional_pass,

... and call this `finish()` ...

> +		 const struct mmu_notifier_range *range,
> +		 unsigned long cur_seq);
> +};
> +
>  /**
>   * struct mmu_interval_notifier_ops
>   * @invalidate: Upon return the caller must stop using any SPTEs within this
> @@ -243,6 +269,10 @@ struct mmu_interval_notifier_ops {
>  	bool (*invalidate)(struct mmu_interval_notifier *interval_sub,
>  			   const struct mmu_notifier_range *range,
>  			   unsigned long cur_seq);
> +	bool (*invalidate_multipass)(struct mmu_interval_notifier *interval_sub,

... and then this could be called `invalidate_start()`. That might address some
of the concerns with naming.

> +				     const struct mmu_notifier_range *range,
> +				     unsigned long cur_seq,
> +				     struct mmu_interval_notifier_pass **pass);
>  };
>  
>  struct mmu_interval_notifier {
> diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
> index 8e0125dc0522..dd6af87db103 100644
> --- a/mm/mmu_notifier.c
> +++ b/mm/mmu_notifier.c
> @@ -260,6 +260,22 @@ mmu_interval_read_begin(struct mmu_interval_notifier *interval_sub)
>  }
>  EXPORT_SYMBOL_GPL(mmu_interval_read_begin);
>  
> +static void mn_itree_additional_passes(struct list_head *additional_passes,
> +				       const struct mmu_notifier_range *range,
> +				       unsigned long cur_seq)
> +{
> +	struct mmu_interval_notifier_pass *p, *next;
> +
> +	while (!list_empty(additional_passes)) {
> +		list_for_each_entry_safe(p, next, additional_passes, link) {
> +			list_del_init(&p->link);
> +			p = p->pass(p, range, cur_seq);
> +			if (p)
> +				list_add_tail(&p->link, additional_passes);
> +		}
> +	}
> +}
> +
>  static void mn_itree_release(struct mmu_notifier_subscriptions *subscriptions,
>  			     struct mm_struct *mm)
>  {
> @@ -272,17 +288,32 @@ static void mn_itree_release(struct mmu_notifier_subscriptions *subscriptions,
>  	};
>  	struct mmu_interval_notifier *interval_sub;
>  	unsigned long cur_seq;
> +	LIST_HEAD(additional_passes);
>  	bool ret;
>  
>  	for (interval_sub =
>  		     mn_itree_inv_start_range(subscriptions, &range, &cur_seq);
>  	     interval_sub;
>  	     interval_sub = mn_itree_inv_next(interval_sub, &range)) {
> -		ret = interval_sub->ops->invalidate(interval_sub, &range,
> -						    cur_seq);
> +		if (interval_sub->ops->invalidate_multipass) {
> +			struct mmu_interval_notifier_pass *second = NULL;
> +
> +			ret = interval_sub->ops->invalidate_multipass(interval_sub,
> +								      &range,
> +								      cur_seq,
> +								      &second);
> +			if (ret && second)
> +				list_add_tail(&second->link, &additional_passes);
> +
> +		} else {
> +			ret = interval_sub->ops->invalidate(interval_sub,
> +							    &range,
> +							    cur_seq);
> +		}
>  		WARN_ON(!ret);
>  	}
>  
> +	mn_itree_additional_passes(&additional_passes, &range, cur_seq);
>  	mn_itree_inv_end(subscriptions);
>  }
>  
> @@ -431,6 +462,8 @@ static int mn_itree_invalidate(struct mmu_notifier_subscriptions *subscriptions,
>  {
>  	struct mmu_interval_notifier *interval_sub;
>  	unsigned long cur_seq;
> +	LIST_HEAD(additional_passes);
> +	int err = 0;
>  
>  	for (interval_sub =
>  		     mn_itree_inv_start_range(subscriptions, range, &cur_seq);
> @@ -438,23 +471,39 @@ static int mn_itree_invalidate(struct mmu_notifier_subscriptions *subscriptions,
>  	     interval_sub = mn_itree_inv_next(interval_sub, range)) {
>  		bool ret;
>  
> -		ret = interval_sub->ops->invalidate(interval_sub, range,
> -						    cur_seq);
> +		if (interval_sub->ops->invalidate_multipass) {
> +			struct mmu_interval_notifier_pass *second = NULL;
> +
> +			ret = interval_sub->ops->invalidate_multipass(interval_sub,
> +								      range,
> +								      cur_seq,
> +								      &second);
> +			if (ret && second)
> +				list_add_tail(&second->link, &additional_passes);
> +
> +		} else {
> +			ret = interval_sub->ops->invalidate(interval_sub,
> +							    range,
> +							    cur_seq);
> +		}
>  		if (!ret) {
>  			if (WARN_ON(mmu_notifier_range_blockable(range)))
>  				continue;
> -			goto out_would_block;
> +			err = -EAGAIN;
> +			break;
>  		}
>  	}
> -	return 0;
>  
> -out_would_block:
> +	mn_itree_additional_passes(&additional_passes, range, cur_seq);
> +
>  	/*
>  	 * On -EAGAIN the non-blocking caller is not allowed to call
>  	 * invalidate_range_end()
>  	 */
> -	mn_itree_inv_end(subscriptions);
> -	return -EAGAIN;
> +	if (err)
> +		mn_itree_inv_end(subscriptions);
> +
> +	return err;
>  }
>  
>  static int mn_hlist_invalidate_range_start(
> -- 
> 2.50.1
> 
> 
