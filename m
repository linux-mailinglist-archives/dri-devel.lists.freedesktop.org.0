Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4219AC0393
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 06:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DB810EB06;
	Thu, 22 May 2025 04:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kUtrG2th";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614D710EAE7;
 Thu, 22 May 2025 04:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747889603; x=1779425603;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zBRobwOyGh08BDywc+xFpUSYowLIA7z8mfPB7e0lAYY=;
 b=kUtrG2thGM1140UTA7Cs/VmWcZDBTBUVYwhw/LhAvMF9Q6UAT5CUOl9s
 r5Z2iUH4RaM4rcIfVD4D5AHOKkfKDWXbpG45Bq4xYzdjXqBQDzHh+QJsB
 a56MKVWa81fLdjSxGiC8g2SgMoaUt6KLzyvox5U7vi+jOY+bmrfP6MhrW
 ditDBAWtbwq/bfy/yuwWxtYQ3iYDvqr3iV2+wI9fns3XLsvfhwUycdqHK
 qN6XWsN4n8Atk1MWCFVQED+nXxMqU4432wEyCIVLPWoxtIsjvkctd1BIb
 ET+9sgLn/uTMniDS2A3iR4JzNjRwsh/GQZNttv9yp9mxB5JU5bmTKsZi8 Q==;
X-CSE-ConnectionGUID: G9td/RtKT5ezGaqSp9cXBQ==
X-CSE-MsgGUID: 1/B955L5SU6gcRnfB2xmcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="61302143"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="61302143"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 21:53:17 -0700
X-CSE-ConnectionGUID: WOdXTJGnS3+ghumPyj+ThQ==
X-CSE-MsgGUID: 4lenRCO+QmuQs+xuGTUmmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="141468572"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 21:53:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 21:53:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 21:53:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 21:53:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/kkfOxz2FzzZzC2KLfPZY3g/DGZvnLz5doWWuUTK7OLe9ScSJKziToaCJg2rbistLvXeWTUs74Yarx3BuDZ4RsAKf1bTP+ZHLON1EZQdCeC4cZt1HcEpcFZTY9vPzTGNBKCb9FSF2nFic4/JMxDSZbo6RKbrGhx80ssN9t/Iq2rU4RRdX3PS7piVb4RFBPpGQ1krs1TAiS6Iu9hNqozAAYzKZ3CRQ0VBUd4Vo58XfZ3n/9N+N/BVEA4tjMqf74C4qjXTwjL0LKLzL0E5kM4DZfeOgRuCioT9pEkT4Eu+CMExYUFtPMU1QFt0czHqJuePHGVjGf1evn5t9Sdap+RFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZAhL++npNTi1IkNDQr92uL+S/JATGZukzOeDr8XmFU=;
 b=vzj2QiWW7CfH100gjFLTGs897uH9SEmI1qWCK9CbCr4wz/m3e+g2NdLGcOr3GZk0yq/XZZgsCL4i0Ed3f+aJUJlFBj23m0h1dfA3Um9PHK47kM0Z+OlOIkRK0RbnL4rOsnLS76d+wBCIKNG6cYQxnvmsrO+WAs402bU8uBBLtldIq5v1uZf2ZsxOZIAnBhP4U/V7AIplQ41pBXoGb18ulgIKNMbGtGJV9DKD+79l2Tv2wY1gbv63aW2iqJQe42SsU1pyXW8mjDlniULmeXBMtr2NV6yvcaZ4Du8sm6hKQ/T9WnxRAq30KEHjjwlzT8c8Ef3zwt1JltF8ZhhPTOQ2MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5332.namprd11.prod.outlook.com (2603:10b6:610:bf::17)
 by CY8PR11MB7136.namprd11.prod.outlook.com (2603:10b6:930:60::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 22 May
 2025 04:53:14 +0000
Received: from CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::b398:8ab5:cd4b:a2ff]) by CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::b398:8ab5:cd4b:a2ff%7]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 04:53:14 +0000
Message-ID: <0bc50a6b-525f-4866-807c-cc42da225cc4@intel.com>
Date: Thu, 22 May 2025 10:23:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/dp: Allow HBR3 without TPS4 support for eDP
 panels
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <ville.syrjala@linux.intel.com>, <dri-devel@lists.freedesktop.org>
References: <20250520072023.1661211-1-ankit.k.nautiyal@intel.com>
 <87jz6btqno.fsf@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <87jz6btqno.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::18) To CH0PR11MB5332.namprd11.prod.outlook.com
 (2603:10b6:610:bf::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5332:EE_|CY8PR11MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: 9204f7aa-6598-445e-cdd4-08dd98ec8ee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWFRUFpFRlFXZ252L1Vwc05OUXpldjl3VzR4MDFuSTJKK0M5enBHZWo3dDM1?=
 =?utf-8?B?dHpqanZDdzdQRHVSK002U3Z5NmZkVTJmaVlzV1VTTmQwVVZGdGhmekNkelJp?=
 =?utf-8?B?S0lpbDdPT2NLeENEVWl2d01WR2RGWTVvL0lwYkZaQnVQeElLN3E1SkpXTzU4?=
 =?utf-8?B?Yjk3VkhRMDJkZ3V2MGxoSStRR0FBT0hIQTJQY3ZmRmo3eWQ2dC9Gc3BjdWMx?=
 =?utf-8?B?WFNablZpdGpzUVlFYjIyVzJIYmVuR2w0clVxN3NrdXNGbG1Fa2M5Sm1mWHhU?=
 =?utf-8?B?dEd4bFJWZnd4NlNtR0NXUjVkTjhkUWtjVVUyYTJwWU5jeHZpMFVjMWJ5VkFY?=
 =?utf-8?B?YjR3cm41Q0NiL2M4R2tJVW5MRzNIcjk4bTFXS1lFRGY5aTgvbVg1YUNVaWpQ?=
 =?utf-8?B?WlM1MkM0MWdibWUyaktRY3Z2SmRJZVBuRklEUkh6cjZjZktDeFdVQTVsMXRX?=
 =?utf-8?B?Y2JzVTNsWkJDUUtUdTRQUEwyOE9MMXJFa0hNTmlEWWw3dWRuMTI4dVVEcEdI?=
 =?utf-8?B?MjNNbm5NVWd3ek1aUG1OYWM4cHJYZk9YYllwWkpVZnc3VkZCdEdNVUlvSTlR?=
 =?utf-8?B?SllmWUh3SGdXTGxXZWVUWUszSTBRS1J1VEQ2ZzBDcWc3MWNNSHBDaDlLOXFm?=
 =?utf-8?B?aDMrY0tITW5IMURJbUN3Qnk1T1VkUmtzVUdRTndnZG9VY1pQaTljL2w4cFNX?=
 =?utf-8?B?ZXZ2dm14cnpjSlFGTkFFQUVKWkM4VjNLcCsxQ1VuYVVNOXRVakhNZGo4T21E?=
 =?utf-8?B?bWhFdWRkbEY5YStqckE4K0ttNTBTMXM4dDZhMlZPR2xVTGdRNGhPeS9qZWZ1?=
 =?utf-8?B?NGJ3bTROL1IzaUYreDZoTDVpUkd2b2llQVJOM0g3bnRKSm5MajdmZ2d5NE4y?=
 =?utf-8?B?YVc2OFkyWDhMazd5d3lvMlNJYVRQQUZhVk1McWZCdnVkNTdvRkg5azNibno1?=
 =?utf-8?B?R0JaQUltN2RwZllqV2dzWkVxOGFSY01zWEROOE9YM1dqdEtIZS9pRU42ZGh2?=
 =?utf-8?B?Rm02U3RiTS9ycld1WDVkQ3c3MlJrbmc5MXN6bVNKbWNxQzFJRSt4ZmVQRlA5?=
 =?utf-8?B?YXBxdTZldUw3SUZldHNJbC9nTlFYTWcyTnV0S0JtMnRTMVlvMkVUUnFweFM0?=
 =?utf-8?B?U0Y1cDhQakZKbmxEU01BeFMvVWt2MU5CQjFJenJGRUV3TUpSZVVLY1UvcDNs?=
 =?utf-8?B?YTErenhxUWluRVVtdm9sZUdDak92RCtrYktDNG5HQXJoaFV5NE5VY0xsaitO?=
 =?utf-8?B?OXBhb1Z3RlRwWlhERnpLV1gwdmlSTnZIMEkvLzA2Z29kbXhyei9JQm8vTVNw?=
 =?utf-8?B?ZjJIczFBOGNsUk1GcXdEWVRGd0RtellLK2Z2b01PQ2ZHMkFYUkMrN1BNL044?=
 =?utf-8?B?NjMyS3hsUzgyR05HUWlaWTBkYVIyR3YxM0djTGxuTW8yY0dGNmU5Mmd5TW96?=
 =?utf-8?B?Y0MwalVRc2NQYzQ4azd4QW1wdVNZek8zRDRyK3BYTnhxWnVBdHdlOXlMSU9X?=
 =?utf-8?B?WmllQ2NRcldlYUZNbThjRU1uampySXFaVGZXYnVnU2RyaDBzZ0F1WnA4enZo?=
 =?utf-8?B?Q0VJYXhJMGRmUEJsT1J1V283Nlc2WGRVcFEyUkQ5TEc0eWttaEJRS1paS0Zw?=
 =?utf-8?B?MmhhMnpZYUJVUHdEZFdXM3FaeUtET25GWnZpeU90emV6THJYaDN1YnRiVEJk?=
 =?utf-8?B?dkVsenBVSEtSVGRrKzNWaWlvdjgrUkhyNnhIUGVkeVkxa0EvVzhmdk1UUlFy?=
 =?utf-8?B?ZllzVSs5VFJsNFFVTkczMFZPUDRXN2gxcnAwaUg3WmQ1WVhUdGkwWWw0K1p0?=
 =?utf-8?Q?uwm1bWzk4VcbeDyYurb9dsmvT34ainkerbzaM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5332.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blQxaUxRV3pxOS9VRGdZM25ncGNpdDhldEdSaEZMbmwwdHVURnkxKzN2ejhx?=
 =?utf-8?B?bDBEbDFXRW10OCtyV0VqcEpuT053cCtOblJ6MGQzRVVwcGRaRkhhQ3JadTE5?=
 =?utf-8?B?NnZIN2pTRkhQcnpqRjR3UHQxVG1VeVl5aFF6VzN3cjdHRGJTRi9PeUlKL2Zv?=
 =?utf-8?B?UGlPMHVQTHNwRjVhT3k2aWR0aXA4Zmw2SS9RTnlrRDA5Y0V2NkdlSmhMMWtX?=
 =?utf-8?B?UDJIMCtWdUNLcUZjcndQR2IybXBaRUVBMmJtcXlsT2tpSmdoK28rcVYxZFhu?=
 =?utf-8?B?OU9UZ2VNSzh4dmp1bFV1aDhHZnowQmxlb2FIVDVjTE5URmJ6ZXdKbnNqRnl4?=
 =?utf-8?B?a3JNaklZV2tSNFJFdGw5QjhYdCtWazVVS2liK0RiWE42cjhpNDdhemIzdDJ4?=
 =?utf-8?B?dzBOK1pIOXJWTEJtOUpUeElQVkxINkkwS2pHNFVoRG91WTRtS2xFeG9URGFD?=
 =?utf-8?B?RFAxbGZQK3o4WWl0QURTdytNUjkrNlAreWpPVldrcWw5dzFYZWhqS09yck01?=
 =?utf-8?B?V3FDVDUyWmNQOFd4MmZ2QXZGNlN1UGxXd1RQUmloNmovTTFDUXJ5dnJzcmNC?=
 =?utf-8?B?Y05QUDJsZkZOQnE2bG9yVkVPM3o1WCs5WTlqbHByblFxeHF4bmVUdWgya3Ri?=
 =?utf-8?B?NDBQUytnVFpIY0FoOVpFYW51SmNyMEk1aVZ4cGdEejdUMFc3Y2NTT2RMaWVL?=
 =?utf-8?B?MFlqeDJSWFM0Wmw4b3A0ZVJ4MXNtTjBRRzlrbnMrMDd1QXpueFhyMUJ3RWxy?=
 =?utf-8?B?RFdUT1FZVmRiRXA0RHpKSmxtaGRhc0tqUXgveTJ3KzNsSXFmN0Q0UjJNaDVP?=
 =?utf-8?B?dlpGMWkyTk4zSmloR05FcGpGV2piSXdydm1mM3VMWGJLUllOTE1OUnZvck96?=
 =?utf-8?B?c1dWTlRxNXgvMWMwSHhaOXJIUzJUcVp6dXVLRTJ1U2xSMkhTOHVxYzhSWXBi?=
 =?utf-8?B?bWcyZXVGSEZYMnFkWnJwaEtTa29JTmp4YU1FNXJYRHpnRFllbjBqS0pzbjU2?=
 =?utf-8?B?S1poek9LWHpwZzlNd2h4VjBzMjh6djhNYi9pWHZJZ0UwRlNnZjA3THl5cVBy?=
 =?utf-8?B?SGVmSnEvaTNhZ3EzalhzZ1NsazgvOEluTUxaSmVML2xmM2RuZzZxdmdvb3Ew?=
 =?utf-8?B?OGdXK0VIbFpIRmw4ZjFobUFxSmEzRkpnYWpoNURpaU5LdlJsRFJNOUpwTW9W?=
 =?utf-8?B?RGpnZm8vVE54ZnFKWm5BNTR0ZGRUSDdVOFYwdUE5OHVxdUdaaE03b2pBV0I4?=
 =?utf-8?B?YXU5WW1ZVTVBRlNRSnA1Z0NlcjloUXhQeE8rRTh3dzh5ZzRuZmdXcGFqdWZD?=
 =?utf-8?B?TXRUeEFxRGJSZ2EyUEs2SjFkend6N01HaEIyL2RHQ08yaDFrL0FVc21RWlZK?=
 =?utf-8?B?eEdMRXBzUW9RNWlnckt1WFZWYURHVllGVEF5c0FXYnBrU3A4eG9pRmlyalhK?=
 =?utf-8?B?R0NSbGhYeGFIMWg3MmR0QUZocXBNOVZTTnI2RGk4eTZvNDNHZlhyZmVvTXg2?=
 =?utf-8?B?bU9wWm5WbWhqUkcvakVqOVI4M290eHFlZnpkdnJxL0FWNVhKaUdPbHVibUNF?=
 =?utf-8?B?bXhBU3ZNakFEVUc4aHdHMlZDbHNsYmpyZGdsVk5wemVxajNzUHpaWWg3V3NQ?=
 =?utf-8?B?SVFxU2hjSWR3ZWFmQU9yd3hHTS9oeE5XL2pxZDFPSGI3SVVQM285Q1RvM0VY?=
 =?utf-8?B?aXU4a1kyQnZqTDVYNDhpekdCRWJaZTVlSkxINXVXVmhwWW5QcjJpSXh3S3pL?=
 =?utf-8?B?UkloSGNoTC9jOXYxSXFJR0dud0p4anJHalEzZDN4WCtNc1NiQkMzZmZiTERX?=
 =?utf-8?B?WHMyUGxNT3NVQmhzczhqMnE1Z05jdzlqOEo1SWpWblZHLzZGeTA4dk5WUS9H?=
 =?utf-8?B?aXNHZ2I0YXRPNWlrRU5tT0dJVHB4U29yeXZhbFg0S2lzaDBObGpCRkF5N2F0?=
 =?utf-8?B?TnZBV1owMk5Qb1J0T2pzYmpBcER6Q2RDZzdCTURSYlJSK09UM1Y1QzNlUzNN?=
 =?utf-8?B?RUtpK0RMN0dnQUtBWEZRUXE3ZXZEMHBJckltVDBBSkhqMFFEM1BzSmFEa1NX?=
 =?utf-8?B?NGo3ZTRWNjcvVXdWOWFOM3FLR0xnd3Q5R3YrYmJSbjAzVTk3SnN6YXhrUzhV?=
 =?utf-8?B?czZITXNmdVMvZ2RjT2gyTXVGajlBZ0VDRDhGem1YMzlPVDF6ZkRKM2RzUHk2?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9204f7aa-6598-445e-cdd4-08dd98ec8ee2
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5332.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 04:53:13.8800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JCWQ3Pg60Xa8YVaZWYXEpw3FZidRm0Yyf4naakssYnibw/KeqhGO1U+ukLd6Z5QeT0kOAOjaI0m0D/uQyVzTxjz95AaZpC38BEm47VafCu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7136
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


On 5/20/2025 5:55 PM, Jani Nikula wrote:
> On Tue, 20 May 2025, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
>> Commit 584cf613c24a ("drm/i915/dp: Reject HBR3 when sink doesn't support
>> TPS4") introduced a blanket rejection of HBR3 link rate when the sink does
>> not support TPS4. While this was intended to address instability observed
>> on certain eDP panels [1], the TPS4 requirement is only mandated for DPRX
>> and not for eDPRX.
>>
>> This change inadvertently causes blank screens on some eDP panels that do
>> not advertise TPS4 support, and require HBR3 to operate at their fixed
>> native resolution.
>>
>> To restore functionality for such panels do not reject HBR3 when sink
>> doesn't support TPS4. Instead reject HBR3 for specific panel that are
>> not able to handle HBR3 [1].
>>
>> [1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5969
>>
>> Fixes: 584cf613c24a ("drm/i915/dp: Reject HBR3 when sink doesn't support TPS4")
>> Cc: stable@vger.kernel.org
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/display/drm_dp_helper.c |  2 ++
>>   drivers/gpu/drm/i915/display/intel_dp.c | 21 ++++++++++-----------
>>   include/drm/display/drm_dp_helper.h     |  7 +++++++
>>   3 files changed, 19 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
>> index f2a6559a2710..bf66489c9202 100644
>> --- a/drivers/gpu/drm/display/drm_dp_helper.c
>> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
>> @@ -2526,6 +2526,8 @@ static const struct dpcd_quirk dpcd_quirk_list[] = {
>>   	{ OUI(0x00, 0x0C, 0xE7), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC) },
>>   	/* Apple MacBookPro 2017 15 inch eDP Retina panel reports too low DP_MAX_LINK_RATE */
>>   	{ OUI(0x00, 0x10, 0xfa), DEVICE_ID(101, 68, 21, 101, 98, 97), false, BIT(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS) },
>> +	/* Novatek panel */
>> +	{ OUI(0x38, 0xEC, 0x11), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_HBR3) },
>>   };
>>   
>>   #undef OUI
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>> index 21297bc4cc00..0bfc84cbd50d 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -184,13 +184,13 @@ static int max_dprx_rate(struct intel_dp *intel_dp)
>>   		max_rate = drm_dp_bw_code_to_link_rate(intel_dp->dpcd[DP_MAX_LINK_RATE]);
>>   
>>   	/*
>> -	 * Some broken eDP sinks illegally declare support for
>> -	 * HBR3 without TPS4, and are unable to produce a stable
>> -	 * output. Reject HBR3 when TPS4 is not available.
>> +	 * Some broken eDP sinks declare support for HBR3 but are unable to
>> +	 * produce a stable output. For these panel reject HBR3.
>>   	 */
>> -	if (max_rate >= 810000 && !drm_dp_tps4_supported(intel_dp->dpcd)) {
>> +	if (max_rate >= 810000 &&
>> +	    drm_dp_has_quirk(&intel_dp->desc, DP_DPCD_QUIRK_HBR3)) {
> This does work, but I was thinking the quirk would be that the max is
> HBR2. Same thing, but more generic? DP_DPCD_QUIRK_MAX_HBR2 maybe?

Makes sense..

Something like:

                        if (rate >= 540000 &&
drm_dp_has_quirk(&intel_dp->desc, DP_DPCD_QUIRK_HBR2)) {
                                 drm_dbg_kms(display->drm,
                                             "[ENCODER:%d:%s] Rejecting 
rates above HBR2 due to DP_DPCD_QUIRK_HBR2\n",
encoder->base.base.id, encoder->base.name);
                                 break;
                         }


>
> With that, you could drop the max_rate >= 810000 from here. (Though the
> next check below does need the rate check as it stops the loop.)
>
>>   		drm_dbg_kms(display->drm,
>> -			    "[ENCODER:%d:%s] Rejecting HBR3 due to missing TPS4 support\n",
>> +			    "[ENCODER:%d:%s] Rejecting HBR3 due to DP_DPCD_QUIRK_HBR3\n",
>>   			    encoder->base.base.id, encoder->base.name);
>>   		max_rate = 540000;
>>   	}
>> @@ -4296,15 +4296,14 @@ intel_edp_set_sink_rates(struct intel_dp *intel_dp)
>>   
>>   			if (rate == 0)
>>   				break;
>> -
>>   			/*
>> -			 * Some broken eDP sinks illegally declare support for
>> -			 * HBR3 without TPS4, and are unable to produce a stable
>> -			 * output. Reject HBR3 when TPS4 is not available.
>> +			 * Some broken eDP sinks declare support for HBR3 but are unable to
>> +			 * produce a stable output. For these panel reject HBR3.
>>   			 */
>> -			if (rate >= 810000 && !drm_dp_tps4_supported(intel_dp->dpcd)) {
>> +			if (rate >= 810000 &&
>> +			    drm_dp_has_quirk(&intel_dp->desc, DP_DPCD_QUIRK_HBR3)) {
>>   				drm_dbg_kms(display->drm,
>> -					    "[ENCODER:%d:%s] Rejecting HBR3 due to missing TPS4 support\n",
>> +					    "[ENCODER:%d:%s] Rejecting HBR3 due to DP_DPCD_QUIRK_HBR3\n",
>>   					    encoder->base.base.id, encoder->base.name);
>>   				break;
>>   			}
>> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
>> index e4ca35143ff9..5e60a37b61ce 100644
>> --- a/include/drm/display/drm_dp_helper.h
>> +++ b/include/drm/display/drm_dp_helper.h
>> @@ -814,6 +814,13 @@ enum drm_dp_quirk {
>>   	 * requires enabling DSC.
>>   	 */
>>   	DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC,
>> +
>> +	/**
>> +	 * @DP_DPCD_QUIRK_HBR3:
>> +	 *
>> +	 * The device supports HBR3 but is unable to produce stable output.
> I think DP_DPCD_QUIRK_MAX_HBR2 is easier to explain too.
>
> What do you think?


I agree. Thanks for the suggestion.

Besides this, I have one doubt regarding the quirk.

Currently I have added OUI details from the logs from gitlab issue, but 
DEVICE_ID field was blank so I have used DEVICE_ID_ANY:

+	/* Novatek panel */
+	{ OUI(0x38, 0xEC, 0x11), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_HBR3) },


This can probably clamp the rate for many panels. Is there any way to identify the panel other than the description from DPCD

Regards,

Ankit

> BR,
> Jani.
>
>
>
>> +	 */
>> +	DP_DPCD_QUIRK_HBR3,
>>   };
>>   
>>   /**
