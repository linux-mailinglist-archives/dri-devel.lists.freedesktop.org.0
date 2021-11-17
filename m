Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 748A74541D1
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 08:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3901D6E912;
	Wed, 17 Nov 2021 07:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA846E912
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 07:27:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hU+/w8rMMg2/k6m6liSSam6eHgEO856r50X0Pkntr7MAVyjtvrv+7zMFr+rh2aT+qUrLP5e9wY6MKLrILr4gHfbLJJ3Xp/6udk3l66bn+Rm40a9+b0Hha4FSaipH4O10j1tTSZe9PRrYOrHuDRuxVaXHJvvPfWJpQT4dU+9lNMgR8sE28mql/r4gf/4Vu5iJFCWNqzvQXs6G02QLnkGfhGpp75/lPrTZbUNc5fbskCktkFzdq71Tn2UNU7izfgX99jept3oL92QxXx6XUNvY8Ov2CQy2LZh2CMFuaoXVJ7dMqtHcZyfKu1eHWmoF8DqkgW/I5FfiETyJ2S/n/8TQcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTkelNhqh22+gg73K3EvpHonwyepi9Oz+AhA6vaGCgQ=;
 b=JnGXG1kmq1BKi+bnfpjj10AVud/d3DDaPyykHelroBXLYPM8TAmFs0U9xcNyiBjTfLrvY3pkRp0bANmWUPOlIJ3HsPDR+y0jnruCK58SPacfuopmUHR35hAQvjziv2+3yvx+wQ5m491bvhjKhUwkojR5nxBXaegFeKFr3ZgNtO8bCPERmGH/Lz5G1JNazeR9PczCFnW9MU1wSStpmiiuudNs3GgJohVRHISliSBnmItkSTeyrUnMH9bs8gYurnuH4S2pwp5LtTEu064eLCEhZg5PvVTQguyeqlVimAhXBh1+NcJvT9QBoNdYVNGCK2fF3SKIM2S4F/Qpo60CM5ezHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTkelNhqh22+gg73K3EvpHonwyepi9Oz+AhA6vaGCgQ=;
 b=jwSV6hhJsXP5WEclce5U9FhwEDQfaVH4f8dRBpZVgXhPH9Xp6Jb81GvRVqoWIwAN/vkju8rr9m068CT9dNr5+VsO7ZnYGTVCjId/8TI8B9VxFtOs8EFV6ZsqEw0BNkAc/R+4CvKZnmiW7APp/h7jO3/NVF54IzQ1QVOMwLIf6ks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4442.namprd12.prod.outlook.com
 (2603:10b6:303:55::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.20; Wed, 17 Nov
 2021 07:27:08 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 07:27:08 +0000
Subject: Re: [PATCH] drm/scheduler: fix
 drm_sched_job_add_implicit_dependencies harder
To: Amit Pundir <amit.pundir@linaro.org>, Rob Clark <robdclark@gmail.com>
References: <20211116155545.473311-1-robdclark@gmail.com>
 <CAMi1Hd0qzu1t6QeZCNgSoTrScZL0_XQnZUPkQ5y7D+oV49GREw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c7741be3-43ec-307b-f5bd-3d19725df76c@amd.com>
Date: Wed, 17 Nov 2021 08:27:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <CAMi1Hd0qzu1t6QeZCNgSoTrScZL0_XQnZUPkQ5y7D+oV49GREw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6P194CA0074.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::15) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:f3bc:62c7:d104:fb77]
 (2a02:908:1252:fb60:f3bc:62c7:d104:fb77) by
 AM6P194CA0074.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Wed, 17 Nov 2021 07:27:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e50c0e7-0310-48e7-369d-08d9a99ba954
X-MS-TrafficTypeDiagnostic: MW3PR12MB4442:
X-Microsoft-Antispam-PRVS: <MW3PR12MB44425982DC180FF9F090BA58839A9@MW3PR12MB4442.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R0iE5HxHgvN/nwVJ8dZ+vvoW90z2xB3aHvgMkjyzamDWXCTncXvLm8KRIkAkDjGsoA53Q1tpPeKhE2BojN/Qv/OIlrlxmAJc4bdYbmgv5ietf1ANHDBpnpvmGsP0d3dFqERawNdymfBwjJO7vvCvroT0CtcmH6y18Vnk+y875eJIfVMKfI++zT0u2/z1iACkSmFupnxX/IgNlMmyYFZ2ZpYG4QPt8YbcP9OGLMXzKuBmLXJsAL9c8aTQ+xnp0R8j9gCjjBXDLHXQW1wYFrJ5BQo4vKX6nCwZibuluL4Y65Iq+HpJrI7JGbw86CEjJYSkVK3cQ75OKdvOw4wCHFMZ2FAgMRT1WBg+v470zFe09ivVaHbeEq8hxWnHVZ5UoYWrhlP8dSW+dDrK97KZKVRdWtXtvDSOqNtiM8WMei6AIaUKKtPcIpwi0ocb2vKDmQ4pJ2bl2vGfOMXmaoFB1tsuBSqNKWx8SZPxj+gTtO69UG9RW1ewCmsn0CY+68sszNE5ELUJFYlNPvGwuOnahphvwD6ZJq+u7SlxBP/Q75YHgP+xovvV9625Unpo9sfdEMzWxT2jeLEOHHWxVpd0RF3ay5EV7YE+tXAuUOJimqaWhYYogc7Q0f14wcQnG0Pzg7Arnf0afmQOh8HYFsrxpOLxfSZwp04jxZzAEhVuRCL/SgfdqlNnBSZEg9LffsTVqriqT00uxk1BtxZYW8dzmpxpG0GxfYp+Lus0HRGlQ7iTxApW+P4iZhnF/xHrTHTSwuxU8Y3IHDA061oU8BpyexFWxNjKttAu8VnjIwuyPlJK09E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(66556008)(31696002)(83380400001)(66476007)(110136005)(316002)(66946007)(2616005)(8936002)(54906003)(4326008)(8676002)(186003)(6666004)(6486002)(86362001)(5660300002)(36756003)(31686004)(2906002)(508600001)(34023003)(148693002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWk2Tk9yR3N3bm9rQjRxbTlMTlM3NC94anY2YUJCUUdtZ1RacXJISWdlN1VB?=
 =?utf-8?B?cXgyV1ovZWkwWkRrZGMvanZGSEhHUlVzak9QTFBxZThWK3F4djhFdEt5NDNq?=
 =?utf-8?B?VlVLQkJMTExPUkQ5TzJIU1hna3Y2U1RDUzFzbjNacGNRekpyWEdpK3IvMDdE?=
 =?utf-8?B?OFFobm1OOVJERGlmeHgrREVrUXJRaFd0ZDNSbGpVeDlvV0pySWg1T01KTU1J?=
 =?utf-8?B?NkZxdndrNG9PUG94NEpUWTdUd0FUZXk5ZG9jMlk1RGMxTGVBQkhsS1AxcnZW?=
 =?utf-8?B?S0cxTDVUU2VGN0trZzBtS0UxUjZmQkNwdnJKRGY4bkgxcWtNZCtUZk9GZTZs?=
 =?utf-8?B?d0V4SkpUOU85enhWUnB0QVA4eWpNVFA5R1lBTjhQelVIMC9hL1FzY2tKZ2F3?=
 =?utf-8?B?SlM2dlNwL2lTcFZkNmZMZzlCZFJkNjlwYVIremlmbFNIVmNIdjV0dWptSFVo?=
 =?utf-8?B?SlBRQXR6Umx1dE14b1k1NVFYWUtRS3p6WjQwQ2Q2aUNGSXI3cVRQUXlITUpL?=
 =?utf-8?B?VWR6Z05kNWVmcnlreEg0T3hnSGlrUVp0S085d2RYUVBBRmZ4azVKaXhpWVNZ?=
 =?utf-8?B?ZFU0U3VkMDlpSyszNllYZ20wa2oxZ1dCSHFQVHpkTEljN1F5a0o5amRZbTd5?=
 =?utf-8?B?MGdaMUxLWFVtVlVMQXQwM01rOGNrT3EydWRPNnptSkJmWjlKekJmTEIycmNu?=
 =?utf-8?B?RFB1NnZaNmJLbUgyaDJ3bCtqd2tON2lkT1drKzV0UDNEQmxFREJGS3VqQmRr?=
 =?utf-8?B?UG5Hb1NuSVRORksrdHJBQ296TmpLMUFRcnRySDh3K2RFa0tjbzRBZlVINTJi?=
 =?utf-8?B?UjBsYVIxNFlTdTZlYlpHSlZZSWczSkxwVmViK3BDR0lSeXNyVXdva0Jwdk1Z?=
 =?utf-8?B?K000cDIyNCtkME1xQ0tTZjlMTENpV2xQczhYczk4Q2FHQ2pnWUN1cTBWWkM3?=
 =?utf-8?B?TGpkMk9KSkZLdHVTdXBiT0hQNGs4bWpzZmtCSFI1T25oTytwSXpSeEhYMjAz?=
 =?utf-8?B?V2x0SWRSL2Z1dFFyVlVpNllhLzdlOUhFUytBSy9vQWVRSkJkYkhvUjNiVnR6?=
 =?utf-8?B?OGFQekhCdWhyQ05tR2g0MUpuOVYzZ05lUGY5Y0pnZElMMDJ2anc0RmhWWWM2?=
 =?utf-8?B?R0Q1NUY3Vjk1NzArekEvY1J6ZGU1Tkp4Y3lzb3V5eTdrV1R5c0ZRM3pNWjFn?=
 =?utf-8?B?bHJ0K2ZNNlVFN2hTS01Yamp1MkxuWXFhNkltemhaNGZxcm1lcjlSU3BIV2RH?=
 =?utf-8?B?bFFlV2R0RFZtcEd0S2IySDYvTkdoU1o1bWRyNXM1TnhUT09kNzNJS1dyQjlx?=
 =?utf-8?B?dFZKV2dQNVU5N3g1MkhpNllpMEU2cndFSXBqSGRtNDllM3Q1QUlKL3lLVWxI?=
 =?utf-8?B?bWl1TFdHd1VVWnBpWXFYMXRCekx5aDVwRkdkc3AvM3o0K3RsU3JubkFJVllx?=
 =?utf-8?B?NzdDNVdGbHhMV0lReTVJK0pQUTlySHptTGZCbjAwa3BGTWZmRVJpNmhUZytJ?=
 =?utf-8?B?UzlkSlVVQWpnY2hXS3V1ZFNNOThFT1llNUI0M3ArSHlwaTRBTVhrem1pTjlD?=
 =?utf-8?B?MmdMSDNHT3MyYTE3RDZwLzNhUS9reCtLQUViYjU2Wnd5RXRPc2dDZ3JUQ0hN?=
 =?utf-8?B?U0M3NUFjWEI5YXAxa3BSWGdkcDArMUZZTVdiQWd0cnhkUVZ3ZkpRWmpTWUxS?=
 =?utf-8?B?NjhEaHhuUzRMYWxqS1J6Y25kMWo0N0Y4WGoyMGxEcy9vdUwyT0hJRy9hV21C?=
 =?utf-8?B?eDBxYVpoN3graHErbzNWN2ltN3ljcGdXWmlDb2VkbUJIZlMxZGQvYVZ5V1Jx?=
 =?utf-8?B?TUZZS3dZMmhrSEpFbjMxdjRBMTRxSURBUFJad0k1dDMzeFlBNFVwbzJGRS9B?=
 =?utf-8?B?U2svR1RtRmZvY3hKZnpyVjRlWGR3Z0V3NlR5YkJIZGVNWUQ3cmN4dFZ3TTBk?=
 =?utf-8?B?ZG1PamFBNys1YXhPMlFzbEMzOVhuYjBnQU9WWDFuUDJtVTE3b012MVVqdmI0?=
 =?utf-8?B?bDZNTE1ZcmhIN2J5Ri9uL29aY1VyOFo5RUFIdUxJZzNIT3dYWGVGbGpEdjR0?=
 =?utf-8?B?amU3b1pQS1M3Q0JnZ0Zid1FZTVM2M1VpVGtraXNNOWxLc3dZSnlwMG5MbVdp?=
 =?utf-8?B?U0plM2pCNDl1RmE3bnBwaFROL242WVVUT1ZNRkNDSitPZzYycjBOQklacTJT?=
 =?utf-8?Q?E4Y4AOv2Kp+Z3R2a0kplHEQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e50c0e7-0310-48e7-369d-08d9a99ba954
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 07:27:07.9587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WCGCtZwZanYenr3/oMfRZDnkRjZ3+x6GEgzwYGAYzN0d/OGvezkslBoDiT2FpvvN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4442
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.11.21 um 19:30 schrieb Amit Pundir:
> On Tue, 16 Nov 2021 at 21:21, Rob Clark <robdclark@gmail.com> wrote:
>> From: Rob Clark <robdclark@chromium.org>
>>
>> drm_sched_job_add_dependency() could drop the last ref, so we need to do
>> the dma_fence_get() first.
>>
> It fixed the splats I saw on RB5 (sm8250 | A650). Thanks.
>
> Tested-by: Amit Pundir <amit.pundir@linaro.org>

I've added my rb, pushed this with the original fix to drm-misc-fixes 
and cleaned up the obvious fallout between drm-misc-fixes and 
drm-misc-next in drm-tip.

Thanks for the help and sorry for the noise,
Christian.

>
>> Cc: Christian König <christian.koenig@amd.com>
>> Fixes: 9c2ba265352a drm/scheduler: ("use new iterator in drm_sched_job_add_implicit_dependencies v2")
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> ---
>> Applies on top of "drm/scheduler: fix drm_sched_job_add_implicit_dependencies"
>> but I don't think that has a stable commit sha yet.
>>
>>   drivers/gpu/drm/scheduler/sched_main.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 94fe51b3caa2..f91fb31ab7a7 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -704,12 +704,13 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>>          int ret;
>>
>>          dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
>> -               ret = drm_sched_job_add_dependency(job, fence);
>> -               if (ret)
>> -                       return ret;
>> -
>>                  /* Make sure to grab an additional ref on the added fence */
>>                  dma_fence_get(fence);
>> +               ret = drm_sched_job_add_dependency(job, fence);
>> +               if (ret) {
>> +                       dma_fence_put(fence);
>> +                       return ret;
>> +               }
>>          }
>>          return 0;
>>   }
>> --
>> 2.33.1
>>

