Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E3984BECC
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 21:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE05E112E0F;
	Tue,  6 Feb 2024 20:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wpo04mXX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC770112E0F;
 Tue,  6 Feb 2024 20:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707251848; x=1738787848;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=61A22rDelDpf/xup6dTNZr/L/URCz+cPKSc4VI+Ev+4=;
 b=Wpo04mXXhEe1XEN/Xmg7ao6sMRKJROWGELmMRT/nZBp+Dy8Ud1VxZi0u
 +4+pjb8/KbytavfrUwiHik16Ksn8kBAwU5DOnXtyuJwWRylSsX+khHZvj
 3cFKxcB6Gn1EV9PRx7+ftBGyeRLcEv2qpsdqwGb9PTLCPIe2FGE77K2FB
 E7Zh++19LRer4hOnHUkROaq5cP4FcTwl0H7CyM5rq9SJHrBGeNlGaKZ1G
 6LWH2kRNR7LzNgwVw/ELuwxMv88eRTENudNOhMjdJavA/JmV+gaXiKInC
 uTlBx9oCrUc4oOlnf5Y7dNZCRaF3gxZDtwCatFlQnf+oo/dbyFRDzjdVv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="11423697"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; d="scan'208";a="11423697"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 12:37:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="1124670"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 12:37:27 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 12:37:26 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 12:37:26 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 12:37:26 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 12:37:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UyPeYQoqnSBlE468G4FpJ7ZpWPRybbsGCylCudP/9jkeHBHU0rr73FV3aooLdNn3Pj2XK2IiZhiOOU5h1Ke+FeYWm/nwi/KMhXVXktpdzvsjefq4XhZvSAz1cevAHnG+YpAtMihLNBNPlGcNgQHCofnTDtASz48KMwkQ2DiMSL+2yssO6p9u72mERBuExFaFbEhgOFmRirnOJtfap1r/5PYkCeyep83Oo+GwIrcxa6a1B7B8ys/7R8VaGzLP0xDlAEUbieJHyA3syHD6YjKXUfGcPAAT2y7eh1XzoPc7xyx1mqMIYqHBEiNp3s+AdbFNIJv7ASkIBcjof1UMdMMekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgNGntkJeix9t+gpPRJF8hY8wvX+fq66SmbPTHDv1l0=;
 b=UW2p3KMndfiY0vI9M0zll/navr9gPN5dEbxuyt34STSaWy5147rjCroV1bUMvf5/Yw3z4pN6CD8MFwLOYTmW1meH754qS36QPfe9XtjRXA33cUkpQDhQ3Kowx2hU6Ogy7DJaginAi0+VtFrKtfHXjfrctORVaiVL4uLoB/eMSNQPjCcv8xXLR0gbGuwO5MoiddpjpdiBXZE4e0iSZ8dOwTJv+13P0l2rfObrvDf9VhC/oJQKUs2cmvqIzvb+mWBG56qU7BHgzmIRy9JivAWqHa1HNA4U5Wbq8m64yGB2Ez3iNQv6l08IJg7FU5znB39xry7w4KnahDcaebxhcBPmwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 CO1PR11MB5025.namprd11.prod.outlook.com (2603:10b6:303:9e::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.36; Tue, 6 Feb 2024 20:37:23 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d%7]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 20:37:23 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 09/19] drm/i915/dp: Add intel_dp_max_link_data_rate()
Thread-Topic: [PATCH 09/19] drm/i915/dp: Add intel_dp_max_link_data_rate()
Thread-Index: AQHaTecTprD1jLmGCEiV3TGSs8Z8VbD93KoA
Date: Tue, 6 Feb 2024 20:37:23 +0000
Message-ID: <DM4PR11MB63609510FBE2BED9967864F2F4462@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
 <20240123102850.390126-10-imre.deak@intel.com>
In-Reply-To: <20240123102850.390126-10-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|CO1PR11MB5025:EE_
x-ms-office365-filtering-correlation-id: 05a089f3-6b7b-40c3-d095-08dc27536c60
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OLGHhbfLCpjLdCC3esFk8VnrBRMDJTPM6zv/vtBlanCKYQvpPYKOwapzwlqmb4BUhcNeG1bU/twyZj2X82MYgsdUHiliBij/9R8auSyJKaX/w8vLN9e6mTtpC2jiTTrot/Koid6GBNIQ6s8Ke5mTsGierDMTt+2ahnqwVv7L2pqAjDAJjYu3mJ3JpfV16AoN3irP4yzyvuGYSV2G8Sn07ysxqgJ/urODKvT6F5mv+QIqBK0p139Fm8cj7ITvNCC2fonRJcx3VxC+iqf0MQNZp409XWuhLyok+lyZpecBe07wERRpy7QE63srNvpuNygCdjYY3HMs/guFv7u9ksA2k26PrvJUqrFQsTcxLphxsmafwStHOgAfPzuWp265OcFpl1FppuOYvZJNiSMKRmncBE0expSRwSLhWoexMahp6eGGQpppqz+AWOJt0tHv5icF3Lwlfd/DQ+39dhQ6g6FAu/19QdULrX8HFgJ4OQuDM1/Z09pv/zBtem5vGgHLw4tJ8sbRjniZQ77i+W2jF+z8XcaqGACVipRiSQPyPIaDyHXiEvsv+Y+fZgfwOT9F8dvfiUU/OXTlyu4AxjRWlGfiaA/Fquya9b06nwmRs1WxGlbQsjxGFrUz1f2GUsHQQ0Wu
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(376002)(346002)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(41300700001)(26005)(86362001)(64756008)(5660300002)(2906002)(478600001)(110136005)(450100002)(66476007)(38070700009)(76116006)(66446008)(66946007)(66556008)(52536014)(9686003)(8676002)(8936002)(4326008)(71200400001)(6506007)(7696005)(53546011)(33656002)(82960400001)(38100700002)(55016003)(122000001)(316002)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ts7CFSESzyiqMAOHwWxFFUh0jsezWW0Rxzsr0smWP2b6EpM3o+6d3RgENaCd?=
 =?us-ascii?Q?WrD4Hdlq4avDmmCp2Sdo5yDULXbYqEKFma4V33ceGkunQUvckhc+Qa6Quwz6?=
 =?us-ascii?Q?BZ1vesb7RuST83FKH54ugtEl0vehazxHvpKUyisVrm0lkn0T7NKo5918RnSd?=
 =?us-ascii?Q?HunfRPlrj6QE9JMZV7wsOWKboQja4x62GlrsTJBKCNjdZTBEXKvu24YZO/Ha?=
 =?us-ascii?Q?LrUAFy+cA3rqxuCMpKrBSSGPnevJsxkLOmv7m2ckCEDEja2Owqrk59KjbQA7?=
 =?us-ascii?Q?e8B09RwVygUb8DbJNL62P+SA7QvaNE7g7bZ+RWhIK2hRGuEKdwisK2JYZMAK?=
 =?us-ascii?Q?4c7aneyMkPzYrjzsqo10Do5sZTJ1u2SIcx2SJOZ5rEwxBLWwPaglALOOYs0+?=
 =?us-ascii?Q?u9hTw2cCl9+hm47RadTF8tQrcVRh2/6YWQ8IHSpbGAv/EOcq1Q/4eURKOYRf?=
 =?us-ascii?Q?7L37GtGV6Kx7H8a97+mO2/GTvd0pdx5EkhS4kJPY3VMgt0YvFsJZyW1PGqUX?=
 =?us-ascii?Q?jbDCRioQ5DJ6yhiqVInEGJ1o1I4wM1da0ESvD+7LHU4UJTHrJrkeq8LzHI97?=
 =?us-ascii?Q?MKx8fk8CgdCsQ+2Puk9I7o9hACTVpg/vxCgkogKTGb3M7Q6t3FIkQh1ZyTkv?=
 =?us-ascii?Q?t/CMHJQaBz0VC595WKLPITFR5n2Fdyb0wkLuaS3UC4f9THJu1WsFAoyi8ADx?=
 =?us-ascii?Q?VodRYbxrRFT03Q3lKcchZsfspUbGF3qY3PKW+A/8JCIqLhZ9OFD2hLjCX3ie?=
 =?us-ascii?Q?rXbcGPqHK3EJwgDKoOV7TfxoNLhuNoHXgI0RWzVRliAkqMt39WS0Rx22EVNh?=
 =?us-ascii?Q?gCy58Ut6WWmVIdm8kOqN/77YBPi8NdQnG2r+9RKe7BgZjaYeOJeUnd8fjQYX?=
 =?us-ascii?Q?BVev0ktp5O7SYmH749C0Ii8nXrlLBJTwu467wSgmLNEwrAkt3cORZ+IUHucM?=
 =?us-ascii?Q?tasoY/vwiGZRZk91/ELwxVHB9b3PvxecFvJCk2eu+iBShM8lV0OzJFhe/Dio?=
 =?us-ascii?Q?KVrPsVsjhmMu1RVEZOcmzMqvuyiCALjo0ntFLrLT5OO4CeS8sSHSFHwNgY+0?=
 =?us-ascii?Q?HUi3ml6tRBF5VvF/uH5VAWlS2NkAUXReGB9+YJiYPGTTSq3g4JGqfysZifga?=
 =?us-ascii?Q?cgIZhXUlS7ijvdC6H2RXDPBqKJ93T+zs4SJgbKjTw8fgZO4x6FMqY34VF+Ec?=
 =?us-ascii?Q?dr2tsCXRKV5kGzcZq03D7/R2NSeygcArv7KIkejD+fob/zzpLa5PVA7ncGq+?=
 =?us-ascii?Q?+OLumjTOtuhDEuE6hp+Xa0Z88NVDHI+VB0LgW/c89WOudKC/ObpQHECAGq6M?=
 =?us-ascii?Q?DdNBSNrUAv3p/C9uVed0dmFoXoHWIXROm+lYZSDuMFNFmCbCt7FSYFK83QV6?=
 =?us-ascii?Q?WPOn4udb2D2Y8l5SPNmLmN/rvJjoGWCB6aCsqBVlgnm9T3MxvJcLIFM0WIa0?=
 =?us-ascii?Q?cq79DGq3xPv/ucBG6Vjpf4tQphMreuMK91jyujuWtQlgXtyT06SGWgxC0phP?=
 =?us-ascii?Q?pQkqYcH0iTjtJ6TbLg04tLWl3rAdIYvGdm4RGiW9k/r6wlwZVvxXgVuiMZMz?=
 =?us-ascii?Q?QzUghMbtMUyklMUNEwYquGRYzXvcSmY8/c/eeV4a?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a089f3-6b7b-40c3-d095-08dc27536c60
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 20:37:23.3432 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bBntRZclDolv7dDKnC79qsKswfcEDiC42yeSO+vvOY5vxImJ/dSopGUeEOgW+Cel+4l59d3fBEOZnjDss6KpCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5025
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
> Subject: [PATCH 09/19] drm/i915/dp: Add intel_dp_max_link_data_rate()
>=20
> Add intel_dp_max_link_data_rate() to get the link BW vs. the sink DPRX BW=
 used
> by a follow-up patch enabling the DP tunnel BW allocation mode.
> The link BW can be below the DPRX BW due to a BW limitation on a link sha=
red
> by multiple sinks.

Looks good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c     | 32 +++++++++++++++++----
>  drivers/gpu/drm/i915/display/intel_dp.h     |  2 ++
>  drivers/gpu/drm/i915/display/intel_dp_mst.c |  3 +-
>  3 files changed, 30 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 23434d0aba188..9cd675c6d0ee8 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -383,6 +383,22 @@ int intel_dp_effective_data_rate(int pixel_clock, in=
t
> bpp_x16,
>  				1000000 * 16 * 8);
>  }
>=20
> +/**
> + * intel_dp_max_link_data_rate: Calculate the maximum rate for the
> +given link params
> + * @intel_dp: Intel DP object
> + * @max_dprx_rate: Maximum data rate of the DPRX
> + * @max_dprx_lanes: Maximum lane count of the DPRX
> + *
> + * Calculate the maximum data rate for the provided link parameters.
> + *
> + * Returns the maximum data rate in kBps units.
> + */
> +int intel_dp_max_link_data_rate(struct intel_dp *intel_dp,
> +				int max_dprx_rate, int max_dprx_lanes) {
> +	return drm_dp_max_dprx_data_rate(max_dprx_rate, max_dprx_lanes); }
> +
>  bool intel_dp_can_bigjoiner(struct intel_dp *intel_dp)  {
>  	struct intel_digital_port *intel_dig_port =3D dp_to_dig_port(intel_dp);=
 @@
> -612,7 +628,7 @@ static bool intel_dp_can_link_train_fallback_for_edp(str=
uct
> intel_dp *intel_dp,
>  	int mode_rate, max_rate;
>=20
>  	mode_rate =3D intel_dp_link_required(fixed_mode->clock, 18);
> -	max_rate =3D drm_dp_max_dprx_data_rate(link_rate, lane_count);
> +	max_rate =3D intel_dp_max_link_data_rate(intel_dp, link_rate,
> +lane_count);
>  	if (mode_rate > max_rate)
>  		return false;
>=20
> @@ -1214,7 +1230,8 @@ intel_dp_mode_valid(struct drm_connector
> *_connector,
>  	max_link_clock =3D intel_dp_max_link_rate(intel_dp);
>  	max_lanes =3D intel_dp_max_lane_count(intel_dp);
>=20
> -	max_rate =3D drm_dp_max_dprx_data_rate(max_link_clock, max_lanes);
> +	max_rate =3D intel_dp_max_link_data_rate(intel_dp, max_link_clock,
> +max_lanes);
> +
>  	mode_rate =3D intel_dp_link_required(target_clock,
>=20
> intel_dp_mode_min_output_bpp(connector, mode));
>=20
> @@ -1564,8 +1581,10 @@ intel_dp_compute_link_config_wide(struct intel_dp
> *intel_dp,
>  			for (lane_count =3D limits->min_lane_count;
>  			     lane_count <=3D limits->max_lane_count;
>  			     lane_count <<=3D 1) {
> -				link_avail =3D
> drm_dp_max_dprx_data_rate(link_rate,
> -
> lane_count);
> +				link_avail =3D
> intel_dp_max_link_data_rate(intel_dp,
> +
> link_rate,
> +
> lane_count);
> +
>=20
>  				if (mode_rate <=3D link_avail) {
>  					pipe_config->lane_count =3D lane_count;
> @@ -2422,8 +2441,9 @@ intel_dp_compute_link_config(struct intel_encoder
> *encoder,
>  		    pipe_config->pipe_bpp,
>  		    BPP_X16_ARGS(pipe_config->dsc.compressed_bpp_x16),
>  		    intel_dp_config_required_rate(pipe_config),
> -		    drm_dp_max_dprx_data_rate(pipe_config->port_clock,
> -					      pipe_config->lane_count));
> +		    intel_dp_max_link_data_rate(intel_dp,
> +						pipe_config->port_clock,
> +						pipe_config->lane_count));
>=20
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h
> b/drivers/gpu/drm/i915/display/intel_dp.h
> index 49553e43add22..8b0dfbf06afff 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -117,6 +117,8 @@ bool intel_dp_get_colorimetry_status(struct intel_dp
> *intel_dp);  int intel_dp_link_required(int pixel_clock, int bpp);  int
> intel_dp_effective_data_rate(int pixel_clock, int bpp_x16,
>  				 int bw_overhead);
> +int intel_dp_max_link_data_rate(struct intel_dp *intel_dp,
> +				int max_dprx_rate, int max_dprx_lanes);
>  bool intel_dp_can_bigjoiner(struct intel_dp *intel_dp);  bool
> intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
>  			    const struct drm_connector_state *conn_state); diff --
> git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index cfcc157b7d41d..520393dc8b453 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -1295,7 +1295,8 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector
> *connector,
>  	max_link_clock =3D intel_dp_max_link_rate(intel_dp);
>  	max_lanes =3D intel_dp_max_lane_count(intel_dp);
>=20
> -	max_rate =3D drm_dp_max_dprx_data_rate(max_link_clock, max_lanes);
> +	max_rate =3D intel_dp_max_link_data_rate(intel_dp,
> +					       max_link_clock, max_lanes);
>  	mode_rate =3D intel_dp_link_required(mode->clock, min_bpp);
>=20
>  	ret =3D drm_modeset_lock(&mgr->base.lock, ctx);
> --
> 2.39.2

