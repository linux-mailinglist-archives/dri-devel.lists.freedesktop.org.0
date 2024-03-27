Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 148D888F1A1
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 23:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706CB1120DE;
	Wed, 27 Mar 2024 22:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XnXmdQby";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4B61120DD;
 Wed, 27 Mar 2024 22:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711577347; x=1743113347;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7kf+PcK0am1UahGEH5DxmmB8hkCBunUBFuNyblWIzYM=;
 b=XnXmdQbyHYeDe/qmyw7cyC0eY29Y/DVHjt0uSjE+SCM9xqni2Qd5mlqo
 hzU5Yf7ols8dfAL1jZdL1JX+dHaOfXSlO6A452zZJWptZ8YqE3aYfvfmO
 q29SZjNcI3KECtJ/zcD7gXjd7N3LxjgnWKw6Fgm7ewB/iT5Pupy7ypbbC
 Ta2wK1rMXcXF7R8dbAu8V/szadXoEnF8gaJn1rRCOUIBx6lGMg4EHf/Ri
 kN5xNkQZjVaSy7pd6Z81qrRaEYlQAEghe43pae2SI0PPIEDGg0BFNAInK
 IPy/YocQbZ5W7cguiW2p+UwT6JUxF5mtMf5W1HwU8Fc/TMHSc2CKQ04UU A==;
X-CSE-ConnectionGUID: X2oJfuEMSuSGHXwoTR5o8Q==
X-CSE-MsgGUID: HYlT0gHLQ6akx4sX+QL4fQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="18145583"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; d="scan'208";a="18145583"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 15:09:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; d="scan'208";a="16460934"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2024 15:09:06 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 15:09:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 15:09:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 15:09:05 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 15:09:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fg0ROLVb+snwiYBCOcljva+j75B9YQP9BNtVTrO8m7HiycDUMFYj46L13up4t8cFceEpBYPCo0TdQs+Yx+OEvzKL1bK43DRQT2MCUaroKNOJ4alBYMoJf2VlHdkG2WGEEsXSJBolqiKmDooWpIbtd6HNlxIcAHSYvWuIVqKGX2hv//kbXhTH67Lntz7T/n+RMJswqjmmX3uP1ScsTTcJIlbJ4ewaPJz4K8BmdDiS/BIOj00ClhPRuTsqVhd5zMoqFkGKNUNxLke06el51gtQ0Z51UpeDtmXGZF2XID/MnQ08xquIjb3UaMXoER4tRGNuV9xNkBYpqJ2eSNsS03n/zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AuqJmt9kaDBVjR5665yvEbDwxJs8vTSYwtsZuVTCV+I=;
 b=ap72hI1PVJlOwhkLVEhG5XM9gkkuPkmvqHQIeY3rhp30M02oBdKTcdHWQcAbB5oskZYYTatz7a0PLkW0gqK5l/hdUj2M14kKJxRtHZrcpliGJHeETodC61rDXvYN0ct8xBygnyBFrf33XW1ddnvaZtcemPylIaPU//5hWNxLzNz8DPBsQhq577kgIIZgHa6eLZ+sWAnSEduEOxtWRFi4eG6Rfkv7n9KHKKhCzHPvUdBFJKk5/XCaolmKMIKJfKNOSJ9auJSk6RUkYVgWVSCVIqUmkhBRvLEu+9HRCnX0/uQX8/thH3OpQQm/RkgxmAPS+zvYAHaHW7szvPxOZbxqIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6237.namprd11.prod.outlook.com (2603:10b6:8:a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 22:09:02 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.028; Wed, 27 Mar 2024
 22:09:01 +0000
Date: Wed, 27 Mar 2024 15:08:58 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, John Harrison <John.C.Harrison@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Michal Mrozek
 <michal.mrozek@intel.com>, <stable@vger.kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>
Subject: Re: [PATCH v7 2/3] drm/i915/gt: Do not generate the command streamer
 for all the CCS
Message-ID: <20240327220858.GG718896@mdroper-desk1.amr.corp.intel.com>
References: <20240327155622.538140-1-andi.shyti@linux.intel.com>
 <20240327155622.538140-3-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240327155622.538140-3-andi.shyti@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0242.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::7) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6237:EE_
X-MS-Office365-Filtering-Correlation-Id: d735a13f-aa3b-4807-2cd6-08dc4eaa81c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B22/VIsZwyVs/x07Mq0gRO3MXW7K9OJplOVhY9Ekqm6UQ4watdbTOYz6hoaZd5W3GIl/sn0vyMYPRPj3AxLWrKAk980XcXa1so4EZlJTO8yfNwvQYmr+9EoiQirF+UIidXxPFFgK9VrT7kkrgcsV6Haq/qXgs0S9sTPsbK+qUIrKvAwIW/7M3y+mNpg/f4qaHNsJay3eD3MQFuuIglhJ/0pfT3GXcLLJMcC/8ZMPrilx85HcvYep4YOw0Zmjyby0qEzQaFvdcu7hPCgcU9wVGFLT/X7iPUVggGaX6qos2m3Zw8VEcaqdCsevjzQwbuF7u3L53dRx66LCub0H/VavWyK3ombJDfWwV3Xk4WJb1kFvtT/iO5sVZEqgiet1xRORWUIszR+Uaw8L7JTEoQo+bQLbl3dP8KWEknG6FlUziFm0eHlScrQ4IubASc1DF0aT+e6Ig0A1u8I4erdRPmNHn4AXT4Wo0q9K/xP3KolGQbSL0X53JHq+QGg7po35YtIgUlVmxpfSEl0SczZdZzkG9n8rfHbslfkSJvDidR/znuy2KAkqHY0qM2LWR8V47ydxkfNE9kbVMGxHZTimS9f80wtmtdALS0is/o02RO3atmjHaPo6KAQ3XLjmEMvNRb+NA5J4IHZx2iyhdv3yAoGnwJIwmbAIIC5grOUp0xvUaL8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mtTaxRIN+cuh1HQjS/BlUj1J86CEIufquP67EHtqRqNiGVA3lc4y8Ja2LXYU?=
 =?us-ascii?Q?UWq7ggRfxry8IDiTYwJIB5g+ktl5l/1UR5Hyq5Uo3j2aUq3RAwqgKj3eVGOd?=
 =?us-ascii?Q?6veDXd9MBHJiaqug7Dl9NprUcrPnu5s0vVW2gTat48rBe6lH2kzOuPnJXGSv?=
 =?us-ascii?Q?KMU3QfjCtZKAnpGBYPJSbK5XDUc7pACKwa9v2oDSIYkQTh/Lq9AlEiRNqIu/?=
 =?us-ascii?Q?HUV6vDx6UIfDOBRW/Rw4ArIlAORCsWWHKXKN3peTUS/LOqpXkta3XXWfnKIk?=
 =?us-ascii?Q?UkR7Lme3Z1Ttyij9m4BLK8vjSyxO6bsKLzwvpRC903DEh2TyFOARPSmUDQK6?=
 =?us-ascii?Q?m6bCXgd4F5vciyvjUtzRVMioav9Bm/LfAA0JkElxeXDFu9HDSbtLLVofitQS?=
 =?us-ascii?Q?PcbDydaj932htuWKIsIT6dcmtQnAdMi62V/NVohoxFxUGTJEiJhmQ5aYoFiZ?=
 =?us-ascii?Q?TMhiwLvKemyWNZAXsxHD8XQd7mPGQUSS7er3Qt8KYYW21/IOJt/JHmCsxtmq?=
 =?us-ascii?Q?WtTOsuaLDf2Qsg2dd/xrdyGlAbruhudS3B/8sMIx+ZBHPTSkH6U2mYkjxuy9?=
 =?us-ascii?Q?mW42O0WmXTqMGwIwqrrJbgymg0qVJkhQCxoTkhZ/hAQnCOvktPnbHktXFV6D?=
 =?us-ascii?Q?25VfGSYzWQFESZmN+i/yXQ/NJNWKL504yIg7QC2M3xhHLfNNOnI9ppqGxr8m?=
 =?us-ascii?Q?PgL/B2QSEId5AKzvJO57ci33ys5Bf7Dfxe4uPhcOOy2kZRZIOaGCGW+iVuFC?=
 =?us-ascii?Q?ruU9AdzCsEcqBxYEc6zzIpQUG2deriDb2qF4SGy9R5lghoVh8KKaYW1XbOqg?=
 =?us-ascii?Q?jVJjp4AS4aoOeBGU/DxmxKll8dWCv/iwIPbNfJDjqXg8CDFtOSM4462AnSEw?=
 =?us-ascii?Q?HItbI7ig4Pva8bYLXg0x5vHAo3bHfpHKc7ky3i55FtasONuNrlbtFqG+zsqb?=
 =?us-ascii?Q?laaCCDzjJl4RR0V4KLGIvdD3hXamTA56VvqpoongVnDs8Jxq9x7BdWxBZ9uk?=
 =?us-ascii?Q?AV6b/7EXwrdE1xPZgFI0JFxMolhC7alF6Ev2SqiNi4xohkFuFipZ6Z/ITAq8?=
 =?us-ascii?Q?Z9RMkStgob/XE30wBMgABHMNv/PhdIMxO7+NUpFmt67BxiH+c6GIOTAnwSMZ?=
 =?us-ascii?Q?jh3AYtbWTeBpPaqQNgOWEwneKuUL+l4LNimHcyNnTEUwYVOjPuJbUuF2U2L1?=
 =?us-ascii?Q?GZDZEj7BPj/tiYl8NjtE0YxI27jT5+JUgqQ+GMtJkEfJr1XttRCjqbjMd96q?=
 =?us-ascii?Q?u9+PcDvqFM4/R/DqYG/8Mi58rvSEZhdWxDSG6XO+b7UVgT66Sz8Ttm+0eUQm?=
 =?us-ascii?Q?pr4jLnqmBEuAKiL3cWdrzfwbDvyRI69+1+u2ExBDO0oNv3ctOySreNow1nlj?=
 =?us-ascii?Q?hRcFJ6sOY0tBdPgI58V6tpsRVkwQIEi6k1sZdmn5mi0tnz3AiGBOnmOvFnUi?=
 =?us-ascii?Q?AwWp1FukcwWv6HmevW/tZ615jZeeMOm2BNPZ9055wivaBhXYl98Ty4ZPMG9B?=
 =?us-ascii?Q?s8J6w6oEA+bndP/+JsP4Sk3uyGCwnFXei57LfRaKxaSp4S30FGlvsVua1aLq?=
 =?us-ascii?Q?/1rKxjAKjh+Aw+7rp64W9UNaFtc/1rpkgZQmG4iwmQLxTm99uJohEP9EHz8c?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d735a13f-aa3b-4807-2cd6-08dc4eaa81c1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 22:09:01.0172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WACFd+CZEabji8013Dcix3TxWeCLTDbKKZF881v6MQVxVdv8Ic9mSt98JJCfyLVncgGomxAE8fnoCthcLxk2PcAoKfVGIAQQO4Ol36USI5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6237
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

On Wed, Mar 27, 2024 at 04:56:18PM +0100, Andi Shyti wrote:
> We want a fixed load CCS balancing consisting in all slices
> sharing one single user engine. For this reason do not create the
> intel_engine_cs structure with its dedicated command streamer for
> CCS slices beyond the first.
> 
> Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: <stable@vger.kernel.org> # v6.2+
> Acked-by: Michal Mrozek <michal.mrozek@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index f553cf4e6449..47c4a69e854c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -908,6 +908,21 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
>  		info->engine_mask &= ~BIT(GSC0);
>  	}
>  
> +	/*
> +	 * Do not create the command streamer for CCS slices beyond the first.
> +	 * All the workload submitted to the first engine will be shared among
> +	 * all the slices.
> +	 *
> +	 * Once the user will be allowed to customize the CCS mode, then this
> +	 * check needs to be removed.
> +	 */
> +	if (IS_DG2(gt->i915)) {
> +		intel_engine_mask_t first_ccs = BIT((CCS0 + __ffs(CCS_MASK(gt))));
> +		intel_engine_mask_t all_ccs = CCS_MASK(gt) << CCS0;
> +
> +		info->engine_mask &= ~(all_ccs &= ~first_ccs);

Shouldn't the second "&=" just be an "&" since there's no need to modify
the all_ccs variable that never gets used again?

In fact since this is DG2-specific, it seems like it might be more
intuitive to just write the whole thing more directly as

        if (IS_DG2(gt->i915)) {
                int first_ccs = __ffs(CCS_MASK(gt));

                info->engine_mask &= ~GENMASK(CCS3, CCS0);
                info->engine_mask |= BIT(_CCS(first_ccs));
        }

But up to you; if you just want to remove the unnecessary "=" that's
fine too.  Either way,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> +	}
> +
>  	return info->engine_mask;
>  }
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
