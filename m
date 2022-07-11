Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DB05701F7
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 14:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948B68BCF5;
	Mon, 11 Jul 2022 12:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5348A59F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 12:25:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJWCzUJm3CfNBOLkBKC3CBUfDbDY+RKpUNCZKnLoOPo3hoyxaHhGl1z9eZPmClJApHn4ezUStkZ+4Y7ZjnD3bRINb+gbIPi/74OGi/Kfn5ESlupRyNqE/HGDS4pdCiYKuJXgP/XycQbKbalITpYRWc87xqnOzvE9FLeJfjibQD8ARQSR9e3A8tVqPdWNG5w67/9UcT5AWbGSjtKB2vC/m1Y03jumvWamRPkAHVeFHvql3GTwd5eND0qVsufmtDFdDM47RjtqjVCCFlrJmB2K+QXjny9uFuywnZe7KZkGHiZl8WOpDq4Q782NoEfb6gssJHOR+XyPOxrNXFC/MJkIJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUPecrCVA5XyS6JocfeNrDqI3zWnquh86F4NIYZzyrU=;
 b=MckZ/BzQla/BM0l9Z8/JFZd7IHwpgpfPx3pd6ecSa4Kgk1q9ct20GoBpGf2JPLJB3t4XM8lsxPEtLqb2pCAZwzBUXU2Ws7HsZKZBmZJDXaImLpfG+3GCLx6ieigJ/ugs7CqaPnU9IafGSYQXMn159YPRHdu1roea9+1sP/2b0bWX54aJDMpoqDTJ4HEzDyTwkfdPaXuMLlkjyB/6alQDlT7cZseobYkCP9MDLEBs3vCBLst+bozY1FUCdDHu8tWp9yaBYMaIy7zw7TQsN6DyX6+J7KmjQTbtU5AhnUR2s36nHw7nxKsBrEq3X93MBjWlOn7xzbNhhy4TQ0BbkjwcmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUPecrCVA5XyS6JocfeNrDqI3zWnquh86F4NIYZzyrU=;
 b=E1tCBTUaBy4SOIHUIScLRubjQcTjXVCvm86mZRVmX/JgfeO9PmONgKhuOUcKrGizfDqogps63s9pH4iPTEEzsRZDpXXR6VHIAW5y1HvN3h+3DNYOczPoLujxkndrDcvsKb/m/KaN86TCawpAzMwILaTOq78qDxo8D8JteZudRtk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB5593.namprd12.prod.outlook.com (2603:10b6:510:133::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Mon, 11 Jul
 2022 12:25:20 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5417.025; Mon, 11 Jul 2022
 12:25:20 +0000
Message-ID: <b28cca8f-ea2c-bab9-0de7-b469df121e09@amd.com>
Date: Mon, 11 Jul 2022 14:25:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/5] dma-buf: return only unsignaled fences in
 dma_fence_unwrap_for_each v3
Content-Language: en-US
To: Karolina Drobnik <karolina.drobnik@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20220506141009.18047-1-christian.koenig@amd.com>
 <20220506141009.18047-3-christian.koenig@amd.com>
 <f67d23e2-3953-7717-9c41-65075929525c@intel.com>
 <4c9598f0-4ba7-c18e-2ccd-f508769a72e9@amd.com>
 <fe4cfc97-ca20-b28d-8369-5cd404f27e19@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <fe4cfc97-ca20-b28d-8369-5cd404f27e19@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7b870bb-966a-4b62-4432-08da63386b79
X-MS-TrafficTypeDiagnostic: PH7PR12MB5593:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CAKWagQ6VEwAWcqrJ+MCW/RaOsXa4a702M7xGVZ2+AndUuexmFZ/QoJOeKAwpa6eun5CC9ObC1oMKaSEtMKCbLWIoPexGBJykIPeRijnRt84e1NF/VnYoUPxpAmBnHuhnen+7JbUAH40OMRwOnVGdIvSrPgWjJlJ/MsCK69Oh2a2lnJ5/73+MIKnAH7/x+BcVkktsGb1fFoavxktg5sKuDGiwzjOFOZGrW7yeZLt7io/HTBkSnv0el+fDkeTnPaM/y9GjLOHtsuGXkhoyMc42mdAUPT0gjbTE1BkrHxVh76nKjpJoX7GNwjCDpWuZOns3vpUk3S7B6aITqXuMI/Vh30DMV7PEgQa6JiDEsXNfkQ03OP5IKflPkxOd10Ex93dSV04hkuwCg6p6LzqZfwvcmcNBBkkRptoNm/5ZsMru6MWmL/nyqzYzVySlzNrI85R7ZW0HBi80ZRfAgsJAfRBu4an+4e3hAsdJarQ3xK4d8GN9S14ZURqKYjORbJ/yvs0wANH/aSzwM1OjUuEtnemqqDMmhtQLGbS788adGu9aafuFgJgVo+bMG+bhXkYu80GKRhsAUNozysq94cR0kEJhvU6DrW+th2OlIkjXeEvx0V+KxK+eiE7RWlOhWSkFT5x91jZSRu0w9zcpDpVhiIbQ2xOpqfgt8nF3l9n1k3hInzSUMSc3liku9cmPA7LPuiT+oqxr1Gaq9fA9RWNXHTdybT7/y4RKZL5fN5kCWJvI75g2VDo39xe2pauQccyWI28gVO7mtbrgeJVe7vgCyK72LhCyCTTo2RLLGuA+7Qcnb0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(2616005)(66574015)(186003)(8676002)(4326008)(45080400002)(6666004)(31696002)(41300700001)(66946007)(66556008)(66476007)(478600001)(86362001)(26005)(6486002)(966005)(316002)(6512007)(110136005)(53546011)(31686004)(6506007)(2906002)(83380400001)(38100700002)(36756003)(8936002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXA5MUc1Y2svRmx5RS9QWXNnSlR1WlZVMlBTNkZkVCt4dHRjNzlEMmtqSVhy?=
 =?utf-8?B?QjZrL29CTytkYWp0eFBxWmIweTFhbElqMndTWDZUSHNSeGN5TVV4NmZpNFM4?=
 =?utf-8?B?MXpwYm9senN3bkl1SHAzanNpNUpVOFBveFZEZVh3UkJ2THBzYjB3Nnl3NEhL?=
 =?utf-8?B?amZ5ZUlWRTB4dFpiM2ZYdzBLRk1sQjIvZStlQ1ZnVHNzNlFCOTBHbC9tajIx?=
 =?utf-8?B?djZ5cStZU2pneVoxZ3p1R1JHWDA0SzVDUXdXVlZ4VHF6NFFDNEFIWGNPeG9n?=
 =?utf-8?B?VU44WG05eTByaDh5RDVsYVNNeWpka1RyZ01sbjk0czNxRE82MFFCSFJ2RThC?=
 =?utf-8?B?b05wZGZqS3ErUHVKUmxDV3FZR1ZKenF2dytxL3hLMU56MVRqV09KVFFnckdt?=
 =?utf-8?B?NkpqVGRyMmdNYXdzTU1lQWZNSVdUK21ISTBmSHplek0ybUgvaUhNMjlJb0U2?=
 =?utf-8?B?T3BnZXlTbDU4cVRUcndMSmJScWZ0M2lJbTFmY0ljODRJZHhXdVd0K1RYNGFU?=
 =?utf-8?B?NTd0SUdWbHBEZHNhMmpzdmNib0RaYXFLTDlpVm5LdENyN1ZXVjBYU3pHcVQr?=
 =?utf-8?B?WThOOVl4TnV6SS9XSUhuVDdDdVkrVCsxYzV3UFgzSmU2NGRPL0p4R2dwcld5?=
 =?utf-8?B?NHBiZm52c3VLSWRNYnN0UkgzUVhCVW9WeXEwR3dEUnFmVHhrWnhMOTdmOXhm?=
 =?utf-8?B?aTZtTVJadVVEbzVQbThIWW92VkRWVUhKTWdubWF6UHNENUZCZUc1M0FpSDBz?=
 =?utf-8?B?Y1pRQmswejJsSDU4aGl6ZWp1djcrb2hOK0UzUHFKYjZzMkN3UGkrbGdxdHFp?=
 =?utf-8?B?RnN4RDgrNy9RZnFJUW9vL3lMbjd4V0wwYTZIS3dZaS9EdEtrMTdvNjh5VGdB?=
 =?utf-8?B?WjJybllRa2FjU1JlQU92YTZDMkJuaE43UTVQMXFqaUg0MnB3elJRTDRiYkNr?=
 =?utf-8?B?TlEyekpIQjZSL2c3M2Qxd2d1eEFBbHhJMXBHMlFjMk51VkNid0VMbVFMeng1?=
 =?utf-8?B?OTUxOHhQQlpKZ2hYeTlQYkdGNC9jR3ZWS3Z3THh1RFBlOTlYTzlUZFdsZldT?=
 =?utf-8?B?S081cThpNmJ0SlhwN3A3MHFsemE0VVJSNDlFQWhFRzdrL0JBM204bmh3UEIr?=
 =?utf-8?B?WWhnY3NoZCtNamdSTGNFQkdnVTYyRmVIcGcwcmFOWmJYOW5wTmVvTWFuUnpp?=
 =?utf-8?B?QWRFTmMxWmE1SDlKNWtTZDdlVGc2R1djalIzeWFCUWc3OWVELzNEay9Cd1Rv?=
 =?utf-8?B?YnhmMExRL1A5R3ljZklHWXR3YVMxUW96My9NL25qZG5UTVZGQTZOd1VaY204?=
 =?utf-8?B?N2FhdmhVK3l3SS9CN29MUGkzTi9yMDFVZnFmL3FZcFNjaU9DTklMV1dWZGwr?=
 =?utf-8?B?V0F2ejRqMGQ3YWozQ05VaWJTY2t5ZTJhZVA0SFNBV3RmYU1LRjduY29mdTdF?=
 =?utf-8?B?aU5BVU1iME0reHRWQWJxY1pTS0U2T3R3WTVweTNKQkQwZzNIQ2xOcjdGZlhS?=
 =?utf-8?B?c2pDRUQrU2dML05wNUpXSE9oNVJieTNHeWQzVEowcWV2WU8vQ3NlU2JESDNF?=
 =?utf-8?B?Z09OUlhRWkNCempldGROOWVHN3VGWEN4V2V0MEQ1ZnlmOHh6eWZxdTZsajFY?=
 =?utf-8?B?L3NQaGkrb09LYzlKcmt4UU1nczlFTHp4aWUwbTYremlwUC9xOU5TRDlWTit1?=
 =?utf-8?B?WGliRVhlTWxGT3VaT21qaVdkYm5qTUVPRU4xZG54STFJbFdwSGZIeloxS3oy?=
 =?utf-8?B?WCt1Q1VIdzZTbDBNazEzU2d3VG81bmoyKzJpalVkRGVSenM0YUdxSk83RTBO?=
 =?utf-8?B?QmMyMktqcXF0VmljMGJqaWhCR0dDd1VFSENrLzFoOHN4cmN6OE93N1ZKK1pV?=
 =?utf-8?B?dVFkMGYrMklRNm5STHZtcFZlWG9pUU1tSTFxUEJIRlZmaGh5QlJNaWRBRTZi?=
 =?utf-8?B?RXdwRzZUcVhaTDBRWTNNL290bXJkZm91SFRGUnJkS2wwcWVMclZtOFVCWlU0?=
 =?utf-8?B?WTNCNGpLYlJHSUl5QXpYNnIwOXVNeWQ4dFZ1OTJEMWlxbkVzK1FvUE9SOVlm?=
 =?utf-8?B?NmdyblZ2UG16c3FoUlViYTFTMEQ0RHRpdGdGaEJTTFlBaHlwYTRkemJtclll?=
 =?utf-8?Q?1E+AVPYLfu0DsyZJyKAaj+0A+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b870bb-966a-4b62-4432-08da63386b79
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 12:25:20.0336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t17eCjUMN+aK/DB9Z4mYPCvoYUVM2YOsJvndI3NHCNTQrSQBJ4fO5BAFqgUuVTNB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5593
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Karolina,

Am 11.07.22 um 14:17 schrieb Karolina Drobnik:
> Hi Christian,
>
> On 11.07.2022 11:57, Christian König wrote:
>> Hi Karolina,
>>
>> Am 11.07.22 um 11:44 schrieb Karolina Drobnik:
>>> Hi Christian,
>>>
>>> I'm sorry for digging this one out so late.
>>>
>>> On 06.05.2022 16:10, Christian König wrote:
>>>> dma_fence_chain containers cleanup signaled fences automatically, so
>>>> filter those out from arrays as well.
>>>>
>>>> v2: fix missing walk over the array
>>>> v3: massively simplify the patch and actually update the description.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>   include/linux/dma-fence-unwrap.h | 6 +++++-
>>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/include/linux/dma-fence-unwrap.h 
>>>> b/include/linux/dma-fence-unwrap.h
>>>> index e7c219da4ed7..a4d342fef8e0 100644
>>>> --- a/include/linux/dma-fence-unwrap.h
>>>> +++ b/include/linux/dma-fence-unwrap.h
>>>> @@ -43,9 +43,13 @@ struct dma_fence *dma_fence_unwrap_next(struct 
>>>> dma_fence_unwrap *cursor);
>>>>    * Unwrap dma_fence_chain and dma_fence_array containers and deep 
>>>> dive into all
>>>>    * potential fences in them. If @head is just a normal fence only 
>>>> that one is
>>>>    * returned.
>>>> + *
>>>> + * Note that signalled fences are opportunistically filtered out, 
>>>> which
>>>> + * means the iteration is potentially over no fence at all.
>>>>    */
>>>>   #define dma_fence_unwrap_for_each(fence, cursor, head)            \
>>>>       for (fence = dma_fence_unwrap_first(head, cursor); fence;    \
>>>> -         fence = dma_fence_unwrap_next(cursor))
>>>> +         fence = dma_fence_unwrap_next(cursor)) \
>>>> +        if (!dma_fence_is_signaled(fence))
>>>>     #endif
>>>
>>> It looks like this particular patch affects merging Sync Fences, 
>>> which is reflected by failing IGT test (igt@sw_sync)[1]. The failing 
>>> subtests are:
>>>   - sync_merge - merging different fences on the same timeline, neither
>>>          single nor merged fences are signaled
>>>
>>>   - sync_merge_same - merging the fence with itself on the same
>>>          timeline, the fence didn't signal at all
>>>
>>>   - sync_multi_timeline_wait - merging different fences on different
>>>          timelines; the subtest checks if counting fences of
>>>          various states works. Currently, it can only see 2
>>>          active fences, 0 signaling (should be 2 active,
>>>          1 signaling)
>>>
>>> Reverting this commit on the top of drm-tip fixes the issue, but I'm 
>>> not sure if it wouldn't impact other places in the code. Please let 
>>> me know if I can be of any help.
>>
>>
>> Thanks for letting me know. Not sure what's going on here, but I can 
>> take a look today if time permits.
>
> The reproduction with IGTs should be quite easy. You'll need to 
> clone/download the IGT code and follow instructions for Building[1] 
> the project (make sure you have meson and ninja installed):
>
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Figt-gpu-tools&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C9a9587aefd2d4ac2d86208da63375cb6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637931386683611766%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=4WsMutcFJ2HwBqld%2BTv9N1Tx6cbFMwJJZ6kjm5rbfoI%3D&amp;reserved=0
>
> Once you have it up and running, go to <igt path>/build/tests, and run 
> the subtests:
>
>   ./sw_sync --run sync_merge
>   ./sw_sync --run sync_merge_same
>   ./sw_sync --run sync_multi_timeline_wait
>
> You can run all the subtests with ./sw_sync, but I think these are the 
> most relevant to you.

Thanks, I've already managed to reproduce it.

Not sure what's going on here, but could be that the test case was never 
correct in the first place. Need to double check.

Thanks,
Christian.

>
> Many thanks,
> Karolina
>
> ------------------
> [1] - 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Figt-gpu-tools%23building&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C9a9587aefd2d4ac2d86208da63375cb6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637931386683611766%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=FV0Ao6ra8EOyr4cOs4N7mCmpOEUUObTrgyOrd0tvEV8%3D&amp;reserved=0
>
>> Do you have a description how to easy reproduce this? E.g. how to run 
>> just those specific igts?
>>
>> Thanks,
>> Christian.
>>
>>>
>>> All the best,
>>> Karolina
>>>

