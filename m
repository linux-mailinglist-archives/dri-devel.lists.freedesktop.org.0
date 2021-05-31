Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B238395A00
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 14:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D716E8EB;
	Mon, 31 May 2021 12:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E5E6E063;
 Mon, 31 May 2021 12:02:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OB/NRffwU5ZT7UjvWFEUtajoG7m5upYgRIzkxpZWk95MSR5Zvsurtxrtito9ZFKGMiIUi/R+za6RrWrGFeqp44mcZcYjdNFbBXVusHWAcIrAwqKNtJcNzIg0f24dllxzqfPgFyHWXAuFCpWXupDxeuGE3UQOimyYWUgEfPM1p+2kKqmOsGjcml2n9Lc8lQo8XOEVtZA2QjtgPOkN/WCsn6ZNXIw++ndhxuOSY3N1on2w0VbA6XoOqP5Gni9V/gE5xmDIGURvbU8YXBavkP/NrlT0rQsR3RyI8NY4cArsFTwLKJOp2zlBH8cdKPPd+z87CYery6CqbJex4QkjP9jfDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMNWLBMaThJ4OPfS1ecljoXrMzkCLhBum7RgmkoWPRg=;
 b=MOyUhjsAbZLQD+Q1rhh+AGIvcwOUGRglmv8OwWRc9df8hDCsR25K03Vxxr0oZ1vY68beoSeu3LICcxQI1Po+YGaz74yq52Yb2A8khWVFlf3grnkuITez3mjVnsz6Xh/a6LzCbuwzsHMSC5rYiY5u6gGGFEGADF34kyXaU4ZKuJ5EYxIuz3vHa9tUaAIvB3f27355ZXIiZmxtP+ybwNSCqHxGQja76hvNezywDOe9BHpSQqQ4eXAyJekx2+NtkuT86WPg9pLHwWPYUrGYrc6DV7isdxXtOoBa0owMPtXfSLgcFuJmQwBXkkGv3mLxs4M5+G5IHlSjvsI1rmUajUzsEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMNWLBMaThJ4OPfS1ecljoXrMzkCLhBum7RgmkoWPRg=;
 b=Hz3FpuTZs/YPQ4eZt4wFG1IFFw2aToRk8wjuVJrz/9kqJaQFy+pZlGQF56GcbixDTNA1a7mvKMPYH05KpN8X1T/DusN8ryx6yCM6UpXC3jJ+YssvtGbj8vNyczZY6K2tlKjPL1zZ3pwhsKq6gYwKsoQ0hhcF2zY77BDt/D/50wo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4566.namprd12.prod.outlook.com (2603:10b6:208:26a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.27; Mon, 31 May
 2021 12:02:19 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 12:02:19 +0000
Subject: Re: [PATCH 1/2] drm/ttm: cleanup and add TTM_PL_FLAG_TEMPORARY
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Yu, Lang" <Lang.Yu@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20210527013051.4302-1-Lang.Yu@amd.com>
 <DM6PR12MB4250B79297F587313D7645EBFB3F9@DM6PR12MB4250.namprd12.prod.outlook.com>
 <14d7f047-cf6d-c84a-14ff-3f1d833a770b@shipmail.org>
 <883bd629-e3ad-07a2-8952-994f42cb02be@gmail.com>
 <86054733-9b7d-de96-4ab2-21dca85f1e6e@shipmail.org>
 <888c52a5-ec10-0dee-c462-93cef8510e9f@amd.com>
 <6c4c8c57-7cc7-7e24-1d19-b91a312d44a0@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <cd081dda-7430-d891-6b02-8aedda7b67be@amd.com>
Date: Mon, 31 May 2021 14:02:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <6c4c8c57-7cc7-7e24-1d19-b91a312d44a0@shipmail.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:b94:4956:bad4:7c81]
X-ClientProxiedBy: AM0PR07CA0002.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:b94:4956:bad4:7c81]
 (2a02:908:1252:fb60:b94:4956:bad4:7c81) by
 AM0PR07CA0002.eurprd07.prod.outlook.com (2603:10a6:208:ac::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.9 via Frontend Transport; Mon, 31 May 2021 12:02:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f703bfe9-661e-47cc-56bf-08d9242bf0dd
X-MS-TrafficTypeDiagnostic: MN2PR12MB4566:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4566AF87D7544313D6966A80833F9@MN2PR12MB4566.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y14ct95xvGO2AyTmhf79F6oZ9iyBvrO5FJt9KiSkfzj266ntXDkY8cfc1/GSqaVaO/en+jV3765mC2KyxV7Sbzf1T1P4G9bL1BeNmNNg2XAd1nY+BblJn2ItFCj9kyXEyuVw3f6LMp5XQ0O9/rK1cXGVtFhtaUZPMCEHAAGwjTTHm6ELwOqQ7ia7tNA+QDL2YW1Djq/8KNqaaJjwmSq9SgrguUhQn5BzicUNQlAkEuZKkEXz0aHiMpnxa6/li7orvEqrLoUZJV7mSJMvmLLJbEKFiov3N9zRYzg4wB4QZ7xn+TyYcXMcdrpGTTwtyGUjdmC6EHNnVewweWo7FjREBR8KfU/SbwElkaBCeGzgGcfUqxl8tYt48rOt9+CyFY8xwETw+xSr8hMte1rbPcuV2zmQQPveSL67rmHgCHml7XahkRW65f1DOUxsJhL4n7xdSxBKplAaAvSdu8OkgGs0a5+CDfdSSZ/BzMgMfLA4Q/qACjDVbHIqLrvkPwgUgdJce04GTLCUSVrpEov2Apx5EkmW/176W6bMSy48gtwUzWRkc8efwBUaiicvYLnWva8RMHGrQMcBmHgoj8H23wJ2JjjMv9M1qB8yxgZFLNBaT5iLs8icZeozfMIBoovImcluqQu+qvZBH3Orj46o6KGsZwi0gpGm9ztFA8ExfzhWffZKvPjFcsqF9jVgZO44hi+/mG6MzMV67Q0d0Jhj7fdHkMLVnGeLwuo4QQyehiDBITo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(316002)(8676002)(31686004)(8936002)(6666004)(186003)(66476007)(478600001)(86362001)(110136005)(38100700002)(966005)(66946007)(83380400001)(2906002)(36756003)(31696002)(6486002)(5660300002)(53546011)(66574015)(2616005)(16526019)(66556008)(45080400002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VGhYZGxFMXkwb2lQK29mOU1Wbnh1M3YwRWptdzdFUlFjeTFmUFdkd1dzZlNJ?=
 =?utf-8?B?ai9PM3dhaWpnUXNFQ211Q2FFOFZCRDVjK1RobWlWODNjNUUwUU10eWY2RlNW?=
 =?utf-8?B?R3cvdEFINERsNkM3SWNBRDB2TGJjcWxuSlRoTlYxamlNU3hOOWhWVkdsb1JT?=
 =?utf-8?B?WDVYby9qTm8wTEdpUURmZDdLL1IrR3UyelpuemZGMUhsQWc0WWtRS0VwVGhM?=
 =?utf-8?B?M0dEdlRVZk5lTTFmc1NFZ0ZCZFNwTTZlR1RZdXFFcUNNdUR0NVRQNzFGSVUw?=
 =?utf-8?B?MWNXb2s4MGxjblloUEJyUjRUVFlLNDlwSm9WcHUvVm1adFE2QmRhZGhXZFhr?=
 =?utf-8?B?Q3Q5aVpDNEhhc2NvOElSbC95eHYzWHBxWGxxNGo2RmRGVXJQbnQ2MUtpamU4?=
 =?utf-8?B?b0VQYW9jcG0zUWttWHM5NmJZemFmSVg2MkZES2hjdldnTmdmUThsb0gyTmRv?=
 =?utf-8?B?MHJlSmI0QndtS3lzOTAyOUNyR29LQ2EybEtqTC9IME1PbHJZbUJvemlGaGE4?=
 =?utf-8?B?MTlFM0ExRkF5RW5uNExhTDV3bXBFcGhHT242WUtYS2g2a055a2NQY3R2Tk8x?=
 =?utf-8?B?YUVxOWhuNXI2bmZ4VkVPaEQ2MGRZaVNpR1kweTJqc21WNzJuVXlEMWRBMmxM?=
 =?utf-8?B?MHhnREhMMzN3S21DM3VlYnkrMjdSTXpvMG1CTzhucVRsd3UyRjFodmZLMUEr?=
 =?utf-8?B?M3JORnBmaVhMQnVyT2lZRllpQnVoNkwvdExiMUdiRCttalBVZEo3NGY2VG1J?=
 =?utf-8?B?SlF2bEVRMGM5MHlDRGd3OWhqSDU4QzhDV3REWURMZ3IxQnQ5ZXMrd202QWRh?=
 =?utf-8?B?WE9oSmJjNzhON0RuRmNwOGQ4Uk5PZ0ZLeGJhSmJxZUtOeXdybVhKYVZQbnUr?=
 =?utf-8?B?cnhkVi9ESkRUZnNFa1Btem5BL3RDeVFnY2Yxb1RXaDBEa2h0eDQybFNxbEh3?=
 =?utf-8?B?WjZXMnZFeFhiNkxiTmREK2FFcnlQSG5hMUVLN3I5WkZkQ2ZaSVFaUkcrbUJN?=
 =?utf-8?B?WWhBdkhQWER2bTA5TmE3ZEgySzVacDMzL3Z4dWZiTkdEV2Q1ZC9CYWdRZ0dy?=
 =?utf-8?B?NFpqR1FJMXI5RFhZMTZnR0ZYTEJyYXQvei9NQUJFemw5eWRUbTB1dmg4dW5q?=
 =?utf-8?B?UStaQUpjbStMbEJ1aU9ZczFGREVUZHcwV3dkZjJ3bkRPcUFRV2dXUDA2N28v?=
 =?utf-8?B?YnZtY01EZTBKN3BWS0FHUGVnakYrVHpXVUg2WVZaNVY3MEFzaDBXNjVqZGp3?=
 =?utf-8?B?emtEZ1d6MjBYQWJ5Z25EVjNCUHk0U1ZCWE0xTDNaQk1VcEFqNUJaVHZIeGZU?=
 =?utf-8?B?TVdKcFpmbXNGU2oxdjV0Z291cHlqSHczeGMzNVZzYTdkaDMybGdRZmFVZXd0?=
 =?utf-8?B?eUFQSkNHSVpnL0RpY2FNM2FOazYyanV6MytFZVNIZCtOVWk0cG4xQVVOQ3Fn?=
 =?utf-8?B?UVFjUmUzYkJDREJyK015VndYYW5ZVG83a0NVQ082Ui9qcnh5SVp3dkhyeFRH?=
 =?utf-8?B?bFA4SU80Qm8xajZuaTF4R2lPUEZ1MHF4dk40RmJaT0NmMTFDMExpOGgreXdQ?=
 =?utf-8?B?bCtSVlNlVU92N0tER2dMVHBuUUhRZS84SHNEekFJeTBHZkdJRW1qTXpQVUV4?=
 =?utf-8?B?Yjg3RUNsN3p1UzZWZExTWUFMcHJtMFU4Y1UyU1V2NFpPdXptOG93V3RiUVRn?=
 =?utf-8?B?eVRHMDBvMlJYSnNQMnNWUUtCUmRmOTdva3FjR3oxeDZBYStTVHY5L1llMmtJ?=
 =?utf-8?B?V0RGd2pId1VEWXlNTzloVVo0TXhseVdOZE5KNVFTd000dmdwcGpJN1YxZmFJ?=
 =?utf-8?B?VU5naTlNMFgySXF1ZUovbHpkT1VkVHZ0U3NjTW5oZ3cxRTkwYjJNRXlOZ04z?=
 =?utf-8?Q?TbISUyoucTrvR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f703bfe9-661e-47cc-56bf-08d9242bf0dd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 12:02:19.4516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jlcmo23Jx0oqHssrXaoX9N1eZ4UlcETqjk0HHOp1dxGOwXNY9c7/BIZdw4++05au
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4566
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

Am 31.05.21 um 13:19 schrieb Thomas Hellström (Intel):
>
> On 5/31/21 12:56 PM, Christian König wrote:
>> Am 31.05.21 um 12:46 schrieb Thomas Hellström (Intel):
>>>
>>> On 5/31/21 12:32 PM, Christian König wrote:
>>>> Am 31.05.21 um 11:52 schrieb Thomas Hellström (Intel):
>>>>> Hi, Lang,
>>>>>
>>>>> On 5/31/21 10:19 AM, Yu, Lang wrote:
>>>>>> [Public]
>>>>>>
>>>>>>> Hi,
>>>>>>> On 5/27/21 3:30 AM, Lang Yu wrote:
>>>>>>>> Make TTM_PL_FLAG_* start from zero and add
>>>>>>>> TTM_PL_FLAG_TEMPORARY flag for temporary
>>>>>>>> GTT allocation use.
>>>>>>> GTT is a driver private acronym, right? And it doesn't look like
>>>>>>> TTM_PL_FLAG_TEMPORARY will be used in core TTM, so should we 
>>>>>>> instead set
>>>>>>> aside a mask in the PL flag for driver-private use?
>>>>>> Hi Thomas,
>>>>>>
>>>>>> Thanks for your comments and advice, GTT means Graphics 
>>>>>> Translation Table here, seems
>>>>>> a general acronym. TTM_PL_FLAG_TEMPORARY may also be used by 
>>>>>> other drives.
>>>>>> I have made other patches for this. Please help review.
>>>>>>
>>>>>> Regards,
>>>>>> Lang
>>>>>>
>>>>> My point was really that the flag naming and documentation should 
>>>>> reflect what core ttm is doing with that flag. If there is no 
>>>>> specific core TTM usage, IMO we should move it to a driver 
>>>>> specific flag to avoid future confusion. In particular a writer of 
>>>>> a generic TTM resource manager should be able to know without 
>>>>> looking at an old commit message what the placement flag is 
>>>>> intended for.
>>>>>
>>>>> So here we add a flag where core TTM forces a bo move on validate 
>>>>> and that's it. And that appears to be how it's used when an amdgpu 
>>>>> bo is evicted to GTT, (btw should it be accounted in this situation?)
>>>>>
>>>>> The other use is to force the amdgpu driver to temporarily accept 
>>>>> it into GTT when there is a lack of space, and IMHO that's a 
>>>>> driver specific use and we should allocate a mask for driver 
>>>>> specific flags for that.
>>>>>
>>>>> So shouldn't this be two flags, really?
>>>>
>>>> Well one flag makes sense for the use case at hand that drivers 
>>>> want to signal to TTM that an allocation is only temporary and not 
>>>> considered valid.
>>>>
>>>> That we then use this flag to implement temporary GTT allocations 
>>>> to avoid problems during eviction is just extending that use case.
>>>>
>>> OK, but it looked like there were actually two use-cases. One for 
>>> possibly long-term VRAM evictions to GTT, the other for the 
>>> temporary use-case where the hop resource allocations sometimes 
>>> failed. Or did I misunderstand the code?
>>
>> Ok sounds like we need more documentation here. That's really one use 
>> case.
>>
>> Key point is we need temporary allocation during multihop which 
>> should be handled differently to normal allocations.
>
> Yes, that part is clear from the patches. The part that I can't fit 
> into that pattern is why the evict flags when evicting from visible 
> VRAM to GTT or ordinary VRAM is marked with TTM_PL_FLAG_TEMPORARY. 
> Wouldn't those remain evicted in that placement until re-validated to 
> visible VRAM at an unknown future time?

Not necessarily.

The situation we ran into was the following:
1. OOM on VRAM, we try to evict.

2. GTT space is used up as well, ok evict directly to SYSTEM.

3. For VRAM->SYSTEM eviction we use a temporary bounce buffer.

4. Waiting for the bounce buffer to become idle is interrupted by a 
signal so BO is still backed by bounce buffer.

5. Next CS, BO is validated with VRAM|GTT. TTM sees that it is in GTT 
and doesn't move the buffer.

6. CS goes into nirvana because bounce buffers are not meant to be used 
for CS (we can ignore alignment and accounting for them).


>
> Patch 3/3:
>
>              amdgpu_bo_placement_from_domain(abo, AMDGPU_GEM_DOMAIN_GTT);
>             abo->placements[0].flags |= TTM_PL_FLAG_TEMPORARY;

Thanks for pointing that out, this is indeed still the wrong place. 
Going to fix that.

Christian.

>
>
>
>>
>> Christian.
>>
>>>
>>> /Thomas
>>>
>>>
>>>> Christian.
>>>>
>>>>>
>>>>> TTM_PL_FLAG_FORCE_MOVE
>>>>>
>>>>> and
>>>>>
>>>>> AMDGPU_PL_FLAG_TEMPORARY
>>>>>
>>>>> Thanks,
>>>>>
>>>>> /Thomas
>>>>>
>>>>>>> Thomas
>>>>>>> -----Original Message-----
>>>>>>> From: Yu, Lang <Lang.Yu@amd.com>
>>>>>>> Sent: Thursday, May 27, 2021 9:31 AM
>>>>>>> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>>>>>>> Cc: Koenig, Christian <Christian.Koenig@amd.com>; Huang, Ray
>>>>>>> <Ray.Huang@amd.com>; Deucher, Alexander 
>>>>>>> <Alexander.Deucher@amd.com>;
>>>>>>> Yu, Lang <Lang.Yu@amd.com>
>>>>>>> Subject: [PATCH 1/2] drm/ttm: cleanup and add TTM_PL_FLAG_TEMPORARY
>>>>>>>
>>>>>>> Make TTM_PL_FLAG_* start from zero and add TTM_PL_FLAG_TEMPORARY 
>>>>>>> flag
>>>>>>> for temporary GTT allocation use.
>>>>>>>
>>>>>>> Signed-off-by: Lang Yu <Lang.Yu@amd.com>
>>>>>>> ---
>>>>>>> include/drm/ttm/ttm_placement.h | 5 +++--
>>>>>>> 1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/include/drm/ttm/ttm_placement.h
>>>>>>> b/include/drm/ttm/ttm_placement.h index 
>>>>>>> aa6ba4d0cf78..9f5cfc7c2d5a 100644
>>>>>>> --- a/include/drm/ttm/ttm_placement.h
>>>>>>> +++ b/include/drm/ttm/ttm_placement.h
>>>>>>> @@ -47,8 +47,9 @@
>>>>>>>   * top of the memory area, instead of the bottom.
>>>>>>>   */
>>>>>>>
>>>>>>> -#define TTM_PL_FLAG_CONTIGUOUS  (1 << 19)
>>>>>>> -#define TTM_PL_FLAG_TOPDOWN     (1 << 22)
>>>>>>> +#define TTM_PL_FLAG_CONTIGUOUS  (1 << 0)
>>>>>>> +#define TTM_PL_FLAG_TOPDOWN     (1 << 1)
>>>>>>> +#define TTM_PL_FLAG_TEMPORARY   (1 << 2)
>>>>>>>
>>>>>>> /**
>>>>>>>   * struct ttm_place
>>>>>>> -- 
>>>>>>> 2.25.1
>>>>> _______________________________________________
>>>>> amd-gfx mailing list
>>>>> amd-gfx@lists.freedesktop.org
>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C124823f58ee741684d6a08d924260567%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637580568009117976%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=d8k0c8SAcGGp1m4mEmA8nDrM%2FH6b5Mwo9u%2BzR9jiw3A%3D&amp;reserved=0 
>>>>>

