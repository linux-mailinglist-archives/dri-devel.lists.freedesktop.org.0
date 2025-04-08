Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0ECA80F17
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 17:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D3C10E6DE;
	Tue,  8 Apr 2025 15:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b/flR4sh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC5010E205;
 Tue,  8 Apr 2025 15:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744124416; x=1775660416;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=PjvtRC4AAerVzoBsOKaHRS8c8Urdv0S8BrdtUI3gmEc=;
 b=b/flR4shfLVK2InV8LL8h3G2SpVVoTjFG00uIoCFpR2qhs5oDIjTfjfa
 BW6LIH3fiNZfpu04qfLsw9NxTcrPe83qWGpr7/zDlwSw+to5kn+eDbN9v
 uQZZbfDKklUYqG8tQKYA0680sCWHFVkYJ72UV1EJVUX1WrpUKo2YM/t2B
 e6+1b8QMM2afSdJ+Vf8+ue6CKzAjyfnZ5MqyEDe+Dh3MNmMMFyNZt8kZT
 e3CZfxVL28z8Xlbcgm4AiI3feOrtqi9sKhIFNoeh4RwTmEbIedNuWqOOJ
 WNNo+Vo3fxGXPjsRV3QY1X2I/XosDhBHgCvGMn2t9dKEkVsRdljKwhqaD Q==;
X-CSE-ConnectionGUID: Df1bywx3QSut87dEXGS83g==
X-CSE-MsgGUID: yKYFlgc3RUe896AfRTy61g==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45450301"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="45450301"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 08:00:13 -0700
X-CSE-ConnectionGUID: qInWGUi5S7WmGTLPCPPKyg==
X-CSE-MsgGUID: YTRdTa6rT2aUJ8SWmwHEow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="133019160"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2025 08:00:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 8 Apr 2025 08:00:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 08:00:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 08:00:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGTsAw8WDGFa6n2qTm4ZABeRveHB60Z1Xw2RHTQTrPv6LZoSScFUv/qvUkgAA3P6KW5vwi0aDydRQQu3T7Gki983GowQK1lXcWsDzEt6ckbbxyvbvWAlwfynD2+c44BUHOzP+2ev5o1jaUTO1GBJGd+cSFa5XEOqcyWX9WEb8ObFaJRBoKC5Sw4VJsif4Eej5S2PJjs3n3tnojHyBuMRGruUEQGJ7xOZdgEfOZnskAAcglyc6vyvPWJTfg67Jgcjpar4pGIuJ5elbROOJuHtpMY0e8eCkDtNN8RemyLAv4Z5PjxfWtHewtpJzZWha1v0Y4H5ZSMuyu+zc/xcU+6PeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEqaozaSQ/C3Z3iH6IHuTBdNHzlpmPUDza0+aiyu1CI=;
 b=fTjI5uUKpx7kI5koguaIpk0YNorjC75hwoFi8894F0x4IoZNLf6F7n0ZDGB5KK5CbeIZQnQmzS0IqQNsDVPja9O5YzlvmvrO88K38sLs3UOFwoUYZcBtQcWAHwSkw5zRAl60I1aV/YI3+nbmty4xDhIceYa0HEU9/TvdhBtwNc9j3qkiPpsgOJHxVk1V09dsUeUYnPOtdFyceG74dAh/cYDd1+2BnyUJRuH/VTliHqUVYK6Y0NlMfPNfZ/bPxIHdVC/+wuNKbAhHK8Dq99HPivaV/gBrO8ISVD7nN0Bx+p0awc07T3NHoKw0k19m9PqGx2kIrSKNSW93A8UiQLej8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by MW3PR11MB4556.namprd11.prod.outlook.com (2603:10b6:303:5b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 14:59:53 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 14:59:53 +0000
Date: Tue, 8 Apr 2025 17:59:54 +0300
From: Imre Deak <imre.deak@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <vinod.govindapillai@intel.com>
Subject: Re: [PATCH 3/3] drm/i915/audio: move min_hblank from dp_mst to audio
Message-ID: <Z_U56mE3pJgP_m7M@ideak-desk.fi.intel.com>
References: <20250408-hblank-v1-0-4ba17aebee65@intel.com>
 <20250408-hblank-v1-3-4ba17aebee65@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250408-hblank-v1-3-4ba17aebee65@intel.com>
X-ClientProxiedBy: DU2PR04CA0017.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::22) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|MW3PR11MB4556:EE_
X-MS-Office365-Filtering-Correlation-Id: 90ad84f1-167a-49fd-1ff8-08dd76ae0497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1bbAkGGxJkU33xfRc/fDD1hoF5Er5K7Rp87LzdsmlJS5k5NrwQ2bTE3is4x2?=
 =?us-ascii?Q?OWaiJJQBR6RrJDn7e8vKnSq2EXXTwxfiGKg762DKilsNdD1tn53Vm72fIE8T?=
 =?us-ascii?Q?k/3q1fA+jx2j0iC9muB7CFvGwZHUSspypJeZLuQS+aL7p0aQjmCLLcP5wYPj?=
 =?us-ascii?Q?VHEiv1UhaM23coegUxPze/ORiNjaDk0H7GkH7erOrLX3j+cYBkAJLQ128yFx?=
 =?us-ascii?Q?58KNNmatamC+ys95Hhjnh3zI7zm3tsc4fDdHQA5E6Ckmr8ruMiiJIa8ILLtJ?=
 =?us-ascii?Q?i5ZH6/KaC7HtimpcbOCkcujMUv3qv2/bEdiWN8BVcBsjXZW3UQwDms+6G+N/?=
 =?us-ascii?Q?X+yMEqjC61Ij85m4PywmlUHRNzoR82B1MnmsY84LmUiK7x+mIytXuvGB8a1V?=
 =?us-ascii?Q?D975HeEazTMKrTdv4Br4BZ4cZcCByPQWV5519DdAKvMm1ffR5J6AwcquUL2s?=
 =?us-ascii?Q?aeRYtTdszoTCzKuJt1EpVhhr73/6hCUTpEV8NufysUI5FF+J1RK2eMziDCQj?=
 =?us-ascii?Q?1SsB3nuydyJLpPQr08fQqQoPNq5+4VILRrlAfYsPatLcyMsQ7Q6Kn7uCyJC9?=
 =?us-ascii?Q?u4uU7zvvCqC1wB/72avNcJec8wdrknnKrQSDr1vSkXw1zTNLvvex9ZxNnOtS?=
 =?us-ascii?Q?5sFzScNj9bQRLCW6oNhj45rO4ItkGs8aj/YS2jfr3cJDFXyXBdUU/SWzxlig?=
 =?us-ascii?Q?BobHotjenElhK7RU6QIWRmoYZoDf4ZzEyaJkf5x8lUYedSm7Zt017hGqO73G?=
 =?us-ascii?Q?43h6RpLtfwnVHecD0FWfK5Ijqp2XRNM00S92PD7jEIdMfJQ+NCii7fBYx0/Q?=
 =?us-ascii?Q?lYar1OI7za2wQ9O6x+R/dMVst6rx5uR+aw302fmEqrCuY771HiM8biQwwzvY?=
 =?us-ascii?Q?uiq/AQFtvOvg8YkfRJkp5dMAda2aE6vDC7ocR4BNNnghiHzbr/D+EqIO9V6m?=
 =?us-ascii?Q?baMDlwdddF8VmwzVBqIbH+eVpCkCSsAcQBGOKCbYmlHj5rdvcCiyCS2LCNo7?=
 =?us-ascii?Q?xX3aHiHhdHmae7HmESHRLbCzWCJPxTfF8+gSej2B1NaqKnGlS/F+2FqzTeDR?=
 =?us-ascii?Q?C8NG6z+jiYTPiNjHn8O7bLxlAz07xyE/MuPpUb62sxO0EkeyWlYkq+3BwFDo?=
 =?us-ascii?Q?N+URKZKW+BHpZscB6qK11pWJ9TiOAXg77AitVfrI8J9rGwrm4jViRXDRGpbX?=
 =?us-ascii?Q?qoNA7fwghTpDIUbCSgDKRhSX55EJq4/UI66SyRGHWT3SG611q2lQJjxsLY0m?=
 =?us-ascii?Q?mXKO8+jvPX4/5yBthF0YsBQayOHLlHs2evmO6pHCgZ+Jd9y8HMuXrQ5GaNlZ?=
 =?us-ascii?Q?8nItzWdkqq5Npg7DnE3v1+Q8SLl0n4yaGuORH/F7Gfb35tNy/7xq44x1ngd8?=
 =?us-ascii?Q?RoTc6+E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eaEX1sIzvdL/xmsuAAsk4RgsYIGIAukvXhssoYWr+Oe3kOXvVHlj889Y6y1B?=
 =?us-ascii?Q?yHEieheKtNqPYR4M4l1E6GGFZE3lxWBdM6nuOV36UH0HpoGVbkdZ/0ZFRy/q?=
 =?us-ascii?Q?EwePn5ZHLLQe/xPXurybnhXH1863NpVSl35ewqFWBRamy/gdsdM2AQnXNYjP?=
 =?us-ascii?Q?Q/mL6tC9fnmT+PT1bK04kMnUo9fZgLgjO5BuroohFDo29SafPWOQqM4G/N1c?=
 =?us-ascii?Q?lLWcgoOdiwEBKvolpmxDnuklgINRjmVCZGaEnKyvV4T9JNuCokXy9GnXAJlo?=
 =?us-ascii?Q?6+fryjF28IAkoxwL7jyLRZw+wfHbDsfRzk6oYXdD8A0zcFawdY86XoauZRG2?=
 =?us-ascii?Q?QnrRSxRAaTRGOUQgu+lzl8jZh673SLtXWJ2wefteHgE+/F3lslvojLNllv0B?=
 =?us-ascii?Q?6KBAkkhkzAc8sHg0CTHjicQxQ1+aJGGQgeS6Wg1acY3UWYYgIceZacmDHVdG?=
 =?us-ascii?Q?Eb68GRFWgikdO0AmQai1c4PLqasKQL+Z44DRqhva5GtpskJs2wW7uNC1GFBt?=
 =?us-ascii?Q?9a6lrCzt1wtLhpUQQVsou2172n+vn0zrAH4gDgL0tg7BekBykg8wvHEYnNnf?=
 =?us-ascii?Q?Rftk9qx3WZsLmAMUrzfatslixIfpSUb/IRaVoLgvVGvRU5mu/tpvLFrYwsVI?=
 =?us-ascii?Q?eryuqdAfbwYh53qcI9AMItS3gH4fCFuvFjS4sJiayrF4reUVris2B15f9+0J?=
 =?us-ascii?Q?spuK2fmucQ57HsTvGs3oqKFtT58TTRZm1T8IOh3ZjNI6F+L8V3LheQGToOw3?=
 =?us-ascii?Q?QHTJnh0DgVFThmc8PZXToxdEBTkHmRK029VU7KNRlVVZu9Fn7uISOMIwJeff?=
 =?us-ascii?Q?eGGufg8AeDXj+inuOo8gphOvpQSNvuGcpcTqjTagd3baV2S0amTyepXH1Fys?=
 =?us-ascii?Q?PPeNVJxBRcX6jW2zE7A7I3a7NUQ/5GFd0xbwPVM5unHZ0KGzfZa9wQY6v8Wg?=
 =?us-ascii?Q?F/VocdFEWwixb8/54F23C0RkwEn4zKNzx2ngbscQA9pZ0FOQHwQx6sxQbBUE?=
 =?us-ascii?Q?CJ+gaA6MOgImnQt/x7TzE2sfeCzS7IPSlGptcxw9ojnSIrous/eZIK92gtkf?=
 =?us-ascii?Q?VacqdVz+qPto9e+ZGmi2+soW7TGgh+lSHb6xJb44ZWUbb/5Pqk2jVEod6jpY?=
 =?us-ascii?Q?75MwigSHxTshNUEIon2ZYWGd3UydtOHE9CqSyqP5LCTUgIt0jiYL5ZB6kLkt?=
 =?us-ascii?Q?XpLeZ1CJTTx08+zmbAY/kocQsJweNVqJqT/YPq3cyy0ufoc6WO0Dq3VT4YUb?=
 =?us-ascii?Q?e5zFxm4TjeOIAxRU2GXA6x8Y2z4YJV8IuerZLmCbn5Xrjvjj+mHuPrBNQJ5w?=
 =?us-ascii?Q?HmDOK7ghBNJUiRgy+lT7QkNYuMiZicqYskJiNXM9ToOafjHt3O/bWgWyGV1P?=
 =?us-ascii?Q?twGjp+RthynVFDZ3N1HfKST6bPfsCPwIwMpTrQYiqLOCjObXiV/3wK0cQIyy?=
 =?us-ascii?Q?QLqXUCYPYnskoNLxXuA2g6YG2KYWcD0DPiJg6hXl3aC4aJ8WRtryoZZMtgrA?=
 =?us-ascii?Q?OamBiNOOIn6H3BPpXhNZiystEMTd8B4JZsQhVaA8jt8Ik7nPB981+kV+eI5Q?=
 =?us-ascii?Q?01Pc88XM3IHjc7KGrAmrOp6BOlxZ1jLXTxfRe1xf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ad84f1-167a-49fd-1ff8-08dd76ae0497
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 14:59:53.2045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: du2QMplQLM4HWpfDiUFb59OhZOfLjmdDvEqzqur9VLbtKz8iJUSEr3E6enbIRAUN9wQo1TUFp6EwMF+No7aY5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4556
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 08, 2025 at 09:40:36AM +0530, Arun R Murthy wrote:
> Minimum HBlank is programmed to address jitter for high resolutions with
> high refresh rates that have small Hblank, specifically where Hblank is
> smaller than one MTP.

I wondered if following the standard practice of one change per commit
is indeed not practical as you do it in this case.

> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_audio.c  | 78 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 51 +------------------
>  2 files changed, 79 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
> index ea935a5d94c87202a68f84b28b0152835f47fe73..b73cb208a37c6d4928c1ce16d2ab689626dcbbc5 100644
> --- a/drivers/gpu/drm/i915/display/intel_audio.c
> +++ b/drivers/gpu/drm/i915/display/intel_audio.c
> @@ -27,9 +27,11 @@
>  #include <drm/drm_edid.h>
>  #include <drm/drm_eld.h>
>  #include <drm/drm_fixed.h>
> +#include <drm/display/drm_dp_helper.h>
>  #include <drm/intel/i915_component.h>
>  
>  #include "i915_drv.h"
> +#include "i915_reg.h"
>  #include "intel_atomic.h"
>  #include "intel_audio.h"
>  #include "intel_audio_regs.h"
> @@ -37,6 +39,8 @@
>  #include "intel_crtc.h"
>  #include "intel_de.h"
>  #include "intel_display_types.h"
> +#include "intel_dp.h"
> +#include "intel_dp_mst.h"
>  #include "intel_lpe_audio.h"
>  
>  /**
> @@ -184,6 +188,62 @@ static const struct hdmi_aud_ncts hdmi_aud_ncts_36bpp[] = {
>  	{ 192000, TMDS_445_5M, 20480, 371250 },
>  };
>  
> +static void intel_audio_compute_min_hblank(struct intel_crtc_state *crtc_state,
> +					   struct drm_connector_state *conn_state)

I don't see any audio specific parameters in the calculation. This
function is also called for non-DP encoders (HDMI) and for DP encoders
it's called only if the DP sink supports audio.

Isn't it supposed to be a generic (not audio specific) DP state
calculated elsewhere (intel_dp.c)?

> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	const struct drm_display_mode *adjusted_mode =
> +					&crtc_state->hw.adjusted_mode;
> +	struct intel_connector *connector = to_intel_connector(conn_state->connector);
> +	int symbol_size = intel_dp_is_uhbr(crtc_state) ? 32 : 8;
> +	int min_sym_cycles = intel_dp_is_uhbr(crtc_state) ? 3 : 5;

Would be good to figure out and comment here what the 3 and 5 symbols
stand for.

> +	bool is_dsc = crtc_state->dsc.compression_enable;
> +	int bpp = is_dsc ? crtc_state->dsc.compressed_bpp_x16 :
> +			   crtc_state->pipe_bpp;

This looks incorrect as the units for compressed_bpp_x16 and pipe_bpp
are different.

> +	bool is_mst = intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST);
> +	u8 lane_count = crtc_state->lane_count;
> +	int min_hblank, htotal, hactive;

I don't think it's worth adding separate variables for lane_count,
htotal, hactive.

> +	int hactive_sym_cycles, htotal_sym_cycles;
> +	int dsc_slices = intel_dp_mst_dsc_get_slice_count(connector,
> +							  crtc_state);
> +
> +	if (DISPLAY_VER(display) < 30)
> +		return;
> +
> +	/* Calculate min Hblank Link Layer Symbol Cycle Count for 8b/10b MST & 128b/132b */
> +	hactive = adjusted_mode->hdisplay;
> +	htotal = adjusted_mode->htotal;
> +
> +	hactive_sym_cycles = is_dsc ? drm_dp_link_dsc_symbol_cycles(lane_count,

To get LL instead of ML symbol cycles as required by bspec, you should
pass here lane_count=4 always, independent of the actual lane_count in
crtc_state.

> +								    hactive,
> +								    dsc_slices,
> +								    bpp,
> +								    symbol_size,
> +								    is_mst) :
> +				      drm_dp_link_symbol_cycles(lane_count,
> +								hactive,
> +								bpp,

This expects bpp_x16 units, but pipe_bpp that would be passed here has
different units.

> +								symbol_size,
> +								is_mst);
> +	htotal_sym_cycles = htotal * hactive_sym_cycles / hactive;
> +
> +	min_hblank = DIV_ROUND_UP((htotal_sym_cycles * bpp),
> +				  (4 * symbol_size)) - hactive_sym_cycles;

Not sure what the above division adjusts for, I think it should be just

	min_hblank = htotal_sym_cycles - hactive_sym_cycles

> +	/* minimum Hblank calculation: https://groups.vesa.org/wg/DP/document/20494 */
> +	min_hblank = max(min_hblank, min_sym_cycles);
> +
> +	/*
> +	 * adjust the BlankingStart/BlankingEnd framing control from
> +	 * the calculated value
> +	 */
> +	min_hblank = min_hblank - 2;
> +
> +	/* Maximum value to be programmed is limited to 10 */
> +	min_hblank = min(10, min_hblank);
> +	crtc_state->min_hblank = min_hblank;
> +}
> +
> +
>  /*
>   * WA_14020863754: Implement Audio Workaround
>   * Corner case with Min Hblank Fix can cause audio hang
> @@ -715,6 +775,8 @@ bool intel_audio_compute_config(struct intel_encoder *encoder,
>  	memcpy(crtc_state->eld, connector->eld, sizeof(crtc_state->eld));
>  
>  	crtc_state->eld[6] = drm_av_sync_delay(connector, adjusted_mode) / 2;
> +
> +	intel_audio_compute_min_hblank(crtc_state, conn_state);
>  	mutex_unlock(&connector->eld_mutex);
>  
>  	return true;
> @@ -778,6 +840,19 @@ void intel_audio_codec_enable(struct intel_encoder *encoder,
>  	intel_lpe_audio_notify(display, cpu_transcoder, port, crtc_state->eld,
>  			       crtc_state->port_clock,
>  			       intel_crtc_has_dp_encoder(crtc_state));
> +
> +	if (DISPLAY_VER(display) >= 30) {
> +		/*
> +		 * Address issues for resolutions with high refresh rate that
> +		 * have small Hblank, specifically where Hblank is smaller than
> +		 * one MTP. Simulations indicate this will address the
> +		 * jitter issues that currently causes BS to be immediately
> +		 * followed by BE which DPRX devices are unable to handle.
> +		 * https://groups.vesa.org/wg/DP/document/20494
> +		 */
> +		intel_de_write(display, DP_MIN_HBLANK_CTL(cpu_transcoder),
> +			       crtc_state->min_hblank);
> +	}

It's not clear why this programming is audio specific, based on my
earlier comment above.

>  }
>  
>  /**
> @@ -834,6 +909,9 @@ void intel_audio_codec_disable(struct intel_encoder *encoder,
>  	}
>  
>  	intel_lpe_audio_notify(display, cpu_transcoder, port, NULL, 0, false);
> +
> +	if (DISPLAY_VER(display) >= 30)
> +		intel_de_write(display, DP_MIN_HBLANK_CTL(cpu_transcoder), 0);
>  }
>  
>  static void intel_acomp_get_config(struct intel_encoder *encoder,
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index af98a0d0e8376a79ce1ab6ff3c4f6af30f4d3e73..dae74c645c1a1d716504b7843fe1a5c8ace0d87d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -211,26 +211,6 @@ int intel_dp_mst_dsc_get_slice_count(const struct intel_connector *connector,
>  					    num_joined_pipes);
>  }
>  
> -static void intel_dp_mst_compute_min_hblank(struct intel_crtc_state *crtc_state,
> -					    int bpp_x16)
> -{
> -	struct intel_display *display = to_intel_display(crtc_state);
> -	const struct drm_display_mode *adjusted_mode =
> -					&crtc_state->hw.adjusted_mode;
> -	int symbol_size = intel_dp_is_uhbr(crtc_state) ? 32 : 8;
> -	int hblank;
> -
> -	if (DISPLAY_VER(display) < 20)
> -		return;
> -
> -	/* Calculate min Hblank Link Layer Symbol Cycle Count for 8b/10b MST & 128b/132b */
> -	hblank = DIV_ROUND_UP((DIV_ROUND_UP
> -			       (adjusted_mode->htotal - adjusted_mode->hdisplay, 4) * bpp_x16),
> -			      symbol_size);
> -
> -	crtc_state->min_hblank = hblank;
> -}
> -
>  int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
>  				   struct intel_crtc_state *crtc_state,
>  				   struct drm_connector_state *conn_state,
> @@ -301,8 +281,6 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
>  		local_bw_overhead = intel_dp_mst_bw_overhead(crtc_state,
>  							     false, dsc_slice_count, link_bpp_x16);
>  
> -		intel_dp_mst_compute_min_hblank(crtc_state, link_bpp_x16);
> -
>  		intel_dp_mst_compute_m_n(crtc_state,
>  					 local_bw_overhead,
>  					 link_bpp_x16,
> @@ -998,7 +976,6 @@ static void mst_stream_disable(struct intel_atomic_state *state,
>  	struct intel_dp *intel_dp = to_primary_dp(encoder);
>  	struct intel_connector *connector =
>  		to_intel_connector(old_conn_state->connector);
> -	enum transcoder trans = old_crtc_state->cpu_transcoder;
>  
>  	drm_dbg_kms(display->drm, "active links %d\n",
>  		    intel_dp->mst.active_links);
> @@ -1009,9 +986,6 @@ static void mst_stream_disable(struct intel_atomic_state *state,
>  	intel_hdcp_disable(intel_mst->connector);
>  
>  	intel_dp_sink_disable_decompression(state, connector, old_crtc_state);
> -
> -	if (DISPLAY_VER(display) >= 20)
> -		intel_de_write(display, DP_MIN_HBLANK_CTL(trans), 0);
>  }
>  
>  static void mst_stream_post_disable(struct intel_atomic_state *state,
> @@ -1286,7 +1260,7 @@ static void mst_stream_enable(struct intel_atomic_state *state,
>  	enum transcoder trans = pipe_config->cpu_transcoder;
>  	bool first_mst_stream = intel_dp->mst.active_links == 1;
>  	struct intel_crtc *pipe_crtc;
> -	int ret, i, min_hblank;
> +	int ret, i;
>  
>  	drm_WARN_ON(display->drm, pipe_config->has_pch_encoder);
>  
> @@ -1301,29 +1275,6 @@ static void mst_stream_enable(struct intel_atomic_state *state,
>  			       TRANS_DP2_VFREQ_PIXEL_CLOCK(crtc_clock_hz & 0xffffff));
>  	}
>  
> -	if (DISPLAY_VER(display) >= 20) {
> -		/*
> -		 * adjust the BlankingStart/BlankingEnd framing control from
> -		 * the calculated value
> -		 */
> -		min_hblank = pipe_config->min_hblank - 2;
> -
> -		/* Maximum value to be programmed is limited to 0x10 */
> -		min_hblank = min(0x10, min_hblank);
> -
> -		/*
> -		 * Minimum hblank accepted for 128b/132b would be 5 and for
> -		 * 8b/10b would be 3 symbol count
> -		 */
> -		if (intel_dp_is_uhbr(pipe_config))
> -			min_hblank = max(min_hblank, 5);
> -		else
> -			min_hblank = max(min_hblank, 3);
> -
> -		intel_de_write(display, DP_MIN_HBLANK_CTL(trans),
> -			       min_hblank);
> -	}
> -
>  	enable_bs_jitter_was(pipe_config);
>  
>  	intel_ddi_enable_transcoder_func(encoder, pipe_config);
> 
> -- 
> 2.25.1
> 
