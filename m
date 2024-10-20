Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE599A55D1
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2024 20:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DCF10E0C8;
	Sun, 20 Oct 2024 18:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sa8okxJ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D962510E0BB;
 Sun, 20 Oct 2024 18:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729448776; x=1760984776;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vU8FeWmaMoZ4X8Nua+UuaGDJH/V1qrXrXVX/I3JFS7k=;
 b=Sa8okxJ5uXW+T0uaSGw7wyDCg1oy5aYKXL0ZDcJN7QMZ6Sa1E+VlxiFL
 MhMtRVUbc7vgEgxPwoCQMZ76keH+sHCg/cj98OK7yityE9QopwT9TYn4x
 PaOiImekKp93mO8BfbSlRGCWwBfhW/FKAvE6D2FkpRKQuhK/oQFnplZu1
 E3F8ZV3CDeDz0IiVRKhLX2RNFFTRBWHWPBcvcNekWRJnSJ2fbh4KbjlT9
 Ga9XDhauScIWKTx9KpGKZ2E07fr8grs6p6NLCjiqBbE3XhomtCDgMJZvL
 D2TyXtCq9JO3ks+NCqToJJRtQeTNPM2hKdHqrUE9zHHCO+Tx12kf0gqkY Q==;
X-CSE-ConnectionGUID: s5sg0RLtSIKcd9cv8nwXuQ==
X-CSE-MsgGUID: wBB1eoQ1RTqOm+iR6u/R4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32611972"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="32611972"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2024 11:26:16 -0700
X-CSE-ConnectionGUID: kb8VQ1+oREWtuhGZszqfSg==
X-CSE-MsgGUID: v9ejD3/aQ0qz/0amTcwMGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; d="scan'208";a="84114767"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2024 11:26:16 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 20 Oct 2024 11:26:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 20 Oct 2024 11:26:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 20 Oct 2024 11:26:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 20 Oct 2024 11:26:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 20 Oct 2024 11:26:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZMzCv02O1cXnsYH3vFuw9/NP5KYwXm+x+TW1IibIu5p7wQYeXlqmfuTs+bYCcu3nHf1+8iazEJAxgojORrPA4VpBEA9nQh1ObVahyph5RNO0z5lcSTqNLv2By1cckKCRscJBVt7JuTPwmy4VU68ndWGo0Yeul5BHVHDPRQwyKB2oWya5ol/9B2SnmNuor66Tp/MqLuPMOtP7uttRLsV4lu4wjI9UBwFND7Jqbx2cgv2/WMjf6A1Cm0lPe7sjaFgP3z0U1739pgxekugChQNzLg7Sq1qRZanA/dLLVvRsufjfTA9dfN+Q6T4Oirmy+8xhq+b/M+Pd/JRBLdSuJnOjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwDnLjEdtMsBc7hCPh8iy5q8B7Xj4CPvAN+LTa9nIL8=;
 b=anUp5RcTKZvgsPCDsld5hcccJWnkdEwzgBwReJ9CiyinS63u3xGrc0EbpmstTH/xDmCygNryyOCuwG6QSJ1m/e9i1h9Yy4M2mlR/H6+xXy6yPISzI/iwDHMrgsMDUze3bjU6XtBcX4HtY3GZ7G7JWEzKMODCckxpXynAhVk7uF0snGPo5ArGc0jyEZmqjoC3BFhd8xtoo/nSDbm946Vq/eKcpkq4AfOD1xcaHStaFniNw3gJbyX+frC9eWMIo78SZcUWc5XgH5PutnmjCW1YlsiI9o2bGQeakqs5YFmanj375tKMwhTJorLcv3+x9+Mns6aWjS3k9pF/2PfXXWPF+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL4PR11MB8823.namprd11.prod.outlook.com (2603:10b6:208:5a6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Sun, 20 Oct
 2024 18:26:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.024; Sun, 20 Oct 2024
 18:26:11 +0000
Date: Sun, 20 Oct 2024 18:25:11 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1 5/5] drm/xe/pt: Add an additional check for dmabuf BOs
 while updating PTEs
Message-ID: <ZxVLB/71cImZTRhl@DUT025-TGLU.fm.intel.com>
References: <20241012024524.1377836-1-vivek.kasireddy@intel.com>
 <20241012024524.1377836-6-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241012024524.1377836-6-vivek.kasireddy@intel.com>
X-ClientProxiedBy: SJ0PR13CA0085.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL4PR11MB8823:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a87aee3-14cf-4739-457f-08dcf134ac38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8p2z5NRlJ2v5Uz3I/75Ine7kcaSzM5D9cEYFIpFn6cHIjoKXEmwBEFelwa1T?=
 =?us-ascii?Q?f7wW8uzNNidoiBJNg3VjsAHfP+wW4xHr8H/O2clm7IY0lDEh/WMko+9c31dB?=
 =?us-ascii?Q?3C1iV8BfxCk6hmzuPr9XknAcpu8WM/LWRo8OXM60FJlqEdJBs4oGJGBJ/uaf?=
 =?us-ascii?Q?26JjeUA+xo+uEjfL2vtBWh8g1cbP5alY1NZc/hw7FlfFXWSu23344fONYVY0?=
 =?us-ascii?Q?ehVH+y8K8hwPzjmwwAltdmdkxpmGRW99rU0SOOS311gCjZFQ1ldXlq1BUXpK?=
 =?us-ascii?Q?uRUg27vA8shOnEFGgSVjxPlQUrPBf9mQmaHur8vku2NIJZ7aahYYjMhaDxRe?=
 =?us-ascii?Q?xEOUWQrVw12XFFWgFqgeOwhxGZJcz3fuxD5HIThFVXermylo18uJUHl5WuRE?=
 =?us-ascii?Q?dOQTebtNnizcQhJgZlgJ3p5aISS76ODTme+Oa/XO8senqQI7A4NrJnosqcFR?=
 =?us-ascii?Q?OrwtBJipbL2QY+oJ0xXA6Ibp8uNvVua/X3wT4Smq2apymEIhIOG1XdwtV7aX?=
 =?us-ascii?Q?d2AyctqZEBKL9tOBVNg8fl9H2MSQ7X18Z4hh3ejeur6KfzjpYfLzAsQJ78te?=
 =?us-ascii?Q?/39Q5wfztTRQuRLW7jsI1cLfE+bJemk1PS604/ZkW4AYoOCAsKClCRLHjlrf?=
 =?us-ascii?Q?jHZRGQFy0QNok/7T/NNrPEudpvEfLAzQVw24r0pas+BLqjHo3YJ3/nwMEdGI?=
 =?us-ascii?Q?bDrMI1rO3s/Bcd0V5pHpMEojroSVOBTVjTkxb+zJlCZcQTYy05Z6HdFQs0n0?=
 =?us-ascii?Q?WNEABUs8K+Og3gFWCe8bY3H0VIrTYEjQ3PwxmstENXI7K1EPR8zxvgzrj1/h?=
 =?us-ascii?Q?wAfQoyV0dzNyOuP2z+xe2jWXwUWoZiSL6u8/zsQGU1Ygki/kA9TX6UOPt+oD?=
 =?us-ascii?Q?6/JNf+wpGx2aGgjnvQmHIVPA/lMOMWH+JeTu1lNoHauuQTTnwCzYGPr7l2RY?=
 =?us-ascii?Q?P566NYRdb3dqtvC4FldPp3QmnnrmXl/Pi9CJ2y0Fr8xZBmL1rj25Ufv8YDVZ?=
 =?us-ascii?Q?b0TAUuKDS8eU8rxN08Oy8gggmHOFyq3PWDmI46qIvKfy+NbLTjezaZTY0cMK?=
 =?us-ascii?Q?XzsIloZSuF+mkfSOhyAtNeQ5ZTzl0rtx7s+/QzVpk1mwtZGT9A37IzYbEoVC?=
 =?us-ascii?Q?YLy4U0Mi1/GPkrrCOh4FlcBtzIH1Lpf1+FLCLuLRRXkto5jB4oF2h88cg2jg?=
 =?us-ascii?Q?ZpNJspnKcKipoCXlwozn/l3dHO5KzmLgLXgmukcycx4QjK+yEw7nWLztHGLt?=
 =?us-ascii?Q?91DxMZwWDj3g5Yh9vV9q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rBaHAZ3BEV6Kg+1026n9VgojutCWztImO4jnydwHMPPLBSjYjZ41mdHA9Lj5?=
 =?us-ascii?Q?VtE49nIz5g+8fCSdnAOwXiZ/J3drv2R4EGAXEO4AtdebXjHChOLBWohrs5cF?=
 =?us-ascii?Q?A0yUESmiDPQjIfMt9tmzOrlvHVrhxLcNN/09AkrDIFbLCB+DA2BFq/38R6U8?=
 =?us-ascii?Q?97IEFPYsrQ3x7/5jWS++MThmeng6l0Kb7UqKavRFAL2cRQ5mNU45IR2/hc8w?=
 =?us-ascii?Q?f/mZnUt4MUAFMCZ/UN11lx/LFxvRKxVZXFwoc3gNPe7rJB2JmkSVW3mbzXS5?=
 =?us-ascii?Q?cD6Nd9yHAARSi6S86MRnzrbv88pzwgkBrn9sSExFC+HNojp/x8a3CTpIV25S?=
 =?us-ascii?Q?uh/Ix3iF+c1vRcxjBeS1vetP1Xh3zil4mZlkTHta6xmK/90rXuZLlr/V0UOZ?=
 =?us-ascii?Q?MturdEwI01A3b61NZpYR9cAbChfebVbUj1/zTF1Oy3njwUflZSMKFULglDgf?=
 =?us-ascii?Q?pSQkPCuxNfEXo4GTMol3j0DjSpz5kiH3HjezDT4TsjPYdW7FbSUkpkcu4RHm?=
 =?us-ascii?Q?ofmtFXAEULlQIq8HfpxyAMfQEpBXLRI9Cuukrn8cHIop/Zonp8aOEbj3rhh1?=
 =?us-ascii?Q?fEu+kZKyOmTGb1Bk0DFHvThMoNYcLMqDBlTsBc7m3Pxgbdarlw/1hKBmntkd?=
 =?us-ascii?Q?BX2mtLGXOqJJfPcEt3Q/rQFYz7hrMNy8vIHSrczNlcyUh9ma+hdrDIRGlpgk?=
 =?us-ascii?Q?WD96I6RlswyJjWzzSI3sMFp2jzHcqrgdUzCpr+B9pYQ1dMe0NtEzCDEb4AzL?=
 =?us-ascii?Q?PKILXeMGfEknsOeDQVlLXJCJVwrc4vKGs40C6RPdX8hie8xfL2LqzWUnZzm8?=
 =?us-ascii?Q?YCAfvzCVIYpziiThp7tt4kC/a5d0bWddjNHPvDxCc2qmYTbSOkNEfQOQaEDk?=
 =?us-ascii?Q?anJpSMTrQL5PyLvjC0SnGoPISwQ56zL7gkSiakbG7tDDjDHC/Lj/Aus3NhEw?=
 =?us-ascii?Q?8gSRgEUefvSiBA5doE4AKyxTp/sOUphnkkmrtnQPU75z/hQ9+i2LFJ9xEJpb?=
 =?us-ascii?Q?eoPIQxg175Qw+v4cUMTVO2+neZlQczy2vJ+fpklrN/KBkjnZ6Ts/gNW49wn/?=
 =?us-ascii?Q?+2VhWvuFSU5XlK3+MSBFHK2JPUDBTnZiBp6RAakGp3rl2SS1UWoF7XuO04To?=
 =?us-ascii?Q?5FDe93lsRf3Ei4c8p5vsUaCed0rihpN0ZZttTgX/DVVaCJI3SB2qGgUxRFvb?=
 =?us-ascii?Q?4mp/PRLcIb4Lep8dXVhShMGOIQqWTX9asx9V2yeyIEP1OiHymaYIm9Of8bOB?=
 =?us-ascii?Q?nrPbI7tveMmDTP5PYT8EeM/We1Lq4EXhcZVN81/SpeE99qm2WVCi8qtRA0le?=
 =?us-ascii?Q?eEosB/zFgRjitM4vJmoqGrT4DH5Rioju5cwW/H+OEpONzh3DlwEBfTfHuD2b?=
 =?us-ascii?Q?7i4TrhU/o+6S2IJOmi19APqr3d106vim1J5xwN+6zV6LL/q8sowzrk351smK?=
 =?us-ascii?Q?n/7ytHEFHMCE2sltsrzchLx7n6p1SJQ3XMpYb1R/xWzQYRVXwmm/x0L13E7Y?=
 =?us-ascii?Q?MqOKBUOA6I8jvrmKDQVqsNaljDfyMJHZIqGGGO7WMa5BzqYd9XewAod3fe2o?=
 =?us-ascii?Q?zUOXcG067dnJp4d57nZXsqt5tfujY6ZB55u9f/iTx2Xx8QQPiisyQnOz085m?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a87aee3-14cf-4739-457f-08dcf134ac38
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 18:26:11.1377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08QnhGVzQDbb0nInwPeS5RtncvFv7167ywxkRFY7F1NvAVR6jUh6KQKma7bSoXEQlcwJ/yEts+jg1M9SGpbBRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8823
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

On Fri, Oct 11, 2024 at 07:40:27PM -0700, Vivek Kasireddy wrote:
> If a BO's is_devmem_external flag is set, it means that it is an
> imported dmabuf BO that has a backing store in VRAM. Therefore, we
> need to add XE_PPGTT_PTE_DM to the PTE flags as part of vm_bind.
> 

So here if we land on a DPA cursor [1] we'd have to update the bind code
to use this cursor. Again I think this is my preference.

Matt

[1] https://patchwork.freedesktop.org/patch/619451/?series=139920&rev=1#comment_1127450

> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index f27f579f4d85..909e5b96d518 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -660,10 +660,11 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  			xe_walk.default_pte &= ~XE_USM_PPGTT_PTE_AE;
>  	}
>  
> -	if (is_devmem) {
> +	if (is_devmem || bo->is_devmem_external)
>  		xe_walk.default_pte |= XE_PPGTT_PTE_DM;
> +
> +	if (is_devmem)
>  		xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
> -	}
>  
>  	if (!xe_vma_has_no_bo(vma) && xe_bo_is_stolen(bo))
>  		xe_walk.dma_offset = xe_ttm_stolen_gpu_offset(xe_bo_device(bo));
> -- 
> 2.45.1
> 
