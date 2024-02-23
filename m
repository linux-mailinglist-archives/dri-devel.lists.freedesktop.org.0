Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFBC860F22
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 11:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BE610EB84;
	Fri, 23 Feb 2024 10:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KzJEGUQK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF2710EB84;
 Fri, 23 Feb 2024 10:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708683837; x=1740219837;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ACy51mKyFtT1CYNV4Xsv3DpnzsDV/OXeEYcWE8GXVL0=;
 b=KzJEGUQKst9+ot1CwwLzbI2Ok0ujUcSWYGZZQLmh3nd3Rvjq+NbbSMeb
 f8OrzE8V1qgYs0dSOO2ucrdMohOYZ9YxvedzP1jXPDLCSmKPKeUj5AXaF
 CSxzWzWbOA/S0M7lxF5cRi4mRLWgT6PNmohqVlo4EBDJsjKMv0KNys0BP
 mGf/bWfBMqIWBEY6RCFBD2cqHaMHZdDqku4rnXZ0W+hxk0+sdnBrsADwm
 rqubkYCoh4AIW7tB8yfmsllw86AZDlNsuo+vvJkrqMqsTIbOwcvUxRXJK
 0Y+v9U5CnjJXLsC4mIIL1oGGiiEmO6lkbE38QGevMQgLIOIIj9tu7UOIA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3497003"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3497003"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 02:23:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="43313407"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Feb 2024 02:23:57 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 02:23:55 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 02:23:55 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 02:23:55 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 23 Feb 2024 02:23:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0lbSgsezG34dMRw0ls2IxmotcUPEhRZiP/kyjN7edNDYycP5xCSb08Gc9Mziwm4d+6vqy0sxYdFjqacFMak3beMQk3K8G2bi4vr4syFXW1qB/3JmyhpeVmSBWh/dM0s8+q+x46aPVTwaugL9k7uDQi71YKS79oh4ChuR/bwWy1eh3TW7ClAsyHPjPaVl5zhEfH4gYw99jd5MEYYBc5wYoRfSoSeEW0MHo/L0Q0MvI9rETb7aDLqoy1FUvBgsbWrIoDLokOT0pNa2ZW8ZDwxW4RS+6ccOs9VrmR2p5HRVYktBpBGbNnZD/N1KLGEISNIvPuCxpVhCv4utIqoGL/p2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPliXUJyRd5k90xz1xGIFWocpabE9k1V3LDQqlphdyk=;
 b=A8zCObz2xgSTEsQKQfCIKXr7/y/OM/kYB+llipEmCXuNa8MgubXP4QiR9wZsptPbESeZt1gDO6/rCAM9glpxlsYB/DCYaiwOsgH2sgKBIQ+JhZDPipGmwiVQWJcV1WVSOf+mg9sX/Xmj7WPTxXDvfW1ttcRJOKQaPoLzIb3QiEnQJn5TUFb3yJd6Cc5GXlOs7I1q8btdQlSgl727FyDZS5Z+fHu0IAcMJOirb2334vLWkhuKrImbngfWtMIiLHfsOVUnYanBZ/V/OsZVOUbhqFxuYGhdPOgMYdYiC969BB2sIog0zRzjJbMB6yacIaPU3wWBGg8kG1FRb7f6niEUGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 LV3PR11MB8676.namprd11.prod.outlook.com (2603:10b6:408:20f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Fri, 23 Feb
 2024 10:23:53 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d%7]) with mapi id 15.20.7316.018; Fri, 23 Feb 2024
 10:23:53 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 19/21] drm/i915/dp: Suspend/resume DP tunnels
Thread-Topic: [PATCH v2 19/21] drm/i915/dp: Suspend/resume DP tunnels
Thread-Index: AQHaZEJ7uSvdcKtOw0qeXynmoZAE/LEXu9Pg
Date: Fri, 23 Feb 2024 10:23:53 +0000
Message-ID: <DM4PR11MB636021493AC49F5B4D6A3BB0F4552@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
 <20240220211841.448846-20-imre.deak@intel.com>
In-Reply-To: <20240220211841.448846-20-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|LV3PR11MB8676:EE_
x-ms-office365-filtering-correlation-id: a921321e-982b-4f04-916a-08dc345988c4
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1AS/hJ3GY4wlhqNQ/c9TqFJfZ7PKZSl/feECEPZ+fkMzWpvyjhUYEWL//0EXhOzecIiyD3FNChm913q2tCBlNLUqw7Pt4vnzRRTCf/IfeITlLCfy7kySM8fBqU6UozXtrw4ZFE0snI4K/i4+dcz33ODAFg5si75IVOaLZ4ERYMHv6/OWf7pl0aP8ibaFMY+NReNT0WL4OuKzf15MLRmUoY+G1VvsdjQn5/LOHLOV/c/WklX2QtHdzbQ+rJqfkIy68DSS+oz9pgQ/s+aPhOFrF9ISPrw5MsvH/PNGft96LxKI6FNhJUuVrpaK6/p4yGjmrYuL+EAio3920vzn3r4PdvhQqFjs7iPOaGyZynCFZ/tNDTvjv6BCf2vfljwNHq2N60UGSYSKoHGfRoj9/u0LpDgVGHp9/NdpI5shJp+fGYFo56pigG7677t7z72f/EoWCTLBiHnNInJuDLs/TUksOeCJBllM/0pw/v0f0qyRvkrRvwcoLug0E374w2fFZyhPIj65pRcW8HNAdOEhl/1MHkhYJ+xvZTKDhjw/j8La1G/rEX4/6IP6oyAITZtB/cM5RyXeo3yTfXmno/V7hdly7c5XggyKZUEa/5ll+847W80d2+nhzj4paRdjiyF7SzwM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CB+s6ltSTn9beyQF4Ej7POcDeNWtFMx0JZgmzbQdJLjdOB9cGtxw61yKgZ5i?=
 =?us-ascii?Q?ATciatIBNzDHK174U966DOp2E3CBCLymublILz8l8nOUv3JVUwc0hJBwiZvI?=
 =?us-ascii?Q?X+XnLxONqMa2qpEoRL3PjvO56fwOrgCzWn3snVWEl73rYaLF5fSs/z4Pttr1?=
 =?us-ascii?Q?xvagRnsVzoCrvmPI8F7dG+jvF19hmxhXNVtrMGZcaQSbs/7lNCT25dGz6XaJ?=
 =?us-ascii?Q?0dlnevhawBeAjva/47rees3EXrDmD+H6Md2ze9NH7FXZD+GSkYliVUIxlNOG?=
 =?us-ascii?Q?cFjeL+QNjkU9zn0fOIuWLtKszYu0qWciNLFFJB3b1ngKLL/4vQ8w77vD/UY+?=
 =?us-ascii?Q?RPhrlL3mad4/pycTaxtA5yBA42zU91A8XIPVX61Ex126tF5wFE7NiuFT0YYQ?=
 =?us-ascii?Q?N+cG6MQ8wuAzeoyLps4ogUeQj1bIhBq5bsuhBGf6SwsC/Fj+8ipEs2qU+YG6?=
 =?us-ascii?Q?wwJUDLANNOffpKPsyiaJsOmESMxapwHCjNq8ZPiSVA51c8Em9geuWpVxwhLE?=
 =?us-ascii?Q?M9NYjl9w6RR/r6nSl2rrZOSeIzEz5Hh/47iOy8Ll5MAcZrZYiiVIWg6OEZiE?=
 =?us-ascii?Q?IHzrWU9k1JRvoMRROGFFCz4hqhIxofXEjWwoHh6Y5vCtCPZI3YfxU2ATCdgD?=
 =?us-ascii?Q?PqxbM7zLESiPpsqs1dKG6Wt/3mkUpy5B321Uh9cNArf7YJJDhSYINFMHuXsh?=
 =?us-ascii?Q?GDf9GOOpg2gBgGNsdIIGWb4+AosxQiLSrRz+NUnrWe8z/cKPA7hPk97+OEbE?=
 =?us-ascii?Q?gFulu/nnhAKkQ1F/fM2DBydWg+YAEyZzqct+WsaaxXGbxor/H2fBCtj9abrA?=
 =?us-ascii?Q?v1SUa148CdKGryjWfWMd6aQeLKc0SBWEmw/k6UCli/WGo1I7DL2vrnA4x6wZ?=
 =?us-ascii?Q?w7qy2D0ndVWuApIbovUMqGFfn3KWJDryj9I8BT6ca68EmMoJ0K+NrxPD7ptR?=
 =?us-ascii?Q?WMPXXeNIY+4jwol+tzG67RFsyXy/roZlUjuAXhi87ftKobiHz6EAqFNZxKRK?=
 =?us-ascii?Q?dI77KNwfQcf52mMpsn9CMrQklzxAmFBp7skbg7Bq5FIF/HoMONBIebvvNkPR?=
 =?us-ascii?Q?O+fhSfPz87d7dtyli7JO6+iBsSpF0PucgUmdVIbQcEQoPcpJFQf48Zq9dqI/?=
 =?us-ascii?Q?7VvkGoabprckiwsWdYeeqNXtNnMKLRNqLEm9tTL/u+AwK+5FiCKO7pnVcb1H?=
 =?us-ascii?Q?Ta7g+BJG3q5lwvKvEipFHSowIVnn25jpxmj4U8+L1haRCRx4gPXRGqU9v6rZ?=
 =?us-ascii?Q?j1he9eE/sgTjzqXljR9Tlq0Kdb0iUJQTshMqniEgXgbyTPR2eutqtGQuXeDy?=
 =?us-ascii?Q?nzzqmDjplVjrEUeHz/a965WBffDDAO5OkB8Y2E62ve+kKFyA6UVOdbFRB0yz?=
 =?us-ascii?Q?JOsXv6ELnUuyzdKqfM5MxXtS04IbPXBNvsv8/bOKm0dUfVfrK2TpAVpV4zGm?=
 =?us-ascii?Q?kA30UXubpCC69r6/MIZWEnLLKNOMpHJQLRj83RJnEhbC46fJ6g2mu7AemUKz?=
 =?us-ascii?Q?Gw2I/pu0Qd+wWNUwwgFlH0EF4ap7m8Qdq7whB7/zhQ2l0f8TyEhL6F9PArwW?=
 =?us-ascii?Q?o/k2cbsKe2dUihC9d51o0IsdZJ/m8PCAbfFCUYK5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a921321e-982b-4f04-916a-08dc345988c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 10:23:53.1056 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c1lhynL23yb05N9q4v3+nl+iK8EONLdyOT9vSOO5t5AK0Q20YJUesDEG+VHTQJyeSnUC0cO28s6uft2NdtA60A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8676
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



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Im=
re
> Deak
> Sent: Wednesday, February 21, 2024 2:49 AM
> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Subject: [PATCH v2 19/21] drm/i915/dp: Suspend/resume DP tunnels
>=20
> Suspend and resume DP tunnels during system suspend/resume, disabling the=
 BW
> allocation mode during suspend, re-enabling it after resume. This reflect=
s the
> link's BW management component (Thunderbolt CM) disabling BWA during
> suspend. Before any BW requests the driver must read the sink's DPRX
> capabilities (since the BW manager requires this information, so snoops f=
or it on
> AUX), so ensure this read takes place.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index a3dfcbb710027..35ef17439038a 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -36,6 +36,7 @@
>  #include <asm/byteorder.h>
>=20
>  #include <drm/display/drm_dp_helper.h>
> +#include <drm/display/drm_dp_tunnel.h>
>  #include <drm/display/drm_dsc_helper.h>  #include
> <drm/display/drm_hdmi_helper.h>  #include <drm/drm_atomic_helper.h> @@ -
> 3313,18 +3314,21 @@ void intel_dp_sync_state(struct intel_encoder *encode=
r,
>  			 const struct intel_crtc_state *crtc_state)  {
>  	struct intel_dp *intel_dp =3D enc_to_intel_dp(encoder);
> -
> -	if (!crtc_state)
> -		return;
> +	bool dpcd_updated =3D false;
>=20
>  	/*
>  	 * Don't clobber DPCD if it's been already read out during output
>  	 * setup (eDP) or detect.
>  	 */
> -	if (intel_dp->dpcd[DP_DPCD_REV] =3D=3D 0)
> +	if (crtc_state && intel_dp->dpcd[DP_DPCD_REV] =3D=3D 0) {
>  		intel_dp_get_dpcd(intel_dp);
> +		dpcd_updated =3D true;
> +	}
>=20
> -	intel_dp_reset_max_link_params(intel_dp);
> +	intel_dp_tunnel_resume(intel_dp, crtc_state, dpcd_updated);
> +
> +	if (crtc_state)
> +		intel_dp_reset_max_link_params(intel_dp);
>  }
>=20
>  bool intel_dp_initial_fastset_check(struct intel_encoder *encoder, @@ -5=
947,6
> +5951,8 @@ void intel_dp_encoder_suspend(struct intel_encoder
> *intel_encoder)
>  	struct intel_dp *intel_dp =3D enc_to_intel_dp(intel_encoder);
>=20
>  	intel_pps_vdd_off_sync(intel_dp);
> +
> +	intel_dp_tunnel_suspend(intel_dp);
>  }
>=20
>  void intel_dp_encoder_shutdown(struct intel_encoder *intel_encoder)
> --
> 2.39.2

