Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6201CA2FDD0
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 23:54:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F8F10E208;
	Mon, 10 Feb 2025 22:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="C05/9zBS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2053.outbound.protection.outlook.com [40.107.212.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7136A10E207;
 Mon, 10 Feb 2025 22:54:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPOWnp7wXDN49p5uDjZyVYOTQxggBx30a3xGWv2azxmxxIAXrHsO1LlRQEN2iAtvQ4XhQJGDp3Fbm4f4t8QnFjz2nVzAwOWzl8Nja1/taKImDivWvD5LHwUCJnx0aRnHKEGjdIwlVaSt7zJ8gcJUHfmckVGOO22+0ZHivSD3k2UKKw//6wHfNDn2GG4TVM9iE7aFOoA6YXpRhAVgkqwi1R1xb8aQURsgSq9ifVE1+GHlauiF9upRpL3H6QejUFmTj3eC1/iCtrPxn1ipJljEUWsoP09sOPV2k6d8fSSRqvmJAVlVbcJtaXuwqiMQydXFG/tVakqUA6fMG1Ts47jgIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3+Er/XIvnNnWyEACzEqUwfJA/qg+wX2JLCvldJQSsU=;
 b=LjFFuilPcFBQD2LPwxmCQjZp8yiuq/eAx2MBl33LIlQyRSbyRbtUEIK4joBPewDVoDK48rOVbXCuVUzbY1/Yk3ffkAzyq/dWDLz1PNu9Y1CZUaKJR9D72chAZFKA6E35QU7yfzwoVi7QNGUGIJvyQbxa9F7/w2/5lJEfBHm3bCikDUdLgOT/tqDOIa0z+R+9olkFMPcA7PWuJufH79N5Q+Dp/5PPQMyg5/Po/3VjpJkvAjfh338pj2ssmQwH0vtS2NosmmHPDH0gzgTGbe+fLUd6R0NHvhKvsqQI47ZYiB/e9WmanMLUcDlUkqNSyC+71Y0CCkX6Bm3ACJe3Ka1NSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3+Er/XIvnNnWyEACzEqUwfJA/qg+wX2JLCvldJQSsU=;
 b=C05/9zBSs7LCPd+Q/YVjfWMZIutCj3XXspmh/6HhQqNftkYQ+81c63Mj3xJTkOz8BDzp7TXiD/sMrdmAY1R1y3MPDfbcPrfpgrs1pT3t+jkO0K+HQmrxH3EiKhKBpV4P6T9Nk+SriMNaEuhoMSIwe3xmoZNlbbsz6YneipxAIHk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by IA1PR12MB7736.namprd12.prod.outlook.com (2603:10b6:208:420::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Mon, 10 Feb
 2025 22:53:59 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 22:53:59 +0000
Message-ID: <dc32b78a-d44a-462c-9879-628fb2f01cb9@amd.com>
Date: Mon, 10 Feb 2025 15:53:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: restore edid reading from a given i2c
 adapter
To: Mario Limonciello <mario.limonciello@amd.com>,
 "Wang, Yu (Charlie)" <Yu.Wang4@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Melissa Wen <mwen@igalia.com>,
 harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, Roman Li <roman.li@amd.com>
References: <20250209225843.7412-1-mwen@igalia.com>
 <e5dcbd91-bf16-4227-be85-6668d08120f9@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <e5dcbd91-bf16-4227-be85-6668d08120f9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0056.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::33) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|IA1PR12MB7736:EE_
X-MS-Office365-Filtering-Correlation-Id: 20778cc3-4dab-47fd-7bf5-08dd4a25ce45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0FyenNTRDZxR090djJqT2l3Q1ZaQjUxYmVEM21Pc2FpRW45UDFRajY0ckZH?=
 =?utf-8?B?UEZacFVlbkZLZXVtUFk3TUR4VWpQMmJhbnRWd1V2V1BoRHJNTFhDejVEUG92?=
 =?utf-8?B?TGZCS24wWmxJSlMxdnBFMXdTZnBlQzRnQTcxTHBNNDBQUU9kMXo1a2w2a2dr?=
 =?utf-8?B?VTV4Ni9OZ2pxNzM5L2dKTkFnbkxqQUtQblArdVhoU3kwb0hjOHN4Y0ZRM3Rx?=
 =?utf-8?B?WWFZS2lUQnNmZ0tIbzlDVzJCRE5wODBxM3dJYTJTSG5ISnF5ZVlRZXN3NWFp?=
 =?utf-8?B?aVA4K0tFeVRwUUltSXdLYVlyclM5U3FDclVtZjFvOHhKQW1xQkZUTGNrSngv?=
 =?utf-8?B?SGRudDRzQkxBZHZsQnl4eEV1ZlJZV3RJa2UrbmtPVXlweGhPNUdMc2NuT2hK?=
 =?utf-8?B?Z2ZvcjlXT2E4WVR3TlFsTmNSeWFTa0hWZEkzUGdvMjU1dnBObkRKTG9ncTV6?=
 =?utf-8?B?NjJEQmwvTGRQTW5RWHFKcStSMjJja0hWSCtSMFZtRE44K0NEQi9FSDZnVjda?=
 =?utf-8?B?SFJ4SmZabW5uREJGQlpNS29ndmFTTVlzOWpQa2k5TC9HRGF3b3FqUUNnekxZ?=
 =?utf-8?B?UmxnamxTSCt5aHNDc2pnajZISjN3Yy9uZy9OYlY1cXlJam8rODV5Y2plSmsr?=
 =?utf-8?B?LzlkZ2lhRmZQZHNYUkpHNisvcEhzVUhBbFNDaktaZmszTE1WbVJ6N0ZsTFpx?=
 =?utf-8?B?WE9TUURCWnhZSmZONTBrTUpVL20rOGFHdFM4U3RaWFgzVU1PV0VqWENvVjQ0?=
 =?utf-8?B?TzJNZEJPNE56bDE0VUN3OFlXb045dy9Fd2duTTVsdHJkTEVSU1NrQ05wZWxl?=
 =?utf-8?B?UUl3MlppQ21VaHlnR0NpalBwWWh1MndpbmI3RDdETzltbzJrbGo4Wm5oOFgv?=
 =?utf-8?B?RkNyK1hoVHNaNGgyQ3VycVZRdzNhdENDZi9RUTJXbE4ydDZUT0JBdDlrck9K?=
 =?utf-8?B?TThUM1hUK01lVk1VVWt0Y25Rb3NTaHhNemlEOFU0WkJSdFRQM0d3bVp5MDdq?=
 =?utf-8?B?WFRiV2YzdFRCMVUrZ2ZMV1FQaUc0QzFCREVSbUphRHB0YkpsY2RIU0hGSjcx?=
 =?utf-8?B?c2w5Y3NocGNDSWFHSWlSWUJteGFuem5RZnBvOU4zNFhjcEtJNHI2bEhTOCtY?=
 =?utf-8?B?cjhSbm9Yald2dEo2UHhWSm0yRVB5aVhHbkRKWmxMbC9hZm5kSWF3OGdZS3dU?=
 =?utf-8?B?dHVSWVdJMnAwSjhjNU1DOGgva2JZSVI0dStONmR1c3p4Y3l4T0NZVG91dUVI?=
 =?utf-8?B?dnRaRDJIc2FCemdOOWtGbzJ4YTFSZEtLL2dSV1lPVG9MR0pNb3hlYllFeU5q?=
 =?utf-8?B?cU44QkloUWpzMlVIQnVCSTZrWEdhRUtzT3FZcDRZaHBmdDdqakpMZERZSDRI?=
 =?utf-8?B?SUg5L0gwLzJWamZBOGhob2RjanVXbFU4VnFvcFR6M3BGMysxUHlyWkRGS1Ar?=
 =?utf-8?B?UTRXdWdPbzFGWTJxR2FjcE1INytienZEYzExWUxPQThTemdvREdHUFp1aWNJ?=
 =?utf-8?B?ZFNhODlreGYyUlpqaUdFMS9oTUltU0xDcjk4Y2VYRFlsOTVlak5PZGRYQ0c4?=
 =?utf-8?B?dGloUmx5UmhmYnNLWWhnYVl2clp0UUY3OFQzMXNnUm4zeWFRV21hTE1La3F2?=
 =?utf-8?B?c3hzOGFiUFJrSXo5T3lLTEZrMUNzbHp0eGs0b21CWDFQZkJ2NnNpbGJTM0JQ?=
 =?utf-8?B?YTRYQTYwZzl1bmIzd1UwbkJwb3F2d2VUQUg4M3pTWkJSaXh5MVdVZmlXSmVl?=
 =?utf-8?B?MmVzV2RHMk1tTS9zZGQ5cG1SMWxwOXJVZjY1TTd6S21BcjJ4U09yMS84TjlQ?=
 =?utf-8?B?ZWg5cFFhRGNXaFo0TmNXaFBpd3d6dVZwR2NNM2NYWC9peFBTUzJxZ29jUkNs?=
 =?utf-8?Q?EaplqcjX2sr1x?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjE5MHdrRitRSGZ1V05UZENYMTQvNHJJVjYxV0R0VWRWVTlVVGFqQjMxaGx5?=
 =?utf-8?B?aUVzb3ZuZmhyaFZaSDdHM3JnM0d5ZUNJS3R2ZWloMmU1MEUvUEk4M1UrTng5?=
 =?utf-8?B?dEZ2N1hnLzZvNkVKb25DRERDTFg5T0R2d01tdlVhTTluK25vVitLaGFDejdN?=
 =?utf-8?B?MW4yR2hQRFJ2NlRZRXRWUUpCaG5GQ3dLeWFubTRTUnJZbVdPWWliRkpZcVkw?=
 =?utf-8?B?UWFTQkcwc0x0WUc1SkU5Y1dXbDlYbnk2a0dQZUJiUWV3UnhOZE5KQk5oQ2ph?=
 =?utf-8?B?WXBndThpWC82ZWREK0p2aTlUK3ljdHdDZDA2L00xS2xtNkxHSGJoSVhUTmhL?=
 =?utf-8?B?R2dwUm9oanRSaXlxb0ZxZzA1Z2xxTTErQ0Y2V0VIeGordHRHT01weUIxNHRI?=
 =?utf-8?B?T1RCMm9Oa3BUY0RXZ3RBRjIwekkyam85WkpqdW1wV2RrVytGaDRyOTNHQzVa?=
 =?utf-8?B?d3ZCMEE1bkpoRFFQZWVwUFNuY3NmbDZGbFl0TDBhZlp5cDlRSmcra3VxSk1F?=
 =?utf-8?B?VDE2V21VZ29YVHprQmE0OG5ZK1dlVUlwVVdIZU9iNnBDQnN2Y2FBRFhRaFFk?=
 =?utf-8?B?KzFneWp5cTduRERmSnk3NFpKa0dlclg5TVpOSWcrTlhNY1BRWngxazBCZ2VJ?=
 =?utf-8?B?N3ltZTNzRkJxY0o3VlFUc3ZPQmI3NjdadHF3aGNtbEFCRDFWZE0rYkdiamFh?=
 =?utf-8?B?bmtKOXdCZ1RPM0ZOTWppeXNLQjdRcXJoS3dZQ0hpWmNZakZGdjVyUExaS1dt?=
 =?utf-8?B?U0c3Y0gvVmcza0xCRno4cUdibVFybDMrMW05cmF0ZkE4K1k0MEwxeU9LQ29u?=
 =?utf-8?B?RUdVY3Q0YVVKdWo0V1VjM3R4VWorT241MDVZZzgzTjlsRXhPUlVxRXpzUjhv?=
 =?utf-8?B?L3ZUVTRkdHBqU2ovbEliN3JwRUpnSW9HTnNEMzNjRUsxd0p1d2pzcUZhZFlG?=
 =?utf-8?B?MzJQQnB4NERYczZMait4dGFiaUR0MitCUlZTSDRQV0tvTVRBUHVCT1NQaUNa?=
 =?utf-8?B?aGdmWXJ6eVBRakRxbEd1anZmSXRKcUZuY2FqNFo4K240eldsbXRTQUU5dGNF?=
 =?utf-8?B?T0xnai80MVdXUjdmNGtQdG1aa3FGYWxmVmxMWHZPSmdLOXlLSUZSeEpzRTNn?=
 =?utf-8?B?WFVidDlzL3AyWXJLMW5YeCtlRXNpbmpGelcwcVdydkRCNnpiUzM5QkwxN3FY?=
 =?utf-8?B?cU1pQ3dqalo1NWd6bzBPdkZCbHpyekhka2ZvTnhEL3k2eTB2Q3hLcXRZaklN?=
 =?utf-8?B?a244NGR0Z3JlWTdhU09BTi85bWM0TEZjaVNpRGZOY0JqK1dMb0tSWVlaNTUz?=
 =?utf-8?B?YUVaUHZ3SS9FMFVmN2VMdXl2TCtUZWJSeVJFS2ZOQW02ai81UUNYZS8xbVFO?=
 =?utf-8?B?U0FYdnRZNk1PdmtPSCtYNUVWeU9ZV01iRXNJeXJJVHBGYXAyd1BKK2VrQkkx?=
 =?utf-8?B?OW1oNGh0K3RhZ1Z1b0V6ektvTkIxRFlMcExYbzJQekc5Z1RkZjJ0U1Jyd1hq?=
 =?utf-8?B?UUhlUW14MkpFVjA0R2hqTnRITXdQWHEwbTZ6b0d2TmZnV1g3cWpHVWxPZE5J?=
 =?utf-8?B?R25jYngzV05ZcUxoSk4zT295K1NoaTVxR2hUV3dEcG1jS3d5d1F2d3FqcndO?=
 =?utf-8?B?NFFHMVZPN3FiTy9qVDV3Z2FXL09scUZsZ3I4ZUpHQ2lzSWtra1NoMFVmMU15?=
 =?utf-8?B?cFh0RFNQeXFGaVB1alRpQ2dsZzkxb0Q0eURtYW83NjVrTzdDN2p4TWRWOHJt?=
 =?utf-8?B?WGdxeVVtSHNqVUJ2WTlWK1hSUVQxNjVySTlyTkR4ZVoxTktCMS92bjlRTXBD?=
 =?utf-8?B?bHB4NTB4Q3J5Q1YzVjRIbUhtVmx5MXBQSFp0RmFYWXBhMW45V1luOHJRdFpR?=
 =?utf-8?B?bGg3eE1TYkovSXplQWp3cWtmRlhlcm00QmVuWWZmeW9zWFA4THhSS0dQT292?=
 =?utf-8?B?bmRmYWNFTDQ4WXZRNzkwaTR1MG1KY0hqa0x0cUZ4VjhZZ0NTeFBoR3ExWlZT?=
 =?utf-8?B?TFUrQzBNM1FOUEh4QktOOSs3Qm1WbEgrZC8wTmlGRXRQTjFVWmY4dE1VVFJj?=
 =?utf-8?B?TndUTlB1UzNxV2dtM21scWZBMTFVOEZDK2lwMHZzbGNlZHFyK0ROaXVxdUtM?=
 =?utf-8?Q?8/PJPSVRz7rTQwSNZlgGdshEC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20778cc3-4dab-47fd-7bf5-08dd4a25ce45
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 22:53:59.3952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V866Buh5h3L9UDKmuKTkUnzksgnq1yRsQp7kjzPNI9qrSWEsy0oqRklDHc6Wuge4o9PnpPKHbRC8+19XONgqXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7736
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


On 2/10/25 15:18, Mario Limonciello wrote:
> On 2/9/2025 16:50, Melissa Wen wrote:
>> When switching to drm_edid, we slightly changed how to get edid by
>> removing the possibility of getting them from dc_link when in aux
>> transaction mode. As MST doesn't initialize the connector with
>> `drm_connector_init_with_ddc()`, restore the original behavior to avoid
>> functional changes.
>>
>> Fixes: 48edb2a4256e ("drm/amd/display: switch amdgpu_dm_connector to 
>> use struct drm_edid")
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>
>>
>> Hi,
>>
>> So far, there is no reports about an issue related to this but I noticed
>> this potential functional change when investigating the previous
>> freesync problem. I'm not 100% clear if MST takes this path without
>> initializating connector->ddc, but I propose here to restore the
>> original behavior to avoid regressions.
>>
>> Melissa
> 
> I think this looks reasonable.
> 
> Charlie,
> 
> Can this get included in this week's promotion tests?

I just shared this patch to this week's promoter, Roman, and this patch 
will be included in promotion test.

> 
> Thanks,
> 
>>
>>
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c   | 17 +++++++++++++++--
>>   1 file changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/ 
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index a8421c07b160..0cd22a6686a3 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -7269,8 +7269,14 @@ static void 
>> amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
>>       struct dc_link *dc_link = aconnector->dc_link;
>>       struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
>>       const struct drm_edid *drm_edid;
>> +    struct i2c_adapter *ddc;
>> -    drm_edid = drm_edid_read(connector);
>> +    if (dc_link->aux_mode)
>> +        ddc = &aconnector->dm_dp_aux.aux.ddc;
>> +    else
>> +        ddc = &aconnector->i2c->base;
>> +
>> +    drm_edid = drm_edid_read_ddc(connector, ddc);
>>       drm_edid_connector_update(connector, drm_edid);
>>       if (!drm_edid) {
>>           DRM_ERROR("No EDID found on connector: %s.\n", connector- 
>> >name);
>> @@ -7315,14 +7321,21 @@ static int get_modes(struct drm_connector 
>> *connector)
>>   static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
>>   {
>>       struct drm_connector *connector = &aconnector->base;
>> +    struct dc_link *dc_link = aconnector->dc_link;
>>       struct dc_sink_init_data init_params = {
>>               .link = aconnector->dc_link,
>>               .sink_signal = SIGNAL_TYPE_VIRTUAL
>>       };
>>       const struct drm_edid *drm_edid;
>>       const struct edid *edid;
>> +    struct i2c_adapter *ddc;
>> -    drm_edid = drm_edid_read(connector);
>> +    if (dc_link->aux_mode)
>> +        ddc = &aconnector->dm_dp_aux.aux.ddc;
>> +    else
>> +        ddc = &aconnector->i2c->base;
>> +
>> +    drm_edid = drm_edid_read_ddc(connector, ddc);
>>       drm_edid_connector_update(connector, drm_edid);
>>       if (!drm_edid) {
>>           DRM_ERROR("No EDID found on connector: %s.\n", connector- 
>> >name);
> 

