Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 754A0494937
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 09:16:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F46410E7EC;
	Thu, 20 Jan 2022 08:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A081410E7EC;
 Thu, 20 Jan 2022 08:16:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LV9kh0YtfzhXK4wE1vEErr9BwZOQrwRg4Bn3DZMQqabDZYa9eHSdYhThivKh7SQEafILOep+m25MOT8tqCvxyYfYOdjJfoxQR5fm5JLAxrSrtcyLUpaxKVfRUT9T4PiVRjjhExPnw3g5UcswzmeSEu9jXUsn5GvzOwjA0fCdmoyPQqlbkkbM+aonCduprNkPw+3n5N1oxSPuKLiZDHM4vp0k3N4maWAqzCFhf837ofp5m/s10crXM6XsG6yHtm1M67eVvYYzkz+ynQrUMrBVluRAvgVActMjNnbFbcQD2hb9IMi+JSvZagEsIAtoYy2NL0pRIOeNQ0Z78/670Pvf0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FtrFSzjs+PujFsbsPkLp53LZQzTt8ic8JY7KaiIBP6A=;
 b=Cs3D2N5lSJP29qSGxMRhEilW2cYJ68Itq/sLx+wUdHvntXBI2Kd7IzqPA0IzmqADz1gQOK3v4uD8FVvP7hU8kaKxN6t6BsdOoF8fncnt5On69q7MyllhBqnr1442M3jKCRdlgzic3uNDRRxFhWMYvowVq95J9PN4ihzX8p7/M4pK+Wyezmi+rfL1PElFqKgnmUi6mPyLuuLoIGUu1fHroaokxkzT3H77fU7B+sxzJ8NFC1l2YAo6S6uSQmeHw+kUsQ/cxAwr4s8hqIyGdAwMvlNgozxsz+ViXY1KCt5/JaGSPZvvILeCYdAoWosiCvvXyMPlDfKtqd9/qGudOkGaJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtrFSzjs+PujFsbsPkLp53LZQzTt8ic8JY7KaiIBP6A=;
 b=KPFeSSRaXvR4PVulO9yEKcZSnt4NAsUhe+FOF2bkKfnfzVH700J031h83vkPUso1gayNg+Bz727PTVq+PKznLUfuvfc0sNpTsbLrq3XBR6BLTMzeLaYsmmUT2vkmtN9S6rjH5NqkSB/nYzb1UiAGHzB0p1/IRLiPds0RAGiZSjU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA0PR12MB4589.namprd12.prod.outlook.com (2603:10b6:806:92::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Thu, 20 Jan
 2022 08:16:42 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::b03b:7df9:d733:13b2]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::b03b:7df9:d733:13b2%5]) with mapi id 15.20.4888.014; Thu, 20 Jan 2022
 08:16:42 +0000
Subject: Re: [PATCH 0/7] DRM kmap() fixes and kmap_local_page() conversions
To: Ira Weiny <ira.weiny@intel.com>, David Airlie <airlied@linux.ie>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
References: <20211210232404.4098157-1-ira.weiny@intel.com>
 <20220119165356.GD209936@iweiny-DESK2.sc.intel.com>
 <YehJRt+JngIsj+Gd@phenom.ffwll.local>
 <20220119235542.GF209936@iweiny-DESK2.sc.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <fb71af05-a889-8f6e-031b-426b58a64f00@amd.com>
Date: Thu, 20 Jan 2022 09:16:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220119235542.GF209936@iweiny-DESK2.sc.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM5PR0602CA0016.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::26) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0849950-5d5e-4f71-9345-08d9dbed30ba
X-MS-TrafficTypeDiagnostic: SA0PR12MB4589:EE_
X-Microsoft-Antispam-PRVS: <SA0PR12MB45892FF5DA4D937059DA5ED9835A9@SA0PR12MB4589.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JtkI1D0lCu0t2zasPY4yoB0v2V8J1//AwiHgCCS++zig+rFVk+CigNXF8gEHFd42U1eIQNZlgK3Ikk1BaHn49UZsG/gJDSTatMR2T/jlDZFixCKtYRcnesdNYj5masMNCLgTGg799Rgjsn7SU6Fd4dWqe6/zWgrSok4Yex8yyL9ombufTNeUCuNZ8SRsRWA7AZsAldSaesaMYiNe8C3weLrwJl4sBSCvn5U07zqw8kthtbNN4EcIxjHTd4H/6FtKMA3ascn94LK4uPtmGmHiCkULgHRgKbJS7s9MXWU2KueH1o2HWUQNSd0hL++5z1tKGD6tiHxU0/BA8AOvWe9kcJ1OIyOXPkEoD70JD2R04lRkuYWFbl3PQonWXtaor/u3cpvrDmDpVp+HE/XL7Wm7XH6Vs9J5yvuW9AHxwk5EyRBswJHnRoueLgpXidxFs50OGAudBKfjmgT7a5gH7Y7bYxwEGaI3NObeNKjEDSSmcDCiVhmFszpnW9mtgyZfwfdbAfoDIVuzcSPd/6Hgvt0x6cpGuYQEWa5+eR4mwVnCusjPKTXSuXLamePrEc110wcp3+OTQgifcmdz+W2WT0wwzXK+Jgf4Z39IMUmNcUarnLnE5KSoijGNEtKEGL/ZNoHCulossXzZ+q+XfJfDeKbl0GrjMUCV0JKYVCZxcRKoO5ywyCtQKkFTNK+mb3aEl2XWOH5Zs4aeGRkfv3HqnNOju7Y7x1gQcf9W5YMX/V+QJ50WCx9gmXWuZW994s3FQ1BMXm5jQSWLBYmz/mIWx9aYpCaXWkd74MDTRRWKreDF2u1ChoTWRiYnuvsDieec2GYu367QlIpyrfdyxTWT+hcYUxnjPjB9LDkBTNm7cZ3kGkaOnbDyI5rkImWcghl7+2tp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(508600001)(66946007)(66556008)(38100700002)(8936002)(6512007)(86362001)(5660300002)(186003)(921005)(83380400001)(8676002)(26005)(966005)(316002)(6506007)(6486002)(2906002)(7416002)(2616005)(110136005)(31686004)(45080400002)(6666004)(31696002)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TCt5Nkc0Y0xyYm1qdzVOOEVja2ZJMUc3Nkx3MjBZVERabE9YWGRpNkowM25j?=
 =?utf-8?B?WTBnTU5YVWNVRFF2bFJEZWtSMlNyS0dnUnowNWw0OURaU0pSa0hHclFnaUhY?=
 =?utf-8?B?aUxTUmZDQldmRjhleHJQeGExbFJDMHJyd0c2WE1WaGVFMno3d0JjZHJKZm5x?=
 =?utf-8?B?SWpBTS9LZUJGY2lWVkJ2TXdTemhTK2ltZmlhTDBxR3hoTEZDT2xvWkFKaWdv?=
 =?utf-8?B?eXFLMkdIbW11NkJMOE9ORjRrb0ZCdkdqQjBGbGY1T3VzTWJGdmxhTGZzaTB6?=
 =?utf-8?B?dk5vQnQvQ1RkSkJLczhiN3Y2ZU5LNmZtUVRiS0FHa1BxanhVMVNHN1prS1lR?=
 =?utf-8?B?QWd6eUlHL0RqRjcrZVN6clE2QXZZbnlBZUQyNXZINm5ic2ozaDVIRGpOSHFu?=
 =?utf-8?B?WkVEYVlEbSt6UmFLZGtHNUhKMVRmNk1aNlY0aFRWSVg1czRUdkNSS3Y0YjV5?=
 =?utf-8?B?OEFiZG5YZWVVT05jMXh0b0RUclVUT1JIWVBTZWdJWTV0T3BJTW5Ibjd5T3JU?=
 =?utf-8?B?U2RhMXNHUVc4ZHRnT0R3ZEVBSDlDa2xUeEFFMlVLMFNUejNtWHRNeThLbkVW?=
 =?utf-8?B?bkF2MGdXRFNKcU5FSkkzNW5KVURqMVU0SndMcWVoTGNlNU9tYklnWXFEbkRX?=
 =?utf-8?B?enRabUdmbkRmcHRSOXBTK2xjWWFac3FOSmV0YWtvb093TmJranMrQmNrK2ZY?=
 =?utf-8?B?cVUrL1oxYThGdDMyNUhvZnIwWER6Q3R4MVM3NWxsSTBhbjgzbE9GcCtqaG1Q?=
 =?utf-8?B?UFpjVklJUVY4ZW1NWU5KempWN24xUHQ0bTVlaWhHd2M2YjZZczBzdzY0SUQv?=
 =?utf-8?B?eUk1aGJxSEFsYlNGRHFiT0lUdk44TTBjZDJmazFjUjh0b3ZJQmswd1NrMWRo?=
 =?utf-8?B?M2tLUlVDeFp1U2ExM0dqdjFNUFdwdUtzKzU4VmJxUDcrTlBCVjhFTk5KYXlT?=
 =?utf-8?B?M3F3OTdmK3Uva2xaUVRMcmtoUlpHc1hjWFcvUlZKa0pnbXhtWkIrZitDSVJY?=
 =?utf-8?B?aDBVcVlnUTZEMS9VbFQvdVlhbkduK2lMVmw3V2xscWNCdkloN09YVWVWMlJW?=
 =?utf-8?B?NlBQMlpWSTJXTmh4aE9PTDFheTMvdkZIN0sxTjJBUlA5ZkFubnVRK2FEdDVn?=
 =?utf-8?B?UEQ5aGxPOHAzNjBjNGw4amg5c2FnUjBoRGpYZnplSzU5THpCQmVrQVAwSExr?=
 =?utf-8?B?TUdGdU1qc2NVaDgyMVFvWXJ3blcvRHAyeHFQeWxKT2R4RTloOHVtaSsrRTFj?=
 =?utf-8?B?ZFhuampyNU00VzNCKy9xTzZRZHVBTjZ5MVRSaHRWWGFyRXlKdzhWQzlsL1Nk?=
 =?utf-8?B?V0J4c1kwcHd2U1VreFVndjBQUE4rVENXYzNLUE51bEw1R3p3QjJOSkJyZmUr?=
 =?utf-8?B?TmN2TGNKaDh0bWVoUzhVOStmOHBwTGg1R3RsVW96QktUSnV3eU5LVkxyL1Qv?=
 =?utf-8?B?ZUptRFNvSjM4QWRvSmdHRFlZb0EyZ0FORHBPajU1Ymw1RXhmWFkzUHl5YjBH?=
 =?utf-8?B?U0srVVd2WGtxRHc5bXFvbDhndVcyWDJ4bWFKeG5wMkk5QklzaTIzWEVMYWo3?=
 =?utf-8?B?WnVNdGtob1NldjJSYUVkZE96dTJOaVRSY0RPRjRQa1B0L0dKd2lDT2NweUVZ?=
 =?utf-8?B?Y3o0dmZlVkZRMWNMS1NQTE8yek15ci9lZkE5elo2TG1jbWlrTXFETC92d2pk?=
 =?utf-8?B?VXFGWkRtQkMzRXVsQlF0N0FpOXMwb3BtSmdSZE55SzFvUFJqa3dXaWVhVVZz?=
 =?utf-8?B?a2h2cWdqVDduZmFveHlNRWdEM2FJTTRNT29ZdE55UVM5aWNEKzNUZFROSEhk?=
 =?utf-8?B?Y21Uelc5aGNyMHRpUXo5ZThzSitLVDQyRFN5elVFV3hPdHJiMldtSlA5Q3Q4?=
 =?utf-8?B?RU5oOWNSTlpmYUFnTTVzWUtFV2hHbzRrZ0FrV2FxNU5zSmtjeWF2eENoZm53?=
 =?utf-8?B?ZVN0c0wxU1l4YzNnTU0wZ2NOaTBrNGU0bExHSE9MR1ZhUDR2VFNna2g0c3Jk?=
 =?utf-8?B?eVh2M2RQSGptT2lieGQzc05nZWtKVzROM3l4aVhsbm9nZm1IWmRaTnAxZEoy?=
 =?utf-8?B?Y1RvdnRnRS9VOHVoWEthMlNlMnFJYktQWU9HVDJKdUgrY211aEZoamMrSkJr?=
 =?utf-8?Q?r4hg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0849950-5d5e-4f71-9345-08d9dbed30ba
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 08:16:42.2464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YCv7LnTiEmTeyTAZgv/CP0KrLv1FGyvgeCcebGeIQPqKMJjbKERaNG6f7vouWend
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4589
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

Am 20.01.22 um 00:55 schrieb Ira Weiny:
> On Wed, Jan 19, 2022 at 06:24:22PM +0100, Daniel Vetter wrote:
>> On Wed, Jan 19, 2022 at 08:53:56AM -0800, Ira Weiny wrote:
>>> On Fri, Dec 10, 2021 at 03:23:57PM -0800, 'Ira Weiny' wrote:
>>>> From: Ira Weiny <ira.weiny@intel.com>
>>>>
>>>> This series starts by converting the last easy kmap() uses to
>>>> kmap_local_page().
>>>>
>>>> There is one more call to kmap() wrapped in ttm_bo_kmap_ttm().  Unfortunately,
>>>> ttm_bo_kmap_ttm() is called in a number of different ways including some which
>>>> are not thread local.  I have a patch to convert that call.  However, it is not
>>>> straight forward so it is not included in this series.
>>>>
>>>> The final 2 patches fix bugs found while working on the ttm_bo_kmap_ttm()
>>>> conversion.
>>> Gentile ping on this series?  Will it make this merge window?
>> I think this fell through the cracks and so no. Note that generally we
>> feature-freeze drm tree around -rc6 anyway for the upcoming merge window,
>> so you were cutting this all a bit close anyway.
> Ok, No problem.  I just had not heard if this was picked up or not.
>
>> Also looks like the ttm
>> kmap caching question didn't get resolved?
> I'm sorry I thought it was resolve for this series.  Christian said the patches
> in this series were "a good bug fix" even if not strictly necessary.[1]  Beyond
> this series I was discussing where to go from here, and is it possible to go
> further with more changes.[2]  At the moment I don't think I will.
>
> Christian did I misunderstand?  I can drop patch 6 and 7 if they are not proper
> bug fixes or at least clarifications to the code.

Yeah, it is indeed a correct cleanup. I would just *not* put a CC stable 
on it because it doesn't really fix anything.

Christian.

>
> Ira
>
> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2Fc3b173ea-6509-ebbe-b5f9-eeb29f1ce57e%40amd.com%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C5e0192210d4640adb88b08d9dba734b1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637782333459591089%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=4p7jCB6pB4nlcUtLWh6K2Sso9X%2BsRSK7mcD8UavzztQ%3D&amp;reserved=0
> [2] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2F20211215210949.GW3538886%40iweiny-DESK2.sc.intel.com%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C5e0192210d4640adb88b08d9dba734b1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637782333459591089%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=6%2BGfSKshg8Xr%2FXJshiU28yHzbg2HcVisVJLDU6tVUT4%3D&amp;reserved=0
>
>> Anyway if patches are stuck resend with RESEND and if people still don't
>> pick them up poke me and I'll apply as fallback.
>>
>> Cheers, Daniel
>>
>>> Thanks,
>>> Ira
>>>
>>>>
>>>> Ira Weiny (7):
>>>> drm/i915: Replace kmap() with kmap_local_page()
>>>> drm/amd: Replace kmap() with kmap_local_page()
>>>> drm/gma: Remove calls to kmap()
>>>> drm/radeon: Replace kmap() with kmap_local_page()
>>>> drm/msm: Alter comment to use kmap_local_page()
>>>> drm/amdgpu: Ensure kunmap is called on error
>>>> drm/radeon: Ensure kunmap is called on error
>>>>
>>>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 8 ++++----
>>>> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 1 +
>>>> drivers/gpu/drm/gma500/gma_display.c | 6 ++----
>>>> drivers/gpu/drm/gma500/mmu.c | 8 ++++----
>>>> drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 4 ++--
>>>> drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 8 ++++----
>>>> drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c | 4 ++--
>>>> drivers/gpu/drm/i915/gt/shmem_utils.c | 4 ++--
>>>> drivers/gpu/drm/i915/i915_gem.c | 8 ++++----
>>>> drivers/gpu/drm/i915/i915_gpu_error.c | 4 ++--
>>>> drivers/gpu/drm/msm/msm_gem_submit.c | 4 ++--
>>>> drivers/gpu/drm/radeon/radeon_ttm.c | 4 ++--
>>>> drivers/gpu/drm/radeon/radeon_uvd.c | 1 +
>>>> 13 files changed, 32 insertions(+), 32 deletions(-)
>>>>
>>>> --
>>>> 2.31.1
>>>>
>> -- 
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C5e0192210d4640adb88b08d9dba734b1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637782333459591089%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=NLqm91HCdllhW%2BrQ8aHMLXhYGkOJrYffpjsIJZWaFBc%3D&amp;reserved=0

