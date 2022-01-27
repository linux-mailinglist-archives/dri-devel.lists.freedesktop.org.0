Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D1249DDCC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 10:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F60710EF6A;
	Thu, 27 Jan 2022 09:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D4A10EF68;
 Thu, 27 Jan 2022 09:22:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHH4yiFAHMCoxQa8nvvcBVn+iUlZCBJ+sJNcOOLlgXmwLYrAo2Tk+PUpyr9uQmmgTgdHi5O3cZay/wcpJfbNR4CJLzTIGogAYUVOflQYnT02FRp8kbE/TVG+4Zyl1iA0ClY+okWH4i4nYlr9kVF5Tx/ANRijWGDtmYc1Ake6BwNd9Pz67Bw89HnuPfw9OILRqKCHq9t0BKxytyYVng1cOyH4l9HJZby6qMQRZQoUnB7xRMSozurvKplTTVbO8kdaoLLRARigseJJo4fi+X2LWgoQSMQi+w0Zg3jgqAhFWWAAPJGyUlrEmHTDoK4uiFa4jPG8HYFuh3TGB69c7FdjHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XAeANsy2vye/dYqaXLbEJeK6KI0DqVk+iuW449v0ug=;
 b=b65S1O5dorABcUBQWe9EWcS6BJ/A7I59jgMcxSG9+GqBnA4rh2J7bCKrCBPEf4Fwwhh0Y70j+Hh8b+ueca6dgKGwxW0Oc2/q9mAT+mfRPoG87OOuDN5EvFEmUqfgZWeNtLK5QUYzvqxfyVEJjfFmacE+Q+M5Q7IRZRQnEAe6hOj72i6gGS3mWRTvjGcFQRCsCpHB2TYQPgpvrm5p11X8cRC9OAH1fi5tnZ7GQnFmBIHxyP9+T3k0/rSRQ6NC5SfFdOAHGDi77C5wlI/TQZN05LS2oFYVVZcj8XmjK91Z8u1LZR4K2m1y/NjeuxGwZrere7UAymCCGJeLZHM3xq6erQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XAeANsy2vye/dYqaXLbEJeK6KI0DqVk+iuW449v0ug=;
 b=UQO94nd884qJD4sUqYhYgmEvRAHjmZB8QbcrLgAU8cggDO6ck5Q0nm3++9UyTQsugv3R13swizyhNd5ClbRvfBKVGaBsqfz2pc19UN3mMfQJzRQ2GfdWpr9HvbKVQGq7VGbTD+tqM8LAuCgqPs6UNFTFwXzcZ9hAt6+afWLExs0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN1PR12MB2366.namprd12.prod.outlook.com (2603:10b6:802:25::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Thu, 27 Jan
 2022 09:22:00 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d8e7:e6b0:d63c:4a21%5]) with mapi id 15.20.4909.019; Thu, 27 Jan 2022
 09:22:00 +0000
Message-ID: <69c260e4-f4b8-e51c-4930-e7aaf9bec2b9@amd.com>
Date: Thu, 27 Jan 2022 10:21:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH 02/19] dma-buf-map: Add helper to initialize
 second map
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-3-lucas.demarchi@intel.com>
 <f0dbdcc0-13b5-c484-0bf3-a1f8c3e48954@amd.com>
 <20220127075728.ygwgorhnrwaocdqv@ldmartin-desk2>
 <3066c6a7-fc73-d34d-d209-a3ff6818dfb6@amd.com>
 <20220127081810.6zt6cyib4s7kpa6f@ldmartin-desk2>
 <3c6a9126-bf88-0f29-425f-36748271c179@amd.com>
 <20220127091247.3uqi5zhesqtecbsw@ldmartin-desk2>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220127091247.3uqi5zhesqtecbsw@ldmartin-desk2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR08CA0027.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbea7cc7-9770-4edb-63d8-08d9e17678c6
X-MS-TrafficTypeDiagnostic: SN1PR12MB2366:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB2366A90CD19D50EC264C559E83219@SN1PR12MB2366.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QOc820VNC3d6mW/Lsz0bRVsqxEKAdjGSwrkC1wnlk1nEslNDHaf6B6/JRHJ+zsK3NHnMJmymXJyUEc4tKQP5Mz3fXRNJEjhMikNGhNJBFHGL3KX/9qyTtn2S406NaEhBarjGU/IviOksNzpns0tq5T6WR3mbSGJFoJjNc3vbvzOMJZnOfWqloJQfmyT8DuHFNJ91koJ8sBBih3ukJd5+9g/uA3ZZf/8GFkHKUo5zz39Rt6SJHr/jboTEMlilRgd068D3P/NUzDY+FDQSJncEtm6zoL6K8jhBxLsP3igPyYEFBzA030yWfxr5pmiESVfHxkV+c65JcD9MATEL7b3kcBEwyMLi7z1BUtJrtfYVq6lfESAWDezxjIWo6IhNvzrWhrT10aJeVtqVqe3b4hDegKRL3PdwBc9eNs0fY0b4uSGHAcJjonZJQocUM+LO6zOogzAG/2OHHBzCrAr2A3v9c2IF187XieBMmL4F6cNl+vXXrL1/urvngaFpJW61yq7TMGKjRvE98LxzggeiTTiiQKGj2oXuqtZVZaZRHafq4o/axdYOpuKjqCLzHiJQ2odIHB0fq/1qS1KjaSiEOhD0YnHnL0x9IAKsLnCy+Mw5jLSAUofi593OFPRH87JqgCh3gpfN3DRhMherV5BT/iMBP3IUwupvsb+aMZvmpokmG9NZ6RlzL3yb7v6LDLSQJvOYZOOT2vubqStgA2JWHGd1XT3m0Bt2z+HREGVgkbq9f0OJKaZYHrazNRtK4j2G7I7F705yD1bBOsfG53584RlwNFe0bFlfpiDjhFFuab3R2YKH4eP3m/H9dAW5xU042YUa8bD8PnSNUOJ7C0F9RdRZFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(31686004)(5660300002)(45080400002)(86362001)(508600001)(66556008)(2616005)(316002)(66476007)(4326008)(66574015)(6512007)(8936002)(36756003)(83380400001)(6666004)(2906002)(6916009)(26005)(6486002)(66946007)(6506007)(186003)(38100700002)(8676002)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVhEZ2VTWHZPTkFYNmE0VzhlTDM5ek5odnJzQ1lYNDBVUkZlTWI2Y29KYXBW?=
 =?utf-8?B?aHMrbnlOSkRvU1NmS2dhVG80Tkt6cnVEWTBSZHdNd2czOWdGdjl1RFZDSUI3?=
 =?utf-8?B?bjk0cW5acEZ0MkFqZGlUalBZOGc4bjd1M1dZV0YyWmxvQ05kWmtyVUR0ZTlL?=
 =?utf-8?B?YzVxM2ovMGN1TU42RW5hUkx0Yk11d2VMbXZmZW9HWTNrQmU2U3dibDAva0VN?=
 =?utf-8?B?U2R5cDVZUDNMeHNWcmwycU93NDBSU3I5U2x3YmtGRW1jeFloRWZxTldpcXhm?=
 =?utf-8?B?a0FjcVhqamdjcFJLRzhSeUx5MWpVcFVleVZYd2hBT1Y3MkJBd083Y1pSTFI2?=
 =?utf-8?B?aVdvSlBHVitSMTNwcEtKakRrbjNWZVFyV1NpTDA1SFJVc3RIc0hNSGNZcFJY?=
 =?utf-8?B?bTlLOG9pNm5KZ2gvaU1lVzJXc1JiUmlJRlUwTkMvSzEwcGVEMXhxR3RYK2pB?=
 =?utf-8?B?bEdWUUUzelRiRGUxTXUrdjdUZ2dQYlA0UU5NalJFOGUrZkUxN2xuZkpLdmlk?=
 =?utf-8?B?YVlPWU1uNllUZTcwZFlNdzJLMmtNbnoraW5tRFZCYWUrM01YRjVMM3ZhUzBN?=
 =?utf-8?B?UzlCaUQvK0JNeHpNMEtYcGwzTFFTeGF4dVMzUnpqOVZRVmJMT1p3T3M5eEFT?=
 =?utf-8?B?NFlWei9nTVZKK1ZhVU1oeFRKdEkwaGxhNVFPMFpaSnVWeFdENmpra2JlbmpY?=
 =?utf-8?B?V1JySTh2R0IrVFBQNy95enI3ZlZCRnpnWWdsTFZKcmxjSTU4eEp6bG5PMDJE?=
 =?utf-8?B?NFdzVm93YnVOYmFCYytac0FYWStERUY2UTdHdWNkbXBLWFpqMjRQYTJqbldK?=
 =?utf-8?B?M204RFBjaytVRkQwR3VFMThwb0V1ZTJUaDl3SGtwNTcxQUg5aHpzcW50WU95?=
 =?utf-8?B?UnJiUVFXWFJ6V0Q5ODExNndKRUpqMmR0aUtnVVFzQk1ZVkpFeWxGbFc3N2di?=
 =?utf-8?B?R0lHQUQ0TTNLRkIzdDQrNkZWQkVvdjNod2hLRmZVeDlMZlBmS3pwRlZnd2Ex?=
 =?utf-8?B?MWxzTGxYdkplWGRnV0VBb25IWDY3SlZFUVQ3cm5ldndlNm5kelNMR0U2Z3A4?=
 =?utf-8?B?MmFiNm9vZG9Ma0ZhK1FQdG5QSnRkM2hLbjhLa1RYd05MRWs0V1A0YmZYa1F6?=
 =?utf-8?B?QlNuK0wycDNFSFIycEZPR3pVNitIRk5NS0tJS055R0tvdFBJYXFJd0dYcDVy?=
 =?utf-8?B?b2NDM1YyeDFsdDJvTU1tclVUQlVzWlA4NDZGYlgxN0NpWEZNUmR4dDMrT0k2?=
 =?utf-8?B?NWcxdkFXcDROZnhBTVlvRHFWUTJXdnRzNFRpaC9OZW1oVmNOTEF2S053dEdu?=
 =?utf-8?B?RzlMTXlkaExwL0tEUVp5Q0lwQXJqUHYrV1o3NHRlYWtJUlV1WUVQNzhDY2hD?=
 =?utf-8?B?ajkvbUY4bUVrV21SWkZqYWxSa1cxTGhOODhscXQ1VzdCZ3d5RmxMdXVpRnNo?=
 =?utf-8?B?RDJLWmh1d3Q4bGp4b2wzaVFJVmZqZ0JTNnBWcHUvMFRLNnpib2lmUEw2ZGJq?=
 =?utf-8?B?cGp2T1FTMlVjYVJUSkh3bmpTYVhqSlpTMy9JM004MUlodzJwWVhnOVFyWk5I?=
 =?utf-8?B?THFLRlJ6YStVUlNuMm12RnIvMXJhdmxXQStiemJNWGFBeCtpS1FtY2hWSkhu?=
 =?utf-8?B?Z2hXVlYzRlVrOXpNNUdMVVpLTFRaUVA2dVI2cFhyb3BIMFIxc3BhSUdER3dz?=
 =?utf-8?B?UUtNeDVmaEFIVXZJL1haRFVUc0dUaVV0YXNIVUs3NEZOclNQYTBDYndSb25G?=
 =?utf-8?B?N2dobjVZWE1MSTV2Y1FoUmFPTDlCRWVzTDFNSDV5MDVpbitvbTB3OFpzeVJz?=
 =?utf-8?B?bWxvd2M5MmpCWXR3bCtDV1FXT3N0YVVDSjVTVVlReFhQRmhWQTMyamFJeWtX?=
 =?utf-8?B?Qys3SG84QjFrdEFjdmFoeG5ramN5QmphM1lMUVV2c3NMdThWdHpqWHR1WS9K?=
 =?utf-8?B?Mnh4ckdwQ3pNNUY5Q2RCVVBjdWYxQk9US0tTc01ENmJXRkNJREtybzVGYnc0?=
 =?utf-8?B?UGtNeitkV25NTXRxbytZTHI1N2hMdEN1cWpTYitncXEyank3c2xMck9DM1BE?=
 =?utf-8?B?R21yZkMySysyYjM0UDdTQXRGd1JJUUZZMFdRQnQxbUwvMXJUQk55RFBkUGJ1?=
 =?utf-8?Q?eoZw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbea7cc7-9770-4edb-63d8-08d9e17678c6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 09:22:00.1107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KHgUFnTKoTnyWRGq7+9xg/9BXvbTeuxG+1QM+X/yGAu48+rSzg359Z8CB0MrG1/9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2366
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.01.22 um 10:12 schrieb Lucas De Marchi:
> On Thu, Jan 27, 2022 at 09:55:05AM +0100, Christian König wrote:
>> Am 27.01.22 um 09:18 schrieb Lucas De Marchi:
>>> On Thu, Jan 27, 2022 at 09:02:54AM +0100, Christian König wrote:
>>>> Am 27.01.22 um 08:57 schrieb Lucas De Marchi:
>>>>> On Thu, Jan 27, 2022 at 08:27:11AM +0100, Christian König wrote:
>>>>>> Am 26.01.22 um 21:36 schrieb Lucas De Marchi:
>>>>>>> [SNIP]
>>>>> humn... not sure if I was  clear. There is no importer and 
>>>>> exporter here.
>>>>
>>>> Yeah, and exactly that's what I'm pointing out as problem here.
>>>>
>>>> You are using the inter driver framework for something internal to 
>>>> the driver. That is an absolutely clear NAK!
>>>>
>>>> We could discuss that, but you guys are just sending around patches 
>>>> to do this without any consensus that this is a good idea.
>>>
>>> s/you guys/you/ if you have to blame anyone - I'm the only s-o-b in
>>> these patches. I'm sending these to _build consensus_ on what may be 
>>> a good
>>> use for it showing a real problem it's helping to fix.
>>
>> Well a cover letter would have been helpful, my impression was that 
>> you have a larger set and just want to upstream some minor DMA-buf 
>> changes necessary for it.
>
> I missed adding this sentence to the cover letter, as my impression 
> was that
> dma-buf-map was already used outside inter-driver framework. But there
> is actually a cover letter:
>
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20220126203702.1784589-1-lucas.demarchi%40intel.com%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cb36def4a6ebd4879731c08d9e1753ccd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637788715933199161%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=gwW05OaUq%2FxlBWnY%2FPuPfl0YDdKp5VTbllaSmn45nE8%3D&amp;reserved=0 
>
>
> And looking at it now, it seems I missed adding Thomas Zimmermann to Cc.
>
>>
>> Now I know why people are bugging me all the time to add cover 
>> letters to add more context to my sets.
>>
>>>
>>> From its documentation:
>>>
>>>  * The type :c:type:`struct dma_buf_map <dma_buf_map>` and its 
>>> helpers are
>>>  * actually independent from the dma-buf infrastructure. When 
>>> sharing buffers
>>>  * among devices, drivers have to know the location of the memory to 
>>> access
>>>  * the buffers in a safe way. :c:type:`struct dma_buf_map 
>>> <dma_buf_map>`
>>>  * solves this problem for dma-buf and its users. If other drivers or
>>>  * sub-systems require similar functionality, the type could be 
>>> generalized
>>>  * and moved to a more prominent header file.
>>>
>>> if there is no consensus and a better alternative, I'm perfectly 
>>> fine in
>>> throwing it out and using the better approach.
>>
>> When Thomas Zimmermann upstreamed the dma_buf_map work we had a 
>> discussion if that shouldn't be independent of the DMA-buf framework.
>>
>> The consensus was that as soon as we have more widely use for it this 
>> should be made independent. So basically that is what's happening now.
>>
>> I suggest the following approach:
>> 1. Find a funky name for this, something like iomem_, kiomap_ or 
>> similar.
>
> iosys_map?

Works for me.

>
>> 2. Separate this from all you driver dependent work and move the 
>> dma_buf_map structure out of DMA-buf into this new whatever_ prefix.
>
> should this be a follow up to the driver work or a prerequisite?

Prerequisite. Structural changes like this always separate to the 
actually work switching over to them because the later needs a much 
fewer audience for review.

Regards,
Christian.

>
> thanks
> Lucas De Marchi
>
>> 3. Ping Thomas, LKML, me and probably a couple of other core people 
>> if this is the right idea or not.
>> 4. Work on dropping the map parameter from dma_buf_vunmap(). This is 
>> basically why we can't modify the pointers returned from 
>> dma_buf_vmap() and has already cause a few problems with 
>> dma_buf_map_incr().
>>
>> Regards,
>> Christian.
>>
>>>
>>> Lucas De Marchi
>>

