Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 039E7A75048
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 19:21:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290CC10EA98;
	Fri, 28 Mar 2025 18:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i3QlC2oa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6C610E132;
 Fri, 28 Mar 2025 18:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743186064; x=1774722064;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KkxuMZ02fGqV6MyzLWn7PunfuZs5iN+BdgFUf4g/sR8=;
 b=i3QlC2oaA+diYQGLgOY2buw1ckHNY5oB717sBRBvUft0aBc1DWxcWjKJ
 Oqmsbpi+V0KTc6CX59CNg15+3vIP+ZCeOH6BaL+kIL5rar3Hc+iCEP3s9
 ZPbUbFnr2bVVTqYxbq962Olqdq7m3v24irZfK1Pn+QYC5vZfrOjAG3g/6
 IrHXp1bpzqKaENmMF/CKVUuHHQYQcXo9AKWHxKP2EDcCpoDy/CyC7c9an
 YdoiaJhulhXaVSdW6V1CSA72oiAppjsL+8vNYE50rr7frFJhVhHsrLGca
 /XeSF+h9jDP7n6MXqnqbXcmYLnWs7Dm4iDvH56YFCtD4qbdM42BMa0BKW w==;
X-CSE-ConnectionGUID: yLK8MQ+ZSWmf6Yk746HbCw==
X-CSE-MsgGUID: 0l1l5fpCRzCBfA3Gh5lBEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="62089924"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="62089924"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 11:21:03 -0700
X-CSE-ConnectionGUID: 1sFVHfi5SAioQEOh4Ks0hQ==
X-CSE-MsgGUID: vmc6thoIQD2JBgdzY1q4Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="130727354"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2025 11:21:03 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Mar 2025 11:21:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 28 Mar 2025 11:21:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 11:21:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvnN4d/U3CvYIa7xttOb+ISUNlkmgWKVv2zfjFckZj1/PJnn8DUxtXx9H5aAc+0bjeQnWpurJaNsIWEPs6zL2IAPVYzDz5ZadR7j6srvuIv1gFGPofyJcG6jaUYDSInTXVo58GpR+182ZODtmiBMBNrI3xixqW1BceZ3LKh6EEL1P+y4SlKQw2fB8M7Uuhur1EmVqn5e402ykGHsDopFYm8prba98a+T5m3+8GorM7Lj5/cg4upy1uaUbVcl4M9P3tQBSRnUDcN/f2aQ3J5E6HIp+W0fIIeS8HlQpDVLerJXgNiZn2HJpbX+W0e0cxvS5If+VlWAJhWOzX+Qyb1tGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMKftRmXOtpQwyHVQUbLUEm5+XXx3RlWcFmcWvsCb1k=;
 b=RssHnNV8WUKTsJjH6tsz02ZW8o9a5B5TITvhHTKyfs38UPQ3b0GxK0ocRohokjNuQ7TzoltW6mwfLIraJwjtG/XuQezFGJugzYXSRXSrLpVITpKef1Ua3ROcZn1ichYHptV1teJABYM62jmUy5inZgMTFSTFqwe1mNoW6H/SuA/FfkZ6hUGzplCqUDUTy8RLosmBAnMYq5H53oISRNcSU6eCHl1rSkaJlDFboc9WT1MQM2McUCXntVA8rciPN/4PysbsKoIWYNTMn5rOdXs/06lZHd8bE4cLPODDgviCWtowmtbsCJMB6R9AXq49aB/Qd5rggUyGDJ9fPQh78IzuwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH0PR11MB5192.namprd11.prod.outlook.com (2603:10b6:510:3b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 18:20:18 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 18:20:18 +0000
Date: Fri, 28 Mar 2025 14:20:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "John
 Harrison" <John.C.Harrison@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] drm/i915/gsc: delete a stray tab in
 intel_gsc_fw_get_binary_info()
Message-ID: <Z-boXYxpnGYRqsJ8@intel.com>
References: <6152e1ac-745d-4b38-ba49-f013e6760936@stanley.mountain>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6152e1ac-745d-4b38-ba49-f013e6760936@stanley.mountain>
X-ClientProxiedBy: MW3PR06CA0029.namprd06.prod.outlook.com
 (2603:10b6:303:2a::34) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH0PR11MB5192:EE_
X-MS-Office365-Filtering-Correlation-Id: f684d0e4-446e-4a84-234e-08dd6e25316a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O5AdRdtxlZUTqTYGJKSyVcbHwKUgl4LsDHwddJluZHwi2XZ0XzyVemv13I6h?=
 =?us-ascii?Q?nsl2hOQFIS9ZwDlfqcEPU2u6/0U6f+4vaKg28Ty67w8sS79mKQaoSOwUl9nk?=
 =?us-ascii?Q?0p1O1gRrRWKO5zdhJHwvT90dRst/STy6HMdhxHGmtO8WmEp8iRn2jrHYUBJz?=
 =?us-ascii?Q?oh56bzjKfWRcEAKS5htf1skpwe2I9WQx6YCsNIGUMkYz1hXPPPcQcauRbDLi?=
 =?us-ascii?Q?q1fBCFKKyYLNP19WXyqE0ycH4QVLIUCd+/9HCevSo3U7Mnd3K+yiioOY+0sl?=
 =?us-ascii?Q?UthayqseA1d9fLnwT7bpFcgacdh3/nzC2fmWnQQxbUgK8p2DCN+sqV2rSDnC?=
 =?us-ascii?Q?tPfQ7+yB1FOjId6fq+ho5j28edOS5l3fwVa7DLEMbSSryF1pbezJAW2+RA3V?=
 =?us-ascii?Q?KNaDRcumjVif330NE7DFtJ3AfbNYMBxpqoxu3o0cj8WHupiUdtT9TBzh5hW7?=
 =?us-ascii?Q?J1bdipls4Y0zGeLbSXaXzUw/CdKUZ5mpKn8iPl7aVLGgRhYDKdjCKAETL+fw?=
 =?us-ascii?Q?iXqc88rmavH7ZrLh5ynEm+cNXjv/zbBr9WR/JmKkQTpY/9fK0uhWDXyzF5PQ?=
 =?us-ascii?Q?40dckLTSaLCEhwahXx47guPZIpTYxv8zoIC4KDHEGZcbDkswFDFKAKxi941n?=
 =?us-ascii?Q?WN3LQ4xazZBKcrFz+qcobjr4cXeVql52WIfCu+vnVqLSdQYCFXX4Na8rqYI4?=
 =?us-ascii?Q?JNai2SSWNBLxK3qOgbs0UzhBkbdclXhbQjlbSjOC6hDkWwO1SXwJLIARScrU?=
 =?us-ascii?Q?thbYPeIc9ozxUZqAP+9JHJbQD9A0Yrz0y3/RTh4QZxoYmBiUJWO9Vydc94z8?=
 =?us-ascii?Q?G7z4usiAMDy1JlE5sRKh98AlvUdZ8n/rCmBue0qICGIz2lc5f/vpirzuGvvG?=
 =?us-ascii?Q?Q4/cIUoCtIQBSRw198tEPJGEO6yEmwItMD8DSxR9DRCp62kOL2CFJJd6LOjq?=
 =?us-ascii?Q?OP/ESkYElE4vBPSgBBvZbZyjyxrsGWSniIT6o0+HJ8IW/puuZzu3vfvsaYEf?=
 =?us-ascii?Q?Jre9bn/gXRFL69yArUOXjhGfhIFCeRHX9/x7I92b26TcnH9oWUNdiUT/vHDR?=
 =?us-ascii?Q?ERYSOedbLOi15WC0YCqUUjLI8t/574XKVoRkLkHxoUU7pqj/fNR6G4RxX4qr?=
 =?us-ascii?Q?TgSvKJfS0NMwhYeUXX5EJI7ZJun6sQsCLeHtUiN4cWwPdnYjiT7qrJOOJCgz?=
 =?us-ascii?Q?75XObx0Yxy9VY35SgZc7PIAbuQMQ2YBulHm/raLbE/1+NqlKL1OffKUgeexq?=
 =?us-ascii?Q?vKeS49mk+X06HIjSA0K0WJGkWAWt+8z9Ntub6QdSRlj1KuLWlioJiIzVuzY5?=
 =?us-ascii?Q?NjqWxMfkRoTJmM7m6rBeguKCMUh3inYYqnniouFPhgcMc0jLs1+ulGLzCGFI?=
 =?us-ascii?Q?D4rlEW4hI7A2Mq5xuYi5fbsg6rhb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T2Ms6Tolob/Fluh10dBJxzmeIK3Uywty5DKH7HP8cfRrLE9fS4UWEqR00uER?=
 =?us-ascii?Q?LGZheb8oIYPEamdNQxJR7PEqsOz59su9/HDCXhzZeSyM6eZ+U9xqc2MgrqNY?=
 =?us-ascii?Q?GZOutlllg++fc1D1jZkUlO4gSYSh4/V5J5FE49IaZFPjdC332thnqU8s41Pa?=
 =?us-ascii?Q?SiBW/h3V2s4QAngWPa3onwhxj8LS5vpLaeNyCwDS3oBIWPtcPC0lIL46s7s7?=
 =?us-ascii?Q?hTGue0KFl2zaTtzqc1iWyscfBX4YT3DPS73OLwvc4fDsF2zq1fMoTDwomWGX?=
 =?us-ascii?Q?/9Fu0ZLyfGRKEtTjlwnPmU3OhJIdhTa7S4y+r0yqer2UdxFW5RXWLiF+iUBT?=
 =?us-ascii?Q?7llNK0s5wFX7vI7a4GeuUjxsSu/4msGwnN4QDg91afTAtIRUl2Z1DDnkJdjy?=
 =?us-ascii?Q?bow2DSII6f3mILoQavcXg34sNhQsOgpTmkiGWW+5Z4PpdqRd735i4snJdBhl?=
 =?us-ascii?Q?6kjYinovHLmTpLhCqtREuCHanMSSY6S/KO03xc7tt052iz4UH4rKl6Q9QZfN?=
 =?us-ascii?Q?r34Vk1hXo/JEUuD21uUJrnCHGFIJGaPsASyikYxoUmyPmcdLTo+5VsXDxQnG?=
 =?us-ascii?Q?AydkTkkgdNJgwsCytksRk+50pR16rYpdRRNB4GmDavLxmfow4qyysGfcLAcN?=
 =?us-ascii?Q?M8BI/vdHqSjcsx+Ls+9K4DF221moyeIyfqN+GF6v4dYe/fS9Lhei0Dwvi9V3?=
 =?us-ascii?Q?8eIKKnO2LPdZA5UxxTZYEWLEfP0JHli+XA7PeWQYAW9kR3b2LprG+LmSiG1A?=
 =?us-ascii?Q?AiK6VD9pi8QpbUMqSbEstLFjkOVCh0Nh4pJSnr2Ao8CAI18pLV7RQ4wWsUy3?=
 =?us-ascii?Q?2CWew7WnACdvL1CIyqZOF41DVnTWkl6Eni6SV9jcZqqRcMs9Skfk74oZ1iCX?=
 =?us-ascii?Q?VV53swApX4/oTElNb61e3/FEQfaW4fHVChwnyMtM8gP4ZMXTgiscB+nl3ndQ?=
 =?us-ascii?Q?iaHUJrdRMYofAxUX+25YwI6PsipUiV1+MZpPJ+95tpGmuvf0edLoEwnu7BNL?=
 =?us-ascii?Q?WPUDTLME/4Vz/Lyrv0+Gv6cw+1UGFEpaKuAJHebQq/djjsFCNl2SYwSca98q?=
 =?us-ascii?Q?7p4NToYEPpepOLZIaRnyp0vIcmtGdJc3KjVPxrYE1seoUireVbIIoD9JeaAz?=
 =?us-ascii?Q?gLcNlbFjkPVC1B4zeF/JsWGH/lL94eANXGuCnhcPnwMS2z61oX3L+CsSvbTX?=
 =?us-ascii?Q?kcPrcVk3KkPGhKiykTGh8GyG1GqUc1QFh7d5O29HCVnUoJ3M+1QrPd0rjjo2?=
 =?us-ascii?Q?yI/SoUBgYE0RtEVDSj4SKoCD3mQT1T8pVW0xkuf3FZxIds0pYra8LEF4T9EG?=
 =?us-ascii?Q?eRsqJoS2n2cG0+YK+0LWfeaEbDCwDAdpmhf99fGaB3I57sF77I1WKhivZIHc?=
 =?us-ascii?Q?VIdxL3j5Gat2cBao2rsd6T9zmPxfVftT8C66aaV3uzi3/UO59a0JqESDuLrI?=
 =?us-ascii?Q?w+nYWV/aaI20i8S0+a1nsofN24gpp9fmwLfrKMQjf4uoyyBlo/u+rPU5yT8x?=
 =?us-ascii?Q?SU/x0+h2hvLOQPTGVDKg2/x/L0d3V0wkeBaAF5i+VUXw5tkLSmajvfKZZIyW?=
 =?us-ascii?Q?49VeYRDXLZ8YsCymJpkFMTEp1z88dXZ+704TvuL41BP292B+3hflfxqUP0Lp?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f684d0e4-446e-4a84-234e-08dd6e25316a
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 18:20:18.0330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YA4VhA7PT6hYiu6YsXVfwt4+Fhf/5QqiZKXTN4nPa8/PAA6FiA+4mz4Lrnwwxi0zNC40J5//OgLk3Gi3uLDt/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5192
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

On Mon, Mar 10, 2025 at 10:46:19PM +0300, Dan Carpenter wrote:
> This line is indented on tab too far.  Delete the extra tab.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushing right now...

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> index 5dc0ccd07636..d550eb6edfb8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> @@ -230,7 +230,7 @@ int intel_gsc_fw_get_binary_info(struct intel_uc_fw *gsc_fw, const void *data, s
>  		gt_info(gt, "Invalid GSC firmware for MTL/ARL, got %d.%d.%d.%d but need 102.x.x.x",
>  			gsc->release.major, gsc->release.minor,
>  			gsc->release.patch, gsc->release.build);
> -			return -EINVAL;
> +		return -EINVAL;
>  	}
>  
>  	if (min_ver.major) {
> -- 
> 2.47.2
> 
