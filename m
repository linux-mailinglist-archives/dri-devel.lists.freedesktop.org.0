Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C959A98D54
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 16:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC79410E6C7;
	Wed, 23 Apr 2025 14:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ll7nnWjw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F6A10E142;
 Wed, 23 Apr 2025 14:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745419191; x=1776955191;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=tK8PURbCkYuP1T7ao0j2wiiaxDI5F5h7l0jT2TH+L0s=;
 b=Ll7nnWjw75oPbdiYpVVJKfhHogPMViv6FWSqHJKVR23eM+lcLK1gv7Mn
 3RF29nuTQcG7CDzjIOUxXB4Bey1DoTqkL+UxCvZ2lt2hBRSfKHeuBOXxi
 6LPwB7uHHAMlUrqkQ7XHFozzTVbam/w+dGAnoJRNmupqW4dHCovIG2YGL
 +EHtUcPI6de/Vuz+VG3INbkU+vR+DY32STtgPca3X0WZOkekaySZ+jZBm
 S85pni8JmLFg+cJ3AuN174/ZK2Wgl9nRHE0CRAw3JG1FquCDBsDhTt0nQ
 /p3UmJrXUJZQi0L4FAnW8IC1ef4Akzh1KBlDke9eJilt0iOsLV/rVc3CL w==;
X-CSE-ConnectionGUID: +CN7jqRkQWSeIImHXnQ/uQ==
X-CSE-MsgGUID: uFWCt6/VSEKZdPY+M8nQYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47115016"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="47115016"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 07:39:50 -0700
X-CSE-ConnectionGUID: PLFkt+JTR0uyrEDrYpncVA==
X-CSE-MsgGUID: 9uyJ4OnBTJm3FLjXj4Xf/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="132864930"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 07:39:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 07:39:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 07:39:49 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 07:39:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZJnnYnVREU+S8gk0FRiKqxNgNR0+OORjpieQWoj8ahd0rUDZJOjwwhNt52bZlD3Kj18KkH5X+3vMQ7psfumG8W6OAl79zUyo1RdMSf9go1TCMorrmyZVY/1AXyDaVMCxY7Olddfadx/TtEVxXGawHTVnPT4Ciu+d5t35+8kCNxe2Gj/Wb6vYWujmWR5+IUxAX20J0SlI38p4cm3U/tQ+ms43drVDFW6C0KZyJUHgdSM4yyXzCvUE+Gp3lv312Pv8gzd3vD/W8/tmLXA4KkAGuNUm/zPZG/3zyTTojuUCXTm3OuA/o7YEBMXg/MPVNjWEbXd12cN618i2jcJAFfZiXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29EsTJog2ZSAb8GWUT6QOHrXp2WXn4OA24TvpFv2U2Y=;
 b=mdsyCGB0VA0bw08Bqf9PorYHbv26mYVHdVCNESj9YSBXOgLqlAp5MhBPxqLmlKJbY4kAwaAwgckJcU/xR3qpL00vN6DW+LigXYOnIL/ka/aMaZF+D9+veZnl1+lRto9zFjx2tDah9Sevqi2Jj2BXQfh6M9tUFAbbyaXz0dCBJ+LGbQApogvDfcIN+tNRfi4J9NnZuMkvLYY9ghcufrM+JkhPZUZ5BpeamWOVxpmICX88lUQXYXVkmcFzlzc1tLOZBVJO7Oh+TzDqQp2yeUHrBDcpw8k9vvJg8hDIgR3y/mblZ/cl0+FZFTCPgmoAynVA/B9eksTKG+7Esbr9V4iM4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SN7PR11MB7466.namprd11.prod.outlook.com (2603:10b6:806:34c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Wed, 23 Apr
 2025 14:39:05 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 14:39:05 +0000
Date: Wed, 23 Apr 2025 17:39:09 +0300
From: Imre Deak <imre.deak@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <vinod.govindapillai@intel.com>
Subject: Re: [PATCH v5 2/2] drm/i915/display: move min_hblank from dp_mst.c
 to dp.c
Message-ID: <aAj7jTdrM3G3eWB-@ideak-desk.fi.intel.com>
References: <20250423-hblank-v5-0-6bee618bc979@intel.com>
 <20250423-hblank-v5-2-6bee618bc979@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250423-hblank-v5-2-6bee618bc979@intel.com>
X-ClientProxiedBy: LO4P123CA0345.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::8) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SN7PR11MB7466:EE_
X-MS-Office365-Filtering-Correlation-Id: 01399cf6-eb37-4e5e-d5e1-08dd8274992e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NmnR3NrBGSITxFlI697Yw63IE+11iIR32Id/vRKj8IB92xIpQ1e69eEedl6R?=
 =?us-ascii?Q?J2w3ubaWv9TQ3JTp0nUqNI1MJWdA2rRaUYeiYGtNu8Jv0AmbyJFYs3l2Sehr?=
 =?us-ascii?Q?CGfxq2t63zrYI1UFfeOEPmUu8TBhtmJSS1Rbzpxbvb+/AsalaDUKhXdfxBMY?=
 =?us-ascii?Q?jaa3je+i+heam8PxQmYQRTu3bPnbNXxp2UrI0dc44twoPoBfdL1OD6J7QaLu?=
 =?us-ascii?Q?J/qLZE48D7TB7LIcLLNLiob2DvcSz//X0GyAtqYDuF9AeRKpidL5GrUq/Lrw?=
 =?us-ascii?Q?tMIpHLR0AEJBmCHA5kFI0/QpBjkAb567qyMz+5C/asOr6nVYk4SG1CwHAPAK?=
 =?us-ascii?Q?mM0agoarNBXQ0twafTKUJReXo4oAcz4EPqJI9qvI+jXcj4MV20IsD5CIqvxe?=
 =?us-ascii?Q?ATzmhjKTSkdd1POBi9jPbBTw53utFq12vW2RO/RSewRQAdDzvnqofm0EPOqO?=
 =?us-ascii?Q?V2MhZyH0E5WgFWnT8oSOCThnSLpyY4djmXFpQMW4nl2dvQ/UzzkMNq/+Zw9x?=
 =?us-ascii?Q?K3QS/eU5iMlQZoKKlRknOYYKuvxGPc/K4LjOcCI2Hi402PvTAckPomiC18/+?=
 =?us-ascii?Q?IpLAI3ROFvG75eqGD/ybkE5UjhDATowK9GVg6LJo7P++8i3hQUaGnD3NIf0H?=
 =?us-ascii?Q?S6Xo6DCJIeLl/Zf7GAz1QfBEJoAVIULrOBVCuaAd1o61hLCswveCBUhwlgtG?=
 =?us-ascii?Q?R85WJIA1/TMNC8xMSpWpYexaOsQMYeBINHvGQAf7QllitD/kSaGSQC8RvW0H?=
 =?us-ascii?Q?rZibcncMSQDHabqf9unGBaUv3S0oBjVB7U/MYmBkxiJFkDELRGvDNPimg/U+?=
 =?us-ascii?Q?mW6AX342nOc1NlN+7kkjuQ7cLJzb3z0t2lEp+L+iYOnnT47SSeLbwKbHjig6?=
 =?us-ascii?Q?IlcG12VAOlVptUKn1zCfXtx4kRCr/V/u5fS5dYDD3ZqEVSTH3nlP5d3ZdjHz?=
 =?us-ascii?Q?BFrV0iQPRZAraYyMALyuK0h/151FW6SB22IQK//7lGEQTEZNjW5J2TNepN79?=
 =?us-ascii?Q?RzxTSC0nhojnN0aebciEdbnIR4UsBbT9hdxUqnB+3z7sB1uQolWdAeGRrwb4?=
 =?us-ascii?Q?P4UVyi6bdEKp/EsIriaAX6e0JfQ0mRtsdvFyLVPesL9RfZBTPfYh7hxRnlLj?=
 =?us-ascii?Q?IWJ66JQ/ZtMKMmKRJzvcS+98eMioN+RPqWAnl0YBiYfiBQj9wEavY3WWC4WZ?=
 =?us-ascii?Q?AeAOb/B3onFlVbFKOSQy9PdB3iddkY4eDbD4swZRZdYxLkTq+tUmPuaErOac?=
 =?us-ascii?Q?1ovQK4liIJmSyHt+E5iw+iFq2h9yypRNhdv0ShA14mXpbcNWlpuvMgqWgZ8d?=
 =?us-ascii?Q?TK2UHEcl6tk54DUjxzG1o9So8+LNkC8AVEZJVWpzLiu9cKkgnynV3GqH0UeJ?=
 =?us-ascii?Q?y4uBLp8ZiXA+mwm9EHsI2BkH6t2k/JRTS63c1EbTyAIM+SaCnWJsBvSzse3E?=
 =?us-ascii?Q?weqLegPj4A4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8KTH5z2aCQENUhTLeBJXFA92/ApbBEBIYMvI4guwEXhwAzGT09ebr4lq4GQl?=
 =?us-ascii?Q?ek2qxb6lLWqHj4RTFhs8E3o0UHMpHILpFTykm0jjD2HQL9nMeOOFtT7UO3AX?=
 =?us-ascii?Q?UOWqDmQbhhc1hLWUyIyYBRt2lJk52SExWOyzWntdYydRMWC9l1AKVdRlKQL4?=
 =?us-ascii?Q?T95F+dTzT0U4i1U9BvGKtxe4ermKylUO2Zw+aYlDWi0lCIfdkdZbdmL3njT5?=
 =?us-ascii?Q?bb5vN8JpkgPMnof9ifznAP0O7pmuwCZLc6ptqYBZQQpATtkRttwuMaUyODQk?=
 =?us-ascii?Q?wLEx5moiBrO2fpqJ4jONLfbIM3bIeyfTs98dyPe1y7q+V3KpNjVdaXvkH4C4?=
 =?us-ascii?Q?pAvmXfG8MzXDEuXpI4khy2kRS3DH8YcQHgDY7AVuiITKfvY04IoVGRIpPIbB?=
 =?us-ascii?Q?tYmX5h+3E/mV6Pdu58Rw049O+qe3wTlcSFz8XjFP2fREmXJYO4h6SMiHY7fK?=
 =?us-ascii?Q?6E6Ii2HpeLuBjvHOgKcvuW7gguHQOEBQQdLBnzROLBsjwXf8adFv09hexX2z?=
 =?us-ascii?Q?84IkbaPXYXtydZvRg3KcibciznnGLadmIWkSWxJoKJv/iW98xuqlGeiKwUSz?=
 =?us-ascii?Q?G8uvVS0y+4ejYzfnGlDESucsL3mmaFw/c6ZdjW80HTMh2LzQ5Zf5dF5Ba+hD?=
 =?us-ascii?Q?/n4sP2h1zv5q+iiuS5GrJ57ILXWyHSm3Jbsti8S7s2A6KCreOZ44RXugy/5X?=
 =?us-ascii?Q?9Bemsqg00TGJSmvuC2AF3KVblyxucTKhTbfXtrv4lCpDPRZJ8mwYja8pf1vY?=
 =?us-ascii?Q?A/h+Z8EzyyKTy+0923ckbptVoobZtz3qvqIzq2kIH6wnrAKtlFBQugEZrhWa?=
 =?us-ascii?Q?AnEugc0t5hGMTQn9fdVG1RDbeMHHKut78OygcXNAvuphq7BSWARIJKF35EgG?=
 =?us-ascii?Q?p2PkC3BaMh79TjHtXvXwpcrrhEnUUApRZSeTMb/8FKd0q+TcrwWXbPgCFLlF?=
 =?us-ascii?Q?noqfsGTz4si+70Go86Qcl0JJ8bsc7qJzqfMfsIT9DVXHpmovvb9UrLUhkRn4?=
 =?us-ascii?Q?D4eciSUFSIC/QbO2DkPladLYigneMNM8OTEb1Fmcu7t1AI9e3AOUesOn7eA3?=
 =?us-ascii?Q?M1lx9XPkCqZ2kuLRNaaHxndeQYbX3cFgNzHUchrzOmYkKDa6kNxMdj21XgBy?=
 =?us-ascii?Q?Ilgt6L7raRYSek+MFRStxak6HcjQ2hs1H0E3tAAOo3CvAITHKZ1Ojtu//D8G?=
 =?us-ascii?Q?5QPPShPdp+GUqAfOvh5LDYG5NsXIbCCMA1ndOwCTQIiYJwBYKEghaVi1Fkpe?=
 =?us-ascii?Q?X8wpq/Fmjb/lt4peQIeUsrXO3Xj3p93fzK4gA1uh/lqV6o15I9Ed5+ULMLJG?=
 =?us-ascii?Q?bOVn/ysGeCBDvoekZroNMv5UhTSyc9DNFTQ21DVGG5eMmlLdkrXYvpm+2RUf?=
 =?us-ascii?Q?rfoReTsUWjEmxaQSPf5QIkCDoarMF0wRQ4x2MOsETJw+hUfyIESniWCRuXiZ?=
 =?us-ascii?Q?2mIa6aysMkPHFj51vGRs502CahwX6op6Fc70HZzhHvznOW1VnKDIyL47c8h1?=
 =?us-ascii?Q?AGmUJcjOrNY1Fr4/WpBFNNHufBMTTE2nqzO8ZQF3HIbMjOhm72pU87ZpV7QO?=
 =?us-ascii?Q?mXeQAXYFn+lb8J9JL3xfLKiiG0cr690iNRRmuYzr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01399cf6-eb37-4e5e-d5e1-08dd8274992e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 14:39:05.6543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8OAwuvNIOnS0GZcMVzdkenMZt0Tbx1wnjjzZYNBXlZ/6TMvxXFCyLxPOYrAMpYeznv1+/gT+VMcKWyQPkx4NPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7466
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

On Wed, Apr 23, 2025 at 06:23:34PM +0530, Arun R Murthy wrote:
> Minimum HBlank is programmed to address jitter for high resolutions with
> high refresh rates that have small Hblank, specifically where Hblank is
> smaller than one MTP.

The log could've mentioned what the patch actually does (at least: add
programming for UHBR SST, use the correct link_bpp_x16 factor, fix the
min_hblank formula wrt. dsc, fix the platform check, add HW state
verification).

> 
> TODO: Add the min_hblank calculation for hdmi as well.
> 
> v2: move from intel_audio.c to intel_dp.c
>     some correction in link_bpp_x16 (Imre)
> v3: min_hblank for 8b/10b MST and 128b/132b SST/MST
>     handle error for intel_dp_mst_dsc_get_slice_count
>     reset min_hblank before disabling transcoder (Imre)
> v4: compute link_bpp_x16 within compute_min_hblank,
>     return error in case of compute failure
>     call compute_min_hblank() before vrr_compute_config (Imre)
> v5: readout MIN_HBLAN reg for Xe3+
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 18 +++++++
>  drivers/gpu/drm/i915/display/intel_dp.c      | 76 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dp.h      |  3 ++
>  drivers/gpu/drm/i915/display/intel_dp_mst.c  | 57 +++------------------
>  4 files changed, 103 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 33c09999c42e046c7a8b6e6143be0b81650ee7f7..5e28f63e4d719bd605f20fd72d281c753bfbba5f 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -2723,6 +2723,19 @@ static void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_sta
>  		intel_de_write(display, TRANS_VTOTAL(display, pipe),
>  			       VACTIVE(crtc_vdisplay - 1) |
>  			       VTOTAL(crtc_vtotal - 1));
> +
> +	if (DISPLAY_VER(display) >= 30) {
> +		/*
> +		 * Address issues for resolutions with high refresh rate that
> +		 * have small Hblank, specifically where Hblank is smaller than
> +		 * one MTP. Simulations indicate this will address the
> +		 * jitter issues that currently causes BS to be immediately
> +		 * followed by BE which DPRX devices are unable to handle.
> +		 * https://groups.vesa.org/wg/DP/document/20494
> +		 */
> +		intel_de_write(display, DP_MIN_HBLANK_CTL(cpu_transcoder),
> +			       crtc_state->min_hblank);
> +	}
>  }
>  
>  static void intel_set_transcoder_timings_lrr(const struct intel_crtc_state *crtc_state)
> @@ -2866,6 +2879,9 @@ static void intel_get_transcoder_timings(struct intel_crtc *crtc,
>  			adjusted_mode->crtc_vdisplay +
>  			intel_de_read(display,
>  				      TRANS_SET_CONTEXT_LATENCY(display, cpu_transcoder));

Nit: could've added an empty new line here.

> +	if (DISPLAY_VER(display) >= 30)
> +		pipe_config->min_hblank = intel_de_read(display,
> +							DP_MIN_HBLANK_CTL(cpu_transcoder));
>  }
>  
>  static void intel_joiner_adjust_pipe_src(struct intel_crtc_state *crtc_state)
> @@ -5216,6 +5232,8 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
>  	PIPE_CONF_CHECK_I(lane_count);
>  	PIPE_CONF_CHECK_X(lane_lat_optim_mask);
>  
> +	PIPE_CONF_CHECK_I(min_hblank);
> +
>  	if (HAS_DOUBLE_BUFFERED_M_N(display)) {
>  		if (!fastset || !pipe_config->update_m_n)
>  			PIPE_CONF_CHECK_M_N(dp_m_n);
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index d7a30d0992b7a65250a3abfecde876321326fa84..c18889cecaf40cd6599adbb3ae0f0feb0c95990f 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3104,6 +3104,77 @@ intel_dp_queue_modeset_retry_for_link(struct intel_atomic_state *state,
>  	}
>  }
>  
> +int intel_dp_compute_min_hblank(struct intel_crtc_state *crtc_state,
> +				 struct drm_connector_state *conn_state,

The above has an indent problem and the pointer could be const.

> +				 bool is_dsc)

No need for a separate is_dsc param, since it's just
crtc_state->dsc.compression_enable, and crtc_state is also passed.

> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	const struct drm_display_mode *adjusted_mode =
> +					&crtc_state->hw.adjusted_mode;
> +	struct intel_connector *connector = to_intel_connector(conn_state->connector);
> +	int symbol_size = intel_dp_is_uhbr(crtc_state) ? 32 : 8;
> +	/*
> +	 * min symbol cycles is 3(BS,VBID, BE) for 128b/132b and
> +	 * 5(BS, VBID, MVID, MAUD, BE) for 8b/10b
> +	 */
> +	int min_sym_cycles = intel_dp_is_uhbr(crtc_state) ? 3 : 5;
> +	bool is_mst = intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST);
> +	int num_joined_pipes = intel_crtc_num_joined_pipes(crtc_state);
> +	int min_hblank;
> +	int max_lane_count = 4;
> +	int hactive_sym_cycles, htotal_sym_cycles;
> +	int dsc_slices = 0;
> +	int link_bpp_x16;
> +
> +	if (DISPLAY_VER(display) < 30)
> +		return 0;
> +
> +	/* MIN_HBLANK should be set only for 8b/10b MST or for 128b/132b SST/MST */
> +	if (!is_mst && !intel_dp_is_uhbr(crtc_state))
> +		return 0;
> +
> +	if (is_dsc) {
> +		dsc_slices = intel_dp_dsc_get_slice_count(connector,
> +						     adjusted_mode->crtc_clock,
> +						     adjusted_mode->crtc_hdisplay,
> +						     num_joined_pipes);

The above params have an indent problem.

> +		if (!dsc_slices) {
> +			drm_dbg(display->drm, "failed to calculate dsc slice count\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	if (crtc_state->dsc.compression_enable)
> +		link_bpp_x16 = crtc_state->dsc.compressed_bpp_x16;
> +	else
> +		link_bpp_x16 = fxp_q4_from_int(intel_dp_output_bpp(crtc_state->output_format,
> +								   crtc_state->pipe_bpp));
> +
> +	/* Calculate min Hblank Link Layer Symbol Cycle Count for 8b/10b MST & 128b/132b */
> +	hactive_sym_cycles = drm_dp_link_symbol_cycles(max_lane_count,
> +						       adjusted_mode->hdisplay,
> +						       dsc_slices,
> +						       link_bpp_x16,
> +						       symbol_size, is_mst);
> +	htotal_sym_cycles = (adjusted_mode->htotal * hactive_sym_cycles) /
> +			     adjusted_mode->hdisplay;

Nit: no need for the parentheses.

With the above things addresses patch looks ok to me:

Reviewed-by: Imre Deak <imre.deak@intel.com>

> +
> +	min_hblank = htotal_sym_cycles - hactive_sym_cycles;
> +	/* minimum Hblank calculation: https://groups.vesa.org/wg/DP/document/20494 */
> +	min_hblank = max(min_hblank, min_sym_cycles);
> +
> +	/*
> +	 * adjust the BlankingStart/BlankingEnd framing control from
> +	 * the calculated value
> +	 */
> +	min_hblank = min_hblank - 2;
> +
> +	min_hblank = min(10, min_hblank);
> +	crtc_state->min_hblank = min_hblank;
> +
> +	return 0;
> +}
> +
>  int
>  intel_dp_compute_config(struct intel_encoder *encoder,
>  			struct intel_crtc_state *pipe_config,
> @@ -3203,6 +3274,11 @@ intel_dp_compute_config(struct intel_encoder *encoder,
>  				       &pipe_config->dp_m_n);
>  	}
>  
> +	ret = intel_dp_compute_min_hblank(pipe_config, conn_state,
> +					  pipe_config->dsc.compression_enable);
> +	if (ret)
> +		return ret;
> +
>  	/* FIXME: abstract this better */
>  	if (pipe_config->splitter.enable)
>  		pipe_config->dp_m_n.data_m *= pipe_config->splitter.link_count;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
> index 9189db4c25946a0f082223ce059c242e80cc32dc..6f2f048295ecaa6cc1f967dc7b3b4cc75f3344c0 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -208,5 +208,8 @@ bool intel_dp_has_connector(struct intel_dp *intel_dp,
>  			    const struct drm_connector_state *conn_state);
>  int intel_dp_dsc_max_src_input_bpc(struct intel_display *display);
>  int intel_dp_dsc_min_src_input_bpc(void);
> +int intel_dp_compute_min_hblank(struct intel_crtc_state *crtc_state,
> +				struct drm_connector_state *conn_state,
> +				bool is_dsc);
>  
>  #endif /* __INTEL_DP_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 4c15dcb103aa2ed5650cbbef8c12be53132e6a80..1108c3749d812a45d1675297220dad23969750fe 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -239,26 +239,6 @@ static int intel_dp_mst_dsc_get_slice_count(const struct intel_connector *connec
>  					    num_joined_pipes);
>  }
>  
> -static void intel_dp_mst_compute_min_hblank(struct intel_crtc_state *crtc_state,
> -					    int bpp_x16)
> -{
> -	struct intel_display *display = to_intel_display(crtc_state);
> -	const struct drm_display_mode *adjusted_mode =
> -					&crtc_state->hw.adjusted_mode;
> -	int symbol_size = intel_dp_is_uhbr(crtc_state) ? 32 : 8;
> -	int hblank;
> -
> -	if (DISPLAY_VER(display) < 20)
> -		return;
> -
> -	/* Calculate min Hblank Link Layer Symbol Cycle Count for 8b/10b MST & 128b/132b */
> -	hblank = DIV_ROUND_UP((DIV_ROUND_UP
> -			       (adjusted_mode->htotal - adjusted_mode->hdisplay, 4) * bpp_x16),
> -			      symbol_size);
> -
> -	crtc_state->min_hblank = hblank;
> -}
> -
>  int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
>  				   struct intel_crtc_state *crtc_state,
>  				   struct drm_connector_state *conn_state,
> @@ -329,8 +309,6 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
>  		local_bw_overhead = intel_dp_mst_bw_overhead(crtc_state,
>  							     false, dsc_slice_count, link_bpp_x16);
>  
> -		intel_dp_mst_compute_min_hblank(crtc_state, link_bpp_x16);
> -
>  		intel_dp_mst_compute_m_n(crtc_state,
>  					 local_bw_overhead,
>  					 link_bpp_x16,
> @@ -739,6 +717,11 @@ static int mst_stream_compute_config(struct intel_encoder *encoder,
>  		pipe_config->lane_lat_optim_mask =
>  			bxt_dpio_phy_calc_lane_lat_optim_mask(pipe_config->lane_count);
>  
> +	ret = intel_dp_compute_min_hblank(pipe_config, conn_state,
> +					  pipe_config->dsc.compression_enable);
> +	if (ret)
> +		return ret;
> +
>  	intel_vrr_compute_config(pipe_config, conn_state);
>  
>  	intel_dp_audio_compute_config(encoder, pipe_config, conn_state);
> @@ -1021,12 +1004,10 @@ static void mst_stream_disable(struct intel_atomic_state *state,
>  			       const struct intel_crtc_state *old_crtc_state,
>  			       const struct drm_connector_state *old_conn_state)
>  {
> -	struct intel_display *display = to_intel_display(state);
>  	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
>  	struct intel_dp *intel_dp = to_primary_dp(encoder);
>  	struct intel_connector *connector =
>  		to_intel_connector(old_conn_state->connector);
> -	enum transcoder trans = old_crtc_state->cpu_transcoder;
>  
>  	if (intel_dp_mst_active_streams(intel_dp) == 1)
>  		intel_dp->link.active = false;
> @@ -1034,9 +1015,6 @@ static void mst_stream_disable(struct intel_atomic_state *state,
>  	intel_hdcp_disable(intel_mst->connector);
>  
>  	intel_dp_sink_disable_decompression(state, connector, old_crtc_state);
> -
> -	if (DISPLAY_VER(display) >= 20)
> -		intel_de_write(display, DP_MIN_HBLANK_CTL(trans), 0);
>  }
>  
>  static void mst_stream_post_disable(struct intel_atomic_state *state,
> @@ -1305,7 +1283,7 @@ static void mst_stream_enable(struct intel_atomic_state *state,
>  	enum transcoder trans = pipe_config->cpu_transcoder;
>  	bool first_mst_stream = intel_dp_mst_active_streams(intel_dp) == 1;
>  	struct intel_crtc *pipe_crtc;
> -	int ret, i, min_hblank;
> +	int ret, i;
>  
>  	drm_WARN_ON(display->drm, pipe_config->has_pch_encoder);
>  
> @@ -1320,29 +1298,6 @@ static void mst_stream_enable(struct intel_atomic_state *state,
>  			       TRANS_DP2_VFREQ_PIXEL_CLOCK(crtc_clock_hz & 0xffffff));
>  	}
>  
> -	if (DISPLAY_VER(display) >= 20) {
> -		/*
> -		 * adjust the BlankingStart/BlankingEnd framing control from
> -		 * the calculated value
> -		 */
> -		min_hblank = pipe_config->min_hblank - 2;
> -
> -		/* Maximum value to be programmed is limited to 0x10 */
> -		min_hblank = min(0x10, min_hblank);
> -
> -		/*
> -		 * Minimum hblank accepted for 128b/132b would be 5 and for
> -		 * 8b/10b would be 3 symbol count
> -		 */
> -		if (intel_dp_is_uhbr(pipe_config))
> -			min_hblank = max(min_hblank, 5);
> -		else
> -			min_hblank = max(min_hblank, 3);
> -
> -		intel_de_write(display, DP_MIN_HBLANK_CTL(trans),
> -			       min_hblank);
> -	}
> -
>  	enable_bs_jitter_was(pipe_config);
>  
>  	intel_ddi_enable_transcoder_func(encoder, pipe_config);
> 
> -- 
> 2.25.1
> 
