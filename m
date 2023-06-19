Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D879735A1D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 16:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6711910E219;
	Mon, 19 Jun 2023 14:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F9410E214;
 Mon, 19 Jun 2023 14:55:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hcbfl58M6VjP3bdqY4ArxgpHD0GDNnsLICM5rs07SVz4xMiqxgMHpd8EJH5uEP0pbiTNwGehKCsjju3gBj7m7UTbAr5XFXW7qgiiPirIzcK2fhnF/DYyxfE8jKQg4DSBdV0/HMaAtJWBw24fCHesNy72Nzsjhe4BEgJhARhGiFm7mACVwACnaVUg2SS+gMBssaLwXCLOVnAd83wmk2kxVyKZbO0pHi4RKtOopaRlBD8wqotVg//N3u7MRnkZpF8jfGxfADP3kyr3T3A/7vPsUNvqwGrOaaioqEuhOnPv5CoCQzRbTDAZ8J5KeXmpjrZIgmw7EljKxYKe6x47zS7DSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPBD2llVH/EbEBZI0qmTcpGcoiFlS0bxaqI9ZNW3D8I=;
 b=YwqwkEdQqUS6n/GkRSwr6IekUtVcBLt8V65++/0jly+80kNERUa1uxwDkEuo/kdmA45f7nGIK0CNS77Vq/6W9gF+byO+nJu2STYfAFYTMHmSG6VXSxZw57LVvY2sNC2VB1l1DmbR/x5QUD0wPPj3J6ZdtcLlS5XDdFIJW1LZq0wOaskccujA+l2OU6QJT4VUIeOcVkgJ4XxwmqAJTP1F3p02V72qCFo9QsBkOPrXsxQ6ULYk2DEsB54wOB1po9wb4Jb9JxXRbQhmP1wbALC/Cui9oA8/sTtMltPUrake1raTlkdYmimjYitx6jAGmOdI9xT+sBUjW5tEqGqU1WjdcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPBD2llVH/EbEBZI0qmTcpGcoiFlS0bxaqI9ZNW3D8I=;
 b=lYjRSeqxyxylq3GRqJwW0soN53NCox7XlxzEuE7hlojpyRTDr1PeT/mTE+CAUCXXPQ0L3D/HEtZm3FNQ+sCWvVAFyXEyU5eDWtt+C5BGftvQm20w4EaHTkKsL799iWARpjVOiDfUUq76qFs6Whfb7ANzp7pmmsuZez5VwEQqr24=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4621.namprd12.prod.outlook.com (2603:10b6:805:e4::10)
 by DS0PR12MB8245.namprd12.prod.outlook.com (2603:10b6:8:f2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 14:54:57 +0000
Received: from SN6PR12MB4621.namprd12.prod.outlook.com
 ([fe80::6098:990c:cfda:435c]) by SN6PR12MB4621.namprd12.prod.outlook.com
 ([fe80::6098:990c:cfda:435c%3]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 14:54:57 +0000
Message-ID: <40b65777-c3a3-3739-aab0-1109a94dcc8f@amd.com>
Date: Mon, 19 Jun 2023 20:24:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH V3 4/7] drm/amd/pm: setup the framework to support Wifi
 RFI mitigation feature
Content-Language: en-US
To: Evan Quan <evan.quan@amd.com>, rafael@kernel.org, lenb@kernel.org,
 Alexander.Deucher@amd.com, Christian.Koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, kvalo@kernel.org, nbd@nbd.name,
 lorenzo@kernel.org, ryder.lee@mediatek.com, shayne.chen@mediatek.com,
 sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, Mario.Limonciello@amd.com
References: <20230616065757.1054422-1-evan.quan@amd.com>
 <20230616065757.1054422-5-evan.quan@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20230616065757.1054422-5-evan.quan@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::9) To SN6PR12MB4621.namprd12.prod.outlook.com
 (2603:10b6:805:e4::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB4621:EE_|DS0PR12MB8245:EE_
X-MS-Office365-Filtering-Correlation-Id: 62b88c3a-3800-4c72-59df-08db70d525b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rFvMW/nj0m7RuGdKIQvKrlPFsxwHbV4FJ0I0CbEsrCnVVFmnsn9V5MIiL0MDjdhoy/LhwMnK93NlLjlIYCTudgssF5p5MbBdCEs0QVSCsWRFyJVwtHfZo8M4gCT+sm/7t29kxdLUiYZJkhpjADPY1tJi2ezQ620hknmEi8X2SNUztBQLvgMih8282xvP6gTm5lT8KL2pCjciS3nSOKtSn6ctORnyMA6fHkKqPs5vyMLUJyAeSQ5cZ3fDDWiy72bq/LDmt/8cqwpIKyhYK1TzAGGbnSFqmNA/fNCuhaxcN02h4PEpJTNCIZ7EQ5UUFPIynK9ixzdMIBC8d3YHB0ev51dxARleN1FyH1pmOb8LSXXgEOF9kMNrJILHyevuZUuM++Afs1rMANN4yVO3j2bwGnkcPerE2y47XuMWI1WImJ2DXwX2qm9X03AWIJNhHf3VF6xjsYBfGElvI3zt5sSaBIE1trH8BY96Huz2cJk9VchgdFavMYCJo6W2j8KsdDKSqy2S2YI1x6UuGAK5oQEzSSjVJDoeed5QinrsOA0V6uJ89JvMA3Ukbs7nGokft61FQFWA0K11zz5G1I9dxVZ2d0rvm+Q2xHrL8h00jN1r1jFQPlv7mK5I93Y0Ok+4cjqkZuI7Oq3+4wIkeMUV7MihvMcFBYD6OP0dtH8fnKPG8c0RoKZZVF49np5qLfcD7gxh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4621.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199021)(478600001)(31686004)(66946007)(66556008)(66476007)(8676002)(36756003)(4326008)(6636002)(41300700001)(2616005)(921005)(83380400001)(38100700002)(31696002)(6486002)(86362001)(5660300002)(6666004)(2906002)(316002)(8936002)(30864003)(7416002)(6506007)(53546011)(6512007)(26005)(186003)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDJtUTNwZTh0ZHQxS2hOUWpkVVlUL1FONUdVZlEvQS9qbytITzgyWHI5Y2hh?=
 =?utf-8?B?Y3lmVTkrR05taXAraVVrUmdteldJQVZKeGI3TW5udjVFVkhWK1YyYUJEQWV6?=
 =?utf-8?B?a1hUREU4b28zUHIxRXNRL0ZIcnBTcmxkTVdsYVk2QWJ6VkpBcFF5UERkam9y?=
 =?utf-8?B?eUJ6ZDlaZCtBSjV1OFI1bkdGYzJqODZzZXMvTjVZS2dnQUVmcFBkZE1DMElN?=
 =?utf-8?B?aW5zZ1FGMDA5dkRibzVsZEIwVnkyMjNUQlkxZkF2MkpITzE1OFBaUkhMOEFQ?=
 =?utf-8?B?WndvSzRSYXU0aHVsT0xKSkZlSUdvaWs1TE9Jcm9hNlhkUU5OeEhzeXp5dWRn?=
 =?utf-8?B?QjIwa2FBb2xyOEJvTGtWUVZsUzNvSDAyZHVyV2Z0TkJ6QlRUYXRMOHJUaG5Y?=
 =?utf-8?B?NUNseUhIQ0ZpTVlpR0ppZWtqbDBuNWcwSk9iSi9rbU9iVzM2VkhDQXNaSURZ?=
 =?utf-8?B?Q1A5cS8rTmhlR2F0OVloMXpYaEZlSXJPUXBlOU9LYXlJbkNuVW1HZ3g3ek5G?=
 =?utf-8?B?QTJWMTBKKzF6WUc2Mjc3YkdFWjNOS2pGdzRBaGZvRXV0NGFpaXlBNmRkY1ZQ?=
 =?utf-8?B?TzRlK0dHYXlZa1o2YXVtajB2YUc5L2Y1a2RQUG1PMHVSSko3enJuTjdvUHpF?=
 =?utf-8?B?dGk1M2ZIbFFwVUhISFh5ZVdOS1hpUHF3UTBneUVGQ0p0VU4zWWxwNWlLY0Ez?=
 =?utf-8?B?ZDFCMkRjZllFZ0RSb1FKd3VjZHdNRnFJTG9iNkpSZE10OWE2cUNtSk1tK09Z?=
 =?utf-8?B?aU5RUzlSSGs3dTQ3ZmgwejY1RG83dnZieHZHbHNYdVlUelZkRGlrdHRMREVU?=
 =?utf-8?B?WGlFM2FEU1NVbXFWU2szNDhTUHNpUUZ6NTQrcU1JMjNFNjlFcmpVWkVmcDlL?=
 =?utf-8?B?R0lCNXhuQlZTYy9HcVliekFqNTdPQmNOL1k3T3hkK05Xb1ZKMkxpdGIydDB2?=
 =?utf-8?B?QXozUVdBMjRKV3pGQnIvWTh4N0I3OFFEV0xRUUVyWEtzeW0yalFMemxnNUEr?=
 =?utf-8?B?cm03OU00UmhTZmh0VEVwaEpNMFN4MlczKzBxTFR4aXkzRXZ2aHd1UlRMc2E5?=
 =?utf-8?B?YlZNbXBQWVYwMTdIU24vUjV5VkZMOS82RWIwOWtaUFh4VEtxV2RlYkhkYU1k?=
 =?utf-8?B?Ym1Jd0ZPS1p5Rm52V1YrMXo0OGc4bmFZVmtlYmFsdmNWQlhUYno1U004MjR0?=
 =?utf-8?B?M2svUUxaMWdvL1haM0pwVVp4aEhtMVBYVjMzaitycTBYOFlhNTZ2a3JWekNk?=
 =?utf-8?B?aWlEOWFqNkdnczIwdTFCUjgzamhkRWUvaXFZNGVHYVNxNTBGZGxjSmVsMG1n?=
 =?utf-8?B?dmVsakFYZ1h2amdLb1pmMENqRGYweVdSUUtPNFBpMDRicnVNTFA2VTNXbzFk?=
 =?utf-8?B?T1R3cmMrWXFTUytFNmFnKzdaT2ZEVHcwajJHVUpGaHJJc0N4NVdsMGN0Q1VO?=
 =?utf-8?B?cmVIbitwNDZJQUdjZFZSNkFMVWY2czU0cGlDYk9XbXhiV2ZUblR2U1c3TjBo?=
 =?utf-8?B?dE4vb2RoT2ViNDBrenM5ZEJVRTV2MWNhTWNmWEgxWmpWc05NTFRiRUp4Zm0r?=
 =?utf-8?B?dzMvS2wveDRtM2dNRFJ3YWFUR1Bxek0vd29RLzNYKy92VGtucHo5SnVGai9n?=
 =?utf-8?B?NFVRQk5IT2FLSUErM21JNzBoRzRzbFhqdUgwRElrYlV6VmJWeEhsNUJ3cnZB?=
 =?utf-8?B?ZFpzN3dweWVkdzMrWi9BcEpvcHpXeGs2ZEs3Q2k0Z2c5T2RPVVNEdTFXVjFa?=
 =?utf-8?B?V0ZNZ05oaDRBVkdWSnNYaXFQcHNvY2JNTGRab2lEVnRJWVg1RklsVjBVMVJG?=
 =?utf-8?B?SGt6S1lzQ3VJb2k3ZDUzMUlFOXdrU2ttOVRrM0N0ZkhXN3FKUFBDM095b3VV?=
 =?utf-8?B?ekVEeHVUSWpkV25MeG8zRmd0VDJsR21QNFBGNmx3OVJFdUpuYVZ2QTJsdmx4?=
 =?utf-8?B?ZlBTbHdMRWd6OFVDdXcwWHFuNmpuK0IxYzV0bzl5TnByNVhmb3c0VTRLRHAy?=
 =?utf-8?B?OGpZWG93aHpIY0pWK2dJYVVJYzhpaUdwcG9DZko4bHp6RDc5U1BGeVN1VEl4?=
 =?utf-8?B?OGpoc3g3TThhU1J2R1NrSlh2YnN3RXR0S1craVVjOUl5dkZpaUs0VHBtZUEx?=
 =?utf-8?Q?ep7oR8xp04vmnPWIbwrrjs9mn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b88c3a-3800-4c72-59df-08db70d525b3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 14:54:57.0721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ruqnR0mVCLHd5aWPt3em13My4o7PgQI/H1QScauINHUNTmKiEP+VVqsRbHqEq1+e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8245
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
Cc: linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/16/2023 12:27 PM, Evan Quan wrote:
> With WBRF feature supported, as a driver responding to the frequencies,
> amdgpu driver is able to do shadow pstate switching to mitigate possible
> interference(between its (G-)DDR memory clocks and local radio module
> frequency bands used by Wifi 6/6e/7).
> 
> To make WBRF feature functional, the kernel needs to be configured with
> CONFIG_ACPI_WBRF and the platform is equipped with necessary ACPI based
> mechanism to get amdgpu driver notified.
> 
> Signed-off-by: Evan Quan <evan.quan@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  26 +++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      |  63 ++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  19 ++
>   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 184 ++++++++++++++++++
>   drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  20 ++
>   drivers/gpu/drm/amd/pm/swsmu/smu_internal.h   |   3 +
>   6 files changed, 315 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 02b827785e39..2f2ec64ed1b2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -50,6 +50,7 @@
>   #include <linux/hashtable.h>
>   #include <linux/dma-fence.h>
>   #include <linux/pci.h>
> +#include <linux/wbrf.h>
>   
>   #include <drm/ttm/ttm_bo.h>
>   #include <drm/ttm/ttm_placement.h>
> @@ -241,6 +242,7 @@ extern int amdgpu_num_kcq;
>   #define AMDGPU_VCNFW_LOG_SIZE (32 * 1024)
>   extern int amdgpu_vcnfw_log;
>   extern int amdgpu_sg_display;
> +extern int amdgpu_wbrf;
>   
>   #define AMDGPU_VM_MAX_NUM_CTX			4096
>   #define AMDGPU_SG_THRESHOLD			(256*1024*1024)
> @@ -741,6 +743,9 @@ struct amdgpu_reset_domain;
>    */
>   #define AMDGPU_HAS_VRAM(_adev) ((_adev)->gmc.real_vram_size)
>   
> +typedef
> +void (*wbrf_notify_handler) (struct amdgpu_device *adev);
> +
>   struct amdgpu_device {
>   	struct device			*dev;
>   	struct pci_dev			*pdev;
> @@ -1050,6 +1055,8 @@ struct amdgpu_device {
>   
>   	bool                            job_hang;
>   	bool                            dc_enabled;
> +
> +	wbrf_notify_handler		wbrf_event_handler;
>   };
>   
>   static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
> @@ -1381,6 +1388,25 @@ static inline int amdgpu_acpi_smart_shift_update(struct drm_device *dev,
>   						 enum amdgpu_ss ss_state) { return 0; }
>   #endif
>   
> +#if defined(CONFIG_ACPI_WBRF)
> +bool amdgpu_acpi_is_wbrf_supported(struct amdgpu_device *adev);
> +int amdgpu_acpi_wbrf_retrieve_exclusions(struct amdgpu_device *adev,
> +					 struct wbrf_ranges_out *exclusions_out);
> +int amdgpu_acpi_register_wbrf_notify_handler(struct amdgpu_device *adev,
> +					     wbrf_notify_handler handler);
> +int amdgpu_acpi_unregister_wbrf_notify_handler(struct amdgpu_device *adev);
> +#else
> +static inline bool amdgpu_acpi_is_wbrf_supported(struct amdgpu_device *adev) { return false; }
> +static inline
> +int amdgpu_acpi_wbrf_retrieve_exclusions(struct amdgpu_device *adev,
> +					 struct wbrf_ranges_out *exclusions_out) { return 0; }
> +static inline
> +int amdgpu_acpi_register_wbrf_notify_handler(struct amdgpu_device *adev,
> +					     wbrf_notify_handler handler) { return 0; }
> +static inline
> +int amdgpu_acpi_unregister_wbrf_notify_handler(struct amdgpu_device *adev) { return 0; }
> +#endif
> +
>   #if defined(CONFIG_ACPI) && defined(CONFIG_SUSPEND)
>   bool amdgpu_acpi_is_s3_active(struct amdgpu_device *adev);
>   bool amdgpu_acpi_is_s0ix_active(struct amdgpu_device *adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index aeeec211861c..efbe6dd91d1a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -1105,3 +1105,66 @@ bool amdgpu_acpi_is_s0ix_active(struct amdgpu_device *adev)
>   }
>   
>   #endif /* CONFIG_SUSPEND */
> +
> +#ifdef CONFIG_ACPI_WBRF
> +bool amdgpu_acpi_is_wbrf_supported(struct amdgpu_device *adev)
> +{
> +	struct acpi_device *acpi_dev = ACPI_COMPANION(adev->dev);
> +
> +	if (!acpi_dev)
> +		return false;
> +
> +	return wbrf_supported_consumer(acpi_dev);
> +}
> +
> +int amdgpu_acpi_wbrf_retrieve_exclusions(struct amdgpu_device *adev,
> +					 struct wbrf_ranges_out *exclusions_out)
> +{
> +	struct acpi_device *acpi_dev = ACPI_COMPANION(adev->dev);
> +
> +	if (!acpi_dev)
> +		return -ENODEV;
> +
> +	return wbrf_retrieve_exclusions(acpi_dev, exclusions_out);
> +}
> +
> +#define CPM_GPU_NOTIFY_COMMAND		0x55
> +static void amdgpu_acpi_wbrf_event(acpi_handle handle, u32 event, void *data)
> +{
> +	struct amdgpu_device *adev = (struct amdgpu_device *)data;
> +
> +	if (event == CPM_GPU_NOTIFY_COMMAND &&
> +	    adev->wbrf_event_handler)
> +		adev->wbrf_event_handler(adev); > +}
> +
> +int amdgpu_acpi_register_wbrf_notify_handler(struct amdgpu_device *adev,
> +					     wbrf_notify_handler handler)
> +{
> +	struct acpi_handle *acpi_hdler = ACPI_HANDLE(adev->dev);
> +
> +	if (!acpi_hdler)
> +		return -ENODEV;
> +
> +	adev->wbrf_event_handler = handler;
> +
> +	return acpi_install_notify_handler(acpi_hdler,
> +					   ACPI_ALL_NOTIFY,
> +					   amdgpu_acpi_wbrf_event,
> +					   adev);
> +}
> +
> +int amdgpu_acpi_unregister_wbrf_notify_handler(struct amdgpu_device *adev)
> +{
> +	struct acpi_handle *acpi_hdler = ACPI_HANDLE(adev->dev);
> +
> +	if (!acpi_hdler)
> +		return -ENODEV;
> +
> +	adev->wbrf_event_handler = NULL;
> +
> +	return acpi_remove_notify_handler(acpi_hdler,
> +					  ACPI_ALL_NOTIFY,
> +					  amdgpu_acpi_wbrf_event);
> +}
> +#endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index b1ca1ab6d6ad..bf82cc192153 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -191,6 +191,7 @@ int amdgpu_smartshift_bias;
>   int amdgpu_use_xgmi_p2p = 1;
>   int amdgpu_vcnfw_log;
>   int amdgpu_sg_display = -1; /* auto */
> +int amdgpu_wbrf = -1;
>   
>   static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *work);
>   
> @@ -948,6 +949,24 @@ MODULE_PARM_DESC(smu_pptable_id,
>   	"specify pptable id to be used (-1 = auto(default) value, 0 = use pptable from vbios, > 0 = soft pptable id)");
>   module_param_named(smu_pptable_id, amdgpu_smu_pptable_id, int, 0444);
>   
> +#ifdef CONFIG_ACPI_WBRF
> +/**
> + * DOC: wbrf (int)
> + * Enable Wifi RFI interference mitigation feature.
> + * Due to electrical and mechanical constraints there may be likely interference of
> + * relatively high-powered harmonics of the (G-)DDR memory clocks with local radio
> + * module frequency bands used by Wifi 6/6e/7. To mitigate the possible RFI interference,
> + * with this feature enabled, PMFW will use either “shadowed P-State” or “P-State” based
> + * on active list of frequencies in-use (to be avoided) as part of initial setting or
> + * P-state transition. However, there may be potential performance impact with this
> + * feature enabled.
> + * (0 = disabled, 1 = enabled, -1 = auto (default setting, will be enabled if supported))
> + */
> +MODULE_PARM_DESC(wbrf,
> +	"Enable Wifi RFI interference mitigation (0 = disabled, 1 = enabled, -1 = auto(default)");
> +module_param_named(wbrf, amdgpu_wbrf, int, 0444);
> +#endif
> +
>   /* These devices are not supported by amdgpu.
>    * They are supported by the mach64, r128, radeon drivers
>    */
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> index 2ddf5198e5c4..89f876cc60e6 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> @@ -1188,6 +1188,163 @@ static int smu_get_thermal_temperature_range(struct smu_context *smu)
>   	return ret;
>   }
>   
> +/**
> + * smu_wbrf_handle_exclusion_ranges - consume the wbrf exclusion ranges
> + *
> + * @smu: smu_context pointer
> + *
> + * Retrieve the wbrf exclusion ranges and send them to PMFW for proper handling.
> + * Returns 0 on success, error on failure.
> + */
> +static int smu_wbrf_handle_exclusion_ranges(struct smu_context *smu)
> +{
> +	struct wbrf_ranges_out wbrf_exclusion = {0};
> +	struct exclusion_range *wifi_bands = wbrf_exclusion.band_list;
> +	struct amdgpu_device *adev = smu->adev;
> +	uint64_t start, end;
> +	int ret, i, j;
> +
> +	ret = amdgpu_acpi_wbrf_retrieve_exclusions(adev, &wbrf_exclusion);
> +	if (ret) {
> +		dev_err(adev->dev, "Failed to retrieve exclusion ranges!\n");
> +		return ret;
> +	}
> +
> +	/*
> +	 * The exclusion ranges array we got might be filled with holes and duplicate
> +	 * entries. For example:
> +	 * {(2400, 2500), (0, 0), (6882, 6962), (2400, 2500), (0, 0), (6117, 6189), (0, 0)...}
> +	 * We need to do some sortups to eliminate those holes and duplicate entries.
> +	 * Expected output: {(2400, 2500), (6117, 6189), (6882, 6962), (0, 0)...}
> +	 */
> +	for (i = 0; i < MAX_NUM_OF_WBRF_RANGES; i++) {
> +		start = wifi_bands[i].start;
> +		end = wifi_bands[i].end;
> +
> +		/* get the last valid entry to fill the intermediate hole */
> +		if (!start && !end) {
> +			for (j = MAX_NUM_OF_WBRF_RANGES - 1; j > i; j--)
> +				if (wifi_bands[j].start &&
> +				    wifi_bands[j].end)
> +					break;
> +
> +			if (j > i) {
> +				wifi_bands[i].start = wifi_bands[j].start;
> +				wifi_bands[i].end = wifi_bands[j].end;
> +				wifi_bands[j].start = 0;
> +				wifi_bands[j].end = 0;
> +			}
> +
> +			continue;
> +		}
> +
> +		/* eliminate duplicate entries */
> +		for (j = i + 1; j < MAX_NUM_OF_WBRF_RANGES; j++) {
> +			if ((wifi_bands[j].start == start) &&
> +			     (wifi_bands[j].end == end)) {
> +				wifi_bands[j].start = 0;
> +				wifi_bands[j].end = 0;
> +				continue;
> +			}
> +		}
> +	}
> +
> +	/* Send the sorted wifi_bands to PMFW */
> +	ret = smu_set_wbrf_exclusion_ranges(smu, wifi_bands);

Do we need to make sure to wake up the device (say if it's in BOCO) 
before calling this? Or, is it expected that the device gets active when 
these notifications come?

> +	/* Give it another chance */
> +	if (unlikely(ret == -EBUSY)) {
> +		mdelay(5);
> +		ret = smu_set_wbrf_exclusion_ranges(smu, wifi_bands);
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * smu_wbrf_event_handler - handle notify events
> + *
> + * @adev: struct amdgpu_device pointer
> + *
> + * Calls relevant amdgpu function in response to wbrf event
> + * notification from BIOS.
> + */
> +static void smu_wbrf_event_handler(struct amdgpu_device *adev)
> +{
> +	struct smu_context *smu = adev->powerplay.pp_handle;
> +
> +	smu_wbrf_handle_exclusion_ranges(smu);
> +}
> +
> +/**
> + * smu_wbrf_support_check - check wbrf support
> + *
> + * @smu: smu_context pointer
> + *
> + * Verifies the ACPI interface whether wbrf is supported.
> + */
> +static void smu_wbrf_support_check(struct smu_context *smu)
> +{
> +	struct amdgpu_device *adev = smu->adev;
> +
> +	smu->wbrf_supported = smu_is_asic_wbrf_supported(smu) &&
> +			      !!amdgpu_wbrf &&
> +			      amdgpu_acpi_is_wbrf_supported(adev);
> +
> +	if (smu->wbrf_supported)
> +		dev_info(adev->dev, "Enabled RF interference mitigations\n");

Minor comment - at this point nothing is enabled, it only detected 
hardware support. I guess, once FW is instructed to use shadow pstates 
only then mitigation steps are enabled.

Thanks,
Lijo

> +}
> +
> +/**
> + * smu_wbrf_init - init driver wbrf support
> + *
> + * @smu: smu_context pointer
> + *
> + * Verifies the AMD ACPI interfaces and registers with the wbrf
> + * notifier chain if wbrf feature is supported.
> + * Returns 0 on success, error on failure.
> + */
> +static int smu_wbrf_init(struct smu_context *smu)
> +{
> +	struct amdgpu_device *adev = smu->adev;
> +	int ret;
> +
> +	if (!smu->wbrf_supported)
> +		return 0;
> +
> +	ret = amdgpu_acpi_register_wbrf_notify_handler(adev,
> +						       smu_wbrf_event_handler);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Some wifiband exclusion ranges may be already there
> +	 * before our driver loaded. To make sure our driver
> +	 * is awared of those exclusion ranges.
> +	 */
> +	ret = smu_wbrf_handle_exclusion_ranges(smu);
> +	if (ret)
> +		dev_err(adev->dev, "Failed to handle wbrf exclusion ranges\n");
> +
> +	return ret;
> +}
> +
> +/**
> + * smu_wbrf_fini - tear down driver wbrf support
> + *
> + * @smu: smu_context pointer
> + *
> + * Unregisters with the wbrf notifier chain.
> + */
> +static void smu_wbrf_fini(struct smu_context *smu)
> +{
> +	struct amdgpu_device *adev = smu->adev;
> +
> +	if (!smu->wbrf_supported)
> +		return;
> +
> +	amdgpu_acpi_unregister_wbrf_notify_handler(adev);
> +}
> +
>   static int smu_smc_hw_setup(struct smu_context *smu)
>   {
>   	struct smu_feature *feature = &smu->smu_feature;
> @@ -1280,6 +1437,15 @@ static int smu_smc_hw_setup(struct smu_context *smu)
>   	if (ret)
>   		return ret;
>   
> +	/* Enable UclkShadow on wbrf supported */
> +	if (smu->wbrf_supported) {
> +		ret = smu_enable_uclk_shadow(smu, true);
> +		if (ret) {
> +			dev_err(adev->dev, "Failed to enable UclkShadow feature to support wbrf!\n");
> +			return ret;
> +		}
> +	}
> +
>   	/*
>   	 * With SCPM enabled, these actions(and relevant messages) are
>   	 * not needed and permitted.
> @@ -1376,6 +1542,15 @@ static int smu_smc_hw_setup(struct smu_context *smu)
>   	 */
>   	ret = smu_set_min_dcef_deep_sleep(smu,
>   					  smu->smu_table.boot_values.dcefclk / 100);
> +	if (ret) {
> +		dev_err(adev->dev, "Error setting min deepsleep dcefclk\n");
> +		return ret;
> +	}
> +
> +	/* Init wbrf support. Properly setup the notifier */
> +	ret = smu_wbrf_init(smu);
> +	if (ret)
> +		dev_err(adev->dev, "Error during wbrf init call\n");
>   
>   	return ret;
>   }
> @@ -1431,6 +1606,13 @@ static int smu_hw_init(void *handle)
>   		return ret;
>   	}
>   
> +	/*
> +	 * Check whether wbrf is supported. This needs to be done
> +	 * before SMU setup starts since part of SMU configuration
> +	 * relies on this.
> +	 */
> +	smu_wbrf_support_check(smu);
> +
>   	if (smu->is_apu) {
>   		ret = smu_set_gfx_imu_enable(smu);
>   		if (ret)
> @@ -1583,6 +1765,8 @@ static int smu_smc_hw_cleanup(struct smu_context *smu)
>   	struct amdgpu_device *adev = smu->adev;
>   	int ret = 0;
>   
> +	smu_wbrf_fini(smu);
> +
>   	cancel_work_sync(&smu->throttling_logging_work);
>   	cancel_work_sync(&smu->interrupt_work);
>   
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> index 09469c750a96..ff0af3da0be2 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> @@ -573,6 +573,9 @@ struct smu_context
>   	u32 debug_param_reg;
>   	u32 debug_msg_reg;
>   	u32 debug_resp_reg;
> +
> +	/* data structures for wbrf feature support */
> +	bool				wbrf_supported;
>   };
>   
>   struct i2c_adapter;
> @@ -1354,6 +1357,23 @@ struct pptable_funcs {
>   	 * @init_pptable_microcode: Prepare the pptable microcode to upload via PSP
>   	 */
>   	int (*init_pptable_microcode)(struct smu_context *smu);
> +
> +	/**
> +	 * @is_asic_wbrf_supported: check whether PMFW supports the wbrf feature
> +	 */
> +	bool (*is_asic_wbrf_supported)(struct smu_context *smu);
> +
> +	/**
> +	 * @enable_uclk_shadow: Enable the uclk shadow feature on wbrf supported
> +	 */
> +	int (*enable_uclk_shadow)(struct smu_context *smu,
> +				  bool enablement);
> +
> +	/**
> +	 * @set_wbrf_exclusion_ranges: notify SMU the wifi bands occupied
> +	 */
> +	int (*set_wbrf_exclusion_ranges)(struct smu_context *smu,
> +					 struct exclusion_range *exclusion_ranges);
>   };
>   
>   typedef enum {
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h b/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
> index ceb13c838067..67d7495ab49e 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
> @@ -97,6 +97,9 @@
>   #define smu_get_default_config_table_settings(smu, config_table)	smu_ppt_funcs(get_default_config_table_settings, -EOPNOTSUPP, smu, config_table)
>   #define smu_set_config_table(smu, config_table)				smu_ppt_funcs(set_config_table, -EOPNOTSUPP, smu, config_table)
>   #define smu_init_pptable_microcode(smu)					smu_ppt_funcs(init_pptable_microcode, 0, smu)
> +#define smu_is_asic_wbrf_supported(smu)					smu_ppt_funcs(is_asic_wbrf_supported, false, smu)
> +#define smu_enable_uclk_shadow(smu, enablement)				smu_ppt_funcs(enable_uclk_shadow, 0, smu, enablement)
> +#define smu_set_wbrf_exclusion_ranges(smu, exclusion_ranges)		smu_ppt_funcs(set_wbrf_exclusion_ranges, -EOPNOTSUPP, smu, exclusion_ranges)
>   
>   #endif
>   #endif
