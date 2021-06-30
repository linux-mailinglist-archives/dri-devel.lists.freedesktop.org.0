Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0613B7FB3
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 11:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC66F6E95A;
	Wed, 30 Jun 2021 09:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3026E95A
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 09:10:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBgYoaGj7UIH/tTPN9VsZuqLlAwyomOV15SXL60OMYrwrHMtBeCK1RX5pEopA3hIkApQf2qtocEAfZR/C2x/QWn/qxZZJQWt6zKHUs9x9I3EJ256Y8c0S3p1uPS3hD9EXq7KKrpzBLhovI8m1nJ2yCYow/yQGTgVspjV6zzr1aeSjTRD59J86c2A9n50icGiy3Fe3HJQX+IM8UiZl1R1Q687/QYmok3YwSNH14+/D4hiOX5IC1eBhhYV5HMn9Os0seyjtWuGTjOBzCsC8ZrOtw9/CSclIP6SJ8HW5UvkmpJvJEquKJvi7vfZ6ff0fJJtLMR52Hwb6n8PKf8DE7WQeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQixkoyB1Dc/HyPN4JYTQZ4Au1nWv7sJPfFLMs+fy9M=;
 b=g5imcCLAT9061ps9cDLG6RH2PAL/CekAoDB50mstS4HgVefHx5ZrbjRH/J5l69XwYDtO1zenMaxAgCbkrGQtNsJfyX9dt1HB2AhLC9iAuNM2Fdzgs1eprsHVT3E6sHcxgh9F6Thm6Nb7jVR78qDgEggfCio4dDC6B6XJo20+DsohGQuqwibdvwYKVOKGyklQL82QXqtKaYe67FA2b1dS0D11fB4ttzqnqORhpfvOxhA1kqA9TyjADQ3yda8fbnmTenmNItuRuU8EEP7CteGkMWQ48wi0YdGGF0hv9j/udhXHs8COyRaQP0BPBqSF2A/C/D9GOCO3YXLsfsu+P7dF/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQixkoyB1Dc/HyPN4JYTQZ4Au1nWv7sJPfFLMs+fy9M=;
 b=n1Mt5o7sallaZKXpXf2yv5RY5VUmQRWK4584K68iHlUfNhu+5v1QjLATYL1CB6ztKNpuB6Z2qlzjcaWZqVOKINp7ZfhCI7URELrxzlOhH06WX3V6IMJJRsLErnliYfgSHP/tPlBiPSla+ariYI+r9RVvE6NTuwLuSMgZqbhDd+U=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3901.namprd12.prod.outlook.com (2603:10b6:208:16c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Wed, 30 Jun
 2021 09:10:38 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4264.026; Wed, 30 Jun 2021
 09:10:38 +0000
Subject: Re: [PATCH v9 1/5] drm: Add a sharable drm page-pool implementation
To: John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>
References: <20210630013421.735092-1-john.stultz@linaro.org>
 <20210630013421.735092-2-john.stultz@linaro.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ab35ed32-ead4-3dc4-550d-55f288810220@amd.com>
Date: Wed, 30 Jun 2021 11:10:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210630013421.735092-2-john.stultz@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:fd79:22d7:4c21:2421]
X-ClientProxiedBy: FR3P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::9) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:fd79:22d7:4c21:2421]
 (2a02:908:1252:fb60:fd79:22d7:4c21:2421) by
 FR3P281CA0031.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.12 via Frontend Transport; Wed, 30 Jun 2021 09:10:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49f10cfa-58f7-467c-9745-08d93ba6ed82
X-MS-TrafficTypeDiagnostic: MN2PR12MB3901:
X-Microsoft-Antispam-PRVS: <MN2PR12MB39011ED905626BF2326D3C3683019@MN2PR12MB3901.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nlxlW6ucPtuFWCs1foY4lp8ZCSeOCQZmq9A38VHDxLO9axUSXpKtWOW3OGZcm7mgMpMRaaeorHkrn4mJYSLb98X/3pf/ClCaxJof59+Iv+8G9zcryThkRVXcoEdManpKi+AhU0XfUVwwlMLk5SiL+AdYnart+lmR9B/fenmsYySQS2kstpl43IPf71MghXuz6oAyDmChxTUeLJAgAjtIvH9W5hTIJtqj+BgeYviSGbP/Yz36syGjlCqBiEiy21rth6TipQz1FrPxdIQovpS2X3yeDLu9hyoSYco99fpbHchEJfbRC1Tu4DbjCWtX+xQ54zTLWbeYqZk9r0wi7ARNk/+82Zj4kUE45YoeU45PYwRf4B84lz3x52JXJDitKRGQ/AjJ6ydrKHPSZb7aRxB/tE2AGgiMm8+AKSu+s205H7+iiMjMSexpdgVrowAMzHaPrQhiBSAq46+C7DEQk3sWYEESQneYSxyLdR9ytW50Cdxr+qpwQ92Syvxnk7Z1mIYmJbdxr7TwR4zG24BVQ1Bq98UEz27+pC7aosY1uXEicJTwpjHF7JKklP4IFwXAoUSXbRd9meQfJ9PUXSf1F/ybN2Uw+yvWAxmG3VKXgEj4uCnw1K23WVBPKXY4wc4/FtKMLHKjDKwPcq1cg1GsLDxcVOc5G6u5dJBl9qxUKXK52Ig2ySX/a23N7ip6wOgQ5Xw1CmxrwUASSxUz5qjhnO2dAcemac1DFhAIezuC6zJvlN0MLduuMzzGn1Nu24JaAh93i9qVpcCAC2y1LeVMV6U+pA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(66574015)(8936002)(54906003)(4326008)(66556008)(316002)(66946007)(8676002)(83380400001)(5660300002)(478600001)(110136005)(38100700002)(6666004)(66476007)(30864003)(7416002)(31696002)(2616005)(186003)(86362001)(2906002)(16526019)(6486002)(36756003)(31686004)(522954003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGdsMWtNcmtSMGJnVHZGc0FFSzRQNXlyampEeC9BNmhDVG9zTlhkdWRkbFA2?=
 =?utf-8?B?T1A0R1MxU0M1OW5jYUc1Tmw2Z3RYVkFjaUJnandiQzhQMG5qckdhRmNZYlU4?=
 =?utf-8?B?bUdCZUdNRTBwWGdTQTZrL2d3NW1FVU94NU95TVgwZG9JYnJVY2l1eTNIRFZx?=
 =?utf-8?B?ZU8zaEdNQ3BGYUx0dWtBR0gwcS94bjJpdVBULytDd2VzM2RmQ3Z1Z1pMajl4?=
 =?utf-8?B?MUxRWG4wT1ZsT1F3RGI4dlVTUUJxYS9vRC9CTlNQQ0l1OUJuT1h0MzhXQ01y?=
 =?utf-8?B?WnE5QUJyMFpxdnErZU1mTmxqYTQ0YldRQTY0UFdXeExaRGpZamRqcDJLM01P?=
 =?utf-8?B?V2ZSN3FBblNJMW11aWdNcFlIeW1HZDhBWlZ0V1R6bHdTSmFiMUhwMVJobVAv?=
 =?utf-8?B?b213cy9CRnZHMWxsTEN3TXJ1Qzl3akJ1WmdDM09OM2t5NTJVbmYwT2kvT2V1?=
 =?utf-8?B?Nk0vWEJKOUwvd3ZzVTF1SnJSV01uVWhyZDFvQ0o4NHhKSzBicEtPcUFWeXZF?=
 =?utf-8?B?TXZLTVJ2OVQ3MzZLRUMvM21qWTdOSUVYRHB0VnBERUFVZTl4RGUzbDN1NXRn?=
 =?utf-8?B?VnBvZWZ4L1BCY21Oc0lremFuZCt0UEVTWkxka2s5dmQ2a3JoZE12dFNidzB6?=
 =?utf-8?B?SkNkUEJ1clNXL3FUR2RRNEg0REZLV1MwTUd6WlVWcXgxaCtBUmhBTmhTRUlQ?=
 =?utf-8?B?akZpRVB3TGJUaFpQMUJ0bkJ3Wmx2RjdYYjczV21rY3l0NElqL3ZRdE8xQzNS?=
 =?utf-8?B?eEVHc1NvMDNxSFJHZFROeUZOaFRJRzF4V2lidGxiTXd6OEJ3NSs2SS9BM1Bw?=
 =?utf-8?B?VzNuN3pvZFdGQk5xemhCcXZMZW9tQlRYQ2l2cWNIZXhwZGsvMDZEWmNVMm1C?=
 =?utf-8?B?TEZVY2x3RDQyVXNpTUdqV2g0VkY5REhkYk03UGJObGFoZkpOMXloM2w1c2RV?=
 =?utf-8?B?MExtSU1hdjQzNHFUQjIxLzhYcmxON1gzLzVvemZobXJib1hvUXc5dC9vdUly?=
 =?utf-8?B?c3BCOXNtamlvS3FoMEo0WFNTd2pQd0pKUnJZcG1rVXRNb1d1S3hqbEM0cVYz?=
 =?utf-8?B?TFRJUVR4RDZuUW5GaWs2VzA0dkxUVlduTkhhKzF0dktsZVh5cUN0RjFFYUEw?=
 =?utf-8?B?Ym04NTh0dTNFOTFhcmdNR0lUUkJKWHdiQ0lLayt5eWUxRTZxdmViR0VnN1pq?=
 =?utf-8?B?TzR2VzBkdHJvRmdMUk10d2dWZXZZeVJueDlnRGpFSUNKQmhFWWdFaWhOTys5?=
 =?utf-8?B?RUxWQnlzQ09aTittSGpDNm9PM2ZWSmFnSU9rbFNVSTVGZ0Rvc2t5eG1jZDQ3?=
 =?utf-8?B?N09zVjEwVlQ1NTYyaWNqenhnbXZEcnhmdHZUZ3dpOTFwRWZPVjgxblh4M0dS?=
 =?utf-8?B?QTBjS0x6N005MElQZHE2dnNKdk5VNDlhSXVkUlV2QnlxcmQxaDJaUWNtMkxW?=
 =?utf-8?B?S0sySVNqRUZzaTBUSk5JSEE1SG1RdFZ4dm5GM0U5SkM3RDRXeUQrQitOako2?=
 =?utf-8?B?cE0zTk1XR09MS1BvczFHRGM1b3ovaDhEMXcwUFhISFBuTFpFcjluVVFPdFFG?=
 =?utf-8?B?cVc5Njk2NGhCNWtrNDg5ejgzVWpGcURDSlVReXB4RFY0NndrYTRYUkdIVFVz?=
 =?utf-8?B?eGdDaHBUeDZKK3dhNGRuMWZxMlBLUE9nbUJsQTBIdW0wQW5IaHMybFZaRG1w?=
 =?utf-8?B?aHRtZHRqSGh1SnA4M2Y3TXg2OEoxUmFhTC9CT1NXeENrVnB1YjNGTFJYMnZk?=
 =?utf-8?B?ZE5DcHY4TjVyWFMrRUFnN1dIVm50ZHhyNExRRUttSjlXclhuU0h6NlJvdkpl?=
 =?utf-8?B?NXhmWHBLVVdPcmtydVhjNTRPOXpVVm5EYy85VEV0aXVVemlYd2c2TXEvcVFs?=
 =?utf-8?Q?Pk79rBTDnTIM+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f10cfa-58f7-467c-9745-08d93ba6ed82
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 09:10:38.6863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: poCCBDC1/SmGRUIwv1N4VTOjDB2XAKvUnPc0YekYr1/pzQ88KEU6KBuUKxZLPWEk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3901
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
Cc: dri-devel@lists.freedesktop.org, Sandeep Patil <sspatil@google.com>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=c3=98rjan_Eide?= <orjan.eide@arm.com>, linux-media@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.06.21 um 03:34 schrieb John Stultz:
> This adds a shrinker controlled page pool, extracted
> out of the ttm_pool logic, and abstracted out a bit
> so it can be used by other non-ttm drivers.
>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Liam Mark <lmark@codeaurora.org>
> Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
> Cc: Laura Abbott <labbott@kernel.org>
> Cc: Brian Starkey <Brian.Starkey@arm.com>
> Cc: Hridya Valsaraju <hridya@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Sandeep Patil <sspatil@google.com>
> Cc: Daniel Mentz <danielmentz@google.com>
> Cc: Ørjan Eide <orjan.eide@arm.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ezequiel Garcia <ezequiel@collabora.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: James Jones <jajones@nvidia.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
> v8:
> * Completely rewritten from scratch, using only the
>    ttm_pool logic so it can be dual licensed.
> v9:
> * Add Kerneldoc comments similar to tmm implementation
>    as suggested by ChristianK
> * Mark some functions static as suggested by ChristianK
> * Fix locking issue ChristianK pointed out
> * Add methods to block the shrinker so users can
>    make atomic calculations across multiple pools, as
>    suggested by ChristianK
> * Fix up Kconfig dependency issue as Reported-by:
>    kernel test robot <lkp@intel.com>
> ---
>   drivers/gpu/drm/Kconfig     |   3 +
>   drivers/gpu/drm/Makefile    |   2 +
>   drivers/gpu/drm/page_pool.c | 297 ++++++++++++++++++++++++++++++++++++
>   include/drm/page_pool.h     |  68 +++++++++
>   4 files changed, 370 insertions(+)
>   create mode 100644 drivers/gpu/drm/page_pool.c
>   create mode 100644 include/drm/page_pool.h
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 3c16bd1afd87..52d9ba92b35e 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -177,6 +177,9 @@ config DRM_DP_CEC
>   	  Note: not all adapters support this feature, and even for those
>   	  that do support this they often do not hook up the CEC pin.
>   
> +config DRM_PAGE_POOL
> +	bool
> +
>   config DRM_TTM
>   	tristate
>   	depends on DRM && MMU
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 5279db4392df..affa4ca3a08e 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -39,6 +39,8 @@ obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
>   drm_ttm_helper-y := drm_gem_ttm_helper.o
>   obj-$(CONFIG_DRM_TTM_HELPER) += drm_ttm_helper.o
>   
> +drm-$(CONFIG_DRM_PAGE_POOL) += page_pool.o
> +
>   drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o drm_dp_helper.o \
>   		drm_dsc.o drm_probe_helper.o \
>   		drm_plane_helper.o drm_dp_mst_topology.o drm_atomic_helper.o \
> diff --git a/drivers/gpu/drm/page_pool.c b/drivers/gpu/drm/page_pool.c
> new file mode 100644
> index 000000000000..c07bbe3afc32
> --- /dev/null
> +++ b/drivers/gpu/drm/page_pool.c
> @@ -0,0 +1,297 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Sharable page pool implementation
> + *
> + * Extracted from drivers/gpu/drm/ttm/ttm_pool.c
> + * Copyright 2020 Advanced Micro Devices, Inc.
> + * Copyright 2021 Linaro Ltd.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: Christian König, John Stultz
> + */
> +
> +#include <linux/module.h>
> +#include <linux/highmem.h>
> +#include <linux/shrinker.h>
> +#include <drm/page_pool.h>
> +
> +static unsigned long page_pool_size; /* max size of the pool */
> +
> +MODULE_PARM_DESC(page_pool_size, "Number of pages in the drm page pool");
> +module_param(page_pool_size, ulong, 0644);
> +
> +static atomic_long_t nr_managed_pages;
> +
> +static struct mutex shrinker_lock;
> +static struct list_head shrinker_list;
> +static struct shrinker mm_shrinker;
> +
> +/**
> + * drm_page_pool_set_max - Sets maximum size of all pools
> + *
> + * Sets the maximum number of pages allows in all pools.
> + * This can only be set once, and the first caller wins.
> + */
> +void drm_page_pool_set_max(unsigned long max)
> +{
> +	if (!page_pool_size)
> +		page_pool_size = max;
> +}
> +
> +/**
> + * drm_page_pool_get_max - Maximum size of all pools
> + *
> + * Return the maximum number of pages allows in all pools
> + */
> +unsigned long drm_page_pool_get_max(void)
> +{
> +	return page_pool_size;
> +}

Well in general I don't think it is a good idea to have getters/setters 
for one line functionality, similar applies to locking/unlocking the 
mutex below.

Then in this specific case what those functions do is to aid 
initializing the general pool manager and that in turn should absolutely 
not be exposed.

The TTM pool manager exposes this as function because initializing the 
pool manager is done in one part of the module and calculating the 
default value for the pages in another one. But that is not something I 
would like to see here.

> +
> +/**
> + * drm_page_pool_get_total - Current size of all pools
> + *
> + * Return the number of pages in all managed pools
> + */
> +unsigned long drm_page_pool_get_total(void)
> +{
> +	return atomic_long_read(&nr_managed_pages);
> +}
> +
> +/**
> + * drm_page_pool_get_size - Get the number of pages in the pool
> + *
> + * @pool: Pool to calculate the size of
> + *
> + * Return the number of pages in the specified pool
> + */
> +unsigned long drm_page_pool_get_size(struct drm_page_pool *pool)
> +{
> +	unsigned long size;
> +
> +	spin_lock(&pool->lock);
> +	size = pool->page_count;
> +	spin_unlock(&pool->lock);
> +	return size;
> +}
> +
> +/**
> + * drm_page_pool_add - Add a page to a pool
> + *
> + * @pool: Pool to add page to
> + * @page: Page to be added to the pool
> + *
> + * Gives specified page into a specific pool
> + */
> +void drm_page_pool_add(struct drm_page_pool *pool, struct page *p)
> +{
> +	unsigned int i, num_pages = 1 << pool->order;
> +
> +	/* Make sure we won't grow larger then the max pool size */
> +	if (page_pool_size &&
> +	       ((drm_page_pool_get_total()) + num_pages > page_pool_size)) {
> +		pool->free(pool, p);
> +		return;
> +	}

That is not a good idea. See how ttm_pool_free() does this.

First the page is given back to the pool, then all pools are shrinked if 
they are above the global limit.

Regards,
Christian.

> +
> +	/* Be sure to zero pages before adding them to the pool */
> +	for (i = 0; i < num_pages; ++i) {
> +		if (PageHighMem(p))
> +			clear_highpage(p + i);
> +		else
> +			clear_page(page_address(p + i));
> +	}
> +
> +	spin_lock(&pool->lock);
> +	list_add(&p->lru, &pool->pages);
> +	pool->page_count += 1 << pool->order;
> +	spin_unlock(&pool->lock);
> +	atomic_long_add(1 << pool->order, &nr_managed_pages);
> +
> +}
> +
> +/**
> + * drm_page_pool_remove - Remove page from pool
> + *
> + * @pool: Pool to pull the page from
> + *
> + * Take pages from a specific pool, return NULL when nothing available
> + */
> +struct page *drm_page_pool_remove(struct drm_page_pool *pool)
> +{
> +	struct page *p;
> +
> +	spin_lock(&pool->lock);
> +	p = list_first_entry_or_null(&pool->pages, typeof(*p), lru);
> +	if (p) {
> +		atomic_long_sub(1 << pool->order, &nr_managed_pages);
> +		pool->page_count -= 1 << pool->order;
> +		list_del(&p->lru);
> +	}
> +	spin_unlock(&pool->lock);
> +
> +	return p;
> +}
> +
> +/**
> + * drm_page_pool_init - Initialize a pool
> + *
> + * @pool: the pool to initialize
> + * @order: page allocation order
> + * @free_page: function pointer to free the pool's pages
> + *
> + * Initialize and add a pool type to the global shrinker list
> + */
> +void drm_page_pool_init(struct drm_page_pool *pool, unsigned int order,
> +			void (*free_page)(struct drm_page_pool *pool, struct page *p))
> +{
> +	pool->order = order;
> +	spin_lock_init(&pool->lock);
> +	INIT_LIST_HEAD(&pool->pages);
> +	pool->free = free_page;
> +	pool->page_count = 0;
> +
> +	mutex_lock(&shrinker_lock);
> +	list_add_tail(&pool->shrinker_list, &shrinker_list);
> +	mutex_unlock(&shrinker_lock);
> +}
> +
> +/**
> + * drm_page_pool_fini - Cleanup a pool
> + *
> + * @pool: the pool to clean up
> + *
> + * Remove a pool_type from the global shrinker list and free all pages
> + */
> +void drm_page_pool_fini(struct drm_page_pool *pool)
> +{
> +	struct page *p;
> +
> +	mutex_lock(&shrinker_lock);
> +	list_del(&pool->shrinker_list);
> +	mutex_unlock(&shrinker_lock);
> +
> +	while ((p = drm_page_pool_remove(pool)))
> +		pool->free(pool, p);
> +}
> +
> +/**
> + * drm_page_pool_shrink - Shrink the drm page pool
> + *
> + * Free pages using the global shrinker list. Returns
> + * the number of pages free
> + */
> +unsigned int drm_page_pool_shrink(void)
> +{
> +	struct drm_page_pool *pool;
> +	unsigned int num_freed;
> +	struct page *p;
> +
> +	mutex_lock(&shrinker_lock);
> +	pool = list_first_entry(&shrinker_list, typeof(*pool), shrinker_list);
> +
> +	p = drm_page_pool_remove(pool);
> +	if (p) {
> +		pool->free(pool, p);
> +		num_freed = 1 << pool->order;
> +	} else {
> +		num_freed = 0;
> +	}
> +
> +	list_move_tail(&pool->shrinker_list, &shrinker_list);
> +	mutex_unlock(&shrinker_lock);
> +
> +	return num_freed;
> +}
> +
> +/* As long as pages are available make sure to release at least one */
> +static unsigned long drm_page_pool_shrinker_scan(struct shrinker *shrink,
> +						 struct shrink_control *sc)
> +{
> +	unsigned long num_freed = 0;
> +
> +	do
> +		num_freed += drm_page_pool_shrink();
> +	while (!num_freed && atomic_long_read(&nr_managed_pages));
> +
> +	return num_freed;
> +}
> +
> +/* Return the number of pages available or SHRINK_EMPTY if we have none */
> +static unsigned long drm_page_pool_shrinker_count(struct shrinker *shrink,
> +						  struct shrink_control *sc)
> +{
> +	unsigned long num_pages = atomic_long_read(&nr_managed_pages);
> +
> +	return num_pages ? num_pages : SHRINK_EMPTY;
> +}
> +
> +/**
> + * dma_page_pool_lock_shrinker - Take the shrinker lock
> + *
> + * Takes the shrinker lock, preventing the shrinker from making
> + * changes to the pools
> + */
> +void dma_page_pool_lock_shrinker(void)
> +{
> +	mutex_lock(&shrinker_lock);
> +}
> +
> +/**
> + * dma_page_pool_unlock_shrinker - Release the shrinker lock
> + *
> + * Releases the shrinker lock, allowing the shrinker to free
> + * pages
> + */
> +void dma_page_pool_unlock_shrinker(void)
> +{
> +	mutex_unlock(&shrinker_lock);
> +}
> +
> +/**
> + * drm_page_pool_shrinker_init - Initialize globals
> + *
> + * Initialize the global locks and lists for the shrinker.
> + */
> +static int drm_page_pool_shrinker_init(void)
> +{
> +	mutex_init(&shrinker_lock);
> +	INIT_LIST_HEAD(&shrinker_list);
> +
> +	mm_shrinker.count_objects = drm_page_pool_shrinker_count;
> +	mm_shrinker.scan_objects = drm_page_pool_shrinker_scan;
> +	mm_shrinker.seeks = 1;
> +	return register_shrinker(&mm_shrinker);
> +}
> +
> +/**
> + * drm_page_pool_shrinker_fini - Finalize globals
> + *
> + * Unregister the shrinker.
> + */
> +static void drm_page_pool_shrinker_fini(void)
> +{
> +	unregister_shrinker(&mm_shrinker);
> +	WARN_ON(!list_empty(&shrinker_list));
> +}
> +
> +module_init(drm_page_pool_shrinker_init);
> +module_exit(drm_page_pool_shrinker_fini);
> +MODULE_LICENSE("Dual MIT/GPL");
> diff --git a/include/drm/page_pool.h b/include/drm/page_pool.h
> new file mode 100644
> index 000000000000..860cf6c92aab
> --- /dev/null
> +++ b/include/drm/page_pool.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +/*
> + * Extracted from include/drm/ttm/ttm_pool.h
> + * Copyright 2020 Advanced Micro Devices, Inc.
> + * Copyright 2021 Linaro Ltd
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: Christian König, John Stultz
> + */
> +
> +#ifndef _DRM_PAGE_POOL_H_
> +#define _DRM_PAGE_POOL_H_
> +
> +#include <linux/mmzone.h>
> +#include <linux/llist.h>
> +#include <linux/spinlock.h>
> +
> +/**
> + * drm_page_pool - Page Pool for a certain memory type
> + *
> + * @order: the allocation order our pages have
> + * @pages: the list of pages in the pool
> + * @shrinker_list: our place on the global shrinker list
> + * @lock: protection of the page list
> + * @page_count: number of pages currently in the pool
> + * @free: Function pointer to free the page
> + */
> +struct drm_page_pool {
> +	unsigned int order;
> +	struct list_head pages;
> +	struct list_head shrinker_list;
> +	spinlock_t lock;
> +
> +	unsigned long page_count;
> +	void (*free)(struct drm_page_pool *pool, struct page *p);
> +};
> +
> +void drm_page_pool_set_max(unsigned long max);
> +unsigned long drm_page_pool_get_max(void);
> +unsigned long drm_page_pool_get_total(void);
> +unsigned int drm_page_pool_shrink(void);
> +unsigned long drm_page_pool_get_size(struct drm_page_pool *pool);
> +void drm_page_pool_add(struct drm_page_pool *pool, struct page *p);
> +struct page *drm_page_pool_remove(struct drm_page_pool *pool);
> +void dma_page_pool_lock_shrinker(void);
> +void dma_page_pool_unlock_shrinker(void);
> +void drm_page_pool_init(struct drm_page_pool *pool, unsigned int order,
> +			void (*free_page)(struct drm_page_pool *pool, struct page *p));
> +void drm_page_pool_fini(struct drm_page_pool *pool);
> +
> +#endif

