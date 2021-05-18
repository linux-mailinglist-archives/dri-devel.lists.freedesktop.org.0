Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133BD387A9B
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 16:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A106E880;
	Tue, 18 May 2021 14:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4AB6E880;
 Tue, 18 May 2021 14:01:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FY1m6nijdweqIFqC/x5bC/s6pbUUFAWH5BuqfAIwOmZII7mc9HqbMzv02nTw6ufn6i1wBVfHpP/+70SFkw0ow62N8hwx5TDMg+NPDYMdcjBv9ijABs2rIn7fAyDrXrbMFrFgAOk9Twdm8etfGElJmva5OB6WjXsOWv67XMkJAhcug3ITE57wq+RLqkAaXcLzLArxAiuuArclRVYYLZOGNwYkiecTsfCglO1PihQJUfOVdWEkFR6wprXgcP992F7UCW7Uf9HAIwJR/WStuEMZZnWw9lQg5LNKNOloWq0CTGIK7kvBIeDHH8A+00AevZ4FE19JcokHaQfk3vZGrVc96g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJiNZVL21HGQuttqt6HhnBBzvmq69GwWBJDR+mdCRmk=;
 b=P3yBI4dDJA9d+O9WcQ/LEaEFCR8nnFXDIGiG/m4So5FW8oPUcvrwD/HT5QZqcsnf0s1hBjLtUR4X1Idd1OOQAs7dTFSFOAGZ/ZtHQXnU5ozLKnwoutxnK3JcFwU2+JUKncsJ6VxtbhhLQQRUX7UJalJGjQF6E+L1DAlZjl1wTe5hc1U24VXOawO7AybPhvq68EdpL/YKw5fySlGRnWYNQk5kRFxNM7swm7WvV9gpUnF6SEwFNSKIarJdjrTN0MGx19iY/hVI0dErraZPrulidc4tTbEDz2WgTJnQt510H/+EWAo9FwBavflQ9lWIgq3tHtrFc1Oq/u5B3WjzIz6QpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJiNZVL21HGQuttqt6HhnBBzvmq69GwWBJDR+mdCRmk=;
 b=lLlO9cAfqM1DXxu5jUvhartRQerNhDnLFvF5/Ik/Y37OS1QLqsd0BmVFrhaNq98ZGFAlc/YSjLxxc3KN8dK/eIsQNzfHDXoYZeIQ7IioUO3DQheDeyJ18Nt5ykMSNHBPDN9y7Ny12LSUAJh8wCQbU0pFe0ZH3eS22dJ4vxwFbvk=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4397.namprd12.prod.outlook.com (2603:10b6:806:93::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Tue, 18 May
 2021 14:01:49 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 14:01:48 +0000
Subject: Re: [PATCH] drm/amdgpu: Unmap all MMIO mappings
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <CADnq5_M-Sy3cF762044Ub9J=N_U6uQ2h2j40Y=fof04dXL5h7w@mail.gmail.com>
 <20210517193105.491461-1-andrey.grodzovsky@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <491692a8-a7e4-66db-9cde-f660158ad256@amd.com>
Date: Tue, 18 May 2021 10:01:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210517193105.491461-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2607:fea8:3edf:49b0:19e2:b915:59c1:4860]
X-ClientProxiedBy: YTOPR0101CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::46) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:19e2:b915:59c1:4860]
 (2607:fea8:3edf:49b0:19e2:b915:59c1:4860) by
 YTOPR0101CA0069.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Tue, 18 May 2021 14:01:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 932f8c92-56cb-4e49-3b1c-08d91a057ad8
X-MS-TrafficTypeDiagnostic: SA0PR12MB4397:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4397141D30244AFB1A337C07EA2C9@SA0PR12MB4397.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rGnhQcC0J7J8zaqxeg8TLBKuHo7yi95CLYSR1QdHrN4E8uR2Fz2FIZSeZvD/fOnNLdv843lSg9Z3o45qq96PxU2QrVrRCNenbAVlu4w7iyhTdj8Ek8azI4XbD0/hpDHg4FYCsK2Opl/8npKiSIl7r8OxDE4ksc7NdA25FHcXySNtpok3p2qKXVTtdIY6vAZF2lQb5AgL+R54e2L4yRiE4b6WghYSGkkBeYncSG3rXhIp8RAC8dtxwQERcWVvMEu63eZ+0v3AbTqVNBd+lOafVe3rr2/pIATVWP3RdNmb4CE1vaDqPYACdKLDsCrf38AWJSpCgOdeTcU86UcsoYFj+rNZjgT0uT+oR0QDBeJxkmP2E/EHrGk17C3mhRBhbHmkOLi3Bf2sMIujI0waVhg29uzJGVVxxngiDZV0w03L91UtYaAZb3z8aSG0zXh6Xu/y3XLDbwWNARMbdhrJWOBVFJl2+asBruPrETMUQJJVsLnkwKTRoxEiNOoSc32WB7T8woVSySQiYb3AnQA8OI7RQXPXBG0/x1Xh+Mc6AVI3mAnM1MIah9BOjydr9MO7ebex8qKUM6KlKr69ocasN3DP1sJuhiCzrcCPC955gmrlnUQQCc+QPzI5YHQHmub/smoO81xIwoG86wysjiYqPNS2wrQcrHRt83o1nfxJTQcC5bOrperbAMFoQu2N+TcOttCu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(39850400004)(376002)(136003)(8936002)(53546011)(2906002)(86362001)(83380400001)(16526019)(5660300002)(44832011)(186003)(6636002)(31696002)(66556008)(66476007)(52116002)(66946007)(6486002)(4326008)(38100700002)(31686004)(36756003)(478600001)(2616005)(316002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a0gwaXlUUnpjTDZBWEh6YWJmZVgvVzVkNk9UcXl4NjRyOWZlZjZtOE00dFlh?=
 =?utf-8?B?QlhYN3FpSCtBMHFPbEhBTjdkYnkyMWlMUVkvMldzNGtsVFU5N1doRm5tc2pJ?=
 =?utf-8?B?dlkxMlp1UDZSd1E2ZkRnNnM5dkVoQ2tOaisyVWpUNnlXQ1hlL1h1SGhjQWpT?=
 =?utf-8?B?QlVsUXYvK0YyMnZ0YnZDcWRwSzNFdzU4L1V5M0hMblRDS0xNaHl5VG9PZ3kx?=
 =?utf-8?B?YXhySjVvQllNdzg1U2J5eDBnR3pqQmRXZDJPUVlNNGdjYWdDakJDdCtIbktn?=
 =?utf-8?B?bTQ1S1FQL2s1b0dnNUduSHMzZmUzZ3A5ZURxUFRUaFIzb3pGSVJEckE3ZE9j?=
 =?utf-8?B?N21rNytRdkJUdVJBNk1sUkZPaW5qSFhjOUJhTW1NMENLc3VnYU8xaHZtT0E1?=
 =?utf-8?B?bDh3KzhVdXY3Nm9hSWJGZks2RUppekVOWG8ydDlqQ1hFSEdMa2VWNk10bEpO?=
 =?utf-8?B?cS9GZUI1TGZocEtCdTJmbzJqNDNoaVJqZExMeURjQ3kzbHlMOGN4WG11VTBw?=
 =?utf-8?B?MHFSRWJpdU9NRk4zcnJDRkx2UXgveXBwYmF5QXFzdXVZSG44eTVRdmRHdThv?=
 =?utf-8?B?dFJYVTRqbHQraDZLUVhQeG9rYlJpMXIzeU85U3Vsc21JM3NtQUxwV0s3WG1p?=
 =?utf-8?B?N21tNmJzRWFaRS9CTkF2d0IvTHpRY1JZbzFvODRCTzlsWnpMdVMrTDVjeGdZ?=
 =?utf-8?B?YXVPc1RhOFJHbk9NdmhDQXNkb0F3RWFyZjhicllmV05QdGd1dU9WQlpsa1g0?=
 =?utf-8?B?eVhBUEJlKzJTR1U5RUhPdlBVdXp4T1FlUDZPZ0NDRzhuNXh3amlXMVIvK2k4?=
 =?utf-8?B?UndHa2ZqbDFmRVJHRkUwWG5yY2pRVnd5QXhCSTQyMzU1dWIzb0JReVF0YnNk?=
 =?utf-8?B?clAzOWJHbHF1TFpYcFNNcGdQWWZEcEVwNnlBMTJUWHNpNUtibEw4dkloakNk?=
 =?utf-8?B?amRUeVBNU1VRR0M1VVRzL0V0YmdjTlM1L0lKVVM2R0ZWKzBjWUMvbGhFSHRL?=
 =?utf-8?B?RHJVaFp2RWx5VHJQL0pldWZ2TG1kRGNES3UvSVd4NFpaTEVCWlJQVlVHOUEz?=
 =?utf-8?B?akNQeElIN0hXREcwWTk2QmdFOTY3bFNRSFlWbm9PN0tDSnBJalp0UStTaDFO?=
 =?utf-8?B?WmV0RlpuY3hCZXBwOGhYSFB2VlBEWVF3bnBvR1kyVStaY0RvVjNuamdjOTVo?=
 =?utf-8?B?czZTcnkycFZ2UkpVdXE5TWphSjB1eWJNOEQvMXAwQWwxRWY2WDJjOTJ4M2Jy?=
 =?utf-8?B?U29PdHNCTjZwVkpNWlRacTRhMCtqekxqUmRMQnJMUU9JbDByaVJOclBQYnJV?=
 =?utf-8?B?OTFtZE02VXRKWGcwRGs4WHZhazd1RktZVFhtQm5kbitNR1kyTHM0Y0xNWUZE?=
 =?utf-8?B?WUE2MVRNbWcyNjk5MEp1SnJlNDZPUjI4ZEl1K09rTTNkSE9lT3d6S3BuaG9D?=
 =?utf-8?B?RG5yRXVEL3JMb0FyOWhlbjJaRDBaZVVwZHZQaUJzM3IyOC9VWncvRjJQb3g4?=
 =?utf-8?B?Zk1IcWlYc1lUWGprY29XcG5Tcmc2WmFpV3NQM21kUUxKMmx2Q2RrOVpZdWtr?=
 =?utf-8?B?akFrT1NRR1I0bUhQRS9Razd4N1hmNW1WYXFQY0Z1dk80WGk1b1h4RElsRWFN?=
 =?utf-8?B?TnhLUEh3dFNkZUpwWEJ6bm9BNElhZzBhY1FMZ1k4bHRZNUthOGhmV1A4ckkv?=
 =?utf-8?B?V0JZZGZJNXdoYzVqbDJobXpqeUVuSDRjanR5RTllcElVb2R0UUxXa3BmenlD?=
 =?utf-8?B?cGF3Uk1WM0NoRitWNnJWUXZaekdOSUF6SFNvYkw2NkowM0drc2N1TUpnVHFn?=
 =?utf-8?B?WGJMTjVkekkxbzZUakhLUmJScWlQOFNaYnV5WUgzcC9OVDZCN3NpZGxYWVIw?=
 =?utf-8?Q?aeN+8lEp8KtDQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 932f8c92-56cb-4e49-3b1c-08d91a057ad8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 14:01:48.8975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HOJKgL2bPBitx77PxXJeLWBpZDHz4sLcicv9azXXhRjup+M3+6ZyMno27Kuq2KpsPahz7du34gv33nxnoTQtXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4397
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping

Andrey

On 2021-05-17 3:31 p.m., Andrey Grodzovsky wrote:
> Access to those must be prevented post pci_remove
> 
> v6: Drop BOs list, unampping VRAM BAR is enough.
> v8:
> Add condition of xgmi.connected_to_cpu to MTTR
> handling and remove MTTR handling from the old place.
> 
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 26 +++++++++++++++++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  4 ----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  4 ----
>   3 files changed, 23 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index f7cca25c0fa0..8b50315d1fe1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3666,6 +3666,27 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>   	return r;
>   }
>   
> +static void amdgpu_device_unmap_mmio(struct amdgpu_device *adev)
> +{
> +	/* Clear all CPU mappings pointing to this device */
> +	unmap_mapping_range(adev->ddev.anon_inode->i_mapping, 0, 0, 1);
> +
> +	/* Unmap all mapped bars - Doorbell, registers and VRAM */
> +	amdgpu_device_doorbell_fini(adev);
> +
> +	iounmap(adev->rmmio);
> +	adev->rmmio = NULL;
> +	if (adev->mman.aper_base_kaddr)
> +		iounmap(adev->mman.aper_base_kaddr);
> +	adev->mman.aper_base_kaddr = NULL;
> +
> +	/* Memory manager related */
> +	if (!adev->gmc.xgmi.connected_to_cpu) {
> +		arch_phys_wc_del(adev->gmc.vram_mtrr);
> +		arch_io_free_memtype_wc(adev->gmc.aper_base, adev->gmc.aper_size);
> +	}
> +}
> +
>   /**
>    * amdgpu_device_fini - tear down the driver
>    *
> @@ -3712,6 +3733,8 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
>   	amdgpu_device_ip_fini_early(adev);
>   
>   	amdgpu_gart_dummy_page_fini(adev);
> +
> +	amdgpu_device_unmap_mmio(adev);
>   }
>   
>   void amdgpu_device_fini_sw(struct amdgpu_device *adev)
> @@ -3739,9 +3762,6 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
>   	}
>   	if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
>   		vga_client_register(adev->pdev, NULL, NULL, NULL);
> -	iounmap(adev->rmmio);
> -	adev->rmmio = NULL;
> -	amdgpu_device_doorbell_fini(adev);
>   
>   	if (IS_ENABLED(CONFIG_PERF_EVENTS))
>   		amdgpu_pmu_fini(adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 0adffcace326..8eabe3c9ad17 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1107,10 +1107,6 @@ int amdgpu_bo_init(struct amdgpu_device *adev)
>   void amdgpu_bo_fini(struct amdgpu_device *adev)
>   {
>   	amdgpu_ttm_fini(adev);
> -	if (!adev->gmc.xgmi.connected_to_cpu) {
> -		arch_phys_wc_del(adev->gmc.vram_mtrr);
> -		arch_io_free_memtype_wc(adev->gmc.aper_base, adev->gmc.aper_size);
> -	}
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 0d54e70278ca..58ad2fecc9e3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1841,10 +1841,6 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
>   	amdgpu_bo_free_kernel(&adev->mman.discovery_memory, NULL, NULL);
>   	amdgpu_ttm_fw_reserve_vram_fini(adev);
>   
> -	if (adev->mman.aper_base_kaddr)
> -		iounmap(adev->mman.aper_base_kaddr);
> -	adev->mman.aper_base_kaddr = NULL;
> -
>   	amdgpu_vram_mgr_fini(adev);
>   	amdgpu_gtt_mgr_fini(adev);
>   	ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_GDS);
> 
