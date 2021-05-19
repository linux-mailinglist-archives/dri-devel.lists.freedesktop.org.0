Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 433C9388BDD
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 12:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF616E296;
	Wed, 19 May 2021 10:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4BB6E296;
 Wed, 19 May 2021 10:43:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIoVAVxjL5Tv8mYGQwt2YQJ6/4w7lJ17P9/MHJB5PEl9ylw0HhnPf3ZRC1RCBJJ7FUkhgU2qUpTlQl/rmhw3+sw4fDLBc6cntg+NVcsxHiFhkEIC7H+pZoSNkZVAYAOKqmGD/8h+2Wj1ZipDoCN1w7vQMiIYRn6mWkxEvdr+zuk8UYt4vba1xhEehNFDcOiwAj+SILnlpeH33Y7XoJww6x3p8a4Ufd4MEKysTsxjTxUzXNHCIJsSqObEM+7f+m3XzWPaPh6fl6HvfOpsuwG/d3iCT/I3FYBYDArAZrF6lEvDspQqvNjK6l7OcLr5VBbP8YGaZOEo6C/HvYveFYve1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCKG8Ghq7Ieeoyqxo4aU7bzkXq0IFkxIVx3h843EhQw=;
 b=LYLG3/E8nmvPGrHnewK8PQ6a138Jty38aVOA/6T8c7NJUiMXJimXqfFHmifzdlexAKZD3XflyzeDnMZwLbr1X6MTY77KiX5pGXy6cmw5iYG6njYdQkCsYCW7OA98lPyWblhWuDm9YbEMJqC4B2YIHTrDH42vVd5CfyDOT2+55cgpbwIWcc878/uH2S8UFpHjmZlysE9wYHyvpIA/jE5sNjykOB9pis4OEKXM/JNuRxOj2lWVpeSvaNjZHctjpqEKsILrE3J17uW4BeD8w96LIsXp1sHpbJizYjoLEeOgza+u2l38pNNaH5JkWNr8s9fQYPHzYXwzqsmy2K9Gz9rdzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCKG8Ghq7Ieeoyqxo4aU7bzkXq0IFkxIVx3h843EhQw=;
 b=soYjzms/dyw6xAc999oQCyP3pAI6V4UxbXqQDFJnN0LJWbsuZ790yW+dxx2+FoZa8cdr8ifKZxa75kIxAUyeLh1MU4mK3uPjCKYI3ZxtdQq4zzLwT0mxDgZ4HKBdmTTFgepKstrI7kv84mHy1D+ZkdglEtq+Oa8ekhmvJ45M/u0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4551.namprd12.prod.outlook.com (2603:10b6:208:263::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 10:43:18 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 10:43:18 +0000
Subject: Re: [PATCH v2 09/15] drm/ttm, drm/amdgpu: Allow the driver some
 control over swapping
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-10-thomas.hellstrom@linux.intel.com>
 <c4cd4843-c3aa-1f01-fc73-bc9144fa478f@linux.intel.com>
 <60276369-dbfd-e0dc-548b-a9419ff4c7eb@amd.com>
 <471d8fd5-379f-e95a-4973-c50fadace7cb@linux.intel.com>
 <b909db91-5c61-4af5-135d-aa62d5e4b481@amd.com>
 <f5c008cb-5047-7cbf-0361-e4e58e38d6e0@linux.intel.com>
 <fb9a4898-5844-c1e5-7a24-cb50a9ad6df7@amd.com>
 <334dc2d2-2053-9e42-62be-58784e4256aa@linux.intel.com>
 <a627f340-492e-c2cd-f805-8fafdca8eb60@amd.com>
 <1be54cd2-5e50-c967-17a8-4b6d86fe71b1@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a4e4c072-4041-c2a4-beb6-d9ed8cb15761@amd.com>
Date: Wed, 19 May 2021 12:43:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <1be54cd2-5e50-c967-17a8-4b6d86fe71b1@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:8e28:1d3:41f3:e15a]
X-ClientProxiedBy: PR0P264CA0124.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::16) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8e28:1d3:41f3:e15a]
 (2a02:908:1252:fb60:8e28:1d3:41f3:e15a) by
 PR0P264CA0124.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.33 via Frontend Transport; Wed, 19 May 2021 10:43:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 766fef52-8c49-4fc1-d4b1-08d91ab2e9e1
X-MS-TrafficTypeDiagnostic: MN2PR12MB4551:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4551C5DB75652FACA90A5D47832B9@MN2PR12MB4551.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C2cTiCOcmm3oVZJSr2hQ3UkgL0+dcbzvjoGyY90BGN7yoCCFhJwaJE+dI+WmJMv8rSDfRBhYt7umXR/ZAtGlH4EuCc/AcREorlWoDAgG+JwKktulPV9gcTDujSLFd+lG3YdhoDpyauD5pr2oZnlBmmq4v6wv8/58327ZCoETVP8nnXgqafoktiXTiXIC0qBj5GLw8310DthgwXePIPw5+uGM315mGOOl+CUKqLxWJoTHIWrbkO+792CwDZYtvE9WFCOibmb3q3vB3GVLlCkZ9R3gdaUqzpHPSImTPyMiq8zdoPQ6km5Q3JGQFDrEVbkKcsxsdqBvuumRCUYr6hgRUCIsY6TDF1CdJC6LITes06HK2AFJeySmdIpThAs1rpZXvAm8xtKEXJBYkVc2DqwjkeQ3a1nSpfActB3aKe+oRKr4nX9dmzJGwsxzT9U9+x0x+Ov4PvxgRrXG1jJ3uyMqVk3XZ8JIp/c6FJYnDVO45wDxxT4wmen90VlpBBIom18CmKOcI7K4/ks3Z6w3GpPwOSa4OuZSqWI5NkV8lp48WW44ErsXA3/BKM4bCZtBJ0+u4HQxLpagIFxayI23B8PFmgAGamzi1O+t+AayQ+shd/XkxpjaMl6dLZ0NpgNzDGwzNZFFh3BQAHhvl1ubWW8GpVTtYOYYychC/gxBR+7jWVsRp/Zl3pCClzjQV8d/dsZg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(376002)(396003)(346002)(186003)(8676002)(316002)(2616005)(16526019)(8936002)(2906002)(6486002)(36756003)(66556008)(38100700002)(66476007)(5660300002)(66574015)(31686004)(31696002)(6666004)(53546011)(86362001)(52116002)(83380400001)(478600001)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SnRtOXVlR0tmRlpLNUovSEZBcUZ5N21nRFE0MTd1ZmRmWlZJdU5PRC9QME9P?=
 =?utf-8?B?S3JjVTVvWmZDYXdTU3RLMjZHWjFSSlFWWVBjbE81aklza0pMbXRKZnM0VVBp?=
 =?utf-8?B?ZW5OOVZBWnJRQ2JyeDVnd01OanJPUmxQaVNPbWNFUTNmM2pRNEsxcFRJWVpS?=
 =?utf-8?B?UHBVRU5Mc1k0Q1AvK25oTm5XYnpxZ1JReEx0cTFtUWU3S1Q5eVg3c01JRlJR?=
 =?utf-8?B?bzVUaEIwMWVmbyt2OUx2YithUDZzQTVLUGZtMTd0ZEgxVDk3K3A3dTkxS21U?=
 =?utf-8?B?K2p2SUREai9uU3Q1MlArVFMwQ2lwT0pmWTZ4ZzdQUDZxdGZBZVpVME1HdEtr?=
 =?utf-8?B?djNCUHgyVDlLWWtnRHNieTczczhXRm9UdVl5YTNLRitVeEw4WHNGMGhjek5i?=
 =?utf-8?B?cjNLeTVnMm11a1p6NTJUSzlWdkVCekRQUUtZMDJ6czVZODVpcVhaQzBySzEv?=
 =?utf-8?B?QkVqYWVuUEpLMHFBYWRvU0FMNkVCQXZVbmU2V2lmTWxnUXI0QXhwZEJ0cGt0?=
 =?utf-8?B?c1ZMVU5OUmpZc1FHYXRkeWVUOEtNeXVRaVM0akZPdUtUMUwwWGlaM1lkd2Fy?=
 =?utf-8?B?alFqNmlPNTlpN2F1UmFBZEtTZnQwRXY4OW9mZjR1T1B4Y3BqTy9ldHpZS2RH?=
 =?utf-8?B?ZXBQdHVxQVpPbk1zcDYyNElOdFZjVWo0dXBlTEpocGt3ZVE4cEt6SzN3Uyt6?=
 =?utf-8?B?c1V3MGp5L2x2S3JyaFZRcThhakIyQTFnbjhPWlNpYTNFY2dOL1lVVVZGVFJ1?=
 =?utf-8?B?cDlsVFNxQ2xSZWxUazc4ZG1NUC9QaFg2a0svdGp4MmlqT1Y2YWtWTm5wcHBZ?=
 =?utf-8?B?RXZzZ3NJYkdlQU40RVQrcmE5ZVNqQmI0bC84c2pKdHZiS0dUcGdOeXR5YVkv?=
 =?utf-8?B?SGljaUN2ZGF6RDFRNXR2b28wZ3ZRc3ZrcGIyV2Q4UDBxaDAyWUdBdGF3QmNr?=
 =?utf-8?B?WDQvd3VDSGxGRTdIbDlEcE5PdThaT29BL2JFb05JcGFvY3BuVlBqVTRVYURM?=
 =?utf-8?B?VWtjcUVHRzYxSDZEWnhodGdzRnlUQ3FIRjhoMGxkY1VESmZlbnBHRGQ0b3E1?=
 =?utf-8?B?NHBYbUNrcWJDZ3dIQVFmMFBqOTE1eVlTWCs5ZnBrUUtvWHZrNC9TVFVqc1Iy?=
 =?utf-8?B?cG9LamoyS2JiTW5pdDlJcmhPZUZneDhVeDhjQ3V3QjNuNjZzZVQ3eUczYlNE?=
 =?utf-8?B?Wk0yRFR5SHFFVlNodUV3Z3BxL213dWtpNUJ1WE04cFhvMjJFa21YR2d1STNk?=
 =?utf-8?B?enByZGROV2JJQ3lPTjNiWDJ5NXk5bEF0NXlldkFFdmZMTUMrY0dWWi84SUR3?=
 =?utf-8?B?TCtwNUUySHZzellJMm1QNnJldmNXMkhUY2FJRksrU240aDNIZ0ZrRlI3Snlv?=
 =?utf-8?B?RUhNb1RFQmdSYmlCdjN4bmcrdVNqZngweHhpYnA0eEFsbHIzTklyZzhKekxi?=
 =?utf-8?B?cUxaV1dtN0VSSHBRSUlNMTQ5MWZIM2tRcDNybVpoVlhqNnVFVkJEcjM2a2ZR?=
 =?utf-8?B?K0VlL3BhRzMwekhLcDgxRUVMSit3UFpraktsSUd6Z3pIYlVHNGdRMTJidmE0?=
 =?utf-8?B?bFRxaXExV1Fvdms4RnVIQ3E3cEhHVzJVOHdkWnFiVm11U2R1MU5DZFFOREE2?=
 =?utf-8?B?UU1xSmJEWUlLUk5Fb3dRNmNYeU9aK1JSYmRiNlRCUU0vUDd1T0ZyUnQ5ZXVB?=
 =?utf-8?B?aUpXRzBWeDdHQ0tkS3hSREZ5eUhUYWMxYW5MempIVHVtME9pamVsOUxyYmJM?=
 =?utf-8?B?OWdXeGtPZHZWaVFFeEpDY3B2OEY1K2dqdnpTaGx5cUVvZUVvaGRYZGJsV0ts?=
 =?utf-8?B?aWtWY2x1TkhYSzE5NitqekpYYVRxS1RrYm95OGNtQWVDbGNYWVBkQXBsSHJD?=
 =?utf-8?Q?8TF9thyBHBbw4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 766fef52-8c49-4fc1-d4b1-08d91ab2e9e1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 10:43:18.1167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EgsfCVXGFvIb58v/vA0sH+FO1sDOaL/eJRCjoW9yicRuGDZr40trxNYN8mHqz2Qd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4551
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

Am 19.05.21 um 08:27 schrieb Thomas Hellström:
>
> On 5/18/21 6:30 PM, Christian König wrote:
>> Am 18.05.21 um 18:07 schrieb Thomas Hellström:
>>>
>>> On 5/18/21 5:42 PM, Christian König wrote:
>>>> Am 18.05.21 um 17:38 schrieb Thomas Hellström:
>>>>>
>>>>> On 5/18/21 5:28 PM, Christian König wrote:
>>>>>> Am 18.05.21 um 17:20 schrieb Thomas Hellström:
>>>>>>>
>>>>>>> On 5/18/21 5:18 PM, Christian König wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> Am 18.05.21 um 17:15 schrieb Thomas Hellström:
>>>>>>>>>
>>>>>>>>> On 5/18/21 10:26 AM, Thomas Hellström wrote:
>>>>>>>>>> We are calling the eviction_valuable driver callback at 
>>>>>>>>>> eviction time to
>>>>>>>>>> determine whether we actually can evict a buffer object.
>>>>>>>>>> The upcoming i915 TTM backend needs the same functionality 
>>>>>>>>>> for swapout,
>>>>>>>>>> and that might actually be beneficial to other drivers as well.
>>>>>>>>>>
>>>>>>>>>> Add an eviction_valuable call also in the swapout path. Try 
>>>>>>>>>> to keep the
>>>>>>>>>> current behaviour for all drivers by returning true if the 
>>>>>>>>>> buffer object
>>>>>>>>>> is already in the TTM_PL_SYSTEM placement. We change 
>>>>>>>>>> behaviour for the
>>>>>>>>>> case where a buffer object is in a TT backed placement when 
>>>>>>>>>> swapped out,
>>>>>>>>>> in which case the drivers normal eviction_valuable path is run.
>>>>>>>>>>
>>>>>>>>>> Finally export ttm_tt_unpopulate() and don't swap out bos
>>>>>>>>>> that are not populated. This allows a driver to purge a bo at
>>>>>>>>>> swapout time if its content is no longer valuable rather than to
>>>>>>>>>> have TTM swap the contents out.
>>>>>>>>>>
>>>>>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>>>>>> Signed-off-by: Thomas Hellström 
>>>>>>>>>> <thomas.hellstrom@linux.intel.com>
>>>>>>>>>
>>>>>>>>> Christian,
>>>>>>>>>
>>>>>>>>> Here we have a ttm_tt_unpopulate() export as well at the end. 
>>>>>>>>> I figure you will push back on that one. What we really need 
>>>>>>>>> is a functionality to just drop the bo contents and end up in 
>>>>>>>>> system memory unpopulated. Should I perhaps add a utility 
>>>>>>>>> function to do that instead? like ttm_bo_purge()?
>>>>>>>>
>>>>>>>> We already have that. Just call ttm_bo_validate() without any 
>>>>>>>> place to put the buffer.
>>>>>>>>
>>>>>>>> See how ttm_bo_pipeline_gutting() is used.
>>>>>>>>
>>>>>>>> Christian.
>>>>>>>
>>>>>>> OK, so is that reentrant from the move() or swap_notify() callback.
>>>>>>
>>>>>> That sounds like a design bug to me since you should never need 
>>>>>> to do this.
>>>>>>
>>>>>> When you want to destroy the backing store of a buffer during 
>>>>>> eviction you should just do this by returning an empty placement 
>>>>>> from the evict_flags callback.
>>>>>
>>>>> So this is for the functionality where the user has indicated that 
>>>>> the contents is no longer of value, but the buffer itself
>>>>> is cached until evicted or swapped out for performance reasons. So 
>>>>> the above would work for eviction, but what about swapout. Could 
>>>>> we add some similar functionality there?
>>>>
>>>> Amdgpu has the same functionality and you don't need to handle swap 
>>>> at all.
>>>>
>>>> Just return from the evict_flags that you want to drop the backing 
>>>> store as soon as the BO leaves the GTT domain.
>>>
>>> Hmm, the pipeline_gutting function seems ok, but overly complex if 
>>> the bo is already idle, Am I allowed to optimize it slightly for the 
>>> latter case?
>>
>> Yeah, sure. We just never hat that use case so far.
>
> One thing about the code here that makes me worried is that the 
> "destination" ttm_tt is allocated *after* pipeline_gutting. We're not 
> really allowed to fail here because that would leave the BO in a state 
> where codepaths (fault for example) try to access a NULL ttm_tt. While 
> the idle case can get away with ttm_tt_unpopulate, for the async case, 
> ttm_tt really needs to be pre-allocated, so that we can leave the bo 
> in a consistent state.

Well the original plan was to make tt allocation purely optional.

But I didn't had the time so far to actually fix that.

Christian.

>
> /Thomas
>
>
>>
>> Christian.
>>
>>>
>>> /Thomas
>>>
>>>
>>>>
>>>> Christian.
>>>>
>>>>>
>>>>> /Thomas
>>>>>
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>>
>>>>>>> /Thomas
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Thanks,
>>>>>>>>>
>>>>>>>>> Thomas
>>>>>>>>>
>>>>>>>>>
>>>>>>>>
>>>>>>
>>>>
>>

