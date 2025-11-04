Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4367AC3157D
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 14:58:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A1710E5E4;
	Tue,  4 Nov 2025 13:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Y8Zucvz+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012038.outbound.protection.outlook.com [52.101.48.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E24D10E5EA;
 Tue,  4 Nov 2025 13:58:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QDTUscbHqEDCBoWxPESA29d0SlYGkwDZbM/Fd626AvzWM24i6MdySMI8/UL4oQH83GIhL/f4MfA7B5YizVbFDXTko4pVDR5M7lSZfJnMpylMyN7srQBe4ukyjACuYdXfdwa5ADQ+s9CeRZOkNMI9qbpU7tkOrE5zEpMBUE6MzXXdXZb2t4SE7AFl/T0u9GZF2prTjwg6+k1RYZU4zxigZhlPtAFrTfhofFPbq65RUWxpW0c9ehkmEGT/mZiHSqtJKbc5rP1UPvSlg/OphgNDNAbPEYP0gDf5aVAW32dFFVIAlLoQeFJpg4e+g+RKQ7ajYgYeNm5yd3lbGmkFpEdy1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzMCC2jGc9VQ3CiVNoK3hjSL7j60p+qA/hy67QCSSu4=;
 b=y/+BSVZNcDf2UBFLDnd4sTiGyyBCYotd1q6oaqg6yHjChDfc0My51MMW4ZQtvW30WA12e4rJdntm4AtN36GU8awv9t1DgAQQP9ECWYzA86aroMR+fOIG44T9AP+0gLUb0GeHsJdIMe1SkcHFkVam0uHh/q8Ja5P2lztGSMt7oPxto05dN789ymNFI4nDmfY3fbaNZJQZydAEtsoLrWkGI930FLR4L3MYiJyRDQbz3scVG9T8dg2UjUJ7/x8P02XwsZzQG6Bpy0cA0G6yze0ixsEn/3ick6SOY4PYP8o104ixYEXsSt++4seH9YMy0VjbUYCuwXURTDAhmwX4ihB5dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzMCC2jGc9VQ3CiVNoK3hjSL7j60p+qA/hy67QCSSu4=;
 b=Y8Zucvz+bHDMbtyjrQ31I85fA5UIaXQOB62F06NnVjMBebHjEafpnflUECU35O5RNQbUDbABq3MchD6d6aRwXt6TpA5qJlbDx2EIQxENm/TftRym1OlS2t/PdIsPVmnJwkOnVv6tk8WOQ0n+YO7x4WYNuWqrpCtiDteYhmsK+GI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8454.namprd12.prod.outlook.com (2603:10b6:8:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 13:58:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 13:58:51 +0000
Message-ID: <4a65da05-c6c3-409c-a5e2-05d4dae137ff@amd.com>
Date: Tue, 4 Nov 2025 14:58:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/20] drm/amdgpu: give each kernel job a unique id
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
 <20251104083605.13677-2-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251104083605.13677-2-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: c080fdc9-83a4-4fb4-2de6-08de1baa485e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjkyWFJkazJQNHM5NHVjaUlXTldDT3RubUF6bjBBNnJWZmY3Smd3ampVcWVy?=
 =?utf-8?B?dStjVmROTEhiOGFOc25sNXhOU1BtdWlWcGpvWDYrSmtQc0NaZlRsRUZuSHNZ?=
 =?utf-8?B?MEIyZ3NRRnd4UEtMY1hZMTd5aXNCZ2FjZUp4M2lOU3hnaXpaQjZhVmZ5MDdk?=
 =?utf-8?B?aThnMUFJS0tONmxRSDM0RTRheHQ5bm8zWGJLYk9vNmVXWXdhajlONHJ4L3Qw?=
 =?utf-8?B?TkFaTE5pdG1UcEFxd09oS3MvczJTNVdaWE9odkMxWFExRjB2Q3VaU0Y4eXA1?=
 =?utf-8?B?ZDAyMnJsQ2swVEdRU1FydWZQRWgvaUhlSWdMcVNyQUY3MVNldGk1OEZmQ1Vn?=
 =?utf-8?B?SU93QmhQcXdzSDlpa2dza0dnU3JaWW1OWVkvOFRnT0lVa3hTSmw3dDEzVm9O?=
 =?utf-8?B?aUVoTzRqZG1MWWJ3YXR6YTAzYzRNYzdsZUFEMGNnV21TU0Z2WXkzQUxoK0hT?=
 =?utf-8?B?aEtheWhKUzlqMFQzTGgvcjluOSt6Z2VVKzdWQjdUazFyTGExV29qbnpGK2RO?=
 =?utf-8?B?c1RvOUNZanRUeWtISmFpcFlKVVhQMStMd3g2VzhIV1BJK2tHUTJuVEFTbERN?=
 =?utf-8?B?d01FZU11ZXZUdkNReVdaRzZlbDBMTkdyTUNMNksvNnhGT0paNkpWbkpwbG83?=
 =?utf-8?B?eUxlb1dYb25idGxaZ0QvUlVoTWRZazFOMjBGei9UakQvWk11V0psUFFxUHZ3?=
 =?utf-8?B?NVo5QUtaQ2RGRFEyMlUrQU01NTlxWFJhaFkybHpBcXlZQVE3RHBFc1gzZUdk?=
 =?utf-8?B?VGVOQnAyZ0VvejJ1UWU3dmtFaWRFRzM4Ulc4dlF6VTVmL3JBOFFDaUcvQUwy?=
 =?utf-8?B?UXk2aHJucnBUZC9JWGl3UGw5UUttZ25wTFQ4SWh1N2ozcVdHaGhKOEpLQnc0?=
 =?utf-8?B?Yms2eTl0NXdMR1RoR3dBbDNjS2l2NlhTRkNJUzd6amZJZUNtaWhiMm5iVmZJ?=
 =?utf-8?B?UWlGWE9jNGF5clhVdjVENEx1NUFsV1BpZ09IeURQcmxUc3FIWHdYeTJkVmVj?=
 =?utf-8?B?MmZxR3BsNUFCWDhvVnVPKzRLQjNURHFDTWFMdUVXNC9qR285QS9VdVNSTU5r?=
 =?utf-8?B?ZXhZaGF6dEl3NXF0ZDNiYzFqNmlyYTFva0hSd1hKSDMydGMzanV4dWlqTUY2?=
 =?utf-8?B?ZDZOTFo1bTZvL1kveFFmcFVKK1M2UEdnTHNoQnlGT1hBYktUdktBMEtqSHhY?=
 =?utf-8?B?Tm5QNVoycXVFTXh4RWFzYjB5SHczN0dpVVgxNUxqTU5BL3FOblJOS3ZacEtU?=
 =?utf-8?B?TmlhZWVFenZ6citreXpBcjNqczJNNWFBMnp6OXF5QUEzcUZIVTFaQllLSFJ4?=
 =?utf-8?B?cmh5aDFPUmhEY0JWd3BQN3YxV3o1TUpucVIramZhakQrVWNZOVdxUnZjUWU0?=
 =?utf-8?B?TGI1UnZpTnhPQXhtYVNEWHZXZThxOHkzWVB1b090cUJuZ25ZL2tSelU1eWZN?=
 =?utf-8?B?ZW1CaGVadml1WWhNOE5aR0wxTTNUL0wzZWE3QkdLT3ZZb1Q0ek51WUE4ZDNP?=
 =?utf-8?B?bkxLcFFIZVVxcjJNUUFUejdoc20vbjZ5S0tGdXhGMC9LQjFiNThna1JTV1Nv?=
 =?utf-8?B?M2pTTngydGN1U1AxQU9UejNlN1p2c3d3b2hkU0srTXAzOE9yRHpKT0ZtM2FF?=
 =?utf-8?B?YmtWTHFhdy9QK21HYTZrbVNzTFVrZjBrek0vV3p3WDBLOGFBRmdTVkh3SWhI?=
 =?utf-8?B?U01mNy9tVm1yZThPckR2bFRMbEdMVmZLSFcvTFNiRzV0MkFwcUk1bmMzbE5S?=
 =?utf-8?B?RlJvN2JUVkw1QXd3bEZ2NGNFR2lwVnhBVHlhSXVib0JOTVhIWFJZaUFUYmhn?=
 =?utf-8?B?N0JDejAzU0wzM3lQd0QwU1Q4cW9BYjRVaElESElLWTRKRE1vQkdCQzRKWW4y?=
 =?utf-8?B?UU5MVy8vUktNY1V5MHlhdGRLKzdCeDdWVmphSkxiM0pSMTJpa1ZVMFNBV1VB?=
 =?utf-8?B?dkxFc045TlNSdHlXeVdOTVptTjFrbktpTnZXbmJlNGZmaTBtQXFsdHVUTGM0?=
 =?utf-8?B?cmorNXNVbVpBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUdySEplMVJBb1JDb0ZIMlpxdm0zNEN5dGUrZzg1VWVhSUJqVFJUNHdGc0cy?=
 =?utf-8?B?QnpGWUZOa29ZUzRMQlliVGY3QlAvSmJpZ0NPcnVlOW1nWWhiclp4dXRxZzNI?=
 =?utf-8?B?d0tENTJkaEZJc2dwYTJOZnlvS0o1UjIrblF0ZnhqMDdiS3VjTTF3Z1VweHdm?=
 =?utf-8?B?WnpiVC81LzIzYkVUM0trNDdvSWxHaDJiUlBVeUVTNDllK0lrMVYxUnVNejJu?=
 =?utf-8?B?ak9zSHZjK0ltelpSMHpsQUo4ckNIQlhmcTRwclVzQUE4dzhSYWpnSXdFTmZ6?=
 =?utf-8?B?ZndXbHZjWVZ3M1g5ODZFSHRaK1VUSFcyQTZnbW5WY1o4bXJsQ0VsQmFneGFh?=
 =?utf-8?B?M0RzWCtlaURUOVEzWlkycnhmQWJzaHlpRDI0S3hReHZCZlZLc0k5QmdlRlBC?=
 =?utf-8?B?RHQ2b0xGTFNvWkpKaVZJblBDdXpVV0VNdGxTUHZWbVZWa3JYMWN2L3dGL3hX?=
 =?utf-8?B?SGhRZHRudEY2VThTQkJBMGl5SEM3SUxsbExmbTRhbmxZVWcvbUszOW5iUzJp?=
 =?utf-8?B?UWgyMHhVL1dqcHF5MFBIS0p5a1VRVzl1RVhPc2VIUDd4Z2RycnNGZEd2RHVH?=
 =?utf-8?B?WmhNVjJJS0hXQmFTd3hXZWF2cktjU3drRWl5RytPU05QTWgrdzJBd0RnQUQz?=
 =?utf-8?B?M21mVk9GZXMzY3hYOEpCTnlXdE1YYnRxMk50Vy9EN1hGUTc4dHJiSkhheUh2?=
 =?utf-8?B?Q0l4Q0Q1SXBuZThtdWluOEphSWZ0N1A3Q1JHYS9iRFhzYVNnMWNGYkl0NTAv?=
 =?utf-8?B?OUE5NlZma25ibkRIZGU5TklENW9mcCtqbnF1bXUvNy9zNnJHbEJYd3NEWmto?=
 =?utf-8?B?VnkyQUNHKytNVlRNVXhkakRhM21LVTdHS3VadFhVbHBpa2RhcE53SStRbFJP?=
 =?utf-8?B?eUp1YXBkTDFVU2QzcklHMUFNbzZVZ044eWtvR0l0TDc5SHQ1aGVpc0JlZ09y?=
 =?utf-8?B?UGtVMnJwMWNRZWFTc1ZGMnNMNEJrVmlXM0hjaWNlakpKNHZYRmhQS0g0Y2I2?=
 =?utf-8?B?Y21QMUFjVFBBOERnR1ZvWVRseVl2SHFjVThrVHlLSjhOcFBxQ1FFUlVOM0tP?=
 =?utf-8?B?dnZXc0grR2loODBwcVJ2Z2p6UlBTZmxyNUlkYWJsNHo0cHl3SG8yeGJ4QWdC?=
 =?utf-8?B?RlRhcnNWNmtMTDF2VDdhQklZUHZsTjdiNlJ6dGgwYTk2UkEzVncrMXlnWnFx?=
 =?utf-8?B?NzhoSnJRNGdkZFlSZEZqWGpjeVp2Qnp5MXBublZ1aFF0M3B6a1NOcmtod0tQ?=
 =?utf-8?B?Zk9FdWM1RTJzdG5CNEZDTnVTT3VJeXJwT1ZWaVl6Vm5lQytEdjEyejlITmRD?=
 =?utf-8?B?OWYrKzlhQjdVU0F1UVVoRGZ3YktIUXY4VTdTcW9CaUE5a2Z4NDYxWTdZaWtp?=
 =?utf-8?B?Rkx0a3k3bElrNUlmL1M2elNnTXVFQUk0TzVGbGJrcjNVMG9hWDgyU3ZJSUgr?=
 =?utf-8?B?UmVXZjI4MGVzM2draGRpQTBuNW9zRi9yUk9WUkVYY29NOE1sL2tkbjhUZWlO?=
 =?utf-8?B?amZReVArMytrTEV5WW05d3o4RC9aaVBlUnZSMm1kaWNNdisxSE9TNG10VW14?=
 =?utf-8?B?UUNlMUVlcHFCNzY5cDlJeTJVUGEyYngyYWdWKzBKWmEweXRWUWFvTkVhRDNC?=
 =?utf-8?B?S3VPSWZsaEplYzV2czhoc2g1d3g1SXlXZ2Z1bnFyaVI4MUgvMUNnTXhMNEc3?=
 =?utf-8?B?eTBzQzBna2tPRmJDeUw1OUtGRzV1ZGRBZFRFY0t6cnFzWGJzVXlwK2NuOFp0?=
 =?utf-8?B?U0RVTmdEUTlreG52LzZFaGVuQVlpVFVBTkhwaGZQYWpQSzRRS01vYUUxRVlM?=
 =?utf-8?B?b0dZM3kzS3J6emhXd0xLTnlMSXNTZzRKa2xSY0VhZlZLcklZRVJOL3dLWFBS?=
 =?utf-8?B?dVZpRVczTFlZUGxsQWxPeVRDLytIVVJyVWlhZDIwNHk4azRyUmxzNHFxWmdj?=
 =?utf-8?B?cnczSndxams5c2JIU0lmeWVwZVM4SGJuNUEvQVpaNldSM0xWVWZPVkNUaTh2?=
 =?utf-8?B?YUdDZzhzdVBTeEp4Y3hWUi9CMnpoYnVjVmJjWVNqeVo1d0Y1T2piTXIwMlIy?=
 =?utf-8?B?ZU9xNnF3MXVVYmR4UGhEdTlMZjZTMHlMbTV1cE50S1RjOWg3MnQ1djBNN3Jr?=
 =?utf-8?Q?KeNgAdvaAEyvq2f309mIvmC4L?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c080fdc9-83a4-4fb4-2de6-08de1baa485e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 13:58:50.9694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: La1LV8UyleVshnKRWnBGhkku+egJ125dU7NwbM1+Mq/7Eh/hTwfBKggWTWZB+1np
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8454
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

On 11/4/25 09:35, Pierre-Eric Pelloux-Prayer wrote:
> Userspace jobs have drm_file.client_id as a unique identifier
> as job's owners. For kernel jobs, we can allocate arbitrary
> values - the risk of overlap with userspace ids is small (given
> that it's a u64 value).
> In the unlikely case the overlap happens, it'll only impact
> trace events.
> 
> Since this ID is traced in the gpu_scheduler trace events, this
> allows to determine the source of each job sent to the hardware.
> 
> To make grepping easier, the IDs are defined as they will appear
> in the trace output.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Link: https://lore.kernel.org/r/20250604122827.2191-1-pierre-eric.pelloux-prayer@amd.com

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c     |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c     |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  5 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.h     | 19 +++++++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c    |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 28 +++++++++++++--------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c     |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c     |  5 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c     |  8 +++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  6 +++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c  |  4 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c   |  4 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 12 +++++----
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c       |  6 +++--
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c       |  6 +++--
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c    |  3 ++-
>  19 files changed, 84 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> index 3d24f9cd750a..29c927f4d6df 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -1549,7 +1549,8 @@ static int amdgpu_gfx_run_cleaner_shader_job(struct amdgpu_ring *ring)
>  	owner = (void *)(unsigned long)atomic_inc_return(&counter);
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, &entity, owner,
> -				     64, 0, &job);
> +				     64, 0, &job,
> +				     AMDGPU_KERNEL_JOB_ID_CLEANER_SHADER);
>  	if (r)
>  		goto err;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> index 97b562a79ea8..9dcf51991b5b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> @@ -690,7 +690,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>  	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.high_pr,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
> -				     &job);
> +				     &job, AMDGPU_KERNEL_JOB_ID_FLUSH_GPU_TLB);
>  	if (r)
>  		goto error_alloc;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 55c7e104d5ca..3457bd649623 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -234,11 +234,12 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
>  			     struct drm_sched_entity *entity, void *owner,
>  			     size_t size, enum amdgpu_ib_pool_type pool_type,
> -			     struct amdgpu_job **job)
> +			     struct amdgpu_job **job, u64 k_job_id)
>  {
>  	int r;
>  
> -	r = amdgpu_job_alloc(adev, NULL, entity, owner, 1, job, 0);
> +	r = amdgpu_job_alloc(adev, NULL, entity, owner, 1, job,
> +			     k_job_id);
>  	if (r)
>  		return r;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> index d25f1fcf0242..7abf069d17d4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> @@ -44,6 +44,22 @@
>  struct amdgpu_fence;
>  enum amdgpu_ib_pool_type;
>  
> +/* Internal kernel job ids. (decreasing values, starting from U64_MAX). */
> +#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE              (18446744073709551615ULL)
> +#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE_PDES         (18446744073709551614ULL)
> +#define AMDGPU_KERNEL_JOB_ID_VM_UPDATE_RANGE        (18446744073709551613ULL)
> +#define AMDGPU_KERNEL_JOB_ID_VM_PT_CLEAR            (18446744073709551612ULL)
> +#define AMDGPU_KERNEL_JOB_ID_TTM_MAP_BUFFER         (18446744073709551611ULL)
> +#define AMDGPU_KERNEL_JOB_ID_TTM_ACCESS_MEMORY_SDMA (18446744073709551610ULL)
> +#define AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER        (18446744073709551609ULL)
> +#define AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE       (18446744073709551608ULL)
> +#define AMDGPU_KERNEL_JOB_ID_MOVE_BLIT              (18446744073709551607ULL)
> +#define AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER       (18446744073709551606ULL)
> +#define AMDGPU_KERNEL_JOB_ID_CLEANER_SHADER         (18446744073709551605ULL)
> +#define AMDGPU_KERNEL_JOB_ID_FLUSH_GPU_TLB          (18446744073709551604ULL)
> +#define AMDGPU_KERNEL_JOB_ID_KFD_GART_MAP           (18446744073709551603ULL)
> +#define AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST          (18446744073709551602ULL)
> +
>  struct amdgpu_job {
>  	struct drm_sched_job    base;
>  	struct amdgpu_vm	*vm;
> @@ -97,7 +113,8 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
>  			     struct drm_sched_entity *entity, void *owner,
>  			     size_t size, enum amdgpu_ib_pool_type pool_type,
> -			     struct amdgpu_job **job);
> +			     struct amdgpu_job **job,
> +			     u64 k_job_id);
>  void amdgpu_job_set_resources(struct amdgpu_job *job, struct amdgpu_bo *gds,
>  			      struct amdgpu_bo *gws, struct amdgpu_bo *oa);
>  void amdgpu_job_free_resources(struct amdgpu_job *job);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> index 91678621f1ff..63ee6ba6a931 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> @@ -196,7 +196,8 @@ static int amdgpu_jpeg_dec_set_reg(struct amdgpu_ring *ring, uint32_t handle,
>  	int i, r;
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
> -				     AMDGPU_IB_POOL_DIRECT, &job);
> +				     AMDGPU_IB_POOL_DIRECT, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index fe486988a738..e08f58de4b17 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1321,7 +1321,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>  	if (r)
>  		goto out;
>  
> -	r = amdgpu_fill_buffer(abo, 0, &bo->base._resv, &fence, true);
> +	r = amdgpu_fill_buffer(abo, 0, &bo->base._resv, &fence, true,
> +			       AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
>  	if (WARN_ON(r))
>  		goto out;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index e226c3aff7d7..326476089db3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -227,7 +227,8 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
>  	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     num_dw * 4 + num_bytes,
> -				     AMDGPU_IB_POOL_DELAYED, &job);
> +				     AMDGPU_IB_POOL_DELAYED, &job,
> +				     AMDGPU_KERNEL_JOB_ID_TTM_MAP_BUFFER);
>  	if (r)
>  		return r;
>  
> @@ -406,7 +407,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>  		struct dma_fence *wipe_fence = NULL;
>  
>  		r = amdgpu_fill_buffer(abo, 0, NULL, &wipe_fence,
> -				       false);
> +				       false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
>  		if (r) {
>  			goto error;
>  		} else if (wipe_fence) {
> @@ -1488,7 +1489,8 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
>  	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     num_dw * 4, AMDGPU_IB_POOL_DELAYED,
> -				     &job);
> +				     &job,
> +				     AMDGPU_KERNEL_JOB_ID_TTM_ACCESS_MEMORY_SDMA);
>  	if (r)
>  		goto out;
>  
> @@ -2212,7 +2214,7 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
>  				  struct dma_resv *resv,
>  				  bool vm_needs_flush,
>  				  struct amdgpu_job **job,
> -				  bool delayed)
> +				  bool delayed, u64 k_job_id)
>  {
>  	enum amdgpu_ib_pool_type pool = direct_submit ?
>  		AMDGPU_IB_POOL_DIRECT :
> @@ -2222,7 +2224,7 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
>  						    &adev->mman.high_pr;
>  	r = amdgpu_job_alloc_with_ib(adev, entity,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
> -				     num_dw * 4, pool, job);
> +				     num_dw * 4, pool, job, k_job_id);
>  	if (r)
>  		return r;
>  
> @@ -2262,7 +2264,8 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>  	num_loops = DIV_ROUND_UP(byte_count, max_bytes);
>  	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->copy_num_dw, 8);
>  	r = amdgpu_ttm_prepare_job(adev, direct_submit, num_dw,
> -				   resv, vm_needs_flush, &job, false);
> +				   resv, vm_needs_flush, &job, false,
> +				   AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER);
>  	if (r)
>  		return r;
>  
> @@ -2297,7 +2300,8 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
>  			       uint64_t dst_addr, uint32_t byte_count,
>  			       struct dma_resv *resv,
>  			       struct dma_fence **fence,
> -			       bool vm_needs_flush, bool delayed)
> +			       bool vm_needs_flush, bool delayed,
> +			       u64 k_job_id)
>  {
>  	struct amdgpu_device *adev = ring->adev;
>  	unsigned int num_loops, num_dw;
> @@ -2310,7 +2314,7 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
>  	num_loops = DIV_ROUND_UP_ULL(byte_count, max_bytes);
>  	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->fill_num_dw, 8);
>  	r = amdgpu_ttm_prepare_job(adev, false, num_dw, resv, vm_needs_flush,
> -				   &job, delayed);
> +				   &job, delayed, k_job_id);
>  	if (r)
>  		return r;
>  
> @@ -2380,7 +2384,8 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  			goto err;
>  
>  		r = amdgpu_ttm_fill_mem(ring, 0, addr, size, resv,
> -					&next, true, true);
> +					&next, true, true,
> +					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
>  		if (r)
>  			goto err;
>  
> @@ -2399,7 +2404,8 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>  			uint32_t src_data,
>  			struct dma_resv *resv,
>  			struct dma_fence **f,
> -			bool delayed)
> +			bool delayed,
> +			u64 k_job_id)
>  {
>  	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>  	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> @@ -2429,7 +2435,7 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>  			goto error;
>  
>  		r = amdgpu_ttm_fill_mem(ring, src_data, to, cur_size, resv,
> -					&next, true, delayed);
> +					&next, true, delayed, k_job_id);
>  		if (r)
>  			goto error;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 054d48823d5f..577ee04ce0bf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -175,7 +175,8 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>  			uint32_t src_data,
>  			struct dma_resv *resv,
>  			struct dma_fence **fence,
> -			bool delayed);
> +			bool delayed,
> +			u64 k_job_id);
>  
>  int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
>  void amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> index 74758b5ffc6c..5c38f0d30c87 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> @@ -1136,7 +1136,8 @@ static int amdgpu_uvd_send_msg(struct amdgpu_ring *ring, struct amdgpu_bo *bo,
>  	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->uvd.entity,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     64, direct ? AMDGPU_IB_POOL_DIRECT :
> -				     AMDGPU_IB_POOL_DELAYED, &job);
> +				     AMDGPU_IB_POOL_DELAYED, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> index b9060bcd4806..ce318f5de047 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> @@ -449,7 +449,7 @@ static int amdgpu_vce_get_create_msg(struct amdgpu_ring *ring, uint32_t handle,
>  	r = amdgpu_job_alloc_with_ib(ring->adev, &ring->adev->vce.entity,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
> -				     &job);
> +				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> @@ -540,7 +540,8 @@ static int amdgpu_vce_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     ib_size_dw * 4,
>  				     direct ? AMDGPU_IB_POOL_DIRECT :
> -				     AMDGPU_IB_POOL_DELAYED, &job);
> +				     AMDGPU_IB_POOL_DELAYED, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> index 5ae7cc0d5f57..5e0786ea911b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> @@ -626,7 +626,7 @@ static int amdgpu_vcn_dec_send_msg(struct amdgpu_ring *ring,
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
>  				     64, AMDGPU_IB_POOL_DIRECT,
> -				     &job);
> +				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		goto err;
>  
> @@ -806,7 +806,7 @@ static int amdgpu_vcn_dec_sw_send_msg(struct amdgpu_ring *ring,
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
>  				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
> -				     &job);
> +				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		goto err;
>  
> @@ -936,7 +936,7 @@ static int amdgpu_vcn_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t hand
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
>  				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
> -				     &job);
> +				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> @@ -1003,7 +1003,7 @@ static int amdgpu_vcn_enc_get_destroy_msg(struct amdgpu_ring *ring, uint32_t han
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
>  				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
> -				     &job);
> +				     &job, AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index db66b4232de0..2f8e83f840a8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -983,7 +983,8 @@ int amdgpu_vm_update_pdes(struct amdgpu_device *adev,
>  	params.vm = vm;
>  	params.immediate = immediate;
>  
> -	r = vm->update_funcs->prepare(&params, NULL);
> +	r = vm->update_funcs->prepare(&params, NULL,
> +				      AMDGPU_KERNEL_JOB_ID_VM_UPDATE_PDES);
>  	if (r)
>  		goto error;
>  
> @@ -1152,7 +1153,8 @@ int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  		dma_fence_put(tmp);
>  	}
>  
> -	r = vm->update_funcs->prepare(&params, sync);
> +	r = vm->update_funcs->prepare(&params, sync,
> +				      AMDGPU_KERNEL_JOB_ID_VM_UPDATE_RANGE);
>  	if (r)
>  		goto error_free;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index 77207f4e448e..cf0ec94e8a07 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -308,7 +308,7 @@ struct amdgpu_vm_update_params {
>  struct amdgpu_vm_update_funcs {
>  	int (*map_table)(struct amdgpu_bo_vm *bo);
>  	int (*prepare)(struct amdgpu_vm_update_params *p,
> -		       struct amdgpu_sync *sync);
> +		       struct amdgpu_sync *sync, u64 k_job_id);
>  	int (*update)(struct amdgpu_vm_update_params *p,
>  		      struct amdgpu_bo_vm *bo, uint64_t pe, uint64_t addr,
>  		      unsigned count, uint32_t incr, uint64_t flags);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> index 0c1ef5850a5e..22e2e5b47341 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> @@ -40,12 +40,14 @@ static int amdgpu_vm_cpu_map_table(struct amdgpu_bo_vm *table)
>   *
>   * @p: see amdgpu_vm_update_params definition
>   * @sync: sync obj with fences to wait on
> + * @k_job_id: the id for tracing/debug purposes
>   *
>   * Returns:
>   * Negativ errno, 0 for success.
>   */
>  static int amdgpu_vm_cpu_prepare(struct amdgpu_vm_update_params *p,
> -				 struct amdgpu_sync *sync)
> +				 struct amdgpu_sync *sync,
> +				 u64 k_job_id)
>  {
>  	if (!sync)
>  		return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> index 30022123b0bf..f794fb1cc06e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> @@ -26,6 +26,7 @@
>  #include "amdgpu.h"
>  #include "amdgpu_trace.h"
>  #include "amdgpu_vm.h"
> +#include "amdgpu_job.h"
>  
>  /*
>   * amdgpu_vm_pt_cursor - state for for_each_amdgpu_vm_pt
> @@ -395,7 +396,8 @@ int amdgpu_vm_pt_clear(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  	params.vm = vm;
>  	params.immediate = immediate;
>  
> -	r = vm->update_funcs->prepare(&params, NULL);
> +	r = vm->update_funcs->prepare(&params, NULL,
> +				      AMDGPU_KERNEL_JOB_ID_VM_PT_CLEAR);
>  	if (r)
>  		goto exit;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> index 46d9fb433ab2..36805dcfa159 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> @@ -40,7 +40,7 @@ static int amdgpu_vm_sdma_map_table(struct amdgpu_bo_vm *table)
>  
>  /* Allocate a new job for @count PTE updates */
>  static int amdgpu_vm_sdma_alloc_job(struct amdgpu_vm_update_params *p,
> -				    unsigned int count)
> +				    unsigned int count, u64 k_job_id)
>  {
>  	enum amdgpu_ib_pool_type pool = p->immediate ? AMDGPU_IB_POOL_IMMEDIATE
>  		: AMDGPU_IB_POOL_DELAYED;
> @@ -56,7 +56,7 @@ static int amdgpu_vm_sdma_alloc_job(struct amdgpu_vm_update_params *p,
>  	ndw = min(ndw, AMDGPU_VM_SDMA_MAX_NUM_DW);
>  
>  	r = amdgpu_job_alloc_with_ib(p->adev, entity, AMDGPU_FENCE_OWNER_VM,
> -				     ndw * 4, pool, &p->job);
> +				     ndw * 4, pool, &p->job, k_job_id);
>  	if (r)
>  		return r;
>  
> @@ -69,16 +69,17 @@ static int amdgpu_vm_sdma_alloc_job(struct amdgpu_vm_update_params *p,
>   *
>   * @p: see amdgpu_vm_update_params definition
>   * @sync: amdgpu_sync object with fences to wait for
> + * @k_job_id: identifier of the job, for tracing purpose
>   *
>   * Returns:
>   * Negativ errno, 0 for success.
>   */
>  static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_update_params *p,
> -				  struct amdgpu_sync *sync)
> +				  struct amdgpu_sync *sync, u64 k_job_id)
>  {
>  	int r;
>  
> -	r = amdgpu_vm_sdma_alloc_job(p, 0);
> +	r = amdgpu_vm_sdma_alloc_job(p, 0, k_job_id);
>  	if (r)
>  		return r;
>  
> @@ -249,7 +250,8 @@ static int amdgpu_vm_sdma_update(struct amdgpu_vm_update_params *p,
>  			if (r)
>  				return r;
>  
> -			r = amdgpu_vm_sdma_alloc_job(p, count);
> +			r = amdgpu_vm_sdma_alloc_job(p, count,
> +						     AMDGPU_KERNEL_JOB_ID_VM_UPDATE);
>  			if (r)
>  				return r;
>  		}
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> index 1c07b701d0e4..ceb94bbb03a4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> @@ -217,7 +217,8 @@ static int uvd_v6_0_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t handle
>  	int i, r;
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
> -				     AMDGPU_IB_POOL_DIRECT, &job);
> +				     AMDGPU_IB_POOL_DIRECT, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> @@ -281,7 +282,8 @@ static int uvd_v6_0_enc_get_destroy_msg(struct amdgpu_ring *ring,
>  	int i, r;
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
> -				     AMDGPU_IB_POOL_DIRECT, &job);
> +				     AMDGPU_IB_POOL_DIRECT, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> index 9d237b5937fb..1f8866f3f63c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> @@ -225,7 +225,8 @@ static int uvd_v7_0_enc_get_create_msg(struct amdgpu_ring *ring, u32 handle,
>  	int i, r;
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
> -				     AMDGPU_IB_POOL_DIRECT, &job);
> +				     AMDGPU_IB_POOL_DIRECT, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> @@ -288,7 +289,8 @@ static int uvd_v7_0_enc_get_destroy_msg(struct amdgpu_ring *ring, u32 handle,
>  	int i, r;
>  
>  	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
> -				     AMDGPU_IB_POOL_DIRECT, &job);
> +				     AMDGPU_IB_POOL_DIRECT, &job,
> +				     AMDGPU_KERNEL_JOB_ID_VCN_RING_TEST);
>  	if (r)
>  		return r;
>  
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 3653c563ee9a..46c84fc60af1 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -67,7 +67,8 @@ svm_migrate_gart_map(struct amdgpu_ring *ring, u64 npages,
>  				     AMDGPU_FENCE_OWNER_UNDEFINED,
>  				     num_dw * 4 + num_bytes,
>  				     AMDGPU_IB_POOL_DELAYED,
> -				     &job);
> +				     &job,
> +				     AMDGPU_KERNEL_JOB_ID_KFD_GART_MAP);
>  	if (r)
>  		return r;
>  

