Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAE27FAB4B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 21:25:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8792A10E0E7;
	Mon, 27 Nov 2023 20:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85AAE10E0E7;
 Mon, 27 Nov 2023 20:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701116695; x=1732652695;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NUP1UqmrsxJpZp25o0RJ4doQUpjEilh3Um2dY+qZnec=;
 b=kzUhhAUri1mODzx6YFNAD/hNWFNQDQQSZjbYg6S3hwHTE0/b1Rk+No+V
 zRkHLtwGDqlfSSoVzD6cEZbSAv2BkgwzS+1gQVeqV7pl9JnVXNV6kJ43Z
 yvDrt1il0TdX2SwvAv4n73aMLUfjQ0aDyud4ehBKA49FxeOAJrA9KXIaj
 spuyWPEpxC1F1gB0fw1i2OckItEM5K34Nj/kFjqr+E1yys0DqVvuXlbNJ
 9wD6pdxcgih8T8IEIZiWCQK4kWEyxKQuoB860KWL2Cg1AjAKYQGM03v+C
 +ACEqICVxVWU5LFZG45LYA63Iu/YYu+dllgTuw+vyXAs3neH4I7V0XZns g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="396683592"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="396683592"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 12:24:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="772040993"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="772040993"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2023 12:24:51 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 12:24:51 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 12:24:51 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 27 Nov 2023 12:24:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M7yzIVdgnMFzj/yBcQVBZS7MxEkcFAlAZ3c/UdZEkQJD7VJhAwdCW4ld9zkdDAtySMyeMFzytBtuiHxUbs+3xI2O/QBE+MsooUBUGCtZ7Nz14ukTzbNX/SaZyjRk/rGM78cmQOMEWaPahvUqqV+rdNSEo476i/2MApS2bY4uYn9uN77EslgEY/OQPJwCer8nRwlnACycYGVrQT0ucCd/FMcKDII+Yj/esv8u+tykk595WSpwo73uxKHSHK0CONGhUsBFVW7/8cGu52Fnl4sFEL17NDlOHlMMOATnHW/2x29xXEW8vOsTjSLS8K9oi/LpEr2xtPsUA7Kgfb31NjP7oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9U7gyUfapmFNwq8n0jnWAcGtV7hWMy7g9XiLPksR1k=;
 b=HpEntiOlxHV4skX8iiOec2L2+m+KmqYJ1BEY+jXGu9ovPJd15tFTEhWBV6y+8DCfKo9OdOXEuUt59MU+01SBX8igh41+iJnW/qjzhZx1OMPtYV6jPRogOlwbG6WLSzm3dpSN6Dm8mvFUo85aFfxcCw22icxbN0JjntNUhNrpf6Z9ha3LyEIoovnfSwL396I978LrNku0211WJuRSU6k9ExWoJcS49wr/4+rBo595RtNL7rwiMBtTJYrvTgxEiGraUBJz89BsV7wMASmkf/NcU8yO8xnyEkdaW0gHTSkwklv9GIrjOENVlwa6x03uqJNn3yzM13L/07ey79xx7Lx+aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB4686.namprd11.prod.outlook.com (2603:10b6:806:97::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 20:24:48 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 20:24:48 +0000
Date: Mon, 27 Nov 2023 15:24:45 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH v2 1/1] drm/i915/pxp: Add missing tag for Wa_14019159160
Message-ID: <ZWT7DeeS4svpw4PQ@intel.com>
References: <20231122203003.65735-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231122203003.65735-1-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: SJ0PR05CA0108.namprd05.prod.outlook.com
 (2603:10b6:a03:334::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4686:EE_
X-MS-Office365-Filtering-Correlation-Id: c47a6817-26b2-4384-1c3c-08dbef86e6fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qRZHNZgyE6yZuu+tZ87wwdNyCJID5zrc8zLaxyeDhNAsTsAuRQuIH4h8b0LD6r9B9D+aMCRbE9CqSHAnC8Z9re+t12pXDNuDZgPbcR6VKTQXA1jimHLVmzYx5JNHnz3KWmxmJmh5FRIgdtSA6hFRgnYSHKzgfkFdceKsy6/b/umCFH4Os711tZFKa5/XPdMLeF+I6rQGHpqjPuRpPbtzSOCVfpI36LDSre50a+PxkK2M8xIovbGaGbK/rR1oG5wdOJkxALdmCA9OdeyS8We02VpZRcUMQTALjmKxxkJUS2c3oWmrHM/AA361UiOmtSe+t6STvt+39Z3tr2Pzk1a+BpC2Jw8ycgQ7Pbe/FJcXSoviR5K3wAucCrHK/vzd1tJWDCcpE3EdMJsGew+2P/V04e9OdNjMx8kc7UQI0zlJFZIL6+Ps073jXmrtV2R49T3Iu+YoBYVd5sSsVCPHRgOAfchy4YpTTV2cjscn1TqXrJUZ7mdVUaFOpE3DTPnr1aqbXJrNt/nsLm5tgMvoMtZkGwJxNuI0F8TEKSlUeDclwnM9dTD7zCysQz652rzKfHp1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(39860400002)(396003)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(2616005)(26005)(6666004)(6512007)(6862004)(8676002)(82960400001)(450100002)(8936002)(4326008)(44832011)(86362001)(5660300002)(6486002)(478600001)(316002)(6636002)(37006003)(66476007)(66556008)(66946007)(38100700002)(83380400001)(6506007)(2906002)(41300700001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jV1Q3nHxSCbP67gZtA6XyxBC2beXfNLUZ4fF6JtBlsZWjly2kqVIn53D7qAu?=
 =?us-ascii?Q?jkAPGG2yDOYU6kKOUy5bhw8PP2ORxH7hADIayVCG3sH5AxCQh1Zkyn7Odrhj?=
 =?us-ascii?Q?NaoG0qIIsVGYWJRdS38di/X1KIwbofZD7sA3mf2dr28IrMTeqjzF7LCgBG4Q?=
 =?us-ascii?Q?kenSE5mBqOSI/QUIhBzbzC0/G2tpv66fko1N1Xj66Ie11bAuS5FTdtl+8kDn?=
 =?us-ascii?Q?lYNr1kfyknJD1hHiyReMhiM6ObBbPLy1UwOZUDzqxHKvXmreBcaJH227OD3Z?=
 =?us-ascii?Q?2B7fbJPVFXD5YKFUREy1s0JNden59JRCtJ7fTFZex0wUpsQJ5IBB7WuUdpM6?=
 =?us-ascii?Q?lnYwTqGThNMguymMUN4Z4MagNRY1FG2Y51d95xbsNPbJhO9X5oON5sa+DB0Z?=
 =?us-ascii?Q?Dss6igZrYsrnUE7XM7XzA9JNKoKvYrxUl3igxquj1g0Rnsdu70aGpfsGNC4h?=
 =?us-ascii?Q?Cgl5G0i+7ErusZqQ6cPLNU1nDaP4OtlljHnYg9FHuyxxW8BEYEFu7ZKrxZdi?=
 =?us-ascii?Q?G1tN0wUHtE9g0mzcBSHV1bn7wIBVsTUCCWlE4LdAxPeCsIxkUXg5bguKyHC/?=
 =?us-ascii?Q?L2WFpwz9fUP5QbIomaHbDjdv84OQqAXrzfRwK1WyKdCR0m/+Chmd55Avpnk7?=
 =?us-ascii?Q?Z5MuwiylZquttVmkUg29jt/6KXElae9zuCg1HOLM97AkTJOVltAgYXooPcRd?=
 =?us-ascii?Q?Pz+M8JVDRToCjKryNIHVy/9Pw7TY0KvBwJ/2gEp/Einn6S4TDMbFRwU0VJ5N?=
 =?us-ascii?Q?EWC/NINqWSdkymXotk0DcuQIReyx7MgVV+iPexdCUCj3pcWVB0ATEkbF+JQ8?=
 =?us-ascii?Q?rBah9N1vCnfuCW7Y+VW90lhHxN9q/tycnrBlnh0mbBiA71BpdCf3hxN9Tg4I?=
 =?us-ascii?Q?x2L+CRLDLyP+ZsSIKVs1xM5F10/xXmC+IzoOlwcKQECqnPuf5cRjwl02nTVV?=
 =?us-ascii?Q?w81qw7ArpmP7szjr1n5kcFTqBqystVO8LZfitT0gThfnHoVYHsmo0FeXIuUx?=
 =?us-ascii?Q?fEWy0pSNJ47fE06Lj938gQj9qL7sE3nMYE9yjpZkqmEnBgk8ctG22mQsEl1Y?=
 =?us-ascii?Q?z++HB0kLmKEy5jVFNqtzRmUYWPsfbeSuxtsFSLHoR7wydxK6s5khPq4q1gUH?=
 =?us-ascii?Q?RVgZvhfuCowY36+KRkRZi5UXpIdoc+mFl77hFfqCYOCgIFNFDwabyxvb0mUW?=
 =?us-ascii?Q?n05GTg7lWoh5Kx8TSNuyw4Mv148Za/OWDn+QwZ7PCf0UWcz1Mkh5CUl5Qzmd?=
 =?us-ascii?Q?yh3OQ/h4YpErOud+KiNW7djmLlt824R55+37+qkzw4YTG8nrxhF4KXAS1vyH?=
 =?us-ascii?Q?qtVL/Jg2xXw0TGvkDpVEuDXVxMuvV+4qtUzAo6s6e4m06HvG5ps6q624QJ7b?=
 =?us-ascii?Q?PenIdTu0fN/9Sd+yKk3b1xca8v2jp8j67ZBztXcDIZPpTK3hQtpoelH5mKav?=
 =?us-ascii?Q?vQXcKM1B2njwQkDXbGvRvkosHuLycZA2TQq576Iidc+5D/2rB54oOa2TNq2P?=
 =?us-ascii?Q?m7QN6YCA+fTnrnLTObLaZKqBhw2OH/vLAiE5sZUOr2EOyJVzwtzS8JHMDUoV?=
 =?us-ascii?Q?KRkmooVcO5t8sJuK81c+2FxQIXxvoEAbPWUqDJrK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c47a6817-26b2-4384-1c3c-08dbef86e6fb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 20:24:48.5163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 72tSumiacU+My0if9arpLILQwhrXxmMBjnIhlKWTWz1cfPWTgWphIJeQ6IwfBAmlhZogX/Q0eIZLExrLxAA+7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4686
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 22, 2023 at 12:30:03PM -0800, Alan Previn wrote:
> Add missing tag for "Wa_14019159160 - Case 2" (for existing
> PXP code that ensures run alone mode bit is set to allow
> PxP-decryption.
> 
>  v2: - Fix WA id number (John Harrison).
>      - Improve comments and code to be specific
>        for the targetted platforms (John Harrison)
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_lrc.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 7c367ba8d9dc..2959dfed2aa0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -863,11 +863,13 @@ static bool ctx_needs_runalone(const struct intel_context *ce)
>  	bool ctx_is_protected = false;
>  
>  	/*
> -	 * On MTL and newer platforms, protected contexts require setting
> -	 * the LRC run-alone bit or else the encryption will not happen.
> +	 * Wa_14019159160 - Case 2: mtl
> +	 * On some platforms, protected contexts require setting
> +	 * the LRC run-alone bit or else the encryption/decryption will not happen.
> +	 * NOTE: Case 2 only applies to PXP use-case of said workaround.
>  	 */

hmm, interesting enough, on the wa description I read that it is incomplete for MTL/ARL
and something about a fuse bit. We should probably chase for some clarification in the
HSD?!

> -	if (GRAPHICS_VER_FULL(ce->engine->i915) >= IP_VER(12, 70) &&
> -	    (ce->engine->class == COMPUTE_CLASS || ce->engine->class == RENDER_CLASS)) {
> +	if (IS_METEORLAKE(ce->engine->i915) && (ce->engine->class == COMPUTE_CLASS ||
> +						ce->engine->class == RENDER_CLASS)) {

This check now excludes the ARL with the same IP, no?!

>  		rcu_read_lock();
>  		gem_ctx = rcu_dereference(ce->gem_context);
>  		if (gem_ctx)
> 
> base-commit: 5429d55de723544dfc0630cf39d96392052b27a1
> -- 
> 2.39.0
> 
