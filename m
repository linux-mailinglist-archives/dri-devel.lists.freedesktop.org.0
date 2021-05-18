Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3659387F46
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 20:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017CA6EC5F;
	Tue, 18 May 2021 18:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9576EC5F;
 Tue, 18 May 2021 18:09:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXw7PnMA6JMjVDYRfuWbAxuCTtu4LsR+ctAwRXaDs2VJ1SNuDN+ZUWnCFjgRJkh2tjhw8EX+P3oClHmcdqoKn+f1y+KruE3RoDyFZwYaRPCUS6Ccp4qSFrnhOfn1QPsRVp4Y6x+lGk9Gl2YP8BpGHrNNhuuHSjuI9a20u0CIzUcEDHLcYu2WhR/V/siCa8AyWxwgJjFNEZe9HbZDKaRqofESxIYy0h3FDM07ZSO83OR8dAqAsjrZEoOtFu0/9MFDu2DI3ZlXL4lVFCtuv2FA0S4x5eGgElW+p/upUmm7RfETLV5UVQqmZqW7q7/7mCpvE/lflFzbfgHBas90CSSnpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SeqsOr7rtH/FbOzddENAoy6cN5na1+quK27tr6onq0=;
 b=hajNbxaFejukHDEFNq1H9jRa1OlYnu70LChVc2lvRTIYp8BLgfiMDha4Yiq9MVeu1oYt89UM1TzYE7UJJPMFA5nCcfzeEYQuw3nSaffyhiJVup88dAPwPjpC4wDDmcHyH4/lEtQUKYJggYm8kFLFM3XWj8/8WRuGWeenqUYEZj4US3n9gYfprUHs3z0djZVlnebxC8oo5rQO9HUSwy5NSPXVGH6VDNhFJ0ciJP9cCC2quNMGW3ETlpgcZWusUHgVMaF2Q1aAprxvnUR4fLSVfreUvMXo5HB3JgU7y2b5aqium06H7KxIlJ5Ne7jqZZ5yt2Q/FhgD3Zitu4tcgmzyMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SeqsOr7rtH/FbOzddENAoy6cN5na1+quK27tr6onq0=;
 b=ZTbuTdyHuP5a8cp1IPA8bzI0y6TEsBVNc2wJ6dxznno1+xf4gYTEivhjKZIDWLVCO4NunJEAR99DFsWnjwJxpk1jfSVuNVpzqj3z/KMCLJgLE8k1cE9q+Rix7rCrCaGtqL/gPQnhZHWU98PdbX+VDayrXRmdQQTnkrdRMexUNDg=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4591.namprd12.prod.outlook.com (2603:10b6:806:9d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 18:09:53 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 18:09:53 +0000
Subject: Re: [PATCH v7 13/16] drm/scheduler: Fix hang when sched_entity
 released
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-14-andrey.grodzovsky@amd.com>
 <9e1270bf-ab62-5d76-b1de-e6cd49dc4841@amd.com>
 <f0c5dea7-af35-9ea5-028e-6286e57a469a@amd.com>
 <34d4e4a8-c577-dfe6-3190-28a5c63a2d23@amd.com>
 <da1f9706-d918-cff8-2807-25da0c01fcde@amd.com>
 <8228ea6b-4faf-bb7e-aaf4-8949932e869a@amd.com>
 <ec157a35-85fb-11e5-226a-c25d699102c6@amd.com>
 <53f281cc-e4c0-ea5d-9415-4413c85a6a16@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <0b49fc7b-ca0b-58c4-3f76-c4a5fab97bdc@amd.com>
Date: Tue, 18 May 2021 14:09:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <53f281cc-e4c0-ea5d-9415-4413c85a6a16@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:f8d5:c6ca:4eec:9024]
X-ClientProxiedBy: YT1PR01CA0111.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::20) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:f8d5:c6ca:4eec:9024]
 (2607:fea8:3edf:49b0:f8d5:c6ca:4eec:9024) by
 YT1PR01CA0111.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.30 via Frontend Transport; Tue, 18 May 2021 18:09:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1da4cd1e-53a9-484e-2621-08d91a28229f
X-MS-TrafficTypeDiagnostic: SA0PR12MB4591:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4591C85C49EF966BD8418810EA2C9@SA0PR12MB4591.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qq3spl8T4lfO9KMYd3w058H8cDea87zHTmUhKY2UzUB9LICwncBPGpQxAYcfiklO+pu6EYBqAebDD1O5URMbftpFD//8kY8v8sVY9BhpQpqr6gv6aMIEs40srR7mjDFqHCY5n+Ysc2pr6iLu0dL8pxnujBBhBKyuPcPXA8N/BzCGioZnsZWQ/aGs2u097W2Djt1H4g40t0jXdJw2qEJJYm72iOR5+k82WY08kEXkMa9wjM+xd0IlEO2Y4kqjgkYdPoNxp671EhIGLNRjEOqTbJtyCe0Xmw+pHDr3Oti3aNzk9rUF51d8bJViGVq6XwyBINnqqn5bhSxFWa8PuGIbBF0rUR2EDONuJCr6HOzI88dDi4LAt/Kg9CT1dbSZK4sht8RJ/wA8yaUrhtu+dCEX+jLQGYA+Xb2qYchoWGLf3ppSmbuRNGkTyRqTF4cWZ1zNHvgUovvzNIz0pRHx7t4AKM+Hl7bRCPcydZbhBu425L85QCbjDeNvnP4gs6sUv/HcYT2FG/wIy5bYfvQppgi1aDQ6Vx1JU63EBgM+fPcoMBD6UyFAjDscwbXormhwykSAZhcocZh9YzH19lExUthMcQRhbzT3qqxrPY12vatqU+2fMwtMz7U4CFFmPbNeGyKCCouj3l3c/nyecTN8hH7GK5HkspidbBQDiJnV7opkEpRNRBh27hzq4E2jjCP/OLOE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(66574015)(83380400001)(16526019)(478600001)(53546011)(86362001)(2906002)(5660300002)(66556008)(38100700002)(6486002)(66476007)(36756003)(52116002)(316002)(31696002)(6666004)(8936002)(8676002)(4326008)(6636002)(31686004)(2616005)(66946007)(44832011)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ajF5bHpqbjJmQXQxTzJJcnUyVUdRS2xwTk5TWGxzakdGTWlMbEQwVnhjMG8r?=
 =?utf-8?B?TW5VV3FUc0VnWjNDQ2lvZWJyQUtFclE1MnBYTnJEbTIrYTlZMVhrOEhOeVNN?=
 =?utf-8?B?RkdXSldpaVk0cDgyUUJGWTMxNlA5enB0VzZhei81VzJsWWdUNnlCaDdVWnMx?=
 =?utf-8?B?SXRuLzlEbzRuWEcyY1hXMS96cnV4VGs2SFJEaVp2Y3ovdXhoYVo4SHY1Mncx?=
 =?utf-8?B?N0ZTWVE2dlFWeE5hakN1VUtnWW5BbEUrd1pVNSs2dzlOajI2eVRQNS83RXJS?=
 =?utf-8?B?anpzMmtNVmtBcjZrZHliOVk4bHdtVm9rSVo2NkxVMW1KK05YK3NzQjNqUWMw?=
 =?utf-8?B?MzZJY3ZSMlppWldMUkx1ZXlXSUFBdE1zekhpL25WWjU0a01JL1FLKzBiaUpv?=
 =?utf-8?B?ZzJweFViWmpFS3dkZjZvbFc4NndIZUFUU3pmTGI1bVBUb2ptQ0Y5bEx0b3pF?=
 =?utf-8?B?aGlGUVpsUFQyM2FIcUdkcUNGREdCMTZhRE1pMW9YWStVMnBNTXhDbVVjN0p4?=
 =?utf-8?B?NE9JdFNYQXdxVWlGWllJczBQM25YSStxOW15TTBzODkxRS9IN1hnNEQ4SXdj?=
 =?utf-8?B?by9KTy9LaHVsMld6UzRNUnlqYytkeFR3Q21mQk5JcDZKeXJmRG9VWUNieExZ?=
 =?utf-8?B?OEJPWngxaVllUFBtdi8xUU1ST1VrMDdKcWZYalh6cndhc0d4V0FLRzQxMWYx?=
 =?utf-8?B?NGJNM05kZURDUEcwTlNCTElrV1U1SDNZZUU0YWFZT0VRMHh1UngvM2RVc0pj?=
 =?utf-8?B?cjY4S2xuVTVWN0c0Q09VU2Q1RFBweWZaMUM5eGVvd05xREJsVGFaRnQ0cE9n?=
 =?utf-8?B?aE9KWXdhQXB1cjdIL2xBS05QbTl2b1RWamVEc0UzMXBObGh6c1BackJsemRt?=
 =?utf-8?B?MmpXYklhL0pVbUdJMUdra1MxNGg2MWJqa3NjNHZpd2tsd0V4UkpoUzBpMkRv?=
 =?utf-8?B?OWpoblNCL2RDRThuQXFhd3JSbm11UFJERkpCVFNraTdudkpTY0dvVEFadmlW?=
 =?utf-8?B?TENRVmpxYkprVDJKRjRkSDFxa1QvM2kwSTNFK0kxcTNqN3I4a3h6TEY2WEIr?=
 =?utf-8?B?ZjlnNWxDL2RJOUxxWC9zam9XekFjR1hrUEFZd3k0Z1hocHl6Vng0cWpnMkNB?=
 =?utf-8?B?UVAzZFZ0NldmNlhXeU1OM05xZjJ4V3gyY0RUYjNDRUZha045UFFydWg4dTBD?=
 =?utf-8?B?MDBCb0tReWNCeW1UeWNDcWttRi9PVVB2MXU4enBQOEFEL21ZbDk5c1ZnZVZn?=
 =?utf-8?B?dVB1ai8rVlpSaUtlenZqUGt1dmQvdHlZcWxUdEp3a0swK3Zkbjd5WmZnYm5V?=
 =?utf-8?B?MHhiMHFRVFRwZGp3MGVCK1RFUmF2MkFFczNLaitWeWt4SWN3S0h4a1hFVmpB?=
 =?utf-8?B?d0pjRFVPSUZZM2dUWTBCMWFyNXlQa00wS1YzcHVncEVNL1RXNEdnaVFGRkZ3?=
 =?utf-8?B?dVVjd0FsR2p2b2x1cCs5WVpBOHZXNDNHemZDdW9ieisyWmhTaEhyZmZsdzF6?=
 =?utf-8?B?RjZOekFjTjgzRzcxd3FlbVlCN2E2bXd3dXhmQ0dOWFBjRWl6emNPMFZYdHdY?=
 =?utf-8?B?aHdncGYxSE9ZOGM5QlNHM1VzSVdhUHhzY2Jpa2lmRlZJRUk2bXVhSWFzWTdE?=
 =?utf-8?B?WTFOdi9KTTN2TUlsUFNVQnBIMXlPdW91QzdlOElwbDZ1elpzMk5WYUZkZ0pu?=
 =?utf-8?B?QVBBdlJPVXZFc0RidGptd3ZyQVZyQlpaYmloaXlySldjMlJWcmRWM3VyTjBy?=
 =?utf-8?B?cTNEVEE2UWRWNTQ5T2NEeStqRlJ0a1hJcmd4K3g2cG1PV3dxMUY1bzlZZUhj?=
 =?utf-8?B?TlI2TFBodGdSQkFrVnF0WFFnU2lJVUxvMTJnUHdFWk85RVpZOWNEU2tZN1U1?=
 =?utf-8?B?SFkzMXBLUkVqU2MyUG1CSVJXZWNQUnZmME1YTXFINURIeHc9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da4cd1e-53a9-484e-2621-08d91a28229f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 18:09:53.5273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JnEmyTCzc/WLLjhI40/AAuscjXF3ZRPY16P5uCAW4qr4S6SFzWSLwvrNH/bKsKwJbPd2v7alGO5WwElEF3rpYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4591
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-05-18 2:02 p.m., Christian König wrote:
> Am 18.05.21 um 19:43 schrieb Andrey Grodzovsky:
>> On 2021-05-18 12:33 p.m., Christian König wrote:
>>> Am 18.05.21 um 18:17 schrieb Andrey Grodzovsky:
>>>>
>>>>
>>>> On 2021-05-18 11:15 a.m., Christian König wrote:
>>>>> Am 18.05.21 um 17:03 schrieb Andrey Grodzovsky:
>>>>>>
>>>>>> On 2021-05-18 10:07 a.m., Christian König wrote:
>>>>>>> In a separate discussion with Daniel we once more iterated over 
>>>>>>> the dma_resv requirements and I came to the conclusion that this 
>>>>>>> approach here won't work reliable.
>>>>>>>
>>>>>>> The problem is as following:
>>>>>>> 1. device A schedules some rendering with into a buffer and 
>>>>>>> exports it as DMA-buf.
>>>>>>> 2. device B imports the DMA-buf and wants to consume the 
>>>>>>> rendering, for the the fence of device A is replaced with a new 
>>>>>>> operation.
>>>>>>> 3. device B is hot plugged and the new operation canceled/newer 
>>>>>>> scheduled.
>>>>>>>
>>>>>>> The problem is now that we can't do this since the operation of 
>>>>>>> device A is still running and by signaling our fences we run into 
>>>>>>> the problem of potential memory corruption.
>>>>
>>>> By signaling s_fence->finished of the canceled operation from the
>>>> removed device B we in fact cause memory corruption for the uncompleted
>>>> job still running on device A ? Because there is someone waiting to
>>>> read write from the imported buffer on device B and he only waits for
>>>> the s_fence->finished of device B we signaled
>>>> in drm_sched_entity_kill_jobs ?
>>>
>>> Exactly that, yes.
>>>
>>> In other words when you have a dependency chain like A->B->C then 
>>> memory management only waits for C before freeing up the memory for 
>>> example.
>>>
>>> When C now signaled because the device is hot-plugged before A or B 
>>> are finished they are essentially accessing freed up memory.
>>
>> But didn't C imported the BO form B or A in this case ? Why would he be
>> the one releasing that memory ? He would be just dropping his reference
>> to the BO, no ?
> 
> Well freeing the memory was just an example. The BO could also move back 
> to VRAM because of the dropped reference.
> 
>> Also in the general case,
>> drm_sched_entity_fini->drm_sched_entity_kill_jobs which is
>> the one who signals the 'C' fence with error code are as far
>> as I looked called from when the user of that BO is stopping
>> the usage anyway (e.g. drm_driver.postclose callback for when use
>> process closes his device file) who would then access and corrupt
>> the exported memory on device A where the job hasn't completed yet ?
> 
> Key point is that memory management only waits for the last added fence, 
> that is the design of the dma_resv object. How that happens is irrelevant.
> 
> Because of this we at least need to wait for all dependencies of the job 
> before signaling the fence, even if we cancel the job for some reason.
> 
> Christian.

Would this be the right way to do it ?

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
b/drivers/gpu/drm/scheduler/sched_entity.c
index 2e93e881b65f..10f784874b63 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -223,10 +223,14 @@ static void drm_sched_entity_kill_jobs(struct 
drm_sched_entity *entity)
  {
         struct drm_sched_job *job;
         int r;
+       struct dma_fence *f;

         while ((job = 
to_drm_sched_job(spsc_queue_pop(&entity->job_queue)))) {
                 struct drm_sched_fence *s_fence = job->s_fence;

+               while (f = sched->ops->dependency(sched_job, entity))
+                       dma_fence_wait(f);
+
                 drm_sched_fence_scheduled(s_fence);
                 dma_fence_set_error(&s_fence->finished, -ESRCH);

Andrey



> 
>>
>> Andrey
>>
>>>
>>> Christian.
>>>
>>>>
>>>> Andrey
>>>>
>>>>>>
>>>>>>
>>>>>> I am not sure this problem you describe above is related to this 
>>>>>> patch.
>>>>>
>>>>> Well it is kind of related.
>>>>>
>>>>>> Here we purely expand the criteria for when sched_entity is
>>>>>> considered idle in order to prevent a hang on device remove.
>>>>>
>>>>> And exactly that is problematic. See the jobs on the entity need to 
>>>>> cleanly wait for their dependencies before they can be completed.
>>>>>
>>>>> drm_sched_entity_kill_jobs() is also not handling that correctly at 
>>>>> the moment, we only wait for the last scheduled fence but not for 
>>>>> the dependencies of the job.
>>>>>
>>>>>> Were you addressing the patch from yesterday in which you commented
>>>>>> that you found a problem with how we finish fences ? It was
>>>>>> '[PATCH v7 12/16] drm/amdgpu: Fix hang on device removal.'
>>>>>>
>>>>>> Also, in the patch series as it is now we only signal HW fences 
>>>>>> for the
>>>>>> extracted device B, we are not touching any other fences. In fact 
>>>>>> as you
>>>>>> may remember, I dropped all new logic to forcing fence completion in
>>>>>> this patch series and only call amdgpu_fence_driver_force_completion
>>>>>> for the HW fences of the extracted device as it's done today anyway.
>>>>>
>>>>> Signaling hardware fences is unproblematic since they are emitted 
>>>>> when the software scheduling is already completed.
>>>>>
>>>>> Christian.
>>>>>
>>>>>>
>>>>>> Andrey
>>>>>>
>>>>>>>
>>>>>>> Not sure how to handle that case. One possibility would be to 
>>>>>>> wait for all dependencies of unscheduled jobs before signaling 
>>>>>>> their fences as canceled.
>>>>>>>
>>>>>>> Christian.
>>>>>>>
>>>>>>> Am 12.05.21 um 16:26 schrieb Andrey Grodzovsky:
>>>>>>>> Problem: If scheduler is already stopped by the time sched_entity
>>>>>>>> is released and entity's job_queue not empty I encountred
>>>>>>>> a hang in drm_sched_entity_flush. This is because 
>>>>>>>> drm_sched_entity_is_idle
>>>>>>>> never becomes false.
>>>>>>>>
>>>>>>>> Fix: In drm_sched_fini detach all sched_entities from the
>>>>>>>> scheduler's run queues. This will satisfy drm_sched_entity_is_idle.
>>>>>>>> Also wakeup all those processes stuck in sched_entity flushing
>>>>>>>> as the scheduler main thread which wakes them up is stopped by now.
>>>>>>>>
>>>>>>>> v2:
>>>>>>>> Reverse order of drm_sched_rq_remove_entity and marking
>>>>>>>> s_entity as stopped to prevent reinserion back to rq due
>>>>>>>> to race.
>>>>>>>>
>>>>>>>> v3:
>>>>>>>> Drop drm_sched_rq_remove_entity, only modify entity->stopped
>>>>>>>> and check for it in drm_sched_entity_is_idle
>>>>>>>>
>>>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>>>>>> ---
>>>>>>>>   drivers/gpu/drm/scheduler/sched_entity.c |  3 ++-
>>>>>>>>   drivers/gpu/drm/scheduler/sched_main.c   | 24 
>>>>>>>> ++++++++++++++++++++++++
>>>>>>>>   2 files changed, 26 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>>>>>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>> index 0249c7450188..2e93e881b65f 100644
>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>> @@ -116,7 +116,8 @@ static bool drm_sched_entity_is_idle(struct 
>>>>>>>> drm_sched_entity *entity)
>>>>>>>>       rmb(); /* for list_empty to work without lock */
>>>>>>>>       if (list_empty(&entity->list) ||
>>>>>>>> -        spsc_queue_count(&entity->job_queue) == 0)
>>>>>>>> +        spsc_queue_count(&entity->job_queue) == 0 ||
>>>>>>>> +        entity->stopped)
>>>>>>>>           return true;
>>>>>>>>       return false;
>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>>>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> index 8d1211e87101..a2a953693b45 100644
>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> @@ -898,9 +898,33 @@ EXPORT_SYMBOL(drm_sched_init);
>>>>>>>>    */
>>>>>>>>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>>>>>>>   {
>>>>>>>> +    struct drm_sched_entity *s_entity;
>>>>>>>> +    int i;
>>>>>>>> +
>>>>>>>>       if (sched->thread)
>>>>>>>>           kthread_stop(sched->thread);
>>>>>>>> +    for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= 
>>>>>>>> DRM_SCHED_PRIORITY_MIN; i--) {
>>>>>>>> +        struct drm_sched_rq *rq = &sched->sched_rq[i];
>>>>>>>> +
>>>>>>>> +        if (!rq)
>>>>>>>> +            continue;
>>>>>>>> +
>>>>>>>> +        spin_lock(&rq->lock);
>>>>>>>> +        list_for_each_entry(s_entity, &rq->entities, list)
>>>>>>>> +            /*
>>>>>>>> +             * Prevents reinsertion and marks job_queue as idle,
>>>>>>>> +             * it will removed from rq in drm_sched_entity_fini
>>>>>>>> +             * eventually
>>>>>>>> +             */
>>>>>>>> +            s_entity->stopped = true;
>>>>>>>> +        spin_unlock(&rq->lock);
>>>>>>>> +
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>> +    /* Wakeup everyone stuck in drm_sched_entity_flush for this 
>>>>>>>> scheduler */
>>>>>>>> +    wake_up_all(&sched->job_scheduled);
>>>>>>>> +
>>>>>>>>       /* Confirm no work left behind accessing device structures */
>>>>>>>> cancel_delayed_work_sync(&sched->work_tdr);
>>>>>>>
>>>>>
>>>
> 
