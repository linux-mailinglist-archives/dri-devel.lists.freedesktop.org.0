Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55978C794B4
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 14:24:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668F710E873;
	Fri, 21 Nov 2025 13:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uXzBI+Mk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011002.outbound.protection.outlook.com [52.101.62.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7DF10E872;
 Fri, 21 Nov 2025 13:24:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+36Aj/vXTHuN1BFuRugYWrTOBTZWqT24umzazc+enyZjuTk9afg8NDMqi+1MPRQ7BAxhjFOpH+oTe/dSg4WyABTf2zZ+3V89yxqJUz9HZ6e16jwSnFIqDwX3SFhsWqPw3guK70pcrMHYLfQNbYLq7J+jv/nQ9juMbspb0UaAVrYV4rWTcl92lZoWigkjeGPmMCZpIRqzWVDA5/4yncb7MQcSIhKUFhio1VlPAwUpy9frGcPaKjy9cgLqgBc8buGKf/z+k0UpMioEu+aOAB+JEf+ky0XZzSguMkgsZL/k9iBho6r5zbnBC1yN0dl6emrQr6uKq1NFZEZPx1KXfVVvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0R48tB5vsmB4qk87IL38ow4T5tFUwgLJACeAx/of8s=;
 b=HoeTnbV3p8p+l5nobNBtNGlYaWyDhl8e2w9Pzjp2ZGVeTA07svmrSbylDdKMQZvkEo9vzqDncxWoTc3n59NQdA6exs3IjKPSjYDFKTQj9MFAMaaUprqWFR0K841tMwWgRr0ZJ6qQYA0Mh5ejZCE3BnSQRWgJ1AmFrENtBSBmG/V39VU+rMLPBA61rIjE1jRXrIbA+/wcMvvsb5TRLld2Eqo2T3/6ZsWM0usDIe3hvQebc+ZOBLwLLHYPVfCdWZ8SKbqSogPtj8rT2w3IIMWXvuiYKHZIO0tTwbpi98fuMzFu7BL9Gb4rjFzionsvMggpzU2nW4GXB4FvkD7rNsZyKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0R48tB5vsmB4qk87IL38ow4T5tFUwgLJACeAx/of8s=;
 b=uXzBI+Mk7hqp8LC1N09YgGwSP+T2CcyT/IaVYTiaWQ9vBGv71VpzVdBPlfoHoAYEKsKRjJZvu/H6W+QTVwbOB6dZ90JIXRDEe8p7IIQa6Mun6+PIuKNH+ud6NFmPg8m0W7uMMeT4zuQDzYVo24WKwGvXZgDuqfLn28q2wpcdt4I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS2PR12MB9751.namprd12.prod.outlook.com (2603:10b6:8:2ad::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 13:24:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 13:24:37 +0000
Message-ID: <3708bb5d-6b3f-4817-a25a-5a7b90918d0c@amd.com>
Date: Fri, 21 Nov 2025 14:24:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/28] drm/amdgpu: add amdgpu_device argument to ttm
 functions that need it
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-11-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251121101315.3585-11-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:3:18::28) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS2PR12MB9751:EE_
X-MS-Office365-Filtering-Correlation-Id: 93ce6c92-9afe-42a9-f30d-08de29015134
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emMrWDFlQ1NRSC9RUUc3Zkh3eHUxbi91WnRDN0wrdnl4S3dMUWpBbDNDVXFn?=
 =?utf-8?B?WHk5K0ZKSkZKU3JRNk9rbjZzQ2xPTU1mMFZPQlFQVEdyRVVFWXdEWHQzRmR2?=
 =?utf-8?B?YnQ0UldQZUlvcU5sOFMzRGpRa0dUMG90SkhWejhwZGl0dHZNUkJUb2FTUGFu?=
 =?utf-8?B?NmFSK3RMRTl5MVI3TDRNNGxkdTlXRGZiWGRBdzE5Tkw0eGlpYlNOelN2STRZ?=
 =?utf-8?B?QXdueVl5TEl1UXNENzFVS002Wjg1b0hwNWZ2WGNBcTQ4bmlYUW4rc1NpU2tX?=
 =?utf-8?B?RTlyZmJDbVVCWjZid2JOa2hLRkRMbDZlMlhJMC9XRFBIUDBGaVB3MlBUeUZL?=
 =?utf-8?B?ZXUwamNRVjBmY1d1cy9hYlJJK1ZjTTg0cGlUOVA2K0poM0RkZ1IzenhzaWNV?=
 =?utf-8?B?Mkc3aDM4dy92RVpXVmduS252amw1dlB5ZFV1a2RVL1AwUUkzbWFLUXBFY3F5?=
 =?utf-8?B?Z0lFa1h0cG1KQXFncTZ3NXhseENabmYvbWg1Y0ZvL0dPUTk0MEZBQVg2Nzdv?=
 =?utf-8?B?VHJFRWRFSVdwT2tCdEY3UDRCREdJaVd2SkVyWW9uaHRGQkc5bU16L0FPTEpr?=
 =?utf-8?B?QUE4ajcyOGJxSFVSRGQzek9mYlh3Y1VrTUtlZyt4MW8wQkxZRFlLS1NFcWVw?=
 =?utf-8?B?bWpUWjFmVzlnSStpM01pWXJheUhzbkRQelo2cldaU2VXT0FGb0xieStIcGZl?=
 =?utf-8?B?STNVNGcvODNXRmNuMXFXdlNnYlFudkJRN1E1RnRjK3hEK2xrekpJYzZNU0tT?=
 =?utf-8?B?QTA2NUZmclN0M0FLVjZJTzZwdkFtQXZldFNLZnRIMUNhZ2dONzZ4TUh2OGlJ?=
 =?utf-8?B?cTVqVnVKUVR5d1JuVzRoSGt4M2g2RnZKZVpuQVlFNnNNZk5QVUY5NWZRWFZ0?=
 =?utf-8?B?UmJreWJkL2pSdnMwN2hKRm1UejVaeVByeGEvSExYcnoxbG42WFFuN2o3ZXRx?=
 =?utf-8?B?emQzSC90NUY2SUFvMkJoSUQxY0gxcnRuTGtVd2llOUY4N0hjV1Y2TXh1YzVx?=
 =?utf-8?B?SUFicjNqRUNVMVFPbUZUSGtQM00xcWJqWG90cTRtYzNSUzZtSHhxYnlhdlhD?=
 =?utf-8?B?TGNQYWwwd3UzQTRUR2hqT0hFQ2pjRXM3dXBSdTF4ZnRNN3FqbWdSWHJxWWpC?=
 =?utf-8?B?SDhTSWZQdWVBSHVvU1lnRERsUDVvNHhpdS9RRm9OdWRrUGs3SGdydDBqdkh3?=
 =?utf-8?B?bU5kUVRKa0xsYUhBWExoZDVMSS83cTRBM01IUEtmRVUrdFJxMDhOc1FzMmhL?=
 =?utf-8?B?L3V1NWk4WkxMc3hLVlIxWTkzcnpjWFQwZUFKQjM5aHVBQ3ZzbmtyUUlJSEQy?=
 =?utf-8?B?VDF5NXNYeTBZTnAxbTdHK0k0cFdkODh5M21pR3pPdjFVbjgybW1uZkFaNzNj?=
 =?utf-8?B?WERzNXNEc2tCblJrU1JZS0RhcnVPdlZCa2NDZi9XeTB3eU4rTXRGTzRCcGJi?=
 =?utf-8?B?R2NGcHpOTFI5U0UxU2FtNjZUN2ZyQjc1bXZuUGY2Y0Y5cjFDcERnNDNoUDMy?=
 =?utf-8?B?aFprcGhCSXhQQmQ5Zzh6eFBKQUN5V0ZMVTFuSzd0dERqS3dGcjdSbjI3NGNl?=
 =?utf-8?B?aEVWL0dSZXFJcDNQTlI5UjRxTzRMZkVQWStPdFBEZWloVjAveDBqNFAva09S?=
 =?utf-8?B?cHJzUDlzT1Z1UnBJVWxPbjVHOWxtRkpHTTB3b2RxR1hjS1FiaDQrRVJ0VEJk?=
 =?utf-8?B?M3NUN2V6NDRSRXhSQTQ5UXp2Tk54YWYrZTkzeDd2OE9wQ1VhN1ZoMnJlU29m?=
 =?utf-8?B?OFIwakd0ejE1aWN0WlZhRkRodHJjdlNkNmUvVVBKdEJ3dWdiekFSZ2hDbENM?=
 =?utf-8?B?L0pkejVVTFF5MCt1WDNtM3N5ZkNXdk5zc042YkFrSTJvYWZYZXFuTTUyWWww?=
 =?utf-8?B?OWhnKy8xcWtWSFFFMENBY2dhMkVTYXFkbXk1bWxuSHU5NnZ3S01BZ2FaaGlK?=
 =?utf-8?Q?Neh9F8p7DvcUJTfz16kPV39Ju2aUEVff?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDdMZjhvWWpONmNWOUEwTFVCRkk4TzBaRkI0ck4wWW9XbkExNGNCU2xOSFNk?=
 =?utf-8?B?TnczOTViN2pwOGd3SXl6L3p5YjIvOTFUMUIxaUZVbTFPRklZUFBGSVdjMGUz?=
 =?utf-8?B?NFN0RDN4cWNSUW5OM3F6eEdhWC8yZHd5eTZtSm8zN1RXMmp4U1p0dDNJU3F0?=
 =?utf-8?B?SzJrZHQ4YldRQUxjSUVFd05IYjVKeVB4ZUQrbjlCdGhxMzdEbXR3RXYwdmRn?=
 =?utf-8?B?Vnk5Z2pSc0YzYXQ0WHg0TzhTWmdReGpXc1VMNWo0emRFdUgwdURUVFUrTmZ2?=
 =?utf-8?B?SzFMNDlxNXRMQmxONHZUTVJrSk1vRG5EMVNnbDBaUlhIQUMzMFREL0IxV0RZ?=
 =?utf-8?B?QjEvRVNOUXZQR1hxRHAybWZpQ1lvNGhaN2tjcm84NTJHMk4zanNUNDNQV3NN?=
 =?utf-8?B?TVVuZG13Q3lXS2xmUjVGdFZsSEFhS043aG5JSVZiT3ppTEh4bHZaQnFrUXhG?=
 =?utf-8?B?VkROLzZxOUEzbU1LbmFpMFltbGlZV09zVzNzR3pDc3VmQVMzcG1jS0g0MjIw?=
 =?utf-8?B?dGEyZVRyWklseXQvdGhTUHZxNzRvR0w0ZjhuOC8vcjdWOXNSc1l4TDZrb3BL?=
 =?utf-8?B?VnhTLzJaYVB0VXcxdnhXUk9QZVFQSE9TNzhBd3dDRjJqczg5bHRYRzRlclEw?=
 =?utf-8?B?NTdMS3lZRVFBa2hwa3Q5d2tFVjg3MHczaklGRy9Xb2o2SkVKS2N1UnZ5ZU5Q?=
 =?utf-8?B?YXlGaHExbjBnWXZhQnRiN2dvV3hrYWZJMndFM2g3ekpUTzdaejNCd2ozemsy?=
 =?utf-8?B?S3kxTG9YYzBsSEpzV3N0cFpnZmJFWjlEL3BWdTNnSTVkdEx6dVlWR1NDcEFh?=
 =?utf-8?B?cHg5STVRcnlJeS9MVEc3N09pckVWYmo3ZzYzWS9tZVhwc2JUZ3dab0M0Rml3?=
 =?utf-8?B?SDdFTllCdEdtd2s5M3BtRmk3U2plc0MwOFkwdGNESnJKNis5c0pIWVJYSisz?=
 =?utf-8?B?ZXRvc29URDBDZmZMenBVejFkN3VqQ0tsSXhFYi95MEpEak1hM0JZR1duNk0y?=
 =?utf-8?B?VTBPdkN4S3VEZTZTbEVGc0lFUEw2Q0lPTHppUTFSOEZQVzZMeEpMeVpFQWdI?=
 =?utf-8?B?YUNGc25pVFdhb2lQMFI4ekFmSjlrRFlnLytLRi9zVHhkbGwwTGNab1A5NkZC?=
 =?utf-8?B?eEJIelJxTWhONkpvN3g1b3Z2Qjc3SDRqT3JVZ04rOWo1QU8zWlloRXllVU9P?=
 =?utf-8?B?ZzE5Q2d4REo3cEtnMXJxak1mYU92SmYzMU9xQ1JwR2dYVEYwY1pJL3hYcEc4?=
 =?utf-8?B?YzQycVRqNmtMM1ZhOEljMnRDNVRkV2V1bDdxV2Q5M3NCeXlBUThwZ3lVVFBo?=
 =?utf-8?B?Ti9HQWFPZ2pCS3NzSWk5V2JFaUhGR0xHR2tBRDJmb1p6UGozL0RISTl5RG9L?=
 =?utf-8?B?ZTVXZDlRK0VoSGJGUENNR1RsY1lkN2U0TlVVaDR3cDhiQ1k5SCtHY0UvRXBs?=
 =?utf-8?B?eWlsMFJ6RTlrR2hlS0VKazNpZGRSQXBoeks4U0hvYngxdENqMUZZQlNQU0NS?=
 =?utf-8?B?dDhLcEZ6VklJcHJLSWd2MDcwUTYxWXhIVTdJbVdlMzF4VThscElIKzhsZVdC?=
 =?utf-8?B?eDBUU1I4cndWaDFOQlBJL2NYWHc0WkJVWmk5ZVVsYlJJYUdwUHY3V3ppRG5t?=
 =?utf-8?B?K2ZZNGVLQWpiSGU3SHZQRnlFN0Nzc21RSGV1R3U2Ylhra1NFYzFyeFBGUFph?=
 =?utf-8?B?b3JpRmkxN1ZoVzZEQkpZNUYrTGUwRFJmb1ZaRVluZHJqVGZEa0dmMUJ1QjhV?=
 =?utf-8?B?eFRMeDErY1pNeUtYS2kzQVc0alF5SXlTY0xXUjR2WXRzdTloUFE3b09WOFVl?=
 =?utf-8?B?RkluVXpqc256MzMvZTlHMkQxSzZJclpaMVZKendhSUhKbmkrbHZyd3pNZGVX?=
 =?utf-8?B?OVhNWC90UlJ6SVlGc2s0c3diU3hUQnhLOE5NUjBLOEpnSEdHK3EvZEdEQml6?=
 =?utf-8?B?WXVubjBrbmRwTUlZejZBaXNCVFdaMzR4TkNNRDF1R05lVVh0cGVvcHdZdzJu?=
 =?utf-8?B?QWI2OFdjbCtwUnJQa0RWWnVEMWN3U3V5Qk9kYkFrSGtiNW10ZzZyQVJOL1gz?=
 =?utf-8?B?MGRwSTV0ZFdBQllTVUp5TXhmdW1yRnQwSG04ekxuNXB5MlMvdmh0SDEyRTZ5?=
 =?utf-8?Q?7qcetZ4l6JGOTvhzhgPXxbrgB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ce6c92-9afe-42a9-f30d-08de29015134
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 13:24:36.9586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9AMFQ11cFJ76vxhY8ID23/6kykGntcj+in1iblHOUHbuhoRUgWa+wHCtDPfwmVlM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9751
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

On 11/21/25 11:12, Pierre-Eric Pelloux-Prayer wrote:
> Instead of getting it through amdgpu_ttm_adev(bo->tbo.bdev).

Why should that be a good idea?

Regards,
Christian.

> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  5 +++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 11 ++++++-----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  6 ++++--
>  3 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 858eb9fa061b..2ee48f76483d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -725,7 +725,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>  	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
>  		struct dma_fence *fence;
>  
> -		r = amdgpu_ttm_clear_buffer(bo, bo->tbo.base.resv, &fence);
> +		r = amdgpu_ttm_clear_buffer(adev, bo, bo->tbo.base.resv, &fence);
>  		if (unlikely(r))
>  			goto fail_unreserve;
>  
> @@ -1322,7 +1322,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>  	if (r)
>  		goto out;
>  
> -	r = amdgpu_fill_buffer(&adev->mman.clear_entity, abo, 0, &bo->base._resv,
> +	r = amdgpu_fill_buffer(adev,
> +			       &adev->mman.clear_entity, abo, 0, &bo->base._resv,
>  			       &fence, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
>  	if (WARN_ON(r))
>  		goto out;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 1d3afad885da..57dff2df433b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -414,7 +414,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>  	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
>  		struct dma_fence *wipe_fence = NULL;
>  
> -		r = amdgpu_fill_buffer(&adev->mman.move_entity,
> +		r = amdgpu_fill_buffer(adev, &adev->mman.move_entity,
>  				       abo, 0, NULL, &wipe_fence,
>  				       AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
>  		if (r) {
> @@ -2350,6 +2350,7 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev,
>  
>  /**
>   * amdgpu_ttm_clear_buffer - clear memory buffers
> + * @adev: amdgpu device object
>   * @bo: amdgpu buffer object
>   * @resv: reservation object
>   * @fence: dma_fence associated with the operation
> @@ -2359,11 +2360,11 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev,
>   * Returns:
>   * 0 for success or a negative error code on failure.
>   */
> -int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
> +int amdgpu_ttm_clear_buffer(struct amdgpu_device *adev,
> +			    struct amdgpu_bo *bo,
>  			    struct dma_resv *resv,
>  			    struct dma_fence **fence)
>  {
> -	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>  	struct amdgpu_res_cursor cursor;
>  	u64 addr;
>  	int r = 0;
> @@ -2414,14 +2415,14 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  	return r;
>  }
>  
> -int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
> +int amdgpu_fill_buffer(struct amdgpu_device *adev,
> +		       struct amdgpu_ttm_buffer_entity *entity,
>  		       struct amdgpu_bo *bo,
>  		       uint32_t src_data,
>  		       struct dma_resv *resv,
>  		       struct dma_fence **f,
>  		       u64 k_job_id)
>  {
> -	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>  	struct dma_fence *fence = NULL;
>  	struct amdgpu_res_cursor dst;
>  	int r;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 9288599c9c46..d0f55a7edd30 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -174,10 +174,12 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev,
>  		       struct dma_resv *resv,
>  		       struct dma_fence **fence,
>  		       bool vm_needs_flush, uint32_t copy_flags);
> -int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
> +int amdgpu_ttm_clear_buffer(struct amdgpu_device *adev,
> +			    struct amdgpu_bo *bo,
>  			    struct dma_resv *resv,
>  			    struct dma_fence **fence);
> -int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
> +int amdgpu_fill_buffer(struct amdgpu_device *adev,
> +		       struct amdgpu_ttm_buffer_entity *entity,
>  		       struct amdgpu_bo *bo,
>  		       uint32_t src_data,
>  		       struct dma_resv *resv,

