Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42230464798
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 08:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85646E841;
	Wed,  1 Dec 2021 07:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B906E884;
 Wed,  1 Dec 2021 07:05:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6P9QvjCxCP1+DzScIWT8HDpsGR7WNuLZknL9RFITG+5YqyVbzDtRJSdi66qobTAS0qK8dBfRALipVw8BhwQSSv/BOHuiyzWON+Hb75j+HloFocTotu5FGQqww8BhJ8z74DUpLPbkDuEzcvEBMoHpRdPWcM67XmBhSaCKuops4e1i9tQkf0Emrkqbp1HCv+1rBjQlEojfEqJGNMxEugtsTRQGk8IIa+0pgJ3ndt4Z3xdNOUxkXUEjEQDHkFh4AT8mTsnU7CnwrsRIDxHppde5F3PIVPiG/ywBXoarigvGqzwHrwaMzF5Ci+O+hDXj4MmJ6F8wT4sL+axVFoY0i5rKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jw6Xv/7Vo1gPfDB4h+QTEHjxqupL25VzXiiPo1UqU0s=;
 b=Z9P4HhwG7oaU5Mj8HadSVRURpizjIt6fmAhlFMA6DILw428AGxAa5J5MDvmYzr0cxhWABhdo+IoRKrwGi895nD5Fcg+jqTeif9gC1kzpy+YuBHPx3DSaSNxoWaGp4XDHFWlDEBHnCOukok20VgtWMy3vcGqnWFmEeLufhViQByVtnfAhZzQQZJQP4IycE2AkcbpRzRIgFsgcAwC3xt2hTJbqGAOtPSCWqHwfSOgo0Z7WcnJ4O8KefT49mLL1r8rPvQUaECcx9SRNVTjeYLXofwOyYMRwkXpwpycftF7j4iwx1rRmKo8PjbCM28JT0jK8vwo/0ul2YCBTFPth6M+fMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jw6Xv/7Vo1gPfDB4h+QTEHjxqupL25VzXiiPo1UqU0s=;
 b=U4d1A769F5onzkSGz843Vlkqb5owYsr8DuaXUfqj/zi/cZWCoqBM1FPCf3e599JWxF3rCuAxvoTTnk2oI1BXKQTuEMQBgTBRi5l1zvIXn3tIg4g/POYe4zKSQmPHuoO3d2VWw7KJT4L8qsCd932RQfTqi4Qre3ZlixFOl9NavkA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW2PR12MB2490.namprd12.prod.outlook.com
 (2603:10b6:907:9::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 1 Dec
 2021 07:05:53 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4713.027; Wed, 1 Dec 2021
 07:05:53 +0000
Subject: Re: [RFC PATCH 1/2] dma-fence: Avoid establishing a locking order
 between fence classes
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211130121936.586031-1-thomas.hellstrom@linux.intel.com>
 <20211130121936.586031-2-thomas.hellstrom@linux.intel.com>
 <c7502701-e85c-39f0-c249-702d029faa9e@linux.intel.com>
 <b440cfbc-2b9a-1aa2-76d6-17337f835777@linux.intel.com>
 <52a7cf8c-59c7-fec0-2274-d19bdc505314@amd.com>
 <57df8b0b-1d65-155f-a9a6-8073bbd4f28f@linux.intel.com>
 <2551da4d-2e51-cc24-7d4a-84ae00a1547c@amd.com>
 <29d096c91d720fbe5d410124580a02b663155b56.camel@linux.intel.com>
 <250a8e47-2093-1a98-3859-0204ec4e60e6@amd.com>
 <712b54fa1c09ae5cc1d75739ad8a7286f1dae8db.camel@linux.intel.com>
 <49cf2d43-9a8a-7738-0889-7e16b0256249@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <193e36bd-ba64-1358-8178-73ee3afc3c41@amd.com>
Date: Wed, 1 Dec 2021 08:05:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <49cf2d43-9a8a-7738-0889-7e16b0256249@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS8P250CA0003.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::8) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (87.176.183.123) by
 AS8P250CA0003.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Wed, 1 Dec 2021 07:05:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e4cb193-b648-4a8a-efe9-08d9b499039b
X-MS-TrafficTypeDiagnostic: MW2PR12MB2490:
X-Microsoft-Antispam-PRVS: <MW2PR12MB249012E3D6560464F80F3CEA83689@MW2PR12MB2490.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FSRz5giSbIKHmMVX+q5NaLcQcfSUkt0Is9fq59dUOg/SC+OGWhd4Mk2sf5NEFyATac+aAWFXPlypYi96zyCGPe75Dda1Q9czuYtq+1J1ncDbA0PDRwxk/SWqoCy3GUqfGCCDw0NWutgyp0/Jg+EF0DfdUKXUbGhn3uY1fLyRIjx1wR5b+UjBjff5mRqUXHgHfimJHE8CT4GAkLwMDIkTKCorCefLLUmCCLqURiJhnaZJkgo0C0lpM1R6VR4r//BF7oG6KuqSdtanBzlKsJ4wAguQLTsy2RyEu//CRAixun32rtvdhHpodWg1DxzUpT5kYdSjBoVWjdnedcY0sX+tfef51Fhhbv2MVQsrwcjUMb5/gc2vBGTvqE52psb2ocw32qW0AHHO3vZ73izRgb3OH2PcNQKLNc5YBHYxiCakIudhvDiqTN/aQEtNjnyoS5j/6IvJDxfXUBhdqbLXWH5lakd0Km1+iVn5vuEs3gn1mCtdTF1dC+0GDkK0ELlrrwbD1x8i7pDWAyFl7X/4GX0ejdl/Qc8Q3sa6s9hjisgu1zED/BWog205/E+dYEnoZzuzN6gxzHncfLB/Tk10tFda64Ub5VHV2bRoBvDzhkjo+BAG/rioVyNMf5zz4bjqYALwwqDB5KWmIZlwnaXnCY2JWOijK9j9Dtb1pX5/aiLo43CKT72BriYP1RszopCaUc5D7H7HZ69PUDqJ0twI3ap6XI1el3z32da/ofEatZq0QMrZYSNuQqDq9eJDEeb32e0k
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(8936002)(86362001)(31686004)(6486002)(508600001)(2906002)(4326008)(26005)(110136005)(4001150100001)(8676002)(6666004)(53546011)(66574015)(5660300002)(36756003)(66556008)(31696002)(16576012)(83380400001)(316002)(66946007)(38100700002)(956004)(2616005)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1RQQy9yYVg2QUwwVHNHL1JIemppQ3VzQXdBd2hjRHFhQkI4ekp2MTZQMDJ2?=
 =?utf-8?B?cklkb0VUd0VMZmtiRmdWSG1iYkdhM3R1UlVuRVhBc3UwZVNZT2doQWJzM3pB?=
 =?utf-8?B?R0FJMVVKUElGaDcrS05sUytSL1NvVXFYaE5zZnlJczdZRTZyZTQ0RDhWejYv?=
 =?utf-8?B?NUd5NVlCQngyK3pWakVvc3RSY1hKYzM4V3NFakhaM0J2WHcyT3NoQldtYS9U?=
 =?utf-8?B?Lzh4S0NWWmx1VmsrbDQ5Y1ZMSlYrYi9jV1F5Mk9mTnIvMmFnd0g2d2hyRG41?=
 =?utf-8?B?ejFZV29OSlBydkFVY0dmclhPRG1GNXJqYWEycFVMMEplVzB6UVFuNnExbjA5?=
 =?utf-8?B?Z0F6MXM2OVFCaXk4S2cwRGNLYjY2OXRqdEFaTy9KUXAxVHVlTmF1UE1idXpy?=
 =?utf-8?B?dkxlRzd6VkZwUFFiTUY4eHgxNUxKUnNBYnM0QXAzb1hQVDdTUzFicG1IWTk0?=
 =?utf-8?B?MnE2dWdoZEtIQzNETEVrdWtMa0d1UU5nbHFUSTlOdFo1OWh2V1BYSnNhbUZv?=
 =?utf-8?B?bGI3SGhLVzkwZzBWQXhvK2l4VWFxK2dBNTIxNzVqOXFGakwyTXUvak9xYTNT?=
 =?utf-8?B?Mm1TR3ZZalFnNTJqZGl4bEgyV2xiMlVFNzN5RDRhejRGSTZyODRJOEYzeHpC?=
 =?utf-8?B?ZllRaFRFZjhlMU9tK2RuRXQzTmp4Y2QxQStiZklCU2NNMEJyUzVvVGN1TlZa?=
 =?utf-8?B?ME85VFNJc3c4Q01ESVlOVDBDa3NqcDl6cUZmQUNJaGdKb2l1eXlNOVpwYmVk?=
 =?utf-8?B?d3NHR0NTY1FVQnN4by9DSFNDU2tlbEk5aUhMNk1vV29LeElWOG1MbFladXFn?=
 =?utf-8?B?eHZXemd2WDh1bFl4WStzckxMYVNkR2tGZTEyNGo3eHRzdmVwSjFWeGJLc1Nl?=
 =?utf-8?B?dFlGb05LRVFhRU5zTzdqaTlZZjZIcS9uSFoxRWZXOTZVc2tsb0drWUIrVGJh?=
 =?utf-8?B?NlJpNkZjbmJxMFo5WW9MQ1BTMlZEVE5JbDE4V3k4SEVHUWQ5aGhublRuVC9I?=
 =?utf-8?B?bEJNaTF2QnFoallXdlZIVUsvRlhjUE1xWlpaTmczOGE1M3BZS0xJQ1pCV3lz?=
 =?utf-8?B?eW9IaGQrLzQ2Q3NMNDV4aVlvRHRGaWwrdXBxMkllaHVtUWR5ZTM2TXBzNXdQ?=
 =?utf-8?B?VUtoVmRaRUl6QnBGdzlvNzZBejFDOVFiaklNWnNRUW1pRDlXeUVhQWQxZHpi?=
 =?utf-8?B?M05FK254d1Z0dHYvWmtNZmRkWkVMaEpzS01HTTZ2amtqVWxUNkpPMVdCb0dQ?=
 =?utf-8?B?UWRNTEd1MTd2YS9iS3JMck5rN2lvVzlmdGhTZ3NqYWtVcXF2WWtzY29zbWpz?=
 =?utf-8?B?enVDaUN4M0dzanI5VmFaU3dWME5wZFZJUTg4RUdKSUVBZzNKY3B6a1hHYjVz?=
 =?utf-8?B?R0hFb2VIZmJzQ3B2Rm5hU0RBRmVGdjB0VmZPM0NDeHRIeUVweXUvZlQ2V1Fs?=
 =?utf-8?B?TFNlUXRhdjRraUNockVNWjJOTDNjNnhQMlgyenAzbnFURVVEL2tOTXQ2Yi9F?=
 =?utf-8?B?NXkyOUxZOURyVXpEamZaNjJFelEwUitWWmVLTEdvbXhwdnpWOUlFcjViMzdE?=
 =?utf-8?B?aEUrbGlITjhkZklxVVV3OE50QjhzR1ZoVmtJTU1qVGg4dFd6UVdNelA4K0tm?=
 =?utf-8?B?YmFkZUJIRFgrRi9yS2FqeC9NRGFSamtGR2FsQVNXSWVuOWl1ZHB5WEptOHBx?=
 =?utf-8?B?L0dDWFcwTSt4TjhtdWhmcVFvUklwNzVjVzJtdExROFgrL3JoV1ovRExjRTQ0?=
 =?utf-8?B?REwvVXlyZWlmVE5WOWFpQmZCNEcrNmhTNGl2M3JNUUxIZkNDSVBlb0lDbFpr?=
 =?utf-8?B?eDUwWlhWbnNrTUdmYTZyRVlKWUY0YXNKTmJlYUJZZEJIYmRBalhqNDFub0F4?=
 =?utf-8?B?MGl4R2xJdVdFUktiK0lXYXNIdC96ekdjeUN2TklOUGpSMGZqa012QTF5NW1D?=
 =?utf-8?B?VDhETTkrakFDL0FvT25MbGpueTdPeS9neUl2c0xKWUhwQ0dZc3lweGxQOURq?=
 =?utf-8?B?aHNIVDlRQ05XMGM4K3hHejNqTlhka1BsNGxmbmRheGd3OHJ3akhsdUlIN2RK?=
 =?utf-8?B?TWJKdmJ0bHdRYStNZ1dGZVRCQURLRFBNNTl6cEUyd3ljcG1tM3QvRWE4WFpP?=
 =?utf-8?Q?d6HY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4cb193-b648-4a8a-efe9-08d9b499039b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 07:05:53.4802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tocEvgc+rjF8UzDYuB/bpJxgSh2Hyf+5eRrHmSr2vaU0qHZnuLVVdKngB2Vfdmk1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2490
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
Cc: linaro-mm-sig@lists.linaro.org, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.11.21 um 20:27 schrieb Thomas Hellström:
>
> On 11/30/21 19:12, Thomas Hellström wrote:
>> On Tue, 2021-11-30 at 16:02 +0100, Christian König wrote:
>>> Am 30.11.21 um 15:35 schrieb Thomas Hellström:
>>>> On Tue, 2021-11-30 at 14:26 +0100, Christian König wrote:
>>>>> Am 30.11.21 um 13:56 schrieb Thomas Hellström:
>>>>>> On 11/30/21 13:42, Christian König wrote:
>>>>>>> Am 30.11.21 um 13:31 schrieb Thomas Hellström:
>>>>>>>> [SNIP]
>>>>>>>>> Other than that, I didn't investigate the nesting fails
>>>>>>>>> enough to
>>>>>>>>> say I can accurately review this. :)
>>>>>>>> Basically the problem is that within enable_signaling()
>>>>>>>> which
>>>>>>>> is
>>>>>>>> called with the dma_fence lock held, we take the dma_fence
>>>>>>>> lock
>>>>>>>> of
>>>>>>>> another fence. If that other fence is a dma_fence_array, or
>>>>>>>> a
>>>>>>>> dma_fence_chain which in turn tries to lock a
>>>>>>>> dma_fence_array
>>>>>>>> we hit
>>>>>>>> a splat.
>>>>>>> Yeah, I already thought that you constructed something like
>>>>>>> that.
>>>>>>>
>>>>>>> You get the splat because what you do here is illegal, you
>>>>>>> can't
>>>>>>> mix
>>>>>>> dma_fence_array and dma_fence_chain like this or you can end
>>>>>>> up
>>>>>>> in a
>>>>>>> stack corruption.
>>>>>> Hmm. Ok, so what is the stack corruption, is it that the
>>>>>> enable_signaling() will end up with endless recursion? If so,
>>>>>> wouldn't
>>>>>> it be more usable we break that recursion chain and allow a
>>>>>> more
>>>>>> general use?
>>>>> The problem is that this is not easily possible for
>>>>> dma_fence_array
>>>>> containers. Just imagine that you drop the last reference to the
>>>>> containing fences during dma_fence_array destruction if any of
>>>>> the
>>>>> contained fences is another container you can easily run into
>>>>> recursion
>>>>> and with that stack corruption.
>>>> Indeed, that would require some deeper surgery.
>>>>
>>>>> That's one of the major reasons I came up with the
>>>>> dma_fence_chain
>>>>> container. This one you can chain any number of elements together
>>>>> without running into any recursion.
>>>>>
>>>>>> Also what are the mixing rules between these? Never use a
>>>>>> dma-fence-chain as one of the array fences and never use a
>>>>>> dma-fence-array as a dma-fence-chain fence?
>>>>> You can't add any other container to a dma_fence_array, neither
>>>>> other
>>>>> dma_fence_array instances nor dma_fence_chain instances.
>>>>>
>>>>> IIRC at least technically a dma_fence_chain can contain a
>>>>> dma_fence_array if you absolutely need that, but Daniel, Jason
>>>>> and I
>>>>> already had the same discussion a while back and came to the
>>>>> conclusion
>>>>> to avoid that as well if possible.
>>>> Yes, this is actually the use-case. But what I can't easily
>>>> guarantee
>>>> is that that dma_fence_chain isn't fed into a dma_fence_array
>>>> somewhere
>>>> else. How do you typically avoid that?
>>>>
>>>> Meanwhile I guess I need to take a different approach in the driver
>>>> to
>>>> avoid this altogether.
>>> Jason and I came up with a deep dive iterator for his use case, but I
>>> think we don't want to use that any more after my dma_resv rework.
>>>
>>> In other words when you need to create a new dma_fence_array you
>>> flatten
>>> out the existing construct which is at worst case
>>> dma_fence_chain->dma_fence_array->dma_fence.
>> Ok, Are there any cross-driver contract here, Like every driver using a
>> dma_fence_array need to check for dma_fence_chain and flatten like
>> above?

So far we only discussed that on the mailing list but haven't made any 
documentation for that.

>>
>> /Thomas
>
> Oh, and a follow up question:
>
> If there was a way to break the recursion on final put() (using the 
> same basic approach as patch 2 in this series uses to break recursion 
> in enable_signaling()), so that none of these containers did require 
> any special treatment, would it be worth pursuing? I guess it might be 
> possible by having the callbacks drop the references rather than the 
> loop in the final put. + a couple of changes in code iterating over 
> the fence pointers.

That won't really help, you just move the recursion from the final put 
into the callback.

What could be possible is to use an work item for any possible 
operation, e.g. enabling, signaling and destruction. But in the last 
discussion everybody agreed that it is better to just flatten out the array.

Christian.

>
>
> /Thomas
>
>>
>>> Regards,
>>> Christian.
>>>
>>>> /Thomas
>>>>
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> /Thomas
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>> But I'll update the commit message with a typical splat.
>>>>>>>>
>>>>>>>> /Thomas

