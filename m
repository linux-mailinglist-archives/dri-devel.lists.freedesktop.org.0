Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F154E2358
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 10:30:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1437410E348;
	Mon, 21 Mar 2022 09:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11CF10E344;
 Mon, 21 Mar 2022 09:30:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2gozwWZCZg3e8UGNEBqkfcEF4dOryn45TEQLbHMaPSHwta0G4VfRafhYcUTgWl5aTba8cVX0Gl9k966hhtq9MOatRnb95qXj7Z7EGjo8nbQLhTy77zu4VQv0uc1WluRDFNlTuRRAaqvBbddGthRiTnCM08LXoHE2AaIWJE0QxChoNmQFywi05IeMiRRd+mOs8rfzY86CTS2aPTyAGXPS4kAHFs0/4EBeQEXMFxX+jE5QXTzO/uFCQLezsPXELdvaDHBrfkxXBybs7x4i7gkfZEs2CjYBJTnoShB9Tr9kT7rYaLSJkFHgaerCL3iU0ifM9vRF9KOZ7RAwi1Jumj7zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZoQfd3PVsesnNM9s4hjJmDxTSnWnq5zBOtKLRVQLd34=;
 b=MPx2pVbSRrhZlYFSCfbS4QRcPSZJCcIz7+HzgvkPQkdszl7Jv6caP5IP+ui6Q0U9saWkymHDGP27Bf343z+XZUU6cDJLtexbC1829LLtly8D269NvAr7bfJ1w1HrGJ/IOM82uKHo27XUctxvUVCzH5eMj1Dy35VMMBSgw9K2BS+aBh5XqlVWjJjYzCgxGMn1F9PoF0ynw6iOKUyQbDdjFfkkl9HXfbgMzdQpIkDk52tLSKAOlopXtaI0U2MSs5NJPl/ASZx1tyfthbF6U2HUkssTPzDFDrP0Niuo3wW9S9JklaI1+fuS9GU1guCf1/+FeeaNcTKAK64pQhrE4yUrrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZoQfd3PVsesnNM9s4hjJmDxTSnWnq5zBOtKLRVQLd34=;
 b=kciSSFtoPTDVrHdWzjvIaJGBkvbySS5friCvrwniznn8BBn+tDuuXOytjJpdfK/BZpq4uDEn1VUIFqoNt0HrFOx96qjbaCGJ0LP6wD2h1jgYEF1gNB449T7kBj7WqIO2+0hI7v5x39f5scOE7TuNuSJ3rcLUreUHvaBvsNInWOA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB3902.namprd12.prod.outlook.com (2603:10b6:208:169::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Mon, 21 Mar
 2022 09:30:15 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.023; Mon, 21 Mar 2022
 09:30:12 +0000
Message-ID: <3f0b7273-4562-7a55-e52a-bd64334886fd@amd.com>
Date: Mon, 21 Mar 2022 10:30:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220311102709.225616cf@eldfell>
 <CADnq5_O1Qktec3kC_rcPZUQPbraBYmdhDwmj=jgp_QsaBFGUZw@mail.gmail.com>
 <20220314172647.223658d2@eldfell>
 <CADnq5_NsxipfFFXfRSXvVQin3e1gj0Q_p9p-shi3VZ2pSCwwfw@mail.gmail.com>
 <20220316104815.11ec2e6c@eldfell>
 <CADnq5_MbOLaZGaQ8fYW_ZL3+gssu3cq7QbzByOWdLuvbdfSAAg@mail.gmail.com>
 <CAF6AEGvoqJmXs0KxXGN4qKD4U6Yeo4gDq6sVxm=noY-TwFoj4w@mail.gmail.com>
 <5e246eb8-0256-c40e-40ea-d865bf99c003@gmail.com>
 <YjL/k6kh+5RihGIV@phenom.ffwll.local>
 <CAF6AEGu79jDW1xqJOaNCB=jAxhKiCRFJwoCNiC9ye97KvpWEtQ@mail.gmail.com>
 <YjNvYmcuDKiIneDx@phenom.ffwll.local>
 <CAF6AEGvuMfKtf_aweai6y4oHghArE95uhR2X0f9h_9w4Bk_6VQ@mail.gmail.com>
 <19a67000-d1e5-0582-c6de-07d9988b1735@amd.com>
 <CAF6AEGvDjw6zq3yiorhOc+vp2US+Jso9tF74=8gyJMTm=K5FVQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAF6AEGvDjw6zq3yiorhOc+vp2US+Jso9tF74=8gyJMTm=K5FVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc584eff-0197-408a-cd37-08da0b1d6575
X-MS-TrafficTypeDiagnostic: MN2PR12MB3902:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB390269C1825AA934BB8E6C6583169@MN2PR12MB3902.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Jt4ZJrqn/l0VH5clFjE4Zy0xpcW7YsMQJ+Ifs7m6FWqd/72uSjhdw3fJiAdRk3dbDMfweqhHEjJAQwx52pFMWbEqFiVPOnP0Y4F+t/W//aLO4Owz0S8hVk8ny8X6AX9F8VSNYWb83P3Dz9M9WZ93HAjMLJoNc9O1TouXZyMXTYXxu6aGBbPNX9sDqaLRd2P+ThNUJpaZBXvhnFrT+sDR/txeAtvT3ONONQTnRwCD0RcFH+a/h0/kYJ7RoMydJuEbOmAoSVqflCdbgpJ5KpUgU31KDtUoCL7lXaBtYNE7xzpTB04eE6ZLc/ra+tlxr1ZRUmS4LI+G2cC18kgJjcKFbV9eFQ0A3AJ/dvDwa9XGSLrEuywx2jVJGh/fUe2EKfZ1Y+/t1oye9U/d2s+PIkNRCWMXfaKJMocbyJwuVjoOdRvM4TLFhMhYECvLY/TCuY7Yq2u81DzoPl1HRal2efic5OoMVJ1LehK9i5O5rD/nRSyLxTE2L+R4USR7+rDzLOyVow39/lMEehdOiy3d6SO/O4PqwGWWYaSX4HQjYOvBhKDppcLcBfLfcMTzeZ17xyBOqnt76D3oN1230PhQGBgQzs9saIkeGOxE8jJaP7qfCFjKGX6TtFVXb5cj+DYCQbTP+aMGb8CIrZbuomBZTmN0OcQtg2ksxuGP6mX/FVasxFJ0VLuwSNcJhf/BvpDf0XctqUumqffkdhY5wrCoyjDOwSxIu/9o/ObOaM5Ay8FhvHL8JDD3UYQGY3Gd9W1b6eI9N/0Gy6BSLYPrATCgPDeKh8cpooFs1mSOqb89TYRHi0KzHFtuwyguh9yH9JFT03b
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(66574015)(2906002)(2616005)(8936002)(66476007)(66556008)(8676002)(4326008)(66946007)(53546011)(508600001)(186003)(31686004)(36756003)(6512007)(6506007)(45080400002)(6666004)(316002)(38100700002)(6916009)(31696002)(86362001)(966005)(6486002)(54906003)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVB6U1JicHl0TVJPOGN1RHJYbUU3bkhrY1g4Um1nS3JyWWwzamxZZ3pCRk1S?=
 =?utf-8?B?WDZMUEJBbER1Q05wVUFWanE2RG12Wkp3dklwUkc2OVdUYVBsWEQ5blNrR2tV?=
 =?utf-8?B?V1dVdVl4cXNSOGFIYVdGMVpKaE9lUDJuM1daOHpkYnZnQnJyV29NaVZCdHVx?=
 =?utf-8?B?VkhJd2p4YnBxS2QzN1lkT3RvbUV0WXJ4N2hJa20wMEZyai9CQ3R3MjEvUTdH?=
 =?utf-8?B?UEN0SzUrTzR6Z0J4M2lVbUhUQ29PdEhkaGs2SUl4d2N3TG1LQjVzSEdkWDJH?=
 =?utf-8?B?eHRKUW5Bak13S2E0SWVpUElHM24zcGh6aE1nVTFCS1dYSEhvQ0MyZHgxR3ZG?=
 =?utf-8?B?Q1JPdWNsRCt4U25odE9oQ1RtNFovaVpScFBmS2JvaEhISy9aQTNBdU5ReGxZ?=
 =?utf-8?B?ZXg3S25kTmxQR1FkRDJ5UjEwdDBQWGlnQnBvT003aVE0U0VxZDlUOFpyRllv?=
 =?utf-8?B?MXZnbEd0L01DUEkxanVJQmF3cVFsVkp6NUNZTEJkRW4wQXlaVWpvWXl5Z0l2?=
 =?utf-8?B?eTQ1RVZaNVFVWGZsV3p0L2ZsWk5SUXVtTE9tYURnaEJQanJpRVM4S2hlZDZG?=
 =?utf-8?B?Mk1LcE5rSU80ZXQxRUhncWg5Z0s3dEdCY0tIajZ2YnVxRjZPNjJJM0o1YSts?=
 =?utf-8?B?Mk5YWDhSZjZXNEZabmRTQWxWRklzZE9zU1lvNjArcFZBTFNPYWlkVHhqZGh6?=
 =?utf-8?B?TExGNXJlblIya3pTL1hIeEcyS0M3bFdoUHZ5bi9qbGNWNVdCbDhBZnYrYUJN?=
 =?utf-8?B?WS9FeEpWSHJtU1FUWk5yL1IwWllqM3gvaDRvRkdYRkxiOExDNE5pME13Rkxv?=
 =?utf-8?B?NExKRFRjM0tHemE4RDZRVlVSQ3NDRzI3cnFXaTlIRmc4U3I1ZTBEeE54YWR0?=
 =?utf-8?B?WHZ4bU9BT1ZLeGpBTlcxOUpFQThibktBdUNMOHVtTmtzT2JSUHZkVmI0dTdz?=
 =?utf-8?B?QlVrTHJRNEdhS0dIMFRPQTc1ZUlaMXRtV3JJeWRtNEZsbGdPN2dBYUNNMEo4?=
 =?utf-8?B?OVgzQnBVZ3VwZ3Vxc2dPaGdsTkRhc2d5L0RSNC9oQzN4MW5xN1p0SDZGVERz?=
 =?utf-8?B?TmtZVm5ZVlV3UnZ0ZDdsakx6V012dzVOdjJUOUY0UVh4blpFZzVCc0RvZFpR?=
 =?utf-8?B?OTQvRDdDaVFzcGxmdXNVMGw2dS9jU0MwQUpFelN0SllUdEtGaDNZbFVESU5G?=
 =?utf-8?B?SHhuUlFFQituNWl6dXNZUStWcW95YzIzUkxDdkVqeGN1aFRndTBMSjRlZTNp?=
 =?utf-8?B?dWh4RGVpV0FvOFZvSlcwYjJWQ0JWMDl5OXN3VGViS2dPSU12QUNLT2QwOGg1?=
 =?utf-8?B?VWl6KzRmb1V1SUVGQytvaWZUaklXbk1KOFd1TkNsYXQ5VXlUMTFpczY2ZDZ4?=
 =?utf-8?B?V0NSK296LzJ2c0svSEZ1eUpFeU5vK0xQQUR2dXRXKzEvUllBQ3FtNFhSNHV2?=
 =?utf-8?B?bW4vSTJEQnd1OUZjNkRsMm1jcUFuN1VZQ0JqNVJDTUV1VjkyVWE2Rk45djVX?=
 =?utf-8?B?QUo5Q0tWazc5eHdhdkJZNWFuaG8zK0RCWEFHM1VmM1FkUVJZb1lQMlF0VXJ1?=
 =?utf-8?B?OGlhSnpwSjNrR1IwV3U2Wmp4N3ozN1luczY5K2dweE40Qzh4Unpsa2tGSVNG?=
 =?utf-8?B?c3pFTldtOW5UNjRLMFBYOUNsRlM5a0JnUTEwZFlVenlQU0ljZTFRTDlqSDd3?=
 =?utf-8?B?c3ZSelhFZXNYMWRXNmVWenhMSGwzRjc4dkw2OVFaVTArK3V2MzNsdWF5bG81?=
 =?utf-8?B?YTR5UXJqTTlGOVVlS0VUcHRIdTZqVFlSUHNBdHRxaEFjRDZCU3dtL0xjdjlF?=
 =?utf-8?B?c1ZudWY0VXFHcU5CRUM0NGlFUGJ6NllTTjFBcXdjaXhOc0RYcUxnUUNRWnJ6?=
 =?utf-8?B?Mkk4cmpCeDdHOGhXTkpDM3dTNzdQYU9NYWNMWG1qNVl1dWhhT3h5TE9kWnps?=
 =?utf-8?B?aW02QXpFL2o1TlJzbGRET2d2VmlESk1PODNqc1JyVkZIcHREMnptQUpnKzIv?=
 =?utf-8?B?V1JyRk9tTXdtY0g3b0taOC9FS0E3Z1FpT1A1MlF3NDc5M3Z1Y2Z6d1N0NjRF?=
 =?utf-8?Q?/iMo9T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc584eff-0197-408a-cd37-08da0b1d6575
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 09:30:11.4584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BkJj4Ys5nI6fUdF+O1sRHC4/8hwi0f8anH/vjjVULL3yMJnJ/NiPmTr9emJmL2Dl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3902
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
Cc: Rob Clark <robdclark@chromium.org>, "Sharma,
 Shashank" <shashank.sharma@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Shashank Sharma <contactshashanksharma@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.03.22 um 16:12 schrieb Rob Clark:
> On Fri, Mar 18, 2022 at 12:42 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 17.03.22 um 18:31 schrieb Rob Clark:
>>> On Thu, Mar 17, 2022 at 10:27 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>>> [SNIP]
>>>>> (At some point, I'd like to use scheduler for the replay, and actually
>>>>> use drm_sched_stop()/etc.. but last time I looked there were still
>>>>> some sched bugs in that area which prevented me from deleting a bunch
>>>>> of code ;-))
>>>> Not sure about your hw, but at least on intel replaying tends to just
>>>> result in follow-on fun. And that holds even more so the more complex a
>>>> workload is. This is why vk just dies immediately and does not try to
>>>> replay anything, offloading it to the app. Same with arb robusteness.
>>>> Afaik it's really only media and classic gl which insist that the driver
>>>> stack somehow recover.
>>> At least for us, each submit must be self-contained (ie. not rely on
>>> previous GPU hw state), so in practice replay works out pretty well.
>>> The worst case is subsequent submits from same process fail as well
>>> (if they depended on something that crashing submit failed to write
>>> back to memory.. but in that case they just crash as well and we move
>>> on to the next one.. the recent gens (a5xx+ at least) are pretty good
>>> about quickly detecting problems and giving us an error irq.
>> Well I absolutely agree with Daniel.
>>
>> The whole replay thing AMD did in the scheduler is an absolutely mess
>> and should probably be killed with fire.
>>
>> I strongly recommend not to do the same mistake in other drivers.
>>
>> If you want to have some replay feature then please make it driver
>> specific and don't use anything from the infrastructure in the DRM
>> scheduler.
> hmm, perhaps I was not clear, but I'm only talking about re-emitting
> jobs *following* the faulting one (which could be from other contexts,
> etc).. not trying to restart the faulting job.
>
> You *absolutely* need to replay jobs following the faulting one, they
> could be from unrelated contexts/processes.  You can't just drop them
> on the floor.

Well you can, it just means that their contexts are lost as well.

If you re-submit jobs which were already pushed to the hardware you 
absolutely need to make a couple of things sure:

1. Don't race with your hardware. E.g. you need a way to stop processing 
in case of a timeout and then double check once more if things haven't 
finished in the meantime.

2. Make absolutely sure you never re-submit an operation when it's 
dma-fence is already signaled. Otherwise you run into memory corruption.

3. When you have multiple engines it becomes really tricky because then 
even innocent jobs might have already been started on different queues 
which now hang.

> Currently it is all driver specific, but I wanted to delete a lot of
> code and move to using scheduler to handle faults/timeouts (but
> blocked on that until [1] is resolved)

Please don't.

Especially don't use the pending_list or any of the scheduler 
infrastructure for GPU reset. We need to get rid of that again sooner or 
later.

This is extremely hardware dependent and pushing the amdgpu specific 
handling into the GPU scheduler was a mistake we shouldn't repeat for 
other drivers.

Regards,
Christian.

>
> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fdri-devel%2Fpatch%2F1630457207-13107-2-git-send-email-Monk.Liu%40amd.com%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C1f6ddc253f9341231fa108da08f1afa9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637832131381866493%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=e%2F1tOh3nxH3QfzKQKiJKjCU7Z5S6haX07F8rzwZhRVY%3D&amp;reserved=0
>
> BR,
> -R
>
>> Thanks,
>> Christian.
>>
>>> BR,
>>> -R
>>>
>>>> And recovering from a mess in userspace is a lot simpler than trying to
>>>> pull of the same magic in the kernel. Plus it also helps with a few of the
>>>> dma_fence rules, which is a nice bonus.
>>>> -Daniel
>>>>

