Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E96B33F80D4
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 05:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A006B6E4AF;
	Thu, 26 Aug 2021 03:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2045.outbound.protection.outlook.com [40.107.102.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9776E4AE;
 Thu, 26 Aug 2021 03:05:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crIET9n8V/eeREC3iW9gC5wwrSjm/cePB5lDOAcLEjw8fCELx+LNkMIwrCBBREaNwUQcuSw3BQ0v5uPOhAKxRvMpj6fRzoPmOuSDdUBp+OlckL1xZxDrQzTByJ+kYaFeDQqxGBe1liEUg2jxkNs/u/IMNVKTr5zPWWbQUej4cciyI+nu0vU7lpU/ziYoH3O+huFQV6oLGVnGtGY/iToUC/9NLOT20pSs4bqdOxaTOCenGbZAnOXHxUkxylG9uQiYrGSjVqbYc/hPtLJbrYx2GyzbVKBpafebM47etGTSev1cBu9tjfdWdz+gbiNdpwZ/dGwITEheCMJOIqVC41pDKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmnOjk6qo2T8XLqn1rEWiUIfNO+K2DVC8G7ftFm6Ekg=;
 b=OZ0CxNq5fqTEmyTavpJ+v/50hjHs2YI8Wja6kXRJ23Lyw09ZlDBUi3wyIoE6sQSSZ0kxP5ff6tF5zX3MQpJiwUr4Z9Xg62jtBwzGgjRGtuUv9hNoEzVLGq/2KkXIQbq96XIZFlP8Txu7si1WBFI2iJ72tOUTXHOL9rgl37bjT9m2q6S7ytj9/eNqWweCUni1/LJnOKaHxXvFwt2uoCEzEPyvCSHA1b3yjMrxR1NZVOZ1pFi5Ds50GzABAfsLRmrnQzH32wMvkdnfh6gZMDMaDnrE17TS2z6AdO1L8HgyXmzwCc8EX7zzynEdLgtame0fG6ZBDnVU26RUZL0LWY9TGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmnOjk6qo2T8XLqn1rEWiUIfNO+K2DVC8G7ftFm6Ekg=;
 b=Vd3I7AXaNc/3S4XAmjd1hsN9pDvQ402GG3uTq8IarR+I/oWPBm1nkeWWpOVn7n3QVopylY9T0wHVUYJy2zzCkPqG/Uh9joDLTr+IJl0Hnup0fw2E32LUbGW0c+5pcfA8nJB54ovJu02JgARUr7O7UWE3Gm5Yt4XXCmW6Qt4R4LA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4624.namprd12.prod.outlook.com (2603:10b6:805:e7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Thu, 26 Aug
 2021 03:05:24 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400%5]) with mapi id 15.20.4436.024; Thu, 26 Aug 2021
 03:05:24 +0000
Subject: Re: [PATCH] drm/sched: fix the bug of time out calculation(v2)
To: "Liu, Monk" <Monk.Liu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <1629864857-4252-1-git-send-email-Monk.Liu@amd.com>
 <1ef452fc-1f76-8dda-1c74-c540576fe6c6@gmail.com>
 <BL1PR12MB5269567906F233C0B938C32C84C69@BL1PR12MB5269.namprd12.prod.outlook.com>
 <BL1PR12MB5269E736907243FDF42D97F384C69@BL1PR12MB5269.namprd12.prod.outlook.com>
 <fff92742-6d09-430d-1dd6-5e0bb7f6a311@gmail.com>
 <5d0bbee1-599f-1a84-a9b0-0d70d6239255@amd.com>
 <BL1PR12MB52693FF44158D94EB516458E84C79@BL1PR12MB5269.namprd12.prod.outlook.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <e6b8ec75-6378-f267-8f3f-7593b997d014@amd.com>
Date: Wed, 25 Aug 2021 23:05:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <BL1PR12MB52693FF44158D94EB516458E84C79@BL1PR12MB5269.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT2PR01CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::21) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:d73f:dbf6:dbb5:c86d]
 (2607:fea8:3edf:49b0:d73f:dbf6:dbb5:c86d) by
 YT2PR01CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Thu, 26 Aug 2021 03:05:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9730955-fb48-4b5b-9bb7-08d9683e58df
X-MS-TrafficTypeDiagnostic: SN6PR12MB4624:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB4624ECF5C05F70563396B8D7EAC79@SN6PR12MB4624.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MmGFGo6SZEFdkAxRwfYl6Fg83g47GrJnzi86xAux8EiaeBA/4HW7ZMmeSDyiFSLJM+84yIr+lA6AmllFtgpHZNIL1FD5AHuROAsdLfWDIvEl30Kmlb9tviCMBriMgHjTyrVsOjL30nobAbsSmWbdtaolXkRmY0OZyGV0ngcVFYEY5VPpLBJzEL7QqCMUvbcCVCCAFioTLYwr90U32Z1dS5UhOA5DqWY10PAJfCWwdtGhXmccSoCGmJioIlhF7+Aj9kSwXMaQcDKVs9/pk3jb1RncYAN5kk2tEih1te98H07QXXJIJai19BTUN98EiPCxyRolttkCUDyxBrnYu+lIXFbgghko8MksDX6+ssVx+mm8Qht5zKrkpyruJ9GvrMPo4Z0BcT4GpEsK47rZqIiItbGRbgwMWFoe2PyT2r7k3ZqVYyTDnNgk3c+BMNONh8086utDjFXoD2lOxhY5LVNjsWiPB96r+Nri+SQkFfedeDrD0rtULeTcA8Gr1JaSx2et2SmAEdDVH7ykqEARIO0tO2gFLYkLmtA4i3wxMrSwDx5+GGfH/L1UEEaYOTszD0KgNaoOISYNfbflWpzQvpdNB+c6mib12OAT2ESAMeuZDeUpO+cJdUykL3yuIOfEjY8BScogJY2JGos8KmNhWDaosjN2bimHcBosWloNboJiM3srE5WslwOqxT58ZPJI00KMc/a70WLBO1Ce3RLU42aOy8erg8ExpAqBdAgH8gZ3XjY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(366004)(39860400002)(346002)(44832011)(316002)(2616005)(2906002)(110136005)(53546011)(83380400001)(66476007)(66556008)(86362001)(186003)(8676002)(478600001)(38100700002)(6486002)(66574015)(66946007)(36756003)(31686004)(5660300002)(31696002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emdXWHZmMEVBMzByN0RIRnU5N3pPbkpaMXpRenhMMkFEUnFDRnV4QlI2TUJX?=
 =?utf-8?B?REJmZkk5a3R3dm13OW51R09aRVdoSFQ2TVNzclVxbG9Nay9kaXdoSmpZMU54?=
 =?utf-8?B?NWNNeFJDbTFIc25PN1JNbGR6d0tYVmZZZDg5VFlxYUF6dDduT1JML296OUpL?=
 =?utf-8?B?VTVReUVHd2JvWHRpcTVkTG1VZGJ4bU1SMlBvb0RkVWhROUMwT0VSbkxvSDhs?=
 =?utf-8?B?VUxWc1lNbGUzeHdTUFJsUXc4UitxUFNHVU14OGtOQzlXaFNQSExCRTVUWG9C?=
 =?utf-8?B?NnprLyswaTF5d3dZbTlGVzRjY1Q2dlhDNjRQWWVua2pHUG90b0E2c1pleGFk?=
 =?utf-8?B?S3A2ODhTZEJxMHI1R0R3bzVFVDlwejhpK1paTkVrZlUzN3Zhd2k4NW9KbzF5?=
 =?utf-8?B?elhidUtyTGhmZW1xZVhORmhuSnRLVklPcWplcUxaTW56dWR2OEl6NzUyNE5w?=
 =?utf-8?B?RFFXRENHYjlyeWt3TFd5WFFvMmNhMEw5aVBGeXE1RnNpcWprbEhKTHZhRWFi?=
 =?utf-8?B?RmsrVFpXdGtwdExPSldYZXBkQWtOelhId1laMDJKTFFsL0xYa25nUlNLZi96?=
 =?utf-8?B?eUFnb1ZDZzNMR2VhU2Q3cjY0Wk1MSHhYRldTOCtaVzlONDVTTUEvREFmd1Vt?=
 =?utf-8?B?QnQrTjhzVkRtdUVOTzY4dGhFamlxQkM0SkNnUlRNWTNVa2dqSTNQYVAvc3pv?=
 =?utf-8?B?bGRFTUsvK293U0tWbW9YOW1lbjZqeEpiYU5ZMkUwb0F5Kzh3elRuQmZBcGp4?=
 =?utf-8?B?Y2FlR1NSZFZwZ0RhQm9Sa0hhMDVrS0d1RURxaUJKdnBETmRtTWtvbkY0RlYy?=
 =?utf-8?B?TkliU2xxL0JuUFl4SjFsR2VIM1JrNjRiOGpGUkpWcFF6Tllab2JIaUJpUk5j?=
 =?utf-8?B?SGc2SGlaVzd0a3ExKytPaWs0VEtLOUFLL05kMHlsNSsxZWZQYUhVRHdja0lF?=
 =?utf-8?B?NlN2SEM3R0dzMUJWZTBnRmU2Z1cweE9HMG5zQUVJRTQ5Z3hBa0xreUxlNit3?=
 =?utf-8?B?TkVlcGJGM2syMEZrQkh5MThlUHg3bUNZWUxmOEhiVko3a2p2czBsRVFlRFZX?=
 =?utf-8?B?anRsOGVrRnJwVUMxQVZ3emd6Z3R5NFpHU3pnVWNSamlqUERlUzA0dk5xVCts?=
 =?utf-8?B?WDlUbk1ZZHpKZHdKMnd5d3VJNFlEMDEyeWNiWnpvaXZ3Zk5ieXNQUDhRN2Yv?=
 =?utf-8?B?SSs5M3JFY2dPZEs1a040RXdITU5xM25ZeVBSb3NrTEZkTFF5VWkwbmVKZDRj?=
 =?utf-8?B?NzdNL3NOME5lMHJnZTFERithekFrblVTcDBkcGpsYU9QYlZlSU5NMlVueTdI?=
 =?utf-8?B?dmQyNzJ1ODdyenQzUnk0cngzTE9FQ00wYlZ1aURwd0N6SFBCakc4Z0ZOS3JN?=
 =?utf-8?B?SkVxeGdJeXZxYkttZlJrNVUxUW5kWTBKZWZIbm1KUEV3THVjU3ljZ3lvM0FR?=
 =?utf-8?B?YjJwQUk1ZVJUVnM4S3VuUmRFL28wNGo4Q0wxVkZ1bk55SUozUWpDa3VjWHNZ?=
 =?utf-8?B?WnlsZmp0NU5QaEI0WnYyMHRTTVhkNlc2cGVzTG5PcGRBUzFDMm9tUFVOdFFZ?=
 =?utf-8?B?RXF1MUJyeGhRT2oxRTZFdmFTVmpLY0NUaEsya001MFhoR0V1UW1YWExWdHMx?=
 =?utf-8?B?YlVWWmZraWVMbE5iQ2t5Um4vczg0YlErckxsMEszcjB2aEdyT0FNcnMxZGEw?=
 =?utf-8?B?akFqcXdjNGNEM25EOU5aNS94dmdNc1RsZVhWUW9nUVdzZ1pOSTcrenNTSEg0?=
 =?utf-8?B?NUJRZVVGTnEyS0RTTUxLNEVDRlRJSEdBM1NZblZxazZ0UlNCaFVwdHdONkhy?=
 =?utf-8?B?Z0drck15S0xySGs5MnFLa1RUdHhQVFJNTnFtdGJxVGI2UVFBVldlMFZKVEw0?=
 =?utf-8?Q?lr+l+jbymUBDK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9730955-fb48-4b5b-9bb7-08d9683e58df
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 03:05:23.9815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NRcT+92xyqQzmae5Y63TDPqK7F7OIiXkexhb+bHlVg2FH28GQf/REX3KvXzLKGkTQ3lz0V27WDNvGRlsvDHNMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4624
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


On 2021-08-25 10:31 p.m., Liu, Monk wrote:
> [AMD Official Use Only]
>
> Hi Andrey
>
> I'm not quite sure if I read you correctly
>
>>> Seems to me you can only do it for empty pending list otherwise you risk cancelling a legit new timer that was started by the next job or not restarting timer at all since your timer was still pending when next job tried to start it again (the common case).
> I don't understand above sentence, from my understanding for the common case,  if the timer is pending, the cancel_delay_work in beginning will cancel it and then we will get to the line of "queue timeout for next job" since the heading job is not signaled (align with the timer is pending), then the timer will be restarted (for the next job)


Ignore it, i realized from looking that i missed the timer restart in 
then end of drm_sched_get_cleanup_job or the alternative one in 
drm_sched_main


>
> And above sequence is actually wrong to me, because we cancelled a pending timer and restart the timer for the scheduler that its heading job is still running there, the whole counting is repeated from zero and inaccurate at all


But  for timer pending case (common case) your mod_delayed_work will 
effectively do exactly the same if you don't use per job TTLs - you mod 
it to  sched->timeout value which resets the pending timer
to again count from 0.

I just wonder why we stopped using per job TDR timers in the first place 
? Isn't the simplest way to count accurate timeouts for each job is to 
actually measure the timeouts for each job separately ?

Andrey


>   
>
> Thanks

>
> ------------------------------------------
> Monk Liu | Cloud-GPU Core team
> ------------------------------------------
>
> -----Original Message-----
> From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
> Sent: Thursday, August 26, 2021 2:20 AM
> To: Christian König <ckoenig.leichtzumerken@gmail.com>; Liu, Monk <Monk.Liu@amd.com>; amd-gfx@lists.freedesktop.org; dri-devel <dri-devel@lists.freedesktop.org>
> Subject: Re: [PATCH] drm/sched: fix the bug of time out calculation(v2)
>
>
> On 2021-08-25 8:11 a.m., Christian König wrote:
>> No, this would break that logic here.
>>
>> See drm_sched_start_timeout() can be called multiple times, this is
>> intentional and very important!
>>
>> The logic in queue_delayed_work() makes sure that the timer is only
>> started once and then never again.
>>
>> All we need to take care of is to cancel_delayed_work() when we know
>> that the job is completed.
>
> Seems to me you can only do it for empty pending list otherwise you risk cancelling a legit new timer that was started by the next job or not restarting timer at all since your timer was still pending when next job tried to start it again (the common case).
> For non empty pending list you have to adjust the currently active TDR's timer from your's job TTL to TTL to the next job after you or just restart it as Monk does it here which prolongs the timeout more then required but still ok i guess.
>
> What about returning to the old scheme of timer sched_work per job so each job has it's own timer and we don't share it and everything is precise for each job, using the locking scheme we already have today the actual TDR handler will execute only once while all the other arising from the guilty job hang will be rejected (for amdgpu, for other drivers it probably requires same locking or we can move this to the scheduler layer)
>
> Andrey
>
>
>> This here works as intended as far as I can see and if you start to
>> use mod_delayed_work() you actually break it.
>>
>> Regards,
>> Christian.
>>
>> Am 25.08.21 um 14:01 schrieb Liu, Monk:
>>> [AMD Official Use Only]
>>>
>>> I think we should remove the cancel_delayed_work() in the beginning
>>> of the cleanup_job().
>>>
>>> Because by my patch the "mode_delayed_work" in cleanup_job is already
>>> doing its duty to retrigger the TO timer accordingly
>>>
>>> Thanks
>>>
>>> ------------------------------------------
>>> Monk Liu | Cloud-GPU Core team
>>> ------------------------------------------
>>>
>>> -----Original Message-----
>>> From: Liu, Monk
>>> Sent: Wednesday, August 25, 2021 7:55 PM
>>> To: 'Christian König' <ckoenig.leichtzumerken@gmail.com>;
>>> amd-gfx@lists.freedesktop.org
>>> Subject: RE: [PATCH] drm/sched: fix the bug of time out
>>> calculation(v2)
>>>
>>> [AMD Official Use Only]
>>>
>>>>> The timeout started by queue_delayed_work() in
>>>>> drm_sched_start_timeout() is paired with the cancel_delayed_work()
>>>>> in drm_sched_get_cleanup_job().
>>> No that's wrong, see that when we are in cleanup_job(), assume we do
>>> not have timeout on this sched (we are just keep submitting new jobs
>>> to this sched), Then the work_tdr is cancelled, and then we get the
>>> heading job, and let's assume the job is not signaled, then we run to
>>> the "queue timeout for next job" thus drm_sched_start_timeout() is
>>> called, so this heading job's TO timer is actually retriggered ...
>>> which is totally wrong.
>>>
>>> With my patch the timer is already retriggered after previous JOB
>>> really signaled.
>>>
>>> Can you be more specific on the incorrect part ?
>>>
>>> Thanks
>>> ------------------------------------------
>>> Monk Liu | Cloud-GPU Core team
>>> ------------------------------------------
>>>
>>> -----Original Message-----
>>> From: Christian König <ckoenig.leichtzumerken@gmail.com>
>>> Sent: Wednesday, August 25, 2021 2:32 PM
>>> To: Liu, Monk <Monk.Liu@amd.com>; amd-gfx@lists.freedesktop.org
>>> Subject: Re: [PATCH] drm/sched: fix the bug of time out
>>> calculation(v2)
>>>
>>> Well NAK to that approach. First of all your bug analyses is incorrect.
>>>
>>> The timeout started by queue_delayed_work() in
>>> drm_sched_start_timeout() is paired with the cancel_delayed_work() in
>>> drm_sched_get_cleanup_job().
>>>
>>> So you must have something else going on here.
>>>
>>> Then please don't use mod_delayed_work(), instead always cancel it
>>> and restart it.
>>>
>>> Regards,
>>> Christian.
>>>
>>> Am 25.08.21 um 06:14 schrieb Monk Liu:
>>>> the original logic is wrong that the timeout will not be retriggerd
>>>> after the previous job siganled, and that lead to the scenario that
>>>> all jobs in the same scheduler shares the same timeout timer from
>>>> the very begining job in this scheduler which is wrong.
>>>>
>>>> we should modify the timer everytime a previous job signaled.
>>>>
>>>> v2:
>>>> further cleanup the logic, and do the TDR timer cancelling if the
>>>> signaled job is the last one in its scheduler.
>>>>
>>>> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
>>>> ---
>>>>     drivers/gpu/drm/scheduler/sched_main.c | 29
>>>> ++++++++++++++++++++---------
>>>>     1 file changed, 20 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index a2a9536..8c102ac 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -305,8 +305,17 @@ static void drm_sched_job_begin(struct
>>>> drm_sched_job *s_job)
>>>>         struct drm_gpu_scheduler *sched = s_job->sched;
>>>>            spin_lock(&sched->job_list_lock);
>>>> -    list_add_tail(&s_job->list, &sched->pending_list);
>>>> -    drm_sched_start_timeout(sched);
>>>> +    if (list_empty(&sched->pending_list)) {
>>>> +        list_add_tail(&s_job->list, &sched->pending_list);
>>>> +        drm_sched_start_timeout(sched);
>>>> +    } else {
>>>> +        /* the old jobs in pending list are not finished yet
>>>> +         * no need to restart TDR timer here, it is already
>>>> +         * handled by drm_sched_get_cleanup_job
>>>> +         */
>>>> +        list_add_tail(&s_job->list, &sched->pending_list);
>>>> +    }
>>>> +
>>>>         spin_unlock(&sched->job_list_lock);
>>>>     }
>>>>     @@ -693,17 +702,22 @@ drm_sched_get_cleanup_job(struct
>>>> drm_gpu_scheduler *sched)
>>>>         if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>>>>             /* remove job from pending_list */
>>>>             list_del_init(&job->list);
>>>> +
>>>>             /* make the scheduled timestamp more accurate */
>>>>             next = list_first_entry_or_null(&sched->pending_list,
>>>>                             typeof(*next), list);
>>>> -        if (next)
>>>> +        if (next) {
>>>> +            /* if we still have job in pending list we need modify
>>>> the TDR timer */
>>>> +            mod_delayed_work(system_wq, &sched->work_tdr,
>>>> sched->timeout);
>>>>                 next->s_fence->scheduled.timestamp =
>>>>                     job->s_fence->finished.timestamp;
>>>> +        } else {
>>>> +            /* cancel the TDR timer if no job in pending list */
>>>> +            cancel_delayed_work(&sched->work_tdr);
>>>> +        }
>>>>            } else {
>>>>             job = NULL;
>>>> -        /* queue timeout for next job */
>>>> -        drm_sched_start_timeout(sched);
>>>>         }
>>>>            spin_unlock(&sched->job_list_lock);
>>>> @@ -791,11 +805,8 @@ static int drm_sched_main(void *param)
>>>>                           (entity = drm_sched_select_entity(sched)))
>>>> ||
>>>>                          kthread_should_stop());
>>>>     -        if (cleanup_job) {
>>>> +        if (cleanup_job)
>>>>                 sched->ops->free_job(cleanup_job);
>>>> -            /* queue timeout for next job */
>>>> -            drm_sched_start_timeout(sched);
>>>> -        }
>>>>                if (!entity)
>>>>                 continue;
