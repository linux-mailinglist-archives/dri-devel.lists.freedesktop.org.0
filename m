Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C925B40BA
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 22:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A796410EE43;
	Fri,  9 Sep 2022 20:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E56F10EE43
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 20:31:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DuMf1QipLUoRLwdHSjENxCrjcmbn/XBjxl9O53GZTk2BUyRacnG955SI/BWWDSOrru3nGgnAG6gjVU5yuFAwn35uuyDYQ2yYvttYtrpMQBjS2h3zk1+h3L32PKMxI1PjFEJx2FYbhguD6zaYjOCf4CuQ2KmiMIEp6e1+c4R+y0wLY0C7BycSY9nqLpKnh9qsX1A4F7gowIN7nPAThFnHHX5EJOJun/VU+U3KMZ4ZFeXGkab/QsWvQtExlbNSrannZhvarl7rTpUC3xdQajrrzpGtq6JJA9NsuvmUjcA8edCh4YQq4SImbPuo/gFC1dQKv/8hA4PnuTwE3FoVjqL7vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MN7HxcVYGzgmHDNlw/HKW7hxcKSMULlKBDyZFllRvJo=;
 b=fRWCjCm+/+gnKk4mVccHhQ3BvF0M1q/zRkDmWZ1X3D2fpTH8709f2S0w38/Gtppj8+73F8wG5e0hneHSXh7oOn7d2HcfEGhu+HHOFcp/2A7IkvjfhrOOsH+fVABALaq78irdkfcBEhkTIKd/ae/ogHMx3zZU53+h2dF00XOD20M4H8IosYDx2esE/Fadr9hWTrOlcTDvQPLgR1eCfp2us7C/mIGQhzsi58qyxdfB6GvwBzjpT674B9jLVGcvyd+EoQp+5o21Z6TEJS9uPdqvfh4LMQeVIcgwEN5MZJNw2OLU7+CRz11EfihokPWtD1QDrbTZooUeRSj9rYp2dQmwVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MN7HxcVYGzgmHDNlw/HKW7hxcKSMULlKBDyZFllRvJo=;
 b=MsVIyxUIkHs4VuyaTKhfVnC5F1t8CkzMlfVpsJJFHZ8OHUJzsW1sM7OA6OGI4iBjxpsXUgwNrANk4k1azmrSCIS+3u/zp7rSgh6yCvKUyy7rxHUenVHJswMuVnwL7Or16oZFt0YalRb9rPG08UAqQhgN7tMY2d+exrcPyO1Lekk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by SA1PR12MB6726.namprd12.prod.outlook.com (2603:10b6:806:255::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Fri, 9 Sep
 2022 20:31:07 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::19c9:3fb4:80b9:cd4d]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::19c9:3fb4:80b9:cd4d%5]) with mapi id 15.20.5612.019; Fri, 9 Sep 2022
 20:31:07 +0000
Message-ID: <b0b81d03-840d-bcf2-3593-5fc0079f1e6a@amd.com>
Date: Sat, 10 Sep 2022 02:00:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 5/6] drm/sched: Use parent fence instead of finished
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, Christian.Koenig@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220909170845.4946-1-Arvind.Yadav@amd.com>
 <20220909170845.4946-6-Arvind.Yadav@amd.com>
 <2937dc45-0b62-7c71-b846-942fa91cbb4e@amd.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <2937dc45-0b62-7c71-b846-942fa91cbb4e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::23) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_|SA1PR12MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: ec168d43-f41f-4e05-651d-08da92a23952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oDsWkSVdSwz5H+ublCff3P01zIXfyFyUkUi+FccE319DaqIJxd9ZaMb0rbP5PIg87HSPaAm1fBgFXbffQdwRV+EnxFIxLCBq8mjSaazhNghR6ley5vmJ4U+20qlS5fIUcAGncElaxlwjAyRs1261bsAUT2+2cbToWIY4Zpir6OIz+sK8zU8RFrlzdrE0VS2UPJioglmuGPoHe3ag7UIbVxJFIi8FLxEa7J/jXosDjlAIRdLuEPGQyvmyuiFooehVzqF1y2DVnPuIl8HfQDwT9H5VQKH4k/1jr5yd3TVku2m34mGEUtbk/U4HgR+DWt4hgZZqitfFM+uRDEFO9jVE+fXqR4R8Y53PxLE8TrQgci9K002d1jcBPDn6Paey+RVxdls7bin8EKa4yPeK99/aCG484L/kuAB8QBLH2vIDUOHxxYMyJsmZ6Mp7CJ2bGzRkUuqxdb3UAXjeMl9rK2od7OPlIculBpCvY1Y+UBmiDfc1VNwzREWRZckhilPYwsAlda5h15xtrl7JavM5gIYqojV8r/8Qmn7dSaf+/iDIDNSdzeOuosYeJxUdt0H7Zrn4zDFXF30HTiNe9eKhmBPeVYaAPLM8mnhpOMljAq4IwHBO7eER2x+nMpErMrFPy8HX3qxm4zFFzlU9Bsw9Pc4ScTvxq/GxcVS051hO1ZdgJAomzI6cnt8VpOEISu5a2KzGlM5y3OrC5OTzi2XCTu3XhcbFrX7+saew6Myq2EvQMwwiYj5rw/a7K1+/in7R+VDEtCuojPo5yeHQF258+B503utzBPZ0XsSJ+pH2ccO2PjS8pQ91iiCopE9uJd3m19GA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(8676002)(36756003)(55236004)(38100700002)(6666004)(41300700001)(53546011)(6486002)(6506007)(921005)(110136005)(316002)(478600001)(8936002)(2906002)(31686004)(31696002)(2616005)(5660300002)(83380400001)(66556008)(66476007)(6512007)(26005)(66946007)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUZoOWo5U3hhYUhjdEUrc3k1R2NCZWRWUUg5ZlBVZjh2d2t4R1BKOWhkcWpI?=
 =?utf-8?B?OVk4d0I2TnEvL0gzSmQyRmtZbENKdzRwMmFIQ2NnS2thMjh3aDNrcENRL29l?=
 =?utf-8?B?STB2OWpkV2hLdXpadm5lN2xmTTJIbTVPVzdacVZZY1VrYWdnMVFTdTFSUWNB?=
 =?utf-8?B?M0V2UE1CMHBoTWx2WFp3aWJIcVU4ZFRzaTM5WHp5K0M5VWFYS0k2Q0RjUy8x?=
 =?utf-8?B?Vm1RTmRQWmNBN09oaGgyQ0Nyd3UvVDNSZm1lbExCYmptRlJ0WDR2ZDVTelFS?=
 =?utf-8?B?SC81dCtoU1htNTA5RHVydmxhM2x5b3QvTHZUMm9yZUdpWUNoTUo4UmlqWjNy?=
 =?utf-8?B?N3UxR0czdnU3dnpuaFJTeVlvRjd2L1Q5QmRJMVQ3M2RZUzhKd1BkWTZRYnpQ?=
 =?utf-8?B?RTUwZWZvVTA5Q0VDRGp2WXJmR2toK05DQ2pXZXNmaXFFbHZBV0RWMEpFRWhX?=
 =?utf-8?B?Wkl3aFVYRmFXQmVZQmtoYjVRTXlOT29aMDgzSUI3Z2dpVjRXWEZFZXMvVWJY?=
 =?utf-8?B?N1plOGZqb0tQdG51ZjhtSFY3SFhVUEdmSVh6dFVLNTlOS0dVbytiNnJkc2Rq?=
 =?utf-8?B?OGR4T2J2NEJqZG1OZlhVRXZLQU1WekFpd0lpTHVHdlY2dTBkdmZmSWtHeTlu?=
 =?utf-8?B?VXoyOVNHbnFoTnptTCtQQkwwQlJQaGxYdWRGS253K0dxT25Qd0p5czRyZ1lF?=
 =?utf-8?B?NWExYXd5RkEyV0VINDR6S1cwY2lFcUtJWC9ONkVZMHlYZ1JBR1ladTVkaE5J?=
 =?utf-8?B?RytuY2xSMkh0R3ZWc0NycXBHNVdVNWRGSVIwdytNbzdZSFpEcUVET0d5V0FQ?=
 =?utf-8?B?bFVMQUljbzM3cEhDeUJYWU5YRFFyM00xSDZXQTNrbFNSVWRWdW03MGkyUGJK?=
 =?utf-8?B?dmhYaXBlRDI5dFRlVFl2L0gwaU9kMC84ZzlhS1dkVnM0ZGxnNTZZbUFpTnUz?=
 =?utf-8?B?eDAwZXhVdTZBWlJQMTl4VmNmcmxzRE5WbSt4NERPSWozVG8rV015Rk9HQUNE?=
 =?utf-8?B?V1JKVG5tdkM0VWlDVGR3dVhERUZtL2JRSHNkdE1DaDRmTTloZXBFZTZBM0cr?=
 =?utf-8?B?QkdVVGZXY243YlBGN0V5WWEwR1k5MEhsd1BmaEt5bWpxQzVCYkxVRVZDZXlp?=
 =?utf-8?B?bkRPV2VCbVJTZ3ZBRWE4blRYMHVsUnlsY2UxRlluNGhHOW9QV0NSMzdMdmJN?=
 =?utf-8?B?NkRZc1dmd1dqRHFXRGJMaldRa0lRTFJtNWFKWUd5d2c1di9yeTF6TVY0bXZi?=
 =?utf-8?B?Y0FkTFprSEppOFR3QWtvcGJMM1ppOHhTN1ZpdUV1dmh1RXVDcUtnVmxJTVpz?=
 =?utf-8?B?L2Z2ZmIwcis0VVJwR2l4di9hL01EYnhuUmhrb0Fmb0MzNjhBSjFxVTdTRHdU?=
 =?utf-8?B?NHV2cHJqN3NhRmNCQnlkdXlzdVZFMDVJb0NzY0w0M3paUlRObE5Wc3BWRHhx?=
 =?utf-8?B?L2dxWGo2aEdnOXNDQzlIOUFsWFlhaXp5R3NmOHFWbmZpQ05QeFRBbUc0Y1F1?=
 =?utf-8?B?Rk1panRveFFpMGxmdVRvNk1ERnZHQ3Jub2h4NnhNRXhYQ2RDZCs2djRBSWha?=
 =?utf-8?B?bHZtQ091dys4Uk1RVXZ4SlZyNzBQSEU5WEc3QjFkYTFQa3grd0J2VUdBelg4?=
 =?utf-8?B?R0pHRW1icm82eGlLcEJFQXpsZ0xxYS9MakR4TEtkQjZ4Q09ENFFEMDFpNUJQ?=
 =?utf-8?B?QTd1MExYWnZ2QmF5SkNTTUVLWkpBZ3J6YlJicWdpclhtSm9DUzk1MjBEcHhn?=
 =?utf-8?B?SWNpTDdFNzVPbUpzNjJxeXlaVjVoNkRBaFNtd00xSDV2OGJxTU9FNjVzdHFU?=
 =?utf-8?B?ckFKNlpMbWExZUdKeEZUR0UrU0wzVm1UN1dJVkVBSjRvYXpoZi9QQVFzSUhX?=
 =?utf-8?B?eGtYWDQ4YUg3WEs4RjlsN0pKNlh3UitORUNIQTg4cmJ1VjNKWGJrUGt1NXJo?=
 =?utf-8?B?MVR6anYyMlBjeWd1bXc5SHlDcVdya2lsTWlqT2hzTVZvNkFUcGlpZEt0L1N4?=
 =?utf-8?B?R3RHMUVscGVBTU5qVW1ZT2xkYzRTNHA4VVpCRENtL0ZnMC8yeVRQRW9Ic2xv?=
 =?utf-8?B?eXVobEVPV0U3Vm9vdzNJL2g5SEVmZGdRbE9iSFIzbTl0b1RIV1IxbjUwQ2lk?=
 =?utf-8?Q?hLsjjrOzQu8EwnUTlnRPtXBVk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec168d43-f41f-4e05-651d-08da92a23952
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 20:31:07.4322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UXD373CwCM7gG8yKQnN5EGDHMCE/gCCYsZMAwBvuU3SVmestcOBuNFNpOGbLkAJEKuFnQKk0NEKr/eI6Rx4KMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6726
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


On 9/9/2022 11:02 PM, Andrey Grodzovsky wrote:
> What exactly is the scenario which this patch fixes in more detail 
> please  ?
>
GPU reset issue started after adding [PATCH 6/6].

Root cause -> In drm_sched_get_cleanup_job(), We use the finished fence 
status bit to check the job status dma_fence_is_signaled(). If a job is 
signaled (DMA_FENCE_FLAG_SIGNALED_BIT is set), then we cancel the reset 
worker thread.

After applying [patch 6] now we are checking enable signaling in 
dma_fence_is_signaled() by checking DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT 
bit. but signaling is not enabled for the finished fence. As a result, 
dma_fence_is_signaled() always returns false, and 
drm_sched_get_cleanup_job() will not cancel the reset worker thread, 
resulting in the GPU reset.

To Fix the above issue  Christian suggested that we can use 
parent(hardware) fence instead of finished fence because signaling 
enabled by the calling of dma_fence_add_callback() for parent fence. As 
a result, dma_fence_is_signaled() will return the correct fence status 
and reset worker thread can be cancelled in drm_sched_get_cleanup_job().

~arvind

> Andrey
>
> On 2022-09-09 13:08, Arvind Yadav wrote:
>> Using the parent fence instead of the finished fence
>> to get the job status. This change is to avoid GPU
>> scheduler timeout error which can cause GPU reset.
>>
>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>> ---
>>
>> changes in v1,v2 - Enable signaling for finished fence in sche_main()
>> is removed
>>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index e0ab14e0fb6b..2ac28ad11432 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -829,7 +829,7 @@ drm_sched_get_cleanup_job(struct 
>> drm_gpu_scheduler *sched)
>>       job = list_first_entry_or_null(&sched->pending_list,
>>                          struct drm_sched_job, list);
>>   -    if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>> +    if (job && dma_fence_is_signaled(job->s_fence->parent)) {
>>           /* remove job from pending_list */
>>           list_del_init(&job->list);
>>   @@ -841,7 +841,7 @@ drm_sched_get_cleanup_job(struct 
>> drm_gpu_scheduler *sched)
>>             if (next) {
>>               next->s_fence->scheduled.timestamp =
>> -                job->s_fence->finished.timestamp;
>> +                job->s_fence->parent->timestamp;
>>               /* start TO timer for next job */
>>               drm_sched_start_timeout(sched);
>>           }
