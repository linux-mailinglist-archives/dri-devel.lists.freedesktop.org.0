Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47391475704
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 11:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A390410E4E1;
	Wed, 15 Dec 2021 10:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9328610E4E2;
 Wed, 15 Dec 2021 10:57:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFXNMtUmuBejAs3hBECLH5p+LTt/7M14Fscofxiv7D2JzkxSTle1zBvgIRJg+tgZs8lDdeJNOcEULdJ3CuCLiMdNIi8eRsKnl2WwDvTb50VnucyUMctLaMZrBp07t2aVANwbKooBhUHgkqYk5gRqKExX5Hq1J4a4tvQKuseQXGU3Vp9XUHqHuRhPEklM5JSIgur3GbLaOLqOJ1cEpHYdq62BYYR3NjaihBPIY13fhroTnynDGlfcnbUcWgrcFLFIIKufPDhwPUQJTBDvHnA+wbi17uH+qvz+1kErgadCZmTfX06dRQJ0BM0R+NW7c+/iHnxUGOrS3k4vi4rJ8rKPEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6xIr4psALN1wEX9oLlxWEMldtQV2mArtet3qFi+oH0=;
 b=Iam7Et5d5Putr1u03qxPDHLZuBhXPNrPy7YhRtIvvIk+RAa+JiRmEuTUU1szfL0x27fZZ+iSd/x0i6R/PYQf0V8B9E/UK5gJmiDwJOj2Lzz79JF6GwjrxXXcuHRf38D6msuac5x4XSWJscKj0Cv0J7saLcVYofmTxU2x7mCGoevOyqd9/D2WqX5mG1uazfg3scDnNkH6QOsyiueyJ1QY5NCSCf4YwWKJlmlKQhcU7l0wW0zRV0FfePwc/KPEvGBI/piExDP6XCkCd3lwBEf1m7xOcreg1g2sV93ljVpqV5rxR7ECTHLsKcxZ5Nz73J8Pp8sQUhAMTFAyPxxGJT+ruQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6xIr4psALN1wEX9oLlxWEMldtQV2mArtet3qFi+oH0=;
 b=yQRBKreokqR+xL5QmK54233QC5M25CoawIPug1o9mj3ptCOcfzHMpC5js3xTYuanR9tBweOtTDsyXQWjjUP6cUj286Unlc1IbpE4JWdiPMTnwUtPgEfjbeCvxw1lz4ej8KpRt0jemguF0Rgx/w6jZacVD46QbEQjln3hFnC1XsE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4345.namprd12.prod.outlook.com
 (2603:10b6:303:59::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 10:57:34 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4778.018; Wed, 15 Dec
 2021 10:57:34 +0000
Subject: Re: [PATCH v3] drm/amdgpu: introduce new amdgpu_fence object to
 indicate the job embedded fence
To: Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20211215063551.2810601-1-ray.huang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2b030c9c-283e-509b-d701-c0d932acd7f3@amd.com>
Date: Wed, 15 Dec 2021 11:57:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211215063551.2810601-1-ray.huang@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS8PR04CA0088.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::33) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2e2616f-6a0a-48ec-6f6e-08d9bfb9b2d6
X-MS-TrafficTypeDiagnostic: MW3PR12MB4345:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB4345894737811369C76D11FD83769@MW3PR12MB4345.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:142;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ll6froOEryoFBFYjTrX++ATdnhykclHPvNO2kferAF7YcHJzCx71V0QuhRqnDMY2o7sOOnDseDHRQAwWv0T6NCWl3WfRpm9q7ol3biZcyHvAhtOafgiMkVPHxxvZ+ssqWIpDCG3MvcA6vhnnyIHHFoHp5MrutzsnEhy0ADDyuhfLj0iGUafY2ou+b6F3u1gtYrxSKq+viwq2tBkNTAriimIIu8Gkw6mmgBUEn+GA5/qtLbfVbTmD7R6fReDTJ2pPIo18P/ebeu5+8OHV2p+0azEZ+fJC2JSZg9rkCCO7IxPQ8/R9ObgmWflPtakebNGmWq3JjaJCLra2svJXdbJDkn7nsmRPxL1KL0cvA/wK5P7Xt3C3gCAOkAjDE4n2AqdSXgcV+gi0twT2KAUMlFCXduukZZuLUPx7LH1MRu3ZpvdBOFmKz3S5zMVK4mD3pyTAxfqjbEfeiRqmu2P0EK9X8LidXAi++y2uy/FBOvm91wJ7ANs9zNRd3a/jBUWTdqQUF8DokSBZOhfVCL39phliRlSENm0fB7LN9We+qlN8wAF3I27f0NOCIpe2DOSYqeJGA/CPjevVpCqrCcoK/Apqd2aRqCrecTGrsPgESwY2/Lt02RjuafCbNUP7TUq9rsVu7iQDANDm3j4epLhX0c0NGtBYr+NhrVhSpmKwf3GUKVfa+1BwrW10tlXHAkENejWKSh/Qt7JYOf6HEofGqbD8F1mV8x3m0R0Uip0OurGD+tUOmfNbJgHvAtaJKDenicvk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(4326008)(36756003)(66476007)(8936002)(38100700002)(6512007)(66574015)(8676002)(66556008)(83380400001)(508600001)(66946007)(54906003)(316002)(86362001)(110136005)(186003)(2906002)(6486002)(5660300002)(6666004)(31696002)(30864003)(2616005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEI1SlQweEZkZEVWOHZMYkJ0Ukd2ejlOMmpBWG5Kb3lYT0l5bmVlSVlQbG40?=
 =?utf-8?B?L2xTblFvTGtpN2h5M1VjM0gvN1c1Umd1SEFQR3FFVGo5YUIxbmJzYml6eGtr?=
 =?utf-8?B?V09HdG9WWnVTQ043amRNRTZXRG5oVVJwL0pJMjVEZjh6Rkd4c1J1MFgvZnh5?=
 =?utf-8?B?dnVNWDQrbnpNSlVlN3ZkcmxZT2dwVjM2Y1hPRU01MTFqalYxNnIrNlRiOUk1?=
 =?utf-8?B?T1JoRVZSTDZlN21IRVlVSXZKVGJsWE44dWFGZjNoTHpaUFN1akR3L2t6dU5W?=
 =?utf-8?B?MVdlNW5EWm1DMU0zTnJ4M1R3NlRWdkN5SXVYamIyNzVqYWVtdDNmVk1SM0RB?=
 =?utf-8?B?STQwVlhMZ1ovcjNWYnNHU0g5RERCQXZFRXUzV05lR2U4V3pmakNvQzVTMFBB?=
 =?utf-8?B?S2t6RksrRlMzNCtMaU9Yd1lCOE1PQWM2OXBjSkxISU5WU2dxNXBXMm43UkpJ?=
 =?utf-8?B?WStsNERMckwzd0t5OFl0MUhSYjFtU2VyTkl6UXJYUWRaKzVVUWtnYzZsVS96?=
 =?utf-8?B?dU1JVmRKQmZzVFFkcVNzU0tWeEFOVkxxZndqVm5KdG1KSy9sRlpNaDhuMUQ3?=
 =?utf-8?B?RW1sRW5od3h2SzMrQnJqSUVydGZOY1Y4aTlmaDEzdkpKeWhXamlKZzJRbmhD?=
 =?utf-8?B?b2haREs2MTB5M09Oa1lYdHZFckZIRU1BUmZpYXoxejZaREN1a1RaVVhoTHl0?=
 =?utf-8?B?WlR0d3ZVL0hRSnNLL3hGcUxjNEk3Mkd2dVlDZXBrUEdCUXlKUE92M1lENVRv?=
 =?utf-8?B?ZFlwczd6Yzh0T1hFRHoxMVVJSGdtSm8wZm0vTDRCc3BZWWptU1UzQkM4S2Ux?=
 =?utf-8?B?WUxmc05nbHlaUDdaMUdxVmNvUThsRnRoMVREdkEyRzVISGVKNTRmWk1sZStw?=
 =?utf-8?B?NUd1TElUM09VcHVCQjhVc3U0dFFhU2IxNU1IdkFFbENnQ3FFKzNRZlRpVFps?=
 =?utf-8?B?bXovd0pwVE1TVXhjTTg4ZTNwbWVVbVRHL1ZCWnk0c3Fxa25ud1dieDhocTZD?=
 =?utf-8?B?ZDNPS3BJbzFZemNyY0V5VXhVNUNjaXl0UGE2elBnT3hJZTI1Mk9hM0l2MG9R?=
 =?utf-8?B?L3c4dDlxT0tyc2EzT29MM0xWM044OTNLeEZsVG4vRGR1Y3JwL0MxdkpLbXN2?=
 =?utf-8?B?M2YvS0wybUN3T3R5QWxGMVZWZnV3Nk4vQXBpV3JQcjFuWTdlakF3eFEwQ0tr?=
 =?utf-8?B?Y2Q5TE1IWTNvOHhuMnJuTVZJVEttM3Nqb3hDTElCRVRhSFh0ZGdnazZEbjJu?=
 =?utf-8?B?K01uSHVqVnhlN3JTcW9jb1NjbUR2Z0Y5VlozKzduaEY3aGorUE9nSEMyZDVH?=
 =?utf-8?B?aEFnSkppdW16SVZ3VTFZMk4wRHV5S1lpaE5Ic1lrTnlxOTFzcXQvNVA5VkJM?=
 =?utf-8?B?THlIRUhxZHZDTUVhY1JQZTRJTWwrdUFNbEtZWGhPNEVnOER3Wm9xMGkxL0lD?=
 =?utf-8?B?cng3Q0VvalB2VTdGeWJCd1NYN0tPaDVUQ1o4ZjNMS1hqSk8zU2JBU0RDbVZq?=
 =?utf-8?B?cllLK1Q2T2ppMVVNRXk0VlBRWVlXcytTQjNDZHZrQmU2UGw3ZjU4YlZUTFhT?=
 =?utf-8?B?VDYwZGhNR1h1RkdzUmNKUUxqaFRUbXB4M2IwM2dzZ3hYc3dlbm0rZnZvN1J6?=
 =?utf-8?B?Wi9SZHVpbFpWNEZkUFBPWVd1S1RMaXE3SGpDb3R6YXNReGJVNXV6OGNCaXZU?=
 =?utf-8?B?RWRIRDNHMHl4ajlQK21sa3ZQaGxkSG5kY0svTHg3TzlKa3VWZldDWWVkUi9w?=
 =?utf-8?B?dGxRZFVRWnUwUzdjZGpTS2UvWlgrbVJnNFNtS2ppZm52SnB3dWh2TGt3V05G?=
 =?utf-8?B?N1dzMHRhS2ZwdzEwNzFtZFoxWXpVR0VGQ1V0Tmw1a1BBemwxSC9HVWhCNGN6?=
 =?utf-8?B?QzdxRk4rRWQ0S3ZZZ092dVV3Q1c4ODlsdFNBM3RrUWY1Z3E0ZldCd1dpYXFP?=
 =?utf-8?B?U0VCS2V3Y2xjNFB6NXpKZ01aVlFpbUlLV2ErTVBmNGJ2SnVjV1AvUHJJQU84?=
 =?utf-8?B?YWFibkJIUWNubnA3VHB6ZU5UUytCU2x3VldTWEljQ29uYnlUby9VbThVTHh6?=
 =?utf-8?B?R2ZWNHNoUHY4VHpZR1c4VHBWUEdCMGx0K3hwUHNsbE1ndjNzTkw1MCtDNCt4?=
 =?utf-8?B?L0JjSDAwOE41WnpXUldTRGljNGNYaTZBYldEbTRXUk5TYkJWYXJSUUlidlBD?=
 =?utf-8?Q?jbwZAx5MuTsu9O5f4M00Sno=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e2616f-6a0a-48ec-6f6e-08d9bfb9b2d6
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 10:57:34.1727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 26OSXp7GDHag6TajExZBAtWdpFYfpp79JZ55ZBC/nbZ2QRpOJtCcqSfnyte4Xby5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4345
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Monk Liu <Monk.Liu@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.12.21 um 07:35 schrieb Huang Rui:
> The job embedded fence donesn't initialize the flags at
> dma_fence_init(). Then we will go a wrong way in
> amdgpu_fence_get_timeline_name callback and trigger a null pointer panic
> once we enabled the trace event here. So introduce new amdgpu_fence
> object to indicate the job embedded fence.
>
> [  156.131790] BUG: kernel NULL pointer dereference, address: 00000000000002a0
> [  156.131804] #PF: supervisor read access in kernel mode
> [  156.131811] #PF: error_code(0x0000) - not-present page
> [  156.131817] PGD 0 P4D 0
> [  156.131824] Oops: 0000 [#1] PREEMPT SMP PTI
> [  156.131832] CPU: 6 PID: 1404 Comm: sdma0 Tainted: G           OE     5.16.0-rc1-custom #1
> [  156.131842] Hardware name: Gigabyte Technology Co., Ltd. Z170XP-SLI/Z170XP-SLI-CF, BIOS F20 11/04/2016
> [  156.131848] RIP: 0010:strlen+0x0/0x20
> [  156.131859] Code: 89 c0 c3 0f 1f 80 00 00 00 00 48 01 fe eb 0f 0f b6 07 38 d0 74 10 48 83 c7 01 84 c0 74 05 48 39 f7 75 ec 31 c0 c3 48 89 f8 c3 <80> 3f 00 74 10 48 89 f8 48 83 c0 01 80 38 00 75 f7 48 29 f8 c3 31
> [  156.131872] RSP: 0018:ffff9bd0018dbcf8 EFLAGS: 00010206
> [  156.131880] RAX: 00000000000002a0 RBX: ffff8d0305ef01b0 RCX: 000000000000000b
> [  156.131888] RDX: ffff8d03772ab924 RSI: ffff8d0305ef01b0 RDI: 00000000000002a0
> [  156.131895] RBP: ffff9bd0018dbd60 R08: ffff8d03002094d0 R09: 0000000000000000
> [  156.131901] R10: 000000000000005e R11: 0000000000000065 R12: ffff8d03002094d0
> [  156.131907] R13: 000000000000001f R14: 0000000000070018 R15: 0000000000000007
> [  156.131914] FS:  0000000000000000(0000) GS:ffff8d062ed80000(0000) knlGS:0000000000000000
> [  156.131923] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  156.131929] CR2: 00000000000002a0 CR3: 000000001120a005 CR4: 00000000003706e0
> [  156.131937] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  156.131942] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [  156.131949] Call Trace:
> [  156.131953]  <TASK>
> [  156.131957]  ? trace_event_raw_event_dma_fence+0xcc/0x200
> [  156.131973]  ? ring_buffer_unlock_commit+0x23/0x130
> [  156.131982]  dma_fence_init+0x92/0xb0
> [  156.131993]  amdgpu_fence_emit+0x10d/0x2b0 [amdgpu]
> [  156.132302]  amdgpu_ib_schedule+0x2f9/0x580 [amdgpu]
> [  156.132586]  amdgpu_job_run+0xed/0x220 [amdgpu]
>
> Signed-off-by: Huang Rui <ray.huang@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>
> V1 -> V2: add another amdgpu_fence_ops which is for job-embedded fence.
> V2 -> V3: use amdgpu_fence_driver_clear_job_fences abstract the job fence
> clearing operation.
>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  11 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 126 ++++++++++++++-------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |   4 +-
>   3 files changed, 90 insertions(+), 51 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 5625f7736e37..fecf7a09e5a2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4456,7 +4456,7 @@ int amdgpu_device_mode1_reset(struct amdgpu_device *adev)
>   int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
>   				 struct amdgpu_reset_context *reset_context)
>   {
> -	int i, j, r = 0;
> +	int i, r = 0;
>   	struct amdgpu_job *job = NULL;
>   	bool need_full_reset =
>   		test_bit(AMDGPU_NEED_FULL_RESET, &reset_context->flags);
> @@ -4478,15 +4478,8 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
>   
>   		/*clear job fence from fence drv to avoid force_completion
>   		 *leave NULL and vm flush fence in fence drv */
> -		for (j = 0; j <= ring->fence_drv.num_fences_mask; j++) {
> -			struct dma_fence *old, **ptr;
> +		amdgpu_fence_driver_clear_job_fences(ring);
>   
> -			ptr = &ring->fence_drv.fences[j];
> -			old = rcu_dereference_protected(*ptr, 1);
> -			if (old && test_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &old->flags)) {
> -				RCU_INIT_POINTER(*ptr, NULL);
> -			}
> -		}
>   		/* after all hw jobs are reset, hw fence is meaningless, so force_completion */
>   		amdgpu_fence_driver_force_completion(ring);
>   	}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 3b7e86ea7167..db41d16838b9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -77,11 +77,13 @@ void amdgpu_fence_slab_fini(void)
>    * Cast helper
>    */
>   static const struct dma_fence_ops amdgpu_fence_ops;
> +static const struct dma_fence_ops amdgpu_job_fence_ops;
>   static inline struct amdgpu_fence *to_amdgpu_fence(struct dma_fence *f)
>   {
>   	struct amdgpu_fence *__f = container_of(f, struct amdgpu_fence, base);
>   
> -	if (__f->base.ops == &amdgpu_fence_ops)
> +	if (__f->base.ops == &amdgpu_fence_ops ||
> +	    __f->base.ops == &amdgpu_job_fence_ops)
>   		return __f;
>   
>   	return NULL;
> @@ -158,19 +160,18 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f, struct amd
>   	}
>   
>   	seq = ++ring->fence_drv.sync_seq;
> -	if (job != NULL && job->job_run_counter) {
> +	if (job && job->job_run_counter) {
>   		/* reinit seq for resubmitted jobs */
>   		fence->seqno = seq;
>   	} else {
> -		dma_fence_init(fence, &amdgpu_fence_ops,
> -				&ring->fence_drv.lock,
> -				adev->fence_context + ring->idx,
> -				seq);
> -	}
> -
> -	if (job != NULL) {
> -		/* mark this fence has a parent job */
> -		set_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &fence->flags);
> +		if (job)
> +			dma_fence_init(fence, &amdgpu_job_fence_ops,
> +				       &ring->fence_drv.lock,
> +				       adev->fence_context + ring->idx, seq);
> +		else
> +			dma_fence_init(fence, &amdgpu_fence_ops,
> +				       &ring->fence_drv.lock,
> +				       adev->fence_context + ring->idx, seq);
>   	}
>   
>   	amdgpu_ring_emit_fence(ring, ring->fence_drv.gpu_addr,
> @@ -620,6 +621,25 @@ void amdgpu_fence_driver_hw_init(struct amdgpu_device *adev)
>   	}
>   }
>   
> +/**
> + * amdgpu_fence_clear_job_fences - clear job embedded fences of ring
> + *
> + * @ring: fence of the ring to be cleared
> + *
> + */
> +void amdgpu_fence_driver_clear_job_fences(struct amdgpu_ring *ring)
> +{
> +	int i;
> +	struct dma_fence *old, **ptr;
> +
> +	for (i = 0; i <= ring->fence_drv.num_fences_mask; i++) {
> +		ptr = &ring->fence_drv.fences[i];
> +		old = rcu_dereference_protected(*ptr, 1);
> +		if (old && old->ops == &amdgpu_job_fence_ops)
> +			RCU_INIT_POINTER(*ptr, NULL);
> +	}
> +}
> +
>   /**
>    * amdgpu_fence_driver_force_completion - force signal latest fence of ring
>    *
> @@ -643,16 +663,14 @@ static const char *amdgpu_fence_get_driver_name(struct dma_fence *fence)
>   
>   static const char *amdgpu_fence_get_timeline_name(struct dma_fence *f)
>   {
> -	struct amdgpu_ring *ring;
> +	return (const char *)to_amdgpu_fence(f)->ring->name;
> +}
>   
> -	if (test_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &f->flags)) {
> -		struct amdgpu_job *job = container_of(f, struct amdgpu_job, hw_fence);
> +static const char *amdgpu_job_fence_get_timeline_name(struct dma_fence *f)
> +{
> +	struct amdgpu_job *job = container_of(f, struct amdgpu_job, hw_fence);
>   
> -		ring = to_amdgpu_ring(job->base.sched);
> -	} else {
> -		ring = to_amdgpu_fence(f)->ring;
> -	}
> -	return (const char *)ring->name;
> +	return (const char *)to_amdgpu_ring(job->base.sched)->name;
>   }
>   
>   /**
> @@ -665,18 +683,25 @@ static const char *amdgpu_fence_get_timeline_name(struct dma_fence *f)
>    */
>   static bool amdgpu_fence_enable_signaling(struct dma_fence *f)
>   {
> -	struct amdgpu_ring *ring;
> +	if (!timer_pending(&to_amdgpu_fence(f)->ring->fence_drv.fallback_timer))
> +		amdgpu_fence_schedule_fallback(to_amdgpu_fence(f)->ring);
>   
> -	if (test_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &f->flags)) {
> -		struct amdgpu_job *job = container_of(f, struct amdgpu_job, hw_fence);
> +	return true;
> +}
>   
> -		ring = to_amdgpu_ring(job->base.sched);
> -	} else {
> -		ring = to_amdgpu_fence(f)->ring;
> -	}
> +/**
> + * amdgpu_job_fence_enable_signaling - enable signalling on job fence
> + * @f: fence
> + *
> + * This is the simliar function with amdgpu_fence_enable_signaling above, it
> + * only handles the job embedded fence.
> + */
> +static bool amdgpu_job_fence_enable_signaling(struct dma_fence *f)
> +{
> +	struct amdgpu_job *job = container_of(f, struct amdgpu_job, hw_fence);
>   
> -	if (!timer_pending(&ring->fence_drv.fallback_timer))
> -		amdgpu_fence_schedule_fallback(ring);
> +	if (!timer_pending(&to_amdgpu_ring(job->base.sched)->fence_drv.fallback_timer))
> +		amdgpu_fence_schedule_fallback(to_amdgpu_ring(job->base.sched));
>   
>   	return true;
>   }
> @@ -692,19 +717,23 @@ static void amdgpu_fence_free(struct rcu_head *rcu)
>   {
>   	struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
>   
> -	if (test_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &f->flags)) {
> -	/* free job if fence has a parent job */
> -		struct amdgpu_job *job;
> -
> -		job = container_of(f, struct amdgpu_job, hw_fence);
> -		kfree(job);
> -	} else {
>   	/* free fence_slab if it's separated fence*/
> -		struct amdgpu_fence *fence;
> +	kmem_cache_free(amdgpu_fence_slab, to_amdgpu_fence(f));
> +}
>   
> -		fence = to_amdgpu_fence(f);
> -		kmem_cache_free(amdgpu_fence_slab, fence);
> -	}
> +/**
> + * amdgpu_job_fence_free - free up the job with embedded fence
> + *
> + * @rcu: RCU callback head
> + *
> + * Free up the job with embedded fence after the RCU grace period.
> + */
> +static void amdgpu_job_fence_free(struct rcu_head *rcu)
> +{
> +	struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
> +
> +	/* free job if fence has a parent job */
> +	kfree(container_of(f, struct amdgpu_job, hw_fence));
>   }
>   
>   /**
> @@ -720,6 +749,19 @@ static void amdgpu_fence_release(struct dma_fence *f)
>   	call_rcu(&f->rcu, amdgpu_fence_free);
>   }
>   
> +/**
> + * amdgpu_job_fence_release - callback that job embedded fence can be freed
> + *
> + * @f: fence
> + *
> + * This is the simliar function with amdgpu_fence_release above, it
> + * only handles the job embedded fence.
> + */
> +static void amdgpu_job_fence_release(struct dma_fence *f)
> +{
> +	call_rcu(&f->rcu, amdgpu_job_fence_free);
> +}
> +
>   static const struct dma_fence_ops amdgpu_fence_ops = {
>   	.get_driver_name = amdgpu_fence_get_driver_name,
>   	.get_timeline_name = amdgpu_fence_get_timeline_name,
> @@ -727,6 +769,12 @@ static const struct dma_fence_ops amdgpu_fence_ops = {
>   	.release = amdgpu_fence_release,
>   };
>   
> +static const struct dma_fence_ops amdgpu_job_fence_ops = {
> +	.get_driver_name = amdgpu_fence_get_driver_name,
> +	.get_timeline_name = amdgpu_job_fence_get_timeline_name,
> +	.enable_signaling = amdgpu_job_fence_enable_signaling,
> +	.release = amdgpu_job_fence_release,
> +};
>   
>   /*
>    * Fence debugfs
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> index 4d380e79752c..fae7d185ad0d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> @@ -53,9 +53,6 @@ enum amdgpu_ring_priority_level {
>   #define AMDGPU_FENCE_FLAG_INT           (1 << 1)
>   #define AMDGPU_FENCE_FLAG_TC_WB_ONLY    (1 << 2)
>   
> -/* fence flag bit to indicate the face is embedded in job*/
> -#define AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT		(DMA_FENCE_FLAG_USER_BITS + 1)
> -
>   #define to_amdgpu_ring(s) container_of((s), struct amdgpu_ring, sched)
>   
>   #define AMDGPU_IB_POOL_SIZE	(1024 * 1024)
> @@ -114,6 +111,7 @@ struct amdgpu_fence_driver {
>   	struct dma_fence		**fences;
>   };
>   
> +void amdgpu_fence_driver_clear_job_fences(struct amdgpu_ring *ring);
>   void amdgpu_fence_driver_force_completion(struct amdgpu_ring *ring);
>   
>   int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,

