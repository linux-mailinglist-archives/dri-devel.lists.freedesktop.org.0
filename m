Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA73DBB484A
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 18:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A313110E821;
	Thu,  2 Oct 2025 16:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ggYMtgDG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9748F10E825;
 Thu,  2 Oct 2025 16:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759422222; x=1790958222;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=P+/FW5sxzuteriR8xMR5Cv4aQmGP69GFh7MRebmMqIg=;
 b=ggYMtgDGDYrSJemOy9dGGNdDxcUsyFncccMzyb0Hko+2MtCKiVGxwk2t
 5MfioWcqABZPTEU77CVOEj+Ms8AXFRFh2XF+u+YHfVaup8JhpKOCOoY9U
 9KIHp1TIxbHpuWYX0JuocgntXE3fVZrBXi1bczMD+hyBjdtT2qbd0cFWw
 4Kt+mH7PDQFVXWy7EcBaxSgcQjCGKNdmLxJ9/5idxQkpSG9zorYOcoY5A
 BiTWh+0Ul+JbUFqa92M7bV5qO3DUiOUSgXouyC43ibRAvy8AHfvGfUZbk
 7SrjaJsGKRJZ/OiNBNulcmNfvTNU96LpPIQZcPHZ8qj7x/xsLDyJd7xq4 Q==;
X-CSE-ConnectionGUID: rRzK8/Z5ShW0aPm532P9FA==
X-CSE-MsgGUID: BB2FYrPOSMyCfi1MpGurrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="84328841"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="84328841"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 09:23:41 -0700
X-CSE-ConnectionGUID: 70Cwibe4RTi7+gKtppUkrQ==
X-CSE-MsgGUID: 8vDwtlLNRpSpkhPKg4E8JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="179095862"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 09:23:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 09:23:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 09:23:40 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 09:23:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pfWuuD6GLEeK2xI5SMKffIsTL5hmXBhF76TWQno/bbgGHEZM6sF4rSjdEeXNONZXwQx5j3Ha11T0nTxuzKbVX5w/OCMiMsGN6nIkTCgOsEYWAnTP7g7NB7lTSrKyiKN+TWV0sqXfIhYDEI48L5UZ8bf9YMBSZMd2Z/FtVJFsvvT/sAhQWqP28NiqZmGMjd2xuhzXkFhMdcbPFWbaUUOE7NgTMPV04c53Opq+fTCWUVwX2nQEf1akh/7hwZjF1G+U9p70yMHU+3eodcwyJ30o8rSFQV+VMjoSYOBYQe7jyyC1Qcp8ZVAvu8lxqb9QzBJH0Fg0IucEW0pYfBSdSzXpJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6HWKjk/2usNPmSDQfHm4T5FPOfwDNu74fcqgmDJvXc=;
 b=ybjbUCvbnBr/PIaTWBL8vjth1i/64d11jGApD9q9C6P3IalbZ76n4mzKD25R4JkyVOK78CtQmXUOHMxmtDgDEDuXKoepJISsBCJEVH/58hWf85QnMrpYovweTyZCUb4XqyoqIkmtP60ePjyEIZCzITkrbBj9JdDfoqigbYbBu/BqxDICoRiS0yviRv27uLOVa+/EtSVjWGe2N4HwP2n+qvUlulp3Y6KMx0DJbNbp4wgRrSjlswIsMjBeMn4l/pu9ydLEmOQBGqD+zWkZ1ku65U8VtnENHi/iyrUb2qiMlyvMrvHcI7lYb5bSSEWjU9YbMw3Q7xzs5novHoBjp909Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by MN0PR11MB6256.namprd11.prod.outlook.com (2603:10b6:208:3c3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Thu, 2 Oct
 2025 16:23:30 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 16:23:30 +0000
Date: Thu, 2 Oct 2025 19:23:24 +0300
From: Imre Deak <imre.deak@intel.com>
To: Vidya Srinivas <vidya.srinivas@intel.com>, Swati Sharma
 <swati2.sharma@intel.com>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 <I915-ci-infra@lists.freedesktop.org>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFp?= =?utf-8?Q?lure_fo?=
 =?utf-8?Q?r?= drm/i915/dp: Work around a DSC pixel throughput issue (rev7)
Message-ID: <aN6m_LWAugkj1sBh@ideak-desk>
References: <20250930182450.563016-1-imre.deak@intel.com>
 <175930328815.382019.17098929692493359848@1538d3639d33>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <175930328815.382019.17098929692493359848@1538d3639d33>
X-ClientProxiedBy: LO2P265CA0308.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::32) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|MN0PR11MB6256:EE_
X-MS-Office365-Filtering-Correlation-Id: 44bc543e-734e-469a-6da4-08de01d0062b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4Y5iLtM+G8Fk/CLTcpUd2jEH9rM7pruPLZK3ljjZ8OCMZQi9koY5ed0As8D7?=
 =?us-ascii?Q?xEO52+U+ciaYghf/oE3o+YVt/Aub8sgC8jBl7ujkZAnZNAYioWLGN7anbVj7?=
 =?us-ascii?Q?1TBChiynzblJoOC98IJhp4/46OqdQX918J2IoP7Fq9IAjEgHbYADT7Yr1mqe?=
 =?us-ascii?Q?QPFqwoehr1LFGqnfbsEsgcYkPlpyY5Hw4MmufKZYepFpDNu5kBcTpLREftwz?=
 =?us-ascii?Q?dkBPArylB3q5GXcEFTaR1i6N2UXAxmaPEW+wHAyICnKBw6wdP0lNIrixc/GH?=
 =?us-ascii?Q?5UNl2L8R5cvsKBuvfBM4wYf+nvH2tWGvT0z7AW0CJbtUz1ytJ19OEbxnzm47?=
 =?us-ascii?Q?cX0iQ+2a/5jj6dfFPWo5eSYMNAH36z7aaBpZwDxDlLD9sYlPEIpF6q+IVdcP?=
 =?us-ascii?Q?SzVPGIGkS7n4Gu0ZAZQGeANiz4+lPtInBTe0P1hluzPMx32MXOgAvMHP/Ztl?=
 =?us-ascii?Q?m15XD19kUqS4l16ySZCylpqHmiGXL2hl7FP6ULoozBhVAzvTZ6XHoeQmDWp6?=
 =?us-ascii?Q?bXCQZaqC/2gfvT/Vpk+4kkzuQeSedMA/fWoQo7yFRQ9sgyGW0yWuY2+b+fpf?=
 =?us-ascii?Q?m0t3C7PFEPr9xaGsFKWa0e0yXF8QLT603gm6Jc/iRpBUgWGqGJMTjQvmZv3u?=
 =?us-ascii?Q?KAckE23aOjHluf8MAQ2SClL42YUdAMrXl/eO+y9wNsls75SslUVHg5IJZSG2?=
 =?us-ascii?Q?MqS2fiF+qu11HcpOxyDw4oXo91GKEgWo8ns3r2mViH7fZb5An+MGKH1Gfza6?=
 =?us-ascii?Q?NU6HCS/o7TrI3cWrniRKtxitd6xIPJwbtHGM9K0ZhIjS8V3mGdBCct7hYdVb?=
 =?us-ascii?Q?56gSycwY+WAKXysA65kyKTyV1FsTBd0Ee9UQ3gdBgKA40g11nRhZETPHp4K6?=
 =?us-ascii?Q?Vmhmtmat7Yt3p2SyBgxmj/3Gr+iFL46GrkefYP7EeXGf/B4BsJ3ymyccNGF0?=
 =?us-ascii?Q?wR5WNE5ccKP6KJnChCGQ9QVVGR52+Qj4/QEHKyTILSxfkOxNWooP1farl3EA?=
 =?us-ascii?Q?SNmWZ86UBphteD7/xPYvGuVCOKMZJdeedQoxeDQEFOX/5CCucxInlg/Ki86S?=
 =?us-ascii?Q?Y5cSItAyyrJc4HEHKhupwL9ZiLj4xmdyai58PWk1+GtcWJebukViT5f7DX6P?=
 =?us-ascii?Q?FNm0YRWqB6LfMF83DJ7CnNgWzFNGWBbFmkFfnERFh1vHDgRaNUZxAlqnatzq?=
 =?us-ascii?Q?u7xchifPsSwVRTrXvp48KIL/wxzBKPvAnLXLS6WHQnTbBfHHWR+H+7ERID+j?=
 =?us-ascii?Q?TtTBZrhVwBunaoGqrKsKt09O9qtsVBGog84SC2CD2pbp16bcDIKj6eCi4K9M?=
 =?us-ascii?Q?DIlioSyPslzzXqZLMERBOkvRVOt08I1WAt4urREu56m3eClmb6SfvfJJ0QFu?=
 =?us-ascii?Q?jwkpesTgtQM93VIMgMGFoHNRRcE4wY9RlxZVRNLB161Ln4R4CQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rg2YEG3GFY4sUNLV5TSYOT/NOHoLW9FFHlBdZFMcmbKoo0eZs6HMDYY8JkCF?=
 =?us-ascii?Q?qJui2wDAcAQp5mlGvQT3574Hk1MoC/7brfRhiZNhHbUtIRVzcxoVljNORbsJ?=
 =?us-ascii?Q?9uQrlscFRjnbBb64kn02SnChXjRcbDBRa0TgNYP/3Rn3b0GonCd2ztQ6tGJi?=
 =?us-ascii?Q?2GzxctRQ6kh67EszG89NODBh90HYcEcBYWzAma7P5N5LmoJk2LqIbkLC3AJm?=
 =?us-ascii?Q?Y5kO7huG+6HHn3tYkA4+kNTNYAvvoKCMknQk0uCvsFSk7Nzs6VFzkJ3gs6OS?=
 =?us-ascii?Q?OQ36fPo4ja9lz4QSi8VCdCe4GhsDdM4KTHBg0lAt1fEhceYSb0HwKf5p47Jc?=
 =?us-ascii?Q?ArcZ4b6p+yELVu1Epw1d+c3BbJB2zbV0CiR6fc/dMkhbDK9+Ny87fv/t9dvp?=
 =?us-ascii?Q?hSVwTsVlGVwu07EOxM9eHSbiCs1R0GHPF2pDmSg4AictB3zMW4tC4BWHgBVq?=
 =?us-ascii?Q?FZ67UXHKDiqzxhNITN08YYMu2NlsjFauMG9aiP+WH5ZA/upxw2Cfw7xUZYH2?=
 =?us-ascii?Q?B27qAY9GL8w8Unv6X6DZSHVMLOWET6jo+zc1zF3YCW3gaXT+LWuhAtSCDe9K?=
 =?us-ascii?Q?oMMG5lE0f0adoVlTvELyuQxQRNsKGqoZkVc48ybbBUKVa1crL4V2KHUB4iaY?=
 =?us-ascii?Q?yCxKniuq7LEJ6XFcPVU0ecQ7znHSqGD0d5ZbCh7O2Xu7hppvAYhfL1RO1qXb?=
 =?us-ascii?Q?ROek4QMQTrqjaoHAJQNUXxXaeEzlN4buuC2u/lY2k4aHA2x2rLIs0eGjUz/3?=
 =?us-ascii?Q?4uan3BmBm32SWd6KyOIxhBVVXPEbCiKhq4VYSPgrFdk5gM+fVbAAnVM47YHN?=
 =?us-ascii?Q?ksJt0riJ3vwml3xplxOFaCHlJJTY51f2cItDGtqJSlOQ4g4qbZyPoFvtsBWV?=
 =?us-ascii?Q?8zS4Tx7NYON6HjvRfg+uXQ/HnafnXIqSSClzLK7+hTZu6px7rVM1FWzmRtw2?=
 =?us-ascii?Q?3BMTrw6V8p3QkT+EUwtVV90YOJz8GeJ12FnPHeNxUGxDwrpauvk5t+p+3lPw?=
 =?us-ascii?Q?jQBR7oXU+V8RolQNqO7o0mfNNXHy4RPXwv7r7YP5ZPMwesbX3FqyJbiQeSqi?=
 =?us-ascii?Q?1Ua1CE9FCz8gV4NM7sBV2VBZCyWQ6txdHnoyCEI6ngUeA6ifR9nATKTiw6uG?=
 =?us-ascii?Q?3l7smT+1rG1CkIlYdvTIt7R4xNjiNi8JaTQuJ1oE3R/gbBHU1S11VK9FB5mD?=
 =?us-ascii?Q?GsLtFmwW1yXVRanuw6Z/BfayDU9sr9IoihvuCMZOgWpLwpBB2z+m8d5GVJJO?=
 =?us-ascii?Q?c9Cl8z3utK5ClPsG2ghJixunsJWDeVScVnRajk7w8FgW8GyfhOh3vWStQxFg?=
 =?us-ascii?Q?20AwQelvDCs883MQ8iVsXE2rwcCjxBGI0mfQ46QiErPVlAfBR/tgs7SuziCC?=
 =?us-ascii?Q?iGx5zJGvbTqZ7z5v8D6k5kcEx1DH4ch1p19XLsuADHOPQgJ+yYlTdm5lcovg?=
 =?us-ascii?Q?/3GfVe7Zzi9OqXeREJ4OwNwZh3fl9r+aPSfF5z4gwZcpdPu0DMh21GFhfnCx?=
 =?us-ascii?Q?C/947Wpto7oMr0tLsiLln5woNZBMXbjEUUTnWA77TMUWAR1F896cGvLU1m4R?=
 =?us-ascii?Q?crsI9hlY8rNSv9fMSPHeNXzijcBZl9DpUpD6OULWQCZujRBSyDlV8iz+GVlc?=
 =?us-ascii?Q?KpQyqnIYa/u9+CUs2kLdRlkmlQ3fUc8sy473hLfmTPdr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44bc543e-734e-469a-6da4-08de01d0062b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 16:23:30.7491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rfXwEbip9S/Kb/tvuXPfoEKLMZTqRc1ibxFnkwG2HfTVsFh9dczkr2uu6Ki7f1yeZMF7RCqd8o0LUGOb3TViCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6256
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

On Wed, Oct 01, 2025 at 07:21:28AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/i915/dp: Work around a DSC pixel throughput issue (rev7)
> URL   : https://patchwork.freedesktop.org/series/154736/
> State : failure

Thanks for the reports, reviews, testing and ack, patchset is pushed to
drm-intel-next. The failure is unrelated see below, CI team please
consider updating the cibug filter for this case.

> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_17290_full -> Patchwork_154736v7_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with Patchwork_154736v7_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in Patchwork_154736v7_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in Patchwork_154736v7_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [FAIL][1] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

The changes are DP specific, so shouldn't have any effect on HDMI
connectors. It looks similar to:
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956

> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_pm_rpm@system-suspend-idle}:
>     - shard-dg2:          [PASS][2] -> [INCOMPLETE][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-dg2-3/igt@kms_pm_rpm@system-suspend-idle.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-5/igt@kms_pm_rpm@system-suspend-idle.html
>     - shard-rkl:          [SKIP][4] ([i915#14544]) -> [INCOMPLETE][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_pm_rpm@system-suspend-idle.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-3/igt@kms_pm_rpm@system-suspend-idle.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_17290_full and Patchwork_154736v7_full:
> 
> ### New IGT tests (5) ###
> 
>   * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.48] s
> 
>   * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-hdmi-a-1:
>     - Statuses : 1 fail(s)
>     - Exec time: [0.48] s
> 
>   * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-d-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.45] s
> 
>   * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-b-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.95] s
> 
>   * igt@kms_plane_alpha_blend@coverage-7efc@pipe-b-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.56] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in Patchwork_154736v7_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-keep-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][6] ([i915#8411]) +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@api_intel_bb@object-reloc-keep-cache.html
> 
>   * igt@api_intel_bb@object-reloc-purge-cache:
>     - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#8411])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-7/igt@api_intel_bb@object-reloc-purge-cache.html
> 
>   * igt@fbdev@info:
>     - shard-glk10:        NOTRUN -> [SKIP][8] ([i915#1849])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-glk10/igt@fbdev@info.html
> 
>   * igt@gem_bad_reloc@negative-reloc-lut:
>     - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#3281]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-7/igt@gem_bad_reloc@negative-reloc-lut.html
> 
>   * igt@gem_basic@multigpu-create-close:
>     - shard-rkl:          NOTRUN -> [SKIP][10] ([i915#7697])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-5/igt@gem_basic@multigpu-create-close.html
>     - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#7697])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-8/igt@gem_basic@multigpu-create-close.html
> 
>   * igt@gem_ccs@block-multicopy-compressed:
>     - shard-tglu-1:       NOTRUN -> [SKIP][12] ([i915#9323])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@gem_ccs@block-multicopy-compressed.html
> 
>   * igt@gem_ccs@ctrl-surf-copy:
>     - shard-tglu-1:       NOTRUN -> [SKIP][13] ([i915#3555] / [i915#9323])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy.html
> 
>   * igt@gem_ctx_isolation@preservation-s3:
>     - shard-dg1:          [PASS][14] -> [DMESG-WARN][15] ([i915#4423]) +3 other tests dmesg-warn
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-dg1-16/igt@gem_ctx_isolation@preservation-s3.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg1-16/igt@gem_ctx_isolation@preservation-s3.html
> 
>   * igt@gem_ctx_persistence@heartbeat-hang:
>     - shard-dg2-9:        NOTRUN -> [SKIP][16] ([i915#8555]) +1 other test skip
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@gem_ctx_persistence@heartbeat-hang.html
> 
>   * igt@gem_ctx_persistence@saturated-hostile-nopreempt@rcs0:
>     - shard-dg2-9:        NOTRUN -> [SKIP][17] ([i915#5882]) +7 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@gem_ctx_persistence@saturated-hostile-nopreempt@rcs0.html
> 
>   * igt@gem_ctx_sseu@engines:
>     - shard-tglu:         NOTRUN -> [SKIP][18] ([i915#280])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-8/igt@gem_ctx_sseu@engines.html
> 
>   * igt@gem_ctx_sseu@invalid-sseu:
>     - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#280]) +1 other test skip
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@gem_ctx_sseu@invalid-sseu.html
> 
>   * igt@gem_exec_balancer@invalid-bonds:
>     - shard-dg2-9:        NOTRUN -> [SKIP][20] ([i915#4036])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@gem_exec_balancer@invalid-bonds.html
> 
>   * igt@gem_exec_balancer@parallel-keep-submit-fence:
>     - shard-tglu-1:       NOTRUN -> [SKIP][21] ([i915#4525])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@gem_exec_balancer@parallel-keep-submit-fence.html
> 
>   * igt@gem_exec_balancer@parallel-ordering:
>     - shard-tglu:         NOTRUN -> [SKIP][22] ([i915#4525])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-8/igt@gem_exec_balancer@parallel-ordering.html
> 
>   * igt@gem_exec_big@single:
>     - shard-tglu:         NOTRUN -> [ABORT][23] ([i915#11713] / [i915#14756])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-9/igt@gem_exec_big@single.html
> 
>   * igt@gem_exec_capture@capture-invisible@lmem0:
>     - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#6334]) +2 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@gem_exec_capture@capture-invisible@lmem0.html
> 
>   * igt@gem_exec_capture@capture-invisible@smem0:
>     - shard-tglu-1:       NOTRUN -> [SKIP][25] ([i915#6334]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@gem_exec_capture@capture-invisible@smem0.html
> 
>   * igt@gem_exec_capture@capture@vecs0-lmem0:
>     - shard-dg2-9:        NOTRUN -> [FAIL][26] ([i915#11965]) +4 other tests fail
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@gem_exec_capture@capture@vecs0-lmem0.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-uc:
>     - shard-dg2-9:        NOTRUN -> [SKIP][27] ([i915#3539] / [i915#4852]) +2 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
> 
>   * igt@gem_exec_flush@basic-uc-prw-default:
>     - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#3539])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@gem_exec_flush@basic-uc-prw-default.html
> 
>   * igt@gem_exec_flush@basic-uc-set-default:
>     - shard-dg2-9:        NOTRUN -> [SKIP][29] ([i915#3539])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@gem_exec_flush@basic-uc-set-default.html
> 
>   * igt@gem_exec_flush@basic-wb-rw-default:
>     - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#3539] / [i915#4852]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-5/igt@gem_exec_flush@basic-wb-rw-default.html
> 
>   * igt@gem_exec_reloc@basic-gtt-read:
>     - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#3281]) +6 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-5/igt@gem_exec_reloc@basic-gtt-read.html
> 
>   * igt@gem_exec_reloc@basic-gtt-read-active:
>     - shard-dg2-9:        NOTRUN -> [SKIP][32] ([i915#3281]) +7 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@gem_exec_reloc@basic-gtt-read-active.html
>     - shard-mtlp:         NOTRUN -> [SKIP][33] ([i915#3281])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-mtlp-2/igt@gem_exec_reloc@basic-gtt-read-active.html
> 
>   * igt@gem_exec_schedule@preempt-queue-chain:
>     - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#4537] / [i915#4812]) +1 other test skip
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@gem_exec_schedule@preempt-queue-chain.html
> 
>   * igt@gem_exec_schedule@reorder-wide:
>     - shard-dg2-9:        NOTRUN -> [SKIP][35] ([i915#4537] / [i915#4812])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@gem_exec_schedule@reorder-wide.html
> 
>   * igt@gem_fence_thrash@bo-write-verify-x:
>     - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#4860]) +3 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-5/igt@gem_fence_thrash@bo-write-verify-x.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
>     - shard-dg2-9:        NOTRUN -> [SKIP][37] ([i915#4860])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html
> 
>   * igt@gem_lmem_swapping@heavy-multi:
>     - shard-tglu-1:       NOTRUN -> [SKIP][38] ([i915#4613]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@gem_lmem_swapping@heavy-multi.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random:
>     - shard-glk:          NOTRUN -> [SKIP][39] ([i915#4613])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-glk5/igt@gem_lmem_swapping@heavy-verify-random.html
> 
>   * igt@gem_lmem_swapping@parallel-random:
>     - shard-tglu:         NOTRUN -> [SKIP][40] ([i915#4613])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-8/igt@gem_lmem_swapping@parallel-random.html
> 
>   * igt@gem_madvise@dontneed-before-exec:
>     - shard-dg2-9:        NOTRUN -> [SKIP][41] ([i915#3282])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@gem_madvise@dontneed-before-exec.html
> 
>   * igt@gem_mmap_gtt@basic-small-bo-tiledy:
>     - shard-dg2-9:        NOTRUN -> [SKIP][42] ([i915#4077]) +7 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@gem_mmap_gtt@basic-small-bo-tiledy.html
> 
>   * igt@gem_mmap_gtt@medium-copy-odd:
>     - shard-rkl:          [PASS][43] -> [DMESG-WARN][44] ([i915#12917] / [i915#12964])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-8/igt@gem_mmap_gtt@medium-copy-odd.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@gem_mmap_gtt@medium-copy-odd.html
> 
>   * igt@gem_mmap_wc@write-cpu-read-wc:
>     - shard-dg2-9:        NOTRUN -> [SKIP][45] ([i915#4083]) +1 other test skip
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@gem_mmap_wc@write-cpu-read-wc.html
> 
>   * igt@gem_mmap_wc@write-wc-read-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#4083]) +3 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-5/igt@gem_mmap_wc@write-wc-read-gtt.html
> 
>   * igt@gem_partial_pwrite_pread@reads-snoop:
>     - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#3282]) +1 other test skip
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-5/igt@gem_partial_pwrite_pread@reads-snoop.html
> 
>   * igt@gem_pread@display:
>     - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#3282]) +4 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@gem_pread@display.html
> 
>   * igt@gem_pxp@create-valid-protected-context:
>     - shard-dg2-9:        NOTRUN -> [SKIP][49] ([i915#4270]) +2 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@gem_pxp@create-valid-protected-context.html
> 
>   * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
>     - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#4270]) +2 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
> 
>   * igt@gem_render_copy@y-tiled-ccs-to-linear:
>     - shard-dg2-9:        NOTRUN -> [SKIP][51] ([i915#5190] / [i915#8428]) +5 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@gem_render_copy@y-tiled-ccs-to-linear.html
> 
>   * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
>     - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#5190] / [i915#8428]) +6 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
>     - shard-dg2-9:        NOTRUN -> [SKIP][53] ([i915#4079]) +2 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
> 
>   * igt@gem_softpin@evict-snoop-interruptible:
>     - shard-dg2-9:        NOTRUN -> [SKIP][54] ([i915#4885])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@gem_softpin@evict-snoop-interruptible.html
> 
>   * igt@gem_softpin@noreloc-s3:
>     - shard-rkl:          [PASS][55] -> [INCOMPLETE][56] ([i915#13809])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-2/igt@gem_softpin@noreloc-s3.html
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-3/igt@gem_softpin@noreloc-s3.html
> 
>   * igt@gem_userptr_blits@coherency-sync:
>     - shard-dg2-9:        NOTRUN -> [SKIP][57] ([i915#3297])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@gem_userptr_blits@coherency-sync.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
>     - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#3297] / [i915#4880])
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-8/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
> 
>   * igt@gem_userptr_blits@readonly-unsync:
>     - shard-tglu:         NOTRUN -> [SKIP][59] ([i915#3297])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-8/igt@gem_userptr_blits@readonly-unsync.html
> 
>   * igt@gen9_exec_parse@bb-secure:
>     - shard-dg2-9:        NOTRUN -> [SKIP][60] ([i915#2856])
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@gen9_exec_parse@bb-secure.html
> 
>   * igt@gen9_exec_parse@cmd-crossing-page:
>     - shard-tglu:         NOTRUN -> [SKIP][61] ([i915#2527] / [i915#2856])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-8/igt@gen9_exec_parse@cmd-crossing-page.html
> 
>   * igt@gen9_exec_parse@shadow-peek:
>     - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#2856]) +4 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-5/igt@gen9_exec_parse@shadow-peek.html
>     - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#2527])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-7/igt@gen9_exec_parse@shadow-peek.html
> 
>   * igt@gen9_exec_parse@valid-registers:
>     - shard-tglu-1:       NOTRUN -> [SKIP][64] ([i915#2527] / [i915#2856])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@gen9_exec_parse@valid-registers.html
> 
>   * igt@i915_drm_fdinfo@all-busy-check-all:
>     - shard-dg2-9:        NOTRUN -> [SKIP][65] ([i915#14123])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@i915_drm_fdinfo@all-busy-check-all.html
> 
>   * igt@i915_drm_fdinfo@busy-hang@vecs0:
>     - shard-dg2-9:        NOTRUN -> [SKIP][66] ([i915#14073]) +15 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@i915_drm_fdinfo@busy-hang@vecs0.html
> 
>   * igt@i915_drm_fdinfo@virtual-busy:
>     - shard-dg2-9:        NOTRUN -> [SKIP][67] ([i915#14118])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@i915_drm_fdinfo@virtual-busy.html
> 
>   * igt@i915_drm_fdinfo@virtual-busy-hang-all:
>     - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#14118])
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-5/igt@i915_drm_fdinfo@virtual-busy-hang-all.html
> 
>   * igt@i915_pm_freq_api@freq-reset:
>     - shard-tglu-1:       NOTRUN -> [SKIP][69] ([i915#8399])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@i915_pm_freq_api@freq-reset.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#11681] / [i915#6621])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_pm_rps@thresholds-idle-park:
>     - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#11681])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-5/igt@i915_pm_rps@thresholds-idle-park.html
> 
>   * igt@i915_query@test-query-geometry-subslices:
>     - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#5723])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-5/igt@i915_query@test-query-geometry-subslices.html
> 
>   * igt@i915_suspend@forcewake:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][73] ([i915#4817])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-glk5/igt@i915_suspend@forcewake.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#4212])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
>     - shard-dg2-9:        NOTRUN -> [SKIP][75] ([i915#4212]) +1 other test skip
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-dg2:          [PASS][76] -> [FAIL][77] ([i915#5956])
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-dg2-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-tglu-1:       NOTRUN -> [SKIP][78] ([i915#1769] / [i915#3555])
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>     - shard-dg2-9:        NOTRUN -> [SKIP][79] ([i915#1769] / [i915#3555])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [FAIL][80] ([i915#5956])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition:
>     - shard-glk10:        NOTRUN -> [SKIP][81] +463 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-glk10/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
>     - shard-tglu-1:       NOTRUN -> [SKIP][82] ([i915#5286]) +1 other test skip
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>     - shard-tglu:         NOTRUN -> [SKIP][83] ([i915#5286]) +1 other test skip
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-9/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-dg2-9:        NOTRUN -> [SKIP][84] +5 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-mtlp:         [PASS][85] -> [FAIL][86] ([i915#5138])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#3638]) +2 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-7/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#5190])
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-dg2-9:        NOTRUN -> [SKIP][89] ([i915#4538] / [i915#5190]) +7 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#4538] / [i915#5190]) +8 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-rkl:          NOTRUN -> [SKIP][91] +1 other test skip
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs:
>     - shard-dg2-9:        NOTRUN -> [SKIP][92] ([i915#10307] / [i915#6095]) +24 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#10307] / [i915#6095]) +78 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#6095]) +33 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-2/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#12313]) +2 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#6095]) +95 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg1-13/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>     - shard-tglu-1:       NOTRUN -> [SKIP][97] ([i915#6095]) +39 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
>     - shard-dg2-9:        NOTRUN -> [SKIP][98] ([i915#6095]) +4 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#6095]) +12 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>     - shard-dg2-9:        NOTRUN -> [SKIP][100] ([i915#12313])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#14098] / [i915#6095]) +37 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][102] ([i915#6095]) +24 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-9/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-tglu-1:       NOTRUN -> [SKIP][104] ([i915#3742])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-2:
>     - shard-dg2-9:        NOTRUN -> [SKIP][105] ([i915#13781]) +4 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio:
>     - shard-dg2-9:        NOTRUN -> [SKIP][106] ([i915#11151] / [i915#7828]) +7 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_chamelium_audio@hdmi-audio.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio-edid:
>     - shard-tglu-1:       NOTRUN -> [SKIP][107] ([i915#11151] / [i915#7828]) +4 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@kms_chamelium_audio@hdmi-audio-edid.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-read:
>     - shard-tglu:         NOTRUN -> [SKIP][108] ([i915#11151] / [i915#7828]) +1 other test skip
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-8/igt@kms_chamelium_edid@hdmi-edid-read.html
> 
>   * igt@kms_chamelium_frames@dp-crc-fast:
>     - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#11151] / [i915#7828]) +8 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-5/igt@kms_chamelium_frames@dp-crc-fast.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#11151] / [i915#7828])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_color@legacy-gamma-reset:
>     - shard-rkl:          [PASS][111] -> [SKIP][112] ([i915#12655] / [i915#14544])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-2/igt@kms_color@legacy-gamma-reset.html
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_color@legacy-gamma-reset.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#7118] / [i915#9424]) +1 other test skip
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-dg2-9:        NOTRUN -> [SKIP][114] ([i915#7118] / [i915#9424])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@content-type-change:
>     - shard-dg2-9:        NOTRUN -> [SKIP][115] ([i915#9424])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#3299])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@kms_content_protection@dp-mst-type-1.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][117] ([i915#3116] / [i915#3299])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-tglu:         NOTRUN -> [SKIP][118] ([i915#6944] / [i915#7116] / [i915#7118])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-8/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x10:
>     - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#3555])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-5/igt@kms_cursor_crc@cursor-offscreen-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-256x256:
>     - shard-rkl:          [PASS][120] -> [SKIP][121] ([i915#14544]) +34 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-256x256.html
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x256.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#13049])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#13049])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@kms_cursor_crc@cursor-random-512x512.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][124] ([i915#13049])
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
>     - shard-tglu-1:       NOTRUN -> [SKIP][125] ([i915#3555])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
>     - shard-tglu-1:       NOTRUN -> [FAIL][126] ([i915#13566]) +1 other test fail
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [FAIL][127] ([i915#13566]) +2 other tests fail
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x10:
>     - shard-dg2:          NOTRUN -> [SKIP][128] ([i915#3555]) +2 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@kms_cursor_crc@cursor-sliding-32x10.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#13046] / [i915#5354]) +3 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>     - shard-dg2-9:        NOTRUN -> [SKIP][130] ([i915#13046] / [i915#5354]) +4 other tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#4103] / [i915#4213])
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
>     - shard-glk10:        NOTRUN -> [SKIP][132] ([i915#11190]) +2 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-glk10/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>     - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#9067])
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#9833])
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>     - shard-tglu-1:       NOTRUN -> [SKIP][135] ([i915#9723]) +1 other test skip
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
>     - shard-dg2-9:        NOTRUN -> [SKIP][136] ([i915#9833])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#13691])
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#3804])
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#1257])
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-8/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_dp_link_training@uhbr-mst:
>     - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#13748])
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-5/igt@kms_dp_link_training@uhbr-mst.html
>     - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#13748])
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-7/igt@kms_dp_link_training@uhbr-mst.html
> 
>   * igt@kms_draw_crc@draw-method-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][142] ([i915#8812])
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-8/igt@kms_draw_crc@draw-method-mmap-gtt.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-dg2-9:        NOTRUN -> [SKIP][143] ([i915#3555] / [i915#3840])
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-tglu:         NOTRUN -> [SKIP][144] ([i915#3555] / [i915#3840])
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-9/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#3555] / [i915#3840])
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-8/igt@kms_dsc@dsc-with-output-formats.html
>     - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#3555] / [i915#3840])
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-dg2-9:        NOTRUN -> [SKIP][147] ([i915#4854])
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_feature_discovery@chamelium.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][148] ([i915#2065] / [i915#4854])
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-dg2-9:        NOTRUN -> [SKIP][149] ([i915#1839])
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_fence_pin_leak:
>     - shard-dg2-9:        NOTRUN -> [SKIP][150] ([i915#4881])
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_fence_pin_leak.html
> 
>   * igt@kms_flip@2x-blocking-wf_vblank:
>     - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#3637] / [i915#9934]) +2 other tests skip
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-8/igt@kms_flip@2x-blocking-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
>     - shard-dg2-9:        NOTRUN -> [SKIP][152] ([i915#9934]) +2 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
> 
>   * igt@kms_flip@2x-flip-vs-panning:
>     - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#9934]) +6 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@kms_flip@2x-flip-vs-panning.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][154] ([i915#3637] / [i915#9934]) +4 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@kms_flip@2x-flip-vs-panning.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][155] ([i915#12745] / [i915#4839])
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][156] ([i915#4839])
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1:
>     - shard-rkl:          NOTRUN -> [DMESG-WARN][157] ([i915#12964]) +8 other tests dmesg-warn
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-4/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
>     - shard-rkl:          [PASS][158] -> [SKIP][159] ([i915#14544] / [i915#3637]) +3 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-8/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
> 
>   * igt@kms_flip@flip-vs-fences:
>     - shard-dg2-9:        NOTRUN -> [SKIP][160] ([i915#8381])
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_flip@flip-vs-fences.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
>     - shard-tglu-1:       NOTRUN -> [SKIP][161] ([i915#2587] / [i915#2672]) +1 other test skip
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
>     - shard-dg2-9:        NOTRUN -> [SKIP][162] ([i915#2672] / [i915#3555])
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>     - shard-dg2-9:        NOTRUN -> [SKIP][163] ([i915#2672]) +1 other test skip
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>     - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#2672]) +3 other tests skip
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
>     - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#2672] / [i915#3555])
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#2672]) +3 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>     - shard-tglu-1:       NOTRUN -> [SKIP][168] ([i915#2672] / [i915#3555]) +1 other test skip
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
>     - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#2672] / [i915#3555]) +1 other test skip
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
>     - shard-dg2-9:        NOTRUN -> [SKIP][170] ([i915#2672] / [i915#3555] / [i915#5190])
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling:
>     - shard-rkl:          [PASS][171] -> [SKIP][172] ([i915#14544] / [i915#3555]) +2 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-5/igt@kms_flip_tiling@flip-change-tiling.html
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_flip_tiling@flip-change-tiling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
>     - shard-dg2:          [PASS][173] -> [FAIL][174] ([i915#6880])
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite:
>     - shard-tglu:         NOTRUN -> [SKIP][175] +22 other tests skip
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite:
>     - shard-rkl:          [PASS][176] -> [SKIP][177] ([i915#14544] / [i915#1849] / [i915#5354]) +7 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:
>     - shard-dg2-9:        NOTRUN -> [SKIP][178] ([i915#5354]) +18 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-tglu-1:       NOTRUN -> [SKIP][179] +39 other tests skip
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-glk:          NOTRUN -> [SKIP][180] +130 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
>     - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#3023]) +3 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
>     - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#3458]) +15 other tests skip
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg2-9:        NOTRUN -> [SKIP][183] ([i915#8708]) +10 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#8708]) +16 other tests skip
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#5354]) +19 other tests skip
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html
>     - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#1825]) +4 other tests skip
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
>     - shard-dg2-9:        NOTRUN -> [SKIP][187] ([i915#3458]) +12 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-snb:          [PASS][188] -> [SKIP][189]
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-snb1/igt@kms_hdmi_inject@inject-audio.html
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-snb6/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_hdr@bpc-switch-dpms:
>     - shard-tglu-1:       NOTRUN -> [SKIP][190] ([i915#3555] / [i915#8228])
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@kms_hdr@bpc-switch-dpms.html
>     - shard-dg2-9:        NOTRUN -> [SKIP][191] ([i915#3555] / [i915#8228])
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_hdr@bpc-switch-dpms.html
> 
>   * igt@kms_invalid_mode@bad-htotal:
>     - shard-rkl:          [PASS][192] -> [SKIP][193] ([i915#14544] / [i915#3555] / [i915#8826]) +2 other tests skip
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-8/igt@kms_invalid_mode@bad-htotal.html
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_invalid_mode@bad-htotal.html
> 
>   * igt@kms_joiner@basic-force-ultra-joiner:
>     - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#10656]) +1 other test skip
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@kms_joiner@basic-force-ultra-joiner.html
> 
>   * igt@kms_joiner@basic-max-non-joiner:
>     - shard-dg2-9:        NOTRUN -> [SKIP][195] ([i915#13688])
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_joiner@basic-max-non-joiner.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-dg2-9:        NOTRUN -> [SKIP][196] ([i915#12339])
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#12388])
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][198] ([i915#12388])
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#6301])
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-8/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_pipe_crc_basic@read-crc:
>     - shard-rkl:          [PASS][200] -> [SKIP][201] ([i915#11190] / [i915#14544])
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-5/igt@kms_pipe_crc_basic@read-crc.html
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_pipe_crc_basic@read-crc.html
> 
>   * igt@kms_plane_alpha_blend@alpha-opaque-fb:
>     - shard-glk:          NOTRUN -> [FAIL][202] ([i915#10647] / [i915#12169])
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-glk1/igt@kms_plane_alpha_blend@alpha-opaque-fb.html
> 
>   * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [FAIL][203] ([i915#10647]) +1 other test fail
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-glk1/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:
>     - shard-rkl:          [PASS][204] -> [SKIP][205] ([i915#14544] / [i915#7294]) +1 other test skip
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-2/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html
> 
>   * igt@kms_plane_multiple@2x-tiling-4:
>     - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#13958])
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@kms_plane_multiple@2x-tiling-4.html
> 
>   * igt@kms_plane_multiple@2x-tiling-x:
>     - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#13958])
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-8/igt@kms_plane_multiple@2x-tiling-x.html
> 
>   * igt@kms_plane_multiple@tiling-4:
>     - shard-tglu-1:       NOTRUN -> [SKIP][208] ([i915#14259])
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@kms_plane_multiple@tiling-4.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-dg2-9:        NOTRUN -> [SKIP][209] ([i915#14259])
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
>     - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#12247]) +2 other tests skip
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
>     - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#3555]) +1 other test skip
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
>     - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#12247]) +3 other tests skip
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
> 
>   * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:
>     - shard-rkl:          [PASS][213] -> [SKIP][214] ([i915#14544] / [i915#8152])
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
>     - shard-rkl:          [PASS][215] -> [SKIP][216] ([i915#14544] / [i915#6953] / [i915#8152])
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:
>     - shard-rkl:          [PASS][217] -> [SKIP][218] ([i915#12247] / [i915#14544]) +4 other tests skip
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:
>     - shard-rkl:          [PASS][219] -> [SKIP][220] ([i915#12247] / [i915#14544] / [i915#8152]) +3 other tests skip
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
>     - shard-rkl:          [PASS][221] -> [SKIP][222] ([i915#12247] / [i915#14544] / [i915#3555] / [i915#6953] / [i915#8152]) +1 other test skip
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-tglu-1:       NOTRUN -> [SKIP][223] ([i915#9812])
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-tglu-1:       NOTRUN -> [SKIP][224] ([i915#9685])
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@kms_pm_dc@dc6-psr.html
>     - shard-dg2-9:        NOTRUN -> [SKIP][225] ([i915#9685])
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-tglu:         NOTRUN -> [SKIP][226] ([i915#4281])
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-8/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-dg2:          [PASS][227] -> [SKIP][228] ([i915#9519])
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-dg2-4/igt@kms_pm_rpm@dpms-lpsp.html
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-8/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_pm_rpm@fences-dpms:
>     - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#4077]) +9 other tests skip
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@kms_pm_rpm@fences-dpms.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-rkl:          [PASS][230] -> [SKIP][231] ([i915#9519]) +1 other test skip
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_pm_rpm@pc8-residency:
>     - shard-dg2:          NOTRUN -> [SKIP][232] +7 other tests skip
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@kms_pm_rpm@pc8-residency.html
> 
>   * igt@kms_prime@d3hot:
>     - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#6524] / [i915#6805])
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-5/igt@kms_prime@d3hot.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
>     - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#11520]) +6 other tests skip
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][235] ([i915#11520]) +3 other tests skip
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
>     - shard-tglu:         NOTRUN -> [SKIP][236] ([i915#11520]) +1 other test skip
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
>     - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#11520])
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
>     - shard-glk:          NOTRUN -> [SKIP][238] ([i915#11520]) +3 other tests skip
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-glk5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
>     - shard-glk10:        NOTRUN -> [SKIP][239] ([i915#11520]) +11 other tests skip
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-glk10/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
>     - shard-dg2-9:        NOTRUN -> [SKIP][240] ([i915#11520]) +5 other tests skip
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#9683])
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][242] ([i915#9683])
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-blt:
>     - shard-tglu-1:       NOTRUN -> [SKIP][243] ([i915#9732]) +10 other tests skip
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@kms_psr@fbc-psr2-cursor-blt.html
> 
>   * igt@kms_psr@fbc-psr2-suspend:
>     - shard-dg2-9:        NOTRUN -> [SKIP][244] ([i915#1072] / [i915#9732]) +16 other tests skip
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_psr@fbc-psr2-suspend.html
> 
>   * igt@kms_psr@pr-basic:
>     - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#1072] / [i915#9732]) +3 other tests skip
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-5/igt@kms_psr@pr-basic.html
> 
>   * igt@kms_psr@psr-cursor-mmap-cpu:
>     - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#9732]) +4 other tests skip
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-8/igt@kms_psr@psr-cursor-mmap-cpu.html
> 
>   * igt@kms_psr@psr2-cursor-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#1072] / [i915#9732]) +19 other tests skip
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@kms_psr@psr2-cursor-blt.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#12755])
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>     - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#12755] / [i915#5190])
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2-9:        NOTRUN -> [SKIP][250] ([i915#12755] / [i915#5190])
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-tglu-1:       NOTRUN -> [SKIP][251] ([i915#5289])
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>     - shard-dg2-9:        NOTRUN -> [SKIP][252] ([i915#5190])
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full:
>     - shard-dg2-9:        NOTRUN -> [SKIP][253] ([i915#3555]) +5 other tests skip
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_scaling_modes@scaling-mode-full.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#8623])
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>     - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#8623])
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-3:
>     - shard-dg2:          [PASS][256] -> [FAIL][257] ([i915#9196]) +1 other test fail
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-dg2-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-3.html
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_vrr@flip-basic-fastset:
>     - shard-tglu-1:       NOTRUN -> [SKIP][258] ([i915#9906])
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html
> 
>   * igt@kms_vrr@max-min:
>     - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#9906])
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@kms_vrr@max-min.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual:
>     - shard-tglu:         NOTRUN -> [SKIP][260] ([i915#9906])
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-8/igt@kms_vrr@seamless-rr-switch-virtual.html
> 
>   * igt@kms_vrr@seamless-rr-switch-vrr:
>     - shard-dg2-9:        NOTRUN -> [SKIP][261] ([i915#9906]) +1 other test skip
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_vrr@seamless-rr-switch-vrr.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#2437] / [i915#9412])
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][263] ([i915#2437] / [i915#9412])
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-tglu-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-dg2-9:        NOTRUN -> [SKIP][264] ([i915#2437] / [i915#9412])
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@perf@global-sseu-config:
>     - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#7387])
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-5/igt@perf@global-sseu-config.html
> 
>   * igt@perf@mi-rpc:
>     - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#2434])
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-5/igt@perf@mi-rpc.html
> 
>   * igt@perf_pmu@frequency@gt0:
>     - shard-dg2-9:        NOTRUN -> [FAIL][267] ([i915#12549] / [i915#6806]) +1 other test fail
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@perf_pmu@frequency@gt0.html
> 
>   * igt@perf_pmu@module-unload:
>     - shard-glk10:        NOTRUN -> [FAIL][268] ([i915#14433])
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-glk10/igt@perf_pmu@module-unload.html
> 
>   * igt@perf_pmu@rc6@other-idle-gt0:
>     - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#8516])
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@perf_pmu@rc6@other-idle-gt0.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#3291] / [i915#3708]) +2 other tests skip
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-5/igt@prime_vgem@basic-fence-read.html
> 
>   * igt@prime_vgem@coherency-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#3708] / [i915#4077])
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@prime_vgem@coherency-gtt.html
> 
>   * igt@prime_vgem@fence-flip-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#3708]) +1 other test skip
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-1/igt@prime_vgem@fence-flip-hang.html
> 
>   * igt@sriov_basic@bind-unbind-vf:
>     - shard-dg2-9:        NOTRUN -> [SKIP][273] ([i915#9917])
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-9/igt@sriov_basic@bind-unbind-vf.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on:
>     - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#9917])
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-5/igt@sriov_basic@enable-vfs-autoprobe-on.html
> 
>   * igt@sysfs_heartbeat_interval@mixed@vecs0:
>     - shard-rkl:          [PASS][275] -> [DMESG-WARN][276] ([i915#12964]) +11 other tests dmesg-warn
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-8/igt@sysfs_heartbeat_interval@mixed@vecs0.html
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@sysfs_heartbeat_interval@mixed@vecs0.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_exec_fence@parallel:
>     - shard-mtlp:         [ABORT][277] ([i915#13562]) -> [PASS][278] +1 other test pass
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-mtlp-6/igt@gem_exec_fence@parallel.html
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-mtlp-2/igt@gem_exec_fence@parallel.html
> 
>   * igt@gem_exec_fence@parallel@bcs0:
>     - shard-mtlp:         [DMESG-WARN][279] ([i915#13562]) -> [PASS][280]
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-mtlp-6/igt@gem_exec_fence@parallel@bcs0.html
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-mtlp-2/igt@gem_exec_fence@parallel@bcs0.html
> 
>   * igt@gem_exec_suspend@basic-s0:
>     - shard-dg2:          [INCOMPLETE][281] ([i915#13356]) -> [PASS][282] +1 other test pass
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-dg2-4/igt@gem_exec_suspend@basic-s0.html
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-8/igt@gem_exec_suspend@basic-s0.html
>     - shard-rkl:          [INCOMPLETE][283] ([i915#13356]) -> [PASS][284] +1 other test pass
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-3/igt@gem_exec_suspend@basic-s0.html
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-5/igt@gem_exec_suspend@basic-s0.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg2:          [TIMEOUT][285] ([i915#5493]) -> [PASS][286] +1 other test pass
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-dg2-3/igt@gem_lmem_swapping@smem-oom@lmem0.html
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-4/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@gem_mmap_wc@set-cache-level:
>     - shard-rkl:          [SKIP][287] ([i915#14544] / [i915#1850]) -> [PASS][288]
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@gem_mmap_wc@set-cache-level.html
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-3/igt@gem_mmap_wc@set-cache-level.html
> 
>   * igt@gem_pxp@reject-modify-context-protection-off-1:
>     - shard-rkl:          [TIMEOUT][289] ([i915#12917] / [i915#12964]) -> [PASS][290] +1 other test pass
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-2/igt@gem_pxp@reject-modify-context-protection-off-1.html
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-off-1.html
> 
>   * igt@i915_hangman@gt-error-state-capture@rcs0:
>     - shard-rkl:          [DMESG-WARN][291] ([i915#12964]) -> [PASS][292] +21 other tests pass
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-2/igt@i915_hangman@gt-error-state-capture@rcs0.html
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@i915_hangman@gt-error-state-capture@rcs0.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-rkl:          [INCOMPLETE][293] ([i915#4817]) -> [PASS][294]
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-7/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-mtlp:         [FAIL][295] ([i915#5138]) -> [PASS][296]
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_busy@basic:
>     - shard-rkl:          [SKIP][297] ([i915#11190] / [i915#14544]) -> [PASS][298] +1 other test pass
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_busy@basic.html
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-4/igt@kms_busy@basic.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-128x128:
>     - shard-rkl:          [SKIP][299] ([i915#14544]) -> [PASS][300] +38 other tests pass
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-128x128.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
>     - shard-rkl:          [FAIL][301] ([i915#13566]) -> [PASS][302] +1 other test pass
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-4/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_feature_discovery@display-1x:
>     - shard-rkl:          [SKIP][303] ([i915#14544] / [i915#9738]) -> [PASS][304]
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_feature_discovery@display-1x.html
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-2/igt@kms_feature_discovery@display-1x.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-dg1:          [DMESG-WARN][305] ([i915#4423]) -> [PASS][306] +1 other test pass
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-dg1-14/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg1-16/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@plain-flip-interruptible:
>     - shard-rkl:          [SKIP][307] ([i915#14544] / [i915#3637]) -> [PASS][308] +2 other tests pass
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_flip@plain-flip-interruptible.html
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-3/igt@kms_flip@plain-flip-interruptible.html
> 
>   * igt@kms_flip@plain-flip-ts-check:
>     - shard-snb:          [FAIL][309] ([i915#10826]) -> [PASS][310] +1 other test pass
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-snb6/igt@kms_flip@plain-flip-ts-check.html
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-snb5/igt@kms_flip@plain-flip-ts-check.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-rkl:          [SKIP][311] ([i915#14544] / [i915#3555]) -> [PASS][312] +1 other test pass
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
>     - shard-rkl:          [SKIP][313] ([i915#14544] / [i915#1849] / [i915#5354]) -> [PASS][314] +6 other tests pass
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
> 
>   * igt@kms_invalid_mode@uint-max-clock:
>     - shard-rkl:          [SKIP][315] ([i915#14544] / [i915#3555] / [i915#8826]) -> [PASS][316] +1 other test pass
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_invalid_mode@uint-max-clock.html
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-4/igt@kms_invalid_mode@uint-max-clock.html
> 
>   * igt@kms_plane_alpha_blend@constant-alpha-max:
>     - shard-rkl:          [SKIP][317] ([i915#14544] / [i915#7294]) -> [PASS][318] +1 other test pass
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_plane_alpha_blend@constant-alpha-max.html
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-3/igt@kms_plane_alpha_blend@constant-alpha-max.html
> 
>   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:
>     - shard-rkl:          [SKIP][319] ([i915#14544] / [i915#8152]) -> [PASS][320] +1 other test pass
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-3/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html
> 
>   * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-b:
>     - shard-rkl:          [SKIP][321] ([i915#12247] / [i915#14544] / [i915#8152]) -> [PASS][322] +4 other tests pass
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-b.html
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-b.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:
>     - shard-rkl:          [SKIP][323] ([i915#12247] / [i915#14544]) -> [PASS][324] +4 other tests pass
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
>     - shard-rkl:          [SKIP][325] ([i915#14544] / [i915#6953] / [i915#8152]) -> [PASS][326]
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
>     - shard-rkl:          [SKIP][327] ([i915#12247] / [i915#14544] / [i915#6953] / [i915#8152]) -> [PASS][328] +1 other test pass
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-dg2:          [SKIP][329] ([i915#9519]) -> [PASS][330]
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-rkl:          [SKIP][331] ([i915#9519]) -> [PASS][332]
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@perf_pmu@busy-double-start@vecs1:
>     - shard-dg2:          [FAIL][333] ([i915#4349]) -> [PASS][334] +4 other tests pass
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-dg2-8/igt@perf_pmu@busy-double-start@vecs1.html
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html
> 
>   
> #### Warnings ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-rkl:          [SKIP][335] ([i915#14544] / [i915#8411]) -> [SKIP][336] ([i915#8411])
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@api_intel_bb@blit-reloc-purge-cache.html
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-2/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
>   * igt@gem_ccs@large-ctrl-surf-copy:
>     - shard-rkl:          [SKIP][337] ([i915#13008]) -> [SKIP][338] ([i915#13008] / [i915#14544])
>    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-2/igt@gem_ccs@large-ctrl-surf-copy.html
>    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@gem_ccs@large-ctrl-surf-copy.html
> 
>   * igt@gem_ccs@suspend-resume:
>     - shard-rkl:          [SKIP][339] ([i915#14544] / [i915#9323]) -> [SKIP][340] ([i915#9323])
>    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@gem_ccs@suspend-resume.html
>    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-2/igt@gem_ccs@suspend-resume.html
> 
>   * igt@gem_close_race@multigpu-basic-threads:
>     - shard-rkl:          [SKIP][341] ([i915#14544] / [i915#7697]) -> [SKIP][342] ([i915#7697])
>    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html
>    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-3/igt@gem_close_race@multigpu-basic-threads.html
> 
>   * igt@gem_ctx_sseu@engines:
>     - shard-rkl:          [SKIP][343] ([i915#14544] / [i915#280]) -> [SKIP][344] ([i915#280])
>    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@gem_ctx_sseu@engines.html
>    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-4/igt@gem_ctx_sseu@engines.html
> 
>   * igt@gem_exec_balancer@parallel-ordering:
>     - shard-rkl:          [SKIP][345] ([i915#14544] / [i915#4525]) -> [SKIP][346] ([i915#4525])
>    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html
>    [346]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-4/igt@gem_exec_balancer@parallel-ordering.html
> 
>   * igt@gem_exec_capture@capture-recoverable:
>     - shard-rkl:          [SKIP][347] ([i915#14544] / [i915#6344]) -> [SKIP][348] ([i915#6344])
>    [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html
>    [348]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-3/igt@gem_exec_capture@capture-recoverable.html
> 
>   * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
>     - shard-rkl:          [SKIP][349] ([i915#14544] / [i915#3281]) -> [SKIP][350] ([i915#3281]) +3 other tests skip
>    [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
>    [350]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-4/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-gtt-cpu:
>     - shard-rkl:          [SKIP][351] ([i915#3281]) -> [SKIP][352] ([i915#14544] / [i915#3281]) +5 other tests skip
>    [351]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-cpu.html
>    [352]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu.html
> 
>   * igt@gem_exec_schedule@semaphore-power:
>     - shard-rkl:          [SKIP][353] ([i915#7276]) -> [SKIP][354] ([i915#14544] / [i915#7276])
>    [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-2/igt@gem_exec_schedule@semaphore-power.html
>    [354]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify-ccs:
>     - shard-rkl:          [SKIP][355] ([i915#14544] / [i915#4613]) -> [SKIP][356] ([i915#4613]) +1 other test skip
>    [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
>    [356]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-3/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
> 
>   * igt@gem_lmem_swapping@verify-ccs:
>     - shard-rkl:          [SKIP][357] ([i915#4613]) -> [SKIP][358] ([i915#14544] / [i915#4613]) +2 other tests skip
>    [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-5/igt@gem_lmem_swapping@verify-ccs.html
>    [358]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
>     - shard-rkl:          [SKIP][359] ([i915#14544] / [i915#3282]) -> [SKIP][360] ([i915#3282]) +6 other tests skip
>    [359]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
>    [360]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
> 
>   * igt@gem_pxp@hw-rejects-pxp-buffer:
>     - shard-rkl:          [SKIP][361] ([i915#13717]) -> [TIMEOUT][362] ([i915#12917] / [i915#12964]) +1 other test timeout
>    [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.html
>    [362]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-buffer.html
> 
>   * igt@gem_pxp@regular-baseline-src-copy-readible:
>     - shard-rkl:          [TIMEOUT][363] ([i915#12964]) -> [SKIP][364] ([i915#14544] / [i915#4270])
>    [363]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-5/igt@gem_pxp@regular-baseline-src-copy-readible.html
>    [364]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@gem_pxp@regular-baseline-src-copy-readible.html
> 
>   * igt@gem_pxp@verify-pxp-stale-ctx-execution:
>     - shard-rkl:          [TIMEOUT][365] ([i915#12917] / [i915#12964]) -> [SKIP][366] ([i915#14544] / [i915#4270]) +1 other test skip
>    [365]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-2/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
>    [366]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
> 
>   * igt@gem_set_tiling_vs_pwrite:
>     - shard-rkl:          [SKIP][367] ([i915#3282]) -> [SKIP][368] ([i915#14544] / [i915#3282]) +3 other tests skip
>    [367]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html
>    [368]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@gem_set_tiling_vs_pwrite.html
> 
>   * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
>     - shard-rkl:          [SKIP][369] ([i915#3297]) -> [SKIP][370] ([i915#14544] / [i915#3297])
>    [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-8/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
>    [370]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
> 
>   * igt@gem_userptr_blits@readonly-unsync:
>     - shard-rkl:          [SKIP][371] ([i915#14544] / [i915#3297]) -> [SKIP][372] ([i915#3297]) +1 other test skip
>    [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@gem_userptr_blits@readonly-unsync.html
>    [372]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-4/igt@gem_userptr_blits@readonly-unsync.html
> 
>   * igt@gen9_exec_parse@batch-without-end:
>     - shard-rkl:          [SKIP][373] ([i915#2527]) -> [SKIP][374] ([i915#14544] / [i915#2527]) +2 other tests skip
>    [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-8/igt@gen9_exec_parse@batch-without-end.html
>    [374]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@gen9_exec_parse@batch-without-end.html
> 
>   * igt@gen9_exec_parse@unaligned-jump:
>     - shard-rkl:          [SKIP][375] ([i915#14544] / [i915#2527]) -> [SKIP][376] ([i915#2527]) +1 other test skip
>    [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@gen9_exec_parse@unaligned-jump.html
>    [376]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-3/igt@gen9_exec_parse@unaligned-jump.html
> 
>   * igt@i915_pm_freq_api@freq-suspend:
>     - shard-rkl:          [SKIP][377] ([i915#8399]) -> [SKIP][378] ([i915#14544] / [i915#8399])
>    [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-5/igt@i915_pm_freq_api@freq-suspend.html
>    [378]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html
> 
>   * igt@i915_query@hwconfig_table:
>     - shard-rkl:          [SKIP][379] ([i915#14544] / [i915#6245]) -> [SKIP][380] ([i915#6245])
>    [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@i915_query@hwconfig_table.html
>    [380]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-3/igt@i915_query@hwconfig_table.html
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-rkl:          [SKIP][381] ([i915#7707]) -> [SKIP][382] ([i915#14544] / [i915#7707])
>    [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-8/igt@intel_hwmon@hwmon-read.html
>    [382]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-rkl:          [SKIP][383] ([i915#14544] / [i915#7707]) -> [SKIP][384] ([i915#7707])
>    [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@intel_hwmon@hwmon-write.html
>    [384]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-2/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-rkl:          [SKIP][385] ([i915#5286]) -> [SKIP][386] ([i915#14544]) +4 other tests skip
>    [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [386]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-rkl:          [SKIP][387] ([i915#14544]) -> [SKIP][388] ([i915#5286]) +3 other tests skip
>    [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [388]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-rkl:          [SKIP][389] ([i915#14544]) -> [SKIP][390] ([i915#3638]) +1 other test skip
>    [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_big_fb@linear-16bpp-rotate-90.html
>    [390]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-2/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-rkl:          [SKIP][391] ([i915#3638]) -> [SKIP][392] ([i915#14544]) +4 other tests skip
>    [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
>    [392]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>     - shard-rkl:          [SKIP][393] ([i915#14544]) -> [SKIP][394] +10 other tests skip
>    [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
>    [394]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-3:
>     - shard-dg1:          [SKIP][395] ([i915#4423] / [i915#6095]) -> [SKIP][396] ([i915#6095]) +1 other test skip
>    [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-dg1-12/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-3.html
>    [396]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg1-12/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:
>     - shard-rkl:          [SKIP][397] ([i915#14544]) -> [SKIP][398] ([i915#14098] / [i915#6095]) +10 other tests skip
>    [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html
>    [398]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-2/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:
>     - shard-rkl:          [SKIP][399] ([i915#14098] / [i915#6095]) -> [SKIP][400] ([i915#6095]) +3 other tests skip
>    [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html
>    [400]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>     - shard-rkl:          [SKIP][401] ([i915#12313]) -> [SKIP][402] ([i915#14544]) +1 other test skip
>    [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
>    [402]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:
>     - shard-rkl:          [SKIP][403] ([i915#6095]) -> [SKIP][404] ([i915#14098] / [i915#6095]) +3 other tests skip
>    [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html
>    [404]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
>     - shard-rkl:          [SKIP][405] ([i915#14098] / [i915#6095]) -> [SKIP][406] ([i915#14544]) +9 other tests skip
>    [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
>    [406]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-rkl:          [SKIP][407] ([i915#3742]) -> [SKIP][408] ([i915#14544] / [i915#3742])
>    [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-2/igt@kms_cdclk@mode-transition-all-outputs.html
>    [408]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-rkl:          [SKIP][409] ([i915#14544] / [i915#3742]) -> [SKIP][410] ([i915#3742])
>    [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_cdclk@plane-scaling.html
>    [410]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-3/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-read:
>     - shard-rkl:          [SKIP][411] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][412] ([i915#11151] / [i915#7828]) +3 other tests skip
>    [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-read.html
>    [412]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-4/igt@kms_chamelium_edid@hdmi-edid-read.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm:
>     - shard-rkl:          [SKIP][413] ([i915#11151] / [i915#7828]) -> [SKIP][414] ([i915#11151] / [i915#14544] / [i915#7828]) +5 other tests skip
>    [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-8/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
>    [414]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
> 
>   * igt@kms_color@ctm-signed:
>     - shard-rkl:          [SKIP][415] ([i915#12655] / [i915#14544]) -> [DMESG-WARN][416] ([i915#12964])
>    [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_color@ctm-signed.html
>    [416]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-2/igt@kms_color@ctm-signed.html
> 
>   * igt@kms_color@deep-color:
>     - shard-rkl:          [SKIP][417] ([i915#12655] / [i915#3555]) -> [SKIP][418] ([i915#12655] / [i915#14544] / [i915#3555])
>    [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-5/igt@kms_color@deep-color.html
>    [418]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_color@deep-color.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-rkl:          [SKIP][419] ([i915#9424]) -> [SKIP][420] ([i915#14544])
>    [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-8/igt@kms_content_protection@mei-interface.html
>    [420]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_content_protection@mei-interface.html
>     - shard-dg1:          [SKIP][421] ([i915#9433]) -> [SKIP][422] ([i915#9424])
>    [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-dg1-13/igt@kms_content_protection@mei-interface.html
>    [422]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg1-18/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-rkl:          [SKIP][423] ([i915#14544]) -> [SKIP][424] ([i915#7118])
>    [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_content_protection@srm.html
>    [424]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-4/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-128x42:
>     - shard-rkl:          [FAIL][425] ([i915#13566]) -> [SKIP][426] ([i915#14544])
>    [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html
>    [426]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-rkl:          [SKIP][427] ([i915#13049]) -> [SKIP][428] ([i915#14544]) +1 other test skip
>    [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x170.html
>    [428]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-rkl:          [SKIP][429] ([i915#14544]) -> [SKIP][430] ([i915#13049]) +2 other tests skip
>    [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x512.html
>    [430]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_edge_walk@64x64-top-bottom:
>     - shard-rkl:          [SKIP][431] ([i915#14544]) -> [DMESG-WARN][432] ([i915#12964]) +2 other tests dmesg-warn
>    [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_cursor_edge_walk@64x64-top-bottom.html
>    [432]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-2/igt@kms_cursor_edge_walk@64x64-top-bottom.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-rkl:          [SKIP][433] ([i915#14544]) -> [SKIP][434] ([i915#4103])
>    [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
>    [434]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>     - shard-rkl:          [SKIP][435] -> [SKIP][436] ([i915#14544]) +16 other tests skip
>    [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
>    [436]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-rkl:          [DMESG-WARN][437] ([i915#12964]) -> [SKIP][438] ([i915#14544]) +1 other test skip
>    [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [438]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-rkl:          [SKIP][439] ([i915#4103]) -> [SKIP][440] ([i915#14544])
>    [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
>    [440]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>     - shard-rkl:          [SKIP][441] ([i915#14544]) -> [SKIP][442] ([i915#3555] / [i915#3804])
>    [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>    [442]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-rkl:          [SKIP][443] ([i915#1257] / [i915#14544]) -> [SKIP][444] ([i915#1257])
>    [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_dp_aux_dev.html
>    [444]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-4/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_dp_link_training@non-uhbr-mst:
>     - shard-rkl:          [SKIP][445] ([i915#13749]) -> [SKIP][446] ([i915#14544])
>    [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-8/igt@kms_dp_link_training@non-uhbr-mst.html
>    [446]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>   * igt@kms_dp_link_training@uhbr-sst:
>     - shard-rkl:          [SKIP][447] ([i915#14544]) -> [SKIP][448] ([i915#13748])
>    [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_dp_link_training@uhbr-sst.html
>    [448]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-3/igt@kms_dp_link_training@uhbr-sst.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-rkl:          [SKIP][449] ([i915#3555] / [i915#3840]) -> [SKIP][450] ([i915#14544]) +1 other test skip
>    [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-5/igt@kms_dsc@dsc-with-bpc-formats.html
>    [450]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-rkl:          [SKIP][451] ([i915#658]) -> [SKIP][452] ([i915#14544] / [i915#658])
>    [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-2/igt@kms_feature_discovery@psr2.html
>    [452]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@2x-blocking-wf_vblank:
>     - shard-rkl:          [SKIP][453] ([i915#14544] / [i915#9934]) -> [SKIP][454] ([i915#9934]) +11 other tests skip
>    [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_flip@2x-blocking-wf_vblank.html
>    [454]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-4/igt@kms_flip@2x-blocking-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-vs-hang:
>     - shard-rkl:          [SKIP][455] ([i915#9934]) -> [SKIP][456] ([i915#14544] / [i915#9934]) +5 other tests skip
>    [455]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-8/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
>    [456]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
> 
>   * igt@kms_flip@dpms-off-confusion:
>     - shard-rkl:          [SKIP][457] ([i915#14544] / [i915#3637]) -> [DMESG-WARN][458] ([i915#12964])
>    [457]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_flip@dpms-off-confusion.html
>    [458]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-3/igt@kms_flip@dpms-off-confusion.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
>     - shard-rkl:          [SKIP][459] ([i915#2672] / [i915#3555]) -> [SKIP][460] ([i915#14544] / [i915#3555])
>    [459]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
>    [460]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
>     - shard-rkl:          [SKIP][461] ([i915#14544] / [i915#3555]) -> [SKIP][462] ([i915#2672] / [i915#3555]) +2 other tests skip
>    [461]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
>    [462]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-rkl:          [SKIP][463] ([i915#14544] / [i915#3555]) -> [DMESG-WARN][464] ([i915#12964])
>    [463]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>    [464]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-rkl:          [DMESG-WARN][465] ([i915#12964]) -> [SKIP][466] ([i915#14544] / [i915#1849] / [i915#5354])
>    [465]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
>    [466]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt:
>     - shard-rkl:          [SKIP][467] -> [SKIP][468] ([i915#14544] / [i915#1849] / [i915#5354])
>    [467]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt.html
>    [468]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
>     - shard-dg1:          [SKIP][469] -> [SKIP][470] ([i915#4423])
>    [469]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
>    [470]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-4:
>     - shard-rkl:          [SKIP][471] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][472] ([i915#5439])
>    [471]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
>    [472]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite:
>     - shard-dg1:          [SKIP][473] ([i915#3458] / [i915#4423]) -> [SKIP][474] ([i915#3458])
>    [473]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite.html
>    [474]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
>     - shard-rkl:          [SKIP][475] ([i915#1825]) -> [SKIP][476] ([i915#14544] / [i915#1849] / [i915#5354]) +24 other tests skip
>    [475]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
>    [476]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
>     - shard-rkl:          [SKIP][477] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][478]
>    [477]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html
>    [478]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-dg2:          [SKIP][479] ([i915#10433] / [i915#3458]) -> [SKIP][480] ([i915#3458])
>    [479]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
>    [480]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>     - shard-rkl:          [SKIP][481] ([i915#9766]) -> [SKIP][482] ([i915#14544] / [i915#1849] / [i915#5354])
>    [481]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
>    [482]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
>     - shard-dg2:          [SKIP][483] ([i915#3458]) -> [SKIP][484] ([i915#10433] / [i915#3458]) +2 other tests skip
>    [483]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
>    [484]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
>     - shard-rkl:          [SKIP][485] ([i915#3023]) -> [SKIP][486] ([i915#14544] / [i915#1849] / [i915#5354]) +14 other tests skip
>    [485]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
>    [486]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
>     - shard-rkl:          [SKIP][487] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][488] ([i915#3023]) +17 other tests skip
>    [487]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
>    [488]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
>     - shard-rkl:          [SKIP][489] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][490] ([i915#1825]) +23 other tests skip
>    [489]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
>    [490]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_hdr@bpc-switch:
>     - shard-rkl:          [SKIP][491] ([i915#3555] / [i915#8228]) -> [SKIP][492] ([i915#14544])
>    [491]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-2/igt@kms_hdr@bpc-switch.html
>    [492]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_hdr@bpc-switch.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-rkl:          [SKIP][493] ([i915#14544]) -> [SKIP][494] ([i915#3555] / [i915#8228])
>    [493]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_hdr@invalid-hdr.html
>    [494]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-2/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-rkl:          [SKIP][495] ([i915#4816]) -> [SKIP][496] ([i915#4070] / [i915#4816])
>    [495]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [496]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-rkl:          [SKIP][497] ([i915#14544]) -> [SKIP][498] ([i915#6301])
>    [497]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html
>    [498]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-4/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_plane_lowres@tiling-yf:
>     - shard-rkl:          [SKIP][499] ([i915#3555]) -> [SKIP][500] ([i915#14544]) +1 other test skip
>    [499]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-5/igt@kms_plane_lowres@tiling-yf.html
>    [500]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html
> 
>   * igt@kms_plane_multiple@2x-tiling-x:
>     - shard-rkl:          [SKIP][501] ([i915#14544]) -> [SKIP][502] ([i915#13958])
>    [501]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-x.html
>    [502]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-4/igt@kms_plane_multiple@2x-tiling-x.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-rkl:          [SKIP][503] ([i915#14544]) -> [SKIP][504] ([i915#14259])
>    [503]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_plane_multiple@tiling-yf.html
>    [504]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-2/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - shard-rkl:          [SKIP][505] ([i915#14544] / [i915#8152]) -> [SKIP][506]
>    [505]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>    [506]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-b:
>     - shard-rkl:          [DMESG-WARN][507] ([i915#12964]) -> [SKIP][508] ([i915#12247] / [i915#14544] / [i915#8152]) +1 other test skip
>    [507]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-b.html
>    [508]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-b.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
>     - shard-rkl:          [SKIP][509] ([i915#14544] / [i915#3555] / [i915#8152]) -> [SKIP][510] ([i915#3555])
>    [509]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
>    [510]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a:
>     - shard-rkl:          [SKIP][511] ([i915#12247] / [i915#14544]) -> [SKIP][512] ([i915#12247])
>    [511]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a.html
>    [512]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
>     - shard-rkl:          [SKIP][513] ([i915#12247] / [i915#14544] / [i915#8152]) -> [SKIP][514] ([i915#12247])
>    [513]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
>    [514]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-rkl:          [SKIP][515] ([i915#14544] / [i915#4281]) -> [SKIP][516] ([i915#4281])
>    [515]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html
>    [516]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-4/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-rkl:          [SKIP][517] ([i915#3828]) -> [SKIP][518] ([i915#9340])
>    [517]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-2/igt@kms_pm_lpsp@kms-lpsp.html
>    [518]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html
>     - shard-dg1:          [SKIP][519] ([i915#9340]) -> [SKIP][520] ([i915#4423] / [i915#9340])
>    [519]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-dg1-12/igt@kms_pm_lpsp@kms-lpsp.html
>    [520]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg1-19/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_rpm@dpms-non-lpsp:
>     - shard-rkl:          [SKIP][521] ([i915#14544] / [i915#9519]) -> [SKIP][522] ([i915#9519])
>    [521]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_pm_rpm@dpms-non-lpsp.html
>    [522]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-2/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-rkl:          [SKIP][523] ([i915#9519]) -> [SKIP][524] ([i915#14544] / [i915#9519])
>    [523]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp.html
>    [524]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   * igt@kms_prime@basic-crc-hybrid:
>     - shard-rkl:          [SKIP][525] ([i915#14544] / [i915#6524]) -> [SKIP][526] ([i915#6524])
>    [525]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_prime@basic-crc-hybrid.html
>    [526]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-3/igt@kms_prime@basic-crc-hybrid.html
> 
>   * igt@kms_prime@basic-modeset-hybrid:
>     - shard-rkl:          [SKIP][527] ([i915#6524]) -> [SKIP][528] ([i915#14544] / [i915#6524])
>    [527]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-5/igt@kms_prime@basic-modeset-hybrid.html
>    [528]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
>     - shard-rkl:          [SKIP][529] ([i915#11520] / [i915#14544]) -> [SKIP][530] ([i915#11520]) +6 other tests skip
>    [529]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
>    [530]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-2/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
>     - shard-rkl:          [SKIP][531] ([i915#11520]) -> [SKIP][532] ([i915#11520] / [i915#14544]) +5 other tests skip
>    [531]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-8/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
>    [532]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
>     - shard-dg1:          [SKIP][533] ([i915#11520] / [i915#4423]) -> [SKIP][534] ([i915#11520]) +1 other test skip
>    [533]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-dg1-13/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
>    [534]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-dg1-18/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr@fbc-pr-sprite-plane-onoff:
>     - shard-rkl:          [SKIP][535] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][536] ([i915#1072] / [i915#9732]) +16 other tests skip
>    [535]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
>    [536]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-3/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
> 
>   * igt@kms_psr@fbc-psr-cursor-plane-move:
>     - shard-rkl:          [SKIP][537] ([i915#1072] / [i915#9732]) -> [SKIP][538] ([i915#1072] / [i915#14544] / [i915#9732]) +14 other tests skip
>    [537]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-8/igt@kms_psr@fbc-psr-cursor-plane-move.html
>    [538]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@kms_psr@fbc-psr-cursor-plane-move.html
> 
>   * igt@kms_scaling_modes@scaling-mode-center:
>     - shard-rkl:          [SKIP][539] ([i915#14544]) -> [SKIP][540] ([i915#3555])
>    [539]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-center.html
>    [540]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-3/igt@kms_scaling_modes@scaling-mode-center.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-rkl:          [SKIP][541] ([i915#14544] / [i915#3555]) -> [SKIP][542] ([i915#3555]) +2 other tests skip
>    [541]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_setmode@basic-clone-single-crtc.html
>    [542]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-2/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-rkl:          [SKIP][543] ([i915#14544]) -> [SKIP][544] ([i915#11920])
>    [543]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_vrr@lobf.html
>    [544]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-2/igt@kms_vrr@lobf.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual:
>     - shard-rkl:          [SKIP][545] ([i915#14544]) -> [SKIP][546] ([i915#9906])
>    [545]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-virtual.html
>    [546]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-4/igt@kms_vrr@seamless-rr-switch-virtual.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-rkl:          [SKIP][547] ([i915#14544] / [i915#2437] / [i915#9412]) -> [SKIP][548] ([i915#2437] / [i915#9412])
>    [547]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
>    [548]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@perf@gen8-unprivileged-single-ctx-counters:
>     - shard-rkl:          [SKIP][549] ([i915#2436]) -> [SKIP][550] ([i915#14544] / [i915#2436])
>    [549]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html
>    [550]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html
> 
>   * igt@perf_pmu@rc6-all-gts:
>     - shard-rkl:          [SKIP][551] ([i915#8516]) -> [SKIP][552] ([i915#14544] / [i915#8516])
>    [551]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-5/igt@perf_pmu@rc6-all-gts.html
>    [552]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-rkl:          [SKIP][553] ([i915#9917]) -> [SKIP][554] ([i915#14544] / [i915#9917])
>    [553]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17290/shard-rkl-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>    [554]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
>   [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
>   [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
>   [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
>   [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#10826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826
>   [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
>   [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
>   [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
>   [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
>   [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
>   [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
>   [i915#11965]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965
>   [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
>   [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
>   [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
>   [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
>   [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
>   [i915#12549]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12549
>   [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
>   [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
>   [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
>   [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
>   [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
>   [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
>   [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
>   [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
>   [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
>   [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
>   [i915#13562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13562
>   [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
>   [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
>   [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
>   [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
>   [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
>   [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
>   [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
>   [i915#13809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809
>   [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
>   [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
>   [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
>   [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
>   [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
>   [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
>   [i915#14433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14433
>   [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
>   [i915#14756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14756
>   [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
>   [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
>   [i915#1850]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1850
>   [i915#2065]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065
>   [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
>   [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
>   [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
>   [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
>   [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
>   [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
>   [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
>   [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
>   [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
>   [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
>   [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
>   [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
>   [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
>   [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>   [i915#4036]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036
>   [i915#4070]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>   [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
>   [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
>   [i915#4281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281
>   [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
>   [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
>   [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
>   [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
>   [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
>   [i915#4816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816
>   [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
>   [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
>   [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
>   [i915#4854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854
>   [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
>   [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
>   [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
>   [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
>   [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
>   [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>   [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
>   [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>   [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
>   [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
>   [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
>   [i915#5882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882
>   [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
>   [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
>   [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
>   [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
>   [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
>   [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
>   [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
>   [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
>   [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
>   [i915#6806]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6806
>   [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
>   [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
>   [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
>   [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
>   [i915#7276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276
>   [i915#7294]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294
>   [i915#7387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387
>   [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
>   [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
>   [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
>   [i915#8152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152
>   [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
>   [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
>   [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
>   [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
>   [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
>   [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
>   [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
>   [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
>   [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
>   [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
>   [i915#8826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826
>   [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
>   [i915#9196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196
>   [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
>   [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
>   [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
>   [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
>   [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
>   [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
>   [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
>   [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
>   [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>   [i915#9738]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9738
>   [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
>   [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
>   [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
>   [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
>   [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
>   [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
> 
> 
> Build changes
> -------------
> 
>   * Linux: CI_DRM_17290 -> Patchwork_154736v7
> 
>   CI-20190529: 20190529
>   CI_DRM_17290: 3f8b061ccb9c28db804126df320f5941e68ade71 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGT_8562: 8562
>   Patchwork_154736v7: 3f8b061ccb9c28db804126df320f5941e68ade71 @ git://anongit.freedesktop.org/gfx-ci/linux
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_154736v7/index.html
