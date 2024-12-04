Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A089E47D4
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 23:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C7810E5BC;
	Wed,  4 Dec 2024 22:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JWFkrFgj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343E910E5BC;
 Wed,  4 Dec 2024 22:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733351299; x=1764887299;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=77KepvDBaez4VlC47DWzcrJDMoFvmrNdlYjtaZT7Kw0=;
 b=JWFkrFgjEOQGq3qSbjlZtJVltJmhZ8L3tPCKU3EFajfk5aAxKBC1HQ8k
 etewYYCHxj/M8JEtH/AzVLZBtzDUcIfJk2PMmpH0gKh9oE5zDAZJQ8UTd
 Fto8e65A5CtiO9TZJX6IDw48Zxo9y7YP/M1z1fyKWi1sm2wSL5UAzUXSK
 cv3HyE7sP8VwLy3WXpanHYZMriSdIYvlbMoZBZK874qTSlHARhQ64zCXe
 fkF0kCZYwoXnQYTduk2KTiwxmqxmVdN/O4+B/p4tCSRlk4A8y6jFzfEAt
 /ZKJ3ciuklIM3+D1Ipf87BzXQx0kIuSdmXWb2z62qJDZR62OIaJWIA9G7 A==;
X-CSE-ConnectionGUID: tIxLeiyTSi2ITvWB28YDjw==
X-CSE-MsgGUID: x2y0zG/YQP6tSjk2T+p+NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33519417"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; d="scan'208";a="33519417"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 14:28:19 -0800
X-CSE-ConnectionGUID: IfE5qdlVR7aWjNGV6nqpgQ==
X-CSE-MsgGUID: FOMMx3ecQpGz7EHmdcCfHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; d="scan'208";a="93578984"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2024 14:28:19 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Dec 2024 14:28:18 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Dec 2024 14:28:18 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Dec 2024 14:28:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NkRslX/OXhim/TuR522RhQK6awCOEpSfdWtwnKeyEYDh6So1e/qAtuTBxRtTXNG4Wx0B1AothzrbFIHiWx9Q5BvT7jNmTpC5pFHoobG/EJJFIWY4HOWhs6FQ7to7K911TM6T5qF/KNw+0ylAcG5v5ohsfSpuyHnYtR1fPH/vg+xOCsbw4eoOUcWypiidjhfxn7EXrdArWdvuuP8muZQ780zDGdcAVb9bKUoGfEDCaHKpNgBAEzqXoB1N/SNPgMcIJvz5a7TKTJ/2PJMB5VSUKOyAnbE8lsN+R/5QeMRu8dYVRiNOVAl9cTkre1btDmpFGjfSVwwSMRZzRq6/qsBDcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65HnAVZY8sMnwP6wdZ8H0eqdik16repxGblIN5qDSHU=;
 b=tT80SJ3OfYcU+xYpV/183UpcCisaVIJFVgYR1JKfnq3GPO6FanYRlHmwD6CpkkHHFkuM7h4DEyDsBfEaxiNZh5sgE2vBDbi6RgB8y3kYGRXc9AA43QKNq1mRlPpEFJjWB0hvcuWktEXbu1Nj0jkoWBwCMWtiiPeFGkINudgDm32063sJn/xrbyeaNGayCP1U/XXVDv7CXalnYFeYPUT6gTEgJZN/ZBV7376TU/df9xRa9iLGap5LOtO5mRkVFiOadhyKPvxhybfhRswpGUyCgJgUX1BmYQ3L3ruyQhR9BTLzi4irEiL8V9mfZJMEEbifbyA9UAKji4OgCuXernKExw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Wed, 4 Dec
 2024 22:28:16 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 22:28:16 +0000
Message-ID: <b4020ce5-25e6-4dee-887d-8925e06cf3ab@intel.com>
Date: Wed, 4 Dec 2024 17:28:12 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/1] Maintenence of devcoredump <-> GuC-Err-Capture
 plumbing
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, John Harrison <john.c.harrison@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>
References: <20241203174732.3232351-1-alan.previn.teres.alexis@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20241203174732.3232351-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0167.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::22) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|DM4PR11MB5232:EE_
X-MS-Office365-Filtering-Correlation-Id: a6758d18-5df6-4ed5-6d17-08dd14b2f248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enZmV3o3VDBsOVAxM2toQVpndjk5MWJkTmNUMnYrNGY1M0p0ellPNW1LQ3l3?=
 =?utf-8?B?dDdpQW5hdmtzM0NPd3BFekY4RjFlYTYrM3NZMmk3MUwwWnhDSWNMRFR1YSt0?=
 =?utf-8?B?cTNqN0NuT3p5WUtoNXZzajJacEdhQThhbzZwL1hLamptRXk3Y0RRN2tTZzM4?=
 =?utf-8?B?cE5LeHYrTnkxZThteE45R1VKQ0NibDc1cExOazlKMWxBUnM3Z2g2TkpJd2pU?=
 =?utf-8?B?MDB6TUt6ZE0zcEs1UndobG1PUndJNkZ6ay9Ic1lucDc4UWF2UUc0VCtNZlRp?=
 =?utf-8?B?dG9BZG5LUjI2L3BibkNNd0VVcjRTcllsRmZEQUpzSktkQksyajRkNFpJeDUy?=
 =?utf-8?B?d3lRTGdqVkorVVFJTnZaL0Vock9JQk9yY3VYeExPYWZ0RCtsT0ZHS2x4ejZJ?=
 =?utf-8?B?SENMSURLSG5PcVFEMG5yNVI2NGZrQ3RPci9xUksvdG5tSEZ5YlNBZVBiVDBr?=
 =?utf-8?B?bGZaSlgzcERiN3M4MzRIRmNkTWRCZk1mMk5saFd2aFcvT0wwakpIL2FpMDdu?=
 =?utf-8?B?WCt3SElnNVBxcDl3ZGdxaVNuTDFQQTB1Uno3c2xFMGRYVkFxa2JIZVJWS3g5?=
 =?utf-8?B?a0d0OHRRNVJGN2NoMDQrNFhsOFRBbTQ4Mk5sc2pZK2RYL2J1bTFINGh1MXBa?=
 =?utf-8?B?MzgwWVBqOUlWZGlEMUJjcURHOHY3VmlpSm9sZkZVOGQ2MTI0V2VWTVFkZk5p?=
 =?utf-8?B?ekN3UCtDOXJuK1JRb1J2NCs2M1BQNmt3RTFNV2xoN2h5TXV1OTg2N0R5VXR6?=
 =?utf-8?B?aVJhWmJIMHlTazg4Nnp2UjQ1SXYySzJQUTk5empPa0tFSVM4bytDcHlVVTg4?=
 =?utf-8?B?MkhyQlk3SmlMdENnYWVmRCtNSFZySGpLMzJlQ1A4eHNmWjFxcUplSHUxQk5K?=
 =?utf-8?B?d0ZrNFRZUU13Y01JT2NiOGs4RytYM1FqMzlGK1RXRllKclk5UmVFcjdnT3Vt?=
 =?utf-8?B?cUFka1paaWc3RG5NS05nVnI4RFZNVW5zcEdFUWg0ZmFuQjZDZisrVDNLQzN4?=
 =?utf-8?B?d1RXQlRLM3pTcUY3TTlhYUpMTXBGSVNka0lEamRtL2czWFkzR2lmcWV0ZWNN?=
 =?utf-8?B?bjhnMTRRb1YzQzk5NWxKNk1PZ1F1UmxYU1hCV3pXWmxBR3QzTFpINUpuVzhB?=
 =?utf-8?B?VmN5Um53TUxEN212bGZtTGtTczIxelA2Z2tPamdwZmtkOWs2VngrMlFLNEQ3?=
 =?utf-8?B?aGo2Q2Z4dXBEMjBISkUzZVlVY0ZxekJRSm13cHRMSjRSL3p4azEvZEtuQldr?=
 =?utf-8?B?TjA0alpzaytObGFYSXZFc1RmZitYT09najNHVS84Sm5kWnl4T3JadkVCL0lu?=
 =?utf-8?B?MjV1dWx5ZXlnMVZOcSsveUI0dTRWbVJnRkV6c2t5MFJyNlJYMTcvWFdBVkNH?=
 =?utf-8?B?WXpIZFBzSWF1Mkgra1lWVDRzMytocElPSkJMa0ZnZjYrVGVhK1ZHdi9MY3Rp?=
 =?utf-8?B?VVFCMlE5VE8wWTVoSENBVDZ0QXcwcW5wbTh4V29vWVJEazlyMVh4YkYxVDZ0?=
 =?utf-8?B?cXBycllMYVF0NUV2TXVhTTRwditydThRaEpUTy9qZ3M4YTNuY1p0bVppREJs?=
 =?utf-8?B?QUFuZEtlZVhQZzVpNXNKS1RROTdZN1ZrejVVbFc5RmF3TDVKSzVWSU9rbGJt?=
 =?utf-8?B?d29Fd3p4ZzNkR3JTQVd0SHg4ZkNteUdpOGZubFFZZXpUaW03VDRZb1NYSno5?=
 =?utf-8?B?VnlxcjJtd1pwZGdxblRjeUJQeFNRY0lDb3ZEQlRnMWwwUCt5V05iYUowQTVG?=
 =?utf-8?B?dU1tVXNjZ2kvOEw5cllnNmw4dU12SXUrWnVKSnYyTWQvR0Jxd05DTXYvUGZu?=
 =?utf-8?B?cnI2bjB4ZnppdTZnQVJJUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUNsRUtUVnRmUlBSbm55eVdXRldZZWZqRDRzdUFQSi8vdktJZHlMZEN0eXl4?=
 =?utf-8?B?c2JBa2RFTnN2MVhyV0pITDBiWi9BNXh4SGc3YzdZRTluVlVHL1RSM21QZGQz?=
 =?utf-8?B?QjcwbFYwb2hzMWtiZ3Fid1BuSFNsdjBOYTVaTWtwd0VkazFKNkRzYUhiMEV6?=
 =?utf-8?B?ektTblg3UEU2c1RwMG9Td0drdjNXWVdvVjdRcTVYdUl5b3pxWnJ4Yk5QYVZi?=
 =?utf-8?B?Y0xBcURQY2dHNk1OOXZBZUJOc1ZWdHNjQVNFWVZldHp1cG94MEJvNzBjdFVt?=
 =?utf-8?B?eGZFV3hnRDREeEx1c2k3TW80NnZlQmNSTGUzOXE3aGpaQ25wVjRzalIwMm44?=
 =?utf-8?B?WDMwakdVUE1HRWNsOEgram9wNzlQTEt2RHpWZitlYjNIOU9ST1lFL3lsdGhn?=
 =?utf-8?B?RDc3dk5oV2xkRlZZdU9aZFd4c29FVEk3eitBcFpCbUhwbkpIUm9NQUhWWDRL?=
 =?utf-8?B?U0hVUi9tbXR4KzhHKzlYUWU0UUo2SVhkTndoTW1wekhNSm0rbzNJWklWc0gv?=
 =?utf-8?B?VWdXMUczcnY3cDJ6SEFOdFF6UjZTM2ZsOTdQWVcrTlQ5RFdibHZ2bWoxN0Rw?=
 =?utf-8?B?Mk8vZjN1ZjlLUFcveEM3dEtlVUp0bklpQ3B5cDN0ZUJIcVhya1liK0VqMFhy?=
 =?utf-8?B?eExBRHcxanRGL3FPVThQL25kWHo0MUxqbU9pTGVTZ1BBZFlrZVBBdkVOSGZt?=
 =?utf-8?B?ZjQ5M295Q2dwL1JweDNSY2lGK3pwNGtuS2o0VHlkcTRWK0owZkttc3M3V3BP?=
 =?utf-8?B?MElMZnZrcmt3NWU0SnpyeFRJT3JSYkM4SUJBR0QvYkU1dDZKWUpjcW1XQWlp?=
 =?utf-8?B?YzJSUml6emtYMUM1Qm5RMHllRmlRZmQ5RmNwY3o0Z1FNdmV3eFh5KzhlNFNs?=
 =?utf-8?B?bFZhZGxzcWNhWENzZUNPMWpYYk5PcjFJOXZwck9yUW9CMSsvS25Qd3dnME4r?=
 =?utf-8?B?SCs3cURRWTYvTUYwaUgwT1FOVEM5TEVtbG1wMnE4c25xTEZMMUlMTDJUMXpn?=
 =?utf-8?B?UmpwQjIzRWtpdmpuM3RQWVc3cHVmWGZwNzgrYktSS2ZLUDdHVlJZRW9XNlpk?=
 =?utf-8?B?L3I2K3VGdlVVdENNWDlSbzBLZjBFVit2NGVIWXRjR29HbkY5R013NlFzM3FO?=
 =?utf-8?B?TXZEUjF2U3M4MUVkaVBER3NXdHoyTzdnWWZOTWk1TVhyUXNITTU5VzZwUTIw?=
 =?utf-8?B?eXo2SktXb1RBeENJL1BleUQ4cWdwRVI3dW1ZeTV4ckJYWitaSkRoQ05UZDBm?=
 =?utf-8?B?dDRJUS84eDZ2ZkZ1M0Z5aUQyTXNhVVk5OGtHeHZSb2w0aG1wcUdSVTROblRq?=
 =?utf-8?B?R1lUamFVM2VGODhJSzMzdUl4RVVEQ3NmbHJReENhQWI4QUdYdmRwSFBybW1F?=
 =?utf-8?B?QnFNWDJHUE16ZHVJc3hGNjhkQ2RwVm5NZGJXc3h2Ry9sVDdVU3hyc2tCZkZw?=
 =?utf-8?B?QWtONEtiRDkyRE1jZjlwODFtVDJVMTdtdTZaU2pndmJDbFdzNStFcVBmWmVt?=
 =?utf-8?B?eFF6NTkzRGwydnNXbE5JZGtDVHZsSUdpK0JBdGRpckxuM1YyWkl6dzRqL2xr?=
 =?utf-8?B?NjMzdmNCd2lFamQzckRhYW9DVWlVRlRNYlJtblVzbEJIcVNRWjZGbS9qVEZ0?=
 =?utf-8?B?bWlneGdvb2FTSkF1YmN5cmcvZFJhTjEybktXVzBJWThWbEQwNU01dER0amx0?=
 =?utf-8?B?MTR1TWNBNnRCS2dTWmljS0o2bllWWGlnQ2FWMGxBZC9rYWJPRHF1Q2c0Yk1M?=
 =?utf-8?B?aXIvSmFqVWhxeUdzd2pVeXNoazJ0MjRYSWJKVVdWUm1rdExkZC9EaVphQmVq?=
 =?utf-8?B?QkxwdzFmNW8vWFQxRTRhZUwzUUdXWjJSYlNKMzNaUDFUdGNrNGhLdndIZU50?=
 =?utf-8?B?bnlOMGVkUkx1UWZ5alhza0hQV1RhRTNaNmladytTN05iM25hK0psaDlmUzRy?=
 =?utf-8?B?bVJJOTVSSTMwRk5Ha0pFZlhJbHdKVTlhT2xaQ0J3RDU3M2xBTzBoRDB3czF6?=
 =?utf-8?B?UU9tcTh5cWM5WG9QSXNmejNFdFlFMk8vZFpzbHFEMlAya2h5QVUyWGQ2b2pw?=
 =?utf-8?B?SldVRHgrUElJMEpUeXl1aFBoWkZ3S3IxVkdFcGZGdkppb0pVQU9WYmZ1TkR2?=
 =?utf-8?Q?ubgbw3f+LVxvJIWjhV+eELwmQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6758d18-5df6-4ed5-6d17-08dd14b2f248
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 22:28:16.0257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q90Bw2dO/3yQYtWHlmDkgcjJRVlWx8PxYWiGk+oTlpCAaTEWT1wjiPEIh+8b8Eh+2b+L2QkgosPnvIs3WZofww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5232
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

LGTM

Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>

On 2024-12-03 12:47 p.m., Alan Previn wrote:
> The GuC-Error-Capture is currently reaching into xe_devcoredump
> structure to store its own place-holder snaphot to workaround
> the race between G2H-Error-Capture-Notification vs Drm-Scheduler
> triggering GuC-Submission-exec-queue-timeout/kill.
> 
> Part of that race workaround design included GuC-Error-Capture taking
> on some of the front-end functions for xe_hw_engine_snapshot
> generation because of the orthogonal debugfs for raw dumps of engine
> registers without any job association. We want this to also be handled,
> even if indirectly, by GuC-Error-Capture since there is a lot to manage
> when it comes to reading and printing the register lists.
> 
> However, logically speaking, GuC-Error-Capture node management,
> despite being the majority of an engine-snapshot work, is still
> a subset of xe_hw_engine_snapshot.
> 
> This series intends to re-design the plumbing for future
> maintenence and scalability, rearranging the layering
> back to what its should be (xe_devcoredump_snapshot owns
> xe_hw_engine_snapshot owns xe_guc_capture_snapshot)..
> 
> Alan Previn (1):
>    drm/xe/guc/capture: Maintenence of devcoredump <-> GuC-Err-Capture
>      plumbing
> 
>   drivers/gpu/drm/xe/xe_devcoredump.c           |   3 -
>   drivers/gpu/drm/xe/xe_devcoredump_types.h     |   6 -
>   drivers/gpu/drm/xe/xe_guc_capture.c           | 406 ++++++++----------
>   drivers/gpu/drm/xe/xe_guc_capture.h           |  10 +-
>   .../drm/xe/xe_guc_capture_snapshot_types.h    |  68 +++
>   drivers/gpu/drm/xe/xe_guc_submit.c            |  21 +-
>   drivers/gpu/drm/xe/xe_hw_engine.c             | 117 +++--
>   drivers/gpu/drm/xe/xe_hw_engine.h             |   4 +-
>   drivers/gpu/drm/xe/xe_hw_engine_types.h       |  13 +-
>   9 files changed, 359 insertions(+), 289 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h
> 
> 
> base-commit: 906c4b306e9340f6ffd6d44904ebc86e62e63627

