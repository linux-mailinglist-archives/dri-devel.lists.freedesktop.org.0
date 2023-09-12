Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4DD79D170
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 14:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB8410E074;
	Tue, 12 Sep 2023 12:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4781310E074
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 12:54:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZSq+OJzGKlwB/zp3Tt911ovW+w9DzaqIn74KirEQcL8j3LLLT29P0iILlGC1XqAIdaLL0Hj4CRNhTPHyCRpufPJ7YuhADx3Gz+iPwghCzE7rdYmoZhOXaOCWghfyXhwlQ9cd0DpNnVqBUtAoI2wzGnSlxPZ8CsbqOpcVx/nw5lOxiHiYeuRWIqN6riscCApJr6sgq+LrML6De/lUQL1EjSFyNTUJ3XLKyMiJEagggN4JhXelBJbvDuTKTsGIwIlOaN0KZqsnkYgXCd4937GlwdU3/rNKpAvlhYg1eaEUHnghP4sIvyX6Dro0ZFLrIFJAkLmw6Wu/ffdrEiECQJzOng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPR+SpGqFirnwHwGsUVAsa0G2SipG5biY2Zj77TRD10=;
 b=XPTW9POhWG1+uhl05eIeZ24JNziUajYopCylJpB77SHj5vRcLNkT3K9O/IN35IVnxxvNOilV9vsioe7Mk20LC6XdEB3CVytgQA5o74zbTttTThkkKYC6y9JgznG4P6Tipks7o2jmklzicBwXJQ7h40XdpYT+0wbK91H9V9Jm7EIyfK8r1/q7dqGfiZlvEeJ+nbP7rBMqBIf+Fsn+E+Gm8PMPirEpMfykjxltivUUBiq8FRyTrykUYtP2nulQGkSYSYxbWpQdYCVDxsJqWdysK13Z/6zxTwFoXso+ZNSqhSX1KD/knCkR8jWahNF3aS1h75LSZ2aG8YFoA8Dl/M1m9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPR+SpGqFirnwHwGsUVAsa0G2SipG5biY2Zj77TRD10=;
 b=EmRKBoKYly1Q6cojlMV7Tzr4VKGOTH7/FGf7ZNd5kYfeOHYPxH95Wh7gUv/C7rQzTeLB1VMZOMgFoKkHk/ikmj0/sjO3UfIF7n3IiGSkh2h3/f4mZGErlIlDk/vfkZEJ/L/lUA8neEO460COuc74ogmzmEDsf74JwkQ2IuBkXGk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM8PR12MB5400.namprd12.prod.outlook.com (2603:10b6:8:3b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Tue, 12 Sep
 2023 12:54:51 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 12:54:50 +0000
Message-ID: <c4e66bca-a8e8-da53-1a96-7dbdd8a6d5bf@amd.com>
Date: Tue, 12 Sep 2023 14:54:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 1/4] drm/ttm/tests: Add tests for ttm_resource and
 ttm_sys_man
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <cover.1694517411.git.karolina.stolarek@intel.com>
 <97d52e1c257f91c7d0ff53a764fe1e590c070691.1694517411.git.karolina.stolarek@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <97d52e1c257f91c7d0ff53a764fe1e590c070691.1694517411.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0248.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM8PR12MB5400:EE_
X-MS-Office365-Filtering-Correlation-Id: 4348bb6b-ba9a-47db-405d-08dbb38f7393
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dltBkP12zHWQ8VAhmJohbyb9+52nPpDJ8EXuwfpfaOAp1vk5g6KipWzpMYw43+MeCGqKJvo2QVMMpYoERb6V0H73CbPFGkiUbQK8rqKPcwEkJpva15b2voZnKFaxyAr/yXTRgS0GTkQph/XmhRPwkKR66a/dZ5esYZRmxmEy0l7D8LsFq5QcGgYodDrrfDdDe60GvyJHbQPJvbaTaV5Biuejug6ttV6gRbzOYRMoqZJ+6aiK3aU7/keDpIgNxCCUYJyQl49rVokVNKnrG7wbzqqq6W8DwEvxbyc6Zrcw1xCxrfGIl2AKHoJAvedDuXRr/HnVoSnXE8B6H+UtDrDzBFSWBpbtUXs/OojDG/rKGP2DwxPH0nPwTTJso3S9iG1cth/qyr5pWbPHtHsauYrPrZw/dlEWc9BrtNlcktUJv5r3rAleYhoZj+q+q1DwrKIb/gfjKDv27eq6OmSPXbwckZWpXKTD1HnOI0AbLLNkhGDy0UAfIfGUsplgu7Nx/vcWQvuDM7/mZqIl8TXtS4bkP/VEIclJ7nARORyImq+CgiRuKKd8IQ2h3csUXnwVP14OpPwBD94iHgE0efNYJM/izZEjlqSWNl6sPPDoNtFySIppJaxvGxMgyu/1cwwP3/LhXNIJMOBvrTOCwKeKX1nzpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(366004)(136003)(39860400002)(186009)(1800799009)(451199024)(66946007)(83380400001)(478600001)(6512007)(6666004)(6486002)(6506007)(36756003)(31696002)(31686004)(2616005)(86362001)(38100700002)(26005)(66476007)(66556008)(316002)(30864003)(2906002)(41300700001)(5660300002)(8676002)(8936002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkJWbUZiNVBqMkpqSGRoVHZWelgzS3lKQnZ3MGwvYUhSZkhqY242WXB1VjNR?=
 =?utf-8?B?dHVkMFFyWlNadjBCYlRTcnBIVUJvKzNGazhHRkI4ZlJYQmQ5aUsxNjQ3M1ow?=
 =?utf-8?B?aHNaQm0wK3d4dHRUbmFrWXUyckN3RStMME9nckpuMzRGZld5alZqWUd0QUoy?=
 =?utf-8?B?K09CRHdoaTRIdmUvMXF2czcrYVFmNEROcFYyUXFtTDYvcUcwUEdDdUpydHl2?=
 =?utf-8?B?RUFhaXY0eSt6NWcydGpBa1d4UDBaNWQ4N3NFZHlqRXYxYSt2VmdaZE5MbmQx?=
 =?utf-8?B?eDNDQ2llY1VqNVdmdzdEREp5ZWRFYkhUVXk5Ry93SEVkOElQUmNid1ArUkEy?=
 =?utf-8?B?ZXNMVFVPKzMydEQyRXB0VnpXMzdYZ2hUTERGdlBqaHhCejNDRHh4S3duZTVF?=
 =?utf-8?B?ZWhINGcxcWgzTm1KZ0h0dk5Dd2loOFJXaFNiT1lWbjZyYWlCL3B0MTRESXNy?=
 =?utf-8?B?S3U1dmxFcDhNSVhybWl0VGV0NmprakhwWFhtbEdxQ08rbFZtS2c3SWpyU1lL?=
 =?utf-8?B?ajYyWnZDMUgvOGt2SFc2cUk5ZmI0S01SbmZVRGRhUEtDVzRsMnoraVphbFBP?=
 =?utf-8?B?aHVtUm8xWmdYdlR5cjgzT3VlNmVHbk1iMnFESnF2dWxMUThPVFZXT2NKR2xz?=
 =?utf-8?B?Ykt4RGlSSmp4dDlLWVZ2RnpaSXhvT2JXMHRQM2phdlM3MVRFWDFzRU9MRDNJ?=
 =?utf-8?B?S25ZeFc0NWluSjd2Y3E0N1NrcUhaanVWbWhuaDdVSUMrMnVGRVFmVlFnYkpW?=
 =?utf-8?B?SVRrbG01MGpybTBUcUJTT25UMkNmWE13ZzRoYXZXQUl2cXlQUnMvVWNOLzJ3?=
 =?utf-8?B?VHR5b3FOMFdrOHlMME4ra3NVWHVnTjlhKzEzaDMzRFF6NTJYZkFRWHRyd1hN?=
 =?utf-8?B?bU9ZQ0JlaEVCYTZsbkZZTUNJbWVuTzZEQ3ZWb1EzenpUdlFiYTJmOTNhMDho?=
 =?utf-8?B?RFVpV1BueFVxcS9IYWwvNnFkNkc4OUZoUHY4RFBHbFJyby9NeCtMMkYyZkx5?=
 =?utf-8?B?WlJ5MHB0eVFnVWJERXdVMm0zc3FNWGpIazlQMEpaRGhxeSt0b2F4OFh0T0k3?=
 =?utf-8?B?QVNtc1c1Z1gzbkI1bmNEK25hbUxpYm5RMncyV3ZGbjU5SzF2U0E0Znc5ODk3?=
 =?utf-8?B?S1BFWk9JUlBWNkRNOGYyRTNwckF5akxQQ1ZsWGd2T1dGcDN0eUJEb0hYNW5M?=
 =?utf-8?B?ZmdTckZTSWhaaERETFZjKzBaMUZ1c3ZqNTRKcStxeWdxejlyUTJnVE4xTzB3?=
 =?utf-8?B?OEhITGYyR0tYVUx0NFRNZzBzTkN5ZjBUZ3U5ajE5ZHBLZmZFdkxiV1JENVh0?=
 =?utf-8?B?Q1VKYk5NUytPeWNWSC9VdTFoNkRjNXp6TmxuaWE5WDE1VDF4Z215anBYUmtx?=
 =?utf-8?B?Zzl1NGNsMm1RMGNYTnhxREdZa1Y2MWFoYythZHAvQlFJaXluaDNsbzRFQVFj?=
 =?utf-8?B?R3Q5N2Zqc3J0K2I3eTRWWHM1Q2I5T3dYa3VsZlkvUDczVzdQV3FGWGVrNTNF?=
 =?utf-8?B?ejJVVWpEZXBpVTZlaWJPNnUxUEd6Rko2MUFlSUh6WjRIZjRrSm4zQ1VrNGgw?=
 =?utf-8?B?TTVVRDJ3TGxHVTN1cVNzRkFHR0RmUmdDdWtYQjFtQXBISVIvT3BUMEV6YVBz?=
 =?utf-8?B?LzZ1Q3kxNHgwQ2t3TXhsMWROd200NHpmUk1pYVhDZEhJd1lKVGxlWmlPQWNm?=
 =?utf-8?B?Yml0UVVodXEwcUlqV1BzUkdZY3l4d1NGMTdVNUlHMEFiZDBKS0pSaUtmdmJB?=
 =?utf-8?B?dVFhbHA5aEp0VVJYYm1yTFFuTS9HeG9YRnNzV3hGeEFLZWkzcXJIY0JmODQ1?=
 =?utf-8?B?aVNsYjlaMVRqaEZBeXZocnBUczR1dFl6dUU0RENwVnJsMWU3UmN4NHdxNkRw?=
 =?utf-8?B?b1NPUFVSNGVTa1ZxN0tROFdEMmRHOGZqekxtN1lVaEJDRzE3Y2tVc3k4U3JC?=
 =?utf-8?B?eXFweU5hREJ4SEFUdmU3NVBuNUVibEFGaFdCT2NGNEIvTTRaTVhsOTVoL3FW?=
 =?utf-8?B?ZURYMkJ0MWFUQUVMMWJnVnJMZmdRMnVjSzdJK2YvNmEzS1YyME9YTnd3dlc3?=
 =?utf-8?B?NkRJcW5FWnJialB6eXBQK1VBQ3FGbmE3OEo5STN2a1pqdytUWGtqL2wvcHdJ?=
 =?utf-8?Q?AzrqVnO9ZP3if2dj/1XJSVqt3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4348bb6b-ba9a-47db-405d-08dbb38f7393
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 12:54:50.5922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nQNg0OP2rFE1S37ulLJz8ILmUrKXJNcFj8Ir5K0bfc8EbaHw6CfoYw6ji2HjuRFg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5400
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.09.23 um 13:49 schrieb Karolina Stolarek:
> Test initialization of ttm_resource using different memory domains.
> Add tests for a system memory manager and functions that can be
> tested without a fully-featured resource manager. Update
> ttm_bo_kunit_init() to initialize BO's kref and reservation object.
> Export ttm_resource_alloc symbol for test purposes only.
>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>   drivers/gpu/drm/ttm/tests/Makefile            |   1 +
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  23 ++
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   4 +
>   drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 335 ++++++++++++++++++
>   drivers/gpu/drm/ttm/ttm_resource.c            |   3 +
>   5 files changed, 366 insertions(+)
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>
> diff --git a/drivers/gpu/drm/ttm/tests/Makefile b/drivers/gpu/drm/ttm/tests/Makefile
> index ec87c4fc1ad5..c92fe2052ef6 100644
> --- a/drivers/gpu/drm/ttm/tests/Makefile
> +++ b/drivers/gpu/drm/ttm/tests/Makefile
> @@ -3,4 +3,5 @@
>   obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>           ttm_device_test.o \
>           ttm_pool_test.o \
> +        ttm_resource_test.o \
>           ttm_kunit_helpers.o
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> index 81661d8827aa..eccc59b981f8 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> @@ -38,10 +38,33 @@ struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
>   	bo->base = gem_obj;
>   	bo->bdev = devs->ttm_dev;
>   
> +	kref_init(&bo->kref);
> +
> +	dma_resv_init(&bo->base._resv);
> +	bo->base.resv = &bo->base._resv;
> +

I'm really wondering if we shouldn't now initialize the GEM object properly?

That would also initialize the reservation object if I remember correctly.

The solution with EXPORT_SYMBOL_FOR_TESTS_ONLY looks really nice I think 
and apart from that I can't see anything obviously wrong either, but I 
only skimmed over the code.

Regards,
Christian.

>   	return bo;
>   }
>   EXPORT_SYMBOL_GPL(ttm_bo_kunit_init);
>   
> +struct ttm_place *ttm_place_kunit_init(struct kunit *test,
> +				       uint32_t mem_type, uint32_t flags,
> +				       size_t size)
> +{
> +	struct ttm_place *place;
> +
> +	place = kunit_kzalloc(test, sizeof(*place), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, place);
> +
> +	place->mem_type = mem_type;
> +	place->flags = flags;
> +	place->fpfn = size >> PAGE_SHIFT;
> +	place->lpfn = place->fpfn + (size >> PAGE_SHIFT);
> +
> +	return place;
> +}
> +EXPORT_SYMBOL_GPL(ttm_place_kunit_init);
> +
>   struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test)
>   {
>   	struct ttm_test_devices *devs;
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> index e261e3660d0b..f38140f93c05 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> @@ -8,6 +8,7 @@
>   #include <drm/drm_drv.h>
>   #include <drm/ttm/ttm_device.h>
>   #include <drm/ttm/ttm_bo.h>
> +#include <drm/ttm/ttm_placement.h>
>   
>   #include <drm/drm_kunit_helpers.h>
>   #include <kunit/test.h>
> @@ -28,6 +29,9 @@ int ttm_device_kunit_init(struct ttm_test_devices *priv,
>   struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
>   					    struct ttm_test_devices *devs,
>   					    size_t size);
> +struct ttm_place *ttm_place_kunit_init(struct kunit *test,
> +				       uint32_t mem_type, uint32_t flags,
> +				       size_t size);
>   
>   struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test);
>   struct ttm_test_devices *ttm_test_devices_all(struct kunit *test);
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> new file mode 100644
> index 000000000000..851cdc43dc37
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> @@ -0,0 +1,335 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +#include <drm/ttm/ttm_resource.h>
> +
> +#include "ttm_kunit_helpers.h"
> +
> +#define RES_SIZE		SZ_4K
> +#define TTM_PRIV_DUMMY_REG	(TTM_NUM_MEM_TYPES - 1)
> +
> +struct ttm_resource_test_case {
> +	const char *description;
> +	uint32_t mem_type;
> +	uint32_t flags;
> +};
> +
> +struct ttm_resource_test_priv {
> +	struct ttm_test_devices *devs;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +};
> +
> +static const struct ttm_resource_manager_func ttm_resource_manager_mock_funcs = { };
> +
> +static int ttm_resource_test_init(struct kunit *test)
> +{
> +	struct ttm_resource_test_priv *priv;
> +
> +	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, priv);
> +
> +	priv->devs = ttm_test_devices_all(test);
> +	KUNIT_ASSERT_NOT_NULL(test, priv->devs);
> +
> +	test->priv = priv;
> +
> +	return 0;
> +}
> +
> +static void ttm_resource_test_fini(struct kunit *test)
> +{
> +	struct ttm_resource_test_priv *priv = test->priv;
> +
> +	ttm_test_devices_put(test, priv->devs);
> +}
> +
> +static void ttm_init_test_mocks(struct kunit *test,
> +				struct ttm_resource_test_priv *priv,
> +				uint32_t mem_type, uint32_t flags)
> +{
> +	size_t size = RES_SIZE;
> +
> +	/* Make sure we have what we need for a good BO mock */
> +	KUNIT_ASSERT_NOT_NULL(test, priv->devs->ttm_dev);
> +
> +	priv->bo = ttm_bo_kunit_init(test, priv->devs, size);
> +	priv->place = ttm_place_kunit_init(test, mem_type, flags, size);
> +}
> +
> +static void ttm_init_test_manager(struct kunit *test,
> +				  struct ttm_resource_test_priv *priv,
> +				  uint32_t mem_type)
> +{
> +	struct ttm_device *ttm_dev = priv->devs->ttm_dev;
> +	struct ttm_resource_manager *man;
> +	size_t size = SZ_16K;
> +
> +	man = kunit_kzalloc(test, sizeof(*man), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, man);
> +
> +	man->use_tt = false;
> +	man->func = &ttm_resource_manager_mock_funcs;
> +
> +	ttm_resource_manager_init(man, ttm_dev, size);
> +	ttm_set_driver_manager(ttm_dev, mem_type, man);
> +	ttm_resource_manager_set_used(man, true);
> +}
> +
> +static const struct ttm_resource_test_case ttm_resource_cases[] = {
> +	{
> +		.description = "Init resource in TTM_PL_SYSTEM",
> +		.mem_type = TTM_PL_SYSTEM,
> +	},
> +	{
> +		.description = "Init resource in TTM_PL_VRAM",
> +		.mem_type = TTM_PL_VRAM,
> +	},
> +	{
> +		.description = "Init resource in a private placement",
> +		.mem_type = TTM_PRIV_DUMMY_REG,
> +	},
> +	{
> +		.description = "Init resource in TTM_PL_SYSTEM, set placement flags",
> +		.mem_type = TTM_PL_SYSTEM,
> +		.flags = TTM_PL_FLAG_TOPDOWN,
> +	},
> +};
> +
> +static void ttm_resource_case_desc(const struct ttm_resource_test_case *t, char *desc)
> +{
> +	strscpy(desc, t->description, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(ttm_resource, ttm_resource_cases, ttm_resource_case_desc);
> +
> +static void ttm_resource_init_basic(struct kunit *test)
> +{
> +	const struct ttm_resource_test_case *params = test->param_value;
> +	struct ttm_resource_test_priv *priv = test->priv;
> +	struct ttm_resource *res;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct ttm_resource_manager *man;
> +	uint64_t expected_usage;
> +
> +	ttm_init_test_mocks(test, priv, params->mem_type, params->flags);
> +	bo = priv->bo;
> +	place = priv->place;
> +
> +	if (params->mem_type > TTM_PL_SYSTEM)
> +		ttm_init_test_manager(test, priv, params->mem_type);
> +
> +	res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, res);
> +
> +	man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
> +	expected_usage = man->usage + RES_SIZE;
> +
> +	KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[bo->priority]));
> +
> +	ttm_resource_init(bo, place, res);
> +
> +	KUNIT_ASSERT_EQ(test, res->start, 0);
> +	KUNIT_ASSERT_EQ(test, res->size, RES_SIZE);
> +	KUNIT_ASSERT_EQ(test, res->mem_type, place->mem_type);
> +	KUNIT_ASSERT_EQ(test, res->placement, place->flags);
> +	KUNIT_ASSERT_PTR_EQ(test, res->bo, bo);
> +
> +	KUNIT_ASSERT_NULL(test, res->bus.addr);
> +	KUNIT_ASSERT_EQ(test, res->bus.offset, 0);
> +	KUNIT_ASSERT_FALSE(test, res->bus.is_iomem);
> +	KUNIT_ASSERT_EQ(test, res->bus.caching, ttm_cached);
> +	KUNIT_ASSERT_EQ(test, man->usage, expected_usage);
> +
> +	KUNIT_ASSERT_TRUE(test, list_is_singular(&man->lru[bo->priority]));
> +
> +	ttm_resource_fini(man, res);
> +}
> +
> +static void ttm_resource_init_pinned(struct kunit *test)
> +{
> +	struct ttm_resource_test_priv *priv = test->priv;
> +	struct ttm_resource *res;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct ttm_resource_manager *man;
> +
> +	ttm_init_test_mocks(test, priv, TTM_PL_SYSTEM, 0);
> +	bo = priv->bo;
> +	place = priv->place;
> +
> +	man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
> +
> +	res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, res);
> +	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
> +
> +	dma_resv_lock(bo->base.resv, NULL);
> +	ttm_bo_pin(bo);
> +	ttm_resource_init(bo, place, res);
> +	KUNIT_ASSERT_TRUE(test, list_is_singular(&bo->bdev->pinned));
> +
> +	ttm_bo_unpin(bo);
> +	ttm_resource_fini(man, res);
> +	dma_resv_unlock(bo->base.resv);
> +
> +	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
> +}
> +
> +static void ttm_resource_fini_basic(struct kunit *test)
> +{
> +	struct ttm_resource_test_priv *priv = test->priv;
> +	struct ttm_resource *res;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct ttm_resource_manager *man;
> +
> +	ttm_init_test_mocks(test, priv, TTM_PL_SYSTEM, 0);
> +	bo = priv->bo;
> +	place = priv->place;
> +
> +	man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
> +
> +	res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, res);
> +
> +	ttm_resource_init(bo, place, res);
> +	ttm_resource_fini(man, res);
> +
> +	KUNIT_ASSERT_TRUE(test, list_empty(&res->lru));
> +	KUNIT_ASSERT_EQ(test, man->usage, 0);
> +}
> +
> +static void ttm_resource_manager_init_basic(struct kunit *test)
> +{
> +	struct ttm_resource_test_priv *priv = test->priv;
> +	struct ttm_resource_manager *man;
> +	size_t size = SZ_16K;
> +
> +	man = kunit_kzalloc(test, sizeof(*man), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, man);
> +
> +	ttm_resource_manager_init(man, priv->devs->ttm_dev, size);
> +
> +	KUNIT_ASSERT_PTR_EQ(test, man->bdev, priv->devs->ttm_dev);
> +	KUNIT_ASSERT_EQ(test, man->size, size);
> +	KUNIT_ASSERT_EQ(test, man->usage, 0);
> +	KUNIT_ASSERT_NULL(test, man->move);
> +	KUNIT_ASSERT_NOT_NULL(test, &man->move_lock);
> +
> +	for (int i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
> +		KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[i]));
> +}
> +
> +static void ttm_resource_manager_usage_basic(struct kunit *test)
> +{
> +	struct ttm_resource_test_priv *priv = test->priv;
> +	struct ttm_resource *res;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct ttm_resource_manager *man;
> +	uint64_t actual_usage;
> +
> +	ttm_init_test_mocks(test, priv, TTM_PL_SYSTEM, TTM_PL_FLAG_TOPDOWN);
> +	bo = priv->bo;
> +	place = priv->place;
> +
> +	res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, res);
> +
> +	man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
> +
> +	ttm_resource_init(bo, place, res);
> +	actual_usage = ttm_resource_manager_usage(man);
> +
> +	KUNIT_ASSERT_EQ(test, actual_usage, RES_SIZE);
> +
> +	ttm_resource_fini(man, res);
> +}
> +
> +static void ttm_resource_manager_set_used_basic(struct kunit *test)
> +{
> +	struct ttm_resource_test_priv *priv = test->priv;
> +	struct ttm_resource_manager *man;
> +
> +	man = ttm_manager_type(priv->devs->ttm_dev, TTM_PL_SYSTEM);
> +	KUNIT_ASSERT_TRUE(test, man->use_type);
> +
> +	ttm_resource_manager_set_used(man, false);
> +	KUNIT_ASSERT_FALSE(test, man->use_type);
> +}
> +
> +static void ttm_sys_man_alloc_basic(struct kunit *test)
> +{
> +	struct ttm_resource_test_priv *priv = test->priv;
> +	struct ttm_resource_manager *man;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct ttm_resource *res;
> +	uint32_t mem_type = TTM_PL_SYSTEM;
> +	int ret;
> +
> +	ttm_init_test_mocks(test, priv, mem_type, 0);
> +	bo = priv->bo;
> +	place = priv->place;
> +
> +	man = ttm_manager_type(priv->devs->ttm_dev, mem_type);
> +	ret = man->func->alloc(man, bo, place, &res);
> +
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	KUNIT_ASSERT_EQ(test, res->size, RES_SIZE);
> +	KUNIT_ASSERT_EQ(test, res->mem_type, mem_type);
> +	KUNIT_ASSERT_PTR_EQ(test, res->bo, bo);
> +
> +	ttm_resource_fini(man, res);
> +}
> +
> +static void ttm_sys_man_free_basic(struct kunit *test)
> +{
> +	struct ttm_resource_test_priv *priv = test->priv;
> +	struct ttm_resource_manager *man;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_place *place;
> +	struct ttm_resource *res;
> +	uint32_t mem_type = TTM_PL_SYSTEM;
> +
> +	ttm_init_test_mocks(test, priv, mem_type, 0);
> +	bo = priv->bo;
> +	place = priv->place;
> +
> +	res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, res);
> +
> +	ttm_resource_alloc(bo, place, &res);
> +
> +	man = ttm_manager_type(priv->devs->ttm_dev, mem_type);
> +	man->func->free(man, res);
> +
> +	KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[bo->priority]));
> +	KUNIT_ASSERT_EQ(test, man->usage, 0);
> +}
> +
> +static struct kunit_case ttm_resource_test_cases[] = {
> +	KUNIT_CASE_PARAM(ttm_resource_init_basic, ttm_resource_gen_params),
> +	KUNIT_CASE(ttm_resource_init_pinned),
> +	KUNIT_CASE(ttm_resource_fini_basic),
> +	KUNIT_CASE(ttm_resource_manager_init_basic),
> +	KUNIT_CASE(ttm_resource_manager_usage_basic),
> +	KUNIT_CASE(ttm_resource_manager_set_used_basic),
> +	KUNIT_CASE(ttm_sys_man_alloc_basic),
> +	KUNIT_CASE(ttm_sys_man_free_basic),
> +	{}
> +};
> +
> +static struct kunit_suite ttm_resource_test_suite = {
> +	.name = "ttm_resource",
> +	.init = ttm_resource_test_init,
> +	.exit = ttm_resource_test_fini,
> +	.test_cases = ttm_resource_test_cases,
> +};
> +
> +kunit_test_suites(&ttm_resource_test_suite);
> +
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 46ff9c75bb12..02b96d23fdb9 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -30,6 +30,8 @@
>   #include <drm/ttm/ttm_placement.h>
>   #include <drm/ttm/ttm_resource.h>
>   
> +#include <drm/drm_util.h>
> +
>   /**
>    * ttm_lru_bulk_move_init - initialize a bulk move structure
>    * @bulk: the structure to init
> @@ -240,6 +242,7 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
>   	spin_unlock(&bo->bdev->lru_lock);
>   	return 0;
>   }
> +EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_resource_alloc);
>   
>   void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
>   {

