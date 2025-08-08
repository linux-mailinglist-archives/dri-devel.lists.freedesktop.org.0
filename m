Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CECEB1EA71
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 16:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A2E10E942;
	Fri,  8 Aug 2025 14:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EMDZWtQa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0152710E940;
 Fri,  8 Aug 2025 14:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754663857; x=1786199857;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=J+gK5yNd/tcQWvy7C4JXcybUMGub0YD20m6FO78woc0=;
 b=EMDZWtQaNnXNSFXWpfK6yGE52iFot27088tFU42OBov+lnMPYSwhxW8d
 urAoNh3v5o6GZ4YOMnMs3QA9Ow3GcvPwF284tGDDPyAN7NM7lCSxhJxhN
 pSYgqJeSR15yX2wN/Ybs1c2xaZR+HQ+jY4JVyf2yKW6617TI8z0kuEhLm
 UjPy1boLtHkZ1hvKD+2PEP0LLvk43YM856kxpvvHnLAH0pYqwFyW8E72E
 rwCAH0CEVGz/ONHCG4uMEeqynA2Dc2XwwOQLmqEgaogfBYIeWfO94zcGU
 FLxjGYbQXhDPHHeRc8xSVVkhYEbe/kp2sn+YAb9G/FJvvH+Cpl+tTaRBB Q==;
X-CSE-ConnectionGUID: For/tXrNSVyYiw4kMLvmuQ==
X-CSE-MsgGUID: JB20pQWZRpeQaGrHsL+/OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="57078406"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="57078406"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:37:36 -0700
X-CSE-ConnectionGUID: FdBi+2ZsTJahZ4aN3xOHjA==
X-CSE-MsgGUID: 7sXyjthhTmS0alISyZAv/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="169797752"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 07:37:36 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 07:37:35 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 07:37:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.74)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 07:37:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=de1rfP4YUgAsEZaAm1ib6NtNdHSr75lAFBolHek4+EO+vIjJXpyUhlBdmotf5DiXwlPuKwf4Z/XkcS+8e2RG1nZnVuqlXMOpQylWv9CfiDCrjZhMKhaghlWI6eFgevRWHCqnHGdLLTDxnsQhqd8ujLclan4ZCk9PXtGiZ3l72l0yjHA6hwCqN74HQ252YaZqEbVntguJlvhw/dmPvGbHk1Gl5g/RbN7P5kFhrK1YAKgq40hJkGr8cSa1GLoX5/hhhxWCgXXC5gXqtxJQ0ygkzOMMsd++UBEvHbiTkNA3NnbmthBLaScrOBEz43G3D4NWmk514fzz4J2wtg1ayml22g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHZPi3vAvRODyeU07Np3b8WYDBJF90M6Uz0vjy74ugY=;
 b=QdUE23FTO/x8VhJdGMn6Y88xRKPC09kSrBx16MmhJaLLuou8QPpj6VHtNQcNdC1KAQ/UT+Wgt9gmWifDvZfB504onpZNJY/zzhdgVGwE7KiQBpHjt6tM8wWX3S4DemABJ6RunkGuZZvVZFVjlbO3wZSRCGDzqK8o+etoDD0mPGqsh3XGbJi1d4MJBdtpC6pHu8WnaK21bZDvjcKigLoOzYK/yuOHol7nF/GcLdoPIpQ9RmI1NMXtD/fE2t16O65p9XvXeWmfflX2+dIZ5AFfN4j7g1Fn8ENo+FbcZWqctsW5f3Sir2hvI53lBZFPDMCgeJ59buUSPYp+VyMOTcjuiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MN0PR11MB6036.namprd11.prod.outlook.com (2603:10b6:208:377::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 14:37:32 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.018; Fri, 8 Aug 2025
 14:37:32 +0000
Date: Fri, 8 Aug 2025 10:37:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
CC: <joonas.lahtinen@linux.intel.com>, <tursulin@ursulin.net>,
 <jani.nikula@linux.intel.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <mairacanal@riseup.net>
Subject: Re: [PATCH 1/9 v2] drm/i915: Move struct_mutex to drm_i915_private
Message-ID: <aJYLqAFRDVQUJRLw@intel.com>
References: <20250807170212.285385-1-luiz.mello@estudante.ufscar.br>
 <20250807170212.285385-2-luiz.mello@estudante.ufscar.br>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250807170212.285385-2-luiz.mello@estudante.ufscar.br>
X-ClientProxiedBy: BYAPR11CA0055.namprd11.prod.outlook.com
 (2603:10b6:a03:80::32) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MN0PR11MB6036:EE_
X-MS-Office365-Filtering-Correlation-Id: 58393cb9-2b4a-42c1-33fd-08ddd6891ba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0qJ9qtRGYyRp99HzBVzvy5ayX92Vo+sVPTccSKtGnwYSYDLrbzQhgPd6zY/6?=
 =?us-ascii?Q?FB+rCfs0UXQyBPFzYgGMmXKOrvGDqQTGoRIMM15ugP5+7NOioDtaaHEbDltn?=
 =?us-ascii?Q?Qpv+ja9RzoEtNJzKQ7mb7DskoLBuIyMy71Ait84Yiw+IBpaiDTHTDuuQJ5AE?=
 =?us-ascii?Q?zSmsGsgpsBh8iUQDfsi3zIWeQgXvnJf8kb97IaQQ3i6iuzye5/eSPJK43Vjf?=
 =?us-ascii?Q?rKTMgbrypcNMNwGN2IyoRbZOoxMJCTs517fgrtNQdSAbgLcqeTcWB9a1Q3rL?=
 =?us-ascii?Q?qBeVWvohECcceUL3FNcZmBOHn8fJqJh+a99rXR6m6dVdCot8/3kOEvLF04q9?=
 =?us-ascii?Q?ky8eyIMYjraUpY+ofuhmcVy7yzGzmborc2NKtT1j9PO+igLtkVQoUtXXBCMn?=
 =?us-ascii?Q?udhBzfaXxCpx9lG928dFvkv8JZkYPiL1PADw+4F45cWsT1O7LK9+f9gLtd8+?=
 =?us-ascii?Q?RFTLLKJchs5t4bBkpxAqdnpqoBkZJ0XvtSSVTUAlfT8lnXe/UAbno1TLXRax?=
 =?us-ascii?Q?CaVMZoWUsUo0S5VTlJYLP3l8ryONwgCP1cEnpl9VNLfx3s3iV/Rxis6ntWaP?=
 =?us-ascii?Q?3ZryWy05MaRvJ9V8UIaxwWL+bhsAvmtEF2QEERLq+DHn532JJB0JYkXR1AFx?=
 =?us-ascii?Q?InJlhQQcq1Sswvn/uiLxh8MljXChW3Uia3EDNZi79PCLVOQcmEdjSzHdmtNn?=
 =?us-ascii?Q?i0Mu0qeL2xZ2OtyS8/02xt2LQpvDWn0yu41ob/9JeBQafwTcAu4ecM1E9nrR?=
 =?us-ascii?Q?5cBqEAZEmCl/UZXrCTFTzcMuNqGpDBSAtc+z97LAfkSjg03hLhMPGVgDimAA?=
 =?us-ascii?Q?oA6NaMTwElrNXjPjQh1u5EyRYUqlr1iSBNehSj8iyClTHUISiL5F3d7dtCln?=
 =?us-ascii?Q?SxQsAWabtRSdAuhLLDJA04Dz4sJFio+0gkzIgR5pAfUW4kTgxlVU+uoyIcIC?=
 =?us-ascii?Q?KiKnSD2d87BGzhznoFdYKzGohZILRJUfZENCqZyHemSQVbN3SZAa445k3lew?=
 =?us-ascii?Q?RTmgRbAU/05u16+fOfq7NrnRxfT9U9l0tCtWM19DWjkATOccAwGsAHMLlZv3?=
 =?us-ascii?Q?TY9o5c28DC5wAbio8lxx1L9snp5OjJgzRWGvGAVzX3ZbYAdoB3LxDXHkaV8A?=
 =?us-ascii?Q?45Kg2IpPGDNGbsvADvqSsbZdMiZ1YGUQ2UEX1uAoYVp+tQe0Eaz3s7jd+mMf?=
 =?us-ascii?Q?bOafhHS4esQyzIU8ZmaG4HJGwgNhHtFoUVL8uk+VCYZDeia94jOKUPINBWa2?=
 =?us-ascii?Q?HYXWDCgaOSM3d28LOd8kyoEMD3YQj3Jxu0d07fRWz9zjE66Uf3BhhP5IEUzP?=
 =?us-ascii?Q?ERqP8GVgpJIp7PeKK7k5wDEsV7ug7R+5WYFpXBBwYt3IUAnJ9qhbuXt6OJJa?=
 =?us-ascii?Q?G5EEHkg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aO449N+Nng1qYR5i2gwSUvrOS18ct+YbNGNEB8KAmH6UD88WeXCIkb48fXks?=
 =?us-ascii?Q?MJK38wJCLDZmzYCJ/Cth05T7XABDDodrrV9k8kAfl08K5xkuUx6X5S7jPWec?=
 =?us-ascii?Q?ocQ229X8puMewX/bJ6uuuyzPXfF8y32eYm/Y/sDNnbxjhhRaREO1v7996f9p?=
 =?us-ascii?Q?oEfUua2/nVcCjazf157QGdl+xinrXGhJFOiFnwwmzTs9847zrQDI9ctHB8Zd?=
 =?us-ascii?Q?NMMlVbf8IJJwQmk49qfz2LeXkhuJSMr6EI/ZaIjKkb4Ydax+8fjqKmpvyalI?=
 =?us-ascii?Q?eFom1wiTtAXlf2rsnABts+G1Ys42zEKAJCOSqiZ/zTGfA+8flbRTKeBZCajX?=
 =?us-ascii?Q?iDNUI503ChjfxMM5x1YRLkmSUzYQ4YzdFXIMhInQ80IXIgF007Kbume5N9GK?=
 =?us-ascii?Q?ud60bc8LFSLyabXwEeM3QV7Qn+2b6qp9rEKAiuThZH8alixZzBfGMeZ8EpLm?=
 =?us-ascii?Q?tmblS3bPgOoDaezOnBWLI7j/mMSBlMK9N4N5ek1ZdN3bMYgigIVs0xWjyKXB?=
 =?us-ascii?Q?NWAeZpEaBKe/GYNWmrx1cjxw1Oeg3hXK5c7JWAsWKD35DHtdnM6UOyjcMh8z?=
 =?us-ascii?Q?sR2/CZXwLQzzshH90+UR0nu8NkMoTT2txehVDGiIJJHa/B/wNfUukobbZRZa?=
 =?us-ascii?Q?CWZBNyrDgVelDUwAeQTyyPvN7e43iW17U9gYFI3FJLXLJiSM06noo/8ndC5y?=
 =?us-ascii?Q?fqL5sJk2RgG7QVgkZ1SJX3bg5XoPOju7MPRH0eGhD4BwEg1F9+AJIpZaJ0Jl?=
 =?us-ascii?Q?eJ+3ifFkzbKRRBB5h2Er2e5D+fInFIe+Vff72n7+C2iFVCvPV6ul4HuAuECl?=
 =?us-ascii?Q?aJ1acVuC2N6x/LKfOAUFzCuLKtWhVAyNxxE7UiH2aWahenUZytrNd1ghQe9z?=
 =?us-ascii?Q?j625QKgz0GmJ275IgSHKh8B3P4reASV7+6Y3eMOX5sHBX/6GRUFyqdqCYopN?=
 =?us-ascii?Q?3JQROH2l7KweG+/gYF1J5n9ynvOrr1IjX+ysjhC4851GkdNt0jmro6cYIQGx?=
 =?us-ascii?Q?ZvoTn3jbPgxPrjvwvUWnM8xe3Zhi5pVMbF8xtLlYECiz3db38IeM9bYU+ZWv?=
 =?us-ascii?Q?o8E6l3pyX7VIJ6ZNtza+qMxrNPnW8AFKrxXYnOgy8zn+3dKWjAPac7yoYxYX?=
 =?us-ascii?Q?yLsPLz1+b/RdkrSm4WNP5klpyRcfBED5HkJ349f8GIGLUwzSdFvI6pea1TK2?=
 =?us-ascii?Q?i4PvGv1ZO1FY5cDDLkQ5m2V1Anx9cD39YZqQ4pU2w/EznqjBQ4blMJ7/yF+b?=
 =?us-ascii?Q?LM6moDjiw02thiwzI6eujXpYQbpnAoMmODzNTxOp5t/ch2rpCnTH2pHdqeLI?=
 =?us-ascii?Q?+SdWsAOzXgryV2QpVnJvN4GVGu/9tNx2iKMdYwmUIm+z4c7WUA/0GVMHH+hX?=
 =?us-ascii?Q?tDeo4J+xqdruh/ZLYiSe5HTaWHn/O0h6fwDRtSVqIPwCg93vjopGHw/mFp33?=
 =?us-ascii?Q?1fk5G9hEwiePbA+3+wNPNmp+vrXLAweCUTvT6csXSOEvsBWzoTNDreeg0VKt?=
 =?us-ascii?Q?Q6c1zZboLdl1ivGm/YWCjzmptbc2GA4mqSn0/VX8vrGNJdzO7ZXWqVLNju2c?=
 =?us-ascii?Q?XzZ7ixlgc/NsA2EVL3sXhROndoBPmUelMrscTzF2tVWwpIRqSFTTHgWQo1o3?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58393cb9-2b4a-42c1-33fd-08ddd6891ba3
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 14:37:32.0824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SV2YLc8OBHP8VPJ8rrO37qbL1/yDkoSnGCfVIhabLLo7Ou9hJ5JpvPDPhYl0cH4Eko4nRXZ8HmtOuO19DqbE1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6036
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

On Thu, Aug 07, 2025 at 02:02:00PM -0300, Luiz Otavio Mello wrote:
> Move legacy BKL struct_mutex from drm_device to drm_i915_private, which
> is the last remaining user.
> 
> Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
> ---
>  drivers/gpu/drm/drm_drv.c                  |  2 --

misc Maintainers, since this touches drm, ack on getting this through
drm-intel-next?

>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.c |  4 ++--
>  drivers/gpu/drm/i915/i915_driver.c         |  2 ++
>  drivers/gpu/drm/i915/i915_drv.h            | 11 +++++++++++
>  drivers/gpu/drm/i915/i915_irq.c            |  4 ++--
>  include/drm/drm_device.h                   | 10 ----------
>  6 files changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index cdd591b11488..ad3aee354ba3 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -694,7 +694,6 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
>  	mutex_destroy(&dev->master_mutex);
>  	mutex_destroy(&dev->clientlist_mutex);
>  	mutex_destroy(&dev->filelist_mutex);
> -	mutex_destroy(&dev->struct_mutex);
>  }
>  
>  static int drm_dev_init(struct drm_device *dev,
> @@ -735,7 +734,6 @@ static int drm_dev_init(struct drm_device *dev,
>  	INIT_LIST_HEAD(&dev->vblank_event_list);
>  
>  	spin_lock_init(&dev->event_lock);
> -	mutex_init(&dev->struct_mutex);
>  	mutex_init(&dev->filelist_mutex);
>  	mutex_init(&dev->clientlist_mutex);
>  	mutex_init(&dev->master_mutex);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> index e8a04e476c57..7135fdb0ebb4 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> @@ -678,7 +678,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
>  	if (level < GUC_LOG_LEVEL_DISABLED || level > GUC_LOG_LEVEL_MAX)
>  		return -EINVAL;
>  
> -	mutex_lock(&i915->drm.struct_mutex);
> +	mutex_lock(&i915->struct_mutex);
>  
>  	if (log->level == level)
>  		goto out_unlock;
> @@ -696,7 +696,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
>  	log->level = level;
>  
>  out_unlock:
> -	mutex_unlock(&i915->drm.struct_mutex);
> +	mutex_unlock(&i915->struct_mutex);
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index c6263c6d3384..d1559fd8ad3d 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -233,6 +233,7 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>  
>  	intel_sbi_init(display);
>  	vlv_iosf_sb_init(dev_priv);
> +	mutex_init(&dev_priv->struct_mutex);
>  	mutex_init(&dev_priv->sb_lock);
>  
>  	i915_memcpy_init_early(dev_priv);
> @@ -291,6 +292,7 @@ static void i915_driver_late_release(struct drm_i915_private *dev_priv)
>  	i915_workqueues_cleanup(dev_priv);
>  
>  	mutex_destroy(&dev_priv->sb_lock);
> +	mutex_destroy(&dev_priv->struct_mutex);
>  	vlv_iosf_sb_fini(dev_priv);
>  	intel_sbi_fini(display);
>  
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 4e4e89746aa6..6093dbaf4009 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -222,6 +222,17 @@ struct drm_i915_private {
>  
>  	bool irqs_enabled;
>  
> +	/*
> +	 * Currently, struct_mutex is only used by the i915 driver as a replacement
> +	 * for BKL. 
> +	 * 
> +	 * For this reason, it is no longer part of struct drm_device.
> +	*/

The text in this block is not good imho. It doesn't need to state why it is not
part of the drm_device, but why it yet exists or a mention that it is going to
get removed, but I don't be picky with the content itself since it is getting
removed in a next patch in this same series.

But one thing you need is to fix the spurious space and alignment and ensure that
it is passing the checkpatch.

Right after rebasing into tip/drm-tip you can do this to check all your patches:
$ git show --no-use-mailmap --pretty=email tip/drm-tip..HEAD | ./scripts/checkpatch.pl -q --emacs --strict --show-types --max-line-length=100 --ignore=BIT_MACRO,SPLIT_STRING,LONG_LINE_STRING,BOOL_MEMBER

Or you can install our maintainer-tools and use dim checkpatch command.
https://drm.pages.freedesktop.org/maintainer-tools/index.html

With dim you have the right check-patch rules for each of the drm targets.

And yes, I have fixed it on the series I resent for CI, so with this fixed:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +	struct mutex struct_mutex;
> +
> +	/* LPT/WPT IOSF sideband protection */
> +	struct mutex sbi_lock;
> +
>  	/* VLV/CHV IOSF sideband */
>  	struct {
>  		struct mutex lock; /* protect sideband access */
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index 191ed8bb1d9c..cdfb09464134 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -167,7 +167,7 @@ static void ivb_parity_work(struct work_struct *work)
>  	 * In order to prevent a get/put style interface, acquire struct mutex
>  	 * any time we access those registers.
>  	 */
> -	mutex_lock(&dev_priv->drm.struct_mutex);
> +	mutex_lock(&dev_priv->struct_mutex);
>  
>  	/* If we've screwed up tracking, just let the interrupt fire again */
>  	if (drm_WARN_ON(&dev_priv->drm, !dev_priv->l3_parity.which_slice))
> @@ -225,7 +225,7 @@ static void ivb_parity_work(struct work_struct *work)
>  	gen5_gt_enable_irq(gt, GT_PARITY_ERROR(dev_priv));
>  	spin_unlock_irq(gt->irq_lock);
>  
> -	mutex_unlock(&dev_priv->drm.struct_mutex);
> +	mutex_unlock(&dev_priv->struct_mutex);
>  }
>  
>  static irqreturn_t valleyview_irq_handler(int irq, void *arg)
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index a33aedd5e9ec..016df5529d46 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -188,16 +188,6 @@ struct drm_device {
>  	/** @unique: Unique name of the device */
>  	char *unique;
>  
> -	/**
> -	 * @struct_mutex:
> -	 *
> -	 * Lock for others (not &drm_minor.master and &drm_file.is_master)
> -	 *
> -	 * TODO: This lock used to be the BKL of the DRM subsystem. Move the
> -	 *       lock into i915, which is the only remaining user.
> -	 */
> -	struct mutex struct_mutex;
> -
>  	/**
>  	 * @master_mutex:
>  	 *
> -- 
> 2.50.1
> 
