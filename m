Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8D8553AA2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 21:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5C610E287;
	Tue, 21 Jun 2022 19:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DFB10E234;
 Tue, 21 Jun 2022 19:34:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLdgAcUdQ+bR9FG4uJbKMoI2ncNw6yAUHfN4mTjjCT/dAYeQ7+cS+dg29Mmz4HBUUPCeuZ4OkMmMijHmL3d57QGNplsaIyX0ZstdbXlFeel1DCyi3hRwGEZe2IHbJiIpNm6WBUfJsIojwk6aX9sZMx9pyWvYSEhNYa5bSJ0/QfnaOztYcrlW9ZhAUewjyaUNyXImwE3wdxyBkpvY1sT65l5aquL/sB3/wNnYr+/NAx4MWa5/o5UXa5kQOEaL6snJIMEKOvuT4+rsqboTF5HRWZsFBzOrukoxnbLX7C6WqIA5GDgvCGhG8cgYoEFoBPJoGDut541tOTBNhzMQT9owcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpkYMCE0r1mYCd3Ye03mW3JiWXJa0Cjr393ws9oWinc=;
 b=jiag78L6jQGSdNtzXP4nav/nghR9vKRBDhAq3KNbmRBy1AtsKqJ/vQbFzDWOZiHcGib5xYq+YJN3y7d7rEOEqYPaJySMjr5JhnYFSLBDCu1ny/6jZ9sl0GwKoaF74cHRyKpE4YPVZwvOAgIjHtE361KlIlbrosJP68sSKMuTYB5fMTylup3ov0/Ygt+XvlQqUZLgb8vurXepNH2nKUQX5oqmCYlwO9PFsTb/+ym+x01Y2rNdygB/JJd1pXW4GRGiS9v81AXAKAJKtREa9DixUM67KIQ2t7PplJ1TTfXX0HzuDvY2OhZPfD6Hf1IcCNt8xxArO9CSoY5RES2bpW0rJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpkYMCE0r1mYCd3Ye03mW3JiWXJa0Cjr393ws9oWinc=;
 b=tcdK7w+zZWsBuHCZB2YnjqsPvXeuQJIJuRlcUMCFf1m07JgA5stKwH3UTtrIKqu40vphDv+oGPObc1Ziqkb8DGyjCOXM8mTtpTEMK6mrKLnXENI+W2BGY265jCZn4oHyGYYzJKUJ1h1Vygk2qQOxfKrcu7MeeIyENsqMI/d7ioo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by CY5PR12MB6456.namprd12.prod.outlook.com (2603:10b6:930:34::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Tue, 21 Jun
 2022 19:34:26 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91%9]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 19:34:26 +0000
Message-ID: <91aba934-32f0-b1b9-b882-979ca02a1920@amd.com>
Date: Tue, 21 Jun 2022 15:34:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/5] drm/amdgpu: Fix possible refcount leak for release of
 external_hw_fence
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
 <20220620220302.86389-2-andrey.grodzovsky@amd.com>
 <2c70d0c4-a326-6497-54b2-51bc2b93b9d6@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <2c70d0c4-a326-6497-54b2-51bc2b93b9d6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0102.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::21) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3deda8df-2f89-4490-3c74-08da53bd0d4f
X-MS-TrafficTypeDiagnostic: CY5PR12MB6456:EE_
X-Microsoft-Antispam-PRVS: <CY5PR12MB64562F5B1ED74B8413904C13EAB39@CY5PR12MB6456.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8v3Mc4/4DcZRy/44MbhhiJWO5qk6U4jpxCP/5V5fhDcKZq2Ccniw+0CBfbMkXipTsL5jn9A9M3s7mMCoj5JmvtOmdmjVDSn6VsgKPWWMOCZLoXHCdfk5FrXBz30ZWrrCZnjQ6BdeeWvGC17DF8Y/RtkOfHatuAxCWIP/Y3a+QjL8/OmBz+gSetqW1fkFhIbyYLQxoe4EpjgxSRNe3eKszJMyNzB0dBVeO7QDrNESxsw4uqS1nJxVvBjfV32S979ADHT9+av8OBmGwy2KXJhYwVQ3OoKbCDw86CE74dZ+IgodYSYFNO1Dimt2YBego7illnlr4McOYTnhvFvv5QIrWM+QEEXPf7NVyIaSkpvK2AVzCvnV0RN9x/t2q9hIwU5X5sdLOiXz/4uQ+X0jHEe4pkjB8uwnhnj8mqjA0SNNBBDIfe4+7mTjxP5Yjl2u4NswqYq77WTMHpjRR+DBnBdujvFOYHt6E9A62Mtxr1ahkB+3Je9nwntms8tKNuTG5Fsv1/Syx6AzmN9HQhCFPqsVmvkvqez9eKWiw3Q2v7pnyOQ8+hBKeFKcpaQ4DQ545VbxdFHDbK1L2GLRQLUTZ2OvyHiRMYgP1XfiUQFeyEjDmDJIrTqA60uH5SEo8yLMJI2fMXj3JGG/G1WaG92vZI0GiBjudyQTvLNklEl5qRnYseDRBHtMiYFIx2wT1scDxhOBaXWB+iX8daMhpRlLbJL1WniWWnrrguNUEqBB5ByIOhQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(6506007)(6512007)(44832011)(8936002)(5660300002)(478600001)(6486002)(53546011)(83380400001)(41300700001)(2906002)(316002)(2616005)(31696002)(38100700002)(86362001)(186003)(36756003)(31686004)(4326008)(66476007)(66556008)(8676002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFI0WUw5N1NpR096dnlMdjNZRVlPL3d0bXRLZ1JLVm5pSWhmeDV3VndVNzRk?=
 =?utf-8?B?bXlVZTBHa2U5TzVodmxibHVCR2R0aHVSQ0pqVVBRM3RNTVZraDlpOUJZUVJm?=
 =?utf-8?B?YWc4Z2hKL1JZZHkxc3gyQ1RGNFhYaS9pa3JzWnI3UUpqMlFhNm1GUXJWdHo3?=
 =?utf-8?B?SWJRK1NQeTJWZ3F4UlN3eEQyTmxkK2ozRW9hc1pSK3RYNENrTWYraU1TV01F?=
 =?utf-8?B?NCtCZnNpTDN4YUc1YThWU0xERkVTcEJRaGh3WnU2V1ZIYm93enMzT09SYjlq?=
 =?utf-8?B?UWN2YmE2ejJaOWxxSjlKK3JzUW1xdmdNZ1hxaWo2Qm5SbW9uRVNpS1lKODlr?=
 =?utf-8?B?cDhtS2hxenlLbVUzdFNmSTk2OFdKMmFhd1ViQXFDemRsL1Jvd0lGanFsTEZl?=
 =?utf-8?B?Wll2STRINmdLejExVkpRMWo4V21zTm1vbWl0bVo2TmkxY2tuRHdKK3hTNTZo?=
 =?utf-8?B?ZnBLbUYwOXZTSTJ1ZFZ5UElRS1c1YTRmb2RGb1lLeWlBNE5sQWpBWGlZZDJx?=
 =?utf-8?B?VDR4YnYvSVFHU0RNU2FTazlISDlLWlFiQnhQakdZdXhNRkJhUkd3NEZiVDBF?=
 =?utf-8?B?TTZYaXlDcGFzVDlhQXJveUI0NW03TGdCYzZYNVdpL1VFNVhFU3g2SzNFTzZh?=
 =?utf-8?B?NjJLYUpBRzkxeUVVQlZtUnQ1VWtGS1JFTVdLVmYwNjcwWWFZS28yeG0rWitX?=
 =?utf-8?B?Y3FTY0NsTDM0Tit1bys5OUMxWSs5RDlVQzRpZFM1TTBib2E3Zk1CZzN0dGJO?=
 =?utf-8?B?M2ZoamFaeGVkOVorb21CVkxuUzZoc1RlWnlRYVZja1hwOFd0a3Rhb0pUOHBo?=
 =?utf-8?B?YXNWVnE0bklOMEhrSENZMzNEQUFKaXMxY3lPQXpnWnI1THF4THdGZUt1MmU4?=
 =?utf-8?B?MVVWN0lLV0lCcDY2b0w0elM4MzN0M0lQZHpKdXk5SzBXWjRnekRvamJqc1I4?=
 =?utf-8?B?SFFFVjNTRDg0blpHK3JXTGZIRWpuNkJ3LzJFR2FJWW5uM1R0blEzVVhmN3Vq?=
 =?utf-8?B?YlRPRDExeVpuSkFlZit1OUt1a3V3TmRUYklhUzIvci9MNHZkRmpJUGIyNFpy?=
 =?utf-8?B?aHlFMExlSXpSSEw4SmVvV0QvREpKM244bWhGTXEySXl3MXllNE4rbWN5c2hI?=
 =?utf-8?B?bUxXYWRkY0Q3Q2FBZldSa1N1VnRGYU5wR2I5dmh6ZEN2cWN0OSs1b1BhZWZH?=
 =?utf-8?B?dEM1K0hvb0JRQnVocUFML3VRWUNjNWQ3NlBZSDkvSXhVcTZTM3FWdnpGNVJx?=
 =?utf-8?B?aEFQdWw3elRzOXJBSDJ3aitwZlY1VVE5S295Vk1UV3dsRHN3VTA3azFUeVZ3?=
 =?utf-8?B?ZmR2YWc1STlsTFo0cWVZaXFIU1ZjSXBkTEorRGRaYWZEdmZoNVBHeTB6M1dh?=
 =?utf-8?B?OGkxVXBqdlBmUTcwZVlxNTVoTkVDVDhVOW1nL1dqdUM0K0k4YXNZcjU5ZkU0?=
 =?utf-8?B?VjJhZ1o3bys2RUFwZjI0NVhJSnFReHNkTVZ4Wi83eXdpc01wd0txMGtvR2cr?=
 =?utf-8?B?TXBtREdpOGUxb29mbVpsazVoWkJkK0NJRVRVSWk2aXduOW41NWlQNlhMVnFh?=
 =?utf-8?B?b1RWYVFxcDlGMy83WmZmRHlYd1pYMm1iNG5EdnBkcHlJTkMwTVUzSW9mT29y?=
 =?utf-8?B?ZmtjRUFsR2NnZHFVaFF3aWVzVlROZGpOcDJjM2RRaU5NK01neGI5TzROOVQ1?=
 =?utf-8?B?NVFpVDd4YlRIb0RUTm5WUVFrNnMrOHlVcFQyTERlVUlnK3dhQjgzdXkwazRp?=
 =?utf-8?B?SlR1cTdjM09MYlRoNElZS0NUekZ3VDZjMkpHRVVja2FHRzU3bVlEWnFEdGlF?=
 =?utf-8?B?Z2FQTlRwS05yN3dYRHRiTVk2b3hDYTdNbVJzc3N3WFE3b2tUcFB6b1NGZTBo?=
 =?utf-8?B?UmFvbm9xZ04xNEczK1hFUnNRR251WjFQb240c09lSlM5aHc1VkwwR0ZkWnB4?=
 =?utf-8?B?UW80NGtrWnFGNTZoV1ZUbExFcVhRQ0ZMVkVJQkt6SVUvNXRvL0NDbFFmVFdv?=
 =?utf-8?B?bW00M3Z1MWk5M0lkNC9uNWVNRmVROHN0SnNIOVhZLy83czIvTTZ6QzlncHdn?=
 =?utf-8?B?REk2K2loUHZGOHB3MWRnREx2NFpWeFFCZkcrUE9rQTNoVzlSeE5zemZGRjVo?=
 =?utf-8?B?VjhiMDZTa2loOUZXN0c1dklrc2l5c25rb0lzMkM2bG9Jb2tFcFVpV2FzcVVv?=
 =?utf-8?B?SHFucHRFVFo4ZWtXS0tpZVVYc2VIdmFKTmhnYnAxUUpiWjk0NHVuaWNJUkE2?=
 =?utf-8?B?cUdDTW9YOVlKMFZXTmZZczFiTlBuVnlQcW5qRTRsWlNiRklzUHFTUmtYYmRX?=
 =?utf-8?B?L2ZQRnM5Tmk5SmRTWFc3N3lmMUdxa2NxSzdFSTFDTHhxYktycEdobUt5WVdm?=
 =?utf-8?Q?Ywz1oMAbAiNXwr7dy763V3yGsWWbLLcpeF+dj0nAWM51i?=
X-MS-Exchange-AntiSpam-MessageData-1: ncWO9TQBAGld9Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3deda8df-2f89-4490-3c74-08da53bd0d4f
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 19:34:26.5442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bc7Bwv2+XE3mSE04pjeZb+XZoQwmakiVqTuifzUvvesPPnyccTHZV4hDWscpSFO0S8WwMFgbIZ1h7V1BRiTQ3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6456
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
Cc: jingwen.chen2@amd.com, Christian.Koenig@amd.com, monk.liu@amd.com,
 yiqing.yao@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-06-21 03:19, Christian König wrote:

> Am 21.06.22 um 00:02 schrieb Andrey Grodzovsky:
>> Problem:
>> In amdgpu_job_submit_direct - The refcount should drop by 2
>> but it drops only by 1.
>>
>> amdgpu_ib_sched->emit -> refcount 1 from first fence init
>> dma_fence_get -> refcount 2
>> dme_fence_put -> refcount 1
>>
>> Fix:
>> Add put for external_hw_fence in amdgpu_job_free/free_cb
>
> Well what is the external_hw_fence good for in this construct?


As far as I understand for direct submissions you don't want to pass a job
pointer to ib_schedule and so u can't use the embedded fence for this case.

Andrey


>
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> index 10aa073600d4..58568fdde2d0 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> @@ -152,8 +152,10 @@ static void amdgpu_job_free_cb(struct 
>> drm_sched_job *s_job)
>>       /* only put the hw fence if has embedded fence */
>>       if (job->hw_fence.ops != NULL)
>>           dma_fence_put(&job->hw_fence);
>> -    else
>> +    else {
>
> When one side of the if uses {} the other side should use {} as well, 
> e.g. use } else { here.
>
> Christian.
>
>> + dma_fence_put(job->external_hw_fence);
>>           kfree(job);
>> +    }
>>   }
>>     void amdgpu_job_free(struct amdgpu_job *job)
>> @@ -165,8 +167,10 @@ void amdgpu_job_free(struct amdgpu_job *job)
>>       /* only put the hw fence if has embedded fence */
>>       if (job->hw_fence.ops != NULL)
>>           dma_fence_put(&job->hw_fence);
>> -    else
>> +    else {
>> +        dma_fence_put(job->external_hw_fence);
>>           kfree(job);
>> +    }
>>   }
>>     int amdgpu_job_submit(struct amdgpu_job *job, struct 
>> drm_sched_entity *entity,
>
