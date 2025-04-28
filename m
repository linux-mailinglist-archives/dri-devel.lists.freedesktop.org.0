Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C33A9EF6C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 13:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0FC10E427;
	Mon, 28 Apr 2025 11:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QU2Wn/xq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DF510E427;
 Mon, 28 Apr 2025 11:40:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FRLa5h+12wFcsa4W34wLqNvODCG3WuiH52cQCq7a9Gqcix6FemF/zj5+fpxIqe6kjWtu1vrK8LtxiWj9fydOlelG8Vi4ahF5x8Am32UH7EzOFXh8Jc6gWDqz36n8T0o+1RSkJaX7mcPkN0t84jzOQQO3lrbcG/3+IoUooZWD0UHIJuWKIwNtCeX9qcCiekTE/VABOQ7tiSUuhJ9/Z8NagRqi8KYSLsIkxvjHswIWaB0YdloBNKB9YVZpHYyp+knQKOEx78/aywxShmrLVKiGbdacDpBTzWbcimVG5ZxRz4i6N0+k5riR9CsKxBcd0vAPWK9C1bg7srua2W9pxOve8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVt30n3+Wq8Ak8w8FvlgLoDJ82qqv7CD2r5HqkaSssw=;
 b=GatfxthjJNAZJ7vHiUqTi3AFvgXqYdZWkz23M1UdyTCr2TUuU71+3PfOO+KlqPXzIbopDdYK8Zg2uXB+H/BJkkSizn7GK5gChBnPqqA2peb8JQP9wDab21slx1GmD5sthlUXtowgu/TRPFM7l0Xqt3emDd9ufv+QA2tLI8YlsLq+3cZ66RCm7HoUv9YXaUI+t7v3hJDxTG2nLUfaU1mM/fv/W0/2E7us8BKRlCTOXUbBIUkxjYqhRD5ikvn42JBrSsdByjrqs1yXwUtyOqix7YH/iw/t8FoAlcmKm3xNTT4nonJ67oLgI4RIDcSVuhNTYJF71KtzAcueuk9z27WOBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVt30n3+Wq8Ak8w8FvlgLoDJ82qqv7CD2r5HqkaSssw=;
 b=QU2Wn/xqWXgnsjd1/FwIqjzoVUcG6W/YHGb6uq2emmSjMR6N/J8zDeay9Evs6EhTrMYeU3LFhQ6v8eup23KtMRltNMlbiQ/Nt5S7i3oyn5qDk/oiLASC9LedA3pIe99HOmRn2tXNXMWr0Xm8nU2BdifzRf2EV3oWx5H1FrVujPk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by DS7PR12MB5768.namprd12.prod.outlook.com (2603:10b6:8:77::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 11:39:57 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 11:39:57 +0000
Message-ID: <f9c5edeb-ffc8-4a25-a80b-3ae8de9b62da@amd.com>
Date: Mon, 28 Apr 2025 17:09:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 1/5] drm: add drm_file_err function to add process info
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Simona Vetter <simona@ffwll.ch>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250417161042.120981-1-sunil.khatri@amd.com>
 <4b7a7016-7ad5-4d08-919e-9876f7da1ef2@amd.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <4b7a7016-7ad5-4d08-919e-9876f7da1ef2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0195.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::20) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|DS7PR12MB5768:EE_
X-MS-Office365-Filtering-Correlation-Id: ae238871-3fcd-46eb-e503-08dd86496690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjArcm9hME9nc2VhU0dlTmQzWjFFQ3ZnQ0k1dlhKSDZGV2hOYkM1NEVPRVV0?=
 =?utf-8?B?cVRaVWJXa3dGdWFzZGZ3bU12b2pJRExKTGVNNkQ3bnBoaFBWNEZ2YzhnU2pT?=
 =?utf-8?B?ZE1YM1p1YlF1Q01CTG1SU1FYWUhTRU9lZHVndWdtd200eStpV0E3bFJCM2NZ?=
 =?utf-8?B?YWlxVVVCY1c5VTRPelI1WXI2MEJIV290RGxOYnlSamNwTVBuTThKQnJqUXNW?=
 =?utf-8?B?QUVIM0FjdEFlempJNzlFSitlTGNoRTNzd2VqSEtkN2ZSeWRPZ01uOTdXVGZK?=
 =?utf-8?B?ZnJ4S1pSK3ZjZk1iVHF4R1FuOVREZ2U0VCtqRTg1N0l0Ny94bXR6dHRmcnJw?=
 =?utf-8?B?QW44c3p3V0ZFb1Nrem1TaU1uVmEvVjRGMU9IQ1RPa0RuVDRrazF6eDYzWmVs?=
 =?utf-8?B?TmJSVlZFeGFVUlJIWS9pVUtiRkRWZCs0eDFtZFRXYUxPS3BkMk1WNmJtakwy?=
 =?utf-8?B?NEdFQUFYUFVmWmxGWXlHZUhMS0ZRNWM1Uk5hWlFBTmJpTDlNUnlVVU8vUUNJ?=
 =?utf-8?B?SDVvWjVTSlU1LzEzNkpNWGtQVm9qK29ZSXU2cG5FRWkyZWtzekEwMGZFTWFK?=
 =?utf-8?B?NUhyOEZZandndzVwM3BMUlVHcjFOSjlhTkg4cU5mQ0RoRzJtaFRCMjkxQ1Ax?=
 =?utf-8?B?b2dtWlhpUG02Q3V3bUNhSnBJT3UyM05hWTdtWW1GWlhHNVVITE5rcExnYkRy?=
 =?utf-8?B?VUI3K2NUSHhzQm0wVG91QnAzVjZIK2RZUk1CemlaSk1PUEtTNkk2OE1mN0c1?=
 =?utf-8?B?ajAyN1M4czFwdndxT0VWemh3MUNmZnlIV2wwZ0x4T0wvQTNnRnRMTktqd1Fm?=
 =?utf-8?B?RWZaaWVaMU5ISVE4NHd6YkpML3hnOVpWMjJmT1V5WDZKT1Fyc1JIUlFwMEZX?=
 =?utf-8?B?b2JBQUF4MXVja2NEdk4zVy9obmdyNFU3R3V4K3RFRDBYQU51ZUlwazBXelYr?=
 =?utf-8?B?ZVNyZW82OEFJZ1kvZ0dVR1RSZmtoejBqY3lXSmNiaHpEcld3bVI0NmV2ajBy?=
 =?utf-8?B?M1g1Vkwwc0pUeFE4bThrNnZBanZEV0IrVVRsL1liaFNTYmhLcjMwWEdIYllt?=
 =?utf-8?B?ZXBFaFhCc2FWTU9nMTJiRlIxalE5ejg1bExQYWlyNmlqcGVxQnZrMkdlNlBm?=
 =?utf-8?B?QnUwSnRDejA1MjQxWmRhNnpFajBQd1BIMnZpalVCQ1FVZ2pSUFNSTHQyV21J?=
 =?utf-8?B?MHJiMVZ5eForR2QrTi9yMkk1blcrZ0pzYThwUnZUWXBKVWJJeW1SbllIUlpJ?=
 =?utf-8?B?V0R4RTdWci9BQ3BwVHRsMDBONWFoc0xzbjkrbVRoUUlDWVVDYklaTzN2bXlj?=
 =?utf-8?B?Ukl0Ym1LNkhZV2Eva2xOZlFTWXQvRHU2Y1pEOEJmaE4zTGwxcEwzano2Q3Zx?=
 =?utf-8?B?U3VsRER0eGRMV090NUpnQUUvb3NFczIySWpaTW5KVHkzY1lCRGtpMXNUWXVO?=
 =?utf-8?B?Yjltd2VycDdsaUlVMFVPVmpXYmFiSE15a0FYdmhaWnQ5RVNlWStJTzZDSlJm?=
 =?utf-8?B?ZmJ5VkxIUVhnTEhJMzhJNHEzSERKaVJvUlM2UlQwUk54TkplZ3dodkdyVitD?=
 =?utf-8?B?WTNNM2RkL2V4d2N5RVp1L2dzN3FyUjFCOHlvL004U0JTL2xLTENJZS8wd3hP?=
 =?utf-8?B?S3FLVFVNalRUamd5TmYva200bGduZk1COURwczB6a2V3eldSWS9WUzZ2YjBF?=
 =?utf-8?B?TGVZTGM5RXo2bjJwNytublhncFFOaTBOTkFBTm9jZGxLV1VVT2xzbW5RM0V1?=
 =?utf-8?B?VGZsQWkwT3JZVktkTC9FNDVtT1g0eUR0MExUeEZ4djJBNFEySnAxa3U1dnZ4?=
 =?utf-8?B?eGZ1ZlgxdGpwVVRvVHRIT2lvYXlwcytvbnZkRWR6ZVcxdjZodG5DL1FtSEtO?=
 =?utf-8?B?STRMODdHWUM5MUJWU1hOMklycHJRa0NadlRqczJ4dTA4RHowOGxVQ2xlS1hw?=
 =?utf-8?Q?MvlZxHu+L2w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlI1OXNESXJkUlBwUFkxeFkwYkcyMUFsMy81NHpuQVhSQUFQVVc4LzgxcXFk?=
 =?utf-8?B?a3hpdWpJZXlYRkZ0N2F6UjNpRDlIRE5rcTdFQ1dYNDNENW9sdkVyUXRvRFZR?=
 =?utf-8?B?blNCWTNpRDkrZk13TENpSTVrSGtiYWZjYkZFNlIwNEYyUnRZWElyM1p6UzVa?=
 =?utf-8?B?d055alRsM0FIMmthTS9sODN3VUQ0bGQ1cHJEU0RuNTNOekNYbktRc3dRMkdo?=
 =?utf-8?B?aWhmeFJLRldHakk3b0hhcjZPQzI0SnNxNWQ0NFdQU0J5ditHU2xONFFEQ29X?=
 =?utf-8?B?QVNhb1Erb09oTVdIYWJiMExkd1JWMzRtbVdNNU9tRGFwNGpoT0EwS0NQUTFX?=
 =?utf-8?B?MUU2dCtLZ1BHYWd0eEU3TEdkWWRhZ2h0bGFDa3R3YnF6NnFGMXMwTXpaYVZx?=
 =?utf-8?B?a0dVcVZhQk5GM3E2YkRUbGgyOXlFOE9BLzRzRXhvMThrMlZEaHVoRjRZNTE3?=
 =?utf-8?B?RmJSbHIwcmhIWlNSUzB1blNlVitYbEI3YTV2cUNULzlvK2h4Si9vdThMNk8x?=
 =?utf-8?B?M3AvRWdpd05VMUs5ZXJPZEdCNWZ3NFo0ZXU0cjhmTUhsZWhveC9xTCtTdG4w?=
 =?utf-8?B?WmdwVXVLUkRtVVhhZHpFN2tNQzlEay9uMk96UElnaC9CT3A4eGorSktCVjZu?=
 =?utf-8?B?aEp0SnR0YnJxL2pBYVMxay9iMjhCQW02c0pJSHloMUxyWVE1NGFuV0UzLzkz?=
 =?utf-8?B?L2U1RGpBbG5ZTzZBbnZZS0NZUVhyRG9Pd3FXSVpZNnRNY3NTTGtuV0hSdk5M?=
 =?utf-8?B?dFpRczhQelM5NHI5Qkc5WmV3VlRjUnZkaG51ZHBOdmc2VjhlZlNQUzNSRkdm?=
 =?utf-8?B?cjJaRmQwL016WWNPTktFZUJEcGY0ZkZja2V1N1N5M1N3UmRkd0NhbzkwSWd2?=
 =?utf-8?B?bVBPZHlBdkl5VTFXUWJnMjFLdGxWZS9wcDF5VHFJZ05VeTRQd0U1Y1ZwaDls?=
 =?utf-8?B?ZnVRR0ZNa3RtdzhaUjB1alREVUJQelRneGtzVUlzV2FXc3NHNDZXZHhBYzY4?=
 =?utf-8?B?NmJzVFp4TUJ4K0R6Y2ZKY2NLZzFzeDdJQWgvOEFEbE5QOVJOWE41VkFsVlJo?=
 =?utf-8?B?UTQxSlFsVlJPd3A5ZURMSXhQbERCd0xIaUpVdjRVN0Rra1cvVy85aU1vUHdi?=
 =?utf-8?B?TU1EZWJJbjhRNXZBSWNsd0VxQ0RIYzdTVDVoTFVMYUt1NTA2VUVUbEVUYjBL?=
 =?utf-8?B?MDVOMmZNeWU2L241VGNKWkZMaEF0NG9TNk5ZQ3NjZ3E0UmRXUUZ4TnJkc2JZ?=
 =?utf-8?B?ZTJ6d3Z6aHZSbVptTU9rR3d5SytwQ2VpbXpBM2h5R2hIUkdscGdVdzYyZ1JR?=
 =?utf-8?B?RUpYMGloUE1sNnJwMkdsejFCL2NIQTNKTC9NMUwvSmE2akFMR0ttMHM4TGdF?=
 =?utf-8?B?VVNwdXFOZHlzYWRHVDlMQjQ1cWRpc0JONUhJdHFHR1JmTGZwTEZDYi9rZm4r?=
 =?utf-8?B?dlpPejVrLzhlZWFPUnhTZGJVWDZteU83VTZSUVlkVXduQ1czT1lHTFFOZFhw?=
 =?utf-8?B?OER5cWRnclBiNlkwNkdPT0VsR3ZiNW9aM3poci9TbmtaN1Z2N001QVB1d3FV?=
 =?utf-8?B?RS9xcHhLUTZZQWpLekZVampzSmNpb0RDMWVhRVVIUmlJSGdNblY0UUFNckNS?=
 =?utf-8?B?cTVsNkNQRXNqTlB1Q2laNE16YWFPaDdHS0JFWndIMEFCRVlvY084WDRGazB2?=
 =?utf-8?B?SjgyZzh3cXFXYUFBc0VNYlpWNG1sZWgrMXRlU2hYNWNYT3JoZU5xSGtuY2R3?=
 =?utf-8?B?NEQxWVZoa1RiU0c0UmsyYjhwSW1VZFZ0ZzIzdGRMOCtnWmVpMjR2ZTgyREY0?=
 =?utf-8?B?THpBVDhhaDFaV05jeUpuY0NXOXI1bjl6TjJjbWtYK3VKSkN6QXMyY1FCZ21t?=
 =?utf-8?B?cHo0ckF1cHRBNEZOQWRlWmtrb2lTZ3ZLZGpDVjFxazFLQ0xpcFlaVFNJdExt?=
 =?utf-8?B?UEZyTXJJMmU5OEdjbkt0VlUvcHJ1c284MFhQVXBEeU1NYUdRNFltLytXRDlT?=
 =?utf-8?B?TFc5Ujk2THhWbFhIMUJBYVQ2ZkdaT2FBTVQ1ZlBnWFZXWWxrY1N5dWluZFJ5?=
 =?utf-8?B?Y0xiMTBYRGF0WmxoSE5HTk01TlhWWEFyNnF2SE5FcGdicFZYRzNlWDFDRkhG?=
 =?utf-8?Q?D7sb4zErrFKo/cL55leWbL3cX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae238871-3fcd-46eb-e503-08dd86496690
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 11:39:57.1251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HDD8Cm56jolgBTj4tffufdZR6JxW+kpHLwfXbQn/d9UGaFkYvC3/4Wwhhd0wHL+aa3udDCvjs24L+NnoRevcaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5768
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


On 4/22/2025 2:33 PM, Christian König wrote:
> Am 17.04.25 um 18:10 schrieb Sunil Khatri:
>> Add a drm helper function which appends the process information for
>> the drm_file over drm_err formatted output.
>>
>> v5: change to macro from function (Christian Koenig)
>>      add helper functions for lock/unlock (Christian Koenig)
>>
>> v6: remove __maybe_unused and make function inline (Jani Nikula)
>>      remove drm_print.h
>>
>> v7: Use va_format and %pV to concatenate fmt and vargs (Jani Nikula)
>>
>> v8: Code formatting and typos (Ursulin tvrtko)
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Any objections to merge this through amd-staging-drm-next?
Gentle reminder here folks ??
> The follow up amdgpu patches all depend on stuff in there which is not yet merged to drm-misc-next.
>
> Thanks,
> Christian.
>
>> ---
>>   drivers/gpu/drm/drm_file.c | 34 ++++++++++++++++++++++++++++++++++
>>   include/drm/drm_file.h     |  3 +++
>>   2 files changed, 37 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>> index c299cd94d3f7..dd351f601acd 100644
>> --- a/drivers/gpu/drm/drm_file.c
>> +++ b/drivers/gpu/drm/drm_file.c
>> @@ -986,6 +986,40 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
>>   }
>>   EXPORT_SYMBOL(drm_show_fdinfo);
>>   
>> +/**
>> + * drm_file_err - log process name, pid and client_name associated with a drm_file
>> + * @file_priv: context of interest for process name and pid
>> + * @fmt: printf() like format string
>> + *
>> + * Helper function for clients which needs to log process details such
>> + * as name and pid etc along with user logs.
>> + */
>> +void drm_file_err(struct drm_file *file_priv, const char *fmt, ...)
>> +{
>> +	va_list args;
>> +	struct va_format vaf;
>> +	struct pid *pid;
>> +	struct task_struct *task;
>> +	struct drm_device *dev = file_priv->minor->dev;
>> +
>> +	va_start(args, fmt);
>> +	vaf.fmt = fmt;
>> +	vaf.va = &args;
>> +
>> +	mutex_lock(&file_priv->client_name_lock);
>> +	rcu_read_lock();
>> +	pid = rcu_dereference(file_priv->pid);
>> +	task = pid_task(pid, PIDTYPE_TGID);
>> +
>> +	drm_err(dev, "comm: %s pid: %d client: %s ... %pV", task ? task->comm : "Unset",
>> +		task ? task->pid : 0, file_priv->client_name ?: "Unset", &vaf);
>> +
>> +	va_end(args);
>> +	rcu_read_unlock();
>> +	mutex_unlock(&file_priv->client_name_lock);
>> +}
>> +EXPORT_SYMBOL(drm_file_err);
>> +
>>   /**
>>    * mock_drm_getfile - Create a new struct file for the drm device
>>    * @minor: drm minor to wrap (e.g. #drm_device.primary)
>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>> index 94d365b22505..5c3b2aa3e69d 100644
>> --- a/include/drm/drm_file.h
>> +++ b/include/drm/drm_file.h
>> @@ -446,6 +446,9 @@ static inline bool drm_is_accel_client(const struct drm_file *file_priv)
>>   	return file_priv->minor->type == DRM_MINOR_ACCEL;
>>   }
>>   
>> +__printf(2, 3)
>> +void drm_file_err(struct drm_file *file_priv, const char *fmt, ...);
>> +
>>   void drm_file_update_pid(struct drm_file *);
>>   
>>   struct drm_minor *drm_minor_acquire(struct xarray *minors_xa, unsigned int minor_id);
