Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED7E5AD43B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 15:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B735810E354;
	Mon,  5 Sep 2022 13:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2083.outbound.protection.outlook.com [40.107.101.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065B510E354
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 13:46:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=byr+4kUrDvpPezNMRwar3Vo+W+MlZ/M549VPOrYVx/PnlbLJF7i8yJIEoVKzm0kXwHmZ1Nq7jCHaDJTJ9oQLt/kibaMoQ/lYtZ01VXIOSjKkgt6ypsapR4rTnnaBauCBfpy8tvJCoqDfDXQr5rJA7M/MZNXDde8bNrP0nrqTwsHDGNjpxoA/lBDcDJbEt/8oBQsmcF0Ry1WmDk/EciiferOb6M9sR0t0O1raDC6pYh8IyOAiQaz8bRWbWhoX5aSLINGCQLDNkkteQUFGihMFA8fCabw4t4MOGvqi8eiSz3f+BaqyPkf1VC3RCmbdJ1E3RBkFuja9dk2qwpn3rqrGpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcPplKUDEjgINzdCtUs89a9QyZXpiG00bMXBwbd+XpI=;
 b=Sd9Bz+JLSYa1O9d3Efcl7qIGHqXtvRPSi2WX8Euo1cvApM618z5VMCfKMHGJmDVew0M5Ot3GY9973UF8lH7lTm9TA7UQbYlKwKQG6PYIgNOD13l2oKaAESpSc3kbOAUhkWyBF5snZhdy+yJylI5ISF3dNeuhY0D8lOv/bOKxMt4qVapIZUstYhGwCH1KbNjRHdXXhh0lyhvNIhhffIgnW40F47t9l+kYfxcPz7jT84eh143ZWiw3PDYN5pe+PJmzOuLF6NfPKoWai5ODvYQtSJbB7nl7DuBsxbB5j251lPIiYzI45vUO29v0htQQClt10WxlRkKPKCrEI0mSiB/Xow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcPplKUDEjgINzdCtUs89a9QyZXpiG00bMXBwbd+XpI=;
 b=v62AZ6Pe5LLh8jzELQNAMDRTRe7Bpf23tuhTlMOp8xaeg04dPXqma1sBupioqiR6NOfRu8yU/v/evEaZ9buSRv92LlSD6HKvMNSlb4+J5bOHV7hzxAOOugACWV7N18ZC18RksoPyiu01tknH9KU9EyVANlAD092BdtUu6PFpGOQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by DM6PR12MB4076.namprd12.prod.outlook.com (2603:10b6:5:213::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 13:46:32 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::2e8f:6161:3959:aa0c]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::2e8f:6161:3959:aa0c%5]) with mapi id 15.20.5588.015; Mon, 5 Sep 2022
 13:46:32 +0000
Message-ID: <5b84f7c1-99a6-02c8-2606-8986891a95b0@amd.com>
Date: Mon, 5 Sep 2022 19:16:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 2/4] drm/sched: Add callback and enable signaling on debug
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220905105653.13670-1-Arvind.Yadav@amd.com>
 <20220905105653.13670-3-Arvind.Yadav@amd.com>
 <96d14c8a-e3de-fcea-b3b1-434bc6a78ae4@amd.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <96d14c8a-e3de-fcea-b3b1-434bc6a78ae4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0124.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::12) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30e2f401-affd-410f-12cb-08da8f450a69
X-MS-TrafficTypeDiagnostic: DM6PR12MB4076:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NSjuUShio2ILT0zk62TYe5TONYQt77Hk/ZHETT28HMIdp9+QpriKb00M5PvrBMPLldT5l1mosvUOB/thkBQvzMp2BmSkz9WXwJbvClyTjrDRdoyreBYw1d3SRhsN8hN/7ey9adgONo8CThHIDH6HRzToTziEur826EbIbKN5eG8hfQ5Ydnv2t6z2/UrOwVLkHx5CtNANoUtEknM4OFjYRxMCUPAYotyGLOZ3thIao3kXf0nszupgRy9L1w97rlScRckJAWl9vNCpUzYid/fGXF8OCVugpHZNqU7rAO2XkGSAC6nes7CSg02HR1iHtK+Y2gDM90l+wailTQRcTjeGcRao3j6up/vfh35+63hMD1oGaEIGJsH1y4SyyKRzgIC3BbakXrPV0kDnt+wvD7oqxlrdNMsit2DkTbRFmSsDj+3VFIcRPRmq/4it6lPAOz6GdYDJKQQR6tC3rpUGpISGnhT/ptznJ5KGqW8/m4Mq02LL5FwhtUbAyr52C29/ssLOHcziFSuaWhqBbvVVfbquX8GFb8GICPBmi0frbi3C3hiOQ0b0WtUVEC863UDqO1TzDWyuuoTVx3Jg2ICbzC9kuj8hQz/ajFgWEky0WHM3F4DVG+wOW6cDNVgyxnthsDMdvFXalsRjN4iKNrtEZMY1AwnlDyYYSq/Gi/xdbOTTx6OgM8Suf3ya3gX4t/rYX3AOvYonejNkcfSGheWGQbjqPymZZG8EZG4u/fEiMa8vpEl3qZUOVjodis5DYRliGG4M3tOfuBT3miQzDzAqH3sThspfgqlYdFqw2NJy45WitXLdSSE43EzaBAKD2O+XKkkj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(8676002)(83380400001)(66476007)(66574015)(66946007)(8936002)(66556008)(5660300002)(6506007)(478600001)(26005)(53546011)(6486002)(6666004)(41300700001)(186003)(2616005)(6512007)(316002)(110136005)(31696002)(36756003)(31686004)(921005)(38100700002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW5Pb0xGZndnTlRrYjJuQVpWZjI0TzJtN0M0RVhSamo3dWNnUnhuaW9HSElm?=
 =?utf-8?B?S3IvMXpxbHd2ZjNMaDJ1ZjVESUd4SDB2SFpmSGlDY3R6amtlcXBWK2JqaWhY?=
 =?utf-8?B?VVhwOXpWeEZuRk9NRkRNcTUycXRHcEUyd3Q4VFdLR2g3NEp4ck5pazJQR3BL?=
 =?utf-8?B?RHB0VXBBZmlwaWFBS1RRbzdHREI1RXJja1pZWFhWdkNJOSszZUJYZyttTFpv?=
 =?utf-8?B?aVZUWW1nRmNEUmxONnVyWndRNWJKZ21uSDZkS3JxNi9Hc3dCcmd2RVJ3VWli?=
 =?utf-8?B?OXlDVWNieGNSVmxyalJveUN0K3ZGOVVMSU5vdHRBaXR0cmdLSFYwd25KZFpK?=
 =?utf-8?B?YVRuTW9Dam9keSt1VDhFNVdlcmNYYVl4UjRaZk4xbjJIR0JnaVByMjJQZS95?=
 =?utf-8?B?YlVoQVlLQS8wbkNvaHZxZWg1SzVVWHJmOHhLUUtuTER3ZzJ0ZktFTDhPMzgz?=
 =?utf-8?B?Q0ZqOUZqWWMxbllkQ2tZS3BYa28xb1NGVTB1T0xxQXBqeW9YSEJiODRSMFlL?=
 =?utf-8?B?UVlqalptdnFNM1d4b0NHYURrOVg4emxzZlYzMWRlVzd4NzcydjY5eW5aR2Jk?=
 =?utf-8?B?Y3VLOHMzcXAycTNtRjVtVFlNcWdjU1d2bnBVdlNRRVlDQmRHcGZqSDZHU2Zy?=
 =?utf-8?B?WHNIVk1tNkhYZDZrdkdyTlloYjR3YkRTTnI0bERtQzJ6VnphZ0MwKzBGb1E3?=
 =?utf-8?B?dCtCcDFFelFzRWR1UUJScFlXNkVVelBUYjE5bGJmQ3ZKTnhlK2RFZWdpM1dG?=
 =?utf-8?B?azB3RXJyeXE3ak01ek1zU05wcVFaT0h4MllNWHNaK2Z2V1dWMlhGdjh4QXhy?=
 =?utf-8?B?bnlhMU9xSm9lZjc5TTRFcWJqeG5ab2dQT2o4bjYyZDBFNnNtU0xNcU9OeUNJ?=
 =?utf-8?B?ZU1PNVBYc2FCRE51Q3BSU3QzdDNsMFNubC9zZzNWQUVuU3V4VlhjME5CTk5a?=
 =?utf-8?B?RTR6ZnpuWFZ6Rmo3SlJpMk1qZk5Wb3B3cUE5QVQwdVJLYXFOeHM3bkJieDQv?=
 =?utf-8?B?dzRLYm9VdmUxTjV5REppb3ZzZHhLL1pRangyeDF3dmRGZm8rdllYNUlnS3Zv?=
 =?utf-8?B?bzBFdzJrbTc0clNhRDU3TStEbXQrTzh4bE5xeEZxOE9PUzZsc3U1ekVROEwy?=
 =?utf-8?B?VVVaY0Q3RFJGOGozOElJSFcyL25LK1lweEFSb3lhZDNBczh4MlA5UnRpRDFq?=
 =?utf-8?B?MTdKSnhybGN6Z2w2cmowc1FpNmZocVRTand1QjNnZVFZSlhIS0RzRi82MGpL?=
 =?utf-8?B?TEZ1WGFrdVQ1M0lITEUyTWNiYW5WY2tVbXQzOXlVYWt1aVRSS3RjL3c2V2s3?=
 =?utf-8?B?ZEE1TFhma1ZvTS8wblA0U04vWEhjdDQrR2J4bEhmVFZ4cE9aejhVdkVURjdV?=
 =?utf-8?B?eGp4YTBIVWxwUUVKQXZJdHZZNG90YU5GSUdudzVyNWxLNmMzRnUyandaVlI1?=
 =?utf-8?B?RWxGeCsyKy9pYlZGY3J6cEdJd3E4cDZrV1IvMVVRRk1iUWRnMnJmSnNDTUFy?=
 =?utf-8?B?dnl2TzAreFgvUzNBNmFXN2hRM1BWYlcvekpzZ3hXR1d1TjNlZEhMeE1lS0M5?=
 =?utf-8?B?V1lsWWVibDVnTVRFYkpoUVlYRjFxak1WSzRVd1hpeW1XUkJwU0lYUTVWV0t5?=
 =?utf-8?B?OXF4WWVVcENGZWZIbUlnbm1mR2xnSzhPT1g5T1JnVnBtQWhrbi93dndSUS9q?=
 =?utf-8?B?TVk2amJkM1dFUDFsTWUzQS8ra0U4OUJXbXB4S0lFTHBlSjZ0aXpGM003NmZ5?=
 =?utf-8?B?bHNKa0RveG5sVEdzSG1ZeU5rL2hZRVdqdXZpSG1BQXZkY0VoQzNTbHdjVzd2?=
 =?utf-8?B?UkJvYVBNdFFTcjZmYUJUNmlnSWxTcEg1Y1Q1NmJBUDQ0cDB5aWN0RVEwdGI1?=
 =?utf-8?B?QWZlUUkzZ1Bmb2lwTVVVQmJYNWgwdWc5WVNFaGhOdXBYL0phL0xsS2I0Tng1?=
 =?utf-8?B?ZUNwTVZMNUtCTXFyM2NhRk1YRU9veFhLM0tNV0JmYXNjWnJmR20vaUpCazhB?=
 =?utf-8?B?SXc3VkhTaHVhQ2oxeVhoSHROUGw0RWtsTmxBb2h1c0VIbWdiUTBTZm91WU5w?=
 =?utf-8?B?Y2NMbzUwdWNHeVdjUUFpek41THlWUlgxRnJHcUJTYm1PQ2pxRlJjelVSalB5?=
 =?utf-8?Q?wVCcWDhTMAtnTpHTmI3o9NNpF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e2f401-affd-410f-12cb-08da8f450a69
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 13:46:31.9538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A3stqcI/vNP/B/x10L2HyNZgjzxXFXVYChKj7Nz3AUMqiCwXA9DuSZ1SjbNqQ5sILuIzU+tQhCQ/1pw2Cc1mJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4076
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


On 9/5/2022 4:55 PM, Christian König wrote:
>
>
> Am 05.09.22 um 12:56 schrieb Arvind Yadav:
>> Here's on debug adding an enable_signaling callback for finished
>> fences and enabling software signaling for finished fence.
>>
>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_fence.c | 12 ++++++++++++
>>   drivers/gpu/drm/scheduler/sched_main.c  |  4 +++-
>>   2 files changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c 
>> b/drivers/gpu/drm/scheduler/sched_fence.c
>> index 7fd869520ef2..ebd26cdb79a0 100644
>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>> @@ -122,16 +122,28 @@ static void 
>> drm_sched_fence_release_finished(struct dma_fence *f)
>>         dma_fence_put(&fence->scheduled);
>>   }
>> +#ifdef CONFIG_DEBUG_FS
>> +static bool drm_sched_enable_signaling(struct dma_fence *f)
>> +{
>> +    return true;
>> +}
>> +#endif
>>     static const struct dma_fence_ops drm_sched_fence_ops_scheduled = {
>>       .get_driver_name = drm_sched_fence_get_driver_name,
>>       .get_timeline_name = drm_sched_fence_get_timeline_name,
>> +#ifdef CONFIG_DEBUG_FS
>> +    .enable_signaling = drm_sched_enable_signaling,
>> +#endif
>>       .release = drm_sched_fence_release_scheduled,
>>   };
>>     static const struct dma_fence_ops drm_sched_fence_ops_finished = {
>>       .get_driver_name = drm_sched_fence_get_driver_name,
>>       .get_timeline_name = drm_sched_fence_get_timeline_name,
>> +#ifdef CONFIG_DEBUG_FS
>> +    .enable_signaling = drm_sched_enable_signaling,
>> +#endif
>
> Adding the callback should not be necessary.
sure, I will remove this change.
>
>>       .release = drm_sched_fence_release_finished,
>>   };
>>   diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index e0ab14e0fb6b..140e3d8646e2 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -961,7 +961,9 @@ static int drm_sched_main(void *param)
>>               s_fence->parent = dma_fence_get(fence);
>>               /* Drop for original kref_init of the fence */
>>               dma_fence_put(fence);
>
> Uff, not related to your patch but that looks wrong to me. The 
> reference can only be dropped after the call to dma_fence_add_callback().
>
Shall I take care with this patch or I will submit separate one ?
>> -
>> +#ifdef CONFIG_DEBUG_FS
>> + dma_fence_enable_sw_signaling(&s_fence->finished);
>> +#endif
>
> This should always be called, independent of the config options set.
>
> Christian.

sure, I will remove the Config check.

~arvind

>
>>               r = dma_fence_add_callback(fence, &sched_job->cb,
>>                              drm_sched_job_done_cb);
>>               if (r == -ENOENT)
>
