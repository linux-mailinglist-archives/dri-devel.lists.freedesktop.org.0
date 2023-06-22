Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0526073A71C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 19:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5BF10E01F;
	Thu, 22 Jun 2023 17:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D9D10E01F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 17:21:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LduYJSbkA/6NLDyaLNAefVmAzguik8eAqr3jEPhDrR5GJGU7aXcSu4a5hb60uX+MAadLoc4DqXH4JoHmIUjGkHpUyGsvW3a+l7tT/7F16eFvSCfFOd45qx4xGQ5Xav+MHSh7fFxNvwsbUgd9NqzH7DQUmnkow5MKf9h+dze9fhH/lR6oRyLbv/LNoZjuh2pjoMEEv5ieaSiSZRRARZYSo/Q/rEnnQEojIzEioPXhDDXwrvexaqbIueRcOUAzraIbpcuQuy/CMbsRHlhyqBtUK97i+9e3kuRVQz0iXcsOdru0L1jat6S0WslWXeoK67IqTHnf0Z3OIi93O5J3s/1M0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exW38VCM9/RiuY+MQGIcw4CO4GjdZ9ewvPi3uOFlHq0=;
 b=Wyp+llah2x0Ty+Vcq36CJsHJX0EuQHPU8sOQmqEPI9nbZjTAX7IZrGh2h2p0VyE05flftNLd8KLl8s5NoC0d/XF+MIDcsu8CDHF72M9+Oujl5xIFOt3WnqBPTLwjQzE3fzKM2nZG9cvSoY2282ghElhTo3ZPeqIkcBRssacq21rnuMV65MGw9ryBYaaPQy2vZuhSZoE8MC1n9eonFGtRXNmC4Bc6KyuN0XJ/RBDcCY32jRE6kQVvL424R8vM0xlPpHH1COOYo5UHl/isOteetmM7dEcVmlf7yUmrwYlpima94wDt+ai/bZ1qfE6SJot0uI5SwIrjeaQkYW7KYWQr6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exW38VCM9/RiuY+MQGIcw4CO4GjdZ9ewvPi3uOFlHq0=;
 b=xU/fFZNty687AKn/c1pdlFdN0PG2bA1P4FAfE7w2dNPHA7LOcvdX/vZ1JHVLE4ckHePCbJ39P9WxhB4lnkawGDQ8c+XvE+NxpefqepAAybBDHrzuaqRBIIQVKQq0VtShnW8kT1UM9P+tK90FH7kaTzgPF1DkGmy3JXekuamxHRg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 BL1PR12MB5923.namprd12.prod.outlook.com (2603:10b6:208:39a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 17:21:03 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310%7]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 17:21:03 +0000
Message-ID: <70d79ac0-a33b-bd4c-fdfb-aac1a912ce16@amd.com>
Date: Thu, 22 Jun 2023 13:21:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6] drm/sched: Make sure we wait for all dependencies in
 kill_jobs_cb()
Content-Language: en-CA, en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230619071921.3465992-1-boris.brezillon@collabora.com>
 <dca9af00-271b-168d-c5f5-e6a662be38dc@amd.com>
 <20230621161808.24262cdd@collabora.com>
 <3d269410-e9ee-6cf5-8c22-5fb916ff75b2@amd.com>
 <20230621165330.29870beb@collabora.com>
 <14e873f4-d279-3afb-f10d-f797af3169b8@amd.com>
 <20230622115636.6c6026d3@collabora.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20230622115636.6c6026d3@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::29) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|BL1PR12MB5923:EE_
X-MS-Office365-Filtering-Correlation-Id: c1972423-ca4b-49c3-16c1-08db73450e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qZKvT2VrnOpvX5btDQI17DRNr+wp1MD6Qdr38dj02VgAgt7s0g2Ylf7izX8dYxaN+2pkDBuyddIhkDoYpkZ04PCa/9UbU6+uyQUAeniCCxdAxX+Tit04uoYNEHXO8LgF5sHRpy7LQPVHxnp5rtMa9DrHpfWBWL902sPtjCBHpsXLw9oW9ReBLrOR5SboiYiW5z3xMGkskAhRQlt60Q3a9KiebP4tjVjmKe/roGb7ARuYG8JHktC/mst8PQOkZXJM1TUlfMW3Uow+zLbZS8hZbwaiu44IccsN38S5q4qBvSCoTBDu3hNens4wzxgdOlq/6fEeLKWbOfHSVZQoc+s18HyGn82jxYX5AS6RMr2LNaHNTWTTxNF2EVYiBIkDLurEkh9e9UF2TiTVGueqtsiJDNzp/7gN4I/NVQh4P3GN+FAUhaJQtjhhmS1LdbK+ocGBkJlUqdlBE8LaSPrCpjmN0xuVkhMZYL76ENmctu+lTv31cverfTfFFEZq0usmTw45yNNodVoi2lZ5nWGjWeuXIRtiHcDJn+erUsFTA8gwcKFlZMdtFfA3U46mNtD7R9vYI2nS5Jdasrxjwgna/I+BTqp0jw27zteTV+OW03emAiuEAjqSHGD3+o40L02P9gZduFRB/RaJwFQZza3XKhTs7AQNpNrTzx6L3eVrFNaf2L1s8UsORkv+aWnawhX6ymnc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199021)(31696002)(86362001)(38100700002)(8676002)(41300700001)(8936002)(66946007)(6916009)(66476007)(66556008)(2616005)(316002)(44832011)(83380400001)(5660300002)(66574015)(6486002)(53546011)(478600001)(6506007)(6512007)(4326008)(186003)(26005)(54906003)(36756003)(2906002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW1UcnlJbStkd1Y1TWJGaUc0SjZkQ2tVOVFQR1dxS205VHY4eUhrd1UrUk82?=
 =?utf-8?B?UGhSeHlGR2NVZDlJQjRNVEdQRHh2N0tob3dDTUFSNHNkNUIrYjRHdXBHUkx5?=
 =?utf-8?B?YWRuOXJjMFBYNlRBMkptOXFPOUQ5Q1VaZGFIVU83b3FJVmlrZUxjblNiazBr?=
 =?utf-8?B?TDA0ZGdxU3VFN015bzV3aGN0YVcrYXFuQVRSMWJGR3pDdGs5M1JQUmQ1NmZG?=
 =?utf-8?B?Tys4eGRvcFhvaG9lS0xzK2RBNHRSZm5pOHdURXAybVBOTXdJUTVHdjVHeCsr?=
 =?utf-8?B?QjIydkw2dVo4Zk5TMUdpRkh1NkNMQ2hmZ2U1dmRDMlNGamZJejAxUjBPUzFO?=
 =?utf-8?B?cExnM1FCNk5lcmtETDJMbVFrLzBzcnNBMDFQbHlMQVB6dVZuc1VNdVN2aHo5?=
 =?utf-8?B?eTJYZks0dmRMWkUyeXg5MlB2VGRtT0VaSU5IMjdKUVAvUUxpRk4vaDFRTjR1?=
 =?utf-8?B?OXJNbjZiQkhFaFpXbHFtWVlEQXY3dHRBUXA2bG5iNkI4THFjN25hVmlxbzZ0?=
 =?utf-8?B?TFF6MkNpRFoxYUQ0SldBaU16NWVNc2pzK1ZtdzFlRmxBUFVQR3hSM0JkdGR3?=
 =?utf-8?B?MnI5WHE0TFZZRTd4RUhYYmpXam9VS1g4Q2JSbUZEa0hmaEE2bXlaVEJuNHda?=
 =?utf-8?B?YlBUdi9mdElVd09XbWU4QXc2VXM0TE5iaEJrUTdqYUxHd2N6SVJaa0dVWHRU?=
 =?utf-8?B?QWZReWpuYUlvMzZ0ZzZ1cFNkbmEvNFVvbTNKUmR2RklqVXJHbFFnei9WYzNh?=
 =?utf-8?B?aVR2cHhXWDhmSzZRbjlhbW52VnNQWEhrWTRYWnJCWW5UZzUrblN5L2dqRkdS?=
 =?utf-8?B?U2M2aTQyakp6UUFuR2JnazhCT3c5QnA5S1lIeWIwaG13M21BOWZUT3ZvMWFr?=
 =?utf-8?B?ZXkzNmJZSCtwTFBZa2VibFplQ3Zpb2gzbS9pUzFqcVZ4RkovOEhGVmEwS21C?=
 =?utf-8?B?YzdUTHVKQWh6VkVSMVRTYkZlK2lVR3lVVGRndmtDOUlBQ0ZTT1hYamhCNnMr?=
 =?utf-8?B?b25LaGJSVHBkdldvb0lyRjYrc0ZkTXd2RFVZYm04MlZSKzZzMWRFT3hmQnpC?=
 =?utf-8?B?cUdpdlZ5RWFLZ0l3bW1rS1JxaGpHV29ra3dNbGJoWXhIaWFuTnM2R2RTK2JS?=
 =?utf-8?B?KzRBb1NSZ2tJdG1WZ3JCMll3VnVjV3Y5OEwxYnJlUDhQSnVXeW1WUzlnNE1P?=
 =?utf-8?B?TmxQbXVUejVaaCtTRmRHdWttaFNFaTFCYnIydE5sTGN2VG5aRGt1SUZtOFZK?=
 =?utf-8?B?RzBVcFNZVkp4YUpDTDZ6VWhyQy9uU2lXRjJ2SlJGUzhkbTFHZWpZelFsdXd0?=
 =?utf-8?B?M1gya2haWW5oT2tCWUFESEZ3Wm8vVjRiaXhlSnNJRlQvWEYrekFmUHgyQ0Vw?=
 =?utf-8?B?WEg5TnAwOEdzUXV5Z1FNS2RJUFdYRFN3WERsdUtTaUI3Qll3ZFZZaEdMNFJa?=
 =?utf-8?B?cFBSUWZBbkU5ZFVCcXhFd3lVeWhjdGNjaHlrVkM5Z0JyTy9wR3FmaHR1UkFJ?=
 =?utf-8?B?SmN5a0t4Nmd1dVp1OERQd1dNRWg4bkZ5bFpOajdLZXBlM1grLzVBNnR5dzFK?=
 =?utf-8?B?QlpEeUVrWXE2WHY3YktSWmRnQzV3Y3VUMHlkYVJDbXFLYlljVFdKY1l4MnlI?=
 =?utf-8?B?STMxQUZ5UXF3dWFsOUtXNXVYRzdtN0xjeWFPNnFLZ1V2dGxzS1RpRmtZSUFq?=
 =?utf-8?B?MjRlTlVyNWJoV1BXYzNRN2cyVmJ3czJCOU05UjQ4elRsMnpSS202UGphWHN1?=
 =?utf-8?B?UjIza1hNbTBzYkplUjVNQXZWWWR0VnBqLzlIOThvcExIYTF0K3hGQVlFT0Iv?=
 =?utf-8?B?WCtwRU5tK0gvdFlEZjByY1RMc3pPcmJHZFgrS0ZuRmRSNXE0YVlhd3NLTUtz?=
 =?utf-8?B?cFVUWndIQUNZVHNIRURyMjU5Nk1KeXdSaFU0cW9QTlp2S3dkMXdOZDcycVJC?=
 =?utf-8?B?eGh3U1FTRWs1UFZQQnoyTEk3ejk1dTIrMHlTNTVjWXM1ZlU5dDZBdlQ0Z2gw?=
 =?utf-8?B?eGRYWDVWM2lySWcwT3JWWlVDRFB5dWxoY1ZOeHBpNzFEd2w3UE9UT1VEL2xF?=
 =?utf-8?B?akd4anl3MWpiMWhvVGhveHY3UHFUZnNpWlBRMzlERndUTkM0RmxMZVpPQnVu?=
 =?utf-8?Q?Si9mTftycZH4wVlVnrJ+zk58A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1972423-ca4b-49c3-16c1-08db73450e71
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 17:21:03.6651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMtpYTa4RsvHnUel6JkwGJ0yej97m2VQlssopJxrIQm4UJRbAMFd+umF8BLVD5nt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5923
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
Cc: Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Donald Robson <donald.robson@imgtec.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-22 05:56, Boris Brezillon wrote:
> On Wed, 21 Jun 2023 11:03:48 -0400
> Luben Tuikov <luben.tuikov@amd.com> wrote:
> 
>> On 2023-06-21 10:53, Boris Brezillon wrote:
>>> On Wed, 21 Jun 2023 10:41:22 -0400
>>> Luben Tuikov <luben.tuikov@amd.com> wrote:
>>>   
>>>> On 2023-06-21 10:18, Boris Brezillon wrote:  
>>>>> Hello Luben,
>>>>>
>>>>> On Wed, 21 Jun 2023 09:56:40 -0400
>>>>> Luben Tuikov <luben.tuikov@amd.com> wrote:
>>>>>     
>>>>>> On 2023-06-19 03:19, Boris Brezillon wrote:    
>>>>>>> drm_sched_entity_kill_jobs_cb() logic is omitting the last fence popped
>>>>>>> from the dependency array that was waited upon before
>>>>>>> drm_sched_entity_kill() was called (drm_sched_entity::dependency field),
>>>>>>> so we're basically waiting for all dependencies except one.
>>>>>>>
>>>>>>> In theory, this wait shouldn't be needed because resources should have
>>>>>>> their users registered to the dma_resv object, thus guaranteeing that
>>>>>>> future jobs wanting to access these resources wait on all the previous
>>>>>>> users (depending on the access type, of course). But we want to keep
>>>>>>> these explicit waits in the kill entity path just in case.
>>>>>>>
>>>>>>> Let's make sure we keep all dependencies in the array in
>>>>>>> drm_sched_job_dependency(), so we can iterate over the array and wait
>>>>>>> in drm_sched_entity_kill_jobs_cb().
>>>>>>>
>>>>>>> We also make sure we wait on drm_sched_fence::finished if we were
>>>>>>> originally asked to wait on drm_sched_fence::scheduled. In that case,
>>>>>>> we assume the intent was to delegate the wait to the firmware/GPU or
>>>>>>> rely on the pipelining done at the entity/scheduler level, but when
>>>>>>> killing jobs, we really want to wait for completion not just scheduling.
>>>>>>>
>>>>>>> v6:
>>>>>>> - Back to v4 implementation
>>>>>>> - Add Christian's R-b
>>>>>>>
>>>>>>> v5:
>>>>>>> - Flag deps on which we should only wait for the scheduled event
>>>>>>>   at insertion time
>>>>>>>
>>>>>>> v4:
>>>>>>> - Fix commit message
>>>>>>> - Fix a use-after-free bug
>>>>>>>
>>>>>>> v3:
>>>>>>> - Always wait for drm_sched_fence::finished fences in
>>>>>>>   drm_sched_entity_kill_jobs_cb() when we see a sched_fence
>>>>>>>
>>>>>>> v2:
>>>>>>> - Don't evict deps in drm_sched_job_dependency()      
>>>>>>
>>>>>> Hmm, why is this in reverse chronological order?
>>>>>> It's very confusing.    
>>>>>
>>>>> Dunno, that's how I've always ordered things, and quick look at some
>>>>> dri-devel patches [1][2] makes me think I'm not the only one to start
>>>>> from the latest submission.
>>>>>
>>>>> [1]https://lkml.org/lkml/2023/6/19/941
>>>>> [2]https://lore.kernel.org/dri-devel/cover.1686729444.git.Sandor.yu@nxp.com/T/#t
>>>>>     
>>>>>>    
>>>>>>>
>>>>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>>>>> Suggested-by: "Christian König" <christian.koenig@amd.com>
>>>>>>> Reviewed-by: "Christian König" <christian.koenig@amd.com>      
>>>>>>
>>>>>> These three lines would usually come after the CCs.    
>>>>>
>>>>> Again, I think I've always inserted those tags before the Cc, but I can
>>>>> re-order things if you prefer. Let me know if you want me to send a v7
>>>>> addressing the Cc+changelog ordering.    
>>>>
>>>> No, it's not necessary for this patch, but in the future I'd rather follow
>>>> chronological ordering for the versions, and in the Cc list. It's similar
>>>> to how the patch description follows (narrative text) and to how we reply
>>>> back to emails, and prevalently in the kernel log in drm ("git log" should
>>>> suffice).
>>>>
>>>> Reading in chronological progression builds a narrative, a picture, in one's
>>>> mind and makes it easy to see justifications for said narrative, or see reasons
>>>> to change the narrative.
>>>>
>>>> That is, one can make a better decision knowing the full history, rather than
>>>> only the latest change.
>>>>
>>>> (And in fact when I read the version revision list, my eyes skip over v[X]
>>>> and just read down, so I was wondering why and how Christian R-B the patch
>>>> in v2, and it wasn't until I actually saw that they were ordered in reverse
>>>> chronological order, which was in fact v6--listed first, which I'd assumed
>>>> was listed last.)
>>>>
>>>> Do you have access or do you know who is pushing this patch to drm-misc-fixes?  
>>>
>>> I can push it.
>>>   
>>
>> Acked-by: Luben Tuikov <luben.tuikov@amd.com>
> 
> Queued to drm-misc-fixes after re-ordering things in the commit message
> as you suggested.
> 
> Regards,
> 
> Boris
> 

That's great! Thank you.
-- 
Regards,
Luben

