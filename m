Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F28E37D443
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 22:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BE56ECD5;
	Wed, 12 May 2021 20:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2059.outbound.protection.outlook.com [40.107.96.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9756ECD1;
 Wed, 12 May 2021 20:33:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LDSz0qLDcvImzpKjk1qjbDmljDBdua6+8j1TwZHaQYYYHM73ZMCIte7Uvu7FZNsZURbWYgJCzoOVHfDi6+X9qo7R7461dkzROiO1np2y5sC+kih4hKCxjiNKPfb8k3p+6gGoW00A313+X8LZF2a19XPhQWmaYfUnxCO7kDNvROgjXBEvHSqO71NqSTjGx78Y0ezt3H0JgtPQS+5CVcFHNxxexs++Myhbx1JEfSKsw3CnhzTIm06+GEaef3uckvXmmGCvzoDMhIXadTRpUc51nvMLq3Eh84oHzf2CnPYF3LfHyrGYmZWNoaCrwRY9FEBsaOjuiDTEIkqK2qpCpGb0eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHWszVmICqQue5ptWOYTNg3n20cvS3Ha0LMXWPNgxkc=;
 b=LqK/h3vX5ELrZJkuanv7GXyqA2mIKrqo4asKpX1JzSP5hZGx/JebfnSfPdzijfySPuGdPuDXktMO7tawqisvvkFCGNYanDlvSqpQu8jKkH1/V2G+erx7B4JFG1GagpWMMEHIbDMACHJKbeXVR8L2F7AV3kQgP+jKJTZUgy6itxgcRpfJWwzvSVHwOb5mHXw1bhRIKB6xZp3sVdgBXdAkFxy8cAmlNnQKh/mM5+YFyQJ2mjSrGHmsEETrogzpphKps9xhSNSyv/nfCHF9hdfE0d5IpaZPUF2Qd5pXsp7L4E7xMWcODLEEEld/WxY43laIZ24cbdFcJmgY75CBP7NXag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHWszVmICqQue5ptWOYTNg3n20cvS3Ha0LMXWPNgxkc=;
 b=sbXyZ3YmgGJvkbV2CzT8ZhPcSRHfagHgCCU+AM456D5FhOIi9lcxqyfSN/na8LVKzDyZ0jjmJxxydr6DK3dRU1JjM4uqgok/5iLHlnurORHlXYqQNoJte7YTT5PPbGPnQPVBz6DCSMhOTJzq4j/IfthePgk6AJOSMFurMfk/q7E=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5257.namprd12.prod.outlook.com (2603:10b6:408:11e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.28; Wed, 12 May
 2021 20:33:46 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd%6]) with mapi id 15.20.4129.025; Wed, 12 May 2021
 20:33:46 +0000
Subject: Re: [PATCH v7 03/16] drm/amdkfd: Split kfd suspend from device exit
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-4-andrey.grodzovsky@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <d17c82ae-ce00-9496-b2ed-8761814f51fe@amd.com>
Date: Wed, 12 May 2021 16:33:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210512142648.666476-4-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [142.116.138.207]
X-ClientProxiedBy: YT1PR01CA0083.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::22) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.138.207) by
 YT1PR01CA0083.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.30 via Frontend Transport; Wed, 12 May 2021 20:33:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36b10551-d1e0-4450-e5f1-08d915853dd1
X-MS-TrafficTypeDiagnostic: BN9PR12MB5257:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB52573AAE1F4D4FDCBE1500D292529@BN9PR12MB5257.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zD3tN95r/V9FB4vwSm933sdU4ZhdWqKXy23sCFzd6Un2VhYr5WHDMxkAlP5QxkcRzfs7bC7QRQK7/e8tXB0I1ZAOag4IrZT6ZnhTGb2pQia2yFLvtqgMWLYfHKMW9UFib2s2cbFVLcg8N0crYTFh9PQRAz+koca8fXjGqykWpkCib4ryJcDcCWPmFZr5AD0WivcatbhmfqxFWfFdve3EqD9pNR4Atp3/jn3FZiTfPoQYh9E3MeWQFxc3A9vcpZs2EteEkjiKoeO+/tnVz35jbwNEH2HM9NLMLg+tQ+OZRnThPR5+9S1/GkdlBvOj9OOv+iq2YqhdK/aqYxYjP2jU2+D7A6i9ReTfY6+mxgrRgZK9RT46FW9z/cxRRK2KI8p9AZ6RRbRmqKIABQV6Sc03C+khlMmZwn6Z8j2pTI5BliX5YQZ5w3eyA0TVaatJD6t//KXZtkNP/DK8IaDHYspAIVql29uKfK8H51JA8S0qJNox/VDO2/8JS8XoSOalvx3OdEK2adz9vQ3+o/fgeZnaWttKEXwfN11H2WPvAFH6XFGL6IZYwxsP6ieC5PqFfZB1YmtsCNP6fgTWUAyWHPwZMs81Dd6AN+po6ejhy8waHxIlo2Ko0GP/y7W1u5wnyF4uhVwYLjLrCmA63JCPogQe8+aYTaSTz2JvkeucghFXNjw+bPGEO35y9+fxzDsp6GO5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(66946007)(66476007)(66556008)(186003)(26005)(38100700002)(86362001)(6486002)(316002)(6636002)(44832011)(16576012)(16526019)(956004)(2906002)(478600001)(31696002)(31686004)(5660300002)(83380400001)(2616005)(4326008)(36756003)(8676002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RFNoQVZnU0k2SlZoTzZGRkNUVUtCZkFwYXNPOTlOV2YwdkQ2b1JqTFpoSHc3?=
 =?utf-8?B?bGNlQzZmamRtUlB2RnpaVnFISFlWUGFzbGVXSVFlYXNxNzE3ZFgydml6YWtx?=
 =?utf-8?B?UldBakFaZXRubEdtUlFHVUQ2bnRadEJ2M0ZNWTFaWDFIbzF5ZnVrcVhwamU3?=
 =?utf-8?B?QmFwd0dhZkdEVWttcFRSMjBPZ2VaNlY5ZDBnM0M1amNKNndSeTFxL0h4TVVt?=
 =?utf-8?B?UDhMNzdFY0FkUkdJV2NWWDJrNlVONjk1QjE3RmhwVmJPTVpvVEFxcitRZkNN?=
 =?utf-8?B?ZFVHSU5COE1DUFlRdDVFWExRTzdjU1pEQ2RCdm83bU51QkJ3SWRlclRBS3Bs?=
 =?utf-8?B?Zy95dzJOdjMwWEpEMFZaMnIxTlZqRXU0dDhhWXQxWHFwLzFXL2NCREtncmd2?=
 =?utf-8?B?T2dVNUdpVHRneUZVemFoWU1jNTNxRUlrVkRaSFh3TlhiUFYxa1dDSlFpS2Ew?=
 =?utf-8?B?ZEYrZEhhWW1vNVFYQkNOdlh4a0FoWWM1T25GbmVtWVhmU2hTZmhRMVNIeHhQ?=
 =?utf-8?B?aWVqOE96dHVaT1J0SUxpVTY4bEd5OUZOQ1ZKUXNnV1dldjRkQjdHaUxqaTdy?=
 =?utf-8?B?akhMNlJlUmtOTTcrbHlEZ1VONlF0dGhXazFKcG1RbHhQVmFveldTSWNnUzZK?=
 =?utf-8?B?MDBxOW1XR0kzOGRQVnNmQXkxc3BzelJ6ejFuODlReFEzdGtKb2twQVVDZVd3?=
 =?utf-8?B?V0FJWDhiTEtnR2VzaEtnN1k5WWpyMzM4VC9EOEpoUmxRZHU2dndVdEhTcmlw?=
 =?utf-8?B?TnJIU3NSVzMreVVZbFRMSU05WVVoelk3U1dNS3BSUkN6WGZIR3U0ZVRacjda?=
 =?utf-8?B?YlZZeDlRTzY2d2NUUlR2MUhuOTlmdTdCai81ZkNVTkxkL0pRVnJFczhqbUVD?=
 =?utf-8?B?MUhQcUUvZ1d1TXlpVFhVMEFoSTRmVTI5WHBzN1gzUDE1VE9VT3BTQkRDSGJw?=
 =?utf-8?B?eTVXQWJEVkEzeXNmYVpWQ28vbjh1aDhDVjFFZkNURGk3YjFzNEJYNDROWXBR?=
 =?utf-8?B?THJOaEtYTTZ2eWJ1MjdqMmd0aDNlMlVLUDhxamNUV0s1OWZoSDg4Q09ZQnRX?=
 =?utf-8?B?SnpCWm5ZNGdFbEc0aFAxUSt1d3VkTElQc0QxRDJ0NDB0VkRKdzh1RWo1R3FE?=
 =?utf-8?B?K1h2Ny9OT0E2NUVYYVFNNlpkazlabkJVa045WExHeFZVbmh5RFh1VkdIbWhL?=
 =?utf-8?B?OGFTTU5QemJGcVlUek5FNGo3dHdGdUF6NjAyT3RVN2ZwL2kwRGVqczJtYjVO?=
 =?utf-8?B?akdiT2R4aWZqWTd3NHRZaHBSOEkvRmQ5S3ZBL01LRGdQT2h0YVgxY1ZHNUlT?=
 =?utf-8?B?aFBMNlNsenhHOXpYYW9XQTQ3akFLV3J3clQzTGVITG1BL1lRNFQ4L2NDVnVr?=
 =?utf-8?B?d25SNVV2akdlZ1hxQ3I5RFN0Nm1HdnBuWFFUZGdEdVhvYTN0YnFYdnRKdXN1?=
 =?utf-8?B?R0U4aUdpcGxud0NGMVJETUkwcWZCTzdqbzZSZHBTYURvNG56TW9USGJKYldi?=
 =?utf-8?B?cEU3ZXpqempZWndTY2ZtcTl1Z3NDQWFaeWFxcWgrRVUxZmFKcTFvcHVtNitQ?=
 =?utf-8?B?T3lWRmdMeGJEdThiUGhIczVCZG5LMDJvdHBqMnhsSkJTQldqL1p5OGxHOVcy?=
 =?utf-8?B?THhEemJJRCtpWFpKeGN5eWwwV0kzbi9McWdib29abjRPNldUT2dzaTB4ZTJT?=
 =?utf-8?B?RG8xL2JwWVlyVFkvd0tuVkhoelZwWjJqcGVjZ3dtbW5kaUg4TE90NklENUZq?=
 =?utf-8?Q?LvSGmARPbPjK2CgT3D4Vib7yQEda002HPzSOEf4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b10551-d1e0-4450-e5f1-08d915853dd1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 20:33:46.3377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iaKI98/KeBwuPKkEnPMGqdxKKcY37Y/LzxMk/cEYONLjndYAiVzv2r3zkd9/TC8rd210hbaENDsCaqyrZ/WWuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5257
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2021-05-12 um 10:26 a.m. schrieb Andrey Grodzovsky:
> Helps to expdite HW related stuff to amdgpu_pci_remove
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h | 2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_device.c    | 3 ++-
>  3 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> index 5f6696a3c778..2b06dee9a0ce 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> @@ -170,7 +170,7 @@ void amdgpu_amdkfd_device_init(struct amdgpu_device *adev)
>  	}
>  }
>  
> -void amdgpu_amdkfd_device_fini(struct amdgpu_device *adev)
> +void amdgpu_amdkfd_device_fini_sw(struct amdgpu_device *adev)

You're renaming this function, but I don't see you fixing up any of the
callers. Looks like you do that in the next patch. So this patch breaks
the build, the next one fixes it. Maybe you need to refactor this or
just squash the two patches.

Regards,
  Felix


>  {
>  	if (adev->kfd.dev) {
>  		kgd2kfd_device_exit(adev->kfd.dev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> index 14f68c028126..f8e10af99c28 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> @@ -127,7 +127,7 @@ void amdgpu_amdkfd_interrupt(struct amdgpu_device *adev,
>  			const void *ih_ring_entry);
>  void amdgpu_amdkfd_device_probe(struct amdgpu_device *adev);
>  void amdgpu_amdkfd_device_init(struct amdgpu_device *adev);
> -void amdgpu_amdkfd_device_fini(struct amdgpu_device *adev);
> +void amdgpu_amdkfd_device_fini_sw(struct amdgpu_device *adev);
>  int amdgpu_amdkfd_submit_ib(struct kgd_dev *kgd, enum kgd_engine_type engine,
>  				uint32_t vmid, uint64_t gpu_addr,
>  				uint32_t *ib_cmd, uint32_t ib_len);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> index 357b9bf62a1c..ab6d2a43c9a3 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> @@ -858,10 +858,11 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
>  	return kfd->init_complete;
>  }
>  
> +
> +
>  void kgd2kfd_device_exit(struct kfd_dev *kfd)
>  {
>  	if (kfd->init_complete) {
> -		kgd2kfd_suspend(kfd, false);
>  		device_queue_manager_uninit(kfd->dqm);
>  		kfd_interrupt_exit(kfd);
>  		kfd_topology_remove_device(kfd);
