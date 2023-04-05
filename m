Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 091C46D7122
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 02:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B87410E7F8;
	Wed,  5 Apr 2023 00:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2054.outbound.protection.outlook.com [40.107.100.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036FD10E7F3;
 Wed,  5 Apr 2023 00:13:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWQsBajwVUjguqp1PcKlR+QAdTMhSnQxo1Rl2ekGMzUrunOk5XYInlh/yHHpacPxoQs7Jfeo7KeUcjCr5XvAKwLShf8tbwbVyMyr6XATOrJ5BOw3EEwf52ZU+9CvB2EfkpAN7O7USHcIfTikthLL1O6MjgE5zKJkUhlzZKAPDIW/IqNP9JwXutEbS5Mo4Lb6iK/R+rwofTN3LvDwVrpPYUeEOxBdAigeG3Sy4pwZ2ko+8B+/ITevAtdhi7pIxY0VYuKbrtE6phFoqioZWLj9cdUHlkXtPkWyigHDrlh0vvC/GAhdRgUHyLgJTG8i7fFCmtbv83/RNJCUhwtmbN+Ueg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SaqwT9wlPfcyEodIoW6UopJ1g2z+2Z690Hjm8Xmr+ew=;
 b=IOF3abALuCVJ3SKhE1AM3VlDLjaeez84bz3TEXBPkO7m/Iyj8sZvVrzy44EukVETn4qFqgxzeOchbtj/79k7BeoBwRix0m0GwxEf0FidLEIsOi0FQuHPrcLOaQPtq5C2Ga7G0n+wR0zWqA6QOO5tSjPUqL5qYo411H4yeqpPvMNpaHbrb8b1Kzu7gqJuA6dCtpO/iDkYL8QdB9yLadsFvbqTimZo4QUf15iEUKpp6zzZ5lFPGO0Hcu/461vgFOuCf4URmR+EzZwBnWHnTvmUXAWekSlOGaP1n8yqLxErou5o7OF/hbnUxBsZfl1qRiykdy8EJ4tHMQl6FIdDnBrvEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SaqwT9wlPfcyEodIoW6UopJ1g2z+2Z690Hjm8Xmr+ew=;
 b=zbG/cW2eOEY6s3hqYtO2rcSn+oEHRNk4andCmo4Yw3SfHg10PtD/f/XseqKKbHB7gKMRH8qinJZR+PAFlZE/hKoLbaGCVMfu+a8t1Iga/Al1E3XxWln9uH6Z3mVNAqnouZtVRG+XB0ILVEa2rrUl+BonU+y2LjjquC4+P7zGHEY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DM6PR12MB4252.namprd12.prod.outlook.com (2603:10b6:5:211::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.35; Wed, 5 Apr 2023 00:13:23 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80%6]) with mapi id 15.20.6254.033; Wed, 5 Apr 2023
 00:13:23 +0000
Message-ID: <1c10f44e-897e-a363-2219-e559c880973c@amd.com>
Date: Tue, 4 Apr 2023 20:13:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Joshua Ashton <joshua@froggi.es>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20230403194058.25958-1-joshua@froggi.es>
 <1567fb39-47a7-d1d5-0652-371f7ffcb71e@amd.com>
 <09e2e192-6d24-23d5-1668-d6ac24c4136a@froggi.es>
 <5f82ce71-af56-1c90-51b5-173975e12fa9@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [RFC PATCH 0/4] uapi, drm: Add and implement RLIMIT_GPUPRIO
In-Reply-To: <5f82ce71-af56-1c90-51b5-173975e12fa9@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0112.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::21) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DM6PR12MB4252:EE_
X-MS-Office365-Filtering-Correlation-Id: dda44b45-1be4-4006-30dd-08db356a91a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S6u04dO3sg5nc4sx2uASyt1WZQmLYZtVg3gMUfSwUV1LORfwPihuN0qx72+9pY/j05J/fVvIxMN9oM68QMXCPpdGu21tk+em5gY33LUzMOBqPLdnGHauU/ph+bipKu9szd7zZj0eq33sbPOAxL4Nzjiww89SdHHiYpCqDoZPCDFzvw0yoPRP34DNl1avvJRl8qas24qhnMrM5j44K1d+FwX8bQkH/c4s5mIva5h92A710anofo9uVHn9KI33+Gv+pkIcaT6dvqhCj+3gPfhkKuzxeuieoAhj8SHgBTcW9j2DZEC1mG+gAiyoq/lAasnTZHfE63dFj/hlGyMphNUcQKLxwTtsU2O1trHttZYOFQyvtYIL+7GmxJSxgTYLATQtWOkF0s8A/xL5RWYG9WEbntLYDzjkcvYgxNPBiuh3ssbCkeLjob2JXhRyppk9fI9v5K7J80tS9nruZPRQT0o6DM+vbChJFMiu+NpBTe19ILwxeoqxqtagdTG9ZG6lSTsL6C0whJ73OeCbTm98dspyoI6PlbFFZZlvs14TbSSU8bdtyyGfcqR8xBgMLJGLu2KOaQHIt8DsFcGxtUIPT0ezuF3w5nA+HsTqhLiuxLhHVAkr/nckKx7VHiHnchjMG47SUuLdhsbr/Bbxfa1lpzvkFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(136003)(376002)(366004)(396003)(451199021)(6666004)(6486002)(66574015)(36756003)(2616005)(83380400001)(31696002)(86362001)(38100700002)(53546011)(6512007)(26005)(6506007)(186003)(316002)(110136005)(5660300002)(54906003)(31686004)(41300700001)(8936002)(2906002)(66946007)(4326008)(66476007)(66556008)(44832011)(8676002)(66899021)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3R3MzZQZURuNXdCRERZeHJNOThYUEhPNGVXOGgrU21tMFlLdEs0Q0xYeGFM?=
 =?utf-8?B?L0ZZb0c5MEIxRDYwZlYyZE4yM0Npd3IzMzZsUUxHak1nSjIzMk90MUErbHR0?=
 =?utf-8?B?dUZuaWlNMXc3NzdqbElTb0EzZCtKTCthVzZsNVUyTkV5TXBmM2hIb2dkblJz?=
 =?utf-8?B?VGxxT0tUMlBhZk1ITEF4MlBhL2l5b3BjUE4yeFg3MEdjTS9FdmhLa3ViaGVG?=
 =?utf-8?B?a2xVQkt0OTZSc3JWRjBIbEVuNEVkdnEzYklWR2pYblFsS05Zck8yS0l0dDB6?=
 =?utf-8?B?QTI3bFBhdndheTdyekc0NGFmeE5sbHQ1UEdLUDN6Mm05djJKZzY1ZGsvb0FT?=
 =?utf-8?B?RUdzQWFYNjlsUDVHZCt5eHRQcnpMb2NaRVk2TC9sbnVHemxTN1hRYTh1TllI?=
 =?utf-8?B?ZU83cjdCcDNxVFh2N2Q5MmlHUUNrc2RkYkh6SWY3aW9XdENQQmg5VXRjYklW?=
 =?utf-8?B?QUpyTHdGL1ZQWlFYOGgrQklWRjhrVHpCM01kVXFhM2gxT3JDRkRJd0RSQ2hT?=
 =?utf-8?B?cjArV0VEOVNvdVNnaEsvWnF6eUtOZTBRZlRDTEZFWWEweXVadXlQdGd5N2Z4?=
 =?utf-8?B?MVBDTnlPWGdJUGJwaXRkUGhIVTJiZmFlRE9yMUU1MWNCVkRWU0p3ZVEyeVVi?=
 =?utf-8?B?UnYxQ3VVS0pVaUdzbEZyc3N4a29DaTdOcVdDbUtZZjNNUys4OENuL1dMUWFw?=
 =?utf-8?B?ZEhFUzh4OFd1cXV0MDhJR1Z4WjI5Qi94Q1dVWE52VTQ4cTkyWEhVYXF5TEFw?=
 =?utf-8?B?Y0NueURXZkJlUEUrVGdGaDlpczdaVGlVamZYOGErcGpOcnAxMnJoTXNYbE4z?=
 =?utf-8?B?ZTh6VFV1ZXZmd3hCckRnNDhySHVqQnpMMTVPYVpYRzFSM2dvcnRuUnFMMlNQ?=
 =?utf-8?B?dmF1UkVGSEhTdGVhWk5FeG9uWjhyU2dGQUJGMjhEQlpnQ01mSXFJSDc1YXE1?=
 =?utf-8?B?c1RHSHl5WXV6UHAvU0hEdWtGOHVwVm9rN1VJZWZMS1drN2h2SzVscHNFUjNL?=
 =?utf-8?B?Z3BCdkVqaHEzVHVsRGREYXFqRG5aQXFzcWJTUjFxZ2NlTFBoYjVDVVlWQll4?=
 =?utf-8?B?NnI2b1RYWGJJUTZpM0Q4TmVaU2tBUDlBQkgrU2hJLzRySUlBajQvSUZtTk5W?=
 =?utf-8?B?THJJTVQ2NCtMZDBIRVY5cmNxZCtWbU0zREF3c3Y4OFdEbnN6UEp3b1pmelpm?=
 =?utf-8?B?d3ljOTR4STZGZkUyQVcrQTlMUkNtRDRwV253cjhsa29rRStBMnd1KzdrNE9I?=
 =?utf-8?B?TUZxdGNwTVlBYlk0TEhzWFhlR2p0UDRuOFBiN2dyNlR1aFdJaWNrV2ZvelFz?=
 =?utf-8?B?aTR6Z3IwblIzVHF0M0Nnb210ajlsUVc2UXAxSTB0NTg3Zm4zUTBKelJpQjRV?=
 =?utf-8?B?RFh2N1poS0xsSVNVKzMvZjFhUUp2QWIrUU1tQmVzTnFZTDNlcUxWOWhyQ0sw?=
 =?utf-8?B?OFFoNVlmbzFXLzhBcjhBMVNxQUpneU1NSmttdFNHT0dPMDdSQXFOSGlLck5U?=
 =?utf-8?B?SmR0L1U2OG9jdFB4ZEY0UGZiVXVqNXdKYytOTjNyV0U2aWlYSUdsd2JsSUdq?=
 =?utf-8?B?cnNaU0ZLRTY0bDVFYjE2S2htbFdKczlmMTN5eTJTaUdMVE9Kb3QxY01MR1dw?=
 =?utf-8?B?YnMvd0NkN2EvWEdEMzVYa3V3djg5bkpNTWIrU2MwS3VrcDZnVGlKSFVvM0E3?=
 =?utf-8?B?QWpkZGdkNTY4MDc1RU1sTElpYmsrUmU2Mmh1dE5HK3QvOEg3Nmc3a0pZUDAw?=
 =?utf-8?B?Y3IzbzBOT1NOWVNndmR2OEVDTU1adms3RkZOV1Z6YnkxblFtSnlsbmtQRWtT?=
 =?utf-8?B?OHJQTmNuY0d1S21sSHlnTmphT2VUYlBwcHpaK3FwQjliS3lFdWZzSCtuZEFk?=
 =?utf-8?B?L3NzQjMzQThZNkk5M2JzeXpVdGRGZmhGTm1SV0VPNFVlcitmSFRMY2NIRUth?=
 =?utf-8?B?M1BaTTc0VFp1QVByUnkyZVJoVmk5dVVUQnRFM0JiL2d5ZjFQNkZwYWR4VWxq?=
 =?utf-8?B?djN4d2NUM1k4cVA2MktFVUh6Q0d2czhFRFRaUVQrRllEekJHVnRGaEpNMEZr?=
 =?utf-8?B?Q1R3YUxqeEN3aHhReGszSVpLcXppR2w0RnBKRlRNeThmM3oxNWl0aVlHT1Iv?=
 =?utf-8?Q?HL/qqARndOm9+pjcK+dPA8ADp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dda44b45-1be4-4006-30dd-08db356a91a5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 00:13:23.0970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bz1YM041Wh+QhSHlAg+UA0msQNzRQIzi/NxuX8+vy4vapcLe0+UEA/8jrfBars0B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4252
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

Hi!

On 2023-04-04 04:50, Christian König wrote:
> Adding a bunch of people who have been involved in this before.
> 
> Am 03.04.23 um 22:15 schrieb Joshua Ashton:
>> On 4/3/23 20:54, Christian König wrote:
>>> Am 03.04.23 um 21:40 schrieb Joshua Ashton:
>>>> [SNIP]
>>>> Anyway, please let me know what you think!
>>>> Definitely open to any feedback and advice you may have. :D
>>>
>>> Well the basic problem is that higher priority queues can be used to 
>>> starve low priority queues.
>>>
>>> This starvation in turn is very very bad for memory management since 
>>> the dma_fence's the GPU scheduler deals with have very strong 
>>> restrictions.
>>>
>>> Even exposing this under CAP_SYS_NICE is questionable, so we will 
>>> most likely have to NAK this.
>>
>> This is already exposed with CAP_SYS_NICE and is relied on by SteamVR 
>> for async reprojection and Gamescope's composite path on Steam Deck.
> 
> Yeah, I know I was the one who designed that :)
> 
>>
>> Having a high priority async compute queue is really really important 
>> and advantageous for these tasks.
>>
>> The majority of usecases for something like this is going to be a 
>> compositor which does some really tiny amount of work per-frame but is 
>> incredibly latency dependent (as it depends on latching onto buffers 
>> just before vblank to do it's work)

There seems to be a dependency here. Is it possible to express this
dependency so that this work is done on vblank, then whoever needs
this, can latch onto vblank and get scheduled and completed before the vblank?

The problem generally is "We need to do some work B in order to satisfy
some condition in work A. Let's raise the ``priority'' of work B so that
if A needs it, when it needs it, it is ready." Or something to that effect.

The system would be much more responsive and run optimally, if such
dependencies are expressed directly, as opposed to trying to game
the scheduler and add more and more priorities, one on top of the other,
every so often.

It's okay to have priorities when tasks are independent and unrelated. But
when they do depend on each other directly, or indirectly (as in when memory
allocation or freeing is concerned), thus creating priority inversion,
then the best scheduler is the fair, oldest-ready-first scheduling, which
is the default GPU scheduler in DRM at the moment (for the last few months).

>> Starving and surpassing work on other queues is kind of the entire 
>> point. Gamescope and SteamVR do it on ACE as well so GFX work can run 
>> alongside it.

Are there no dependencies between them?

I mean if they're independent, we already have run queues with
different priorities. But if they're dependent, perhaps
we can express this explicitly so that we don't starve
other tasks/queues...

Regards,
Luben

> 
> Yes, unfortunately exactly that.
> 
> The problem is that our memory management is designed around the idea 
> that submissions to the hardware are guaranteed to finish at some point 
> in the future.
> 
> When we now have a functionality which allows to extend the amount of 
> time some work needs to finish on the hardware infinitely, then we have 
> a major problem at hand.
> 
> What we could do is to make the GPU scheduler more clever and make sure 
> that while higher priority submissions get precedence and can even 
> preempt low priority submissions we still guarantee some forward 
> progress for everybody.
> 
> Luben has been looking into a similar problem AMD internally as well, 
> maybe he has some idea here but I doubt that the solution will be simple.
> 
> Regards,
> Christian.
> 
>>
>> - Joshie 🐸✨
>>
> 

