Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E714EBB2D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 08:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046B710F0D6;
	Wed, 30 Mar 2022 06:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E52110F0D6;
 Wed, 30 Mar 2022 06:54:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1ElCJN2bs6H9z0l8dU+3JEjMc6PCwnZucqale/Vs4UG9TuqVgnzrgu6Z1CRm1dqF71Chq6hGzKIJImE4kmZIFQcG9k9IuEgmAiYMiVBGeSfiJxx/eYxQSLxceEaLU+74A++CbJN5KgQr7gtap1LHdVXOsy5HBid0bpfHqMACj8MXG3P7FrAR44dKDU2ErT9A6D6G75MSNrTLI7cQgEYS42x4iffpVwQO4pxcxPJCGlXrUxKVU78u2wxdeB4u3fdQkLFfU1BrZ0M147GkVZtEMWhTAyep9K9dCwQEFJRwKGJGLShgkjLu9KyJLez9vIZTdCq1Ug/KcFO2zYU2Z66gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUMn+bwOiOPyqJPk/0mjc405g1ptToAYjIgNTLOeyl4=;
 b=nE4Y/Re2RDEHP/L/qaMcWCcC4z+6YNQJXEnmrQR8btvfVyZrJyjT2f3xH/2jICN5imxsUJcXH2jp/TfJPrV5tTWY/RzGctsrhY1eCGTspGU5cSw9ULrH22PMjmFMhpPyp/sVmiSvd7w2w3oXaAib90q8673XJXfmMjeeU2xBrH0RZC6cCBxpnONfiXo5vjC5LsOTDpDlmPtT/Q9L4+CE7NDwefvf7NGzsWnXLQ6XCGWFQSyHQpQeW33Si+OBj0TXyyEMd5/sRviPsT5mb4LK0yGF9Cig6eenRZQphRQgvwJ1Dk0jMeBnG44irs0imHsaijwrjpBMIeGD8P5bfqYJdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUMn+bwOiOPyqJPk/0mjc405g1ptToAYjIgNTLOeyl4=;
 b=SLA5O0rFyWev1pbWNSmzi4rsWHliHTTaK7UcoXnyJwWwlskAQ+QbutFF82CqsjuSJGJYXDOuBFFzLVC8e1ad9RdF4rB4UV1DNBo8SHWx7JlHhNDwcfRfm9RJj+lz5Fs5rYYeeKOVXTy4cZ+DArY7YerZxakmVr9p/75A+7n+k70=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4577.namprd12.prod.outlook.com (2603:10b6:5:2aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.16; Wed, 30 Mar
 2022 06:54:04 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 06:54:04 +0000
Message-ID: <bd3cd9ac-0639-df46-678c-e52361f3f5c5@amd.com>
Date: Wed, 30 Mar 2022 08:53:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v11] drm/amdgpu: add drm buddy support to amdgpu
Content-Language: en-US
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
References: <20220323062552.228429-1-Arunpravin.PaneerSelvam@amd.com>
 <c255f3ea-a269-1886-f79a-2d8a38b956b1@gmail.com>
 <MN2PR12MB4342B7FD0CC5C480DEEF8A77E41D9@MN2PR12MB4342.namprd12.prod.outlook.com>
 <2b77dca5-df7e-5a65-eb3e-f186e1037e4d@amd.com>
 <417bc262-17db-551f-1334-3cfafe997c60@amd.com>
 <1eaf81e5-84c5-dbf2-b0ec-5ca59e872242@amd.com>
 <73513866-504a-1289-c9ad-4fef81f80ed6@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <73513866-504a-1289-c9ad-4fef81f80ed6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0204.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::29) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 598f32f5-a635-45b4-6888-08da121a13cc
X-MS-TrafficTypeDiagnostic: DM6PR12MB4577:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4577EE7EC39871ECF4FB4E6E831F9@DM6PR12MB4577.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NU+A9T+TPSeKlj8oqf6rhs2fiBRFE6smH91qXlUDKEdCYOlUjTXw5Ln59MXOj8+jeZp4g6w3bIjK01S9wpi0y8TFX4ud6s5idhG1qrnd4vwp9oDdpBxVIAaDLFLYye6l8bTiFI/KyDHYJXgTuDSiB6kkzKXdrpoeDidTPKhnuaw0gwZDYjRZtLHSxaP5qoBxaFFJ5Ib4We9kjxkzHi+3KUizaW6nrNnQfwrZxv0XmP10n+hyoB1T4W2u9t/2DkTVqWS7M1gTABKQpgOlUOPLxGjkuQK2D20p7Rz29DdWCidkeCuHQ9tOmZKCdj1/aKahZEs5+2uTgLo1cJHwkLGXucF/yhuPjZaS8gXpmbdiVp5a1KoZGDjXXbSTuZ9GykqaWqu2cWBvug9uYJYSeLce/WO3QrrOG8DcVPYeR0DVNsDk0AMjAIJTrZ3Oq7PMaN3LxW5dwheYzlahw2layF4+p0yQXfqeV5OZOwxAP8mshtxOWNWYMs7CIQ9OWOc+ZEodAUz0Vza8+ynW6GDQa1LWpD11Uca3p8ba6IXdaqKTtV7WLA7KIKML2vm0++CuJ+sXa9rhcIB/oFU7RoFJJhuXYPpQOCm3t2XthcLmxkynm80lufGZADS4zMDklOJDAVUVwAHjNi3zvhr4zb/gXqVFme0g2w0R+D57SIU7mILEmi3uOuZZ0uZPlEPdbdAhOuusFFmGCw/EuCY+PsMkiH0863fNLuXQQVueux4YUfWTDi6+vyQ8jT2T9HqyBIHTk0c5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(2906002)(53546011)(31696002)(26005)(8936002)(6666004)(31686004)(6506007)(6486002)(508600001)(36756003)(54906003)(6512007)(86362001)(66574015)(37006003)(2616005)(38100700002)(83380400001)(66946007)(5660300002)(66476007)(66556008)(8676002)(6862004)(4326008)(316002)(6636002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzVmcFhDd1dudm43cko0NUw0blZBVWZMZTZZTmh2SGtod1ZDdHhxS1o0T2xI?=
 =?utf-8?B?ZTU2WVg4dVE3SUJ0WENkbExzcmNMN0xCR1NPUmlvYW11NGduYnNHYjhzM0E2?=
 =?utf-8?B?aDdXYnIzdThpSHJUUWJBTnVxakdjZnVSODdpU3Z2Q1NRVCt3cmh3Z2NNcVNl?=
 =?utf-8?B?WU5seUl3L0hwQ1Z2OXdnS2NXT3BISDZJR0JIZDdvd0p2S3FmcjB2V0k1YkZu?=
 =?utf-8?B?ek0yanVVNVFBZmtUTGVORWM0VEViOC9wOTBDMDBCMG1KdG8rRW5kek5VSk12?=
 =?utf-8?B?eS9Kakl6eHJtR0x2ZThPc2h2WUozOVF1TWllUkNGWVVrOUpjR1c0TVZjQlNv?=
 =?utf-8?B?STlESkpoVnVUNFl5YTlXbkVmZytoYXFSdU1iYkVJNk9OMjRWMFdWaFphVVVj?=
 =?utf-8?B?eERYcGtINUtIUXUzdDFrRit2TFVSNDRxbHBCQXBFKzAwcGtZVzFWdUNXanVY?=
 =?utf-8?B?TnZQZFAzQjNpaVRMWkxKVVNzVGV3diswNWxkRnlQNzQ0TlFjK1hBOVlLZ3da?=
 =?utf-8?B?bHd4Ny9vRk9nUGtkWXh1U2NnYVFHR0NBVnBYNzJQVnI5dUh1Qno4c3ByY0xY?=
 =?utf-8?B?b0swY053SE9vM01qK0dhQU9aR0tMU2pWSHkwVm92RHVSSUhnNm5hOHdBdFpQ?=
 =?utf-8?B?bXp3NC90N00vZURFU25La0xzWnJLRWVRUkFkeDNLVWZCcmFZdE0wRDhzQUYx?=
 =?utf-8?B?eStTaEJ1MUQ1dlp5bG14ZzdKYmF5VzgvYU1FZk56NEkxQjJEQ0FKR2Z5M013?=
 =?utf-8?B?bDBvUW42eHVkRDBhTFdRZk1QZjBqdHhRRXA3ZmR4ZFVxSDdFSkVkTTlEL0hQ?=
 =?utf-8?B?ZW5ZcnJYN2FkdkZtRlNSRGRDTFprbFU0Y1p6WGs0cy9VR3ZTNVNiQW5iYTUy?=
 =?utf-8?B?MkJFWklTcklNU3I0QU5vcFFYZkcyRHNnc3VxOFhEYzJITllwU0tJZW4rVlBj?=
 =?utf-8?B?cDhHbDVJQXZvcHhRNEJjUHVxL3c2T3pRdXpuMmEzTU50YlAzN0RkbDk3Zm0x?=
 =?utf-8?B?VlhkMEhXejllaVJTN0FjKzAwakhib2dublBZVUpDcHp3ZVcxZkZGRk84WnVo?=
 =?utf-8?B?WS9GUmpJTm1Ua0Fjam5ma1Y1MU5NSUVXSVY4VEVFSCtrdlFDdjZ2NXhZWU1K?=
 =?utf-8?B?Z2U2Z0tLaTdqTjM3REpZaFAyQ3FySUd5WXJsYWV5akRLZXcrZWFpbUpYckdx?=
 =?utf-8?B?U2t4ZytUdG1SM2kxYkZsLzlDUUpxeWEvM3pYTHdneGE3cG5NTHM2enZNL1I1?=
 =?utf-8?B?MTFmUVZ5bGhGcENNZ1liUHI2NFdBWmxYZyszTllhWVlqK3VTY2x0T2FyU1JG?=
 =?utf-8?B?VjRnWmtOMWZlL1pJeFVSYno3ZFZWNHBQQnlkaDJ1bFJTVkErb3MrNW5LY2hB?=
 =?utf-8?B?QmpISGdYTEllelU4bFBtVXEyWU94S2c4Zi85a1NrT2FaYVdHNTEvU2tlM0lH?=
 =?utf-8?B?WEJBSVlzOHpLWmRnNy95elJ1SFdzbHhDT3JmMHpVOEorL254aHVLNy9RSEZQ?=
 =?utf-8?B?NWM5V0JzK0JUci9FUDdlVE1LR29EV2RIMEVvb3JmL0U5NllYN1hOcGFZNWRG?=
 =?utf-8?B?ZDlKTm9WZUZFTmZqQkZPSUJjL2dvZmpiS2FKSDk0SzMyNFFtb25xRzBlWWZB?=
 =?utf-8?B?OGxDaTFyV2RuSjQvTjhDdXRJL3FDZ0FSMHlRK0ViS05ueTF4NGFHOHRyZFJX?=
 =?utf-8?B?WGpMN3Bha3ptV0NDeStZU0JjdGtJYlBvOUVLOG1BRTN0YnB5YkRDcEpFWU1O?=
 =?utf-8?B?UVhSWm1oMHR5SVM0Z3hXYmQ1aytJR0I5SnYySThiaWFYSEpvT1ZpdDEyNzdj?=
 =?utf-8?B?Y3JMUGFvallheXU4eHp5SldtSnlwTjJmUndQVVYvN1N2YjM1Mm4xOGxseXVh?=
 =?utf-8?B?WGdwQXhtWjJ6QnhLQUNzNkpORTNkU3R2WHV3STY0Rkdkb3NlR2xieHp2Wk1u?=
 =?utf-8?B?MURRZ3F1Nnhmb1ZJVGtORkNERWFlekFsOVFxZzZDbWdSSDZIa0ZDTVBNSnE3?=
 =?utf-8?B?TElubFQ3NVF2bWRvajd0MkdQK24zMXBmRzZpeFBFdGg0amp6VmtEUGxaeHlP?=
 =?utf-8?B?L1JmakVIR1EvTFRqUE9CODErMGZaUFl0SllvNGhldnhseTAvQ0lVNmJTVXZo?=
 =?utf-8?B?aVNmS3FhK0lyNHR1Y1N0M01rMjR5cUFNV3dGUzJqM3ZEV28vLzRHQ0p3NEd4?=
 =?utf-8?B?eDJTekFFaGJjN0k5NGI4VjAwbnVoT2lxZ2I4ZWxNWEw5UTlBVlg1YmY1ZElR?=
 =?utf-8?B?YzJqZ0lPM0swMlIvaXpmMVM4ODhRakFlenE2R2ZPN0UyQ0dqdVUweG9SQjlE?=
 =?utf-8?B?V2g2L2ZneGdaNVQ2QlRvTEl3OUF3Q3R5ckNVeEg5ekRLd1hoaHlGZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 598f32f5-a635-45b4-6888-08da121a13cc
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 06:54:03.9302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kflc5Zf8QEScUN5joSgx3GvPhl0lr12b7uglNMINSaZ0RTLGZ0f4IBqTsaG2Li/J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4577
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.03.22 um 21:18 schrieb Arunpravin Paneer Selvam:
>
> On 29/03/22 9:30 pm, Arunpravin Paneer Selvam wrote:
>>
>> On 29/03/22 4:54 pm, Christian König wrote:
>>> Am 29.03.22 um 13:19 schrieb Arunpravin Paneer Selvam:
>>>> [SNIP]
>>>>>> +	pages_left = node->base.num_pages;
>>>>>>     
>>>>>>     	i = 0;
>>>>>> -	spin_lock(&mgr->lock);
>>>>>>     	while (pages_left) {
>>>>>> -		uint32_t alignment = tbo->page_alignment;
>>>>>> +		if (tbo->page_alignment)
>>>>>> +			min_page_size = tbo->page_alignment << PAGE_SHIFT;
>>>>>> +		else
>>>>>> +			min_page_size = mgr->default_page_size;
>>>>> The handling here looks extremely awkward to me.
>>>>>
>>>>> min_page_size should be determined outside of the loop, based on default_page_size, alignment and contiguous flag.
>>>> I kept min_page_size determine logic inside the loop for cases 2GiB+
>>>> requirements, Since now we are round up the size to the required
>>>> alignment, I modified the min_page_size determine logic outside of the
>>>> loop in v12. Please review.
>>> Ah! So do we only have the loop so that each allocation isn't bigger
>>> than 2GiB? If yes couldn't we instead add a max_alloc_size or something
>>> similar?
>> yes we have the loop to limit the allocation not bigger than 2GiB, I
>> think we cannot avoid the loop since we need to allocate the remaining
>> pages if any, to complete the 2GiB+ size request. In other words, first
>> iteration we limit the max size to 2GiB and in the second iteration we
>> allocate the left over pages if any.
> Hi Christian,
>
> Here my understanding might be incorrect, should we limit the max size =
> 2GiB and skip all the remaining pages for a 2GiB+ request?

No, the total size can be bigger than 2GiB. Only the contained pages 
should be a maximum of 2GiB.

See drm_buddy_alloc_blocks() already has the loop you need inside of it, 
all you need to do is to restrict the maximum allocation order.

In other words you got this line here in drm_buddy_alloc_blocks:

order = fls(pages) - 1;

Which then would become:

oder = min(fls(pages), mm->max_order) - 1;

You then just need to give mm->max_order as parameter to 
drm_buddy_init() instead of trying to figure it out yourself. This would 
then also make the following BUG_ON() superfluous.

And btw: IIRC fls() uses only 32 bit! You should either use fls64() or 
directly ilog2() which optimizes and calls fls() or fls64() or constant 
log2 based on the data type.

Regards,
Christian.

>
> Thanks,
> Arun
>>> BTW: I strongly suggest that you rename min_page_size to min_alloc_size.
>>> Otherwise somebody could think that those numbers are in pages and not
>>> bytes.
>> modified in v12
>>>>> Then why do you drop the lock and grab it again inside the loop? And what is "i" actually good for?
>>>> modified the lock/unlock placement in v12.
>>>>
>>>> "i" is to track when there is 2GiB+ contiguous allocation request, first
>>>> we allocate 2GiB (due to SG table limit) continuously and the remaining
>>>> pages in the next iteration, hence this request can't be a continuous.
>>>> To set the placement flag we make use of "i" value. In our case "i"
>>>> value becomes 2 and we don't set the below flag.
>>>> node->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
>>>>
>>>> If we don't get such requests, I will remove "i".
>>> I'm not sure if that works.
>>>
>>> As far as I can see drm_buddy_alloc_blocks() can allocate multiple
>>> blocks at the same time, but i is only incremented when we loop.
>>>
>>> So what you should do instead is to check if node->blocks just contain
>>> exactly one element after the allocation but before the trim.
>> ok
>>>>>> +
>>>>>> +		/* Limit maximum size to 2GB due to SG table limitations */
>>>>>> +		pages = min(pages_left, 2UL << (30 - PAGE_SHIFT));
>>>>>>     
>>>>>>     		if (pages >= pages_per_node)
>>>>>> -			alignment = pages_per_node;
>>>>>> -
>>>>>> -		r = drm_mm_insert_node_in_range(mm, &node->mm_nodes[i], pages,
>>>>>> -						alignment, 0, place->fpfn,
>>>>>> -						lpfn, mode);
>>>>>> -		if (unlikely(r)) {
>>>>>> -			if (pages > pages_per_node) {
>>>>>> -				if (is_power_of_2(pages))
>>>>>> -					pages = pages / 2;
>>>>>> -				else
>>>>>> -					pages = rounddown_pow_of_two(pages);
>>>>>> -				continue;
>>>>>> -			}
>>>>>> -			goto error_free;
>>>>>> +			min_page_size = pages_per_node << PAGE_SHIFT;
>>>>>> +
>>>>>> +		if (!is_contiguous && !IS_ALIGNED(pages, min_page_size >> PAGE_SHIFT))
>>>>>> +			is_contiguous = 1;
>>>>>> +
>>>>>> +		if (is_contiguous) {
>>>>>> +			pages = roundup_pow_of_two(pages);
>>>>>> +			min_page_size = pages << PAGE_SHIFT;
>>>>>> +
>>>>>> +			if (pages > lpfn)
>>>>>> +				lpfn = pages;
>>>>>>     		}
>>>>>>     
>>>>>> -		vis_usage += amdgpu_vram_mgr_vis_size(adev, &node->mm_nodes[i]);
>>>>>> -		amdgpu_vram_mgr_virt_start(&node->base, &node->mm_nodes[i]);
>>>>>> -		pages_left -= pages;
>>>>>> +		BUG_ON(min_page_size < mm->chunk_size);
>>>>>> +
>>>>>> +		mutex_lock(&mgr->lock);
>>>>>> +		r = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
>>>>>> +					   (u64)lpfn << PAGE_SHIFT,
>>>>>> +					   (u64)pages << PAGE_SHIFT,
>>>>>> +					   min_page_size,
>>>>>> +					   &node->blocks,
>>>>>> +					   node->flags);
>>>>>> +		mutex_unlock(&mgr->lock);
>>>>>> +		if (unlikely(r))
>>>>>> +			goto error_free_blocks;
>>>>>> +
>>>>>>     		++i;
>>>>>>     
>>>>>>     		if (pages > pages_left)
>>>>>> -			pages = pages_left;
>>>>>> +			pages_left = 0;
>>>>>> +		else
>>>>>> +			pages_left -= pages;
>>>>>>     	}
>>>>>> -	spin_unlock(&mgr->lock);
>>>>>>     
>>>>>> -	if (i == 1)
>>>>>> +	/* Free unused pages for contiguous allocation */
>>>>>> +	if (is_contiguous) {
>>>>> Well that looks really odd, why is trimming not part of
>>>>> drm_buddy_alloc_blocks() ?
>>>> we didn't place trim function part of drm_buddy_alloc_blocks since we
>>>> thought this function can be a generic one and it can be used by any
>>>> other application as well. For example, now we are using it for trimming
>>>> the last block in case of size non-alignment with min_page_size.
>>> Good argument. Another thing I just realized is that we probably want to
>>> double check if we only allocated one block before the trim.
>> ok
>>> Thanks,
>>> Christian.
>>>

