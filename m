Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B616B4638E7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 16:03:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E88289AB5;
	Tue, 30 Nov 2021 15:03:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2089.outbound.protection.outlook.com [40.107.212.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B82D6EB2C;
 Tue, 30 Nov 2021 15:03:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GK6wLJUB+a5IbZ1VJgJ28E+AjBwirpkT/47oqeQy3/l6m9p/SHkXmmWxPMgy/clmBEnmdBTfz38gFjAg9dBVilQ1YjliwE+A/cZkAocEOnWTRV9lFSRwxNbtb3i6l/TFdvuZrEu3aZ8qt3dadOYT7GLLG3NQzrrtvv5Sy5tKOxKlAJrF524R8v4KuFOXyBRxC+ZHzd06yKK716bLFrsrP1vaV1XrN357UQDehGtIRIQep5zWYwMU4b8DhFVHNGmmSxXESwHy2JBxN+FKcQkmiOSs14KDvUCxhJtuOcHwxhWAxPvkQaIeZAXy3yC8w9z6MHYdmGFFfevmH4Kl5fCnsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0t0YpecFyVI3C40vlLv0WinXtbStdrQbOvnfhYpQ6vc=;
 b=gCAQTb8m3/dOCv9nE96O8l5UKAx+8RsI1AM8gcg9PRkz4pYEJhxYFYRqQUmioDpQ6VhOkVEDF4Vc4qzy8cALjXNYfx4UGS+Q99wDjHWFt4AgnsssRU5eB6OAcUBTgBsrdZsrVg5ONCKJR0mKn7TbVRqgFkB0kbVQbSMFwnoT0Ji7aa7+BV40WkShwMB1DCcEfqdn5Rbzw2Azo3zoZ3eF5YOyuiDONIIxMRBHp+fLlEvIu2yZHGmLjANu8YgaeNuDmDLRNVAiD/NuMBsxj6Gk029h3X4F/eqQQ7w3nWPOznhF3VXPOH/FwgxIuyfUwqyOzNkHiP1rwH2u1YvnO4fkPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0t0YpecFyVI3C40vlLv0WinXtbStdrQbOvnfhYpQ6vc=;
 b=JfqutIc54Qywg54zuJX3G5JsPW3HOkrNKmWpd0UR42wwywK0HtuI7RMV3f8fJHbTUfMWAdrUgBIKpUVTNlqzi/XClYinHVl8JO8TEo/jM+tlYT/EnlJUXMA9M5E6a7a/8wCfTLiRiRzf6Ir2xv6F3VbOFQcY3KEPHfA/6ty6sm4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1679.namprd12.prod.outlook.com
 (2603:10b6:301:f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 30 Nov
 2021 15:02:59 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4713.027; Tue, 30 Nov 2021
 15:02:59 +0000
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <250a8e47-2093-1a98-3859-0204ec4e60e6@amd.com>
Date: Tue, 30 Nov 2021 16:02:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <29d096c91d720fbe5d410124580a02b663155b56.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6PR05CA0017.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::30) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:fa20:e17b:e063:b6d3]
 (2a02:908:1252:fb60:fa20:e17b:e063:b6d3) by
 AM6PR05CA0017.eurprd05.prod.outlook.com (2603:10a6:20b:2e::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.20 via Frontend Transport; Tue, 30 Nov 2021 15:02:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 156980cb-0d01-4e0f-844a-08d9b4127f13
X-MS-TrafficTypeDiagnostic: MWHPR12MB1679:
X-Microsoft-Antispam-PRVS: <MWHPR12MB167928FB516C955D1F5DEFBA83679@MWHPR12MB1679.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ASLbeJgpTvwPE8qX9iTW4SSxWsxNenyq2sNLmmFVtgP3+gKRT96APX40b2u2jE7MFKwMWpoBeXb+0l3Fixiolmh9KaKg3LsbAE8VpyK6sU86m7JB/yFV36ipnTQ0+3nL2YRZkCqy+h9vM1Gudq4OQC2OBxwka2LAEIDdq0NGUSaZ4P/WXISd1aJ9+d83SkOPij7Q+lpQ1By2xFtBpFQJ9sEFwHIalqS9Qzb1I3szzeyEjwmQbmsULNCJDHdZUClb7xNjheks+q45YZVPv+1R0rs5oAA6EXcmxBMZ9KkEOMIBxt4XZrIc0/efU1cmt/YUzFpSssKe/puUDAqRjtcdNPtujMV26eALYEAgA2lXHIJEscBfwgmFz2h0OrQyltiJbY0AoWVCb0nTA93TN/5o+0dDApTkbP3D12jjUkCd5wYketghFRJnx7XP9oJruq3k0Yg1Z4YuxuC44Ok6Q5cMcsTNFnfjKwmjD9m1cEgLisR1z2X/TCvHr25xiC+X/f0QwI92Xh7tUSRdJCTu8syYDtzyLb/QVY9BnXfM6Gqd5/6hprfyT3+5/2XK7J5f9QJiNZRQJAbz0Pa1SwModLliRVHx7IrmCnFfEV4MjCdF/08u446YsF1H/vmo0fQ5elk9eRFWc8TBjemPUNBTEoCqq3xtFgO7QdCEkiPDpJy2ZRpAXjq4U1x/frZ0SqyC5tRGV4VLLgl1AtuXKeuSC3g7A6+fHdQTK6C/c8DVhZn37krtX2qwrVUNFy45AaxO1H5H
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4001150100001)(110136005)(316002)(66556008)(66476007)(66946007)(6666004)(66574015)(31686004)(86362001)(186003)(83380400001)(31696002)(2906002)(8936002)(6486002)(36756003)(4326008)(5660300002)(53546011)(38100700002)(2616005)(508600001)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXlFQ3pxTnZnRkxpUk1WSm1Wc2lVN3ZEQ3BrNkgzUFhsQVVBTzZQd1JBb2RG?=
 =?utf-8?B?YWtUZDhaM2ZUOHhyZHpZSElKUG5UYURPWUpqMFdvTk9KOUc0Z0dQZFJBaktE?=
 =?utf-8?B?Uk1KdDVaZjZVTWsxWmlCQUU1VUtmenNKNS9QbVBHNDJHVlhmdEhadUt2TlBi?=
 =?utf-8?B?REhCRVVTcGFRWTQ0QStJa1FPQ2JiM1hCK0RuQkVQNmZZNWRJWjFPTGRpZVBT?=
 =?utf-8?B?aUIrMlR2aGh5Zi9CcnlzbForQnNlT2E3bVk3MFdkWG1wSkdvZ0xyWTc2akhW?=
 =?utf-8?B?bUlSZExNWlFsZERJOFNTcDFFL2srQUNJZ1MycnhYSlZ2U3BPOFJTRHBTYSs0?=
 =?utf-8?B?TFZWMDBSd2c5M29DL3psQVRXZERPaGcvK0JGVHF4OWdNclRjQ0dJd3ptNWsv?=
 =?utf-8?B?dGQ4V3pwR3lWbzhJMkVENFhXOVNvdGF1TEdzQnEvTEs4ZFkvVlpXQUh1UFh5?=
 =?utf-8?B?cGUvSGJXVzhraldoOFUwNFV4RmtJOFUxR1EyWHpFT2s2ektCWW9yOUMxM00y?=
 =?utf-8?B?WkFJY0JNK3B1Zmo3MVlzb3JNSzJlUjVNbEd0d2pDVDdkcitWSit3cWZROHZr?=
 =?utf-8?B?dmtva1NOeUlOYlI2TlZyeEdnbXd5QzQwOGEzbytiNmNlZjZsUkR6MjNvZUIy?=
 =?utf-8?B?QmJobXpHWDl5Rk1vR3VwQTBZZm00bi9hd2hTZmFTNEtUcytkZzFQTnZ1WHh4?=
 =?utf-8?B?VFFITS9hV3U4RHhTS1E2a2h3OXlDNVdyZkwzMjQ0RDBEM3liQUZiaWJUMFVP?=
 =?utf-8?B?ejNnazZTS3BRd2pZMHhiQmhWSWpxRHZTcm1raXVVNFVSdFpySDh3U0VsOHFP?=
 =?utf-8?B?WTU5ZUxiMXRoQ1piYTZOU0lFdU1rOS9aWWNkUFY0UTc5QnlVTkNPZ1pTVEZn?=
 =?utf-8?B?ZTRMVEIyS0xQTG5xWnBaNFdzTzlWMDluQUZTNjFiaGorQ2dlaTJvRU12c3pK?=
 =?utf-8?B?K203SmRWY2FjZExqSjF2a3dvZnkxalFROVZ0WlFWem82S0YvTUl1enl4b2dG?=
 =?utf-8?B?dlFZTWxGM0ZvcC92YXBzenlSUUVxb0lOeEdBZk5aaFREeXNHdTlVampMdXJx?=
 =?utf-8?B?aENHbFpIV3hmUDZvaXFCNklEN0psOG92ZVBULzJPbVk1cE1wVWJhSXNQcXNU?=
 =?utf-8?B?TFRKaHkva21qY1BXdnEwanN0RFdNYStwbFBqWnZDMEl6RE84cnlKdWkzT3lm?=
 =?utf-8?B?N2E4RXdRQlRPQ1kzYmdnaUpWWTZjVVRhSEQwbGM1bGZoNXc2YXovWjdmUVVo?=
 =?utf-8?B?VmVOT25JRDdmRGhhZG55TmRVQ1cwbFFYWmZCRmpVR3ltRmFpTVNYdmxUUGs1?=
 =?utf-8?B?Q3BNUlpCNmNubWxOZ1JZUlFaaTIvYThQODlORzhTRGUzUU9mTmw2aFV0VDZQ?=
 =?utf-8?B?bDcremg2TUJKZ09HOE9EQzNMRlUrS1pZS3QxQU1NQVBmM1VET2RwSVpMRnli?=
 =?utf-8?B?WFNmazZ3bGZjZW5Pd0h6U2o1ejlvRG5zSWkxOG1Hc1hHUEg0Vk1iMW9kZzFx?=
 =?utf-8?B?MWNmdWJ5RXRXN3J5OWd5T1VyVkpoQ2tMUmdadGMwNWg1azFTWjk3K2pNdnRD?=
 =?utf-8?B?SklRejVuZE43bWY3Rk45YmNMZURnUHpCc2ZIVGNYMHR3eUpMTUpKelovR2Zo?=
 =?utf-8?B?YWR3OXNZeDFKUVFTUzZvQVJIRng0TDJiZVZEOVJaMGhWZXZmTFVpM2xWSlM1?=
 =?utf-8?B?WWt4c3VjcS9scDZta3JVc242QnhvR3dhUm50UVozQTFVSGFmWVNQTHMxbHM3?=
 =?utf-8?B?cUpXbkpCdUJVWmFXNk42SXF2NUNwbjVuQVFMZmRVekNSZGNZVkFEa1UwK1pq?=
 =?utf-8?B?UWlPNzZIckhjcHdmUitXemJLNW0xeFJUQkU4Ym5GbjRxU0RKeElzN1NobDMw?=
 =?utf-8?B?bWQyUlBrY3J2MDV2UVgxVVprYS9KQlhWcmVUSTBsMDJZZi81KzVMbGtlSTRC?=
 =?utf-8?B?L1pEWXJ6RnNTWUV5dnNxN0NMc1U2YUpEZEk3TzNvWDNrU000YXFiSWY1Q1hs?=
 =?utf-8?B?UURydG5ReVpjYVRuWmRGUmp4Y2d1Q2toVUhSSk1UWDdnZmh4ekRDYWhmVXIy?=
 =?utf-8?B?ajJhQTN1MUVkUkMrdzNsdmxIM1ZZdTdNbndaRy9tbGZZVCtUM2psRkFaajM1?=
 =?utf-8?B?d2IrY2NuUGt0OHdiQzBuRC93a29rZ25qeWJDbm5QalozN0Jra1AvL1FHZkV2?=
 =?utf-8?Q?pblhvisyrOB5dwJubSqBVQc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 156980cb-0d01-4e0f-844a-08d9b4127f13
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 15:02:58.7890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+33jB0Ev7f58OZoDC9V26ZF7AmIBQwVVxjxFAuQ91RgaYm3GP4Ust8Rzh8RGIuU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1679
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

Am 30.11.21 um 15:35 schrieb Thomas Hellström:
> On Tue, 2021-11-30 at 14:26 +0100, Christian König wrote:
>> Am 30.11.21 um 13:56 schrieb Thomas Hellström:
>>> On 11/30/21 13:42, Christian König wrote:
>>>> Am 30.11.21 um 13:31 schrieb Thomas Hellström:
>>>>> [SNIP]
>>>>>> Other than that, I didn't investigate the nesting fails
>>>>>> enough to
>>>>>> say I can accurately review this. :)
>>>>> Basically the problem is that within enable_signaling() which
>>>>> is
>>>>> called with the dma_fence lock held, we take the dma_fence lock
>>>>> of
>>>>> another fence. If that other fence is a dma_fence_array, or a
>>>>> dma_fence_chain which in turn tries to lock a dma_fence_array
>>>>> we hit
>>>>> a splat.
>>>> Yeah, I already thought that you constructed something like that.
>>>>
>>>> You get the splat because what you do here is illegal, you can't
>>>> mix
>>>> dma_fence_array and dma_fence_chain like this or you can end up
>>>> in a
>>>> stack corruption.
>>> Hmm. Ok, so what is the stack corruption, is it that the
>>> enable_signaling() will end up with endless recursion? If so,
>>> wouldn't
>>> it be more usable we break that recursion chain and allow a more
>>> general use?
>> The problem is that this is not easily possible for dma_fence_array
>> containers. Just imagine that you drop the last reference to the
>> containing fences during dma_fence_array destruction if any of the
>> contained fences is another container you can easily run into
>> recursion
>> and with that stack corruption.
> Indeed, that would require some deeper surgery.
>
>> That's one of the major reasons I came up with the dma_fence_chain
>> container. This one you can chain any number of elements together
>> without running into any recursion.
>>
>>> Also what are the mixing rules between these? Never use a
>>> dma-fence-chain as one of the array fences and never use a
>>> dma-fence-array as a dma-fence-chain fence?
>> You can't add any other container to a dma_fence_array, neither other
>> dma_fence_array instances nor dma_fence_chain instances.
>>
>> IIRC at least technically a dma_fence_chain can contain a
>> dma_fence_array if you absolutely need that, but Daniel, Jason and I
>> already had the same discussion a while back and came to the
>> conclusion
>> to avoid that as well if possible.
> Yes, this is actually the use-case. But what I can't easily guarantee
> is that that dma_fence_chain isn't fed into a dma_fence_array somewhere
> else. How do you typically avoid that?
>
> Meanwhile I guess I need to take a different approach in the driver to
> avoid this altogether.

Jason and I came up with a deep dive iterator for his use case, but I 
think we don't want to use that any more after my dma_resv rework.

In other words when you need to create a new dma_fence_array you flatten 
out the existing construct which is at worst case 
dma_fence_chain->dma_fence_array->dma_fence.

Regards,
Christian.

>
> /Thomas
>
>
>> Regards,
>> Christian.
>>
>>> /Thomas
>>>
>>>
>>>
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> But I'll update the commit message with a typical splat.
>>>>>
>>>>> /Thomas
>

