Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C1AC635DE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 10:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E3710E319;
	Mon, 17 Nov 2025 09:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pP0qgpts";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010033.outbound.protection.outlook.com [52.101.56.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F1410E319;
 Mon, 17 Nov 2025 09:54:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nkU6QrxUmb0629qjYw/PdyF9xZL6dWurkhnap2yglNkdWEPGMLRV4e+tI5T2V1aP032Jdni/Y1Uk2bti4/9jLMevn0AJ9JxH6lxh2YwNUluyzRMxRQ4fHC8V5Ox2m2+FcUz/2v0dLDMM7I7lxFPulToi5HhXXs/28hcZohbigqtSwuHMYiGY2kpN12FKLfgB13HJOvsi8gatOrDc0X2WZ3Wn4hTw4eDkB3CRUM0W7yUdFFfQCGvONBMaTODM9Y4u4L5M/U1/PmxIdY4h+XfBGinVkq3KOv4TjS5SeHlvZzGbJ1I0OoxR2P9SqnYB0DpfY7gyVBdVz7T9kD/o05jdiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcM5ixY4gt3GW2nl2Dk96v98f6Hy53DiGGilFNphCcQ=;
 b=yRhXLXfYBlJalIVVuyXPcJ+FPLMxp/LdXqbMOQXCAkJc+ZpbQ7co8jqvotsFcYpm10zMn0Q6VSpaaOdX+p6A4I+gRx2hhLicQi4cCcA3R+jhmYFRMfLXsFQmoHsR6JGeeyWJPa8DrizlzcoNsBOYF2Mfe5ZEKR1IM0eGJbWcpRDCBbrXTW4yIluY0G9oPMtk6hF2fE1auZrflbZr0SbCTMwYmwVQpd1OPPUHh049THYro2nW3fA8J/zVRUC7bL0UWogS5Ag00ghlUj8CSDx8RlbWANaCbkNXf2IObAZc4nQ2KI8HJGf/5N2ong310UL3q/MS1Vva8Fp5HturGPkjGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcM5ixY4gt3GW2nl2Dk96v98f6Hy53DiGGilFNphCcQ=;
 b=pP0qgptscZtpcY2/uzGWshJLyYc39tuQg6LFnOt/VrNzMMueb+RqTdMy01uIqIqnDhRKAv8+te5jECEiIZ8Av1LCsuUPWvpAruvnzbVrTgMwzi3aldTo3OA1S58Mne+5tz2+vdW6KCHs6aqQcYmmXelfJCy+biIRiqIcfm6kRVs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB8711.namprd12.prod.outlook.com (2603:10b6:610:176::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 09:54:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 09:54:18 +0000
Message-ID: <3a94c221-1594-4522-a6e9-9368d1c91bc3@amd.com>
Date: Mon, 17 Nov 2025 10:54:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/20] drm/amdgpu: give ttm entities access to all the
 sdma scheds
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-17-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251113160632.5889-17-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0557.namprd03.prod.outlook.com
 (2603:10b6:408:138::22) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB8711:EE_
X-MS-Office365-Filtering-Correlation-Id: ba470d5e-06a5-464b-09f0-08de25bf463b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXNuMHlHOW4rTDg4dTN6RlNzaVhhdVVHTWpncVJjQWI5aVZhZjJzMnZneFlB?=
 =?utf-8?B?ald0emxyTENsTllGMlZDNndlMTIzMnNrRkJHTktYWXhQTGo0Qkk0Ym5iWEZI?=
 =?utf-8?B?bzA1SjByaFhIUStGazVWbVVuUHI4MjVCNkhoYVcwUERBUnI3SVFoTTVCOGps?=
 =?utf-8?B?MzZEK09NdkpSaWk5cGlTVTk0cEIyUUdMM2toMG1tak01eHp6RVlPa3NoQUtG?=
 =?utf-8?B?dEs1V0NmM1d3dXNXMWg4UFZQOTBJai9QcitCYlhtbnRjQXhXakhrZnN6elh1?=
 =?utf-8?B?bG4rWjJqRTZhOXU2Z3NSWDdRMlNaK0JoZFNZeDl4Ylc5SGRGQTl6Vld4QW15?=
 =?utf-8?B?Ry81azJzcDRYeTJqbnVUUGdSakpZc0syRXg3WWl0SWF2YllaNnVlcDZhZlZZ?=
 =?utf-8?B?TzMzb1JMRkFta3hTQWZhVFRiSmF5UUYwTFJDWTZ5dXdtS0RDSTNTak5NWG9Q?=
 =?utf-8?B?Y1c0Q3lnMlNUSEhCcG5MSzAzSmF5MCtqTjA5TEpvc2ZxVzFHbFE5cnM5ZGJR?=
 =?utf-8?B?S21VQWFkZDkvZWQ3ZDJIeHZETGFQd2FOSVFJZVJFV0k1TkFZMHM1NzVwWGFy?=
 =?utf-8?B?V2FsVWtBbFFmR2JkTXlJeDdxUDBTcEUzcXZaZ1dGWlZaVWRTZE1DMXZYU2FV?=
 =?utf-8?B?RnJleWFjMTlTSzNjSHM2cWtJdHMvMXpobFZ1eVptTGlPQnVQU0xoNVNoVm9Y?=
 =?utf-8?B?NFMxbEFHRFQ2VzRVYnlQbGNtOFNRTHYrVU9YTlowTTl1bmsvNlkrM0tkL1JI?=
 =?utf-8?B?T3VsRkJDL1UyZzlBZG0xYTZoUDhxNmJNNUpvai9SaHFMbFNEK291a1hlNnVi?=
 =?utf-8?B?VzZDaWd2bTFFaVQwUzRRWitJMXhrU2EySlNRZDRKaG1JK3E5bnllOUYxcG5Y?=
 =?utf-8?B?M3BLbEhhL1k1UWE0QkRTcFNaQVZDUjdzSjZKQzJoQU9CVXJ4MWJFQTJaMnhm?=
 =?utf-8?B?c0N0cE91L0xnbFBEckNQUXRXQTQ1eU5mQ25BSUpzMndRcUp0YUdhUFZuOTRw?=
 =?utf-8?B?Mlczb2ROakQxOWtZdVF0M1hjL1B4bkU1YllsM1g3dGQ0MWdiNDVCekNpRkNt?=
 =?utf-8?B?UUtaMlpjWDlPSnVnaCs0TGFHS0h0N2doQ09oMDM0L3dWNGtIUldBRzBtanZw?=
 =?utf-8?B?V1V4eGdwOERUWEF3ZUtGUzFjUGJpRnRGRGRPdWtlNWRqZTlHOWRiVVQvTHQz?=
 =?utf-8?B?TlFIazJDRXlZNnZzU2N0aytPZ3kyWXV4cmZHdXFBaFc4WU9uRWExVHIzTzZG?=
 =?utf-8?B?TWhZTFUvUHpaSVZVeGhmWTFOQngwNlRiK2lsbEVjRUxSVndENlJnTk1iUmto?=
 =?utf-8?B?Rk81NktkZEt6WmxaNlJ0UDhadWhBd2RtK0pKNUl3amd0SlJrdEVubnNBdU91?=
 =?utf-8?B?VnkxR0NxYTZDcWQ4NjdISllTS2VtdWNkRklYVEl5Ky90aFZ0RjJXcTVtODVJ?=
 =?utf-8?B?cFB0QnYxTFdRYmZYRnJIRDVTTnpCYXo0a1ZscXA1ODV2T2YxcTlveExLSXRI?=
 =?utf-8?B?RW1DckJkYjlmNTUxdEM5L2pIOHpNdE14UnhzK09sT0dGenh2RUtvWmdVUWVU?=
 =?utf-8?B?aEFNRndiejBKaWRXbFZ5WmtoNHhSeW1nVGZNU09lWGVNRzIyZFkyam1oT09V?=
 =?utf-8?B?OCt5ZGdHekNIWVVEaFNBNDdlbWM5d1pxek1NM2t0LzRFQVJscTJjZnB6TEJG?=
 =?utf-8?B?cWQ4aWcxcmZnbERRN0tTbUR6MFNleElIWERaZ3NzRnJVWHgybzVheWlqQ25t?=
 =?utf-8?B?RitVRVlMQnN2R0N0bmFWbWlRaXZ1SWVla0RLQjBTQUhLQ1hzWFJvTWNjUzdy?=
 =?utf-8?B?MEZ1UEIwN0VPUSswSDVvNTFZNGwwa1haWnZEdFEzQkpsaEJMdWpDbWlxUVRT?=
 =?utf-8?B?Q241aTczOWY5RTlHd3h5SGpObDNobW9OcTNIWDlRK0FvNzZFcTMvK3dwSmJQ?=
 =?utf-8?Q?zuivtFXRSaYszgS37P/vhhCCj41YC7sI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3U4bXlmbkhwSjRzeXd4Qmg4QkxOTE52Zk1wZU1Uck1OUlEzUHVTN0hnK1Vj?=
 =?utf-8?B?MmNIeENvTlZkMGRXTFBMYTRSUVZRM1NaZDRiS3NxNkZzelhGRlVnR01BSWQx?=
 =?utf-8?B?c2MyaDkvKzE3cFRQeHlNN0dLOFRncXo3NGcydklBZkxBUXBKaUdUN3BlTVBY?=
 =?utf-8?B?TGNaYXBtSjVINEpaeUZyN2w4eFB3ZHp4SmVaVG5qNlBYVGh1ejRUSzBWNGo5?=
 =?utf-8?B?a2FrMGJqMTE2U2lncEdVMFdaL0VGZk1hblJ3V1d1SFo4MmtMVW1vRVJLWGha?=
 =?utf-8?B?cVlUQm1uZUl0RDV2b2piT1QwK2hyNWx1RitYUU01cC91UUxHV0MvQmRiTUhw?=
 =?utf-8?B?amVkOG5YSXlaaGYvZnM5TkJLS0VrcTduWWN5QjZIN2FaTVdhVmIzdnp5YXlE?=
 =?utf-8?B?UEFmSy9SYkdEc2tLeG84akF0TEVIWDBnRUZYZDE1dzJHcmZmVHRSeDJkR05I?=
 =?utf-8?B?bDFmbFZPTFpuYlF0TW9DRXB0TFQ2eWFrRHcvSE1XQWNHSnBZTUVTcmpCSWwz?=
 =?utf-8?B?RElyRnlmT0g1bmUzUVgzd0QyUFpBT0piOEhsdkZhZUExa01hRXVVR3NFZENW?=
 =?utf-8?B?RXNESGVLVGlvODdFWjBaS2xqZ0hLNU52dGI0Y0dzckVMdVhIZEFjUHVnZFdL?=
 =?utf-8?B?eXcycVBORGFteG9lSHEzQXYycnRwdktTZ1pmTHFIR1Vpc2Y4Tk5FU2FFTWpu?=
 =?utf-8?B?SmJWNEFtZTluNGdyWjl3ZmhxT0EwZUZNNmhwUUNpUXlreDhXblZoZ00yRlc0?=
 =?utf-8?B?WHgyWEVZTSsrZzJlTFhwTjgyMDU2YUpmV3NvRDgvbHZkK2hIWjJvZmNEbDRm?=
 =?utf-8?B?aVF5Y2c4T0xPWS8vVDVHbnE3Zi8rNTF0bEpsd0hBS0pWc2JzbWYrUjhTU3Nq?=
 =?utf-8?B?aDdBM2N6WTcxNXVhSFJPd3J2WGhQS3VQQkRJSERtVFNOa2o0cXQ0Y2xkZjNz?=
 =?utf-8?B?OFBRcFcyNlRrWmtNbmlaSU1UVGVqWUhoNzJYSEQzNUN6OWFLcDJpTVdJVnBu?=
 =?utf-8?B?WmZ0UFlvZHlQVGJQOFhSMnZnR3dpVG5qdzJwM0VNcldHelFWcGQ2aWc5MzZw?=
 =?utf-8?B?aTZMZi84MFJQV3RPbFl5WFZjbUR2SmpUSG9OQmVLbFBmVTFZNzEzUGgrbU5E?=
 =?utf-8?B?MFRsV3pIUHcrVDZrYVZpQXdnRVFjR2xENjZtd091VDFvU3pmV0prUEtqVHpm?=
 =?utf-8?B?dktjdGtLam1MSStFVmJCcjFRa0RLVnNGcmxwbXd1STJYcnhlb1YycFlsR092?=
 =?utf-8?B?UjhTQmc4RDQralhocWRVVW1BK3RrT3VIY2VZTTZZaTVsS1RSbS9Ndmpjcnhr?=
 =?utf-8?B?WkZMUTcwdWs3Rk15a2dkejd5QWhjemdiVVBiNitGWU1UdFhBV0dHRUpWOGg5?=
 =?utf-8?B?Z2luS1ZrNjFwUjdHQ2J3OVZ3aTNpTWxrTk5SQU13aXY2eDhzUitzMVUyZERj?=
 =?utf-8?B?TVZ1eWJMb0wxN2NSYXZTaGhKbVUycU5TSVVFZGxrUmtRSGNQTzJLQ3ZOKy9k?=
 =?utf-8?B?ZGZtUVFTbjh1eDZPWVRVb1RNMzlhaGtYZGJVNVVuMW81K2l2NFpzaS83MW1i?=
 =?utf-8?B?T3VKbUVRVStFVUhQZUdISTdPYVY1eDZFT1IrcTZheVVldUo4eWhON2Zoa3hV?=
 =?utf-8?B?SWZrVmRvQTJZQXF1b3A1S0o3b1JYZVhlbjM3OXozeFJJaWlLdnpRcDJJVzBC?=
 =?utf-8?B?cDRMbkhETkZZYkxZL01uSWdpQjFxVlcrTmUrcWNiZ0NFN25SVnNyWGRUTEt0?=
 =?utf-8?B?by9qZHNUTEhWRDBLVVVMOWlDd2lTYmRkSnMzdm1ZSExQeHhwZno1RVNCUGhM?=
 =?utf-8?B?NEVXTlBSQm1qY3llWUNHUHFwWS8yUHVsTXFJOXlpbmh2dEtqK2dvbENaWjlm?=
 =?utf-8?B?dnpIRkwwM0hzZlBrMWU3K2hqK1R1a2cyVXhaclBUbmhYWUt1eGhIV1NnZHlk?=
 =?utf-8?B?aml6VDFyenhpWGZvWkc2ZVo4QkU0dUV6UUI0a1ZHekE3dlVuOHJhcnFaek9Q?=
 =?utf-8?B?OUR2OCtna0ZZVi9yM3JqMk5odWUvTSthNlJqcmtJVnFReUZ5TnhJb1JNY29q?=
 =?utf-8?B?RFhzU3pydGt3M091TnJKeWRWYnc3QUdFNVVHTXlqMmlhRm9FVkU5MHJOY05V?=
 =?utf-8?Q?G5vX3AfU674VQWVGpeefAbVc9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba470d5e-06a5-464b-09f0-08de25bf463b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 09:54:18.2309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xB6WJtWPjLtGYKv8nUpxx+D5j5Ftg1fC6Dzru0Wpo4PCZG0Bt//Q9b+gzJf+NdRt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8711
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

On 11/13/25 17:05, Pierre-Eric Pelloux-Prayer wrote:
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

This patch needs some more text in the commit message, but apart from that Reviewed-by: Christian König <christian.koenig@amd.com>

Regards,
Christian.

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 11fec0fa4c11..94d0ff34593f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2191,8 +2191,8 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  	u32 num_clear_entities, num_move_entities;
>  	u32 windows, w;
>  
> -	num_clear_entities = adev->sdma.num_instances;
> -	num_move_entities = MIN(adev->sdma.num_instances, TTM_NUM_MOVE_FENCES);
> +	num_clear_entities = MIN(adev->mman.num_buffer_funcs_scheds, TTM_NUM_MOVE_FENCES);
> +	num_move_entities = MIN(adev->mman.num_buffer_funcs_scheds, TTM_NUM_MOVE_FENCES);
>  	windows = adev->gmc.is_app_apu ? 0 : (2 * num_move_entities + num_clear_entities);
>  
>  	if (!adev->mman.initialized || amdgpu_in_reset(adev) ||
> @@ -2200,11 +2200,8 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  		return windows;
>  
>  	if (enable) {
> -		struct drm_gpu_scheduler *sched;
> -
> -		sched = adev->mman.buffer_funcs_scheds[0];
>  		r = drm_sched_entity_init(&adev->mman.default_entity.base,
> -					  DRM_SCHED_PRIORITY_KERNEL, &sched,
> +					  DRM_SCHED_PRIORITY_KERNEL, adev->mman.buffer_funcs_scheds,
>  					  1, NULL);
>  		if (r) {
>  			dev_err(adev->dev, "Failed setting up entity (%d)\n",
> @@ -2216,8 +2213,9 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  		atomic_set(&adev->mman.next_move_entity, 0);
>  		for (i = 0; i < num_move_entities; i++) {
>  			r = drm_sched_entity_init(&adev->mman.move_entities[i].base,
> -						  DRM_SCHED_PRIORITY_NORMAL, &sched,
> -						  1, NULL);
> +						  DRM_SCHED_PRIORITY_NORMAL,
> +						  adev->mman.buffer_funcs_scheds,
> +						  adev->mman.num_buffer_funcs_scheds, NULL);
>  			if (r) {
>  				dev_err(adev->dev,
>  					"Failed setting up TTM BO move entities (%d)\n",
> @@ -2239,8 +2237,9 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  
>  		for (i = 0; i < num_clear_entities; i++) {
>  			r = drm_sched_entity_init(&adev->mman.clear_entities[i].base,
> -						  DRM_SCHED_PRIORITY_NORMAL, &sched,
> -						  1, NULL);
> +						  DRM_SCHED_PRIORITY_NORMAL,
> +						  adev->mman.buffer_funcs_scheds,
> +						  adev->mman.num_buffer_funcs_scheds, NULL);
>  			if (r) {
>  				for (j = 0; j < num_move_entities; j++)
>  					drm_sched_entity_destroy(

