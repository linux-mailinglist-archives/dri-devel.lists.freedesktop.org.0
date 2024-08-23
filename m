Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B52D95D1F5
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 17:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3132510EC59;
	Fri, 23 Aug 2024 15:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N0igvLUv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F0010EC55;
 Fri, 23 Aug 2024 15:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724428045; x=1755964045;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4KIRSv8I4CU+Q+MOIcjlRiGF9W6kpHM/3lCJQghLqSE=;
 b=N0igvLUvZaqIPQBxJxggYrf5DJwZ4VfJ1GiIWR+qFqbPaXYrgcNGEmSg
 lO4aukpmusbVYrZK2+kPFzmalXRMMYqZlphb1SZOsi5hY6GDXrzFuv8ZG
 x9lD7dBNiTS79X4WvjR9461EssgkLXXCeIudemjbHnFD4SYHkAGz07IqR
 ssxBBjfHlKzX3WONddVZuS1CSOR0MiMlNZymq0qlvVMYfrzy3d4L30yp+
 mOVrCguTeQyj64iiqfGyYJMHBqFKS/2PjSC138Kvmabm2s0vFO3vy3+6N
 gc3JoRUuxVLAPQfksdEGCmQf+4vwhuyuxBn2WEz54dOl3ZyYaH8BdGhkl g==;
X-CSE-ConnectionGUID: FEXEO2X3Q0K0/UJLMZDJlA==
X-CSE-MsgGUID: pZ0qgy+VTQ6jCuDKxCI4wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="40364257"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="40364257"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 08:47:24 -0700
X-CSE-ConnectionGUID: KS5nTaKNQ1aukBbVd3I4JQ==
X-CSE-MsgGUID: 7sktqFyLSBaqrEhLH+X36g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="92558384"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Aug 2024 08:47:25 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 08:47:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 08:47:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 08:47:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ab+4NSFDITzzxmhqO3f7Df+fGGJpQHqSDQE3ssU4VafbZINWeQiXFTFLReaUcD2zyhCnLiRyMYJZLqYK6lCBcWgfOPxstRomF9m92eja8rYkg9lvl9x9Fhzv6wnpGrM6dP0zbl4da38OFvsckVHcbdXa8LOyf8Vfxy14w3a/5PbdE14ISwu9bxePbPKIHZA9AFbaDc8UvofaV7Xc1BPUIHv4TqzyXgZ1DNbVdSBLLowFVCeZDbjTnqAJbYMDviGfZGPPTSuu6NmlPFympHfJ98F/yQua7Uh35vTok8aB+yLwRpKqj1THMfVmpJOe0NS/pWaHq6Xb6ZoqfpYwiAE49w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIVCVPJPqe9S7lUXFH3fOr4JPAJvRhsWF29ommzDVq4=;
 b=YOLOPNetsFJy6Kmr+Ga+hF+zDaYA6UPcwca/gObGDUZSy/BGdCT+vZUuVGmsUCPDMxWST3S+Nu8VUd3ypJcJcF0BTyn99JP0BrBg0w/iLtc/UdXeDjBqknh69rs5D4ATff7Ri/VJrcjYpQ+6/MCNfUtJuchxwXwiK24cmhEgVzSHgpimRJOHwUcjQiLcE7OR6gDQG9LFts9mhlYJVmkJEfOQ644OkdzSXoeeai5R3G+hrFhfaj+CM3avFIFTtbh74ZNZaBzhfjG61j3yiHZ+nm/EI6YxbzPRcfjYD8fS6hNtG146oIZPmKrPROYPvfO2tscs4OliTeqwaetdF6p6jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB8353.namprd11.prod.outlook.com (2603:10b6:208:489::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 15:47:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Fri, 23 Aug 2024
 15:47:18 +0000
Date: Fri, 23 Aug 2024 15:46:05 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <intel-xe@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <sumit.semwal@linaro.org>, <daniel@ffwll.ch>
Subject: Re: [PATCH v3 1/2] dma-buf: Split out dma fence array create into
 alloc and arm functions
Message-ID: <ZsiuvXACGYdm+Ons@DUT025-TGLU.fm.intel.com>
References: <20240823045443.2132118-1-matthew.brost@intel.com>
 <20240823045443.2132118-2-matthew.brost@intel.com>
 <f7fcb678-afb2-428e-abad-af9892823e60@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7fcb678-afb2-428e-abad-af9892823e60@amd.com>
X-ClientProxiedBy: SJ0PR03CA0299.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB8353:EE_
X-MS-Office365-Filtering-Correlation-Id: d7201599-540c-402b-a38c-08dcc38ade50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?RU05Xkc+oInuVsgMAO2tqjn6Tc5qR5frTn/3R6d74TWcqPVgs20U2fWUUJ?=
 =?iso-8859-1?Q?CAab1suCFgVPBSQQm3CfUdM4wBYSJBIKnvHp9YsYrpafGZz8Si7AWuauL7?=
 =?iso-8859-1?Q?3zCoSUL0qYC5txQoN+Y5VQkiC00WaBQT67rmzy2ZetcWKfxO/gKLs8sA14?=
 =?iso-8859-1?Q?J3UDvnWn4pnSyyF8dHnVTJOP8jhoQBCcBXuy+ZRk1r/GSUdkSuGzm8FZ7r?=
 =?iso-8859-1?Q?FLCZEM4jmA3qTIoOVXLuAt2oqP+iHXyPFDx8uknlOGpkajL/n60h6dvywR?=
 =?iso-8859-1?Q?RTs1/QmBUqt/eF16bOzuWiDLVlHvhJJ6sl7CHEMn+1Yutr4Y8ZTB4Y+z/H?=
 =?iso-8859-1?Q?RQ2pbl5h5tSDXbk+GaE+0COElqIaLyzUPtaqyCsGytwrP5LLlw3Zqnql5T?=
 =?iso-8859-1?Q?6zpuZjSVNIjAV4t+T+LZpHk4MqT7cjQNeitA9uVQfPb3WC5B1MgeLTuDuf?=
 =?iso-8859-1?Q?uvV8ZJZmqYadEcwMKEQOqCyGebxO7iTGin/Bpg51FlLdsELwIdBtGTgEzX?=
 =?iso-8859-1?Q?QxDjpIHmUk7exsVrHgVshVldYGahT6yGWap+1t7JLK5id3pr8cEia4cmPY?=
 =?iso-8859-1?Q?mbRA99Ga7ePvuyA7z5RKuvOkjE21tAJcrs9E0w7z4kRfrYG9La690WfFgY?=
 =?iso-8859-1?Q?nawp9mh+oURPhDE3+Q2PN5LFK5iCdTn+xzJbSXwD3W+9ty1/2tG56AmYfZ?=
 =?iso-8859-1?Q?T2bU8sLSD+O64WsPSwu1tKmrqfDO7wHSu+jnWIkraAt+ZuHtxQYbAegASg?=
 =?iso-8859-1?Q?lxzLzOgQqn4ZpX0fmcufgDRurYPg86C4fN89t4MP1w/5G+SDoc7+LSec95?=
 =?iso-8859-1?Q?yf4crGIAsvUprxOEhmfmHh6Tun7gVyd7GwEyM564Bk/QaBVxoPSB4aZ2s9?=
 =?iso-8859-1?Q?7TjgVaj6oXdJw39Y2+xvjdhsQ7JRUUDg864/YyqSkZmdr6wk1UfQ0z+igf?=
 =?iso-8859-1?Q?hRnwaKi3uQQmMQ+bPfvXnVJBAkafw4FCjJRj5YkFgHVY9Yc8wElIY4t1+T?=
 =?iso-8859-1?Q?7NAJWSM/wWM/k3cbs+Cm9fpoNNI+W1BA1xr7SLCAmqIqobre1lFfkVp0QM?=
 =?iso-8859-1?Q?7THHVgzqZRv2P9Xkudxc0CyRtJh4wtH9iH/uZ+hz1fBMjkszD+JbxtcghY?=
 =?iso-8859-1?Q?jDjy180Jewa+j9ZAXPUbPgW0GGLrfCl1ZdzmCd8l3NVE08e1ifPU4pADNN?=
 =?iso-8859-1?Q?mWSZTld5FOSw+1JCBSTssTeRikwDolAxdUWGP9Z2+V2NQy5xHI2E+cOLR9?=
 =?iso-8859-1?Q?0SUwbaDesXzVowahj8OUvyaTv8/1A/PKwY4Z7CVgR+Rmwa7l1N9IHivb3v?=
 =?iso-8859-1?Q?jJgSsjLgDP0Tz3A+C/5DHYw/vyUiPKfZ6euD6K+SI/rV5WHQQ61DjuXxrj?=
 =?iso-8859-1?Q?82p/e7rzDwQVcKD87JurCZxJwMNtwqBA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?21ZvHdMmNMvw7v/vbFNgV57VoIvL522y6vFS35w5phTl6o6nUULUxlYQav?=
 =?iso-8859-1?Q?WRhDNLnAVqfzeCpN7zbRqDs5wVouptU64AKE4+t2Y7dNtgbOH2U36LN18C?=
 =?iso-8859-1?Q?2cldTGOiREKIDCSK/MgyFqktTgexhDEGA3J/SImvoDOdk+E6YzZpfX1c/y?=
 =?iso-8859-1?Q?dHR4SgrNa3XtoJomo3yJHUS2s63t0lLPrnUXaAdTKtw6fLRsLx8CDXLMN2?=
 =?iso-8859-1?Q?i3YkiD0G1sZDEUhSRu1Q8K2ca8zdRwfwxZ4qT7aGjDmtSi2YoBAZkOvkeM?=
 =?iso-8859-1?Q?5ldf+KnBaMFSl1zN416s0BTUSJ/s1Icr1sjWBZUfGV2xsfy1y3F0xBrPAN?=
 =?iso-8859-1?Q?ThjO5FkS/SahLFXKpm2whTy/6PeNlRlF7AJrrVOGuN4Ijj2iNtzkK3UqF4?=
 =?iso-8859-1?Q?ZBCd5chWPPKxA2fiwOHwH5OQD7A0rP+0oTlBrIOX0BARUQ6TWpEN8vuIi3?=
 =?iso-8859-1?Q?qt7QTeiCwyjxuKlUESQ2aJGkKWgbcQaO8jjlSt4lR6/2rec60f0TnlgcW+?=
 =?iso-8859-1?Q?jLA/8/nnxDDH1/hqjt4ZznI0jWjAJloSwMZNcQ5LlqsBbk8HJ1PH3nniJJ?=
 =?iso-8859-1?Q?upiEF6NJc443fBT61vLYFlaiTErFTpV2R0MEhU6hhHOGhQoHO4OszTafUf?=
 =?iso-8859-1?Q?k7TH83eqZ2JRenUq5uj573LS7z9dXnnSDkifuV0BBbvwl4B29AvC0v8WQS?=
 =?iso-8859-1?Q?yeO8MBuRZ+4diFomf7CQDKumj6F9ktxZTK/+svBZ1/GSSpwOF2AjEGgCM2?=
 =?iso-8859-1?Q?XSoX052GiR+2cUQMj4IE8nFDNUrvMZ6GbgCrXa1uEd/fmSuicRSI3Q3rgv?=
 =?iso-8859-1?Q?RyPHmRiYYp/nH8SK3Ahnfn4DpM//eWFIShU6i4d8eUBAu4G//djUx3X7J7?=
 =?iso-8859-1?Q?0lpHBrhItrcKi6SgtHwAfCZs3e7ndE/DHdxRsNKqAWS9Lg7FpVU6z0im8f?=
 =?iso-8859-1?Q?7JAskqSTNbEdpE101y+A6uoR7QUPxHqoy+9EYnTxMV9OzX/Fbxy7hnJ249?=
 =?iso-8859-1?Q?cEcPGXhAI1Zqj5KIArjxujfRA5zCzXYBjM4pPuxLtLsAUsyMk2rwJ6duQV?=
 =?iso-8859-1?Q?fRhvG8xbe2658dFXEv/yqgSXI08MAntWzZViAUyOuNtPIZyCS0is8iYMwR?=
 =?iso-8859-1?Q?AaN/Mx9QxcyrGuRDRxC1KAofluJ7Y3qVpYrpmLtw90S34fm/X1b2lCo5iS?=
 =?iso-8859-1?Q?x9WQIQbc2Dds73E7EBR2Y8Obq2SzRQQ3obErwwOobQ+tOl9iK0wflA3ZZf?=
 =?iso-8859-1?Q?3nzkxXEzim/0gS9UT3iqdcJ3eTbxU3lhy8y55dqKipoApuvybqolStkYO6?=
 =?iso-8859-1?Q?4a9+xFjteTzxjAC1yGSCo6bRdvv2s1JGfXVUO2KSuuhSEDaUyHO70ibL/n?=
 =?iso-8859-1?Q?TIM4+UuIDY+aEsgU9ahW+wcGfbLWfAUDbp3TJfkJJQMtJAHHzKmSKMJEzq?=
 =?iso-8859-1?Q?6Y3DlMHzgiwH9Ma12paaewPArjfZ/k3OlevJMMubrGftk+FvBMuop+iNP2?=
 =?iso-8859-1?Q?wnzdRFlIVhyPrsKDMM2/xZt6/LCapSSHHKoLFuenw1Vgg+RgacIYz01br4?=
 =?iso-8859-1?Q?j/mzi45fH+sueopuaf8dxASHQu0XQCld76PsJCDIav4OYIJg1LKoXM6EXO?=
 =?iso-8859-1?Q?TwZwkExUmLRacOvZKxI9/xc4Ge439JajldE0oNjMCN5G06yRbWSq0eRQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7201599-540c-402b-a38c-08dcc38ade50
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 15:47:18.3603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YBCSgsgKcVYrcB/R0m7lTf4mvYo+uU6qhIHMa/4f7k+3LMt7GX4/AHG20e9khhDoGYOyxpFu7MwmyWvMQPlC3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8353
X-OriginatorOrg: intel.com
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

On Fri, Aug 23, 2024 at 08:37:30AM +0200, Christian König wrote:
> Am 23.08.24 um 06:54 schrieb Matthew Brost:
> > Useful to preallocate dma fence array and then arm in path of reclaim or
> > a dma fence.
> 
> Exactly that was rejected before because it allows to create circle
> dependencies.
> 

Can you explain or do you have link to that discussion? Trying to think
how this would be problematic and failing to see how it is. 

> You would need a really really good argument why that is necessary.
>

It seems quite useful when you have a code path in which you know N fences
will be generated, prealloc a dma fence array, then populate at
later time ensuring no failures points (malloc), and then finally
install dma fence array in timeline sync obj (chain fences not allowed).

It fits nicely for VM bind operations in which a device has multple
TLBs and the TLB invalidation completion is a fence. I suspect Intel
can't be the only device out their with multiple TLBs, does VM bind, and
use timeline sync obj.

Matt

> Regards,
> Christian.
> 
> > 
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Christian König <christian.koenig@amd.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/dma-buf/dma-fence-array.c | 81 ++++++++++++++++++++++---------
> >   include/linux/dma-fence-array.h   |  7 +++
> >   2 files changed, 66 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> > index c74ac197d5fe..b03e0a87a5cd 100644
> > --- a/drivers/dma-buf/dma-fence-array.c
> > +++ b/drivers/dma-buf/dma-fence-array.c
> > @@ -144,36 +144,38 @@ const struct dma_fence_ops dma_fence_array_ops = {
> >   EXPORT_SYMBOL(dma_fence_array_ops);
> >   /**
> > - * dma_fence_array_create - Create a custom fence array
> > + * dma_fence_array_alloc - Allocate a custom fence array
> > + * @num_fences:		[in]	number of fences to add in the array
> > + *
> > + * Return dma fence array on success, NULL on failure
> > + */
> > +struct dma_fence_array *dma_fence_array_alloc(int num_fences)
> > +{
> > +	struct dma_fence_array *array;
> > +
> > +	return kzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
> > +}
> > +EXPORT_SYMBOL(dma_fence_array_alloc);
> > +
> > +/**
> > + * dma_fence_array_arm - Arm a custom fence array
> > + * @array:		[in]	dma fence array to arm
> >    * @num_fences:		[in]	number of fences to add in the array
> >    * @fences:		[in]	array containing the fences
> >    * @context:		[in]	fence context to use
> >    * @seqno:		[in]	sequence number to use
> >    * @signal_on_any:	[in]	signal on any fence in the array
> >    *
> > - * Allocate a dma_fence_array object and initialize the base fence with
> > - * dma_fence_init().
> > - * In case of error it returns NULL.
> > - *
> > - * The caller should allocate the fences array with num_fences size
> > - * and fill it with the fences it wants to add to the object. Ownership of this
> > - * array is taken and dma_fence_put() is used on each fence on release.
> > - *
> > - * If @signal_on_any is true the fence array signals if any fence in the array
> > - * signals, otherwise it signals when all fences in the array signal.
> > + * Implementation of @dma_fence_array_create without allocation. Useful to arm a
> > + * preallocated dma fence fence in the path of reclaim or dma fence signaling.
> >    */
> > -struct dma_fence_array *dma_fence_array_create(int num_fences,
> > -					       struct dma_fence **fences,
> > -					       u64 context, unsigned seqno,
> > -					       bool signal_on_any)
> > +void dma_fence_array_arm(struct dma_fence_array *array,
> > +			 int num_fences,
> > +			 struct dma_fence **fences,
> > +			 u64 context, unsigned seqno,
> > +			 bool signal_on_any)
> >   {
> > -	struct dma_fence_array *array;
> > -
> > -	WARN_ON(!num_fences || !fences);
> > -
> > -	array = kzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
> > -	if (!array)
> > -		return NULL;
> > +	WARN_ON(!array || !num_fences || !fences);
> >   	array->num_fences = num_fences;
> > @@ -200,6 +202,41 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
> >   	 */
> >   	while (num_fences--)
> >   		WARN_ON(dma_fence_is_container(fences[num_fences]));
> > +}
> > +EXPORT_SYMBOL(dma_fence_array_arm);
> > +
> > +/**
> > + * dma_fence_array_create - Create a custom fence array
> > + * @num_fences:		[in]	number of fences to add in the array
> > + * @fences:		[in]	array containing the fences
> > + * @context:		[in]	fence context to use
> > + * @seqno:		[in]	sequence number to use
> > + * @signal_on_any:	[in]	signal on any fence in the array
> > + *
> > + * Allocate a dma_fence_array object and initialize the base fence with
> > + * dma_fence_init().
> > + * In case of error it returns NULL.
> > + *
> > + * The caller should allocate the fences array with num_fences size
> > + * and fill it with the fences it wants to add to the object. Ownership of this
> > + * array is taken and dma_fence_put() is used on each fence on release.
> > + *
> > + * If @signal_on_any is true the fence array signals if any fence in the array
> > + * signals, otherwise it signals when all fences in the array signal.
> > + */
> > +struct dma_fence_array *dma_fence_array_create(int num_fences,
> > +					       struct dma_fence **fences,
> > +					       u64 context, unsigned seqno,
> > +					       bool signal_on_any)
> > +{
> > +	struct dma_fence_array *array;
> > +
> > +	array = dma_fence_array_alloc(num_fences);
> > +	if (!array)
> > +		return NULL;
> > +
> > +	dma_fence_array_arm(array, num_fences, fences,
> > +			    context, seqno, signal_on_any);
> >   	return array;
> >   }
> > diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
> > index 29c5650c1038..3466ffc4b803 100644
> > --- a/include/linux/dma-fence-array.h
> > +++ b/include/linux/dma-fence-array.h
> > @@ -79,6 +79,13 @@ to_dma_fence_array(struct dma_fence *fence)
> >   	for (index = 0, fence = dma_fence_array_first(head); fence;	\
> >   	     ++(index), fence = dma_fence_array_next(head, index))
> > +struct dma_fence_array *dma_fence_array_alloc(int num_fences);
> > +void dma_fence_array_arm(struct dma_fence_array *array,
> > +			 int num_fences,
> > +			 struct dma_fence **fences,
> > +			 u64 context, unsigned seqno,
> > +			 bool signal_on_any);
> > +
> >   struct dma_fence_array *dma_fence_array_create(int num_fences,
> >   					       struct dma_fence **fences,
> >   					       u64 context, unsigned seqno,
> 
