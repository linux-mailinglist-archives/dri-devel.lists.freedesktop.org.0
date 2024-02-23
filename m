Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD31860AE0
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 07:38:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD6310EB1F;
	Fri, 23 Feb 2024 06:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ITZ4eZOu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF93F10EB1D;
 Fri, 23 Feb 2024 06:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708670326; x=1740206326;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xfjhf/yOSOtSO4hpwFwNdMWpQ7VU+QQTzoQwfNFidSs=;
 b=ITZ4eZOuGhtolZqhZiKq+uQbIaThL4GtVuMXvscEL4iEs52xx180vyAu
 Yk0c4hXHS6E406i9AqDJy1YfjfUUNy7Emulqn8nJ0NEyBvcwUqGNIIdAC
 SpEHTqXgR1jnjr4H9cN9dLfN3o/1wOMYCNIAOrtevSjfJgCx7YbnIkljS
 b8jx4QZ9mx9qoz6P1HaR4gYXfLoVnuqPCfMOFkEgPtg0mI6LixVQfJHjJ
 WogTEmWu3P00M6qpHvXSVke3/LrRovhSfLo/WE3Z0hMfpH8HHFAn3nlSz
 243XhTxsdhk9yFTTQKhmCgTrETmzfRD974+WkolGCG7G/CmpT3cNWo/Pw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="14097958"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="14097958"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 22:38:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="36596861"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 22:38:45 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 22:38:44 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 22:38:44 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 22:38:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1pXk3bKEEaBDS3ccvC8Pk/ZTgVY5ACYEzzvr9Xxf2dF4n0n66edUguoGHc8zo5lUrzUgw88ckw9tinYLBJBxX7Ax9pAXjicH3Bh92HyI8ZZ7EVnzqjKnEwCaRSOwsD86PSMCk+k/RnrTppZftNMIXxp6IMz5/ZJ8I2ttyRYy1znNeNPsyeU/Ey700X2qdExYrSZn4ITC3+NWf9MZpt8Pwf7Qym2g5mPaQwAUgQ6f2gFA1iuTqVfaMiQy9r3KedrV3VYEexTfnKJb2JXl/uJdXcLU9fjHNi/N8DBnxWZm+zgQVVG9BlVMY5YlKunXjY1Yvwc04lJnCWGnf9okCKRHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/NoquDGZQgYTVry6IIbUfHqpBTe0DmpFrKCVvIDouE=;
 b=Rl6KISsjeVVssxvAaUWSJuo6Ii80YGWFunowWHi8wlUckoAuvmLSm8r9/ztimXxuwDyFAW4FcLPliJ9jAoZNhFea7NVDLAQjH+aLNA8xOHrrev0oGapO3/wcGZUvUKtl5DIp+LgQp7MhjjMC3nnuWsGONcosAVjdKQikfdJ4ap8RxBkIsqnBXeCi5nFzpg2Qfv+Hdk4yzxOebX1DnsOxOIW4wcdpcsJPp6r2/yPSQRyytKIo3qyfJbyX+vgLDOnx+8d3Zffss4t4t9RGxtu4UosXEYxsf05aZJABQS63N+OHBVBmPrNxmKrybZHHJCDdrpFe8h8taGTOs4Vc1MyyRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 SA1PR11MB5875.namprd11.prod.outlook.com (2603:10b6:806:238::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Fri, 23 Feb
 2024 06:38:40 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d%7]) with mapi id 15.20.7316.018; Fri, 23 Feb 2024
 06:38:40 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 03/21] drm/i915: Fix display bpp limit computation
 during system resume
Thread-Topic: [PATCH v2 03/21] drm/i915: Fix display bpp limit computation
 during system resume
Thread-Index: AQHaZEJsLfK3YgbQHkeKiX5/7bbBXrEXfORg
Date: Fri, 23 Feb 2024 06:38:40 +0000
Message-ID: <DM4PR11MB6360F82385341D6BED1F53E2F4552@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
 <20240220211841.448846-4-imre.deak@intel.com>
In-Reply-To: <20240220211841.448846-4-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|SA1PR11MB5875:EE_
x-ms-office365-filtering-correlation-id: 85302819-84a3-4f14-88d5-08dc343a1262
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PaqH6cgdS9EeN7sUVT/F3lTf0IZc+QnV7z28nYXjpoHP4rKAaKe54E0vhipIjMD31qWqmtAnV7WgfvXCy2NhuYuzZ3ZJ2M8bbm71NCAgWWt2ggY1zmYmT7JYFfe1Wn6PMwSNjrIXLTwfOJm8S/gtlZTv67F3SucVUBtW2QoqaOfxVp+e8DrAZk/0pNtCbfFyKFhpVDCl0OM2OXz1k2gdRdurpbpu2GnD5t/wBNZHXQIAkiln0WteiqFpztEdJ/oOhs9ePoHSE/+35viPr3J7FTj+yr6UtjTyUDOrWbwlhjU459askOqk1QCiiGJzzBnPNddzbEKyS4L5hzjzXOdgF039nwQq0IrK50XHiT9PbIC1qem0m1eT5OFVfc6TDHej5ACrjf2nDQUmvLwbDbBLLgI2UQWyy6qaugZTy+USq8UKTyGP+LWbEdlTiZmzil8zTX0DjK16hnZ3LKT9QQkT16P/62kzTJB4JPjEpPouZQZnO1urJEcHtZrKA8N86NSrfE3qLT35ZfWR8z/8E6iDrc7dVqVL46lK2f97J3k+r3BKyAzltgC6HAMhTzfXukV95BZV+UYlXL7QEnqK5xaglU5lE0ERs+yzlHj4cicjdLy0vwDn57LCbl6DLgsOob6x
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wEGqeqEoJ1+sIs3X9NfzCJXR4dSa4MS0F3SL9HdSfkZSzAESkl73Z7YXusyZ?=
 =?us-ascii?Q?kOBmespYFU1qHhGB9RHdQ/evigkVymExjmVidZfaJgLKD56KAKGns+hejoKQ?=
 =?us-ascii?Q?FCCNELMOGLNKAfciubuKKPx+qRj/qPvryHTPg+lsXXYjhVW60rx/UFqjJhni?=
 =?us-ascii?Q?JDhLbowIgxOTT+M4BQwWwF7s0GL6LApv84CTJ8a2eM1i5dKtKZND87d3RhEi?=
 =?us-ascii?Q?bMv/Iw0Wqg0tjWV43IN6PEEUqjoagDnzmxYiN2eEHtb/00oaQEypg7u452tA?=
 =?us-ascii?Q?fY4ybX1n5XMfRnkdh2VPUS+fbsXIVG4m6YtP7+8kYYuxQP0vfYuApTAxlQ+6?=
 =?us-ascii?Q?rlJdepCWk5UpcynDuzL38/U5QKFU8ifmxP7gacz5P0BFKUHN9L3CyNwgKQvc?=
 =?us-ascii?Q?VjlmWxZ25+XkBI9ovjuRcNxfE3a4stl3WEHn3kEU9W0QAGmi391qhDr9GR3f?=
 =?us-ascii?Q?Fymr8urbnU0Whwwr6dumzS5IlMPabzqZJzeLliKB5u7+f1kxFZCcb/8/lPb4?=
 =?us-ascii?Q?bHka006v6TZ8EKOhIa0dZ46lSj2Zs4rjilkDcaPaIEwR2pvavI1Lq9VRAEWx?=
 =?us-ascii?Q?9v0Zg1u8WndrcgSOruJ4vcPqJwVTjXzrhbBa3SoqUy409RiWyHpS2suTgnj5?=
 =?us-ascii?Q?MvGKFo0Xg8PmWoXYC2ITT9zLZbzU676EdXKwE2wDgPSqX08SJIbGArbYxuln?=
 =?us-ascii?Q?3eHre9ZbDLYedXszkyiAO5KuwfofVQrxUmbQugGgKyUjpTnnjRCmWKcXsdqT?=
 =?us-ascii?Q?15yaJQ+mKxre35PiDLbRR+v3zbiNIKdjLQ57aayyeu/ng5nxIVHiCrv7mKjF?=
 =?us-ascii?Q?9HPN9bZ4zsqtiVGgK5uyYN77OHxFp8KOBd/6Q9RLGbP89n6Gag6QZCUPvhSM?=
 =?us-ascii?Q?HRB+G3pr7D/yba+g0jVwfcJ2Jc9t8HfxC1L2Zh1dFKO/uooGE/JD8qdJ7IcV?=
 =?us-ascii?Q?t2gedfqSNMaOEIkThUVPZ7yGRSGDy+VjX023yt97hy/Spkt3O+OIhRahRjyD?=
 =?us-ascii?Q?K+jaJ1In1D8kL85XCP18zRL071Wb6hh50bRw/ph9xuwyGBM1ZS9nYPruIngD?=
 =?us-ascii?Q?ENx/GXgLXfbLcocg/+x4Kb4EIw2MAAA1HPssOv/+E/m6vGsXXXIY9jLPgyU+?=
 =?us-ascii?Q?OngziioN5y2+W3AX3SQVKhPEuH/2x7PCX6/AGpnnlyze9YxYv+8JgOUtSeMz?=
 =?us-ascii?Q?W/TClNcYpJkkNJedRDKzYSpLqomMRX4a61HpDeO0O28HjE0l0yRqxvQLylMz?=
 =?us-ascii?Q?Mbz2WR5kNEGR3J32RrBwNZzAiyVIFu7h3gO/1klYUMWKauchTUDB6xatvFCk?=
 =?us-ascii?Q?aAt+BNsIac9oajfEyMBfti96zjN848KutcoYAi6QcxK22EjRQrYe6wDJXADy?=
 =?us-ascii?Q?z2vUWaDxWab8rE0925aaEOoSvEy7HJAFEIIaXS/YB51o6qktgL0Q2hhO08q3?=
 =?us-ascii?Q?BuOGGoDh7lm/332FkXRlI23WJ7bNUuFtF67OlBj+aK8tGLH4SYa2J2ZmOzyo?=
 =?us-ascii?Q?JGQjHh46B58kKPrketaTSzlgpJjYdd1YaOeojZmst8uLrDTfE1Ve63oI+9EA?=
 =?us-ascii?Q?U7sXYfzF/qDscDwN8Aw0vAAVcuSNO0ndX66r1mB+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85302819-84a3-4f14-88d5-08dc343a1262
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 06:38:40.0449 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1C/s+/fR6uYwU8jl5UaP7GGKz4MjbJcfMgoqWVk1ZzTpXm+ND+BruuEwVKMcHwHsckxgCyjC+ynU+kxwwXg1bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5875
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
> Sent: Wednesday, February 21, 2024 2:48 AM
> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Subject: [PATCH v2 03/21] drm/i915: Fix display bpp limit computation dur=
ing
> system resume
>=20
> The system resume display mode restoration should happen with an output
> configuration matching that of the suspend time saved mode. Since the res=
tored
> mode configuration is subject to the bpp fallback logic, starting out wit=
h an
> unlimited bpp and reducing the bpp as required by any (MST) link BW limit=
, the
> resulting bpp will match the one during suspend only if the BW limit chec=
ks during
> suspend and resume are applied in an identical way. The latter is not gua=
ranteed
> at the moment, since the pre-suspend MST topology may not be in place dur=
ing
> resume (for instance if the MST sink was disconnected while being suspend=
ed),
> which makes the MST link BW check accept the unlimited bpp mode
> configuration unconditionally without ensuring that the required BW fits =
into the
> available MST link BW.
>=20
> To fix the above, initialize the bpp fallback logic with the max link bpp=
 / force-FEC
> limits left behind by the suspend time mode save.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c |  3 +--
> drivers/gpu/drm/i915/display/intel_link_bw.c | 22 ++++++++++++++++----
> drivers/gpu/drm/i915/display/intel_link_bw.h |  2 +-
>  3 files changed, 20 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index 00ac65a140298..485c38d71f106 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -6252,12 +6252,11 @@ static int intel_atomic_check_config(struct
> intel_atomic_state *state,
>=20
>  static int intel_atomic_check_config_and_link(struct intel_atomic_state =
*state)  {
> -	struct drm_i915_private *i915 =3D to_i915(state->base.dev);
>  	struct intel_link_bw_limits new_limits;
>  	struct intel_link_bw_limits old_limits;
>  	int ret;
>=20
> -	intel_link_bw_init_limits(i915, &new_limits);
> +	intel_link_bw_init_limits(state, &new_limits);
>  	old_limits =3D new_limits;
>=20
>  	while (true) {
> diff --git a/drivers/gpu/drm/i915/display/intel_link_bw.c
> b/drivers/gpu/drm/i915/display/intel_link_bw.c
> index 9c6d35a405a18..27ea858897c9f 100644
> --- a/drivers/gpu/drm/i915/display/intel_link_bw.c
> +++ b/drivers/gpu/drm/i915/display/intel_link_bw.c
> @@ -6,6 +6,7 @@
>  #include "i915_drv.h"
>=20
>  #include "intel_atomic.h"
> +#include "intel_crtc.h"
>  #include "intel_display_types.h"
>  #include "intel_dp_mst.h"
>  #include "intel_fdi.h"
> @@ -13,19 +14,32 @@
>=20
>  /**
>   * intel_link_bw_init_limits - initialize BW limits
> - * @i915: device instance
> + * @state: Atomic state
>   * @limits: link BW limits
>   *
>   * Initialize @limits.
>   */
> -void intel_link_bw_init_limits(struct drm_i915_private *i915, struct
> intel_link_bw_limits *limits)
> +void intel_link_bw_init_limits(struct intel_atomic_state *state,
> +			       struct intel_link_bw_limits *limits)
>  {
> +	struct drm_i915_private *i915 =3D to_i915(state->base.dev);
>  	enum pipe pipe;
>=20
>  	limits->force_fec_pipes =3D 0;
>  	limits->bpp_limit_reached_pipes =3D 0;
> -	for_each_pipe(i915, pipe)
> -		limits->max_bpp_x16[pipe] =3D INT_MAX;
> +	for_each_pipe(i915, pipe) {
> +		const struct intel_crtc_state *crtc_state =3D
> +			intel_atomic_get_new_crtc_state(state,
> +
> 	intel_crtc_for_pipe(i915, pipe));
> +
> +		if (state->base.duplicated && crtc_state) {
> +			limits->max_bpp_x16[pipe] =3D crtc_state-
> >max_link_bpp_x16;
> +			if (crtc_state->fec_enable)
> +				limits->force_fec_pipes |=3D BIT(pipe);
> +		} else {
> +			limits->max_bpp_x16[pipe] =3D INT_MAX;
> +		}
> +	}
>  }
>=20
>  /**
> diff --git a/drivers/gpu/drm/i915/display/intel_link_bw.h
> b/drivers/gpu/drm/i915/display/intel_link_bw.h
> index 2cf57307cc249..6b0ccfff59dab 100644
> --- a/drivers/gpu/drm/i915/display/intel_link_bw.h
> +++ b/drivers/gpu/drm/i915/display/intel_link_bw.h
> @@ -22,7 +22,7 @@ struct intel_link_bw_limits {
>  	int max_bpp_x16[I915_MAX_PIPES];
>  };
>=20
> -void intel_link_bw_init_limits(struct drm_i915_private *i915,
> +void intel_link_bw_init_limits(struct intel_atomic_state *state,
>  			       struct intel_link_bw_limits *limits);  int
> intel_link_bw_reduce_bpp(struct intel_atomic_state *state,
>  			     struct intel_link_bw_limits *limits,
> --
> 2.39.2

