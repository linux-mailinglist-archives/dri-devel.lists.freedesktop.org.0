Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA21891B73
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 14:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6109E112712;
	Fri, 29 Mar 2024 13:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g1kD+cyE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4897E112710;
 Fri, 29 Mar 2024 13:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711718729; x=1743254729;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fp0egls3VH50jD7uk4AmYEQpxWHgEtCde+1nkB/x1L8=;
 b=g1kD+cyEBBiJJW0OXVkyxVN/Aoco39oeQWHzZD4GsvyaAM5+0+ifgwIR
 oFHL4rlnSOJog2NMB0IMIu7WXblz5PHOitbZZoWTU+/ICLFUQBFk1HDci
 CKf/o/DKbbluRCMQsL+lNvb+tAkdyGtVsBBSZPFHhNqSi3LVO7xAG4f4D
 3I42TFGVVkuCKWZDY9lhco7cKfI//TAflzGwhBOjDsZo9/LA82WUCSsFe
 s6W0W4nzjic+N+rb0C7Dr7ic3AZSYUoAm5Nffkr5JQhMxJ/UtXaMMBng7
 6SdO6bIWBj3XfEoajnIX6gupU/KtU49iKqvsXmJAPk9ToyoGJmO5ovWaU Q==;
X-CSE-ConnectionGUID: ninavL7gSuKgpp9SJQvExQ==
X-CSE-MsgGUID: c44qITrxTPuAgnOW1tJtjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="7499752"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="7499752"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 06:25:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="17440614"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Mar 2024 06:25:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Mar 2024 06:25:19 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Mar 2024 06:25:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 29 Mar 2024 06:25:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 29 Mar 2024 06:25:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLHfkVGYmBEqTl9h/fAFeO6sX6iV55/prrAEiClvTVoBmp2d94kcPxiU9w/QfKj8VH3ef4zH5ZSZkObhJqx/oHK6aqIWbg59sQwp/2ADAY7KtzG1ECI0CqcqVCuNlsV4AKNUa1irUKtfMezOrJnu41Q8U2zxLI6YM7rPwffMs20V+U6AT9FzM34WIIEqba0MGld9HVM3ug3mQhGSUxcs7zKPhXNnMYhogYu3DQmlPZ2gMw750/2PPDA6XlQVDj9YmE0kgSFxSUKw30cVubyKs/cKzCAgKJoqD/xPjh4Fc3cupM2gjCeRBVl97FeGJb0cAffONWCeMpxp0wvav5lANQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iHF4zj7F945cQLb15UPAInChfZ4Vv1NSqRK2weBOlU=;
 b=oEAdBLhz5+ABKkLtz5xR/SWup2v81EfcbJKAInTRS17Akn+K6EMYU22XwK+2V9G7arxgcHsPaXUVmBN1ex7QHdsy1hNEgTNveb+axhhESYi/nlUFBDDmHmxtfKylvSSoadqqR3l4Ju2x1Lv5TB2FstgZpwObBd44KRJggi+NvU9mwpuzWSeRVz+bG+gw15UP79lGGVI4On9Gj3BEcrVJbeWJYohORuJ1lsy1qh0d+KVHaDeauwANv6gZBkwnleg0f5bECCRUyQHznM4CEhvTQZ9+NwXc2S5TdYPie7ENHiF3YhjEFAupsT1kzhb+TpT2FoKf51etdS/UOuxfP6L0bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8548.namprd11.prod.outlook.com (2603:10b6:610:1ba::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Fri, 29 Mar
 2024 13:25:15 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.031; Fri, 29 Mar 2024
 13:25:15 +0000
Date: Fri, 29 Mar 2024 09:25:08 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Musial, Ewelina" <ewelina.musial@intel.com>
CC: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Oded
 Gabbay" <ogabbay@kernel.org>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dim-tools@lists.freedesktop.org" <dim-tools@lists.freedesktop.org>
Subject: Re: [PULL] drm-intel-fixes
Message-ID: <ZgbBNIDObp4BRhkl@intel.com>
References: <ZgYaIVgjIs30mIvS@intel.com>
 <PH7PR11MB70739AF793C80F58596F6C39933A2@PH7PR11MB7073.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH7PR11MB70739AF793C80F58596F6C39933A2@PH7PR11MB7073.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR05CA0108.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::49) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8548:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LCUe6z8DBfFh/z9w09M1JgSVjGmAlF95PZFw2Md5WwMfhFc+TWBflM+Kt+cHp01bFr1ZP9tF8YYMbxWVFJcfpn1x0mSR7sMpUUBNtJmZMgANlYzGYBeSHIpxzbaFtyMyVsMKfRyFzKLiPnfnLS+xBtZBg2y/fVegaC2neQxKOUQrftoM7Y9KOsLPusTxWWnuRudyDJ+TfK0cVDDhYBKonLqdfJlnPgGXRkqVO9hxRku2FC0Lq8w4gk+cmzjL5FzroZ5CR8JYbZAcQs6XFgk5uAl62VTSWSCMbLeZ5k8PPpFYO5lGRJGISCeddNCzH80De+r4BEeSV+xp6bgO6LsRaebf37fBAxBdyv/QOucmIBHG0W9DqjxGO6e0rmI+3j2JJzGwOWLwSYPSWwR+Q4Vk0w6yXPyu72+ffWrF1ehDy4FkvhH8q6wDlpr86IShTRJD02OtgepxRFBGxDeKhjYbHPPX+UiNm8mRrhUfukyj/Pg8ACnF+9h0OzuG7rHkVu62+Mxf3rq+kg0tPEwxlqxsNWCwaFpoed+C5haPIrMiX4h57IA517tvCy/Axs90shXG+1AHzhJfP4OLT/ahdXZXyQqIMZfsHKAEO+3d6d8/7OCBccuZpAefiO2MRbr6W0Su
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5LIgsSGRKgth/ltKvXgZ6++vLRyvNfwtFxCfX1JxbFno5xXlI3MC4rJO1r?=
 =?iso-8859-1?Q?9HgJ2S3hA8aoumyEjV5C2pD4KEPJCDAWgmhlQXVEs2FZYoT0j1r5Xr2a6P?=
 =?iso-8859-1?Q?LIB5BIiYFkSMjx8Q0W1w8MnkCcJQgrarz4aCWvysCpfuzKhVux12JeZUUW?=
 =?iso-8859-1?Q?TNFMorPNxZTAZTHIzsXJWyVRpYTWVQHzONg9DHjds9AVoKR2bt4CyVPDKb?=
 =?iso-8859-1?Q?oJrdcg165jcTMTA3Kcl6l5Im+rIUK4v+M3pgzxq9zMBaqoX013gWhluAGb?=
 =?iso-8859-1?Q?Q8EbMm75zTAIXmiSAzi3RuIdJZNO7H8YO7tdgTxUY3VMUDMKsLWemnIv6J?=
 =?iso-8859-1?Q?k5lGqWojXsv4923SXDcHJMTqjXpuQ9vEfDs6B+jqTf5Pt0PXxK73ETvK97?=
 =?iso-8859-1?Q?a/mrpaDJCC40BZP036T7oqF+crhHAiLKnbdVckolVVMggItHdbIX22uF3k?=
 =?iso-8859-1?Q?GvCIOnT34go2OQYUKr6bPHscU9S0AoZ+DrMKjNb23gntLaddrvRik44VEQ?=
 =?iso-8859-1?Q?pLTC80bdPhzHZgufz76GLSzTqZrfys5xNKnOAfufh2ccjxNt7aIQNhdfPn?=
 =?iso-8859-1?Q?YwYEYxO0PcjgG+Zqs3c6sBArgIOrdnGw7kIUeAFSNYXqH7J+KgRWXWE0m2?=
 =?iso-8859-1?Q?zQC1Il4Ar6r4TMe2Jz1Y8IW1WLtelboX9YPA+vVofCdNS1CDIrQOhMViqM?=
 =?iso-8859-1?Q?PG72pQhz48NOuD8iJ1+icdSPY47/hgAkM1TvZ8edY4Ia1T21biDRu1Wj8i?=
 =?iso-8859-1?Q?jslxTTzFCcM5keQbTa3/0VypsjJr1QZs0MfAaDm7LcG62PVrWc+0ZaVyWl?=
 =?iso-8859-1?Q?+kUP8IzNbPhCLdigFUGGSiu788p/UCO+P/tbMJ4LJYI6qbN702pfUQP5gI?=
 =?iso-8859-1?Q?htMrIAGhekJvDUK+VC+yd7PA9HlwdTdMQNO0kSpDGjQyQjbkG9dBRrEL1c?=
 =?iso-8859-1?Q?woh05OGIZ7rYpExKmb5ipeu171DR4cVnJ4CchsgD9NtXjOd6kUj1/cFm+t?=
 =?iso-8859-1?Q?5MoDtZ3E42fg600BAfBgPrh85B+uxZyzilj4A8P5TR9zo7LndAmYFoRWGP?=
 =?iso-8859-1?Q?sw3T3WDEWRbQgf6ZW7aFd9VB2vWg6gE6TvHq7EQsHHbZhGrnCz71Vay1Ak?=
 =?iso-8859-1?Q?Pdy1Y+XvtN8mWuUTmlxw/IJtx7qdnJ1+p6RH7c3StpuhaB3CgJDxrQGLcr?=
 =?iso-8859-1?Q?fLKLgEYBvFOI5RaAiZ05VYcKBOeG9ezhg32JFdF9ZwJgPdQWaixZW+rgiN?=
 =?iso-8859-1?Q?s2ae7qyFjUh4eHjW7YaQL4P8+fkGXpcE8xlVG4emoZsgCV4lzJ/5Dwprqt?=
 =?iso-8859-1?Q?2J/Y6MPraC6wDx1/Kv0pGf4+9VOGxo0qgBQC32UCEZQTA7Mt+kWgu6GzeA?=
 =?iso-8859-1?Q?W/3JmFbFHECtpyS+WMja4u5rAdzMuRSflPb/CmFF3hIAVQ77NKnPKSLLCg?=
 =?iso-8859-1?Q?COIG45eSFMazBad9Q2/FzNUiIVWtFmFt+ZL+CAVVxAscQXDAfyzXwkIIpQ?=
 =?iso-8859-1?Q?Em130svDJ5s0Fl2VhWdODBUXNmpkPfUoQ3AwviBx6CyX3K1UPy7eRcsM+9?=
 =?iso-8859-1?Q?5pKRGwwsNo5CSbmuFqHQ7lGRO6D/ObFVqQjNyPUHJ3kL1C5/6AMywdcy5z?=
 =?iso-8859-1?Q?dO3dbQS/zpiIA+Qv9trJVH0qZBolDGHJot?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd247d8f-e890-48d2-7321-08dc4ff3ab7f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 13:25:15.4726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ReCCTphP6QHalv757mzFQ0Z72Rk5aTSx4VGHWFEwFUvNtsRArElIPJAk5u9BLjB/IPS5VdiJA2V84deD+E78g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8548
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

On Fri, Mar 29, 2024 at 06:23:54AM -0400, Musial, Ewelina wrote:
> Hi Rodrigo,
> 
> When I opened dashboard early morning all results were available, so I don't think there was any issue during night.
> It could be long reporting queue - reporting through AWS takes ages but this is not an issue with reporting, this is how AWS works.

I'm sorry for the noise. It was probably just a matter of time.

Everything looking good there.

Thanks,
Rodrigo.

> 
> Regards,
> Ewelina
> 
> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Rodrigo Vivi
> Sent: Friday, March 29, 2024 2:32 AM
> To: Dave Airlie <airlied@gmail.com>; Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>; Joonas Lahtinen <joonas.lahtinen@linux.intel.com>; Tvrtko Ursulin <tursulin@ursulin.net>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Thomas Zimmermann <tzimmermann@suse.de>; Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>; Thomas Hellström <thomas.hellstrom@linux.intel.com>; Oded Gabbay <ogabbay@kernel.org>; De Marchi, Lucas <lucas.demarchi@intel.com>; dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; dim-tools@lists.freedesktop.org
> Subject: [PULL] drm-intel-fixes
> 
> Hi Dave and Sima,
> 
> Here goes our first PR of this round.
> 
> Our CI is not working as I would expect:
> https://intel-gfx-ci.01.org/tree/drm-intel-fixes/index.html?
> 
> Well, at least it caught some build failures on runds 832 and 833.
> But after I fixed those, the 834 (with v6.9-rc1) and the 835 (with all these patches here) didn't show up yet. So I have run manual validation on my DG2+ADL here.
> 
> Everything looking good here, and it is yet -rc1. I'm confident that we can move ahead with those while we work to get CI back.
> 
> Thanks,
> Rodrigo
> 
> drm-intel-fixes-2024-03-28:
> 
> Core/GT Fixes:
> - Fix for BUG_ON/BUILD_BUG_ON IN I915_memcpy.c (Joonas)
> - Update a MTL workaround (Tejas)
> - Fix locking inversion in hwmon's sysfs (Janusz)
> - Remove a bogus error message around PXP (Jose)
> - Fix UAF on VMA (Janusz)
> - Reset queue_priority_hint on parking (Chris)
> 
> Display Fixes:
> - Remove duplicated audio enable/disable on SDVO and DP (Ville)
> - Disable AuxCCS for Xe driver (Juha-Pekka)
> - Revert init order of MIPI DSI (Ville)
> - DRRS debugfs fix with an extra refactor patch (Bhanuprakash)
> - VRR related fixes (Ville)
> - Fix a JSL eDP corruption (Jonathon)
> - Fix the cursor physical dma address (Ville)
> - BIOS VBT related fix (Ville)
> 
> Thanks,
> Rodrigo.
> 
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
>   https://anongit.freedesktop.org/git/drm/drm-intel tags/drm-intel-fixes-2024-03-28
> 
> for you to fetch changes up to 32e39bab59934bfd3f37097d4dd85ac5eb0fd549:
> 
>   drm/i915/bios: Tolerate devdata==NULL in intel_bios_encoder_supports_dp_dual_mode() (2024-03-28 12:16:17 -0400)
> 
> ----------------------------------------------------------------
> Core/GT Fixes:
> - Fix for BUG_ON/BUILD_BUG_ON IN I915_memcpy.c (Joonas)
> - Update a MTL workaround (Tejas)
> - Fix locking inversion in hwmon's sysfs (Janusz)
> - Remove a bogus error message around PXP (Jose)
> - Fix UAF on VMA (Janusz)
> - Reset queue_priority_hint on parking (Chris)
> 
> Display Fixes:
> - Remove duplicated audio enable/disable on SDVO and DP (Ville)
> - Disable AuxCCS for Xe driver (Juha-Pekka)
> - Revert init order of MIPI DSI (Ville)
> - DRRS debugfs fix with an extra refactor patch (Bhanuprakash)
> - VRR related fixes (Ville)
> - Fix a JSL eDP corruption (Jonathon)
> - Fix the cursor physical dma address (Ville)
> - BIOS VBT related fix (Ville)
> 
> ----------------------------------------------------------------
> Bhanuprakash Modem (2):
>       drm/i915/drrs: Refactor CPU transcoder DRRS check
>       drm/i915/display/debugfs: Fix duplicate checks in i915_drrs_status
> 
> Chris Wilson (1):
>       drm/i915/gt: Reset queue_priority_hint on parking
> 
> Janusz Krzysztofik (2):
>       drm/i915/hwmon: Fix locking inversion in sysfs getter
>       drm/i915/vma: Fix UAF on destroy against retire race
> 
> Jonathon Hall (1):
>       drm/i915: Do not match JSL in ehl_combo_pll_div_frac_wa_needed()
> 
> Joonas Lahtinen (1):
>       drm/i915: Add includes for BUG_ON/BUILD_BUG_ON in i915_memcpy.c
> 
> José Roberto de Souza (1):
>       drm/i915: Do not print 'pxp init failed with 0' when it succeed
> 
> Juha-Pekka Heikkila (1):
>       drm/i915/display: Disable AuxCCS framebuffers if built for Xe
> 
> Tejas Upadhyay (1):
>       drm/i915/mtl: Update workaround 14018575942
> 
> Ville Syrjälä (6):
>       drm/i915: Stop doing double audio enable/disable on SDVO and g4x+ DP
>       drm/i915/dsi: Go back to the previous INIT_OTP/DISPLAY_ON order, mostly
>       drm/i915/vrr: Generate VRR "safe window" for DSB
>       drm/i915/dsb: Fix DSB vblank waits when using VRR
>       drm/i915: Pre-populate the cursor physical dma address
>       drm/i915/bios: Tolerate devdata==NULL in intel_bios_encoder_supports_dp_dual_mode()
> 
>  drivers/gpu/drm/i915/display/g4x_dp.c              |  2 -
>  drivers/gpu/drm/i915/display/icl_dsi.c             |  3 +-
>  drivers/gpu/drm/i915/display/intel_bios.c          | 46 +++++++++++++++++---
>  drivers/gpu/drm/i915/display/intel_cursor.c        |  4 +-
>  drivers/gpu/drm/i915/display/intel_display_types.h |  1 +
>  drivers/gpu/drm/i915/display/intel_dp.c            | 12 +-----
>  drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  2 +-
>  drivers/gpu/drm/i915/display/intel_drrs.c          | 14 ++++--
>  drivers/gpu/drm/i915/display/intel_drrs.h          |  3 ++
>  drivers/gpu/drm/i915/display/intel_dsb.c           | 14 ++++++
>  drivers/gpu/drm/i915/display/intel_fb_pin.c        | 10 +++++
>  drivers/gpu/drm/i915/display/intel_sdvo.c          |  4 --
>  drivers/gpu/drm/i915/display/intel_vrr.c           |  7 +--
>  drivers/gpu/drm/i915/display/skl_universal_plane.c |  3 ++
>  drivers/gpu/drm/i915/gt/intel_engine_pm.c          |  3 --
>  .../gpu/drm/i915/gt/intel_execlists_submission.c   |  3 ++
>  drivers/gpu/drm/i915/gt/intel_workarounds.c        |  1 +
>  drivers/gpu/drm/i915/i915_driver.c                 |  2 +-
>  drivers/gpu/drm/i915/i915_hwmon.c                  | 37 ++++++++--------
>  drivers/gpu/drm/i915/i915_memcpy.c                 |  2 +
>  drivers/gpu/drm/i915/i915_reg.h                    |  2 +-
>  drivers/gpu/drm/i915/i915_vma.c                    | 50 +++++++++++++++++++---
>  22 files changed, 162 insertions(+), 63 deletions(-)
