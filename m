Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E235A85809F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 16:21:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECB910EB83;
	Fri, 16 Feb 2024 15:20:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LeHevmTj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11CC10EAFE;
 Fri, 16 Feb 2024 15:20:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EcZ9uDR+Dli6sWIMDL6yXn4ePxssb4Oa8OFsPME61lgI34VOFtzueAlhH1gOmwkU4vVq4X33MgksUNeY0M89QRtHQrA/6AIxNL6Y0vUyTrDX4rI1WnXWWRX8mPQe5WcIGLdZZ6MNw5j51CngU+ed4qbOIkv8HlefbirJ3qSBJnt4UBQSVYoL+kQWT3XlG+96OSHLcNDnqu2V/XYsPFZL/uTBU7C7iPzU2XD1NfVuNJdBJZ+KHdsKduvnqWmtZvfRDKIv8I02RTkIIj0UD+qt+l5ZuI5UybQMvxzs5Gt21rCvhfgBfb3fofw9vqheSaHOWZAzXDlvdLJoKuAh6e73AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NQOHbebJtVEFyk6Fsx8RCC6B2O126C/RiRYtkP/EZo=;
 b=g0mM3srFt++MhucSXdiLhLPtlR0EhoAoixde7oNQlFZkX+UQlqggjvQaQYD6YdzV1YaaKNxiAiR90xbvzthsNFyDo5KFJk3REU+C15mCWhfq7GFyMi21LDtlHksAthAoU/crvyp3bhIdnezZH29ZcyWG4tIDVCjqOK+rHPiUw2tY4Yx6fak8Aax8yt6918OexHOdDITWJGJ1QwVnM9qTJbaYtn0tObL89P6VoQkAMp9k0H1QYaNQip24qASAT/OnGTqzjcZgxfneN1IcjQmhsskPjoRroeF+MxUNPAbVHa3Olmw0Jdd//nKEHr/jURzBHoTu5DSfx0cT8GWJcCbjUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NQOHbebJtVEFyk6Fsx8RCC6B2O126C/RiRYtkP/EZo=;
 b=LeHevmTjrI70Qnco0uXQcLtEMG1NyOvPZlZOZzfsiouA6tE2v79AaBRZJMwtCcbDEDgy9o1fSnoHlQvqUSN4kguG9js2p6zA4P5Os9084DPhqpeSJXbBNmMU4ta7gatLC2i9xiphWVueXG5n6v4NGRtfNuQpNiw5Vvz62MFyAf4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB6797.namprd12.prod.outlook.com (2603:10b6:806:259::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.12; Fri, 16 Feb
 2024 15:20:54 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7292.022; Fri, 16 Feb 2024
 15:20:54 +0000
Message-ID: <cec3ad47-b008-4fd1-8f0a-172ec2a6526a@amd.com>
Date: Fri, 16 Feb 2024 16:20:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] dma-fence, drm, amdgpu new trace events
Content-Language: en-US
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Alex Deucher
 <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
References: <20240216151006.475077-1-pierre-eric.pelloux-prayer@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240216151006.475077-1-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB6797:EE_
X-MS-Office365-Filtering-Correlation-Id: edf99c76-b07e-4f96-626f-08dc2f02de04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5J/BEuvzRTHUEUtr3fjMumk8WWemkvzdagkUVjcYzZSgIraWYSTEpbkis26XynyI+cIMBjVuxsk48k+Mk8Gw/5im8+2idoJ3Glp4AbuKqAM4OxTAtrZiVd3KRkg6InmFEEwEMDvYIOTCtyBhDizT5XYXhMRwnXGaMilh9m7hRCLGCPys99QuGo3kEz4Nf+2Ed60st7AALPk740La8ryysl867NBDY1taxjh6tAs+4akRvdFVJpjiOoW2wZ0kWdG6F/fSQBkbFf5nPQxII79TsDBMHkI1AUQ8E+5UciT6BSK0J3g3WKoQyTLNXQdYHC8uvpBgaBqxLfgYvqWBAf+nQomHMPtDpMfYX7OEY70Immb4ngb7o3wU+BoWDXO0NrzACFeSa1w3piupNsEIsWJcoIfjFcGGwNJqljBrDtolqyzJ+DJ90LEe1youJEfxPxDw2ZobweNs17o+Ksl5r3NjQnx6EirlVdv8BCMZRsCb28QD8HQRkRYVGbLSTsWt6cnXIXbJI7jocLy6ArIcvPyVSQ8dDsl9LAqKkoGPsQtmmvkv0K1V7UZWRD4HACSHl8/ewNqW7r3TfKIIvc6AxAwYPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(396003)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(66946007)(66556008)(5660300002)(66476007)(316002)(2906002)(8936002)(8676002)(86362001)(478600001)(38100700002)(921011)(83380400001)(31696002)(36756003)(6506007)(6512007)(110136005)(966005)(6486002)(6666004)(41300700001)(2616005)(26005)(31686004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3F1dzZMaGdubTVwcjR4TEFPNkdIeW9lVi93cnkwblJpem9SM3JVUzN2ZXZD?=
 =?utf-8?B?RnRNSG1hZnUwc2EyVllzVXpqOUVqQ3dsT1drOWRDN21tQ1FoODRuS3NCY3Z1?=
 =?utf-8?B?bTkwVVREZVNWQXlJYmtVTWNvRm9iWVBzcGE2WERJNkV2WG5mZFNmMUlBUURr?=
 =?utf-8?B?cVFjMExuekR2L2pzUTVkUXhQaXdGdUR2Q3liU3lUbGViby9VOEpFVTkxemp4?=
 =?utf-8?B?U0tuZXFVZWx6bGJQSllIa01jT0ZlREVUUjdqTmZuem96QnlnU2R6ZUloTHMx?=
 =?utf-8?B?bVpINGx5OWoyaERQNTlLeExPcHZmM21CK0kzRENXSzZ2cnV6dWpla2kwVk9n?=
 =?utf-8?B?NlNIVTgwckRaYlBPTWVQN3VXWlFJMzNocG54bjh5QlJOWElucU1vS25aK2Nm?=
 =?utf-8?B?SFRsV1BzYkwyNTJyTm9KZlJEQUxFc21HYU9TQnJnT3pncXRPWjR2dWRCSU5U?=
 =?utf-8?B?dUN2VGZOREFRWGFpYWorZ0FqMGJ0eGIvSnB5eURkeE9jSitERUp0OHlUTklI?=
 =?utf-8?B?TGJqNG5Iak1YNWRDbVEvQUYvOUcxSWs0Sk55ejRNV1B3UVF3N2wyMmY2TnVj?=
 =?utf-8?B?L3owZnU0STM5Z3doVElTSE5lNVpNM0hZOFdaT2MrZ1diU0RJM1pvWkFVamJY?=
 =?utf-8?B?U1dDVHdEVVUyd0dwUmtCY0J0Yjd4Vzc2REpzbnFuLzJCZ0VQb0JIRlFhZFhw?=
 =?utf-8?B?WUlzaFJ3TGhLTTNDcFBBS08yeVpiN2s2YVU3YXVtQThzWmtwM3dBRE5IRjRX?=
 =?utf-8?B?KzZuNTlqTDIxalZ2eUZ2ZWF1SzhKYUtla0t2b3gzNmc3MDNBYjFDWFRGRjlP?=
 =?utf-8?B?YXAzams1UkxKN0RIcmxLNVJJODRjMDNwKzRaMFNrcVZsWmQ5WTM2NkhKZmhj?=
 =?utf-8?B?RjVncWIvV2tIeHFzem5HcldyS25Fazlsb2o0bGU3NUt2RHNVbkNzTVhmc2hm?=
 =?utf-8?B?Y2NMNG1DT1FTaWdoNy9jR0V6aEYrR3JzalFoK0FyUWl6VzY4T1VwNnFoZGVj?=
 =?utf-8?B?SStwRWtPTHE1WEd2QnZKaFNUTUVSZVFHZzNnTjlzNmZ1ajFTbDhoVFVKTkxT?=
 =?utf-8?B?Z2NueXU2S29vNXMrUVRuS1VPa293aGJVd2dBV1lsSDE5MDNJNUxuK2VCOGZR?=
 =?utf-8?B?QkdCOWo3WkYwT09GSHVCblB6TGtHNmsyKzlMcFExUFBxWUFPZGpYUlAxRFpP?=
 =?utf-8?B?b0YycWZPYXVSSW91ZVllcEhzU0ZXU040TUJVL2FyRHZWZFkxUDBsalVIRWJ6?=
 =?utf-8?B?cGVRejJteklCUWRIdEUxNGNRVmRpaktXa093Z0VLeWJCTXJ1bGlMRVJBSFJ3?=
 =?utf-8?B?b001TGJiM0hYUzFnRzJsZGNMZS8zb2hwYmtTdHlHMEw5K2NrcHk2ZWZiN282?=
 =?utf-8?B?anNaM3oyMXhteVBqMTh5eFRKaklxYnU3bHlMRndidW9BZmFXb1VCYmNhVGEw?=
 =?utf-8?B?QUx0UjNzWXJRekJHTytUWGtkWE5GQmUwQjJWRkowNzV3K3hOSmplVUVDWnBa?=
 =?utf-8?B?eW9lM0tUY2ZyOGtMWUMvMlN4TGJKOFdVVUNUSTVvRjB6QnRDU0MxR2pxMXh4?=
 =?utf-8?B?Q3gxMWZRMEt1a1Z6RWwzT1Q2Q3BXZGlmQmNxa09wc2c3MHh2NHRiOEpVTC9P?=
 =?utf-8?B?RjBEdElqS2VkODUrRkpZYXRWZnJFQmZzZjFIM3JLc1RsTEsvQXpiMFVKaTJC?=
 =?utf-8?B?V1p2b0JtMldhTUhhcjRzRFg3cHV3V3FLaUd3d0xzcENnNXJkZzFlOEZnUDc2?=
 =?utf-8?B?YXdEZGJvTHRKVkt3eHhIdU02aC8xZXFyRWc2anJ6akl1VlhYS0N0UlZkV0E0?=
 =?utf-8?B?ekVxOHU5Z1cwVnA5VFR3WmxCQW5jM1lwanVkY1JtS2JiSzREZ3hVZlc0aHJS?=
 =?utf-8?B?ejJUUHFZQWFPdm1Pd3dLazZQZGJ4WThKUzdSK2I0U2pBSkVMV2pIRWlwVEli?=
 =?utf-8?B?akIrRUc2dkRxeWx1MUQyeUNTM25vWDA0U2NHc0tEZ0FlTWN0RDBhUXpoTUd1?=
 =?utf-8?B?anhwSVdCc2ltZFFuWGpZdEo2dUZOTm1tRFRxZDFKOGIwV0lpV1pJMUNmc01v?=
 =?utf-8?B?NHFSbFVWYURROFhmM01BTkVSSWZCSFhwSlJHUWFsOTNHRXAzVlBZWUxNanU3?=
 =?utf-8?Q?BhsTYtLXFkq48CgmxTYOw3/Er?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edf99c76-b07e-4f96-626f-08dc2f02de04
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 15:20:54.4143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R1im2VPtJFXRX6celQPhNQiZMB9UXJY5bjxdXlCkABeyxgZ2MO8HfAyWEiD/wdm+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6797
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

Am 16.02.24 um 16:09 schrieb Pierre-Eric Pelloux-Prayer:
> This series adds new events to make it easier for tools
> like gpuvis or umr to graph the GPUs, kernel and applications
> activity.
>
> UMR patches using these events can be found here:
> https://gitlab.freedesktop.org/tomstdenis/umr/-/merge_requests/37
>
> V1:
> https://patchwork.kernel.org/project/linux-media/patch/20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com/

I need to separate this patch set a bit. The DMA-buf stuff usually goes 
upstream through drm-misc-next while the amdgpu only patches go upstream 
through our internal branch.

I will keep you looped in which patch I pick from this set to which branch.

Oh, that's going to be fun.

Christian.

>
> Changes from V1:
> * uses trace_dma_fence_sync_to from dma-fence-chain.c
> * new amdgpu events
> * new drm plane commit event
>
> Changes from V2:
> * uses trace_dma_fence_used_as_dependency from drm_sched_job_add_dependency
> * add devname attribute to the trace_amdgpu_sched_run_job event
> * addressed review comments
>
> Pierre-Eric Pelloux-Prayer (8):
>    tracing, dma-buf: add a trace_dma_fence_sync_to event
>    dma-buf/fence-chain: use trace_dma_fence_sync_to
>    amdgpu: use trace_dma_fence_sync_to in amdgpu_fence_sync
>    drm/amdgpu: add a amdgpu_bo_fill trace event
>    drm/amdgpu: add a amdgpu_cs_start trace event
>    drm: add drm_mode_atomic_commit event
>    drm/sched: use trace_dma_fence_used_as_dependency
>    drm/amdgpu: add devname to trace_amdgpu_sched_run_job
>
>   drivers/dma-buf/dma-fence-chain.c         |  4 +++
>   drivers/dma-buf/dma-fence.c               |  1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c    |  2 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c   |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c  |  9 +++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h  |  4 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 42 ++++++++++++++++++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c   |  2 ++
>   drivers/gpu/drm/drm_atomic_uapi.c         | 21 ++++++++++++
>   drivers/gpu/drm/drm_trace.h               | 23 +++++++++++++
>   drivers/gpu/drm/scheduler/sched_main.c    |  4 +++
>   include/trace/events/dma_fence.h          | 27 +++++++++++++++
>   12 files changed, 133 insertions(+), 8 deletions(-)
>

