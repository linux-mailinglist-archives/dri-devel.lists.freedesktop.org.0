Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B2E77DA1B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 08:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED0710E2CB;
	Wed, 16 Aug 2023 06:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2040.outbound.protection.outlook.com [40.107.102.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0B310E2CB;
 Wed, 16 Aug 2023 06:05:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWJvR9ObeThh5dTFBscf+sdcv8RBd/fm3uBaosRJHHpDK26bbhcPt1wxoBsdz1PVBBVrgKHMe2Zn3H5UPcMdoPwXbUSRLyWiJrHsez/fSOhTq6gojC62caa/Szzicy7gQJXF2EITtTMbN8q9o5zIohkNwD3q0foI3W6TvBogdv9cO6o75Qkc5fzkxddouvalMybgcYx3hTdxqfJTiVZEDD+U1S8ulIo/FK5rnyP7y9EZ5SPZW7KI6oGjHKVHXk6lba++NZLYsvYng7q1a+578bbjXt5n6SXfHFchiV4tsiVZafYW8a4aOPOgQjVxP31rcuCI1lKQKVL0FVBRi2CEaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qoqiWNUg8S4Ge0iiJmuO3XldC29xzMhHgBNcyWDNkxE=;
 b=ZJD0GHbZL3KKPmC2/XnZph5rARiX2H8KeJsi34H49I0+KH1tj0wpHHbB7RZBWAb18ZrQxKE47dlWMzYJbZuzNisI/+1X6yOW7ts23Hy2xcYmkik4XukMnkL1lbkgpl0cCKYmBXStQRF4UnPtU6dR0a06tpeCYQ/TZgWR/S1StZERK1cironR2DTbDZN1RtnQ+albJMN4Si1HlQTxzPZp6HEOXsD7ZqP269MfgrvgQ63a7aGS/PIJF08FeZLZ08fL4uGhU0Xi8PCQLSEm8CazyhYgB4hw42t6WkAeHJbphy8TbkfuAsFWqGRfZo16SWY0f82liVvdsPLvQtwUx1UReQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qoqiWNUg8S4Ge0iiJmuO3XldC29xzMhHgBNcyWDNkxE=;
 b=tyzQpUnGK3aGHIC8KE82zj5iCLG7vtoHG8Wz+nIEqrtyCA1cE7GdNf4ESZutxH7YnvSfiYspWNsJBQiy0c4LpxIGV02NgTPR8v9cPQrp/5qlH9jehJtG/DKhchPXex9rAif7mZifF11sKp0et3JUJqAg5OEbPixRGigSnoyzAzU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB7743.namprd12.prod.outlook.com (2603:10b6:8:101::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 06:05:50 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 06:05:50 +0000
Message-ID: <3c125b60-df60-2037-c23f-918734e4973f@amd.com>
Date: Wed, 16 Aug 2023 08:05:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Implement svm without BO concept in xe driver
Content-Language: en-US
To: "Zeng, Oak" <oak.zeng@intel.com>, Felix Kuehling
 <felix.kuehling@amd.com>, =?UTF-8?Q?Thomas_Hellstr=c3=b6m?=
 <thomas.hellstrom@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>, Philip Yang <Philip.Yang@amd.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <SA1PR11MB699192A66D7A2CC7305A59569214A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <SA1PR11MB6991F9E3107C963BDF95E04E9214A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <e0d7d6a2-5c9d-6e17-4b4b-be03deb6c130@amd.com>
 <SA1PR11MB69918E5603E286961789DE6D9215A@SA1PR11MB6991.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <SA1PR11MB69918E5603E286961789DE6D9215A@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB7743:EE_
X-MS-Office365-Filtering-Correlation-Id: 352a4d02-8255-48f8-f239-08db9e1ed717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ray/sfega9LYC/VM5ort36HcHEksvbMui9XL6K0gVjLncpWHVlsSJqmlMK/nxL9mIeelewJNMjfwb7dLRagGCLLlABU2jz0tK3P1VJl8opGjhWYyatyuKkEvI6KNT1zHoVNhCZ+E1r42twkxktL1a8r1kjLMs6G+BZQ8lCOpbuQSiTARVfjChu/roKlx/JyS60n9jvcykJped+YUJGWUegas8k9sUlEZN6GgUgbkGw9tdrJ96lBBr4meiC945Ro9Yc1crBxy4Sx4N25RMI2J91jIM+Xq6sDg1XQtt+mgHtusKgahUpBrPGZknejTgWXQWSvvWFtilrGHstrMu63WmdZDE5/zY77R7NKp3Pz2gspTC7O2egWfyYhhKlVOjjl6OXBFJyKwmn+tnFj8rMvev449C4I29NByNbNtrV2nVaYDnqCYbyGRFFMQSdDYaP8VkNJJlrz0WdInyYUN2pWBVQdmF7jw4N3IJwQkpUgZMSRxOE8PkLzwEsGBW5wn2Hf6ravZagmvRJqg3mSRYRo9Fp8/9HOY9M5MshUVVRBPZ4vpmEFKcT+Czyei8RoOAtX6G2QHA9UEJ5bGsKDdkHQvgXU4hbVXEyawVaz3sN1Qn8EI6ULT73oD5qdQ3BmMkPtzGFso20ww6xBCAQePreVT3C7Dn77cG0M2CniEI4ucx0g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(39860400002)(396003)(346002)(136003)(1800799009)(451199024)(186009)(6666004)(31686004)(66476007)(66556008)(66946007)(6512007)(6486002)(6506007)(2906002)(478600001)(110136005)(5660300002)(2616005)(83380400001)(41300700001)(316002)(66574015)(53546011)(8936002)(8676002)(66899024)(921005)(38100700002)(36756003)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjNtZGRXYkpRYWN5ZWpQamIwZHQrMSt5blZoMWoyeXF2dFZmWVROeGZwaXg0?=
 =?utf-8?B?Z3RoRDI5RGxjZ2JleWZRWUwrdWxnSEVhNDFTaG5rZXU3aTRldTlrVU0rdUFr?=
 =?utf-8?B?OUc2QXhrSXJ5elplanNiU1poUEZVRGxOMndaWW1BREZaU3gxRGlmdGdwdUp1?=
 =?utf-8?B?cjhGejg5eWVyeDVJdGlMWDJiMTgrZlpkaElCRkFwdkVFZjVkL2srWkFoQktZ?=
 =?utf-8?B?enlBT0NGR1FDZWJOMGVpcjVJdlBxN2Z5R2k3bnU3dTlHeDh3UVpweVgwNjll?=
 =?utf-8?B?bWU2a2hLQ0dNMzJoUjBHQnNWczJkc0M5c3dSejZFak1JSnZtOTRZNytYMDV5?=
 =?utf-8?B?a3JkUlY1blNsMnlBT2RjT1pLaDZjUXEwWTZtc0cvelg4TzdITU9nTTljS0N0?=
 =?utf-8?B?QlcrbWR1eERXVStTU2tNcUdHMmd6aVNpVzU4aytEcGxHY2RRcFVMcmJvekRD?=
 =?utf-8?B?eEV1dERrNWJ6clRLdDNvV2FOOElOekoxVkRWeWtwNUVpeEt6NGl6cFp2U3ZI?=
 =?utf-8?B?U2tGQ3ZWR1d0dWprZXoyU3VjaHppS2RRcGlqQmVSbk95WkdvZUxpRHlwUW9j?=
 =?utf-8?B?dWhoYUZxV0I3SGNJamNFYkJ3Z2pHckxZMVk2TndxdVpKcVZPVUcvclVsVXNX?=
 =?utf-8?B?OS9ycjM2NXEzVm5hQnRZRURSQmJVdWJzWEJnZHdxVG9CdGRSaGRySXlOc0Ro?=
 =?utf-8?B?V013dkhNc3dxc25Pc1ZUVXlIc0RYa280cE1rYnJWbFptL3BObmFHUzlLVkVk?=
 =?utf-8?B?SkRwc2grMHV3MFJ4ZUt4SnlPQUhDaTROVjMwcmtQYVMvYU0wT29BK2hDZWZ0?=
 =?utf-8?B?dWtFTDl3U2lFVHNzcUNsUWRDZGFEV0xTKy9iSCtxYVhCRXRiVnZNRlhmRFVj?=
 =?utf-8?B?MEh3elVyNFdDUUNsZStLVWFWTEVpYTNRMkxQY1NMM2UrZFNQMjI5ZUQxU0ty?=
 =?utf-8?B?ZXRaT29ZZWVFTXloWVNoYXlVd2t5MmhPeVJXamJKdkFrOHZxUXMrdHlwYkp3?=
 =?utf-8?B?aDA0UDFKcUovWkhlQVc5VDFYMlR2TE9Lcjl0SktGQ1E3M1pFRHZyOGlWQ1VM?=
 =?utf-8?B?dUtTYmVYUGMrQzlaVnU2SFI2em1ZN0J4eWVlYktYU0podEZDTDNHRHQyWDhl?=
 =?utf-8?B?L3NoTTNUL3k4bzRLVTgwSFlHN0pMekdFMlFEcktuN1FCT0xXTXBrdTl0dVBa?=
 =?utf-8?B?Vkg2VThjb21YMkpvUk4yRFVVYXhaSGdTend2czQrMWhBMGFKeHZndUtldHBT?=
 =?utf-8?B?UnhuUTlmUEY5RVFDUVhFNk9uNmNFSkhGRGh0MXVoKy9yUnlUT1ZrenBYcVpl?=
 =?utf-8?B?NXoyMlJINVpheW55QVBWUzdFU3Ezb042Z3BiTjR2bkJESHNjTEhzZ0QxRmJX?=
 =?utf-8?B?ZXZpWDlZZnk4dzVoOXVoOVdiZFBIRHB4R1RvMGFPSDZ1dHpGVG85dWV4dGJ4?=
 =?utf-8?B?ZTVwcVlKdDNITHN3SzdKa2dDVldQYUdURWFiOTgxZ1VyQXU5Y2puYnNpYWJZ?=
 =?utf-8?B?T2wxUTJuZ3BjcklGTjZMelRJbjN6ck9acDNKSDhEeTZmYXhrTWpzNHR0Vm55?=
 =?utf-8?B?dFhvd2l2SFo0Nk56NXFjQVBFSTl5SlRVbmxwR2ZYM1NlaDEwaHpFWnNmdnd5?=
 =?utf-8?B?Z2JuK1hFN09LV3pWT001Tk1RT2FzZ1RCdS92VnAzUXJwcUVBS3VrbFZHaFhT?=
 =?utf-8?B?ajIzYTgvbjgveXNvMGhiNGtVWVNvdXprNzhPUWtiTWlHRDdoM2p3VWtscUt6?=
 =?utf-8?B?cXpjSVdzSjRsSHdvRTFLTWRwVGc3VmpDdit3TWxOSDA3MnkzQlY4Q0d4K2VW?=
 =?utf-8?B?cmZkYndXb1hadUxrNGJObHdnU2RGL3Yrb2d0aEJ3YThnTkVRc3RlRHRPYW5N?=
 =?utf-8?B?bkRFVVk5UzBMNVhNdnVTdHNKSjNWZkpNVHZWMTk4ME9Ub09RZUNPL1NnbUE4?=
 =?utf-8?B?dUhQRGhwSXVFTzVHVWgvS3R1YnVMSmljc3NUanR3czVETnJFU0EvWHcrdWNw?=
 =?utf-8?B?aTNaZzJIYkVWNnk5WFdQNjd3c0VlcE9wbm50MVU0M291MWRwbkI3eVZvY3lJ?=
 =?utf-8?B?R1BBZE5ZQ0hydllZMWJNR3N1RGdLdWl4cWY3cVE5blZZVnBLMTlHNHY1ZFRQ?=
 =?utf-8?B?TmxIeEcybmRTbXBnV203R3RjM2RBNUptWlVhaDA3SFZvbENhaUhLNjhtOHp6?=
 =?utf-8?Q?a/1IVR3HJMJBpdvNf/dYHgSIdlvUnbNoE+OBtaAapa2L?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 352a4d02-8255-48f8-f239-08db9e1ed717
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 06:05:49.9481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STaQokAupzTtH1i80CB2Oj58oDFggptBhV09ZdtfZf3mkaJV7HEprW2g6Obcus+a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7743
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

Hi Oak,

yeah, I completely agree with you and Felix. The main problem here is 
getting the memory pressure visible on both sides.

At the moment I have absolutely no idea how to handle that, maybe 
something like the ttm_resource object shared between TTM and HMM?

Regards,
Christian.

Am 16.08.23 um 05:47 schrieb Zeng, Oak:
> Hi Felix,
>
> It is great to hear from you!
>
> When I implement the HMM-based SVM for intel devices, I found this interesting problem: HMM uses struct page based memory management scheme which is completely different against the BO/TTM style memory management philosophy. Writing SVM code upon the BO/TTM concept seems overkill and awkward. So I thought we better make the SVM code BO-less and TTM-less. But on the other hand, currently vram eviction and cgroup memory accounting are all hooked to the TTM layer, which means a TTM-less SVM driver won't be able to evict vram allocated through TTM/gpu_vram_mgr.
>
> Ideally HMM migration should use drm-buddy for vram allocation, but we need to solve this TTM/HMM mutual eviction problem as you pointed out (I am working with application engineers to figure out whether mutual eviction can truly benefit applications). Maybe we can implement a TTM-less vram management block which can be shared b/t the HMM-based driver and the BO-based driver:
>     * allocate/free memory from drm-buddy, buddy-block based
>     * memory eviction logics, allow driver to specify which allocation is evictable
>     * memory accounting, cgroup logic
>
> Maybe such a block can be placed at drm layer (say, call it drm_vram_mgr for now), so it can be shared b/t amd and intel. So I involved amd folks. Today both amd and intel-xe driver implemented a TTM-based vram manager which doesn't serve above design goal. Once the drm_vram_mgr is implemented, both amd and intel's BO-based/TTM-based vram manager, and the HMM-based vram manager can call into this drm-vram-mgr.
>
> Thanks again,
> Oak
>
>> -----Original Message-----
>> From: Felix Kuehling <felix.kuehling@amd.com>
>> Sent: August 15, 2023 6:17 PM
>> To: Zeng, Oak <oak.zeng@intel.com>; Thomas Hellström
>> <thomas.hellstrom@linux.intel.com>; Brost, Matthew
>> <matthew.brost@intel.com>; Vishwanathapura, Niranjana
>> <niranjana.vishwanathapura@intel.com>; Welty, Brian <brian.welty@intel.com>;
>> Christian König <christian.koenig@amd.com>; Philip Yang
>> <Philip.Yang@amd.com>; intel-xe@lists.freedesktop.org; dri-
>> devel@lists.freedesktop.org
>> Subject: Re: Implement svm without BO concept in xe driver
>>
>> Hi Oak,
>>
>> I'm not sure what you're looking for from AMD? Are we just CC'ed FYI? Or
>> are you looking for comments about
>>
>>    * Our plans for VRAM management with HMM
>>    * Our experience with BO-based VRAM management
>>    * Something else?
>>
>> IMO, having separate memory pools for HMM and TTM is a non-starter for
>> AMD. We need access to the full VRAM in either of the APIs for it to be
>> useful. That also means, we need to handle memory pressure in both
>> directions. That's one of the main reasons we went with the BO-based
>> approach initially. I think in the long run, using the buddy allocator,
>> or the amdgpu_vram_mgr directly for HMM migrations would be better,
>> assuming we can handle memory pressure in both directions between HMM
>> and TTM sharing the same pool of physical memory.
>>
>> Regards,
>>     Felix
>>
>>
>> On 2023-08-15 16:34, Zeng, Oak wrote:
>>> Also + Christian
>>>
>>> Thanks,
>>>
>>> Oak
>>>
>>> *From:*Intel-xe <intel-xe-bounces@lists.freedesktop.org> *On Behalf Of
>>> *Zeng, Oak
>>> *Sent:* August 14, 2023 11:38 PM
>>> *To:* Thomas Hellström <thomas.hellstrom@linux.intel.com>; Brost,
>>> Matthew <matthew.brost@intel.com>; Vishwanathapura, Niranjana
>>> <niranjana.vishwanathapura@intel.com>; Welty, Brian
>>> <brian.welty@intel.com>; Felix Kuehling <felix.kuehling@amd.com>;
>>> Philip Yang <Philip.Yang@amd.com>; intel-xe@lists.freedesktop.org;
>>> dri-devel@lists.freedesktop.org
>>> *Subject:* [Intel-xe] Implement svm without BO concept in xe driver
>>>
>>> Hi Thomas, Matt and all,
>>>
>>> This came up when I port i915 svm codes to xe driver. In i915
>>> implementation, we have i915_buddy manage gpu vram and svm codes
>>> directly call i915_buddy layer to allocate/free vram. There is no
>>> gem_bo/ttm bo concept involved in the svm implementation.
>>>
>>> In xe driver,  we have drm_buddy, xe_ttm_vram_mgr and ttm layer to
>>> manage vram. Drm_buddy is initialized during xe_ttm_vram_mgr
>>> initialization. Vram allocation/free is done through xe_ttm_vram_mgr
>>> functions which call into drm_buddy layer to allocate vram blocks.
>>>
>>> I plan to implement xe svm driver the same way as we did in i915,
>>> which means there will not be bo concept in the svm implementation.
>>> Drm_buddy will be passed to svm layer during vram initialization and
>>> svm will allocate/free memory directly from drm_buddy, bypassing
>>> ttm/xee vram manager. Here are a few considerations/things we are
>>> aware of:
>>>
>>>   1. This approach seems match hmm design better than bo concept. Our
>>>      svm implementation will be based on hmm. In hmm design, each vram
>>>      page is backed by a struct page. It is very easy to perform page
>>>      granularity migrations (b/t vram and system memory). If BO concept
>>>      is involved, we will have to split/remerge BOs during page
>>>      granularity migrations.
>>>
>>>   2. We have a prove of concept of this approach in i915, originally
>>>      implemented by Niranjana. It seems work but it only has basic
>>>      functionalities for now. We don’t have advanced features such as
>>>      memory eviction etc.
>>>
>>>   3. With this approach, vram will divided into two separate pools: one
>>>      for xe_gem_created BOs and one for vram used by svm. Those two
>>>      pools are not connected: memory pressure from one pool won’t be
>>>      able to evict vram from another pool. At this point, we don’t
>>>      whether this aspect is good or not.
>>>
>>>   4. Amdkfd svm went different approach which is BO based. The benefit
>>>      of this approach is a lot of existing driver facilities (such as
>>>      memory eviction/cgroup/accounting) can be reused
>>>
>>> Do you have any comment to this approach? Should I come back with a
>>> RFC of some POC codes?
>>>
>>> Thanks,
>>>
>>> Oak
>>>

