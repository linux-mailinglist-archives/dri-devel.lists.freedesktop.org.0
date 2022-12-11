Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFAE649294
	for <lists+dri-devel@lfdr.de>; Sun, 11 Dec 2022 06:52:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3968F10E0A5;
	Sun, 11 Dec 2022 05:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7AEE10E09A;
 Sun, 11 Dec 2022 05:52:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oc+Qnz28Hl4FM6HFZLj6VsIYUyMsB480zqBX0WQ+9TLNGZqoyDfOzg3ZFb5cGH/HCeLVJr2Z55a3DShSQwvIriFGlrc0RguGQ5HZnXN84Mj3t2WFemEiolt9Y+F37ll6BIHr7cgrc3eU/WLx5JvPF82EruG3D7tOZRUnwv/VKq29vEKJRgWNqbL7Ld0GNA8BqL2E5pFupj00yf3HzE1YV1sE0woamrSSz6KVd8mQBCb5wL2e7CYS/KvI+OabR9cU1mfKPI0gHXZCOMatFF1r3yiI0GZvmCktyautS2QNxaFU1KmTWzahnyyukLmQxLIx2JLs8To9x1S9ACUtzE5izg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V90SwFEmm2KDzVQTEH13KUuXQ+gukaG9SvLg6RCIt68=;
 b=gZ3ZZ5XzmA50rKfknw7mmlEKGpF0WL8WtVcNnWRx7RQtiASvTWVe0yuPb1nxo6JI2OomEIPpljlGrS6pd72lkW8UUtA8Xnj4t4d0Fju1R3ZC3yjco7/CxudbYJsPMQ9x+1sefv6cKqSIVCNSGE2IPzOR8RAraidaz5tjYUP7KjsXEFn8j6kxVXw4jUxk9uD9Qo/Y3t+XVSvadKtJkPGp/XEu9bznciQulmEE1NrHTYcaYx3Pgld+o3BsQhPu0niDxj+hVUUmwSaLObzyljXep40aZvTxl03dGAbuysh+5Cl+hrjlTzfe3urfiu8RnGsJ3RSUpyHtBN31I6whdtLX1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V90SwFEmm2KDzVQTEH13KUuXQ+gukaG9SvLg6RCIt68=;
 b=lpXxPkyxFjLj9PNeeOXXTm6WJafUFh/VSK0M1i79mzDteiDtVnsXUtyVwKkR6z4x9PojWGBai/V1ouUvclgjLL8dZEpglCTEQY6F9t+uQ+bB9AhgloP4Q9bnDcDa0DNvT+vpQAvCO3KK7M9KntkBUNRhJCAne16h8scndn6AT6M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MN2PR12MB4110.namprd12.prod.outlook.com (2603:10b6:208:1dd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Sun, 11 Dec
 2022 05:52:20 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::2fd1:bdaf:af05:e178]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::2fd1:bdaf:af05:e178%3]) with mapi id 15.20.5880.019; Sun, 11 Dec 2022
 05:52:12 +0000
Message-ID: <2b7cdb48-303c-2de0-60db-95d2fa204150@amd.com>
Date: Sun, 11 Dec 2022 00:52:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
To: Mikhail Krylov <sqarert@gmail.com>, Alex Deucher <alexdeucher@gmail.com>
References: <CADnq5_NTyvZR16_N0TzMo3f9Mg6EwOuwuBgYzDA=U7tur7Fmnw@mail.gmail.com>
 <Y4UelMnRkY7/0G6U@sqrt.uni.cx>
 <CADnq5_MactA_n4sTKZ_-TpYFZnOfEeygHF3r+zH94By2Dm86cA@mail.gmail.com>
 <Y4YsWo8MPAeg9DRQ@sqrt.uni.cx>
 <CADnq5_MNmOHVuszVfCZ8Ajm85Wb5roe4-20BEXXzsEVpAC_Rkg@mail.gmail.com>
 <Y4Y9SJC7gtUxP4+R@sqrt.uni.cx> <a5f73cfa-bd2a-3ab8-1e5c-253cfd832ea7@arm.com>
 <CADnq5_M5ScTd0AYddRBRiEupxRsV16eHFnLnZ3QYzE5gyMPqhw@mail.gmail.com>
 <adf4a9b2-c30d-1e74-9848-7a63b3e0c674@arm.com>
 <CADnq5_PCGVhpk0TpnJKBx7BODV8xWk4hAyXM27tCxBpyS2y9gw@mail.gmail.com>
 <Y5SmlC/h3aT8VEx7@sqrt.uni.cx>
Content-Language: en-CA
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: Screen corruption using radeon kernel driver
In-Reply-To: <Y5SmlC/h3aT8VEx7@sqrt.uni.cx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0148.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::9) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MN2PR12MB4110:EE_
X-MS-Office365-Filtering-Correlation-Id: abfc29f9-6307-417f-23b7-08dadb3bd94f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PHP+bt81KqHcrEOQdxR32M30hFO473EoPDhtsMnmxzqNWHxA10Kbrwry21v8VRs7kmbgywVXIRZsFSI42q2BBfXbN/N22WVOREpjHqqbbDyeQ/iLkFiOPL7akT/MbMPponm8SuWydfjCs/mynT4twXO+/uPvcdnsfJQU3etY6G3LSt/rVfqjFgMiIBLmAp2XI47WLwXqzSOP79Cr0DeKxM6hEHX+nLvtqBlF83CJLkFI/a5Sx1V/tCROkC9CtGt6D+chKoaSwGyQkbsVfd9v1F1ykXVJI0M1mzGzJzA8Fz46QI9oWYzVfol/HLPpMfY9rcVmEZk1GhUSCIHbZSRc7jHc415ZFYCp6N/m2TSI6NVUJO2S3SgZUDydC4sujMjkd2lRzgbDW9QqtojA5qkdNz4JGQ+Mt1JtyVlCxbe7+tOh+0xXET0KPgLfj/v0ZmF+ibXql9UiVpQsEDsc8lLrK3Qx07CDeoxphfSg43cUFgqWny9gWubTOz5b3nC/3X0S7dxd+yQ2UTUu8qMyFv0c/iEn1SZZaH6B2LnSMxKPws+jI+N7gYHKaU4NvXlYT4SjclcUpM9LkYlJXKHYhwtQK0dw+dJApF6z9rVhQCqXUEoK+2KSJBXNa9HjKZy7BAqnvnj67Qn9yfkNonb2GYgM1dcq3aE8gadZeCDs8l3mDc4f6zWWerwcYWM/aPca5npmreyMwKbj1bRDVA04rq3p49EqxJo7/npDVwUjCRob/CCjsdvgrMJLQLl+ptAvZ9fd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(451199015)(38100700002)(36756003)(86362001)(31696002)(26005)(6512007)(8936002)(31686004)(316002)(54906003)(478600001)(110136005)(966005)(6486002)(6506007)(53546011)(5660300002)(44832011)(83380400001)(4001150100001)(2906002)(41300700001)(186003)(2616005)(66946007)(66556008)(4326008)(8676002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEJiZDR5bVh3MEdzMEN4WWJTVVNiK3E0ZjRhMFFvZDNvc0ZKUThjU2RuUzRB?=
 =?utf-8?B?bHMydmh4N01vT2RKeVg2MTJhMzVoRjlPdU9NVUp5d0pSQi8xancrSjYxeFlu?=
 =?utf-8?B?ZENzOTNlUHdZMlFOZmRjYVJtWjRRRkRrWUxFNnp3Q3lCWm9IUENSZ25ndGpt?=
 =?utf-8?B?ODIxblR4QUFPWjdBQ3FFOFM5cHl4cXYyWkVGMysvT0xFd2tBd3I0UGp3SGty?=
 =?utf-8?B?R3grdkZTd1hodjNTSWdlTDdrN2hudm44VnVrMW1Nc21aZ2NlZXVyK25CMFlO?=
 =?utf-8?B?NlorWWJQZFVPNkxmdXQrR1A4YWt5cGhjRW9KeEtnbUk5V1F5SW55ZkIxYTB1?=
 =?utf-8?B?Q0hKdlJtcDRXc1hvTmliR2xzbzdKWDZzMzIvTHM1WWZEVU9OZnlBYkNQd2R6?=
 =?utf-8?B?OHhhMExRSlFlYjhWNytUeEZXVnYwb3MvU0R1aC9UMktMY0EyczdUZEU0dXhy?=
 =?utf-8?B?cGJPejRhZWUxS3RHUTRkMjhYTG4xN3hnSE5IamFRbkFhWWRpWFQwZGxFbjUv?=
 =?utf-8?B?WGt1djVFYTBvaDFCYUNHMVB1ekEyejF0QkZpRzNaWnNKSXJNMVIrR1dybk0r?=
 =?utf-8?B?WXVDYVRzU01HOWxuN2VWR09vZklLYkF6cWVvdlM3MXMvS0JiSkVjOWJnSXBD?=
 =?utf-8?B?UThTc2tmakliQ3JHcW1hWkZxV2srL2o4bGk5K0tFekdYcHpKdm03VkhkOXZB?=
 =?utf-8?B?bUJ6SmoyM1UreFc1b3hJdUZod3RmL01tMTdJMnI4b1pTMWE1R2tyd1BPaHIw?=
 =?utf-8?B?RHFlUFhLeURwUFdIcmw4T2IxaVc2YlpNREJRdU1iL3E5Z2oreHVFR3haTnVH?=
 =?utf-8?B?UW1SSVRTRE1lSm5aak5WNy9XUkoyWWh1aDhLTUJ2eFNRajVUNU14a3d0V1lH?=
 =?utf-8?B?V1R0RC9GM1lQR1pjK0ZzcVFaTGRuU1htRHRHU25zYWhXTzVUTHJldldGZlli?=
 =?utf-8?B?UkZ4SzJ4TG8waVljZjFtbFhLV3JIaXV0eVJKU1hDaUhNaS9rTUdrOXVNbm1s?=
 =?utf-8?B?YlVoWXhxcFpzZ0VIdWdBVDBPQmNnTHRucDJ5bGRvUDQwMThTeFlyZmJud2Vm?=
 =?utf-8?B?NHFRM3NqTENXdGEyWEc3V1lvcmI3Vjg2c1YzU2NkUVE2U1pqWmdKbkl1UEJn?=
 =?utf-8?B?TzFVZDNzdERmSVhpYTVCeGVuYlZsUzNLMUlhRXNoUzhqejluanJnR3hwZ2la?=
 =?utf-8?B?ZS80YytGYU00MjJuKzdWZTM0L3JSN0VYd3NTWGtxa0FrVzQvT3NhenhybmFT?=
 =?utf-8?B?UGtwMVllbTdGYk5kSUZzTnRHNXV0bnlhWGVqQVhnQUJWdDI5S3BxSjBsdG1S?=
 =?utf-8?B?UVBXaG8zVElYY25QNWZpUUtGblhRWE93TnhoUkJuVEJMQlcyL3cvRGRtU0I1?=
 =?utf-8?B?UFJtQ2tJU21FbnBscDRZSE0wNVIvTG1salhpZVk1aklSQTJQb3RsbTZRbm50?=
 =?utf-8?B?dDlIQXpiQmJWK2hHTnJ4cnpDM1QxdG5JZ2F3NmhHc1djQnYyeTZMY3hodnA1?=
 =?utf-8?B?MldaUFBHKzFhSlFSc2pMQktxUjZDeXV3THJ3RnBJbzlRaFlncGZWTVkxd21Z?=
 =?utf-8?B?Qmk1QTd1dE1rYXdWd01WRXVUUnBJSk9iMnV1MmRvaUxSbUc3Zk1FZ2JYcWdt?=
 =?utf-8?B?b1dDSVNzcW9hR29NS012MmNTNk05dm54ZHNBMEFFL3ZJd25WVGlTNkFlNWJU?=
 =?utf-8?B?WnRqcTdQb1Z0QUMrVUUrNHpScVNsMWRrNHI4ZzdRUXYvNkN4dnhtVXVCK1Mx?=
 =?utf-8?B?bXFBMHNuWVR4SHdDdExITFVZVllERURGTGdHRXROV3FLY3ozKzROQ3dpOEVm?=
 =?utf-8?B?bHZyQWpLV3hNaVQwd3ZGaHN3SGZiNUtQbDgrYjV3ZjM4cWNTenYxTk5xRGox?=
 =?utf-8?B?OTdSdEVKRUM2T3ZHR0dVMVlSVG54OEVmVXVkOENSOU9kZklINFd3ZlFMQk95?=
 =?utf-8?B?bEZWQXRkMDNmTzVuMHlhbVExMmJJZVhMQ08zQWtOZ0wxWGdDZjBxb1lLMWlC?=
 =?utf-8?B?dnVuUlQzRGlocm1pRytmZCtzYUtQVmdRd01iK084TExxQzRxM3FhRzlqeWNQ?=
 =?utf-8?B?cFBwN3ozM0czWE9DNzFPWWdYeUwyTnI3TmF6eGJFNXRrSnQycGVTVjZCSnMw?=
 =?utf-8?Q?+Tgo0uvs0Gje7KwSHcqGu4Tts?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abfc29f9-6307-417f-23b7-08dadb3bd94f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2022 05:52:12.4710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0SXhXtKUJfx9nPslu3BB5LI385nildrxGgt/pxEeUHh5S+a1uiGVAX3y5HpvqmX
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
Cc: Robin Murphy <robin.murphy@arm.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-12-10 10:32, Mikhail Krylov wrote:
> On Wed, Nov 30, 2022 at 11:07:32AM -0500, Alex Deucher wrote:
>> On Wed, Nov 30, 2022 at 10:42 AM Robin Murphy <robin.murphy@arm.com> wrote:
>>>
>>> On 2022-11-30 14:28, Alex Deucher wrote:
>>>> On Wed, Nov 30, 2022 at 7:54 AM Robin Murphy <robin.murphy@arm.com> wrote:
>>>>>
>>>>> On 2022-11-29 17:11, Mikhail Krylov wrote:
>>>>>> On Tue, Nov 29, 2022 at 11:05:28AM -0500, Alex Deucher wrote:
>>>>>>> On Tue, Nov 29, 2022 at 10:59 AM Mikhail Krylov <sqarert@gmail.com> wrote:
>>>>>>>>
>>>>>>>> On Tue, Nov 29, 2022 at 09:44:19AM -0500, Alex Deucher wrote:
>>>>>>>>> On Mon, Nov 28, 2022 at 3:48 PM Mikhail Krylov <sqarert@gmail.com> wrote:
>>>>>>>>>>
>>>>>>>>>> On Mon, Nov 28, 2022 at 09:50:50AM -0500, Alex Deucher wrote:
>>>>>>>>>>
>>>>>>>>>>>>> [excessive quoting removed]
>>>>>>>>>>
>>>>>>>>>>>> So, is there any progress on this issue? I do understand it's not a high
>>>>>>>>>>>> priority one, and today I've checked it on 6.0 kernel, and
>>>>>>>>>>>> unfortunately, it still persists...
>>>>>>>>>>>>
>>>>>>>>>>>> I'm considering writing a patch that will allow user to override
>>>>>>>>>>>> need_dma32/dma_bits setting with a module parameter. I'll have some time
>>>>>>>>>>>> after the New Year for that.
>>>>>>>>>>>>
>>>>>>>>>>>> Is it at all possible that such a patch will be merged into kernel?
>>>>>>>>>>>>
>>>>>>>>>>> On Mon, Nov 28, 2022 at 9:31 AM Mikhail Krylov <sqarert@gmail.com> wrote:
>>>>>>>>>>> Unless someone familiar with HIMEM can figure out what is going wrong
>>>>>>>>>>> we should just revert the patch.
>>>>>>>>>>>
>>>>>>>>>>> Alex
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Okay, I was suggesting that mostly because
>>>>>>>>>>
>>>>>>>>>> a) it works for me with dma_bits = 40 (I understand that's what it is
>>>>>>>>>> without the original patch applied);
>>>>>>>>>>
>>>>>>>>>> b) there's a hint of uncertainity on this line
>>>>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/radeon/radeon_device.c#n1359
>>>>>>>>>> saying that for AGP dma_bits = 32 is the safest option, so apparently there are
>>>>>>>>>> setups, unlike mine, where dma_bits = 32 is better than 40.
>>>>>>>>>>
>>>>>>>>>> But I'm in no position to argue, just wanted to make myself clear.
>>>>>>>>>> I'm okay with rebuilding the kernel for my machine until the original
>>>>>>>>>> patch is reverted or any other fix is applied.
>>>>>>>>>
>>>>>>>>> What GPU do you have and is it AGP?  If it is AGP, does setting
>>>>>>>>> radeon.agpmode=-1 also fix it?
>>>>>>>>>
>>>>>>>>> Alex
>>>>>>>>
>>>>>>>> That is ATI Radeon X1950, and, unfortunately, radeon.agpmode=-1 doesn't
>>>>>>>> help, it just makes 3D acceleration in games such as OpenArena stop
>>>>>>>> working.
>>>>>>>
>>>>>>> Just to confirm, is the board AGP or PCIe?
>>>>>>>
>>>>>>> Alex
>>>>>>
>>>>>> It is AGP. That's an old machine.
>>>>>
>>>>> Can you check whether dma_addressing_limited() is actually returning the
>>>>> expected result at the point of radeon_ttm_init()? Disabling highmem is
>>>>> presumably just hiding whatever problem exists, by throwing away all
>>>>>   >32-bit RAM such that use_dma32 doesn't matter.
>>>>
>>>> The device in question only supports a 32 bit DMA mask so
>>>> dma_addressing_limited() should return true.  Bounce buffers are not
>>>> really usable on GPUs because they map so much memory.  If
>>>> dma_addressing_limited() returns false, that would explain it.
>>>
>>> Right, it appears to be the only part of the offending commit that
>>> *could* reasonably make any difference, so I'm primarily wondering if
>>> dma_get_required_mask() somehow gets confused.
>>
>> Mikhail,
>>
>> Can you see that dma_addressing_limited() and dma_get_required_mask()
>> return in this case?
>>
>> Alex
>>
>>
>>>
>>> Thanks,
>>> Robin.
> 
> Hello again, I was able to confirm by adding printk() to the functions
> and recompiling the kernel that dma_addressing_limited() returns
> *false* on the kernel with the bug. 
> 
> And dma_get_required_mask() returns 0x7fffffff, as I said before.

Yes, dma_addressing_limited() evaluates to "false" in your case,
and this is the correct answer according to the function's comment:
"Return %true if the devices DMA mask is too small to address all
 memory in the system, else %false."

In this case the device's DMA mask is 0xFFFFFFFF and the mask
for the 1.5 GiB memory is 0x7FFFFFFF, so the static inline
returns "false". (dma_direct_get_required_mask() returns this
for your memory size.)

It would appear that dma_addressing_limited() isn't answering the question
which the last parameter to ttm_device_init(), "use GFP_DMA32", wants
answered. Perhaps we should use another method to make sure that that
parameter is set in the scenario in question.

Regards,
Luben


