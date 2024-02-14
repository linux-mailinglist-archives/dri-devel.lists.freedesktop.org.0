Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7738548E7
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 13:06:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8826F10E106;
	Wed, 14 Feb 2024 12:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IFFngKIX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7AE10E07A;
 Wed, 14 Feb 2024 12:06:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNH+D5i6To3q3SxPZuwdP2JB24rutXgZJcBSjVFaSEXR6hna8nR5gtk+pK8+HdauTQV95tLtCKH1EnZNUw3RPOgxP5F2Yw2zzIHOdHgKhnRbvYzQDgOz0VnNm73YZk63ao7f+cvz9F3ZWUpJfebuvAgmxRWWvMBF4A2sVyr3bY3J+fkRWRTglTmHbfkrqCbN1h0IBFyMI7DC3mOX2Y4tA92EZcbH7SBwzWtFZKmnfPdCdxBcpHjvu+wqq71nL68j96GP1l+l8QDMfeV91GDpb4oatMKTZqpc5DBQMrtOAt9R95tBDeTjbMQ9rCbBSaK+0BEarAj0gNLS8++jCwpJWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZlmGPuyIU3BQ2ZOAw1rQPWWh4Pb0qczgHRZBNx2p9Q=;
 b=DK6SapBS5ATZliQz810pyY2A3ArqDji6+AportNnLpYW+tifkPi5DCnjapf4dVHh/4nV/eD7+CBjNtEVYefWHoG6VxqZ8hhIN6yzR8wX+qSlIGCEo4GA6tldqX2w3m4SabFd79+mx5Fa7JsQSoygRoZ8IYcCYe5g8j1HacqQWoKQPN2CsLU9J+pwhVXDOe4FNYRjQXxcWvGa5dB6dk4tRbq7AkpI6JRQ5Vu17LXabiAvfLDBDxku6F/4taqgx8H3XdI/0jLKryJeqfoznuxfx9ydpmzylENilfLsP3LLEknrZFv3FzKv4Wy+ermY7sKlIB1/y5SpCzMEjiJhjDPCcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZlmGPuyIU3BQ2ZOAw1rQPWWh4Pb0qczgHRZBNx2p9Q=;
 b=IFFngKIXTbWCd45r3ZHNeXJezto1BCe3LBeH7kbEE0t6kUudOMkM3JaUdCbL9YD1oMT4PpFjMi0G7trUgiaT8TEhv4LkxZB3FCfhkR9JcNFakD49pYeKtOtDIB1C6UeR4LBshV4ur0cuu+wn7HGVRxP6g44jPhiQlQAqIxtyD0U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL1PR12MB5730.namprd12.prod.outlook.com (2603:10b6:208:385::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.23; Wed, 14 Feb
 2024 12:06:40 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7292.022; Wed, 14 Feb 2024
 12:06:40 +0000
Message-ID: <e4139f49-1fcc-4200-9741-e17564624e1e@amd.com>
Date: Wed, 14 Feb 2024 13:06:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] drm/amdgpu: add BO clear event
Content-Language: en-US
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Alex Deucher
 <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
References: <20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-5-pierre-eric.pelloux-prayer@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240213155112.156537-5-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0226.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL1PR12MB5730:EE_
X-MS-Office365-Filtering-Correlation-Id: 2070fb1e-ff40-4802-6ea7-08dc2d55671e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wlBHk2m4T0yHLXF2ADCTDapaH/TPiOC9ywEIPMSVBZr4BNGzuzIuuv3uG74CVk60gwvixFdz1ODp6ye7CAIkJSmOYRMtXBK4O7nvLuzvQk4SoQ07JPbkqHSy5/Bjoq17d1BSeZFDtHYpMlXkJXIDK9yaN6xEh6EUSEzoycmG3sWgfOS1RJiiP9hIpaJKI8ePqDZlJPVcCMWBweLeiTy+YSFvnF26xu7wLmjs40h2pLxDkCIM4OEJRXumAhabCvUS5q2aZhLiR7XuxhuKPBgJkSB5tALZic6OgnAG6rPqN00EXs/G1tXSzZzfzCKCApsd/4QVvFmSt5gBnPt079eqIGjsxOVpl+7qCHjcwiEqINO3OE1dZZaoOVRHCVntFY+6JRgKiRpCxgOu8rmgKhw6LIOtMe91FHuFzR6asQL4as2QTUlW23kTFPqfuyfcwi7zJNAdPob4oKXzfotPYk4MYMvkfYVKCeJjGdHBF4jFLxNj4XrjUKbTWCv5etpkVRCKrHH26FchH8BA5NUFntus2iIu4PS4nXLLbtLb97jiyj18wUnns5aPtuU5un+KD3gJ81GfJCvDkGbQx0ptS53TnyE0a1H6SpX31Rgf4MiI6VQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(366004)(346002)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(8936002)(5660300002)(2906002)(8676002)(26005)(31696002)(2616005)(38100700002)(921011)(36756003)(110136005)(86362001)(316002)(66556008)(66476007)(66946007)(6506007)(6666004)(6486002)(6512007)(478600001)(41300700001)(31686004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVZHLzc1UlZvWWxON09zUjljZUh6VDh2MEMzbzJXdStTckQyOHNwdGdNLzR4?=
 =?utf-8?B?OGxFSlBxU0pQeVo5bWlpazJjazQwMFN1cFVrYmFhM1UwRGtQVlNLQi8wc0NY?=
 =?utf-8?B?aDFkVHFMTjJaSGVEc1pzZ3crQUpsNGpHeHQyQ2RYTnJBUjQvWU4rSnFzUzl2?=
 =?utf-8?B?dTdVMzNPT0dQckZQU3NOcnladEYwT1lHcGhyMnNDMTB5Vk5oR0NwWGEvU2Vm?=
 =?utf-8?B?TXY3V2pPNFpYZndqbGNuY2Q3aWovOFR4RktVcDd0Zkc1ZUhJdWQwNHp3VEJr?=
 =?utf-8?B?UHZXTlNMRUEwc1ZtTC9uV2YxZTVNZ0R0eHVxRWhtNDArZzdyWkplVGxiU3FV?=
 =?utf-8?B?R3Uxd0tzbTNwTEorL2xkZEZzQ0tXanVoQmxnb29kenMwQUxZUys3T2tKQUpC?=
 =?utf-8?B?dnVlcDNubG1ZTnFxS0RSV1Bnbjl5MW51WGEyODVFdHgvYzdpS3d0OFd0N0pD?=
 =?utf-8?B?aFlKSzdkcjVCNzVzWTJNM0JwYWNMb0tNSy9uYTZvd00vSjMwRWNQUkk0L3Yz?=
 =?utf-8?B?OVRLRG9GRy9sWkFYZ2ZJNU5jUDkwckdmTjZsdTNIWDFMd3BaUzJmbVpMRk5K?=
 =?utf-8?B?UFR0SGVna2pvK1RNK0JoNUZsQnA0UEN1VDhJS0M5WTYxT1NMdmIzekgrRGR2?=
 =?utf-8?B?NTU4Mll0azRnZ0cycUYrcXQ5d2MzaGI5TnhvTy9NNjVQOTBIY2xTalJ0aUtD?=
 =?utf-8?B?VWJsM3NXN3RVYjVGM0tPR1VZaldxUmRMUDBZOUhQMUsxK1FEZStnM0wwVlZR?=
 =?utf-8?B?eGZQcHZKQzRPWEZyTmFVWU43U2pWREJWMDBYVm1UdEc3U1EvQXZFUG9kNEtu?=
 =?utf-8?B?VDlNMjVRekJaUXBHa2FXN3FLSFZaR2l2MkhkWnZ3WDhlZVFWRzZDY1pnSVNE?=
 =?utf-8?B?WEgzbmdUcW10SC9IcEdtWnM2TFdMeHd0WUtSeGxjZ3dJL2ZneTh2QWJ4VUox?=
 =?utf-8?B?ODhsZG9EVk93WkwzSWJGT1Bibm05VGF1N04vVzk2dTRzaWFQakZoakg5MkY0?=
 =?utf-8?B?TENxc1p1NVJDNndCZmlnWGdyYXcyYUVhYmdqS21QRkl6NXBKOTczMVlrRndD?=
 =?utf-8?B?N2xRZjY4dWZQQ09SL3pIYmQzckpGUmVaZXBCcndxUTMyRWNKcXVMRCtSa1R2?=
 =?utf-8?B?NlNXa3l0eUlFc2Z6YThHR2pLZ2p1MWFrZ3gxZ1VubGd6Y2FsTWl3S3BGMTNM?=
 =?utf-8?B?eGlFcHVWaUtCNzBSTnFSWHNZNkg2NjZ4VnZBa0xNZWc2aHh5K0xIM2pURHJt?=
 =?utf-8?B?Ymw5dGlnaGdhUHFEdXRoV3kvRHlwYUljZ2d6Yi9NR3JiK1plM25kUSs1cFdq?=
 =?utf-8?B?R3FhdVdpUDhHaXNCNkFybFhnY2wwSXB1aDh4RlZ1TmFDVURyVlNMWi9XYng2?=
 =?utf-8?B?VGZvbHZxUkhuMVBNOGt4U1hrTmNnRS9yVUF3T3RnZTJXdWlFTjZDdlllRUQx?=
 =?utf-8?B?S0VlbG9hY0R1UUxkNmhJRG82NDNkT0JHTHRsekI2b0lHSm1sTW13cCtydmpL?=
 =?utf-8?B?WVZTU1N1OUdtcnM3L2NHYVpQZnFpcTZUNm5XTXFGY1J5aGFSUDNpY0lGOWdr?=
 =?utf-8?B?OFJ4cURKeFhvZStGOVdoVUZvYWFucWNDKzl6V0dYdG5aL1Jtb3RCYVNidjRN?=
 =?utf-8?B?UGRmQzNHeFp4OEl6Vll4bEVSVG1VNWdDNlk3WnhyL3V4aUhpYWU0emJpTFBv?=
 =?utf-8?B?cVpVZjVHRFlDWjlQQ3Q5Y2JRUmRXa3JIVUtFekNvNDJPdmVHNWdtWmtxSUhs?=
 =?utf-8?B?NmgvMUxRTFBCY2RiVU4rVVgxN3I3MDQyTEkwRWNlWlAzMzk3MlpBRnoyWWpD?=
 =?utf-8?B?YWhvOW4wN2ZRN29CalYwYWJ3azR5aXh0TzhqdEdqa2M0YWh6blBONVo1TGMw?=
 =?utf-8?B?VERHVUpFMmM1SHhGVjdOSkk2K3pOTTFTN29oWWFXVVRiU1diL2JpMllLZGJx?=
 =?utf-8?B?RldIamZDcWp1WDBPQkFGTUU2MjU3Y1FsZGFlbGFkaytUanRwOVJqQmw3aXFZ?=
 =?utf-8?B?clA1bDUyamJWR2NtWGt5UjdpTkwwK3ZwbU1LK3V6VWlKK2pRN3VHa0ViYWxS?=
 =?utf-8?B?Uk53MldUSkRFRWNscVpsck9wU1BpZG5xTnFtd3pxU2hPTjI2UWd1ckgzS056?=
 =?utf-8?Q?4QbmqpJNtCqi2AIYwhN0b/V6e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2070fb1e-ff40-4802-6ea7-08dc2d55671e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 12:06:40.6756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZJ9/z95JIyxdqDFhuoidT0bNsebzbWvPvz97m1UxjpoCpM1x/1l+3RNvN5aoxSy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5730
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

Am 13.02.24 um 16:50 schrieb Pierre-Eric Pelloux-Prayer:
> Useful to identify why sdma jobs are submitted.
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  2 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h  | 16 ++++++++++++++++
>   2 files changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 425cebcc5cbf..7219f329d6f0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -631,6 +631,8 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>   	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
>   		struct dma_fence *fence;
>   
> +		trace_amdgpu_bo_clear(bo);
> +

Might be better to put this into amdgpu_fill_buffer() since we have 
other users of that IIRC.

Apart from that looks good to me,
Christian.

>   		r = amdgpu_fill_buffer(bo, 0, bo->tbo.base.resv, &fence, true);
>   		if (unlikely(r))
>   			goto fail_unreserve;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> index f539b1d00234..e8ea1cfe7027 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> @@ -514,6 +514,22 @@ TRACE_EVENT(amdgpu_bo_move,
>   			__entry->new_placement, __entry->bo_size)
>   );
>   
> +TRACE_EVENT(amdgpu_bo_clear,
> +	    TP_PROTO(struct amdgpu_bo *bo),
> +	    TP_ARGS(bo),
> +	    TP_STRUCT__entry(
> +			__field(struct amdgpu_bo *, bo)
> +			__field(u64, bo_size)
> +			),
> +
> +	    TP_fast_assign(
> +			__entry->bo      = bo;
> +			__entry->bo_size = amdgpu_bo_size(bo);
> +			),
> +	    TP_printk("bo=%p, size=%lld",
> +			__entry->bo, __entry->bo_size)
> +);
> +
>   TRACE_EVENT(amdgpu_ib_pipe_sync,
>   	    TP_PROTO(struct amdgpu_job *sched_job, struct dma_fence *fence),
>   	    TP_ARGS(sched_job, fence),

