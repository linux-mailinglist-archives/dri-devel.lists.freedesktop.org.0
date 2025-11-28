Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78255C93332
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 22:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5F510E94C;
	Fri, 28 Nov 2025 21:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rbCJVwIp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012027.outbound.protection.outlook.com [52.101.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C01210E94B;
 Fri, 28 Nov 2025 21:37:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIqXXV3OzdaPWidvKpQ8yhc+ps7LPoNVxXqeQse84ChamauxaFFTSRbs3FF/ejPZ4L9DJGRoxTgXgCugk95B84ODponUDLcBf7DEvJok3XlAqbN9UXLOhjSGk2E0sEqUFvMvtJQV/oyTlftiAglL8VB9JlhDWOma9dV3r1v+0Yrr+2gy4kuWl1sSBb1DFIVy8cNwFn3IQoRxU9Ip7ts2NLZosEMrUSphbYP5NKkv1deuXDzh1xCg/uKfQHCh124LOve4ZcFpGvj1AR7+3KgUnhK34lzZa8bQPwt3hvavUibQ/1UX82bP5d8onaPoIp9O60KuEAsIRZAVdhA1+0vA8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8SLdcZTmEykIb8j46yUhJQTxVauQF4HUAI3HjXnkBI=;
 b=Q/AOylHj4tVPZbLwkUxg7WRfH6srM/82XfpVns1LrckdMjbU8qqFDl0nSdebg/91x8W6WT4ADu8oAPJD1M98lMNyNtxu0GbRThBJVm7XqNYGdPXHpkpfjIoid4x+fBWFAPpOOs25Dot/l++WQ8nVwtGF1TBrfkvKdYTiHhIJcwsrK8AFjLepmOhibE3FdYSfhSrzpROnR3h8FZULtNoksAZBv7kVg2P9dZgiI5CHGJvedTeXeJkc8IGYDkXIeoxyEQi8IUsMusrMsfyXYt1Xzs0EB8jr5ndo8AUWoB19Xq6w2tNjsLOKuVzXlauTcDBdnRK0b70f9kzRtSYwP3W+uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8SLdcZTmEykIb8j46yUhJQTxVauQF4HUAI3HjXnkBI=;
 b=rbCJVwIpXHDsSFVsz937/1dcSOjpYKRGusjKU75PUhO5MZLpLNQ283gHcmTqBUehQZ/+bsQOafU7BTPuD4YIUdY/eftxspScsRCrOTk7SOznfn3m38ZCC/GWoleTzKwm2zguD/U13KpWrYdoaF++1bqQfQezBKws+1AAjjaOnWs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BN5PR12MB9485.namprd12.prod.outlook.com (2603:10b6:408:2a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 28 Nov
 2025 21:37:17 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 21:37:16 +0000
Message-ID: <2ddb06d0-70e5-4a1f-850d-3753f9fb3d0a@amd.com>
Date: Fri, 28 Nov 2025 16:36:58 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: use DCN10 CM helper for plane shaper
 func translation in DCN32
To: Melissa Wen <mwen@igalia.com>, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20251126005608.37513-1-mwen@igalia.com>
 <2a918940-700d-4b24-90ae-4d9d4f9b457d@amd.com>
 <f832ec8c-cce1-45e0-975b-ed7000bed891@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <f832ec8c-cce1-45e0-975b-ed7000bed891@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0433.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10d::13) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BN5PR12MB9485:EE_
X-MS-Office365-Filtering-Correlation-Id: cad37487-ee5c-48cf-025c-08de2ec64d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3puWHc3OVZTQlBYQVBqdUNsTTNtc3RWM0ZPN3p6aDNickthMy9teEV1Ukpo?=
 =?utf-8?B?elRJbUc1Yjl5bGE3ZmpqWUdYTnNuK2pYZjljZkVxcXVCb2VmNGFyd0xmdE1t?=
 =?utf-8?B?UWpvdGZKczZQOTQ0N0JuTXNSNDFDQWMySkpPOEMvenNaSFNaODMyakpJTHZD?=
 =?utf-8?B?d3MrekZTTThoZEhZcjd5MUYxRjMvQmxKaytZVk54NDVrV3FUVkl4UEMzSXgw?=
 =?utf-8?B?UCt1WjdYeGN2UHp2S2hoSWRmTnYvM2xIWHBpdGp5NW5UOWRka3FNQUVPY0RG?=
 =?utf-8?B?WkNtK3pPWnkybGlnVTUzbXdhMktaSVhnZjg1eXl5OGxUVC9Vb1BiOGpwTllZ?=
 =?utf-8?B?b05PRS81dnZhcUx2VWk0eFV5L2VmdktnYVhCOTF3SS8wMnlTWURkREkwYjZS?=
 =?utf-8?B?bExrRmtKbzlDeHhkcDdnT05QR09ocjNjUWdYaGhKRGZ4U2l0ek5uTzBvSWxP?=
 =?utf-8?B?QlpnWFdBUjZsNno4UFhWK0FGWWcrUGFpcTFtMDdFMjRMbFFkUzdlakRZNmxi?=
 =?utf-8?B?K3o2TXpNeHE2M0ZYeXVDdjJWblhBRGpBMXhHUC9lV1J2cHFBazJRWU4ybGRY?=
 =?utf-8?B?eVJNeGxnVURISmljeTV6S25yekZTbklDbUYydG9yTGkwTEg4MXZFQVFIUHBn?=
 =?utf-8?B?WnhmeXlMbHQxcVVKdHp6M2piWGxBbHNZWTlaZ0hiL2NvZ2s3K29wZWw4TlJt?=
 =?utf-8?B?V2JGZThBSm9oc0RFVXlLNUtyOWVJeUgwSFlKZXY1RFB1T0EvM3VvRG44enc0?=
 =?utf-8?B?dmRHMjRGRWU2WDVYYVJoelFQOXZPdDczcW11cXNYeEFnenppaXBqSXRqRTZz?=
 =?utf-8?B?K0Y1QWR5UWdrRytRcm9CTWV1ZzlkZjFZL2F5bDFVRVA1cTAwdGxRajhtd2lr?=
 =?utf-8?B?SWhvUFVxNnJtYWJodUFxbDl3TllUQmlQVDBwRW9DUkZxMjhoeHpNU1cyY2VM?=
 =?utf-8?B?WW5hMFdBUWQxa2R0UXU2elFvc05qUE8rMTVGWGhnNm9xZ2xKQW14RUUvWm9E?=
 =?utf-8?B?T012YndxQTV5amszeDEvUloyeTl2QnliakxMaER6NDgwbGxaRFdCaW4zQlFR?=
 =?utf-8?B?YUFyL1dWa0lPMzBzWE10UDdibG9sWDcwUGlKMEZrMG1jeVFTVjZ3ZWNLWEx3?=
 =?utf-8?B?OG95MEVXTnJCM24yRmJnNHJiUTEwYi9QaHM2R1pxQmtGNzcxWTlrUFMxUGJn?=
 =?utf-8?B?SE1FTllhWjFHekNQdzJBUFdPUldodmw4bEtaK1dVYTNuSDZtRXA4bHFFYlda?=
 =?utf-8?B?ZEVHVlQvNytMN3UwUURNQXltTlQ0cTRqZkhaSGcrMG9jVXQ0aC9FcTFsOUxB?=
 =?utf-8?B?eGQ5Nm9oZ0VmYStuL3d4UWlnRzBQRVJldHRTdTRUTE5uclVLVVNSZEtjcXlm?=
 =?utf-8?B?VFdTcVg0NUZ2Z0VTVW5rcGhGbU9SUVIvK1ZOYmc5aWIwaHdFTXQ0RXFZbzdS?=
 =?utf-8?B?U2JXYlU4ZW5NZkFPNUUyRDZBRS9jaTU3clRMUGI1M2swZEF6TXVTV21mYUNr?=
 =?utf-8?B?QmVCU3pzZkd2VW9Walk3Qy8ralFUVE1vRWx0NHQ1MFkzNFBScmk5R0FnbnFu?=
 =?utf-8?B?c3VTVm5lWkY3eU9iV29jNjJ2NEtrelR1Y1I3bW9YeXhZU1A4M3UzeE9VZHVW?=
 =?utf-8?B?a1BWTkhmQU9RTTV0UCtjRTArdUk4ckMxUEFJWXcxK093dzJYL2gwbGovOTZh?=
 =?utf-8?B?bnVucUVsZlE0ankvWDFRemlPWW05cjR5Rjlzd0QycE5BQXUwYTg1TmNKNzlk?=
 =?utf-8?B?Vzc0cXdqY0t5cTR2eWNZT1VoTTkvMFFKRTcvTkJxcEdwM3FsN3oxV0pqRmcy?=
 =?utf-8?B?TnBncHZRS3VpazlUTXBmaFZPOVg4b1B3STcrbFVSU1JyTmRBeHZLOGwwdGRE?=
 =?utf-8?B?U01Kdk1tZTBnOWpOUGw1NDlHZTB3ZUtCc2JPQytYYjJxS3p6SmtHUUNtZXRI?=
 =?utf-8?Q?SziFlAEDVZ40Vcga6s2f09zLrRqgvviA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rzdhd2VjZ2kzcWJPVDBoLzEwdUJXSkllWVg2bWRHYmtrYm5VMWlqQ09oNFVD?=
 =?utf-8?B?MjhJTm5jU2swWHR1REdUSkliK3h6Nkw4OWVWTDhvdFcydStrSitnMDVZd0Fi?=
 =?utf-8?B?TXI1ejlRNWJ1QmFIbFN6WUVYVnNaRThSNU1kTDdWUklRcjYxVkp3U1hOdzZI?=
 =?utf-8?B?Y1BmTEhoV2Zxb0J2OGVTR0dkSkMwV3R6bEFUVVVNVWxudDMrdm1YSXhVVUV6?=
 =?utf-8?B?KzNUYTVSY1A4enNPNkFZeG5ya1ZGZVVNd0xLYnNncDNEcjRvSktPKy9FRXpl?=
 =?utf-8?B?b1MweVBKYUJTdElhTDR1UmhQZWhwQ0JXa054bkgrbXVpbWxwQkZaQXNLUm9x?=
 =?utf-8?B?aVdhdUVHc1UrS3g2N3B3S2FxdE1jZENJWXR1WVUxaWV5U2lJK3dVanRlTVVz?=
 =?utf-8?B?YTN4M25GV0VBeTNLZ3Z6ZVpKWlo3S092K3l6TkVPYkpiMlJhMHJVd3ZXeEth?=
 =?utf-8?B?UmhjTXlnTDExWFJmcEh1Vit5cGZHSzVwQ0JmT1hxWUdKZ25kWjZycmV1OS9s?=
 =?utf-8?B?K3NEZlAzL09oRElMLzRuTktpMXgrT0xXclREbjZTblVNc3NlTW9YVEpOb0VK?=
 =?utf-8?B?RW1qbGdFYklYb3kzNzJpR3RUVlBoQkVJNjMxNTVlYlVnTVZuT2NVdVl1Q2tm?=
 =?utf-8?B?YUNpVnduTUhnQVJZbnREQk9LckxENFd0eGwraFptRTg5dkdERzFaZ1Vlc1ZD?=
 =?utf-8?B?ZzZwd2xvSHNIWDZVQ3Q4TGNFMDdrZmI4ZFVDZ3UyR0tlRGNVb0I5aXRkZzk5?=
 =?utf-8?B?UmRPMTZTU0krbWtEUHNINTJjRnBlMTdFVmtNWlNuMVRwWTY3RFV0ZERrYXNG?=
 =?utf-8?B?d2FtdkU4Tm92UzBCbExIWWM3SUdyaGpiU1Rhd0ZhWUwyaFFYaGtwcUxJRXBX?=
 =?utf-8?B?YUVJbmxNK3ZEdFZKTEpaV216dlhEVTN2L01NckEzYXdnUkxjSHRiK2txWWtG?=
 =?utf-8?B?cytOam53bFZBUHdLS1NTbzVXK2g0T3ZEUkQxSC9nclg2VTVQNlZtUWw0YjJJ?=
 =?utf-8?B?R3c4cGYzaXhkWENCY0pndzIzOFZOdmNZL016RHVUY1ZuZjE0RE5LcFlMVklP?=
 =?utf-8?B?dkErcjBDb3NhcVpITGVjK3pvTnFWWEdORWF4NWp0T3ZFN0ZyMUx4YmlpZSty?=
 =?utf-8?B?QU5xVmdiL0VLQXVvWnBwYWdyZ0RjdmpWT0Y2R0pwblNPSklORGs4ZExkRnNj?=
 =?utf-8?B?c2FTbXJrOHZSS0hhZXFXUTV1dUhMOVdtZ2s1REoxaFlpaUxCM0JUNkFjWXdh?=
 =?utf-8?B?QS9sUjU3b0xBMUlMY1Bsc0U2K3Z0M1JqS0JHcmk4QmllbDdjWlloK0JnaXky?=
 =?utf-8?B?MUtnZGo2S3gydVgwYkprTE1HRWFYQW9Gd0J3SzZYeGdPb1p2cm1WdjlCNGt0?=
 =?utf-8?B?dlpaWGVFeFZkbmVkdWdBZFlvVGVvNTJ6YmtlT3dYSUFoY3M0bXBRMzJMVkti?=
 =?utf-8?B?Z3dPR0VIcG9pN2U5c1ZObU9MY1B3STNicHpPSHA5TjZUOU9VOHJxTHhjTW1U?=
 =?utf-8?B?YzNSYStCNUVKNEswWHIvNjhGQkZ4c0JZaUp0ZW5yQWxHUVYwcXVjOVBMc29R?=
 =?utf-8?B?UkJ6NHhKN2dDZldtWWR4WEQ5UEZJMW13SFBqWDM3NGR1MHlWVWhROWZsOHhH?=
 =?utf-8?B?aGM4Y1BFeVNWQ3BDME0zaHZOVUtsSHl3cTEwUEhLeGR0SzlsRU1YZjBacjlC?=
 =?utf-8?B?dVhQd1ZXdkRJRjB2T1pOaHVrdnFzd2Q5YzV2RmU5SE0rSlBJTHR3UXNUTHYx?=
 =?utf-8?B?WkdmMW1WWDFRTTFPUzhrRTFNbERoUGxwUVFmdkRRSFc1T01lczhOZDlPNFJv?=
 =?utf-8?B?WS8zMmpibkx4dEwvZDN4UVBpblNBd2IzbkdpTUlxQ3hIK3NpZHU2bGhMS1lL?=
 =?utf-8?B?R2tHWWNBZUEzQUFCTUZ3ZDdxOTJnSUxKY1YzMDVPL1VDSkhuZm9lK0dJOEpN?=
 =?utf-8?B?bUltTnk1SnloQjBMWXkyTFRrTWxmRzY5NmV3NkhOQnZRNm8yejZYR2drZXBy?=
 =?utf-8?B?Zk5qczBpNnhkVVJlSTN1Wk9hV3Zqak5wVUUyNjlNcEZHL2ZzbS9ub0hjaWJx?=
 =?utf-8?B?SmM2eENVenZWd1RVa0hCQ0xLcUsvZ0s2cS94cXdYZ040SmgxS09sRVpsQ3Jl?=
 =?utf-8?Q?sZLvYMT7TScEKa1FKyEoEYXTf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cad37487-ee5c-48cf-025c-08de2ec64d2f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 21:37:16.8098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5073+2kN1vsZPlDn3cuPBxLzpcsSTmZF4vvD9+MlQTD56Mfi+g7Jw6GDDcyk/1HpoCpYtDzuofwTdr3go5sTSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9485
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



On 2025-11-28 14:09, Melissa Wen wrote:
> 
> 
> On 27/11/2025 17:39, Harry Wentland wrote:
>>
>> On 2025-11-25 19:45, Melissa Wen wrote:
>>> The usage of DCN30 CM helper creates some unexpected shimmer points on
>>> PQ shaper TF in the steamOS HDR color pipeline. Fix it by using the same
>>> DCN10 color mgmt helper of previous hw versions to translate plane
>>> shaper func to hw format in DCN32 hw family.
>>>
>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>> ---
>>>
>>> Hi,
>>>
>>> Commit a953cd8cac6b ("drm/amd/display: Fix MPCC 1DLUT programming")
>>> mentions some visible artifacts when using DCN10 CM helper on DCN32
>>> shaper and blend LUTs. On the other hand, using DCN30 CM helper creates
>>> some shimmer points on steamOS HDR pipeline. We didn't noticed any
>>> visible artifacts so far, but I'd like to know more about what kind of
>>> artifacts were visible at the time this helper for shaper func was
>>> switched in the afore-mentioned commit for further investigation.
>>>
>> Thanks for the debug.
>>
>> Do you have more info on the unexpected shimmer points with SteamOS?
>> Ideally a video and a description on what to look for and why it's
>> wrong, or a comparison to a GFX-transformed example that shows the
>> correct visuals?
> Hi Harry,
> 
> I took some pictures of clear unexpected scenes in HDR games.
> 
> 1. https://people.igalia.com/mwen/hdr-dcn321-pics/HDR-DCN321-split-fiction-game-black-loading-bkg.jpg
> 
> Just loading Split Fiction after having turning on HDR in this game options (Options > Graphics > HDR).
> We expected a black background with the Loading <icon> in the bottom right, this background is full of bright spots.
> Friend pass is enough to reproduce the issue without having the game.
> 
> 2. https://people.igalia.com/mwen/hdr-dcn321-pics/HDR-DCN321-god-of-war-ragnarok-menu.jpg
> 
> Colorful-bright points around the margin/corner of the God of War Ragnarok game menu.
> 
> 3. God of War Ragnarok game intro:
> 
> - https://people.igalia.com/mwen/hdr-dcn321-pics/HDR-DCN321-god-of-war-ragnarok-intro1.jpg
> - https://people.igalia.com/mwen/hdr-dcn321-pics/HDR-DCN321-god-of-war-ragnarok-intro2.jpg
> - https://people.igalia.com/mwen/hdr-dcn321-pics/HDR-DCN321-god-of-war-ragnarok-intro3.jpg
> - https://people.igalia.com/mwen/hdr-dcn321-pics/HDR-DCN321-god-of-war-ragnarok-PS-logo.jpg
> 
> Same random shimmer distortions.
> I think those images are good examples, but still pending screenshot/GFX examples for comparison.
> I'll take it and reply here later.
> 

Thanks, that would still be helpful, but even as-is these images
quite highlight the issue. It's more severe than I expected.

>>
>> Obviously we don't want to simply switch back to DCN10 helpers
>> without understand why, and potentially regressing other use-cases.
>> At least we should look at what the differences are between the
>> two versions of that function, and which part of the curve programming
>> causes the undesirable results.
>>
>> The original bug that was solved by that commit was a regression that
>> sent bright values in an HDR video to black or red, so basically
>> something really messed up bright PQ values. At least I suspect
>> it was a PQ HDR video. The ticket doesn't state that.
> I see. Looks like now we have somehow the same problem but in reverse (?) like black values mapped into bright values (?)

Yeah, if I understand your screenshots the issue seems to happen
(mainly) with dark values?

>>
>> When looking at the diff between the two functions I notice that
>> the cm3_ version is missing the dc_fixpt_clamp_u0d10 for the
>> delta_<color>_reg assignments, toward the bottom of the function.
>> I remember I had to add that to the cm_ version since it caused
>> issues with SteamOS HDR. Can we try that on the cm3_ function?
> Yes, I remember this issue.
> 
> I've already tried the same changes from this commit (https://gitlab.freedesktop.org/agd5f/linux/-/commit/27fc10d1095f) to cm3_helper, but it doesn't help... probably because the commit was addressing a different behaviors.
> 
> I also noticed on cm3_ they consider a different range of hw points, as in this comment:
> "
>     // DCN3+ have 257 pts in lieu of no separate slope registers
>     // Prior HW had 256 base+slope pairs
> "
> 
> Can it be related to this problem?
> 

Possibly. The point distribution is one potential culprit.

How I would debug this is to look at the diff between the two
functions and try each diff one at a time to see whether one
(or two) small changes fixes this. Then look at what that change
was and what it does. That can then give us a guide on how to
properly fix it without affecting other use-cases.

The other thing to understand is why we didn't see issues with
the Color Pipeline API tests in IGT.

Harry

> Thanks,
> 
> Melissa
> 
>>
>> Cheers,
>> Harry
>>
>>> Thanks in advance,
>>>
>>> Melissa
>>>
>>>
>>>   drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
>>> index bf19ba65d09a..a28560caa1c0 100644
>>> --- a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
>>> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
>>> @@ -501,9 +501,9 @@ bool dcn32_set_mcm_luts(
>>>           lut_params = &plane_state->in_shaper_func.pwl;
>>>       else if (plane_state->in_shaper_func.type == TF_TYPE_DISTRIBUTED_POINTS) {
>>>           // TODO: dpp_base replace
>>> -        ASSERT(false);
>>> -        cm3_helper_translate_curve_to_hw_format(&plane_state->in_shaper_func,
>>> -                &dpp_base->shaper_params, true);
>>> +        cm_helper_translate_curve_to_hw_format(plane_state->ctx,
>>> +                               &plane_state->in_shaper_func,
>>> +                               &dpp_base->shaper_params, true);
>>>           lut_params = &dpp_base->shaper_params;
>>>       }
>>>   
> 

