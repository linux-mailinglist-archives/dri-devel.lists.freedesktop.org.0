Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C3E486BBF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 22:14:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4E410E64D;
	Thu,  6 Jan 2022 21:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3997110E3F1;
 Thu,  6 Jan 2022 21:14:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHJWFbp2hOUnp1LxyMqlUbcJEHRIN/gSgvMvWE2TQh39u8IpLzjntvr582z7uuR/0QyiOHY6cBgKVs/6HILokZvPczlBaeCAU0ERPrSvDqJ4QB9M8aIZp73/8J2+wKc0ud5+svBpWjaO7O+I9oPSQkz3LOErEj6Q+oa4vqmlvmvxd0gM/i/3sX4SCKuhxTUOfLBTalFSevmfO36nxDXf2qvqRSggwwr1XOQIC/R1LUKTYTtidOkac7wDt3wgjQN9hmofSUGT4nVT0RlKve12xNOS3B8+BYyo4Z3u0vWqYKXnuMETaj6iNyrOGgybSZ+dr/UPikma5sArM8PwEMIYdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdNCnjwPslSvVpXYnLSlWyqIo1bxbEDGdEdVeUWpDjo=;
 b=LpXkHYZ4Gt4lYdkHBLW/viO0USsplEXNgvhT2YZEIeRPp/LE7L+z9jDXbXpbWeHnvX1yXOf9bIvh/O4382yvBkyC6RYfTUHu4tHTNE9ELdrtNgdiHLh8XNKFLHS5vlQ9wd6yVvWCerzGikziVxTTbzxks3KGnncaI+8bGbiZ9hxPjUiEJnCSUZnfh+JfxrnE47eDnrjeVlYEvR+wyo4wWSlkX+mtzTO5UMJXzON59zuWJDWtA3dcbSE8/EbD8l7e6nKiPYCABwY2acMgQydzNwj7lMkLlZb4E/SeKzS5C2XAhHl/x5/9HxDbyRvcC2FtCOcGkj0Kk/fgc1qzjm7JSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdNCnjwPslSvVpXYnLSlWyqIo1bxbEDGdEdVeUWpDjo=;
 b=3CoRfdOT4al1shpvNCq1JdiII+0n5IAcVPEzk/Ls8bUFnbZmXMie7IU4/vXSg+0NZIYWYC8colXpUuL2xYBqMMunCvFQxVHtMdet7WlqNbNt8XjpyaJAs4ccZYhQqIfy67NVeN7H9CzndEmg9FR8qloiAmY0wH3eS6S0NYj0610=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by BL0PR12MB4930.namprd12.prod.outlook.com (2603:10b6:208:1c8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 6 Jan
 2022 21:14:43 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c411:8d69:9007:aed6]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c411:8d69:9007:aed6%5]) with mapi id 15.20.4867.009; Thu, 6 Jan 2022
 21:14:43 +0000
Message-ID: <5a472bca-a80b-0609-600b-d136e9a1baf4@amd.com>
Date: Fri, 7 Jan 2022 02:53:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 2/6] drm: improve drm_buddy_alloc function
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20211226222425.544863-1-Arunpravin.PaneerSelvam@amd.com>
 <20211226222425.544863-2-Arunpravin.PaneerSelvam@amd.com>
 <6c48028e-0330-c9f1-23c5-8fe8042564f3@intel.com>
 <MN2PR12MB4342A3191114E4D3F2824441E44C9@MN2PR12MB4342.namprd12.prod.outlook.com>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <MN2PR12MB4342A3191114E4D3F2824441E44C9@MN2PR12MB4342.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::21) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce548923-05a7-4324-2cc8-08d9d1598ec4
X-MS-TrafficTypeDiagnostic: BL0PR12MB4930:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB4930CC9DC1F0D533FF11CC3FE44C9@BL0PR12MB4930.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N4ifBXJdisnUtA4jC/pWQ050ngKuyV5sRX8WhA5p5WSejnnnu8DhvmAUMn/RHm3LQOh2mXizYug1oRtmP95kLqLkx7618U/hsjoKaZQmN1JuJz+Op0QCdaSP7BO92OWJS8zF1k7u2dl0lcCIpj8jtnwTm6kGau1+7ixoYSS21ITAXMZJ09vJgCk7fSe4RDs4zPCXHkSahsftqDKknxA8pb8ZLpiTPQO2KBDHfGBsUpuSZtrTORIZpjPZ47YDxQosjTyae5+HsDKZ9G29adiT++fLvgZgLIbRkjaiB+GzA2dCRGxUjyZFTRyMWlfDusExWZXC01FjPJT8OZJDi7snMMgglgi8jGxQKpFW7I7clrWKXmVPD6noE3vO2EyCxINdUdg6A+2ZnD3uQYGYi8kVtR/gCXGMPa9HlD/3GEx+9p7qTSrA4U+719sIUqxuZXucUFKtGImUOS3FvYod9gulukbaz8gbMdUEvQX3qrqUDx4G3TnEkffFXyZi/rjn+4u+mXUA8pEhegPBEZLkXBUtvavpIn+uUm0ElgSdl9FArQbJU7dTKbI2q1TK8EZAo7ZbGCW0Ab05ELIH6+/1OVl6AaNWZultfZezp/QXouQQ0TYFMhIuKbHK/LPilMSRtAQCkU9xynuFVyflHegbWuifMGfQTsNKuVLTgG3MJMwJdjDpwbDbok1iZ9ThMRd+spkYopb8f77oD/9Tnsv+kPfEHn4HEcnJ/Q/CcWZIHSfZCUHwFBcactA2DeH269PAOqJN2rzNBJYDdVNxUJvVH6SqqSxfLstRghqpVa/1M/4doOqhx5pn3OWaeKm7CnMEN2q4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(36756003)(86362001)(8936002)(316002)(110136005)(966005)(508600001)(6666004)(31696002)(45080400002)(31686004)(2906002)(4326008)(54906003)(186003)(66476007)(66556008)(66946007)(38100700002)(83380400001)(26005)(6506007)(53546011)(2616005)(6486002)(5660300002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnlnVE1VSWJab1gzaVgzMW0rS2trUTQ1eC8rZmMxQ3F0WUlLQkhuSWN6bHNB?=
 =?utf-8?B?WTE4NTUwMEx3T2JDUzE3b2FTR3dvUHN5aVBSWnpLRUo3SUNlNEpwMUliN3lW?=
 =?utf-8?B?eEdLam1DQ3dreTh5cXlEMHA1dGU2eEVPU0hxZmJrcWEyazVyTG10RFRndEhD?=
 =?utf-8?B?V2ZFZFIreWtMUlBHWXVrU0Yybmh2ek43a044ZGM5MHg4S2UxdVVBYmhXOWMy?=
 =?utf-8?B?a09lczNudmZTNnBqNjlmVzBYOUJrWUxHWHZ5Wmp5SEFPMHRpOEtNaUI2T0lU?=
 =?utf-8?B?T1piRWF0NW5HdUF5K2t0UjIvSkdnMmdHZjRrVUlQWXlSd0dYcXd1cDRSQlpL?=
 =?utf-8?B?ck5yeEtxUFNDemU0MVhzZ0h3bm5teVdpNDlMd1M0d1g4Vy9RZTBrdDMxdEx3?=
 =?utf-8?B?TUhGaW0wbktzampDZ0J2QWZraEQ3RkhUbXkxZjBXc0hwMkNuUVQwYzdTZEkv?=
 =?utf-8?B?MkNFL1lGOHJydnYrYjVGOS9Hd3J5NFkyUE1LK2dmcitlMU45V2dsZlp2UktQ?=
 =?utf-8?B?emhNam5TcEIxajFJS3FCWFB3eFNZby9vU0ZobmNQNnZaUlVqeUlsdXN5ZzE4?=
 =?utf-8?B?QWxXT3FRVitudmpvMDNaMjFpNm4xZktOa0gveUNUT3lXV2dxdlpzZWttS0wr?=
 =?utf-8?B?eUVUT0EyaUlPQ3BBaEhBbTBWZm9XSE9sNDNLSFR1Tk5IQU5heURkZm01a1Yr?=
 =?utf-8?B?K2lPeGl5dDBXL1JTQUxrczFyTExJeWJQQjVlYlBkS243cTV6RVJLL1lHTks5?=
 =?utf-8?B?VGtUSktsUXpVWXdIT2owZjdhbGF1UEovNmZqWGRYWGZoMU5wMHRJcERxZzJY?=
 =?utf-8?B?elpuUDFRU1VENVkvRU9TdmoxUXF5d0FCK3FJc1BZT3hIVFpFdUVkeFdsRnBl?=
 =?utf-8?B?R3RBNWcrSGJzakxjcmliMWVpQ0Y5Nms0Ung2dU9ZeS9mMUh5RUJKem45L0Ur?=
 =?utf-8?B?clMrOXZ2dmw1L2dSc1Flek1pZ0xhYXVmN1dEWExtVlNvbkxGY1Zlc0h0MFJE?=
 =?utf-8?B?Qi9tOWhqRmRRZjNuWitrRXJCenhlSVlJeXZ0WkgxalpocHQ3aENvVGx3d1gv?=
 =?utf-8?B?NkdESTJwanRGOUQzVjYwbHlvSVFYOUFwWG81a20rNFBoa0s2R1lyZGYwcTNv?=
 =?utf-8?B?N1hUN29DMFJnSGRadVdpc2pVSlBoRU4zb1c4aEZ4L2gwSUkvcTRJRjFOOWV2?=
 =?utf-8?B?REpDNW1GaS9aWGxCQVZ5V2VteTkvQUVMUitXaSs0ZHVzdzZPZDhWd2lkWFRS?=
 =?utf-8?B?ODVMR2ErNFQrWSs3VkxuTnloZ2F1dk9ZNkJTY09xYkFCdEVSeDNxc0krYWJs?=
 =?utf-8?B?S0JoSWg4YTlSZG5hWWFPUEYyZE0xSkFCZXNVQWRDbFBPM0h6RU9ZMXFZSUZO?=
 =?utf-8?B?V2JQdGZiSnBweGhBUGthK3JvL0NiTHV0VWpuQWdDdng4Qm1LNExaM0ZtUU9z?=
 =?utf-8?B?aFkraEtTa0dZK3FyTXczL3hMVzR6eHRHNzJ5K0Q3dm5HM000dlQ5Z1E5Vmgy?=
 =?utf-8?B?WWdNc3E5SkFnc3kyRElROHJZc3RHcU5nQkVEUUlpQzRyRUFrSWR4a0xrb2R0?=
 =?utf-8?B?dnY2cW12Q0d2VzMyMlhVSkZKcUN5NDdpUGF5T2xjbkFoT2xkWVNLbTVYQmlQ?=
 =?utf-8?B?YlhiMHFFUlRoQ3MyV2kxWkxWMTNLNG9RU0RwZy8yZytBWlVNR0wxblFMM0VB?=
 =?utf-8?B?T3RkWTMzNXY0cVQrZHh2NTEyVHNudlJKTlg3VklsVitIYlBmNnJwOXFCTUp5?=
 =?utf-8?B?NlJlS3RCWTZIYzJqSUV5eXc2RUw5NmtzM2IrWEdHYW1ac3ozSEE1MklKNUps?=
 =?utf-8?B?Rm4wemV6YzVWK0JYcnBlMFBUaDMrQ2ExL0VwSDJ4aFp3Nno4YXllbHpGa2R4?=
 =?utf-8?B?ejdNL245NzUvZVAxQ0hIc1lVSDFjckxwUUNlWXBwZjNrMmFMVGlIdVRIdmZn?=
 =?utf-8?B?RUtPd0hxMTliTGVNMnlmVlY1NmNRVFg5Y3E3RU5vNklVbjdqWGk5Ly82NnlQ?=
 =?utf-8?B?Sk9mRHMzN29VTzZGdHZZSFIyc3FwTk9WNUlpQUNxZ3QvNk53Z3dqZUR1U1c5?=
 =?utf-8?B?YXV0dTE1N2NvY0NwMkpKL1RsYWQ4RWkweG5idys4ODYyNEp0TE55TlNIN2Fu?=
 =?utf-8?B?Znl3RjEzWUFJcDFnZ1ZLMGNBU0dUa0M1eTA2VE9IN0d0bkRLU3lNL2hkQ0pN?=
 =?utf-8?Q?okCTfx+KhWKQIMYTqzyB89I=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce548923-05a7-4324-2cc8-08d9d1598ec4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 21:14:43.1213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rC2zkkBnTnbbcgEW9MouI65wmu+6Ou/v8XC2+XDyr0eXUZPDc7eF0VdoKl2G0gQkzwTRlzgfi8S1PskV1/K9QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4930
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Matthew Auld
> Sent: Tuesday, January 4, 2022 7:32 PM
> To: Paneer Selvam, Arunpravin <Arunpravin.PaneerSelvam@amd.com>; dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; tzimmermann@suse.de; jani.nikula@linux.intel.com; Koenig, Christian <Christian.Koenig@amd.com>; daniel@ffwll.ch
> Subject: Re: [PATCH v6 2/6] drm: improve drm_buddy_alloc function
> 
> On 26/12/2021 22:24, Arunpravin wrote:
>> - Make drm_buddy_alloc a single function to handle
>>    range allocation and non-range allocation demands
>>
>> - Implemented a new function alloc_range() which allocates
>>    the requested power-of-two block comply with range limitations
>>
>> - Moved order computation and memory alignment logic from
>>    i915 driver to drm buddy
>>
>> v2:
>>    merged below changes to keep the build unbroken
>>     - drm_buddy_alloc_range() becomes obsolete and may be removed
>>     - enable ttm range allocation (fpfn / lpfn) support in i915 driver
>>     - apply enhanced drm_buddy_alloc() function to i915 driver
>>
>> v3(Matthew Auld):
>>    - Fix alignment issues and remove unnecessary list_empty check
>>    - add more validation checks for input arguments
>>    - make alloc_range() block allocations as bottom-up
>>    - optimize order computation logic
>>    - replace uint64_t with u64, which is preferred in the kernel
>>
>> v4(Matthew Auld):
>>    - keep drm_buddy_alloc_range() function implementation for generic
>>      actual range allocations
>>    - keep alloc_range() implementation for end bias allocations
>>
>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> 
> <snip>
> 
>> @@ -73,34 +83,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>   
>>   	n_pages = size >> ilog2(mm->chunk_size);
>>   
>> -	do {
>> -		struct drm_buddy_block *block;
>> -		unsigned int order;
>> -
>> -		order = fls(n_pages) - 1;
>> -		GEM_BUG_ON(order > mm->max_order);
>> -		GEM_BUG_ON(order < min_order);
>> -
>> -		do {
>> -			mutex_lock(&bman->lock);
>> -			block = drm_buddy_alloc(mm, order);
>> -			mutex_unlock(&bman->lock);
>> -			if (!IS_ERR(block))
>> -				break;
>> -
>> -			if (order-- == min_order) {
>> -				err = -ENOSPC;
>> -				goto err_free_blocks;
>> -			}
>> -		} while (1);
>> -
>> -		n_pages -= BIT(order);
>> -
>> -		list_add_tail(&block->link, &bman_res->blocks);
>> -
>> -		if (!n_pages)
>> -			break;
>> -	} while (1);
>> +	mutex_lock(&bman->lock);
>> +	err = drm_buddy_alloc(mm, (u64)place->fpfn << PAGE_SHIFT,
>> +			(u64)place->lpfn << PAGE_SHIFT,
> 
> place->lpfn will currently always be zero for i915, AFAIK. I assume here 
> we want s/place->lpfn/lpfn/?

I replaced place->lpfn with lpfn as below

>> +	err = drm_buddy_alloc(mm, (u64)place->fpfn << PAGE_SHIFT,
>> +			(u64)lpfn << PAGE_SHIFT,

AFAIK, we need to change only at above location, hope this
fixes the firmware allocation issue.
> 
> Also something in this series is preventing i915 from loading on 
> discrete devices, according to CI. Hopefully that is just the lpfn 
> issue...which might explain seeing -EINVAL here[1] when allocating some 
> vram for the firmware.
> 
> [1] 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fintel-gfx-ci.01.org%2Ftree%2Fdrm-tip%2FPatchwork_21904%2Fbat-dg1-6%2Fboot0.txt&amp;data=04%7C01%7Carunpravin.paneerselvam%40amd.com%7C4e7c1345d6a649a1682608d9cf8ae82e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637769017786517465%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=FsSHcnvbMhPhWaZ3tVLAswf04p5tBsbSYqKdYzpib88%3D&amp;reserved=0
> 
> 
>> +			(u64)n_pages << PAGE_SHIFT,
>> +			 min_page_size,
>> +			 &bman_res->blocks,
>> +			 bman_res->flags);
>> +	mutex_unlock(&bman->lock);
>> +	if (unlikely(err))
>> +		goto err_free_blocks;
>>   
>>   	*res = &bman_res->base;
>>   	return 0;
>> @@ -266,10 +258,17 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
>>   {
>>   	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>>   	struct drm_buddy_mm *mm = &bman->mm;
>> +	unsigned long flags = 0;
>>   	int ret;
>>   
>> +	flags |= DRM_BUDDY_RANGE_ALLOCATION;
>> +
>>   	mutex_lock(&bman->lock);
>> -	ret = drm_buddy_alloc_range(mm, &bman->reserved, start, size);
>> +	ret = drm_buddy_alloc(mm, start,
>> +			start + size,
>> +			size, mm->chunk_size,
>> +			&bman->reserved,
>> +			flags);
>>   	mutex_unlock(&bman->lock);
>>   
>>   	return ret;
>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>> index fa644b512c2e..5ba490875f66 100644
>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>> @@ -20,6 +20,7 @@ struct drm_buddy_mm;
>>    *
>>    * @base: struct ttm_resource base class we extend
>>    * @blocks: the list of struct i915_buddy_block for this resource/allocation
>> + * @flags: DRM_BUDDY_*_ALLOCATION flags
>>    * @mm: the struct i915_buddy_mm for this resource
>>    *
>>    * Extends the struct ttm_resource to manage an address space allocation with
>> @@ -28,6 +29,7 @@ struct drm_buddy_mm;
>>   struct i915_ttm_buddy_resource {
>>   	struct ttm_resource base;
>>   	struct list_head blocks;
>> +	unsigned long flags;
>>   	struct drm_buddy_mm *mm;
>>   };
>>   
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index 09d73328c268..4368acaad222 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -13,15 +13,22 @@
>>   
>>   #include <drm/drm_print.h>
>>   
>> -#define range_overflows(start, size, max) ({ \
>> +#define check_range_overflow(start, end, size, max) ({ \
>>   	typeof(start) start__ = (start); \
>> +	typeof(end) end__ = (end);\
>>   	typeof(size) size__ = (size); \
>>   	typeof(max) max__ = (max); \
>>   	(void)(&start__ == &size__); \
>>   	(void)(&start__ == &max__); \
>> -	start__ >= max__ || size__ > max__ - start__; \
>> +	(void)(&start__ == &end__); \
>> +	(void)(&end__ == &size__); \
>> +	(void)(&end__ == &max__); \
>> +	start__ >= max__ || end__ > max__ || \
>> +	size__ > end__ - start__; \
>>   })
>>   
>> +#define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
>> +
>>   struct drm_buddy_block {
>>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>>   #define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
>> @@ -132,12 +139,11 @@ int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size);
>>   
>>   void drm_buddy_fini(struct drm_buddy_mm *mm);
>>   
>> -struct drm_buddy_block *
>> -drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order);
>> -
>> -int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
>> -			  struct list_head *blocks,
>> -			  u64 start, u64 size);
>> +int drm_buddy_alloc(struct drm_buddy_mm *mm,
>> +		    u64 start, u64 end, u64 size,
>> +		    u64 min_page_size,
>> +		    struct list_head *blocks,
>> +		    unsigned long flags);
>>   
>>   void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block);
>>   
>>
