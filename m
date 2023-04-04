Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCDD6D5B36
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 10:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD3E10E1EA;
	Tue,  4 Apr 2023 08:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2055.outbound.protection.outlook.com [40.107.212.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE6B10E1D6;
 Tue,  4 Apr 2023 08:51:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jri4YhIn1ASs/07oroa06hgK4qz5FnoPHRTOlqplvdPfVdc7OqKHg6acTkQ18nyHhheyTUjVfMiq9J/GqhiJ1QRTCattTqGf3gwuzUTe9vy7RWhB0HRw27kZEHmbNGk3t3NmgLoLkq3dnfCMMHZYNM0jx8ix+ER8xECxGq1ihpbrf9gXaV452Ib7XLA0xKk4mzyzM1BeW+Mzl6XiZNgrZbTA1S5S1LPv+Hd16Aq6IuQVfOcPNhvb3WO5X/ndK4TNqWzG8oNWo4zsL+j4noacCduqQpGY5vS1T+yDxKHf+ZbfOAAZfko0Iao9blVIcXFcccHbGs5rlbMA6DIigZQ1Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0fH+nLuMDUWwav/QwSFXeulH5zW6AwMiBbnVIxIwQA=;
 b=Hm/eukd0u5VmNwRLh3wsLBa/F1zEnY7lkcaArvVhKTtfSXMm6HS/sz2XjS970gMTXGVUQSJzut9sgXQaEhSS3HEQ0pgtepXGC8/exGt2+M6DlK6u3LXV5Yi+qulLIDQM5CE4z2ok3yZlZu2eTUcRp1vi+Lo/aG/33Y5v14KVHRGZgGhqVkV7Qini57kLDqhEKkmKsBG8pyTqEOhUrvLNFQoTQEdiWCNaAwx7JXe8skPe9lZehMDv+1/G5fOjsEkogHyfW5UIMfls/m/Q1OUWu7snVqFx+jwAxh/QKyBe5wU6V85KNlSomOazpanQ1HiuTmnbLR9dCjjMQUFkVswwsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0fH+nLuMDUWwav/QwSFXeulH5zW6AwMiBbnVIxIwQA=;
 b=MKGt3U/K9ym37vTaNhgA9Id9hoMuAw/bNI3ddWpQkf6GafN9Eupk/5Dqg0x07cqPn1Y6aAV4ZExnAx2ybppPSg4gvaElL6R84s/rwVguH7iguy7Qjon/4+rUtYntugfxxUoFE3M0eOEvaVOinN6nnNPcAZzvs5BW5PG7zT6ALFw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB8521.namprd12.prod.outlook.com (2603:10b6:8:17e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 08:51:06 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 08:51:06 +0000
Message-ID: <5f82ce71-af56-1c90-51b5-173975e12fa9@amd.com>
Date: Tue, 4 Apr 2023 10:50:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 0/4] uapi, drm: Add and implement RLIMIT_GPUPRIO
Content-Language: en-US
To: Joshua Ashton <joshua@froggi.es>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, "Tuikov, Luben" <Luben.Tuikov@amd.com>
References: <20230403194058.25958-1-joshua@froggi.es>
 <1567fb39-47a7-d1d5-0652-371f7ffcb71e@amd.com>
 <09e2e192-6d24-23d5-1668-d6ac24c4136a@froggi.es>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <09e2e192-6d24-23d5-1668-d6ac24c4136a@froggi.es>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB8521:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d35b1ad-e666-4a55-f302-08db34e9ba3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0PcsQ9xVgLWXeggowmdAikcvYkrekIVxPNqzKigTxfg2zWY1IW5lAfibbUswAsxKqvRg87AtWGUMBWe3e+3qCAW4TG51lZ/8/ae7xuMfQrLcCxvCabYL175x0tW+zRsyIBzurRQ/g7hRMC9cguqgDNe88EyaNrX0AextQxfzoRO0dAvXeZgM4oFjWzEkkZyX/p7Rok3UJlRMzEVX7HKN+A8O1f6XktVPLVZxsES3U+a5K1v0yx/yzVgJ1aWxieyis+AJGrb7hmgq7hoVUnwS69Pr8MK3bwnf0H2GQwLTpp3QSGRmL+AuAvtQUYU3Wmths2tVDYlLO3vmhzE8NKB+qlSU8OvQCC5AaJnoh471rOlihxrQSu3r9iaoND7j0fhayJC41RzOhrz9JZt1NWnJ3mZl1NGCSoc2ROlNSGRtGFVqmQ/0KKQLU7+3JeB7RvW+MawtGSmiV6j01yISFqTICNArYGcsqeD2Ay/k2fSFlP2DaZ3gcdjBG4Jfe8dAQhcm9oNVUGmWMjo9RgL+jyiW5IphhdxGVlbUN97AQFFexHv41qekl3FviNk7I6FPPGIaWD5ymA5mo5PgIzKOjOj8/JixuEjmC0t6y1d5QLQBHf7DPqdyG9WyrFHDjb9DDLbf+yBkcM/JMsR8lCW1lnN/NA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(38100700002)(5660300002)(2616005)(66574015)(31696002)(54906003)(6636002)(6506007)(316002)(110136005)(6486002)(186003)(53546011)(6666004)(478600001)(86362001)(26005)(6512007)(36756003)(4326008)(8676002)(41300700001)(8936002)(66946007)(66476007)(66556008)(31686004)(66899021)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEYzWFRUdmVtZFNxS0xhUm9LbzV4amJBcEswVE13Q3A3emRRTWwxcEtHN1lI?=
 =?utf-8?B?Uzd2WmIxVGdHWlZXT3llMkJaSzJod0hoN0FhYTVRcjJCUzhHdWVlNy9BRW1s?=
 =?utf-8?B?ZmI5K013V0g0a1Z3RXVjZFdzM3hYS1plTGU4angrQnZHVlJRcW05VjM1VzFu?=
 =?utf-8?B?WG4vbW9PQmk4bnRxSVlKd2FaZ0FCaktsVEdTWVN2Ky9YeVhQNjJPcEJaMHRP?=
 =?utf-8?B?d0FZNEMzUXQvZENITkhvN1l0VFRqbGNaQVFFRlBuSFRIQmFWM0FaY0hZNE1F?=
 =?utf-8?B?KzFmSnNZNWNpNSs2dXNGSjFRem9EY2Q1MzFGZHZBckVYaktadi9iM283em9V?=
 =?utf-8?B?cGJzcWk0L1E1VFo5VGFuUFVCYUp6djVPTTRIUmh3bDlwQzc2d1JhK1VPRndi?=
 =?utf-8?B?OUpQTTVKMlU2Ym1XN2VaWm9jRVFiaFFwZm03Q1JaaHdKM0hTZm0zdytBbkpB?=
 =?utf-8?B?UE9XdXJ4eThpVUJzWkJteW85c0hhZlFCWUJmdXdiWXl2M3p6MTh1bHFoenlw?=
 =?utf-8?B?bUN3QlZQZkloR29KbnNhMmZpTUtjZnFWY3JiY2RpdllXb2hSWVNFd21SMjVV?=
 =?utf-8?B?dnBYTElYS2RoeFllckpRNVVUbVYzRUd4cjduWlB6NFpZTmxnR2NsaUZXNDRQ?=
 =?utf-8?B?N0NnVFNlZURCQ0g3MnltM29EU1RmZ2FWL0VSN1RnaUtUelA2bnJwUC9iWFVD?=
 =?utf-8?B?YVdNSlFjdnYySS9TREtKd1o5QzVIZWx6RmhKSzM4Wk9VQkIydld1cU0yMGor?=
 =?utf-8?B?bXQxRmpieGFmdmN1RExXelJrMEFZNGY2VFV1V1FxQkU5aVFJRkNibjBxYytt?=
 =?utf-8?B?TU9ZUUprN1kvZ0ZmS0oyQVltU2krRFlWV0owMFFFc2NMdENaVEM5T3NIU000?=
 =?utf-8?B?aGZqb1VvS3lJb3BwRk84RU5tbUdSOU85eWp1S3lxakdENUJlUkgxanp1bG1C?=
 =?utf-8?B?aUdlK1pLRVlkSTE2YnlVWFdVamZrYlQvOUVucGttN2owWnlSUDBHUmR5bGFV?=
 =?utf-8?B?MGMzZUNkVEg4K0NOS0JXOG5MYm5YVzgraW55ZXhab2JvRU1ydFpENGZmeFFG?=
 =?utf-8?B?ZHZSY3Bqc0ZraUQrbnhCTXQ2Q1pncldOeFFGK3hFU3cycThTV3JGZmd6b0Iv?=
 =?utf-8?B?L2NXblNYaEJPcVJRSkRPNHhnTXJoTEIyNG5XYmoxRWNycWxHZlNnYUVsajhi?=
 =?utf-8?B?RHRyKzk4bkVOQW9nSzBIakxrZCtzNHRuajV2cnZJVzVjQ1FoUTZRU21nWUlD?=
 =?utf-8?B?ZkxleTlZcVRLVUpCNXV4T1JHcC9EV3ZMdWJZZng5dkFpdTlGYmxyK29xTC9J?=
 =?utf-8?B?S2c0YTl6U1YyU1ZmMlBvYkJieW96VCt2Smh5aE5WYm5ZZDk5WGdTeTFkd2Nh?=
 =?utf-8?B?OElkek5GWlpqL2JpS0lQZzlsZ0tUeDg2M1MycUpjckR3WWxibDdNVTMxU2N1?=
 =?utf-8?B?OUhuaVV5QzNsUDhHSWxZZUdFYm5tNWxGYjVtSGI4MklITGo4YzlhUWl2RENq?=
 =?utf-8?B?Z3hqbnRGS1VoaXZnWUpLT3k3dkdyOVJKTVQ3ZnpZcUNyMDFQRFdUQXFmL2x5?=
 =?utf-8?B?SC9jb1lOSk9KYngxRDN5ZlIzUmdEK3Y0eFVCYjVQTzYwWWtncWJIVmpuZ0J3?=
 =?utf-8?B?dEhmd0xrZWpDUUJJb2tsTFM2dXM3S3UxV2Y2aE1KZHo0bUcyV25sTTRielF4?=
 =?utf-8?B?ZGR4WFY1RTFTaHhYQ0Viekx1Yk9WOU14a0tLT0NlVHl6RmsrV09ncHZ2eTFP?=
 =?utf-8?B?Vk8rY29jeE1EUnNOZ3VhMEoxaE53REo1cTFJWnpPMCtNVlg0WWlobWNrV2Ja?=
 =?utf-8?B?Uk84d3h0ZkNiUUhMQUxqdHJHZjdwaDFaWGZqN3lyT2ZodnlqZE5FWFpqY2N1?=
 =?utf-8?B?ZG8yOVhHZVI4eHdMdS85NjJORW9uNnZUT3dWR1pTK2RHcnBXZ3k4amE5NDEv?=
 =?utf-8?B?S1JURGZhb0x1OEdCcUJMeG5JSVQ0VVdLMS9Ub21wdTQ5Qm4yUlR4cWYvY3dU?=
 =?utf-8?B?N0k1RWxzZnNtOTM1QndUb2lBZytTd2dCdWlhajNXbHpid29hK0xhRW12dmZu?=
 =?utf-8?B?SHQ1MGpVOXJtaXVDRW4weG10T1FvZ0FmVEhnYXlZeHEvL2VmbVZiZHo2bTcz?=
 =?utf-8?Q?aDds=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d35b1ad-e666-4a55-f302-08db34e9ba3a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 08:51:06.1936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jYOCqZBH9LWvDO1tXZUH6254nTrQVUkQ2qt6JQlsOCktwtyoebMuvNV7UnGnRJP4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8521
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
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding a bunch of people who have been involved in this before.

Am 03.04.23 um 22:15 schrieb Joshua Ashton:
> On 4/3/23 20:54, Christian König wrote:
>> Am 03.04.23 um 21:40 schrieb Joshua Ashton:
>>> [SNIP]
>>> Anyway, please let me know what you think!
>>> Definitely open to any feedback and advice you may have. :D
>>
>> Well the basic problem is that higher priority queues can be used to 
>> starve low priority queues.
>>
>> This starvation in turn is very very bad for memory management since 
>> the dma_fence's the GPU scheduler deals with have very strong 
>> restrictions.
>>
>> Even exposing this under CAP_SYS_NICE is questionable, so we will 
>> most likely have to NAK this.
>
> This is already exposed with CAP_SYS_NICE and is relied on by SteamVR 
> for async reprojection and Gamescope's composite path on Steam Deck.

Yeah, I know I was the one who designed that :)

>
> Having a high priority async compute queue is really really important 
> and advantageous for these tasks.
>
> The majority of usecases for something like this is going to be a 
> compositor which does some really tiny amount of work per-frame but is 
> incredibly latency dependent (as it depends on latching onto buffers 
> just before vblank to do it's work)
>
> Starving and surpassing work on other queues is kind of the entire 
> point. Gamescope and SteamVR do it on ACE as well so GFX work can run 
> alongside it.

Yes, unfortunately exactly that.

The problem is that our memory management is designed around the idea 
that submissions to the hardware are guaranteed to finish at some point 
in the future.

When we now have a functionality which allows to extend the amount of 
time some work needs to finish on the hardware infinitely, then we have 
a major problem at hand.

What we could do is to make the GPU scheduler more clever and make sure 
that while higher priority submissions get precedence and can even 
preempt low priority submissions we still guarantee some forward 
progress for everybody.

Luben has been looking into a similar problem AMD internally as well, 
maybe he has some idea here but I doubt that the solution will be simple.

Regards,
Christian.

>
> - Joshie 🐸✨
>

