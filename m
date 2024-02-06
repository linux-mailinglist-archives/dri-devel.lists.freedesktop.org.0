Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A05C84BEDD
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 21:45:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39904112E1F;
	Tue,  6 Feb 2024 20:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SmfRy6sP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427AC112E2F;
 Tue,  6 Feb 2024 20:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707252320; x=1738788320;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QdU4n+Nvbf9FewI+MCKxk8pmTUDTQk4uiQFsOUThzoY=;
 b=SmfRy6sPB/1MTYw+JtACn3vpuyw/iM+fburtEkG/FOQqFELMqaVcgy5A
 rpi4voeZ0gDOcbd0rKMDoRwTyGFnSto6QWjzACk3T3KA4bKKQEoX0pBzG
 DW9myoAlXk9kNRt378SjubCdGIC1SvG2dfNrQxF7VdaD4EzJObDVHuq0w
 S71uJI4U2qsh+o7CPvVP1hsq8q1lRbRSQHJoEWCsY26Pj/UleQk1gFk3C
 kF0M1e/QkphBL9LNiIqApYXI8jCnV9ETpzeNhZdca3QgPMKbgPL4ARgLq
 rGUk2hxBR9tiN1mWegSdwQYRERQ0OUMouEkakZ+LkrwTMdl59CYZdhemY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="11484233"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; d="scan'208";a="11484233"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 12:45:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="5736857"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 12:45:20 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 12:45:19 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 12:45:19 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 12:45:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKK6CHjDdtqkbOCjQ63pu70vrmC7xZdxREzOP+Slriefo0hfH9s4/S3UbDOfT7PIz0k8rweulYQLIwwYx6Yg7ppkodMSDhhk0lWBS7r1pSliji31DQfvQsKwV2pS3T8mZOml53xpie1H/m/S3F7OrX78FzuY2D7IKLiJflQbO4bSJ05y2KOKDxd0KtkGsGep7HtiIyzIOb/RRYWH5oVUHif7yN5MtnR47a2RxrzNkqFHV2zMWICdFYdTaSn2tNlMRzqC8aknC1kq+RaCYbKzv8IaImB2282qkv3CuQaG1Cc9KFQgf9UfEexAietCPPX2NVv9yiHVRDIguDc1uUruhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNrmGKGekZGZo8qsfJIPNn8qstnNBrSC+85QGeR4ap4=;
 b=P5fdql26L2j/bdP2IaMc3+Wv5OXmKuKIeQRRlUwvMf1pVSNBCVyItvWYC9LVRKCUR8+h1rJBVPGP48ruv3TSfYYktEPDKqxRHnVv5HGHiFPxlZKWI+632w5N01HMODaVKkhhzfX3LSYDOJjvbUVcFYL8ME9fIRSjNO8Yy605sIJTpHNfDm9bduga9AzSpKOHQjCLe/ULFOm4DBi+nv442cMJ3APr8z5mbqRk4sFsPyHKGTzzXg01vmz/qulWmdSjYVU9qH6iBw6CfTAP1H1kMoUnqEKGS+MpFcCfIRm+PBK8ms1syzbUmFHx1ED9pgmcCRF6b5/t5BKMXAxxov+tcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 PH8PR11MB6777.namprd11.prod.outlook.com (2603:10b6:510:1c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 20:45:16 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d%7]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 20:45:16 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 15/19] drm/i915/dp: Allocate/free DP tunnel BW in the
 encoder enable/disable hooks
Thread-Topic: [PATCH 15/19] drm/i915/dp: Allocate/free DP tunnel BW in the
 encoder enable/disable hooks
Thread-Index: AQHaTecZLPC2kfes9UuR8cPeANTAd7D93uUA
Date: Tue, 6 Feb 2024 20:45:16 +0000
Message-ID: <DM4PR11MB6360403BBFEC77E612FB8534F4462@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
 <20240123102850.390126-16-imre.deak@intel.com>
In-Reply-To: <20240123102850.390126-16-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|PH8PR11MB6777:EE_
x-ms-office365-filtering-correlation-id: fce556f1-ea46-478b-be16-08dc27548686
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E3xBkJjCZbfTONMarTUpv9lt6W/Ck7UYJa+OGew+RJz5dgpWUKiizkdvUDcL+w1VFxL5oznnqRalc40F5mvQvXJZS5kG07LGWh2NkYG5/QAwE9lwkWQpIFlIgFQorRJKX8J6onyTsyXm9CxXnPxILwOMI+NmQ/nuWvR77ua68Zk3Q2vZcNEmtY5JgvRgRtHVAx6+uzTGmKNC4p6T5VijAS1b954VJdk2hQQn/rOq3/q2e697kcwIFVklMc2ClGr6ai6cpRu4odgajkDnaYHLLqVrpI9fHZcR5Wlf1Px1vlg6eYbXFPSwRZvUEZ+2lauXMguSppdjsKyOxG5fQQfUYGpei3FpA9XwfNWVOG23tSwWpbGRvp57aQQZQndok0O8JOitbMQixXXt6EO1ZU696sAk8RyctvmYkcXflA3Zo3jYkH3t7vTwBeA2XSno5xZ30bmOCL+wzE74gxJIrOErUnOcKWL6QIKra2ZiRqSktjGl933kfcuPFw92S0lglgLy2pQgUFbl28cQdluvCbnnT7wPJa+xj8tVgs858MvfMSO0+Qx9UJBZInKmRKzVOvQI74l89EHchZiMYhmJnLc5vwYlS+Wy+rQ7/AdR8xjVjeDE9DAG3eKtT/OrRMCSdtBR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(39860400002)(366004)(136003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38100700002)(82960400001)(33656002)(6506007)(53546011)(55016003)(7696005)(122000001)(83380400001)(86362001)(26005)(41300700001)(9686003)(8676002)(8936002)(4326008)(52536014)(71200400001)(478600001)(2906002)(66946007)(5660300002)(450100002)(76116006)(66556008)(64756008)(316002)(66446008)(110136005)(66476007)(38070700009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CZLpAUtb3EKxT6KPnXBDfRUuLO+ykjgJzbLeUMHxlY2sJiz8WAvEpGQ7sghq?=
 =?us-ascii?Q?sdKwUFWM5oVlYrsFqoe9k6LDn4fO1pb7pieBPhyY7Oo+KJv9vnMN2VfP0H6+?=
 =?us-ascii?Q?3dJTPtL52XZb2I47JLdpzfvLmwphFr+1g3iLaBGySTyn5Bu6jL3uVLA0eevf?=
 =?us-ascii?Q?nCPeQrvnLn9jcqUF5UK9u9zqINq1DTab7sKcCnTHxOzv2urBFjPKhwA1yLgq?=
 =?us-ascii?Q?gjoDlRzKnqPZMC822n3e1MuysUsPD0HyoCWN/kxxj7pcxVaBdqCK3mZokQaR?=
 =?us-ascii?Q?OLc3Dhn9fHmCN2uUE783M0fM8+hQEP8TmEEZsUkbqKcRGQ15fE43G9/oQYme?=
 =?us-ascii?Q?29keV0anwEFhTlIpnTON8GGluvWDOAzSjeYhk+2DA6d+AsaEU9D+XHwRRcJi?=
 =?us-ascii?Q?s8Ou+KIYMan2I/dAMdSqfdQaxm5jJLu1sIxYlKe8cU/vePDUnFF7Iceeju5q?=
 =?us-ascii?Q?/JFrbs9HTOpY1frEHYy7Rg/xVBnZiWymoQxlPNZh9mUB9s1TcCx0SVV1AH3C?=
 =?us-ascii?Q?CyxRFa9BALQFygdaPRfk+rXytLWs+XwKkFVioJqho/zFmASUWxJuzQpu1HBw?=
 =?us-ascii?Q?UOhKvXAPsltGwsWh9MIOWQjdMSNDgpwyvbxPC8ewe4lL2OE6fhfsLe2BmhHS?=
 =?us-ascii?Q?p85Fi17PU4oY7xk8veW5w22nSqCmpLyZsZaHGVksATCWEyBcPRGT8hbXtysq?=
 =?us-ascii?Q?STkXzzaVFwPPtUQgAsLavaPxZfTez1koNteLd8LVo2XUH+4pATA4IJaztO74?=
 =?us-ascii?Q?ka9e0szr1TBvQDbKZxBOrVl2t6Od/fI1KT6JwHJQOLgHj6rRr7c3VHEVV99T?=
 =?us-ascii?Q?/MaazAeKRV3mj48BrVHtTWhXqQ8Ksx1xy/SLxbXtnFAEJLT97AXXYtSECTYO?=
 =?us-ascii?Q?TU45EAdjO3R/vtKO/rs02koNHgwtfEVXHD3EO0BukNZmNYzRi5c9bNCFOi7P?=
 =?us-ascii?Q?xATkt8IN/kppbU1iGKNKCy61sY11/mF+vlfIxV3OfKTJz+HhyN3/c2dSHu3p?=
 =?us-ascii?Q?G/yIQMGZpOyoOMVypyZ1bD2tZeDJfJd3qdEDAAwsJWLV/mh+jQHJz2wV7V11?=
 =?us-ascii?Q?33xsn66fFC0R1ccLUkww+J4+cOdzhDYjbIrwCzS83JGZX7lhYFvuaRVj3olc?=
 =?us-ascii?Q?TOKFHXve3TRC6hvLUFDR0P6RVC1mgHyT6P9gCH7YokQ+Scz1yUpvU/k6e1Lg?=
 =?us-ascii?Q?9PagKdh5oWALUsr3VuJWizXNgqFJAZNU2LErSpWyyANbHxA+yZPYky1ca4cj?=
 =?us-ascii?Q?8J1ycUfwGvg87nKF2ut+P/IkrVWN1eTtErgIXw3fIxS76+38WQGjcqf7Bd6F?=
 =?us-ascii?Q?4kPbcEpTi0I4cyJivqbpozA0J1mqx4FsXSUOeM1qnvZHXKRWUT/zEKJRCDuN?=
 =?us-ascii?Q?XZlzgf5K0ek7qRVjP2bt/9vgozXQaVdi28pk3UeTd1YBj1HSXMnbzxrTDGYX?=
 =?us-ascii?Q?JANAaYs0GBXuuqYEDUbSzdTfkvOf1a/rb6xxukDc4t9O8XnPul2KgexzGi76?=
 =?us-ascii?Q?hc6aA4vISaaFUMZfIIlut3R/Wi+Kuim0Kyyqcf0oinHMuaeUm8MG4uEn0I2C?=
 =?us-ascii?Q?USxChd+o3fNALO22/o6fTJ4a1Oz9EIynFELSB4qn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fce556f1-ea46-478b-be16-08dc27548686
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 20:45:16.6907 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +zPbCy773k4ps2qocOoZUijuatR3KMCHDgv1wIyBtNM1mRk80fVz/Ti57n+vflRwE2VmxNCnH79xe8E4FotlkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6777
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
> Sent: Tuesday, January 23, 2024 3:59 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Subject: [PATCH 15/19] drm/i915/dp: Allocate/free DP tunnel BW in the enc=
oder
> enable/disable hooks
>=20
> Allocate and free the DP tunnel BW required by a stream while enabling/di=
sabling
> the stream during a modeset.

Looks good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/g4x_dp.c    | 28 ++++++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_ddi.c |  7 ++++++
>  2 files changed, 35 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/g4x_dp.c
> b/drivers/gpu/drm/i915/display/g4x_dp.c
> index dfe0b07a122d1..1e498e1510adf 100644
> --- a/drivers/gpu/drm/i915/display/g4x_dp.c
> +++ b/drivers/gpu/drm/i915/display/g4x_dp.c
> @@ -19,6 +19,7 @@
>  #include "intel_dp.h"
>  #include "intel_dp_aux.h"
>  #include "intel_dp_link_training.h"
> +#include "intel_dp_tunnel.h"
>  #include "intel_dpio_phy.h"
>  #include "intel_fifo_underrun.h"
>  #include "intel_hdmi.h"
> @@ -729,6 +730,24 @@ static void vlv_enable_dp(struct intel_atomic_state
> *state,
>  	encoder->audio_enable(encoder, pipe_config, conn_state);  }
>=20
> +static void g4x_dp_pre_pll_enable(struct intel_atomic_state *state,
> +				  struct intel_encoder *encoder,
> +				  const struct intel_crtc_state *new_crtc_state,
> +				  const struct drm_connector_state
> *new_conn_state) {
> +	intel_dp_tunnel_atomic_alloc_bw(state, encoder,
> +					new_crtc_state, new_conn_state);
> +}
> +
> +static void g4x_dp_post_pll_disable(struct intel_atomic_state *state,
> +				    struct intel_encoder *encoder,
> +				    const struct intel_crtc_state *old_crtc_state,
> +				    const struct drm_connector_state
> *old_conn_state) {
> +	intel_dp_tunnel_atomic_free_bw(state, encoder,
> +				       old_crtc_state, old_conn_state); }
> +
>  static void g4x_pre_enable_dp(struct intel_atomic_state *state,
>  			      struct intel_encoder *encoder,
>  			      const struct intel_crtc_state *pipe_config, @@ -
> 762,6 +781,8 @@ static void vlv_dp_pre_pll_enable(struct intel_atomic_sta=
te
> *state,
>  	intel_dp_prepare(encoder, pipe_config);
>=20
>  	vlv_phy_pre_pll_enable(encoder, pipe_config);
> +
> +	g4x_dp_pre_pll_enable(state, encoder, pipe_config, conn_state);
>  }
>=20
>  static void chv_pre_enable_dp(struct intel_atomic_state *state, @@ -785,=
6
> +806,8 @@ static void chv_dp_pre_pll_enable(struct intel_atomic_state *st=
ate,
>  	intel_dp_prepare(encoder, pipe_config);
>=20
>  	chv_phy_pre_pll_enable(encoder, pipe_config);
> +
> +	g4x_dp_pre_pll_enable(state, encoder, pipe_config, conn_state);
>  }
>=20
>  static void chv_dp_post_pll_disable(struct intel_atomic_state *state, @@=
 -792,6
> +815,8 @@ static void chv_dp_post_pll_disable(struct intel_atomic_state *=
state,
>  				    const struct intel_crtc_state *old_crtc_state,
>  				    const struct drm_connector_state
> *old_conn_state)  {
> +	g4x_dp_post_pll_disable(state, encoder, old_crtc_state,
> +old_conn_state);
> +
>  	chv_phy_post_pll_disable(encoder, old_crtc_state);  }
>=20
> @@ -1349,11 +1374,14 @@ bool g4x_dp_init(struct drm_i915_private *dev_pri=
v,
>  		intel_encoder->enable =3D vlv_enable_dp;
>  		intel_encoder->disable =3D vlv_disable_dp;
>  		intel_encoder->post_disable =3D vlv_post_disable_dp;
> +		intel_encoder->post_pll_disable =3D g4x_dp_post_pll_disable;
>  	} else {
> +		intel_encoder->pre_pll_enable =3D g4x_dp_pre_pll_enable;
>  		intel_encoder->pre_enable =3D g4x_pre_enable_dp;
>  		intel_encoder->enable =3D g4x_enable_dp;
>  		intel_encoder->disable =3D g4x_disable_dp;
>  		intel_encoder->post_disable =3D g4x_post_disable_dp;
> +		intel_encoder->post_pll_disable =3D g4x_dp_post_pll_disable;
>  	}
>  	intel_encoder->audio_enable =3D g4x_dp_audio_enable;
>  	intel_encoder->audio_disable =3D g4x_dp_audio_disable; diff --git
> a/drivers/gpu/drm/i915/display/intel_ddi.c
> b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 922194b957be2..aa6e7da08fbce 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -54,6 +54,7 @@
>  #include "intel_dp_aux.h"
>  #include "intel_dp_link_training.h"
>  #include "intel_dp_mst.h"
> +#include "intel_dp_tunnel.h"
>  #include "intel_dpio_phy.h"
>  #include "intel_dsi.h"
>  #include "intel_fdi.h"
> @@ -3141,6 +3142,9 @@ static void intel_ddi_post_pll_disable(struct
> intel_atomic_state *state,
>=20
>  	main_link_aux_power_domain_put(dig_port, old_crtc_state);
>=20
> +	intel_dp_tunnel_atomic_free_bw(state, encoder,
> +				       old_crtc_state, old_conn_state);
> +
>  	if (is_tc_port)
>  		intel_tc_port_put_link(dig_port);
>  }
> @@ -3480,6 +3484,9 @@ intel_ddi_pre_pll_enable(struct intel_atomic_state
> *state,
>  		intel_ddi_update_active_dpll(state, encoder, master_crtc);
>  	}
>=20
> +	intel_dp_tunnel_atomic_alloc_bw(state, encoder,
> +					crtc_state, conn_state);
> +
>  	main_link_aux_power_domain_get(dig_port, crtc_state);
>=20
>  	if (is_tc_port && !intel_tc_port_in_tbt_alt_mode(dig_port))
> --
> 2.39.2

