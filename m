Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 554DCA2374D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 23:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E42510E9EB;
	Thu, 30 Jan 2025 22:37:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OHhTSfIv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E6010E9E8;
 Thu, 30 Jan 2025 22:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738276647; x=1769812647;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sZyb0/DngIuN/qlZcsBzMobsHpaMOTLLRA7FfNJrXho=;
 b=OHhTSfIvqaYXk7Yr+PyezKGdxNr5aks0JFxwoW0r5Sp3mFnfz2I/fLmY
 SKZXr20x4JdsFbjKIue3QxjfZJJOJfejgZhNnJOuTWl9Wk62PY+OojyHP
 ou6kYbHfyLbk0Zr6XzELc/AXu+S0DwN7w6GORhbJr93CbMY3E1oAva91G
 p6sNXaIoYBVe2POcPFu2bx+Vk0MypsAZGO//xXgW5LZ6YFjYQ06aR6+Z6
 5odS5c5/fxMxxIdOCEgmzahEGgbQcCcYNvYc9AjPlcAJe6uLesHZUC3hZ
 yj6/sHQ7VjpFWOTrjbXinFPHaSUj9eVUHAilHd/ui0r6lzmF7oXtN6u6Z Q==;
X-CSE-ConnectionGUID: 0EjVhNukQvmR1VWGvlSzEw==
X-CSE-MsgGUID: 7sKg23VWT5eYxmApCPOW5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="42767711"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="42767711"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 14:37:27 -0800
X-CSE-ConnectionGUID: qTQqouwsTve8mdz5lwxg6Q==
X-CSE-MsgGUID: HLJr5RcnRb64XzYyzuTI3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="109417280"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 14:37:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 14:37:26 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 14:37:26 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 14:37:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HstV5tiiLKcEFcBHleX/eVs6OteCA12QudJ79HFJq4RKDvzKCq15q60OluARFimIT1dmZxsvH3BADpkf2S3LFOSdA9U8BwIs4jUkXR2W1HPdqsNtwspFYjm/SGjh/SQvvqfmRZWrtDtgOoGma5G8v7E4/7WkDCGWe2Hpq1ggRV966A8HNqpMVuWn2VP9B8h2SSsuC41sLLLvkjvb5wxTsWhSeKb+3AT6b4hdVO86lA1EbsnuAFMjy7aXLykVvcc8A0q+TJCa4FcDat1P65EbnCuOac/dw5F7IaZCSMM3f+Pho6bqGWg3t5xkyeFQO739i99X5GNEXeY9D4UoMSZ17g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gH34LC8EJsBj2UMtjpZjLghBEye6SJqCo645CEZc7wY=;
 b=aS8N90G6iDofgZg7hmPihqRwJ56gJ7jDBPhh2NbH45FCb6LpMSJR+gmg3urzq86UcAZQuuoQFTT6qb/HfeugEvXUKjhd2E9RQ8gq/wIvM7Uqvqg90uWKpBjqk4ePhuSKzdwp9auyH9pybSEdj4YaMRXA60x/q6HwgpcciVvPh3b0ECL8d2VQY/ePpJXjyzNfcEsl1lUq1QnErVqueHU6HY177r/Ah9WnHiMfL0HG5TDeVgMKohl/Wibm/W1FI2JkUqvIWUraD9IkC6erloNk0hUyU5MVzNyw7ACwHjAiu7yR/yz/CertaPCWozJssLwQ2ZeH8GABFXMtN/PPrnix8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by PH7PR11MB6056.namprd11.prod.outlook.com (2603:10b6:510:1d4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 22:37:18 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8377.021; Thu, 30 Jan 2025
 22:37:18 +0000
Date: Thu, 30 Jan 2025 17:37:14 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, John Harrison
 <john.c.harrison@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 "Zhanjun Dong" <zhanjun.dong@intel.com>
Subject: Re: [PATCH v6 1/6] drm/xe/guc: Rename __guc_capture_parsed_output
Message-ID: <Z5v_GhV2xJYZB3mw@intel.com>
References: <20250128183653.4027915-1-alan.previn.teres.alexis@intel.com>
 <20250128183653.4027915-2-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250128183653.4027915-2-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: MW2PR16CA0025.namprd16.prod.outlook.com (2603:10b6:907::38)
 To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|PH7PR11MB6056:EE_
X-MS-Office365-Filtering-Correlation-Id: cce79675-43b0-4e85-6dc1-08dd417ea74c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?+Xf0XhVqUA6Yi1E3yqlEffPP8VvZI0K675FHOQKw8H8ii1xiQAFukiIR7k?=
 =?iso-8859-1?Q?afXyCPvd4+LEZmcDabiP8/GsC7eL/Oy1DDbs41Dx1r9O4IdPis0GtDkE9n?=
 =?iso-8859-1?Q?Fba5LtpkxwsSgofKDPKXOmq9O26PwrioPCOsMNUnfVqsVJxemtg4MYu6WH?=
 =?iso-8859-1?Q?nm4eKTDbyBFHpqM9WBX0tzp9DpvSLnpYvK55HCJNzF7O0nEcOz3w9cDpzv?=
 =?iso-8859-1?Q?2ETA0vK1Z/J1KXPW+bVx0aST0DBodrNviQrIlYIixcPUvt69OXVSSXrPYu?=
 =?iso-8859-1?Q?6VDEaGhQzAaxn9b5+mhMgLT4rTy11SCs6AE1ibhY94REwd6v3qViVomVvk?=
 =?iso-8859-1?Q?DHGKmcvM6bZZxu8ImNyKBL3GPQpEn87QiB66vminNgDw/jks0Ul36mbxSE?=
 =?iso-8859-1?Q?ATmpawxPwzaHi8ip5vog1D3RLbmaKijYEzQ1YfAB9KYCigifV3oFJZOxr7?=
 =?iso-8859-1?Q?l/At0CmKorJS+g5Mh+ns4Qcr6HWzF3LRnsdMSIc1+5amQpsm9Ae/Tp3Qvu?=
 =?iso-8859-1?Q?KpC86qQ7TItt8fDIMim0tKRzjnf7BWRz5SW/zkbHbVWWLgZL7Q2xrTKBwJ?=
 =?iso-8859-1?Q?OVPVK2xn1H1D9aBquukSOKvdERG542tnA8crWd/vUluEsl5jnwpfrJDbls?=
 =?iso-8859-1?Q?gnk6X5kU6aEw0t6OPpbC8h/LEhfneF5M4rWLzVtpHRWibjzUvwI5sWiCwi?=
 =?iso-8859-1?Q?ZYf5hiskH5nPQ1ZctYweFqgfJ5VhRaGFNS8nh75q9Q4TDOwCK9AfH2SM68?=
 =?iso-8859-1?Q?Tfze5eCMixfwJadCJfppyW/o+kML9ORXkzkFSg19AkkyEYe060SrsDVvwd?=
 =?iso-8859-1?Q?efYTdaTiU1z83hLfPJy3xAbMBfjQSVFQf7bc8JbA2I8kL/CPWQrBE2NfR1?=
 =?iso-8859-1?Q?l3aUfgAYjtqoWHdUKy/GYWEqMB+M58TG+oEsNh6r+VwWIdbrMudB1oQE/J?=
 =?iso-8859-1?Q?xRYBfTw5tKdWlssV6yOiaSXYfiZwxNzZpxpwVkYATOP93iz47ylSuV8PZL?=
 =?iso-8859-1?Q?GOVZcwUAPBd3d7jqiljgzVe6GQMDBW6luv4lEC8raPwt5/AgvUOjyXYndx?=
 =?iso-8859-1?Q?bq6pAoWKqtdK+/i8SdLksxAFysDiQKMwHTFI6rFCbglkjUD3iMpwqX/JBu?=
 =?iso-8859-1?Q?v4yj/Jbu+dG0gQdKbTH3bhd1B+vntVMwRiL36g1i5mGIIDrIP1qOsrywEK?=
 =?iso-8859-1?Q?TlxsxTIsEcoqbrO5GTQtGydI8PvIhYd2XoSZwCd27vsaONjEeWbijJ/7MQ?=
 =?iso-8859-1?Q?qmgXvNx0sZSu1UEqERuiT0JIZg8qmeDrqpfT2ZTD6oLaWrvtBwUU3veu5Y?=
 =?iso-8859-1?Q?8ghg+Z4kOiiAFJ8+6ksRT/xqOTMGmemhMKoGnVW7hOTDo/C4yaHRUxSMDO?=
 =?iso-8859-1?Q?kWZ2LILV51oGvQ9wgph+3XqSPilEBNbPXmvX9OcbVVfWI+tvbL+X0etRvp?=
 =?iso-8859-1?Q?5YB4BRp/GBK61mVe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GT/lSf5rv8Vq+x1CtxZ8LsSFiqNf63kjgf5mEhtaPU1D4+XPUXaDJOz4cq?=
 =?iso-8859-1?Q?Lb8nHGJMxZubG6knj7+HYyfQScwWSWecJ3BVFiZIA4GWuildKl0S3yVx0U?=
 =?iso-8859-1?Q?DFvA94z5GNP2zP6Q7HQfl6JJRZk09EmbNkgoWlBB4mIXRV2AcIMm9XjLr7?=
 =?iso-8859-1?Q?J31RbKNNa50mCwm/Iq7BV7bIzOzpatUG0X/wHtQJP2KGLbRPbO2hSZI/Cf?=
 =?iso-8859-1?Q?cDkt4JFG7y+0wsyiQAKbevoi6RnB6Hm3wwtNmJhGKyFRqZOnnZgveNscct?=
 =?iso-8859-1?Q?1JYqbnAAEf8fJpwSQxlzlMpzewMKKbP5univqW/FUE8U7E5r0I+DaFI36u?=
 =?iso-8859-1?Q?IqIOEyM+gmXZsJMwj2uScp5rM9awkkAAMSYWsaiu8+dxqHYNElKVfwVX47?=
 =?iso-8859-1?Q?+PJ+GCkL5CY5qHAAL8iDhxBrFzkd+gxWZH68t0hzjbL2nSatTGbDFuaC/f?=
 =?iso-8859-1?Q?srxye3XsD7N/DWVmkfdmCqPDNNgAL4ea3zA1GgiLpW8BTUJUk/LYHmUF61?=
 =?iso-8859-1?Q?MJazw+Vi7x8DrAeyaVeFmY1QhDVr2XKZBSs5xr2zYXNxoDj3BJecslPO64?=
 =?iso-8859-1?Q?ksog3V1mmP2riFiozHxIynUPHr1bPB1ww2r8NvN2QneyvC4RHNso6JR8Z5?=
 =?iso-8859-1?Q?8Vf7v2lihCy8+orHCbUTV061dCMjFu2XWGzDuI1Hkkl6OidOpYdMEQycWi?=
 =?iso-8859-1?Q?okSat3kdEnDWnWdUZkBmEma7P4yF3PRvLL2xbHHbQkc2Zo/DnPHe89wWnO?=
 =?iso-8859-1?Q?AsMF/CjVnVbFpZQaf7MuTe8TzdbQWEJvG0jWTKQ9sroRKABNbx9a6phTyh?=
 =?iso-8859-1?Q?NQj2DeBFGzZV6a5FYNaACv/9hpFDIlOp8PXxMdJjOKHEd0pG7TRRJ6guBr?=
 =?iso-8859-1?Q?ogu72lj9QzIQ05UYEBepR76YyYSvOw5vOWVbwiCjmw5AfmQxTU3wWb5JMN?=
 =?iso-8859-1?Q?XPaOeutidqfzhp99ahNoVmCGhxsCtUB4f0IK6yvcpJyl59qvXFqlrETreq?=
 =?iso-8859-1?Q?orFd5VXhWdeLFol/+cAtBWnCzhrfVFdk6GQcLhumHIFHzVsbRAxeqm/dVy?=
 =?iso-8859-1?Q?VDBzKIEYrJOYdi2sI9v+e9rYrkvG33TKUmyRnpxgYS45OarUau9sldzBwz?=
 =?iso-8859-1?Q?bd142oZe32/Nudif8JjoF9jd0QIWBOXyVKXp2Ns+tWHx8Ypw6jlISXc0/I?=
 =?iso-8859-1?Q?FS/kNd2s203QdfWiwoNJN7YigRIMaom8t8Z5dCiLaeOKyoCbihHOwWIsEn?=
 =?iso-8859-1?Q?ZlIODs18TyrchVDUqhMWlTK6RrRFdwhxPHK6/FRaTt1VSA2Y+GSgEeLVzS?=
 =?iso-8859-1?Q?pp99JQkVuORuryM6DTUrdmK/UrXY9xVW+WT3UhpdrTzD2PsudW3ImP71Xe?=
 =?iso-8859-1?Q?yZ6/IkxQiXiDldYv0n0sxhxEcScNKqUs8scyl6RNW3PXisSIRD56Dw031e?=
 =?iso-8859-1?Q?FZJ1KMFvIh8jaxAg5E7PS+bhER24SN5JBHx/vlTrrjmT38bpIsG1J032mn?=
 =?iso-8859-1?Q?xK3UaJnmVzGwH2/4akcaMn0I5xgOm4Ez1Pc/YCaF0hXmCziFTtmqkLpEy0?=
 =?iso-8859-1?Q?j0ovwv6DtkN4Ae6bwme6M6j0+d1KS1/yVXlr7Rzv1E4NnEywMj8YVc9eSj?=
 =?iso-8859-1?Q?xgSISABUnqoCNs15PTHi1EYCMDw0Arb7MRdbvTeoAaE5HFUi9ssEJXlA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cce79675-43b0-4e85-6dc1-08dd417ea74c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 22:37:18.8104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bbin2wCwZEoCOxL71311mVe2ONrBvW2x2YJGcfXAowFiybO0P0cCvy7qdoXGuWLaWzgiADmJ5vkDJ+wx4rbIBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6056
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

On Tue, Jan 28, 2025 at 10:36:47AM -0800, Alan Previn wrote:
> Since '__guc_capture_parsed_output *' is a handle that
> is retrieved, stored and relinquished by an entity
> external to GuC (i.e. xe_devcoredump), lets rename it to
> something formal without the'__' prefix and export it
> via give a header file.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump_types.h     |  2 +-
>  drivers/gpu/drm/xe/xe_guc_capture.c           | 83 ++++++-------------
>  drivers/gpu/drm/xe/xe_guc_capture.h           |  2 +-
>  .../drm/xe/xe_guc_capture_snapshot_types.h    | 53 ++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine.c             |  2 +-
>  drivers/gpu/drm/xe/xe_hw_engine_types.h       |  5 --
>  6 files changed, 81 insertions(+), 66 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index 1a1d16a96b2d..c94ce21043a8 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -58,7 +58,7 @@ struct xe_devcoredump_snapshot {
>  	 * this single-node tracker works because devcoredump will always only
>  	 * produce one hw-engine capture per devcoredump event
>  	 */
> -	struct __guc_capture_parsed_output *matched_node;
> +	struct xe_guc_capture_snapshot *matched_node;
>  	/** @vm: Snapshot of VM state */
>  	struct xe_vm_snapshot *vm;
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index f6d523e4c5fe..e04c87739267 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -26,6 +26,7 @@
>  #include "xe_guc_ads.h"
>  #include "xe_guc_capture.h"
>  #include "xe_guc_capture_types.h"
> +#include "xe_guc_capture_snapshot_types.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_exec_queue_types.h"
>  #include "xe_guc_log.h"
> @@ -53,40 +54,6 @@ struct __guc_capture_bufstate {
>  	u32 wr;
>  };
>  
> -/*
> - * struct __guc_capture_parsed_output - extracted error capture node
> - *
> - * A single unit of extracted error-capture output data grouped together
> - * at an engine-instance level. We keep these nodes in a linked list.
> - * See cachelist and outlist below.
> - */
> -struct __guc_capture_parsed_output {
> -	/*
> -	 * A single set of 3 capture lists: a global-list
> -	 * an engine-class-list and an engine-instance list.
> -	 * outlist in __guc_capture_parsed_output will keep
> -	 * a linked list of these nodes that will eventually
> -	 * be detached from outlist and attached into to
> -	 * xe_codedump in response to a context reset
> -	 */
> -	struct list_head link;
> -	bool is_partial;
> -	u32 eng_class;
> -	u32 eng_inst;
> -	u32 guc_id;
> -	u32 lrca;
> -	u32 type;
> -	bool locked;
> -	enum xe_hw_engine_snapshot_source_id source;
> -	struct gcap_reg_list_info {
> -		u32 vfid;
> -		u32 num_regs;
> -		struct guc_mmio_reg *regs;
> -	} reginfo[GUC_STATE_CAPTURE_TYPE_MAX];
> -#define GCAP_PARSED_REGLIST_INDEX_GLOBAL   BIT(GUC_STATE_CAPTURE_TYPE_GLOBAL)
> -#define GCAP_PARSED_REGLIST_INDEX_ENGCLASS BIT(GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS)
> -};
> -
>  /*
>   * Define all device tables of GuC error capture register lists
>   * NOTE:
> @@ -287,7 +254,7 @@ struct xe_guc_state_capture {
>  
>  static void
>  guc_capture_remove_stale_matches_from_list(struct xe_guc_state_capture *gc,
> -					   struct __guc_capture_parsed_output *node);
> +					   struct xe_guc_capture_snapshot *node);
>  
>  static const struct __guc_mmio_reg_descr_group *
>  guc_capture_get_device_reglist(struct xe_device *xe)
> @@ -841,7 +808,7 @@ static void check_guc_capture_size(struct xe_guc *guc)
>  }
>  
>  static void
> -guc_capture_add_node_to_list(struct __guc_capture_parsed_output *node,
> +guc_capture_add_node_to_list(struct xe_guc_capture_snapshot *node,
>  			     struct list_head *list)
>  {
>  	list_add(&node->link, list);
> @@ -849,7 +816,7 @@ guc_capture_add_node_to_list(struct __guc_capture_parsed_output *node,
>  
>  static void
>  guc_capture_add_node_to_outlist(struct xe_guc_state_capture *gc,
> -				struct __guc_capture_parsed_output *node)
> +				struct xe_guc_capture_snapshot *node)
>  {
>  	guc_capture_remove_stale_matches_from_list(gc, node);
>  	guc_capture_add_node_to_list(node, &gc->outlist);
> @@ -857,14 +824,14 @@ guc_capture_add_node_to_outlist(struct xe_guc_state_capture *gc,
>  
>  static void
>  guc_capture_add_node_to_cachelist(struct xe_guc_state_capture *gc,
> -				  struct __guc_capture_parsed_output *node)
> +				  struct xe_guc_capture_snapshot *node)
>  {
>  	guc_capture_add_node_to_list(node, &gc->cachelist);
>  }
>  
>  static void
>  guc_capture_free_outlist_node(struct xe_guc_state_capture *gc,
> -			      struct __guc_capture_parsed_output *n)
> +			      struct xe_guc_capture_snapshot *n)
>  {
>  	if (n) {
>  		n->locked = 0;
> @@ -876,9 +843,9 @@ guc_capture_free_outlist_node(struct xe_guc_state_capture *gc,
>  
>  static void
>  guc_capture_remove_stale_matches_from_list(struct xe_guc_state_capture *gc,
> -					   struct __guc_capture_parsed_output *node)
> +					   struct xe_guc_capture_snapshot *node)
>  {
> -	struct __guc_capture_parsed_output *n, *ntmp;
> +	struct xe_guc_capture_snapshot *n, *ntmp;
>  	int guc_id = node->guc_id;
>  
>  	list_for_each_entry_safe(n, ntmp, &gc->outlist, link) {
> @@ -888,7 +855,7 @@ guc_capture_remove_stale_matches_from_list(struct xe_guc_state_capture *gc,
>  }
>  
>  static void
> -guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *node)
> +guc_capture_init_node(struct xe_guc *guc, struct xe_guc_capture_snapshot *node)
>  {
>  	struct guc_mmio_reg *tmp[GUC_STATE_CAPTURE_TYPE_MAX];
>  	int i;
> @@ -1067,13 +1034,13 @@ guc_capture_log_get_register(struct xe_guc *guc, struct __guc_capture_bufstate *
>  	return 0;
>  }
>  
> -static struct __guc_capture_parsed_output *
> +static struct xe_guc_capture_snapshot *
>  guc_capture_get_prealloc_node(struct xe_guc *guc)
>  {
> -	struct __guc_capture_parsed_output *found = NULL;
> +	struct xe_guc_capture_snapshot *found = NULL;
>  
>  	if (!list_empty(&guc->capture->cachelist)) {
> -		struct __guc_capture_parsed_output *n, *ntmp;
> +		struct xe_guc_capture_snapshot *n, *ntmp;
>  
>  		/* get first avail node from the cache list */
>  		list_for_each_entry_safe(n, ntmp, &guc->capture->cachelist, link) {
> @@ -1081,7 +1048,7 @@ guc_capture_get_prealloc_node(struct xe_guc *guc)
>  			break;
>  		}
>  	} else {
> -		struct __guc_capture_parsed_output *n, *ntmp;
> +		struct xe_guc_capture_snapshot *n, *ntmp;
>  
>  		/*
>  		 * traverse reversed and steal back the oldest node already
> @@ -1100,11 +1067,11 @@ guc_capture_get_prealloc_node(struct xe_guc *guc)
>  	return found;
>  }
>  
> -static struct __guc_capture_parsed_output *
> -guc_capture_clone_node(struct xe_guc *guc, struct __guc_capture_parsed_output *original,
> +static struct xe_guc_capture_snapshot *
> +guc_capture_clone_node(struct xe_guc *guc, struct xe_guc_capture_snapshot *original,
>  		       u32 keep_reglist_mask)
>  {
> -	struct __guc_capture_parsed_output *new;
> +	struct xe_guc_capture_snapshot *new;
>  	int i;
>  
>  	new = guc_capture_get_prealloc_node(guc);
> @@ -1146,7 +1113,7 @@ guc_capture_extract_reglists(struct xe_guc *guc, struct __guc_capture_bufstate *
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	struct guc_state_capture_group_header_t ghdr = {0};
>  	struct guc_state_capture_header_t hdr = {0};
> -	struct __guc_capture_parsed_output *node = NULL;
> +	struct xe_guc_capture_snapshot *node = NULL;
>  	struct guc_mmio_reg *regs = NULL;
>  	int i, numlists, numregs, ret = 0;
>  	enum guc_state_capture_type datatype;
> @@ -1439,11 +1406,11 @@ void xe_guc_capture_process(struct xe_guc *guc)
>  		__guc_capture_process_output(guc);
>  }
>  
> -static struct __guc_capture_parsed_output *
> +static struct xe_guc_capture_snapshot *
>  guc_capture_alloc_one_node(struct xe_guc *guc)
>  {
>  	struct drm_device *drm = guc_to_drm(guc);
> -	struct __guc_capture_parsed_output *new;
> +	struct xe_guc_capture_snapshot *new;
>  	int i;
>  
>  	new = drmm_kzalloc(drm, sizeof(*new), GFP_KERNEL);
> @@ -1468,7 +1435,7 @@ guc_capture_alloc_one_node(struct xe_guc *guc)
>  static void
>  __guc_capture_create_prealloc_nodes(struct xe_guc *guc)
>  {
> -	struct __guc_capture_parsed_output *node = NULL;
> +	struct xe_guc_capture_snapshot *node = NULL;
>  	int i;
>  
>  	for (i = 0; i < PREALLOC_NODES_MAX_COUNT; ++i) {
> @@ -1583,7 +1550,7 @@ xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot
>  	struct xe_devcoredump *devcoredump = &xe->devcoredump;
>  	enum guc_capture_list_class_type capture_class;
>  	const struct __guc_mmio_reg_descr_group *list;
> -	struct __guc_capture_parsed_output *new;
> +	struct xe_guc_capture_snapshot *new;
>  	enum guc_state_capture_type type;
>  	u16 guc_id = 0;
>  	u32 lrca = 0;
> @@ -1849,7 +1816,7 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>   *
>   * Returns: found guc-capture node ptr else NULL
>   */
> -struct __guc_capture_parsed_output *
> +struct xe_guc_capture_snapshot *
>  xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
>  {
>  	struct xe_hw_engine *hwe;
> @@ -1878,7 +1845,7 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
>  	}
>  
>  	if (guc_class <= GUC_LAST_ENGINE_CLASS) {
> -		struct __guc_capture_parsed_output *n, *ntmp;
> +		struct xe_guc_capture_snapshot *n, *ntmp;
>  		struct xe_guc *guc =  &q->gt->uc.guc;
>  		u16 guc_id = q->guc->id;
>  		u32 lrca = xe_lrc_ggtt_addr(q->lrc[0]);
> @@ -1931,7 +1898,7 @@ xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q)
>  			coredump->snapshot.hwe[id] =
>  				xe_hw_engine_snapshot_capture(hwe, q);
>  		} else {
> -			struct __guc_capture_parsed_output *new;
> +			struct xe_guc_capture_snapshot *new;
>  
>  			new = xe_guc_capture_get_matching_and_lock(q);
>  			if (new) {
> @@ -1965,7 +1932,7 @@ void xe_guc_capture_put_matched_nodes(struct xe_guc *guc)
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_devcoredump *devcoredump = &xe->devcoredump;
> -	struct __guc_capture_parsed_output *n = devcoredump->snapshot.matched_node;
> +	struct xe_guc_capture_snapshot *n = devcoredump->snapshot.matched_node;
>  
>  	if (n) {
>  		guc_capture_remove_stale_matches_from_list(guc->capture, n);
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
> index 20a078dc4b85..046989fba3b1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.h
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
> @@ -50,7 +50,7 @@ size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc);
>  const struct __guc_mmio_reg_descr_group *
>  xe_guc_capture_get_reg_desc_list(struct xe_gt *gt, u32 owner, u32 type,
>  				 enum guc_capture_list_class_type capture_class, bool is_ext);
> -struct __guc_capture_parsed_output *xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q);
> +struct xe_guc_capture_snapshot *xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q);
>  void xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot);
>  void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p);
>  void xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q);
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h b/drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h
> new file mode 100644
> index 000000000000..0be2c809a7ce
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2021-2024 Intel Corporation

2025

then

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> + */
> +
> +#ifndef _XE_GUC_CAPTURE_SNAPSHOT_TYPES_H
> +#define _XE_GUC_CAPTURE_SNAPSHOT_TYPES_H
> +
> +#include <linux/types.h>
> +#include <abi/guc_capture_abi.h>
> +
> +struct guc_mmio_reg;
> +
> +enum xe_guc_capture_snapshot_source {
> +	XE_ENGINE_CAPTURE_SOURCE_MANUAL,
> +	XE_ENGINE_CAPTURE_SOURCE_GUC
> +};
> +
> +/*
> + * struct xe_guc_capture_snapshot - extracted error capture node
> + *
> + * A single unit of extracted error-capture output data grouped together
> + * at an engine-instance level. We keep these nodes in a linked list.
> + * See cachelist and outlist below.
> + */
> +struct xe_guc_capture_snapshot {
> +	/*
> +	 * A single set of 3 capture lists: a global-list
> +	 * an engine-class-list and an engine-instance list.
> +	 * outlist in xe_guc_state_capture will keep
> +	 * a linked list of these nodes that will eventually
> +	 * be detached from outlist and attached into to
> +	 * xe_codedump in response to a context reset
> +	 */
> +	struct list_head link;
> +	bool is_partial;
> +	u32 eng_class;
> +	u32 eng_inst;
> +	u32 guc_id;
> +	u32 lrca;
> +	u32 type;
> +	bool locked;
> +	enum xe_guc_capture_snapshot_source source;
> +	struct gcap_reg_list_info {
> +		u32 vfid;
> +		u32 num_regs;
> +		struct guc_mmio_reg *regs;
> +	} reginfo[GUC_STATE_CAPTURE_TYPE_MAX];
> +#define GCAP_PARSED_REGLIST_INDEX_GLOBAL   BIT(GUC_STATE_CAPTURE_TYPE_GLOBAL)
> +#define GCAP_PARSED_REGLIST_INDEX_ENGCLASS BIT(GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS)
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index fc447751fe78..a99e3160724b 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -843,7 +843,7 @@ struct xe_hw_engine_snapshot *
>  xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
>  {
>  	struct xe_hw_engine_snapshot *snapshot;
> -	struct __guc_capture_parsed_output *node;
> +	struct xe_guc_capture_snapshot *node;
>  
>  	if (!xe_hw_engine_is_valid(hwe))
>  		return NULL;
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index e4191a7a2c31..de69e2628f2f 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -152,11 +152,6 @@ struct xe_hw_engine {
>  	struct xe_hw_engine_group *hw_engine_group;
>  };
>  
> -enum xe_hw_engine_snapshot_source_id {
> -	XE_ENGINE_CAPTURE_SOURCE_MANUAL,
> -	XE_ENGINE_CAPTURE_SOURCE_GUC
> -};
> -
>  /**
>   * struct xe_hw_engine_snapshot - Hardware engine snapshot
>   *
> -- 
> 2.34.1
> 
