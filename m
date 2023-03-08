Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 282E76B0C0D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 16:02:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDAE10E5F6;
	Wed,  8 Mar 2023 15:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2058.outbound.protection.outlook.com [40.107.96.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD1F10E5F6
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 15:02:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+oYnlYr3SKAwGs9GHMwvXw44dPPjPGIxgVFkilID2AT1sT6V6ex1Q+U+ccW/mxNJfH47q8yQNqHz+LmzWYjyWr2bdHGIx6t/XYOfu7eYE4jG+INX8/pNspXwadqyX3lb5gxLmeZShbjrl6iDKrInkdCFUei04npCbz6wRGDEDW/TW4SPQoFP8LGVI7BXWbm1/kov6af2ytzVzvXFrtcKziIiHxunMPCxeJ/ASRHsRc+5SaSSnbmKdsr/dvbyIWH/XLY/jHJcgW7Z3frhJdiINmFbrqgJ6qghp5CH8Gan8RN1NvGfmc0nd32FOOXj/cHqL3XC1YRV0eMnkj094ZEHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0Bq9/NAvDHT5d2Pey/mtPZTGtoV1EgcrqG5Sr2WXjM=;
 b=IVlvv3X8gtlsYOWj5edHxbJ5NuRQGmv57PjEschlpjq+dYSFUsVA1MC4jGluQnn0t9Jd+mtmEfOx1SzETB7VLChpub6vfwpKU6L6q6Z9qahJSNiKWGP/QQZKuXnubAMS2GN3I9ehkv4I/DnK2svoxo2GXhMxU0MpKMMUOQgKbS+lbAFhcv4nRezAB1TqMePn7wxbeTdkOJy9jF0HSHJKq7Tq9wXIybYvKPamezmhuZK+2s6T5Zf2Z8YjG8tNTUvsn5LqhJZc8N5BXHG7Q+D9OynKiz0DXxXqXIo5bK+KlSz8/0RcMy7bw93gqtk6yyKU3BzTootFhwLz/kE1bGA9Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0Bq9/NAvDHT5d2Pey/mtPZTGtoV1EgcrqG5Sr2WXjM=;
 b=Ly9iAjwGzA4OKe4PTGbh5ypfttaA/BCqZ5KHO5qz8U9At9GxdoTpsDRwa8/+J+JegA1aELrdgbp7wrAb572fKoWf9KE/OaB2OH8Yg5ZnL9obCtXZ2r+kzciw57zwXyPw2NPVs7ICrP6jcmTqmKzxjCGBj92Xp9SjPo1ZrjuZcwc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB7007.namprd12.prod.outlook.com (2603:10b6:a03:486::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.26; Wed, 8 Mar
 2023 15:02:47 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 15:02:46 +0000
Message-ID: <269c4fb7-60f6-6778-444d-15703febea58@amd.com>
Date: Wed, 8 Mar 2023 16:02:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH RFC 10/18] drm/scheduler: Add can_run_job callback
Content-Language: en-US
To: Karol Herbst <kherbst@redhat.com>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-10-917ff5bc80a8@asahilina.net>
 <cd788ccf-0cf1-85d5-1bf8-efc259bd7e11@amd.com>
 <CACO55tsnCMQt8UW5_UCY139kpZOdNXbMkBkFfUiB12jW5UgVmA@mail.gmail.com>
 <0d6cd23b-8c9e-067d-97ff-aa35dbbcf9bf@amd.com>
 <CACO55tumNMYrcJ0LhnLfTK4DmGLHD-bt3xpXyoPe98V2wmgXQg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CACO55tumNMYrcJ0LhnLfTK4DmGLHD-bt3xpXyoPe98V2wmgXQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: a1050d3a-657a-46a7-c01e-08db1fe62cd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vI8wyd3dAaS4LKfE5VRocLnyvs1Zawl9QI1IEeGx2aIjqN+cfyLmMh7wUslVI7SI7rjAIPCrQXVMUDwUmyn6FR200ustWM4UfXDY8y2gnnfDLj8HoWY6qnDw7ngtX507lnevmtyUzIt0PrDoibRCwiqGqYNMKfViiX7NQ36atsNCBwXKKKCeIoDIRA8JlXcAlZ+4cDNGVezleBEafu+N/noNi/duOPRNkoZKR57jYsXEcvwyKVHWXjjvbbKQ9I/72i5G687AXYZ5lFylHV5rhY3TWbydm8HeIBbc5Te3OLa+3tTAePvzGzTXdL8UfOl2w8cNfrjuel1MuXN6l/a5ODo4IQfVQN/ZgwjHazEgZNE9/i/B8HJVO0GjrshCSD3QjCG1WZNAxHphC1sISqOCkKHVdcRl/gH9tmaFxroNdZzbQoYoSe+/kUfESDUbgKgTXbjFgDdksf5e8LrgjyDJD0455MkmhYUW1ZkCy0aYVjMlzyBcXIhOfpjVeTNoe2asHAx5Ze29vWaHFiWy7ZyjC4tpIZX2k86QNTaO8feEdXeOQBVwtTZmzMCXl/fgJor3xmfbA1dGACjY5arlI0SZGVscSi4fnTfw7oRNJtgzQOe5YMCAd9PLPlu/nZXW6DHEKsFyKbbdoYiFuC/uehsvHQyUpGNsKSQEa5TxdnOyCQVRn8xJtnvgzZBqnoBr/ZHP6CUkfie0CTAFKMhHyjWAUSoZA5dprATt/EUiPJNMrt0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(451199018)(6486002)(6666004)(36756003)(6506007)(966005)(38100700002)(31696002)(83380400001)(6512007)(186003)(86362001)(2616005)(41300700001)(4326008)(66476007)(66556008)(66946007)(6916009)(8676002)(2906002)(31686004)(8936002)(5660300002)(7416002)(478600001)(316002)(54906003)(66899018)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGpqTmxYc2dsK3Z5QTY4VUt1UUJRdzRhQ0FZU2JTeDBrUnBpZ1JhNFZMYXZ6?=
 =?utf-8?B?eE9sTVE5S3FVdWUvTXk5Mzk3TnJPNTdrZGkrTHJaZkYvT0hpZWN1cEVkaTRI?=
 =?utf-8?B?UHlNRUtQRFExS0hJd3FwdFdDQUpzM1FuVlAvbmg5anJxcTNwdGJsZS84eHho?=
 =?utf-8?B?enlTdzhpUzhnOC9ZZVlSMGR3N3BEWDdibWw1bEY4aW0vSVZFbGxTRTNZNEU0?=
 =?utf-8?B?TE9qaHZLazJUM21peUlJbm9Ha3BNWmo4VEQrWGgyaDVKNHZ2V2JQVWRtelJy?=
 =?utf-8?B?WFNnd0R4Sjd4c0cwTDhCR1NXcFRKZnVTMGQyNnFGWEpkM0FaaXZwazZwZkJE?=
 =?utf-8?B?UXoyL2dtcDZTcnQyS0g5QVlQR3VndWEzR2QwSE5xdkN5eFhpaCtiekZIRzhS?=
 =?utf-8?B?RVZmUWtucTg2Q2FvbXVxY1hmcnZOZ2U2ZmJIUHRTS3RLSjhPd1lxZFNzLzIy?=
 =?utf-8?B?b3pROGVudzRlVWFBS3Faam9yYlQ1RnYyVS8veU5NWERCQTI0SVBhMXNOQnI2?=
 =?utf-8?B?MTBjd1c5ZTl4WmZVT1BCbHVoei9iWVNWQnNYbzRwY1pBWDMrWGt3cDF1cVZa?=
 =?utf-8?B?ZGt3QXpPN0JZaDVQRzdoNGFhN2x3b3F6MnRKV2hjOEYzQmo2YS9rNzJtV1F3?=
 =?utf-8?B?UExuOStra0NlY2NWWGhidnQrUUEwL1JVM1kwNHVIeEdMbGxIc09WVVdvcXR3?=
 =?utf-8?B?UzlIVGtOTnhLa1EyZVZ6ZGF2blN4TzRibnA1NVpPTnlRdEJjTEowL0xvWms2?=
 =?utf-8?B?MjFXWVVTTUFwNzRjbEVuYjRMaFg5MDl1aHNkWFV0SW96dnQ5ZCtaVS9MQkhJ?=
 =?utf-8?B?WDdlMmxCY21wZjZqeEtPU3NSa25vSDI5ZXhLQ0VBT1dwRFZKRHZ4M3UyNXZJ?=
 =?utf-8?B?TnNCK1JNVkkvaWI4T0plR3h2NlVmdzBxcVdocmtMemd5RWtiNXdLVjU4eG5J?=
 =?utf-8?B?NGhCT1BGUjVBOUhnYXFieGluMXp2N0I2akJHSlArYVlWdEQ0bEwvNWhFUVFk?=
 =?utf-8?B?UDd0bjM1MnRwZ2UzcVNtQ01JdzdVYnNlYlR0aTVJblJSdTBzcys1MjRPT1VL?=
 =?utf-8?B?ajIrOVBYaE5ZNWg1SXQwRTBaMWIzVmZKRWEydzRXbFA5N0xjMW05aTZ5NEdn?=
 =?utf-8?B?cnJSdTltLzVDTEpkVTVMY2VyN3JCcU4wblcxRmg5c21IQ2xtekNDWWdlUitS?=
 =?utf-8?B?TFd2SXFXVW1DOGxyWEN2YXZhYllsUC80Zmc1dWhtUkZsN1M4UnMxbUMwUCts?=
 =?utf-8?B?dGF1UDFneUFTbzhnZEM0MWF6bWVzVnRmbnlZVG9jMmJ4dEpIaU9hK0U1NXJO?=
 =?utf-8?B?cGdCNnh6cUhzM1V4ZXg5bDhjWHAxVUE1SFdyWk9aM200WExaSlR5NnpsV0Rz?=
 =?utf-8?B?aXdWaThKcC8xMyswRCtyM2lpc3VPZEIrZCtKWVNJc3V0by96WEdjdzU1bXpL?=
 =?utf-8?B?SEROTDdCdXBCaDhtRU1IN1FVQ0ZMUTh4c3BvWFd2dUJvRkp4QXhiWm5WK1dk?=
 =?utf-8?B?UCtPTDRNYlduQjczRnhTYzNnVng1dVBoYVZ4dWt1V0JtemVibm9vaFd2eHJ0?=
 =?utf-8?B?QTZqbGN2Q1l2ODMvMDZMYzBnTk5GSlo2NFUvSkpMcjh4UW1MdzVEcng2Wjk5?=
 =?utf-8?B?aWFKU24yRDU5SDRuNVMvRUk3UTVDclpla2lpYjRrMXVRUTduZVk3Y05zN3B2?=
 =?utf-8?B?Tm5vbGRzSytYdEM3TmREUGJCUWRQWitWUUpveUV6QjFxZGJyTnRKTk9yS214?=
 =?utf-8?B?d2w3MVBudGVrWm5Ja3lpUXNiMGV6UHFFcjhUWG5ncjJORFdQN2xScjQweGhq?=
 =?utf-8?B?bnhGVGdRRFBLYWl1c2w5b0o2LzhaTlRtMUFpZyttUEtaTkpOS1c2YkdCN2ZH?=
 =?utf-8?B?NTN3VDNiK0NUMG9ZK0Y0a3F1eDVkVWN1ZXpVSmQ0SjB2eVVJb3pLVDVBYXhk?=
 =?utf-8?B?TUtkRW03eU5pck13U1RFeXI5R2tRQ1V3UDFGUnRzZ0V4YkIrOFplT0t4OG5J?=
 =?utf-8?B?eC9Ld0s3anFEMk8vdmxOUC81d0w5SHJEZHlEQWtYam14Q1ZiTVk0NDIwMmJi?=
 =?utf-8?B?Qk9xemZUWGdnWURrQlI0Q0FkZTFqQ0hZLzNWekRMYVM0M0IzSVdnUkM5cEhF?=
 =?utf-8?B?YndYZlo1RDd5cDRTZGJiVVMvMGwwdnpJVk1YdEVmajhhaXgzQW9RQzNGcDFy?=
 =?utf-8?Q?JT/N5WUMruiOvVwpUQ8RQdg7ApiiIwgPJpcVPRnOiovL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1050d3a-657a-46a7-c01e-08db1fe62cd1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 15:02:46.1221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QbFo1q0ryZ54L/JaWG83P22tg+NexxyUrcpKIWOOCCwpBDBVEoE4ALGYPYwB3B0f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7007
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
Cc: Asahi Lina <lina@asahilina.net>, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Mary <mary@mary.zone>,
 Gary Guo <gary@garyguo.net>, Ella Stanforth <ella@iglunix.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-media@vger.kernel.org, Wedson Almeida Filho <wedsonaf@gmail.com>,
 rust-for-linux@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-sgx@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, asahi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.03.23 um 15:43 schrieb Karol Herbst:
> [SNIP]
> "further"? There was no discussion at all,

Yeah, well that is exactly what I wanted to archive.

>   you just started off like
> that. If you think somebody misses that connection, you can point out
> to documentation/videos whatever so the contributor can understand
> what's wrong with an approach. You did that, so that's fine. It's just
> starting off _any_ discussion with a "Well complete NAK" is terrible
> style. I'd feel uncomfortable if that happened to me and I'm sure
> there are enough people like that that we should be more reasonable
> with our replies. Just.. don't.
>
> We are all humans here and people react negatively to such things. And
> if people do it on purpose it just makes it worse.

I completely see your point, I just don't know how to improve it.

I don't stop people like this because I want to make them uncomfortable 
but because I want to prevent further discussions on that topic.

In other words how can I make people notice that this is something 
fundamental while still being polite?

>>>> This is clearly going against the idea of having jobs only depend on
>>>> fences and nothing else which is mandatory for correct memory management.
>>>>
>>> I'm sure it's all documented and there is a design document on how
>>> things have to look like you can point out? Might help to get a better
>>> understanding on how things should be.
>> Yeah, that's the problematic part. We have documented this very
>> extensively:
>> https://www.kernel.org/doc/html/v5.9/driver-api/dma-buf.html#indefinite-dma-fences
>>
>> And both Jason and Daniel gave talks about the underlying problem and
> fyi:
> s/Jason/Faith/g

+1. I wasn't aware of that.

>> try to come up with patches to raise warnings when that happens, but
>> people still keep coming up with the same idea over and over again.
>>
> Yes, and we'll have to tell them over and over again. Nothing wrong
> with that. That's just part of maintaining such a big subsystem. And
> that's definitely not a valid reason to phrase things like above.
>
>> It's just that the technical relationship between preventing jobs from
>> running and with that preventing dma_fences from signaling and the core
>> memory management with page faults and shrinkers waiting for those
>> fences is absolutely not obvious.
>>
>> We had at least 10 different teams from different companies falling into
>> the same trap already and either the patches were rejected of hand or
>> had to painfully reverted or mitigated later on.
>>
> Sure, but that's just part of the job. And pointing out fundamental
> mistakes early on is important, but the situation won't get any better
> by being like that. Yes, we'll have to repeat the same words over and
> over again, and yes that might be annoying, but that's just how it is.

Well I have no problem explaining people why a solution doesn't work.

But what usually happens is that people don't realize that they need to 
back of from a design and completely start over.

Regards,
Christian.

>
>> Regards,
>> Christian.
>>
>>>> If the hw is busy with something you need to return the fence for this
>>>> from the prepare_job callback so that the scheduler can be notified when
>>>> the hw is available again.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>>>> ---
>>>>>     drivers/gpu/drm/scheduler/sched_main.c | 10 ++++++++++
>>>>>     include/drm/gpu_scheduler.h            |  8 ++++++++
>>>>>     2 files changed, 18 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> index 4e6ad6e122bc..5c0add2c7546 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -1001,6 +1001,16 @@ static int drm_sched_main(void *param)
>>>>>                 if (!entity)
>>>>>                         continue;
>>>>>
>>>>> +             if (sched->ops->can_run_job) {
>>>>> +                     sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>>>>> +                     if (!sched_job) {
>>>>> +                             complete_all(&entity->entity_idle);
>>>>> +                             continue;
>>>>> +                     }
>>>>> +                     if (!sched->ops->can_run_job(sched_job))
>>>>> +                             continue;
>>>>> +             }
>>>>> +
>>>>>                 sched_job = drm_sched_entity_pop_job(entity);
>>>>>
>>>>>                 if (!sched_job) {
>>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>>> index 9db9e5e504ee..bd89ea9507b9 100644
>>>>> --- a/include/drm/gpu_scheduler.h
>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>> @@ -396,6 +396,14 @@ struct drm_sched_backend_ops {
>>>>>         struct dma_fence *(*prepare_job)(struct drm_sched_job *sched_job,
>>>>>                                          struct drm_sched_entity *s_entity);
>>>>>
>>>>> +     /**
>>>>> +      * @can_run_job: Called before job execution to check whether the
>>>>> +      * hardware is free enough to run the job.  This can be used to
>>>>> +      * implement more complex hardware resource policies than the
>>>>> +      * hw_submission limit.
>>>>> +      */
>>>>> +     bool (*can_run_job)(struct drm_sched_job *sched_job);
>>>>> +
>>>>>         /**
>>>>>              * @run_job: Called to execute the job once all of the dependencies
>>>>>              * have been resolved.  This may be called multiple times, if
>>>>>

