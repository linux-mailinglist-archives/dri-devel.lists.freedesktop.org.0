Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2816BA1B5A2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 13:21:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD8410E04F;
	Fri, 24 Jan 2025 12:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lsLq8PCV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B4B10E04F;
 Fri, 24 Jan 2025 12:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737721295; x=1769257295;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=tSc4kAfLw8lz4r0Eq/x3oj7KBLr2SkrQBVNs9qKcxHQ=;
 b=lsLq8PCV+tQ3d3yYhewNY0BEAyKuW3QgntVzopgLdiW2X2ENkhnCRt0z
 DXHUo2Tf5AEBP8dbGsyTXJ8nK+ZE2HU1pqqQXhOd5mqix3umSnXLtWafx
 3lSoZoFOeK/+2jOKBwBdjn8sYBI8tTK/IF816zuurpSj3L6dhROmxxuHI
 d2AjCpqi1Lw4psmgDWbYmgL5i90fFusvbQ/7MeE+hf7G/5Wo8hs9xjiS0
 WCJHy10JZqIGvZ9WAj5xH3wSDEJlcNB8Mlvr33kda4HwvRgi9TDwOm9oa
 MspiZdz565aT/N0u9gk/CTaj65+QMib7loPP/6H8Y9zauaUSCPqKh/1E3 w==;
X-CSE-ConnectionGUID: Ihf6e0zIRvqlpIyqbFHHBw==
X-CSE-MsgGUID: ENCVWzy8SlCAsIDvq4ZW/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="55799654"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="55799654"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 04:21:34 -0800
X-CSE-ConnectionGUID: rl200Gf+Ski9y7JmmZiJ6A==
X-CSE-MsgGUID: uCppGtbKTsCrEYj5c52Yng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="108295302"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2025 04:21:34 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 24 Jan 2025 04:21:33 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 24 Jan 2025 04:21:33 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 24 Jan 2025 04:21:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dfJnkfGE1qtYKDm6hkCH7yMZFQEVOWIJaeoI7fCtZqPSl+HpVC82pWLHfYJV+1iRhXuj3V12po1IJ0XYiAJB6YM6LbZrjLosJ4MTcBC4XB7gNKp2v8JOrB4r4OcJ+JDBMs+8Iw9sKQKVNjlgoMQpRG4Qv9HU3YF34x9boqBzfMKZAT4S+fPrfChr7xBuAQ99W1HGhEaSU+D3MMirdWj/e0Oco0cqoJsJkfgXD/CJ6aJMo/xXlb8JwLPQxQODQeQbf7H8iuOY6K56vYueIb15mvGbQH06fpPIxYEMrMybd7MZAIa0f8AvyKvdvMZoiT0Q37nj6XtE8pp57wGq/4ItYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OSUG9l/LLPXr7wD7cHv+sq68tAnnEbahNXT45Z+qfk=;
 b=FsZZNbpGklFIoT9nQ6r8yjrESDZV5huHb9bv7/PFQVegQEChw5D3rzcoac1GYVRt0qq6K5UWYXknbJlPGU2aUDJeXFVvo1qmI2kRvFhNm8qQD9EHailUFmKzjKJNAgwm5iFbdFL4jHgACop8AS2JiL2WxmU9tuTimOPB18XoU8vRN6RxuMLnLm/ymVeZl+MFL+no5mt0vIL5X9VA61x5Z4l2+GZjYF6ufdkCEVMOvQCTSGv2fauJNdb9EZADgHRENsYoZp/5nMH0UEmGXuc/mVnQW0X/7/rWCGbCIM+234889dMVG0u5BYBNlED1hAA68vChpLdL0BaqCruUDCjtHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DM4PR11MB5296.namprd11.prod.outlook.com (2603:10b6:5:393::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Fri, 24 Jan
 2025 12:21:31 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%5]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 12:21:31 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87jzakbfd5.fsf@intel.com>
References: <cover.1737644530.git.jani.nikula@intel.com>
 <11497a3e490c001f3a884acb310b4812b643a9a0.1737644530.git.jani.nikula@intel.com>
 <8734h9mujs.fsf@intel.com> <173764885189.34727.4688059102283695255@intel.com>
 <87jzakbfd5.fsf@intel.com>
Subject: Re: [PATCH 4/5] drm/print: Include drm_device.h
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-gfx@lists.freedesktop.org>
To: Jani Nikula <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
Date: Fri, 24 Jan 2025 09:21:25 -0300
Message-ID: <173772128587.3215.14493226150879231009@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR04CA0129.namprd04.prod.outlook.com
 (2603:10b6:303:84::14) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DM4PR11MB5296:EE_
X-MS-Office365-Filtering-Correlation-Id: 6280f2ff-49e6-4100-4225-08dd3c71a2b7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEY3OVJrc3NtRWRYYkR2VmdFZGUzOVlFWENEM2h3QzlNN3hGMVhUcG8rNFdS?=
 =?utf-8?B?aUc5ZWNoSWZodUo1SkU3VWx1b2xETzNpWDJIQnpGYzdLb3dPRUxvdis2OUlG?=
 =?utf-8?B?WTgwTTZTNjY2V1lNWW10WDBsL2lCMUxOdTZoZHJ5aGxBMDNiVVVTSU15M2Vn?=
 =?utf-8?B?TFdFMDJ5VHZ1NTFqZ3dkdWx4WmdkVUVjNE1wUXhweVBoZXVaVU9yRDZYa1VU?=
 =?utf-8?B?blRTWElySHdMcVlMU05LRkVzZ25IdHFVRnFrZmI4MDJqc2dDWkp0bmtWdHFl?=
 =?utf-8?B?Y3MvOU5LVS9ucmU5b0dHSUVRb2dFOGhzMjNUbmhhanNFV0ZYOThhdFFoV0o3?=
 =?utf-8?B?ZUxIV1VaV1ozMkp5VUFkUmY5cDJQbm1ab3FYajBYTzFXTG9NV3A5WHMrQnUv?=
 =?utf-8?B?M20xVUNKdStxVzdiRXE0WDRNTnA0SmErYnJHcWEvaDgrYXdWOUllalQxR29j?=
 =?utf-8?B?K0FqRnF5QVd4d3ZuMmF4T256a3NPdzl1TjVRV2ZXMnp0WFozL0JOUkZoSW1o?=
 =?utf-8?B?QzRaa3JOR2QyNWJ5dmt3TmVCdXdHaTgvMXNSMGFnczVqRVFQbVliZ3plTlFN?=
 =?utf-8?B?cjFuT25HTjdrcnZPSFYrSkxMeFQxaERLczdaQ0dCVFJXNU11aG5ZY0t2M0dB?=
 =?utf-8?B?L0pIaGtzZnExY2lzVmVKdG8vRzZrL1ZlLzUwTHl4ZzVWV0JDbUxSRXVkNFRM?=
 =?utf-8?B?OUI5aHZvS2ZzM3RCODNoMGVoMHMyZXNjU09tcm9MNVJLQmdDeWt2UlhMdXVn?=
 =?utf-8?B?SkNNVnY5bHlobUpDcEdBUER1YlZ3YU1NeDFaSzFvMVNGMGV4SW05RWNxbnFk?=
 =?utf-8?B?L2FBMXpEZjNyWTdNbFJqMUx6TlRCZVc1TEVhWXR0MjNBTW0rUzArT3BiTHdT?=
 =?utf-8?B?MDh1TzhNUVBucWt4cEVzUDJWMlJLOWZkRWRLUU1mb1h1Z0svdFFzUHNKQ0l5?=
 =?utf-8?B?MlE1OG5WS2Ziazl5eVoyblVWVEZOTm0vL3NuU1lLSlo3ME9XNGxDanUvNFBt?=
 =?utf-8?B?UlBTT003RUZzdmx1bnNZUXBJVFFLUEVtWkhPLzB6aldVNi81K2hpblFFZE9M?=
 =?utf-8?B?aWltNDdTcWFMRnhiTGlHek1HcVQ4dTRidlVCV2U5Z3d0RVBvMnV0TlBBUXFN?=
 =?utf-8?B?Q3pHNE9PNTF4UGIreXBZZnB1SE1XYlJSd3FpT2JUOS9BS0xSVXI2bUVMc3Bm?=
 =?utf-8?B?TW9NTzFjUWlqUks5V3FndUYrYmVzZTh3aW9UNnRvcWxzdS8wWDB1MXZsUTdi?=
 =?utf-8?B?S0c4a1hJbk5mT2QydXdvWnZ5U2srMDVsZ3hwaTk5amNHZDVONnFyL2tEclha?=
 =?utf-8?B?WHhSUW16b081N2ZRaVh0SzYzUGlETHFaMjZodENiSzVNWEcxOUtOaDBwdWRG?=
 =?utf-8?B?bWFOQW10aTl6aWVkb1hKcW55TVZjclhIN3FNcnAzTFArSG1NaTZvYWUzNlRu?=
 =?utf-8?B?Y0RtbFgwVWZlRThTbE5VWVFqYUVhNmZMTitrcU1XQ1dBbTVXd1ZzQmJPMkE0?=
 =?utf-8?B?a3VZWDIvRVpEckxncTh0Z21NNkFRRUdIS1B4YWUvdmJGUlowVkQ4SlA2cTV5?=
 =?utf-8?B?NVFNL2x1RjhWN0hoWStieW1lQUt0LytrYUY4dVVPaktnYjBTSGtxdDk4b3JD?=
 =?utf-8?B?ZzdIdWhDZzc2azRjWFQ3MmloaG1PUlRtZ1hCRW1jbjJwVkFLbzZkN2wwV2oz?=
 =?utf-8?B?b3FuaVlwZS8yTkFjWGtNVWNCRExiWFBINTlGUzE2V2VGVVU4b25xM2VXWVQ3?=
 =?utf-8?B?NXVOdmRleG5VNVB1L2pNLzRLOEg5YkdWNk5IcEdhcm5qU2xac0NqODQ1R3Jl?=
 =?utf-8?B?eS9HNksyWkRFdEU5N3NoQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ly9SYWJ6ZWZPZ2tpOVZ3NVNDV1VOYzhIeWNIM3dZa1c1eTBxZ2VBazVIdnFH?=
 =?utf-8?B?VjBqZzkwaEdQclhQL1FoSlMzOHdIMDROeXNMSEdZODR5WU54WEhtWDByUmxD?=
 =?utf-8?B?cDFFN3BXRG1RdDZaV0RCMXVIWjc1MlVmcnZQamY2TGxBTnU3dHNoRjdnMU9W?=
 =?utf-8?B?dnRvTllBZnNkSTBwVzBLWXU4aXRKMjhUOUVVa3NvcEkzcG9LSnIrT1AvQlBR?=
 =?utf-8?B?dFZ2akp5V1MyQS9jdCtFbkpLTGs5bnBsd0psb1h3VTlPWjVZWHpVdHlpS04w?=
 =?utf-8?B?SnpPWWZ1TzlJeStjYWdxYXVhekpWaXhUSzBCWldBNUU3UlZMdTJUSTNtcFpa?=
 =?utf-8?B?VXdlZ0xZeHJOTDJ4NGxPK2NHcGVMR2l4L3h2dWNzeFZhRnJQR2JrSVF2Yjlo?=
 =?utf-8?B?ZDA2S0hxZ3ZFS25wMk5wcGFLNDJpaWdZUUlURjh6QW9pQUFBMGk0di9POTlB?=
 =?utf-8?B?ZFV4Zit1UE85aXZmbkN4cmxwQ250S1hjQ2xtVWNsSXVpa0RYc0c5M2ZQMGU3?=
 =?utf-8?B?dU15YjJnSWk0V3pNRnpORlhoVHNKTmVKSUhxQktnb2szUG9NdWEzdnE0UDBR?=
 =?utf-8?B?bHZWaFdJNXR6MjZvdVo4RnpLRE5MMkI5S1R0K3lPWFVJS1V0SlFnd0NheGFm?=
 =?utf-8?B?VTBkbVIzcllGMmgrYldTUG9TOW5iOUkrTU5waExMUDZkcVB6RzlQb2YvVlhU?=
 =?utf-8?B?SjBZTnRzZEljWUpMbTlSVjBtNml0bUN5RTQydCtscXRPcjhkUzB2bVlVenIw?=
 =?utf-8?B?VW5JcjJtNG40UFZqOWZSK3RqNVM5VzJLTWpINE1FNWQwdHBsS1dMUGVsYytr?=
 =?utf-8?B?bjVwdlRKSUp2eW9YaFpzS1VxZ1ppRjJ6d05QTWtzNnpUUmx2ZmJ5V1IwbXht?=
 =?utf-8?B?TURESGdNQ1FJMnppcDlkVFExc0d0TlIrWXo4UDhabWZBSU9hUmxDZ28wTXEw?=
 =?utf-8?B?SnFBNFF6dmdJMXFNZGVxbTBDK1NXQk5YeVNZQkkwM2V2WmtmTnFqeDNWSFNO?=
 =?utf-8?B?OUk2V3RSc1JiWDR1WGE4Wk5OcWdiQXpyRXgrYlUrTlVJYzcycmMvUjNWZzgx?=
 =?utf-8?B?MVZSQjA1UUxTSkV6T045SnNsZndnUU1rUklhVDgydnhZWXJ6UFpRYnRIU3N4?=
 =?utf-8?B?Zy9DamVjTnlNRXJHVnBMYzlVYmhqSEZEVlVQRkY4ejd4M0VBQWZJMFBaaWsr?=
 =?utf-8?B?dktDbWxEc3JUUko1aTQwaFNnbnc1S0NuZUQ1blkxR3ZnalpycHpENzJpTXNi?=
 =?utf-8?B?bGR1bWIrWGpLaEZrZzZ4NVpWZno0MlJ5b1dJZktxVWlHTzA3M1B0aVYxWWkv?=
 =?utf-8?B?Rm5TS3pvRjBkTEF2ektLOHhqK3lWVjhMb2dranNJaDRiZmV0Z3JJaDNKN1Qv?=
 =?utf-8?B?L1pTcndLVDcrTDljM2ordlRRU3lZSnhtdWhKYkRvUE5tMWpGR0NBbFZaS0xR?=
 =?utf-8?B?eW5TaW9YaCtmbGFzZnhsVUxNbmxrYW5PRVdFa1kvMDBIQXNkcFZ1WUdYQ2Y4?=
 =?utf-8?B?aVBQZk12MFh0Nnk0bmllQW03TzgrbG43a2IvN3ljTmpEb0V3dE1UTHBVQUJO?=
 =?utf-8?B?ZXNBSnJORVZmdkgxeTZFNkNWOVlZdzJiL3lBQUxkVXlaeElERFNYN21PME1J?=
 =?utf-8?B?cEN4RmhuNlRkcmFPOVhVdEJjRHYwZTRBSUlZSXZEeFBqZTI4UzJhSDI5VVlJ?=
 =?utf-8?B?cGN5T01LMlZ0WnFqRStuMFhaM0w4NkxxMUJvMlRzRVB2b3BZWnpJN0VuQWFV?=
 =?utf-8?B?NU02bERjczRZWXJudzlmSkM3dHAwdTVaOExoODc0SjBCaCtxMkxleVlVWlVY?=
 =?utf-8?B?WDlvSUUxZFJua0FzSERMaWJValJSSm9yZmpHUTVaNmZlQ04xVXhkek5CZGdP?=
 =?utf-8?B?K0RaNHlPVzFCdW9sVENteTdqRXpFMnhVK1JXRS9Jc0pYTkpyL1JPY3V6djlr?=
 =?utf-8?B?dTNCOFZtdHduUHV1akFLVHAyUkg4N2RVT0xoeGhOUHYyRmpkaG1PaTFrS1NV?=
 =?utf-8?B?NzlTVGZGVmp1bnZaMU5OOGdXOFZsNkVhK2NicVlqWlYyY00yQjZjb1hiekd3?=
 =?utf-8?B?dWFTK1hPcGRySS9CWUlwTDUzYlh2YlBNa3NPQWExZ3IyVHVXTVlBcVZ5Ui93?=
 =?utf-8?B?TjIvWU1FbXAzbmdSRCtOOCt3RTZJeXJCVjF3OVl3UDhLMmhTS0p6azNkbUlF?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6280f2ff-49e6-4100-4225-08dd3c71a2b7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 12:21:31.6684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ePjN0m8kQoI+50LCmhQJxIDrFyMgvYWGKTGDNUdESpVHXzUSHeUsPg28M6QOfWxfg9tKgST4z/Yx2cMXFo+Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5296
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

Quoting Jani Nikula (2025-01-24 08:50:14-03:00)
>On Thu, 23 Jan 2025, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
>> Quoting Jani Nikula (2025-01-23 12:14:31-03:00)
>>>On Thu, 23 Jan 2025, Jani Nikula <jani.nikula@intel.com> wrote:
>>>> From: Gustavo Sousa <gustavo.sousa@intel.com>
>>>>
>>>> The header drm_print.h uses members of struct drm_device pointers, as
>>>> such, it should include drm_device.h to let the compiler know the full
>>>> type definition.
>>>>
>>>> Without such include, users of drm_print.h that don't explicitly need
>>>> drm_device.h would bump into build errors and be forced to include the
>>>> latter.
>>>>
>>>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>>>
>>>This posting should have had
>>>
>>>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>>
>>>but obviously not needed if the original [1] is merged instead.
>>>
>>>
>>>[1] https://lore.kernel.org/r/20250121210935.84357-1-gustavo.sousa@intel=
.com
>>
>> Hm. Since that's in the upper drm layer, I thought I was not supposed to
>> merge it myself.
>>
>> Am I? In that case, is it okay to merge it via drm-intel-next?
>
>It's generally not okay to merge non-i915 stuff via drm-intel-next,
>because only i915 is under our maintenance. We'd need rationale and acks
>for that, which we occasionally do, but there's no reason here.
>
>But you can apply for drm-misc commit rights, similar to drm-intel, and
>apply the patches to drm-misc-next yourself. See the maintainer tools
>documentation.

The first bullet point in the list of criteria for drm-misc[2] says:

  "Submitted a few (5-10 as a rule of thumb) non-trivial (not just
  simple spelling fixes and whitespace adjustment) patches that have
  been merged already."

I believe those patches should be targeted at drm-misc, right? (meaning
not stuff that have their own tree (e.g. drm-xe drm-intel)).

If that's the case, since this is my first patch targeting core drm, I
believe I would not fit into the criteria right now.

Decided to ask here just to make sure I don't raise a request in vain.

[2] https://drm.pages.freedesktop.org/maintainer-tools/committer/commit-acc=
ess.html#drm-misc

--
Gustavo Sousa

>
>
>BR,
>Jani.
>
>
>>
>> --
>> Gustavo Sousa
>>
>>>
>>>>
>>>> ---
>>>>
>>>> Including here as a dependency. May be merged independently.
>>>> ---
>>>>  include/drm/drm_print.h | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
>>>> index f77fe1531cf8..9732f514566d 100644
>>>> --- a/include/drm/drm_print.h
>>>> +++ b/include/drm/drm_print.h
>>>> @@ -32,6 +32,7 @@
>>>>  #include <linux/dynamic_debug.h>
>>>> =20
>>>>  #include <drm/drm.h>
>>>> +#include <drm/drm_device.h>
>>>> =20
>>>>  struct debugfs_regset32;
>>>>  struct drm_device;
>>>
>>>--=20
>>>Jani Nikula, Intel
>
>--=20
>Jani Nikula, Intel
