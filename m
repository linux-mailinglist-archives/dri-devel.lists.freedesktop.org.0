Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC3F66BD12
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 12:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391C110E3D4;
	Mon, 16 Jan 2023 11:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2085.outbound.protection.outlook.com [40.107.212.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC2010E3D3;
 Mon, 16 Jan 2023 11:42:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/JHH4VCFt0KQ59mFx713AywMy4UXtTlKe/XWVKGiJzyVlYorxBfUsCcXerb4DkeV6EkeOLf5qu10C0AyM0DCh5AstE6+sRv/FouOAOkNVe+zElV7UZG9OrqV2mqpFEo+zYhyVQLJfgARGnwVmj42spKtFYZ+W6jdufueaRK9d0dyUlA6vP711L59B7ZXNjsh7lgfiq0BZsIQZ4ETwz91+qCqPaQROgoM4S7SzP7UYtigxbdDrgQeJLyAo3I8uAzng/8bQf4+LSqI8olhQmMo3Qma5UIqqtzPcvkdyIwuVDR+bE3UwJXZYc9jd1Nscv3G4LF+kcVl14w/oK4+N/T7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ovjGWY2McfHxI+CUMqiZAgsCpPb5UDZy5iu1lt3pPZE=;
 b=VZLV3WishKURed89kIpTXr6oXchtLkJoHoK+BBc9jH8dgqDbVpmMB0Z7AufaSvYcJ7WyM0SEsBMRFoJEzPmGgxo4CYj5FJYhEFS6fj1O4I8gpJNQxJDYHt+rRkBNkJLa5wyO4jv38iPeJcbmtfMPaULiewwexLUwimNoyEKMRL5VSMd4f+ow3A6y8Vxw9IyE5Ns/vEUTPkdxrnfAQ9LBHpHNcXHZ7IdUYWVlQSFJdesolD1DvEN6Cxc2QRg1K5BkO+dxgzpXHNlXe7OOCQmOC4XWECVGtMyh7UNsJpxUoC14RwOoeBqY+tHggxxUbej+IFB6tjtxTx6zE9CVgwZaTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovjGWY2McfHxI+CUMqiZAgsCpPb5UDZy5iu1lt3pPZE=;
 b=lB05KgTyT8LRepxppZf0SmkMX9Xs0l4AmSoXl/y4n62RtOjPBEayhIdCVkQ4oc9FMlV9yhar/xAJSo5+S1S7LfZfD4sAW6pSd/n+zN2w7VLhNL/iD1Eas6R3vCxEYRoapWp5jDStIEO3+CpH11OVMbaO5+cOYMlz0iSFcfRWYXo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4037.namprd12.prod.outlook.com (2603:10b6:610:7a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Mon, 16 Jan
 2023 11:42:25 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.5986.022; Mon, 16 Jan 2023
 11:42:25 +0000
Message-ID: <bac027e4-0e91-8341-3baa-74520c60c808@amd.com>
Date: Mon, 16 Jan 2023 12:42:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/6] drm/amdgpu: Generalize KFD dmabuf import
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Chen, Xiaogang" <xiaogang.chen@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230112013157.750568-1-Felix.Kuehling@amd.com>
 <20230112013157.750568-2-Felix.Kuehling@amd.com>
 <cab37a40-9737-1b77-3a3f-87965d4c70b2@amd.com>
 <9b5b20e0-e04b-f7f6-9459-42d5a4bb44c7@amd.com>
 <1437874c-4b4b-191f-4486-de6ac69e99cc@amd.com>
 <19873c87-5d01-30dd-84d2-ced61b236fa0@amd.com>
 <27d2a3eb-541f-fd5b-6a92-77e49c74d1b4@gmail.com>
 <e55cc02a-3180-20b9-8255-f95f5910e7fe@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <e55cc02a-3180-20b9-8255-f95f5910e7fe@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::22) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH2PR12MB4037:EE_
X-MS-Office365-Filtering-Correlation-Id: cf198ab8-d425-4157-0227-08daf7b6bd12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JMB+CZkNSJJ6TTketB1eb4Msh1Vnq7YMtMTSW7LJSLUxc528FascWotIxvFCQQu96HZWVFApgJS4I3iuxicoZfCRrroLwh2vC6p9NqSoxxiBd8j1SBZUQ1mLzM9/aMdlVJhDSglucIhCbtZxRWdf97XuzyZjliJ3SVgi7Ze/Atr8Wy6KyIhJuZflj1ZxJIOw/aGThrD2P2wWdGyuB39oKxyveFTzc7lR1oj1g7mxaDJJlasYWIkf8SlOfHSmH+CEqDZ+MEBs4NKfWPjY9qiKjS6WTFodtvwnKBG0YEagcBlgOyMLJOw5JwAxbBjV5afH1Mna3pHr67zqwgfVtag3P+Y83rHAr4gdoJjbbZuKFi/Ll+K2d8R1blCYCpW6fkBhy+7t+0mmjHfHWqDgcfOvLZzNvk7Gxc4w8h6s3yHcD2JGkEJwpLQcv5WCU2LzqpgYd6oQScPxGBtXrTKAHi05l+CQfhw74MoApn0clroYT0c90C5JwKvyjQ6PpqLKMTTjRBb7w712M6/4y61Jkb0b3tH6TgJQP+O8N/CmtIQZ0JYODkreljgsbaz4cJLdVmi/ZEhMpj7QQN3QU89fLe6Ja1SsRXKhLt7EeS1V/NeGd0pZ0U7dhWQH6go8Fogc4DtWnvtVf69iRRAzz1PePwrzpKbwm8zWVt//x+5LMUqyudsTJxnWQkqvME+nf1B4DxQsGOAlKW4NZVa9ZL4Su/3qRnwPP+6yNdw1DM5/yZHc9cE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(396003)(366004)(376002)(39860400002)(451199015)(6506007)(36756003)(26005)(6512007)(6666004)(186003)(6486002)(38100700002)(478600001)(31696002)(83380400001)(2616005)(86362001)(8936002)(5660300002)(31686004)(66946007)(66556008)(2906002)(8676002)(66476007)(316002)(110136005)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2ZJTEVjdXdySmE5RWZBMkNsYmtQOTZZNCs3MEtuY05QUVNFRXNnSHpZNEFG?=
 =?utf-8?B?Ylg5Uy9jbmFkL0huWWJMN3ZXUmI2ejJsZHgzT2podk91emxWTDd3aFlNZHM3?=
 =?utf-8?B?bFhGeTdhSCs0ak1zeGtJUExmMktrbi9RYzN2YXlIR05qaXg5N0x1UzZTeUdF?=
 =?utf-8?B?YzYyL3Qxa3kwOWlxRHN1dWJONHVFMVE4Y01YZSs4aTgybkxLY2Nid3VkcTFm?=
 =?utf-8?B?UDViaUpyVEJNNDl5TDlsUFA5Y3RkSXBRTFV0TzkyeEU2UjdOTUMzVTdaZEpU?=
 =?utf-8?B?SlBYZkxraVlzNUtGYjJ2UG5VMDF4a252eXRPOGVLT1d6Zkt0SmxrOGZpdzJN?=
 =?utf-8?B?eXdmRjdkWGhneUVWTE40NUI4MmR6NGorOFhIS20vNWpHMlp5WjNvbHU1bnVX?=
 =?utf-8?B?ZFJTSHNzajNZMmE3NTBWQ1FpTTRFcVRjNTN5RitvMXNud1A2UExnYmNsZ0h1?=
 =?utf-8?B?aWxOa3NqV3h6ZWcvYWtpUkxDUWJWTmdwVzc1OTR6bDVBMDUwcVZ3d1M1aVpH?=
 =?utf-8?B?OVR3d3NMUDVXQW01Y2lnVjc0VkZJcDVjUlcyRnRpOHVpQjJGSTk0L0tROHRv?=
 =?utf-8?B?bkZCSUxvcHIzWDRGcVp2UFlVbVlkbng3OENRR0hOaW9mK0RoZER0Y01LRFJH?=
 =?utf-8?B?dDRab0xjaXRSb0JiQkVZbjdSYzAwMFFLdkpTNE5WL3lGc0d6emRpV3RjZW5r?=
 =?utf-8?B?MGZIb3VCclRKZ3djbnErQS9jUjZkT0pvMThtam1mdTQvbkNNWURmaDZUVWh4?=
 =?utf-8?B?aUtQSExZZzgwUnR0MTVDMnA4Q00xdmtGdTlTUXdFR0ZVMGV5a0VBYXFqNXor?=
 =?utf-8?B?WjZld0VpWlVVd0hvZVFmc1BjckhjanBKUTliUitLeWIzeXZvQW1lcFdTZmtj?=
 =?utf-8?B?aWJkQXZkY3hWVjR0L1BoVmRMMU82VCszZjRSdURtZGpaMXBUOGdwdFdobWIv?=
 =?utf-8?B?WGdBQURCSG9xRGNwLzN2bnpvMjYvN2ZCaG5LUEg2b2dtYjlzZmJ3VkFRdk8v?=
 =?utf-8?B?KzVtSHpVeTErVGhxZVRwc3k0dVVXanpnYUZiL2dFamNuRjQvM2F2NG1GRFVB?=
 =?utf-8?B?eUFKbVd5cGtpNjlTL0RRclFMTzB4VzI5Z2c1Um1IQmxZL1hEWGswQkp0L1J1?=
 =?utf-8?B?RUZwY0owcWZqWmxza1pYU3kvdVdmbW1mRnZUdm9qTGZEZnkza1RlY3pPYjNY?=
 =?utf-8?B?cnFUZjBMM0FLT1diZUNDSUd4MHZqdmtSakIrcldmNzdsb1BsRnJYZlhja29E?=
 =?utf-8?B?cFlGWkdwYmpwaWs3UktPWVhDT1pLOTVqWExpcFZQWmFqN2pscjRjU2p4ZWNT?=
 =?utf-8?B?d0JrNDc3QldSbHoyM1ozdGF6aUtJTWZnUmp0WUxPTms0alpiem40VnpBV3J1?=
 =?utf-8?B?SUFmRWZPaDVOWTI0VEQvdzlPdmZvZmE3eStOdnB1SjlkZjE2WHkwUlNuVmxR?=
 =?utf-8?B?eWFlOVZ1YW1WQ3YxcDNGWlVFVjBQU1RhMnZudlpyYnYwcllWcGc4VldobFVk?=
 =?utf-8?B?Tm1EdVc2Ly9JeE5pRFM2WEFlcHVjOW05TVdNOGVsK1p0RTlFWEx4aFhxMm82?=
 =?utf-8?B?U3laTGM1WXJIK0xrQm1kaUU3WFlVb3dGNzJmanJ5anpBZUtJeUZKRkdZNTVS?=
 =?utf-8?B?L0VaM1dsZEN6MTkvT0YvZklMbHRsYWhRajBKVEFGekpTdWJ3bTZjMmVuMUtN?=
 =?utf-8?B?SkJSOXVoY0p3d0Vqd28wY1FTWWpGcFZLbVZidkpRdDNFNlNaQmlRY1U0VDBK?=
 =?utf-8?B?NCtRTVVURmtGZGRpMXVTT1lVVkxaMFR2blFYQXcxdHlpV3JtZjlIQW5mOFhD?=
 =?utf-8?B?YmJvRnZCN3dKSlh3TkJ6M0tNMTBocDVMN3NuRWY5RGdaSjhGQVlhL1VyOWt5?=
 =?utf-8?B?OUtXcm95R2RjV1IzQmFtV1ZSdkljaTZSaDh6bEEyZ1VHYzAyWS9hUmpSTkN0?=
 =?utf-8?B?TEp2YUlOdWRSTGl6UXpBOGU3V1pWMVI1VENZbDMyV3dzUURCK0NUK1BVcENM?=
 =?utf-8?B?MmdXQTcwRkR1bU50MHJ0MmdiSC96SnRXZklyRHhxd3FrM25mVHdkaDJiTDhF?=
 =?utf-8?B?bDVaelZ6a0xuYTBTTmpRL0JaalpobFcrV3drUFRCbE05dmxJcUtqRm1WUzM3?=
 =?utf-8?Q?6G/RO/QEzTvvzujgNqXCHCF/O?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf198ab8-d425-4157-0227-08daf7b6bd12
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 11:42:25.5310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3Nw96h1sEt4Aw8JW3KPxKSL8qCnkBwRUaWqeJhKGWl9n2DTmDd0KVyBKX6ODeD9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4037
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

[SNIP]
>>> When the BO is imported into the same GPU, you get a reference to 
>>> the same BO, so the imported BO has the same mmap_offset as the 
>>> original BO.
>>>
>>> When the BO is imported into a different GPU, it is a new BO with a 
>>> new mmap_offset.
>>
>> That won't work.
>>
>>> I don't think this is incorrect.
>>
>> No, this is completely incorrect. It mixes up the reverse tracking of 
>> mappings and might crash the system.
>
> I don't understand that. The imported BO is a different BO with a 
> different mmap offset in a different device file. I don't see how that 
> messes with the tracking of mappings.

The tracking keeps note which piece of information is accessible through 
which address space object and offset. I you suddenly have two address 
spaces and offsets pointing to the same piece of information that won't 
work any more.

>
>> This is the reason why we can't mmap() imported BOs.
>
> I don't see anything preventing that. For userptr BOs, there is this 
> code in amdgpu_gem_object_mmap:
>
>         if (amdgpu_ttm_tt_get_usermm(bo->tbo.ttm))
>                 return -EPERM;
>
> I don't see anything like this preventing mmapping of imported dmabuf 
> BOs. What am I missing?
>

At some point I really need to make a big presentation about all this 
stuff, we had the same discussion multiple times now :)

It's the same reason why you can't mmap() VRAM through the kfd node: 
Each file can have only one address space object associated with it.

See dma_buf_mmap() and vma_set_file() how this is worked around in DMA-buf.

>>
>>> mmapping the memory with that new offset should still work. The 
>>> imported BO is created with ttm_bo_type_sg, and AFAICT ttm_bo_vm.c 
>>> supports mapping of SG BOs.
>>
>> Actually it shouldn't. This can go boom really easily.
>
> OK. I don't think we're doing this, but after Xiaogang raised the 
> question I went looking through the code whether it's theoretically 
> possible. I didn't find anything in the code that says that mmapping 
> imported dmabufs would be prohibited or even dangerous. On the 
> contrary, I found that ttm_bo_vm explicitly supports mmapping SG BOs.
>
>
>>
>> When you have imported a BO the only correct way of to mmap() it is 
>> to do so on the original exporter.
>
> That seems sensible, and this is what we do today. That said, if 
> mmapping an imported BO is dangerous, I'm missing a mechanism to 
> protect against this. It could be as simple as setting 
> AMDGPU_GEM_CREATE_NO_CPU_ACCESS in amdgpu_dma_buf_create_obj.

At least for the GEM mmap() handler this is double checked very early by 
looking at obj->import_attach and then either rejecting it or 
redirecting the request to the DMA-buf file instead.

We probably need something similar when stuff is mapped through the KFD 
node. But I think we don't do that any more for "normal" BOs anyway, 
don't we?

Regards,
Christian.

>
> Regards,
>   Felix

