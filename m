Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECBF98E8D6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 05:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E99810E04F;
	Thu,  3 Oct 2024 03:30:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J2Ezuny9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E49110E04F;
 Thu,  3 Oct 2024 03:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727926242; x=1759462242;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M//dpc8yeJN6pgDih1tt/tQnfcmWTPlp60jD9lWr5L4=;
 b=J2Ezuny9eL1SPOMILsJ7SFvvR6hJi2b3nakOXsM/aUrzMars30BZSlPs
 8VM/AFwQ+2WqOZy6Crp6+RIAHMU4cEf60g78tbhvtU/X4Vh7kndd6SMI2
 T1+3V6jk53kuFzS9gDCQkjzjO5VNX8jIdzPwxqh+QYvm+Nc/9uWnPPjbo
 7/BHL6bq3CVTdag6B9FnEN3yIjdXttyFRgVyRPS/fXtRSBX0AOzrIDuPV
 ByT6haqp0ZbI1anTNVueHhMKfz0yhooX+zobRWKhimR502M3AEXqe4h59
 yP0Y4J+Q6G0pQNzxehLslAb6o2wU5/bkaHrxDm7ThmpOgxyQVHBuuf9US A==;
X-CSE-ConnectionGUID: znX9PN+8Rd2aJYB+cUnOLQ==
X-CSE-MsgGUID: oPEo371qQVyr/QD9K5W7ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26915575"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="26915575"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 20:30:41 -0700
X-CSE-ConnectionGUID: qk43r723Rby3TaAlgYBVHQ==
X-CSE-MsgGUID: n6FrDg8WR3qqtxzQsg+eRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="78636134"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2024 20:30:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 20:30:40 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 20:30:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 2 Oct 2024 20:30:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Oct 2024 20:30:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhMejDsJn8WDVsNuCfqV+M6o1st9YtYvHotCwPwUp6J+R9lobK5ob+p0X9tqLMzwVXCJ7//KkOqsu8tpa4PnAmpG2qUjb/w2b5bSU+DNF4VH+0hnvMQYwRz9aQ1WGoU6VQ95Q7OP2UtoCO+VLSz4V9UZefcdv5tQvnxYfhT6uqEQLPBCj8u5VFBjkQhB5pX8O37ZonynxspdBkeuesU6eTwi1EnydCW77/Ob8fmxhUe/gzk3IvkCTitDhnw2ets6fnoITfPQZA4hCeaFucENolIVktCb+MPFjDccrplvUi9jN4lCYYrNCLY1gJQweigfVO+bp8NKkPTYxFJnm4lL7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfkLwa0kiqTXe90I58uLcZE4D3nJyHepOAaimFuz7Qs=;
 b=LKs+WFXKWVqVZZs0rtFu3c1/I8It3kaYPJmSnL+iNWeiggb7WNd2LF0hBsgZH9RqfK5poqlKh88TAYPy1ojXywfBPhFfVGUGISGPjMETIqJoJwM0b1v//aRG8wu/8q7WOp2rmo90hYLm0AMANHi3jCaVHQq7LaxsaijhJ066V9IyWA/z/DIz0lHgX0Su+zIv+EUMUHLSitiYZggIL7+1fw4EYZAC//nIhoOWg4AwyYzWBw4AcuVVdfM7z0p83lP4/2KJScvVMXnOt5cyMLIY1lE1LhTV72VBAViwBQ7bKjzx4PILAJO7290qzMUAzgVSExZZ3vx7UL9pW/eMzrs9Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Thu, 3 Oct
 2024 03:30:38 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8026.014; Thu, 3 Oct 2024
 03:30:38 +0000
Message-ID: <4de25ddd-1052-4d25-8c2b-557f2555841c@intel.com>
Date: Thu, 3 Oct 2024 09:00:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe: Drop GuC submit_wq pool
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <dakr@kernel.org>, <pstanner@redhat.com>, <ltuikov89@gmail.com>
References: <20241002131639.3425022-1-matthew.brost@intel.com>
 <20241002131639.3425022-3-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241002131639.3425022-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::17) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|LV3PR11MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f3ca850-0ef7-428a-1376-08dce35bbfdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUZYQVlESGkwcStVaDdrL0F1ZEJDdzU1NG5HWmRPUnNDbkNxOExGOEVpVUph?=
 =?utf-8?B?MkxHM2VoRUVpT1lpbnlVbWt4Y3hxakFnV0JYWW1ZempSTC9CM2J2MTNaOE0x?=
 =?utf-8?B?VWFCK1FLYlovNzZGRGF2UW1zeGJreWdJQmI5Tm0rVzUyNmQ2OERYWkJaNWNW?=
 =?utf-8?B?VWlNOUNXRXlkNDlwTzY4UEtyUklnWGJROGo0K0UycjJOM0NmNXFYamwySlhh?=
 =?utf-8?B?Vm5mQjAxQzVacWpNWHYwN3g0RngwU2hsT09zOTRzRHNIZlZqSUU2dDRVWk9E?=
 =?utf-8?B?OUhGVFQwTHpHTXROaEVIM2lDMFJNUXNPbFI0MmN3R2dkU2xBd0wvQ2xCOVFV?=
 =?utf-8?B?ZzJvYWlUSmxlNElia0RUUFNhNW1tVEt0S1hGV1U1SVV0VmJtc2plbms2K3RE?=
 =?utf-8?B?S1FWem5Nb3l0NkxGUlJDaVJlakZHeUM5NEFlU0pXM0RnU0hvQ2lWL1FWbU94?=
 =?utf-8?B?UTc4eURPbk5FUDR3QzFFeWkyLzhrWTR0dWZqNXZ6TjJPZzcrTlNDVWxRd3lO?=
 =?utf-8?B?QlZpVExaTmgrU0dla3B0NzYvTnorRUorVEdNOW1PdjE0MDlqWTZHQzNLSGJx?=
 =?utf-8?B?VzF1endNOXJyK2xNRDJpakZzbUtiRHFDZzhmY3NpcWJCbWZGYVpvdjB5Uko0?=
 =?utf-8?B?ZVV5NmR1YlVFQ1lWSml2dnVSb2VrcE5pRUtRY0dmRjVHN1NkSnMzdXJSS3RD?=
 =?utf-8?B?S0VEZWNFMVFqSGEzNWRsK1Rnbk9LWko2bElSNFBIYno2NmNmc0NybDFsMHZo?=
 =?utf-8?B?YnVrSGJYMldFelBWaVpORUxGbmd2NE5CWmVJeUNVMVNiN0t3VUJmMXJWTUFD?=
 =?utf-8?B?Y1pTV3J5OEY4MXkvblRGRVB6bVVrdkEzS2ZnaklEV1FGd242WVo4ZXlsZFF5?=
 =?utf-8?B?VU1yM2J3TVNPNG9ZM0NyaGpHb2owL0t1NkkwS20weWhXUlJDUjJ6QVYyQWtn?=
 =?utf-8?B?bStDYlhLT09nQ2NnQnVLME82Y1l6YjBqa1d0RDBSVVJPSEMzdVlRUUhOS0ZO?=
 =?utf-8?B?eXZVazhNaHhDb3J2ck4xbExVT1BhaDg3MGVLN1hHY1V0UVcyMU5qaUw1MlJX?=
 =?utf-8?B?bVE4ZzJ4WmE4ckxpeVdVVVk0V0VMWFZZK0xXYit3L2hYOWtHNmhQR0V5U0Jq?=
 =?utf-8?B?M2xvMWdpT0JaOHFacWhjR05JQ0owUFVYbGZNazljZjdKMS9vbmlSVmxHdkpU?=
 =?utf-8?B?bUhnbFNYcURUWmcyUk5Ka0YyMVovNUs4ZXpIcFllejNhU1c1T0NyVUlQZXc0?=
 =?utf-8?B?dnU4M1VHdGEzaDJ2NG5rY2VEb1JoeVdxZGdMeTFJK2J1YndaS2xRY0dLMHNW?=
 =?utf-8?B?Q00rdnlES2diYi9QaEUraENCWGhzSXY0bjVxWHUvWDBONEN6R1ZmMFF2cnp0?=
 =?utf-8?B?TVNMMzJqVkhFcllVYTZNaWJKNVgxZ3g3SkZxT05mTkw5dGhWNnZkZjJIaktw?=
 =?utf-8?B?L3MrVWpzQ1cwVCtreDZodWZiRFJZRnM4VkxFWGh6cnZDbHI4a1dWRTErVnJt?=
 =?utf-8?B?V1V3aW83TVJWRUliVThxekVJNGxGUGMvMmw0NE5ReDJLejNXWllDY2RJZ0Fk?=
 =?utf-8?B?c3NBOHFpdG9LNzB6RFB2S2UrLytIU0NzQmZ3REhQRHNGeStqdmNyN2VKMnFj?=
 =?utf-8?B?aTB2T2ZxOWFFNk9WbmIvcEgvMm14UDUvN3ZkQkFJcnAwU2VDbGdRcFFnVUZy?=
 =?utf-8?B?Q3ByWERUM2ZhVWxnZ2RxRGtSM3IyVitzOXhoY1djay9OL2tLRDh3ZU93PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enorQ3hDaFlOd1VxWnRiemc0RFRJNTJFMm5UdStoTmdiWGVNc0ZiRTB1QzJ6?=
 =?utf-8?B?RlZZM1ZFZTNsV1ZjdjN0UVJqYjl4VU4wdzgycklJY29ubDJ0NkQxTU5KeTJa?=
 =?utf-8?B?NTBhdUpCQkJndFd2UmFreFVyTjVSYlloWjBCdFh6RllYMTRpN3JrYkVVaDBu?=
 =?utf-8?B?cnlGQWRFNlR6QTQzRW54M0JqeWdrQzZPS3FSbHAwMldubmZTQWUxc2h4Wjg5?=
 =?utf-8?B?U2xka1FReXE2TE5YeVRpb2FlczZVWFF2Y25HT3p3OTYxUS92VDdDNklJOEJU?=
 =?utf-8?B?NUh2WVI4TW5tQlR4Z29qWS81RHVzaFo4WHcxQk4xTjNaR1B6dGhyVXVzUTJH?=
 =?utf-8?B?bmRSUFU4Wmc3OVBZY3NSNFh5ZWZscGhENCsvSlFtYmI2Sy80UmVPeFhsK0pI?=
 =?utf-8?B?dVJRWFpqa2E5cHd3eXhkN2JrOStpWjVWelhaZzNrYU80YlR0eFU3VzJobk9l?=
 =?utf-8?B?ajZDbmt5b1hpem1HMi9zN2h1NDFCeXNjVUliWHY0Z2ZxdXI4WmxRR3QzblhQ?=
 =?utf-8?B?VTZFVEJrdit1b2gvV0h0aW4yUlRpc3pXQUZRRzJxektwd00rU0FLWml0ajlo?=
 =?utf-8?B?RTNlWjdqRWd5M21SdmVodEF1d2ppUXNQVURkZ2MyZXpIQ09BMXZjYzVjKzlo?=
 =?utf-8?B?cW00bUJ2RVV5Z1doRGFCbzZyYS80MHBwSlJ5ejI2TnRhbzVrNGZTaUxRd0FL?=
 =?utf-8?B?OGJRM2xaeWV1aEk2WStPVEVnTDVKMmJVa3RNVDZ2UDk0Z3NFakgxZzliNGgz?=
 =?utf-8?B?Zm5STWlHdWwwb0FSTGptZ0JleDdjWmhWVzhtUzNVSDhJcEhOUGt5YlhRd3Ar?=
 =?utf-8?B?TGRQQnlaVWY0WDJrbFNkUVVSeGc0US9FNUxxay9ZbnVIRC9vR0dQUlZuMzZr?=
 =?utf-8?B?dWcwNSt3MzNJMVpYamdaaU9UNm4rSjJ5TXNqRkVZTkdyeXA3REY1empSSnc1?=
 =?utf-8?B?bk1qMXZpeTZnM1pvUkVKY2tOdEtHT20zam96NzdKcGNwdkxTTEV6cGdQTlVU?=
 =?utf-8?B?MEszSEI0SVJ1aTNSeXkvdGlaaHluYVpCOEc2cTNpL3FXazJSVlJOeGhERXJE?=
 =?utf-8?B?ZWYvQU9OQVlnenJ4RUR1bDJJcXF3SzVvblQzSnZBZmYwQmQvb2NCV0hVR2ZB?=
 =?utf-8?B?UUVwcEl5ZzZadUtGb2U4OGgyRWs4c1pVaVZZOHNpZnVrcFljZXk1citzbWxh?=
 =?utf-8?B?SE1OaGFYeFg1TEZDa0g5K3BLRGp2SllXQjRkY3BxUEJLYU9MOEdyRHVuaFFk?=
 =?utf-8?B?aExYMjRDSVk4RVZZSHIrWHp5TmI1MjVFRWR4c29rRnQwUkhKYzdXYTNSZVBo?=
 =?utf-8?B?eGQvZ2V3ODdPejV2U2loOGVza0tzT2R4SUVlK3RUOVI1Zm9SZVRWdjNJc3FU?=
 =?utf-8?B?WDNEYWhOcHVRSGp0cXRqdEhkOVdRTXdadFlBQmkxRS9TV2tOOXliRVE1MjV3?=
 =?utf-8?B?ZXZyd0lBT21WV1k3Tm56WGU0WjRwZWZwUnpmdXUvdzdzOHhHMzN6QzhlQ0dj?=
 =?utf-8?B?dnpOZ3BkOW1nT2piVHBHZEcyZFZwL0lvMW0yMjFnVXJyYjdKL2hHM3oxNEVT?=
 =?utf-8?B?MXdhd2Jqc1VHRUwvQ2o0OEpsV2JSUUZGYVVOM1BadUlqQzRHQjBCaDdmQXFR?=
 =?utf-8?B?Umt3OHdPc0MvQkFXTUlKOEkzSGtwaC9qVi9SWElORTk0djFuNm91UDBaRW5O?=
 =?utf-8?B?Q2l0VEdJSG9PMjU2Vng2MHp4Slc4VHRKQ3hDTlNDZlJ2akxDaVh6MTR4dGRM?=
 =?utf-8?B?cVA2U1c0dFNYajZObzVFVWt2NE52K3JzZE05OTZDTDcyTGdtS090cHg5WmVm?=
 =?utf-8?B?Wk41Vmo0MjBrZmUzTEpYaWpGNFNTUGdFL3F1TFlUTmdqNXo4VG03NFB6UXdq?=
 =?utf-8?B?dldITDAwZFpoaE1keUFvVVgzcFBlcnU5SkhldVBIcnJDUktWTWpGOUUya1NP?=
 =?utf-8?B?b1E2TlhjeDFJeGRwdDlEUXY3M2hHSnhXRkpiMzVPK1JrQjF6YzkzVjNQTmtG?=
 =?utf-8?B?Z0YvL0FIRk1SSTVHZUpPVmVXVHcyVGhvNm5RMS9rU1FEUDZFSWliSlBUaVVn?=
 =?utf-8?B?OG9yWVhEOWZqYlhrMEhma21rRTZCMEo5MENxOUFSaWdhTUFqRFRZdURlZnkv?=
 =?utf-8?B?RXVyMDkzQUJYcFdXT3NoMlZjNDVvMExBRzBMcEFzYjYreCtIcThISTlSWlV4?=
 =?utf-8?Q?llhnKYsanjWXwrwLy+Jumyk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f3ca850-0ef7-428a-1376-08dce35bbfdc
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 03:30:38.2825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /SMV3RvIuLuNbOe6n8yVVRf4vtZbYxto+gn2ohZNQ9gln/k/cAfebNuiY/Mn99iwpDwvOnvrV5Zylnbx97p5PgWGhQ4h8fIApTO8VNOLYtw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8603
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



On 02-10-2024 18:46, Matthew Brost wrote:
> Now that drm sched uses a single lockdep map for all submit_wq, drop the
> GuC submit_wq pool hack.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 60 +-----------------------------
>   drivers/gpu/drm/xe/xe_guc_types.h  |  7 ----
>   2 files changed, 1 insertion(+), 66 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 80062e1d3f66..ce251845d59a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -224,58 +224,6 @@ static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
>   		 EXEC_QUEUE_STATE_BANNED));
>   }
>   
> -#ifdef CONFIG_PROVE_LOCKING
> -static int alloc_submit_wq(struct xe_guc *guc)
> -{
> -	int i;
> -
> -	for (i = 0; i < NUM_SUBMIT_WQ; ++i) {
> -		guc->submission_state.submit_wq_pool[i] =
> -			alloc_ordered_workqueue("submit_wq", 0);
> -		if (!guc->submission_state.submit_wq_pool[i])
> -			goto err_free;
> -	}
> -
> -	return 0;
> -
> -err_free:
> -	while (i)
> -		destroy_workqueue(guc->submission_state.submit_wq_pool[--i]);
> -
> -	return -ENOMEM;
> -}
> -
> -static void free_submit_wq(struct xe_guc *guc)
> -{
> -	int i;
> -
> -	for (i = 0; i < NUM_SUBMIT_WQ; ++i)
> -		destroy_workqueue(guc->submission_state.submit_wq_pool[i]);
> -}
> -
> -static struct workqueue_struct *get_submit_wq(struct xe_guc *guc)
> -{
> -	int idx = guc->submission_state.submit_wq_idx++ % NUM_SUBMIT_WQ;
> -
> -	return guc->submission_state.submit_wq_pool[idx];
> -}
> -#else
> -static int alloc_submit_wq(struct xe_guc *guc)
> -{
> -	return 0;
> -}
> -
> -static void free_submit_wq(struct xe_guc *guc)
> -{
> -
> -}
> -
> -static struct workqueue_struct *get_submit_wq(struct xe_guc *guc)
> -{
> -	return NULL;
> -}
> -#endif
> -
>   static void xe_guc_submit_fini(struct xe_guc *guc)
>   {
>   	struct xe_device *xe = guc_to_xe(guc);
> @@ -297,7 +245,6 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
>   
>   	xe_guc_submit_fini(guc);
>   	xa_destroy(&guc->submission_state.exec_queue_lookup);
> -	free_submit_wq(guc);
>   }
>   
>   static void guc_submit_wedged_fini(void *arg)
> @@ -359,10 +306,6 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
>   	if (err)
>   		return err;
>   
> -	err = alloc_submit_wq(guc);
> -	if (err)
> -		return err;
> -
>   	gt->exec_queue_ops = &guc_exec_queue_ops;
>   
>   	xa_init(&guc->submission_state.exec_queue_lookup);
> @@ -1482,8 +1425,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>   	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
>   		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
>   	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
> -			    get_submit_wq(guc),
> -			    q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES, 64,
> +			    NULL, q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES, 64,
>   			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
>   			    q->name, gt_to_xe(q->gt)->drm.dev);
>   	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index 69046f698271..ed150fc09ad0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -72,13 +72,6 @@ struct xe_guc {
>   		atomic_t stopped;
>   		/** @submission_state.lock: protects submission state */
>   		struct mutex lock;
> -#ifdef CONFIG_PROVE_LOCKING
> -#define NUM_SUBMIT_WQ	256
> -		/** @submission_state.submit_wq_pool: submission ordered workqueues pool */
> -		struct workqueue_struct *submit_wq_pool[NUM_SUBMIT_WQ];
> -		/** @submission_state.submit_wq_idx: submission ordered workqueue index */
> -		int submit_wq_idx;
> -#endif

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   		/** @submission_state.enabled: submission is enabled */
>   		bool enabled;
>   		/** @submission_state.fini_wq: submit fini wait queue */

