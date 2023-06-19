Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 824E1734A19
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 04:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5044510E137;
	Mon, 19 Jun 2023 02:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A962910E137;
 Mon, 19 Jun 2023 02:22:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKzMtWHbu6UhRs7MXnX9MCYGlyPeabkFlbtVMqPKAHNBSXVU8ZQI1K8il3lpCMqLN1TkUlsuUj77+h74ye5/3vQfsK5kLy0aN5MsjOMkTAPWcHARdiTDRkRTj6xl5Zgn1B9TOEcjJwVpgIOa0t+cLBw78+XxIDrid7quTTfFZiJsIFOdcm+o2XkHCkSdPCImJvYcLGoodndbXxh7XpyQqh725E+5R8+kmHbdpeb7M+fwne17IBhcRrFk2ZIN4mMWWwjvPwE+jbAcfSXNU+qdFv/9OHu1fBJDjMJ1jceWXrAA/ZBEeufP+qtivDmSUneOamKYtVI7FhaLZXY8T0Q6CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZThzU59ZrQvwGR9jdna5UV9ILDfiKW4PQNPRQrzMeo=;
 b=j3SGPix1mUrDp9r/C6rkInL+7h61TgAbd0n4D/KXG7z/9Lbn9DXvpT0oVyHJwlcaNd9//RFmjTXAorMcn5Hdt2pwhylRTaLyhUeD+LtB5rJBetOdZAaLLmM7Zygpf3wmbgnDRfATSzqpTWNmvCiUupQxRsGSLgCL9SRIimK/1PODL1bbhJxQZtnr/TSg76xR3SZVfUvjgSgq3fLV7m1YL1GQVCoWbohIC+O/x6eClmGq1JQ1rEPhBA6lDeQ1eiNAQ+0OSv2IEwbiwWDseJk1nzzyAUTl8E76XI9HI7DpKL5NDwG8o44cnDFygIlYG39KcOIxhyr9jpI12MGlfrFrhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZThzU59ZrQvwGR9jdna5UV9ILDfiKW4PQNPRQrzMeo=;
 b=j3r8nIiVZVGlOPaDniolHFMc8cvb8UD8Qu9N2k9qe0UswQRO/RJV53vrQXoG+2Afe1aiBOl00NauLWaJKgJ6JBFCIKAN4FVHBCywNlM4uiOPlktfVP21tnDfhrkIxP2fgfR2U6PpHVyb3lwgxSBDj2D6u40KNVTI/buJqL7n0oQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA0PR12MB8424.namprd12.prod.outlook.com (2603:10b6:208:40c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Mon, 19 Jun
 2023 02:22:40 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 02:22:40 +0000
Message-ID: <d9b7236a-1e12-cb4e-0ba1-d5e9c610aeb3@amd.com>
Date: Sun, 18 Jun 2023 21:22:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH V3 4/7] drm/amd/pm: setup the framework to support Wifi
 RFI mitigation feature
Content-Language: en-US
To: Evan Quan <evan.quan@amd.com>, rafael@kernel.org, lenb@kernel.org,
 Alexander.Deucher@amd.com, Christian.Koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, kvalo@kernel.org, nbd@nbd.name,
 lorenzo@kernel.org, ryder.lee@mediatek.com, shayne.chen@mediatek.com,
 sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, Lijo.Lazar@amd.com
References: <20230616065757.1054422-1-evan.quan@amd.com>
 <20230616065757.1054422-5-evan.quan@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20230616065757.1054422-5-evan.quan@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR03CA0093.namprd03.prod.outlook.com
 (2603:10b6:5:333::26) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA0PR12MB8424:EE_
X-MS-Office365-Filtering-Correlation-Id: a502c167-843f-43b2-f17f-08db706c0e7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 08OzwKdyHC/JMIE7PHYzEzhzt5cuQ+IRqa9oKqwxxhvYdRW+cOZACt5JyQbw5LSYqODat/+aYUwRDK1k2paYw+z538MB7dbcGWugG974NonbXuKFinbUAtWppdJfUvevWA6euUKL511eeQryVIWG82kG1Nck5GfZaWkCG083Zo8Cmv4TTQFwsG6TV2k7v5uCoFGoZk+XvAo0u+J8qUcxywqI98uEpfROIaGUbPsLv+pW1X+9HMczwicdvUFnOGy1vvQycfE0b4SHpesbFBmfp2/q10COEdNhLE1ALhlPEO/tArYD3WoLpO3F+8P8+Gq+X/NpJ65A5Lt9cyk1Z6OVUkCu1KzGq0Jc+r03dFCmHJC7YqIaXWP6YtJov5j6ZVt1wG1/kQkI8Vq+0vWHIEavLOXuevVZhI+6UPvjrgmQYY5zJ7IAD5ruf+L1qA8uoyL3VX2rlAPDsp4GqQ3d6wi17zMpdmYLfcZmpRkJoy791H5P4Nzeskq4oUsqTuMhthsL64PCpbaQh2IdN472NE3A3pOtUMaiccf+wV/SN4To3XY7MBMG/bAVpS0OBu7+8eSUp8aZgO9/pfNOIzOl72zZXF25BJDPg+7t5GTFzJFch7VAffvRgaLZP5h91CQZrZodIljvtRTENfwK+fUmVzYum9RIEOKoEDt4TKUYzeC3eKb2/GeMQKAkMJ0eRCNqdaJm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199021)(316002)(6486002)(41300700001)(30864003)(53546011)(186003)(86362001)(6506007)(44832011)(83380400001)(2616005)(2906002)(6512007)(7416002)(921005)(38100700002)(31696002)(36756003)(5660300002)(8676002)(6636002)(4326008)(66476007)(66556008)(66946007)(31686004)(8936002)(478600001)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkwzTWJLY1NwL1RTNThxNlZPbGpjTnpIdXNjUmVVT0djTzZOYjlseWtCRko2?=
 =?utf-8?B?RFFqalBvMUNRWDBZc1lhWm9mSU1DNTVtTGxTdm5lNnl0L1F1M3VTeWZPWGxi?=
 =?utf-8?B?dGsvVksxT1ZadFBPWjFVdzRqU3Bpb0kyN3ExNHc1dERNdVR2blRPTHFpOEQ5?=
 =?utf-8?B?ZG9iUmxLbUcwVjhNUUlWVXEzSXo0K092a0NTUUFFZWh4THZrMHJIanNOOTA5?=
 =?utf-8?B?cG1vZVdGcFg0NncxVnNycEM4QUZQei93eEp4Wk1ZL0Nsais2RWhlWTVkcEVY?=
 =?utf-8?B?bFJPL0htUStvaXVKYkZ2QklSeHZoNG5DZkcxcW80L0pXWkZWZFdmZlFzSUQ4?=
 =?utf-8?B?MXdia083cS9MWGU0REJxa3E4b09sdEpRa1AyS0t3Y2JYQTdjMis0WWxZMmRq?=
 =?utf-8?B?N1RDeXVmbFpTOTd2Z3lYSmt5TklMMWcvUjZQdGV6VURDdkliUUdrWDRkb3ZL?=
 =?utf-8?B?VTBFTTZia09ZQ0NYaGF2Q2l6SzNrK1N6emJyQnZyRmZQUzRZUnBzeHduMXV0?=
 =?utf-8?B?cUZPS1paeHh4eFZxSFZFZkdoajA0VHcrVmxGZzB5SnpCd3R2SmFRUDBOem9O?=
 =?utf-8?B?R0tRMjlpZkpPbkp4UnVBRTZlRHhlS1ZUbTgvaWlDSXlLbmR4WWxUWlRVSjY1?=
 =?utf-8?B?OUJBQzFmdnhCR1QyRksreWtQREZTT1UxRCtoYTNhUjZxME9CL1h2b0ZYaVB6?=
 =?utf-8?B?eVV4YUFqbGFkcDlGbnkyL05CUDlvUXlhNUFscUlJMVpqc2VSNVpwbVk1VEYw?=
 =?utf-8?B?ZU96eE5wNlk1MjRZWmd4eExRaWIvSFc2bUVVMHExZlZJU2tsVXRZT0lTc3p0?=
 =?utf-8?B?aFFXak9ROFVpYitpNE1VcXgwZkxuVk9qQUUvdTZMTnBrMjh0OWZIa1NXOVhp?=
 =?utf-8?B?Y0paL2R3QkJjdytGQXZtSmVtZlg3cXZjMk1kL1ZkNmlPNWxDNng4UGZFRG1z?=
 =?utf-8?B?UVpwK2toZ2I5S3ZSTGxXNEYwU0FScFZCY2xVN2JxUisvcUl6Qi9oOTZLRk1h?=
 =?utf-8?B?OC9JZ0V6NVVhWmxqU3Nhb2padmZsWjFWUysxZnZpSVhiay9WcWhBY0taTDls?=
 =?utf-8?B?U0ZWcitOaGF0aFFDT25laG84R1RIU1J1S2haNElncktPVjNQUENsNk84Q3Nu?=
 =?utf-8?B?bkZjSkwycHZhcUluQmNiTjJwNTFvSlVwcTJEdk5iaVEvRGtJMWMxVXVCd29j?=
 =?utf-8?B?dVczZENBWnppaEhtTnNqdzEyZFljcVU3Wm03dlk0a3NscDFwUCticXo5MFhX?=
 =?utf-8?B?bXdaZUxCUWYwK1lrMURXL3JJWkwwMUlBTExqMGdEejN6WlAwemZHQ1MyMGt0?=
 =?utf-8?B?b255Z2ExNTRydndDOEx6Q1FXRmU4N2xmNXkrb1VlcDVuY0xRbnVGekwzNlgr?=
 =?utf-8?B?WVZhUHcyOUUxWGFwRm0rWHNlRkxLK0NMWGVZN21XL0hzZTUvOG9rL3c0SzIv?=
 =?utf-8?B?QU84THAyWWRxbXdxUWYwUEtzS2VjZk9lUlNaaHhCa04rZ3o0d2VuN0xxWlpP?=
 =?utf-8?B?VXFTYVJzRHY4YTZLRFhnVUZoRmc3ZnRiNDdDSVE1OFRnL1BuNzd3cnlta3I3?=
 =?utf-8?B?QW9GaStKQzBMQ3UzWHJiZ3lvRzFqa2pxQ2JmZlVGR0RrWXZ2bVF0c0xtSm14?=
 =?utf-8?B?aWcyWmdWNnpCbWRPdW10REdxT2pkSkJRWEx2NnBtNzNKVndvc3pNR0tLS1d1?=
 =?utf-8?B?VGl1UXVhK3ZtN0tJem8rN3EwV1o0eFIzK3J2NkxjL2RpWWkzNFJ5N2dWSUxn?=
 =?utf-8?B?SDVEQTNwNndOV2dobkJoYUdLdlF1UE85ZEI4MC94Si9qbWRYU3dCbU1IbXd6?=
 =?utf-8?B?aW5qa25XV3pPU3BFdEdIR1dVU2lTSVFTT2ltUFZZaEQ3SHpDcGlTNnRzcS9n?=
 =?utf-8?B?c3paTlpEaXFjRXFzOXhoWUVBWUZYZlFUemp6RFYyRUVBcjErcTJZWEJHazFh?=
 =?utf-8?B?VnJLY1Z4RDNVQzZ1SDhRTzBCeEIwYXNvZDdJL3FEUy85SVZGelg0NVBuZzFn?=
 =?utf-8?B?anQ1NFpWbkJIbFdqa1ZkUENUZnBydFdiSk5PU0V2UU50d2tRWEVRcmpRMklN?=
 =?utf-8?B?ZG84OUlYN3A1QmYzMDdBaWVudVlFVHQ4c2pJaHdyQmhnRzZFMk9GU080VWhK?=
 =?utf-8?B?RVhqVlljaFVVUnBkR1paK3J6SVFURFZ1Y21NNFM0dGEyRmZObHIyY3E5NUMr?=
 =?utf-8?B?WVE9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a502c167-843f-43b2-f17f-08db706c0e7b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 02:22:40.5858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ACUOqtKgG1Ecl1v3wPvn70eQLz8+4UNmBTikyMGZIq/Fs0FPeL1iuTfBT1guKbYTY2XmvV+sPuRW4wY5cdL4Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8424
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

On 6/16/23 01:57, Evan Quan wrote:
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

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

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
> +		adev->wbrf_event_handler(adev);
> +}
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

