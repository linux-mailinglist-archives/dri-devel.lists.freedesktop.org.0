Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DCECD1C37
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 21:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6940D10F0AF;
	Fri, 19 Dec 2025 20:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KC4ZkPSJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576E910E053;
 Fri, 19 Dec 2025 20:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766176632; x=1797712632;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=AgocQP62a9/AzFtcGVg2CPP5VMDJI4ncA4Qh3dKlyXE=;
 b=KC4ZkPSJsuSOD16nPe9KeqX1MNUR6RFUM4+W66KxetIw43lXENx6gKl/
 JWvSOQohbyuhpllCKPNUOwAJDYf9bZkeK970O4eM5aonZxXxf0Jg1CLdu
 xLIOFtfD/EdXdTDXy+fla9YMwS1iq+wW7AbL2L3YZH+ZCzXTT4lzc1wxk
 N4DPr+iurm9mB3QRiuNfp792KaEhfnHSxbJIk0Zr559GUBrpLHOrZWkjV
 dCvr571Ar1eQLes0ItaeXCfmsbHde/ahwiGAVJKoQNKskPVNsMxpdFm7Q
 hljm7n0lsyw2vRXMKZWa+KJR/qDNHmiz/EvRRQ8+a4cUEmzITNQOfMMBM w==;
X-CSE-ConnectionGUID: 83wKo/P+QAKKkUe105TWbQ==
X-CSE-MsgGUID: v0rl9JO8TXiizTYt3hipzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="78458530"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="78458530"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:37:11 -0800
X-CSE-ConnectionGUID: IAYgnZTxSM+Cw5Z1/iV2Pg==
X-CSE-MsgGUID: O8i9Vc3/Tym74dLZ0DGTMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="203858285"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:37:10 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 12:37:09 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 12:37:09 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.46) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 12:37:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HB8hfun85W06rUUJcT3aQxzYUVPFWojQWQ+pXnVXpY+fcJrdNyfU/YZRZ1F+O0/vaaOrLcyt9vNE5bnqKXi/IDn/4O5UuSryMjrBhXSJkGv5FOqnyyi9i4UafTZTXKbYl/lBimBiYvu2lR3EtCRXDgP4wUDlBFFmON3bIGtG0+qM5MZCf50t6kM7SG/VFAmNXKkpr321vE6f0HWKTKqWpPTvrMOr10rr+mS6icIjrR7+FioQ430p1fsoKB8LvtYFJZJnDmlmBXSrx66+VgdxOWe3B/JYFz9IYNAPlpgzjBfdKQFIajaV8rDQFFiEVroTwRMm16wYuS6GSnJEKdN9wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tOdl2JkLh5R5cvc19CiV/8ntCEwhOhcGjVV6ebAKso=;
 b=OR6MXv6VaY7T8GuwEG9zc3B0tCJxdROtcf1rikbqw8M7tbbmRBS5acuEduqVWMNYO9qtLXIgOusPU6GpuGmeVjXiIkJumzbz0NWRgQg0oylZrf2PYdGvnELBLYWdzdFhjdYuzgBdi+AKtK8wIcjCOgb91pzuSnPVKlWSyeToZROvzRNbxSpd1YJR/de5/JJpR0I/6HY8gPFIhBFuwKYIa7A5ARx95b65qX4AMG9VzTLIs2mhc8Kef7s7Y2RjIAUmwbKwEGhfVUCvlRQ56ulxo4hw/C6KYjNPI3iL9hNSlWIw/A4KRzXb/xDakm0ALsKm3DZJm7+Kzno6BMV2kFaADw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 20:37:07 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 20:37:07 +0000
Date: Fri, 19 Dec 2025 15:37:01 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Oded
 Gabbay" <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-intel-next
Message-ID: <aUW3bVDdE63aSFOJ@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:217::6) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB5309:EE_
X-MS-Office365-Filtering-Correlation-Id: d99a14e5-3f72-4c6b-3f78-08de3f3e6062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3RORWE0L1lzbldUWjF0M2llTlEyaHgwek04MzRwbUJEdnB6UzUyYzdLYzJp?=
 =?utf-8?B?RkxUWjJHVk5uMEw2VVdPV3J2MUlSSXVJeThnNlNDU2lSdjhjc1h4MlUyYjlN?=
 =?utf-8?B?SVBMTTU4TUxPZkJEOFE4NEptSXVlNUU1L3ZXaHIwaHQ1TWpOUnZmRkRiZjls?=
 =?utf-8?B?VnBDRkFyVTdRcE4xWkl1dzREZGgvK242REpoS1FqK1FQbEFFSjVUemJnVTE3?=
 =?utf-8?B?ODVYYitwSU9zcEZ5ZkJRckxyVGp5dEc5MkdZY1VZNVFYRDVYTC9HWU92Y3NL?=
 =?utf-8?B?bEQvRTFvT1JjYis0aUR0UWdKRFphL1haS3lQSkRDZ2NtR1FDS0l2UjJCc2da?=
 =?utf-8?B?bUI4TE92SWQzNlpLaFZEUnI4eER6NGxNeHJjVWZoUUlJTEVWbWRCYk5MQTc0?=
 =?utf-8?B?OE5DZ2ZDeUNlMW9jWHR5aSt2RjRYRVh1MXcvOHFmcmc0NWFINTJQaXp2a0JR?=
 =?utf-8?B?LzlqOGlySExhNXVkUFhwY0RlNDVlZjhydnJTYnljekxNanRMK0hVMU1XV3hU?=
 =?utf-8?B?ZlJJWTllZkRCZmpsZHFyVDQ4ZEQ1dUdOcUI3MjFRSGNrNlR4K2RzQ3Fyc01V?=
 =?utf-8?B?RFJLQ3lLcXc5RUNlTFdjN2M4ZFBUaGNYc0JPbytLVGFmMmVBY1Q0S2dLT0pi?=
 =?utf-8?B?UXdiMmVTYkdZM2paQkZUWm5mUFpyU1h6M3Q5N3JmR29uc0ZOQXRPM0JsT0x3?=
 =?utf-8?B?aC8rLzJYQ2thOGJ3WmxHMFdDYW04ZzFLdnFXUnlDdWRCT0ZsTExpd2pCdGhm?=
 =?utf-8?B?OGVEbXZPWGYxMHNsQk90VWRMWjNNV1phZDBETVlZRlZweGRZZFlYMHlSVXpa?=
 =?utf-8?B?YkRwMmZRRjdnenVLM0trdGUyc0F5Z0dwOWVEYXRVSDhBaGhDQ1JkMXlVNTNk?=
 =?utf-8?B?dnVweDQzcUVndVBLREh6VDBKUm4zdG5aUkx2QjBKZkRIVHpKaWc5OG0wRm5V?=
 =?utf-8?B?T3J5elgvNWFpUFd6SElGMWZHVHFqdGRxaUxQejFqVEZTUU9mN2FUWVROWnpt?=
 =?utf-8?B?SDN6SHpMZE03QmV3bm9RQXpObjRSazFpM0p0R1dVSXRhcTVxNXZnMmpwMk5H?=
 =?utf-8?B?VWlSVnZ4YTRYUzI1MlNQVmx5b3hPd2dubzZjaWx3YmZEZkx0MHJZM1p1Y1VJ?=
 =?utf-8?B?LzB0WUMvYzZ5YUJpSWpVWkxVRTFndzhnUDJjbm5qNHBuTDFNMWx6SHlRakk2?=
 =?utf-8?B?dlIzc3JDRE82bzNJK09QcktvVWprQWI3TFdXUjZzdDBuNGhydjN2aHV6SExs?=
 =?utf-8?B?WWpxWUJHb3BwNCtFMFpUbUFHOVdBcmd2QkJLZVVDV3Fjc05kaTEwaGlsd2RE?=
 =?utf-8?B?QTdRMWgycVR1blpaQmRrcEtZRzlibGxXRVk4QXBleW1IcUJUT1I0TmFvdlIx?=
 =?utf-8?B?ekM0RG8wdEJNQnlZeFBaV0cvSUdCMHhjTnVhU0gwdGNxbWpaY0NiRHJaU0VP?=
 =?utf-8?B?T1Q5NFFXK2Q1TlEyL0tVUHhhY2FKS09TODdpYytNNW1UakRpcFBvT1hYWWxv?=
 =?utf-8?B?ZmhUaFF5cWc2MWJrN1NURXc1RklQM3NxYnJETXUza3IxUW1yejRsd1lqejM3?=
 =?utf-8?B?Ty9OeDdrMTNoRE5hQm9jY2NHY0s1RXN4YnV4RUI4aTU1R0g1MFVxMTQvd1k4?=
 =?utf-8?B?REJUa0V1SCs4N0lGRDY1SWpWbjJoQW85dHd0WjZoN1kzZW1tUnZPZEUzUnpl?=
 =?utf-8?B?SjRmbW44WTE5NVNXcXVreGszajltUDByNC9kU0xUaEtOaHI2b1ZKUDVPTDBV?=
 =?utf-8?B?b0Y4WlV5OGhiQ1hPOCtKem9VMFJZU3VRUzJCRTZIOU10UW5RYWZGNEo2amU4?=
 =?utf-8?B?WDhJQ3krSWZHRDFSMm1paEpUV0ttNSs1dnROeU5nT1Q1ajdCK2FkWXlqcFF6?=
 =?utf-8?B?OUxwaE96Tjg4ZEZTdHl0dlFIaDZBVkZPU29TeWxXZWVidXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUpSYzk3NFpUeWJ5NFpuWDlZdWhUeHE3NTN5YjFDdmlrUTdDc0tQSHMxaHJn?=
 =?utf-8?B?MjVLa0lVQUExV2tlWThQV01FM3Y2cld1ZVhZT1ZlN0VBTlFyWmNTbVUxdFN6?=
 =?utf-8?B?MC9nQ0l0R0NZT2hOTVRUQ0JQTVlrTTlTT2w2cDZ3UCs3Y3dVbWJER2xicStq?=
 =?utf-8?B?a25VMmVFUzdoK3hoWFJRclBJWjlHdzNoOS9GWVNUZC9DVHAwQ29RSysyUHhI?=
 =?utf-8?B?aVNYVTM1UzdwemFDVnVRQXdzWmVkMXRnNEVjOGtUaHh4RE1oZVlwU0NTYmQ1?=
 =?utf-8?B?blh4a0RUZE9EVm5KSkQ4UWkzWG9DMS92Wld1YW81OUZnSzcyN1k0cTJmQXZW?=
 =?utf-8?B?eURURmY0ODVzMkdUOHZCTEJUZmsvY1ZXUXNzTDJXNys2RlhpVVlPYjNUcjVD?=
 =?utf-8?B?VUVKa0x1bDZQdmRtQnYyM1lGUHNQZDJUd2NsRnNWT2xyVWVES2Frci9FNzk0?=
 =?utf-8?B?OGFPRjJIUnUzNnRhSTFKVGN4aDl2S050SWtQZ2hiV3BERjlvWVhQYm5GMGdW?=
 =?utf-8?B?VHdPRnQycDNnbm9rUWxTRkR4cjNEbnJlMlBtdktHWlBvd0N3cG1iOUhLUmMw?=
 =?utf-8?B?TDE1cFFZc1l5ZHppbUZYa3kwUEVZNE5JOHM2MDNxTUJaWHhIWEllcTB4NytL?=
 =?utf-8?B?bzY5dXMrVFcvckUzVkl2aDBKUUhIWlJjUS9vTDlEaVlPZWJxODIxbTIvT0RF?=
 =?utf-8?B?b29YRkE1dFkxeDVsMG5BVTBwU1JNRGVEbGVNdzhCWTNURk1OK3d5YlJXbFk0?=
 =?utf-8?B?QjlsK1RteTRTOHc5NlhyWGFxbFlvN01adFU3RXVXak9teE9kaVFQQXFCeXlR?=
 =?utf-8?B?aEc3TXhzdXBYeXVDS2xJUkxKZXJWNDVQVzI0WUMxdWZzTVFiR2RjK0N1TGcv?=
 =?utf-8?B?OWJjNzEvelVDdzdHUWhmb2p5eW9lOUh3b2MzY2hrcEY3OTcrSmRZSEFrWmxT?=
 =?utf-8?B?OEFId2g1eEtDMzViL2FwN2kvWUlDeEI1MXlWVXZMbFEyMkFGbXFJenFyaGky?=
 =?utf-8?B?VVlkeGJLNXhNYlhKWTJ4ekZKa29aUzlYVktibzhGZHoyODRMTFE2a2NIeGxo?=
 =?utf-8?B?a2NpYXhQQmRxVjlLd2lBOHUzNXlJL1p3Y081TG9sUVVMM21GZGV3cUtxUFh1?=
 =?utf-8?B?TjBGc1gxaDQ2QURoTHFvbEROd1dRZlh3aHB4Y1J4SmR6MWJvYm40T3JsMXpl?=
 =?utf-8?B?dnlYQXJaSFl3bWJCd3lxSHhjQ0ZiSFAwdEg5M1VWUVhNOUNyY1JXMnlpd2Mw?=
 =?utf-8?B?QjI0dXBFak5iV3VqcUZ4V3VUaTdnbHhDUlNaeXRmejVOV256QUMySjRRVUFI?=
 =?utf-8?B?QUp5aU93cjczZGw5MDdqSzFJODc5UmtHL0dyZUhsOTZmZ054dEZDMmc3RlBJ?=
 =?utf-8?B?MHF5OHhlbkQrcVY1LzY1TU8vQXBCc2s4bEJqNFBFOTdCQ1lKS2Y0b2xsNDBS?=
 =?utf-8?B?RFgwZlovN0dZVmRPUFN2aTdkalBlTmIxM3d1bHlSY01hQXJYU21zNDdZT1Nx?=
 =?utf-8?B?UkxPSXM0VEFUcDYyVzgyTDZSVWlaSFNTQ3lQNXJueUZZTU5hN3BZdGg3R24y?=
 =?utf-8?B?dXhCU2FRU2JXT2ZlNGlITk02WXFid1pBcit2RkhrY25xd0lKYjdGVjhXWnZk?=
 =?utf-8?B?VmIyT3BSclVMR3JrVktHQnYwQlRvU1daL25CWlpFWnVhUU1UbW9VMzRRY3Ja?=
 =?utf-8?B?R3FhUGRQNnQvTGtRbDFDMC9adFdqaFQveGhGby9NYVdibEFISXNXNnFtNUhL?=
 =?utf-8?B?a243dWhoejVlajZmU2xGdnJGS1NJMENVdlUxLzY3UjljOStnZGZWblUvRXU5?=
 =?utf-8?B?WUs2ZHU4MnRwSGFOazZ3aWtkOTlpWUhtWHVZaDgwcFNyZW0zcUtadnlvMmhD?=
 =?utf-8?B?cjUxTndzSE1iVXJ5TlVZc1h1enBLN05JTWlKNmZVeFNacFdPd3ZraEZnQ1lF?=
 =?utf-8?B?c3BSWFpXUkhzRDZlY2ZDTnBPaVJmaGpweEZOR1NQMVQ0TzVBemE0R3UxbU5W?=
 =?utf-8?B?VkU2M2QxMkZkZDhjUHZURjliS25xWUdFSWdacS82amVYOXl6OFRmOFVGY2J0?=
 =?utf-8?B?U2VUeHVqSHdFQ3A3dkltN0lkbVlXaDJNM0Fmck9RcFVYN3NucjhCSVFhU0Qv?=
 =?utf-8?B?RHprSUp3MmRHMmhCcDlLaEpyODFRTEVDQlIwNXYwajBLZ1MzcWZQV1JDVHdl?=
 =?utf-8?B?aEZ6NFgvemhyZ0lSWWgvT0pjdjFWdTlPWTBrY2xDZ0ZPV0orLzhZVFlxVXlm?=
 =?utf-8?B?WnUyTTNITFhBZGFxTW45U0VTc3A4elUyL1F4Z3pWL09ydVBiU3FVbmUwOU55?=
 =?utf-8?B?enZxOTUrQlN5eFZaeS9nWVd2U2RvQ0JHZEdNZlc1eE1xV1AyZnV0dz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d99a14e5-3f72-4c6b-3f78-08de3f3e6062
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 20:37:07.3154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xYWQJtuS6KJzUTVMExOWgJo4JPjToDmeV1wMlyqy+8MBxaSC2fmPutA7Px5uVoklKcKWqF5xKnXTRzKpyTRwPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5309
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

Hi Dave and Sima,

Here goes our first PR of drm-intel-next towards 7.0.

Highlights to NVL display addition and great update
in many fronts: Async flips, PSR, DPLL, PC states.
And, of course, the continuation of a display separation refactor.

Thanks,
Rodrigo.

drm-intel-next-2025-12-19:
Beyond Display related:
 - Switch to use kernel standard fault injection in i915 (Juha-Pekka)

 Display uAPI related:
 - Display uapi vs. hw state fixes (Ville)
 - Expose sharpness only if num_scalers is >= 2 (Nemesa)

 Display related:
 - More display driver refactor and clean-ups, specially towards separation (Jani)
 - Add initial support Xe3p_LPD for NVL (Gustavo, Sai, )
 - BMG FBC W/a (Vinod)
 - RPM fix (Dibin)
 - Add MTL+ platforms to support dpll framework (Mika, Imre)
 - Other PLL related fixes (Imre)
 - Fix DIMM_S DRAM decoding on ICL (Ville)
 - Async flip refactor (Ville, Jouni)
 - Go back to using AUX interrupts (Ville)
 - Reduce severity of failed DII FEC enabling (Grzelak)
 - Enable system cache support for FBC (Vinod)
 - Move PSR/Panel Replay sink data into intel_connector and other PSR changes (Jouni)
 - Detect AuxCCS support via display parent interface (Tvrtko)
 - Clean up link BW/DSC slice config computation(Imre)
 - Toggle powerdown states for C10 on HDMI (Gustavo)
 - Add parent interface for PC8 forcewake tricks (Ville)
The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-2025-12-19

for you to fetch changes up to 35ec71285c9311395b14bedc60fa94f6b7e24d2d:

  drm/i915/pc8: Add parent interface for PC8 forcewake tricks (2025-12-19 21:28:48 +0200)

----------------------------------------------------------------
Beyond Display related:
 - Switch to use kernel standard fault injection in i915 (Juha-Pekka)

 Display uAPI related:
 - Display uapi vs. hw state fixes (Ville)
 - Expose sharpness only if num_scalers is >= 2 (Nemesa)

 Display related:
 - More display driver refactor and clean-ups, specially towards separation (Jani)
 - Add initial support Xe3p_LPD for NVL (Gustavo, Sai, )
 - BMG FBC W/a (Vinod)
 - RPM fix (Dibin)
 - Add MTL+ platforms to support dpll framework (Mika, Imre)
 - Other PLL related fixes (Imre)
 - Fix DIMM_S DRAM decoding on ICL (Ville)
 - Async flip refactor (Ville, Jouni)
 - Go back to using AUX interrupts (Ville)
 - Reduce severity of failed DII FEC enabling (Grzelak)
 - Enable system cache support for FBC (Vinod)
 - Move PSR/Panel Replay sink data into intel_connector and other PSR changes (Jouni)
 - Detect AuxCCS support via display parent interface (Tvrtko)
 - Clean up link BW/DSC slice config computation(Imre)
 - Toggle powerdown states for C10 on HDMI (Gustavo)
 - Add parent interface for PC8 forcewake tricks (Ville)

----------------------------------------------------------------
Ankit Nautiyal (1):
      drm/i915/dp: Restrict max source rate for WCL to HBR3

Dibin Moolakadan Subrahmanian (1):
      drm/i915/fbdev: Hold runtime PM ref during fbdev BO creation

Gustavo Sousa (9):
      drm/i915/vbt: Add fields dedicated_external and dyn_port_over_tc
      drm/i915/power: Use intel_encoder_is_tc()
      drm/i915/display: Handle dedicated external ports in intel_encoder_is_tc()
      drm/i915/xe3p_lpd: Handle underrun debug bits
      drm/i915/display: Use platform check in HAS_LT_PHY()
      drm/i915/display: Move HAS_LT_PHY() to intel_display_device.h
      drm/i915/display: Use HAS_LT_PHY() for LT PHY AUX power
      drm/i915/cx0: Use a more accurate message for powerdown change failure
      drm/i915/cx0: Toggle powerdown states for C10 on HDMI

Imre Deak (37):
      drm/i915/cx0: Factor out C10 msgbus access start/end helpers
      drm/i915/cx0: Sanitize setting the Cx0 PLL use_c10 flag
      drm/i915/cx0: Sanitize calculating C20 PLL state from tables
      drm/i915/cx0: Track the C20 PHY VDR state in the PLL state
      drm/i915/cx0: Move definition of Cx0 PHY functions earlier
      drm/i915/cx0: Add macro to get DDI port width from a register value
      drm/i915/cx0: Track the Cx0 PHY enabled lane count in the PLL state
      drm/i915/cx0: Sanitize C10 PHY PLL SSC register setup
      drm/i915/cx0: Read out the Cx0 PHY SSC enabled state
      drm/i915/cx0: Determine Cx0 PLL DP mode from PLL state
      drm/i915/cx0: Determine Cx0 PLL port clock from PLL state
      drm/i915/cx0: Zero Cx0 PLL state before compute and HW readout
      drm/i915/cx0: Print additional Cx0 PLL HW state
      drm/i915/cx0: PLL verify debug state print
      drm/i915/cx0: Add MTL+ Thunderbolt PLL hooks
      drm/i915/cx0: Fix port to PLL ID mapping on BMG
      drm/i915/tc: Add separate intel_tc_phy_port_to_tc() for TC DDI/PHY ports
      drm/i915/cx0: Use intel_port_to_tc() instead of open coding it
      drm/i915/cx0: Read out power-down state of both TXs in PHY lane 0
      drm/i915/cx0: Read out power-down state of both PHY lanes for reversed lanes
      drm/i915/cx0: Convert C10 PHY PLL SSC state mismatch WARN to a debug message
      drm/dp: Parse all DSC slice count caps for eDP 1.5
      drm/dp: Add drm_dp_dsc_sink_slice_count_mask()
      drm/i915/dp: Fix DSC sink's slice count capability check
      drm/i915/dp: Return a fixed point BPP value from intel_dp_output_bpp()
      drm/i915/dp: Use a mode's crtc_clock vs. clock during state computation
      drm/i915/dp: Factor out intel_dp_link_bw_overhead()
      drm/i915/dp: Fix BW check in is_bw_sufficient_for_dsc_config()
      drm/i915/dp: Use the effective data rate for DP BW calculation
      drm/i915/dp: Use the effective data rate for DP compressed BW calculation
      drm/i915/dp: Account with MST, SSC BW overhead for uncompressed DP-MST stream BW
      drm/i915/dp: Account with DSC BW overhead for compressed DP-SST stream BW
      drm/i915/dp: Account with pipe joiner max compressed BPP limit for DP-MST and eDP
      drm/i915/dp: Fail state computation for invalid min/max link BPP values
      drm/i915/dp: Fail state computation for invalid max throughput BPP value
      drm/i915/dp: Fail state computation for invalid max sink compressed BPP value
      drm/i915/dp: Fail state computation for invalid DSC source input BPP values

Jani Nikula (54):
      drm/{i915, xe}/display: duplicate gen2 irq/error init/reset in display irq
      drm/i915/display: convert the display irq interfaces to struct intel_display
      drm/{i915,xe}/display: move irq calls to parent interface
      drm/i915: add .vgpu_active to parent interface
      drm/i915: add .has_fenced_regions to parent interface
      drm/i915/rps: store struct dma_fence in struct wait_rps_boost
      drm/i915/rps: call RPS functions via the parent interface
      drm/i915/rps: postpone i915 fence check to boost
      drm/i915: add .fence_priority_display to parent interface
      drm/xe/rps: build RPS as part of xe
      drm/i915/edram: extract i915_edram.[ch] for edram detection
      drm/i915: split out i915_freq.[ch]
      drm/i915: move intel_dram.[ch] from soc/ to display/
      drm/xe: remove MISSING_CASE() from compat i915_utils.h
      drm/i915/dram: convert to struct intel_display
      drm/i915: move dram_info to struct intel_display
      drm/i915: move intel_rom.[ch] from soc/ to display/
      drm/xe: remove remaining platform checks from compat i915_drv.h
      drm/i915/gmch: split out i915_gmch.[ch] from soc
      drm/i915/gmch: switch to use pci_bus_{read,write}_config_word()
      drm/i915/gmch: convert intel_gmch.c to struct intel_display
      drm/i915: merge soc/intel_gmch.[ch] to display/intel_vga.c
      drm/xe/vga: use the same intel_gmch_vga_set_decode() as i915
      drm/i915/cdclk: drop i915_drv.h include
      drm/i915: use struct drm_device for clock gating funcs
      drm/i915/hdcp: move i915 specific HDCP GSC implementation to i915
      drm/{i915,xe}/hdcp: use parent interface for HDCP GSC calls
      drm/{i915, xe}/dsb: make {intel, xe}_dsb_buffer.c independent of display
      drm/{i915, xe}/dsb: allocate struct intel_dsb_buffer dynamically
      drm/{i915,xe}/dsb: make struct intel_dsb_buffer opaque
      drm/xe/dsb: drop the unnecessary struct i915_vma
      drm/i915/pps: drop wakeref parameter from with_intel_pps_lock()
      drm/i915/pps: convert intel_wakeref_t to struct ref_tracker *
      drm/i915/power: drop wakeref parameter from with_intel_display_power*()
      drm/i915/power: convert intel_wakeref_t to struct ref_tracker *
      drm/{i915,xe}/display: drop intel_wakeref.h usage
      drm/xe/compat: remove unused i915_active.h and i915_active_types.h
      drm/{i915, xe}/display: make pxp key check part of bo interface
      Merge drm/drm-next into drm-intel-next
      drm/i915/crtc: move crtc initialization loop to intel_crtc.c
      drm/i915/fbc: let to_intel_display() do its generic magic
      drm/xe/stolen: unify interface with i915
      drm/{i915, xe}/stolen: move stolen memory handling to display parent interface
      drm/{i915, xe}/stolen: make insert_node, area_address, area_size optional
      drm/i915/panic: move i915 specific panic implementation to i915
      drm/{i915, xe}/panic: move panic handling to parent interface
      drm/intel: fix parent interface kernel-doc
      drm/intel: group individual funcs in parent interface
      drm/intel: sort parent interface struct definitions and members
      drm/i915: sort parent interface initialization
      drm/xe: sort parent interface initialization
      drm/i915/display: group and sort the parent interface wrappers better
      drm/i915/wakeref: clean up INTEL_WAKEREF_PUT_* flag macros
      drm/i915/colorop: do not include headers from headers

Jouni Högander (12):
      drm/i915/psr: Add panel granularity information into intel_connector
      drm/i915/psr: Use SU granularity information available in intel_connector
      drm/i915/psr: Compute Panel Replay/Adaptive Sync coexistence behavior
      drm/i915/psr: Move pr_dpcd and psr_dpcd to intel_connector
      drm/i915/psr: Clear pr_dpcd as well on disconnect
      drm/i915/psr: Move Panel Replay DSC sink support data to intel_connector
      drm/i915/psr: Move sink PSR and Panel Replay booleans to intel_connector
      drm/i915/psr: Move sink_sync_latency to intel_connector
      drm/i915/psr: Set plane id bit in crtc_state->async_flip_planes for PSR
      drm/i915/psr: Perform full frame update on async flip
      drm/i915/psr: Allow async flip when Selective Fetch enabled
      drm/i915/display: Allow async flip when Selective Fetch is enabled

Juha-Pekka Heikkila (2):
      drm/i915: switch to use kernel standard error injection
      drm/i915: Add intel_gvt_driver_remove() onto error cleanup path

Michał Grzelak (1):
      i915/display/intel_ddi: Reduce severity of failed FEC enabling

Mika Kahola (17):
      drm/i915/cx0: Rename TBT functions to be ICL specific
      drm/i915/cx0: Remove state verification
      drm/i915/cx0: Add PLL information for MTL+
      drm/i915/cx0: Update C10/C20 state calculation
      drm/i915/cx0: Compute plls for MTL+ platform
      drm/i915/cx0: Add MTL+ .get_dplls hook
      drm/i915/cx0: Add MTL+ .put_dplls hook
      drm/i915/cx0: Add MTL+ .update_active_dpll hook
      drm/i915/cx0: Add MTL+ .update_dpll_ref_clks hook
      drm/i915/cx0: Add MTL+ .dump_hw_state hook
      drm/i915/cx0: Add .compare_hw_state hook
      drm/i915/cx0: Add MTL+ .get_hw_state hook
      drm/i915/cx0: Add MTL+ .get_freq hook
      drm/i915/cx0: Add MTL+ .crtc_get_dpll hook
      drm/i915/cx0: Add MTL+ .enable_clock/.disable clock hooks on DDI
      drm/i915/cx0: Get encoder configuration for C10 and C20 PHY PLLs
      drm/i915/cx0: Enable dpll framework for MTL+

Nemesa Garg (1):
      drm/i915/crtc: Expose sharpness only if num_scalers is >= 2

Rodrigo Vivi (1):
      Merge drm/drm-next into drm-intel-next

Sai Teja Pottumuttu (1):
      drm/i915/nvls: Add NVL-S display support

Tvrtko Ursulin (1):
      drm/i915/display: Detect AuxCCS support via display parent interface

Ville Syrjälä (15):
      drm/i915/dram: Use REG_GENMASK() & co. for the SKL+ DIMM regs
      drm/i915/dram: Sort SKL+ DIMM register bits
      drm/i915/dram: Fix ICL DIMM_S decoding
      drm/i915/psr: Reject async flips when selective fetch is enabled
      drm/i915: Use the proper (hw.crtc) for the cursor unpin vblank worker
      drm/i915/psr: Use hw.crtc instead of uapi.crtc
      drm/i915/psr: Use hw.rotation instead of uapi.rotation
      drm/i915: Use hw.active instead of uapi.active in the initial plane readout
      drm/i915/panic: Get the crtc from the correct place
      drm/i915/panic: Clean up the variables
      drm/i915: Expose the IN_FORMATS_ASYNC blob for all planes
      drm/i915: Eliminate one more frequent drm_format_info()
      drm/i915: Enable DDI A/B AUX interrupts on LNL+
      Revert "drm/i915/dp: change aux_ctl reg read to polling read"
      drm/i915/pc8: Add parent interface for PC8 forcewake tricks

Vinod Govindapillai (4):
      drm/i915/fbc: Apply Wa_15018326506
      drm/i915/display: Use a sub-struct for fbc operations in intel_display
      drm/i915/xe3p_lpd: Enable display use of system cache for FBC
      drm/i915/fbc: Apply Wa_14025769978

 drivers/gpu/drm/display/drm_dp_helper.c            |  103 +-
 drivers/gpu/drm/i915/Makefile                      |   20 +-
 drivers/gpu/drm/i915/display/g4x_dp.c              |    5 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |    2 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c          |    9 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c             |    5 +-
 drivers/gpu/drm/i915/display/icl_dsi.c             |    4 +-
 drivers/gpu/drm/i915/display/intel_alpm.c          |    6 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |    6 +-
 drivers/gpu/drm/i915/display/intel_bios.c          |   76 +-
 drivers/gpu/drm/i915/display/intel_bios.h          |    2 +
 drivers/gpu/drm/i915/display/intel_bo.c            |    6 +
 drivers/gpu/drm/i915/display/intel_bo.h            |    1 +
 drivers/gpu/drm/i915/display/intel_bw.c            |    5 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |   13 +-
 drivers/gpu/drm/i915/display/intel_cmtg.c          |    3 +-
 drivers/gpu/drm/i915/display/intel_colorop.c       |    2 +
 drivers/gpu/drm/i915/display/intel_colorop.h       |    4 +-
 drivers/gpu/drm/i915/display/intel_connector.c     |   14 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |    6 +-
 drivers/gpu/drm/i915/display/intel_crtc.c          |   31 +-
 drivers/gpu/drm/i915/display/intel_crtc.h          |    2 +-
 drivers/gpu/drm/i915/display/intel_cursor.c        |    5 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       | 1091 +++++++++++---------
 drivers/gpu/drm/i915/display/intel_cx0_phy.h       |   29 +-
 drivers/gpu/drm/i915/display/intel_ddi.c           |  116 ++-
 drivers/gpu/drm/i915/display/intel_display.c       |  102 +-
 drivers/gpu/drm/i915/display/intel_display.h       |    1 +
 drivers/gpu/drm/i915/display/intel_display_core.h  |   18 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |    2 +-
 .../gpu/drm/i915/display/intel_display_device.c    |    5 +
 .../gpu/drm/i915/display/intel_display_device.h    |    9 +-
 .../gpu/drm/i915/display/intel_display_driver.c    |   18 +-
 drivers/gpu/drm/i915/display/intel_display_irq.c   |  203 ++--
 drivers/gpu/drm/i915/display/intel_display_irq.h   |    2 +
 drivers/gpu/drm/i915/display/intel_display_power.c |   48 +-
 drivers/gpu/drm/i915/display/intel_display_power.h |   48 +-
 .../drm/i915/display/intel_display_power_well.c    |   64 +-
 drivers/gpu/drm/i915/display/intel_display_regs.h  |   23 +-
 drivers/gpu/drm/i915/display/intel_display_reset.c |    5 +-
 drivers/gpu/drm/i915/display/intel_display_rps.c   |   31 +-
 drivers/gpu/drm/i915/display/intel_display_rps.h   |   21 -
 drivers/gpu/drm/i915/display/intel_display_types.h |   52 +-
 drivers/gpu/drm/i915/display/intel_display_wa.c    |    4 +
 drivers/gpu/drm/i915/display/intel_display_wa.h    |    2 +
 drivers/gpu/drm/i915/display/intel_dmc.c           |    2 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |  234 +++--
 drivers/gpu/drm/i915/display/intel_dp.h            |    9 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c        |   16 +-
 .../gpu/drm/i915/display/intel_dp_link_training.c  |    4 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   33 +-
 drivers/gpu/drm/i915/display/intel_dpll.c          |   24 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |  336 +++++-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |   11 +-
 drivers/gpu/drm/i915/{soc => display}/intel_dram.c |  397 +++----
 drivers/gpu/drm/i915/{soc => display}/intel_dram.h |   12 +-
 drivers/gpu/drm/i915/display/intel_dsb.c           |   42 +-
 drivers/gpu/drm/i915/display/intel_dsb_buffer.c    |   43 +-
 drivers/gpu/drm/i915/display/intel_dsb_buffer.h    |   13 +-
 drivers/gpu/drm/i915/display/intel_dsi.h           |    7 +-
 drivers/gpu/drm/i915/display/intel_fb.c            |    6 +-
 drivers/gpu/drm/i915/display/intel_fbc.c           |  266 +++--
 drivers/gpu/drm/i915/display/intel_fbc.h           |    3 +
 drivers/gpu/drm/i915/display/intel_fbc_regs.h      |   12 +
 drivers/gpu/drm/i915/display/intel_fifo_underrun.c |  109 ++
 drivers/gpu/drm/i915/display/intel_gmbus.c         |   10 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |    4 +-
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h      |   22 -
 .../gpu/drm/i915/display/intel_hdcp_gsc_message.c  |   78 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |    4 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c       |    8 +-
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c   |    5 +-
 drivers/gpu/drm/i915/display/intel_lpe_audio.c     |    1 -
 drivers/gpu/drm/i915/display/intel_lt_phy.c        |   18 +-
 drivers/gpu/drm/i915/display/intel_lt_phy.h        |    2 -
 drivers/gpu/drm/i915/display/intel_lvds.c          |    2 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |    2 +-
 .../gpu/drm/i915/display/intel_modeset_verify.c    |    1 -
 drivers/gpu/drm/i915/display/intel_panic.c         |   27 -
 drivers/gpu/drm/i915/display/intel_panic.h         |   14 -
 drivers/gpu/drm/i915/display/intel_parent.c        |  214 ++++
 drivers/gpu/drm/i915/display/intel_parent.h        |   70 ++
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |    8 +-
 drivers/gpu/drm/i915/display/intel_plane.c         |   96 +-
 drivers/gpu/drm/i915/display/intel_plane.h         |    4 +-
 drivers/gpu/drm/i915/display/intel_plane_initial.c |    6 +-
 drivers/gpu/drm/i915/display/intel_pps.c           |   63 +-
 drivers/gpu/drm/i915/display/intel_pps.h           |   14 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  317 +++---
 drivers/gpu/drm/i915/display/intel_psr.h           |    5 +-
 drivers/gpu/drm/i915/{soc => display}/intel_rom.c  |    0
 drivers/gpu/drm/i915/{soc => display}/intel_rom.h  |    0
 drivers/gpu/drm/i915/display/intel_sprite.c        |    9 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |   40 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |    3 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |    2 +-
 drivers/gpu/drm/i915/display/intel_vga.c           |   44 +-
 drivers/gpu/drm/i915/display/skl_universal_plane.c |   19 +-
 drivers/gpu/drm/i915/display/skl_watermark.c       |    8 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c             |    2 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c         |   52 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.h         |   21 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |    4 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                 |    9 +-
 drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c     |    4 +-
 drivers/gpu/drm/i915/gt/intel_gt_print.h           |    5 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |    4 -
 drivers/gpu/drm/i915/gt/intel_rps.c                |   40 +-
 drivers/gpu/drm/i915/gt/intel_rps.h                |    2 +
 drivers/gpu/drm/i915/gt/intel_wopcm.c              |    3 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c          |    8 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c             |    4 -
 drivers/gpu/drm/i915/gt/uc/intel_uc.c              |   17 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c           |   60 +-
 drivers/gpu/drm/i915/i915_display_pc8.c            |   31 +
 drivers/gpu/drm/i915/i915_display_pc8.h            |    9 +
 drivers/gpu/drm/i915/i915_driver.c                 |   75 +-
 drivers/gpu/drm/i915/i915_drv.h                    |    3 -
 drivers/gpu/drm/i915/i915_edram.c                  |   44 +
 drivers/gpu/drm/i915/i915_edram.h                  |   11 +
 drivers/gpu/drm/i915/i915_freq.c                   |  111 ++
 drivers/gpu/drm/i915/i915_freq.h                   |   13 +
 drivers/gpu/drm/i915/i915_gem.c                    |    4 +-
 .../gpu/drm/i915/{soc/intel_gmch.c => i915_gmch.c} |   61 +-
 drivers/gpu/drm/i915/i915_gmch.h                   |   13 +
 .../{display/intel_hdcp_gsc.c => i915_hdcp_gsc.c}  |   22 +-
 drivers/gpu/drm/i915/i915_hdcp_gsc.h               |    9 +
 drivers/gpu/drm/i915/i915_irq.c                    |   16 +
 drivers/gpu/drm/i915/i915_irq.h                    |    2 +
 drivers/gpu/drm/i915/i915_panic.c                  |   35 +
 drivers/gpu/drm/i915/i915_panic.h                  |    9 +
 drivers/gpu/drm/i915/i915_params.c                 |    5 -
 drivers/gpu/drm/i915/i915_params.h                 |    1 -
 drivers/gpu/drm/i915/i915_pci.c                    |    6 +-
 drivers/gpu/drm/i915/i915_utils.c                  |   30 +-
 drivers/gpu/drm/i915/i915_utils.h                  |   22 +-
 drivers/gpu/drm/i915/intel_clock_gating.c          |   10 +-
 drivers/gpu/drm/i915/intel_clock_gating.h          |    6 +-
 drivers/gpu/drm/i915/intel_gvt.c                   |    3 -
 drivers/gpu/drm/i915/intel_mchbar_regs.h           |   68 +-
 drivers/gpu/drm/i915/intel_uncore.c                |    4 +-
 drivers/gpu/drm/i915/intel_wakeref.c               |    2 +-
 drivers/gpu/drm/i915/intel_wakeref.h               |   14 +-
 drivers/gpu/drm/i915/soc/intel_gmch.h              |   20 -
 drivers/gpu/drm/i915/vlv_suspend.c                 |    2 +-
 drivers/gpu/drm/xe/Makefile                        |   19 +-
 .../xe/compat-i915-headers/gem/i915_gem_object.h   |   13 -
 .../xe/compat-i915-headers/gem/i915_gem_stolen.h   |   40 -
 .../drm/xe/compat-i915-headers/gt/intel_gt_types.h |   11 -
 .../gpu/drm/xe/compat-i915-headers/i915_active.h   |   22 -
 .../drm/xe/compat-i915-headers/i915_active_types.h |   13 -
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |   15 -
 drivers/gpu/drm/xe/compat-i915-headers/i915_irq.h  |    6 -
 .../gpu/drm/xe/compat-i915-headers/i915_utils.h    |    6 -
 drivers/gpu/drm/xe/compat-i915-headers/i915_vgpu.h |   18 -
 .../gpu/drm/xe/compat-i915-headers/intel_wakeref.h |   10 -
 .../gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h |   29 -
 .../drm/xe/compat-i915-headers/soc/intel_dram.h    |    6 -
 .../drm/xe/compat-i915-headers/soc/intel_gmch.h    |    6 -
 .../gpu/drm/xe/compat-i915-headers/soc/intel_rom.h |    6 -
 drivers/gpu/drm/xe/display/ext/i915_irq.c          |   85 --
 drivers/gpu/drm/xe/display/intel_bo.c              |    8 +-
 drivers/gpu/drm/xe/display/xe_display.c            |   28 +-
 drivers/gpu/drm/xe/display/xe_display_misc.c       |   16 -
 drivers/gpu/drm/xe/display/xe_display_rpm.c        |    3 +
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c         |   49 +-
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c           |   27 +-
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.h           |    9 +
 drivers/gpu/drm/xe/display/xe_panic.c              |   16 +-
 drivers/gpu/drm/xe/display/xe_panic.h              |    9 +
 drivers/gpu/drm/xe/display/xe_plane_initial.c      |    6 +-
 drivers/gpu/drm/xe/display/xe_stolen.c             |   62 +-
 drivers/gpu/drm/xe/display/xe_stolen.h             |    9 +
 drivers/gpu/drm/xe/xe_device_types.h               |    8 -
 include/drm/display/drm_dp_helper.h                |    3 +
 include/drm/intel/display_parent_interface.h       |   87 ++
 176 files changed, 3877 insertions(+), 2587 deletions(-)
 rename drivers/gpu/drm/i915/{soc => display}/intel_dram.c (57%)
 rename drivers/gpu/drm/i915/{soc => display}/intel_dram.h (68%)
 delete mode 100644 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
 delete mode 100644 drivers/gpu/drm/i915/display/intel_panic.c
 delete mode 100644 drivers/gpu/drm/i915/display/intel_panic.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_parent.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_parent.h
 rename drivers/gpu/drm/i915/{soc => display}/intel_rom.c (100%)
 rename drivers/gpu/drm/i915/{soc => display}/intel_rom.h (100%)
 create mode 100644 drivers/gpu/drm/i915/i915_display_pc8.c
 create mode 100644 drivers/gpu/drm/i915/i915_display_pc8.h
 create mode 100644 drivers/gpu/drm/i915/i915_edram.c
 create mode 100644 drivers/gpu/drm/i915/i915_edram.h
 create mode 100644 drivers/gpu/drm/i915/i915_freq.c
 create mode 100644 drivers/gpu/drm/i915/i915_freq.h
 rename drivers/gpu/drm/i915/{soc/intel_gmch.c => i915_gmch.c} (68%)
 create mode 100644 drivers/gpu/drm/i915/i915_gmch.h
 rename drivers/gpu/drm/i915/{display/intel_hdcp_gsc.c => i915_hdcp_gsc.c} (89%)
 create mode 100644 drivers/gpu/drm/i915/i915_hdcp_gsc.h
 create mode 100644 drivers/gpu/drm/i915/i915_panic.c
 create mode 100644 drivers/gpu/drm/i915/i915_panic.h
 delete mode 100644 drivers/gpu/drm/i915/soc/intel_gmch.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gt/intel_gt_types.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_active.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_active_types.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_irq.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_vgpu.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/soc/intel_dram.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/soc/intel_gmch.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/soc/intel_rom.h
 delete mode 100644 drivers/gpu/drm/xe/display/ext/i915_irq.c
 delete mode 100644 drivers/gpu/drm/xe/display/xe_display_misc.c
 create mode 100644 drivers/gpu/drm/xe/display/xe_hdcp_gsc.h
 create mode 100644 drivers/gpu/drm/xe/display/xe_panic.h
 create mode 100644 drivers/gpu/drm/xe/display/xe_stolen.h
