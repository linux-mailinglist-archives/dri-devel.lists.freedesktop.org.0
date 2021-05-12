Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3034337B696
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 09:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3376EB4F;
	Wed, 12 May 2021 07:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387256EB4F;
 Wed, 12 May 2021 07:09:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2ER6YXNCWJe+dWdgoew8bv1+reev0XGKaL9I+aL2po1/XvF2fiD22GaUukwFnXBGnrdo15PuWMOsWKOVJBvrRdjld0i+PVXRcHLVLfHXiiRy4wSDSiOzX1wnsDjlZe66vNmolbt3HTCKyzb/paVA4ZhWuxpMH1YB2tPfTwV6p0tbijfuC1Y2RaPFF5Ga713UsHxPNOlrXHtJKSnqJK/Nrdg/qITKfpXgknqTG+24sW7NdYEXFgFgCOg/T4N6hWPl/OEwoRD8LryXEAe1ogjYDgUq472mXw7JWNaADqP3nyPLHI6qy8HVyplcV+I9yRMLq3TcmwWC6Vq0dk/Y7AJ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTLa0ErOffLBS4CIOGunwcFN/s6R03hvH5yENrOyOKw=;
 b=koyMiAX3e6Xpmw4Tq3WX/f4dpyDouQR6tQzCZtvgVHWxvG9DP4hq7SwKk2DlZurqPgceoOBrkcaBMa6TGK/F7axCSN6WAoW7aO+ApQgDl6wwqRZJhELHxRJEpvNGTYZdAtE/IdiwNDAY8X4wUAyx3Jxkt08TamtxS3sjv2RUCPIrnwIX+RuVy/9Vf92od/6EbQAnpDC2ooTwfGaAGUXYocXq0HEEFimF6h6HV/wqfj0on348BHqGk0pOW3/bn/FrFX/Izw37PCuuyi9Hn7ev703cmkveamCHqqNCQTs1A028cHH9wl2Qpl3ZFv/eH5RNfxDPMC9noh2AdX1VS5acHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTLa0ErOffLBS4CIOGunwcFN/s6R03hvH5yENrOyOKw=;
 b=sIDp/FYjnjON1N7TS7HvgTfW6hD2Seuyu6W0eN8QnNhLW+eC5ir0vQ3U3qZkhOeda7gC8d21gVfhBUdLflks5FU6H4pLi333iuKOoR68EeM5uedj+rS2+k8VAlUnRvD5WgMC2v0445UukqN5pV7pOiZyetafQDoUCnD0xqe7Ak4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3936.namprd12.prod.outlook.com (2603:10b6:208:16a::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 12 May
 2021 07:09:22 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4108.031; Wed, 12 May 2021
 07:09:22 +0000
Subject: Re: [PATCH 6/7] drm/i915/ttm, drm/ttm: Introduce a TTM i915 gem
 object backend
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210511132525.377190-1-thomas.hellstrom@linux.intel.com>
 <20210511132525.377190-7-thomas.hellstrom@linux.intel.com>
 <8ac6bc5c-17c0-2ffd-7f8c-823ab3c8a858@amd.com>
 <88ea8e22-3314-60a4-8f4b-0b37de444b1d@shipmail.org>
 <8551810c-a095-3906-d982-7bc409140c48@amd.com>
 <0b7f32d8-bfb9-84dd-fea7-556dddded1cc@linux.intel.com>
 <a0277869-7244-aee0-3359-21dac8f5a724@amd.com>
 <e85e9bd7a28c8570c6429683d6d68ee0855afacb.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d0f0c55d-1784-922b-e9bd-0248cd7fb6af@amd.com>
Date: Wed, 12 May 2021 09:09:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <e85e9bd7a28c8570c6429683d6d68ee0855afacb.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:bc39:4e06:ac5e:2e31]
X-ClientProxiedBy: AM0PR01CA0115.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::20) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:bc39:4e06:ac5e:2e31]
 (2a02:908:1252:fb60:bc39:4e06:ac5e:2e31) by
 AM0PR01CA0115.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Wed, 12 May 2021 07:09:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 638772c4-582e-44fd-3b73-08d91514de08
X-MS-TrafficTypeDiagnostic: MN2PR12MB3936:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3936F614CA6959396CAC7C7383529@MN2PR12MB3936.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JNnftkHlqX2zuQBVuFywbglRyMyx2uQi5P1yVC7Tfl+R7sDBBZ3BfQ8HMCd7WObSD32Gs/nAIY1Hmx92Lq1Q9OkIh3uuGA/P0kEwcQzZwK2JAxH+XO1C0bMC+eP42OwI4WZv1wO1j9eAJ5g6+MdOgwulMjgKblD8o6/XhJzxvNfC0NhT+p2/sj15B6D97MRCbTKEDKUGOY2Gd0MAerIIk4cM1JXvwREhwnEUjMk9yGKbQuwEDj0C7AzlgnPJhlSXJVHITNUh/x0VQhHMUeitQZxrrwN2rZgXcL2yuDm1jmWnDdysg30uULy3igxg27iV6zDvFmxJkQWWNB3swqpnJYD10KtSX38Wdj565/lJIMTeaDK8v6oTzh6j2jnAIpddP8rauB/GNwtNpwiPdzkjggAbCekSkEm5dBDGZN4ZPz540FL2CUGSm4IvVzCrZzkcLq9XvkjbeNTfKWmdHvL/lsSZrls8MxJxi9H8d8pMP/w/Fjg/dhWrXydMtKDgLf3TVS/dgDrKRYZnDSfY/96zPKFH6hTh71PkvfrbpzIG5l46PVBjtmEtHm3JX3IDcP5XmV4/LmCAW6VVPdTfajZWioqEw00etcklSCJ9OP2XaXs4/215GPGE2WDDogrhUGQl3SPxcrz7/8gsVq3bOBas/MPFs23wmvSe0pdhehQBL8g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39850400004)(346002)(376002)(86362001)(66556008)(66946007)(66476007)(16526019)(8676002)(36756003)(6486002)(31696002)(478600001)(6666004)(2906002)(316002)(31686004)(83380400001)(66574015)(186003)(8936002)(110136005)(38100700002)(52116002)(53546011)(2616005)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cjBCQldKL2NNWlpaVDFWNndUemhINDlEd0hEcXd5dDFnRGZuaXA5bFdHbWpu?=
 =?utf-8?B?SjI2TFJTTE1iL0M5QUgwWFBydGluamFZcVkzUTQxMGRjMnNGYngwem1VempQ?=
 =?utf-8?B?Um9TMi9Pb0dLQTQwVTJSWjVRQVFFZ255bFB4THJRL2tuY3E5Q0crMXBZRTk1?=
 =?utf-8?B?N1VjRGZPMjBuYjdVdURNakFNb2dFRlFjU3JCTEZPSmd3Zk93L1FCM2h0emNx?=
 =?utf-8?B?bGRHTXhmMEVYdEpLRGtrYWVaUll3TW1NVmpWT3lEbVJkZG1oSkNoQTlQYXdB?=
 =?utf-8?B?Zk5qdnFwZU15V1lVcERlV2kvRzVSQ1BWblBVLy9RaS9Eem94SndUV2cyMzlZ?=
 =?utf-8?B?SHpvZmlya2NyaFRZd01RTjdEMGJaTU9VcGQ4Wk1veDVSRHBXWnBaVzlpS2Yw?=
 =?utf-8?B?Ly9oMnUvWnl4N0s0ZThyMW9TTGd2WER5Q1MvZERWVmRxZHFTanFINnhnVERM?=
 =?utf-8?B?SWRwQnZYU1pCUnJwNHAyMSt1M09CekhkdHZqVUo4RzRETVRsRXFKQ2wwRkhp?=
 =?utf-8?B?MzB5ZkVFczhvRG1QK0tpKzFsYzVPLzN2YnB0bDFjZzFtYjFVd29wUGlnNERi?=
 =?utf-8?B?TlNnb2g4a29VWDlPLzVYR2psWXpTS0p1SDcrTjBzYkFQa2w5VFJzWWxYUVJs?=
 =?utf-8?B?ZjI0NjJOZFI1cXJZc1J1TUhoV0xrQkVlMS9VcG81Q1RVZmU0WkcyT1BtVmVm?=
 =?utf-8?B?ZzNaWTdHVlBFdVFHckdTdzQzT2xxZnVuN1RpZWZQaU5RRGw3UkFaa29CU2JD?=
 =?utf-8?B?cnlTQmxOZzJGSDVLVU9FYlBMRitya3lEd2VBOFc5MHdicTduUGM5U1FiN1Iw?=
 =?utf-8?B?K0V5TVpsd29kR2JodGVOVnBEYXVGbG5RZTlwWWxOVytVK0ZGUUdRVFVCQXFS?=
 =?utf-8?B?N21nay9IMTlKTGM4WnljMFBETTM2cWxXczhxTjdMMlpsS1EwR2tBUlE4WlZy?=
 =?utf-8?B?em14Z3ZnV01NRGt4YktnYzd0eHU3VmljQ1M1ZEZPMlZFR1lxYlRITmI2RGVJ?=
 =?utf-8?B?bUxDakRjTmRIUCt4VnFZREQzTFpXVFcvVzBONGNTRHJSdENvdHZwYWlaZktK?=
 =?utf-8?B?SlcxSFJMYXpLT0xHSGt4SXNqaWpOYUtVTWNweUFpMXRpTmZRNkd2ckE2STE4?=
 =?utf-8?B?QTAycXY2WXJBUkFiNXp3MDlLQWhrVGp0S2txanlQSVlWL05yY3cwVTh4ajNw?=
 =?utf-8?B?MEVuRXgxMkVBSkgyb0lNRjd5dFQvblA1YXBRdXdFbnZYOFlKVFBDU2N1dzg3?=
 =?utf-8?B?RHJaTkRmNU5JZmtoVWpGdHlSaGpiS2tjRGR0ZTdxNVA3RTRDdG5lN3d3dk1Q?=
 =?utf-8?B?aldZaEZkNWFjSHU1eDdwU3A3V2Q1MXFtUzQvRXI2U1NQcnlxcnZOMlJUazRq?=
 =?utf-8?B?SWc5YTRqTkkzSTYzbkNjc0cvZElwYlpmMEt0Q25lVTBHaHIrSnM4emM2dHlk?=
 =?utf-8?B?ZDRnM3p5K0NIR25qNE5Sd2NRSVhjck04cTNvQ2gwSEEwV3JibEZ6VkZqRVBH?=
 =?utf-8?B?dkJJSTlxTStMWkhlZWhSa3RkcFdYLzNqUzZ0RG5wZXQvTThWWGFlNGd5UlpD?=
 =?utf-8?B?dDhHWEY4ek1WT3hCMXZqUlFFUXlyaUx4U09iK0hzTWhKWlV6bkE4QVRlV1Zo?=
 =?utf-8?B?V1pJU0xyNDdXeUtoVXMvUzRwbmhXejU4cVFGWWQ3c1FOL2ZFajUyQVVwZXpa?=
 =?utf-8?B?RTh1azRJZWh2TXo4NUpxMkRkc3JkTURGWGo4cmpKNkZaNDZSUy9XMzJ1bVJq?=
 =?utf-8?B?TC9BWTE5UEFRVGRHekUrVEFkMHhWRGVMaUxzeUJwTjFQQnlPR04zbWJzTmpH?=
 =?utf-8?B?QW1Fa2RiZFM0SHBsd3BLdnU4QUo5dnpodzgyRjY4MjdGVEgxRGU1amNEYWV4?=
 =?utf-8?Q?HRSZxtEb9nZzh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 638772c4-582e-44fd-3b73-08d91514de08
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 07:09:22.1664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5x26qqvaGx+DQyZMz313yXFs0kjt1v/aSx5y8t/AVmd/VQ+TU8nx4aAo0jVQQYwu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3936
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.05.21 um 09:05 schrieb Thomas Hellström:
> On Wed, 2021-05-12 at 08:57 +0200, Christian König wrote:
>> Am 11.05.21 um 16:28 schrieb Thomas Hellström:
>>> On 5/11/21 4:09 PM, Christian König wrote:
>>>>
>>>> Am 11.05.21 um 16:06 schrieb Thomas Hellström (Intel):
>>>>> On 5/11/21 3:58 PM, Christian König wrote:
>>>>>> Am 11.05.21 um 15:25 schrieb Thomas Hellström:
>>>>>>> Most logical place to introduce TTM buffer objects is as an
>>>>>>> i915
>>>>>>> gem object backend. We need to add some ops to account for
>>>>>>> added
>>>>>>> functionality like delayed delete and LRU list
>>>>>>> manipulation.
>>>>>>>
>>>>>>> Initially we support only LMEM and SYSTEM memory, but
>>>>>>> SYSTEM
>>>>>>> (which in this case means evicted LMEM objects) is not
>>>>>>> visible to i915 GEM yet. The plan is to move the i915 gem
>>>>>>> system
>>>>>>> region
>>>>>>> over to the TTM system memory type in upcoming patches.
>>>>>>>
>>>>>>> We set up GPU bindings directly both from LMEM and from the
>>>>>>> system
>>>>>>> region,
>>>>>>> as there is no need to use the legacy TTM_TT memory type.
>>>>>>> We reserve
>>>>>>> that for future porting of GGTT bindings to TTM.
>>>>>>>
>>>>>>> There are some changes to TTM to allow for purging system
>>>>>>> memory
>>>>>>> buffer
>>>>>>> objects and to refuse swapping of some objects:
>>>>>>> Unfortunately i915
>>>>>>> gem
>>>>>>> still relies heavily on short-term object pinning, and
>>>>>>> we've
>>>>>>> chosen to
>>>>>>> keep short-term-pinned buffer objects on the TTM LRU lists
>>>>>>> for now,
>>>>>>> meaning that we need some sort of mechanism to tell TTM
>>>>>>> they are not
>>>>>>> swappable. A longer term goal is to get rid of the short-
>>>>>>> term
>>>>>>> pinning.
>>>>>> Well just use the eviction_valuable interface for this.
>>>>> Yes, we do that for vram/lmem eviction, but we have nothing
>>>>> similar
>>>>> for system swapping. Do I understand you correctly that you
>>>>> want me
>>>>> to add a call to eviction_valuable() also for that instead of
>>>>> swap_possible()?
>>>> You should already have that. eviction_valuable is called in both
>>>> cases.
>>>>
>>> Hmm. I can only see it called from ttm_mem_evict_first() which is
>>> not
>>> in the swapping path? Or do I miss something?
>> Mhm, looks like my recollection was wrong. We should probably move
>> the
>> call into the ttm_bo_evict_swapout_allowable() function.
> Yes, I think we also need a convention whether it's called dma_resv
> locked or not, since the helper accesses bo->mem, which should really
> only be done under reservation. At the same point, there is value in
> calling this function while holding the LRU lock.

You actually need to call it while holding the lock because eviction 
otherwise ends up in an endless loop.

Trying to fix that for years, but so far no luck with that.

> Also, I wonder whether implementations of this callback might encounter
> unexpected data when called from the swapout path, because at least the
> helper assumes it not in system memory, since it is accessing bo-
>> mem.start.
> So unless we use a separate callback for swapout, there's some auditing
> to be done.

Please audit the existing callbacks and move the callback into the 
function after doing that.

Thanks,
Christian.

>
> Pls let me know what you think.
> Thanks,
> Thomas
>
>
>
>> Christian.
>>
>>> Thanks,
>>>
>>> Thomas
>>>
>>>
>>>
>

