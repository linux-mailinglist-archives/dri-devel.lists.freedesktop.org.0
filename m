Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEFC62BDB5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 13:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B63A10E49C;
	Wed, 16 Nov 2022 12:25:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6839310E499;
 Wed, 16 Nov 2022 12:25:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmYG8tc7xCwL3OBYBIiDkl5WkcytDwM3PZcrUid6ICBkUSf6T4veKDbGOm0t9YWJuwen8Zt9k0r1g3MxUwPVnz7TBka9/dLJm0kUeU12ZFTEXp1I4NDYgicU7WEXtUa38TAGEqFodN8zhYe9K9gCUJYeI4LO9AHsP1WNAKO8ZgdyKjzaAqIShd0onAhy2l5Aj2mzO2JLgDayfy6frSjE/nIlXCEArWOj3O8XkY/T/s8beb9U/s2YeIF3Phapq/R6vtfjpleBLI9xKVfJ1Ww98tNtQYCzdelRZXUqyGSGpqwLXsseJcO6fCy8NKW8gvXTWhknEGgA7N/D7OWfwIBp8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTwQQCLd7psUGdavOXZ29rL2B9wL0IjRuAFjeQWbn9E=;
 b=UHskdAeSN8pTnNR1GrtLVI3lRO/z806It44xUXyVlZmaV8yWsegPzry4CCiTzK5cS8ohqk6h3QWPuK2tkpIgwb/LzZ04tDV+UifN674AKcNqU4bPSeFaUuSB2FZxiHj6xT4fMU2wJ+uJEg5URhQt7gk5ClFP8YhmQbombBC6Bca9Xv0Aej70OvFw9dCBIRGp/28bWCUgHg5FG6Orm2CDPVm+OGYVUkxB4ahNhkYM+H2KFjX9lvU0a08wJSt9F0YokgmM2pqABN6FFuj7v/lCdwbeDME8w+GpWxxZFxW8wIsL5/NfzymzQ5K7T8rMb7yDlw2Y5yV4LGslwDT6s/QB4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTwQQCLd7psUGdavOXZ29rL2B9wL0IjRuAFjeQWbn9E=;
 b=iNVSTSWByTPXhjEnOwrLtkVuf/K7LDE5yGKQ/qh4RNH8Nub+Ic2jPZpIiJVlieYbP/3Zb8aApNgvBogrSYLOfHPgDws/b9zY6A60uDPKKd01vTrUk9m7FxNHaVMCNGCyJFtozmPs/+5TE9j+QPRRq2zrqwIxoxgCJFlCyEH5Nac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB6240.namprd12.prod.outlook.com (2603:10b6:8:94::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Wed, 16 Nov
 2022 12:25:44 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5813.017; Wed, 16 Nov 2022
 12:25:44 +0000
Message-ID: <0fca1cf1-5373-53a1-25cd-7c700c90add1@amd.com>
Date: Wed, 16 Nov 2022 13:25:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] drm/ttm: Clean up page shift operation
Content-Language: en-US
To: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20221116085012.187756-1-Amaranath.Somalapuram@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221116085012.187756-1-Amaranath.Somalapuram@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS7PR12MB6240:EE_
X-MS-Office365-Filtering-Correlation-Id: c90e24ec-5626-4a60-6069-08dac7cdaedc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h4U9FzldnmSi7eUO42F05ynxJELy3HKCTF6Q0rwRLM8QlGF99Dhl5lM1SVmGQ8k8QklFbabS7uHLVbeB05QAsGMPwssaYzvuGuhfc0uwSmN2SIbMW1k15ju/Z+Vtp8PYtrfhmiOmc9uEH7oHeLwsDR/7TzkhvyDN2cWK5qFKpP31c/sejX/qDCAxsC3ptABvQrSg83xAYtwSdaG5mZWzPHFLl3iOxoA67cTmeE/Yyyy4Ck0uypEacLoBynp4AZpsw4sn1OMt4VSAaSxXTgOm/m7LMSD35T+AjEgAoaD2x7Mg+MhDrdWdxqmfD8Z7yi+AP7NQyTaZa6vRrTujwmymEx8c3YEbrbc8h77dN3uEc0qSNWMrVVWXL2/H6hK8UsCjVRfPVrlcPZPe/h/tukcU3yZxfd0v5ncIvWBznuY01qHeIXyVeuytoPEnLHbveFHBJmGN0dJOV5MFNO3VkUV5PAgQL4w3mu3bGX7AEQxUrkKBbAaji9H9SAK0ewfHte99UL3tVMQIzRLIVNaSWrdObeiPQevY6HR/g8H+Qa5QXdfvblGbnSpkAMAh3oYIO0zDaXsMeYBfWFJmGVRZ7Fe9Yuf0polDDrVw1YXy5vmW3i2potouUewSwSGBtJ+JPgV3Vfdc4oLLnMKyhaE86/J7SUwuvpxpEA0si3e+uqEUgueSTph4yxnXlH8EbsEVw9CgiFgkwJIn7hPlOlt8H+tLeE42B7wIsVDLgUBsjWXsJ7osf0kGndWFFUTy/MSkPUoi5ukBK416fY+BZBooznE70KGt9vxgZG8gi0NBdrO8BgY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(451199015)(186003)(6506007)(2906002)(83380400001)(316002)(41300700001)(36756003)(450100002)(5660300002)(2616005)(6512007)(66556008)(4326008)(31686004)(8676002)(8936002)(66476007)(66946007)(478600001)(6486002)(6666004)(86362001)(38100700002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmhTanBUbjZmcFBhVG8yMEUvdnV0VlhVblBEVWVFbWZYZkhIeHY2RzhpLzI5?=
 =?utf-8?B?WEV0VFpncEQyUmFBd1ZKWm5NUFhZRE0yREJ0RjIxN3NvVm1vZEVNL01DYVMz?=
 =?utf-8?B?QWJkOG1ZejBoS3BHMytkQ0NwZWFkbUpiRTlOUFFOZHlzemVXbi9UeXF2YlhE?=
 =?utf-8?B?eG1odWFMUFVzaTR5T0NGR0hCWUgrNG10VTE2UGs1b2NQb3VTYTJhU3ZJdnRn?=
 =?utf-8?B?UllQZHRWU2RDNXpueWV0cHdraXhnVTl1SGhjN1VrVEdMaXBQQ2JnWGRHa240?=
 =?utf-8?B?c2g3NU10VFo2WXVOOVBnS2JkQncwL3RETXNPVFpoTis4OHgvREEyWlhxYzVn?=
 =?utf-8?B?SU54SmJDVXNxekFMeXY2U3IvMGxtb1pzVHcyaXJWOTNEc2pEa2ppZ2FhTUp6?=
 =?utf-8?B?aDFJdkpjdXlvUmpvejRKcVBlcVAvSVJMS2ZyY0xuOXBFUnlaWWF3UzZ0RElX?=
 =?utf-8?B?UWpyaUtoZjNIUmpEeWxZSWk5L25ienBIVXFmVEo3ZFpkN0c1aDh3WE1rR2tT?=
 =?utf-8?B?ZEZOQ1IvN2p1bHMwNnpMYktCbFhLUThyT2J4SjdDelBRVkc4QnhwTDhrQ1N1?=
 =?utf-8?B?WnBPUGlWdzhENEM1THBTeUNZR3NyK0tGSzR4alhwQ2lnSk43azY4cjF6OXI5?=
 =?utf-8?B?NnhOME1ucWxJNHBUa0drbmxUUS9CSi8zb0YwdWlZZThJRTVyUTFhTWx4T1FF?=
 =?utf-8?B?RHphd2ZFQ2ptT0JjSDlBU0VlZUhvVUNvWGNFRHFGTGtwOGx2TE5uZkhnWjdk?=
 =?utf-8?B?TzNTQmlwcS83NXR5M3BvZTNDcjY3dVp6ZnNwUEkzNjZZcXlSbkw1S0Q1MWg3?=
 =?utf-8?B?azN5NDU4ek1QOUVJaU83NTdGNVpsUlRWbTg4ZHlvQW1pVk4wZnV5UDdRaU5X?=
 =?utf-8?B?RHErR21xSGxiVFB4UFdSOFI2eHdBZWtwaE1jcTRtQzRUMXFmUjgyS3J5aUVq?=
 =?utf-8?B?WWNCd29NVjlWS1ArYm0zZ1hEcUxnK0MyQzNyYkJUUjhkNWZkV09wZlFJa2Mr?=
 =?utf-8?B?Q1BCV2tUYmc5citUZjMyRU9LSjlqSjBPT0lWL09FSHArN3dMVy9YM0dpaDlM?=
 =?utf-8?B?bnRzV3pYcVBidkhVdXZRZU5pU0JmTktHbzBlalJBOTRGUjU3T1NvL3RwTHA0?=
 =?utf-8?B?aURoeU1NbWwveWcxeXF1YmFHRkIrOEd1Z0lnSE9XQ1hsdlA0RVpBQ2hDZExN?=
 =?utf-8?B?WXlwU29WVEdvZzdFR2NMb3ZUSHZ2RzBkQUFLeDFvSTNhOE1EWlJVclVYYklY?=
 =?utf-8?B?YWV6SUVkVEhZTWtqZnNNS091aVJjUVZyK3k1T3NhaHg5NlZZZ3QzOHQwUW54?=
 =?utf-8?B?aDliRm5Zak1XTE5kL1pxcEVJZ2pSNHRiTHN5bEVsN1RKK0NLQ251K29ONWtZ?=
 =?utf-8?B?andHbEhydHUzeTJ4eGRwWTlBeWxvQUFvdTdjdUtwNzd5QmNDYjM1cSttNmlG?=
 =?utf-8?B?am9RRWoyWXBwN2FJODZUYit4L24xeFVORmhXZ2w5SmY4RDByNHYyV1ZKbTNH?=
 =?utf-8?B?YlhLNUhPZ0RhTkFyV0lLSmF1T1NKdGhkM3dmYUdlWmRJcVZxWG1QcGxoRVZh?=
 =?utf-8?B?OWdyRm5TdHp4bTFwRUMwdjZLd3pCK1Q4TUJiQzdpaVIxWTUrMXZEa0NDL2tF?=
 =?utf-8?B?TWYyb25lNm9IY0diNUR0ZDV2aHZ6b0VGOTE4TFJYRzJPMERSLzRuV2YrNkpn?=
 =?utf-8?B?M0pJYU5mZXdGN2kvWmRkVUFUM2RNTThOTmdpNTVVT29yak9rOEVaQSt5T1Ux?=
 =?utf-8?B?cmZ4dUhKUDlLaUl1UnNzWkJRcE1VMk1KM1A1bFljZm0yak1idXIyYUxuamlD?=
 =?utf-8?B?ZUwzbWQ2YmN6alM5cGdEL21XRFRrN010bzVqcmhlQytoYXR6WkZYQVdheTIw?=
 =?utf-8?B?dXJuOUsvU0FGU3VESG04SjZTMDIwdEJlS2hkd2VrZENmQTBSM1JKblRLakdn?=
 =?utf-8?B?M2pRdS9UQ2J5SUsvTXY3MHhDdEJBTUlrNHBBbVJpUFBNdWtRN0NkZkxvRzd0?=
 =?utf-8?B?U1ROQU50bzVEUEF6b0ZBalQ5ak5GRndicjRXUnl3U0hDV1g0dldFZnBIbjlI?=
 =?utf-8?B?c2NtS20ydGNZVDM2OGtMQURIcng5bmJtbTBzNFMxamhuY2dwR0FvMlIxc2tj?=
 =?utf-8?B?NVFKaVVyTXBaOStVYkJVRUxnM1ZFWHl3VzVpUjRwRTBEdWdYem9MYitxOWIz?=
 =?utf-8?Q?NiJwycpqvWxY8SBbeUvolIpa8ZT//mFg6m/r0fDtdE47?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c90e24ec-5626-4a60-6069-08dac7cdaedc
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 12:25:44.3653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HiKZ8yB8OKnVPsZ7XtRYU0aN+HXEfBNXRRYn2nkdLb7TGAkvMKs0+cRp2Bin74jU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6240
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
Cc: alexander.deucher@amd.com, arunpravin.paneerselvam@amd.com,
 shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 16.11.22 um 09:50 schrieb Somalapuram Amaranath:
> remove page shift operations as ttm_resource moved
> from num_pages to size_t size in bytes.
>
> Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 4 +---
>   drivers/gpu/drm/ttm/ttm_range_manager.c    | 2 +-
>   2 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 974e85d8b6cc..19ad365dc159 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -541,12 +541,10 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>   	if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA)) {
>   		/* GWS and OA don't need any alignment. */
>   		page_align = bp->byte_align;
> -		size <<= PAGE_SHIFT;
> -
>   	} else if (bp->domain & AMDGPU_GEM_DOMAIN_GDS) {
>   		/* Both size and alignment must be a multiple of 4. */
>   		page_align = ALIGN(bp->byte_align, 4);
> -		size = ALIGN(size, 4) << PAGE_SHIFT;
> +		size = ALIGN(size, 4);
>   	} else {
>   		/* Memory should be aligned at least to a page size. */
>   		page_align = ALIGN(bp->byte_align, PAGE_SIZE) >> PAGE_SHIFT;
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
> index 0a8bc0b7f380..4c7cba4ffdbf 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -83,7 +83,7 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
>   
>   	spin_lock(&rman->lock);
>   	ret = drm_mm_insert_node_in_range(mm, &node->mm_nodes[0],
> -					  PFN_UP(node->base.size),
> +					  node->base.size,
>   					  bo->page_alignment, 0,
>   					  place->fpfn, lpfn, mode);

You need to make sure that fpfn and lpfn are now page shifted instead.

Same for the overlap and compatible functions.

Regards,
Christian.

>   	spin_unlock(&rman->lock);

