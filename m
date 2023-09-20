Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC93B7A8E37
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 23:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5643010E561;
	Wed, 20 Sep 2023 21:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7587610E55E;
 Wed, 20 Sep 2023 21:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695244179; x=1726780179;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/OLf6yVcUQv1IBXzI1oglS9PMmE7XdbBrH0xNUQIKvY=;
 b=l447MS4vqSmR4rRAGD25lwgDLldHR5TQY5XwTwaRq6oUYc42tE3/vQ4z
 W7taXsW1OrBGOw+e6o+CWjuQ7F+vd8nXqVGToa6yq3FRQQe8ERNl/ZYOs
 dxMo5MVe6LNj6TNNfRijMJItNBV0yp7351MmUnoUUnJ5d/Zwj2lWSLvZu
 QPgEbTT8WhHdrCfJbxCLaWZFIjf+joK6C0r8tNeoewflDHGhJaN8K6J1M
 y1DfbEB1JOKepz1xrSuzVza8eQWYZTWUX1jYIi4ruU4AR0On+ANi+qiaP
 5tRM+7sU/t+hhUiXdWX0iONEeh88BV/yoX3wqb7zrrRi9lLdeTJGHDGPf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="411286737"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="411286737"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 13:54:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="746792263"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="746792263"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 13:54:53 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 13:54:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 13:54:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 13:54:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/AWkzV+aZZQf+ffzwSdOveGbLaRfF58/PkWQxRUa9OufKKx8e5Yc4Tozl/8ScnZulzzNpifiLKNunYjMdjtOCakpZhT5T3hSbjlkbeOID13/kOjulsTV2NVjXGuNY8DpPlrQBu0rDMpLltnUVguBGMCFoSvO201ZiNb+wVzZyEXvrMHxsvQeveHAf2QqOiNB0PcGzL9/yPNCn4YOaqAZjV3hlPeL6xTxTwitfpMdwHSjasDDj6TgoCjcfASq2uwCjfoWNWE8NH2Yvq7d0ClXCOGLjKFtjiYYtCPPEtowMOqGSt6mSl6VR9kUCDzzTXD+StPykiLAqeU0tk685ooHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjgYLdlVs0MPJfq1xQeQr+NYMfouSIqU8dThORsWixE=;
 b=OnjF+uRin38rIGf5ZUcWFzg3fe8VzJIpGxTLPvIPbn2dy0WWNWMrXW87Jukj7JwCiE7EcXWqz0tODLg8oOyuH+u5mfdR8TxS9v9firmQjliLrGnFiLA9Fiv7V4sWMwmkDZl+QZY2AjMn+XZYiI+N3DkZYfWsB3kvGKphh9O2EhaZw8vlxHIXgvTKZsaXS8kGDslRFjXVdKdCE2yiWpMGi5Gz0f8oSdqnxDVmYXgu4sNc/mPyl6eZy3GtzBcHAwD1uXar/PKHq03o5vc2FT0MxjzSPoAsL9IwH1vjcBMIdfEDCYjLclswCuTFc3BCOPbt738NN/9/PxjoonurlzOqgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7491.namprd11.prod.outlook.com (2603:10b6:806:349::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 20:54:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 20:54:50 +0000
Date: Wed, 20 Sep 2023 16:54:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v2] drm/i915: refactor deprecated strncpy
Message-ID: <ZQtcFQuPkiO6aS3O@intel.com>
References: <20230919-strncpy-drivers-gpu-drm-i915-gem-selftests-mock_context-c-v2-1-0b5778423bd7@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230919-strncpy-drivers-gpu-drm-i915-gem-selftests-mock_context-c-v2-1-0b5778423bd7@google.com>
X-ClientProxiedBy: SJ0PR03CA0120.namprd03.prod.outlook.com
 (2603:10b6:a03:333::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: ba73884b-9608-47e8-1c45-08dbba1bd50b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4aw1Jl0LWnXQhMYd5kwGtkzZYKYlD2Vfe7WHEVA5dpypHPoQUl2Ll+yBtFwZBRAtMPjCXgfIQWLm+Bd7CshmP39eCFeKxDfVK/KOXeCuxacz0HHv86QDPIAxOykE+qTZpzaxAwsrL6HEfi8cYpqh2XT1201SBUab6UrqrkGZM3PmOeEfe8Z+NH0w+fsaYp2z94osbdAEDOPh63mL645xm5Py1bHfu2g29N96uVJYaGCykDUxqF1hqRMjSUzRJwza0Q+WHZ9v1Rv1Oo6Fpk5FNj7JuybJdaTJISDZhZUkkBIjJ8wUNu7yQWP1Ktq130M+ii/jTLFeTZMKU3SG1bPOBeZ946Be94GVvFCZPzO0uHvtqb4Ys8od25dW0r+oFIxo2x+d7DnVF3zh2dSRHu5NLUPl6NIQISOZz8PrvVEYjs7fs/wutmkZvdoQOk4262WugTTVHmZbAIkM5vsuBo9LKGYN17B/QZV4gyHxDdpEBBZBdlAC8I0ZVV0sdEJwIeCL+Q9F1npW7D5DPOa5hA2BtLLRyaAbGxmammKNCodRUgO7Js/9ANX1+7IP73JxR6oFLKczbxXA9QGpYbI1Tugn63IY78nFsSwrOf6LoJLPilkKdiT0Wr25dC5c0v2Wc9vDx4eBgB/ut5Bg1XTwemtekA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(39860400002)(366004)(396003)(346002)(186009)(1800799009)(451199024)(6486002)(6666004)(6506007)(82960400001)(36756003)(86362001)(38100700002)(2906002)(44832011)(26005)(8936002)(2616005)(8676002)(6512007)(478600001)(83380400001)(41300700001)(5660300002)(966005)(66556008)(4326008)(316002)(54906003)(7416002)(66946007)(6916009)(66476007)(156123004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5z0jZ7gI3FWlNBieUXjc4OmvSqfin59zpZndfhNcJ3/iplE0twvWoFT34qXk?=
 =?us-ascii?Q?0SjHkgMcLOjZyYxy9lJVeGhZkGGoUoMj+GUi9OHomltKkU7Aw9lrraiTAOGZ?=
 =?us-ascii?Q?dSy5PxqAciXFaAtVyAYbAz1bXWyO6la5PCwOPEyGMIa4G0KykhzFIBSsJr0g?=
 =?us-ascii?Q?wDVvaicDwLEKwVPW6NegTEpcS0zIJqoLEECwciZrMWONkHRIaNgcmszRBTxW?=
 =?us-ascii?Q?L/+BDWsND/QJOZxiVCTNE+Y9c/h9CGgosr+H9FRey4pAaaU0W/z3kAl1N9o/?=
 =?us-ascii?Q?0M0t3x85sMvuzwMt6ZmnB5FLMlJs6WfTfpJCxkhi2Yux9AMjNElLMAHU5sUU?=
 =?us-ascii?Q?Fp7/YNdLrRvIfPN0eZyQdnKyUENHu7+K1E1i5Kus9wnpFa9iPKEFumn7txcB?=
 =?us-ascii?Q?4JmgyIQ5XrMCupDF9LzSHiOu5uG+1oKOtpBWQEvUzyG3OqK6roqkK+Se+dVR?=
 =?us-ascii?Q?FpUcy7goBv1vE7INcbJIJ08RdgNwGGoRQFZDolO1Q0wrwuSs7NG/gbdQWN4g?=
 =?us-ascii?Q?WUpmkeHqlpfJU6VxhWqAJ7Mwz7ebiyZ9+Yae1mJo9h9DtkRSuwZGGZbZieux?=
 =?us-ascii?Q?w8ftneVsJxs+/VwTsxTcV04hWG+aLVI8/EH0yRShGPpOpEuFhTt+lzbcvrtk?=
 =?us-ascii?Q?tR7yqD4Cv1/Bid2oSAwbFoC8u6J/Nj3oFOoeLiL1+h1P2Z2nGnzYdubmaoex?=
 =?us-ascii?Q?NU9te6l2SgmwhEepYOZJwpWbMif8bqUNjZPWjbUS4SOeWb8SF0nagRPcdYYb?=
 =?us-ascii?Q?T/K6cRVm60GUC/YMaIxFmkK8HKQGcez6c2XgxfVu+NX9DKAh4sK27wMHIzrZ?=
 =?us-ascii?Q?wMpGxl6hz3FrXf046lj9mmsxovcCKU4+x0dxdN2l0Ec8jFYon38RDxzSHOCs?=
 =?us-ascii?Q?SRdyZXLxfhHTImChcogaap7m/0n9R6mTQlejZCZbrZJnlt3vnbKKoWSN5UO1?=
 =?us-ascii?Q?bHb9hU3vX8hU2F45e0owdeyLu1PVsMoD5Z5YaDlnQyai1I3u7osgidywhXNw?=
 =?us-ascii?Q?X1KgRnzdhs7KSJj+zbn+xOgwxCJmj6aqQKOUQtLx3REJVIvMQ0w0tKcrbLnB?=
 =?us-ascii?Q?SPJA47rhQs4o+Q6zh5KWimzwZ7ilk8EyiphdFYBnkeqyNMijDuNlnDJFaomQ?=
 =?us-ascii?Q?kVo4o/AJpMu1tenMKpyAoxVyEW2T90iYSJNpaTl9R7pqE7PVBIcTXB5+kg2O?=
 =?us-ascii?Q?BxMcoMnDm3CXKlkNX0GBVsVqk4TVOknzSlsavIKF4tvrBSFj9WMZO6GzZBwf?=
 =?us-ascii?Q?XMZylPDveEme+ui2B8nxtlkrdrKpfPi3BupouB12waZZ1n/jk8o25fjBJ+Gn?=
 =?us-ascii?Q?SDZnYdJkeBXdpVyvuHAk0ISwtww3R3h3Rv1DcEfikrJSzDKL0GAcI9OD44VU?=
 =?us-ascii?Q?4L5Wn+QaMLgWMx7dlmuauObSOHyVsV8rY/FTQNM9eGil7oUErD0N19Hx9z+E?=
 =?us-ascii?Q?JpktTPKWQ/asMXE7aGC98NpWJRVKEEw8LW0efRnoMin53PqDCBgjWYVz4TMx?=
 =?us-ascii?Q?dlwnsqk/I6TtpHvFrK7benzz8nImQcr0yVP1AGsdLlDyCHN9MQ8b1smCQbtD?=
 =?us-ascii?Q?lCJAQCXMzGblJzwD5YqlsLryK/J5JUpK1iqH99hQX9JtjLqMWlAvxEBD7b0Q?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba73884b-9608-47e8-1c45-08dbba1bd50b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 20:54:50.6406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gGl9zqIFsWnG1qNAXPonUfbdEttP+uuTy9BbKlpz2yKA+5Alo82W1H8RVrG1PmS743AOIW54lnw0w3nnskKWpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7491
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 19, 2023 at 04:45:31AM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> We should prefer more robust and less ambiguous string interfaces.
> 
> A suitable replacement is `strscpy` [2] due to the fact that it
> guarantees NUL-termination on the destination buffer without
> unnecessarily NUL-padding. `ctx` is zero allocated and as such strncpy's
> NUL-padding behavior was strictly a performance hit which is now
> resolved.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Changes in v2:
> - drop the `... - 1` (thanks Kees)
> - Link to v1: https://lore.kernel.org/r/20230914-strncpy-drivers-gpu-drm-i915-gem-selftests-mock_context-c-v1-1-c3f92df942e0@google.com
> ---


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushing it right now to drm-intel-gt-next

>  drivers/gpu/drm/i915/gem/selftests/mock_context.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> index 8ac6726ec16b..e199d7dbb876 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> @@ -36,7 +36,7 @@ mock_context(struct drm_i915_private *i915,
>  	if (name) {
>  		struct i915_ppgtt *ppgtt;
>  
> -		strncpy(ctx->name, name, sizeof(ctx->name) - 1);
> +		strscpy(ctx->name, name, sizeof(ctx->name));
>  
>  		ppgtt = mock_ppgtt(i915, name);
>  		if (!ppgtt)
> 
> ---
> base-commit: 3669558bdf354cd352be955ef2764cde6a9bf5ec
> change-id: 20230914-strncpy-drivers-gpu-drm-i915-gem-selftests-mock_context-c-980c8ecc9142
> 
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
> 
