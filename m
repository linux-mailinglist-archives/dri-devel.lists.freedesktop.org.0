Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DF0860234
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 20:06:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DE610E955;
	Thu, 22 Feb 2024 19:06:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ebKRP8XF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A984E10E0A0;
 Thu, 22 Feb 2024 19:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708628798; x=1740164798;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TGtIY7Walra+75J+vJpabHIURacTbTv1Eky/N+fJ12o=;
 b=ebKRP8XFrhna3znPOE8vtAb5CgPUc/uILLJ2JJn6xViVCSdsw8PNkL8W
 2z0HHQvkYLKhcGVxJ5BDXClFXEmAgGSMMgMDaNJEqMeydumc/ydHzYsHu
 BTf2dKWMxARIO/RRFd0GnHcXPbkW7VFWVrrxFuR/ETQFWcJxpDNKgWJqX
 ZwE8k1ZcIbT/JVuaVu36dGEsPJ+gzapw0SRxPwME1ZZgAbUi2ZFBZM5mn
 pPYa4p6aw6rCkjmDy6Xxj0r6RdcR894DGikX6diWS3mIdCvQ+5DmYOU4I
 PHSIZEWo7Cn9yG5yusBPZSJFk3fkH1HSQBVly2qm9yvLL7gxIs0xqy3c8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2763110"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2763110"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 11:06:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="28728953"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 11:06:37 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 11:06:36 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 11:06:36 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 11:06:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e08xHI9n8mxDQhuz0B3YhjZ2fcL8Ve6nnLZWAqRTPvFcJAttP/fHJ1siErT/jKLxwyb7F4bVxbF9FnS9Tu7ntpJJsEO1CJAtF4GWi1f97GyWAouyqcut07TPBf+VhjemgXIzhUgU/tXXXbX88nSS5U/DGBinNz0CuNES2osXVp3lOxS9Y2YPQh96zhHmTy7HJ5DZddrteZcjQm7Zq28tB+ZM4WIXfCemaeITNzcg1v5vmt4loK5KOMcKT5+QQoMsHLFSEXF18IL+EPo8cXmnAWF6X1k2brr8KXkPewU+6haPdB4T7rAlKoqAoLKrXnkYwtjexD0Jn5hSw4rb1Z6TLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jt4xsx8VHh+k7Stv58KMWrueBwJ+zRjRB1G+KTPy4ag=;
 b=G9q2x3o5k0dU8shaE2rnYInMOZsV1aG4sp+/9pHWGAwwQ+4oYjOIR63nOsrjhA2mThtDl1L53u5x/uAeDOf1rWPHEk7q9sZzQxftELuK2lDYB60cp1Fx/1XYOB3FnlNisM9qAURHFHG21srjasImOeJo5kNBlnlXROBcjSLaNaPYZA894sGwCmmfuZC21ofjD0a/q3KqJBSOhGA1xi62R/MJV4dvFPxcGNQ6vKVKyB+BRQ/cIz3AyToYsbVGku4lEmN9CRqxUC1QVcf3DVLws0yUehFSQhZp14BswRgjvZ6YyfDQgqUJ2iMyOcSjGxCwQtLJNUR1rhOLSAdRY/JfMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB6800.namprd11.prod.outlook.com (2603:10b6:806:260::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.42; Thu, 22 Feb
 2024 19:06:32 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 19:06:32 +0000
Date: Thu, 22 Feb 2024 14:06:25 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
CC: <dri-devel@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, <robdclark@gmail.com>,
 <freedreno@lists.freedesktop.org>, <dmitry.baryshkov@linaro.org>,
 <intel-gfx@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <quic_jesszhan@quicinc.com>, <linux-kernel@vger.kernel.org>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/2] drm/dp: drop the size parameter from
 drm_dp_vsc_sdp_pack()
Message-ID: <ZdebMVIA_EH_R_4D@intel.com>
References: <20240220195348.1270854-1-quic_abhinavk@quicinc.com>
 <20240220195348.1270854-2-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240220195348.1270854-2-quic_abhinavk@quicinc.com>
X-ClientProxiedBy: SJ0PR05CA0077.namprd05.prod.outlook.com
 (2603:10b6:a03:332::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: ee04d144-870c-4446-09fb-08dc33d961c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JbLtv3krVJWdPyXDA2b8XzF3amQL8JhtQFxsVjAZQVNbKaOkZQfendsT7p6bsqe+gqQp95/4fqDknbAs2lqelIo6jHyo/KfPFY3l0CGB6O6Y3YcuaaZaBJPqC4tSKvyPxMyfxbEVsKH/O3RZ5/KGpmYB2P77VrxBaUfJDYtFaarfzK5qKI26189hBaiMNo4xVrrZvCYdQXSMKQK9QCPG5xCkm4LYu2S+sEViQph4FjbEM5uTzBVmLg9LcYIYFDC74iiXah858/I9ER2L7TsLZ2gRIZ/Evt0WE+EDyT1BxXfJ2GfnBueW1Ba2OisJNSDVY988B1aNpmkSNRf7F2njZEktIkg9lLTmEi4e0OIgP5c8krQLmOR3+kYrOBtzGpmmdkE+92ZgKDAh+ItkvZMdRYqTuFeimdRfI6KjONuZDfOFyijVqnhl9nokBUyWttlJ9CNbIg4AgxNRxjxhbCo0jQJVRGIqnzLfbmjBIi47/SZs2buKLXh5LU9s5LCGIxhk+8Q6gat48sIJYOUeCDt/PdfEzEbkS/jmsjUMgriR6+c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z5ooizlSn63eNhbbf8jV1+L5JcEJB3I/Ukhjx0MJpPzyrw0ikTPBjp7YFIVF?=
 =?us-ascii?Q?sPi9QK5PkZYyDG0/hwbu5eG84WvalZE2L91RG7pIs9YpS7jZM0Rha4Z9wKl7?=
 =?us-ascii?Q?PNrN2iA6N1rmSdGjIiAGbms2Jfgf1qY3xw2vMuBu2kBNj6LmqGGEf/tcVs3j?=
 =?us-ascii?Q?4boaX8PygzxlsmKIDkXh3jYICxeZHYOhcc7Se2KAKyF0zlX8kBTPSj0k1LF/?=
 =?us-ascii?Q?mz1voJejZQc0ahX41Ey3wPu5yBffbiv3EfdyL2a8OkXdX/w+y+cgtiqsvkVC?=
 =?us-ascii?Q?ibQU1Py/VJtGGfUKJvX4BpDJg8XW1MDnOYsQONfpnoRbp06cEQHk4+cTPhQT?=
 =?us-ascii?Q?giHpAlITY38lfGgb4CPNQWxX5Ei+ymB7cFqIvfEcforXG4kLYaTW+uy9spLt?=
 =?us-ascii?Q?Uf3ILDy3+y481q9IdpsX2F2cu4EP0sKJU34SBl3gcxILRzQkl/y9lfYjqEPY?=
 =?us-ascii?Q?sibwk8DxBhJobfbDIJBzar3N5CidhId/6VORSEAeADKC/WrWgHTd/lM96mvn?=
 =?us-ascii?Q?yxEV/sXAn5v/UeSsbHcmcJjsfYVvb4wfTAI8WZ2rkWBrUHH5U3B6myj4bGCJ?=
 =?us-ascii?Q?xOiVUrKjGuzYo6Ltr0O6AWwREsleKIbcH67BcgN5N4X4iRDSCrMu8Xu/qMD+?=
 =?us-ascii?Q?6Ep/Kx+/YxzNwYBemrmKXucHkWYED9UkRikNIwV1MOR3F31RnOz3fP1jiSxN?=
 =?us-ascii?Q?4ZCoi18FoYoRsVTf7NXvLmn+4h8Dw3SbCUkFiTKI8ifZaVBLUb9V3DENu0+k?=
 =?us-ascii?Q?5jdO474ZUdZ7ZNXaN8PFlKDLkHPiJAsE8ZQBFdp9QBegTnC/hRFgBjVu8jXF?=
 =?us-ascii?Q?F4DHXOuJNz0P9myUbyk+Xpd9n1ts0+cF+kxwmabnYRnqHFkjSXRtnHO4v0R5?=
 =?us-ascii?Q?oq1hDXEl1PFinGKtRBcGv83EPxlQS3tRORndB/VukXArS/DynNJ8Es92WgxP?=
 =?us-ascii?Q?oHxMGSBUtr9UORt3ImrgKR72ClKADUpUMQz0KFtce83xWER8Ee2yC9XjfTS5?=
 =?us-ascii?Q?8AgOqU0S/VFDadeWgL6hh6ivzGzBpp++iCpI0agbq3c+AnBrnmzJQbrZrBFC?=
 =?us-ascii?Q?GA1fo2vwN81oqDYtr57/CnZpq5fbHVz0pceQP49YVUOfMKbzF8m2I8kPkqG9?=
 =?us-ascii?Q?nuYpaED6/tuUczP7dtTvOH9aT8e1n34r5hdYoWOkj9pg4uWxhRYts+3PhTDA?=
 =?us-ascii?Q?1RkY9Q6GAwY0kCugc+7M/9pmGXjykmugvHqc8foN0arFg+HiofuiNhXcTLd6?=
 =?us-ascii?Q?tW6crujAt3hvObbB2LZy+JQq2jJwtD8zH8XTRhROy4gp+MA/JZYsUWnfyLwG?=
 =?us-ascii?Q?cnjKHzl2OoC2J7nGWzPT8hRs3sXb/Qtyl+0HjNajYje+cAfmw2LvsZ/+1kHA?=
 =?us-ascii?Q?DKhH8B3v66R3Z7kTj6e5oc7g0LpNlX57p5oazdZKA2IH7PZb+UKoF9HI7saZ?=
 =?us-ascii?Q?LzjIPlYHrQ2YrGlWJfzwe3/2R/pbdqI4q9Mvv2H9bDSqrCYU8CkuU8NEvfjv?=
 =?us-ascii?Q?ckCjc0IHl2AVCh9xzrl9MH6EjIPB+5pUMw9XYBwSwZxB1gBjclDNRbwbM70H?=
 =?us-ascii?Q?KtdSxTkdL2kyuLDFRY6oBqLBQ2PN6XLDq/JyqJp6gjJiy0tGZiMJ0ogpU1wR?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee04d144-870c-4446-09fb-08dc33d961c9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 19:06:32.3240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NB+uIqZKy0VsKBNOKl4n6g1H4e8+BNDrCSx4wkx2B5fQEJ3GGmdI4wA2OXgWkXeDHbqCFn+LmVM06tUokQtI7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6800
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

On Tue, Feb 20, 2024 at 11:53:47AM -0800, Abhinav Kumar wrote:
> Currently the size parameter of drm_dp_vsc_sdp_pack() is always
> the size of struct dp_sdp. Hence lets drop this parameter and
> use sizeof() directly.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 8 ++------
>  drivers/gpu/drm/i915/display/intel_dp.c | 3 +--

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  include/drm/display/drm_dp_helper.h     | 3 +--
>  3 files changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 6c91f400ecb1..10ee82e34de7 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2918,19 +2918,15 @@ EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
>   * @vsc: vsc sdp initialized according to its purpose as defined in
>   *       table 2-118 - table 2-120 in DP 1.4a specification
>   * @sdp: valid handle to the generic dp_sdp which will be packed
> - * @size: valid size of the passed sdp handle
>   *
>   * Returns length of sdp on success and error code on failure
>   */
>  ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
> -			    struct dp_sdp *sdp, size_t size)
> +			    struct dp_sdp *sdp)
>  {
>  	size_t length = sizeof(struct dp_sdp);
>  
> -	if (size < length)
> -		return -ENOSPC;
> -
> -	memset(sdp, 0, size);
> +	memset(sdp, 0, sizeof(struct dp_sdp));
>  
>  	/*
>  	 * Prepare VSC Header for SU as per DP 1.4a spec, Table 2-119
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index a9458df475e2..e13121dc3a03 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4181,8 +4181,7 @@ static void intel_write_dp_sdp(struct intel_encoder *encoder,
>  
>  	switch (type) {
>  	case DP_SDP_VSC:
> -		len = drm_dp_vsc_sdp_pack(&crtc_state->infoframes.vsc, &sdp,
> -					  sizeof(sdp));
> +		len = drm_dp_vsc_sdp_pack(&crtc_state->infoframes.vsc, &sdp);
>  		break;
>  	case HDMI_PACKET_TYPE_GAMUT_METADATA:
>  		len = intel_dp_hdr_metadata_infoframe_sdp_pack(dev_priv,
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 8474504d4c88..1f41994796d3 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -812,7 +812,6 @@ int drm_dp_bw_overhead(int lane_count, int hactive,
>  		       int bpp_x16, unsigned long flags);
>  int drm_dp_bw_channel_coding_efficiency(bool is_uhbr);
>  
> -ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
> -			    struct dp_sdp *sdp, size_t size);
> +ssize_t drm_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc, struct dp_sdp *sdp);
>  
>  #endif /* _DRM_DP_HELPER_H_ */
> -- 
> 2.34.1
> 
