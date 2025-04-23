Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F766A98B8D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 15:42:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0D210E6A8;
	Wed, 23 Apr 2025 13:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EEnqn6V+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C3E10E6A8;
 Wed, 23 Apr 2025 13:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745415762; x=1776951762;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=PEl9Fhpzx5W52mRVesdc/gBv4DCJ69fb1RHuDxULHLc=;
 b=EEnqn6V+ZZvq/Nhada/DRclE4CZ5dKKELEK7/jGQSYsjGharNvaUn8EV
 xekV5GTMPg5cWwKBtBWJ209Fc1q4HVR75VKSZ2b4WdM1qOgvUa1lpF3YG
 Ol3/adl7+SHRMHk+38iFGhHt1E//XEZB4sbzg2V3yusRJvAV3Jl90NUZ3
 IrSTD13DwnGmyCPtauRNXJJadS906ykBQtQi7bYFQ0LDCvdLe0LnG8v+P
 T0UjuqHEsq3AxhXZCa401mn0wwJ5/DnZRm55gVoGRG4aQA8QyljHxRNeX
 tLnOPQiKiKFT6i3h0QSDoBLdvAKHGFON5VZnFNMLUiZ+4vJH/zeiusv// A==;
X-CSE-ConnectionGUID: p58IMyPNRPKYRUZl8C2oqg==
X-CSE-MsgGUID: uHJsfyHrTn+LxL0o0C626g==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="50839784"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="50839784"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 06:42:41 -0700
X-CSE-ConnectionGUID: q8qCZxDsSpi3E2yEw8Dnng==
X-CSE-MsgGUID: BaQ2euKISG29/xsiIc74GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="137319411"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 06:42:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 06:42:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 06:42:40 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 06:42:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZoana7phiu/wib+p9QCQ609rU+agRlT8ppNFWidT9rvjUrLilkd0UcwlUkfR/5ZGnxqD66w/XOs40f/7MF0b5aj/mBBrMXv8uI/S+Q8jnn5u88ewiqRNPYeEvdxpm1BbCNprISRUMQDv886uqp1rVn8/5Wz4xQVJ9pb7UvKPU8ntE3LN94vQCaHHKMuiKXijt6/I+/9/E/V0TO4y5D/wyNA4mAjuFEl3CUW64K0pcHIZlolpZd6R1QEZgKl2bX4he9NUMHRRggwng6uYGhpVqaxYdFeuazfSl2f8SZ/La3E+sHLuQySEcW5gZTtvEzeG75e4dOjjI2L0sFXhYtBcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=urXDCFS4QG5//QSyguWhrcwieKBQeGpP2hy2Xgt7bkQ=;
 b=n4ieZPCW9g/x2KKWZghnDhTF6LFui6uxthBADGlcFywHcJXL/A/Trd8qqPfyKxMJKQnyq6SizjY9EKxIfeN6jWGkBwo0QmMAUovNrjZDUB1ybrLLXO2pae0Zc1wwFdHvoilv1FI8UpetpQ92CapIGjAbxmuUvzdDTmxFj6Wml5Bv9WmUye+fQz+G9Dcq27QPOKeex0WrVmQ338LewJaWSZ+T5Eu46aJo32HsAvbCKUWrdErWM/OF+QBTP6vpNFafJtCmWetgr6opectQFQ/KHh+46Cgz6Bh98ope/SvsH/+QuJE3ioXIRiqHUZP+lkEjGHdwsVxCGylXRZ0pf+jZkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CY8PR11MB7244.namprd11.prod.outlook.com (2603:10b6:930:97::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.24; Wed, 23 Apr
 2025 13:42:38 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 13:42:38 +0000
Date: Wed, 23 Apr 2025 16:42:42 +0300
From: Imre Deak <imre.deak@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <vinod.govindapillai@intel.com>
Subject: Re: [PATCH v5 1/2] drm/display/dp: Export fn to calculate link
 symbol cycles
Message-ID: <aAjuUty-Lt9iSMHG@ideak-desk.fi.intel.com>
References: <20250423-hblank-v5-0-6bee618bc979@intel.com>
 <20250423-hblank-v5-1-6bee618bc979@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250423-hblank-v5-1-6bee618bc979@intel.com>
X-ClientProxiedBy: DB8PR06CA0031.eurprd06.prod.outlook.com
 (2603:10a6:10:100::44) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CY8PR11MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f5bf60c-47e2-4e00-9bda-08dd826cb601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?71YOvbyNyfg4CjqH5oagABWlTzzJHp8TO3WYEq7j+jZr7C4wituH2MEvpy7n?=
 =?us-ascii?Q?U2cyNCeCwk6t5aJBytWK/6RYKxizjfJJN9rDyr4LGc1WNdPfRtSU3Z8gV6vc?=
 =?us-ascii?Q?wj2bfpPouSooymT8Q5BUuUqtLbHdrB/lN7UWJy3tNQHka2ihd39VfHRjcPC0?=
 =?us-ascii?Q?xLbJHkcwOUzTxWT0/vlnIKsDOPp9O9+azEKy287DLdT1Cz9fS4xY92XtipSU?=
 =?us-ascii?Q?7Xt9ssftkMhv56OcWfQO2Uk/AWkVzTOGRPnomcoCKTvB4qKUpVaWf0ZWRDS2?=
 =?us-ascii?Q?70OSd7tuQRciC7rQxH76fqJX8PeeDNMnwlqWVupE91P3rhX//D112VzIARzs?=
 =?us-ascii?Q?UwgtC/+Dk2iExW2pYQhr5d3n9Jkr7e4SmddqFETl+DQcORWGS1VrBj6bOh6T?=
 =?us-ascii?Q?IaKZr2nf4pY5SK3M/nf0Dp30ELTsMS3TVvM3KbbjMayTxdysSyU5C1e2p1kG?=
 =?us-ascii?Q?1m4n4FDj78Rb2rlTML6/zhU62R/hAw6tkjKLoWblVrnlICbsshpZecb+cMHF?=
 =?us-ascii?Q?J6MzL/oLPqmxrUxAPuljohfQHFFp0CB2DGWizPkyE8GrA8IAJRNCt7m+LL7M?=
 =?us-ascii?Q?HzhAIGrSyglEbOSW+LP33/oW/onTX94Bwfot1TucLof270vyY94XZssUgOp1?=
 =?us-ascii?Q?irH2FQBn8Luk59duEpB0CUxbBBDdjnXFAja14/Z7vHND6Wp6NLDIbvSkK4gz?=
 =?us-ascii?Q?sA3Dz2c2VSY7K3GHPWc58ieJK7dbD7lTAMKHnl/y6VDyEiv+BLcaJvnWuVyA?=
 =?us-ascii?Q?+WtN9CGf/n6AEbHswvtlgF8VLBDrAHYnYzVOq1sSKtkL3aGsAJrSRaiAE67s?=
 =?us-ascii?Q?x7ZVb9Qd30ngN07l+tVANFdhUX4wRt0hXv8iwfrg8h7YQogMExRJBwaAi6d7?=
 =?us-ascii?Q?bTOCeGC39xqF2cDqysScHNq/ssSDnUC0WyOyK4yqChSd9hla5iScyWIO+aRw?=
 =?us-ascii?Q?J1VLIYRzbg6RnOWXW+NjM/u9rc9Uy+ovwFFtarY5zsXlqTAmGANQfTAzwPcl?=
 =?us-ascii?Q?UaiErMtWNOB/YqNz6x1eLZ42f3ctqmAtE4bW9+sTVvdUp9T2N35RNj5jyWeF?=
 =?us-ascii?Q?ilgaHyeA8XLZ6n+Tutn8m8StHUm9GAxmbq10EKN5WlJ/QY7SQwE7yBJSzOXE?=
 =?us-ascii?Q?Gcd0E/3/TLwT5U5EFnpNcN3T1Cvu2LDac47lW0Q/udvV0TwixMPJ6h5Y21cO?=
 =?us-ascii?Q?bJ0IwG0yuq9VBSX35PBEwAbSgtS/wZe6oL31Jfmdl1g+nDYBABfXgpeRWWEU?=
 =?us-ascii?Q?4a6UtojsSh2xLg5R4V1l4fDdQIvm+a1QueTMW0cUG0fj2VdLWBwkhHvqndSs?=
 =?us-ascii?Q?5EPsjBMaEsENUZNaR/QLgDxhblmEwoDk/vxiYnzaXaaorQCLPiEkOElgeQcn?=
 =?us-ascii?Q?CQLKmtVhsU/A3TvCNhENxv1VOvHJXwnvjTtSnCXlVAZWdkQqWYdVYSN4QljG?=
 =?us-ascii?Q?bsNlm15S7aA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+rnpTuLf36HKjeqaWrkMDNvK3Vtnc162XTD3z6/7+foEersx2eloeaEsI3t2?=
 =?us-ascii?Q?SXeNaDiUosdfVDQ9zNCeDZEi3vF6w/x+fqgDxZmNDCuhpfoONYw1kp+G0iOm?=
 =?us-ascii?Q?NBQkiFLCscX7Eh3ePtOe3fllDXa3zIcA7WmQh9GExXYsN+tgkHerUi4bRkUf?=
 =?us-ascii?Q?ALmROhdzp97fuB9MiDc//ixz8o3Kj7hUEKOhHhEEpQu3UGafPiVK/1xaIy6y?=
 =?us-ascii?Q?RevCKXh7slsp6VAvv4dGu2XgZzIXnwVRFres01fxrCzABeEPAX7nEjm7vVom?=
 =?us-ascii?Q?piXHDMjDHjWVcQymfxBgldK32gEa5x/yMomBKKyqSmZ8f3fxMaNF61La1+F2?=
 =?us-ascii?Q?j0ET62OLdFJJi9s3ko+hRlvcUsvV95SpvP3GxDv4GizhKbXq+rVqKgpOeYbO?=
 =?us-ascii?Q?C9c1+ejuRn9QGR0+g43/AMi1qN718AWm5y3Dqh41QdCRl9wFJx9+2x0FwoPM?=
 =?us-ascii?Q?La/DM4cYcDGe2aywzPvASO63uR2/Q//7Rutn7oFmtPuXMeoQOT33mE3XcyJ6?=
 =?us-ascii?Q?CzYl3YBgXlDLhyI6fPDrIhASTOHnwg3YxG+E+ZI1kD1EBNQr2+0aNSwzIntR?=
 =?us-ascii?Q?lOeSqKKs69MfmMLIHouRTQOBO8wYrlnGQssl8MX9inzjO87GNMzHrQ1t0ZM/?=
 =?us-ascii?Q?KqzO6vDR/7RGFfWVtZLmKdF3gF41HIrej16HWBu3muY6Qd++hjx5DSDXUO7I?=
 =?us-ascii?Q?y9VlMu15+1emc8TBbmjqSm66dM852MRYZBhAFCtpHksUc6FJxuJt+oTwiDM6?=
 =?us-ascii?Q?EfQ9EEbdeBXVqqdY02OvdcxI8clXGWaZ6lwk5pwLcqfOU29XtuueaszEAL3H?=
 =?us-ascii?Q?b1LlnhIzimbw94Ua5Pd6P2K5VHUV6zO2axBaQFAnzqCpI7gNccxf3jIXKdWu?=
 =?us-ascii?Q?Z40BmwBtg+dMfz37VXcDFS2WOLzrzr1bGHXKx+MxFG/VzofLRrq755Yx5hIw?=
 =?us-ascii?Q?PlqKeSNxGDWL4uqPT3HGBCHI+NUXpf5aIEpwQwp/I1dqf0kFGAaAHvqvrCAc?=
 =?us-ascii?Q?2xXRt62l+Pl2WYN9XqVD5x25egBIHNRqyUggHgi16ZmtjVNHw5HjtYKxazc7?=
 =?us-ascii?Q?GiS5hZbbZvnjtqMzH/WSE6u5KH5HVtDF+1ajkYw0jnVGHbBUTFAbgjB68KKS?=
 =?us-ascii?Q?O4zABEMiRU8Y+fRI77ItJxvqR2bTz3nZ7f0v4Sm25so63k/ERe1HthZfr0L/?=
 =?us-ascii?Q?HT04j0vo49vifcO9VF0si75hmZlLulf3QPaYhvscf+WoxgQIKeaBRgFq/DXA?=
 =?us-ascii?Q?OAHnuJ8NchqdFZvrRyuHq0XH+FYheRDmlcjRXM6sl2CMuSdPbbUsqgVNrcuK?=
 =?us-ascii?Q?yU81dQnDpWifpGE7ltuFZZOG4il2T/0+v19nA6kh2YJ/PkhN34336gbG46ls?=
 =?us-ascii?Q?GlhX60+RpRiIwufPx8iJSXh7/GINwnAWE1u8X82SX6Ui5LDycE8Ia1OUwKPh?=
 =?us-ascii?Q?LQTawrr9n9TlqvvxDB0qxQSeOZ6/l05q3isJd14PVjuBmgn5FrP1uxbfkh7j?=
 =?us-ascii?Q?e9ph9B40nVR3UuckuNDR3ndozfUylbZaSQw079aQ0LnkrI6NyUp4E3myTxOQ?=
 =?us-ascii?Q?rDji6iCXogCW89dGjhGjzRCsdD5qAbIKzTPukTlY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f5bf60c-47e2-4e00-9bda-08dd826cb601
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 13:42:37.9957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: StyFsZaMjq6qks/Fl+0rFEZ7TOvYVvV1pdeqK8u7Q8ZmOWul40b7IWdNUiJ/KrUUNua6dt7d3q1QyKyO5lR7Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7244
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 23, 2025 at 06:23:33PM +0530, Arun R Murthy wrote:
> Unify the function to calculate the link symbol cycles for both dsc and
> non-dsc case and export the function so that it can be used in the
> respective platform display drivers for other calculations.
> 
> v2: unify the fn for both dsc and non-dsc case (Imre)
> v3: rename drm_dp_link_symbol_cycles to drm_dp_link_data_symbol_cycles
>     retain slice_eoc_cycles as is (Imre)
> v4: Expose only drm_dp_link_symbol_cycles() (Imre)
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 51 +++++++++++++++++++++------------
>  include/drm/display/drm_dp_helper.h     |  2 ++
>  2 files changed, 35 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 57828f2b7b5a0582ca4a6f2a9be2d5909fe8ad24..d33a46016504ce52857b7c4e63d866af9c1eff34 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -4393,8 +4393,9 @@ EXPORT_SYMBOL(drm_panel_dp_aux_backlight);
>  #endif
>  
>  /* See DP Standard v2.1 2.6.4.4.1.1, 2.8.4.4, 2.8.7 */
> -static int drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp_x16,
> -				     int symbol_size, bool is_mst)
> +static int drm_dp_link_data_symbol_cycles(int lane_count, int pixels,
> +					  int bpp_x16, int symbol_size,
> +					  bool is_mst)
>  {
>  	int cycles = DIV_ROUND_UP(pixels * bpp_x16, 16 * symbol_size * lane_count);
>  	int align = is_mst ? 4 / lane_count : 1;
> @@ -4402,22 +4403,41 @@ static int drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp_x16,
>  	return ALIGN(cycles, align);
>  }
>  
> -static int drm_dp_link_dsc_symbol_cycles(int lane_count, int pixels, int slice_count,
> -					 int bpp_x16, int symbol_size, bool is_mst)
> +/**
> + * drm_dp_link_symbol_cycles - calculate the link symbol count with/without dsc
> + * @lane_count: DP link lane count
> + * @pixels: number of pixels in a scanline
> + * @dsc_slice_count: number of slices

Nit: missed in my previous review, but could be clearer by:
@dsc_slice_count: number of slices for DSC or 0 for non-DSC

> + * @bpp_x16: bits per pixel in .4 binary fixed format
> + * @symbol_size: DP symbol size
> + * @is_mst: %true for MST and %false for SST
> + *
> + * Calculate the link symbol cycles for both DSC(@dsc_slice_count !=0) and
> + * non-DSC case(@dsc_slice_count == 0)and return the count.

Nit: keep one space before '(' and after ')'.

> + */
> +int drm_dp_link_symbol_cycles(int lane_count, int pixels, int dsc_slice_count,
> +			      int bpp_x16, int symbol_size, bool is_mst)
>  {
> -	int slice_pixels = DIV_ROUND_UP(pixels, slice_count);
> -	int slice_data_cycles = drm_dp_link_symbol_cycles(lane_count, slice_pixels,
> -							  bpp_x16, symbol_size, is_mst);
> -	int slice_eoc_cycles = is_mst ? 4 / lane_count : 1;
> +	int slice_count = dsc_slice_count ? : 1;
> +	int slice_data_cycles = drm_dp_link_data_symbol_cycles(lane_count,
> +							       pixels,
> +							       bpp_x16,
> +							       symbol_size,
> +							       is_mst);
> +	int slice_eoc_cycles = 0;
> +
> +	if (dsc_slice_count)
> +		slice_eoc_cycles = is_mst ? 4 / lane_count : 1;
>  
>  	return slice_count * (slice_data_cycles + slice_eoc_cycles);
>  }
> +EXPORT_SYMBOL(drm_dp_link_symbol_cycles);
>  
>  /**
>   * drm_dp_bw_overhead - Calculate the BW overhead of a DP link stream
>   * @lane_count: DP link lane count
>   * @hactive: pixel count of the active period in one scanline of the stream
> - * @dsc_slice_count: DSC slice count if @flags/DRM_DP_LINK_BW_OVERHEAD_DSC is set
> + * @dsc_slice_count: number of slices

Same nit as the above @dsc_slice_count one.

>   * @bpp_x16: bits per pixel in .4 binary fixed point
>   * @flags: DRM_DP_OVERHEAD_x flags

There is one more place referring to %DRM_DP_OVERHEAD_DSC in this
comment, could be changed to:

    * - compression mode (@dsc_slice_count != 0)

Regardless of the nits, patch looks ok, thanks:

Reviewed-by: Imre Deak <imre.deak@intel.com>

After this patch DRM_DP_BW_OVERHEAD_DSC will be only set by the i915
driver, but it won't be used anywhere, so in a follow patch the flag
could be removed.

>   *
> @@ -4486,15 +4506,10 @@ int drm_dp_bw_overhead(int lane_count, int hactive,
>  	WARN_ON((flags & DRM_DP_BW_OVERHEAD_UHBR) &&
>  		(flags & DRM_DP_BW_OVERHEAD_FEC));
>  
> -	if (flags & DRM_DP_BW_OVERHEAD_DSC)
> -		symbol_cycles = drm_dp_link_dsc_symbol_cycles(lane_count, hactive,
> -							      dsc_slice_count,
> -							      bpp_x16, symbol_size,
> -							      is_mst);
> -	else
> -		symbol_cycles = drm_dp_link_symbol_cycles(lane_count, hactive,
> -							  bpp_x16, symbol_size,
> -							  is_mst);
> +	symbol_cycles = drm_dp_link_symbol_cycles(lane_count, hactive,
> +						  dsc_slice_count,
> +						  bpp_x16, symbol_size,
> +						  is_mst);
>  
>  	return DIV_ROUND_UP_ULL(mul_u32_u32(symbol_cycles * symbol_size * lane_count,
>  					    overhead * 16),
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index d9614e2c89397536f44bb7258e894628ae1dccc9..7b19192c70313d66dce1b7ba40dd59c14f80a182 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -971,5 +971,7 @@ int drm_dp_bw_channel_coding_efficiency(bool is_uhbr);
>  int drm_dp_max_dprx_data_rate(int max_link_rate, int max_lanes);
>  
>  ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc, struct dp_sdp *sdp);
> +int drm_dp_link_symbol_cycles(int lane_count, int pixels, int dsc_slice_count,
> +			      int bpp_x16, int symbol_size, bool is_mst);
>  
>  #endif /* _DRM_DP_HELPER_H_ */
> 
> -- 
> 2.25.1
> 
