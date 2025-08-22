Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904B7B32089
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 18:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1691110EB6C;
	Fri, 22 Aug 2025 16:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TeGvwl4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A3C10EB6C;
 Fri, 22 Aug 2025 16:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755880208; x=1787416208;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ao+8ofvfP5sKq4lM6D5P2+jgoGhQb6DZFLrMVS/mdJ8=;
 b=TeGvwl4JyWtv57E0zPT+EBOTxKmBmgJh8CB65D91DrnOmwBEB5SjYyXS
 WpEgtFzTKfqAIHslSA7+Q53Qn/rsNhJ3QkE3liepsP+TsjVkAgG8pvRwi
 gzlsKpxv+VdmnUp3W8g4ABsTk02Sw3oP2LhbQrjR5yB4hsZOvFIfOyIHW
 8JYTWxJ9k8Kx2oAMedoG6pdAjyK64H9YCyW/5gQodB/wgV4OYAfXJ3ITS
 HtDWyuKbLOFZWGRN0Nu+EwZfyqMUyKFuwtrRi3OpsA+5AUUZtTB1vedvb
 P+lMRhluEv3uT4RjdrQ0j3iB8QjEFuTVsZrK0cBcNpNN32MEXhPPNeKvC w==;
X-CSE-ConnectionGUID: tmjZq5FvRnGLUvNZMCbDgA==
X-CSE-MsgGUID: hvrYXp/wTT+2B/lTd9/JEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58289428"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58289428"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 09:30:08 -0700
X-CSE-ConnectionGUID: HSJtF2yJSLSx8DnPF6VKmA==
X-CSE-MsgGUID: eNFi9YmZQ82q8LMLHLTYOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="169564911"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 09:30:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 09:30:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 09:30:07 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.70)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 09:30:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OCqKx4RW2RdGMjRS0RFf1QMX9ikY53ZLC51iTaldeKqn7817tboTwYLLLO6DP03Do+CasKcZF4bW7SmM/R1A2MrRFxT1PnE45NRnyKrBzbXaCTik870zayBlCVSp8WM5NWdZBeAEc66PMHnOPyUbTH5E8nLYragl1OdfHoGNCGxDG8keS5LY01MroB1mNK/ENtKk4KBogFw9hVGaAluAuZT2TnD81GmqWW8QyRseViUJJMgMSpmIQ1BITapOk2ftVusA2gmo5eXMUNRgaqkeKISCdcbFppnIuElDW7CpB1c88zbDCHVjCFLQmcWa72hmQ67+cv8bFUSJfcCmaLSetw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=deIGvHBuvpb2PFTHTwUlkXXUt9pGwHf4KH5lt8minCE=;
 b=NtHmUhUczynKammvuchgbKuaaFcit5i15moEfzKb/SSHfT8YRsfxLFNTYsctDL+UorcyWym9WcayDUHrTo4BDoIvCfb4GPjxKooWziQvR50Mu+uVgE89l+sHqEHED/gDFifXMqydYG2jDvGfBxuJv7HmdEUaH5VIfXfplpeCliCU8twShBoWeaomBtgo6k3uvCjvkIN/WLlDBkV9+j49KBQrchFkitii9jzYCa8CJjefvyKHWC8MAAOOUAGmddvqmURfW3zMFFqNY/IVS+gALb3Fq7nGLeVK9y8yKH9+ry1nGAJDLmqfzNDPgv/K3D5CPHMDKqg2LrRtOKvEugzNtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA3PR11MB7416.namprd11.prod.outlook.com (2603:10b6:806:316::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.23; Fri, 22 Aug
 2025 16:30:05 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9052.013; Fri, 22 Aug 2025
 16:30:05 +0000
Date: Fri, 22 Aug 2025 12:30:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Raag
 Jadav" <raag.jadav@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Skip creation of pcode sysfs files when pcode is
 disabled
Message-ID: <aKibCnAxTuYcKtWx@intel.com>
References: <20250819175529.3722716-1-andi.shyti@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250819175529.3722716-1-andi.shyti@kernel.org>
X-ClientProxiedBy: BYAPR06CA0059.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::36) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA3PR11MB7416:EE_
X-MS-Office365-Filtering-Correlation-Id: c572a6d8-ab6f-42e3-641a-08dde1992681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RkhweeeQXp8cAzUVcu6VRvGO7AyPE68iIZT7BSjTvU3gKqcQZo0bpxGvrkd4?=
 =?us-ascii?Q?/1Rd4+ef0Zobmw/ELgu7IpOOAU0ffXzIi79lgDXjUwiVZFOgO7L1o1V6XJLa?=
 =?us-ascii?Q?uMmTCqKC5TV9frFeV/u6oaXToo5l5cXiCG7d4I0hSYlug1P1iV6n55AqsgTD?=
 =?us-ascii?Q?qw4+CINW58Uc2/IGLbXf8XEUhJXyW5iJ66QCXt/z/4yZ8yrD3ueJBY8R4rne?=
 =?us-ascii?Q?c0L9SukaZ23ruu3EYwsLA4hhuh2L5IIgLJd6hLQfebisR44c4ahZK/b8a8O/?=
 =?us-ascii?Q?2UqiKNjPqLbrvDS92JIc6fXgiw/yusMxvxCNGR0aHq50VPyThi68FR1tvFbk?=
 =?us-ascii?Q?xBl4myK863kFGzK/dp2ka9fCOMNt4bhhpxaTZnaKmCARMRW4Mi8ADrihc5eE?=
 =?us-ascii?Q?/5bjcD5ojj7ArCoBtEj5bCHUcfknrtgX7gYItiCNawO2F1q57XvrIk7OpdQy?=
 =?us-ascii?Q?cSgmKU81Px05Fr2O8oBNTxfSGg/2TXk4Ag74FwgNNSK2aZHnyGbuoPYjsuVv?=
 =?us-ascii?Q?RWlz+rcfABq5p6JrxUdk0NpGIgYEDll3BMDfrtABzo0CEVJdyH4qdATPwt/G?=
 =?us-ascii?Q?T5ghNk2utPScUlKOv9r7Y0HqBy6XtqvNjfaO8DUvPzBIFTqhlliaz+CLEUQT?=
 =?us-ascii?Q?xfFRw5bIJa5pb316Snb35AdNoYVH/imrigDG+bef7Bq5G6B85zfAUMeGuTeK?=
 =?us-ascii?Q?oE1xvxZ3qK5QAeqtpdgmXvRAR14ESgmvFCzU//1bVirLt+PNeAVY7K20oQO9?=
 =?us-ascii?Q?hqvJMC3JwGr3ruVfteZsB2SbW+P9PGOCfK64gQyko77a3g9hQ3KoT1XKRBa6?=
 =?us-ascii?Q?yb6PR5UGNMe5woy1vY1aDgpoQ0dBjuKpUxOzOeRWIy1V7075UbasKm3mNxSq?=
 =?us-ascii?Q?ynFdjgsHo+DkVLcud4dr9wj9BONucC5cRXU7o07uSssmbaadI/knauqTq4gc?=
 =?us-ascii?Q?dwYeX6KWIFlS6s/MNqy0B+VZzyxc3lpzyjjmbVuLcQk8EiRByP27IOIBMB3N?=
 =?us-ascii?Q?cDB9OxWskg/7z/WUXUV2YOLmocy2IIKclGouW1vYVc6dQiko/NcE8aX3US8K?=
 =?us-ascii?Q?9KhvMua3i0Nc9fLgFMf28Z1j1zBR5cFX0YYkPJSthrRHZBTxr5jY/K7Fr/bq?=
 =?us-ascii?Q?Nr/tsBq9HgTC53LKodxjLFhN4Cn7r9jl8ZdPN5sjOxNmXi/LfHGOBlS+uO/h?=
 =?us-ascii?Q?/yM+bHKncD4RHmd/qT9ZamZ2RWYb8uGK1qFdZnpYBPFuqYhyRiPP44O//gIs?=
 =?us-ascii?Q?Wxku0LgPEJLEDWYGgD4I2aDjbaOEBo49/jkfL99NLdAYaEymtQILcUPGEpCP?=
 =?us-ascii?Q?DbGs0Akd1bqSqPKgMucdfhaCTgHN4qUSiIWjzqZ+XS7HnuQCNdIdOvbH/uIT?=
 =?us-ascii?Q?2a6XwFA7M92Fp1adY+voWKUT2HFQHM15yzRYsNmkkFYjpTBZWyBgS9vm3sRZ?=
 =?us-ascii?Q?cEOcQdNjQfY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WtsN5OWYYFdI7xAt6yKcjyurhU4yXciZsqZdFWJimA/bZKZz/LwARt9MZaKQ?=
 =?us-ascii?Q?H8FDcHchreNtFg1vlKHv4tbe6/InWAd+UFyn/EYYsCEJOAFQB44orzuWhVPL?=
 =?us-ascii?Q?taYoEzNLECWMOw+eUBLs4CqnFSF5u8CnfQjuz7sHJJGt6Z2HO6oCzTZbQDJo?=
 =?us-ascii?Q?UDu5CWOBV0Jlnp8yWuJt9h6dIe9Pb4k/NzEuS4+RKiH9Q3htS2zdwz8ynZzv?=
 =?us-ascii?Q?nuTTXVRGBpvOh9yvsHbEDPzMvjCRQqIROBqAGVG2zqFRDOWiRYRUv/4j1pQ+?=
 =?us-ascii?Q?e2A8nIoiLasZcbOxLzGRJEUeDP+uEyrKeJ1Rr5ttLckVkrkKXB71KuXoGlmh?=
 =?us-ascii?Q?OYg57uiR61VBDKLgIkMSQFiR8M+b09meWCpiEwvNuBcue7UV4gy1nwPASWf/?=
 =?us-ascii?Q?AH9bVRKMvvm6flWDO7a3PF6MJ+95oHtv9Oo6auPirEvYAopUhZvUsPfPQCbT?=
 =?us-ascii?Q?INW98mqoKGlMcJgnvqQiEF+24MZuGF9QPCDWoBp7XMx2JozAy1a/zfw8jb1o?=
 =?us-ascii?Q?3kxBkCseVkonECxG2tfM6br67hGEbSR3ND8+hfkk1jXcPcvMVApYkudhdxhE?=
 =?us-ascii?Q?TsFipo82aduSiTleZZg/HOiGCmBVke2nd2AmJAJM46XzSMgmElDaL0umtodV?=
 =?us-ascii?Q?x+fOa0mIquQjZ7ESd0g0stGgKQDSqR78M6I4qTGxsSVKMh1Zp3EfBIb7KG4S?=
 =?us-ascii?Q?6zSYbZJ7OlYerNR8sgTr8aCAEHoF04Q3xzXIzp+nW+Z4581sqypW+NydvPYY?=
 =?us-ascii?Q?NEnnTDan5y3xNLtW0YIcRotzc7McmmK9atFlqNU2RicQLEpTYnuMmYQOSiqs?=
 =?us-ascii?Q?oQ6hVr2iLUthv6ci3jEkbiIelJzKw3iCQWTQ6UiftanQUq+QftYKq87F0EUU?=
 =?us-ascii?Q?CXVveQ46NvfOaUKcer/AXgDPxM3vlFCv+FM1b0xP3dWqdeJTOox42SKZtRZf?=
 =?us-ascii?Q?i2W5VXDXIO+uFu1Q4DwDHS0stnp3/FaKqkUcJz295OA7YV1fh/ZyGyf1RLjc?=
 =?us-ascii?Q?PekPif5goDv7OJBf+H694mWB/lRj/+qVAz1ZZcF7hQ/plgPddyjct2YVHHO2?=
 =?us-ascii?Q?O0YwrmV6ZudDQCvaW5BYjdaerTUGreqmrTGnqD92NMI2a0FSK5qjO2HD5NcL?=
 =?us-ascii?Q?rIiOVH+meiLQ+iCVKyUpnnVwjZiOZL+Be6XDzy0A/cHOBVlrISgYhRnhC9tq?=
 =?us-ascii?Q?1bnqKsjdx3kvDowy7YwaPK4zUCDSyBte1fGaxq/DpHWwowste9aIRP0VYT1y?=
 =?us-ascii?Q?SR3b59qRPOl4gApIpBW3gAnqae9X7sE7RWC0LOjCMW6OhSk+5SisoA8Effy2?=
 =?us-ascii?Q?NaoLPW0q6M+IUeeA7w8ksFTLfblBGy68XLkNGISCCuhFQDhxrXpVc6Lefiir?=
 =?us-ascii?Q?pg9tjY8g5o7jD7p5I6jL7WB99UkqhSs1h0nqNJ3FvC9v2DK6EPQ1BcRX92Kh?=
 =?us-ascii?Q?k/3pVnrNX02Ozs9FMyblWhRDlXflx/xnxs++jZin+LcmtTTm0EQG1HSkgi5F?=
 =?us-ascii?Q?v8W2NpOizuOI9DMk/6vbZmoZKZqqkJoXcPxOusE4zyMdEwdCkbLCg9Ls3xxD?=
 =?us-ascii?Q?2Rv//uGwP2FsUbphHDgKLYEjouQ8WSBb7WK35SDXNPdhrfkWd1+eFHYRag71?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c572a6d8-ab6f-42e3-641a-08dde1992681
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 16:30:05.1652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kd0kVKAeoWEGCpNz8CjXPaIiSA3uEaCEj8i4p3qaqR1GM2JH1TVGRKE+TiOoBQB0hjGdcTDpx2cP3NEkytg5cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7416
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

On Tue, Aug 19, 2025 at 04:55:29PM -0100, Andi Shyti wrote:
> From: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Coverity warns that 'cap' may be used uninitialised. If pcode
> is disabled there is no need to go through the hassle of a
> pcode read or taking a PM reference.

Please mark it as false positive!
We will only get here for BMG which has pcode for sure.

> 
> Check skip_pcode early in the function and return if it is set.
> 
> No change for platforms where pcode is enabled.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_sysfs.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index bd9015761aa0..3a083c215891 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -156,6 +156,9 @@ static int late_bind_create_files(struct device *dev)
>  	u32 cap;
>  	int ret;
>  
> +	if (xe->info.skip_pcode)
> +		return 0;
> +
>  	xe_pm_runtime_get(xe);
>  
>  	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
> -- 
> 2.50.0
> 
