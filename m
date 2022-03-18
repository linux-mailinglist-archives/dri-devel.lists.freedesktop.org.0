Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D55E94DDEE5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 17:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D47C10E93F;
	Fri, 18 Mar 2022 16:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25F610E98F;
 Fri, 18 Mar 2022 16:27:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXl58afx9HNUn/3Bn5qGAQACEtwsO/Hbi8Z+OgiZA6JSPiEHC8mAbMoEMnrTfbg1WlbrQ1NvTIOyVgMIZV6GfdJjU9pD4N6xepCcrKed2L/Vu7gVWDVuohG+Gon7139SMlW5kM580TNOD56xgYTYFkdme75Mihehp13csa6Y3LnG7NC3d/koWokoK+03n557ilPFnILkgJgXjAbSQi/S/YKvz8HdT5k2wwNNCi5Lq/KkXVz+exWFu4bG7R7jo6shjNToQdn5pSwASOSzPsawNd2ghkxmaj/Zm01uo+VV+F+/OYl7VgqqXY+bzJNu9WeYElCKJQpbczOdtBSqn02VIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Kxkqfe3K1y9lWyIhCfvPVLz/g4geOcMe12JQ+QgOX8=;
 b=PpKWLR/k+kmnyXV858bbi2HUpjgavlf0IQrb2vWnFB7FPNFWlrSQQ24PJ87FNEO1Gpb8LucI9685Py0IhQfH8pONQ7hE9+zerG8npg86BNPX/n5D5pbk5cPDnPq7i4TZsoKaz5C6h50tEaWAQJ+5p0vSylhWPZ/lJ02tvtTv5zjAaj7OcXXxeKkssd4GwYAx9gpnt6yGOr5qCUfRV60RwXp8QOpY2IBPFaxSK7jOi4u1TzTf/TOaRv2a1IDnEs6ZvF0T5W07X0vn7kUBHlblv0jMEOLCyKLl0/AQNfBUjO/iE8S0ZzbfdFARomy4NJECZpICBWADFRSOKSM7l6+MDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Kxkqfe3K1y9lWyIhCfvPVLz/g4geOcMe12JQ+QgOX8=;
 b=ZlfiT4n7MnmLBlDRpz/QeK8YhSplrxgD5jG/hCTKFhWfWVL5c9uu/Azq3DisqkQxPm0hm59hMazt0IiFdCuApbTs6ORUJyGF/6HfjnZIQJ3GACVgXTztafV8086AU6CN8RG+XDbG3C16H3XN4bjk0KA9ieOCDxscw9gnt+oQnTc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by CH2PR12MB5547.namprd12.prod.outlook.com (2603:10b6:610:64::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.16; Fri, 18 Mar
 2022 16:27:38 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::90bd:5b12:918d:5703]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::90bd:5b12:918d:5703%6]) with mapi id 15.20.5081.017; Fri, 18 Mar 2022
 16:27:38 +0000
Message-ID: <0e572944-66a0-f5a7-4517-3c437e668584@amd.com>
Date: Fri, 18 Mar 2022 12:27:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] drm/msm/gpu: Park scheduler threads for system suspend
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220310234611.424743-1-robdclark@gmail.com>
 <20220310234611.424743-3-robdclark@gmail.com>
 <YjMGac4Hnjmg1wE8@phenom.ffwll.local>
 <3945551d-47d2-1974-f637-1dbc61e14702@amd.com>
 <CAF6AEGv36V8bLoDn5O1SW3iTUtzd3O1XeuT5gJxyLMxd1E-o3Q@mail.gmail.com>
 <865abcff-9f52-dca4-df38-b11189c739ff@amd.com>
 <CAF6AEGuoBeYoMTR6-KM9xGZ05XSSnSJWMDciawczi7qtiLN9Vw@mail.gmail.com>
 <915537e2-ac5b-ab0e-3697-2b16a9ec8f91@amd.com>
 <CAF6AEGsyFAOPmHqT7YX1wsukP4-gYAstCukr89r9w28V0YSCUw@mail.gmail.com>
 <3a475e5a-1090-e2f4-779c-6915fc8524b1@amd.com>
 <CAF6AEGtPrSdj=7AP1_puR+OgmL-qro0mWZDNngtaVPxpaCM76A@mail.gmail.com>
 <1c847474-8ee1-cc7e-3d4d-261a4e92fb2d@amd.com>
 <CAF6AEGuw45gi4f+mVs7cVyjCHY9O4N1O8OfuGHv-wAkzP3UpMA@mail.gmail.com>
 <dd7d3f20-8288-3a7c-a368-a08282746ff1@amd.com>
 <CAF6AEGvp+f4=EjQ9tWwcEafBEOAy6nCd8bOTqLXopiFhjx_Y_w@mail.gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <CAF6AEGvp+f4=EjQ9tWwcEafBEOAy6nCd8bOTqLXopiFhjx_Y_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0150.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::18) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a4a0745-dbbe-43db-4a07-08da08fc379c
X-MS-TrafficTypeDiagnostic: CH2PR12MB5547:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB5547AAA9EAEC0CC1632F7DA8EA139@CH2PR12MB5547.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tycHd74CWQo/JB/bffG+uzs7IefmlnB+M1YpJn0ImQ4gCVwXTTep0Gsxfx+hhyEpoz7N5NyWhw/MH/0veD+IAJaVYeLys1c58kUsThHWmGPxuVDD0nbN6oK9EmCylslU8jW0S92uG2wmcZ4Tt66GEW4UGoJVB7VLXG5hgU1LJLLFsFD8Jr5KBdDD8rmguEXtKQYOQvx4leUenBKM6MLS52qDshBIGDwAGRyq6t35qy0JOEDZxhm/FbYKxN7Cr79S6fNlUjsyc6t6fpK6OzaLeh+JrKj9ZyuSKyhYNCgMMLfII5SJp8GFUGjXY1aO+YKHU18INoKlmXANHqkH7lVjqofLTFgh1F5EWiiORHY89RJPDtWXQPOvSt0+O45QCF5S8v6GqabA33/IEREMZPrgUn90Du7btfKrBP2sZD0xJW27fGKdxaTVle9XRDEjzqGTqAii/POISN5+CDy2Nm+4uSyyISXPYzY5JKlg5Q5e9g7Vl/Gr4x9EVdkyxyUpAvoI1RvFsYvT4ngQEgm5YxtOAOTANob28mARtpK5RC8jrqBhKtBWHLe72q3pvlINgZlfrVrbwjMh9zB9LIHgyMqUxOtPBpNW9/BcUix28QSoAqKBf60AIgQ9NYimCktWT9m5ZXYzz3Xm8jlZ1pW4oeX/VM5IlnC/+heUeOyfBSrVXiL4+SMNZYfT+Y9e/PzFCUX4GSjlOgZYdEJ7MlXB9DC1+71ZOCVk9RfQqG+dH/BhUMdJ2JJ4fX8h+jrLJTJpm2xB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(2906002)(6512007)(66946007)(66476007)(6666004)(45080400002)(966005)(6486002)(508600001)(8936002)(8676002)(66556008)(4326008)(186003)(15650500001)(38100700002)(6506007)(2616005)(86362001)(31696002)(44832011)(66574015)(316002)(7416002)(36756003)(5660300002)(31686004)(54906003)(53546011)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WC9ydXpsbEo1YlpMQXdpMEFqeTNnYitidUdNZXVsY1NsZGsybnBIOGxWQllC?=
 =?utf-8?B?NnpWcyt0L2hHN3U1biszaDJYNko4TVJnZWxRamJoYTd3c1dOclhEN1NONVcz?=
 =?utf-8?B?QWllWStMRnh3V2MzM1VRUW4reEx0SFNYZG9ibDQ3RXdjTThIdnNRWDVVZHVE?=
 =?utf-8?B?QmRLQlk5ajVvY2tROXFLcHNuNS9SR3VjdDlXRFdqV3Bqd214eVJBa1d5bWox?=
 =?utf-8?B?YnhpOUZZTzBGUkpFMkdXdUZPeW9rWWZZZng0Q2t6c3ZwOHUwRkNVb01RMFdG?=
 =?utf-8?B?d0VhMHdqZVRJNUgxZjhaVXVLQXlPd21KNXQ5TTFEdVJRaExLY1F6TitsVkgy?=
 =?utf-8?B?dHJxQ1BGYjZGRU5EaVBydmJGU0JUQllCTU5Ceis3Y3hyUWJPcENvakFsSjZ6?=
 =?utf-8?B?b2d4Tmd6UUJBRkEwVXFRR0hYT1hiaDNkWE0yRGhWNEVybmpjMnlTUXlPNmcx?=
 =?utf-8?B?RG03ZmxVd1d0ZnJ3R3dqMmRSZUFNNlhyNFZkVDBISTNiS1JQeDZUZzgrYlZG?=
 =?utf-8?B?QVpoWk5lMmp0U2ZQYmJsaVkyZ092UGdCNnJwQlJSSWlGU3ZWRWowUTFtcFBs?=
 =?utf-8?B?VmdGVXp3eEFaZjJCQldaNlh4RFFaVjVrbThnTkxIZms5SldtMWtlUmFRZTdh?=
 =?utf-8?B?M000ZWU2MlRuUkZZUGhUSVdQdU1NKzhHNUtEbWorQituSWR2SEp4c0p0azlo?=
 =?utf-8?B?bXlRT1RPWmZMeVdNMFRaaDdpWG96Ly9Ia2FXWndmdTVXblJpZ3pTSGl4MGZm?=
 =?utf-8?B?bXlaK3gwQ1R2cjNiK1lqWXlNb0JweE02d016RWY3Y3NYM0dwUlVnaW43RnlL?=
 =?utf-8?B?eXBuME1pcWM2VVZqSFFLL3ZscHJvbnRPQithZmV1cnp4ZCtFSW5hMUs1MHlt?=
 =?utf-8?B?VTd1dUw4Yy8wZnZOcGJZajl1NVhNK3RobnBnMFlpbG9KZTh0bFR3RUw3V3B0?=
 =?utf-8?B?NFY0N0dBT0JCeGZUUWJFUDhCUEJJK3VXYzh0YWdnTFFYYk5nNTVXdkwzYmxK?=
 =?utf-8?B?SzR5U1llOUk3WHRrdG41cG1xWVVBNmlnZm5aNDBha3BqNmVoc2xaYk82V0M2?=
 =?utf-8?B?Q2plMWJwQ0wzQW5BVXNMeGJWcDVVVUhLZ0NTMjA2V283SVBSRXQ4OXVPWG96?=
 =?utf-8?B?SmlwV1lkeWRYa01jVlFzSkZCaHA3cGt0TmlmbG9yeXZhVHpEVGkxSHQvS2RH?=
 =?utf-8?B?a1p1Z1YwZklpY2VNY2x4UmtGUllyK3dJalRVSUE1MVljNGNHY3U3ZWcwTlpy?=
 =?utf-8?B?dCtvNUJiKzQzK2picWVSNlVydFJCTkZQM0hrQkdJN25Ra3lyUGYvL3YwUHA5?=
 =?utf-8?B?Lzc2UzBiUG03eG51Y1BQWGdqVi9FdVZub0lxUlVSazdmZ2pudjJNOWtHS1Bp?=
 =?utf-8?B?cHVoZ3RNZml4bzJiSGFHY1BFaXJFeWd6OXV0NjJHeXdadDd4STlVZXZBMlVu?=
 =?utf-8?B?T253UWFlaWVFZW4zMElST3VadDRoRmNXMDlSMVRBdnVuSjJad29VbDQ4NHVL?=
 =?utf-8?B?bTJtaDJSVm56RmZuVWw4S3JRMXlYRlNQRjNNRGwyZ2hJY2tBQVZETzJ3S3Ba?=
 =?utf-8?B?QnN5dTVxZnh3dVlDVVl6eGg4cUVDQUZLOTg4dFNZSk44bUdmMTY1S1FZbGc2?=
 =?utf-8?B?b3UzT0t2bjRKYzlzK3RQellPeXFEZ1IzOU5IelBnUVhnVlphQTFyelNpL1hl?=
 =?utf-8?B?SkxWU04ycUtaQ3RLbndMZ2d2RStVMjRtN1E1bGlmZlN3MEVLV3NhMStHZVg3?=
 =?utf-8?B?YWk1NDdLL3RWdzZ2ejYwZGVWWEZ4Wktsc04vYmtMS2dsR1JjbERiOE5XQkxP?=
 =?utf-8?B?TnQxbEE2U0dCMlMrUG1LZlcrTlNYQkZKVHlTL29qejBPRVB0bG1ScjBiMkcx?=
 =?utf-8?B?ZzN3cG9PaURpYWt4eW5lTStteEZPemNmRlVVd2RsN1hJdnRPWVlmNW92U2d3?=
 =?utf-8?B?MzZTcThhUzNrNjBZUWsvZDBvK3V0VThLanltQm5zdDBaRUxKYkszYTNUdlB3?=
 =?utf-8?B?UFlsM1ErK3p1Y21Tc09IRnpRNExWNUF2M2pZV3B5NFJVNEJKTEtZVjNKSWVE?=
 =?utf-8?Q?qV38F7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4a0745-dbbe-43db-4a07-08da08fc379c
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 16:27:38.5679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vukU1ptfCO5zHcAKOS1bnj+cRqsPYYFiTSY7F4ntTBN6/ut4pQDE0J2fdbT4fAePIXdUYuq+O1Pi57ApRriEFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5547
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 "Alexander.Deucher@amd.com" <Alexander.Deucher@amd.com>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-03-18 12:20, Rob Clark wrote:
> On Fri, Mar 18, 2022 at 9:04 AM Andrey Grodzovsky
> <andrey.grodzovsky@amd.com> wrote:
>>
>> On 2022-03-17 16:35, Rob Clark wrote:
>>> On Thu, Mar 17, 2022 at 12:50 PM Andrey Grodzovsky
>>> <andrey.grodzovsky@amd.com> wrote:
>>>> On 2022-03-17 14:25, Rob Clark wrote:
>>>>> On Thu, Mar 17, 2022 at 11:10 AM Andrey Grodzovsky
>>>>> <andrey.grodzovsky@amd.com> wrote:
>>>>>> On 2022-03-17 13:35, Rob Clark wrote:
>>>>>>> On Thu, Mar 17, 2022 at 9:45 AM Christian König
>>>>>>> <christian.koenig@amd.com> wrote:
>>>>>>>> Am 17.03.22 um 17:18 schrieb Rob Clark:
>>>>>>>>> On Thu, Mar 17, 2022 at 9:04 AM Christian König
>>>>>>>>> <christian.koenig@amd.com> wrote:
>>>>>>>>>> Am 17.03.22 um 16:10 schrieb Rob Clark:
>>>>>>>>>>> [SNIP]
>>>>>>>>>>> userspace frozen != kthread frozen .. that is what this patch is
>>>>>>>>>>> trying to address, so we aren't racing between shutting down the hw
>>>>>>>>>>> and the scheduler shoveling more jobs at us.
>>>>>>>>>> Well exactly that's the problem. The scheduler is supposed to shoveling
>>>>>>>>>> more jobs at us until it is empty.
>>>>>>>>>>
>>>>>>>>>> Thinking more about it we will then keep some dma_fence instance
>>>>>>>>>> unsignaled and that is and extremely bad idea since it can lead to
>>>>>>>>>> deadlocks during suspend.
>>>>>>>>> Hmm, perhaps that is true if you need to migrate things out of vram?
>>>>>>>>> It is at least not a problem when vram is not involved.
>>>>>>>> No, it's much wider than that.
>>>>>>>>
>>>>>>>> See what can happen is that the memory management shrinkers want to wait
>>>>>>>> for a dma_fence during suspend.
>>>>>>> we don't wait on fences in shrinker, only purging or evicting things
>>>>>>> that are already ready.  Actually, waiting on fences in shrinker path
>>>>>>> sounds like a pretty bad idea.
>>>>>>>
>>>>>>>> And if you stop the scheduler they will just wait forever.
>>>>>>>>
>>>>>>>> What you need to do instead is to drain the scheduler, e.g. call
>>>>>>>> drm_sched_entity_flush() with a proper timeout for each entity you have
>>>>>>>> created.
>>>>>>> yeah, it would work to drain the scheduler.. I guess that might be the
>>>>>>> more portable approach as far as generic solution for suspend.
>>>>>>>
>>>>>>> BR,
>>>>>>> -R
>>>>>> I am not sure how this drains the scheduler ? Suppose we done the
>>>>>> waiting in drm_sched_entity_flush,
>>>>>> what prevents someone to push right away another job into the same
>>>>>> entity's queue  right after that ?
>>>>>> Shouldn't we first disable further pushing of jobs into entity before we
>>>>>> wait for  sched->job_scheduled ?
>>>>>>
>>>>> In the system suspend path, userspace processes will have already been
>>>>> frozen, so there should be no way to push more jobs to the scheduler,
>>>>> unless they are pushed from the kernel itself.
>>>>> amdgpu_device_suspend
>>>> It was my suspicion but I wasn't sure about it.
>>>>
>>>>
>>>>> We don't do that in
>>>>> drm/msm, but maybe you need to to move things btwn vram and system
>>>>> memory?
>>>> Exactly, that was my main concern - if we use this method we have to use
>>>> it in a point in
>>>> suspend sequence when all the in kernel job submissions activity already
>>>> suspended
>>>>
>>>>> But even in that case, if the # of jobs you push is bounded I
>>>>> guess that is ok?
>>>> Submissions to scheduler entities are using unbounded queue, the bounded
>>>> part is when
>>>> you extract next job from entity to submit to HW ring and it rejects if
>>>> submission limit reached (drm_sched_ready)
>>>>
>>>> In general - It looks to me at least that what we what we want her is
>>>> more of a drain operation then flush (i.e.
>>>> we first want to disable any further job submission to entity's queue
>>>> and then flush all in flight ones). As example
>>>> for this i was looking at  flush_workqueue vs. drain_workqueue
>>> Would it be possible for amdgpu to, in the system suspend task,
>>>
>>> 1) first queue up all the jobs needed to migrate bos out of vram, and
>>> whatever other housekeeping jobs are needed
>>> 2) then drain gpu scheduler's queues
>>> 3) and then finally wait for jobs executing on GPU to complete
>>
>> We already do most of it in amdgpu_device_suspend,
>> amdgpu_device_ip_suspend_phase1
>> followed by amdgpu_device_evict_resources followed by
>> amdgpu_fence_driver_hw_fini is
>> exactly steps 1 + 3. What we are missing is step 2). For this step I
>> suggest adding a function
>> called drm_sched_entity_drain which basically sets entity->stopped =
>> true and then calls drm_sched_entity_flush.
>> This will both reject any new insertions into entity's job queue and
>> will flush all pending job submissions to HW from that entity.
>> One point is we need to make make drm_sched_entity_push_job return value
>> so the caller knows about job enqueue
>> rejection.
> Hmm, seems like job enqueue that is rejected because we are in the
> process of suspending should be more of a WARN_ON() sort of thing?
> Not sure if there is something sensible to do for the caller at that
> point?


What about the job's fence the caller is waiting on ? If we rejected
job submission the caller must know about it to not get stuck waiting
on that fence.


>
>> What about runtime suspend ? I guess same issue with scheduler racing
>> against HW susppend is relevant there ?
> Runtime suspend should be ok, as long as the driver holds a runpm
> reference whenever the hw needs to be awake.  The problem with system
> suspend (at least if you are using pm_runtime_force_suspend() or doing
> something equivalent) is that it bypasses the runpm reference.
> (Which, IMO, seems like a bad design..)


I am not totally clear  yet - can you expand a bit why one case is ok 
but the other
problematic ?

Andrey


>
>> Also, could you point to a particular buggy scenario where the race
>> between SW shceduler and suspend is causing a problem ?
> I wrote a piglit test[1] to try to trigger this scenario.. it isn't
> really that easy to hit
>
> BR,
> -R
>
> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fmesa%2Fpiglit%2F-%2Fmerge_requests%2F643&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C502ac8db4fb94b3b0e9d08da08fb270e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637832172051790527%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=u2Fqq%2BZpmjFHQFK77xwxEA5092O3Nc%2FdCMllfejgnvU%3D&amp;reserved=0
>
>> Andrey
>>
>>
>>> BR,
>>> -R
>>>
>>>> Andrey
>>>>
>>>>
>>>>> BR,
>>>>> -R
