Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7646B11D6
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 20:12:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA23F10E6E4;
	Wed,  8 Mar 2023 19:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::603])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE6E10E6E4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 19:12:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsIzhhhJhNQJI+GgAD5LPIkN74pb1OqvQ8WZts6NYi3PXBEgSBrpn23KfBpwzYUTBh4lb8iZDcnDzFvxU2BdSaWXaHg1/nmLYcaRiUSzP27piqiIdbVacQAjg9Rk70ob3jgdblJV2uEcl18V1303k5cGmKOIJbUsa3X1FuJ4oGGufQFeUiaX7XcUbDh45n5Dk4TaAJXYaut3jXFvmjMugBGmwYEh+WLj0QbnObkZFameSlmlWFTOGKYXCLkJaVfOl3isDPX8/Ap8cObFqKJM9ybpTyPox9BSFaoYcWUcURFmJS2aCaxtuUQOfI0XeMw/hT+WFkQiFji8SiW4u8rr6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvMD3rZpKrsRWBRWHQxk8uzdVjcRQHwxZeP2qm9YdQI=;
 b=GCbtaxV85Pa0NCjJYYJAW/g1zjtB07LRbAfyTZMJRWTH2x1h3VOYbeskoAcib6pP6At7aKw+9OfwnArXMP4VAGUXsU0m0L/Pxl+fC6rzSGxVo+erXvcE7b1BneHoACLBkx81DSJWitHPxaOa6pc9VkpgC39InTfadmurqKx66ys+OYLqggGMhxByG2p0ZJ0wK/L6YjYZayMwaOqI5AXXnnRcj7HgxhuDiFCFYsrKZiUF7jcWBXF9FT+fk60fRIMFBvavkMf8oOvJQGCVENFmIQWyffA54xrQfVK3CVicF0y0tskX5L0bYFl8gVW8b+m4E86M030uYe875d+QbL//HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvMD3rZpKrsRWBRWHQxk8uzdVjcRQHwxZeP2qm9YdQI=;
 b=GO9o37qxNf8WTfuQ/HddSTq8UUgIIrzWu/OIcmGw+dhABcA4NEwkTptby2m80kb2V+KSdGkU9f15iXrx4I1Ii+OUDu6JPAKb9zxTHWAF4SHcHsEJgFIME9HlxSiYxh7hlhtqt9zItFCpS3cy51rioVBBrKp4UppvfwYQ2GaCQro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4973.namprd12.prod.outlook.com (2603:10b6:5:1b7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Wed, 8 Mar
 2023 19:12:47 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 19:12:46 +0000
Message-ID: <d1fccceb-ca77-f653-17fc-63168e0da884@amd.com>
Date: Wed, 8 Mar 2023 20:12:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH RFC 10/18] drm/scheduler: Add can_run_job callback
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Luben Tuikov <luben.tuikov@amd.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-10-917ff5bc80a8@asahilina.net>
 <cd788ccf-0cf1-85d5-1bf8-efc259bd7e11@amd.com>
 <a075d886-0820-b6fb-fcd0-45bfdc75e37d@asahilina.net>
 <2b1060e9-86ba-7e16-14f1-5b5fa63de719@amd.com>
 <9f76bb68-b462-b138-d0ad-d27c972530d4@asahilina.net>
 <a39c6b40-f190-002d-ae1c-8b58c6442df2@amd.com>
 <4bbfc1a3-cfc3-87f4-897b-b6637bac3bd0@asahilina.net>
 <b0aa78b2-b432-200a-8953-a80c462fa6ee@amd.com>
 <c0624252-070e-bd44-2116-93a1d63a1359@asahilina.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <c0624252-070e-bd44-2116-93a1d63a1359@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4973:EE_
X-MS-Office365-Filtering-Correlation-Id: df2adce0-35d2-4c67-92d7-08db20091a09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QcjVi5hmeuvy/3DWBIYqNlbwa4ui/wb8QJv1MXE5XLCSq3hx+er3+afflHmlbc+zspZKGiT7cpcuV0EfgtDZs7qbQ57EbVylJidHC8G5nPxD0c+XubWJsvbnAombmap1AA2rXvjKtKX3E+Th30Ak9abLI6p/jvGwmgvshiFrNwufSS4TbZiqfLHOeTU0vJ2zhuUj/EgfVHAvrXHzvZCcbDNiQOnMHL1R6r0TGxRHq4J10fXQNnsPM+VQ8Md6TJujuajhSk7RQeUxxGdebZ8FtO9WOzCToZISqUqUIRMZ3DNixsVcjA9yD7btNQcls60ojz1Mx/EQltune4rvI8e4PajlHBlX0L3QpZuvo10nChLiiTa+7Q/+E1SYhQAHMyjX4knZmQV3xBNlV+76ndWOIqDG+hMrxa2RxqWxJ0f9IM/ZAFNSBnpqCHpu60331GJFb08WRg01gqYrjESYPNUkzE58uv/K9lo18NyYwstHyScyLv4HoTqWHiv0CvUvmMaRwCzugUtXcfIsV7kLmTc8FDPsYENyi7x1LAIs8fyvRHEEwcTQM7e+M+GW5AYPxndtHScfEA1D1sJCTCUw6XkQaLm5x7UKB9eRpSG+7ndWPBGFme6pw9wHrbLmnTnTaOLHcxQDkadzKqdVAm8tE94uWFXgg9cYSVJl0Kdw2wZCcCHLebsS72VDjtCJl6UwVn5CiEkIJ7jduaQorVnx5nvHfQPMJ74i8WkYM76swemqyKejGo3vxZ4nhYnAWZ2xZPUr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(451199018)(921005)(186003)(2906002)(38100700002)(31696002)(2616005)(31686004)(6506007)(6512007)(5660300002)(6666004)(7416002)(8936002)(41300700001)(66476007)(110136005)(6486002)(86362001)(66946007)(66556008)(4326008)(8676002)(478600001)(316002)(36756003)(83380400001)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dG5EQllEM3VXWFAxZUhTb0FtMEIwYVlreFFkVXRndWJQVUFhcWRlVTRLSlNk?=
 =?utf-8?B?NXlHN3RFbzFqSExVZmRSWGU2eDk1bDd4RDkvNEM4b3RkMG8yanBHTHJmdUgx?=
 =?utf-8?B?SmludkZ4WTk0ODU4TUxtUTJ2QUg0czZ5YWFzc1ViOUlsd2ZUMEVpdFBqUlJ0?=
 =?utf-8?B?Mkd4bHpMbHFWOWo2SDN4VUN5QmZIMU44UUNYU2Nod21oZDNZUlIya0JBVHd5?=
 =?utf-8?B?ejNsRG5taGNLQzM1SnRqR2drUFlGOWQvSFl1bStROXpFRzFES29GWjhWYi83?=
 =?utf-8?B?S3RmbytoNTdLM3R1ZFo3bG1td0wyUnVRVW9OZkNsUGU3YXBoQ3NRNU45ZUJ0?=
 =?utf-8?B?cnJYbkp0akdxcUdoZDFtNmNudUE5YUwxUCtmRmYwdkEvL1pGdTErUFpWY2pK?=
 =?utf-8?B?RzJSRW1pT29mUWdtT1lZZkdmK3Y1dUZJaXFRSkdwY0Iyakw5YVoxMnkvTEdq?=
 =?utf-8?B?Tms1d0NzcjRGbXZ4cDdvcGR6aDNZcDJVWnVwb1RLQ2kxQnRpSmF5MS9KM004?=
 =?utf-8?B?OUwrSDBmWEhSYWkzck9JNlhoVldSanFkM1kzdjIyd2NrOUxOekpPTGxjRnU2?=
 =?utf-8?B?WWllYXhkYjN4aUt5VXlyVnQxcUdOeXFrSEtzQTFqbkgrUlZXOU5lYWg4YW1X?=
 =?utf-8?B?Nmp5RTQ2b1NjaTVuNVdTVUljRmI0QzhLMUFxWS9oYkd0WmgrZDF3K3FEZ3RY?=
 =?utf-8?B?Szc5ckhSMi9NQ25tVnFqcXcyU1BiS2lyL0pTcEowNnJ0ZkFLZXVGMU9JV0c4?=
 =?utf-8?B?VlRRUkgyUVVReTE0ZHg2aGxYU2Y2V1l3dFZxSSsyR2xIM2NrbDg4blJwcHJl?=
 =?utf-8?B?UGZpbCs4bWNmQ3BCK3RsR1M4cHZMSVlNMHp4UytFcjJGcDhDTkNYTU0zOFp0?=
 =?utf-8?B?cVViNzFDQ2xNd1JoWFVmMFovdHcxZXBreWhleEd0QnRCNEltQU9OUlpBalR5?=
 =?utf-8?B?S2hVd003cmxjT2t6VlV2cGJTMktWTjZ1WkhaOWhnVEdlbWs1TnlUYW5mSUVk?=
 =?utf-8?B?SFVwZ0hMUjhUaFRhOFgxRVBqVG1memZtRDRWUmg0SUI3aGwwbEk4cGlIVEhq?=
 =?utf-8?B?clB5eTZIVy83SG1nQU00ZE5tTjZYTmN5aDA5RGlEb1FkNUZ3SmtqcTJrdzFD?=
 =?utf-8?B?Q1JuUnVHSFQ3MGZnSVhIdnFQMHQzZmE3dURnY3R0anBYTzczMmNhRVNsTDQ1?=
 =?utf-8?B?QjJ1VlQvZVhveDI5eGpIeEg3alNBNGNZN1dqWUZQbXhtR2tDemhOZkRDNHFP?=
 =?utf-8?B?eXdMZSs5bXc1KzBMSnFuYnJLMjZrMzk0aGs5dFJlKzA2RFVKTmw4TndRZTdk?=
 =?utf-8?B?ZEUvS0JYZVNQUWVxTnpZU2FIckdLdmlKZDFhekhKc2FhZkd0Rys4NEQ5L2Nh?=
 =?utf-8?B?YzJGS2p0NjRpWnFsU2JJZTByMmhHY1hTTDBoWld1WkJ4SXNVM1k1bThXY0E2?=
 =?utf-8?B?K0hrNTdkYzdLOTZXRTRTV1NiNURrK1Z0eExGNVFvSzZmNHUwMmxJWnhOcFRv?=
 =?utf-8?B?SkNpemU0YXYxcGJ3VUN0RUE3VDlSTzg1a1BkWmxoaUxYUXdLVEJEZ3o5OUpO?=
 =?utf-8?B?cEU0Rzd5Y3N4S2NvY2FPUkU5aDBEZ3V2a21RK2JXRlQyN05pL09GTCtLTnE2?=
 =?utf-8?B?aXBVd1doUjRSd2swWDhOY2NGZjJKcVYyNHZ4NXBFSURabUNjb09UTzFXSnl6?=
 =?utf-8?B?RGpsN1M2Vk1JQ3hGSTl0eDFLS1ByUVM4ZERROVhBRjBHUElPLzFqdVZITnJ1?=
 =?utf-8?B?Syt6OUNuVEhrWnAvUUlBeFZpSjFEeFVTWkFBa0VuaGdFNm5wQkw5THh1YkZL?=
 =?utf-8?B?VzV4K204MTZjbU80M3BGNm1FcXJUVFp1emZJeWlCblFTQ3hKRkxxUVVSNlJn?=
 =?utf-8?B?OFA2a3BJRUQ0M1dIRzZhYzF4dHFKVDNsS2ZMUStKaGRVQUFzUXdyT2p6UlZH?=
 =?utf-8?B?SGNLQjcyYk1iN2V1OVZOTjlINWNCa0szS0lxaitnc0JqTDJ4NlU4VTVKSXlF?=
 =?utf-8?B?UEpxZ21FcEtIK1puazIzVEkvTTQ2M3dNZWV0UnR4cEZKMzZtWFIxVHZNSnlr?=
 =?utf-8?B?KytidWRIaFo2ekI4NHhjc083dGFrMWNSTlB4bmZGVGdQamErUG9sa0JiTWdo?=
 =?utf-8?B?djdZWXp5cDJWc0IxMXlZQkhHVm96ZTdTbzJyNXhkRWdiZnhEYS8vR01QZnhX?=
 =?utf-8?Q?zRezKXKqu/PLtbjsJKW7L98v6z0s7WST1D9kXGNF2Nkz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df2adce0-35d2-4c67-92d7-08db20091a09
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 19:12:46.7936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lPTO/QENqHbzUqYfdSbRXNkNSbPt17YR4XkDt1mTXHc9cydJINFqy0/9JphLz9fS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4973
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-sgx@vger.kernel.org, Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.03.23 um 20:05 schrieb Asahi Lina:
> [SNIP]
>> Well it's not the better way, it's the only way that works.
>>
>> I have to admit that my bet on your intentions was wrong, but even that
>> use case doesn't work correctly.
>>
>> See when your callback returns false it is perfectly possible that all
>> hw fences are signaled between returning that information and processing it.
>>
>> The result would be that the scheduler goes to sleep and never wakes up
>> again.
> That can't happen, because it will just go into another iteration of the
> drm_sched main loop since there is an entity available still.
>
> Rather there is probably the opposite bug in this patch: the can_run_job
> logic should be moved into the wait_event_interruptible() condition
> check, otherwise I think it can end up busy-looping since the condition
> itself can be true even when the can_run_job check blocks it.
>
> But there is no risk of it going to sleep and never waking up because
> job completions will wake up the waitqueue by definition, and that
> happens after the driver-side queues are popped. If this problem could
> happen, then the existing hw_submission_limit logic would be broken in
> the same way. It is logically equivalent in how it works.
>
> Basically, if properly done in wait_event_interruptible, it is exactly
> the logic of that macro that prevents this race condition and makes
> everything work at all. Without it, drm_sched would be completely broken.
>
>> As I said we exercised those ideas before and yes this approach here
>> came up before as well and no it doesn't work.
> It can never deadlock with this patch as it stands (though it could busy
> loop), and if properly moved into the wait_event_interruptible(), it
> would also never busy loop and work entirely as intended. The actual API
> change is sound.
>
> I don't know why you're trying so hard to convince everyone that this
> approach is fundamentally broken... It might be a bad idea for other
> reasons, it might encourage incorrect usage, it might not be the best
> option, there are plenty of arguments you can make... but you just keep
> trying to make an argument that it just can't work at all for some
> reason. Why? I already said I'm happy dropping it in favor of the fences...

Well because it is broken.

When you move the check into the wait_event_interruptible condition then 
who is going to call wait_event_interruptible when the condition changes?

As I said this idea came up before and was rejected multiple times.

Regards,
Christian.

>
> It's intended to mirror the hw_submission_limit logic. If you think this
> is broken, then that's broken too. They are equivalent mechanisms.
>
>>> This particular issue aside, fairness in global resource allocation is a
>>> conversation I'd love to have! Right now the driver doesn't try to
>>> ensure that, a queue can easily monopolize certain hardware resources
>>> (though one queue can only monopolize one of each, so you'd need
>>> something like 63 queues with 63 distinct VMs all submitting
>>> free-running jobs back to back in order to starve other queues of
>>> resources forever). For starters, one thing I'm thinking of doing is
>>> reserving certain subsets of hardware resources for queues with a given
>>> priority, so you can at least guarantee forward progress of
>>> higher-priority queues when faced with misbehaving lower-priority
>>> queues. But if we want to guarantee proper fairness, I think I'll have
>>> to start doing things like switching to a CPU-roundtrip submission model
>>> when resources become scarce (to guarantee that queues actually release
>>> the resources once in a while) and then figure out how to add fairness
>>> to the allocation code...
>>>
>>> But let's have that conversation when we talk about the driver (or maybe
>>> on IRC or something?), right now I'm more interested in getting the
>>> abstractions reviewed ^^
>> Well that stuff is highly problematic as well. The fairness aside you
>> risk starvation which in turn breaks the guarantee of forward progress.
>>
>> In this particular case you can catch this with a timeout for the hw
>> operation, but you should consider blocking that from the sw side as well.
> In the current state I actually think it's not really that problematic,
> because the resources are acquired directly in the ioctl path. So that
> can block if starved, but if that can cause overall forward progress to
> stop because some fence doesn't get signaled, then so can just not doing
> the ioctl in the first place, so there's not much point (userspace can
> always misbehave with its fence usage...). By the time anything gets
> submitted to drm_sched, the resources are already guaranteed to be
> acquired, we never block in the run callback.
>
> It needs to be fixed of course, but if the threat model is a malicious
> GPU process, well, there are many other ways to DoS your system... and I
> don't think it's very likely that 63+ queues (which usually means 63+
> processes with OpenGL) will end up accidentally starving the GPU in a
> tight loop at the same time. I'd love to hear about real-world scenarios
> where this kind of thing has been a real problem and not just a
> theoretical one though... maybe I'm missing something?
>
> Basically my priorities with the driver are:
>
> 1. Make sure it never crashes
> 2. Make sure it works well for real users
> 3. Make it work smoothly for real users under reasonable load
> (priorities, CPU scheduler interactions, etc.)
> 4. Make it handle accidental problems more gracefully (OOMs etc, I need
> to look into private GEM BO accounting to processes so the OOM killer
> has better data to work with)
> 5. Make it more robust against deliberate abuse/starvation (this should
> matter more once we have some kind of paravirtualization solution...)
>
> And right now we're somewhere between 2 and 3. So if there are cases
> where this resource acquisition stuff can cause a problem for real
> users, I'll want to fix it earlier. But if this is more theoretical than
> anything (with the resource limits of AGX GPUs), I'd rather focus on
> things like memory accounting and shrinker support first.
>
>>> We don't even have a shrinker yet, and I'm sure that's going to be a lot
>>> of fun when we add it too... but yes, if we can't do any memory
>>> allocations in some of these callbacks (is this documented anywhere?),
>>> that's going to be interesting...
>> Yes, that is all part of the dma_fence documentation. It's just
>> absolutely not obvious what all this means.
> I mean is there any documentation on how this interacts with drm_sched?
> Like, am I not allowed to allocate memory in prepare()? What about
> run()? What about GPU interrupt work? (not a raw IRQ handler context, I
> mean the execution path from GPU IRQ to drm_sched run() fences getting
> signaled)
>
>>> It's not all bad news though! All memory allocations are fallible in
>>> kernel Rust (and therefore explicit, and also failures have to be
>>> explicitly handled or propagated), so it's pretty easy to point out
>>> where they are, and there are already discussions of higher-level
>>> tooling to enforce rules like that (and things like wait contexts).
>>> Also, Rust makes it a lot easier to refactor code in general and not be
>>> scared that you're going to regress everything, so I'm not really
>>> worried if I need to turn a chunk of the driver on its head to solve
>>> some of these problems in the future ^^ (I already did that when I
>>> switched it from the "demo" synchronous submission model to the proper
>>> explicit sync + fences one.)
>> Yeah, well the problem isn't that you run into memory allocation failure.
> What I mean is that the mandatory failure handling means it's relatively
> easy to audit where memory allocations can actually happen.
>
>> The problem is rather something like this:
>> 1. You try to allocate memory to signal your fence.
>> 2. This memory allocation can't be fulfilled and goes to sleep to wait
>> for reclaim.
>> 3. On another CPU reclaim is running and through the general purpose
>> shrinker, page fault or MMU notifier ends up wait for your dma_fence.
>>
>> You don't even need to implement the shrinker for this to go boom
>> extremely easy.
> Hmm, can you actually get something waiting on a dma_fence like that
> today with this driver? We don't have a shrinker, we don't have
> synchronous page faults or MMU notifications for the GPU, and this is
> explicit sync so all in/out fences cross over into userspace so surely
> they can't be trusted anyway?
>
> I'm definitely not familiar with the intricacies of DMA fences and how
> they interact with everything else yet, but it's starting to sound like
> either this isn't quite broken for our simple driver yet, or it must be
> broken pretty much everywhere in some way...
>
>> So everything involved with signaling the fence can allocate memory only
>> with GFP_ATOMIC and only if you absolutely have to.
> I don't think we even have a good story for passing around gfp_flags in
> Rust code so that will be interesting... though I need to actually audit
> the code paths and see how many allocations we really do. I know I alloc
> some vectors for holding completed commands and stuff like that, but I'm
> pretty sure I can fix that one with some reworking, and I'm not sure how
> many other random things there really are...? Obviously most allocations
> happen at command creation time, on completion you mostly get a lot of
> freeing, so maybe I can just eliminate all allocs and not worry about
> GFP_ATOMIC.
>
> ~~ Lina

