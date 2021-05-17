Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65890383224
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 16:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853806E210;
	Mon, 17 May 2021 14:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038316E9C6;
 Mon, 17 May 2021 14:48:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipWG0Nu1rLtp0PpC5lkx4ENa5LEGAsagYytAiC02gDPqxRr1L7hh54J+/o51jMtuYFEyljirLZHQN0qgqKT1QiV/nIBg5xiMZwCKJoQkWJH/zvlMrWQeQpIr3YOotCmnyigeTfg5revTA6IMN2NlqjUuSex0KnzZteuH8VEQFnQJ9hLBgR4IEn98EqkHAOrVSfSuKXcrOLy5696GLYwPjnPx+R9XJYOmCJiYFrII0dYj6q2LD/DiGVZ8T2zbI18kRytQ1RTcCJ+pXZBTYtDDsl8ajZQ2c/eCTvAfMFWJJmPOnD5Wmu5SWs6CyBzBetYgeypIJdNkFQOZpq0mjVe/sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Roe/X31l1oUB61oufCfH/uc0+dPDv+jWQ5bBkbuNOgM=;
 b=GbYaLDenfjqYmJoq2F2yaVUQUgPEue/n+dhdVRBvbFaJdzsjJsWqU3ax81vCS8ATI77uS8NN2NbHZxPPVRWrU98LS4WzpGRO+Yh6jMGWXf5/mHUVfzkyzQmjPp3y3YUQL7XuB5ijakcSK3/TybJ13BA2homdrhnA+9bN6AKOsP4xbC4O46qDuqTp8h9KkrLbBW6t6GorYeHmwhJiNOZmzCY3Z8tv3Bej1/uJlB+3BY0HjNZMH1l1X4HZUZr7tRb7gW8osmhFNzyn64wGx/+vOYi4h43S9SxiU7fnM0Cp/jI+ratyklDSPIRB4veStvpmF/qRkPdEFxSyRtqCl0ts0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Roe/X31l1oUB61oufCfH/uc0+dPDv+jWQ5bBkbuNOgM=;
 b=tPzo0dbxhnSJSbbbInFgz1m6oQlVpLVgGLJDBEV5tQmwvIbNlj8VYZ28+jp+SQ1IGH+pXiaWr1oZPHN9KLIWAo5e+YNqsbAGYkR3PBRldnZby32Fng6HGWjEF/QYhA9Dlgio9bTruM6wtUc22hMTyRWicPAhxM+3RT3f49LGl6E=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5066.namprd12.prod.outlook.com (2603:10b6:408:133::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 14:48:41 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd%6]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 14:48:41 +0000
Subject: Re: [PATCH] drm/amdgpu: Handle IOMMU enabled case.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <32b61077-f760-8fe0-c00f-256a97d2977e@amd.com>
 <20210517143851.475058-1-andrey.grodzovsky@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <b69780b9-efcd-425a-4d1e-599ff44f9ae8@amd.com>
Date: Mon, 17 May 2021 10:48:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210517143851.475058-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [142.186.56.206]
X-ClientProxiedBy: YT1PR01CA0046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::15) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.56.206) by
 YT1PR01CA0046.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.30 via Frontend Transport; Mon, 17 May 2021 14:48:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9838dd7-b442-4999-e35d-08d91942dcbf
X-MS-TrafficTypeDiagnostic: BN9PR12MB5066:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB506689614877A3F53E1FB053922D9@BN9PR12MB5066.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TwAvOVbci7kzL6bbNJEG9uKt/VoCZ/D/fnEa0wJnYqW46rMD7udun+DiBilEfiggdzB/v8gg7DkORLvkQ+YawDj1ioIcH7Pr/smd/B78CLXm/xFeklGrDMJOKrO85j1bQwXsRv7ADW5sbfX0tyNDR336GdUsWPKyCaGLOfgSzHOcOGInTD4XQvavOZs2G9FlKVJcX0VyHoFm8t4PMJ/RYxC/EGOvb0j2oUdfu4h31MBNROTdIQ+2shlBmMR8/RfoF7tb3nJvQMsEfMk6hgW+JVsE0zXOE1vTLf5asccW213k1Xkk+hk8BDuaspWG8PBOXjkGhINrik5eAKfLmKMJ/Q7T6zcophFThHII5firHjIiIyKlzejCHsWyIE0qJ/OEtPLNqa03mJYN4EeopXX0deOtB6+szBbcZ24515J65Uw/KSZ6ppLhW5isQPeW/kTNIIvMgZcvp3v81BhPyTGuGbd3LagsjW+Ak2CpDTRiU8pUVTKGMJIhB6pATJKNE3GhCWRDMMEYyE8h6PUbq8lKzhg2jua4QbfMoLTAOFrJlzM8XBiS4EOBNWuVOOIRLnRmPTRv6Gro1GbT57hnypm407ozdQQkQXsFFT/FUZFxvIEdIbKBXh2KlWqXSgUFh+A4R3e2azT0o76HNB1/NHK2zjEpSIdYEmXZ6jj9Gpq68RJOKNRjYiu59AZKaQlvUGj8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39850400004)(366004)(396003)(136003)(376002)(316002)(16576012)(956004)(2616005)(16526019)(186003)(4326008)(6486002)(86362001)(31686004)(26005)(66946007)(2906002)(31696002)(8936002)(83380400001)(478600001)(66476007)(66556008)(5660300002)(6636002)(30864003)(36756003)(8676002)(44832011)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aTV5aW13S250SHR1bTdvenVxSmhLNkFFaGhlcmJDYTB3SEltbGZlL2FQaFdz?=
 =?utf-8?B?VWpoeWdjNzJjQUdCUEw2cExmQVlWUnFXaEh5WXNoSmhrbzdiQWI5MnJzNm93?=
 =?utf-8?B?RnI1ajNkQlJNenA4SzBRL29maVFuTEUwSFhYMlFLRHUxcU04ZVRvS3lLKzFm?=
 =?utf-8?B?dU5UekdpcEhzVXFYZEZsdEoveGpKa0Vnci9mTGMyVExJeEo3b3JaQmxLZXVV?=
 =?utf-8?B?OGtLNDdvTFZnWWVhZDFNdDVOYWh4MHFRWjMwRGdkd1Z0Z3ZQaytLSjczRXhq?=
 =?utf-8?B?QTZMNTFEOGx6WlVkK1JUY051cE9WSjQ3aXRZZGtFb3YvV2dYanhHR1l6VndC?=
 =?utf-8?B?NU1HS0RWSVNZb2hYajVpYXZkaTdGTlNhNkd6NkdlV3VnQUFMRFNxWDBYQXg1?=
 =?utf-8?B?TGxFMFFmdU5nWHpwNjZLa0ZNZTl1Y2N1Z3dQN2xiVVRFeVNJdkliZkhmZnVP?=
 =?utf-8?B?Ukl2c0ppdUptUGhRcjNEbU5uWlN3Nkx1Z0JHSjJWS2pYOWsrTFE2UmFxZGxJ?=
 =?utf-8?B?R3NESTN6SlUxQ0YrRElXR0RCa28zRGhNN3pWZkx0M3hoV2V4Qk83WUVZK2lp?=
 =?utf-8?B?NjJaTEExbWZ2RmJWU0tMK2RXU2lEUTBpeUEvUmZEejBKRitPdGxYNjdnWDRM?=
 =?utf-8?B?UDhjVkxiazhoTVVqUnZuU1VaY3dSZTRYd3kyeExYUkdkcml4WEdmL0pqdkVu?=
 =?utf-8?B?M045UFJSTktxZmkyMHN3MWMrRXdWNjVqTVhUZldGQTRMODJUdEFCdjUxakIy?=
 =?utf-8?B?dEkwU1hrZXNrM3Q5NlZSUHdEbjJDY1kzMU9MbGt3SlIxdzd4RUFXa2swRzVh?=
 =?utf-8?B?Um5GUXU4OWRKallJLzNzYThPa1VUVEd6WHE2ZUFJNE1PeXQzSDE2azlxWmo4?=
 =?utf-8?B?S0xUZGVvalhRUFp0ZlgyaDN2Q1M2K2VjMFFnTXVVNUtBMCtNak1aNWFpSVlS?=
 =?utf-8?B?dnk4WHFYZVZpZkh2VVJVZ2xCc2RHQkVZTzBvR2lZV1FiWlRBOVFGZFdFTVhL?=
 =?utf-8?B?YTQwbHFLaVVWSmNNcTdQTGkyWXpHcWtUVEJ0SUVFQ08rVmF4aGxlSGpVcElG?=
 =?utf-8?B?Zm0zQ2M4RktWYzR6ZktKUmo5V1k4RmJlQU5qb3d6c0pWc0MrZE1pYmpPQlpp?=
 =?utf-8?B?SzEwYU0rcTd5UDFiY09YK3hFbnZ0SjlheUlyRWcyVE1QVUdxeWR4T0tyQUoy?=
 =?utf-8?B?MzV0bEtHZlY5aXRJZWU4YjVpL3pNTUpjUnlrMGV5U1JKbU9SVW54WVkxTWZx?=
 =?utf-8?B?eDUrajlPeU00cVlJWitVYU1MUXF4R1RUY0E5dmRnNjNWbVlQOUpYYjhyNzI2?=
 =?utf-8?B?RStFdjFEdDNTL3JBR3ZFU2hXL2hJUkt2a2x6MmhiRWlaQ0M0UEhDZDE3SE4z?=
 =?utf-8?B?cmY0MmJEbU9FU2lXem55UTVlU3p0VDhTRGo4TGRQSE9HckJDVjJMZDR4bk14?=
 =?utf-8?B?VzJ1S0VwYUhXR3NkZWZ4SnVpUmVHK3QwTElYWjgzMWdCdGF0bDcxTGVwcElU?=
 =?utf-8?B?Vk02WGtLQkpRVWg1YVJjdVB1aTgvcTN0QTlFOVFJbTZjR3lpbTlsenlwY3Fo?=
 =?utf-8?B?RldqTGwyVTB5a1hLWE8vV2VmZDNlWWg1dG5uV0YrZ1M4UU9kWFBnMkhDajMy?=
 =?utf-8?B?MGxkaUNSRWI0RXRqMUxJZEcxZGlGdllUSW9RRVdMRkRDTXFYODR1MDkxT3ow?=
 =?utf-8?B?ekw5Qkd4b2ppQXdYaWthNXZrYVM5U0Z3cjgzN3Y1d3NSWXBnSFB2b2ZNY1Jt?=
 =?utf-8?Q?p3kYSD5xL7PIDwdME1pOZb3HooHFco8AkHfORjW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9838dd7-b442-4999-e35d-08d91942dcbf
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 14:48:41.3815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tQr+gKq1+MiMazrsEvMp+AZysujP7EwTfvEBpV202XHxtLdkLHRdSFe7Z95hTkpVWICq/CVpOINjyQX011Vc5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5066
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

Am 2021-05-17 um 10:38 a.m. schrieb Andrey Grodzovsky:
> Problem:
> Handle all DMA IOMMU group related dependencies before the
> group is removed. Those manifest themself in that when IOMMU
> enabled DMA map/unmap is dependent on the presence of IOMMU
> group the device belongs to but, this group is released once
> the device is removed from PCI topology.
>
> Fix:
> Expedite all such unmap operations to pci remove driver callback.
>
> v5: Drop IOMMU notifier and switch to lockless call to ttm_tt_unpopulate
> v6: Drop the BO unamp list
> v7:
> Drop amdgpu_gart_fini
> In amdgpu_ih_ring_fini do uncinditional  check (!ih->ring)
> to avoid freeing uniniitalized rings.
> Call amdgpu_ih_ring_fini unconditionally.
> v8: Add deatiled explanation
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

This patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  4 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c   | 14 +-------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h   |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c     |  6 ++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c    |  5 +++++
>  drivers/gpu/drm/amd/amdgpu/cik_ih.c        |  1 -
>  drivers/gpu/drm/amd/amdgpu/cz_ih.c         |  1 -
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c     |  1 -
>  drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c      |  1 -
>  drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c      |  1 -
>  drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c      |  1 -
>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c      |  1 -
>  drivers/gpu/drm/amd/amdgpu/iceland_ih.c    |  1 -
>  drivers/gpu/drm/amd/amdgpu/navi10_ih.c     |  4 ----
>  drivers/gpu/drm/amd/amdgpu/si_ih.c         |  1 -
>  drivers/gpu/drm/amd/amdgpu/tonga_ih.c      |  1 -
>  drivers/gpu/drm/amd/amdgpu/vega10_ih.c     |  4 ----
>  drivers/gpu/drm/amd/amdgpu/vega20_ih.c     |  4 ----
>  18 files changed, 13 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 18598eda18f6..a0bff4713672 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3256,7 +3256,6 @@ static const struct attribute *amdgpu_dev_attributes[] = {
>  	NULL
>  };
>  
> -
>  /**
>   * amdgpu_device_init - initialize the driver
>   *
> @@ -3698,12 +3697,13 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
>  		amdgpu_ucode_sysfs_fini(adev);
>  	sysfs_remove_files(&adev->dev->kobj, amdgpu_dev_attributes);
>  
> -
>  	amdgpu_fbdev_fini(adev);
>  
>  	amdgpu_irq_fini_hw(adev);
>  
>  	amdgpu_device_ip_fini_early(adev);
> +
> +	amdgpu_gart_dummy_page_fini(adev);
>  }
>  
>  void amdgpu_device_fini_sw(struct amdgpu_device *adev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> index c5a9a4fb10d2..6460cf723f0a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> @@ -92,7 +92,7 @@ static int amdgpu_gart_dummy_page_init(struct amdgpu_device *adev)
>   *
>   * Frees the dummy page used by the driver (all asics).
>   */
> -static void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
> +void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
>  {
>  	if (!adev->dummy_page_addr)
>  		return;
> @@ -365,15 +365,3 @@ int amdgpu_gart_init(struct amdgpu_device *adev)
>  
>  	return 0;
>  }
> -
> -/**
> - * amdgpu_gart_fini - tear down the driver info for managing the gart
> - *
> - * @adev: amdgpu_device pointer
> - *
> - * Tear down the gart driver info and free the dummy page (all asics).
> - */
> -void amdgpu_gart_fini(struct amdgpu_device *adev)
> -{
> -	amdgpu_gart_dummy_page_fini(adev);
> -}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
> index a25fe97b0196..030b9d4c736a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
> @@ -57,7 +57,7 @@ void amdgpu_gart_table_vram_free(struct amdgpu_device *adev);
>  int amdgpu_gart_table_vram_pin(struct amdgpu_device *adev);
>  void amdgpu_gart_table_vram_unpin(struct amdgpu_device *adev);
>  int amdgpu_gart_init(struct amdgpu_device *adev);
> -void amdgpu_gart_fini(struct amdgpu_device *adev);
> +void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev);
>  int amdgpu_gart_unbind(struct amdgpu_device *adev, uint64_t offset,
>  		       int pages);
>  int amdgpu_gart_map(struct amdgpu_device *adev, uint64_t offset,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
> index faaa6aa2faaf..433469ace6f4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ih.c
> @@ -115,9 +115,11 @@ int amdgpu_ih_ring_init(struct amdgpu_device *adev, struct amdgpu_ih_ring *ih,
>   */
>  void amdgpu_ih_ring_fini(struct amdgpu_device *adev, struct amdgpu_ih_ring *ih)
>  {
> +
> +	if (!ih->ring)
> +		return;
> +
>  	if (ih->use_bus_addr) {
> -		if (!ih->ring)
> -			return;
>  
>  		/* add 8 bytes for the rptr/wptr shadows and
>  		 * add them to the end of the ring allocation.
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> index 233b64dab94b..32ce0e679dc7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> @@ -361,6 +361,11 @@ void amdgpu_irq_fini_hw(struct amdgpu_device *adev)
>  		if (!amdgpu_device_has_dc_support(adev))
>  			flush_work(&adev->hotplug_work);
>  	}
> +
> +	amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
> +	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
> +	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
> +	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
> index 183d44a6583c..df385ffc9768 100644
> --- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
> @@ -310,7 +310,6 @@ static int cik_ih_sw_fini(void *handle)
>  	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>  
>  	amdgpu_irq_fini_sw(adev);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>  	amdgpu_irq_remove_domain(adev);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
> index d32743949003..b8c47e0cf37a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
> @@ -302,7 +302,6 @@ static int cz_ih_sw_fini(void *handle)
>  	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>  
>  	amdgpu_irq_fini_sw(adev);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>  	amdgpu_irq_remove_domain(adev);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> index 2bfd620576f2..5e8bfcdd422e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> @@ -954,7 +954,6 @@ static int gmc_v10_0_sw_init(void *handle)
>  static void gmc_v10_0_gart_fini(struct amdgpu_device *adev)
>  {
>  	amdgpu_gart_table_vram_free(adev);
> -	amdgpu_gart_fini(adev);
>  }
>  
>  static int gmc_v10_0_sw_fini(void *handle)
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
> index 405d6ad09022..0e81e03e9b49 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
> @@ -898,7 +898,6 @@ static int gmc_v6_0_sw_fini(void *handle)
>  	amdgpu_vm_manager_fini(adev);
>  	amdgpu_gart_table_vram_free(adev);
>  	amdgpu_bo_fini(adev);
> -	amdgpu_gart_fini(adev);
>  	release_firmware(adev->gmc.fw);
>  	adev->gmc.fw = NULL;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> index 210ada2289ec..0795ea736573 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> @@ -1085,7 +1085,6 @@ static int gmc_v7_0_sw_fini(void *handle)
>  	kfree(adev->gmc.vm_fault_info);
>  	amdgpu_gart_table_vram_free(adev);
>  	amdgpu_bo_fini(adev);
> -	amdgpu_gart_fini(adev);
>  	release_firmware(adev->gmc.fw);
>  	adev->gmc.fw = NULL;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> index c1bd190841f8..dbf2e5472069 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> @@ -1194,7 +1194,6 @@ static int gmc_v8_0_sw_fini(void *handle)
>  	kfree(adev->gmc.vm_fault_info);
>  	amdgpu_gart_table_vram_free(adev);
>  	amdgpu_bo_fini(adev);
> -	amdgpu_gart_fini(adev);
>  	release_firmware(adev->gmc.fw);
>  	adev->gmc.fw = NULL;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> index c82d82da2c73..5ed0adae05cf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> @@ -1601,7 +1601,6 @@ static int gmc_v9_0_sw_fini(void *handle)
>  	amdgpu_gart_table_vram_free(adev);
>  	amdgpu_bo_unref(&adev->gmc.pdb0_bo);
>  	amdgpu_bo_fini(adev);
> -	amdgpu_gart_fini(adev);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
> index da96c6013477..ddfe4eaeea05 100644
> --- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
> @@ -301,7 +301,6 @@ static int iceland_ih_sw_fini(void *handle)
>  	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>  
>  	amdgpu_irq_fini_sw(adev);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>  	amdgpu_irq_remove_domain(adev);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> index 5eea4550b856..941d464a2b47 100644
> --- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> @@ -570,10 +570,6 @@ static int navi10_ih_sw_fini(void *handle)
>  	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>  
>  	amdgpu_irq_fini_sw(adev);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c b/drivers/gpu/drm/amd/amdgpu/si_ih.c
> index 751307f3252c..9a24f17a5750 100644
> --- a/drivers/gpu/drm/amd/amdgpu/si_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c
> @@ -176,7 +176,6 @@ static int si_ih_sw_fini(void *handle)
>  	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>  
>  	amdgpu_irq_fini_sw(adev);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
> index 973d80ec7f6c..b08905d1c00f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
> @@ -313,7 +313,6 @@ static int tonga_ih_sw_fini(void *handle)
>  	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>  
>  	amdgpu_irq_fini_sw(adev);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>  	amdgpu_irq_remove_domain(adev);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
> index dead9c2fbd4c..32ec4b8e806a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
> @@ -514,10 +514,6 @@ static int vega10_ih_sw_fini(void *handle)
>  	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>  
>  	amdgpu_irq_fini_sw(adev);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
> index 58993ae1fe11..f51dfc38ac65 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
> @@ -566,10 +566,6 @@ static int vega20_ih_sw_fini(void *handle)
>  	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>  
>  	amdgpu_irq_fini_sw(adev);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
> -	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>  
>  	return 0;
>  }
