Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 496BB87B7CF
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 07:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E72110F8BD;
	Thu, 14 Mar 2024 06:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LQnKkTHv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2EAE10F8BD;
 Thu, 14 Mar 2024 06:10:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Td52dCOIBGhPKj7UIUu2Dpuh+jlRn7G55GKaiHMdkot2zSWHaVaOOtP3qqS09QUA+xk+WYDV75S6wQ/O44KegI0kwh0+ggxwURNDtC9Q+jaNkNL2FysFRN8bbO1PV5AVI4ZlzN/87PbmGJgmRaR2KaR+yaUdvp7Ri8ip8EbpmpJLZcO0Ev7TgrNp086FmvRw0rlGVcjSZdkKH9yVPwatTuEnc4kvSKtEcqCCFLyOoK0pT5Ed/wJslMCzMe9vCe3moguqlaNGGdlOa+zBL2fMGnA3eiauwUXqgNawp+SoZ2xZPXs2wMcMGDK3GMUx3QMEUO6zGKKuFN95IzY5oxJoCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mo7u6BYuMm3iowu8MvZmwOqVo3RO1hkjFR1Xu+pVNJI=;
 b=k1mzaVTJvFn9x2qPb5rTmh20ARd1jbwtdMxtSoUefudYch6bzSddervEs6kN4nMLh0BGO+iatqbcKVIOI3AYmTbTzjWjh3zpYYN35qHZ7rfi3z0G0zC0rIBso/r34TXlABOrM+9lcVqyNtWkrp3p4ngroYmIInVgnHbBldHgp7zFX0cBtRsfH6TeH34ADiUInfZjWQ/o6LU0i6d//vMet461AEfLsFcYDvvwrInE23HItxleCC7qqQPaONGg8rFJFTgPqnJi05HDgYxhfFcog5zTIOsm6qJONXF4sbGEL2T1r5GhYcwMNczSbdCV660+09LIMeqYGrqba8Do5av45w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mo7u6BYuMm3iowu8MvZmwOqVo3RO1hkjFR1Xu+pVNJI=;
 b=LQnKkTHvEoBicpui/G27sESB4seGA1HwwBu0VKuzMUC3gdouB7MPegqclcDiuyiUdXfbIMKgZ8xQ0231KVhPXcvRvxHtxqV9cjq28TXBJ0T+ysIMmzlFG36Ci12WgHWNV7zLbb8HD7C8euVKBxcFATBEIR80sihpC3jyZshr1ws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by MW6PR12MB8998.namprd12.prod.outlook.com (2603:10b6:303:249::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Thu, 14 Mar
 2024 06:10:30 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::966b:7f50:4f07:3c8b]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::966b:7f50:4f07:3c8b%5]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 06:10:30 +0000
Message-ID: <0ee30d3b-0dbc-3eb6-a19c-abeb85cbc883@amd.com>
Date: Thu, 14 Mar 2024 07:10:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] drm:amdgpu: add firmware information of all IP's
Content-Language: en-US
To: "Khatri, Sunil" <sukhatri@amd.com>, Alex Deucher <alexdeucher@gmail.com>, 
 Sunil Khatri <sunil.khatri@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240312124148.257067-1-sunil.khatri@amd.com>
 <20240312124148.257067-2-sunil.khatri@amd.com>
 <CADnq5_ON0NfcpmnHKjNYWgxfvfz-J3tgjX92DaaN63iKb+FOZg@mail.gmail.com>
 <498b87fb-727c-4ea2-9633-6ecbff436eba@amd.com>
From: "Sharma, Shashank" <shashank.sharma@amd.com>
In-Reply-To: <498b87fb-727c-4ea2-9633-6ecbff436eba@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0266.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::14) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|MW6PR12MB8998:EE_
X-MS-Office365-Filtering-Correlation-Id: f59fd58d-e7b7-4952-4552-08dc43ed7336
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZRTtKm6Y6NuiBtS1XUBXGsvqtVcDxxyOgJHd986glfYgYmoX5Gqt3x1BpgaoPZMs3EaNUJVA3KqAGiWBo4jNqxE7uAU9+LcXcXWLkcqjLkzaLx61R1Xj8t7IDJSBMudkgjiMaLAMAlRSTt/Mf2EZCC+y9XpWHGLVZfOfj/c6H3lRZSxw054ZoRuO9FqG8d+jSu6MdbmVdYHHk48Z6/4v2Gh1apPiiixZrskyFyNdAcqols9mNqWE8DVcGPeu62jCvoO30sEwlYCvBpWrb20HqghL+7pY1irdXWld/y02HUijwlK84kOXCuuqLTvBXNORL5E713ISBcnumI8zmT9V5BxTiVkjkL6SJRrY2YWQWChewTEWRL3J1KtlVEs/ZFInMkTSfc/noysKCqNGbxD+Ftc4LPWwq71HqPw3fDQVWXrOB1x9LcCqGShl0z1pRBVdLBsYtli6N0GwWXWUIvO9sXeS6MKET61d3xDy2lt+1qgRZomzjxSZAfrUbW7gu1rCi7jN0ac6uGD+hNgCHv70SIr1WvzCsioLROCJiQ1l2G6QBeRiZ+PJbYyQn3H31t4JD8NSY5wkS5JyILRvBKueNhgMUNAgXLkv0mFaXILMlpDzGXNg/wUKoN7wN5fA7laBjDhSFUuIqr12k7zy8LkUvzM1L7iuFKTIbG0p3Ppxis8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDQyMkFVaTBtb05mUXpkeDRlcGQrZ0Zud3Bkelo4enpQejE5Qkc3eEQ5RU05?=
 =?utf-8?B?QnRMMXZ5YXZaZ2cxR1N1c2VJK256SmNVTkhRRFg2WVdhZS95eHJJaGNPUCt5?=
 =?utf-8?B?WUF3emVYTmVvYlFnL0s0VTdYMEx1NGFFQ1Bud2F2OUdsY3MwNzdmRlBnWG50?=
 =?utf-8?B?UFBkWG5Bc2d6NkIzSjFmRGl0TkY4bEhHQ3oxa09rMkcvdGxvUHJ3T2Z2bTBz?=
 =?utf-8?B?MHhnVkhoZWcvbURlTTB2SEhONTYyT2lZU0p2RW1ZVXA4aXJuSTI0akJlN3Zy?=
 =?utf-8?B?RnV0ZlFsNDVLaWFRR0tvbEY2WXhjRENEUnlzM1FKeERkR1BsUUN2Y1lqdEpM?=
 =?utf-8?B?eEV3STdNTldRRGhTMmtKTUplWHB5aEgxVUY4ZlluMWhzMTIzRFRUbXlQNTUx?=
 =?utf-8?B?WHlvL0xwN2VPMHBTT1RmNFNQK3FqTkV6S2N0ZXVwRDN3cWFtcnM5YkpLQUVZ?=
 =?utf-8?B?YWxQNUpoamhXRWx3UlhmdkVkQXIxMVdqVm1zWmU3eUd6UHJLa0pqT2xyK2tF?=
 =?utf-8?B?Rks2WnZZbVpBTS9JWGpIbXh2UDdqSHVCU3Jjb0xNTWN1MWN0M1M5RjZ6VGlt?=
 =?utf-8?B?dVZSZ1lTeUhHTFFxTDdWSmdBNWNKaURlYU9pNmlRMis4YS9KTWliS05iMTZN?=
 =?utf-8?B?L0ZJa1djc3JBTXlrMDQwOHZqUHo1cXpkVmJzVU02QmVYK21sWXhpUlQvbFdW?=
 =?utf-8?B?NHNnOTZESXkzNzNNNFljRlc3bmtJZ3JzNm9MR1ZINWJPVUpFYmVrSW1LY1Rz?=
 =?utf-8?B?VU9DK3ErU212UkluT1U2dTBMNWdkNUN4T3RlYUtNdGFlNWt1MCtRa1hCbHJi?=
 =?utf-8?B?RFE3T01CblRxSEM5TkRmZW1ZUHEwZDJjaDZHaXJpazh1TFlYdnFkSlRSbHBB?=
 =?utf-8?B?VWR4S05XQ2pGNnhQZEo3QlJHZis1L0tWalRXUWZhdWZldHVNRjIvMUtaUFBD?=
 =?utf-8?B?cEszRW9MNTU0cUdCRFl5ZVBBSy9UaEljNGE2bk5lREw4SzRFQVJjY0JjUlB4?=
 =?utf-8?B?Zmx1R2VUQm1sdkw0aUZqVmVDOHV4Vk5vQnNZaTJONTdNMnppN1ViOXR0T3Bk?=
 =?utf-8?B?RWEvdU90SXdZZTV3VkR2OWlMYWhUS3lCYjZNdzhrYVZNVXNEUUJLeVo3cjB5?=
 =?utf-8?B?TkY4MUZZcTBWU096N09DL1lDUG83dWJYOHpqelM5UDFHNzJJL0pvR2UyTWpQ?=
 =?utf-8?B?S25ZZDd5L2hmU1BDWnBWcVBzcmd3eXNPTzNCb1duNnBXeEVMZUQ5N29iWW1Z?=
 =?utf-8?B?cGZUbDI5OXhXa2pMeHhjWWlnTnI4eUI3K1pCMXBoRmU1Zkh2eUNkTTROUWsz?=
 =?utf-8?B?WnlkcVFCUDZmY0lrZVNhMllWY1B3UGs5NlJFOXhQL2pDYVRIbHI1RXRZSjFj?=
 =?utf-8?B?LzhvZmRyN2pHL0FGYzFyYlBYODhPVDVWZngySDV1ZmRIVnEybkVOODFJRWJ1?=
 =?utf-8?B?cUI0ZzZRUm1JNkZ2Q3k2NkVNWTV2N3RqNWRoRkVwbkNaeWdUMjAyMHVDM25j?=
 =?utf-8?B?b3F4YjIyZnFIYlRqcEx6dk0vaUtidjlKMGtnekRpNy8xaUpBTnJDclVwNng5?=
 =?utf-8?B?SWd5Zmc0ckQzWmg1cG5FS3hyUjAvVkZxSERmYm9VKzBWeWVBeE1hZjJpdzBa?=
 =?utf-8?B?Sm5XS2FJTG43bklUbFhzWW5Ed1BYRzNXVXl6b0V1S2xZSjZZTElna1pQVk5y?=
 =?utf-8?B?Yk9VR095Tm92ZUdTZFNhc0k5cE82eDNPMkRTYWJpL2pQeWhlUEEvaS9QVHor?=
 =?utf-8?B?QnlTbk1ITHY0aC9HZVVVRUhiT3BBbUZJRlF2YWFFSGEzMy9GUEJFcEZmazBS?=
 =?utf-8?B?RVhwaXp3NnJNTWVhOUtqV3dsa3ZHS2ovOGZOb01KUHR4WVViR3M0QnM2T1Jh?=
 =?utf-8?B?TFRGVVg0Nk5jTFhHUFpBc1BtYW9jbW16bXY5S3NxcThIVUF4QUhpY0ZUcmJq?=
 =?utf-8?B?OVlOa0xKTXA5RGowS24zQWxEaGp1Z2FTU3JDQm4wMjhTeVdjMjVYakxHVXZN?=
 =?utf-8?B?Q1E2V0JpNGxvV3JLVDNoU3JSakJXTCt3VVd4RkFaOUZpa1dlRHRQTGVhdkhE?=
 =?utf-8?B?aHpyYUhGaXJkZEVRV2QvVTRkelJzbUZTazQ2bmpqc3gvT1VsbnRHMUc4Q2lK?=
 =?utf-8?Q?57o1t7oL19Y9aFxANdp8OfR4u?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f59fd58d-e7b7-4952-4552-08dc43ed7336
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 06:10:30.1486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BSIXkw4GtEelxR7StK3vkcqkwE/VHTagiemrFeHpG7nA2uJZ6wZZyc/4vUGjPEM8lrzlZFwfaUyFk0bUB4TOVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8998
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


On 14/03/2024 06:58, Khatri, Sunil wrote:
>
> On 3/14/2024 2:06 AM, Alex Deucher wrote:
>> On Tue, Mar 12, 2024 at 8:42 AM Sunil Khatri <sunil.khatri@amd.com> 
>> wrote:
>>> Add firmware version information of each
>>> IP and each instance where applicable.
>>>
>> Is there a way we can share some common code with devcoredump,
>> debugfs, and the info IOCTL?  All three places need to query this
>> information and the same logic is repeated in each case.
>
> Hello Alex,
>
> Yes you re absolutely right the same information is being retrieved 
> again as done in debugfs. I can reorganize the code so same function 
> could be used by debugfs and devcoredump but this is exactly what i 
> tried to avoid here. I did try to use minimum functionality in 
> devcoredump without shuffling a lot of code here and there.
>
> Also our devcoredump is implemented in amdgpu_reset.c and not all the 
> information is available here and there we might have to include lot 
> of header and cross functions in amdgpu_reset until we want a 
> dedicated file for devcoredump.


I think Alex is suggesting to have one common backend to generate all 
the core debug info, and then different wrapper functions which can pack 
this raw info into the packets aligned with respective infra like 
devcore/debugfs/info IOCTL, which seems like a good idea to me.

If you think you need a new file for this backend it should be fine.


something like:

amdgpu_debug_core.c::

struct amdgpu_core_debug_info {

/* Superset of all the info you are collecting from HW */

};

- amdgpu_debug_generate_core_info

{

/* This function collects the core debug info from HW and saves in 
amdgpu_core_debug_info,

   we can update this periodically regardless of a request */

}

and then:

devcore_info *amdgpu_debug_pack_for_devcore(core_debug_info)

{

/* convert core debug info into devcore aligned format/data */

}

ioctl_info *amdgpu_debug_pack_for_info_ioctl(core_debug_info)

{

/* convert core debug info into info IOCTL aligned format/data */

}

debugfs_info *amdgpu_debug_pack_for_debugfs(core_debug_info)

{

/* convert core debug info into debugfs aligned format/data */

}

- Shashank

>
>
>
> Info IOCTL does have a lot of information which also is in pipeline to 
> be dumped but this if we want to reuse the functionality of IOCTL we 
> need to reorganize a lot of code.
>
> If that is the need of the hour i could work on that. Please let me know.
>
> This is my suggestion if it makes sense:
>
> 1. If we want to reuse a lot of functionality then we need to 
> modularize some of the functions further so they could be consumed 
> directly by devcoredump.
> 2. We should also have a dedicated file for devcoredump.c/.h so its 
> easy to include headers of needed functionality cleanly and easy to 
> expand devcoredump.
> 3. based on the priority and importance of this task we can add 
> information else some repetition is a real possibility.
>
>>
>> Alex
>>
>>
>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 122 
>>> ++++++++++++++++++++++
>>>   1 file changed, 122 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>> index 611fdb90a1fc..78ddc58aef67 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>> @@ -168,6 +168,123 @@ void amdgpu_coredump(struct amdgpu_device 
>>> *adev, bool vram_lost,
>>>   {
>>>   }
>>>   #else
>>> +static void amdgpu_devcoredump_fw_info(struct amdgpu_device *adev, 
>>> struct drm_printer *p)
>>> +{
>>> +       uint32_t version;
>>> +       uint32_t feature;
>>> +       uint8_t smu_program, smu_major, smu_minor, smu_debug;
>>> +
>>> +       drm_printf(p, "VCE feature version: %u, fw version: 0x%08x\n",
>>> +                  adev->vce.fb_version, adev->vce.fw_version);
>>> +       drm_printf(p, "UVD feature version: %u, fw version: 0x%08x\n",
>>> +                  0, adev->uvd.fw_version);
>>> +       drm_printf(p, "GMC feature version: %u, fw version: 0x%08x\n",
>>> +                  0, adev->gmc.fw_version);
>>> +       drm_printf(p, "ME feature version: %u, fw version: 0x%08x\n",
>>> +                  adev->gfx.me_feature_version, 
>>> adev->gfx.me_fw_version);
>>> +       drm_printf(p, "PFP feature version: %u, fw version: 0x%08x\n",
>>> +                  adev->gfx.pfp_feature_version, 
>>> adev->gfx.pfp_fw_version);
>>> +       drm_printf(p, "CE feature version: %u, fw version: 0x%08x\n",
>>> +                  adev->gfx.ce_feature_version, 
>>> adev->gfx.ce_fw_version);
>>> +       drm_printf(p, "RLC feature version: %u, fw version: 0x%08x\n",
>>> +                  adev->gfx.rlc_feature_version, 
>>> adev->gfx.rlc_fw_version);
>>> +
>>> +       drm_printf(p, "RLC SRLC feature version: %u, fw version: 
>>> 0x%08x\n",
>>> +                  adev->gfx.rlc_srlc_feature_version,
>>> +                  adev->gfx.rlc_srlc_fw_version);
>>> +       drm_printf(p, "RLC SRLG feature version: %u, fw version: 
>>> 0x%08x\n",
>>> +                  adev->gfx.rlc_srlg_feature_version,
>>> +                  adev->gfx.rlc_srlg_fw_version);
>>> +       drm_printf(p, "RLC SRLS feature version: %u, fw version: 
>>> 0x%08x\n",
>>> +                  adev->gfx.rlc_srls_feature_version,
>>> +                  adev->gfx.rlc_srls_fw_version);
>>> +       drm_printf(p, "RLCP feature version: %u, fw version: 0x%08x\n",
>>> +                  adev->gfx.rlcp_ucode_feature_version,
>>> +                  adev->gfx.rlcp_ucode_version);
>>> +       drm_printf(p, "RLCV feature version: %u, fw version: 0x%08x\n",
>>> +                  adev->gfx.rlcv_ucode_feature_version,
>>> +                  adev->gfx.rlcv_ucode_version);
>>> +       drm_printf(p, "MEC feature version: %u, fw version: 0x%08x\n",
>>> +                  adev->gfx.mec_feature_version,
>>> +                  adev->gfx.mec_fw_version);
>>> +
>>> +       if (adev->gfx.mec2_fw)
>>> +               drm_printf(p,
>>> +                          "MEC2 feature version: %u, fw version: 
>>> 0x%08x\n",
>>> +                          adev->gfx.mec2_feature_version,
>>> +                          adev->gfx.mec2_fw_version);
>>> +
>>> +       drm_printf(p, "IMU feature version: %u, fw version: 0x%08x\n",
>>> +                  0, adev->gfx.imu_fw_version);
>>> +       drm_printf(p, "PSP SOS feature version: %u, fw version: 
>>> 0x%08x\n",
>>> +                  adev->psp.sos.feature_version,
>>> +                  adev->psp.sos.fw_version);
>>> +       drm_printf(p, "PSP ASD feature version: %u, fw version: 
>>> 0x%08x\n",
>>> + adev->psp.asd_context.bin_desc.feature_version,
>>> + adev->psp.asd_context.bin_desc.fw_version);
>>> +
>>> +       drm_printf(p, "TA XGMI feature version: 0x%08x, fw version: 
>>> 0x%08x\n",
>>> + adev->psp.xgmi_context.context.bin_desc.feature_version,
>>> + adev->psp.xgmi_context.context.bin_desc.fw_version);
>>> +       drm_printf(p, "TA RAS feature version: 0x%08x, fw version: 
>>> 0x%08x\n",
>>> + adev->psp.ras_context.context.bin_desc.feature_version,
>>> + adev->psp.ras_context.context.bin_desc.fw_version);
>>> +       drm_printf(p, "TA HDCP feature version: 0x%08x, fw version: 
>>> 0x%08x\n",
>>> + adev->psp.hdcp_context.context.bin_desc.feature_version,
>>> + adev->psp.hdcp_context.context.bin_desc.fw_version);
>>> +       drm_printf(p, "TA DTM feature version: 0x%08x, fw version: 
>>> 0x%08x\n",
>>> + adev->psp.dtm_context.context.bin_desc.feature_version,
>>> + adev->psp.dtm_context.context.bin_desc.fw_version);
>>> +       drm_printf(p, "TA RAP feature version: 0x%08x, fw version: 
>>> 0x%08x\n",
>>> + adev->psp.rap_context.context.bin_desc.feature_version,
>>> + adev->psp.rap_context.context.bin_desc.fw_version);
>>> +       drm_printf(p, "TA SECURE DISPLAY feature version: 0x%08x, fw 
>>> version: 0x%08x\n",
>>> + adev->psp.securedisplay_context.context.bin_desc.feature_version,
>>> + adev->psp.securedisplay_context.context.bin_desc.fw_version);
>>> +
>>> +       /* SMC firmware */
>>> +       version = adev->pm.fw_version;
>>> +
>>> +       smu_program = (version >> 24) & 0xff;
>>> +       smu_major = (version >> 16) & 0xff;
>>> +       smu_minor = (version >> 8) & 0xff;
>>> +       smu_debug = (version >> 0) & 0xff;
>>> +       drm_printf(p, "SMC feature version: %u, program: %d, fw 
>>> version: 0x%08x (%d.%d.%d)\n",
>>> +                  0, smu_program, version, smu_major, smu_minor, 
>>> smu_debug);
>>> +
>>> +       /* SDMA firmware */
>>> +       for (int i = 0; i < adev->sdma.num_instances; i++) {
>>> +               drm_printf(p, "SDMA%d feature version: %u, firmware 
>>> version: 0x%08x\n",
>>> +                          i, adev->sdma.instance[i].feature_version,
>>> + adev->sdma.instance[i].fw_version);
>>> +       }
>>> +
>>> +       drm_printf(p, "VCN feature version: %u, fw version: 0x%08x\n",
>>> +                  0, adev->vcn.fw_version);
>>> +       drm_printf(p, "DMCU feature version: %u, fw version: 0x%08x\n",
>>> +                  0, adev->dm.dmcu_fw_version);
>>> +       drm_printf(p, "DMCUB feature version: %u, fw version: 
>>> 0x%08x\n",
>>> +                  0, adev->dm.dmcub_fw_version);
>>> +       drm_printf(p, "PSP TOC feature version: %u, fw version: 
>>> 0x%08x\n",
>>> +                  adev->psp.toc.feature_version, 
>>> adev->psp.toc.fw_version);
>>> +
>>> +       version = adev->mes.kiq_version & AMDGPU_MES_VERSION_MASK;
>>> +       feature = (adev->mes.kiq_version & 
>>> AMDGPU_MES_FEAT_VERSION_MASK)
>>> +                                       >> 
>>> AMDGPU_MES_FEAT_VERSION_SHIFT;
>>> +       drm_printf(p, "MES_KIQ feature version: %u, fw version: 
>>> 0x%08x\n",
>>> +                  feature, version);
>>> +
>>> +       version = adev->mes.sched_version & AMDGPU_MES_VERSION_MASK;
>>> +       feature = (adev->mes.sched_version & 
>>> AMDGPU_MES_FEAT_VERSION_MASK)
>>> +                                       >> 
>>> AMDGPU_MES_FEAT_VERSION_SHIFT;
>>> +       drm_printf(p, "MES feature version: %u, fw version: 0x%08x\n",
>>> +                  feature, version);
>>> +
>>> +       drm_printf(p, "VPE feature version: %u, fw version: 0x%08x\n",
>>> +                  adev->vpe.feature_version, adev->vpe.fw_version);
>>> +
>>> +}
>>> +
>>>   static ssize_t
>>>   amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
>>>                          void *data, size_t datalen)
>>> @@ -215,6 +332,11 @@ amdgpu_devcoredump_read(char *buffer, loff_t 
>>> offset, size_t count,
>>>                  }
>>>          }
>>>
>>> +       if (coredump->adev) {
>>> +               drm_printf(&p, "IP Firmwares\n");
>>> +               amdgpu_devcoredump_fw_info(coredump->adev, &p);
>>> +       }
>>> +
>>>          if (coredump->ring) {
>>>                  drm_printf(&p, "\nRing timed out details\n");
>>>                  drm_printf(&p, "IP Type: %d Ring Name: %s\n",
>>> -- 
>>> 2.34.1
>>>
