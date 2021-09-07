Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A97402627
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 11:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F8D89E36;
	Tue,  7 Sep 2021 09:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060.outbound.protection.outlook.com [40.107.236.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332AB89E35;
 Tue,  7 Sep 2021 09:25:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilto+MY9xxnMqQJY05OTWPn0D0dIToRiYu5CbvsUqLW+RLFsb+PIhwyWxvLfQD0da92j8dVcMtmQ2zWdx0ECw92HmHzfqhbCJbfSCppu9dT2RiDGX8eOkSMusq81tkSF3WYG483NLoA48TuCGqatOPRDPjv3A64yts0nLqvbDGodzt7Hd0/WrZ+tXaWjaKt+E/8dp4DeLXKmigeIA2ZWnjDQfqg7s8UFbTiYac/1iQYL+WvDxGNMFLDH6WDdWZUH0bAHtqt/quyYjnrZqr9nWOMUYju/+j3fRWjB1yqGFrOg33zwd/p0GnT6WNpQv8NqxC0h7vECgyR9QJr42HVAfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=7SZ2ZpPRpUSaVQV4CRFHn21HnxKIo699D93jQwyRE5E=;
 b=QxG/IIKgkVPRlxvan76+59IbkVKGXfU4l9hIpgGJY7bX6ULb1+9IwTlqrRsYoKZxIV2LhBJa9UAZNfzxYPtU7OVz1BYIE29UFaEmY86kPvMAA9072ti1ZG5XLN1MKbRfWvF0DS6CB3gDRUzkP2Dy3DjNy0R41o2BeGmh1gJOxXqhJM7U1qLdJ1QebFITMwSOGxUQ4+cy2/axLaN6R30sbUb//3qZisijFjn0X4erHJYvbR+oZ7VTb2aqXUxLX1UeXPSV7zgafvWu2fa1dDFRY4TgquBYetTVDhE3GqCcZW5fNqKR1cxEwDK+BTgIf7FxUZxKZ79Ek/NNzL5MyAmKTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SZ2ZpPRpUSaVQV4CRFHn21HnxKIo699D93jQwyRE5E=;
 b=ath0Zs8zHAJXZwXjEOs3nV3823tA58GrOnTU7U5idXywEOKDSZBfgeQYLVu4Z4Q/B5/6xesdlmsZ/f4LE+RBA6D7I4pAg7sExCD9Sjq1lcVf3Od7XKWQ3cmng70MgQyYs059XiMYWjIfD970qiyCMxNWNfCug5fEtOXPl2Y+xJw=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3933.namprd12.prod.outlook.com (2603:10b6:208:162::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 7 Sep
 2021 09:25:35 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 09:25:35 +0000
Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
To: Daniel Vetter <daniel@ffwll.ch>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, Jingwen Chen <Jingwen.Chen2@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "monk.liu" <monk.liu@amd.com>
References: <b92c62f2-7b1c-d4d8-cb84-1b5ccc3e4bb1@amd.com>
 <YR0cb43Wv8jGiIbb@phenom.ffwll.local>
 <82782ff5-d2a7-a4a8-8526-d1ff231630ed@amd.com>
 <YR4k0fPfUL5viMRY@phenom.ffwll.local>
 <c1b7d154-55b0-1efd-4903-0d6730ccabb7@amd.com>
 <YSdZDtXcjxE/SPpr@phenom.ffwll.local> <YS4qhxIrcB0Ko3SB@phenom.ffwll.local>
 <2ee688a4-338b-8180-1673-2fc73c7751ba@amd.com>
 <YTDfd+ibZuxiispx@phenom.ffwll.local>
 <d06a45d2-7ac0-fc76-c4d7-e4094936e900@amd.com>
 <YTcnCOwUvZQWwv9p@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b82dafb5-d9d9-32f7-fd9f-65e74825b6e8@amd.com>
Date: Tue, 7 Sep 2021 11:25:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YTcnCOwUvZQWwv9p@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PR1PR01CA0004.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 PR1PR01CA0004.eurprd01.prod.exchangelabs.com (2603:10a6:102::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Tue, 7 Sep 2021 09:25:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d702b161-47d0-4bc7-1ded-08d971e1724a
X-MS-TrafficTypeDiagnostic: MN2PR12MB3933:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB39339A70A44834B8F0F44D0783D39@MN2PR12MB3933.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nY00rbgIh4cwCeXBAcwrf1R3IWMfRRJJn0fAllBxrRQXttJVvv+hP0ZLnvPfNSVjvLxiaS95krQgn20rmiemyLhdAlY9cPKBbrN/F3Pu/7LADNNPW8srWJLvZyZdLwAxCszQRVxhVaZod2WVgr44/GXAksBDDTag7/nD76TKVYOVfQLmVWxa6mL3LWRo+VNRDq1+dXdAVVCOV8rMYWKKFTSbJjNnbpjmWeueX2R2prnx9GNHWafl4fGnr6eKD+IMnyzLRV9lPTh++FYpiMoAUC9ERHByWgkTztOnWmsaUVq5gRXf2/VV2ahblJjUM9qdlD2hoEXf270va3hrvfFYs4HJTXrtfABbQjp6nD+M4mUf57H3W6VV6cM7JZ+tpHxhAOXcilXVEd5BwK3LMKPunn6R58QEMRl9bXWLZvw6yBcAeo3kl86CkwRVVB7wwxpPBqdGnB4dR7yc0Jxg5d8+G+iFzwLuNxMH9UmWM4OZqPQKBMU4RKihrxUgVabbEjf5bf6Z5kg8+g5nEm0FKYkFykJN1kqUK+KhFDC+U4IoynXM3tkTaP8ZpDBd/aMZF88w8pHau8F6voT7uTlkkoq0a+CqZpPQTH+JHSuTcks7e84tYqDI38v2kEZrElwm+j2Hy19A8g3Bb/fThYlnqTjpLIFKJ4uXm/zgeqQBHy/QMJb4CFY9GLCI85gdLcRUklWFVM2EQfJEPCz5swz67hJ5YodiiB/DLKwbLJCOfO+6dSYKIXneQc7KGpAuH5JVPHEETZqLrqYhsm5BgPBSeQ4jMbyKucILtairNMEJfEGDm0nvXIDJIp5gj8Nl6LAIseZ+1WjEfk469flVhkltdQeVfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(316002)(16576012)(110136005)(54906003)(83380400001)(966005)(86362001)(31696002)(2906002)(6486002)(36756003)(478600001)(45080400002)(38100700002)(31686004)(6636002)(4326008)(186003)(26005)(66476007)(66556008)(8676002)(66946007)(8936002)(956004)(5660300002)(2616005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzN1RUljWXZWSUw4UlNiWUdiUTVrakMzNWhQc2R5RG10M0EyKy94c2hRcThl?=
 =?utf-8?B?Q2JYZ1I2UUpkNU5NSnlsRDl4LzFqMW1TVlQ4UUNVNUtwcXltTU52UmJIalNl?=
 =?utf-8?B?SFd1TVhNeEx3bjhLbG5leTlhOTFWbVl5R2tqWmoxWEFVTUpOeTd0V0xjakx2?=
 =?utf-8?B?OG05R1FnL2lZc1V4VWZWNTFlaVViV0w4SEp2TW50NS9rTUswMzdyLzBsMUkw?=
 =?utf-8?B?RFk5T3FMeG9wV3BiMmJ3RzJIUTRJNnFLWnBHemJMZWwzdDR2RytuM1pSTWFQ?=
 =?utf-8?B?OXBwVjNMZVFab2U2d1hpT3FJNjRSRGoySDdqY1hoQ1E0cGVMMEI0RUN2ZTJM?=
 =?utf-8?B?ZlJzRDhXaWxQQWdPRitNL1JIbDZERzRZeWptZFI4TUp5anhOQUxuNlZMcTky?=
 =?utf-8?B?VVZraFR3L0x2dUVrQURHZUJQS1hOc1JBbTZGZTlpS0RUOFBLNjlNZUhJUXha?=
 =?utf-8?B?cEdOMG1pc2htcGRtTm1qS1dBaWxVK1pYUGdoK3dDTm11THlGNmFmQzMvc28w?=
 =?utf-8?B?NFdHMitiYXJZS3A1ZFFuZ1dBOE1qTENDUFBmNGxLekNvaTdjbW5SVHY1bHJi?=
 =?utf-8?B?c1hEUFJMZEh4NG5weUdVMExJMzJBOHNpQ1ZZd3hMR0Y2elU4R0trUEhFUWJ5?=
 =?utf-8?B?RVh3YkJ1bzRmT3M1YVIyQWZNZndHVVpQbXh3VS9OUGdDK2dkTHRNT0luemJ6?=
 =?utf-8?B?SzRoK1djelBuYXFaMC9qYnFoRE1BSlQzaHVEbzJnSHdIVkNYdEhuR0FzUjYw?=
 =?utf-8?B?dy8raDFqaFlBcWp1YTZ3bWRyZklLTEh0Z29BQkZoT2hZMnlnbUVMSDU1eWph?=
 =?utf-8?B?aStnL25BVFVueExnWittV0J2VjhRbEd1ZTlSNDBjUDJDU3FLWjBPOC9Fa3pO?=
 =?utf-8?B?OVlERElEVTRmYnptR1dPMlptd0J5Smw0RnpOODgyc2VoQTlDd0RraGNyeUx6?=
 =?utf-8?B?dzlsNEM1U21zVjNCSGRyOHVPcVB3Zm9hbndEUzRLaDAwZ0hMVXlVUWNkSmRs?=
 =?utf-8?B?Yjduano0eXgzZ2U2dWV3VE9Fc0hudkZyZTJBVVp3RklmTFNSRmdBSExaM2Iw?=
 =?utf-8?B?dTFyYmVleWQ1b01YMU9kYk5GWFd3aVRPNTNLMTRWMmo2RDAwdWpvUDF2TVV2?=
 =?utf-8?B?L1FtWDRpSlE1YXBuaTdRVkZEZGI5ZU40emplTUZFUjRGSkVaaUNocUwxOVhh?=
 =?utf-8?B?WXpLd1k5QnJ6VmV4cnlocytMRVFQUm14VmVLSnIwZUNURTVmMndySERDdTFK?=
 =?utf-8?B?dEFqSnRnWXhVREFmczZrMWFXRXo2djFNRUlTaHdLd1Fmc0hEaUVIOGNPWXBH?=
 =?utf-8?B?V3FmTjB3NnM4cmZZQ1JTZU13OEVNMWhyVzBtOTdqRW9za0tlUXRqamFBdTVO?=
 =?utf-8?B?NXZvKzNmWldjekRrOEpUMXgrUnR3NXloYUhHdUp2dVRscER1S20yakJndkds?=
 =?utf-8?B?WGkwOWR2Q1ZBZW5ncmFLTksvZWRnZGJPVWZoZUVMQkJPTTl1M3Z4S21ScE1k?=
 =?utf-8?B?TW9UQld3ZkZjem5XSUwvR1o5aFlsZGw2Sk5VTkVBMXpKYjdBUDBQQ3dsTXlR?=
 =?utf-8?B?dzg2ZndkL2pWR1FnV3BLZEhHUi9oempSQUJDVmJjcmV5b3dLNWxURDZTaWlp?=
 =?utf-8?B?d3BTMlJEMzQ1WTFMTFE1bllSYXdCT1p1TE03aGkrYS9SS1RiYTNNWlBCRjdR?=
 =?utf-8?B?cjNPd3hBRktxWnFhOGMwTnBEZzVpV3NLWlhtc2ZhS3BYQkErT3JBanBQS2hK?=
 =?utf-8?Q?hC/ZH9jUTqSJybPCLgI/m88qQP43RB8OnsY7L6n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d702b161-47d0-4bc7-1ded-08d971e1724a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 09:25:35.2354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hvVlVX+XthoO6Gcn6rzYD7Wwm3gRU9/bYWiwN+e+dgdgvsJfPFah4U2c7g6p1Q7R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3933
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

Am 07.09.21 um 10:47 schrieb Daniel Vetter:
> [SNIP]
>>>>> If we embed it, then I think it should start existing latest from
>>>>> drm_sched_job_arm. Maybe not yet initialized, but at least allocated. So
>>>>> the right thing to do here is to have the hw fence as a pointer in
>>>>> struct drm_sched_job. And check in drm_sched_job_arm() that it's at least
>>>>> allocated.
>>>> Why we need to allocate the HW fence if it's embedded within a job struct ?
>>> the hw fence is a refcounted struct, and the drm_sched_job is a different
>>> struct. And we didn't have a dri-devel discussion about whether it's
>>> correct to conflate these two lifetimes, amdgpu folks simply hacked
>>> something together.
>>
>> Obviously scheduler level changes must be discussed at dri-devel forum
>> level.
>> What happened here and as Monk already mentioned - we had internal
>> discussion
>> about how to fix the problem in the header of this thread - avoiding
>> accessing feed job
>> from TDR handler without the current hack in place of removal and back
>> insertion
>> into pending list. It's there we we came up (I think Christian first
>> mentioned this) with the
>> idea of embedding the HW fence into amdgpu job - both for avoiding memory
>> allocations
>> but also - because this allows to use the HW fence's recounting as a
>> solution to the above
>> problem by simply grabbing a reference to the next fence in the pending list
>> as a first step
>> in the TDR handler. What we didn't take into account at the time is that
>> indeed this change
>> cannot be limited to amdgpu level - this we noticed much later during final
>> code reviews.
> Not sure where this fell through cracks, but imo at least changing where
> the hw fence is allocated is a very fundamental change, and latest then
> you should have discussed this on dri-devel.

I'm the one who kicked this off in April and I made a nice internal 
presentation to explain what the problems is etc... So the idea of 
embedding the hardware fence into the job came from me.

But during the presentation I also noted that we need to sync up with a 
guy named Daniel Vetter because it was his patch set which surfaced this 
issue by annotating fence completion prerequisite in lockdep.

> But even the tdr races would probably have been good to start on
> dri-devel. Now it looks like Monk&team have lost 6 months for nothing.

Well to make it clear I've noted during the presentation in April that 
this needs to be discussed with you, I've also noted to the first guy 
working on this that this needs to be discussed on dri-devel instead of 
internally and I'm pretty sure that I've noted this a couple of more 
times after it moved to somebody else. And IIRC Andrey also noted that 
we should not discuss this internally pretty early as well.

So if people are not listening it is not a surprise that they spend time 
on stuff which isn't upstreamable like this.

Christian.

> -Daniel
>
>
>> Andrey
>>
>>
>>>>> Otherwise we're just diverging across drivers and tempting them to do the
>>>>> wrong thing with the current ->run_job callback interface.
>>>> Maybe we should switch from embedding in driver level job struct as it's now
>>>> to drm_sched_job and just leave the fence initialization to driver specific
>>>> code ?
>>> Maybe? Like I've not been involved in these discussion ont he amd side at
>>> all, I'm just noticing that we do have a now rather inconsistently used
>>> inteface across drivers. Which is no good.
>>> -Daniel
>>>
>>>> Andrey
>>>>
>>>>
>>>>> Can you guys look into this?
>>>>> -Daniel
>>>>>
>>>>>>>> Another thing I recently pondered for tdr races looking at i915 code is
>>>>>>>> whether the tdr should first block the completion fence for that job. My
>>>>>>>> motivation is to have a race-free error capture (if the completion races
>>>>>>>> then we might start evicting memory and everything goes boom), but maybe
>>>>>>>> that helps here too. Some kind of atomic "block this fence from
>>>>>>>> completing thing.
>>>>>>>>
>>>>>>>> Or I'm I completely guessing in the wrong direction?
>>>>>>> I think we already do it here - https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.14-rc1%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Fscheduler%2Fsched_main.c%23L410&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C485eb1f956d8488a041408d971dc1398%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637666013202978201%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=RILakhBoNRBPNFhvI5VfDDUP9l6R%2FnHrylglDBtg7%2Bo%3D&amp;reserved=0
>>>>>> Ah yes this works becase drm/sched has separate hw fence from the logical
>>>>>> job fence.
>>>>>> -Daniel
>>>>>>
>>>>>>> Andrey
>>>>>>>
>>>>>>>
>>>>>>>> -Daniel
>>>>>>>>
>>>>>>>>> Andrey
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>>> Andrey
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>>> Andrey
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>>>>                        spin_unlock(&sched->job_list_lock);
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>                        status = job->sched->ops->timedout_job(job);
>>>>>>>>>>>>>>> @@ -342,6 +342,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>>>>>>>>>>>>                                job->sched->ops->free_job(job);
>>>>>>>>>>>>>>>                                sched->free_guilty = false;
>>>>>>>>>>>>>>>                        }
>>>>>>>>>>>>>>> +               dma_fence_put(fence);
>>>>>>>>>>>>>>>                } else {
>>>>>>>>>>>>>>>                        spin_unlock(&sched->job_list_lock);
>>>>>>>>>>>>>>>                }
>>>>>>>>>>>>>>> @@ -392,20 +393,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>                kthread_park(sched->thread);
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> -       /*
>>>>>>>>>>>>>>> -        * Reinsert back the bad job here - now it's safe as
>>>>>>>>>>>>>>> -        * drm_sched_get_cleanup_job cannot race against us and release the
>>>>>>>>>>>>>>> -        * bad job at this point - we parked (waited for) any in progress
>>>>>>>>>>>>>>> -        * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
>>>>>>>>>>>>>>> -        * now until the scheduler thread is unparked.
>>>>>>>>>>>>>>> -        */
>>>>>>>>>>>>>>> -       if (bad && bad->sched == sched)
>>>>>>>>>>>>>>> -               /*
>>>>>>>>>>>>>>> -                * Add at the head of the queue to reflect it was the earliest
>>>>>>>>>>>>>>> -                * job extracted.
>>>>>>>>>>>>>>> -                */
>>>>>>>>>>>>>>> -               list_add(&bad->list, &sched->pending_list);
>>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>>                /*
>>>>>>>>>>>>>>>                 * Iterate the job list from later to  earlier one and either deactive
>>>>>>>>>>>>>>>                 * their HW callbacks or remove them from pending list if they already
>>>>>>>>>>>>>>> --
>>>>>>>>>>>>>>> 2.25.1
>>>>>>>>>>>>>>>
>>>>>> -- 
>>>>>> Daniel Vetter
>>>>>> Software Engineer, Intel Corporation
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C485eb1f956d8488a041408d971dc1398%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637666013202978201%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=QXBZgAv4sCcE1OTdhC%2BGeRimDFteEC85YEhjJUj7Sig%3D&amp;reserved=0

