Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A77C931D7C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 01:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1956010E312;
	Mon, 15 Jul 2024 23:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KDwl+gw5";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C8E10E0E1;
 Mon, 15 Jul 2024 23:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721084862; x=1752620862;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q7LZiZuhepNSJ/fGTjYnBMYn54UbhuxC59UPvjDyB6M=;
 b=KDwl+gw5yTM5EBPSoYRZmM1m24eDsZUgl00R+yxqYPRQj9/FsXUoJYG1
 L9okggGc5los7GKVOFEph9MEGM+CadbR3vCUCWiO016k2Za2+ygNmfyyd
 lNh/Bgs1FpxrDgGVQrtyHywh7IqguOCWg/slFGGcXd6KLGgiMPQ8af3F3
 013Exb/uIoiRb86o3xJK+GAxYtJVXmx4MbkXshMPIUjXXIW85985FyAkq
 Zmcuwap0bb5e2Zi9Nrt1nK4SEbvVLSKHzC27gCA6hSnuw19VyH8aIOSFl
 W0CHe/vkxDvnH4vMD8FHDv9zdxiULN2fKLA6jsVcmjRnSx+UQq15wVcYk w==;
X-CSE-ConnectionGUID: gsOK1nxsTvSSWk3/M5hoVQ==
X-CSE-MsgGUID: AJvHLhw0QXWJzmM6mvZ0tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="29641916"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="29641916"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 16:07:41 -0700
X-CSE-ConnectionGUID: 0dR8U8o5Q+eQP0YPH1DCLQ==
X-CSE-MsgGUID: DeSGtd2GSwmAgmItlkJ+bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="87283761"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jul 2024 16:07:42 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 16:07:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 16:07:41 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 16:07:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDo3F7puN/ZGZ95kTA1/sBibc3L5WZ1bgmQ52yNwzAVs5zlth35Mqx5PsB2cpDD/T4g0YPpWJGok9tFJPbzbIMMk1VJZ762LaQyptd+ivaK1yKGrYlTJd+NM6ucI/xWHjqNLN5tuB+RtSyuI5bH5Gfk9F7Hj9joYTQJNnNFBMlsJW/ZxTtabpY4HukHPk5qTGXZpmfnE4abSBKjsc8blHRA5SzY0ggR0VMg/B/3umTY+DyDo4hlAp/y/3dvhuBDaZXpfmzZ/+/+nSeY6mQiW6366VqT0uqlGf2WPpo65rhm26kCYhjN8Zb7j+i8aScNHxwULGR+sAJkVDkR5yiJ1pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1ga4BXv+hJ++suOytMQrkyypqknnIS0jhLPS1CoUXo=;
 b=J1aurioLTI0tj4zAAIo8bhEWO7zX/d3HL4I3jBu1CqYzIWHyASO0PKlZqx6+SrmrDiN2GwG6uk0l22pEElaDipoIXuU12Oewln7acAPa4IZflXXYeSC2swhcpRexL2pAK/J+7rxr5Mjvl22D1ha4CMi/cRFo+t4SkbfD1bgmgDlM93c/vlnv25GhkcCwID1UAh4MdDb8x/UQhHxo8X1GzQbYhxR3PQ3PnWn1y3y17WIu5t16geBV8LfhPPWKwWbs+sD62Vs/ehJMTJb7BLjktMeH56qDxsWzxaN8ePs1RZ2gIw4A3Kqpz3zKRfnsP5MpC6WScqXM8gD5lA+3siBIeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH0PR11MB4837.namprd11.prod.outlook.com (2603:10b6:510:41::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Mon, 15 Jul
 2024 23:07:38 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 23:07:38 +0000
Message-ID: <83f04a12-4bd0-428f-a07b-cc9e2861b5e2@intel.com>
Date: Mon, 15 Jul 2024 16:07:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/i915/arl: Enable Wa_14019159160 for ARL
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
CC: <DRI-Devel@Lists.FreeDesktop.Org>
References: <20240622004636.662081-1-John.C.Harrison@Intel.com>
 <20240622004636.662081-2-John.C.Harrison@Intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20240622004636.662081-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0021.namprd10.prod.outlook.com
 (2603:10b6:a03:255::26) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH0PR11MB4837:EE_
X-MS-Office365-Filtering-Correlation-Id: 58a9527a-e9a7-4c5f-65c5-08dca522ebf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzdZR1dZMERuMyszRUdnTDZPOUxCeU85OHR4ZUNuTC8xYnpQcVpHckZvVWls?=
 =?utf-8?B?SG80WEhPUXQ3bk9GWTVjcW5nSGlpTWl6WXE4YUJQTExyb0gvdXJiSmVMekpJ?=
 =?utf-8?B?RFVvL3NHbVl5STQ2VWU4WHd6QzcvYTdOcW5oNDFJNEovTk5CVnRVeU0xRFVw?=
 =?utf-8?B?c2ZsSklrQkhKRU5wVUxUUXZMR1A4dUt2RjlDeHoybjQvSXRjQWJHbUpYNG9D?=
 =?utf-8?B?aGd4MDRYZ1p4dWZWWGF3NkU5TnFTSmVmNlNybE9MeWsreWd0T3NsN3pwTVpF?=
 =?utf-8?B?aU8xOE5haTlaSUhBc2wwR2RKbi9JZDBVMnp1SW5KUGozZlZZUDZleXRET1ZP?=
 =?utf-8?B?UDhFSlNlc2k4YVp4RVU3RzdXR1BhT2oyZFAwcCtKUm14OWxkaEsxejhmMkp3?=
 =?utf-8?B?NWN5MlBQc2U1d3JwdjhRV29JMGtqV2NwRWZaR0ZTZEIwSS9iYW0rVEZ2TEdN?=
 =?utf-8?B?a1djc3VHZnBZRDFnVTkyOFhHQytpNGpkaTNUQ1ZSWlAvOUJaT1l6R29zdFZy?=
 =?utf-8?B?T1Q4QmNTU1pqQ3lJVkN6ODF4NmdMeTBGcjBTK29VNkc3SzV5ekp2T2dITE9z?=
 =?utf-8?B?MC9ZVHoyMU5qdk94QTlFa2pBdzdNRitjNTFyR0wyS2ZIY1B2aGU4M0RBYXVz?=
 =?utf-8?B?SStET3lIT0UvZGRFaFdiNiswVDl5UGhSZ2JoREF2eHBudzBFbnREa0RiQng5?=
 =?utf-8?B?UFhIZlFRa2dXbTR2L0g4SHM2bk12MWw1WmtjcWdSbTZuZ3M5NHhSMjVTMTZj?=
 =?utf-8?B?T3hpNGp6Y2JBeEU2Mm5vYVkwZzN0OXNhT0ZWdjR6SFk1M0xCUkMyUWZNOTVS?=
 =?utf-8?B?c1d2dnRtcHVOdERsNGVFM0dUc2VMTTFtbFZRc1A0TUtieUhGRTlRQWZVMmFF?=
 =?utf-8?B?U0xZaUZXVDVLWFlYa0ZZM25LR21GMTAxWThMR2E5SVlvUXdhZUhPN2piN3Fy?=
 =?utf-8?B?dHkyQldjMDRZNHdFaGllK3dIRlA2TnZCeDFHd0lXbW9Fekx3QkhJMWdNbnJ3?=
 =?utf-8?B?bjhBRUtMdWtob0Q4L1VCTFpzSXU4TzIveHA5bDhoakZwMGgxVHQ3TjdOb3Zi?=
 =?utf-8?B?MXZpVWx6dWxoMS9vT1RrdW56SkZYZDRaTGFJTkxvL3NkWXJVdDIvdnhGd0xT?=
 =?utf-8?B?aWtHVzg4ZGdVT2UzUGRHK2tLNUR2d2E4djJXOTUxMG1hOFE5NHZleklzN011?=
 =?utf-8?B?UmwwSzdZQTV5aEVMNDRLd0FENjhPbmRES1NMYTUvZDRpY3NVNkVEMWp1dTlP?=
 =?utf-8?B?b0tPVWNWd0RzdjdrNTZqUHdGVXdSTmpKYWtMTklnMEJtVy9WcSszT3B2Vi9P?=
 =?utf-8?B?aktjem5Fa0x2eDkwY0pGMmVRSHNqQzhwaHJDdnJFWm4rUjdaS1hHdGdhSUto?=
 =?utf-8?B?eW95TWFjUjdtOEs0V0IrM0twaE1xOVRDY3FETmpSNXdLUnVuZy9JdE5VZy8r?=
 =?utf-8?B?S2Vtb1VJLzFZMnAyZXBaUXlrUUpnQlRIMzV6YllMbmNtZHV0UkxNcFhLOTJY?=
 =?utf-8?B?TUtBUXlyWDZIeHRRajdBL0dPRjRsM2N1V05SRTFEeUdrbi9Ba0MxKzhVeE05?=
 =?utf-8?B?Rmt0bTZLSmF5clVER1huUi9WT3Q1a1ExVytWNE9WYlIwNW9Ub0Ywak1rTXlh?=
 =?utf-8?B?K0lxSFg0R2NOWW83QXE2Lzc4RmZqSlBpamxKVjNXenRPSUFBYjl5aml2cTMx?=
 =?utf-8?B?VW1FSVAreGxnTk82ZklydHlOb2U3S0pnN05CNjh4NlQzdm5kam1GblJZMExP?=
 =?utf-8?B?ME9rdm5KS20xOWN1ejVoTzBDYktXd3pkbGVrWktpRnZYM2d2K05GRTM3d0Rl?=
 =?utf-8?B?M3R3SnJPUkxqMUlFMUV3dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWZwL3hEOTgwQnRxT1JERjdtUjJ6R2RqenVWazJXbzRrRkN1Ni9RSDlOQXY2?=
 =?utf-8?B?Q0pKSTBRUjEwQSt2YXlidjV6YVJQeHdTOTViYmdQaFhwY3BjT3poMHNsQXFQ?=
 =?utf-8?B?bDdsM2ltMS9PVEZ5UmFIdmJZNjRkTmZTRFJnRjdMWS9aZFJISFFOd1kzWXlz?=
 =?utf-8?B?TmcwYXV1QlBZVHEzK1ZBRC9QeDJMUmxQclMvckpURmFqcFRkZng1YytZYjQ1?=
 =?utf-8?B?TGFielVyZVQ1NHVqV2lOcWxlY2lEWTFORDJJVW9ieHkwNjlJSEVwQy9iR0ZT?=
 =?utf-8?B?WSt3SGFjS2VzaTlIb2hYcDlpTEZ5NlBPdFZaMytmaUoyQzQ5OHVFSjZIenIv?=
 =?utf-8?B?b1d3OS9VeTdNd21OcFUvU0ZNQVFBTnlFSnRXM2dHZDdRd3c2MXorTFY0K2d1?=
 =?utf-8?B?T2ZLdUdMZUdxQzdRSDM3Zm1ueXZ1YlJpTTdNcWtoUjMzYWFOdWt3ZFk4U3Iy?=
 =?utf-8?B?UWE3alRveWcrdVRGU3RkdDkxYnVKZkhqeUgrSVplTkVCWlVQc25SSjlVaFlL?=
 =?utf-8?B?UXZ5cGZ1VkNLQmcyc2VTaGtJRU1mR0J1Z0xJWnhBVFFlTjBSNWI0VkFBTldr?=
 =?utf-8?B?a2JJRG4wRm9jR1dtUms3Rlp3d2oxY25rbWVNLzB4VG5ZWUlTM3hIS3hld3g2?=
 =?utf-8?B?Q1ZFUDhzMjhJbjE2VDZ3U2xuVjU0S1JrTDBhVEpiNy9paGtTR1hjSmU5NUVv?=
 =?utf-8?B?Z21uY0Ezamw3U2w4Sm44aEtXdHFRN1RaTVdDWFpDbExiM2NEMHR6QWs1RU5L?=
 =?utf-8?B?QUY5aFlTZVhmS2toaGlIOXNiVFBnQXdWaWRyUGkwWGNwM3c1Zm5ucUJzejBx?=
 =?utf-8?B?a2p1MEFld3BiMHNVS1E3S0o5Y2FIR3J3cmluMGJsQW5QODU2ZytvUk02VkFy?=
 =?utf-8?B?VzJMZU1zb2dUb25WcktBQzJ6dlpWblhRbVdDVnpuZWl1bUVFQXZzS3htSWUz?=
 =?utf-8?B?aVFZMUJpeHA3NHI0ZXRkQ1R0a1VPbnR0ZHE4M0pFTlJDWUg3d1BBV0tvNjUw?=
 =?utf-8?B?eEJOVmJmb3RFTjJtby9LOE4wYmhLUERLMVQyL0I4NXBldU0rbDF5cXA3cnIx?=
 =?utf-8?B?RnJWcnJrVkJDOVpTdzFPUS95OStlTXg3TkgvVk03SDRxN1kvdCt2U1B4S0xq?=
 =?utf-8?B?ZkE2ODVKbGpsQm5JcmZoSHp6d0tNZnZnbFRNWUk3QThVNDJnb2F0SUJwU1VS?=
 =?utf-8?B?RkFvMEVYQTlISTl3dXp5R0tuenlaMGltRFl5eUg2cEJiSWtkR1c4SjQ1eWpD?=
 =?utf-8?B?NmtKQStzZGNzTXlTaFdXU1RMdVY4RmZiUGx4dXA2MTJuRmZaK1hKYmhZQXNz?=
 =?utf-8?B?NDdvTEpPc0lmSGhlbnh0OVRUbDl0Tk9mU0JIZW1ZMm9GUkZpd3RKN3I0bE5K?=
 =?utf-8?B?UkZZNnVzamFOVmtWeC9ZOFFvMFdUYmw5WWJpZ09VQTUzWDE3S3kwZldIK3hw?=
 =?utf-8?B?bUVvY1NpQUhTWmNqRE9CK1A3UmhMdm43dTVvbzhBY0R3L2k2RVNVb1pSTlJN?=
 =?utf-8?B?VkRrUWRRZXFKQlNWSlFVMzF6ejc0aGNTK1VxUUxNZ0prUEVhZ1UzN0RDdHd2?=
 =?utf-8?B?Uk4ybjR0OUVQSTBmNWdNc1VrR0V4bFVMQ3dnZXlON2Ewd3kwZ1RrczNIbTh3?=
 =?utf-8?B?Q2tTZEY5NCt5TTR4SUVJYU5kTUhuR3hBOWZXSVJ1UVZlSWdHckJRWWtTVjFM?=
 =?utf-8?B?VjZ2ajk0UkhHSStVOVg2bFJENkhEYyt0N2VHYWF4K1FsdUZQSnhoYTBETFor?=
 =?utf-8?B?STl1WllrU1RsVi9JU2RvTFprSEpDOEF1NzdGekw1Q2dFK1R2YnpmK3RrRHFm?=
 =?utf-8?B?MzAreUVKYnMyckRRaXVVV3UvZ1VUZUF6ZVB0NFRkbzFON0VmNmZxK0tJdEEy?=
 =?utf-8?B?bWNpZHl1cDhYLzllVlViQ1JJa1pEakYxamRrSVh0TTlYbnlMdWUwZXJnOGpO?=
 =?utf-8?B?eTVpaUJiWEdZRnQ2VW5USmRwdXFUWTRwSk90Y0lYWjFnVkE0YjVFclcwdHlv?=
 =?utf-8?B?b1A3RXowZlJFYUFFV0NKZmFhbGFpa2ZMNkoxWUJkektxaG14dDAvUGZJUVZC?=
 =?utf-8?B?UDNLbHZoUHpTUWpGSHFpd2RNbnp0Uys1VmVoVFozT0FRUkE5QTZrQzduOUxU?=
 =?utf-8?B?VjVhbGtuS1V4WXBtNzZRN0c4SFZWRTdlRzFUTW1IRXpDZXdrWFRXalNKRzBj?=
 =?utf-8?B?aXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a9527a-e9a7-4c5f-65c5-08dca522ebf6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 23:07:38.7443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1Xfn29VCiihfT6qY/Epk4MgzsbIrQFezrX+RCJh0Z7QM2pC+UJY2hGo2EYzBh1dz+O0/kaWRhuEJh5K5m3a3w05P4nme0zZ/U8b6v01C78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4837
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


On 6/21/2024 5:46 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The context switch out workaround also applies to ARL.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c     | 2 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 5e60a34692af8..097fc6bd1285e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -296,7 +296,7 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
>   
>   	/* Wa_16019325821 */
>   	/* Wa_14019159160 */
> -	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)))
> +	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 74)))
>   		flags |= GUC_WA_RCS_CCS_SWITCHOUT;
>   
>   	/*
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 7995f059f30df..f1fe5f9054538 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -850,7 +850,7 @@ static void guc_waklv_init(struct intel_guc *guc)
>   	remain = guc_ads_waklv_size(guc);
>   
>   	/* Wa_14019159160 */
> -	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)))
> +	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 74)))
>   		guc_waklv_enable_simple(guc,
>   					GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE,
>   					&offset, &remain);
