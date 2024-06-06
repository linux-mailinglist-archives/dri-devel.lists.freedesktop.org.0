Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2268FDD04
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 04:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9FF10E540;
	Thu,  6 Jun 2024 02:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VP0+MAOk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6AB10E540;
 Thu,  6 Jun 2024 02:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717642689; x=1749178689;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VFVCl/dPVGO1SLLVqQzA/h1ik7Oq/gp0fcrYF4bR4EI=;
 b=VP0+MAOk0vfNYw8cSFhNgg7eU1MnX6yRnuVlg2GKTOA2BP6Rhjd/5QUA
 +zM2G9mERRaPb3GpNNfIGXYpbvWa8WvJ7/VtQeS7QmKE/unpQCOfgC8n8
 BnxYHHmnOs4pLIQM/fzZogIB2FNSXhXU4G2WUeFHP76u52DBXFAuSSGTf
 OomXHUHNPjpeEml6mHpkI3MZuH7PVDlAGJpGTB1sxnN5BHrB1/fBkUX3v
 pbMUQGMBTnkAjllEwJxeRJnA1xrqPikFmN+4MkYs01TN0FAkfsJHOVBLv
 0khrqUoju77kO7p/uAgS2wMrnTJIMsuwSNuv/yK0tjRujIG3QA4LgKHbX w==;
X-CSE-ConnectionGUID: WRkva9XRS6CfDcrGUY9zzw==
X-CSE-MsgGUID: mieEZ/hDRs+tem9enh5Huw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="18134882"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="18134882"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 19:58:08 -0700
X-CSE-ConnectionGUID: c5eRWjbhTRSm45plWf3r+w==
X-CSE-MsgGUID: sK43K+lrTG6M4szqGzeMWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="37784786"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 19:58:07 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 19:58:07 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 19:58:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 19:58:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 19:58:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/mbtNx525FCz75QBWjl5yb6NkhxxtTY4ArrNyZdv+hyr/ybfLpCFn9W49r+g9KVEQClrPjTRnO7/5Ua2Af7bJZtt3BaMFrzXggMcYy6FRQO6jrWyTtrKTJv9SZaa0pUC3TGxqY8/gPuZ3ZqxV94O/xyqbGgdeZgoOPiF9w4Ixe9cywTEiTDv97ybhCK3ir2Wk9ACsf2NzvtIMHSN56S1G+n009A0Iua1GScHj/opxcVBrB6Qr/uuTjny5T+C3S6/H2FEFA76UEtmwt6TzFbB7hEFA9s8BDM+KUl8yyJ+cx/yUWxa1o1wXhgreC8tu/hVAVSMROPbaVb+Kv0zF39LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2IZModzkQU1Z9nxOnTpMWxc2P23mFOwY2YWbof09vs=;
 b=lVY+pJjbHqJjvN3jCqFBu0WNKEruycNIwnsKnu160ZplZZxogbt5R/DNZojjz3HQAonGkqizcKIUWbgCngJ3lN9W3feRxWVly8jBHt2Rrs3EXQ6sNns3aqXYwSq6KP2ALUgRfvznBT1bbcqmMaHHbuAtMp5RGYs9V9c6zq9y9IGRd6vZ+DGMKMtYPD8yuohtO0KQDswNoQfOiAME6T/fkZxJlRGrvUGg0scfsqCFPQAl7OCDu9vZ190KsrYQTyfHygLVcpvf67L119j07PPLBDhFkEQeYOQmjueE5DwYglCeGxpvEF2NUexCMQ/hjlhfHnSnkrpK2sh2yyqBAPeKPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH3PR11MB7939.namprd11.prod.outlook.com (2603:10b6:610:131::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Thu, 6 Jun
 2024 02:58:04 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7633.018; Thu, 6 Jun 2024
 02:58:03 +0000
Date: Thu, 6 Jun 2024 02:57:11 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>, 
 Andi Shyti <andi.shyti@kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/i915/gt/uc: Evaluate GuC priority within locks
Message-ID: <ZmElh72N2x6c/TDj@DUT025-TGLU.fm.intel.com>
References: <20240606001702.59005-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240606001702.59005-1-andi.shyti@linux.intel.com>
X-ClientProxiedBy: BY5PR17CA0049.namprd17.prod.outlook.com
 (2603:10b6:a03:167::26) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH3PR11MB7939:EE_
X-MS-Office365-Filtering-Correlation-Id: a12d1b7c-ee67-4bc9-a96b-08dc85d47ba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DZoKwWYaIWOGKPPT0knTRo/jRHGLUOcmbN/kRSYA770i9LvHFBQcAqc56tg/?=
 =?us-ascii?Q?04lLFULzN/qrhMgqMrB7GiVuRg72C+dxJ+GTrJ48F/uKkF+ykVW8Wl7WIoLG?=
 =?us-ascii?Q?xsmvDlBHp0F+jMAZaGso9Yf5T7csBfb+qkzJZuud2JVjhZF2278f0MZ+4nA1?=
 =?us-ascii?Q?42Dgo+CtPo82qXK8FJXMRjgok/hpHEPgmhjDmxzbYLM+nNU8k6ElSqWkyjX8?=
 =?us-ascii?Q?+QT69+vp85/9DMQY5ljvQfmoOOb1p9nlkqM/930hS0fkg8YUes+ZVGt2rl4C?=
 =?us-ascii?Q?dNd595D32pPhhwsf1mDs5u/zhs3FMqAxN8TEhpzi29Buvk/HI+f69RsgZHHN?=
 =?us-ascii?Q?NoMY0dw1qg8nNp/AmGh9i94EJOnmGa9mRqKzI8K6uy88rdVGlp+oOtmwWcO5?=
 =?us-ascii?Q?JLAlodxMZ7zSPz90XHcofL1u4728HKyOa53Q1LgiA6RRn3xsyU/QHypFX1aG?=
 =?us-ascii?Q?e8UmnDWDywhdum2dzIl9kkVW4oC+T0+2JispeR9NN1XyyOSU+ZtqNB1eH4fg?=
 =?us-ascii?Q?UbMjPpyN4Tms6vboy5TUmH5+SpEOLjI+y7WQ3fGyCy3OH79RjDmH+A2mqWCH?=
 =?us-ascii?Q?hcBqqXraaerra5GiygL8XB6Du2U46J3i+37lBX2ibRsnNJV4fvUD2cl1Viiz?=
 =?us-ascii?Q?JWrF6rsBcCH5d04Zb20JTxFi15exGrFirs4GZqufDPxcY+yzZJnh/XXCY3UE?=
 =?us-ascii?Q?v1lED0+A5mpnzq8Hg0lr+HgV8xx8c8EO8w/c9W4CwZ3p4w8t6WvKrDkr4pW0?=
 =?us-ascii?Q?vGz4v1sd/d6IKY/XOwp6AhrhfKisX+5C1ZzhfshjMCjUDbojT81qwt/fUQzl?=
 =?us-ascii?Q?YnGADnnsGL+XQYKIndy/guErFuhS39FLUNms0gfGRFQjzUdudoId9sfY9dQx?=
 =?us-ascii?Q?WTIBY3nX/2e5G1Uxdfrr8SKtAA75mPDJNjvlNb0MYXT9Mh8rQYsIl4jADsMg?=
 =?us-ascii?Q?Wa9zSmRKxsxqyFis6R8/H41qBuh1wtQDkiwEny0KvB2FwKoSKPTk3JhQUW16?=
 =?us-ascii?Q?oEqMa7uHjdI7qn3/M0caBkX4amErcg6Z+sbmTtN8vvcL0vrAuErMI5OPGCWv?=
 =?us-ascii?Q?IoBNCMVJyZjQrurCgieURyRAySnj1RiaMMyCeWrSZogcFGspjvTHcNr0qLPK?=
 =?us-ascii?Q?M73OAyNzQb+2rokbswoZBlMoSSd05uVPosIyN3mjag49ePxWde5oO8XBRQUO?=
 =?us-ascii?Q?kumlhi/55dHNz0D6AkxKA6zb3fb7ublvVHQ+WnNy07VZjf7+YwQZR2ieplKw?=
 =?us-ascii?Q?xHLwjKgUr/rp59RTIovzVGCmU/YiitgNfQ4uDxd25A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZjsF+sAkrAPdO0RY9UKwUfY8oGSjlHDQ42j+zh21MpMT3AJlThe3ooGlU8bO?=
 =?us-ascii?Q?qQ8aJWbwNZsBf3OwTls3VaG9MFYbv2/eEteidl+bbihOfNpYkv83HMpuKKPw?=
 =?us-ascii?Q?yfylsq0+T+DRXIUnOfBJvayO3vEbHnCAfdZENa/rN6DEPQE+4c3RSSfgKojr?=
 =?us-ascii?Q?VKy4xjbdJhDGSa2frUBOF2fhfLFPkxTAXYmm5nNVKTIgW81cS1ZgyhNhpPBf?=
 =?us-ascii?Q?6bp/hKVARDYWSLVUgU3CoDzKfNsVam6+uRSVdRf7wm11eHjKtBaMQozXvPUH?=
 =?us-ascii?Q?wk/bsMpSjA9RUjc1caOe0ni4tQIXXAyEpdTshcil4ia3NbHkyoV6vTiYRGLD?=
 =?us-ascii?Q?6Y0eApnJR81bV8E3VTwzXtLP3/iXyrn8X0T9GBYD/3f7x4KaiptR7zmJ9LVY?=
 =?us-ascii?Q?gFtgUL16Oujn+8jukAPxcdh/ScLrrPqsz15uGGqaCS8AlKPQchHckiMoUBpe?=
 =?us-ascii?Q?OTQ248EwoiPlEmhCv5jM5Dt7t3DTqe990Q/2PS9eZGKuVId+4/XYZTR4q2On?=
 =?us-ascii?Q?jfnsMMRqULOtO12NorOh2q19HbH7WjbBpCZg5JiVCzO79aJNU9E2nGFd8ZR4?=
 =?us-ascii?Q?ZoNwMHyhoke6XTsWmaWY+xuY9QzwJLlbGRQRYRg44NC12LlXTWGIYbG/l3ew?=
 =?us-ascii?Q?JzEUB8bGVzhvfGhJhas+T6UDMusSZWQCxyT6K9rrS2R0Oz+1GjxGGeIX3GIx?=
 =?us-ascii?Q?PYcTzp1nCFe7N+OPEiCcEg6UnfH5ouiq6UiXZdhksMFjTJeGn03DWMORhJ40?=
 =?us-ascii?Q?YFoSQMn7rWaGcgU6uV5bOw1je/tYwEvfAyDtDqVFlFISrNzsRFX8tXVraB2b?=
 =?us-ascii?Q?GtbpnJUJpj52jiRM5m8cndsnvqR9r/fmO+53uIP3PLxdtvfqtJrlR2VeplaK?=
 =?us-ascii?Q?K5MdHYB+waQUXcRjy8fkQbeL9fhgt2Jk6t5CA4mTBnrF9sskWf494xPeP3Ww?=
 =?us-ascii?Q?sWKxgOwNlsfbXdlriViGlzSKjF8zGq7Iv+eCC8iRXgRIjEPRcheR4xEi8rkk?=
 =?us-ascii?Q?+UQFM8SoSF9bofV7OS7O9TTTnmvExTQgXAnSnu1xHc2ikjWSSIXdDRzpakyf?=
 =?us-ascii?Q?F6I1d+qQaaVy0VfJqfO1hBhUl4loEmPJiqL7C+Qw4PZaqFEw3DozTo/chyTu?=
 =?us-ascii?Q?OaGaI7ajD6qgUKPOlvQ0LvCJeCmolB2D8n0lYHojjgq67Xjup9kx4OHjJbSI?=
 =?us-ascii?Q?qC9fXPZNf/mX9qUYJjKgH6z0BXSP80e1XdVvmbR4Il/HtwwVL+UGzxeDbwb0?=
 =?us-ascii?Q?Zk/ziMDZHottXyzj5GIMK1Fl8Q5w7ZINBa/Yq05LO4leJFzuIvp6E8XdkJOp?=
 =?us-ascii?Q?iWB4+25PIToNSdO2Mt0/WYoWCpXTtjtBFcvMsrRGKcwVLAqL1NMX0gP8atyR?=
 =?us-ascii?Q?IdJQSWKRwloqL42awyrrIEwU1oqOHBXyFvgfYCKQqnu131pI9zuhflUuzXLW?=
 =?us-ascii?Q?4/Fup9mYOV/f5PHSm8uQ4SwMhhZYf/AI/o8054RIdPWxCiX3i7Fmt036HK+l?=
 =?us-ascii?Q?mOgBuHol815Rru3JPc0LHYqQK1lff8U3CpWjFd6VroAV7lQBatP2fy6HWBX/?=
 =?us-ascii?Q?aO+ensycnolkHMxnJx9YaMPXJksS1vDoh16jwI6eJNogSIJzAHdO3pqiEZRI?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a12d1b7c-ee67-4bc9-a96b-08dc85d47ba3
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 02:58:03.4601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEa7FwGD6B5dWMnm1FzB1yXnDGCv8lMwz4BHVpnCMuLb8HwQZZQEW2gDcKwmC8a2Nm3LV7bK1UCm7SRpj8ns8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7939
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

On Thu, Jun 06, 2024 at 02:17:02AM +0200, Andi Shyti wrote:
> The ce->guc_state.lock was made to protect guc_prio, which
> indicates the GuC priority level.
> 
> But at the begnning of the function we perform some sanity check
> of guc_prio outside its protected section. Move them within the
> locked region.
> 
> Use this occasion to expand the if statement to make it clearer.
> 
> Fixes: ee242ca704d3 ("drm/i915/guc: Implement GuC priority management")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: <stable@vger.kernel.org> # v5.15+
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 0eaa1064242c..1181043bc5e9 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4267,13 +4267,18 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
>  	u8 new_guc_prio = map_i915_prio_to_guc_prio(prio);
>  
>  	/* Short circuit function */
> -	if (prio < I915_PRIORITY_NORMAL ||
> -	    rq->guc_prio == GUC_PRIO_FINI ||
> -	    (rq->guc_prio != GUC_PRIO_INIT &&
> -	     !new_guc_prio_higher(rq->guc_prio, new_guc_prio)))
> +	if (prio < I915_PRIORITY_NORMAL)
>  		return;
>  
>  	spin_lock(&ce->guc_state.lock);
> +
> +	if (rq->guc_prio == GUC_PRIO_FINI)
> +		goto exit;
> +
> +	if (rq->guc_prio != GUC_PRIO_INIT &&
> +	    !new_guc_prio_higher(rq->guc_prio, new_guc_prio))
> +		goto exit;
> +
>  	if (rq->guc_prio != GUC_PRIO_FINI) {
>  		if (rq->guc_prio != GUC_PRIO_INIT)
>  			sub_context_inflight_prio(ce, rq->guc_prio);
> @@ -4281,6 +4286,8 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
>  		add_context_inflight_prio(ce, rq->guc_prio);
>  		update_context_prio(ce);
>  	}
> +
> +exit:
>  	spin_unlock(&ce->guc_state.lock);
>  }
>  
> -- 
> 2.45.1
> 
