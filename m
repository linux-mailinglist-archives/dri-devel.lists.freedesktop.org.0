Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E47383AD258
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 20:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7996EA70;
	Fri, 18 Jun 2021 18:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2043.outbound.protection.outlook.com [40.107.96.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D966EA6F;
 Fri, 18 Jun 2021 18:45:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSVoP0hgJE67+Zmt+76gW9aqmE/+6vrtR/oPSfF9X2ynaUkvmsdv5yXficK1yz1BttkRgegQke4lmyv/zvji7YoIpShqPSjJ3VC1MdhESPYcUIMfWlQGWiDub2PUstglBl0dX5LoPsobJ09FkBNegAuPXRP9VCtGb09h2+qu+BZI6fZgG7SyJCgVmbwca2EIB1CegXFY6AaJQ4mzZ9BgODzwWNXPXERLaS6Rk1tKSfZZ2ATbobd671K9scvMXLApbbnkwFBNnvlE6VqpF0XkRrlTpHnA+cPcjA/VMXO3dY5MzIvDTBLSsLxZSux6d8iGGWpRHTPisPkoUj91kXBsoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zRInapf7FoZHX0YNSkHYbvv+aGOWRG3M+hPOcFUQJQ=;
 b=mIF3vylRZa8V/Og11vUa7t64xYCjYYYMLbdEgSyRkb9vJmwaHaBPQLo81Flg95MeX/Po4HAbTCKBLtFR5Aq7jn9l3wJoRV/UmTHFu3ofIL9BFyOJVtENF0zAgbCfhAut1dtkQS/R0hyfeCSYIXhENfB8l4o36VmuQ6LvOyXbX1rUO0Xky8fMxUoaQrXOGalUJhjPgjKSxpZMtcitlhqompv0rAMKRGTUxPGKxCwiWIMP+vc9j3GkHo5jjQtT9yyNA9ekSeBG2g/cTSAu7NUo7Bk4XV7cwLXSe+pYmGG5D62dZT7LnAKyoFxuJvPXtHEX8prEGhkYnpIYG3k7Ih3eaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zRInapf7FoZHX0YNSkHYbvv+aGOWRG3M+hPOcFUQJQ=;
 b=hw0aqkoI/XZcCiHI+eFgCRcvlTiDuPRmFZtRkJANJcsDWK1cDZ73q22fzyvIHy3kUP+Bg+SITqn/33iGFi1FEiBNHqs0Wom3s6UnY7uu7b5xfwAC2ie0fHyUva0kokYitKmPWQAFOPLyHKMq5YBYG3NGOKP73wb/stHdTJY1ZAo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4144.namprd12.prod.outlook.com (2603:10b6:208:15f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 18 Jun
 2021 18:45:06 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 18:45:06 +0000
Subject: Re: [Mesa-dev] [PATCH 0/6] dma-buf: Add an API for exporting sync
 files (v12)
To: Daniel Stone <daniels@collabora.com>
References: <b364d818-edeb-a2e9-a3a0-960e2463f086@amd.com>
 <7AEE4CF9-860E-4AEA-A0B1-9E841130DC5C@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <cd729178-6543-5eaf-5b47-0d12576c905f@amd.com>
Date: Fri, 18 Jun 2021 20:44:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <7AEE4CF9-860E-4AEA-A0B1-9E841130DC5C@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:1a9d:640e:d526:e139]
X-ClientProxiedBy: PR2P264CA0023.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::35)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:1a9d:640e:d526:e139]
 (2a02:908:1252:fb60:1a9d:640e:d526:e139) by
 PR2P264CA0023.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Fri, 18 Jun 2021 18:45:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d5e4646-1bb7-4ef6-cb20-08d9328930bc
X-MS-TrafficTypeDiagnostic: MN2PR12MB4144:
X-Microsoft-Antispam-PRVS: <MN2PR12MB414466991D773712FE292B98830D9@MN2PR12MB4144.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CTQoqPFuE2pgz0LbKoFYS1cXkYME9+LtfMCvWH86LViKagRF6NmwAjyhqRvx7AHYePt96it7NRwNdileCnT+Sdwah4hzK4KXeNM4lS81Y+HMpDQtm1A3MVLF1Oq/IxqNxeZRWAkWobxWoXo+JABOZ5sXqXjZ4au9QXFWBLHgqcOvDBddIhCfE4ICB8KzP+7NZxTs5oLN3GyAMfT8cCI9I/lrX35A8jrRaR67YOnoVDfhhYlPDVMarGppEpQKPVTWc0dIsfTqlo2sRSNVVcGTdaoMONRO1ObUrSd0vV5ILp3ycCWyJM4hCxcc3MqZiASwWCeth2ei7e4E2/Nu4ws1EtJ3H9ALD16NqBt1BZoUD7mjH+jLKaWNMuVUGrE1dl2wRz4QHlTUXpZaDa035EscwWuhXlkVp2A+2mhMiez9hHnu1HzYIe0rLzHa094ALW45g/WzlTLKO+6XqU38g1TSaVh6XMFk6y6ylAcAveMzX0dpE336lyHxJMAnaLLhdgOVGa5eDvIWD9Of4xQPkiTlTTdNvY+4YeIcBT9LuJM1ojtbPXStTLRjl1SwtAKz0L6NXt3xBRxCTDv/jQaMqChSXtO4K/4s+lrGT0AZxYQrjzXXLm2eOAovcnSlH+Xn7ztp9hbQXpHuGKOPabNDi6xC8Z6C5VeMW+zd3X/TWHIeSiiYDxXQQOxHGCWNOn4wx894
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(4326008)(2616005)(478600001)(6666004)(31696002)(6486002)(316002)(2906002)(36756003)(186003)(54906003)(83380400001)(53546011)(66946007)(86362001)(16526019)(5660300002)(8936002)(31686004)(8676002)(66476007)(66556008)(66574015)(38100700002)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clZQU0JqbFVuZlUydkozMmZRbm12M0hCVGxGcTRBS2lwcjgzcGx2SUZYaEdv?=
 =?utf-8?B?UE1JczQ1Z3FnSk1GVENsaEh4dGIvQ1h0Z1F6NUJFNlhtSlkvRnc3V29XaW9B?=
 =?utf-8?B?cWNHZnpWaEorNWRqTUpseTd6M2MxMXNOQUFsYnNoRFRweGg3aWIxNTVzSUxw?=
 =?utf-8?B?UzNYQjBsaERxdVhXMlF4eGljaXpEc1ZnNVY5bUN5NFJTQjZIQjlabFpsaG90?=
 =?utf-8?B?Wmc4U0NVNGNVbGRDaVBOTjc2RmVEQUY1ZkhzT1JmTXZOYnU1VldoMTJ6dzNq?=
 =?utf-8?B?aFRvNkJjaVNqTExiY3lEQkRnZXR6ODVRWjkxWUsvd282VVJmS0d2bGpFZjlv?=
 =?utf-8?B?L3N2ZmQ1SXFIb3hEeUJVTXNJdEtWcFJTQ1RjM2JJYUFMNHNvN3hQT3lUZ3J5?=
 =?utf-8?B?UmpyQ1pYdGU4UTVESjFGVkZsenkvZnVLbjVTbTA2Si92MUh0UnpjV1pId2lt?=
 =?utf-8?B?QmxpSWdDbUY5SVpQUDVWd3QySHA3cDQwTThNeHQ0a1lyb1ZhZkc3bnhYNlJY?=
 =?utf-8?B?Mld5a3pwZ1ljbVpGWE1GSms1VkgyUjBHanMySTk1RXRSOHY0YXpuMFFOZkN4?=
 =?utf-8?B?Um1CVjBnQzNldWt2TGJ2cjRvUEtNRmRkak9hdzhDZy82NklZbDNSUXBqdE5U?=
 =?utf-8?B?ODdpZGxubEdlcFg4bkJCMUVFM1M3QS8zSDJwMCttL1lqT2tJanNKREtpby9H?=
 =?utf-8?B?bTVSU3p4bS9JZnJBdVh0bTc3RDVXWjc4ZXZDSU9qeWVjRU1vVkwwb0dEaDV0?=
 =?utf-8?B?aDB3c2o2OVlDTm5pM2QvYkNDRnRqQm5ZR3hTbnlOK0dMUlJHekRSYzBqTzNj?=
 =?utf-8?B?cU5YZldoY3N1alNxUStoZUlyMTUvYncrNXdweVVGZjV5WWs1NFJTMVFvWUpN?=
 =?utf-8?B?RXdNS2M2bXN4eU5oMkFCamp3elhDcUJadU9XNGsvU1VOcGs0dVdJOFpvRE9H?=
 =?utf-8?B?U0puTVlTdFNQMTNheHJZbC9lcFcreldtNG8zY1V6VEt4enRLNUtFM3NHbnUr?=
 =?utf-8?B?UFBpTTJ2UjJsekNLVEZmNUZYbHowakdkdDRpWURVZ096YXEvUFB0NjM5NjN5?=
 =?utf-8?B?YU1UZEQvWldYQnRQUGMyOFZLOGd6MHhLZ2kxSEhZTmJFb2lZb1k5SGFvSmhq?=
 =?utf-8?B?dVlqMHFFSW9LWUhGOEMxcDBTOGVaQXVRdjVmTDEwNU9OVG9RMXBnQ1R0TCtI?=
 =?utf-8?B?WURqbUowKzd4SnRVU3lZNTR3Z3lSZDk4RWFNOWttck4vaGJ2MEw0UHVKT2VX?=
 =?utf-8?B?UlN4RUhJaVNHbVpYOW1PYnoycEM3U0gvajZpRXNLRU9zeldYRzVyYjk3ZHhQ?=
 =?utf-8?B?YzJDZmUxMndsMU5MSWpvM0ZBTHk1ZkFKTk05dVRlMkwxblVsLytNcU9OZXhu?=
 =?utf-8?B?TzRxbXNnajJYaWVLU2U2QnZUcWRBdlRESFpLZjcySUVSR2x0QTNISmJtcWNh?=
 =?utf-8?B?RjJFZHBqRTR6SlQ2ZWdYNTlUam9sUTJzRGtVRTZNSWZGczQ3RWhlT25zRWhm?=
 =?utf-8?B?aEFMSFZCS3NFWmx6SVpZa1JvTlpkeitzSzdIRmU0cGpuNktlVUMvZUtWU3Bx?=
 =?utf-8?B?aGR2dXdOQzlOOTRoaS95bitCOXk5T3dNWlNjMFlHRlBMNjUyVDh2SmQwLytv?=
 =?utf-8?B?d3dWWHhYRVpDZkFyWmp1YUxKRFc3V210V24vLzBMbnBrbTB0U29LY2dGMFNp?=
 =?utf-8?B?L2FEL25oc2I5c3huN1RZYmIxQjBuWW5CMkdnak5wdzFBZ1hNTzR0YkUwdGlt?=
 =?utf-8?B?UkZjUGVkeXFBYUNxM05xMzRqSHFod3c4T3NsZEVvYkJCU204Nkk4N1VuVEtn?=
 =?utf-8?B?WjdBQm9TOExMSy9FaFpYTUp4YnM3SXdkbjFlWmY5S3FkeUhGVjlIbG1TSnpW?=
 =?utf-8?Q?I2rOv3fMKKUCR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5e4646-1bb7-4ef6-cb20-08d9328930bc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 18:45:06.0622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VhKKzLquyxz8Fzs0iyGP6S7VZRYGoAXkxfd0zdf7PPcK8xPfH6qH3Gf545CDx85a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4144
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland-devel@lists.freedesktop.org,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

thanks for jumping in here.

And yes, you are absolutely right we need to get this fixed and not yell 
at each other that we have a different understanding of things.

Your proposal sounds sane to me, but I wouldn't call it slots. Rather 
something like "use cases" since we can have multiple fences for each 
category I think.

And I see at four here:

1. Internal kernel memory management. Everybody needs to wait for this, 
it's equal to bo->moving.
2. Writers for implicit sync, implicit sync readers should wait for them.
3. Readers for implicit sync, implicit sync writers should wait for them.
4. Things like TLB flushes and page table updates, no implicit sync but 
memory management must take them into account before moving/freeing 
backing store.

Happy weekend and hopefully not so much heat guys.

Cheers,
Christian.

Am 18.06.21 um 20:20 schrieb Daniel Stone:
> Sorry for the mobile reply, but V4L2 is absolutely not write-only; there has never been an intersection of V4L2 supporting dmabuf and not supporting reads.
>
> I see your point about the heritage of dma_resv but it’s a red herring. It doesn’t matter who’s right, or who was first, or where the code was extracted from.
>
> It’s well defined that amdgpu defines resv to be one thing, that every other non-TTM user defines it to be something very different, and that the other TTM users define it to be something in the middle.
>
> We’ll never get to anything workable if we keep arguing who’s right. Everyone is wrong, because dma_resv doesn’t globally mean anything.
>
> It seems clear that there are three classes of synchronisation barrier (not using the ‘f’ word here), in descending exclusion order:
>    - memory management barriers (amdgpu exclusive fence / ttm_bo->moving)
>    - implicit synchronisation write barriers (everyone else’s exclusive fences, amdgpu’s shared fences)
>    - implicit synchronisation read barriers (everyone else’s shared fences, also amdgpu’s shared fences sometimes)
>
> I don’t see a world in which these three uses can be reduced to two slots. What also isn’t clear to me though, is how the memory-management barriers can exclude all other access in the original proposal with purely userspace CS. Retaining the three separate modes also seems like a hard requirement to not completely break userspace, but then I don’t see how three separate slots would work if they need to be temporally ordered. amdgpu fixed this by redefining the meaning of the two slots, others fixed this by not doing one of the three modes.
>
> So how do we square the circle without encoding a DAG into the kernel? Do the two slots need to become a single list which is ordered by time + ‘weight’ and flattened whenever modified? Something else?
>
> Have a great weekend.
>
> -d
>
>> On 18 Jun 2021, at 5:43 pm, Christian König <christian.koenig@amd.com> wrote:
>>
>> ﻿Am 18.06.21 um 17:17 schrieb Daniel Vetter:
>>> [SNIP]
>>> Ignoring _all_ fences is officially ok for pinned dma-buf. This is
>>> what v4l does. Aside from it's definitely not just i915 that does this
>>> even on the drm side, we have a few more drivers nowadays.
>> No it seriously isn't. If drivers are doing this they are more than broken.
>>
>> See the comment in dma-resv.h
>>
>>   * Based on bo.c which bears the following copyright notice,
>>   * but is dual licensed:
>> ....
>>
>>
>> The handling in ttm_bo.c is and always was that the exclusive fence is used for buffer moves.
>>
>> As I said multiple times now the *MAIN* purpose of the dma_resv object is memory management and *NOT* synchronization.
>>
>> Those restrictions come from the original design of TTM where the dma_resv object originated from.
>>
>> The resulting consequences are that:
>>
>> a) If you access the buffer without waiting for the exclusive fence you run into a potential information leak.
>>      We kind of let that slip for V4L since they only access the buffers for writes, so you can't do any harm there.
>>
>> b) If you overwrite the exclusive fence with a new one without waiting for the old one to signal you open up the possibility for userspace to access freed up memory.
>>      This is a complete show stopper since it means that taking over the system is just a typing exercise.
>>
>>
>> What you have done by allowing this in is ripping open a major security hole for any DMA-buf import in i915 from all TTM based driver.
>>
>> This needs to be fixed ASAP, either by waiting in i915 and all other drivers doing this for the exclusive fence while importing a DMA-buf or by marking i915 and all other drivers as broken.
>>
>> Sorry, but if you allowed that in you seriously have no idea what you are talking about here and where all of this originated from.
>>
>> Regards,
>> Christian.

