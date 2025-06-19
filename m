Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D98ADFE9F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 09:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36AC10E1F2;
	Thu, 19 Jun 2025 07:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z8I1+QBj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886EE10E1F2;
 Thu, 19 Jun 2025 07:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750318001; x=1781854001;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B3FQUlzPN8H685r7vyRnRhG/rl7JYObvChn5ANWmzbU=;
 b=Z8I1+QBjYbWum/jTWmotLHx1azRXKbBkheEmiuUvUKY8nDxXCnr4Tgih
 L9D6iAPEoo1wcI1bfIMowPYdHnDSWEHk8SygmFluaOlgfufuf6zdoBEZ1
 /1MirlRU1e3zO3I/MhyDelTP568cmeRTVI4QpHpC/8Gd1WfbYoowI9mDo
 CtpWAuzPRGJAOu6NL83e1OiR7COIMSrXGHHunfgfT2tGj8MnY3fNr6s2C
 LH4QC1GmZrTjntFTOWh1ttCM0U40BXugyGUmsFUL/hbMgZCy7SyxxVG4h
 1JvnX8so8IYj47fxyKJhlTqOmtaONNriCg/kvQ3pmmNk5eR8Ks+h23Rej w==;
X-CSE-ConnectionGUID: HeXruH+LTVK3Qngl53qWkQ==
X-CSE-MsgGUID: HHfIIv+xQjOsrlRcDFrb8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52654800"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="52654800"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 00:26:39 -0700
X-CSE-ConnectionGUID: qXK/8GjqQEG6yCS0LJ8D/w==
X-CSE-MsgGUID: ZaNKI3HGTFi5BtnQ7HBzQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="181430001"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 00:26:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 00:26:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 19 Jun 2025 00:26:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 00:26:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WrzzQD/CaDwGHZrVe3KXFifgIly2i4TaGepcezAK9L3cLxqiSYqKdpP0nprJfc7UjF7hLeXPIGGLGm1QkUEINQWoD5CSGC/FNDvs70AHaCSITrJL/xptkI1ZEwIPOnNZUj9PERDBeM1uIabh3QWvuzczSqpHsM1BrqLExkD7ANIUpGUjqckqdpUqfsDDa8sARDQQ1nhtXmOkQGm0kIef/rAsJ3FqfEfgj1Nh5XbM/J5inWUEk7FATtSDByCUhk4ht0IbFm1oCcecXl4JtAWmYIcJ6CFKD+E7yxqdP04n3pCKTChqV8h65tnQMoRxgMesSICZhY1NyoM5ccq8Ms7ZtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEHKTn9Qg/tV3+r7PK65o8NjdNuCLg4qPNL/Soh7FpE=;
 b=urR35ryrmQGdWxfaf2nxrF8s2YD5yA43rKywtotIrNia59SnICEhX97A9psGiZg4EPsQXt+eoUvss+D4YRNjLjjzQQyVTsseIemOIrYytgL/gPm+WQGHQjPlv7Ho4gKHXOMtMHcqT6cKU34eSUds+0ebzwCaHL4cYkdsWvBj10iM8Jo/J5CJfrJfHQyuLLVSQz5kXDGSr2D2ccBiG92O+23IC4EcE3PkdgPdYu5cWkxpeK2BBPRIRD4rbAHuJDtAYNWtzU/AQT5oJbbYzEyI8fXGR27OcALppBmxPM8Iwtq0+S43aZ1UeP8iomkcAXELq+aRb77D4OE4mEpVFdEyZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA0PR11MB4621.namprd11.prod.outlook.com (2603:10b6:806:72::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.22; Thu, 19 Jun 2025 07:26:36 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 07:26:36 +0000
Message-ID: <dca4697f-c76b-4023-8605-79f7d593826f@intel.com>
Date: Thu, 19 Jun 2025 12:56:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/xe: Add a helper function to set recovery method
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <lucas.demarchi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>, <frank.scarbrough@intel.com>
References: <20250603081409.1509709-1-riana.tauro@intel.com>
 <20250603081409.1509709-3-riana.tauro@intel.com>
 <aEMFcBSWL_jPMYKa@black.fi.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aEMFcBSWL_jPMYKa@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA0PR11MB4621:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b1ce288-01b8-4b51-9a2e-08ddaf029f6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajd1ODZZSjRZZlQrUnhsdWRGOFJvdFlNK1BrWFVwTC9CVU5iVEZCQ2tIdjlQ?=
 =?utf-8?B?RFZzNWN5TlZ1dzBEdmFaQjVTQmJxeURocE51UWJ2dysrbVhyOEpGbTRVay9r?=
 =?utf-8?B?ZFNST0dxUkpObllFYXhHSlllVXhMYnhXTkw5bWkrSmtQQUxuYW5xYmRnb2ZG?=
 =?utf-8?B?NlpCNVgyVzFKa2c1RmlIc1kyWGtTS083VnNqb1dKL0FwNktqajZCZ2tqUDNY?=
 =?utf-8?B?cWJpK3VwWmo3U0tUaHR2YlN5YkpnYUUwaUR1Q1VaeTlQbjlPVng3TE85cFAr?=
 =?utf-8?B?bStSOUZsa2VTdC9tb3llbFUwbjB1VGx6UlpKbzZTWnpqbG0ranE3eU45dXRO?=
 =?utf-8?B?WGk1Vk0yRU4zV1FJcDJtR240bTNQVWZFUWFUekJwcnpuVHg2YTBmeFFQcmhG?=
 =?utf-8?B?eVRpOUtDUWJQa09GRFFUaUNLR3pIZEI0YmJLL2F0YlBaNmpWQ0kvUjRLaTd1?=
 =?utf-8?B?azZiWGE2bDR5QWtiWmNnWm8zNDkvZzByUjh5RE9QVHd1OGphWVYzbGhBZ0Nn?=
 =?utf-8?B?YnVLVXVjMng0VzQwS01zZ2RIczlHSE1Jb3FBKysrbUIwMkpIUkhlYzJoekIy?=
 =?utf-8?B?cG9qSU5vRUxlbHc5TGhhSFpHR1BYQmovamdROG1GeUcxRVVZRENmUENHMGtq?=
 =?utf-8?B?azFxb3NiM3JWa1hHZ1N3a2pBM2FuZ25OQTZiNUd3dUNNc21LS250bUZNQ01s?=
 =?utf-8?B?REF6VHdiMjUrTVlzWmxJVWFLOVpDWEpuVUdVM3M3cHVYMXQxZGFGTWZ0cjFM?=
 =?utf-8?B?NkkxUUd5Mjc1ZjVnTjBjTUgzL0ZMdER3eko5TWt3Q2pHTTlWSkpkK2VxYUor?=
 =?utf-8?B?dUJQRmZFL2xLKytyY2puS1VucUxTeE9tdHdjN1IzYnZZWmZhNnRwb3FKbEhR?=
 =?utf-8?B?YjY2NEpYbUNFdEFUWlU1dEV2MWZIUHFaNHVJaEprMytXdWl0d3dZR0k5M0h5?=
 =?utf-8?B?L0Y1WFJKQ2RLVU14aG52a2o4OE5NZ0k1TDRBU0laSHNid041ZE5yRFhHU255?=
 =?utf-8?B?NkhxaC9KNXhxYmNkeXJsSWdES3hDQ3IybllxeElyY2dZWXZFRVQvb2VjKzY2?=
 =?utf-8?B?MmJRdDZsL1MzbXJhZ1loMkc0MjhMQzhIYjZyd0RmYldWbXlrMzNJcytNMDdE?=
 =?utf-8?B?TlFUTUFnaGpFa2JxRDlKZGNKdDRoaHArUFRyU2RnRHpmWWlmZEl6dUN0Wkh2?=
 =?utf-8?B?cGoxUXpDUjlydEg5SmVyVThBSEg4Z0MrS1Evckt1OWxqRGI3T253S3Y0Qits?=
 =?utf-8?B?dWFoM014T0llbzdVTHB6eWNFaFRWK0hHNzhRRVRVcVdtanNUWGNEQ3NlQUxX?=
 =?utf-8?B?Zk1FRzBhbmdKbG1BN2dYVEx2UlZnNXlZdUhrQmNiS1JGQWVWMlhnYjdnY0pz?=
 =?utf-8?B?R056blFjRGpRTExNaEIvRkpMSHM5T1VpeHV6Qk1BYkdoVXlld2ZHMkh6VWNE?=
 =?utf-8?B?blc3QkhrblBQV3VVM1J3M3BuRTBNTkdEbWkzZi9RTlNHY3hjWXhqdVZjeHMv?=
 =?utf-8?B?am1BVTdLeUxRWCtDZlVPeVpkeGxWdEpjSUhLVHlPOUs1dkhjMGt2MzVWRzgr?=
 =?utf-8?B?N1BkTm54RFhoRGx4NFZoZDlncnF6Y1N4WnRLdWxEQ1dCV0dvOEpVNy81V1Jr?=
 =?utf-8?B?cHpKemh0M1RaNFE5bHRRTjBJUWVEaGxVVjhNWUs3V2ZLU1NidFZHS01EU05O?=
 =?utf-8?B?YmVxK1hjaEYyYjZUVVhGSlZRUVdCOHFHcWhZTjVUamE5WEtyeWZrWGZqK1du?=
 =?utf-8?B?S09renpTUnE0L2dyZHNuSVl5bWM0K1JreFE1QmVueEppNUNqc21FKzJFYWIv?=
 =?utf-8?B?UEVzVFNkd05LQTZmNEEzc1RETGxmay9PckRJanRJYU1xTWwvckVGS01SM3FB?=
 =?utf-8?B?Vk1LSUswMU5ZUFUvcnF2VU4zVTFlaERqQjU3STZqVlovV2ZPeWQvTVlQSkZy?=
 =?utf-8?Q?90WDIxg657I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEZydjB1Nml6TnY4NkpqUWg4MnFvWVc5NVl3dnFmRHRsaWFuQkRyWlU5QnNa?=
 =?utf-8?B?Rkp0VlkrTVRVOU1CZGdiTk9nVTBmUDlBeTN6dmtGZnVFQjZ2UmFaWlY4cGdQ?=
 =?utf-8?B?aU5TWnNPSW9CRS92NlZXYndlWnYzdy96UWxqZXRiRHhlenR4UVgrRGh4OG1J?=
 =?utf-8?B?K3NwVnBZbUV2dUtZNFNxUzE0VTVFTVVzeWlnRm9iY2MyR1NwTm11WXp5UWhC?=
 =?utf-8?B?eWtpVEJab1dKM1RpVEREMUp4REdjbndVTmFqR1RWVlBaZmNjaldDSmx0c1pC?=
 =?utf-8?B?VTZsdnZnTnkxK2JGMUdVUFJCcWhtT2h1L3lVaVF5bzlKS3BVL3lIcUFsN1l2?=
 =?utf-8?B?WlFMeWcvNDdJUkVxSVhSdkNvSFNUdlpxc3JsTzNQNWNqVktqVCttaUVHRitN?=
 =?utf-8?B?aWo2SGltUVUxa2xjVHRiamdNcEJ2SWZ5eDcxWFJUVlVEVjZZS3lwTlpSWWZR?=
 =?utf-8?B?S2pvRDVteHRWTlc2QmVrTjdPZHIrWFl3NGtzYWJ1YVZ4cnMvaFlZT0hlZkxr?=
 =?utf-8?B?MDVwTE4zSnpZM2d0ZmsrY1Zoa09haGtHMWZ4eFRrQS81bW1wT0M0VS9FOXhR?=
 =?utf-8?B?L2Vqckd2eG5XanJiL0dQUUFLcWRBdERteUNwSXBqVTlFYlRSWlF1TjZKVFQy?=
 =?utf-8?B?RFcyc0RiVDlsbnZzV05iMU5CdG1rSS9PNU05UjAxcjlPc1NuenY2TXJxZnFB?=
 =?utf-8?B?SlBEVFpIUzBqMGx6OHV3Lzgyc1JTN3YwZE41a1cwaGNqck1KNmdCUFYwSWNL?=
 =?utf-8?B?VHJyYzlxYjBKbXlmNHVHczM1ellSTWhJdmlvQ3pIUjg1b1pINmQ5L2Y3WFFr?=
 =?utf-8?B?T2NFNWVpK1NmVzA0Wk5NVXpRZmhIVzRNNFFwTmV3ODNENmxWMVA1ajY4U21i?=
 =?utf-8?B?c01BajhCWXdjZEd3bGtCY0FqN1Y0ZTIrcUowZFBGYWdIM0ljeHBmSzRveHY5?=
 =?utf-8?B?R0orM0hwNXlLRDk5VjI4dWY1bU5OakRpTHJxcE1VcDZTWGp4ZWJNSXdxcCtj?=
 =?utf-8?B?VjhJeHN6eFdvakFlVVp0ZUp2d1BSaXBzVzBwS1l2K0lsSTFLZDNiTzRaK0hR?=
 =?utf-8?B?RnJhc2oyM2RrSmZvSFBLeVA5VWhUaFZqM0QybjYxbWY4MlJ6TzhOYXI2U3o1?=
 =?utf-8?B?TlVucFF2dWNiaVJFNXVBVVFTUmovQXdsaTR5bEdZZkQrNFlvczhBZXd0aFJi?=
 =?utf-8?B?Ymx5dnhKMER3dXZCY1JhakI0bGlYQUwvQmFRZGZ6R1k2RFZkYU40QmY1RWdB?=
 =?utf-8?B?Y1RoQ0NhOS8zcklLSEJ5ZlBOWTB4Y09GbEFGbGtvaWpJK3dTQk1QangyeW0w?=
 =?utf-8?B?TGdyMGZUbWh5SWZsZlI0ZWJIbzZLMU1QSXV2Z0hxS2hEQlppQldqZ2ZsM21p?=
 =?utf-8?B?K1hoZlZ4Y3lZakJSOEthS0ZHYTcvZ3NDQkVrRCtObXByTFN5OGgzZUY0Nk1E?=
 =?utf-8?B?WFhUTVNxVTZ6Z2wyd1hleU5MUTM5MUxTN0gvaHgzeFJoT0ZmWmdtWGdkVjh2?=
 =?utf-8?B?MjFuWEpvOU10YnVNekxucFpBUkVzRFE1Y0ZBT2JxclhXOFNBZUhrYVFnMjhm?=
 =?utf-8?B?V3p0UTdCaGRjczZndGhpRXp2L3FTUGJxZDJFMW1xNXhxSFlNVDYyYnAwQ2wr?=
 =?utf-8?B?azViUlkwbUd2VVlrUEpKdmZMY05kQTJVUldjSmhINmRQVHNlWEd3RFVXOVUr?=
 =?utf-8?B?SzcvRis3aGpJaEROT2ozVXFNY3lsckdIWFRpMHZ4b2N0Q0xSZzR3SVUrQWRo?=
 =?utf-8?B?YTlDOEw2VnpaLzM4YjB2cXJ6WS9jbEVmYjN5aWJRK3RGaEJJTGplSS80bFli?=
 =?utf-8?B?SmxUaWdReHB4VW1Kd3hOaHB4dmhHSTJ2eThKcndDd3pVWk84TjJ5bW9MNkh1?=
 =?utf-8?B?NmJINWNFS2VYMVc5MmJpb1Y2OGVEbGE1WGM5ajRoSzR2WExGNGwrRGJUZTl5?=
 =?utf-8?B?ak1JaXNCV1VidzdwQmZhMlFkN1YrQk1yK0s4ZHJRK3BNQjRFLzF0Zytnd1o0?=
 =?utf-8?B?VjIvNjFWU05SM2k2RTM0bnpiMllmVkhwVXYzZHBxNmNuV1RGWVlUaUR2UlNP?=
 =?utf-8?B?MXpid1ZGa1ZVdzNjOHp1ZmhwSGhYZVlGVDA2Kzl0YXdJUzZYZ2ttR0s0NzRQ?=
 =?utf-8?Q?0EW1Pvr+97QUtKWj7g4MCNfT2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1ce288-01b8-4b51-9a2e-08ddaf029f6e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 07:26:36.0924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f2F3PLzyLxB5gMBNxA3SPUONAlMgqYr4X2hEvuf6jCm/KqXilC/dTOrdHycnoiyZ9RLlHFESVYYhml5jQ/ze/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4621
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

Hi Raag

Thank you for the review comments

On 6/6/2025 8:42 PM, Raag Jadav wrote:
> On Tue, Jun 03, 2025 at 01:43:58PM +0530, Riana Tauro wrote:
>> Add a helper function to set recovery method. The recovery
>> method has to be set before declaring the device wedged and sending the
>> drm wedged uevent. If no method is set, default unbind/re-bind method
>> will be set
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c       | 30 +++++++++++++++++++++-------
>>   drivers/gpu/drm/xe/xe_device.h       |  1 +
>>   drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>>   3 files changed, 26 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 660b0c5126dc..3fd604ebdc6e 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -1120,16 +1120,28 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>>   	xe_pm_runtime_put(xe);
>>   }
>>   
>> +/**
>> + * xe_device_set_wedged_method - Set wedged recovery method
>> + * @xe: xe device instance
> 
> Missing @method

Missed this. Will fix it>
>> + *
>> + * Set wedged recovery method to be sent using drm wedged uevent.
>> + */
>> +void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
>> +{
>> +	xe->wedged.method = method;
>> +}
>> +
>>   /**
>>    * xe_device_declare_wedged - Declare device wedged
>>    * @xe: xe device instance
>>    *
>> - * This is a final state that can only be cleared with a module
>> - * re-probe (unbind + bind).
>> - * In this state every IOCTL will be blocked so the GT cannot be used.
>> + * This is a final state that can only be cleared with the method specified
>> + * in the drm wedged uevent. The method needs to be set using xe_device_set_wedged_method
>> + * before declaring the device as wedged or the default method of reprobe (unbind/re-bind)
>> + * will be sent. In this state every IOCTL will be blocked so the GT cannot be used.
> 
> The file convention seems like 80 characters for kernel doc, so let's
> stick to it.

okay

> 
>>    * In general it will be called upon any critical error such as gt reset
>> - * failure or guc loading failure. Userspace will be notified of this state
>> - * through device wedged uevent.
>> + * failure or guc loading failure or firmware failure.
>> + * Userspace will be notified of this state through device wedged uevent.
>>    * If xe.wedged module parameter is set to 2, this function will be called
>>    * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
>>    * snapshot capture. In this mode, GT reset won't be attempted so the state of
>> @@ -1152,6 +1164,11 @@ void xe_device_declare_wedged(struct xe_device *xe)
>>   		return;
>>   	}
>>   
>> +	/* If no wedge recovery method is set, use default */
>> +	if (!xe->wedged.method)
>> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND
>> +					    | DRM_WEDGE_RECOVERY_BUS_RESET);
> 
> Although there are no strict rules about this, we usually don't begin a
> new line with a symbol.

will fix this

> 
>> +
>>   	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>>   		xe->needs_flr_on_fini = true;
>>   		drm_err(&xe->drm,
>> @@ -1161,8 +1178,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
>>   			dev_name(xe->drm.dev));
>>   
>>   		/* Notify userspace of wedged device */
>> -		drm_dev_wedged_event(&xe->drm,
>> -				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
>> +		drm_dev_wedged_event(&xe->drm, xe->wedged.method);
> 
> I was a bit late to realize it when I originally added this. The event
> call should be after xe_gt_declare_wedged() to comply with wedging rules.
> We notify userspace *after* we're done with driver cleanup.

Will move gt_wedged before uevent

Thanks
Riana

> 
> Raag
> 
>>   	}
>>   
>>   	for_each_gt(gt, xe, id)
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index 0bc3bc8e6803..06350740aac5 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -191,6 +191,7 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>>   }
>>   
>>   void xe_device_declare_wedged(struct xe_device *xe);
>> +void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
>>   
>>   struct xe_file *xe_file_get(struct xe_file *xef);
>>   void xe_file_put(struct xe_file *xef);
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index b93c04466637..fb3617956d63 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -559,6 +559,8 @@ struct xe_device {
>>   		atomic_t flag;
>>   		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
>>   		int mode;
>> +		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
>> +		unsigned long method;
>>   	} wedged;
>>   
>>   	/** @bo_device: Struct to control async free of BOs */
>> -- 
>> 2.47.1
>>
w

