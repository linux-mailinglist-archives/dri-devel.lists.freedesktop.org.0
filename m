Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE62D3D942A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 19:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090806E0EA;
	Wed, 28 Jul 2021 17:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2057.outbound.protection.outlook.com [40.107.236.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC226E0EA
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 17:21:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eP6IMxtqsLEoojlRvnL+Ji8slHGaNgdp9nuv1c+CbatRv4ZI8w9pgVEQLqgFD07QC0bEsst9wWaL4ngqnsxsiTSAq+TKW9xwn+TpAvtfC5XOdngiiPvIxgnTFIc3uUElnnCePBqmBLgUhu4t1y7G2ymyitf41VgjmwOgHgpvEwY+wi032vs9YEd9zwL6AYZi58RHHQG2N+QWqIQuFZhf1wF9nXVYcfrpQoX7DyEMzfG0B2iZJMfy9YC7e2cQn1IyjAslRi906HKTRz2omX0PMD8K7PEpr4S8S4pQlVG78Pvhm1qg/zylXDchPiUv51Vn8yNkrJcoFSyO8Vlk0s90cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeeehMC3HZ9EeMrGd+cPmxu4wzBus/t16PBo+eBHhqs=;
 b=M3iMBXYTdn/Pg5BRUGZ9j2KAiWGiXH6YcOQP9vaCodLrhINHrgTc7elM9WofJyo3ULJdEuS5hCbTVopTq32SpIptAbLyHGB9fJCENPVs6QoN9pOtn3XWZ7CGZ/KI6HYRlarVlf9WipPHePn4TpP61KvXiN8Q2k9WEiqxjXcYFC2X+R2dW9SneBRwA+4YJfZC+Ap/tjG3hTZYuXAOkyrlC36ckWY1BC68iKt/dcg3k68fA5pzQ/DFre9Y2xOvCP3n1l4uWz8MYLPeEY4Q9Eoysu7LPCRZq9PPtuYS58euGl6kJcw9/VbJbKcfBUyMbJHin0s3wrdgjP+fppJwggG53g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeeehMC3HZ9EeMrGd+cPmxu4wzBus/t16PBo+eBHhqs=;
 b=AtLpkF32gROCbL9Wq9ZOl6a4pve24129+4uCpT4Y1ExQ9J3rO3j7ktfvf6IxRNHxVp+qDcyjb0kwy6l8Sd52zfmX9414gDOEZyNYIWzUzzB57038775Tz4nk3vvcTovo70liVwkVjO/JSw7QvuEPAw3sTvax0+ecyU/EkN3yuEo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3968.namprd12.prod.outlook.com (2603:10b6:208:16f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Wed, 28 Jul
 2021 17:21:00 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4352.031; Wed, 28 Jul 2021
 17:21:00 +0000
Subject: Re: [RFC 0/4] dma-fence: Deadline awareness
To: Rob Clark <robdclark@gmail.com>, Pekka Paalanen <ppaalanen@gmail.com>
References: <20210726233854.2453899-1-robdclark@gmail.com>
 <28ca4167-4a65-0ccc-36be-5fb017f6f49d@daenzer.net>
 <CAF6AEGuhQ2=DSDaGGVwBz5O+FoZEjpgoVJOcFecpd--a9yDY1w@mail.gmail.com>
 <99984703-c3ca-6aae-5888-5997d7046112@daenzer.net>
 <CAJs_Fx4O4w5djx3-q5zja51-ko_nQ0X2nEk3qoZB_axpBVSrKA@mail.gmail.com>
 <f6d73ec5-85f9-1b18-f2d2-a5f3b7333efa@gmail.com>
 <c9ee242e-542e-e189-a1ec-c1be34d66c93@daenzer.net>
 <04d44873-d8e6-6ae7-f0f9-17bcb484d697@amd.com>
 <9d5f4415-d470-3bc1-7d52-61ba739706ae@daenzer.net>
 <eedfdc75-72f8-9150-584b-c5e9d16db180@amd.com>
 <20210728165700.38c39cf8@eldfell>
 <CAF6AEGs_tG4A=_gs7KLB0WeWQq8xyJuiY2CmRkXHnN7iyhUCqQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e6565220-94e2-a0d0-b3ca-82d5e70aaaf3@amd.com>
Date: Wed, 28 Jul 2021 19:20:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAF6AEGs_tG4A=_gs7KLB0WeWQq8xyJuiY2CmRkXHnN7iyhUCqQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FR3P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:f1e3:17b4:fe37:19a9]
 (2a02:908:1252:fb60:f1e3:17b4:fe37:19a9) by
 FR3P281CA0052.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.7 via Frontend Transport; Wed, 28 Jul 2021 17:20:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da9090a7-fd73-405f-d3ac-08d951ec11bc
X-MS-TrafficTypeDiagnostic: MN2PR12MB3968:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB396839D980A09AD5FEC8427883EA9@MN2PR12MB3968.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VgQ7cEu9LpKvcyJVLT/jcYRvtEp8ZK7aOJ6fjNLF+7USVU5i6/xXSeoJ65KQSZMs3dT0Z/P+xS/hcDWBM1l9ab8i2H01+1xXwqzDQ6RWr+URVLKgReg14c1w1u8xstm8ucxyYtS/XiTxtcUnoiZPNb3UVv/sXB5T3HGubkCjMCC4I9EVXBwSukRQhv1L74chC+IBdfc/aQTFD7x5N/Z3dHV2DWEoxeIzgWP/typd4byrLKB1M/VfgE+k/1PLDhxvvUw+lGlxrXUUshF1GEVDoPbPHolymQUoZx2ycdGsMsihbTRWg5UMw1hQxa0oWe014xjCYaLUovRta8K5p+2Ew/9hBUyTdMbDquDdiecuXlAoWNYl7BrGY5U7QOcMneLx4yMHO9etciH+DFsdkf+DRod+0cCwm5oadN5dPjonKW3YKvBvZvmowBOnRdJRYh/7uFqcmAY76cp2sbi0Q5TTFlPMZ7SJoTOqeidGurr3wEZSXmOv4R+McNV+xoaAdP7cL74fZrqhnggktR00BuuHUhPqLn8dBQ/Yj7uhmtG7uzXLYuSj75G7XyBu1bpfQXD712tTRFzRO0JIcubZc23JrVHKgjSZUcKvKGkX3fEW2q1jZ8Am/c5vSgVQ3ksQS3r2emuuj/NNeXZxOTdxf9lysCQ7/KMskIT24sxfRq+PrUa34fdrjj8hpQ3st2ytL4z6zqezKWqwVPz4IR5XFr4s/PjQ/t/XoXcJex4uIPojWqw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(8676002)(53546011)(54906003)(316002)(31686004)(6486002)(4326008)(110136005)(8936002)(36756003)(478600001)(6666004)(5660300002)(7416002)(186003)(66574015)(2906002)(66556008)(66946007)(66476007)(31696002)(38100700002)(2616005)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3BKQ1hCQ2I0UTE1d1paTnhacHhSdkJxWnBQRkpWaTd1Q2p3b3B0WHR3MHJP?=
 =?utf-8?B?ZnVCdHlETEhuaXpTMGx2YWUyRkpkVDRTcTkxOC9tYVBmc0pHVkxTcXg0SFEx?=
 =?utf-8?B?RStkRk1tOEtBQmRBRTZWRWhtR2FuYk82QlA1amVHY2YzaDZJQkpQS25RN2dN?=
 =?utf-8?B?akZhZWttYWZaejhBTlJ2MFFJbWdyejhWaVJRUjZ2WjM4RkRVTGVJNm9qYzBj?=
 =?utf-8?B?ajdWd1o2ZnEvWW9VY09oOE9rV0lRTm1vUmNDK3pTb0JlSms4ZUsvYVZPOEtu?=
 =?utf-8?B?UjZZZ3ZFbjZ4TFd4Uk5kZlk4M0thMUhsQ0JJWFNsZ04xaTRqOHg0YUZKendn?=
 =?utf-8?B?VnRCRU5mdFVueCtHTEx5L3VIYjdjRWcrM1h4ZXNkVmRORGc1RVpocFg5TkEv?=
 =?utf-8?B?RS96Q3MxYjVlQWVKQTlRMXFaZHRvb0oreDQrcTlrQ0dDRDMrQ1VacUpFdzM4?=
 =?utf-8?B?aG1QOWdlZTNnZXQ2eGd2YW1meDlGY094Rlhsby9zVzVFR0kzVEdyNnRCK014?=
 =?utf-8?B?eW5pZTJLL05qNFV3QnVTY2VTeTBpSHlvdC9MbTZPd0hHZUJOR29VYU1yNkt2?=
 =?utf-8?B?QUZYdnNYVTZSMmt3eWdkUlAvZW1qdVNDZ2tsRzdPS2d3OWFRMm1kY0tQeXMx?=
 =?utf-8?B?dlFwbjFvRHMxdkExdU4vVlFEMU9WSkNLZ0hUYzVpNENiY0RoeGpmaEtQcG5y?=
 =?utf-8?B?MzhQWFJOVngzMGs0UVZ6VE1CbnVLcWx1VkkveDUrS04waWdqbG5zYXhUS1Fa?=
 =?utf-8?B?N3dPNWUrZjMxbTBZeVFlWnZNQnJ3NHM5M3lKU1BxTTBncEUraE1hLzUxZXhW?=
 =?utf-8?B?eEh5T2VvN3RJOVpBbGRKUTQwQ2QvN2hva2Q2YWI0bWQ3TWs3U0djY05McGFP?=
 =?utf-8?B?V1JBL0pyWjBrNmlwVVRaRVdTbzlmbW91SE4vNnE0R1RzS2UwSE1MQ0xBZE9D?=
 =?utf-8?B?YlVwYUhwQTZSaHQ2djJxZ0F1b2ZtLzVpS20wMjRldHpNOS9XazYxNjdyejEz?=
 =?utf-8?B?cHBYdGZHbm0yWFpmQ0ZoL3JWbmlXeEhPU2g2ZmpNRzZtR2o4TStaQjJwYzlX?=
 =?utf-8?B?WE1zZlJ2NmFiM1lTMGVJK2duaWhmWUpMR0k2UGp3WFQrMVVBK1BvVFB5MlNj?=
 =?utf-8?B?Wmp5TkxnODFBVDVoR2NNS3Z4NHllak1ueG5QOUxXSGRwQWVteUpQM1I4Z0Zz?=
 =?utf-8?B?b2pLSHdWMFdmLzhkcEJYUkRXcnRjYlNldEpuelhaK0FHQWQ5TDNTbHhEVklp?=
 =?utf-8?B?M3ZGSW5aUVEwc1VRTW5Ob25QWEtGL011NDdRdmE5MVIvRmJrditBa3BDM1I0?=
 =?utf-8?B?VlRhMjB5VXpiTUNYM0E3Z21ibHQwR0l1ekhUZUpZRUNucmVlWlVVYTNnQ3U3?=
 =?utf-8?B?Z1VQOUMwUGlzRGpUUlpVRk00WlVwNFF1MXV5ejZGWlgxNEFzUFNZZXlDcHlo?=
 =?utf-8?B?c0NndGxQb3IyN29JL2x2Q1cxUFFiRlBlNXRCZG5pN1QxOVN2enUvQjRIa1lW?=
 =?utf-8?B?YnZpbnA3a0wzUkgwUFloY2hRSmxRako5dnlCNk1UREplZHJEa2VvUHBsWkVI?=
 =?utf-8?B?UEdwc2FtWkQwVVB0MUswNkczT1pnK3dKOHMwMUoybk4vQmQyZW5TZ3hYWUhq?=
 =?utf-8?B?RWlVL01FZ0t3MkdVMWtrejJ0b2lXOUZ6MVY5RzdaOXd1SmpleHNTVlhHU0FE?=
 =?utf-8?B?cUxEd2JDTm9CTHNRbjNzOHNiclMxTm5reE9DQ1dENENRWEFzRUY3QnVKUVZy?=
 =?utf-8?B?S3R6TThIU2pNT3JsSUhaS0VaSnR5YXI5N3FwVEx6eXluVG04Z202czI4YVZv?=
 =?utf-8?B?M3VScGFyeU84TzdySlFmUjJ0VTEyRGtSSnd4TGZRV1BMMktrZU9SNVoxU2hz?=
 =?utf-8?Q?2PFiJXHriC6UO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da9090a7-fd73-405f-d3ac-08d951ec11bc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 17:21:00.4793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gLUtZm6AP4Y+W7F7mB3dNsBEEes80sX8KZNd8qrBkE7t49uTXo0wUkJTz0vZXYrv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3968
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
Cc: Rob Clark <robdclark@chromium.org>, Matthew Brost <matthew.brost@intel.com>,
 Jack Zhang <Jack.Zhang1@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Roy Sun <Roy.Sun@amd.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Lee Jones <lee.jones@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 28.07.21 um 17:27 schrieb Rob Clark:
> On Wed, Jul 28, 2021 at 6:57 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>> On Wed, 28 Jul 2021 15:31:41 +0200
>> Christian König <christian.koenig@amd.com> wrote:
>>
>>> Am 28.07.21 um 15:24 schrieb Michel Dänzer:
>>>> On 2021-07-28 3:13 p.m., Christian König wrote:
>>>>> Am 28.07.21 um 15:08 schrieb Michel Dänzer:
>>>>>> On 2021-07-28 1:36 p.m., Christian König wrote:
>>>>>>> At least AMD hardware is already capable of flipping frames on GPU events like finishing rendering (or uploading etc).
>>>>>>>
>>>>>>> By waiting in userspace on the CPU before send the frame to the hardware you are completely killing of such features.
>>>>>>>
>>>>>>> For composing use cases that makes sense, but certainly not for full screen applications as far as I can see.
>>>>>> Even for fullscreen, the current KMS API only allows queuing a single page flip per CRTC, with no way to cancel or otherwise modify it. Therefore, a Wayland compositor has to set a deadline for the next refresh cycle, and when the deadline passes, it has to select the best buffer available for the fullscreen surface. To make sure the flip will not miss the next refresh cycle, the compositor has to pick an idle buffer. If it picks a non-idle buffer, and the pending rendering does not finish in time for vertical blank, the flip will be delayed by at least one refresh cycle, which results in visible stuttering.
>>>>>>
>>>>>> (Until the deadline passes, the Wayland compositor can't even know if a previously fullscreen surface will still be fullscreen for the next refresh cycle)
>>>>> Well then let's extend the KMS API instead of hacking together workarounds in userspace.
>>>> That's indeed a possible solution for the fullscreen / direct scanout case.
>>>>
>>>> Not for the general compositing case though, since a compositor does not want to composite multiple output frames per display refresh cycle, so it has to make sure the one frame hits the target.
>>> Yeah, that's true as well.
>>>
>>> At least as long as nobody invents a mechanism to do this decision on
>>> the GPU instead.
>> That would mean putting the whole window manager into the GPU.
>>
> Hmm, seems like we could come up with a way for a shader to figure out
> if a fence has signaled or not on the GPU, and then either sample from
> the current or previous window surface?

Yeah, exactly that's my thinking as well.

Christian.

>
> BR,
> -R

