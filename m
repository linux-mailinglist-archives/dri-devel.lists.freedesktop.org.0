Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABC8C68511
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7EC10E45A;
	Tue, 18 Nov 2025 08:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GhK38vPw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293E210E456;
 Tue, 18 Nov 2025 08:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763455995; x=1794991995;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k7bQUTzzt8I5ThpLqsLB5nw5qPrL1TJHKfWn8DWtyq0=;
 b=GhK38vPwVxQkTNuViIHkIYm4+ld6m5AtgsBx60iaRIh5mcv2b959F+Mb
 G7yyNO0mgELQVPdOSuZjZOJeG7m/Ijrkbd+3aIuJSWaej7+0Lj3tHptVW
 /3PQD9Ew8qR/+92uTbZOc0v9Cs9eqi0FF0YP4r3nrQv4yCh3U04vU3x8E
 KURjhlbWaeFhADGzhClc1Tna9DfVNFSYsPkkC2Q5JCn8Ul9lr8/ZVwLvq
 NeoBTpWEy9hrIQyUmc3ANitWPV3J/fPh/d6mpnGsPdegE0XkEWcmkK5OG
 WJhs/gmiFTqMHxhfVgiLqMUdfGT72ddIVmM/mlfr7kQrF6f9CFbtzBhgd g==;
X-CSE-ConnectionGUID: B5VASlEKT+2lqO6USwZjVA==
X-CSE-MsgGUID: G7f0OURGQ8O/Jt6L28TVTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76147137"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="76147137"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:53:07 -0800
X-CSE-ConnectionGUID: 5caxbprBRM6U/YcpwQhh/w==
X-CSE-MsgGUID: zWoTKYWBQfWdMkJh+5CPLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190495020"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:53:06 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 00:53:06 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 00:53:06 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 00:53:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHHpcvFJebRA22UkakDXu7wsmYj+FBoW0whYTCGMGFBaU2X2Kc0LTownMSPy4LPEQYvttrGE1FGbuPnZrKCRQf9diLeWtRtQMUnOAYesXPWgy0FIDhh+tCe6AWrBP81Ft7EeC3BhOdJ5GWBOmMNwmZw4k0KJjx38m7gx6mVxonLJQTCSuxI+0jsXPkLfQVfn0001tEtQSHsRNFJq/ipvULchMWTivBOL5OcZdx6d/1n/yyHUpRR6LWrDF4FVy54X+iUR0cRc3hfS3mWOuX09mdGHd47YsMpDM5mmQy/QsrC1j/xfZ1wwKHkWf57mTQrv6ZlcICvx8g0MGFYXEC7bow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srvj7lZy0/C2Gqvy4gnFiV/UkLyPN8asHRqR1XVF9UM=;
 b=OCnFRXMI9CWTB+TL53qmAqqigWQdDaKha2SKxUazuPpsuAWpOF2JDCwolS/WLMr4HHWo+21dEodRxR/K2vvPBiLDfnSRedfsb15r/R2f1BS2qUTqOInw838UYEiI/X+liKmfz+6sgBrWPSLn33USDylRN61cxQVhlkBiSYYf6HU3R5CXFrRJ8gpPBsv+smfTYaUYG6V2RD/4Hv6vEanu2BbtI9hUUGdgOPOBvT+ABBLymHUXMtAekp0soWEb/PRVpqKX8e010eVoaSOpkpMaUQRv0qkAa26dwEWPNfLM2AqLCNE+Q4h3T0GuR84TYpugCoqDeSr9oQdgc31kY0T8uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6141.namprd11.prod.outlook.com (2603:10b6:8:b3::13) by
 PH7PR11MB8034.namprd11.prod.outlook.com (2603:10b6:510:247::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 08:53:03 +0000
Received: from DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::31fd:4de2:2775:396f]) by DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::31fd:4de2:2775:396f%5]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 08:53:03 +0000
Message-ID: <4c7a4163-9df8-4cb7-af9b-1a7f97bd9690@intel.com>
Date: Tue, 18 Nov 2025 14:22:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 06/16] drm/i915/color: Add framework to program CSC
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Shankar, Uma"
 <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
References: <20251105123413.2671075-1-uma.shankar@intel.com>
 <20251105123413.2671075-7-uma.shankar@intel.com>
 <DM3PPF208195D8DD135EB18FD08B152D983E3D6A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <DM3PPF208195D8DD135EB18FD08B152D983E3D6A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0180.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::12) To DM4PR11MB6141.namprd11.prod.outlook.com
 (2603:10b6:8:b3::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6141:EE_|PH7PR11MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d7893e7-4501-4288-e4ea-08de267fe206
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXA5T0tEZHh4NmNsaG5sM203bG9DUFRYRTh4ZXlqKzdqWGk5bFVYc3VaVllG?=
 =?utf-8?B?cW9kR1RnbmwyRW1kVnhYNWZXbFdrdE1oenVleURkeHVRYUZWSG5FWEFsS2Qv?=
 =?utf-8?B?NDFYeWU0a1dWaHEya2UwQmk5OEgzSnBFYTNWRDlSSGdWRm00NVV0dk12QzhD?=
 =?utf-8?B?eTZEMGJjT1ZabDZpYjZJMjA5YmU2S2V0bzNxc3Rwd1Bxd3JFZGpERzhvcE9Y?=
 =?utf-8?B?MTFEdHUrOEdHeHc1ZTVjZTRhd2FwSnJVeFhJL0FnZWxkWmFZZzJMOU9TaVp5?=
 =?utf-8?B?Z1I4K09PMFZ2ZGNrNGZUbERReHVJckxiQVh1NkhjZ0FwOWhJMnJPaVBNa2w4?=
 =?utf-8?B?UDdqaUJaTFAwUFhUbG14SEttOGsxNHZsZCtHTnp4eUtQTE5WUEVkcnE4Mnpo?=
 =?utf-8?B?anNSVTBzVmFIWGpQN1BnbFdTSXE0ZDZyeFE2KzhKTk5FZlJWTjY5RXFvOVMx?=
 =?utf-8?B?Q1Q5M1BHOWR5ZkIxWjI1REl1T2RaeEV4ekJiQTJQSHpYdXdsUFZRYzB0d2I2?=
 =?utf-8?B?WmVPaEdwcHA1K2tRZlB6NlcvQjVPVW5VUUsrOXluVnJaaGJnTHc2cHludG9X?=
 =?utf-8?B?KzVoQUFVSFp5cXdIRDBFQ3hVZUk5ek43Y3l5ZXR4TDl2ZWs0enFhdG1ra214?=
 =?utf-8?B?OXh3T3BpYjVtMjBjekRrdGtkQnNOMkFZNkIxNllibDJVYTZ4QlFLdjlvUll1?=
 =?utf-8?B?aThicUVTWHZLa3pWSjkxd1VFZHBYMi9nMlRNdkZCalBhK2s3Qmg2NUdzQmRO?=
 =?utf-8?B?Q1N3Z0NDbG9OcFJCQnJ6NmJ1ZlNvMVl6bjBDbE1LZDZQN2ZwSGNJR1dWbDFC?=
 =?utf-8?B?d3hheEpRYmM1dS9IdXp2VnFuZXBpVm9seklZV3cyT2dadlR0dGp2QmZSWjU5?=
 =?utf-8?B?RHREZnZ4d2pJRmRDU01RaTFkblpYRFQ4dHRwZTYyeWprWXhKRkM1dFMyTlVu?=
 =?utf-8?B?NzJlUGNtZlNqQ3AvTmQxWHJkMWt2UitmR2d4N3RSdU9veitVV1pXUHduTnE3?=
 =?utf-8?B?N29ST1lob2orV3FIaUhCdUFyaWFGNnhKUnp5UWU2M01SZzhUWTBMVlRDQVBu?=
 =?utf-8?B?cE01YnBQNHR3c0ZJSFByT2NrcGpZemZpZi9XcjVROU0wUmg2U0MrTlA0ZThy?=
 =?utf-8?B?Sm9BVG9mWU1BaFZpWHRMZHptTTY2YkplNHBZT0p6R25pV2NTQUZiRHR4ZUQ5?=
 =?utf-8?B?SHZhbFBxRklzdVBPMmVxeE8vYkk3cTZqWS9NS2VOOTFDdXYwakpCVTc4R3Zp?=
 =?utf-8?B?bTNRSDhJbGZOaHEyOXZFemlJVko0ZlBCcFhaTnVwTStTeGpTMzhHbzZMd2tG?=
 =?utf-8?B?ZjVubEMxcE11SHFXMVBURHIwSGxGcnRUQTRQSjRyaFhRcWpIVWxQOTd3RTA3?=
 =?utf-8?B?dG5BNGo4cWxMSE9BQ2JwUCtFWWkxSVV4Y0ZxT29sOXhSaitjc2dIbVhOWU9S?=
 =?utf-8?B?VkZVRE9xV2FyTUY3dGlQOGlWdlpkMmYwcU1yMzZSTXgrL3Bjai9DSGxLQ3V0?=
 =?utf-8?B?d1JUR1JGQ0hjZmdodk9LcEV6dmRpWWZ1SVB3YXNncVNWQWVFdzl0bWEzUGEx?=
 =?utf-8?B?SVNHR1BtcGhDaHRQN1ArVnVEVEdMbHFXNlIwN1FLb2hyMnlyTVc2cy9CbE9z?=
 =?utf-8?B?aThhbjVWQ3BLYU1GaVlnT3ZMKy90S3AvbTZmU1Y5VGxJa1BPMk9zRVFGRkd2?=
 =?utf-8?B?QzZRS2l2SWh3aXNoam5PZnEyczNOc1MyS1lvbm13N1Z6aXRZVlFQNHpTQm5m?=
 =?utf-8?B?MmM4djkzb3ZKYU1oQWorNkY4ZUN4WWNGL3NLVmlvcnpmYUV6ZVoyYlB0Y3hx?=
 =?utf-8?B?KzZIV1Qvd3N0NlY2RFI5eTA4cGtDNFFUYWVhZlZPRk9lNmVXdGRsMFdZcE9L?=
 =?utf-8?B?eDV0RmdZREg5ckVVRUpvaTJBU2pONFJHRldxdnBHUHcwQkY4eE5COS9odGJj?=
 =?utf-8?Q?rPBFAgZC0pKh+5pRG3YglgR2u3maO4VL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6141.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajlKMUIvcjNaeTVUMDRKOFBuS0c5VTEvcEMwL3QwdXBSSlBnVEFiQjRDdEdp?=
 =?utf-8?B?YXFnZUxoWUV0L3AwSlM3aEVPdjdDL3RUbEtHU3RGcFN2N2grQ0ZDTVdZMWpK?=
 =?utf-8?B?TW4yZnp5bS9hNkl2YWpRL0hESFlSc01hSzJkNytGbHoydmxtQ2M5R0E2Q0dy?=
 =?utf-8?B?S2d1NGJ2SFZ3S2ZvSFltYVZZZDJEQitOY2NQeTdkNWNSVi9EUGZpYkN6MnVy?=
 =?utf-8?B?U0JCUURzRGd1UGRLVTJLNjJaNlZwMkQwaEVvNmJsNkJxQ09SL3V6RWFRbGlR?=
 =?utf-8?B?WXNYUWFXR1Z2Zi9sQml3S1FDUW9oSnhlSnZvVmlyZjRZZFArUVVOb00vR2Vq?=
 =?utf-8?B?RGl1UmM2Y0tmNmpUVzBLTVlHaFdvRDlReWFLc3l6YXREdStqSmQ4YUpiV0ZY?=
 =?utf-8?B?ZzJmV2c2TkdsaFA2RWlCY2t2cmdaZ3lsMk1maktqZVZOSFcrN0ptSXREbFd2?=
 =?utf-8?B?WkwvbEFwVHM1R2ZrcFk5ZnMzSlEwREZsQ0pkWUxDRDE1RUk5OUVFZ3g0dEZU?=
 =?utf-8?B?K0xvN3FxbDI0VnFtVXN4NFEwS2JiYkdLa2dTUGxlSGJoN2xZRE5SMmpkMzVS?=
 =?utf-8?B?OHpmRE84OGNyWGtHNWpZaCtBVFVZOHZTYjZmZGRmcFBDUjNRUDdDcjVzVTdF?=
 =?utf-8?B?SnU1UTJNV1RscjYyK1hMK0RZY1VTUkRxa1ZmMitUdmkzN2tyRXFyZkVkeU9W?=
 =?utf-8?B?M1RKc0tGdzZ5RU9ZZUEvdEpXVlY1WWNOeWV1MDVqR2FOQWkrUFJmaWRqRkZy?=
 =?utf-8?B?amsrR04vZWR0elBld283YjhESk9JVEZpMHplMjFXeEpHNU9ZWlVrckQvZzgy?=
 =?utf-8?B?dTdCNE42eWp4MVZrV1lFbUFjVWRBWjVOZVFTSWtIc2JCN3huNTZLNHJhK2U0?=
 =?utf-8?B?U3hicEVGelNONmNiWTNZRnRsUk9IbDVGbmM0WHEwVTZlY2R4R0c2Y0E0ck1l?=
 =?utf-8?B?Vys1Yjg0OGE4OUdNREpxbzFlR1NTcENoc0l4cEdVaEs4ZHFNRGZKV0FxcDJz?=
 =?utf-8?B?alI2VGVNSDBLNG9rM3A0b2I4N1M1MHNmR2hXWVJ5VWtSRzF5T2M2RjZOdFBP?=
 =?utf-8?B?L3RzUGNmbGJiUlRJd2dJOFdYSnNFZHJobDZUenJwemd2MXpkcXdreU1nVGR4?=
 =?utf-8?B?RHZlWWhhTE10VFIzanNJeCtCRTZPem0rRjZBbmdzRU04bHRpcVFFd29yTDFC?=
 =?utf-8?B?MGh4T2hVYWRjcVJnRFFyOVlEZ3JGWGpoMVV0WDJ4T25aREwybTZZMEFzNzZS?=
 =?utf-8?B?UU40S2dZZkg5SzlRelF4c3ljVU1XaGY3ckl2VjRNczJXL00vblpUZlNOTUo5?=
 =?utf-8?B?RHhDUGl5L3JtTHdPcDM0THRFNjY1RTd6VTlYNmVnOUxHeUdPMFVuVkxHZERT?=
 =?utf-8?B?Snh1emRiaDNPU0FSamo5UzAwcFZoTEdYQWkzdG5pbDd0bzVCbVh2NitwN2gv?=
 =?utf-8?B?YysyMHppRUIwNXdyY21IZFgwMmdJeXJ6a3B1Tm02MTJnSU1VM3ZzT0lBY0E1?=
 =?utf-8?B?Qm1vQW8zUlUvbjl5Y09YaHZ6RllxYWNicHlzZjZVQmNaMnJjZlFJTjlLWW5N?=
 =?utf-8?B?cDAxQnBPNzdFY09kVU1zdjhtVlYvamprQUNOcVBsQmRTNEhkNTNWbVZUWFo4?=
 =?utf-8?B?RVpyOFo4d0JYZkNhZ0Z3am1uWi83a2V1UzBOSVVTOWIwRDZKemxvSHpNc21n?=
 =?utf-8?B?VkxGTzdXMnJnVVM5Y3A1bVgycm5CdDAvY2c2L0lpTWNFQ3hEaDJWaWJqcWNK?=
 =?utf-8?B?ZFU0WE4yYzg1QVlhZUVZK2JaOC9yNnVpamU2OU43dlJZcXhRbWppU0N0SlU0?=
 =?utf-8?B?VVlzMnJwbVQ0YnBxSUlxbWFpWU5lMk4wUjBGNWM1bHdBTzlIVDRTZG5NZUdk?=
 =?utf-8?B?d2dnZHp0Z0pWQnlEUUxHSjVDcEpVbWRoRldLU2xmclJOSXIwbzhJU1F1MXE3?=
 =?utf-8?B?M2ZiR2lqMkhMTnl3VnZ2VEJEQjI3SGZJZXArOWVuMFNLM0RpOTkvNVpsdkxq?=
 =?utf-8?B?R1cwM2I0SHB1V2xKRW9odUtXS2dKWHkyK3N6WjV5N3duTjA1OGRrVURzN0lv?=
 =?utf-8?B?MHpUQ0k1Z2lqNUdhZ2ZZNS9OUXBWYVpQbjZiK0dhV0t1TjlwMU1Gclh1Mkp1?=
 =?utf-8?B?Zkp4TnhBdkc1a2NPdnMyWTdsSFhaUkMyUVdsWTZoSzhkR1ZhYUI5R2lJQ2xa?=
 =?utf-8?Q?+kZL5hTRFnQOqbS+ZQFAGeI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d7893e7-4501-4288-e4ea-08de267fe206
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6141.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 08:53:03.1585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qEJUdlxcP5VpAlWBypGxX1NgiqZvMtCMwCIIGIFbAN1rUN7NxtWTYr8i4kVuUg4Eubu6+3fYJth6yB2WfqYGWgqhsdXaOaffXy1maluz2ww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8034
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



On 11/18/2025 1:54 PM, Kandpal, Suraj wrote:
>> Subject: [v6 06/16] drm/i915/color: Add framework to program CSC
>>
>> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>
>> Add framework to program CSC. It enables copying of matrix from uapi to intel
> 
> *UAPI
> 
>> plane state. Also adding helper functions which will eventually program values
> 
> *add
> 

Ack.

>> to hardware.
>>
>> Add a crtc state variable to track plane color change.
>>
>> v2:
>> - Add crtc_state->plane_color_changed
>> - Improve comments (Suraj)
>> - s/intel_plane_*_color/intel_plane_color_* (Suraj)
>>
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_color.c    | 21 ++++++++
>>   drivers/gpu/drm/i915/display/intel_color.h    |  4 +-
>>   .../drm/i915/display/intel_display_types.h    |  4 ++
>>   drivers/gpu/drm/i915/display/intel_plane.c    | 49 +++++++++++++++++++
>>   4 files changed, 77 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
>> b/drivers/gpu/drm/i915/display/intel_color.c
>> index 1e97020e7304..a45d348c9851 100644
>> --- a/drivers/gpu/drm/i915/display/intel_color.c
>> +++ b/drivers/gpu/drm/i915/display/intel_color.c
>> @@ -87,6 +87,10 @@ struct intel_color_funcs {
>>   	 * Read config other than LUTs and CSCs, before them. Optional.
>>   	 */
>>   	void (*get_config)(struct intel_crtc_state *crtc_state);
>> +
>> +	/* Plane CSC*/
>> +	void (*load_plane_csc_matrix)(struct intel_dsb *dsb,
>> +				      const struct intel_plane_state
>> *plane_state);
>>   };
>>
>>   #define CTM_COEFF_SIGN	(1ULL << 63)
>> @@ -3962,6 +3966,23 @@ static const struct intel_color_funcs
>> ilk_color_funcs = {
>>   	.get_config = ilk_get_config,
>>   };
>>
>> +static void
>> +intel_color_load_plane_csc_matrix(struct intel_dsb *dsb,
>> +				  const struct intel_plane_state *plane_state)
>> {
>> +	struct intel_display *display = to_intel_display(plane_state);
>> +
>> +	if (display->funcs.color->load_plane_csc_matrix)
>> +		display->funcs.color->load_plane_csc_matrix(dsb,
>> plane_state); }
>> +
>> +void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
>> +					const struct intel_plane_state
>> *plane_state) {
>> +	if (plane_state->hw.ctm)
>> +		intel_color_load_plane_csc_matrix(dsb, plane_state); }
>> +
>>   void intel_color_crtc_init(struct intel_crtc *crtc)  {
>>   	struct intel_display *display = to_intel_display(crtc); diff --git
>> a/drivers/gpu/drm/i915/display/intel_color.h
>> b/drivers/gpu/drm/i915/display/intel_color.h
>> index bf7a12ce9df0..8051c827a1d8 100644
>> --- a/drivers/gpu/drm/i915/display/intel_color.h
>> +++ b/drivers/gpu/drm/i915/display/intel_color.h
>> @@ -13,6 +13,7 @@ struct intel_crtc_state;  struct intel_crtc;  struct
>> intel_display;  struct intel_dsb;
>> +struct intel_plane_state;
>>   struct drm_property_blob;
>>
>>   void intel_color_init_hooks(struct intel_display *display); @@ -40,5 +41,6
>> @@ bool intel_color_lut_equal(const struct intel_crtc_state *crtc_state,
>>   			   const struct drm_property_blob *blob2,
>>   			   bool is_pre_csc_lut);
>>   void intel_color_assert_luts(const struct intel_crtc_state *crtc_state);
>> -
>> +void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
>> +					const struct intel_plane_state
>> *plane_state);
>>   #endif /* __INTEL_COLOR_H__ */
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
>> b/drivers/gpu/drm/i915/display/intel_display_types.h
>> index fa39f3236597..d25f90ded71f 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>> @@ -646,6 +646,7 @@ struct intel_plane_state {
>>   		enum drm_color_encoding color_encoding;
>>   		enum drm_color_range color_range;
>>   		enum drm_scaling_filter scaling_filter;
>> +		struct drm_property_blob *ctm;
>>   	} hw;
>>
>>   	struct i915_vma *ggtt_vma;
>> @@ -1392,6 +1393,9 @@ struct intel_crtc_state {
>>   		u8 silence_period_sym_clocks;
>>   		u8 lfps_half_cycle_num_of_syms;
>>   	} alpm_state;
>> +
>> +	/* to track changes in plane color blocks */
>> +	bool plane_color_changed;
>>   };
>>
>>   enum intel_pipe_crc_source {
>> diff --git a/drivers/gpu/drm/i915/display/intel_plane.c
>> b/drivers/gpu/drm/i915/display/intel_plane.c
>> index 505c776c0585..a5d0f95a6f10 100644
>> --- a/drivers/gpu/drm/i915/display/intel_plane.c
>> +++ b/drivers/gpu/drm/i915/display/intel_plane.c
>> @@ -49,6 +49,7 @@
>>   #include "i9xx_plane_regs.h"
>>   #include "intel_cdclk.h"
>>   #include "intel_cursor.h"
>> +#include "intel_colorop.h"
>>   #include "intel_display_rps.h"
>>   #include "intel_display_trace.h"
>>   #include "intel_display_types.h"
>> @@ -336,6 +337,52 @@ intel_plane_copy_uapi_plane_damage(struct
>> intel_plane_state *new_plane_state,
>>   		*damage = drm_plane_state_src(&new_uapi_plane_state-
>>> uapi);
>>   }
>>
>> +static bool
>> +intel_plane_colorop_replace_blob(struct intel_plane_state *plane_state,
>> +				 struct intel_colorop *intel_colorop,
>> +				 struct drm_property_blob *blob)
>> +{
>> +	if (intel_colorop->id == INTEL_PLANE_CB_CSC)
>> +		return drm_property_replace_blob(&plane_state->hw.ctm,
>> blob);
>> +
>> +	return false;
>> +}
>> +
>> +static void
>> +intel_plane_color_copy_uapi_to_hw_state(struct intel_plane_state
>> *plane_state,
>> +					const struct intel_plane_state
>> *from_plane_state,
>> +					struct intel_crtc *crtc)
>> +{
>> +	struct drm_colorop *iter_colorop, *colorop;
>> +	struct drm_colorop_state *new_colorop_state;
>> +	struct drm_atomic_state *state = plane_state->uapi.state;
>> +	struct intel_colorop *intel_colorop;
>> +	struct drm_property_blob *blob;
>> +	int i = 0;
>> +	struct intel_atomic_state *intel_atomic_state =
>> to_intel_atomic_state(state);
>> +	struct intel_crtc_state *new_crtc_state = intel_atomic_state ?
>> +		intel_atomic_get_new_crtc_state(intel_atomic_state, crtc) :
>> NULL;
>> +	bool changed = false;
>> +
>> +	iter_colorop = plane_state->uapi.color_pipeline;
>> +
>> +	while (iter_colorop) {
>> +		for_each_new_colorop_in_state(state, colorop,
>> new_colorop_state, i) {
>> +			if (new_colorop_state->colorop == iter_colorop) {
>> +				blob = new_colorop_state->bypass ? NULL :
>> new_colorop_state->data;
>> +				intel_colorop = to_intel_colorop(colorop);
>> +				changed |=
>> intel_plane_colorop_replace_blob(plane_state,
>> +
>> intel_colorop,
>> +								 blob);
> 
> These params need to be aligned with open braces.

Ack.

> Also I noticed a lot of checkpatch errors that can be resolved please run checkpatch --strict
> Resolve all of them then send the patches unless the warning or check is just unavoidable.
> 

Anything you are particularly referring to in this patch?
Most of the warnings are from the squashed patch.
And then there are the register addition patches from where we should be 
able to fix the leading spaces ones. Will fix them in the next version.

==
Chaitanya

> Regards,
> Suraj Kandpal
> 
>> +			}
>> +		}
>> +		iter_colorop = iter_colorop->next;
>> +	}
>> +
>> +	if (new_crtc_state && changed)
>> +		new_crtc_state->plane_color_changed = true; }
>> +
>>   void intel_plane_copy_uapi_to_hw_state(struct intel_plane_state
>> *plane_state,
>>   				       const struct intel_plane_state
>> *from_plane_state,
>>   				       struct intel_crtc *crtc)
>> @@ -364,6 +411,8 @@ void intel_plane_copy_uapi_to_hw_state(struct
>> intel_plane_state *plane_state,
>>
>>   	plane_state->uapi.src = drm_plane_state_src(&from_plane_state-
>>> uapi);
>>   	plane_state->uapi.dst = drm_plane_state_dest(&from_plane_state-
>>> uapi);
>> +
>> +	intel_plane_color_copy_uapi_to_hw_state(plane_state,
>> from_plane_state,
>> +crtc);
>>   }
>>
>>   void intel_plane_copy_hw_state(struct intel_plane_state *plane_state,
>> --
>> 2.50.1
> 

