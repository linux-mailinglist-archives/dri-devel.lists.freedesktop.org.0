Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 153B196E0CB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 19:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2767310E161;
	Thu,  5 Sep 2024 17:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="evuHbCdm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1335310E134;
 Thu,  5 Sep 2024 17:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725555914; x=1757091914;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+cydkXdEG2WI616HJxkraIevOEmaLivcbJMy3/+cYuo=;
 b=evuHbCdmodpzO91ryY6+ntvJu8YlFysqBLRunhFWPTXHKn3qrzEYeynK
 uD9KV9rIEpySf/aj8j3n0IeIggmjQydtPAvQOFg2PbzEQC9Fuy05fNp59
 wb7FZAkxtzniTblY/Fi5txDxCMX3zbtWfAxYosBG2QB7SITdsKmSL+P8M
 PxYyLRffg/AFnDvkZ/FoeSB+KSSGKE760irAfqGR5j5QPhgWEvMJKzDGA
 sVInLJcDYIi02VKBRWXWo49nqkveSddyComKFU5aZR7HkHqmR+3B0MIGp
 8h35rur7gucDX5JLEf6TvKxWpYDwIfhelM8fAk70RIs5CTGAPA+ccf10y Q==;
X-CSE-ConnectionGUID: LeAN7shYRTaZmqFyCtsXgw==
X-CSE-MsgGUID: gtMiCftDT1emEjEKVGA+nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="46818804"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="46818804"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 10:05:05 -0700
X-CSE-ConnectionGUID: SAFHyQIfSF+nvAjdIfs4Ow==
X-CSE-MsgGUID: Ks4SUceSSGSC4W9xMu+s4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="96464734"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 10:05:04 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 10:05:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 10:05:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 10:05:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 10:05:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ihgoU8E4/h8+ZTxfLku16B+Y+30u6QTc+oQPgDJjG+TsUqnC78JpOo2yNNPvOWO7pe8LauCm1pbQMItZt1gFr3WdvwpoEBduaq9KzzIqzBzF/NYd+RRUPH9/oqBfMZjoRM8HMkUT4Um+yl7wGNOwfo5tmRMm9mmSVTfOLcvAJHxhDdDyn6ajn4TfDDgcOss77GbBvzBqk5RyuMtqbr9PDyWaPYc4CgOJCkCRgtY+pOA3QUsSN9OXeUkhBlniU5suMOOr/F1hf59JSiREpfljJ6MdWMCGbKLDOYN+lbF88Zjo6FkesCIGJjzN0OmM3O5P7KNYFoiE0eOU33PiNVeBUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmAGat3zG8WHUknSjVq6hM0U67kaEyOA8gw0nOztAeE=;
 b=sy1JqQ0IpDxKtBhFqgQH7hDfrSSe0N7VIjT384QE6ZowOKqHoCgH0udQt1zxJgDV/lnhFilp5xiC6mjSQvInPwC+C8myS9tJO4hpTPnTKCMhbLBCSDoZwjtK45uhTUEiE4xmL9OcyQn+HCOSdExk71kEyKByCEHwghb9Xr19hQS38195p0TwcpMBcVmJ0peg3lxtUupYTfU0vzGKsc71tHG0Aq/wE2HJssC7ne083lbd3WCAoPHY0CSGwxHnTgI8bqprZXlCKrtyPPMevN098aVERzMQkv3jvT/J9ha7uakClbBhJPzNtRsuFNWxPS1OtT3XyWggPeJpkyxJ5jK7kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ0PR11MB4862.namprd11.prod.outlook.com (2603:10b6:a03:2de::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Thu, 5 Sep
 2024 17:05:00 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 17:04:59 +0000
Date: Thu, 5 Sep 2024 13:04:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: He Lugang <helugang@uniontech.com>
CC: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <tursulin@ursulin.net>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915:Remove unused parameter in marco.
Message-ID: <Ztnkt8guUcY8hg3h@intel.com>
References: <F84191BE8AA4A690+20240831135114.497043-1-helugang@uniontech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <F84191BE8AA4A690+20240831135114.497043-1-helugang@uniontech.com>
X-ClientProxiedBy: MW4P222CA0016.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::21) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ0PR11MB4862:EE_
X-MS-Office365-Filtering-Correlation-Id: 29827a1b-f2e8-4613-3904-08dccdcce00a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D/jeUA3T69lb7wtaAM49M4MWVC169aubYYST61qiJ3OySCtWzzxl8oTw2gIT?=
 =?us-ascii?Q?yv4kRYCgABk/IJaAllPWZZNjqBP+dYHXgX2dCM1GkY3kM235wqsYs/9/I7ra?=
 =?us-ascii?Q?MRogjpPOrVJtQAZz+Rj5kwYA3H6RWYxAD2xmcC78uvgnyU5IlnUbpxGkSyGn?=
 =?us-ascii?Q?yWvbU4ZO97cSP0DxUj71FUeHq8KbMYRaLg106C4ZR5Ey2aoVGlHZH6j6Bvtr?=
 =?us-ascii?Q?1bRttoXgBiEa5KdqUrCjYwQadisq+lhpgU7oCJxTwR/VwEpA5j/7gMpTcmHr?=
 =?us-ascii?Q?sJXbVu/x0xz6Dz8vRwclch4aSlQ6RcjXVxBgIjh8Wa11zJHCJkq56IXbrFzn?=
 =?us-ascii?Q?Nz3Ce3bx2rEfhJ0sprvqw2IzzdUJephdYc0m6OTJvkNHYn+RtRTlmI1Oox9O?=
 =?us-ascii?Q?cCWS382DAHSh0GzTHC2E+rtQNx1c4nugpvvpgv2YTtVvwrx525a/4EYbyE10?=
 =?us-ascii?Q?qI0tNdRWwrX4cpzDfABLelUxbyYcWI2z95szKibWTXxMRZLTnFiRxFKRF9+a?=
 =?us-ascii?Q?04bcrQHsywXbMvYsHSOp6DJ9hsEO11GlgzpJ6dtTAj9DYvZJ8O+NDM53SfM9?=
 =?us-ascii?Q?/KylL7qyPAPZpTGFKdZcHkfym+0eA9epbrCZCgVW1qR/ky2RElKuMpCTn7mf?=
 =?us-ascii?Q?aPcWvXVkQTkggFf6QJX1FIexuDf4oNRSuPFWDzNqKvAYoFeyiH/CWjhTkT3w?=
 =?us-ascii?Q?BdHsAGTJIej/p/fj8Ju3LHjgPZj1BbOGpi+Tpf+auZyNFj81iCk7XQHZyw1a?=
 =?us-ascii?Q?whXK03+SqrTk+HKawE47iOK0GQIgeEIXzweegzZgJsarTdTtaNEjE7pN3FQc?=
 =?us-ascii?Q?vVXYRDdMPxedQKJUHCFGATTaUCPuxp7eGdj+D3x/hIE/mGKtLCJto8hkgIjF?=
 =?us-ascii?Q?1Ku08cdy1kh6WkTyUohvEwKGQ8u2yLvoLDIhChqiR9SCqrMPcG22hIFkAqHq?=
 =?us-ascii?Q?COLWothfqoy7kHmCpQZ/g8WB3k/iA/9qopcgTT+ir3zzrsfX9rsq0Au7+QGS?=
 =?us-ascii?Q?UTcrmk404Ij7DFyhUHWyvjI/4OJZYtDfwpF3L3Mw8/CmTg6YcaiM8UkLdoSv?=
 =?us-ascii?Q?h5X4+x3VIV47amI8LvyWgJHuoJRLj/ooqTAGG/DrGSZyTbY2tkgj/GKKZhVL?=
 =?us-ascii?Q?RmC5WRq2cHI6OCwUCKLk/A+cGsKHcOtgm+GD7CTXCvAMZ8sKj/AQ9OPLgdZa?=
 =?us-ascii?Q?9gCgPufLlqXrDDDfpEGs6FfrLV0PCynKQcF7toIwofY+FaZURX8b1QDpGljY?=
 =?us-ascii?Q?hjKEpnt50rMAj7ICplLguSRCB2z4FR2OUVQf2jExPbKqZJHMGMZlN+F9GWJ9?=
 =?us-ascii?Q?9xvymK3bAnVFdRCqG9x55xyVc3UccjhHUsx2sSwOEI6ceQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VLPCNvKLZcpDM0QJSgDlKpY8kUBAbqKy0T3zG2jEUH9HJwtrRF3rYTWG3D7x?=
 =?us-ascii?Q?dcd8LKvonei5paMIxEG29xgHjG+DKdEGG9yb9QnV1tX0mWlSotMN9Iqff0R1?=
 =?us-ascii?Q?4d8a3+EEIag1wfMLB1ozrFbvH47Vdr69o3yptYBetOumrapM+6qq0Ol1LQ0d?=
 =?us-ascii?Q?/gkLNhLjBmlAWJixmGmfzx66bUVtl13Sv3m1jyg6FXQvsxpIpclmA9P4uXH5?=
 =?us-ascii?Q?l/LpUliBM3wiSuf5Ylfy978K67xAv9BNdBKm3NZPaFHAu4ybfHs0sH5Almqb?=
 =?us-ascii?Q?DcbjIAXuS1+zD3uq/LpWcU9DKXuGu1Mzt9DtjzZwjWqP7fnEhvVbNoV7sArZ?=
 =?us-ascii?Q?br7iJzplL8uURgFIn3Y1wNgU6M2PXYMIdH0oVwiqOFXGITa0F7LY3XKizWVf?=
 =?us-ascii?Q?IhjXEBVcz3j/DMoHku9ALjRLIGF00rhZQSwCBeKCfxHqp1epwfx0XvK5uVv5?=
 =?us-ascii?Q?R+4DG0HlNq2hY2lwTgvJ7aJvVuz89jNsEqQGo6NzBi45yziBeZZ8qe74CXJp?=
 =?us-ascii?Q?9aRv3Flaj7CKud+Yq+kwTwttzwBEcF61H91mYVJY/J5w90YuBqyslKKVssGT?=
 =?us-ascii?Q?zokpuk7zY4KBHzoqI/zjtU2mm95qyBHJ0zuKZSf8k5RdZCuwZ0FIZ796vbyT?=
 =?us-ascii?Q?g3ipryR5aPU4UvdY+IeEusjQWB6iuA1qQLGnwIlVmp5n97+vZXVmBcjAb4ry?=
 =?us-ascii?Q?jqbXooVzeqGquVU081mdHUXabat5dMeEpnA7xW0uNyEf+rAV8HV68wvqM8d0?=
 =?us-ascii?Q?nqGrSlsBg7sPkyE20OQXYW+uqjqb8gqEn2cRyD0lj+ONiFmXyTw6WcMtpbRs?=
 =?us-ascii?Q?hlh6abqkUprDJU9jOgdEpVayr018TxccIoyQ9AVm89zR5FeqkYmtiDFbmFyJ?=
 =?us-ascii?Q?dJwLIymkgMZJj0qbGVrS1NOrM90rcljnK9687oFElCcR8Uuw1hxiU+jRoMYd?=
 =?us-ascii?Q?bqWMu9qDf1MAXn4a9xO40e2V5azgTfXp9F2+5ggtSN6cNSClYXeoKul571IZ?=
 =?us-ascii?Q?G18EUisknQKP8+fv+7+sF/jtd7+LkYlfuOsEVrcpC+8R4wyTe2jZUBCZ58il?=
 =?us-ascii?Q?yoUBrKYa1oF/Lg6RKQuL0TaSHXK85oGGoHUGfBOlAJVCMX1OJkD88k5DSPEI?=
 =?us-ascii?Q?dCPazjeg9NyS+s2dxUD+zyMI989bY2UE9uauVS2txEmk+k0eX3iFk07LujTV?=
 =?us-ascii?Q?pYni9QoUqEYkpwnvjztQ85g5JhNNokPQ2y6xxet1Cp6eabj9/0EZZ8mGl0bJ?=
 =?us-ascii?Q?q0QuHNNxyVSg3mVSQ0H2ppPEfNEkpGL3UIZN5CVkOKIOyTzxlHyCDRsSBD64?=
 =?us-ascii?Q?zhrXOSknSURMXFsWY1zRacDJMeU/v+Q3w+7A5pXMqhYL4Ou9AnF1H7JzLSbK?=
 =?us-ascii?Q?+6ZaFdg1C/ZIHrbefrv1oWwBc4F6Jrj73YmDFhib2hPLZh3F/Il+bDMET+Xb?=
 =?us-ascii?Q?snMwBNmIngOltt1INiSn1HCi0/iRjL4++PWYRnXsoSSAcAExOpoKQPAFon1R?=
 =?us-ascii?Q?qQOPhvNAdsk26W0Ts9sjO+7G3D6d7q0YVsXWh4+Wld/9pEEvuberknqiti7f?=
 =?us-ascii?Q?eVLsDid7bBzGbq/HRyNhoP2fmhTNun3KewylnFbonyOkXNsnXktANWVPBci6?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29827a1b-f2e8-4613-3904-08dccdcce00a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 17:04:59.9430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJXUsp/yb1f8QH94ubBbSFAejwYVwNRyWF4xsniBSeE56yPHIWdk+8WfOyawWX0qwlr/yJkoc4Y2s02rUPVqEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4862
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

On Sat, Aug 31, 2024 at 09:51:14PM +0800, He Lugang wrote:
> The parameter dev_priv is actually not used in macro PORT_ALPM_CTL
> and PORT_ALPM_LFPS_CTL,so remove it to simplify the code.

It is magically used on our back... hence the build failures that CI got.
Jani is doing a great clean-up work on the display code to get rid
of this 'dev_priv' usages in favor of a better display code separation
and using intel_display struct.

But thanks for the patch and the interest to help.

> 
> Signed-off-by: He Lugang <helugang@uniontech.com>
> ---
>  drivers/gpu/drm/i915/display/intel_alpm.c     | 4 ++--
>  drivers/gpu/drm/i915/display/intel_psr.c      | 2 +-
>  drivers/gpu/drm/i915/display/intel_psr_regs.h | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
> index 82ee778b2efe..7a93ba627aa6 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -330,7 +330,7 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
>  			ALPM_CTL_AUX_LESS_WAKE_TIME(intel_dp->alpm_parameters.aux_less_wake_lines);
>  
>  		intel_de_write(display,
> -			       PORT_ALPM_CTL(display, port),
> +			       PORT_ALPM_CTL(port),
>  			       PORT_ALPM_CTL_ALPM_AUX_LESS_ENABLE |
>  			       PORT_ALPM_CTL_MAX_PHY_SWING_SETUP(15) |
>  			       PORT_ALPM_CTL_MAX_PHY_SWING_HOLD(0) |
> @@ -338,7 +338,7 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
>  				       intel_dp->alpm_parameters.silence_period_sym_clocks));
>  
>  		intel_de_write(display,
> -			       PORT_ALPM_LFPS_CTL(display, port),
> +			       PORT_ALPM_LFPS_CTL(port),
>  			       PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT(10) |
>  			       PORT_ALPM_LFPS_CTL_LFPS_HALF_CYCLE_DURATION(
>  				       intel_dp->alpm_parameters.lfps_half_cycle_num_of_syms) |
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
> index 257526362b39..d66dbb529e1d 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -2076,7 +2076,7 @@ static void intel_psr_disable_locked(struct intel_dp *intel_dp)
>  			     ALPM_CTL_ALPM_AUX_LESS_ENABLE, 0);
>  
>  		intel_de_rmw(dev_priv,
> -			     PORT_ALPM_CTL(dev_priv, cpu_transcoder),
> +			     PORT_ALPM_CTL(cpu_transcoder),
>  			     PORT_ALPM_CTL_ALPM_AUX_LESS_ENABLE, 0);
>  	}
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_psr_regs.h b/drivers/gpu/drm/i915/display/intel_psr_regs.h
> index 642bb15fb547..b4984e589d7e 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_psr_regs.h
> @@ -295,7 +295,7 @@
>  
>  #define _PORT_ALPM_CTL_A			0x16fa2c
>  #define _PORT_ALPM_CTL_B			0x16fc2c
> -#define PORT_ALPM_CTL(dev_priv, port)		_MMIO_PORT(port, _PORT_ALPM_CTL_A, _PORT_ALPM_CTL_B)
> +#define PORT_ALPM_CTL(port)			_MMIO_PORT(port, _PORT_ALPM_CTL_A, _PORT_ALPM_CTL_B)
>  #define  PORT_ALPM_CTL_ALPM_AUX_LESS_ENABLE	REG_BIT(31)
>  #define  PORT_ALPM_CTL_MAX_PHY_SWING_SETUP_MASK	REG_GENMASK(23, 20)
>  #define  PORT_ALPM_CTL_MAX_PHY_SWING_SETUP(val)	REG_FIELD_PREP(PORT_ALPM_CTL_MAX_PHY_SWING_SETUP_MASK, val)
> @@ -306,7 +306,7 @@
>  
>  #define _PORT_ALPM_LFPS_CTL_A					0x16fa30
>  #define _PORT_ALPM_LFPS_CTL_B					0x16fc30
> -#define PORT_ALPM_LFPS_CTL(dev_priv, port)			_MMIO_PORT(port, _PORT_ALPM_LFPS_CTL_A, _PORT_ALPM_LFPS_CTL_B)
> +#define PORT_ALPM_LFPS_CTL(port)				_MMIO_PORT(port, _PORT_ALPM_LFPS_CTL_A, _PORT_ALPM_LFPS_CTL_B)
>  #define  PORT_ALPM_LFPS_CTL_LFPS_START_POLARITY			REG_BIT(31)
>  #define  PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_MASK		REG_GENMASK(27, 24)
>  #define  PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_MIN		7
> -- 
> 2.45.2
> 
