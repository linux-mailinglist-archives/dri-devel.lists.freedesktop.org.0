Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC44A9BB27
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 01:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE9510E15E;
	Thu, 24 Apr 2025 23:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LD1LJg5J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FA610E15E;
 Thu, 24 Apr 2025 23:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745536690; x=1777072690;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=osrBeSFhHUSvzAHLVa2ebkgQm3xXrFlVCjIdyvXfW1g=;
 b=LD1LJg5J6ktmIZynjrxmTPH/c2u4V9ayJdN2gaalMgGyn7pfu55Pw76y
 H10q5nM7IMPuBvf9hVTTjaIm2hXhTDRnbS5b+E/wkQLjxnFCj3d4w1X2A
 E096d7MBfm8otj269+iS5AiFcxeujaGGNVuY48m4wy0ZVH7nF8umH8tmR
 ZreB8I70apRNfLuQ5vk7Wfv5HvcXnuLYXFSCwbxrNesORnV846KXThLSI
 d14UWffn5JoSvJQsxC6y4zSjQfwP6W7JKv2HrvluYMJzJKN1MnmJsun6P
 61mX4aNiEiQE8fNcYJNKaD0bPV1OoY6pXczH/68tRFIdqkvDHbsJgq2j1 A==;
X-CSE-ConnectionGUID: pBnkAg5ETJWTPhj7n9A4eA==
X-CSE-MsgGUID: GJlLIPZZR5yM0zOrJ9krWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47364157"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="47364157"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 16:18:09 -0700
X-CSE-ConnectionGUID: JO8nfIvOTACKQ3LnbRVZUQ==
X-CSE-MsgGUID: soqyyaYCTPKRlsd6S0UjPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="133281050"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 16:18:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 16:18:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 16:18:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 16:18:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qt/4sK+HP7xC09TraC6T2BvWLfGKoGJ4kxlLLag1znYVWGfQwEWPbEQAA/sQ+ScNhlIRroCdK5RxZd9OBsJeRsB6wd7/9PBrS3FZCjPNd6WUnKs1WHB8DC85LcGQvcNLrtsmzTIMnIMk/G3g+K9yqWSc8CKQIwILbNo2wza/Ry9nCfvVtCaNNGiJlJTIHuQRlvfI4y+vGsKNrQKrB9TDUVw3x0qQn6csztE3GkINfPTEqML5v1ZNQHRTa1j+cqz6TJBr1mFSpoItBoKWXcnK/3oIQ2kqWviTk+cw/ELF/cBt7yyZcBAj/o6f4BdM32Yn1FpDfanIT7CI9lJxpvWzWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2xXif2B4NkYLyRg24roEhFv0NEfwlGuwlzFDylXYsM=;
 b=qaIYYs5Md2MsZNitwhF8a/OEBUjhKHN0ZidBAW1EC+GBWakcluja2+qwuf65J/sQj934VX1rkTUq4UXlwM0BnQ/pnv/lkzjMaBWXPm3pSElhj6e6rIlJOl0t6woZYpFUY2bgjHWLM4GnSlRVI5UykeAcKTowcovp/L2FwOg5XPm0SQZbKJ7F7ie8y2gdsKROo4cdPpq6mj8wQ2KDcJbi3F+ERWwKJUHONWZLw8gUB4bVlBSSrZFheWHu6HZmqalbVn9YhjOCkJtC7SzmexRXOnSL2IKpNbZBOVvP3lL7+ZyS4jZz9D19jv8VzWJqsAOvG7mRuivI8xvqARt+6CXigg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6016.namprd11.prod.outlook.com (2603:10b6:8:75::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Thu, 24 Apr
 2025 23:17:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.037; Thu, 24 Apr 2025
 23:17:25 +0000
Date: Thu, 24 Apr 2025 16:18:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 7/7] drm/xe/pt: unify xe_pt_svm_pre_commit with userptr
Message-ID: <aArG12Znc5ToWA13@lstrano-desk.jf.intel.com>
References: <20250424121827.862729-9-matthew.auld@intel.com>
 <20250424121827.862729-16-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250424121827.862729-16-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR02CA0025.namprd02.prod.outlook.com
 (2603:10b6:303:16d::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6016:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c42a3ea-65fe-44d8-ea66-08dd83862cb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?DUkBBSDXjcv0GRSIFT2BcvkOGYsEbPys58qojx2C7V0Ss6xzRJUrxa2yWq?=
 =?iso-8859-1?Q?exfPm+swe9Iv7y37F/5qQOTZBZHna5bzSp7/014OSGpO42blHln8RBOMGe?=
 =?iso-8859-1?Q?Yq6KGOkljghDwA7+CjLoD3v7VzDeZeafQdi9kIWKuxEwDR3f4Zj2woEVWf?=
 =?iso-8859-1?Q?MmJz/SQHGzCH/Wj2FNLXm8vytCW9stvTY6hoOPYlrs7/5FRPmWcKbCofmw?=
 =?iso-8859-1?Q?aZx6CcbZTqZW05N6wNo53khn91g/PyxH+o2N2iHtxvJMgqN5reP9XSSdhL?=
 =?iso-8859-1?Q?0jSlLb2dLHbhYQlvc6OK0MWIw/KI01aJGyysyt9BkqixxQ3Br3CWMr5IOY?=
 =?iso-8859-1?Q?5X7mpZIwAX/Uf80di0sFVDzv7uI2VvwjGogpjLb5lZNLSYBiX962kKiuNa?=
 =?iso-8859-1?Q?ZXIeWvXsS/dLNqfd3fAgjzYDR8l0HVOmfWxxXdLbk2hbbgezXETeSm/l//?=
 =?iso-8859-1?Q?KhWfLpgXv7KMHHB5gCc9kjoyHq//7/8eApdL3xyI6IuJ1dpsQitN4NtzVq?=
 =?iso-8859-1?Q?RsWA8VFWKQZE2/DdZ6wWYMreyY0kh0xktpP7/I4joNPtCe4IFwKz88d1d1?=
 =?iso-8859-1?Q?tRUVSpOSpaBBkoAMT8y+hEJZTcYb66DModzuG6bKTqJRI29MixWOehTx7e?=
 =?iso-8859-1?Q?OEfYxIbKNLeZLl+06uEroXLaoKkdoW+49fxhJYuHipRuIZggaIMCoZKgk5?=
 =?iso-8859-1?Q?US62ohmi5KyUfawpSEppa69kApSa/vbUcTHZ+PQdw8KEzIdfdH7S8+zf0o?=
 =?iso-8859-1?Q?UB+IQJJNFKgSAsj0bpb92P31XEjH7QjaIn2djQSG6UDa4SZPEaDbR6PaqU?=
 =?iso-8859-1?Q?HNtC9N449CUctNO9pFLCc5myhzNTK8u8jScCvErcUWlSFVXGTZllvir9fL?=
 =?iso-8859-1?Q?y1Irq/njBr0YGMBj/bUHuzbFWFzA8BT2B6O9YN0pQbafJmReK9PCkicnLz?=
 =?iso-8859-1?Q?83zrCkzjzskau1cuXL/bTawV0stpiMBahMhqwnDRO47rgUjPoVCUghzgaA?=
 =?iso-8859-1?Q?naHPO+Okv3oI6hEi1gDXbLlg0UItr99w3vM59FAM73rzH2IP3LDSc6VSLA?=
 =?iso-8859-1?Q?O3bf9OkumwtVTHuXwHM09CXP52tqOAvedxhuv8lAfH47W9j7fKHoeRZZ86?=
 =?iso-8859-1?Q?PxtcyPoxdn+nTUGbzFVAwXVCPx+T9wzxCxf8aDr2HrhdGIu/vDVSK+kbsv?=
 =?iso-8859-1?Q?RHH8t8cJkfR6U59C9gZlutQK40NFvCrlN62i1KNgEwhApVIwgj8OAi2v1c?=
 =?iso-8859-1?Q?3kU/CDV+ElAuzBqs+BCHKKji5fF27mfkaBIfer3KWg6IoFM/feEDD/HA52?=
 =?iso-8859-1?Q?UwSWWD3jSu2HLW8/NICNGCuzDNRkjmygfntUozOMBbN9jy0ubxjYMMZnTU?=
 =?iso-8859-1?Q?Nb8AcHh/n7XYZsECNhta8KzxW4N4ZeLHiFQQ2DGr2egQUnL0AiDTfHtkRs?=
 =?iso-8859-1?Q?F13XVvjbLvxTDxNHxC+rr/9e2Owhb5HVU8JLRYDfpK50HQ3CHzvICbd398?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5aRd/IHQwJ/UKFTqNxDIFCsjvIx71EOz0tzmigaavHMb4/4lp0Hv8Bm0Aw?=
 =?iso-8859-1?Q?43A/G2zU/87X/6FQfMZSWUyl3f8xu3vHvFN5eY5jyLPPoKprvuHp91sxUg?=
 =?iso-8859-1?Q?IK8Yv5GCCPCpzeUfJruvKMT+tcxbLzM8XOs9xRWefkq7rwCrPOPE5N5goz?=
 =?iso-8859-1?Q?6SmkKgcF4YwVhw6QN73X6z11UrRjPd/0/sntqHy7+R87O2wlBF0Ki4+6yC?=
 =?iso-8859-1?Q?vBqMyKcH1vEbbqrJ0kCFD+DxvaKQwKDVmZZQk94fi2CmoVzK4msBqOMvIO?=
 =?iso-8859-1?Q?fs982z+/v0SF79Zj9aLCoWyL25d4aUAuzBVGmfzhSnxJdhyY465f5zEBUL?=
 =?iso-8859-1?Q?cZjJuVXrgg09YvreJcEYW7pEdYeqMtPV10skfHUAE7Hby+IB/aJ2gEWCKk?=
 =?iso-8859-1?Q?Cod48KbQDnaqSWjsTuPd9OeJZsVVD1FpAJNzVaq0M7UJuAbtAHuBsU+olE?=
 =?iso-8859-1?Q?In36FBfZ9JDmup97s8LrFvPtk42tIZCv/Mz9TBQi1PKXdd1ChEMTCVECdj?=
 =?iso-8859-1?Q?46DVMY7k10aXpA7EyCwJ9Sc0G+hMDpLirxi8l9m2n3wohiYa5DlwBp/O70?=
 =?iso-8859-1?Q?9e8yU6puI6xnqxH16OAIrY1BVyoOeOlW++baUSndkqqgCCgdbK2EVhTdrS?=
 =?iso-8859-1?Q?6qzpu1m/ubPpvmYBTb2/1lbf216DeQDb9brXNum8zwOZU6qpkrC94aAss+?=
 =?iso-8859-1?Q?2Aefz0Nar+wGRn6Xd69RqO6pwwbolC39MhMaYBKwt7c6+y/35XPJATIceJ?=
 =?iso-8859-1?Q?ttVoQ+IIHtkVj33qn2ZoO5y28QWk+ewsTz9sztN2i71dQlBOg+QMrEE7qy?=
 =?iso-8859-1?Q?yljjZpZnff8s6qP/3NbJjLdzCjXvWTRpRg6IhZgAjN1MVKmZkzAxp5nqaK?=
 =?iso-8859-1?Q?aw3t+mek75w5fw/RJecndjBjFALrQV7AGP2VU0ga/+7nuWvxwQRmmZMKVZ?=
 =?iso-8859-1?Q?iWHOiyXD8OHXV4lODhiX+F8GnsxvAknXUnqy4A7O4uO1NgkYwcjRypiV8F?=
 =?iso-8859-1?Q?Wu03eGcwtYDMCyHw9azeJodkqX7T5VQnFGBtqZanBUFuBZsbLUGYvTM5+q?=
 =?iso-8859-1?Q?AxxQ5KDfOoQW7uksI6UE54dZohmNcqFlb1fKKrDVrKT6WsbjxCupneEf0Q?=
 =?iso-8859-1?Q?8zB/CoeYI1CPV7CudRj2iSl1nXX/41R2MI4iRPvueFKy6jvD8ENYmcT2f0?=
 =?iso-8859-1?Q?uumjG5VzzRFFeWiqIX7lhXAGUuhNRzechb9kwb+9v0ZFuXPHUmp1RPpMBZ?=
 =?iso-8859-1?Q?kKIiv4MFAEHZHNnVubTt+rhNnfRdrrkui4+iNKtQgfQIu/sWNVC8EjDrpJ?=
 =?iso-8859-1?Q?XS4U+Nb1T9OZT2vn/J6KypEEnoRVqb/vEnWyA+Ij9NdIXGN8v+gh8WPnQP?=
 =?iso-8859-1?Q?G261C3N0F5yCXJsPr1o3id71SpF7HShykZLsj0Ol9BEwUPuYJu2Rn4nBhP?=
 =?iso-8859-1?Q?Uk2yGuiJU8aK7RiErYyyJuDHJJLYSO7NXbDxxxp/tRgemezXoGovCljVX6?=
 =?iso-8859-1?Q?tQ9ZPbGOES8xcWP8A8UxS70GC//YTiOcu9qxgsq8QbBjuxLBZntccBqFmc?=
 =?iso-8859-1?Q?c4TQKM+baNain3BrhCVMTfYSpa0Vh5L8ouePEwTI1SxtF43Au2Uoom6O/1?=
 =?iso-8859-1?Q?IIQW7viXBJ0hSemCGb6CJiLJWjkrq69fIJjnZ1yoCsfrqDZvyuV69n7w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c42a3ea-65fe-44d8-ea66-08dd83862cb7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 23:17:25.7049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SkqCdMXuznnsmAanWZS0VWh0gFVf5ln4Q4EFDo2IkT1patVrOkcYrNMpjkFxgSdr1cckArQgyTTUbE9CeVcFIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6016
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

On Thu, Apr 24, 2025 at 01:18:35PM +0100, Matthew Auld wrote:
> We now use the same notifier lock for SVM and userptr, with that we can
> combine xe_pt_userptr_pre_commit and xe_pt_svm_pre_commit.
> 
> v2: (Matt B)
>   - Re-use xe_svm_notifier_lock/unlock for userptr.
>   - Combine svm/userptr handling further down into op_check_svm_userptr.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

The Kconfig issues pointed out in the previous patch need to be fixed
but implementation here look correct:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c       | 90 ++++++++++----------------------
>  drivers/gpu/drm/xe/xe_pt_types.h |  2 -
>  drivers/gpu/drm/xe/xe_svm.h      | 19 +++----
>  3 files changed, 39 insertions(+), 72 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index ff898e518afd..a7db65f9913e 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1393,8 +1393,8 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
>  	return 0;
>  }
>  
> -static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
> -			    struct xe_vm_pgtable_update_ops *pt_update)
> +static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
> +				struct xe_vm_pgtable_update_ops *pt_update)
>  {
>  	int err = 0;
>  
> @@ -1419,6 +1419,24 @@ static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
>  		err = vma_check_userptr(vm, gpuva_to_vma(op->base.prefetch.va),
>  					pt_update);
>  		break;
> +#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
> +	case DRM_GPUVA_OP_DRIVER:
> +		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
> +			struct xe_svm_range *range = op->map_range.range;
> +
> +			xe_svm_range_debug(range, "PRE-COMMIT");
> +
> +			xe_assert(vm->xe,
> +				  xe_vma_is_cpu_addr_mirror(op->map_range.vma));
> +			xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
> +
> +			if (!xe_svm_range_pages_valid(range)) {
> +				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
> +				err = -EAGAIN;
> +			}
> +		}
> +		break;
> +#endif
>  	default:
>  		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>  	}
> @@ -1426,7 +1444,7 @@ static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
>  	return err;
>  }
>  
> -static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
> +static int xe_pt_svm_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>  {
>  	struct xe_vm *vm = pt_update->vops->vm;
>  	struct xe_vma_ops *vops = pt_update->vops;
> @@ -1439,12 +1457,12 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>  	if (err)
>  		return err;
>  
> -	down_read(&vm->svm.gpusvm.notifier_lock);
> +	xe_svm_notifier_lock(vm);
>  
>  	list_for_each_entry(op, &vops->list, link) {
> -		err = op_check_userptr(vm, op, pt_update_ops);
> +		err = op_check_svm_userptr(vm, op, pt_update_ops);
>  		if (err) {
> -			up_read(&vm->svm.gpusvm.notifier_lock);
> +			xe_svm_notifier_unlock(vm);
>  			break;
>  		}
>  	}
> @@ -1452,42 +1470,6 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>  	return err;
>  }
>  
> -#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
> -static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
> -{
> -	struct xe_vm *vm = pt_update->vops->vm;
> -	struct xe_vma_ops *vops = pt_update->vops;
> -	struct xe_vma_op *op;
> -	int err;
> -
> -	err = xe_pt_pre_commit(pt_update);
> -	if (err)
> -		return err;
> -
> -	xe_svm_notifier_lock(vm);
> -
> -	list_for_each_entry(op, &vops->list, link) {
> -		struct xe_svm_range *range = op->map_range.range;
> -
> -		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
> -			continue;
> -
> -		xe_svm_range_debug(range, "PRE-COMMIT");
> -
> -		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
> -		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
> -
> -		if (!xe_svm_range_pages_valid(range)) {
> -			xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
> -			xe_svm_notifier_unlock(vm);
> -			return -EAGAIN;
> -		}
> -	}
> -
> -	return 0;
> -}
> -#endif
> -
>  struct invalidation_fence {
>  	struct xe_gt_tlb_invalidation_fence base;
>  	struct xe_gt *gt;
> @@ -1858,7 +1840,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
>  						 xe_vma_start(vma),
>  						 xe_vma_end(vma));
>  		++pt_update_ops->current_op;
> -		pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
> +		pt_update_ops->needs_svm_lock |= xe_vma_is_userptr(vma);
>  
>  		/*
>  		 * If rebind, we have to invalidate TLB on !LR vms to invalidate
> @@ -1966,7 +1948,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
>  	xe_pt_update_ops_rfence_interval(pt_update_ops, xe_vma_start(vma),
>  					 xe_vma_end(vma));
>  	++pt_update_ops->current_op;
> -	pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
> +	pt_update_ops->needs_svm_lock |= xe_vma_is_userptr(vma);
>  	pt_update_ops->needs_invalidation = true;
>  
>  	xe_pt_commit_prepare_unbind(vma, pt_op->entries, pt_op->num_entries);
> @@ -2289,22 +2271,12 @@ static const struct xe_migrate_pt_update_ops migrate_ops = {
>  	.pre_commit = xe_pt_pre_commit,
>  };
>  
> -static const struct xe_migrate_pt_update_ops userptr_migrate_ops = {
> +static const struct xe_migrate_pt_update_ops svm_userptr_migrate_ops = {
>  	.populate = xe_vm_populate_pgtable,
>  	.clear = xe_migrate_clear_pgtable_callback,
> -	.pre_commit = xe_pt_userptr_pre_commit,
> +	.pre_commit = xe_pt_svm_userptr_pre_commit,
>  };
>  
> -#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
> -static const struct xe_migrate_pt_update_ops svm_migrate_ops = {
> -	.populate = xe_vm_populate_pgtable,
> -	.clear = xe_migrate_clear_pgtable_callback,
> -	.pre_commit = xe_pt_svm_pre_commit,
> -};
> -#else
> -static const struct xe_migrate_pt_update_ops svm_migrate_ops;
> -#endif
> -
>  /**
>   * xe_pt_update_ops_run() - Run PT update operations
>   * @tile: Tile of PT update operations
> @@ -2331,9 +2303,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>  	int err = 0, i;
>  	struct xe_migrate_pt_update update = {
>  		.ops = pt_update_ops->needs_svm_lock ?
> -			&svm_migrate_ops :
> -			pt_update_ops->needs_userptr_lock ?
> -			&userptr_migrate_ops :
> +			&svm_userptr_migrate_ops :
>  			&migrate_ops,
>  		.vops = vops,
>  		.tile_id = tile->id,
> @@ -2455,8 +2425,6 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>  
>  	if (pt_update_ops->needs_svm_lock)
>  		xe_svm_notifier_unlock(vm);
> -	if (pt_update_ops->needs_userptr_lock)
> -		up_read(&vm->svm.gpusvm.notifier_lock);
>  
>  	return fence;
>  
> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
> index 69eab6f37cfe..dc0b2d8c3af8 100644
> --- a/drivers/gpu/drm/xe/xe_pt_types.h
> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> @@ -106,8 +106,6 @@ struct xe_vm_pgtable_update_ops {
>  	u32 current_op;
>  	/** @needs_svm_lock: Needs SVM lock */
>  	bool needs_svm_lock;
> -	/** @needs_userptr_lock: Needs userptr lock */
> -	bool needs_userptr_lock;
>  	/** @needs_invalidation: Needs invalidation */
>  	bool needs_invalidation;
>  	/**
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 923cb074d0cb..696496b52465 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -87,15 +87,6 @@ static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
>  	return range->base.pages.flags.has_dma_mapping;
>  }
>  
> -#define xe_svm_assert_in_notifier(vm__) \
> -	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
> -
> -#define xe_svm_notifier_lock(vm__)	\
> -	drm_gpusvm_notifier_lock(&(vm__)->svm.gpusvm)
> -
> -#define xe_svm_notifier_unlock(vm__)	\
> -	drm_gpusvm_notifier_unlock(&(vm__)->svm.gpusvm)
> -
>  #else
>  #include <linux/interval_tree.h>
>  
> @@ -187,4 +178,14 @@ static inline void xe_svm_notifier_unlock(struct xe_vm *vm)
>  {
>  }
>  #endif
> +
> +#define xe_svm_assert_in_notifier(vm__) \
> +	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
> +
> +#define xe_svm_notifier_lock(vm__)	\
> +	drm_gpusvm_notifier_lock(&(vm__)->svm.gpusvm)
> +
> +#define xe_svm_notifier_unlock(vm__)	\
> +	drm_gpusvm_notifier_unlock(&(vm__)->svm.gpusvm)
> +
>  #endif
> -- 
> 2.49.0
> 
