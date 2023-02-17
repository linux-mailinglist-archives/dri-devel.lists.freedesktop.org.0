Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 566C169AC42
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 14:19:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77F810EFE4;
	Fri, 17 Feb 2023 13:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F61210EFC0;
 Fri, 17 Feb 2023 13:18:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cp+ECwrT1tauFiwzq1bbZ55MRN/pQ8LUzc4/jh1RvTyg9im7PYWC/WubAKHQuATys6VMsYebGyp5QaKxQOso4kDOG0XsgjFbBiRmnsb96XjgovJ/HaO7RSjkMMzxoi4XJzd3PndfiYvbWhDKLXTlFcZSUiLCjD03/nJQ2gcWDCWflATyhLMNNEitJvzia/hK9gM6nCLzYakJfmJ5wQr8FLNmWLOgKAo3Kf0nTtaaMZ6DK/1tVNRoTNFInz9pyibQYedQnkWkW8CRntVExDvhc0lUPLTZHI5QrqRDiVWjHXDcLEfj1ItTe7jBdjeoRA9pVqjDhQl/y57+w4qc/rCepA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lS7QoZ0Eu8aZEZifsnSEv18yANfRHETXH3V1LMs8TYo=;
 b=GmXHwZc980dbk8qyTpFopnNEimMyHJXgdPJSb+0I3NRVrEE7Mk4I6r829SXW01fRjHnwZmuZt+fyEwdqEtwbTB9NzDzdYxUXRbxeKr1UQ+XYFal3OKji2FqW9dZtGRl/lkbE5liME9tDpYyFTIm4NA4Y4BBG7Cg3BQb6KAsMBSgKCW7Bcr5c7OL646KrhDg3xjFxHPEwPm8ifhTpUilBiWvoeaZ5cBNfZjm4Q5fMT/1xi9rKVi94wyDvI+slfEzUrcwwWzLlqT3iXMz6oEZzdZfnY9stAw9nq86gy4s6449ji1ZeJQ7ZjSzYMqjOqcoqwvTzCbFJXF0dKA+m+EwSEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lS7QoZ0Eu8aZEZifsnSEv18yANfRHETXH3V1LMs8TYo=;
 b=DRMmHvLy1nfBJWDt4Xu2mL3TaETpZfz9Me3kp2ES0boUr6XkwZPFacHf82C6uD4j6s0/UN8Kw8ffLl5wyBGne38yXWktWba6AiJ9U/oHrGItAKPjncV4nKr27VjSx3a1sWeEw7BKRQ6ehf3l9rVuDwV454HzMXqsN9KcXtdYsiI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA1PR12MB6355.namprd12.prod.outlook.com (2603:10b6:208:3e1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 13:18:54 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 13:18:53 +0000
Message-ID: <728a932c-d65e-9777-de50-6dd8fe9f5708@amd.com>
Date: Fri, 17 Feb 2023 14:18:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] drm/suballoc: Introduce a generic suballocation
 manager
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230216144847.216259-1-thomas.hellstrom@linux.intel.com>
 <20230216144847.216259-2-thomas.hellstrom@linux.intel.com>
 <35ba51b1-598e-8c43-0eca-8fd538ef2659@amd.com>
 <e44a861e-013b-d509-f3a5-b8973186e321@linux.intel.com>
 <91f82b8e-ff43-8b58-e55f-d1c55f13971f@amd.com>
 <95abe965-ae03-5213-abb3-92ee908e727c@linux.intel.com>
 <ad869cfc-baff-2c7a-7bf9-799c5f125aba@amd.com>
 <6ddd49d2-be2c-3b80-9e77-8cc24cbe64e2@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <6ddd49d2-be2c-3b80-9e77-8cc24cbe64e2@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA1PR12MB6355:EE_
X-MS-Office365-Filtering-Correlation-Id: 2853f266-175f-48ec-2908-08db10e983cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dP6YjJmze8HSx5RIdybjgZBVTIBGiw6E+pb2dGEGU4zEGTogeiCK6uB4tFMhgnOqO5bAwlSETYkOogiZVPHZ/khlvP9cls1fjr3ekZ0TH3dvJNxWcncYPSEXKVLwxaDR3vbfXBoAYM7u8am5nc9yeE4HxApHKtsIR4yT0o4yDWeKMAQU05T8FrMuL5xVHSpeplUT7BNoGbPoNyTSgGvfoTxLH1hkFBd85wIO9eFStQrN0EZn7itAGIsaMg2fGDTNnHoTtBv9AAgcigqweT3SlljoCQSbWWj1tLF1q4hCtFBzviex2awdoLUT31M6DP8fWb5ZzL43Ym1/rDhZuVKOZ5wVltWusZwjhfmJ7FRTngSUNEQxgaKGWT41bOW4eBZL9+w7UWA8pT3sDIGDyFQzI5tPpsqpt43ZT1XrNweaAISpFh0LTGqBE6XsogQe5PIHUPWw9Sk5adyE17J2LXjkbvC5c8a8REQR9kuxcTrCyrrG0yz797ccktVdqnfaHcQkuXnVNehLM+67WXvXRC0aACMUEI6yzk6cfjox6CYBSCdPR3Fz33MuPQVWrMLEgTN66KKaBOLLAWnqRAVxkqKrMl9gdPWYIGdgyQUNsq0j4RjgfI6mNY3POKfcd2QRSBU6KOLHTQv2mW1wogTahKwNAiiOsRcuyQ/m4Pf6TRFZQWilv7408gRJ6WdFSkmBg5DmB9qi9eMZEbUD9CJJ3wxBeruzAbTjrAoTOZUefYvAP1hvVzGNUBrXi7aUuIUUBK3m
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(451199018)(66899018)(31686004)(36756003)(54906003)(86362001)(83380400001)(38100700002)(2616005)(66574015)(6512007)(6506007)(31696002)(6486002)(6666004)(186003)(478600001)(4326008)(8676002)(66946007)(316002)(66556008)(5660300002)(66476007)(2906002)(41300700001)(8936002)(41533002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0NSQWREV0Y4bDNqMU55U0lLWnRLM0psVUpwa1l3T3F5aUhIdGcwUTRicU41?=
 =?utf-8?B?T0d3c3FzZmh5bS96TE1OcjdlYjE2b3hldmJWc1Vaa2h4b1R3a3lSTFVXV2RP?=
 =?utf-8?B?UENoWlZ6UkNCTk85MldPMTYyTTc3TG9mQVZ0RFRCUVFKUlFLTU5JbFVVelBD?=
 =?utf-8?B?TlNQOWxpMHZzNFRGUDZqK2MvamNRa1FDZ2pzbnV6ZjRTNnRkYW1NSmhvZ095?=
 =?utf-8?B?SDJLTUJHRFcrc1RZeDJ0MG5rYTUwckdNMXM2WDVNUjNCVmFkZE00a0RmTFFo?=
 =?utf-8?B?SlpTV3pWOHRWZ0NFbzJ3ckt4V1Z5U2lNUi9QTkROWEVGdHcxd2gveG0vR3VJ?=
 =?utf-8?B?SnYvK3ZORnlQYVoxNTJ5Y1dOTExyc3g3TmNLUWE2cFJ5dUswTHBiaWFCZTBD?=
 =?utf-8?B?eDcwOFVhdEI5UGhlWjQxcGdJSlIxTjVSVGpDU25IM0l3ZzVTZGlGY1JyUm4x?=
 =?utf-8?B?bnBYOFI1bWpVbnFUL1YrQlRVWFExcXBFUzF3OStGbzlScllSdlZqQXM2eWhz?=
 =?utf-8?B?OWdUL0FkaVljeXFYSXFaMlloem9hOEhoSDlPb21xdTNZY2FHNXIvVnZTV3NI?=
 =?utf-8?B?d25pYVVBMTBEeDNiM21iaUVQaHN0VzBYblBRWFB3Nk5OV1FpWVBGWlB3aWd6?=
 =?utf-8?B?T0g4ZGVwcFpIRmZLejk3eS9qYWtQWWJnbThSdzFpV2lsZDVKUkh1S3BOdU5a?=
 =?utf-8?B?Sm5BcW9kMmdaemxZWmdjSG16Nk5rOWtHVjNTcUk1MmxZNUxGNjdKRGxXYXhv?=
 =?utf-8?B?TDYyb0FBSkNNZXRkWlN0TStzdjZpcFVJYVN3bVNTVlJrdG9FOFhRdUdYUUp1?=
 =?utf-8?B?M2VPQTRkZE5OZU9JdU8zSHpURXp3cHFIeVk5aHFROVlhRTBrY2hOalZ6RDE2?=
 =?utf-8?B?QkhTeW5iTFJJWWkrdzZHZ2RHSmZmb1M3WWNRYSsrSjcwa0pVTms0WkpPc1p4?=
 =?utf-8?B?OTFvU282amNXK1p3T0NLSE1pT1l6TEw4NlYvTEt6YWVuRFpNME1aZEFqREE2?=
 =?utf-8?B?YnB3dXFvS2J1ZElIRURtQkNtL1VQT3JYSHo0Uk1QRE0rUEg5UUlQY3E4TFdJ?=
 =?utf-8?B?VlNMSFNSc2VZTXkyTm90eXZhMGk3KytNNmxxcndmR0JkT2EvQ3FTWWhnZXNW?=
 =?utf-8?B?NjRkOXdRejRySm9NaUdmSnA0V0xmd1BxWWhuVDZmRGV2M3dLRldaVXhSbFFy?=
 =?utf-8?B?Y0phVS8wRFgrVllwQm13VUxpM25NTlc4dytCUWFyT2owd01xUFdVQzFtcHdl?=
 =?utf-8?B?QXVEVFFHTzFjYU56clJSOWR2T2JVR3ZrTjZ0MURGTlZPSEtaMldBZkE0Z2Qz?=
 =?utf-8?B?Z2dLTjdKVHlnWmRYNldGeVNDQ0hFV3pvWDYvaE1GWGlmNW5sS3J1WFkwckha?=
 =?utf-8?B?MDhkUmJRQndndGhieDhuWUlZczdLb1lvTW9kTktZWWlzMmVibDJUaHFseDBi?=
 =?utf-8?B?dTlBWDMrVmZ2YUd4OGZXVXdBb0p2TVVZYjFnQmtEanU0U29JVk81WDFjbzBm?=
 =?utf-8?B?T2dVbE53eDdwbERaa1V1bjZUOUsweHBjMDY2UlhpdDFTY3B3ZUFUMVltS2NC?=
 =?utf-8?B?NG5nSTk4T2grbGdqQ051bTh4RVNyMy8vbU91cmpwL2FlZ3V5T2JZMlVFY1pB?=
 =?utf-8?B?OFFoekRLejNlaTRpRXNmRXF1UEVwOXlIVno3Qld1RXdwM2tVdHlXa2FLS2lL?=
 =?utf-8?B?WkRxRHVJaUp1N3RTR3JtOWgyYUNONTlwZy8yMW50MUhmbm5iL3lubm12aUM3?=
 =?utf-8?B?UDl2QXl4b3B4eElta2xkbmRJWGtsSFlQdkc1Mkp4VEpUR1VHZmo2UUU0U21C?=
 =?utf-8?B?ME9GOStsYThtdUtXRU5Mc2NwWmJ0UWxLWUpQejVQZEFTeVhlU0FyLzBuTGJO?=
 =?utf-8?B?U0NybFRaaW1KbnBMZjJMMVQ0QW1HekJ1ejczU0ZBaUc5UWJGREZ3SEhIaGlL?=
 =?utf-8?B?emxhOGZZOExtVHVyeVpkclA1Szc4MW5xYUlDMURGV2lnc2t4ckllZjI3UWZy?=
 =?utf-8?B?c1BmVnU2ZnB4S25Vb0tLOUlxS0ZJOWhZYmYra3JPeWQ2MnBLYWRndno3WVJn?=
 =?utf-8?B?d1VMMEJZV05WZkNoa3d5WWwxdzRpbEc2bStwb2l2aUF4K2pvSzArelFZdVFY?=
 =?utf-8?B?TGJvMjNDcWovTzZ3ZGppNVJtL0llNk1hZ0ZURW5ndkVENFlxaVg5NWswVzMr?=
 =?utf-8?Q?BIgkciccyg6u58cqbWeREagA4bkuRhRmi/l2tkb2HuqH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2853f266-175f-48ec-2908-08db10e983cd
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 13:18:53.0085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/mDw93hzUW1kY2Dd6vyDZ5S02wMd8NIDoN+Ta61cKu4FmCrJJ8eP/D/MkQg7yEH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6355
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-xe@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.02.23 um 14:10 schrieb Thomas Hellström:
> [SNIP]
>>>>>
>>>>> Any chance you could do a quick performance comparison? If not, 
>>>>> anything against merging this without the amd / radeon changes 
>>>>> until we can land a simpler allocator?
>>>>
>>>> Only if you can stick the allocator inside Xe and not drm, cause 
>>>> this seems to be for a different use case than the allocators 
>>>> inside radeon/amdgpu.
>>>
>>> Hmm. No It's allocating in a ring-like fashion as well.  Let me put 
>>> together a unit test for benchmaking. I think it would be a failure 
>>> for the community to end up with three separate suballocators doing 
>>> the exact same thing for the same problem, really.
>>
>> Well exactly that's the point. Those allocators aren't the same 
>> because they handle different problems.
>>
>> The allocator in radeon is simpler because it only had to deal with a 
>> limited number of fence timelines. The one in amdgpu is a bit more 
>> complex because of the added complexity for more fence timelines.
>>
>> We could take the one from amdgpu and use it for radeon and others as 
>> well, but the allocator proposed here doesn't even remotely matches 
>> the requirements.
>
> But again, what *are* those missing requirements exactly? What is the 
> pathological case you see for the current code?

Well very low CPU overhead and don't do anything in a callback.

>
> From what I can tell the amdgpu suballocator introduces excessive 
> complexity to coalesce waits for fences from the same contexts, 
> whereas the present code just frees from the fence callback if the 
> fence wasn't already signaled.

And this is exactly the design we had previously which we removed after 
Dave stumbled over tons of problems with it.

> The fence signalling code that fires that callback is typcally always 
> run anyway on scheduler fences.
>
> The reason we had for not using the amdgpu suballocator as originally 
> planned was that this complexity made it very hard for us to undertand 
> it and to fix issues we had with it.

Well what are those problems? The idea is actually not that hardware to 
understand.

We could simplify it massively for the cost of only waiting for the 
oldest fence if that helps.

Regards,
Christian.

>
> Regards,
>
> Thomas

