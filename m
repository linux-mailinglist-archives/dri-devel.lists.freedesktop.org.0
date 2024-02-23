Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A32CF860F7B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 11:36:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B9410EB94;
	Fri, 23 Feb 2024 10:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CgYE8ZSE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1907710EB95;
 Fri, 23 Feb 2024 10:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708684592; x=1740220592;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fMvzMUaG/XKooKnWU6wrY6aYhw0cuXhvndpbbMnEtKw=;
 b=CgYE8ZSEmvt7BwDiLiQLufLsu6CJL8vp2Qm4dw2dxxA3F50TizFjAnnX
 JBACzvsqBHdMTVtcq2ouBYccLG+K6zw1AmCUtsna/O1yNsOxhy8qmyZ0X
 5lHdbn/H2Qm5b6ORXssDqFsPwAa/q7CwgU0ayS5jQzUSS0O4IGR1mVVnm
 X7/oDvG80qDq0VZbhr8f1nP250lRpT7hvluExzGYmHV8xRtFPXyGHNGnN
 YgTQ7nK5pONQpf2EoXeZ0RcRTqpRs9j4bFLeeFFD8RX4GgdEfD14vcH/D
 xraG1e33LJsSVUxYp0KbhgSRiuXUsePHGz3bPvGADoYBxmUYwTlyFkPnt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3121173"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3121173"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 02:36:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5873694"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Feb 2024 02:36:29 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 02:36:28 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 02:36:28 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 23 Feb 2024 02:36:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8xXnRwUhIRtdOTpQQFtagMFRkKtonpMJx76u4OhFnj6OvaoNquBNeVDsJyfBjrm8AwxSKArsdKdYngzr6CVCRMqGS1s4PCarv0Y1wFI9w9WHoCpTqJ7J7CJNsPLT7ntukQ+O7wJuNI/3Pj4icD8nsfDIi8IzS71pgnKwdYpXxoWb7HML4yszhWgO91DmuDFhztcU9RpuflREmpquK9iX9H5WVsyijF18jVmriSPQSkpOmvQuZdgnTjbw81SuuFE7jPZyA1c5FVymRthQ6OWep80Rx5Ktq0HoBrNoz4BuCMu4Nkh82SaSXBzgHq0RPqVnKPXYGmC77H90gJ9QyC8KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luv25MttX50XgfziuEaWoMQfs9escgUnHw9Jn7lLVjE=;
 b=UGhQC6nFRj8f3h59q/G1ukPcz5cmcrZ8WeevnChR5RgHTozcD6hiB983++KZ341VYkQw0gTrtukkuN3V9qA1/BfLWfYYMJvJrur0aJKqXPtXwk9Q9nB2zM6SwWaFxLCYkm881mXynX8gQhvc+Dql4MfR7DkR8EY/VcyQo8XU7Y8nL3hixg1lVA/VV8IsqXoV/KCbm6OMW3p7K+RAEjqWGw39e+iF2d5Rxnos/Vg5+/ExarbOOjdkVKPzssXnoFJcz434qC8UXIq+lp+E5596/PeO5UJSitHLqIDykvr/NepEURrxLks909TqH/jK5Mbus2j38GHVHAWEj6u+8aYCXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 PH0PR11MB5047.namprd11.prod.outlook.com (2603:10b6:510:3c::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7339.10; Fri, 23 Feb 2024 10:36:20 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d%7]) with mapi id 15.20.7316.018; Fri, 23 Feb 2024
 10:36:20 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 21/21] drm/i915/dp: Enable DP tunnel BW allocation mode
Thread-Topic: [PATCH v2 21/21] drm/i915/dp: Enable DP tunnel BW allocation mode
Thread-Index: AQHaZEJ8tBVf6GX0BkWiAmVH5V1SlrEXv5PA
Date: Fri, 23 Feb 2024 10:36:20 +0000
Message-ID: <DM4PR11MB6360B3AFEBAB492DFE427818F4552@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
 <20240220211841.448846-22-imre.deak@intel.com>
In-Reply-To: <20240220211841.448846-22-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|PH0PR11MB5047:EE_
x-ms-office365-filtering-correlation-id: b47c537d-8b27-4b68-a635-08dc345b4615
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dxXPmcvLLGBkmZQG+q7B2W08pT+RgCUW7YVm/2Vass5vyym7zkmuYmEa8JGoC++RGoOpz063AaY4Wp1HcWPtNb7i0OdVDM0hmGfKcRilEfNpLioX1fAyzLNfZ78Z6q46UwRXik6ISc8EB5SxvIr0P/NhsSCzObAnk2hYIt15Z9hc9LoDDKfiUVJwG8DBl6OOgjaOpxorLze5h2fAXNPPS2dPGTR28DDa2wtnQ9OBF1GltPmk2oQ23uYMXKWR9yWHMwusKyXIi+CmepKBBpdY4wxECiEPq0ocuKuoec88zRWDCAgt5VP7yN10dCndEOVH5N363BJawcO5qPsIOdlULl1x5LKKOvS5+D3/X9bmXE5TnAuzvz3kL+sWC/f6uXpP4Q7175O73rrO0krrDlzbzJOi2VGANclW6MGIsEYifwLc0zIJ78NNtl4s722DnzzliPdBS3vX+tuvy7qrj6OL5/nIY0TwFaFsbmCmzZsenLko+5ajSsPIxPb2/Em1lnrp1hkBvgd4vQj7DFy4KF2X+jFOifWOnr1+bvz9t1f9uVp6AzBqC0u0J+esLdGuBqMuRAWvlhesDD8aU7sQiXNhQfeWuPe7Lj2yFM0dzI0ROnIM3thccP9RkVOT3oLYRvmE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kNYjyaJxbN1sS2lix3T0Ao6HY1zpD8HSVr1iN3txAuG5lXoQHcGqmLi+4Q4d?=
 =?us-ascii?Q?KZH4LZuZ4wpSlp8MsH1aS6PnJk0BGU97Slw2Z0aMvvggpnnAFBSzq1e3/KAO?=
 =?us-ascii?Q?u4sgcnHx5/5Xme2AlM/7typmO+4jHYSGh2Sa70NjwH6v8ObXQqm2LGyxilYr?=
 =?us-ascii?Q?3A8Meb4zpz/p0NVju0xTXkfxndYfwDmQkP3feRwTe93TXGpdrN5tL11ZgYD7?=
 =?us-ascii?Q?sb7zRyXZEudLUrSXfocswJBvi11Xl6pjmBDv8FnRerN2cZ+6qbdTXltBBnM8?=
 =?us-ascii?Q?h1aCtdad1GXNC8Yf5q+phJokTy7HcTS9a/pmMVqeY9rUmzSroe7/+pkIxzri?=
 =?us-ascii?Q?Bhg4Op9gGRxottSMhRpR6QDkWDZ5o6IprTWx3ssLywlRJdsNT97/ZDKdqazf?=
 =?us-ascii?Q?u59RBNANkhnQnMepjbDEbgxIZc0y5jdm0HHFHfgSA7KrjKOd3zDtrt1OXxZN?=
 =?us-ascii?Q?3m7MwBr2+AHv1cfDnGyVhUxep/5B1/YEJyZUAaeJJErAaO5ghoHJCG6vmn0T?=
 =?us-ascii?Q?cLia9IIOED6s/xsky5Ug2CU1CnTixxPBoufs0xz9l8GKZ7u2cFjH3Xlx6VgM?=
 =?us-ascii?Q?b0tNt0jsqL2e0D1d/tfmH9X8vpVwfTXDyIrJM1gvPsf+5P6/EM1CzHFU031w?=
 =?us-ascii?Q?Sr6SliOg0Jw0SvQDvjO83FWZeLWI7GRcnBfPghcE8de4GQjktWtNPWaOiBSj?=
 =?us-ascii?Q?Ue6kTK+f82++WGLJz8249+06Cq9syGlgA2F1U/BG2LfTQEZYFjF5HgIs2rY+?=
 =?us-ascii?Q?lpmA9pFZhYq/nfGGd14/YLhiUuYoHLyUv8CTC1mvtEln+GZ+8C4wXPeXno+t?=
 =?us-ascii?Q?OBrcLaKb2cQQC6hNb8YrkDf2R5k2W06XXxAOzS9mGUasHvIRxMNhCK9Sk7Xa?=
 =?us-ascii?Q?6/hqgLKuqgCDlX4IUHJblOIBX4Q4g+rlMnq9DXgaxh5uyRGilMvY0EZxpuQe?=
 =?us-ascii?Q?t48U4QsqWCGmnSlL7mgqTqwQCC0YRf+85nkbKwCQGKc5wjF7hz0ZmWXugIQ3?=
 =?us-ascii?Q?7vQyh0SNfy+vdc+fVUhN+RaQ5zEadn+S0xPuQ1tUBB02PYJbpLVcKHf/osEN?=
 =?us-ascii?Q?gc0YoIdLz9POIK+qE4BTLq1BqDPVEOanluFAnQuyodI2meokr7pvmQ/pcyMx?=
 =?us-ascii?Q?1BFjpcmha/VHEgzgQ0yv0TdueKuC3Ij+Txlgzeo492fQFnTBIowg7LA0prDV?=
 =?us-ascii?Q?9DR6HhbX64npgBEPVAMJxutSCFHUEgeqhyGXrS5gwteoMJ+4n8l54BmLFAIz?=
 =?us-ascii?Q?63G7t7uXVZxQ9HIdHiJMpgc1FQFF7dn5kQ2e/C2y1p4OiVnmppIWnh4n5pNb?=
 =?us-ascii?Q?amWvWk/CR3uLrEO9gezFt56iKvtCzMBzyhLmFtsvML/De3s+sLBBS8pW/hSg?=
 =?us-ascii?Q?WAEqljbcsGLxXb1r9bB+F+G/nm3aE998Dp5XNbo0jlsu8eWpD2a+B+LZql2B?=
 =?us-ascii?Q?K7oaxqY1UkKylkmBGAWa56uNhNoGXIaZ9DDCx9l5mMZniI6nFZyjQn09oBIR?=
 =?us-ascii?Q?xQqE+iyxm+y/id9dTEqIIWaKHz+tTd4Cc+VDK5hlCjzk2ospl8ZJOYWCFgI3?=
 =?us-ascii?Q?uyqK0sjaTSpvujhFWI6CV4mQIN4aFpaXi2lC1BMj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b47c537d-8b27-4b68-a635-08dc345b4615
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 10:36:20.1750 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HDH7JSQlxvZusNWldqdXWOJ1mlW2WrLYAv9rMvPLNtlkJPz0ISVhXe/xhgVpVzQPiQpeYCh9veShu0TtZvQToA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5047
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
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Im=
re
> Deak
> Sent: Wednesday, February 21, 2024 2:49 AM
> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Subject: [PATCH v2 21/21] drm/i915/dp: Enable DP tunnel BW allocation mod=
e
>=20
> Detect DP tunnels and enable the BW allocation mode on them. Send a hotpl=
ug
> notification to userspace in response to a BW change.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  .../drm/i915/display/intel_display_driver.c   | 20 +++++++++++++++----
>  drivers/gpu/drm/i915/display/intel_dp.c       | 14 +++++++++++--
>  2 files changed, 28 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c
> b/drivers/gpu/drm/i915/display/intel_display_driver.c
> index 4f7ba7eb03d27..87dd07e0d138d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
> @@ -35,6 +35,7 @@
>  #include "intel_dkl_phy.h"
>  #include "intel_dmc.h"
>  #include "intel_dp.h"
> +#include "intel_dp_tunnel.h"
>  #include "intel_dpll.h"
>  #include "intel_dpll_mgr.h"
>  #include "intel_fb.h"
> @@ -434,10 +435,8 @@ int intel_display_driver_probe_nogem(struct
> drm_i915_private *i915)
>=20
>  	for_each_pipe(i915, pipe) {
>  		ret =3D intel_crtc_init(i915, pipe);
> -		if (ret) {
> -			intel_mode_config_cleanup(i915);
> -			return ret;
> -		}
> +		if (ret)
> +			goto err_mode_config;
>  	}
>=20
>  	intel_plane_possible_crtcs_init(i915);
> @@ -457,6 +456,10 @@ int intel_display_driver_probe_nogem(struct
> drm_i915_private *i915)
>  	intel_vga_disable(i915);
>  	intel_setup_outputs(i915);
>=20
> +	ret =3D intel_dp_tunnel_mgr_init(i915);
> +	if (ret)
> +		goto err_hdcp;
> +
>  	intel_display_driver_disable_user_access(i915);
>=20
>  	drm_modeset_lock_all(dev);
> @@ -475,6 +478,13 @@ int intel_display_driver_probe_nogem(struct
> drm_i915_private *i915)
>  		ilk_wm_sanitize(i915);
>=20
>  	return 0;
> +
> +err_hdcp:
> +	intel_hdcp_component_fini(i915);
> +err_mode_config:
> +	intel_mode_config_cleanup(i915);
> +
> +	return ret;
>  }
>=20
>  /* part #3: call after gem init */
> @@ -599,6 +609,8 @@ void intel_display_driver_remove_noirq(struct
> drm_i915_private *i915)
>=20
>  	intel_mode_config_cleanup(i915);
>=20
> +	intel_dp_tunnel_mgr_cleanup(i915);
> +
>  	intel_overlay_cleanup(i915);
>=20
>  	intel_gmbus_teardown(i915);
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index f7f8bd5742ad4..789b5fa074fd0 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -5726,6 +5726,7 @@ intel_dp_detect(struct drm_connector *connector,
>  	struct intel_digital_port *dig_port =3D dp_to_dig_port(intel_dp);
>  	struct intel_encoder *encoder =3D &dig_port->base;
>  	enum drm_connector_status status;
> +	int ret;
>=20
>  	drm_dbg_kms(&dev_priv->drm, "[CONNECTOR:%d:%s]\n",
>  		    connector->base.id, connector->name); @@ -5761,9 +5762,18
> @@ intel_dp_detect(struct drm_connector *connector,
>  							intel_dp->is_mst);
>  		}
>=20
> +		intel_dp_tunnel_disconnect(intel_dp);
> +
>  		goto out;
>  	}
>=20
> +	ret =3D intel_dp_tunnel_detect(intel_dp, ctx);
> +	if (ret =3D=3D -EDEADLK)
> +		return ret;
> +
> +	if (ret =3D=3D 1)
> +		intel_connector->base.epoch_counter++;
> +
>  	intel_dp_detect_dsc_caps(intel_dp, intel_connector);
>=20
>  	intel_dp_configure_mst(intel_dp);
> @@ -5794,8 +5804,6 @@ intel_dp_detect(struct drm_connector *connector,
>  	 * with an IRQ_HPD, so force a link status check.
>  	 */
>  	if (!intel_dp_is_edp(intel_dp)) {
> -		int ret;
> -
>  		ret =3D intel_dp_retrain_link(encoder, ctx);
>  		if (ret)
>  			return ret;
> @@ -5935,6 +5943,8 @@ void intel_dp_encoder_flush_work(struct
> drm_encoder *encoder)
>=20
>  	intel_dp_mst_encoder_cleanup(dig_port);
>=20
> +	intel_dp_tunnel_destroy(intel_dp);
> +
>  	intel_pps_vdd_off_sync(intel_dp);
>=20
>  	/*
> --
> 2.39.2

