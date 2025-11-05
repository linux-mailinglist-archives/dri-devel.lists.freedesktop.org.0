Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0842DC35C00
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 14:03:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CA710E738;
	Wed,  5 Nov 2025 13:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Z2dozj4Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011048.outbound.protection.outlook.com
 [40.93.194.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D722510E738;
 Wed,  5 Nov 2025 13:03:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nqkd5oeqUrMOZYWIqZmojtVUzNct285UfeIDmla9VrLMh6DVaFkduN9BQ0o3yjaoXhfBUJVynAgWZwlSASgTC/F0X2PeCuCWxLgs55AfF+MPZfxktYjK7QRa1Ev7JDRG4sGbJ5Xw+VR33tjnhh9iiGzhq07m6nljcHFJ0PHWxEnem5oiRJrpmyzrRVKJshDXdS+xYavctPvCV9Qbfudf8Sx1umwJbsi2jB1rTr5RBVHu7NYWE6cEfO0fYUz4PeGUCVmnCbkry6pHR69vcGBnbkxg4KyuuRrkgUqL5TS3wrHbhpp1gpsouJDaiCDa5WTniFs5YvAssCImNxo42rzJ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AmX7zzo0CxA+lXPCSIvrPAcsTRIhV8NKQx2aM/k06g=;
 b=QXzecvXgCfb6ihppOm0dDJhVOu6aLlfNNCdNWLDZjxLtbRu0oNnJ9FMJlgjcUpCaAzgwDGppajmgWtW5hYRjdVwc20Xvyk0wkdu3su0qudUX44sBEjPka4Ly+QriDAKkUgpCVGSfz4nm5hk9t3c2PUdpnSNUac5NPUW5sGdlNU8yG5e4XMgdhfFUxNc7W9wvHZ8IhHhcDvbXpT+vSxy7Tn+c3b6Tdd6lwNOVrQFIqT4xvCtJfMx7DOzeCDuPFXzGW81HuQX/d1mTAY5crCv5ftpyTKkey7HZPY9bIfxg7wBkij5o/Va1+QwbD0GAb/RQZ+9gqbC4vtzS5up19Z3KrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AmX7zzo0CxA+lXPCSIvrPAcsTRIhV8NKQx2aM/k06g=;
 b=Z2dozj4Z/+cqdEqyiAo/oNPnvthwATQekqFswooL4BQvdx4oYIGEqRPxo30jLSfVKm4oZdUk5X2qbWfikZGketf5o40kA72aQ3J+MuinSd8O3BjMSq6gsuSn1uvYfCOWrIlgOlOX/+nMGdHK9V4zTbOTgZgXYr0sHlXVEd9W6B8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 13:03:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 13:03:14 +0000
Message-ID: <29c2e42d-6d94-4462-9302-af71f489a928@amd.com>
Date: Wed, 5 Nov 2025 14:03:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/20] drm/amdgpu: use multiple entities in
 amdgpu_fill_buffer
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
 <20251104083605.13677-12-pierre-eric.pelloux-prayer@amd.com>
 <0f9aa878-46c4-48d6-9ad5-774a0927b291@amd.com>
 <7395bf47-68fd-4af6-8720-e51dc75253bc@damsy.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <7395bf47-68fd-4af6-8720-e51dc75253bc@damsy.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0778.namprd03.prod.outlook.com
 (2603:10b6:408:13a::33) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: ad9ede8a-3b8f-4877-4164-08de1c6badee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|3122999009;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0ZjdlA1MUxUbGt0TjUra1FvSUp2R2FKb1dSRDlOckJJNEFYOGVWMWE2VXFj?=
 =?utf-8?B?b0pOWms5K0FXWTV0OUxCRmVYcGZ0T1g2eWV5OGU1T2hDeCtYWndQNjV1OU42?=
 =?utf-8?B?d0ZkeUxIQlBablpCa1ppQm1jZ0piOHY2bE84WUIwalFMcFExTEZHcEVGV002?=
 =?utf-8?B?alNYa3pGdW1Oek5mRVc1MlpxQUFmMXJvYnR2TS9URk5oTnMxRTFzZU9Bb1JH?=
 =?utf-8?B?eE1TbVU2ZmtMSTY3Sk15aVV0enlLZWhhcmxtcUoxUk5jRVNZSW91Tzg0QTRm?=
 =?utf-8?B?OHhZZis0VGlRZnhvZVk1S0ZqSUVhMlZFMEdtSjF0c3liak5CaDkxUHdoWjBP?=
 =?utf-8?B?Sjg3ZDNjRlBrNUZLZGNRNVE4VkwyWnlDNFhqNnFnamxkQksxVjZWUEVTQnc4?=
 =?utf-8?B?RWwydUx0VERIMzNyalVtRkVGQ0NoY3dyVVB2cEo4ZzVtWjRMd1lsNkgzSnlk?=
 =?utf-8?B?SjltVkw5bXNVRjNxQ3NLSTc5aUplS0QrK0s4K2FReHRzSm84UFBRMDg5eUdD?=
 =?utf-8?B?cC82cjVOcGpnSEdKUVhWeU44cDdQUjdXNTNudXdRck9KdFJkLzY5UmloYkQz?=
 =?utf-8?B?VFkwTmNheWJtcXZJNUNXdkh6NTFTSnU0ZlQ1MjVNcmszQk5RUUMwTnExV3F5?=
 =?utf-8?B?UFVvN3h1QnA1TG9HdDNPb3RxcllBRi9PV0pXdFdvMnpqOWZMRHlRVW1oRzBT?=
 =?utf-8?B?bjlBYWc3SDNBcjVqV294KzNaZ3hLTEdLaURXN3BiMVIvMVNtdjNFUDA5UnRM?=
 =?utf-8?B?VkkremltbWRFUzFpaVArQThqRnE1OWxMS2crYmdvcjJyYllUL2syNXNmUUJ5?=
 =?utf-8?B?V1NNRlcxeStreldwbE9DRmFuRjQvUTZRTmdrUTR0dXpETjZkV1J3VG1uQzVR?=
 =?utf-8?B?R21yeDdKN2N0dVNHYzUvMGYyOFJySTdwaVQ2bnh2RTNNbHRMN0V2Tno0aEhO?=
 =?utf-8?B?bUZESjJOd1pQMkVlQ3hxMThZblFGRTlXT2o4cnYwQXJ0Q2ZyWUw1c0pHRGpN?=
 =?utf-8?B?NGNWQTNBU2dzZVNUcDYreTVUZDFNeTNFQWV1TG51NmltSGNCQ0RJeE9RNDNq?=
 =?utf-8?B?WTZNRG15c1BXNG9WNm1WaHkwQXVuanFURkJZbS94a09Pd0wzdmxaall5Znpa?=
 =?utf-8?B?Y0ZvVG9GYVFVYmM5ZzdMS0VEZmRxa20rSktIRnJ6a0YyQ01DNXhSeTh6WjZz?=
 =?utf-8?B?VVRXV0ZHMXE1NDhMRG1maTJHSGRUMWdDNEZ0cWVBR21peUh0d0FFN2lVbXJU?=
 =?utf-8?B?aGgyeXl0WEFzVjJNQi9ERUN5RjVXcUczRHFtY0QvK2ZDNnlJYUNobnI2UU9B?=
 =?utf-8?B?Wi9EWDFrMXlBblI5djRsd2RWckt0eDZ4QzdXWEVyUWM0VWg2R2ZKZWs0bm9p?=
 =?utf-8?B?bmhRd3BpVGNtRldBUUhXSTVjVE82S0dKNnhORWtTMzJKSEVMUWhkZFBiVFhH?=
 =?utf-8?B?bUNLNmdxZnlBWXRKeDk5WXp3Q3Zkd1EvZ0l1RjNMckgyNnI3RWxFa0ZLVW9q?=
 =?utf-8?B?TGRwR3BHdmw1L2JBQUtNcEU2WkRqaWNqZ28vZHVDNWI3ZXkxZFgwTEJyb3BU?=
 =?utf-8?B?dWN1OHpORXJDbkpuZkdxQWZuaTRtY2xCRGtJUFcwTUw3WGg3L0l0Rk1JUW1U?=
 =?utf-8?B?VU9aRmZGS0Y5QUU2ZFJMNytYZnZyWlZ4ZXM0YTN4dW1Eb1paaEdpR2VLUGxa?=
 =?utf-8?B?dWludFlsYTBQcFpYcVJVUWhrVzF2QUJyczdXOWhnQmRVZnZEdStLRnFIU3RX?=
 =?utf-8?B?NjlEQmRyNVFNR3FLa3VTSGVtZlgvRlZJZ1YwNUxMczFLUGJlZUtuTng4NS94?=
 =?utf-8?B?LzVWS1Q4WFIxUDRTTUxwV1BEWVpxL2pvNFJOYjkzRzJ0VHV0b3dDenE4MlNQ?=
 =?utf-8?B?V3hPbEN0UkFRNkNzR05mTXZSUVFEVHR2d2xCcGNFeXpFZHVGV3l3MHA1Wkg0?=
 =?utf-8?Q?VjuxUcfub4nQFQG8GvSk4hZQiEfBGAh4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(3122999009); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGRFWklROUdPMXBiRDg3M0xIV1hEQTd6bGFvVTFXNTZxYlVHVjlDcHNCcy83?=
 =?utf-8?B?cXByYzNKKzhHZGRrb25jRW9JL2plcHZuOFlKeDZiOU1aS2JnZCtQczU3UU1C?=
 =?utf-8?B?YnZBT056c2dQM2UzQ0xwN3kydDhFVDlDdFI2VzNET1FvcmJmU0NlbzFYeXlz?=
 =?utf-8?B?TStHbS9xQ0NtMjkxNTZNVUNwV0J4M08wdVpYVDVWVnhheVZ6THRMeHZwR0Qy?=
 =?utf-8?B?MFBCR0M2eWpDNEYzN3hLUk5hUTBXblNrNDU3ZnJNRithZXVWYngyS2RSSmVy?=
 =?utf-8?B?dzFmcnliVFpEOU1GSGNIYlZuV29TYmNsdzltMGlQWXV2a1pUcEwyVml2VzJD?=
 =?utf-8?B?eWhRL2NLdmtNTG9CZS9VdUxVTVFsTzZoZEk1MU5RZFVjTjZzQVVUemh6REls?=
 =?utf-8?B?ZWdnRjVhNVRUNGlQNjJXelU0WjNteEVQQk5xajlTLzJLSmRWdkNWUmptaTd2?=
 =?utf-8?B?a3drUjJDNjNvN3RGOWVWMDVSaW02T2FBNUFQSGZyT2dhRUJLVmhQWjB5c1ZJ?=
 =?utf-8?B?UXdCUjZCTzlTWDJNZVAvbUNwdjFSZ0QrSlcyZG93S3JwUk15THBsMm5VRy9r?=
 =?utf-8?B?UFZXVU1pZ3V0bjVLWTNxLzgwa2lXanJQRjlRSXFmbkZ4STEwM0VoVjBESnBq?=
 =?utf-8?B?QWpkeE1NbkhrMGF3RnU0ZDVLTngxc0lhOUdDVzljVER4OGdlLzY2WUJCM1VE?=
 =?utf-8?B?Y29pcWJiYzVMS1Y4QTNqMzFEcWJBY1dGUWVWNHU5Ymp4b0kvWm1xTWNwdlEz?=
 =?utf-8?B?V0RmVnNuZXNBc1NEM1Y1TUMxWDRsTkVtTjVvc1ZYc1FrQi8zS2hvV3JSVmkv?=
 =?utf-8?B?WDFYUUxESDFVQnBnTWgyRFVsT2xZNTZmS2FkU2UrMytnN3NzMmxxaEtnVTQw?=
 =?utf-8?B?UlJpVER1TkQ3di9tOWpZV3BiZWtza3hQMmJ1RHNmdUpUMVFnUGtUTzFTZjRD?=
 =?utf-8?B?QSs4QUprRkJZQTZjdDc5Y2xRcy9Nd1hVb0NJSUplN3JFeWYvd2g3ZGhYWDlZ?=
 =?utf-8?B?VUNFbVY1b29RU1pBYW5KVnNtbUV0ODlwRHI4MWZXNHNsbkViT3pBYml1K29n?=
 =?utf-8?B?R1JGQW5Zd282QW91ZzQxcTQrTk1jUjB6R1NaMUowSjlsc3R4YWpvcUJud3E4?=
 =?utf-8?B?OC93TFdSU1dGWEtBNEpGT3R6dm5DZ3RLa21ySmdhVWZxQXhmTzZFOVVMc09R?=
 =?utf-8?B?c1h6MDMzek9TVzdUTXptRG9Yd2ViblZHeFk1dmkvRmFZenAwdkdXWXNkMmVm?=
 =?utf-8?B?a08wcFFRTm9KaHlmZkdUczJwY1hyZEluYTA1NVE0cVp6eHlnTVpzZDFlN1FG?=
 =?utf-8?B?Q09xcVRPOEJpZmFyUWRXQURjK01OWG5CWDJCUU9QT0ZYanpvaUpBTDEwSGpZ?=
 =?utf-8?B?cnl6eUkvYkZqOVJoejZJakdOZDA2c0NtRk41S2FwR01BdVpkVGM3M2s2S0xl?=
 =?utf-8?B?S1hIY0NEWmZsYkUwVmJTRU42enkyNHpSMnAwSlIyZitoQmpTVzRKTGVqQmk2?=
 =?utf-8?B?ZDJ4SnJOcy9ndTZhYjA0eHgxU0grY0paNlpKRVNTZGh6Q2MzYU9YNjZ1WEgx?=
 =?utf-8?B?Um4yRVhzRTF4bHRmSk03ZzRFVklnUDVRcndxYWNiOHI4NkdGS3hIMERYOGhC?=
 =?utf-8?B?RXM2Wm5TaStJVlJiWkdRZmM4RDUyZ1IzK2NIWDkwUC9xcjJmTkpsNC9vbEZL?=
 =?utf-8?B?bEpRZW5JMktjZitYcHJ1S1J3dm55b0VMNGd6dmZadVdVM09QL2NqUFlINHZY?=
 =?utf-8?B?NU9OZlphS2gzRUtPamZhckZiSUxSTmRwRzdjSUUxN0JmRjl4R1FmSE10bWpS?=
 =?utf-8?B?cGh5eDdpbmlJWCtBbW93MHNtUFRQSjViU1ZNWi9ibmFvVThjNlRna0V2dmVo?=
 =?utf-8?B?RlhGSHJFRXd5ZzJRSDFQdWx3U3JUMzc5TG4rbEFTS2JMUElhR2ptSy9pcklC?=
 =?utf-8?B?blZYRGhIWGRXYVhpZndTZGQ5QzRWWW8venlmaXQ1YktLQVdzZ3UwMUV4K3Zu?=
 =?utf-8?B?Sk12UVcxOHl4TW5KQmxhN1FZeDdnZENNc1NaSjJXNU5oMjkwZWN4TGlueHpE?=
 =?utf-8?B?dUduUHR6UUdIcXk4S0VYR2MwR0hsSmQ4TGpiVWdFTHErVlB1V2JoaXRyaWFC?=
 =?utf-8?Q?GNZRbYLo8Z9Y6V10SNHno+Glg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9ede8a-3b8f-4877-4164-08de1c6badee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 13:03:13.9958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H1VcVt0bnp7B/c15ogX472CPAIGbF2d8tWGffqK6HlaCLptbuWrMe6FMLXf+WUDI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106
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

On 11/5/25 11:39, Pierre-Eric Pelloux-Prayer wrote:
> Le 04/11/2025 à 17:40, Christian König a écrit :
>> On 11/4/25 09:35, Pierre-Eric Pelloux-Prayer wrote:
>>> The benefits of using multiple entities is that multiple fill jobs
>>> can run in parallel. Otherwise, even if the entity has access
>>> to multiple engines, a burst of N independent jobs will all
>>> run on the same engine because an entity guarantees the ordering
>>> of execution matches the ordering of the submission.
>>>
>>> Callers can opt-out of this behavior by passing the entity they
>>> want to use (see amdgpu_move_blit).
>>
>> That still sounds like a really bad idea to me.
>>
>> First of all we can't reserve so many fence slots in the release handler, previously we basically just relied on the fact that the BO will most likely be mostly idle.
>>
>> I think we should just use a single SDMA engine for each clear and distribute clearing different BOs over multiple engines.
> 
> So N clear entities, each one having access to a single engine. And all jobs to clear a single BO go to the same entity?
> 
> Is that what you mean?

More or less.

N clear entities, each one has access to all engines. When a BO needs to be cleared it picks the next best entity and submits the jobs.

This way clear entities still load balance with moves and page table updates but we can keep the clearing logic simple.

Christian.

> 
> Pierre-Eric
> 
>>
>> Regards,
>> Christian.
>>
>>>
>>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 84 ++++++++++++++++++-------
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h |  1 +
>>>   2 files changed, 64 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> index c357a6d9763a..839ea8c7f6be 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> @@ -2224,6 +2224,7 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>>>           adev->mman.clear_entities = kcalloc(num_clear_entities,
>>>                               sizeof(struct amdgpu_ttm_entity),
>>>                               GFP_KERNEL);
>>> +        atomic_set(&adev->mman.next_clear_entity, 0);
>>>           if (!adev->mman.clear_entities)
>>>               goto error_free_entity;
>>>   @@ -2498,10 +2499,12 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>>>   {
>>>       struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>>>       struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>>> +    struct dma_fence *fences[TTM_FENCES_MAX_SLOT_COUNT] = {};
>>>       struct dma_fence *fence = NULL;
>>>       struct dma_resv *resv = NULL;
>>>       struct amdgpu_res_cursor dst;
>>> -    int r;
>>> +    uint64_t cur_size, to;
>>> +    int r, e, n_fences;
>>>         /* The fences will be either added to the resv object or the last fence
>>>        * will be returned to the caller. In the latter case, all fill jobs will
>>> @@ -2515,53 +2518,92 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>>>       }
>>>         if (!entity) {
>>> -        entity = &adev->mman.clear_entities[0];
>>>           resv = &bo->tbo.base._resv;
>>> -        r = dma_resv_reserve_fences(resv, 1);
>>> +
>>> +        /* Determine how much fences we're going to add to the
>>> +         * resv object.
>>> +         */
>>> +        n_fences = 0;
>>> +        amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &dst);
>>> +        while (dst.remaining) {
>>> +            cur_size = min(dst.size, 256ULL << 20);
>>> +
>>> +            n_fences += 1;
>>> +            amdgpu_res_next(&dst, cur_size);
>>> +        }
>>> +        if (n_fences == 0)
>>> +            return 0;
>>> +
>>> +        /* One slot per entity at most. */
>>> +        n_fences = MIN(n_fences, adev->mman.num_clear_entities);
>>> +
>>> +        r = dma_resv_reserve_fences(resv, n_fences);
>>>           if (r)
>>>               return r;
>>> +    } else {
>>> +        mutex_lock(&entity->gart_window_lock);
>>>       }
>>>         amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &dst);
>>>   -    mutex_lock(&entity->gart_window_lock);
>>>       while (dst.remaining) {
>>> -        struct dma_fence *next;
>>> -        uint64_t cur_size, to;
>>> -
>>>           /* Never fill more than 256MiB at once to avoid timeouts */
>>>           cur_size = min(dst.size, 256ULL << 20);
>>>   +        if (resv) {
>>> +            /* Pick a new entity for each partial clear so they can
>>> +             * execute in parallel.
>>> +             */
>>> +            e = atomic_inc_return(&adev->mman.next_clear_entity) %
>>> +                adev->mman.num_clear_entities;
>>> +            entity = &adev->mman.clear_entities[e];
>>> +            mutex_lock(&entity->gart_window_lock);
>>> +        }
>>> +
>>>           r = amdgpu_ttm_map_buffer(&entity->base,
>>>                         &bo->tbo, bo->tbo.resource, &dst,
>>>                         entity->gart_window_id1, ring, false,
>>>                         &cur_size, &to,
>>>                         dependency,
>>>                         resv);
>>> -        if (r)
>>> +        if (r) {
>>> +            mutex_unlock(&entity->gart_window_lock);
>>>               goto error;
>>> +        }
>>>             r = amdgpu_ttm_fill_mem(ring, &entity->base,
>>>                       src_data, to, cur_size, resv,
>>> -                    &next, true, k_job_id);
>>> -        if (r)
>>> +                    &fence, true, k_job_id);
>>> +        if (r) {
>>> +            mutex_unlock(&entity->gart_window_lock);
>>>               goto error;
>>> -
>>> -        if (resv) {
>>> -            dma_resv_add_fence(resv, next, DMA_RESV_USAGE_KERNEL);
>>> -            dma_fence_put(next);
>>> -        } else {
>>> -            dma_fence_put(fence);
>>> -            fence = next;
>>>           }
>>>             amdgpu_res_next(&dst, cur_size);
>>> +
>>> +        if (resv) {
>>> +            /* Delay the addition of the fences to resv, otherwise the next partial
>>> +             * clears will depend on this one.
>>> +             */
>>> +            fences[e] = fence;
>>> +            mutex_unlock(&entity->gart_window_lock);
>>> +        } else {
>>> +            dma_fence_put(*f);
>>> +            *f = fence;
>>> +        }
>>>       }
>>>   error:
>>> -    mutex_unlock(&entity->gart_window_lock);
>>> -    if (f)
>>> -        *f = dma_fence_get(fence);
>>> -    dma_fence_put(fence);
>>> +    if (resv) {
>>> +        for (e = 0; e < adev->mman.num_clear_entities; e++) {
>>> +            if (fences[e]) {
>>> +                dma_resv_add_fence(resv, fences[e], DMA_RESV_USAGE_KERNEL);
>>> +                dma_fence_put(fences[e]);
>>> +            }
>>> +        }
>>> +    } else {
>>> +        mutex_unlock(&entity->gart_window_lock);
>>> +    }
>>> +
>>>       return r;
>>>   }
>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> index 38df2b5b4bc7..3fc31c7c6bfe 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> @@ -73,6 +73,7 @@ struct amdgpu_mman {
>>>         struct amdgpu_ttm_entity default_entity; /* has no gart windows */
>>>       struct amdgpu_ttm_entity *clear_entities;
>>> +    atomic_t next_clear_entity;
>>>       u32 num_clear_entities;
>>>       struct amdgpu_ttm_entity move_entities[TTM_FENCES_MAX_SLOT_COUNT];
>>>       u32 num_move_entities;

