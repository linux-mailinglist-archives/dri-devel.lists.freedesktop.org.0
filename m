Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F06384BEC4
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 21:36:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E9B112E07;
	Tue,  6 Feb 2024 20:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lLxikxbb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF05112E07;
 Tue,  6 Feb 2024 20:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707251783; x=1738787783;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m1haQtveLSSpXcmoMWyHyAnc2zAjmoMJ97gkinF9exI=;
 b=lLxikxbbcEeqrPQc1RwSSMhgR5Kx0RZV6BIY4v/DM/6yS94KhQUMuWOt
 9zobjkTaEanKpgHgiybMY+s2ES6QdHWOlhZmMnIBGR69nKcEZou35iqLM
 bcAQejk122SsAhH0eG8orNWdGRrnnX00BXY3UbyXzxxrhVyxVbLpz29MB
 VipRSgvzbKCznxybQyfYFKiv10DNKX6+ggfN6023DO9x9pK+MiO3m6x2D
 dSDeq073qVPPBrNXT9WkpLfjBVpUYwMOXnRlXEM2CHSBgLYVEvpqCuZr3
 UHIrBwH4k2LrOV7hZoa+N2FDDK2ARRQi4dk28JJMV7DebnJ8JXzHEHhG5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="11482168"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; d="scan'208";a="11482168"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 12:36:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; d="scan'208";a="38538500"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 12:36:23 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 12:36:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 12:36:22 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 12:36:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+ES/8Gl4VhDvOzWBfXvuKjio63B/trhvIPldUuCHyAM1xIchsbb8ginVJ66dW5UoaVIDySThevi8q5lf+qUb+mXDGLO4vn3xszTdKZKKRkX7wDZchXAM1ApB43TceTfe/Gxho3SESOaIfSm5qknBrbQrxzRU8FeK1cvCO9TIcMTY3s2mtBzbTF0hWlX/7ApzajJAQdVpS0+2AJBzdbcVWbYOcWmtN0Nv0ruXBtvOFLJ5VXfRN85hQfZErGz95GlPvJ7/xg//loBeb3W9uqDeFQuUqG39S4j2KPr9Gb3HCF5VDfLcZ7b/Z0gX6btfp+Kpt0FViyzeVQ6aHhX0mj/vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QcrIPa8MLFCKJD4To2n8babM31tA9ViPNEJv07rojmE=;
 b=ie2DrWjgExdhoM5sn7g+3FuONcFMcNJdglbn8jShzh35RGkccpRqseSKNiLaj3PaZM2meN2QUlpxc6CNhRwd7O0Xl0+bEWb0+CjlcNb8q0vJ9jarO8CI9k3pOpgk1+5PPWHZaY2CxMhJmJCE0KI9xuddXvGOmLLvHMZO+zhzi7usfC+CvpmJgFbY9jg7yp6y//HhusRnXR/DplgRNLlkK7FXl2gRJGTgYI9tKZGeikE/WxRTw3vwS/5VP89nm0EMw/vkdzqCHvEhwGd0OwHWXCQNwQz/g54tcZurlHxbt8lyRvtvamlVmrVVyO1bUeIQNljReOPP3dCkbRREHOL8cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 MN2PR11MB4567.namprd11.prod.outlook.com (2603:10b6:208:26d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 20:36:19 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d%7]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 20:36:18 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 08/19] drm/i915/dp: Factor out intel_dp_read_dprx_caps()
Thread-Topic: [PATCH 08/19] drm/i915/dp: Factor out intel_dp_read_dprx_caps()
Thread-Index: AQHaTecUtVPgUhgVGkCqG01y9A9lU7D93GPA
Date: Tue, 6 Feb 2024 20:36:18 +0000
Message-ID: <DM4PR11MB6360348BAD40506A72122520F4462@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
 <20240123102850.390126-9-imre.deak@intel.com>
In-Reply-To: <20240123102850.390126-9-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|MN2PR11MB4567:EE_
x-ms-office365-filtering-correlation-id: a1aa07bc-f2d5-408f-7435-08dc275345f3
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vni3lUTKCoueVX0Zxa5kHa0/DMxiJNISewRqw3q296zinrmjTdm5ow1p0Bt6keAiFfH37z2z+W3yOL/XHYAJyWI8MYenj9JB2GNwfmz+y0f8iRtpaXdY8959TNaTSGOcaKHLhCjGOpNGLPy+0oJyD7Tm54f424ixZ13apWIAXQpwBiSoX5sgjCg2GHq2FLL5VlM3+nLYs8TNmKSCtQwUMvAk9MbWsFJ72UZnmmhoRoLz2Ltstlo2WaGTnGOL2NcqA4fTL6FMK9Cx62rDJDKJ/RVnfFv7LgFRk+n56aNVEp9lZzt4EwuaXchuovE/6rZkcpYQp5K95e981Vr756Dtz+PEPOF/ElHbWrbQ6qO66CyTZSVF1RUdarYhmpcdfQyf0YnpmsrArXM0PplxFDPrzVSBOhpMZ9VhPV0eUf7OAw1AI/ecMX9PRVj6Q3TLeHJ/S16/NWJVpIodU9QYiaqHPloLnat4aLl3FqTwFBEeye+f7lzydWzr8KSVfaqq5NvE2Uredy/nBySOZaNzeq9yhyeyh7Td1gE5DAxBupt2BN+tHMlJTVJ44x1eyoct6bmog8iks+2cKLtnuWiDUAAlXy9eXrAzaBrRjE9uhbTVZWbJqqNdYeI68nhu3wWCJlbb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(376002)(346002)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(41300700001)(26005)(86362001)(64756008)(5660300002)(2906002)(478600001)(110136005)(450100002)(66476007)(38070700009)(76116006)(66446008)(66946007)(66556008)(52536014)(9686003)(8676002)(8936002)(4326008)(71200400001)(6506007)(7696005)(53546011)(33656002)(82960400001)(38100700002)(55016003)(122000001)(316002)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KQXMMZvPNhsGy3pj6Lxu1mLFG5h4U6/KNGovvBfwGElTmAHnSeaMErZ0cdzz?=
 =?us-ascii?Q?4zf62ltggpgfsitQyl7Ss5yNTjV7oR7FEHNxCpSTFPEiDdmX/7lIvuYOo6g8?=
 =?us-ascii?Q?nbm1lYiIu7fwG6tta46GbCphjJ8xR6Cqe62HGQwOLC4eoPhsTqcRZim7NGOP?=
 =?us-ascii?Q?GM/iXs7k/iT56J7tnDRYArIQFwZVbetwYXsL+v0nF50kVsmPlHl2WAYQAn8W?=
 =?us-ascii?Q?D+DmoT/aPl1uOWguz11kUXpQP7TaSQFIwwNbWvFaleW+0cb1UGWzDPJJ363Z?=
 =?us-ascii?Q?oF0QQ4p+THF7yWBBCAjLL9mSMXeY7hxjpYuV3iDaFSMvukSm+9ry62HNH93X?=
 =?us-ascii?Q?eqjJrP9gmlyXDVeXFGOsL+UfKd5gpN1uWNEZOlTGh+VYzHeJcvR4CID3zVDn?=
 =?us-ascii?Q?/r/hJo2m7joD1vIrpslOJU5KTb+SuHsweyMM/tFTnY9m8Pmwn8GJj4cMKgDp?=
 =?us-ascii?Q?VU7vblTSMPr1aFncxuO1MiLZ+VCeBm0s7B+3GOWnAVZDpTmBAZJ/Q3Oca4uH?=
 =?us-ascii?Q?5O02IyDiO4mR0dznHn4JhOR8MUSD8uw+glG1Ph2L4Ek8oE6QDUtU59k+dmkj?=
 =?us-ascii?Q?Vl5qwZCeXi9wXP/vHl2cTfhTvHeYeeTrp3VkTurX5+3C5fd5HozNWAtMvIZF?=
 =?us-ascii?Q?VoUwY+LLBQHBRhVTofX6oTMVMcjvwb4G9yGtkEvdB3a6Nn4NKqRXIOi3pQKh?=
 =?us-ascii?Q?y2sU3jxKwHgU4pwOZ2vzwiEsNWfuDCysCsWr05do75feP9TUIKNXfUR0vsa/?=
 =?us-ascii?Q?ODYuKGdWONseXqE2Ev4oq4fsbW29GvKdRFa6J2uqYjGrYcI45geoCpAobFIM?=
 =?us-ascii?Q?X2Lh4RHDH+esqAhUsESvCs1uTYY426gazrEOosom732NGROOP9D+gLfj+wLi?=
 =?us-ascii?Q?rEyW07Pq67cjliZKslM5WHWmUsTznpQ3j2ZEcnTzJ1MZ6BZlcHcrIIOh9mb+?=
 =?us-ascii?Q?0xudGgIi7Bwtdbzi6f5LsfzlWsrJn68SFvF4smT/F5KsfXhblmpMypp0Wfqo?=
 =?us-ascii?Q?seDZ/RhiW7nKZmKuJQvWB2j1D/pEKm01nW5MVdm3G3QJq3yORg9j48F7u71W?=
 =?us-ascii?Q?HdYibkvbY33K3QfjTILvYzJTmioem+2nlz90Fbi38kmaQqdsplkUwSKVeUIZ?=
 =?us-ascii?Q?jq5j4vImbP6I/57jAiHzRS1mLgHVT9ClOOyqYy1tN6TzCtljXlYzSRSyybbE?=
 =?us-ascii?Q?K9neCb02o+NN2nyN68+7iS+osuSLI2dZ3EHI31t7KiTXbgCn33/WKkB4oc1N?=
 =?us-ascii?Q?h+8xY80jEBBP/iqmah8AzSfNKI2EOT1fSNECRWp1cw4aoHo8mfyqRJPECnAm?=
 =?us-ascii?Q?u4taaYVb6tvgl2hJOoP+kzI3XEvL+EvsIeEknR5wGvRA1SSJDjG+IzAJdL2a?=
 =?us-ascii?Q?we1MZ9JdFu1I3m1EJQbkXocz4vKTgXKWndSeEwlQoRw+OD20w5Tu5lxF+nsK?=
 =?us-ascii?Q?6e4eW9ZLxz7e5cEgcqleiGeKUM6XVOvqekp/HEqrLoudlc2wt5efgsphsNJJ?=
 =?us-ascii?Q?bv0Q+2NGfIb+gtPvhyz14r/M7SbQpMVgcdI1z9WwQ3Tpee3HvlnVuJd+HRiI?=
 =?us-ascii?Q?RcCmPTpug89hmop/lYaiDuQ6sE+ga7n+6sCGPVK3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1aa07bc-f2d5-408f-7435-08dc275345f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 20:36:18.8941 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BdtBZY3ecSgIMfaJV9thLLrwnGxe3R/38xVBZft2tFLURc5MBRxhCIVg+D8AE6SKLcIzgUzrt2WD6iG0Qvc/mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4567
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
> Sent: Tuesday, January 23, 2024 3:59 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Subject: [PATCH 08/19] drm/i915/dp: Factor out intel_dp_read_dprx_caps()
>=20
> Factor out a function to read the sink's DPRX capabilities used by a foll=
ow-up
> patch enabling the DP tunnel BW allocation mode.

Looks good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  .../drm/i915/display/intel_dp_link_training.c | 30 +++++++++++++++----
> .../drm/i915/display/intel_dp_link_training.h |  1 +
>  2 files changed, 26 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index 7b140cbf8dd31..fb84ca98bb7ab 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -162,6 +162,28 @@ static int intel_dp_init_lttpr(struct intel_dp *inte=
l_dp,
> const u8 dpcd[DP_RECEI
>  	return lttpr_count;
>  }
>=20
> +int intel_dp_read_dprx_caps(struct intel_dp *intel_dp, u8
> +dpcd[DP_RECEIVER_CAP_SIZE]) {
> +	struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
> +
> +	if (intel_dp_is_edp(intel_dp))
> +		return 0;
> +
> +	/*
> +	 * Detecting LTTPRs must be avoided on platforms with an AUX timeout
> +	 * period < 3.2ms. (see DP Standard v2.0, 2.11.2, 3.6.6.1).
> +	 */
> +	if (DISPLAY_VER(i915) >=3D 10 && !IS_GEMINILAKE(i915))
> +		if (drm_dp_dpcd_probe(&intel_dp->aux,
> +
> DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV))
> +			return -EIO;
> +
> +	if (drm_dp_read_dpcd_caps(&intel_dp->aux, dpcd))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
>  /**
>   * intel_dp_init_lttpr_and_dprx_caps - detect LTTPR and DPRX caps, init =
the
> LTTPR link training mode
>   * @intel_dp: Intel DP struct
> @@ -192,12 +214,10 @@ int intel_dp_init_lttpr_and_dprx_caps(struct intel_=
dp
> *intel_dp)
>  	if (!intel_dp_is_edp(intel_dp) &&
>  	    (DISPLAY_VER(i915) >=3D 10 && !IS_GEMINILAKE(i915))) {
>  		u8 dpcd[DP_RECEIVER_CAP_SIZE];
> +		int err =3D intel_dp_read_dprx_caps(intel_dp, dpcd);
>=20
> -		if (drm_dp_dpcd_probe(&intel_dp->aux,
> DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV))
> -			return -EIO;
> -
> -		if (drm_dp_read_dpcd_caps(&intel_dp->aux, dpcd))
> -			return -EIO;
> +		if (err !=3D 0)
> +			return err;
>=20
>  		lttpr_count =3D intel_dp_init_lttpr(intel_dp, dpcd);
>  	}
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> index 2c8f2775891b0..19836a8a4f904 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> @@ -11,6 +11,7 @@
>  struct intel_crtc_state;
>  struct intel_dp;
>=20
> +int intel_dp_read_dprx_caps(struct intel_dp *intel_dp, u8
> +dpcd[DP_RECEIVER_CAP_SIZE]);
>  int intel_dp_init_lttpr_and_dprx_caps(struct intel_dp *intel_dp);
>=20
>  void intel_dp_get_adjust_train(struct intel_dp *intel_dp,
> --
> 2.39.2

