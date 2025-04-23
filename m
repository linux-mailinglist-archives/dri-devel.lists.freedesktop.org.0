Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B259A97D1F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 05:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C2C10E3F3;
	Wed, 23 Apr 2025 03:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="INLIHevR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2430410E3F3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 03:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745377479; x=1776913479;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GWLBx/fp/LpvUH4ef6HlPLMqpFEaCN5H6nXmj2iZ0Sw=;
 b=INLIHevR8P34+AciQlc7RRIaZtyYjgNFMVaFQ+iT4l1oHzzJ6h57H36T
 jLF9xxes6GeuOkMnsu0nYNKe9RSCY85vO6YFzx3nD5Wh6jeKi0udWwuqV
 n5yyPJR2bHPtd58WxDXeVLOEVFTShbjGlSZVxmRSqfYOk3Kuc+VWWfJC8
 dplufv7JDS7srA5jz0KYDiuctd+iBMrbp3mIsUeJ4cQs1OZl06+FbV+Y/
 Xxjweezh9Kz4KmXCMWy8zN8JITLEBevbL6EQ7mAqxKi0GaQumxppkrQxy
 tZLO6kJFLCID84wujubMt0uaitJEyjD356C4H1BHPN0iQSZn+sLPW6oxN A==;
X-CSE-ConnectionGUID: eaQsSqdtTAmmIt2X7l7VSQ==
X-CSE-MsgGUID: 54wwJv6FSr6aW94D/5+RzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46657816"
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; d="scan'208";a="46657816"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 20:04:39 -0700
X-CSE-ConnectionGUID: 6n7FMOMPRyGz9yE7wrIgCA==
X-CSE-MsgGUID: bVWwXGzOTy2e+2ARjM/vgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; d="scan'208";a="133065711"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 20:04:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 20:04:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 20:04:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 20:04:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sxbong0girT25pQo3iLCXs3Uq66GKEe4Vstk/zlrSJqlv2a8/kKEaBlrBugJdxb8ToJhBqp+dIHf+mj4hlDWTU+RflcXbieImajngijZjWOuqTEppHm4axMu2kSUi7TWgbLISinHJMn1eUMzaJZ379TBhKgDj2VVndbRm2b/7xF1GnRbjAO17Jz50rt+amUogGo47h5ZILp/cjCIcc+5YGP48aePF+jsYXKznaGqU1kbI2D8T0K7FR/YEk1jSCSJ10TeJfMibpDdp+sOskOimrp5bS9BG+xvzIVuar+MspkI63/OHwUXxNX5+HPfn33ckOsDNLM1h3y0yQjOhKSdOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0dBZAy7yq05w9mtYwzE+J+hWYgK+vsCybpdogiUL/4=;
 b=iBHT5YJ96i8C9haGwdnd7438yDY/ythagL8Ebav2ZGTjqluEQtZdb2rK06RdsDZNWXOx0OAuX4ZSdrxDLUGCRaQQhYvzW6ZfcXx7NredWo/NXTtODZc0YjdirRUJpRlfI9a2uv1KWoVOwowGPkz0rRWr6OTEbHpew+Fz/GBawumsgSgAQik/3qV3UDWLfjIfMbIDZ3HKIznpYN/9xBXIf7ZPeh9vc45XS/ahfjEF8z3vWMBo5HHp5W5l0CLiYhLhl6jkVHINxDaq2BRa9y/DmGCvxQHeQTcSyb7aIAmJ9ANnZ2Md9uW++YSnOJkSW7AEltp7mRJMnIL/3qcU0UXpYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6706.namprd11.prod.outlook.com (2603:10b6:510:1c5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 03:04:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 03:04:35 +0000
Date: Tue, 22 Apr 2025 20:05:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Dave Airlie <airlied@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/ttm/xe: drop unused force_alloc flag
Message-ID: <aAhZFLmPx5p6Bcsj@lstrano-desk.jf.intel.com>
References: <20250423022920.27701-1-airlied@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250423022920.27701-1-airlied@gmail.com>
X-ClientProxiedBy: MW4PR04CA0118.namprd04.prod.outlook.com
 (2603:10b6:303:83::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6706:EE_
X-MS-Office365-Filtering-Correlation-Id: fda5f2fa-c795-4f6f-84eb-08dd821393cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ueruRGP6bEvTss/lc77vQUq4Sz08frkT+FH6aZZxZ3iE/lbYXDd2i3EcOCqX?=
 =?us-ascii?Q?jOc8kJBkoW6ZNmVh0pSnm2EeIz+NfF5uugBXdJultmhI3Mr97U6480/KV9wl?=
 =?us-ascii?Q?d2/0n+jPLKG1IeIBQQgW9r9vzszMVvditI1u6/h8Y/cRr7uzACEe+07sRzql?=
 =?us-ascii?Q?UomTBMdkx58Qqok8MLPbF5Va6Ih/DMfwVr6lvXgn6VKwWAdDrJzn/0SY9kXW?=
 =?us-ascii?Q?cR3XiofkGBkOZIiN7AusiLxx9pnwPEnflrPIDMJ2ji/qZoOb7n4xlvvLgdLC?=
 =?us-ascii?Q?SjJsqNqmG+ejDvFyYdZ6zCnYSoehkS/N2jMJmiaV1CvHdNVGMcUROr7nhT8d?=
 =?us-ascii?Q?sgOzfgqDJsofcfBW7+A78B3ALjJN+lpJ60sZq1CM5dyVORE0KH+7lwN4hdqQ?=
 =?us-ascii?Q?uv/tdVN0UAWVMMXLKKAYxihzRppj1WErMe+YD6rLNHm0+oCoBmegH19mShFj?=
 =?us-ascii?Q?PbKgiFY4Qej3pln/zKPOFPM+0j6cm/MoLM70cJVg/gtpSjzbg94eitEvWKyg?=
 =?us-ascii?Q?eu5HWlXpu5+Yi8nRh9qSlZ35Bk01ksBBQm8oDZl/3c9qJSgbGZgILUnN0FUN?=
 =?us-ascii?Q?epatkNzluIPoNXiyUyVKnfUi9+7fRL2NFYpFYz1nkvuV+mkforR4d/G0r6sD?=
 =?us-ascii?Q?kimZ6Zd9Lq1x8lp61jfpQ3/1s6nVOApL1VG/vm8i1qm6IJaLzc7hEzqzU7KF?=
 =?us-ascii?Q?UnQzP2hM1ZY8cONGTMGZPOx0ml8z/9rYfMtFX6ijpIxDhBmnlXQsWeBYKeu/?=
 =?us-ascii?Q?gVmbHDTlc7McsVCz/DpmVwCVrO2nFOxpjVuJ4l4zAChKyeVTbe1YdvSJ9kRV?=
 =?us-ascii?Q?KJ9l4TQeoP2UJ8DbA8gWQe3UFTzDfU3ckaChrh7iDeKxQ+o66KntP1ljnW2C?=
 =?us-ascii?Q?0j0cZjOrhvX6nhOhlBunwloM/l7z3iFSmUnC6StwkMcK8PQ44s2mdlwcd6Iu?=
 =?us-ascii?Q?OiDY/V6yHLlUwsO9UiIFUnmS7eTiNknQxgtsSI9PbFMH4+g1Yv3jTDAzhbS/?=
 =?us-ascii?Q?xYaTaJpm5jQebjpfUocOXmkIYjm8fadEP/Irj4nBXVB70LvkIcdtxW3wvBpD?=
 =?us-ascii?Q?7DS3PROh25afnja7a16E7JMqmJ/YXyt+7WThDQX2DDbaaHiTptQejI4LpMR+?=
 =?us-ascii?Q?u5RKrljWNGT9s5qScYAzNDhnprfIL+sIxuk2MbSg9MwUE0IPTZIz02qYdFh4?=
 =?us-ascii?Q?qrOk8iKdf42gF2ONqEW7bnPYJSKDDnoqW+XSO3HWduJoeDpWtyineAs5pqnG?=
 =?us-ascii?Q?6Sn21BkAXnwE0EGRms/6fXhxdReDXE4E0FSXhiQLk2bSW5KPtwlzRcv2TMmu?=
 =?us-ascii?Q?TanH2hNWgubeb6yXIAGoywNgVp7PagF5a72zuKfZH81II82g2XBTvMUBMXGC?=
 =?us-ascii?Q?t/++mnlRKNcVtFy1TWtPM7N5N+T6Jf4ft5iT9ACLH/5aVSM9G7GsuKigrYWj?=
 =?us-ascii?Q?2/ilbd4bS30=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z7ryArC/1FFmvKQ023rYJmCAZHs48EnNQL4m0zh6DF0fuOdtukkZ5fhj0ZzW?=
 =?us-ascii?Q?BwP1Ll/Lpa0bgBVCujJsHBJ6yDWVKlwFk5eUzfGcVrXSbG0jRfzotb5NdfXf?=
 =?us-ascii?Q?lRTFno4JLrU6o7isU46UP/HU3Sn0jNhZF1DzrVlCj0GH8wii57fTnjJ9H66b?=
 =?us-ascii?Q?pFRZYWwKeQfZGDqk/516RgCo6kr1/3nJSKhIuTEB1nFgMCbvkPv++qSJNtoF?=
 =?us-ascii?Q?BRxPuxV+wXs/t5z2a6aTDzx4BLSDO4l/6YuOn556lrn9bbEeplobWlzmD4Q4?=
 =?us-ascii?Q?nEb5epSd7q2gnm4VReJrsVHgDMFI7ZAsMN7THSw01GWG/ebbo8iwy+NOJVFJ?=
 =?us-ascii?Q?0dFXR49BUxeYhs6lequ/znPN6zlb3Y0mx0N+4DLnqzvemJ0mtyjDdsNKVUE9?=
 =?us-ascii?Q?/+T/Iq/n//EVg1k8LNjTY7QfCRqV5JW5EitTFZ7LVPGn6o189FQQRkg6ir7P?=
 =?us-ascii?Q?NnuBybFIMGHGgjh++czeilD9Yw8AGx6tY0oOlDZ37Gs1LnykPGn7Wys3dh34?=
 =?us-ascii?Q?hrt+uDK6Md3OMwAValPZidRGEbMekh08EZmJNoq3l0cqAIIP9L2OIqKtIhla?=
 =?us-ascii?Q?Lu4L5Di1L0MM1Pg49k7EqlGXj/qBTbSSPeRqrdIsV1F2qJ0pCso0iwO7QXFa?=
 =?us-ascii?Q?nImUzGKrQsZlvtkOIoQTXf8XOAM6e4Un/kIuxWw0jmpfSJScsYNYu9V2wn68?=
 =?us-ascii?Q?+MsMV4KPHGomgwyWObc0KsUJNNvRE6gFhxCG97uc1EFSxOAJGWEHNceqAmHq?=
 =?us-ascii?Q?KQ+Ot/pj9VyP5B/OZYc8KAG0OdMdwEb48Ca1YPpMjpgcbIy71vtiH9BcQOMW?=
 =?us-ascii?Q?w72yh+53LRa67CEEn/mcQiKIEoobE1dmlIRETkW6DOzDq6G/l0fKLyMjY3p7?=
 =?us-ascii?Q?H9WstPqujoyrWjvr6a80ophdlDWsRCzTv3tfAaVRhl/AGMVaX0fOi8GqVuAV?=
 =?us-ascii?Q?FHnHkl8Ib0wjO2AkYYqmJxeF6YFwGW/o7GjMOh4JYcAOHOLQzaFooFGLtPl7?=
 =?us-ascii?Q?XAqcOCgnpwkjF9xzUHTelwzuvnY2ASUQ8EinEgpkBYaS0/AR8Er+7QDauliR?=
 =?us-ascii?Q?w2xE4ZkCizBzV36Cldm1O0DrCs5KsaYQlLl66mm/oWI9xo+4zoPUXycbE/kA?=
 =?us-ascii?Q?LNCVCkZU0ygPSQWwFGdvtW+s0aM0QQvzWdFROekcaXY22wy6soiLRH3Zo6E+?=
 =?us-ascii?Q?IkyA582mHC9Am/794dK+nLZSCAXwQyh++JS9/TGydO2eb7YH2Tn/LQtglYVr?=
 =?us-ascii?Q?2RiqI2U0LtYnsoQAwmUG9ToMUV1hEmtQ/MovMAziufaoBoLVR0wVOhRvRWAO?=
 =?us-ascii?Q?TTl4MtEMUVvRWz24O9u/snxQS5/dxfxMfh+XfYz7O9tijnmOBP/uW6F0G3c7?=
 =?us-ascii?Q?GcAeRsFWFH/2OcDUJyjoR77TVtOa5sDCtmi9kzXFp6kt5woIKSvvsw/ROY02?=
 =?us-ascii?Q?JmF+er+DhizkbCYVvrt7bIA4yF6k0wHJvw2BV0U5TSkXPMvytZctPnOBACWk?=
 =?us-ascii?Q?ef+6QpkhallZkHSPmLYxTtzCu77OXNdDsGLzzja/5j334sIasO1kfJ5XG/rL?=
 =?us-ascii?Q?3bz8mbbMqpvhRUwMNYWg4WKNPseDD3xX43PFEPF9pCfbym3DJ8H1fHNSErxI?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fda5f2fa-c795-4f6f-84eb-08dd821393cd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 03:04:35.3644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnrWiJ/xHGtNrgdJKJ4Xydr47ea4XlRn2ddZGSyuDPGgUz0GejnMK/r2QsgpaKfi6J1lNUfS725wh2TMsPUXuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6706
X-OriginatorOrg: intel.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 23, 2025 at 12:29:20PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This flag used to be used in the old memory tracking code, that
> code got migrated into the vmwgfx driver[1], and then got removed
> from the tree[2], but this piece got left behind.
> 
> [1] f07069da6b4c ("drm/ttm: move memory accounting into vmwgfx v4")
> [2] 8aadeb8ad874 ("drm/vmwgfx: Remove the dedicated memory accounting")
> 
> Cleanup the dead code.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/ttm/ttm_bo_vm.c    | 1 -
>  drivers/gpu/drm/ttm/ttm_resource.c | 1 -
>  drivers/gpu/drm/xe/xe_bo.c         | 4 +---
>  drivers/gpu/drm/xe/xe_bo.h         | 2 +-
>  drivers/gpu/drm/xe/xe_dma_buf.c    | 2 +-
>  include/drm/ttm/ttm_bo.h           | 2 --
>  6 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index a194db83421d..bdfa6ecfef05 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -220,7 +220,6 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>  		struct ttm_operation_ctx ctx = {
>  			.interruptible = true,
>  			.no_wait_gpu = false,
> -			.force_alloc = true
>  		};
>  
>  		ttm = bo->ttm;
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 7e5a60c55813..769b0ca9be47 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -548,7 +548,6 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>  	struct ttm_operation_ctx ctx = {
>  		.interruptible = false,
>  		.no_wait_gpu = false,
> -		.force_alloc = true
>  	};
>  	struct dma_fence *fence;
>  	int ret;
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 64f9c936eea0..32a5a6390f62 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2759,19 +2759,17 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
>  /**
>   * xe_bo_evict - Evict an object to evict placement
>   * @bo: The buffer object to migrate.
> - * @force_alloc: Set force_alloc in ttm_operation_ctx
>   *
>   * On successful completion, the object memory will be moved to evict
>   * placement. This function blocks until the object has been fully moved.
>   *
>   * Return: 0 on success. Negative error code on failure.
>   */
> -int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
> +int xe_bo_evict(struct xe_bo *bo)
>  {
>  	struct ttm_operation_ctx ctx = {
>  		.interruptible = false,
>  		.no_wait_gpu = false,
> -		.force_alloc = force_alloc,
>  		.gfp_retry_mayfail = true,
>  	};
>  	struct ttm_placement placement;
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index ec3e4446d027..1a3734d9f8be 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -271,7 +271,7 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res);
>  bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
>  
>  int xe_bo_migrate(struct xe_bo *bo, u32 mem_type);
> -int xe_bo_evict(struct xe_bo *bo, bool force_alloc);
> +int xe_bo_evict(struct xe_bo *bo);
>  
>  int xe_bo_evict_pinned(struct xe_bo *bo);
>  int xe_bo_restore_pinned(struct xe_bo *bo);
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index f67803e15a0e..f06961575d8a 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -236,7 +236,7 @@ static void xe_dma_buf_move_notify(struct dma_buf_attachment *attach)
>  	struct drm_gem_object *obj = attach->importer_priv;
>  	struct xe_bo *bo = gem_to_xe_bo(obj);
>  
> -	XE_WARN_ON(xe_bo_evict(bo, false));
> +	XE_WARN_ON(xe_bo_evict(bo));
>  }
>  
>  static const struct dma_buf_attach_ops xe_dma_buf_attach_ops = {
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 903cd1030110..cf027558b6db 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -172,7 +172,6 @@ struct ttm_bo_kmap_obj {
>   * @gfp_retry_mayfail: Set the __GFP_RETRY_MAYFAIL when allocation pages.
>   * @allow_res_evict: Allow eviction of reserved BOs. Can be used when multiple
>   * BOs share the same reservation object.
> - * @force_alloc: Don't check the memory account during suspend or CPU page
>   * faults. Should only be used by TTM internally.
>   * @resv: Reservation object to allow reserved evictions with.
>   * @bytes_moved: Statistics on how many bytes have been moved.
> @@ -185,7 +184,6 @@ struct ttm_operation_ctx {
>  	bool no_wait_gpu;
>  	bool gfp_retry_mayfail;
>  	bool allow_res_evict;
> -	bool force_alloc;
>  	struct dma_resv *resv;
>  	uint64_t bytes_moved;
>  };
> -- 
> 2.48.1
> 
