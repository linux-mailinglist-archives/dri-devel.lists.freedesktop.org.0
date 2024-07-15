Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE31B931D89
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 01:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD1310E3BA;
	Mon, 15 Jul 2024 23:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bkw4hqe3";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FF310E1EC;
 Mon, 15 Jul 2024 23:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721085391; x=1752621391;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NJ1wa3rVqRfP1SEEIy3sDAD1c6/BjTuvnI4Le9PXVBI=;
 b=bkw4hqe3Jmd/FkNJlIaWts7WTC22jMqUwf8Ea5+3uk6Q0Npu8adleA7L
 yC9/16IOy6K5i5KlHGFUK++OkLQWjLPfe2ybjgjVm61eb/875o2T+4UBt
 pFXOo6tQc3Z42jI8Cd+qLqd0X/hBip7xvg0qk/Rb7SfuM0xkCpBLllns0
 4SUmSbsGJl+toXD6pT+cuyDz/S1pUScXZhuV56I5RwUldlnBpeEsGtsvn
 XHkXaGoW1xLCN+YkBwd09uEwxvP8pejRRi1qjfU+IayyusDol2Iza8zs9
 jBaTTh2zbpCpCFgT3PHBpz1DTgKvKzig6koTNX19QvXEQU0VKzQ+5NNZq Q==;
X-CSE-ConnectionGUID: XNpMhH6tROWiJVMpkA0VlQ==
X-CSE-MsgGUID: XPd3VmU4QaytQtzVPojD5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="29171438"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="29171438"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 16:16:30 -0700
X-CSE-ConnectionGUID: qRCtHQ6YRq+g0KuJYJXD8A==
X-CSE-MsgGUID: D9W4EGLgSCa9usG4FAhcyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="49743788"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jul 2024 16:16:30 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 16:16:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 16:16:29 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 16:16:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=thd8uC5xOu3Ns/xSRgrrI9MRJbJ1bjZ0nnNL4Dr4Smhl+k8Gi8xrGFU/t6yxgC6CY/f7k/oU9k1u/eFygl1RoWusUEnfgZFO9A4nSv6NXq+xZvlWAaLTnkzBuCZR8RjF3WLF7LU3Px2hydUZZmkMnchQxKYQzdbzf5OtHPdfZq86q9BwYxoBicZRTT04qVe0Bf/0mc2JwbTNjCK1SY5Cx7ZtVnmaQksnILVtiwpgWBpBVEOYQ8RA29nSOrXDtuaD2H+OX2JWRMf0fXn4Sd4uC1DwbhauZH2/wWPm3rgTJDMRriobjl1MoKnIqM4z9+OAQDqEEn8+HoPvkv+npPs9cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/FRiK2jHNsVefRBHb/w4zhMR005nE6mzrzAacujkyY=;
 b=bT+sS6KgWze2IlxrCBPv76WUabwzScqweWLTtVBZ5VyEXcmHgbsqCKJLp8NdJlGGgLkeRffq1v2UihFwJFAjjx04737rSDhH7GID3EMV/U5meHowemhC1pVNw73NMvxNosD/hHtdLjYBfRc25JiLU49BcSKzkXqbUY0S1HKcO4j6zGKpDJiyjGp3fcb7SAvyv5uWju8oxYTqqcM20G43dyRPmNmg5Bs1UCToCZrO0odOJ1Y4qtotyCioxHQco1nB3VGM9AiRxYUjdi1/B25EtPR7lpwCBEkm7sznHGZb1yrGuM/SRHjf66Yp5aAT/zmkl+ZLJGiPw2KP4LWCDLYpCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH0PR11MB5079.namprd11.prod.outlook.com (2603:10b6:510:3d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Mon, 15 Jul
 2024 23:16:27 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 23:16:27 +0000
Message-ID: <289edaa8-7d57-49f6-979a-9be2aa412064@intel.com>
Date: Mon, 15 Jul 2024 16:16:10 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/i915/guc: Extend w/a 14019159160
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
CC: <DRI-Devel@Lists.FreeDesktop.Org>
References: <20240622004636.662081-1-John.C.Harrison@Intel.com>
 <20240622004636.662081-3-John.C.Harrison@Intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20240622004636.662081-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0050.prod.exchangelabs.com (2603:10b6:a03:94::27)
 To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH0PR11MB5079:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ed002e5-5a30-4d87-31d6-08dca52426eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXJIMFBZVm9jZDJWMndNaEVaQlRwcG5RYXBZeGZhcHBteENqeXZYYThjY0NN?=
 =?utf-8?B?TVFVbzBGNUNrN25hd05uU0NpRFFsZDVIbVd1RHRtWjE1blZYM0pDK1JsbHYz?=
 =?utf-8?B?dHBrZkJ1Zk9RRjQ2a1F4UU04am14dVNTaTFMbWYybG5RaGdIN1BQbGJSU1ht?=
 =?utf-8?B?WFlUTTN3UjljMG55am1rMHlCWjFkT3dvejlxR2tTSkk4LzVEZ2I2TWxtUEFR?=
 =?utf-8?B?Z1pNdTdvOUdWOVM1OW1pSE5zeDZ6SHZ2YXJ5eXE0N01yZ1FycjhFd21JelZh?=
 =?utf-8?B?eHlRcElRUUhEK0hEVHV3V3NacWlQWnJIQnFKbWh4Q3I4RDBmTGFIL0Rmd1Jp?=
 =?utf-8?B?TTZMdElhZXhrdlVMMFd2d1hIZnMrR2Z2NGttazE4dEsvWlgxbzYzNTJmcUY0?=
 =?utf-8?B?YkUyeVkvMFpZZHJ5TzQxc25COS95Zk9HQ0NiL3ZVa1B4K29DNTYzVS85ZnEx?=
 =?utf-8?B?N1BIR3JQZzRzWHk5cjFoRXQyREFxZHZVRW5qaG0rSnJCOERIYWRDUUd5QlV5?=
 =?utf-8?B?V0haSzNrWDRtUkl2Mmk4Rk5vTmZsR21JTzNST05qRlJBK0ExUDRFd1NWd3Yw?=
 =?utf-8?B?TFYxNWtWVVBoMENuZ0xSMWRHd3BtNjF5V3IxeGFDVXJVWHN5a1cya0QxRlIr?=
 =?utf-8?B?UE02ZjN1VlFTekhWdjBWQkpZVGttNTRXaStaM0NTSHNxaElzMzArOXNJY2hD?=
 =?utf-8?B?dHZRTzh0MDFMNk10aXo1MklDeUlUVmkyRXB4MDd3bWdDMGxCVlVkSS9CazBF?=
 =?utf-8?B?eG03L3hKUkcxU2JiMSsySStFdlhkZGZ4bUhCQiszQTVoSWdLN1pCOEw4Y2g3?=
 =?utf-8?B?dmNPZ3hLaDl6eElkdzJzUm1jQ2VaZWg2M2tIRWtaaHFGMVZWSVI2c0pLZjNn?=
 =?utf-8?B?M2RxVVlRSzBUMVE2QUpSVFBJNER6Q0dNQjFoTjI4dEVTYkM2aEVNQXc3NTlQ?=
 =?utf-8?B?R3RmazV4VWh6ZGMyKzlnb0Ixa0t4NStqdVpncU1xSEtYNEJraWtOcmpUMUlD?=
 =?utf-8?B?NUprQ2JiTVZBUUVrZTRTMHA5bU5odU81Q29DVXpRdUN3VHFtaldZMGlSeWpH?=
 =?utf-8?B?b2Z0WU5YOUZZRTluOEU4emNYaDNmdy9vZ1c3ajhmVHE2N1g2bXdudlZaQnh5?=
 =?utf-8?B?MjExV3lxN080Z2xvb1FSRnd3ZndnbndPayt6TFY4eDJFZ2ZId3U4Y29PYk1V?=
 =?utf-8?B?bWhkTHhsUHNrTWtLWEV2QzJpZmdMbXNPTkovVy8zUjY0Q0M0OGhxWXV4Rmti?=
 =?utf-8?B?ZkxjSEIzWTQxTG1tRzdoM0tBdENZNnNsYUNyQmdrbXpUVmpzemVQdnNnUytU?=
 =?utf-8?B?WDhCcTFPLzRQQzFsdTlLbDlVaTZnUCtTQ2R5TWNLTkQwUVhSM2c4UktzWGxi?=
 =?utf-8?B?WW9QUUlLM2FXV3NRcEk2VFhkVld2VkZpRDlWVHEwd0k4Q3d1OS9DYlZZN3Jx?=
 =?utf-8?B?YmI5V2tOb0VjQTdWTVZCN3lxZmlZbFgzMTVjdDVnZmJEcnUwMkNpeUtTU3U4?=
 =?utf-8?B?Y0huVytmQ2o4dUdqV3dwOFNOaUs3QUQyQUVLRGNoeUxjK1VmSHNBbWhFU0E4?=
 =?utf-8?B?a0l5RTNVMzZncGEyY0wwajRZTkUzcmw3Y0ljQko5cGJvdHJwRWJlQjRGQUZh?=
 =?utf-8?B?dnBkcEgxVGU0U3RmZGRKaVlUa21QUGZzOGxQWjl1dGZNbVpLNmIwTURKcXJi?=
 =?utf-8?B?N0EyWmxnTVB4ZGVVQmcxdDRzZzlXNEFqSnZUQkw1eEVIKzh6cENtMExpUGVl?=
 =?utf-8?B?R2lPMndUMWpaUWR1Z1lOajhRSTdBbGk1eW1sQy9nYkNTVklSVVRiR1FmUGd4?=
 =?utf-8?B?d1EvTVk0ZDczOWhsZzJBdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUtRQ213R0FiWjl4ekx6NmdQa0VmeWR1ZG54NDUySWZvVVVuTDI3YTRXSmZY?=
 =?utf-8?B?RnNCOGo1ODlIVjdnTHpEaGIrcFlNanhneWVuWFZOL3lpTXhHdm5NZzJvcllz?=
 =?utf-8?B?SUR6eFB3WVUrUTAxZmc2TEM1MnNsS3h0ejRSam5mMEZLa09rNG9kQjh0RTFO?=
 =?utf-8?B?OGVDa2NZNGU3U3lpWjZweFNzd0U0YjhvN0xBMWJZRUJobVRTV3JQZk1sU2N1?=
 =?utf-8?B?R0lKVk9NUDloWjRUTjh1SE02UUwvdmw4U2xSMnIwbVQ5WjVySTlDczMySEJw?=
 =?utf-8?B?VFo2MzRRbS9wS1grRXZhNkF2OEFCNU9qYzFuZnNFdTdHWU5FeE5xcG5jYURt?=
 =?utf-8?B?ZGkwL2ZSdjlVRGg1bDZMMklnb2tmRjZrOXByd1NTTlNTNkp4UzdJTm83TWpo?=
 =?utf-8?B?RGJNTDRnTFFlZGtjS0RkeUhUQitCc2Y5MllJL0RUYURIZWpBNFQ3dTdheWhm?=
 =?utf-8?B?c3BNTnViSnNRcDN6c0kxVWZmMlRObDhjd3hsYVR3RkJySHgrdHhTQUhjTEha?=
 =?utf-8?B?N0d4UjY0ZmNtYU84bE5MSWd5SyszVE8yVDVzbGgyZXkzdTc3OEI0SVJmQWQw?=
 =?utf-8?B?anFWMXN2VnBuWndBMHhiYUkyVXB3eUR0RUZYd1p6c0pFS0dxM1ZOd3NDNnlB?=
 =?utf-8?B?eEQvMmFjeFZIYzRxVFhmTEVLWldaSURZOWtVNkxudEdNVzl1NzI1YjJ2SGlO?=
 =?utf-8?B?RzQyWnUxR1JoMENOYTZxNXBHeEYwdGMvUEtRRXBLNm9vRjQ0c3V0UWhkS0J6?=
 =?utf-8?B?c0FaZENpOENKWDJudG9yWFZSOGNNeC90bUdjaHl0YmNvNGVjTC8zZXpxVWVs?=
 =?utf-8?B?Rnl3azJucXkvZUN0bnM2RVRuUnplWTZGVkZkQkJhYVR0MkNUZ3JHTHhHWTIx?=
 =?utf-8?B?NlFBZ1h0WndZZjBUTy9DMjR2UEJlVXpTTkE4UndpVTdiZitiS0ZPTVZxUmFz?=
 =?utf-8?B?QVUyQlpNY1lKcmF0bW1iR0t0bXo4dm90b1hiZkZhNEtxRzRYZDFNOFNXazkv?=
 =?utf-8?B?K0ZmWnpRL3ZvN1JoQW5JNU80RnNxTzN3VkNrNHdnMENkc1RoeXpqSWt5amc1?=
 =?utf-8?B?bzhRbGc1dnpOTVpQSWt1TExLZTlNaXVKTXlwVUZvTmVoNWtnOVdTQm45WmQ5?=
 =?utf-8?B?cFNTOTAxU3JuZW03UUhpUnowa1B1TlhaendOK29IS2RYUFdvTU5OcTVHR2Qw?=
 =?utf-8?B?cWwySmVXSUNwTnVscUxEaHNtZS9VelJUNGtWd2tuVVJ5UEJRNDhiaFUrOFcz?=
 =?utf-8?B?RFJCNFNxQU9WVk4wRThkWGtnKzh2ck51SDdrQzcwUUpWSDFHY0d6Y1BBSVpS?=
 =?utf-8?B?dkNBZG5FZjNpeS9qTEw2dVlZUXFaRUtQaVpET005R1dHSzdqU0tkVzBSR09B?=
 =?utf-8?B?VW5FTHBYbXJyUkZIeTMzeFJCa0JjR0M2M0dSaVVRQTUrQVVweEdxYm81RmFI?=
 =?utf-8?B?UlB3VVBCekNKOEZMV1FoUGJvTEp6TnMvOC9xV09WNW5VdjQ5S2lTRjB1N016?=
 =?utf-8?B?QVlCVndMZVUvVm1Sb09aVllWcFFyYlM4bFc4dmhjUjlxMHFIVkUxRUkvOVpD?=
 =?utf-8?B?V1FFcVRZd0xPb2phbmJRL3BWR2Z6WTVTdFRrZFh1YUhGbk5uSHRtVElvWWIv?=
 =?utf-8?B?K2p6bXRoQmlBOXcwSklWNCtHYUszTVQ3OERBdFI0TzlnZkRhbWoya21MWE43?=
 =?utf-8?B?RGxMeVhWNThxSktFUHlmYUFDUmQvN25UWkNWd1k0Y0dMV2hWMUxseURsKzlS?=
 =?utf-8?B?eDF2ZVAyYzFGa0FtUFRJZ0wrWG5SMWNidmc0N05JeGw0emZGMWQ1QzMwUG9x?=
 =?utf-8?B?a2IrM0VXY0NIcVdiQWsrRTRBbUNTbFR2b3p1ODRpTzJjMURhQ1UxQ2doaXRU?=
 =?utf-8?B?NW1QcDlUMlJyaFl0KzlLeDE0ajJEQjN0c2xSazN5ZVhNSDgzSjIwUlpSWkZN?=
 =?utf-8?B?WTJSby9SdjcvME1PR1d2eU9Kai9SQzlXaGt2VUhySWY3dlNhSkdMdEo1Q0Z5?=
 =?utf-8?B?QlB2S2tjWHRMSkUvWlJvUUE1UDRQOUpoMHJDbmg3bTMrTHFZczR0L3JPQ2I4?=
 =?utf-8?B?WkpDZmlIVFNWTW9EdnZsSzRFRlFtQ0tQTmd4WWhJNEpzaitybzVIOE4wK2hV?=
 =?utf-8?B?MVZZYlQycHVzUkRscVdNUEFicTlpK2hsaVRIWEdaWDRlVjBiamlZdC9sUiti?=
 =?utf-8?B?dlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed002e5-5a30-4d87-31d6-08dca52426eb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 23:16:27.1290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Pof6unGuX+qy2JCf69dByO17mvOb5mnjTXHbAbZ7A/rNbfcfNx9YP6tmEjJAVOxJEU6xqTv5UOP2+vGQMYuz7Z4wvtXSp41Msb5aVMVNRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5079
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
> There is a new part to an existing workaround, so enable that piece as
> well.
>
> v2: Extend even further.
> v3: Drop DG2 as there are CI failures still to resolve. Also re-order
> the parameters to a function to reduce excessive line wrapping.

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h |  1 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 18 +++++++++---------
>   2 files changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> index 37ff539a6963d..0c709e6c15be7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> @@ -107,6 +107,7 @@ enum {
>   enum {
>   	GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE				= 0x9001,
>   	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED		= 0x9002,
> +	GUC_WORKAROUND_KLV_AVOID_GFX_CLEAR_WHILE_ACTIVE			= 0x9006,
>   };
>   
>   #endif /* _ABI_GUC_KLVS_ABI_H */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index f1fe5f9054538..46fabbfc775e0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -815,8 +815,7 @@ guc_capture_prep_lists(struct intel_guc *guc)
>   	return PAGE_ALIGN(total_size);
>   }
>   
> -static void guc_waklv_enable_simple(struct intel_guc *guc,
> -				    u32 klv_id, u32 *offset, u32 *remain)
> +static void guc_waklv_enable_simple(struct intel_guc *guc, u32 *offset, u32 *remain, u32 klv_id)
>   {
>   	u32 size;
>   	u32 klv_entry[] = {
> @@ -850,19 +849,20 @@ static void guc_waklv_init(struct intel_guc *guc)
>   	remain = guc_ads_waklv_size(guc);
>   
>   	/* Wa_14019159160 */
> -	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 74)))
> -		guc_waklv_enable_simple(guc,
> -					GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE,
> -					&offset, &remain);
> +	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 74))) {
> +		guc_waklv_enable_simple(guc, &offset, &remain,
> +					GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE);
> +		guc_waklv_enable_simple(guc, &offset, &remain,
> +					GUC_WORKAROUND_KLV_AVOID_GFX_CLEAR_WHILE_ACTIVE);
> +	}
>   
>   	/* Wa_16021333562 */
>   	if ((GUC_FIRMWARE_VER(guc) >= MAKE_GUC_VER(70, 21, 1)) &&
>   	    (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 74)) ||
>   	     IS_MEDIA_GT_IP_RANGE(gt, IP_VER(13, 0), IP_VER(13, 0)) ||
>   	     IS_DG2(gt->i915)))
> -		guc_waklv_enable_simple(guc,
> -					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
> -					&offset, &remain);
> +		guc_waklv_enable_simple(guc, &offset, &remain,
> +					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED);
>   
>   	size = guc_ads_waklv_size(guc) - remain;
>   	if (!size)
