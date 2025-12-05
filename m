Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4B4CA71F5
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 11:18:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F395810EA9A;
	Fri,  5 Dec 2025 10:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sKvhuIJn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012069.outbound.protection.outlook.com [52.101.48.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45C510EA9A;
 Fri,  5 Dec 2025 10:18:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jdxNEdjK4bawJokqvPQcdlKCmXyl8QQtsT3Z0mdAy6wLwT9qmb4mljLlBVg0SpZL40kmIjrmiTKmpRwxpujrBC7PGibwhgXt9fOEDTluIB5zxitYZA5K23cEryNPgUrxP2mCGP7XHy3ckzpHjna8rSLzXaFRllFYnRa3w7/d0ppax3r797OBgF7epTkFFiAvkLE3U/CpDRgN5FzmF0UXOml/fMiKDss3HJsODabNwVN3zHwUUe8ap1zPxDe0IcqS2/r+kHNPGnyZYskdI4IaNR5xIChHCQa7K0/9SoypmHgLAEwjJcDzM2Rt4Yuk2ey00Iin2AQdH6J6sAPvDQM4Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kc4kUkSrrPjT3IA6Ei4DDYuhW+XFdlEGJfVYnyRQIog=;
 b=bCF6STp76vr3hfoNkWXAS0kBmpL1u/oXsXPu/QdIeheMHg8EvatXSstdGpQaiYoVvQ8SRzcHarMdAU7oGZ0KuXjBgQemYvHW41/pDFBPmQKlCNLy3Oiz8iTVmHViOqRCazZ3BZ5ggjfH2az30VhQ3Syx0IxTwUhKFc189M6kgaQ29KpNaKNSLh6E4aTNL65ZJyag3TJMTLGS5k3qiBbcg1avc22Z27XThO9hJJu8JLtrlz4q/Lo0QbNVABHLoPwh6jH2WDHR18AOphmVKydbvy1ozynsGmjpD3qdXiKLPtZnVNXwJGOd57vDX6cIvFg02TiPULUV1d2RbZu7PwZgxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kc4kUkSrrPjT3IA6Ei4DDYuhW+XFdlEGJfVYnyRQIog=;
 b=sKvhuIJnoPOvw+ck+lnWCVHRdxbsNACeLeeQEyZl2KeGfmp/105+rW67dZdlpXa/mVR0cTQp+MTwSlSFVrB+gvqNd4WnfcEItgsNe5ckDaas0cXq8JAw1CwRuA6GJd/vOtKAd6QkQ5/MUpRT2LchlGpeN1lV9M2pIdE73kIALnc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH8PR12MB9840.namprd12.prod.outlook.com (2603:10b6:610:271::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 10:18:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 10:18:27 +0000
Message-ID: <49de5988-ea47-4d36-ba25-8773b9e364e2@amd.com>
Date: Fri, 5 Dec 2025 11:18:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: run free_job work on timeout workqueue
To: phasta@kernel.org, vitaly.prosyak@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, dakr@kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Lucas Stach <l.stach@pengutronix.de>
References: <20251128182235.47912-1-vitaly.prosyak@amd.com>
 <cdecd1e2-de0d-466f-b98b-927b2f364f79@amd.com>
 <c56ecd19d7ddc1f1ed4e7e9e13388c647de855b1.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <c56ecd19d7ddc1f1ed4e7e9e13388c647de855b1.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0325.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10a::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH8PR12MB9840:EE_
X-MS-Office365-Filtering-Correlation-Id: 9010fe15-0ccf-469f-bd5d-08de33e7a10e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGdNR0VacXdFWXd3TFNLbVU2RjRCRXJQaFYvcDJjUC9rK1lPZ2JYZ3doNFY5?=
 =?utf-8?B?OHNBM2NVWXpScEN0SmxidjZVRlVOcGJ4bHl3TGQyOWNxSkttSHJRWUpoelo5?=
 =?utf-8?B?YlB0UkRzVUJMcmZQSU05ZktUamwvWDRNZFNxamhhWnVla3R1d1h6eFdnTHkw?=
 =?utf-8?B?d3MzaUViVEZWTHFtZ2FXOUw2dm1QWW9PL2FadDNJQzIySEZQZDEvdC9oN2Ni?=
 =?utf-8?B?MTB5eStRZW5Bd0RTd2EvclRhTERCVEd1QXJnQy9SaW5pUlowbFRaU3Y3QVli?=
 =?utf-8?B?THRDZTRLMHJJbCtnRVhKVVQyMElkdVM0NGtjc216Y3pNOGQ3ODFaYTVCZTdO?=
 =?utf-8?B?YWJYUEV0RXAzQXM1OXE1ekliOUVKdEMzYTVUK3JGTWFVazRzSkFhMHNKRlhM?=
 =?utf-8?B?Z0MvNDRRSUVGb2pYUDV0dEpHMUwyQmh5SWI0bTZUY2o3K2dXRjc0YkVOYTlm?=
 =?utf-8?B?TExhanhONjJINjZWSTdaaVFnRmRGL2x3dndVbEF5Y0dhT2RoaitZL09CNGVJ?=
 =?utf-8?B?ME9OempYNDhkREhLLzRiM3p5Q1NqUHZLcHVwZlhIUlZjdTRWR2JvSjZxU2tj?=
 =?utf-8?B?RzlVc2R3Z1VHc21Lb0Yxb2c5d2xpeXdNRDh5SDRQdGhySENkRDZkaVpqZjZY?=
 =?utf-8?B?MmJvT2RUY01adHhKeWZIODZxTG1oeExzTE5aSk5XbndGMHBMeGQxdHZGR21z?=
 =?utf-8?B?VWZSV3lYeC9rQkxXOUhlQlRudDlMSWpSMkVXTWFEd3FuSUhaTUh6b0hQbXdF?=
 =?utf-8?B?VkdKUGVmdDBjVnZEUm41R1JybmhZTlBXeTNiMjgvRFk5Y3ZGa0QwU1cvV05D?=
 =?utf-8?B?QXVqS1NUUk5Nd1NQU2o1N3EyaWVOdXhoSUxSMndYZDFJR2VZTjd5MEU4Z3hG?=
 =?utf-8?B?YmJFOXhLamp4cGNENmJMY05rYjB0WFRROTR1TGJpQTN3blRvaTE5eEVwR2lH?=
 =?utf-8?B?K0N1TFo1Sjd5TUQ1K2dZaGNLSDMxRlI2ZGQ5ZmhSUHNOZEIzUnlldEJlR1lp?=
 =?utf-8?B?eVgwdzBpQmRzVkpWb1pGTlZ2L3VlWjVQNFhrSmNCMXhmdGVSNjBHZURWUllB?=
 =?utf-8?B?WGRYQnZ1V3dHSUV2RHdGMGg5UkNnVVU3Z1ZZWVM5UFBxQmtoTi94b0gxbWow?=
 =?utf-8?B?TnVOY1R4M0NtMkJIRXhJRUp5N1plS1lSQmRpNzVVUnZtampXQVhlZUkraG9Y?=
 =?utf-8?B?MjZpdTdQTnZ4N0hOSTN2cVlHMUxkMm1zWlp4RGZXbkcyWUJodUdySU50NVlN?=
 =?utf-8?B?aU9CMFY3d0xmNksvUk5xUmdReExJUFJoYUJHWDNpSVRKRWM0R3YvS0xDaGg5?=
 =?utf-8?B?SWI1WHZJTjJNcWk3N0x5c2hJWGV5b09IekhUWE5yZ2s0OHJwam9abGJUSzA0?=
 =?utf-8?B?ZXpaU1VKUkVIVkRrV2xPOFN2MkxjNGJkUElkbEFldlFJc2l5NVY2OUdBM2F4?=
 =?utf-8?B?NVRDMlh2WHZaNExGVmxXNDE5UURYR2NYUFZOWVhKcFBWOGxkelZWOE51di93?=
 =?utf-8?B?ditDdXJPNkx2SzZ0OHBZNUVKNHFqVUJTRzhscHFaOGRVSG92RVpCc1h1RktM?=
 =?utf-8?B?YmtWakJGcWpLcllOSTlQM0p1Qys2cUZtTCsxaFhsZUgrcWx4TnlZZXdFOFd4?=
 =?utf-8?B?UXEvYnhiYnRVTzkrMEg4UGZlY0V2V2lVaTdZaFFsOU10ZjJ2UFVqQnBwSjJB?=
 =?utf-8?B?RE9SZW5hUy9Pb2pxRW5LS3J4VUhzWGFUREFpNFpnV2xDUjhCWm1FWVFaaHNo?=
 =?utf-8?B?QkRjbWRNNFN5eDBONXFod1RZQmxYRVJ0dHZScjdPdTd6Z3A1aVlnNXFmU1VL?=
 =?utf-8?B?NTVqNk0yRFRqT0FySGpjVGdHNnZXK1hrN21JaVkyZzU0ZVpKOWdKS3BWZE53?=
 =?utf-8?B?YytndzNzbExza1paMFFleTQ0NTE3bVRmTS80bW9VVEpBc0lwc213MDVjZmhW?=
 =?utf-8?Q?hstdzAl1luubqAd5l4btRUZ+lreqslN2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWMzbHZoQnJhb2ttWUpiZGVUcWJaODB1dEtVUWpsbkNpclA2bFI1RGpmYm8w?=
 =?utf-8?B?TFJ5aGJ4eThwMzhTNHdOSy9DR0FvWUp6OEpDYzNlRk5wU0JqSC8xRFNPRnky?=
 =?utf-8?B?VVlqTUphNVBHYTJlV3BLTmV3emk3bFJIUThhNEJSZEp5MUpKQ1doRHNiZnph?=
 =?utf-8?B?MEJyd0pXV2ZnRHk2eTFvRUxvSnZZeHZCQTZaanptNHRKd2lkYjFyQ0xOQUdy?=
 =?utf-8?B?UzVFSUhhN2hFR2Z6ZHd0cmhFalN4TVJpTVRoSDk0WFBSN1Ira0FIblhRK1E2?=
 =?utf-8?B?NnZFSnI5TUxESVdGNkxyTWlSY2lTV0szakNhbHZpT1RidEN5MHhrOGhHaHBq?=
 =?utf-8?B?aEo2WTZSNEpEVXlJMzJicCtvSW9GY21YTGEvTmIvd2FxWnliVTFVRUc2NVJm?=
 =?utf-8?B?a3JhWWlwL2hoZE9LN1pLWWdYSHA5UXdqbUFVcS8rMmdKdlJaSzFxRFBicHV5?=
 =?utf-8?B?SElQQXZmd3J5ejFtSHcwQ2JMdUNiWmV2d1ZVZkdnN3d3WmNNY2UrTkRKQTJK?=
 =?utf-8?B?U0JRSjIrNXpOU01WVWJJKzJmMUlmUHp6dGpTV2RtMmQ1UTZ0b3h6T1dQQmVK?=
 =?utf-8?B?ODMyNW1VV0FtZkFQSEhyM1pkV3JUeTNZbUZMUDY5QkRZbFNPVU9jYWNjamlz?=
 =?utf-8?B?b3JUZ0FBb1MrNTJMTE1jSWlXMGhkSGRIaW4zb0wrZjlTSHpuTmVJOTAzMHgy?=
 =?utf-8?B?M0lJR2RLRFV1RjNWbzY4M3QrMjc0bXFmL1NFQVpnSTFEYTRJNzFRZVBJeGdY?=
 =?utf-8?B?RllxRFkxL0JDK1Y5Z3VtMzBDWVU0UDVNcG4yamgxL25MRW03K3BiZTk5TVhn?=
 =?utf-8?B?T2VRdEdMNEgvbG9oSWxJeDVqdmIwSmd5Ti8vZjBYY29IS3ZJU1R3djFEcnNj?=
 =?utf-8?B?eCtwWTdMSmszTXJwT25hdWhjOWpybTI5VUxOZVZEaGZJWmtLd0o0NHk4ellk?=
 =?utf-8?B?V3JzWkxZa3VtV1owTTlGdkJVWlFreXJTcFBmTWFkZ1pnNi9VOHJ2QmRLTlhI?=
 =?utf-8?B?d0JGUFdlaHhHOUNwSDZsUi9KNVlwU3hjaVR5R1ZVMVBuNEpnTW93K29ZQ0NJ?=
 =?utf-8?B?NWVldEtWNU44azAzWUFnSHpYSUxXdGQrd2s5ZHVXcHJWR3FjckJuM29iNFBG?=
 =?utf-8?B?aFZiaEZ1bHlkQzVMc3QySFpzSFVLcHpOaFlNamJpWWhQYS8yREJrMFNtTzNU?=
 =?utf-8?B?K0lRT3VSN1gzUjRMdGNxUUJHWVFtVDVsRjF1RW9GN0JJaS9PY3JYNHR5eEtQ?=
 =?utf-8?B?UGZNeXQ1RklZbVNBNU5CZHl1VUVGYjZpVWkzdHpIQlRreFZhQ2VrNVNPbEUr?=
 =?utf-8?B?UHhNcjdjbXowREhmSnEvcjdrQWNmM0IzWG9mcCtjU2FlaUpwZmRrYnVwMEFw?=
 =?utf-8?B?NkpHaXlXelJGSmluekZzNlllREhuR1dWZEQ1SWc2S3BUWDF6aHFkZ0lxYmxE?=
 =?utf-8?B?eHZ0ZDRuWmRyQ0pkazdISFM1U09lK2RHbFFSY1dmODI3NkFZUHc2dTdrdmlQ?=
 =?utf-8?B?OE1ldmVxOE5jdE1Ha3hiaG1sSWtCdnBnTFRQUnFQNk4rQVRacldUdXJnUnpN?=
 =?utf-8?B?L1VWaEErakt3NkNjakhVczJiNlVNdVR5eFozbCtKbEFMR0JmUzJKOU5OVlRO?=
 =?utf-8?B?WldXSlFMWjRNc2t0dHVlOFY0UE9sZkY4azMyYmF3SVgrKzVGUkpORXViQ3hS?=
 =?utf-8?B?dUhkZlJlNVg3cGZWRkFIY01FOXhLcklQcXlqK09JcWZ1NVMrazhQcldJWHBr?=
 =?utf-8?B?UnBPMFd2REVaQWtTY2NRYkZ0T3ZlMHRZR0w1V2VqY25tVHFZR1VQNkhkQ0pS?=
 =?utf-8?B?eHFLTTlxTkFzQlAxWms4MUZUaTdKZ3puSHh2YVhBUnNUYTFuYUhuMStRNkE5?=
 =?utf-8?B?c1RuV1Z4dHZtQ1NQZ1hmQTdhcVJoL0E2bWk4RVBTcTZyZFpCTjdzZ0U0Y3ZR?=
 =?utf-8?B?cEhnMXRHVVhRTWtKVVJpaWU4MW16aGx5WnhsSU5ETWZJc29yNVFFM2c0N3VI?=
 =?utf-8?B?Rm1Scy80YkZkckZIdUdOT1NnNHZFNTJETGJRRnBLT1dKZk80QXdGaHVHSW4x?=
 =?utf-8?B?Z2ZRWUtpczdEenpzd0lIblh0YTNWeXRhSzRMaWtPc3QrK1Q0bURHelBES0J5?=
 =?utf-8?Q?zHAyvQWlmUx42eAEtVmYrf4P0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9010fe15-0ccf-469f-bd5d-08de33e7a10e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 10:18:26.7670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55SoUhrpM4o3zBBOXOaT6nOorRzLN8Cg6kRLcMcN6RucMXB3jtbEiTnPM3nb2Bhg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9840
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

On 12/1/25 10:04, Philipp Stanner wrote:
> +Cc Matthew, Danilo, who are also drm/sched maintainers
> 
> The get_maintainer script provides you with a list of maintainers.
> 
> On Mon, 2025-12-01 at 09:38 +0100, Christian König wrote:
>> On 11/28/25 19:22, vitaly.prosyak@amd.com wrote:
>>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>>
>>> Currently drm_sched runs run_job and free_job on the per-scheduler
>>> ordered submit workqueue, while timeouts (drm_sched_job_timedout())
>>> run on sched->timeout_wq (e.g. amdgpu reset_domain->wq).
>>>
>>> For drivers like amdgpu the reset path entered from timeout_wq may
>>> still access the guilty job while free_job, running on submit_wq,
>>> frees it. This allows a use-after-free when recovery continues to
>>> touch job fields after drm_sched_free_job_work() has called
>>> ops->free_job().
>>>
>>> Queue work_free_job on sched->timeout_wq instead of submit_wq, both
>>> from __drm_sched_run_free_queue() and drm_sched_wqueue_start(), so		
>>> timeout/reset and free_job are always serialized on the same
>>> workqueue.
>>>
>>> Behavior changes:
>>>
>>> - work_run_job stays on sched->submit_wq (ordered).
>>> - work_free_job moves to sched->timeout_wq (timeout/reset queue).
>>> - Submission and freeing may now run in parallel on different
>>>   workqueues, but all shared state is already protected by
>>>   job_list_lock and atomics.
>>>
>>> Pros:
>>> - Eliminates reset vs free_job race (no freeing while reset still
>>>   uses the job).
> 
> It eliminates such a race *in amdgpu*. Other drivers might not have
> that problem. I think Intel/Xe is refcounting jobs? Matthew?
> 
>>> - Matches the logical model: timeout selects guilty job and recovery,
>>>   including freeing, is handled on one queue.
>>>
>>> Cons / considerations:
>>> - For users that don’t provide timeout_wq, free_job moves from the
>>>   per-sched ordered queue to system_wq, which slightly changes
>>>   scheduling behaviour but keeps correctness.
>>
>> We should probably avoid that and use a single ordered wq for submit, timeout, free when the driver doesn't provide one.
> 
> AFAICS this fix doesn't fix anything for certain at all, because you
> just don't know what kind of workqueue the other drivers have passed
> for timeout_wq.
> 
>>
>> We should potentially also add a warning/error when the driver supplied wq isn't ordered.
>>
>> Apart from that the change looks sane to me and avoid all the hacky workarounds around job lifetime.
> 
> I'm not convinced that this is the right path forward.
> 
> The fundamental issue here is the gross design problem within drm/sched
> that drivers *create* jobs, but the scheduler *frees* them at an
> unpredictable point in time.

Yeah, can't agree more!

> This entire fix idea seems to circle around the concept of relying yet
> again on the scheduler's internal behavior (i.e., when it schedules the
> call to free_job()).
> 
> I think we discussed that at XDC, but how I see it if drivers have
> strange job life time requirements where a job shall outlive
> drm_sched's free_job() call, they must solve that with a proper
> synchronization mechanism.

Well that is not correct as far as I can see.

The problem here is rather that the scheduler gives the job as parameter to the timedout_job() callback, but doesn't guarantee that ->free_job() callback isn't called while timedout_job() runs.

This should be prevented by removing the job in question from the pending list (see drm_sched_job_timedout), but for some reason that doesn't seem to work correctly.

> The first question would be: what does amdgpu need the job for after
> free_job() ran? What do you even need a job for still after there was a
> timeout?

No, we just need the job structure alive as long as the timedout_job() callback is running.

> And if you really still need its contents, can't you memcpy() the job
> or something?
> 
> Assuming that it really needs it and that that cannot easily be solved,
> I suppose the obvious answer for differing memory life times is
> refcounting. So amdgpu could just let drm_sched drop its reference in
> free_job(), and from then onward it's amdgpu's problem.
> 
> I hope Matthew can educate us on how Xe does it.

We discussed this on XDC and it was Matthew who brought up that this can be solved by running timeout and free worker on the same single threaded wq.

> 
> AFAIK Nouveau doesn't have that problem, because on timeout we just
> terminate the channel.
> 
> Would also be interesting to hear whether other driver folks have the
> problem of free_job() being racy.

I think that this is still a general problem with the drm scheduler and not driver specific at all.

Regards,
Christian.

> 
> +Cc Boris, Lucas.
> 
> 
> P.
> 
> 
>>
>> But removing those workarounds is should probably be a second step.
>>
>> Regards,
>> Christian.
>>
>>>
>>> Cc: Philipp Stanner <phasta@mailbox.org>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Suggested-by: Mathew from Intel during XDC
>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>> ---
>>>  drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 81ad40d9582b..1243200d475e 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -355,7 +355,7 @@ static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>>>  static void __drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
>>>  {
>>>  	if (!READ_ONCE(sched->pause_submit))
>>> -		queue_work(sched->submit_wq, &sched->work_free_job);
>>> +		queue_work(sched->timeout_wq, &sched->work_free_job);
>>>  }
>>>  
>>>  /**
>>> @@ -1493,6 +1493,6 @@ void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
>>>  {
>>>  	WRITE_ONCE(sched->pause_submit, false);
>>>  	queue_work(sched->submit_wq, &sched->work_run_job);
>>> -	queue_work(sched->submit_wq, &sched->work_free_job);
>>> +	queue_work(sched->timeout_wq, &sched->work_free_job);
>>>  }
>>>  EXPORT_SYMBOL(drm_sched_wqueue_start);
>>
> 

