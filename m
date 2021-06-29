Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D03A33B7148
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 13:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFFA6E863;
	Tue, 29 Jun 2021 11:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2056.outbound.protection.outlook.com [40.107.101.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA426E863
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 11:25:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPf4nD3ku9Y9LWTtSQ5rEA6iQiFMY7ix3DNido4zoPCgedw/mhjfsioKAI+oh7cNrliukrJ6hKO7yyP4WmuLWZJh6rNRW4BYEUmh0G/LSNfDJRhzctp8ShnHyQpJm3FebkhtLSD+nL90S6J3MdZAbNmO3nYOzayCKTyfdaZ0i9X0PWWpae9cppRSq/zyhInFcEWC+AA0KFX8iuN+H97mDv4mVwivOty2aq8bcat8HSFpn+Bt3BDBloY43WIkr8lp+BcqLvxVb59PgA95g/BcgfjrCgraKyLbS9KCYAQ6KKcncj8XCsPsVNSGXHcxTxce7jIkJ+yig3MywFCw0EzXVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9CH/adCQ62lkPiDQd0Zi1WNVrkvh3JvqO1/FSrkWBw=;
 b=fWafIoZmRf54zNYGEGXVF6myGK9NB8Siy/R9dxjELTCetbppqRBHGSl3jodwfDgTCwpf+Z2YhIpKiyZtdsoIXNKKicmXBXvq1havIDp9Iw9x0L/Ljuo1ojb5u61OkGbukctFwdGTwOyNAhh7QZZyalmwunRgZolobgITwe4EtBB7SnaoFOKMS5JLo6ULHo4ZrfGjLGsEOITVtoBpl5kz1iL0INBO1xsdxs4d6njTvmMEmu5epoJxW88CROQ9Xbeas+67Yp5kQvWQxKXyipTedF7X7QTzLGrUqQBCq5Vy+dH9/9gxknwb8FY18sBHut6fvhVy0A9XrPXikHVtizr89g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9CH/adCQ62lkPiDQd0Zi1WNVrkvh3JvqO1/FSrkWBw=;
 b=jvhONRyUMMsO+FkufjTmS/dSwy9q6d1nCBUmGpyrfi3r4dIYlkhgeFJ2KV+aUkbVk/V4BP59Ua35OErUoz8xFfiJbF4uNx4aLKNwolEq7f5nlMpPPkDWhSBYCrNh+kDWxR6S0GCBlODW5Hx84jjQPHFM3qbhAj4i/z5NfWbbglw=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3792.namprd12.prod.outlook.com (2603:10b6:208:16e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Tue, 29 Jun
 2021 11:25:00 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 11:24:59 +0000
Subject: Re: [PATCH v5 02/16] drm/sched: Allow using a dedicated workqueue for
 the timeout/fault tdr
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20210629073510.2764391-1-boris.brezillon@collabora.com>
 <20210629073510.2764391-3-boris.brezillon@collabora.com>
 <5b619624-ca5d-6b9a-0600-f122a4d68c58@amd.com>
 <20210629131858.1a598182@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <532d1f9d-1092-18c3-c87d-463cfda60ed7@amd.com>
Date: Tue, 29 Jun 2021 13:24:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210629131858.1a598182@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:acb7:5516:6a55:2bf5]
X-ClientProxiedBy: AM0PR01CA0155.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:acb7:5516:6a55:2bf5]
 (2a02:908:1252:fb60:acb7:5516:6a55:2bf5) by
 AM0PR01CA0155.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Tue, 29 Jun 2021 11:24:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 349c1bbc-37fb-48b9-1727-08d93af087d0
X-MS-TrafficTypeDiagnostic: MN2PR12MB3792:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB37927B2BA7BA704CABD33CAE83029@MN2PR12MB3792.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CNIGh6zM+/jM2sOpAvg6x+C9Pj1TTNRj8uFdJ3SQp1MG6BMDxrqFrvgvn+f/5gAO327prEu2uODEDmvPX7M0tKKlcYdzLm9f+M96uaxBEdbTnMp4373PLwmWAX86q5eNDaO+u2KbDoASJzrrwbKmmAbdm+I1iyYqXyrl+xpCiXv3hnwRvkp++gXJoycGER8YdqKJr+566BvDOmfagkbYtf+u+9a21mAKtRQE9F1MLRgGbNVlsbyh7U2phRAlEf/Gzvpz/1Ej7eG1np/BCYNbXj62R6Fy0KLVdrj4koIbPdXoB8ai9D4Pm1MrOm8/kiPK6KRELXrSQ0RZrn9bVJ/Cu7WF2vY6nAsVB1BlBEs6Bbq1cFGdLM+JMmnZl/T0jgY0AX5eRf2zPyd8AQE8f7RdGfxxF92b90hBv7J2ZLJRlR1vruQQSqfsM7ymWXpI9a9A+gCrEutuaeZcTSP8ICK+vKCkko1psalfVYayr/PNoFOZ0x1mfxzW2u9yFak8dvO87MhMg9IiG+0NbGfQx92LEFvxT9pXX/Lb8nggG+7aUMQEMzs9EPBOVVF4hHXqOimDG5MXmQiz59FzeUOhstIyftv2oZgiZBHgqWUH90nc0qvjjWLEnjdpWLKZTi9NSzZy9AvRg41h35F+rGm82lZ/ZMxdzCzvAF8rMA/q2+d4xrFof63AzOxgnAHmg/lmwYroWcccGCY6nv6Fatd+rMNXCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(86362001)(31696002)(83380400001)(478600001)(16526019)(4326008)(2906002)(7416002)(186003)(6666004)(38100700002)(36756003)(31686004)(6916009)(54906003)(6486002)(2616005)(66556008)(66476007)(66946007)(8936002)(316002)(8676002)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1ZsbmgvSHg1c0loSlBmdVptNk03aVF1ZXk1RWNuQWNLYVEvc2ZPZ2d0UXpJ?=
 =?utf-8?B?Vmc0bm1NdHRYV2tzenpvSWxTVU5hdWxKbjA4RWNLZnRxVEczbFhhN2dsN29a?=
 =?utf-8?B?T0dzL1NWSVZ6Q0pLdmZnN2psdS9UZFpSRkhwVk16RE5mUFFkUUFtWmlTSlR5?=
 =?utf-8?B?QWVoZmE2dmE2ZGVYczBhb1JBUE5SRmhvWHoxbno2Y09UenVLalpXeTVOTzJE?=
 =?utf-8?B?bHJBc21YdFJJRjdidUhDSWdOVDlMZmlza3piek9yZ0Fxa2lFK1pwNjE2dWRC?=
 =?utf-8?B?cWRGOUxpVHRYT0J2VjhOVnYxYTNxZ2VSM0RMVjUxdnB4LyswbStLWnYzMlVs?=
 =?utf-8?B?Q1luTnBoR2tSNHdYTjJOaTZQWGNJbjVXUFM4ejRuSVphcUxzNWs5TDZMcFFN?=
 =?utf-8?B?S2pTVW44UzZNOWwxSGNOa1o1dThaejZEVVdEMUFNYm93RGsxcng0T3hXNUl6?=
 =?utf-8?B?L0d0Mmw0RkhIY1dIbXRZU2xyNG5wZm4wWGJkZGZETk8zVkM3MU85TnVmcFFV?=
 =?utf-8?B?K3BDNXNlUldRdmVTb2VVNS83djRJWmtyU2R5VEpnUXBpM01icTZVaTF2T3k3?=
 =?utf-8?B?TzVXUEJkMkVUbEN2SytCT2QxR2piTElYc1NlUEp4VEp0c2JOQUNqalpIN2xj?=
 =?utf-8?B?R0FKaGx3aU5ESERGV1BwWjczL0o0NFFXOERnemxoTTQzQ3d3VkllK0lOM3V4?=
 =?utf-8?B?VHFtbTBveHZHNWpKUHBlZ3lhQW1SS1JPdjVEbTJSS0IwTU81dVgzclhORXNh?=
 =?utf-8?B?clBwcEpKNUUzdTRuTjdMUzZsWnBhTUlMZW5VSk1QdUVQS0xHejBHQ1ZqaENr?=
 =?utf-8?B?Z2NOZmw4WFdJcmFpUEJ3UGJyN05jOW1EdUJ3ZmhXVzJRTUFwYTl2bW8wWHRp?=
 =?utf-8?B?RjRIUnVleEhuZE5NMlpzd1U5TGNHYnpwZGp2Z3k2Wlh6ckx4cnV0RzZGUytP?=
 =?utf-8?B?QmZxWTBpYVpkL1luTW1hQ25ERUJpRzlVZE1iMzU4VUp4OUR1a3F0c3B2U1dh?=
 =?utf-8?B?Vmc0ZkN6WFo1c2JCd3RkODloTDk1NzhCQUtZMEFJT2libjVSMkpQK2ZPckx3?=
 =?utf-8?B?aDhNbjhOZmZpM2l1dVpEMHpBeTRXWjVucGlSWUNDWWoxSlRPTWduQ1kzVE9k?=
 =?utf-8?B?WkNPTGEyUmhaUkVTZkN0Tm5OSlA0V0hkTDgxRERxVzVQWHFnTkFaNE1ob1Bq?=
 =?utf-8?B?N2c4WTFGcDV1VzZ0aW9kMjk5M1ptWHkyd2E0L0kyOHJhOVRRTlJOcmlyOXQ3?=
 =?utf-8?B?ZTdTNjUvdlF2bS8rOHhGeG9SbkpNUTZsN0locS9OZzk0SEhIQ3Nuemt4bmEz?=
 =?utf-8?B?VmJjZTdLcHZwSkxUQlZHRlZhSXhaYTREcXNOVFFTS3diN0l6WUJOMEgrQjF2?=
 =?utf-8?B?QzIyUHIvcDlLdkp4Y1IyUUlyU2RWQzRPOGpLL3hGMjUwQXErOFM4azhLcU9P?=
 =?utf-8?B?MlZRR0o5ZUI0Uzdhck1UdlY2d21mOE5uOFgrKzRuUXpWWDU0eG1YOTR3VmdM?=
 =?utf-8?B?L1VFSmwvSnVJQytpNEs3NWtLUXZwWm9mTnBBR2tYQTMyazB1UFQrOHhjLy9G?=
 =?utf-8?B?RzMzZEJzQXVmNW9kSzFHbTNHckpyMGpmY3RoQWt1VytoYllTOWNIcHU5b0cw?=
 =?utf-8?B?NmFILzQvRkZvelZqMHJHZnZkbGJ1ZXRLMEovaVkrMXRIa2tMdC9sWFlON0JE?=
 =?utf-8?B?K2tMaXhyM1hyem9sWXk5aHBUZ3JPVlBMbW05OEFLb3FLa1lxM3ZqVlRVdy9U?=
 =?utf-8?B?d0E5VE5SN0lJL2dXaEtyY3pKN1BkVkh1bnNmc045UlIrRVI2Q1dOMjV2dDlD?=
 =?utf-8?B?dDVwZ2l0RzFUTVFyQmpzbE9SQ3l0T3Ywd0EzM3RjRjBTVlpsNUtIb3ZQdVAx?=
 =?utf-8?Q?nPxd7lrieBkSc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 349c1bbc-37fb-48b9-1727-08d93af087d0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 11:24:59.6888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uO3U7+mJR1XTioIMmpxiyRx+MxYOh4VUUsg+ns4Xd1jTkGVXZR7iPbqFm9SleZOy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3792
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
Cc: Emma Anholt <emma@anholt.net>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>, Qiang Yu <yuq825@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.06.21 um 13:18 schrieb Boris Brezillon:
> Hi Christian,
>
> On Tue, 29 Jun 2021 13:03:58 +0200
> Christian König <christian.koenig@amd.com> wrote:
>
>> Am 29.06.21 um 09:34 schrieb Boris Brezillon:
>>> Mali Midgard/Bifrost GPUs have 3 hardware queues but only a global GPU
>>> reset. This leads to extra complexity when we need to synchronize timeout
>>> works with the reset work. One solution to address that is to have an
>>> ordered workqueue at the driver level that will be used by the different
>>> schedulers to queue their timeout work. Thanks to the serialization
>>> provided by the ordered workqueue we are guaranteed that timeout
>>> handlers are executed sequentially, and can thus easily reset the GPU
>>> from the timeout handler without extra synchronization.
>> Well, we had already tried this and it didn't worked the way it is expected.
>>
>> The major problem is that you not only want to serialize the queue, but
>> rather have a single reset for all queues.
>>
>> Otherwise you schedule multiple resets for each hardware queue. E.g. for
>> your 3 hardware queues you would reset the GPU 3 times if all of them
>> time out at the same time (which is rather likely).
>>
>> Using a single delayed work item doesn't work either because you then
>> only have one timeout.
>>
>> What could be done is to cancel all delayed work items from all stopped
>> schedulers.
> drm_sched_stop() does that already, and since we call drm_sched_stop()
> on all queues in the timeout handler, we end up with only one global
> reset happening even if several queues report a timeout at the same
> time.

Ah, nice. Yeah, in this case it should indeed work as expected.

Feel free to add an Acked-by: Christian König <christian.koenig@amd.com> 
to it.

Regards,
Christian.

>
> Regards,
>
> Boris

