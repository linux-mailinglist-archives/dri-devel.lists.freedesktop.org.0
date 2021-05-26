Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D96391A1E
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 16:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BC26ED8E;
	Wed, 26 May 2021 14:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21066ED88;
 Wed, 26 May 2021 14:27:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCBDA85z+9sGfEu+sstvUa7BBmWM5GVQubQwFAjrb6wE3mUT+UDmAKrQfbJXJWYBO9493ySeuB239dmok1AKvMKLDXmjA0pJdNSjXCHZpFpawM7MHLDIbj7S89SiFdFRQOJ7HJkLpNBvR8lT+Ig8AYAmLiuDmYtF9qe+KCbi1yt6LDuWTHgkbYGqg4+DusIZAgVT7B2yrqHfcjNuVCb7UiGO0/tWRkB5+CkUccHG1qUQFissMrXlTa5+KsokHPRiQqCt3374BvVN7DK8fN70YR55Pm0a9ySH/pZge4oVnKGuJU+1Rk3pSvg+e7ARdgdnnSEXPfaORGqq1zSznB4X5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KR8KA4RdC2b5eQe+/I9uhspP2vn8Ld8/UzzP4UGlE8A=;
 b=Cayg+rLornlPGggwuveD2zb6xrmKirInHc2s+vPpJZ2xqsQTf+xbdCvOB4uwzChSwyXUpRHIGuFCC4qQfeLLYj1Y2MEoiUKcK2nXBQheNfcOsKmEwSkFPxysV3WAyDYlKXoaOwQaiTtxLfZl1PdNA31/yLV9n+eYX09Sjk+FhvGfJXMFLb4QvXp/Q02GYAErzr9AcuDKXu631+s9EqmeJqBrz/4thN6krYvb3kQB3tJ2ImjoAmiU1+hn/hfMTcF5ayW7EslnZ16rwkyKyMJewYvVMkIo4mDWkyLbbooXeDsuW9iC3RtIOLQO8d54akXNtbMPc7hSsYmZr6gfhfSyzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KR8KA4RdC2b5eQe+/I9uhspP2vn8Ld8/UzzP4UGlE8A=;
 b=yzlrjZC8yAb4Rf3m5wuJaZtpLHGHKRPBpRaAk9tQ9CaxS0mdveLtBuT7tNvE3Mp+xgD12VoHzUeBVOk7DXlfpgSwfEfD6l6HknQU7zpI1c6xGbYZZeEb+qcu1Fyz4VeR4dDJvyfxnwiZmIGBIQXLUcYStKROLxxMH3eMajprwmU=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4303.namprd12.prod.outlook.com (2603:10b6:208:198::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Wed, 26 May
 2021 14:27:50 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 14:27:49 +0000
Subject: Re: [PATCH v4 07/15] drm, drm/i915: Move the memcpy_from_wc
 functionality to core drm
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210526113259.1661914-1-thomas.hellstrom@linux.intel.com>
 <20210526113259.1661914-8-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d052b69a-85f1-fa0b-5ea4-f0f5e00b376d@amd.com>
Date: Wed, 26 May 2021 16:27:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210526113259.1661914-8-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:1950:35e:cae9:5bed]
X-ClientProxiedBy: PR0P264CA0218.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:1950:35e:cae9:5bed]
 (2a02:908:1252:fb60:1950:35e:cae9:5bed) by
 PR0P264CA0218.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Wed, 26 May 2021 14:27:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df03eab4-bb63-43a3-c5c6-08d920527071
X-MS-TrafficTypeDiagnostic: MN2PR12MB4303:
X-Microsoft-Antispam-PRVS: <MN2PR12MB43036BF55DA008AD605EDCD083249@MN2PR12MB4303.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:519;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EyywgeZ0tFmoqw4M4k86SjmbSri7kSSRo9DUfJnTRr+KpxVJPlvDTX0AtaqhrUx9Cvv8rfjFB1PV8u+A22i9lzJnoBYPknPKDUwI+62aAWCtEmgu/oIPMEzaDvdflDA8yR5TLFLr6tJkUwnzNdvhPdciUyTYLus7PwC1EeOrV0OJYGDrq/B254bvVhGdOVedI9RIOMBwcY+VTgDb9TUMYJrZH1DKFZXV4cad0+9usaEUwjEdK6Kf3OQ0iS1sFMeyLEgyVNtP/71TZkoaJmKvTCKFlcjBDDxMRyhclD0RLjvUsyTy40Hc62DP+u0NAbSEwj6w5NoMsHkj5a1cN4FKx1nV3aTnENhaCmIzU+GID5LETy4a9QuNsIYMVc5xdR3H/B5BP1nXFAAzXdIuy/Sg1oz/NOC8Pon1yn4UekUDxyZSmaWdjKcrGye/T9DoZmww+7Kv37zIe/5fnO5CKaDJrsbE0VdH3NZIlLjjI+fwaZ+Md7dC+QbaFLFeXygzqnJUk7lkODg2lQh3wbSffL1duLOEklSSs4gSLV2C/xP3ib5BEbwdwT83dimXCqbGaROY73k/iPiSbgpv1eplsbi+7dGYsGVVGo0+c04W4qz0YlllwsG9+fh6/U3izB6Q9uh+szfZ7A2K//B2+tHWYTiIXhVegU0Q2IblQ1ZwJIyR+cSCI4s+I0vZY3HBtc8g79sg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39850400004)(396003)(376002)(136003)(38100700002)(8676002)(31696002)(86362001)(2906002)(316002)(5660300002)(66574015)(478600001)(6486002)(30864003)(186003)(16526019)(36756003)(83380400001)(54906003)(52116002)(6666004)(2616005)(31686004)(66476007)(8936002)(66946007)(66556008)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eVU1RFZCZzhTV281SzdneHRZNFByWnAxemJrQXBuN3ErMFlqMHFyb3lKQy9v?=
 =?utf-8?B?WnVJYkdQRXJhVjlqTlZCV3h2c3VBZ3VtUjYwYmtxNHBRWFpJVjZzeG14enNN?=
 =?utf-8?B?MVBYZkpsQjZMNEVDMWlJZXg0elFvZ2xlN1FPaHluN1dkN1RndmcvTk1IRHFy?=
 =?utf-8?B?VFRhZ0tpVGRsbExlNlRzdlg4QzVMYktJODdUZGZNZlFZZVBFNm9xZ0QzYTBO?=
 =?utf-8?B?VXhEa2xKc2VXM2MvdWhTVmlLcW9rQmJpd2FzOFBCMWdiY04rUGFTTE51WkVx?=
 =?utf-8?B?bks3RzJtTENKOFdiV3hYMjFPRG5DbmFidmtSaXp5MmdTU0ZHMDNCakxLV0xY?=
 =?utf-8?B?L3JnQUxRV1paNGt2MG9ZeFd6WlFrNFBUZVRnZW95NjhYK1RYUFhwMm9ReVAy?=
 =?utf-8?B?emVCMEg5aVNMamtLVWR3cDg2d1ZObmN1dHA1V0ltcFFnMVh1cHZQYlV4TGdY?=
 =?utf-8?B?YjRqWnpiSU9WcnhPcnpSYnBlMDlGUU51YmxSWXhvbkRRV3NqTVRsQ1lTcDYr?=
 =?utf-8?B?YjlwRmRvdkc0RWZBWWRpdDZDYUZVUGZLQVl2ZE81aXd1WCt1eGZRMzQ4SEd2?=
 =?utf-8?B?U2M2VGNzWWJzelhzU2tkYWN6S3lHeEdLcjd3RktEWkU2MVJpSTRZbDVwa3U2?=
 =?utf-8?B?VElYL2wvdXVTTDBZUWZiRFIrTThYVnZDNVJFMS92SWIvekprWnNNcTdxbEFQ?=
 =?utf-8?B?b0pZVDhGMmVVNTVmTTI3LzBJMGovR3Z0SjVXeXlndzJ5TkVuc0R2RVR6ZDFB?=
 =?utf-8?B?Z1dMcjJ2S1lBL1UrWWZpWkxUYXZRcllmRjF5YVoxMnZTcXFLQnJSVHUrZW5y?=
 =?utf-8?B?OVVKNDZqZjZHYXVUTURJZ1d5UE5GUzZ4SDlEZDlXdEoxK2E4a0VVNkk4N3FE?=
 =?utf-8?B?eFlVYVl5UzI4WUVyMVR0QUh5N1NmRmduMGRsbUx1OW40SlptK2F1TWR2U0tG?=
 =?utf-8?B?MEFoZjFKS1JsYmdscHhEVjNqbjQyTm9VL25SQ2FpVWpRbE5TWU1XV1pyNisv?=
 =?utf-8?B?TGJrRG9HZXM4QlR4cG1ZRWVDWnU1MlhnSmpoUTAvWUk4WUl4N0ZIMjFITXRn?=
 =?utf-8?B?b2hFOEFMZ3BvbURid1dqZG5OakJGNzcySFF4eW1raWFzZWgvb0FzUksxQ1Qv?=
 =?utf-8?B?YVJrY3FjYStWdkdTQWg1ZWEwMzJkM3pkaUF1V2VTQTRrcDh0QVdESFViUFBx?=
 =?utf-8?B?VVdzQnVIY0VUNTdwM0lTc004YWNpcTF1TzdMSEpodjhWamRvdFhjUFhWcXd3?=
 =?utf-8?B?NkVWaytQbllIaDdyckRaN1Jjd3Z1Vm1RV2s0c0pmRmYydDk1eWJmNVcvSno2?=
 =?utf-8?B?azd4T0xpamJpVUVyRDcxclI1cDFZL0lFekEwbkhCcjJ2eXlJY29Ram0vVGt3?=
 =?utf-8?B?SmRVcENzakFWdGZUWE5IRVJ6SmdUUjA3WEdGeVBXYkJuRG1IVHJrNmpicFZJ?=
 =?utf-8?B?RWpxK3dxaTcvNWNtTlFzT1c2Nlczek1uSE4xcnFiVndhM1lRdjRPWkUrOVo1?=
 =?utf-8?B?NnVnOXE0ZWVyTEtuOW1abDdNQUxDMm53V2xMdXliNUxnZ3VqcFhxYVl0eUFT?=
 =?utf-8?B?MHZveGZTMGRBOHE3SjNzajF4YnA4NXVxSlNtbnhtNHJ6Ty9pd3hvVzJ1SS9v?=
 =?utf-8?B?bVpjTVl2c3FlblpHY09vSzh4RmdtOFBxMk1aRWxHQXVtSE1JV1ZGck5sZVhi?=
 =?utf-8?B?Sm1sVWEzN2cvT2lhakllSWU2QnBkaytjRVRqZlVWY2NLbzcveXRxTTZGM3FV?=
 =?utf-8?B?K1ZQcExKc2FtUE1QTUZzNGh2eGpzU2VRZEVQT3I4R0tsRnR1RFdTWUJJcndL?=
 =?utf-8?B?TkZPalIyN3A1S1BtSTZpTWdGUU9teWY4L2pWV2RYc29wV24vYmZuc2VmeE16?=
 =?utf-8?Q?ZfP+xaRxggILl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df03eab4-bb63-43a3-c5c6-08d920527071
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 14:27:49.9065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YnyXhjd/XGTFEW97z1Kdb8l17BzVb+HKlI5Kp3CFdF9Q8LYNOdCtG4w+ZNxoJOdy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4303
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.05.21 um 13:32 schrieb Thomas Hellström:
> Memcpy from wc will be used as well by TTM memcpy.
> Move it to core drm, and make the interface do the right thing
> even on !X86.
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Dave Airlie <airlied@gmail.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
> v4:
> - Fix !X86 path (Reported by Matthew Auld)
> ---
>   drivers/gpu/drm/Makefile                      |  2 +-
>   drivers/gpu/drm/drm_drv.c                     |  2 +
>   .../drm/{i915/i915_memcpy.c => drm_memcpy.c}  | 63 ++++++++++++-----
>   drivers/gpu/drm/i915/Makefile                 |  1 -
>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  4 +-
>   drivers/gpu/drm/i915/gem/i915_gem_object.c    |  5 +-
>   drivers/gpu/drm/i915/gt/selftest_reset.c      |  7 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    | 11 +--
>   drivers/gpu/drm/i915/i915_cmd_parser.c        |  4 +-
>   drivers/gpu/drm/i915/i915_drv.c               |  2 -
>   drivers/gpu/drm/i915/i915_gpu_error.c         |  8 +--
>   drivers/gpu/drm/i915/i915_memcpy.h            | 34 ----------
>   .../drm/i915/selftests/intel_memory_region.c  |  7 +-
>   include/drm/drm_memcpy.h                      | 68 +++++++++++++++++++
>   14 files changed, 142 insertions(+), 76 deletions(-)
>   rename drivers/gpu/drm/{i915/i915_memcpy.c => drm_memcpy.c} (70%)
>   delete mode 100644 drivers/gpu/drm/i915/i915_memcpy.h
>   create mode 100644 include/drm/drm_memcpy.h
>
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index a91cc7684904..f3ab8586c3d7 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -18,7 +18,7 @@ drm-y       :=	drm_aperture.o drm_auth.o drm_cache.o \
>   		drm_dumb_buffers.o drm_mode_config.o drm_vblank.o \
>   		drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
>   		drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o \
> -		drm_managed.o drm_vblank_work.o
> +		drm_managed.o drm_vblank_work.o drm_memcpy.o \
>   
>   drm-$(CONFIG_DRM_LEGACY) += drm_agpsupport.o drm_bufs.o drm_context.o drm_dma.o \
>   			    drm_legacy_misc.o drm_lock.o drm_memory.o drm_scatter.o \
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 3d8d68a98b95..351cc2900cf1 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -40,6 +40,7 @@
>   #include <drm/drm_drv.h>
>   #include <drm/drm_file.h>
>   #include <drm/drm_managed.h>
> +#include <drm/drm_memcpy.h>
>   #include <drm/drm_mode_object.h>
>   #include <drm/drm_print.h>
>   
> @@ -1041,6 +1042,7 @@ static int __init drm_core_init(void)
>   
>   	drm_connector_ida_init();
>   	idr_init(&drm_minors_idr);
> +	drm_memcpy_init_early();
>   
>   	ret = drm_sysfs_init();
>   	if (ret < 0) {
> diff --git a/drivers/gpu/drm/i915/i915_memcpy.c b/drivers/gpu/drm/drm_memcpy.c
> similarity index 70%
> rename from drivers/gpu/drm/i915/i915_memcpy.c
> rename to drivers/gpu/drm/drm_memcpy.c
> index 1b021a4902de..740377749caa 100644
> --- a/drivers/gpu/drm/i915/i915_memcpy.c
> +++ b/drivers/gpu/drm/drm_memcpy.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: MIT
>   /*
>    * Copyright © 2016 Intel Corporation
>    *
> @@ -22,16 +23,12 @@
>    *
>    */
>   
> +#ifdef CONFIG_X86
> +#include <linux/dma-buf-map.h>
>   #include <linux/kernel.h>
>   #include <asm/fpu/api.h>
>   
> -#include "i915_memcpy.h"
> -
> -#if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
> -#define CI_BUG_ON(expr) BUG_ON(expr)
> -#else
> -#define CI_BUG_ON(expr) BUILD_BUG_ON_INVALID(expr)
> -#endif
> +#include "drm/drm_memcpy.h"
>   
>   static DEFINE_STATIC_KEY_FALSE(has_movntdqa);
>   
> @@ -94,23 +91,24 @@ static void __memcpy_ntdqu(void *dst, const void *src, unsigned long len)
>   }
>   
>   /**
> - * i915_memcpy_from_wc: perform an accelerated *aligned* read from WC
> + * drm_memcpy_from_wc: perform an accelerated *aligned* read from WC
>    * @dst: destination pointer
>    * @src: source pointer
>    * @len: how many bytes to copy
>    *
> - * i915_memcpy_from_wc copies @len bytes from @src to @dst using
> + * drm_memcpy_from_wc copies @len bytes from @src to @dst using
>    * non-temporal instructions where available. Note that all arguments
>    * (@src, @dst) must be aligned to 16 bytes and @len must be a multiple
>    * of 16.
>    *
>    * To test whether accelerated reads from WC are supported, use
> - * i915_memcpy_from_wc(NULL, NULL, 0);
> + * drm_memcpy_from_wc(NULL, NULL, 0);
> + * This interface is intended for memremapped memory without the __iomem tag.
>    *
>    * Returns true if the copy was successful, false if the preconditions
>    * are not met.
>    */
> -bool i915_memcpy_from_wc(void *dst, const void *src, unsigned long len)
> +bool drm_memcpy_from_wc(void *dst, const void *src, unsigned long len)
>   {
>   	if (unlikely(((unsigned long)dst | (unsigned long)src | len) & 15))
>   		return false;
> @@ -123,24 +121,53 @@ bool i915_memcpy_from_wc(void *dst, const void *src, unsigned long len)
>   
>   	return false;
>   }
> +EXPORT_SYMBOL(drm_memcpy_from_wc);
>   
>   /**
> - * i915_unaligned_memcpy_from_wc: perform a mostly accelerated read from WC
> + * drm_memcpy_from_wc_dbm: perform an accelerated *aligned* read from WC with
> + * struct dma_buf_map arguments.
> + * @dst: destination map
> + * @src: source map
> + * @len: how many bytes to copy
> + *
> + * This is identical to drm_memcpy_from_wc, except it's intended for
> + * potentially ioremapped memory rather than memremapped memory.
> + *
> + * Returns true if the copy was successful, false if the preconditions
> + * are not met.
> + */
> +bool drm_memcpy_from_wc_dbm(struct dma_buf_map *dst,
> +			    const struct dma_buf_map *src,
> +			    unsigned long len)
> +{
> +	/* For X86 we can safely drop __iomem */
> +	return drm_memcpy_from_wc(dst->is_iomem ?
> +				  (void __force *)dst->vaddr_iomem :
> +				  dst->vaddr,
> +				  src->is_iomem ?
> +				  (void const __force *)src->vaddr_iomem :
> +				  src->vaddr,
> +				  len);
> +}
> +EXPORT_SYMBOL(drm_memcpy_from_wc_dbm);
> +
> +/**
> + * drm_unaligned_memcpy_from_wc: perform a mostly accelerated read from WC
>    * @dst: destination pointer
>    * @src: source pointer
>    * @len: how many bytes to copy
>    *
> - * Like i915_memcpy_from_wc(), the unaligned variant copies @len bytes from
> + * Like drm_memcpy_from_wc(), the unaligned variant copies @len bytes from
>    * @src to @dst using * non-temporal instructions where available, but
>    * accepts that its arguments may not be aligned, but are valid for the
>    * potential 16-byte read past the end.
> + *
> + * This interface is intended for mremapped memory without the __iomem tag.
>    */
> -void i915_unaligned_memcpy_from_wc(void *dst, const void *src, unsigned long len)
> +void drm_unaligned_memcpy_from_wc(void *dst, const void *src, unsigned long len)
>   {
>   	unsigned long addr;
>   
> -	CI_BUG_ON(!i915_has_memcpy_from_wc());
> -
>   	addr = (unsigned long)src;
>   	if (!IS_ALIGNED(addr, 16)) {
>   		unsigned long x = min(ALIGN(addr, 16) - addr, len);
> @@ -155,8 +182,9 @@ void i915_unaligned_memcpy_from_wc(void *dst, const void *src, unsigned long len
>   	if (likely(len))
>   		__memcpy_ntdqu(dst, src, DIV_ROUND_UP(len, 16));
>   }
> +EXPORT_SYMBOL(drm_unaligned_memcpy_from_wc);
>   
> -void i915_memcpy_init_early(struct drm_i915_private *dev_priv)
> +void drm_memcpy_init_early(void)
>   {
>   	/*
>   	 * Some hypervisors (e.g. KVM) don't support VEX-prefix instructions
> @@ -166,3 +194,4 @@ void i915_memcpy_init_early(struct drm_i915_private *dev_priv)
>   	    !boot_cpu_has(X86_FEATURE_HYPERVISOR))
>   		static_branch_enable(&has_movntdqa);
>   }
> +#endif
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 4f22cac1c49b..ebc19bd5fff4 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -61,7 +61,6 @@ i915-y += i915_drv.o \
>   # core library code
>   i915-y += \
>   	dma_resv_utils.o \
> -	i915_memcpy.o \
>   	i915_mm.o \
>   	i915_sw_fence.o \
>   	i915_sw_fence_work.o \
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 297143511f99..77285e421fb8 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -10,6 +10,7 @@
>   #include <linux/uaccess.h>
>   
>   #include <drm/drm_syncobj.h>
> +#include <drm/drm_memcpy.h>
>   
>   #include "display/intel_frontbuffer.h"
>   
> @@ -28,7 +29,6 @@
>   #include "i915_sw_fence_work.h"
>   #include "i915_trace.h"
>   #include "i915_user_extensions.h"
> -#include "i915_memcpy.h"
>   
>   struct eb_vma {
>   	struct i915_vma *vma;
> @@ -2503,7 +2503,7 @@ static int eb_parse_pipeline(struct i915_execbuffer *eb,
>   		!(batch->cache_coherent & I915_BO_CACHE_COHERENT_FOR_READ);
>   
>   	pw->batch_map = ERR_PTR(-ENODEV);
> -	if (needs_clflush && i915_has_memcpy_from_wc())
> +	if (needs_clflush && drm_has_memcpy_from_wc())
>   		pw->batch_map = i915_gem_object_pin_map(batch, I915_MAP_WC);
>   
>   	if (IS_ERR(pw->batch_map)) {
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 5706d471692d..e9247afb0320 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -24,6 +24,8 @@
>   
>   #include <linux/sched/mm.h>
>   
> +#include <drm/drm_memcpy.h>
> +
>   #include "display/intel_frontbuffer.h"
>   #include "i915_drv.h"
>   #include "i915_gem_clflush.h"
> @@ -31,7 +33,6 @@
>   #include "i915_gem_mman.h"
>   #include "i915_gem_object.h"
>   #include "i915_globals.h"
> -#include "i915_memcpy.h"
>   #include "i915_trace.h"
>   
>   static struct i915_global_object {
> @@ -374,7 +375,7 @@ i915_gem_object_read_from_page_iomap(struct drm_i915_gem_object *obj, u64 offset
>   				    PAGE_SIZE);
>   
>   	src_ptr = src_map + offset_in_page(offset);
> -	if (!i915_memcpy_from_wc(dst, (void __force *)src_ptr, size))
> +	if (!drm_memcpy_from_wc(dst, (void __force *)src_ptr, size))
>   		memcpy_fromio(dst, src_ptr, size);
>   
>   	io_mapping_unmap(src_map);
> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
> index 8784257ec808..92ada67a3835 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
> @@ -5,9 +5,10 @@
>   
>   #include <linux/crc32.h>
>   
> +#include <drm/drm_memcpy.h>
> +
>   #include "gem/i915_gem_stolen.h"
>   
> -#include "i915_memcpy.h"
>   #include "i915_selftest.h"
>   #include "intel_gpu_commands.h"
>   #include "selftests/igt_reset.h"
> @@ -99,7 +100,7 @@ __igt_reset_stolen(struct intel_gt *gt,
>   			memset_io(s, STACK_MAGIC, PAGE_SIZE);
>   
>   		in = (void __force *)s;
> -		if (i915_memcpy_from_wc(tmp, in, PAGE_SIZE))
> +		if (drm_memcpy_from_wc(tmp, in, PAGE_SIZE))
>   			in = tmp;
>   		crc[page] = crc32_le(0, in, PAGE_SIZE);
>   
> @@ -135,7 +136,7 @@ __igt_reset_stolen(struct intel_gt *gt,
>   				      PAGE_SIZE);
>   
>   		in = (void __force *)s;
> -		if (i915_memcpy_from_wc(tmp, in, PAGE_SIZE))
> +		if (drm_memcpy_from_wc(tmp, in, PAGE_SIZE))
>   			in = tmp;
>   		x = crc32_le(0, in, PAGE_SIZE);
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> index c36d5eb5bbb9..f045e42be6ca 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> @@ -5,9 +5,10 @@
>   
>   #include <linux/debugfs.h>
>   
> +#include <drm/drm_memcpy.h>
> +
>   #include "gt/intel_gt.h"
>   #include "i915_drv.h"
> -#include "i915_memcpy.h"
>   #include "intel_guc_log.h"
>   
>   static void guc_log_capture_logs(struct intel_guc_log *log);
> @@ -295,13 +296,13 @@ static void guc_read_update_log_buffer(struct intel_guc_log *log)
>   
>   		/* Just copy the newly written data */
>   		if (read_offset > write_offset) {
> -			i915_memcpy_from_wc(dst_data, src_data, write_offset);
> +			drm_memcpy_from_wc(dst_data, src_data, write_offset);
>   			bytes_to_copy = buffer_size - read_offset;
>   		} else {
>   			bytes_to_copy = write_offset - read_offset;
>   		}
> -		i915_memcpy_from_wc(dst_data + read_offset,
> -				    src_data + read_offset, bytes_to_copy);
> +		drm_memcpy_from_wc(dst_data + read_offset,
> +				   src_data + read_offset, bytes_to_copy);
>   
>   		src_data += buffer_size;
>   		dst_data += buffer_size;
> @@ -569,7 +570,7 @@ int intel_guc_log_relay_open(struct intel_guc_log *log)
>   	 * it should be present on the chipsets supporting GuC based
>   	 * submisssions.
>   	 */
> -	if (!i915_has_memcpy_from_wc()) {
> +	if (!drm_has_memcpy_from_wc()) {
>   		ret = -ENXIO;
>   		goto out_unlock;
>   	}
> diff --git a/drivers/gpu/drm/i915/i915_cmd_parser.c b/drivers/gpu/drm/i915/i915_cmd_parser.c
> index 5b4b2bd46e7c..98653f1a2b1d 100644
> --- a/drivers/gpu/drm/i915/i915_cmd_parser.c
> +++ b/drivers/gpu/drm/i915/i915_cmd_parser.c
> @@ -24,12 +24,12 @@
>    *    Brad Volkin <bradley.d.volkin@intel.com>
>    *
>    */
> +#include <drm/drm_memcpy.h>
>   
>   #include "gt/intel_engine.h"
>   #include "gt/intel_gpu_commands.h"
>   
>   #include "i915_drv.h"
> -#include "i915_memcpy.h"
>   
>   /**
>    * DOC: batch buffer command parser
> @@ -1152,7 +1152,7 @@ static u32 *copy_batch(struct drm_i915_gem_object *dst_obj,
>   
>   	if (src) {
>   		GEM_BUG_ON(!needs_clflush);
> -		i915_unaligned_memcpy_from_wc(dst, src + offset, length);
> +		drm_unaligned_memcpy_from_wc(dst, src + offset, length);
>   	} else {
>   		struct scatterlist *sg;
>   		void *ptr;
> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
> index 30c349137be2..68639ed0bdec 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -72,7 +72,6 @@
>   #include "i915_drv.h"
>   #include "i915_ioc32.h"
>   #include "i915_irq.h"
> -#include "i915_memcpy.h"
>   #include "i915_perf.h"
>   #include "i915_query.h"
>   #include "i915_suspend.h"
> @@ -325,7 +324,6 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>   	mutex_init(&dev_priv->pps_mutex);
>   	mutex_init(&dev_priv->hdcp_comp_mutex);
>   
> -	i915_memcpy_init_early(dev_priv);
>   	intel_runtime_pm_init_early(&dev_priv->runtime_pm);
>   
>   	ret = i915_workqueues_init(dev_priv);
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 8b964e355cb5..7c1b44545bab 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -34,6 +34,7 @@
>   #include <linux/utsname.h>
>   #include <linux/zlib.h>
>   
> +#include <drm/drm_memcpy.h>
>   #include <drm/drm_print.h>
>   
>   #include "display/intel_dmc.h"
> @@ -46,7 +47,6 @@
>   
>   #include "i915_drv.h"
>   #include "i915_gpu_error.h"
> -#include "i915_memcpy.h"
>   #include "i915_scatterlist.h"
>   
>   #define ALLOW_FAIL (GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN)
> @@ -255,7 +255,7 @@ static bool compress_init(struct i915_vma_compress *c)
>   	}
>   
>   	c->tmp = NULL;
> -	if (i915_has_memcpy_from_wc())
> +	if (drm_has_memcpy_from_wc())
>   		c->tmp = pool_alloc(&c->pool, ALLOW_FAIL);
>   
>   	return true;
> @@ -295,7 +295,7 @@ static int compress_page(struct i915_vma_compress *c,
>   	struct z_stream_s *zstream = &c->zstream;
>   
>   	zstream->next_in = src;
> -	if (wc && c->tmp && i915_memcpy_from_wc(c->tmp, src, PAGE_SIZE))
> +	if (wc && c->tmp && drm_memcpy_from_wc(c->tmp, src, PAGE_SIZE))
>   		zstream->next_in = c->tmp;
>   	zstream->avail_in = PAGE_SIZE;
>   
> @@ -395,7 +395,7 @@ static int compress_page(struct i915_vma_compress *c,
>   	if (!ptr)
>   		return -ENOMEM;
>   
> -	if (!(wc && i915_memcpy_from_wc(ptr, src, PAGE_SIZE)))
> +	if (!(wc && drm_memcpy_from_wc(ptr, src, PAGE_SIZE)))
>   		memcpy(ptr, src, PAGE_SIZE);
>   	dst->pages[dst->page_count++] = ptr;
>   	cond_resched();
> diff --git a/drivers/gpu/drm/i915/i915_memcpy.h b/drivers/gpu/drm/i915/i915_memcpy.h
> deleted file mode 100644
> index 3df063a3293b..000000000000
> --- a/drivers/gpu/drm/i915/i915_memcpy.h
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -/* SPDX-License-Identifier: MIT */
> -/*
> - * Copyright © 2019 Intel Corporation
> - */
> -
> -#ifndef __I915_MEMCPY_H__
> -#define __I915_MEMCPY_H__
> -
> -#include <linux/types.h>
> -
> -struct drm_i915_private;
> -
> -void i915_memcpy_init_early(struct drm_i915_private *i915);
> -
> -bool i915_memcpy_from_wc(void *dst, const void *src, unsigned long len);
> -void i915_unaligned_memcpy_from_wc(void *dst, const void *src, unsigned long len);
> -
> -/* The movntdqa instructions used for memcpy-from-wc require 16-byte alignment,
> - * as well as SSE4.1 support. i915_memcpy_from_wc() will report if it cannot
> - * perform the operation. To check beforehand, pass in the parameters to
> - * to i915_can_memcpy_from_wc() - since we only care about the low 4 bits,
> - * you only need to pass in the minor offsets, page-aligned pointers are
> - * always valid.
> - *
> - * For just checking for SSE4.1, in the foreknowledge that the future use
> - * will be correctly aligned, just use i915_has_memcpy_from_wc().
> - */
> -#define i915_can_memcpy_from_wc(dst, src, len) \
> -	i915_memcpy_from_wc((void *)((unsigned long)(dst) | (unsigned long)(src) | (len)), NULL, 0)
> -
> -#define i915_has_memcpy_from_wc() \
> -	i915_memcpy_from_wc(NULL, NULL, 0)
> -
> -#endif /* __I915_MEMCPY_H__ */
> diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
> index c85d516b85cd..6bb399e9be78 100644
> --- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
> +++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
> @@ -6,6 +6,8 @@
>   #include <linux/prime_numbers.h>
>   #include <linux/sort.h>
>   
> +#include <drm/drm_memcpy.h>
> +
>   #include "../i915_selftest.h"
>   
>   #include "mock_drm.h"
> @@ -20,7 +22,6 @@
>   #include "gem/selftests/mock_context.h"
>   #include "gt/intel_engine_user.h"
>   #include "gt/intel_gt.h"
> -#include "i915_memcpy.h"
>   #include "selftests/igt_flush_test.h"
>   #include "selftests/i915_random.h"
>   
> @@ -901,7 +902,7 @@ static inline void igt_memcpy(void *dst, const void *src, size_t size)
>   
>   static inline void igt_memcpy_from_wc(void *dst, const void *src, size_t size)
>   {
> -	i915_memcpy_from_wc(dst, src, size);
> +	drm_memcpy_from_wc(dst, src, size);
>   }
>   
>   static int _perf_memcpy(struct intel_memory_region *src_mr,
> @@ -925,7 +926,7 @@ static int _perf_memcpy(struct intel_memory_region *src_mr,
>   		{
>   			"memcpy_from_wc",
>   			igt_memcpy_from_wc,
> -			!i915_has_memcpy_from_wc(),
> +			!drm_has_memcpy_from_wc(),
>   		},
>   	};
>   	struct drm_i915_gem_object *src, *dst;
> diff --git a/include/drm/drm_memcpy.h b/include/drm/drm_memcpy.h
> new file mode 100644
> index 000000000000..fe5ed1e89ce6
> --- /dev/null
> +++ b/include/drm/drm_memcpy.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2019 Intel Corporation
> + */
> +
> +#ifndef __DRM_MEMCPY_H__
> +#define __DRM_MEMCPY_H__
> +
> +#include <linux/types.h>
> +
> +struct dma_buf_map;
> +
> +#ifdef CONFIG_X86
> +bool drm_memcpy_from_wc(void *dst, const void *src, unsigned long len);
> +bool drm_memcpy_from_wc_dbm(struct dma_buf_map *dst,
> +			    const struct dma_buf_map *src,
> +			    unsigned long len);
> +void drm_unaligned_memcpy_from_wc(void *dst, const void *src, unsigned long len);
> +
> +/* The movntdqa instructions used for memcpy-from-wc require 16-byte alignment,
> + * as well as SSE4.1 support. drm_memcpy_from_wc() will report if it cannot
> + * perform the operation. To check beforehand, pass in the parameters to
> + * drm_can_memcpy_from_wc() - since we only care about the low 4 bits,
> + * you only need to pass in the minor offsets, page-aligned pointers are
> + * always valid.
> + *
> + * For just checking for SSE4.1, in the foreknowledge that the future use
> + * will be correctly aligned, just use drm_has_memcpy_from_wc().
> + */
> +#define drm_can_memcpy_from_wc(dst, src, len) \
> +	drm_memcpy_from_wc((void *)((unsigned long)(dst) | (unsigned long)(src) | (len)), NULL, 0)
> +
> +#define drm_has_memcpy_from_wc() \
> +	drm_memcpy_from_wc(NULL, NULL, 0)
> +
> +void drm_memcpy_init_early(void);
> +
> +#else
> +
> +static inline
> +bool drm_memcpy_from_wc(void *dst, const void *src, unsigned long len)
> +{
> +	return false;
> +}
> +
> +static inline
> +bool drm_memcpy_from_wc_dbm(void *dst, const void *src, unsigned long len)
> +{
> +	return false;
> +}
> +
> +static inline
> +bool drm_can_memcpy_from_wc_dbm(void *dst, const void *src, unsigned long len)
> +{
> +	return false;
> +}
> +
> +static inline
> +bool drm_has_memcpy_from_wc(void)
> +{
> +	return false;
> +}
> +
> +#define drm_has_memcpy_from_wc() (false)
> +#define drm_unaligned_memcpy_from_wc(_dst, _src, _len) WARN_ON(1)
> +#define drm_memcpy_init_early() do {} while (0)
> +#endif /* CONFIG_X86 */
> +#endif /* __DRM_MEMCPY_H__ */

