Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4419CCC4ADC
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 18:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA25110E807;
	Tue, 16 Dec 2025 17:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ug+yjZyy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F8B10E386;
 Tue, 16 Dec 2025 17:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765906258; x=1797442258;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hZMbTwxAg/wQWEgSisZFx0nQiUHoDD4iC2tQt19NDjU=;
 b=Ug+yjZyyF80eGeu28CxyBTmccPs4dKmNJ5sUaEf/W8atYJHGKUtK/q/9
 FQBSpEcIFegqJt2uDbsBavp5VikktrGzQO2SVTuU6t/akWVkuGidxROTR
 nLkKs8O6nX8ug6UNf2D3IqiweMT8oMuPpNMm2SQHPRcREAUE2t5gH420e
 9csl+TFaxSNpQjq4MFNolzBHxhrWJrEo+gTChQL/oF9q6YOO4ZdbN1ede
 ViD1whK1orqluMDPlZ8+wTfqhNirLQ2ZN4f+h3FbIJJD0x/UkcBS7aU7N
 +EtdRVOwuSV4dwBuZwqEDWcIqPmtuG1ehHiiYqxjq6GkEDhugZ4LasOQe w==;
X-CSE-ConnectionGUID: S+N5PLxRS7GbGiN6gTOuYg==
X-CSE-MsgGUID: duYK/HUoQ1iYjLLLoOjHWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78138884"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="78138884"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 09:30:58 -0800
X-CSE-ConnectionGUID: 6vlCT5SNTy+HR9ItBtMMbQ==
X-CSE-MsgGUID: tyysEGuSRQCXZAIUbf2kLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="198073047"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 09:30:58 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 09:30:57 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 09:30:57 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.14) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 09:30:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xq27UpZhubLAF+wi7gQWC6IpvmpQMlz3J7ZJChS0VmDxWPP76Sv8k8IM8YPODn2mJlVOCgQMDUOdNM/SoAhdGr0iTuHBKUOuDinkDbbtS6MxgNZqvE1rnUZnkSde5lGkhvrSICcrUSlpzda4/2iCXrRPTyVxx+kSR4iLUn0L5mG2FJKM+M/IX+45nVdkzy5o8VnKbVoGKOYkirXSJ93PWDIOVidxmBI+FQpFuGghOckg4fErW/c7eMQZq78fVgp7NgSNRlTQAM2uoZJCoHoB8PxaRXOIqr1VNh3evmI1i1ZhLHRTYs4kRT+QKcjShf5zfRCk+Bhfn9gZG4mjHbolJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iquv8mPmNgueVf3UTJmh66xhVpQXBsfxEccCgd2v6TU=;
 b=tZGaSqHUaEMIAhvr1C8DGCaMmjW5nph4Q/T6kv0VPzsEKqDEkmAjXPqFdfy4v4TYhcDn7+clkjaRzVCACNohGJ2PM2dZmL1kGsJz3hY0ByLCRvbSr4ElBQRwcax1dyAkr+7VmdWyY4d51Ezev7ab+CqER1sNWJgitWVlbEX6QtvrPbr/H1OMvGnBPvcjDfbOQw2+ho0pofCpV4Q2XQeNY/ihBs9NAtKxz/bMzSj5sdJG4aECo7YJG6OsgF7SA1tqqYzYmreBmiaXBCSFBrrJzFC1s4I9b/HgaYAjiaUfgR6tt4tpt/BM0tWQCJCY2rS6XXi4BvGFBg3F5VZmdhYNLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by PH8PR11MB8062.namprd11.prod.outlook.com (2603:10b6:510:251::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 17:30:53 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 17:30:53 +0000
Date: Tue, 16 Dec 2025 19:30:40 +0200
From: Imre Deak <imre.deak@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>
CC: Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Luca Coelho
 <luciano.coelho@intel.com>, Jouni =?iso-8859-1?Q?H=F6gander?=
 <jouni.hogander@intel.com>, Vinod Govindapillai
 <vinod.govindapillai@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 00/16] drm/i915/dp: Clean up link BW/DSC slice config
 computation (fixes)
Message-ID: <aUGW6XAOyXlhfy4H@ideak-desk>
References: <20251215192357.172201-1-imre.deak@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251215192357.172201-1-imre.deak@intel.com>
X-ClientProxiedBy: LO4P123CA0284.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::19) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|PH8PR11MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 878c6714-1aa8-4a00-6af8-08de3cc8dcf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?RBObdNSiD4R1si0tZhA6wNUTCtwlusAkl7zC7kbhYLAmYANT9zsRqRtS/h?=
 =?iso-8859-1?Q?SdusRKBQ50bGSRzkeyEI99VKyIweJVHlKaHuqZpMT6E+qUcFq0hM6ly/XN?=
 =?iso-8859-1?Q?cEO3SHiTYMS3f5pIF0IPDm6ol6Bm1PIQ2KQ8Qeld+EzqMOM+cI0HhFDgSg?=
 =?iso-8859-1?Q?bFsOrrLSdJQcXapEAMQj+Z9WygggaUsuW+nCGJ13Oa4nrrNUFRm74aKITS?=
 =?iso-8859-1?Q?Ys4LUS7ilbUvS4bNxW7p2vcfUBZFr92YvSVj20xKRyumPl8UELM8u+aQHS?=
 =?iso-8859-1?Q?SQODMc65z02BQQbo0kWjXx432FhcpSVrSrJvBSBJgEOklWrP0C72NGk9ph?=
 =?iso-8859-1?Q?NGCdtefURCrbGrfTwJreS/Vg9Ab5qAxdp+/e5ZF9jy7HoIqc5k0GlQS5X+?=
 =?iso-8859-1?Q?Zvdu0tJ7231W4BSETydffU32lGhBiE5shDDa5WmgaP3E8xMyEAEw+h9nxN?=
 =?iso-8859-1?Q?d9GC+Fc1BFAIYJqY97QcNQnoVdl3RsdYgn40HDnshjIHLHzaQIIKBGNUIE?=
 =?iso-8859-1?Q?BwP2mvCjQmqRLSCpaI9yFkKp04ziIsDifKm/UFJhBQaFYqxfW2a3x5sij+?=
 =?iso-8859-1?Q?dqYcmJ7q/tw0cK9TSOh9jiEg2YQ+EhljGk92UHPVPXMIUc1gPCXmBf1PnV?=
 =?iso-8859-1?Q?OPDXXutBYFdmX9VnI2saOvIzyMXAMFJaAbi12tBcQHlKMPRKgxreNCI2Rm?=
 =?iso-8859-1?Q?6cvzZXhC1ab+sRGB9RPLWp84gigAigyYdXbYqKT4VUH3M6LG22EOsVDnjF?=
 =?iso-8859-1?Q?BwKSrNGrE+v8+KnY0eO6tJzDnau2cETwCTPiJIztc0p2s5kX19nUbccSHt?=
 =?iso-8859-1?Q?Nob3pNeLfAtbsvUifmf630mInHfVMVR5yAQYULQx0z7LBQJStYVovv37et?=
 =?iso-8859-1?Q?RjEtH3ItuB5X1td1R73caItXLTOzYubmFRy0mqM/UTTjiyMuh5qoCR1Mi7?=
 =?iso-8859-1?Q?pzY8BGGDo30OS/Xnnc9LKlPg+tlHVbdsYPvgRUqpf9LwBktGy0At28UGeA?=
 =?iso-8859-1?Q?FifPq/kVv2PHPknSSgov1P4yHyL+bx68s5JjxDo3AOdS8QYiozva+qy4x4?=
 =?iso-8859-1?Q?Z3bi001CQ4hbIHFSKGteMxR9Nhj4UmcdG1Qz5yQonTPHkJ51cC6dJkUg6n?=
 =?iso-8859-1?Q?wSkKHE+swnHGK0OKUOV869f5UGG392ZhDia8BW2IpOHaSY+NxZmWtAhVFZ?=
 =?iso-8859-1?Q?boZNvoDdyBz0WRD8pAOY4HWiuvm7nwhZsduZdO2OXK7g9Rjat/Qyfp7U5O?=
 =?iso-8859-1?Q?t19WUSoaNZrUiNXz3ZvXcjJePp+GCAmHu4fLa21NKMX0wgfuQ5vB5EC4JS?=
 =?iso-8859-1?Q?tpYxLRahffyfG/Kdw/Ej0U9F1vyebgSzk7jzmge0R1XKcxjRSXzEV4lasv?=
 =?iso-8859-1?Q?vOwPsdPU/IrlQtLypMox9HG+0Vji6ZvMMla6jkUTslcZKHrqQwCpI56+5i?=
 =?iso-8859-1?Q?Sb4v3xFBkeSJV2qxPaLDgmLbJdqz7CjsH53RXAh1xuLTghAvNbU0vZqaRL?=
 =?iso-8859-1?Q?AXAUnSHeRjkFtwUD2DO4PmUgrp6Iq6ey6PNkWdFJKeog=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XjYL9nKeEYP0WSh5GH0D3eZYoXLwnitfwjahdQjOaWFPvmdY/bhmgzp4y7?=
 =?iso-8859-1?Q?2FaMn4CzwqaOsIlmmBBYUsWqUdLO81zUfSqcT9tVVrpy/pqPgq1WiFbbE0?=
 =?iso-8859-1?Q?5mxplIVhaFop7r47ebyjuYdYZux34Gqb6J5/vSv7k4MHz9Tr5jfH8cZHVO?=
 =?iso-8859-1?Q?hH84r/Tv9iaFRbTGXxkdoAdymn6c0+qslKw9oB8Ic4yrkgDBkmH39X5twe?=
 =?iso-8859-1?Q?wagYnqGT51PnsEOWhYCBFAsIkAOnf1hpsZP6zRWuFcJ24aGzDQDkIXwqGK?=
 =?iso-8859-1?Q?Jtp/wxXDssc+il6bXQp9onBYq+Ppt8FwRRuj5YOSmKXMda/J8NFG0tq5gK?=
 =?iso-8859-1?Q?2M2wliVOmvkPZI2IlQ/QfhWXGeBS9KGen4wwM8bREY6B66stWRlQ+goeuk?=
 =?iso-8859-1?Q?HCTHGRB5+XsYqP29WmPOkRuuJWYoil4E+PKRjr+cX4+QSGtjPoMkBtLFDP?=
 =?iso-8859-1?Q?bHI9OoPGmVHCNf+0mNaym8eG4XAkXGLa/yXSgvujDq5RsJbexXxp6wVvEv?=
 =?iso-8859-1?Q?CKwfyZoqPXOGLvI/TgT9ei+ZSFwFC2DvEQU7pUCmRtgcCkoGXXdITMGxqm?=
 =?iso-8859-1?Q?b3FfGuJlb41opQd6kCu5doCdEtop2LgiN2j9CKf9Jag7LO7jirIo6XAH1A?=
 =?iso-8859-1?Q?AcKv0+amJizpsoRPCcR3O9ofgLfCsSICercAAPaEH8tsGsJ0OGEkZBcWH5?=
 =?iso-8859-1?Q?DdeNq+yIMysxkd3OzHdGloCYEmflFX9+laOSXjuf+2jOkWwi2Wpb56w90j?=
 =?iso-8859-1?Q?9GMUp5cUIGRPBXbaArPvTOl6Y+WpOwQn+Z47drOzFDqAVljSCIek67OSeM?=
 =?iso-8859-1?Q?G65ECFqzw9Xofe7/tASBNlvW1EpmUt3kgn8bjvHlp7dD/45mPU5aMhNT73?=
 =?iso-8859-1?Q?vt1SKyVi+Mpjr5rCwxwYQlszjbjFt4WcVkOGR27JWgsnogH2yh1xFHlWIV?=
 =?iso-8859-1?Q?VTHB51tVcIDSaZfIY9fyappL5PsWTvC33A2fn9qkYxt4DE6ALcQZxjvBXM?=
 =?iso-8859-1?Q?EIl4m7eaJF78YhLgKPU+P72bC2lALkuc0xjwcoTYu2hfZrx8/VzdBi2GtT?=
 =?iso-8859-1?Q?D1BpyZ9cQ95QAS3G/vt2qj2bwbR5mmLlZHg6NUQUp7rwPjdqBFrKBkI1P3?=
 =?iso-8859-1?Q?Y/eXz8B228gpIAoG0INKKJ/Qx6No6Di4WGpJNEaiMEmvx/Jz6bAPc8unfo?=
 =?iso-8859-1?Q?MZg4wyYDDe9gI2NHsk0Bcfp8AbpF3Ysu1wvrPd9A303+Jdzmd7RdGQYgcL?=
 =?iso-8859-1?Q?8EcrzwPShpZ4AOTjRTg5mECuMvPXD0ayVWWpcMwef4wRThurlNawml8y8d?=
 =?iso-8859-1?Q?gVAW3ni3vUVIC9ACq5a+DLR6ibnaK1yK5Wvybn70kEblmZ3z5fTfL2nPIZ?=
 =?iso-8859-1?Q?UQZ0LTfkA4fwvwDWimkxzH65pgdTW34lnsDJpaR7C4/eA0uY4YgpGDoOVe?=
 =?iso-8859-1?Q?yOV90HMcxtxHqJRZL3DzTzGlMMq3huGeOLnNO2rgCnxHO9mh9Sh9d0ri49?=
 =?iso-8859-1?Q?TnC9oMHEm5SwZeMT+l/nAM8vZn/wknhZUwt5M3AlCk2kQYo4ynwWIrqam2?=
 =?iso-8859-1?Q?zaGmgc0doDPkivOKgyQVUnhaK1AmOq0W9ceMt1uR/2C5fxZyOChGYvoH5r?=
 =?iso-8859-1?Q?xHcH48wdTOD7oc/CUILohnLGo8Sbd1WUnPCJRINUNVJ8hxurJYR1Znmg3M?=
 =?iso-8859-1?Q?Pv0I1wHUSsPl44x7htKZS2xPchRh3CYS1mYjae1q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 878c6714-1aa8-4a00-6af8-08de3cc8dcf6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 17:30:53.3525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KmcZ86u+cnL4oLRLSmo+ydZFephux1Y0mQs99SxLY1oGfIQtBgaJZ1FO2Lo/x++nnbFjLFyQioQmAe+9uPU/pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8062
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

Hi Thomas, Maarten, Maxime,

could you ack merging patch 1 and 2 in this patchset containing changes
in drm_dp_helper.c via the Intel trees? They fix an issue in the i915/xe
drivers' DP DSC slice-count handling and do not affect other drivers.

Thanks,
Imre

On Mon, Dec 15, 2025 at 09:23:40PM +0200, Imre Deak wrote:
> This is the first part of patchset [1] containing only the fixes for the
> link BW and DSC slice computation. The remaining patches in [1] refactor
> the link BW and DSC slice computation simplifying these, to be sent as a
> follow-up to this patchset.
> 
> I moved patches 13-15 in [1] later in the patchset to be sent as part of
> the follow-up, as these patches are not a dependency for the fixes in
> this patchset.
> 
> [1] https://lore.kernel.org/all/20251127175023.1522538-1-imre.deak@intel.com
> 
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Luca Coelho <luciano.coelho@intel.com>
> Cc: Jouni Högander <jouni.hogander@intel.com>
> Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>
> 
> Imre Deak (16):
>   drm/dp: Parse all DSC slice count caps for eDP 1.5
>   drm/dp: Add drm_dp_dsc_sink_slice_count_mask()
>   drm/i915/dp: Fix DSC sink's slice count capability check
>   drm/i915/dp: Return a fixed point BPP value from intel_dp_output_bpp()
>   drm/i915/dp: Use a mode's crtc_clock vs. clock during state
>     computation
>   drm/i915/dp: Factor out intel_dp_link_bw_overhead()
>   drm/i915/dp: Fix BW check in is_bw_sufficient_for_dsc_config()
>   drm/i915/dp: Use the effective data rate for DP BW calculation
>   drm/i915/dp: Use the effective data rate for DP compressed BW
>     calculation
>   drm/i915/dp: Account with MST, SSC BW overhead for uncompressed DP-MST
>     stream BW
>   drm/i915/dp: Account with DSC BW overhead for compressed DP-SST stream
>     BW
>   drm/i915/dp: Account with pipe joiner max compressed BPP limit for
>     DP-MST and eDP
>   drm/i915/dp: Fail state computation for invalid min/max link BPP
>     values
>   drm/i915/dp: Fail state computation for invalid max throughput BPP
>     value
>   drm/i915/dp: Fail state computation for invalid max sink compressed
>     BPP value
>   drm/i915/dp: Fail state computation for invalid DSC source input BPP
>     values
> 
>  drivers/gpu/drm/display/drm_dp_helper.c       | 103 ++++++---
>  drivers/gpu/drm/i915/display/intel_dp.c       | 211 ++++++++++++------
>  drivers/gpu/drm/i915/display/intel_dp.h       |   9 +-
>  .../drm/i915/display/intel_dp_link_training.c |   4 +-
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  33 ++-
>  include/drm/display/drm_dp_helper.h           |   3 +
>  6 files changed, 234 insertions(+), 129 deletions(-)
> 
> -- 
> 2.49.1
> 
