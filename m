Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE0D383181
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 16:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67CB6E9B1;
	Mon, 17 May 2021 14:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460986E9AE;
 Mon, 17 May 2021 14:41:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SfNNOIubHpBEbkSExoGLMYS1ZdrLBz6k93p0Vbk0qCPAFtncTtCtf00TYptnOcMWqOpk7q9RgmXikChk69MpE1n2TVsZJ0Sh8F4OhMhYEoxbfufxYPbIt+CR9LG4HBx+XFpSoEkn1bQza4Zrcu05GgkT6RqAyxv6ElAxj4cdKLdvbdtEo6wXWo8YGm59ulTh/JXJdNp6BnNzjSWbVI1Q26M6EJX9FXn3Vv9Aufntw8widGVIBUcKOYEkRSJlnY7VPpMU3RjrM0u4BjkTo49aplSojK/QoeOivX27pUyqHLVTeMkW+bAbMguh/cZbx+EO2hmNhJmMoGpNMBCw2OTNDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BF8hxzqxfau3eK1fDMo1UVfoYa4Oj9P1NKMYJOU2u5k=;
 b=P1OVaKwgONDGvHBA++FJ+pANSJd6G6AVumOcqP0TsqqkDdPBJGkI3irN2Cx/nOcG8ZzoCb2BtDHmkw/vLO5XMqFikIo7VuPbuQQGdzrn039gyET0TFWWEMTg51NzkQ5dx3UWhwVkyda/e/80jApILFRliAkagxjEHVeAaM9+oxjies9ODRVLZH2ykaABiOJ8CHq5lArAnbxlrtuegzRdGyMBccPHVBbzDN2J+y5XB3lal3Pe+2MliHBvyzQSFmKPnb6BZyk2OiDAvUJT+d8kOVykA3RXMTqsNGD9lzkDTMABzwJrkiqNWMbVWxgdyDaawSfEem4bLU6947+ybdQfaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BF8hxzqxfau3eK1fDMo1UVfoYa4Oj9P1NKMYJOU2u5k=;
 b=zMvlSs2RPYkdT3vbSdwcDrvx4SCgwieZq/Ksc5XtmPVGFtXgmFii6qHCfdErF86F7ZZEC1uUriRLbOzNqs+Sd0U7Y/Ok/gaWLq9hzYvXuZL8TvgHn+b+QDe9DTdH8HwZ1IRB1wHmtWjY7ViyZC2GVj+bKjxSv8WXg1A6s/B1oz0=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4766.namprd12.prod.outlook.com (2603:10b6:805:e2::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Mon, 17 May
 2021 14:41:07 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 14:41:07 +0000
Subject: Re: [PATCH v7 16/16] drm/amdgpu: Unmap all MMIO mappings
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-17-andrey.grodzovsky@amd.com>
 <5e2f2b3a-78bd-38e6-8cc1-d138fb4ddaa3@amd.com>
Message-ID: <cf88ff87-211a-4b85-9415-c91afc26bdb7@amd.com>
Date: Mon, 17 May 2021 10:41:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <5e2f2b3a-78bd-38e6-8cc1-d138fb4ddaa3@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:e3b1:83be:2b02:85cb]
X-ClientProxiedBy: YT1PR01CA0139.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::18) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:e3b1:83be:2b02:85cb]
 (2607:fea8:3edf:49b0:e3b1:83be:2b02:85cb) by
 YT1PR01CA0139.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.30 via Frontend Transport; Mon, 17 May 2021 14:41:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1eaf5d13-5157-45d1-ebcf-08d91941ccf2
X-MS-TrafficTypeDiagnostic: SN6PR12MB4766:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB4766E0DFF113080A608C7D3EEA2D9@SN6PR12MB4766.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JRVrPswyIra3/DxlxOd5nV9XzfqsNxtZmJZ0KA0weXVcqKxQw3+BaHb34YsbN8I09mqU0SBIIP8kFGfiUxyc4J5yfIeDfN6zHAtjneTogbcu/YPAMPivV+cqn4ZCQtrxdaPdjNaVyHAgQf43Ne1XdcBkjbHn/ZCrQ14omB3ecPO6+kboiKhzsMVk8jD48FFkUkjWfDoeRbVXjhhO1EUZ7bFNQ1xjRSE8XISGT6XnXTptHixbyqX1ennAsgnPv8UVjbELXJh1ovjMJvZ5GdDnLCIhDobg+MiTJNZmcj+dr9QyDP73cAMgahpsOBGw6cNaU+imfxZ9IVnBF1p7l5Zf84qWwfJFxqBWEX7Buk9UKy8RGC6pRjVkbXeiGWktmBa3XvcL9ya4gTdLtxEJj81NCaBDF/T+FQYab5ieZMsRffNkGXlDwGS9GCEjga2ZaxIgtAtHyz2QnPY6Bl6fL5Th5dDwwOVxRJTHhbmgn9p9lWuDUQFvqCM/Igs4h1DUVw6c0u9A1CuVp3Yjz8fi4yHOwca3E7HdjaOxTAJF+HFyFH1/YDbvI/qUxxlEnN6wj7ArWKJN8TutVMX3QQ1Bb4h3Qu73Z7CGOx8tLkCNQ36DsHmd76CMHq9JIaUbE+w1JbJ5H1tRFyuoqN3PC+REeaWyBg2hxOsoFYBtLL8+Yf/JAnUr5M1qoSmT7Huqv+8337Ds
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39850400004)(366004)(136003)(6486002)(31686004)(66946007)(52116002)(4326008)(53546011)(31696002)(186003)(8936002)(8676002)(2906002)(6636002)(83380400001)(5660300002)(316002)(38100700002)(86362001)(2616005)(16526019)(66556008)(36756003)(44832011)(478600001)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NVdMOFc5TjlxVTBRQ1VCQnFFVFRyRk5VdENFMFJ6cmlzRHhtN0pVNmdkSzU2?=
 =?utf-8?B?Uk9ueWR0TXk3cU9PS1hYZDRleHdzNklGVFhLMHlsTnhvR0JCa0NoMXNka0t5?=
 =?utf-8?B?VHp6OGFQZ09za2VUSngveDE0SWhMUDc2UFB3aU1zNlkrbCttaTdoNkFBMk5E?=
 =?utf-8?B?aWNjSVB0SXRmd21zelQxMzJGbWllYnBzSEZNcXdkWEdGMVFlQTI0MDVaVlRM?=
 =?utf-8?B?ZkFsR0t4UXFiWTEvRTRwVkZreFg2Z3NlTUFLZHB3WHlXK3NRaGFVUXZGMzFy?=
 =?utf-8?B?Q0xkU2dFeStDWWV2U0ZnK2IvQWVkYjdobWh6TnBvODVya3ZuYkpITmZnN2hJ?=
 =?utf-8?B?VExyVzUxMDJOUkp3ZEViSVNsNE8vRmFhVXJOVnBrVFN5SlhZOGU3dEE3THhy?=
 =?utf-8?B?Rkxpd1JwdndjVTJlWU1NK25VS1dxUE5Ea0t5U0YyL3VuR2VjcTUyN3MrLyt5?=
 =?utf-8?B?ajh6VjgrWEhYelRkMG1CWVoyR1RXUWpuREhINnIyZjltSlgxb1MrQTFvektT?=
 =?utf-8?B?K1FWZlkycXNaSEJxdGRhc2Q0LzR0L3BkdmNydTNHV3h6RmtmdnZ4ZThzSGZq?=
 =?utf-8?B?TlpqN1dQMDRCdXM0N2hOL2M5dlBiNW56OWlFTS94QmVSNk5HOGNROTZDcFhM?=
 =?utf-8?B?YnJ3K1JFUzRiYjB5bzN0VjhGMkE3cXgyY0NXanJOTm9BZkUvNkc1aUNqVHln?=
 =?utf-8?B?ZnBJV0VyS1hkanNxTlZXSGdTZ1NrN1I3bVBaUVY4aEZ0NFp2MzBJeFB6czIv?=
 =?utf-8?B?c0VuTmpmZno3T1Vpa3BDVk1XRDR3Y1B0UXNUVTRwaHgrZVZuYWhwRW91NWcx?=
 =?utf-8?B?YjEzNDd2SWMzc1ZtTE1aTVkxMHo5bTVtcUJORTdxa3RjM1B5Nk0zcTRhWGJC?=
 =?utf-8?B?cWpiQ29vQXZzWG1xeCtXNGhvTVBkSGdxUlBpV2RwSjRHekxnNHJjNXFuL0gz?=
 =?utf-8?B?TUcxRS9pcFVFTGxZZ1JUdENCT0dvUUxNdlZRMjhKdFFNQkQzV1VxTWFRTlpl?=
 =?utf-8?B?MHhLeVlONHNCc1FmN2IycnFqTDdsVGlIRTB3eUQ2d2hRYXhtWWtzRmlIdlQx?=
 =?utf-8?B?QXdudzJGRjJXcG1oYTRoRzUrcnBwVkRESm5OUzl0ODZ0WG9kV1RxTEE1UjhP?=
 =?utf-8?B?ZUd5Z1RWRE51N2xLNVpWUXBHRFdnOHRkTEdVZTlpQXhaUDgzT21vYXZqRjRD?=
 =?utf-8?B?RUVPV2E5czZPRUovVFJTTXBPcCt5R21TeURYTnBGM2tKN0lrY1NuNnlBODZO?=
 =?utf-8?B?VWxNV21qQWg3M3diRkdzSTR2YVpTWFVlS0Z3anNXU0h1THh3UUJKczhVNk0z?=
 =?utf-8?B?bHpNeTBNUXIwQkE5bDVyTEg3cm13anh0Nm1qa09ZcFNXakFyU3FrZlJFczFp?=
 =?utf-8?B?RTNZUDJQQUJBcGFvUFQ5N3dpYnl2dWswaytxN2VPMlp6MWxlYm04QzBHQlF5?=
 =?utf-8?B?a01lQXBVcDZ2OTNPMnp3WmlaY3IzVjlrRVpsU3hiaVlZbGpWdFAvYWRSQWY5?=
 =?utf-8?B?cXNxL0tEbUowajcvUlRvMU81N3orVVN5MkNYN1AvbVVjdkdSS1Z4YnNnTGk0?=
 =?utf-8?B?ekVaTExML215cGxCd1JuVnozWERTUE5zOG9Eb0lmUVJRZmhDY0JlazFrRWRB?=
 =?utf-8?B?dmJyZXlGNUYxYmxEK2hmZWw1TGlFSms2QllXSzVDZWFHdTJ3Qkwvd083dXBE?=
 =?utf-8?B?VHcvWlVPUWFyUlM1Qlh6YS91aDdrUkVNU21HYXcrWXR6NDFubDNVTnlaM1Nz?=
 =?utf-8?B?VEM3aHJrcjlENkd2blptMEhCLzBoVTczMXJvbWJGWFNTL1JXaHpZUzJ0UXpH?=
 =?utf-8?B?K2gyMlFRWXlpUjh3U1lrRU4xdTd6eStaLzRKRkNjWkhCWXZoR3BSdlFoLzA0?=
 =?utf-8?Q?VEAYaLikRwSPd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eaf5d13-5157-45d1-ebcf-08d91941ccf2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 14:41:06.1611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QeFZAGCmf06GdbZPi9uKrv1oSyQsDr2J95DySMcGRiyu2eVHCAUBr1q8RMsiaBRRrXi3PaIL/BcxVVDC2/BEKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4766
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

On 2021-05-14 10:42 a.m., Andrey Grodzovsky wrote:
> Ping
> 
> Andrey
> 
> On 2021-05-12 10:26 a.m., Andrey Grodzovsky wrote:
>> Access to those must be prevented post pci_remove
>>
>> v6: Drop BOs list, unampping VRAM BAR is enough.
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 24 +++++++++++++++++++---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  4 ----
>>   3 files changed, 22 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index f7cca25c0fa0..73cbc3c7453f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -3666,6 +3666,25 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>>       return r;
>>   }
>> +static void amdgpu_device_unmap_mmio(struct amdgpu_device *adev)
>> +{
>> +    /* Clear all CPU mappings pointing to this device */
>> +    unmap_mapping_range(adev->ddev.anon_inode->i_mapping, 0, 0, 1);
>> +
>> +    /* Unmap all mapped bars - Doorbell, registers and VRAM */
>> +    amdgpu_device_doorbell_fini(adev);
>> +
>> +    iounmap(adev->rmmio);
>> +    adev->rmmio = NULL;
>> +    if (adev->mman.aper_base_kaddr)
>> +        iounmap(adev->mman.aper_base_kaddr);
>> +    adev->mman.aper_base_kaddr = NULL;
>> +
>> +    /* Memory manager related */
>> +    arch_phys_wc_del(adev->gmc.vram_mtrr);
>> +    arch_io_free_memtype_wc(adev->gmc.aper_base, adev->gmc.aper_size);
>> +}
>> +
>>   /**
>>    * amdgpu_device_fini - tear down the driver
>>    *
>> @@ -3712,6 +3731,8 @@ void amdgpu_device_fini_hw(struct amdgpu_device 
>> *adev)
>>       amdgpu_device_ip_fini_early(adev);
>>       amdgpu_gart_dummy_page_fini(adev);
>> +
>> +    amdgpu_device_unmap_mmio(adev);
>>   }
>>   void amdgpu_device_fini_sw(struct amdgpu_device *adev)
>> @@ -3739,9 +3760,6 @@ void amdgpu_device_fini_sw(struct amdgpu_device 
>> *adev)
>>       }
>>       if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
>>           vga_client_register(adev->pdev, NULL, NULL, NULL);
>> -    iounmap(adev->rmmio);
>> -    adev->rmmio = NULL;
>> -    amdgpu_device_doorbell_fini(adev);
>>       if (IS_ENABLED(CONFIG_PERF_EVENTS))
>>           amdgpu_pmu_fini(adev);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index 0adffcace326..882fb49f3c41 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -533,6 +533,7 @@ static int amdgpu_bo_do_create(struct 
>> amdgpu_device *adev,
>>           return -ENOMEM;
>>       drm_gem_private_object_init(adev_to_drm(adev), &bo->tbo.base, 
>> size);
>>       INIT_LIST_HEAD(&bo->shadow_list);
>> +
>>       bo->vm_bo = NULL;
>>       bo->preferred_domains = bp->preferred_domain ? 
>> bp->preferred_domain :
>>           bp->domain;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 0d54e70278ca..58ad2fecc9e3 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -1841,10 +1841,6 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
>>       amdgpu_bo_free_kernel(&adev->mman.discovery_memory, NULL, NULL);
>>       amdgpu_ttm_fw_reserve_vram_fini(adev);
>> -    if (adev->mman.aper_base_kaddr)
>> -        iounmap(adev->mman.aper_base_kaddr);
>> -    adev->mman.aper_base_kaddr = NULL;
>> -
>>       amdgpu_vram_mgr_fini(adev);
>>       amdgpu_gtt_mgr_fini(adev);
>>       ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_GDS);
>>
