Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE725C3219A
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 17:40:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6944C10E642;
	Tue,  4 Nov 2025 16:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ihcoJq9D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012002.outbound.protection.outlook.com [52.101.48.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2003B10E642;
 Tue,  4 Nov 2025 16:40:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n88w35TlVaaxDH/JKfKG8tJXROK4hw4IedxKEERY3KyBI9mxzPXNuIRqBzLw3XD9xeEGjc9OyC14IHEu+Pnq04walzd+hAUwAGUMb0aNevLAMtHiat/wCN75KZEjX+Q93ankcsmQlxVJHcSTZWW38gJ5SOTGeIiYKj0bzel0RDVT3E9ts5lwPooYo6H6osoLgYeyfr3Getnaq3MpeK7WVQqc10g0zvxXyt9/s1rSPU0RGePUIRBL+7YoDrNNMposDTYuHAtBc4oOMVLNhDcl3lxi5RdmpVJOn8krqXPe3GPTSiIRECqggNWl7GKQe5SpAsEyDjN94jTm2PBlBCQyEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dK9rAIhkNTxuN/iD3c26PdZHAy2d69Phhag+dgzCAU=;
 b=sTqOOJgw6RzpNbsjUMpd89Def+aVZpLp9Xo4Jgo/IeuweIT2qi3OXISvdAuUc7PAsjKBLYh+5elqZyqGgTTbVWj/YrwEnP3Pcm8rJkynKJ3jK/dpig01+3JBleI9ell8Ty4WbmrBPq73RtsoXK37Pk8sP16s0wl4Zb5h8bzFxgTeW7eqtLT486uk7JI8kVjD3RJFXUU9PK+AZRzILdTMv9u5U+f0U4b4+tPze6woVKpbM4X+V843ejSrH2ewhrGbxlK3qGg0iGoE6vQPXMKdROctMpVm0G9gH5PakzeO1dsgp3KWz9F7yYNklGrAliuVaATllOPc6hSOruhsNQUynw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dK9rAIhkNTxuN/iD3c26PdZHAy2d69Phhag+dgzCAU=;
 b=ihcoJq9Di5MiSBViEX2B7LVf8gwU29ADZFHtDCYtOw8pw32DZNDgt8SqiN6xXSPMz4Z807GjKIIEv0DebYt0DM8ainY6bu1PUkIzQq2P3dBcKVBlAg1LUmGK9CRrT70P+Bww8XNAZFvzmXZipryls1ZbRpZkvHlhj8dREGzu5A8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6209.namprd12.prod.outlook.com (2603:10b6:208:3e7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 16:40:09 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 16:40:09 +0000
Message-ID: <0f9aa878-46c4-48d6-9ad5-774a0927b291@amd.com>
Date: Tue, 4 Nov 2025 17:40:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/20] drm/amdgpu: use multiple entities in
 amdgpu_fill_buffer
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
 <20251104083605.13677-12-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251104083605.13677-12-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::27) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6209:EE_
X-MS-Office365-Filtering-Correlation-Id: 42ec1829-f3a4-41bf-d1b8-08de1bc0d0e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|3122999009;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHp1MmIwSm5iaEZRZGNLVjVvdjgyWG45cjdFVVJrd0UxRFAyRDdWL002MjE5?=
 =?utf-8?B?S3dMYXJncmdrcFhJRUYwNmVJTkhWcUg2eHFra0hPelJ5bC9JRm13SHN4MWU2?=
 =?utf-8?B?SmxuQWdCVmRnRTFyeVcyUmhNQnVkSFBrNDhmcDFGNm5XVkhDNkpudXhlQ09T?=
 =?utf-8?B?aEhYN1lmVmhyZUhHZzB6ZTRkQXFPTlhQeTd2N09FSDFZL3MwdGFpOFJVb3cz?=
 =?utf-8?B?VElOK3VWWjNpWEdOT3lXZjdsTEJUcGV1d1gxUkhBcGZyUU9TYmcvMWNiTjdr?=
 =?utf-8?B?dDkxWkFSQWlaMlQ3M1l5TGZyNmtMZExKbnVya1ZxUFV1VSsxdFUyemRoeC9C?=
 =?utf-8?B?TEFBdDk4RHNoS1puNldUeGxXQVFRWkFKWjBpOGN6Y0w4elN6eEY0ZlI1WFFh?=
 =?utf-8?B?MGU4VHZ1WEhSNkh1eVlmSGs0czd5cUNOdi8rUktZMWQ3S0JwOThEVEpCS21z?=
 =?utf-8?B?alNVeVozNGdPdlFWKzBuN1hLbXBKWFNLMVlhR2Rzc2E4dHJSSzRqb1RQVXdJ?=
 =?utf-8?B?ZmJ0aVF5RHVNZWR2d0NSekxnalk5RkZiUlA2cWpoYnBzS09lTFZ5SDlDUXlU?=
 =?utf-8?B?ZHlqTytVUG82Mk1IVUNKUHZzcW9Mcm9qY1NrL3RsZG5wRzRQZzdkY0dKSUxQ?=
 =?utf-8?B?VjVxRzB1ek92U1pRMGxhRGNKMm0rUUxyL1dCMVV0UU5GRHhJa0dOdTZEMTN2?=
 =?utf-8?B?UkJHMXl2aldheVArVFVaWFJSN1JPam9GbnVUZEcwWGZRZFF5b1pGZ2syclUx?=
 =?utf-8?B?ejJabHg2STRNeXc4Y3FaZUpSaUs2NGduU1dtdHBtbDZXaCt0L2FQT1FsUkxs?=
 =?utf-8?B?ZCsxUllzTmU1b1FKZHlyODIyOTY3K1c1cmo4M3JDckttZk5HYUdFSVMwR05v?=
 =?utf-8?B?VXVjNnZlZy9pREtIOEZkdUpreEI5QzhMRnNHREJrdU1WVzlvcUkyY3hFNGNE?=
 =?utf-8?B?aWRFWUxKYkM0N3daOEEvU2pXK3JYSFlaaUVIcmpsSW4rRFJpSHVLcDdCRWRW?=
 =?utf-8?B?OGpSMHJPUnpNUHRrcmtxZ0RYZWpQa1dzUlUrU1RQRGpMZzhreTJib2dwVTlS?=
 =?utf-8?B?TW5pa3FYWlV6blQrd1NHTWt5ZDc5N2pUL1MyOHdpb1kyWDhJalpPaHRucWVx?=
 =?utf-8?B?NVpvQ3ExRUVtaHc1aEV5OXNNQ1AyYUJManVSUTVOakJ4VmNSbmhSaHM4ZlFl?=
 =?utf-8?B?STNrbDNrYTE2SktkRFZMTUpBRkFPQlAyeFdvVHRxbEdwNUFjdmJkMEV3K1h3?=
 =?utf-8?B?U1FBUmxtUTQ0ek93WkFNTHJaTTk3ZmZxUDBTTzN0RGRmaCtwczN0OEg1TEN1?=
 =?utf-8?B?MGxVVk82MUFMUCs5WldHN2E1U2xPM1plaUx6SldBMCs1ZE5FL2R3MXFOUFRH?=
 =?utf-8?B?N3NpUjVtWWFoNlNaS08zWG9sUnY5aWVGRE9SbGY5WVJoU1h1TlduZ1N3TnR0?=
 =?utf-8?B?OEE3cThBQ3ZUWUFmd3V6VXdoVTBEYUVtcEw1Wld4S2d3OXJlajVwUHpZQU1Y?=
 =?utf-8?B?d2wxTGpTTU9hMGRWTDRjbDNyRERjVGF1d0g5cFNsT3lwVEVlTHNEbzdOVkVJ?=
 =?utf-8?B?VjUwZTN5SjB4Z3hiYno3eFZqUUNIa1Y4M3d0YVlSQVRtQ3JBbU9FeTBKU0Rq?=
 =?utf-8?B?SlErL3ovdSttNEhhdzJoZnhQTWJNUk5yRG1yZFQwYTlacmFZWG55MTFKeUpm?=
 =?utf-8?B?eWtwWGpPbHB1MDRPY1NrRW9vakNTdEZaZzF6TkRERkZydzBuaDBzWXdwN1dl?=
 =?utf-8?B?UVk2YWhJUGpOcUJkRFhUR01EaUdoY1FpaHI1MEREUjhwQm1xdWxvWHhRQWFF?=
 =?utf-8?B?SVV5UHQzcmxBeEZmQVh4VGlyQ1hSZkQ3aTlYR09lWGxjUy96d0JpcWRqMUFT?=
 =?utf-8?B?RmRvTloyK2NpVDdLZFhhemdUcGdVb3JyKzh4TXVLNU5xbzFQQTFiUXJtRFFO?=
 =?utf-8?Q?/qFNRiVNFbe0hNwNLRz+mql+mBjIX4h/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(3122999009); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R21kMk44UldiWVhSYzg5YVF2b0dCeHpZWmo3ditHM1FmaFlXbG1HaFpFOHRF?=
 =?utf-8?B?L0RHbkdxUHN2THYxcm1COU4zOXdYZWJvWTZkNHhrQXlvUXdQQUJsOGhPZU45?=
 =?utf-8?B?bTBHRHVNN0cxRnJhQzdCUFE0TnlkVm1pOUpaKzVqMVh0ODgxUVJiZXBrYXVC?=
 =?utf-8?B?a2ExM2x0OXVUYjc4bGZadlFQd0RLQWduUTAvN1VESEFvSHJDdklMSGM0K0Y3?=
 =?utf-8?B?THhNMis3bHRZYjNQODFScWtrVm5kVzYrUnZ0U1FPenk4Z0EwS2t1a2t3N1Qx?=
 =?utf-8?B?MFk4ZnQzbTZmMjlLSVBDUXZjb01pRTFRQ3dVcmlDQXJTVlYrVG52cllqYXdK?=
 =?utf-8?B?RTgwOWF6eE9sV1pZT05kZWtRQUxCS0RlOXBqdzM2amUydmRsUGlDQnlJSlNW?=
 =?utf-8?B?UFlXdHREQnBHM1hlL0laNDJkOVdJVVNESWFzWkVETDliRkI5UTE1cXkxajJZ?=
 =?utf-8?B?UjdUNEpQUEtKVjVKV2ppdk1zYUJwN0UvcmFIOGJxY1N0RTlXZ1JBZnJVenlj?=
 =?utf-8?B?eUVLWHN6MENja0x6emdxVkxtcmx1YlBuWGgvR0ZnUThVb0lpckhIRy9nWGJD?=
 =?utf-8?B?NDl3cjRPL3A1MGgvaldheUVvVlBFei94T0tDRWNDaC9rNUZQN0ZSa0NPeGV6?=
 =?utf-8?B?WTFFZVBZdGlUR1dZWHNCOW45TndhMnI1MXVnRDVnNkwyN1ZzRlhCOEYzQ3FX?=
 =?utf-8?B?aVhiTVpNUFBtNm5MWUwxVWx6SHdYOWdMSlNrdlZaa1JmcFVPU0duZUVmTjZ6?=
 =?utf-8?B?ZWE1M3VoZU9lUXlyUno0cU1vWFd6dUgxU2t1bmJzNnNEMXhJWmZuSlVXaTZW?=
 =?utf-8?B?TmFVV2ZTRHNraEdVQzFwVGRkQkM2SDgxWGNXVGJMSXE1UFM5b1BFWVAvN0NL?=
 =?utf-8?B?YThiYzUxVFdHTEpxVS9yK2p4aWFpT0hGWWhUejRkTGpXSHI2WEZvR0lBSEhK?=
 =?utf-8?B?a2pja0hqNnp2UklOVGFoVlVhTGdvbElhT1g4ejk2TThDUW5DSkxLNU5RUWV5?=
 =?utf-8?B?a0lXMWM0cXRyOEprUGdlK1Bqa0hTKzhKWTZrTXdCSmxqS1JtMzNCNDNFUWZS?=
 =?utf-8?B?N2hNOVVnTVBGZFd4K0dVVlhxeHZTbGtENnNXZEV3RU1mUFpsdmNpenRGdWww?=
 =?utf-8?B?eEpJcFVBWjh6WlFja2FYbmcreHUzVVNndi9wT2ZrZ3YydjJacWVpbDRaZlJG?=
 =?utf-8?B?TkFOVUd2dFpqSzlZVXJycGk2WjUwVXByYVdHYzhab3R5RXlLTEJXaCtIUXVX?=
 =?utf-8?B?V1NCTkVQN2NpWUhYaUxQSFNxdW1rbjNUL3dWaFczMEpuWGNFa2ltVkRkZnJy?=
 =?utf-8?B?TU1tcWhueXZiZWdPUFRjVEY4aURUbS9jTFdTS0tlby8vMEFLaEJjdUZLQ0c5?=
 =?utf-8?B?cmpFa0JxOWxYUmw4cHZCMHlkcWtFa1hlNEJyM2dzS3N2R0VySTNmeHp4Q3lD?=
 =?utf-8?B?U1o4bmw1RjgvczVsMHRLTWVEKzV0cU5OV0doSUh1eUJzV05XUDF0UFVpWnQ5?=
 =?utf-8?B?MXpJL2pTM1UvRmZBNW1IbFpHSG1wTkkwSUh6WCtCaUJOallzeTcwVXA5bkp1?=
 =?utf-8?B?dnVOY2FqNVRvTGF6cGxlR2NDbXVJcXA2a1hmaUZlYmlrSTVkSWVVYWdmbE9V?=
 =?utf-8?B?ODRLai9uNzZDdEU3Mndwd21kaGFEZENaNFo4VWtnRTVzR0F5UG9XZWZoYkRt?=
 =?utf-8?B?VEtwSWtzeWJEazI4NGp2Y2xyS3RTNkZyQ0N4OVpjbER6QStyTGlscUNkRFdw?=
 =?utf-8?B?YTNxZzNCa24rdFhNdUNwbTl5eE5QWVJ6OG9SWU56VFVOdS9wN3QzMTJTL2R0?=
 =?utf-8?B?dm5aYkg4N2g1TnF5b3oybmpLK1F5dVM5Q09XUHQ2RVd6T3Z1WmExM3Zwc21C?=
 =?utf-8?B?cmVVQm0rc1hFZGJhYnhSU1BoOHhDZlJpelhiNE5NVFlvWnVpVHAvUVZYaUsx?=
 =?utf-8?B?Y2sybUtReWlpbForQ3NFVHFNL2tKNy95MGVFNXdjYlF0WjRGUmYvRitqYnZn?=
 =?utf-8?B?bCtEdjlhZGg4dHJNZ2VhQzFpT3JkZmdTV2RrTzUyclorclViYjhpbFZvTFEw?=
 =?utf-8?B?cEdsL2haOXEzM2M4MWpnWUZSbGxrTmx2MlYyelRub3lhR1pYdCtxY3NzZzdx?=
 =?utf-8?Q?3mhf+uI0f0zdyCzpWFMRohljF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ec1829-f3a4-41bf-d1b8-08de1bc0d0e4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 16:40:08.8611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W92TH2Dw6mCd4O8O1GzFmAjyM6jNP5ApB6Ef4DkBKOVtoBf7Z7Og9IhC/6xNZKda
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6209
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
> The benefits of using multiple entities is that multiple fill jobs
> can run in parallel. Otherwise, even if the entity has access
> to multiple engines, a burst of N independent jobs will all
> run on the same engine because an entity guarantees the ordering
> of execution matches the ordering of the submission.
> 
> Callers can opt-out of this behavior by passing the entity they
> want to use (see amdgpu_move_blit).

That still sounds like a really bad idea to me.

First of all we can't reserve so many fence slots in the release handler, previously we basically just relied on the fact that the BO will most likely be mostly idle.

I think we should just use a single SDMA engine for each clear and distribute clearing different BOs over multiple engines.

Regards,
Christian.

> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 84 ++++++++++++++++++-------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h |  1 +
>  2 files changed, 64 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index c357a6d9763a..839ea8c7f6be 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2224,6 +2224,7 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  		adev->mman.clear_entities = kcalloc(num_clear_entities,
>  						    sizeof(struct amdgpu_ttm_entity),
>  						    GFP_KERNEL);
> +		atomic_set(&adev->mman.next_clear_entity, 0);
>  		if (!adev->mman.clear_entities)
>  			goto error_free_entity;
>  
> @@ -2498,10 +2499,12 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>  {
>  	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>  	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> +	struct dma_fence *fences[TTM_FENCES_MAX_SLOT_COUNT] = {};
>  	struct dma_fence *fence = NULL;
>  	struct dma_resv *resv = NULL;
>  	struct amdgpu_res_cursor dst;
> -	int r;
> +	uint64_t cur_size, to;
> +	int r, e, n_fences;
>  
>  	/* The fences will be either added to the resv object or the last fence
>  	 * will be returned to the caller. In the latter case, all fill jobs will
> @@ -2515,53 +2518,92 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>  	}
>  
>  	if (!entity) {
> -		entity = &adev->mman.clear_entities[0];
>  		resv = &bo->tbo.base._resv;
> -		r = dma_resv_reserve_fences(resv, 1);
> +
> +		/* Determine how much fences we're going to add to the
> +		 * resv object.
> +		 */
> +		n_fences = 0;
> +		amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &dst);
> +		while (dst.remaining) {
> +			cur_size = min(dst.size, 256ULL << 20);
> +
> +			n_fences += 1;
> +			amdgpu_res_next(&dst, cur_size);
> +		}
> +		if (n_fences == 0)
> +			return 0;
> +
> +		/* One slot per entity at most. */
> +		n_fences = MIN(n_fences, adev->mman.num_clear_entities);
> +
> +		r = dma_resv_reserve_fences(resv, n_fences);
>  		if (r)
>  			return r;
> +	} else {
> +		mutex_lock(&entity->gart_window_lock);
>  	}
>  
>  	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &dst);
>  
> -	mutex_lock(&entity->gart_window_lock);
>  	while (dst.remaining) {
> -		struct dma_fence *next;
> -		uint64_t cur_size, to;
> -
>  		/* Never fill more than 256MiB at once to avoid timeouts */
>  		cur_size = min(dst.size, 256ULL << 20);
>  
> +		if (resv) {
> +			/* Pick a new entity for each partial clear so they can
> +			 * execute in parallel.
> +			 */
> +			e = atomic_inc_return(&adev->mman.next_clear_entity) %
> +				adev->mman.num_clear_entities;
> +			entity = &adev->mman.clear_entities[e];
> +			mutex_lock(&entity->gart_window_lock);
> +		}
> +
>  		r = amdgpu_ttm_map_buffer(&entity->base,
>  					  &bo->tbo, bo->tbo.resource, &dst,
>  					  entity->gart_window_id1, ring, false,
>  					  &cur_size, &to,
>  					  dependency,
>  					  resv);
> -		if (r)
> +		if (r) {
> +			mutex_unlock(&entity->gart_window_lock);
>  			goto error;
> +		}
>  
>  		r = amdgpu_ttm_fill_mem(ring, &entity->base,
>  					src_data, to, cur_size, resv,
> -					&next, true, k_job_id);
> -		if (r)
> +					&fence, true, k_job_id);
> +		if (r) {
> +			mutex_unlock(&entity->gart_window_lock);
>  			goto error;
> -
> -		if (resv) {
> -			dma_resv_add_fence(resv, next, DMA_RESV_USAGE_KERNEL);
> -			dma_fence_put(next);
> -		} else {
> -			dma_fence_put(fence);
> -			fence = next;
>  		}
>  
>  		amdgpu_res_next(&dst, cur_size);
> +
> +		if (resv) {
> +			/* Delay the addition of the fences to resv, otherwise the next partial
> +			 * clears will depend on this one.
> +			 */
> +			fences[e] = fence;
> +			mutex_unlock(&entity->gart_window_lock);
> +		} else {
> +			dma_fence_put(*f);
> +			*f = fence;
> +		}
>  	}
>  error:
> -	mutex_unlock(&entity->gart_window_lock);
> -	if (f)
> -		*f = dma_fence_get(fence);
> -	dma_fence_put(fence);
> +	if (resv) {
> +		for (e = 0; e < adev->mman.num_clear_entities; e++) {
> +			if (fences[e]) {
> +				dma_resv_add_fence(resv, fences[e], DMA_RESV_USAGE_KERNEL);
> +				dma_fence_put(fences[e]);
> +			}
> +		}
> +	} else {
> +		mutex_unlock(&entity->gart_window_lock);
> +	}
> +
>  	return r;
>  }
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 38df2b5b4bc7..3fc31c7c6bfe 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -73,6 +73,7 @@ struct amdgpu_mman {
>  
>  	struct amdgpu_ttm_entity default_entity; /* has no gart windows */
>  	struct amdgpu_ttm_entity *clear_entities;
> +	atomic_t next_clear_entity;
>  	u32 num_clear_entities;
>  	struct amdgpu_ttm_entity move_entities[TTM_FENCES_MAX_SLOT_COUNT];
>  	u32 num_move_entities;

