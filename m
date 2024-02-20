Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F13885C2F5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 18:46:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B5510E500;
	Tue, 20 Feb 2024 17:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TrXCpTD3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7829710E265;
 Tue, 20 Feb 2024 17:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708451194; x=1739987194;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dhrxVzx7HeyLxwTTTk9vsNgTyetCr0xCbiOlSkExwGU=;
 b=TrXCpTD3LM1Aj+Ub69p89pS+OEFYXILeM8LSkRyIgorC5M1RKLO0HoDR
 apYAtjy0DLSalZtG/FXSL/sc4dVG2m23D/iUBH1zY6+wIKQTLPGwKgmrg
 9LJB1LPwqfA+z01+eG749EruqNHbwLyiq00YkuezTUNu8i6X43XoX+XLf
 +PLKmftaWGJEA09CNCH/m84RjN7T4rk3B5e1itp96LAkjvMbDxoNK5zVp
 WlFaqK1j7h148QNuA8mhLeyEvhrSuHbNwVNipd/GB731OyU4WkNN/awHE
 dx80Ca7UAx5zV8dnx37/thtGRIeJbA7wgD17bQRQ9Yk0Zq5bGEgHVRKr8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2712881"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2712881"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 09:46:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="9449701"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 09:46:30 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 09:46:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 09:46:29 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 09:46:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmDGscGuNg8hiroEa+0TRjfXc62ClE0ouQnsV21usJyPA571Ac6d4BItQtpG5DHDS9KJ2p/9zOjSiZ1DoJ+eSkwzpQcTSOaXykMv/I7gydJLHV0dBdIUMKtOV05W5SaSa94OshRCkXDMBfha6lILcPsHnItikhhX0W9oZKPiQJmlNm65THIcVHG2pSPv6wq3Fbl8JvRABNGnpGbuect24lq87ndggJG+M3ugwzW9SLkDSZ8Z0vxtPEvfeZJcBmas20v/YB77KeeNUPYjS5O3QkCXmiW+QZjcc2zWKBKIslDdCoLArBy/crM7YaKXGiDJRbF5npoDGVRdGIylCrBr0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPEArK+qGk6JjwjR7pPjoSfNkX3LW6gKkGnWtvRiMkc=;
 b=J5B22JgcKYWdLXGH6iH2daMdcvLdnd8cffnUwN+bx7D+zGhSlBVo9wq+PZpev+sHZZ/oT7vKPD5jg5QNDbw3vrgSobTkBiDuCqL6wlt1pkQdA9FHqUFQqNDVkD0kmJuBHK31OTT+F1V6pUR8GL4BkUxtyFGTIz4zDEKfBFDjB77kMeS8sE6Vy8MrzmHVMTvnWo5XPNz6YubfsbZngTDau3I62VyQtH0xqQuS5e7o19iafzdiNEDhg5qPIziM++iB2AVL+zT/k9rysDV8416dI96+S970PJzuulRmx1XGJI9M5k6rJBJjjEEcvP7O4P4cWAA5mriTYP8sWsvCXgp0Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA0PR11MB7281.namprd11.prod.outlook.com (2603:10b6:208:43b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 17:46:27 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 17:46:27 +0000
Date: Tue, 20 Feb 2024 12:46:22 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Maxime Ripard <mripard@kernel.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 David Airlie <airlied@gmail.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, Ville
 =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/i915/tv: Fix TV mode
Message-ID: <ZdTlbnkgTVUUDjXO@intel.com>
References: <20240220131251.453060-1-mripard@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240220131251.453060-1-mripard@kernel.org>
X-ClientProxiedBy: SJ0PR13CA0045.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA0PR11MB7281:EE_
X-MS-Office365-Filtering-Correlation-Id: 018dc2e0-bbab-4eca-6617-08dc323bdcb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZFBobAikQOb7USps/J7TPzV7pkkCjV1G6MQAUu5XeeYg9bpEP3OyW/EmRTcOzTpDQkXOrcx99tLU+94hY84VL8mjCgMrAHAc1aQo9kJeUIdrhVEVCu3DD1DTIuuwBLx1c9oFYsikjEEmwG3ARbbCMaWcWAn4SgpkDsdqPpq0+Rqx3WoDdrEt6t6HhF5YWDr6Y2PrYnC5PFzkKt3pYuM1Ftl3cbd7VbMrIQGtiGiX+UG4Bq6sntE3Upw0NdbWL9qzzbt5CjoISCNRHpW5DAiOlAYeqLL+Pe6VeuBF5q/muTBafq51kTN2RK+zMZCzgpvashIKoH/NDi7jTrIou1XGIaiTjzk6/l+rHGLUGqgRa9tsQdYdxp1im85dr5S2v57CD7Od33zW2Xbj89C31091NBuMIqVt6oRknT7kyC7SuXql5Cu8uSZt+thH1PIi8jsjW8juBUQRoN9oIX3xd4l6IHg2m8jXBjo3wzNbCQUWhyo8wRFpLHke1XMj77qQezK4naRyU5wxZiEeFHxAtYfnoPEVonAipAFwYkij9sW9Vtg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WmCKrQqDns+RZi5GwTX5dTi9mWqvdFLgn1mNzYXvZBXcYKuwowO1OLG0BG?=
 =?iso-8859-1?Q?BoSgr1AMvVuz+w9lqTBIFUuEGW6D7eEhkWtKhNrJJUDEXuQohUAwOogAAc?=
 =?iso-8859-1?Q?5Xub019GPp7NgFO98Fznb3LG/dz4p4Qdr6vqRpo5O7iBZP6S9vSewC4Lbp?=
 =?iso-8859-1?Q?tJ9Ki4F//Dsm4rNtlhK7mQnIPHqWKYG5sFbIPWoIVJVTAmO6mApmFzrcJq?=
 =?iso-8859-1?Q?uh3eFihR7WMYvEWM56zeCgUbp/+bPOUTykEsFMT+huRp7sM6ztctrr/q9G?=
 =?iso-8859-1?Q?c5V+vtwLBTnyqRiuCG6ZMWq28ZKruP87zb0bEjPvFGf+cE0/7EwrKdH7sp?=
 =?iso-8859-1?Q?+2UGxO/VHfJEEqpiVBo9kFiXTU7MWec221V0c+1ctT2b2l9x8TY6afxpqL?=
 =?iso-8859-1?Q?hdu5+O63Tt//AvvnshGno1Tqh8WuTcUQW8SWA8V/KLENrBgl4rTguOeqzb?=
 =?iso-8859-1?Q?g02ybcDpUy7MD4x96S+6f8bQEhOGoh9FFuBYzRWq6k+YiuDeEYWYRZb7qJ?=
 =?iso-8859-1?Q?Eu83URy8XWLIV431cB03Y59F82mMSjG1CPwd0DMB13w87Bu1dRMB+P7/Z6?=
 =?iso-8859-1?Q?CYwjp/EzVBuXvD6r7hhgHuLcVUm+JqvRq3E1A39z7uyavOA4XdpRjgPpPK?=
 =?iso-8859-1?Q?YHeYY67r5Qh1LVHXFNW4py0vKEtCknE+cnWfmGwDB0HsIC3y6q0n3+/qjO?=
 =?iso-8859-1?Q?CHinoiEpIHsWc8hAr89IacSdrx6qvo0Zwqo0xJPS15qpH003khnXrdIAHI?=
 =?iso-8859-1?Q?k5C0UbQOWx+GA6FMW5DJ60pnVu6VXdGaWmag9O24f9zIHAGTy3CbqlEls5?=
 =?iso-8859-1?Q?vL+aPaCa18+TJlwKNepy9JJFkc3mtXTd1dokIW7trh8/EdvVdIBXN+pvJM?=
 =?iso-8859-1?Q?1ivbUW6Pq6KyMsZdIV/ddZ4tcCpRD1zC4e4ZwjzUhkTMlTnuihBd/wRdaH?=
 =?iso-8859-1?Q?b7ksJUyx7EMMBucUfhjEMOgW/8sopDLgvsouZ9JEznPZL3VCRtsodPk4EV?=
 =?iso-8859-1?Q?cjutNHGxs0Sl4b/REt92WO+CGHNxLF5OMVELG3dqLHdiUREEpzpyh2mGSP?=
 =?iso-8859-1?Q?SpP22VRLKAXvhP7LsmEZqeBuqHGc9z3KuG9ubIlR5xQacQdZ5nqF8K2qlc?=
 =?iso-8859-1?Q?qHcijWso2zsgWeTeWNoIVQ04xEieHwMRn84Pw95xjpRYpOfCW9UrE9qUOx?=
 =?iso-8859-1?Q?K9hQCpwxv3SpSelv10Fxd6xdBMmUWQZFdEaPW6gZCJDCyPDrBPKT/y7LjV?=
 =?iso-8859-1?Q?gSgIHigev2DOntTN9AMzgPkVrTF8s6VG7O8z0QurR25qpaUjfgKtDGGPX3?=
 =?iso-8859-1?Q?/vUY2W7OnMcl2Uj6T4NCoEBPOmFeM28eNyGZXFldGjci+LuedUSlrdOSTN?=
 =?iso-8859-1?Q?7s2COT221vTD/mkG5SdYnkD8Gv+4eoZwho1ar3Z0YCnlWSRubZu77d5vHf?=
 =?iso-8859-1?Q?sjuWtDYl42awLotE2j5Qm227dVHsCHmNsTHgxrmE0KtAncH0uH71aMHNdg?=
 =?iso-8859-1?Q?Hc3oaYmMDx+rZvdQCt6EM7TOUZ3BpYSCpwuNWfo9OkJ7rJCAJVnE/FpTIw?=
 =?iso-8859-1?Q?S6KzpHMN9aRGccVTcs/8CS9B624AmhubH6Q900zFYt1+JzcLXlj4cHhv4+?=
 =?iso-8859-1?Q?079Lu+tePbA9sXI5ASaLl9fPYhwduAtjxV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 018dc2e0-bbab-4eca-6617-08dc323bdcb4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 17:46:27.0311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuDSEwG/pAchvX1fgggtd3l6L/Xbjn+Roe5FqYUQeLmXIWrgWPTHz0s7dNQWJteJj3wP9ELuJPPmpU5IFQjtzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7281
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

On Tue, Feb 20, 2024 at 02:12:51PM +0100, Maxime Ripard wrote:
> Commit 1fd4a5a36f9f ("drm/connector: Rename legacy TV property") failed
> to update all the users of the struct drm_tv_connector_state mode field,
> which resulted in a build failure in i915.
> 
> However, a subsequent commit in the same series reintroduced a mode
> field in that structure, with a different semantic but the same type,
> with the assumption that all previous users were updated.

just for the record, commit 7d63cd8526f1 ("drm/connector: Add TV standard property")

> 
> Since that didn't happen, the i915 driver now compiles, but mixes
> accesses to the legacy_mode field and the newer mode field, but with the
> previous semantics.
> 
> This obviously doesn't work very well, so we need to update the accesses
> that weren't in the legacy renaming commit.
> 
> Fixes: 1fd4a5a36f9f ("drm/connector: Rename legacy TV property")
> Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushing to drm-intel-next soon...

> ---
>  drivers/gpu/drm/i915/display/intel_sdvo.c | 10 +++++-----
>  drivers/gpu/drm/i915/display/intel_tv.c   | 10 +++++-----
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
> index 825638702ac1..5f9e748adc89 100644
> --- a/drivers/gpu/drm/i915/display/intel_sdvo.c
> +++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
> @@ -1220,7 +1220,7 @@ static bool intel_sdvo_set_tv_format(struct intel_sdvo *intel_sdvo,
>  	struct intel_sdvo_tv_format format;
>  	u32 format_map;
>  
> -	format_map = 1 << conn_state->tv.mode;
> +	format_map = 1 << conn_state->tv.legacy_mode;
>  	memset(&format, 0, sizeof(format));
>  	memcpy(&format, &format_map, min(sizeof(format), sizeof(format_map)));
>  
> @@ -2323,7 +2323,7 @@ static int intel_sdvo_get_tv_modes(struct drm_connector *connector)
>  	 * Read the list of supported input resolutions for the selected TV
>  	 * format.
>  	 */
> -	format_map = 1 << conn_state->tv.mode;
> +	format_map = 1 << conn_state->tv.legacy_mode;
>  	memcpy(&tv_res, &format_map,
>  	       min(sizeof(format_map), sizeof(struct intel_sdvo_sdtv_resolution_request)));
>  
> @@ -2388,7 +2388,7 @@ intel_sdvo_connector_atomic_get_property(struct drm_connector *connector,
>  		int i;
>  
>  		for (i = 0; i < intel_sdvo_connector->format_supported_num; i++)
> -			if (state->tv.mode == intel_sdvo_connector->tv_format_supported[i]) {
> +			if (state->tv.legacy_mode == intel_sdvo_connector->tv_format_supported[i]) {
>  				*val = i;
>  
>  				return 0;
> @@ -2444,7 +2444,7 @@ intel_sdvo_connector_atomic_set_property(struct drm_connector *connector,
>  	struct intel_sdvo_connector_state *sdvo_state = to_intel_sdvo_connector_state(state);
>  
>  	if (property == intel_sdvo_connector->tv_format) {
> -		state->tv.mode = intel_sdvo_connector->tv_format_supported[val];
> +		state->tv.legacy_mode = intel_sdvo_connector->tv_format_supported[val];
>  
>  		if (state->crtc) {
>  			struct drm_crtc_state *crtc_state =
> @@ -3108,7 +3108,7 @@ static bool intel_sdvo_tv_create_property(struct intel_sdvo *intel_sdvo,
>  		drm_property_add_enum(intel_sdvo_connector->tv_format, i,
>  				      tv_format_names[intel_sdvo_connector->tv_format_supported[i]]);
>  
> -	intel_sdvo_connector->base.base.state->tv.mode = intel_sdvo_connector->tv_format_supported[0];
> +	intel_sdvo_connector->base.base.state->tv.legacy_mode = intel_sdvo_connector->tv_format_supported[0];
>  	drm_object_attach_property(&intel_sdvo_connector->base.base.base,
>  				   intel_sdvo_connector->tv_format, 0);
>  	return true;
> diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
> index a96bcfcf90a3..2b77d399f1a1 100644
> --- a/drivers/gpu/drm/i915/display/intel_tv.c
> +++ b/drivers/gpu/drm/i915/display/intel_tv.c
> @@ -950,7 +950,7 @@ intel_disable_tv(struct intel_atomic_state *state,
>  
>  static const struct tv_mode *intel_tv_mode_find(const struct drm_connector_state *conn_state)
>  {
> -	int format = conn_state->tv.mode;
> +	int format = conn_state->tv.legacy_mode;
>  
>  	return &tv_modes[format];
>  }
> @@ -1705,7 +1705,7 @@ static void intel_tv_find_better_format(struct drm_connector *connector)
>  			break;
>  	}
>  
> -	connector->state->tv.mode = i;
> +	connector->state->tv.legacy_mode = i;
>  }
>  
>  static int
> @@ -1863,7 +1863,7 @@ static int intel_tv_atomic_check(struct drm_connector *connector,
>  	old_state = drm_atomic_get_old_connector_state(state, connector);
>  	new_crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
>  
> -	if (old_state->tv.mode != new_state->tv.mode ||
> +	if (old_state->tv.legacy_mode != new_state->tv.legacy_mode ||
>  	    old_state->tv.margins.left != new_state->tv.margins.left ||
>  	    old_state->tv.margins.right != new_state->tv.margins.right ||
>  	    old_state->tv.margins.top != new_state->tv.margins.top ||
> @@ -1900,7 +1900,7 @@ static void intel_tv_add_properties(struct drm_connector *connector)
>  	conn_state->tv.margins.right = 46;
>  	conn_state->tv.margins.bottom = 37;
>  
> -	conn_state->tv.mode = 0;
> +	conn_state->tv.legacy_mode = 0;
>  
>  	/* Create TV properties then attach current values */
>  	for (i = 0; i < ARRAY_SIZE(tv_modes); i++) {
> @@ -1914,7 +1914,7 @@ static void intel_tv_add_properties(struct drm_connector *connector)
>  
>  	drm_object_attach_property(&connector->base,
>  				   i915->drm.mode_config.legacy_tv_mode_property,
> -				   conn_state->tv.mode);
> +				   conn_state->tv.legacy_mode);
>  	drm_object_attach_property(&connector->base,
>  				   i915->drm.mode_config.tv_left_margin_property,
>  				   conn_state->tv.margins.left);
> -- 
> 2.43.2
> 
