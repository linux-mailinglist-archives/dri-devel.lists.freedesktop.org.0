Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74273A3FBC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 12:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB5B6E2B4;
	Fri, 11 Jun 2021 10:03:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2059.outbound.protection.outlook.com [40.107.95.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23946E02B;
 Fri, 11 Jun 2021 10:03:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APhQ/1SQcemaVbMUGqzSVzBkqPBVbZEE82ME9KrnVWkx4MMyZU++MuA3UXj0kh5h+i0mT4h6ByAUq2XWqGIQbbD4/ciWfMZfSpYaLuhZNcTaWuo4doQPjsL0dUWxs8YmxhEYphnIxgg9CsJ/zuAf/tzLo+uvc7lZA/tTItvq9aDBLLoIa49Agic546KNT65NRjc9BC7jtWrRlAP5DTApcJdxIcGAYHK5h7i0hsdy/SSttqzgj6S9tTlMHvv5jFANoFwL+I1lyATBGc/zT7KNQN2Fis8q7Bof6XxCFk2shSCd3HcOVe7dDY8PbrNTWSfY8DjcTCanc29dioNktloHTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/DtIqOEAO8F+XNWtJaMrksM7mVQh2gS6tiEpB0v4FM=;
 b=H1VvvbkVCm7SCQLEGGc33MlnglFULmNyysAn0545V+QOWEUXrx+YPppQj5PernRcr91a2izkZGcefAVv3gxWsEmavVOpo0OPEQzOw0M1S9AMlEHqLN8aZv08dbEA7fCID7SXeBY7mHObLWhpLPzrB3e4/U1iSOgUa92+hz/fKtfYgUDQVNpV9Wy8mHaxoLA4GEAjuwpvvd5Y9Fz6DBbho9AlqW3lixwBu8wZb3/ntYfL5VgWg4DNgqOyr/Z9Hof+G+/B/gLlD7hqFms6OLANS0uuwS8nfAyZljlgi9d3WM0SEtF6u41DlPFAbLTRuKBLI3jUX1teGWBXRZg5N6K8BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/DtIqOEAO8F+XNWtJaMrksM7mVQh2gS6tiEpB0v4FM=;
 b=CxIYWEejaMvt214qejuOn/C9baCgIo3xKupB2goQgrKWtHeaPRCRAR9uk2xHBwmuN9nZs1b96PH2bwQwnSUoE5irNVc1Uo27Vn4UDSBvaTJ/5HoXbu/2H8e+Nouwph2PXhn6q+PLrquxF+fTfX7xj9/ws2jf0UJzlo3VvU8rnt4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4110.namprd12.prod.outlook.com (2603:10b6:208:1dd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 11 Jun
 2021 10:03:39 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4219.024; Fri, 11 Jun 2021
 10:03:38 +0000
Subject: Re: [Intel-gfx] [PATCH 0/5] dma-fence, i915: Stop allowing
 SLAB_TYPESAFE_BY_RCU for dma_fence
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210609212959.471209-1-jason@jlekstrand.net>
 <ae289388-911f-2928-d695-050863ee1007@linux.intel.com>
 <f9be43e3-4107-3742-a11b-8021b2c19e32@amd.com>
 <CAKMK7uFMEdFjUSphcyxuKMW8HfLOWQAE2iw-Fei+SRTDwUbRdQ@mail.gmail.com>
 <CAOFGe95BhZ7jXLxarL=2_zNYDydEoPJWnDWAG3aaeEJsDzR5dA@mail.gmail.com>
 <CAOFGe96KrBfvBKxcUNwths5Sigk7fk7ycLeYbgxutL3msEgfyA@mail.gmail.com>
 <CAKMK7uGqGLKFp7Obp-5xW3fPuoRmBa_0OawN-4Q-niDi147tXQ@mail.gmail.com>
 <4dc8314b-4366-2d92-4cca-1497a7c73721@amd.com>
 <CAKMK7uHhL3kepoaznCvAsx8H20sBjWQZgsnWY+zm63KgfCA4CQ@mail.gmail.com>
 <b475e546-02d5-bacf-8764-233efd784ba0@amd.com>
 <YMMt2BE7GaUt+b7v@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3e5ddb11-6df0-1aab-19e5-811dbbca79f6@amd.com>
Date: Fri, 11 Jun 2021 12:03:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YMMt2BE7GaUt+b7v@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:108e:ba37:cb49:9c3]
X-ClientProxiedBy: FRYP281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::11)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:108e:ba37:cb49:9c3]
 (2a02:908:1252:fb60:108e:ba37:cb49:9c3) by
 FRYP281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Fri, 11 Jun 2021 10:03:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a84fed97-0fad-469b-2043-08d92cc02ee2
X-MS-TrafficTypeDiagnostic: MN2PR12MB4110:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4110177855FD07952279FCDA83349@MN2PR12MB4110.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gOKEZmpHs3G5nMjLVJvsqZ/Z9iGp6Eu9RLmG8HzY5uTC4x/9gcQ1DsvMbS6K2z/Zwus7Lpc55TJ8KebreRkMO7O4U6r/v6ZDFCVRUGjFvAXDoZa0wA0AgLGoBAKP3nwTm721MVZVVs6RHu0c3iz4me2FSdQFzImAJVjTj9HZCc7t2BWP88B52o2AYkRvG8QYYGRWBiZzoS955ZzccWgiKx5BAiEdSB4ejqd9U8q+LbApRfrgd5j9JoJWBd5SWYA0VOUPvb+CgyEg/nZ9X9tyTinEOb0nKNVpIC1pvhbPuo4iWl3M94w6VxMtdLDovXhLNg4V2cUvEdYIXzb/Y0h6V98UZoauM8j6V24EsSL0B30x+Ye1xzT/CDw9YqX9z+XNpTV67VktI1zrqDFivWvwIJzm5/kjseQFllqFjQz6fIx7GCIPSSabPZ7mdqnUg1gcQVj1SdKN8EzSW1oY+gJWn3D1WSxMKncjSYEdvvCqiyXp0Ph7+ishecYjlH3bJjYESr0PMsAe8Q25svLu4MskGWIpCasbbZe6w2xAqShRulyUtgT6wp3uJg14OriFQ3NyxiRRps+yJsCTzpFviA2XHNM4fom++2ZnUGewk7EuFEp+euVMBT0EN24/DWzZQC6a9y+4KSwgu4glOcIcETzLOYDpVyPE+p0A0AMj8CEJFRoYSbLO0Z9M5kE1hOTCzkZ+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(86362001)(186003)(316002)(53546011)(54906003)(31696002)(478600001)(66556008)(2616005)(16526019)(4326008)(36756003)(83380400001)(66476007)(6916009)(5660300002)(31686004)(6486002)(8936002)(30864003)(8676002)(2906002)(38100700002)(66574015)(6666004)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alZPWVRhSjROcmxldC8vK1NJalAwYnZrbGtkZjN0VnZyazgvSWxwRC9VK1Vh?=
 =?utf-8?B?WmlYUjA5YjViUFk2RDFFYUtxRktXNUF2QUZBQVNveDM1WU9NaUNvYVhvWWhS?=
 =?utf-8?B?cmF2Mytzdi8xeTZBQW5odTl4YWQvdlFMTkRCSCtDV3VFcTRpSkEva09DTnNs?=
 =?utf-8?B?RWRFa2lhcXgvQTRBTGVpUHM0dzAyMnFNODZnaGxJZlJVamFFd2R5ZUdxMFA3?=
 =?utf-8?B?V2E4a3daSU9VNzZjVDF1Vk1IVW1SZFpZa3hKYzVwUURCVkJvTWkrY2lkeWxK?=
 =?utf-8?B?ZTQ5a3FBdXpyMjFPVVNNT3hVK3BpTTBDL0ZrOXFvR3k4cmJYNmpIU0orYTRC?=
 =?utf-8?B?NHlyVXVqNVpONXpkVGtjd2JFNXJjYkpONWRiMnEreUI4ZWh6ZEJuMU9pRlMy?=
 =?utf-8?B?WW00d095UmxqaCtJM0hTYW1TVWVJQWpwd2N0czdPVC9QYTFMWnQvOGVoZGk1?=
 =?utf-8?B?NmhwT1dQQVl1Wk9xYXVQRTlaWVNsNnF6djVhdXBWdWQ2Z0dyRS9rRUttZXhq?=
 =?utf-8?B?L1FRZXg2c0lDZXdoNEU2RmQ3dDJRK1diOEExcXdYbTZuUUlQdEIxTWZBM0Jj?=
 =?utf-8?B?NVg0Q0tXYmxoVEFYeEYrRmpnUkZOZUhLYndYVWh4dCtIbG0ycjRxenNMWE96?=
 =?utf-8?B?RXN3QVRubFY5KzFWcTh5bFFNWGVlRWhFV04wMUNESFZNaHVwdFJsNmV1MTJO?=
 =?utf-8?B?T1dEVVJIR3g1dXh1SWd0ZlBFN0J4MVJ6RDBlN2ZKU2Fnc0Q2NGI3eCtKOGpF?=
 =?utf-8?B?STZHMzJaZ2o1SEFheDRueXJHcXlJS2drWlVlMEphVllCblJWL1BQbEZPMWxE?=
 =?utf-8?B?L3dkTjFzbnNmVG16QThHQ2NuekNSWG1uV2lpMWl0NVllbnZrdkFtVkl0VU9J?=
 =?utf-8?B?ZXFzZEtPN1BHMUV1bS9abHNqU2k5OVAybzdscVJveDZMTWh2dDduZE5NdnNW?=
 =?utf-8?B?SW0xTTdNTGZjcDVWbGtVV1BoTWlsMldzRzg2RW1laER5dmRhMExTaE5HbWJB?=
 =?utf-8?B?UjFPa3c3eTJTMmE2cncyTjNCSVc1bGw0UFdjZGJkK2xmL3RLOGJUMDV4TG9E?=
 =?utf-8?B?OUZOVUM3cHNmcG1HR09ldzBZc0xXM3RYNWJ5RXRCcWlhSzlia1hzTkk3NGNz?=
 =?utf-8?B?aTBxQjN0RnJERkZHRTVXWVVUK0ZhZGtvZE5IbjFGTVNLTGNpb1o4MVlqbURC?=
 =?utf-8?B?ZjR2NThyMnV4REhYZlI2RUFpM0M4R3YrcVpCSjdsOUZBcUl4RnVwekhncmVE?=
 =?utf-8?B?R29sRGZlYm9FVGg3U2pmREI1N0tiODJYOEEyVklaSnM2dllsclFJWGNoSTZO?=
 =?utf-8?B?cmk4eWhoWHhKK2tWWVByZGx5TmdKZUtWZ1NmT1pVcWxFUEFhaXFST1IvYUd4?=
 =?utf-8?B?MER0KytWR2FFVllSZWhWWjFmclFwMlBHakZuODlyY0pubnFhc0MrTVlDa0x5?=
 =?utf-8?B?d3dkVDFzNHNoRXBhWE85WFdtcVBIbVl2dDQ0VUlaWk5odlFLZExobVlkcjM3?=
 =?utf-8?B?emw2YlNweXptRVRPWVZRWmx3UkR2N3F4RmpHMFc0dktBU055aEsyTnZGbjVw?=
 =?utf-8?B?ajdOc3U1VTN5RjJyWDloZlhva3JsU3dGYjJTRE5aSVE5QTk0UWtuS2pMV09x?=
 =?utf-8?B?K29FSUNJdlhJU25INGpRa1NpK0hVT2M5TjRVTWZPRkI4UlVhNjArRUVhSnMw?=
 =?utf-8?B?T1U1K2s2cVRhQXNqanVjbFV0bElIWmQ3RmY5WGIvRUNqa0pXWWh6aXZCRWNj?=
 =?utf-8?B?cGNOV2E0MW9TeS9FUGtSbUZmRWRFVlNCTjgxSC8yVjFIWWNwSSs0S2ljQXJt?=
 =?utf-8?B?bkJCWG50ZHFRaXRDbHlPZ3pkKzR0SU9mb0hpTEQ4NDBqRFZYc3M0UW80Njlz?=
 =?utf-8?Q?uaZeZ9/VV37Cm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a84fed97-0fad-469b-2043-08d92cc02ee2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 10:03:38.4398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZR0ExfvvhDKoU95wgnbwJaYMBEfNyuvLoeHd2QHccUzGxikZl35oPj98QRac2Ux
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4110
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>, Jason Ekstrand <jason@jlekstrand.net>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.06.21 um 11:33 schrieb Daniel Vetter:
> On Fri, Jun 11, 2021 at 09:42:07AM +0200, Christian König wrote:
>> Am 11.06.21 um 09:20 schrieb Daniel Vetter:
>>> On Fri, Jun 11, 2021 at 8:55 AM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>> Am 10.06.21 um 22:42 schrieb Daniel Vetter:
>>>>> On Thu, Jun 10, 2021 at 10:10 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>>>>>> On Thu, Jun 10, 2021 at 8:35 AM Jason Ekstrand <jason@jlekstrand.net> wrote:
>>>>>>> On Thu, Jun 10, 2021 at 6:30 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>>>>>>>> On Thu, Jun 10, 2021 at 11:39 AM Christian König
>>>>>>>> <christian.koenig@amd.com> wrote:
>>>>>>>>> Am 10.06.21 um 11:29 schrieb Tvrtko Ursulin:
>>>>>>>>>> On 09/06/2021 22:29, Jason Ekstrand wrote:
>>>>>>>>>>> We've tried to keep it somewhat contained by doing most of the hard work
>>>>>>>>>>> to prevent access of recycled objects via dma_fence_get_rcu_safe().
>>>>>>>>>>> However, a quick grep of kernel sources says that, of the 30 instances
>>>>>>>>>>> of dma_fence_get_rcu*, only 11 of them use dma_fence_get_rcu_safe().
>>>>>>>>>>> It's likely there bear traps in DRM and related subsystems just waiting
>>>>>>>>>>> for someone to accidentally step in them.
>>>>>>>>>> ...because dma_fence_get_rcu_safe apears to be about whether the
>>>>>>>>>> *pointer* to the fence itself is rcu protected, not about the fence
>>>>>>>>>> object itself.
>>>>>>>>> Yes, exactly that.
>>>>>>> The fact that both of you think this either means that I've completely
>>>>>>> missed what's going on with RCUs here (possible but, in this case, I
>>>>>>> think unlikely) or RCUs on dma fences should scare us all.
>>>>>> Taking a step back for a second and ignoring SLAB_TYPESAFE_BY_RCU as
>>>>>> such,  I'd like to ask a slightly different question:  What are the
>>>>>> rules about what is allowed to be done under the RCU read lock and
>>>>>> what guarantees does a driver need to provide?
>>>>>>
>>>>>> I think so far that we've all agreed on the following:
>>>>>>
>>>>>>     1. Freeing an unsignaled fence is ok as long as it doesn't have any
>>>>>> pending callbacks.  (Callbacks should hold a reference anyway).
>>>>>>
>>>>>>     2. The pointer race solved by dma_fence_get_rcu_safe is real and
>>>>>> requires the loop to sort out.
>>>>>>
>>>>>> But let's say I have a dma_fence pointer that I got from, say, calling
>>>>>> dma_resv_excl_fence() under rcu_read_lock().  What am I allowed to do
>>>>>> with it under the RCU lock?  What assumptions can I make?  Is this
>>>>>> code, for instance, ok?
>>>>>>
>>>>>> rcu_read_lock();
>>>>>> fence = dma_resv_excl_fence(obj);
>>>>>> idle = !fence || test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
>>>>>> rcu_read_unlock();
>>>>>>
>>>>>> This code very much looks correct under the following assumptions:
>>>>>>
>>>>>>     1. A valid fence pointer stays alive under the RCU read lock
>>>>>>     2. SIGNALED_BIT is set-once (it's never unset after being set).
>>>>>>
>>>>>> However, if it were, we wouldn't have dma_resv_test_singnaled(), now
>>>>>> would we? :-)
>>>>>>
>>>>>> The moment you introduce ANY dma_fence recycling that recycles a
>>>>>> dma_fence within a single RCU grace period, all your assumptions break
>>>>>> down.  SLAB_TYPESAFE_BY_RCU is just one way that i915 does this.  We
>>>>>> also have a little i915_request recycler to try and help with memory
>>>>>> pressure scenarios in certain critical sections that also doesn't
>>>>>> respect RCU grace periods.  And, as mentioned multiple times, our
>>>>>> recycling leaks into every other driver because, thanks to i915's
>>>>>> choice, the above 4-line code snippet isn't valid ANYWHERE in the
>>>>>> kernel.
>>>>>>
>>>>>> So the question I'm raising isn't so much about the rules today.
>>>>>> Today, we live in the wild wild west where everything is YOLO.  But
>>>>>> where do we want to go?  Do we like this wild west world?  So we want
>>>>>> more consistency under the RCU read lock?  If so, what do we want the
>>>>>> rules to be?
>>>>>>
>>>>>> One option would be to accept the wild-west world we live in and say
>>>>>> "The RCU read lock gains you nothing.  If you want to touch the guts
>>>>>> of a dma_fence, take a reference".  But, at that point, we're eating
>>>>>> two atomics for every time someone wants to look at a dma_fence.  Do
>>>>>> we want that?
>>>>>>
>>>>>> Alternatively, and this what I think Daniel and I were trying to
>>>>>> propose here, is that we place some constraints on dma_fence
>>>>>> recycling.  Specifically that, under the RCU read lock, the fence
>>>>>> doesn't suddenly become a new fence.  All of the immutability and
>>>>>> once-mutability guarantees of various bits of dma_fence hold as long
>>>>>> as you have the RCU read lock.
>>>>> Yeah this is suboptimal. Too many potential bugs, not enough benefits.
>>>>>
>>>>> This entire __rcu business started so that there would be a lockless
>>>>> way to get at fences, or at least the exclusive one. That did not
>>>>> really pan out. I think we have a few options:
>>>>>
>>>>> - drop the idea of rcu/lockless dma-fence access outright. A quick
>>>>> sequence of grabbing the lock, acquiring the dma_fence and then
>>>>> dropping your lock again is probably plenty good. There's a lot of
>>>>> call_rcu and other stuff we could probably delete. I have no idea what
>>>>> the perf impact across all the drivers would be.
>>>> The question is maybe not the perf impact, but rather if that is
>>>> possible over all.
>>>>
>>>> IIRC we now have some cases in TTM where RCU is mandatory and we simply
>>>> don't have any other choice than using it.
>>> Adding Thomas Hellstrom.
>>>
>>> Where is that stuff? If we end up with all the dma_resv locking
>>> complexity just for an oddball, then I think that would be rather big
>>> bummer.
>> This is during buffer destruction. See the call to dma_resv_copy_fences().
> Ok yeah that's tricky.
>
> The way solved this in i915 is with a trylock and punting to a worker
> queue if the trylock fails. And the worker queue would also be flushed
> from the shrinker (once we get there at least).

That's what we already had done here as well, but the worker is exactly 
what we wanted to avoid by this.

> So this looks fixable.

I'm not sure of that. We had really good reasons to remove the worker.

>
>> But that is basically just using a dma_resv function which accesses the
>> object without taking a lock.
> The other one I've found is the ghost object, but that one is locked
> fully.
>
>>>>> - try to make all drivers follow some stricter rules. The trouble is
>>>>> that at least with radeon dma_fence callbacks aren't even very
>>>>> reliable (that's why it has its own dma_fence_wait implementation), so
>>>>> things are wobbly anyway.
>>>>>
>>>>> - live with the current situation, but radically delete all unsafe
>>>>> interfaces. I.e. nothing is allowed to directly deref an rcu fence
>>>>> pointer, everything goes through dma_fence_get_rcu_safe. The
>>>>> kref_get_unless_zero would become an internal implementation detail.
>>>>> Our "fast" and "lockless" dma_resv fence access stays a pile of
>>>>> seqlock, retry loop and an a conditional atomic inc + atomic dec. The
>>>>> only thing that's slightly faster would be dma_resv_test_signaled()
>>>>>
>>>>> - I guess minimally we should rename dma_fence_get_rcu to
>>>>> dma_fence_tryget. It has nothing to do with rcu really, and the use is
>>>>> very, very limited.
>>>> I think what we should do is to use RCU internally in the dma_resv
>>>> object but disallow drivers/frameworks to mess with that directly.
>>>>
>>>> In other words drivers should use one of the following:
>>>> 1. dma_resv_wait_timeout()
>>>> 2. dma_resv_test_signaled()
>>>> 3. dma_resv_copy_fences()
>>>> 4. dma_resv_get_fences()
>>>> 5. dma_resv_for_each_fence() <- to be implemented
>>>> 6. dma_resv_for_each_fence_unlocked() <- to be implemented
>>>>
>>>> Inside those functions we then make sure that we only save ways of
>>>> accessing the RCU protected data structures.
>>>>
>>>> This way we only need to make sure that those accessor functions are
>>>> sane and don't need to audit every driver individually.
>>> Yeah better encapsulation for dma_resv sounds like a good thing, least
>>> for all the other issues we've been discussing recently. I guess your
>>> list is also missing the various "add/replace some more fences"
>>> functions, but we have them already.
>>>
>>>> I can tackle implementing for the dma_res_for_each_fence()/_unlocked().
>>>> Already got a large bunch of that coded out anyway.
>>> When/where do we need ot iterate over fences unlocked? Given how much
>>> pain it is to get a consistent snapshot of the fences or fence state
>>> (I've read  the dma-buf poll implementation, and it looks a bit buggy
>>> in that regard, but not sure, just as an example) and unlocked
>>> iterator sounds very dangerous to me.
>> This is to make implementation of the other functions easier. Currently they
>> basically each roll their own loop implementation which at least for
>> dma_resv_test_signaled() looks a bit questionable to me.
>>
>> Additionally to those we we have one more case in i915 and the unlocked
>> polling implementation which I agree is a bit questionable as well.
> Yeah, the more I look at any of these lockless loop things the more I'm
> worried. 90% sure the one in dma_buf_poll is broken too.
>
>> My idea is to have the problematic logic in the iterator and only give back
>> fence which have a reference and are 100% sure the right one.
>>
>> Probably best if I show some code around to explain what I mean.
> My gut feeling is that we should just try and convert them all over to
> taking the dma_resv_lock. And if there is really a contention issue with
> that, then either try to shrink it, or make it an rwlock or similar. But
> just the more I read a lot of the implementations the more I see bugs and
> have questions.

How about we abstract all that funny rcu dance inside the iterator instead?

I mean when we just have one walker function which is well documented 
and understood then the rest becomes relatively easy.

Christian.

> Maybe at the end a few will be left over, and then we can look at these
> individually in detail. Like the ttm_bo_individualize_resv situation.

