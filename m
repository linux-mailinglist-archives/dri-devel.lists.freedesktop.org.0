Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA74738856
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 17:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6319310E49E;
	Wed, 21 Jun 2023 15:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C16310E4A5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 15:03:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcFwtouHk80mHRhUqBswtCGIHcmIK3/gOxm0vPt5vVgXm0pLZqcFiD2gVnU7Xc07lOU9f5pHyVjEjQHXlYhsIXj8FzpC4nRRXn/yjfwfHuOQKq3WEwjRXQ8iUzlRdMVJvj6TxMBPT0U9lHaNg+B7TvtqKkfCMgviUDQKyCT1Epfaqy43vFRBrezNKKOGNUblMb9Q05MjQNSZniYOS0Br/nlPi7i06ZZPECqrw1U/Zo6Xcs3Pxm11uA4gpJ/d9jp9/LuskSLtZarxsnMwKF8Rip99JpWf1OBg6VIZbDzwKhf3wsq/HFj04c4Qj4MeuFcXKXyLiBdAtvSR7fQlosWJtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYyv2aiIGLadW4edxrVdhyQtV3uWjytTxtS0uH9r5DQ=;
 b=oJd2/1oNmQofB5CJ6eyWytQBXTifVwvTKUu91l7mb/G5IVgJkag7qz6OB8s4cxeyvv22yjDfL4EbasJQtPpeqNdTOOw1p6o0DmLKP/1BdA8hIQTRI9IpE8c5WqJrVpeaSwpObCFW1BVfYll/FPfUnsknwrbB0MxG6onfgpyef+UwXcZIc57rTwJ97PQOQ/egcZvy4zYq9+BReG3i2tWKZGp6rwEVm5Dtiz86eUvqZ8QYH23WeuA6UAp4wIuAPb9AFoNOPbGc/jz+bDEbdGYOwOqvN1Ptyy845QynGXNY34TdUkPOsdVutS7gKUJAQ1s5RWUhiY9wo0Xqieun84eOQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYyv2aiIGLadW4edxrVdhyQtV3uWjytTxtS0uH9r5DQ=;
 b=tu+0t2EergtH/Cx9BoxYRC5HWIw177ILicc8sYHIBMi25uL0vVXEd9hwyLQ7aLSa5OFkQU8uZsuEobu2iI+OY+dM1qFcM9JXKrwSzEj6GYpaFdu0Yg2UMH0jk2t2Q3gAlYlLcNZR1gjkeCOwQqgyKq2GD1NNkJYmsAnqygMdzoc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DM6PR12MB4449.namprd12.prod.outlook.com (2603:10b6:5:2a5::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.21; Wed, 21 Jun 2023 15:03:50 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310%7]) with mapi id 15.20.6521.020; Wed, 21 Jun 2023
 15:03:50 +0000
Message-ID: <14e873f4-d279-3afb-f10d-f797af3169b8@amd.com>
Date: Wed, 21 Jun 2023 11:03:48 -0400
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
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20230621165330.29870beb@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::19) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DM6PR12MB4449:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fa19d58-bd83-4aea-4c31-08db7268b8ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GwpWnFGhvJFXjuMm3rdt0hdC4ZQhvtZ8tbRLDOFDTytdo3AU+0A61LeH4LSLQaB23U8wDWXS/CK5bIxIVgOdk5k273u2z7m9daeMaLzStapWqIRZdBQQbkyaKOd7nkz1h4BAr6UzYOAV2A0GBh+qJEzAsx1ArjlHmkL+dRyBlcOExpKqUXozi2IpBlopE4itVhit+fMdmaOqB3b67bBBMo+bSrJzKAMji9MOM3FoYsIf8JdEU9E1rb5JRpR3hXQ2zpt0BETk1azd01duK60rJdKrIuyx7ydqRxxdiwFCXbl/MlGdJjLGYMXKhSm3WfHvUbyltqM4ppwadP4i8glcM4+4rIsrMvwc2/AI+0kj1m9HXNaz6VO7YBfkXT2+h7CSEPzNczUi//T5V7WLVtUu13RfyxSJcj06s6TriZiihWauBeA02nVmMJW6JZ2YJ13BEPaj1egCNsptLSmpGH6POP2NMUTFslfPSufYkEAayqqmR2jAYIGIgUY/k1Zi4Jqfr9IdbP2B2d9CZ+iDuqaa1EjU7IsLfrR6fZEg5+h1KCV8dSN+VSabNuJFDMhaFA2dsg1/h0TCm23EbqUFf3s9S8/sOZzxEyjV6hcc0U5uZ0AY4nI3baMhqWJl9BtAl3nv1uzHvXCwawsxSEdhmDETC5IK9p6+wmIPisMYI6wzo64MdDHhPR0D9RqEzZWj3OZO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199021)(31686004)(36756003)(66476007)(5660300002)(44832011)(86362001)(8936002)(6916009)(8676002)(41300700001)(66556008)(31696002)(4326008)(316002)(38100700002)(66946007)(6486002)(2906002)(66574015)(6512007)(26005)(186003)(53546011)(6506007)(2616005)(54906003)(83380400001)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NERyMitoUzRIcFpoV04yUGIyaWcvc1lQMzdTU0o5V1pPeVRpZG1nVEtPMTZw?=
 =?utf-8?B?aXp6eDJkVTV0NHdZejdQMFQ5QVBJcWp1U0cxTWgvZXc4K3pEQUsrQVN1M3VI?=
 =?utf-8?B?NWJnNzN2TndsZ3ZmZUpLYlRXcUFueDdiOGsxUG11VWg5MlhrVFo5TnRLN2dB?=
 =?utf-8?B?STJvYUY1RDdzUzF6eXE2M2JidTI5ZGg0OC9rY1RFNTJ4SE9oWk1zZ0puN1g1?=
 =?utf-8?B?Zlh1RjlKR3hjNVV0Nmk2TU5xSlRCMVpaaU9WaEZsQWNDdmExYlUyTnJWQXd0?=
 =?utf-8?B?ZGdZTjExRDVweXNsckdrSEl3ME1zMENqLzkrMTc4ZmR4algwTlo1eUZLRDAz?=
 =?utf-8?B?R2VFMlZKdHJlODZrbXplZXFnbkdEajhFMWRPRU1ldjVFV09FM1lpc0hXcDQ1?=
 =?utf-8?B?OWVIMy84dmorcitvME5DQTQxWHErMndvVUd1cHluK2xPdm9za2g2a1Z5S2ty?=
 =?utf-8?B?dVJDdkNuU2pkU1prS04wbFAwNWlWWmM5Wks0cGU4NW53d2ZrV3NXbFNRVnc4?=
 =?utf-8?B?VWVjazNwRFY1RXVIYTJGNEFBS0tJOTNXM2dyaEFteWlzZ0t2bUE0MXplcXNX?=
 =?utf-8?B?YnFSRm13Ry80NXNKbEV1M1h0V3Y5RURTV1FYeUUxVjFiWHdIelkvdUlNYUdQ?=
 =?utf-8?B?YmI4Z0t2RDVWcHRUN3VxQWM0dngzcHM1b3d4NmJSRWU4Q2d0OElTZTZQUXNH?=
 =?utf-8?B?OHE1bmIwY2Rra0cyM3JRVXdxVHVGNkFxS2lyclZkcXlyRm53aExNZzhsVmJX?=
 =?utf-8?B?Z2F0WW1JUEJuY2hnSFpneTFveXhLekszZ0pNTkVUUk1FMEFLUmJiRkQyNG0v?=
 =?utf-8?B?WFN6NTBTVmRlMnNObHhuQ2ExQmM4K3JBbXJJd2w4TjluQXRNV0Q0MlUyS1ZR?=
 =?utf-8?B?U2E3TWZTRGxHK3JnUzh6VnpYaG9yeDdJeXJna21HQ3k2RDAweElkenVib29o?=
 =?utf-8?B?ZHQ1TlZsSHVMRHp0b2xsTFRLbDJOT3dEWC9QREJKWE93ZmpCSjVZOEpjc1c0?=
 =?utf-8?B?WWdmOXE0dlpJQmxlTFlGQ0dQUGs0aHQrdm9WYXVsMEkzSGhPMUp2Y3ZsWi9G?=
 =?utf-8?B?QkQxcVJBVmV5K1Fodnl5M0RxNVRvcHEremxZQ2kvK0M3c3pIcHpqQXJYSTNh?=
 =?utf-8?B?cDF6c2IrcUVrY1doaUtRQ3p6dGMwa01rMlNqNHVkZkM3L1U3bEkydU43WXFN?=
 =?utf-8?B?eEoyVmErOXNHdGpOWWhWM0VnbHZwQ0w3T0xuMzVZb1phVXdHL29mQzFta2JK?=
 =?utf-8?B?TkVsTVIzTXpzL0lYaGhFSk1BdVlWK2t1dEVMZHNDQWN3ZmhYVXBrbTVtdGRh?=
 =?utf-8?B?WHluY1A3alRRUHRMWjBPelFVNGdsd3U1alZDY1llTmc1eGdtM0x0QkxDMW9k?=
 =?utf-8?B?RHhXd1FLQVR1QTRkaS94ZVVBSVBHQVd2K08rUVYxVTloTjlVMDhORHF4eHRC?=
 =?utf-8?B?VzYrdDVsUE52dmw2VHk5NTVpbXQyY25jb3pRZ0FrZlk3TTVLNlpieVhHMDZ6?=
 =?utf-8?B?UnZKbWxhWnMwRVFBeGVTK0U0dExyZ09BcmpjWDRlK1V3SGhZL1JDWGVPWkJF?=
 =?utf-8?B?VVRqWjVJSUZvUFkwZjVhZk53R09KajV6Z0F6Wm1UZE8yTW01YXp5S3gzVHlU?=
 =?utf-8?B?SEV5K3hMY095K05zT0d0WTlIQWQrOHh1RVJManJyZW1wWFpVNnlndHc5MVMy?=
 =?utf-8?B?Ty9JcVB5ajJmMStnaDloYVlhbjdBUTBmU2MvZE1Ta29NVi9URVVGTGVEYzdX?=
 =?utf-8?B?RXFpZWxYYktFYUFCRXVzTDRna3owTkNkbTVKcXhpU3M5KzRSUVE1cTh6MmI3?=
 =?utf-8?B?MlRwS0h0Wkc3NktMRVNLOUliN2tVVHVMdVBQNlBDZ1lQQVorcEFvaE5xZTMv?=
 =?utf-8?B?VFNwWUZVR3dqajBreDBzQTUyNFZSZGpmbW4rUDlTbEJyYUhFRHpmTlQveW11?=
 =?utf-8?B?cUdQOFc5enRLbkNVOHduN2VMT3Vzd0tXdGVEWjU1NktNa2tZTmkvM1VNMHhB?=
 =?utf-8?B?ZlZkcjVIbjRacXhnVmVTUms5ZnNnK0hlRGxyTG93YjZDd2pNU1ZVbFZLU2xT?=
 =?utf-8?B?OGFhbFo2SzRwOVI4bXRHY0E0eE5SancvY0I5MnZ5UWNMb0tndW1WeE8zZVdL?=
 =?utf-8?Q?pog/glmk5JqWUc/OsYivFuP6c?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa19d58-bd83-4aea-4c31-08db7268b8ba
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 15:03:50.5551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wG5cYgvBFPFEIkeG11ILDLn3rSo8djYXQL9sypz28n1HlWEfqy50kZa+Qd9vSLuw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4449
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

On 2023-06-21 10:53, Boris Brezillon wrote:
> On Wed, 21 Jun 2023 10:41:22 -0400
> Luben Tuikov <luben.tuikov@amd.com> wrote:
> 
>> On 2023-06-21 10:18, Boris Brezillon wrote:
>>> Hello Luben,
>>>
>>> On Wed, 21 Jun 2023 09:56:40 -0400
>>> Luben Tuikov <luben.tuikov@amd.com> wrote:
>>>   
>>>> On 2023-06-19 03:19, Boris Brezillon wrote:  
>>>>> drm_sched_entity_kill_jobs_cb() logic is omitting the last fence popped
>>>>> from the dependency array that was waited upon before
>>>>> drm_sched_entity_kill() was called (drm_sched_entity::dependency field),
>>>>> so we're basically waiting for all dependencies except one.
>>>>>
>>>>> In theory, this wait shouldn't be needed because resources should have
>>>>> their users registered to the dma_resv object, thus guaranteeing that
>>>>> future jobs wanting to access these resources wait on all the previous
>>>>> users (depending on the access type, of course). But we want to keep
>>>>> these explicit waits in the kill entity path just in case.
>>>>>
>>>>> Let's make sure we keep all dependencies in the array in
>>>>> drm_sched_job_dependency(), so we can iterate over the array and wait
>>>>> in drm_sched_entity_kill_jobs_cb().
>>>>>
>>>>> We also make sure we wait on drm_sched_fence::finished if we were
>>>>> originally asked to wait on drm_sched_fence::scheduled. In that case,
>>>>> we assume the intent was to delegate the wait to the firmware/GPU or
>>>>> rely on the pipelining done at the entity/scheduler level, but when
>>>>> killing jobs, we really want to wait for completion not just scheduling.
>>>>>
>>>>> v6:
>>>>> - Back to v4 implementation
>>>>> - Add Christian's R-b
>>>>>
>>>>> v5:
>>>>> - Flag deps on which we should only wait for the scheduled event
>>>>>   at insertion time
>>>>>
>>>>> v4:
>>>>> - Fix commit message
>>>>> - Fix a use-after-free bug
>>>>>
>>>>> v3:
>>>>> - Always wait for drm_sched_fence::finished fences in
>>>>>   drm_sched_entity_kill_jobs_cb() when we see a sched_fence
>>>>>
>>>>> v2:
>>>>> - Don't evict deps in drm_sched_job_dependency()    
>>>>
>>>> Hmm, why is this in reverse chronological order?
>>>> It's very confusing.  
>>>
>>> Dunno, that's how I've always ordered things, and quick look at some
>>> dri-devel patches [1][2] makes me think I'm not the only one to start
>>> from the latest submission.
>>>
>>> [1]https://lkml.org/lkml/2023/6/19/941
>>> [2]https://lore.kernel.org/dri-devel/cover.1686729444.git.Sandor.yu@nxp.com/T/#t
>>>   
>>>>  
>>>>>
>>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>>> Suggested-by: "Christian König" <christian.koenig@amd.com>
>>>>> Reviewed-by: "Christian König" <christian.koenig@amd.com>    
>>>>
>>>> These three lines would usually come after the CCs.  
>>>
>>> Again, I think I've always inserted those tags before the Cc, but I can
>>> re-order things if you prefer. Let me know if you want me to send a v7
>>> addressing the Cc+changelog ordering.  
>>
>> No, it's not necessary for this patch, but in the future I'd rather follow
>> chronological ordering for the versions, and in the Cc list. It's similar
>> to how the patch description follows (narrative text) and to how we reply
>> back to emails, and prevalently in the kernel log in drm ("git log" should
>> suffice).
>>
>> Reading in chronological progression builds a narrative, a picture, in one's
>> mind and makes it easy to see justifications for said narrative, or see reasons
>> to change the narrative.
>>
>> That is, one can make a better decision knowing the full history, rather than
>> only the latest change.
>>
>> (And in fact when I read the version revision list, my eyes skip over v[X]
>> and just read down, so I was wondering why and how Christian R-B the patch
>> in v2, and it wasn't until I actually saw that they were ordered in reverse
>> chronological order, which was in fact v6--listed first, which I'd assumed
>> was listed last.)
>>
>> Do you have access or do you know who is pushing this patch to drm-misc-fixes?
> 
> I can push it.
> 

Acked-by: Luben Tuikov <luben.tuikov@amd.com>

Regards,
Luben

