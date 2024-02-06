Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B4584BEC1
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 21:35:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B1710FF0B;
	Tue,  6 Feb 2024 20:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZaehEpmT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719AB10FF0B;
 Tue,  6 Feb 2024 20:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707251728; x=1738787728;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PvVQ3vPmdqIvdTXG/PgDBaHkEFBK7THqvEwzXNxvgn8=;
 b=ZaehEpmTtSkrS9G36OwtDxSapBOIfbSai4IRFqpsjZehn9lZPIYO/wJp
 D4SffkppNrphHXazma3znFq5RKyGG/TT2ubpENJx6q6TNPPNX0LEIbOUH
 UPnTHP0rBHJwL8eIsAtk6wgahuNiADBMRzGNZaF9QuuXpp9ywCx6ITqq8
 AkF9EApyclT0ePK5bNQOXaGQxTtHxuj4R5xaeuTaR2ybji+egoDQ1rfTY
 KUcMEpXX3YBtUlOH4ZTxsJutbhRx2L3igI+otg5/XDiFgl24MCMMAUVRy
 ZaB8HtrPu5KrJXuGDm7D92B+yd/aheJqjMKU0FvMY8gx4lqEC9d8HPuLb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="1115076"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="1115076"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 12:35:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="909753483"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; d="scan'208";a="909753483"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 12:35:27 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 12:35:26 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 12:35:25 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 12:35:25 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 12:35:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZZEEkFStilejjHTPdFJXLDi2DO6UjU6jY0FpJjHaIZ4mvNrg/v+jKEOzae1e2HwyDR2TmwOawJdiZBbebaZMUkR2ekLfjScj0POQSI8Vp7vhIkTB66H0RjZYn2GVnddQeibUBpjt5+WAROYJ2yv0CN9J9t4mv/bfRBpUybzrgFQ+di6FBpPnBGW7DBq61cw1k/bfOj+od562wtNdY4bbS9biJfVsCuangJYHVBK6s5EgYUsyfj7bzVtWthssoHp4gG6dPuiI+OLLlGeKmBycOTgoY0TTkhTZzkvboCZQoasDcScEfWabIRM2+ohvO4OTnvdZIpAT4ExoJpzdPsIGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Oq/NVzbOJBvZr0Y3vMLgyn2nsZKnypjU6ncVcXxre0=;
 b=WKmDrlXb9ZMBe1a8phbvBaQ31h8ZbPge7nS3QOaFAb2jCikUyh9Hspy3PUl9IOc4yNjF1Y035LqkAwnElBdE6mIIrfeuJAYLOlcmW0Fko/wGX+bB1SKiH2KES7rtnOBudycItvj8qUi6ZEwop6GrDnk0OUfwBlMHFgOSI6qETb/mSYULiE6rVy5OSI2ZifrPjh3qwzc4saHxjaX7aLWsF16R9BaHj2yLjCL680cPpcq3UrtnhLSq2q0B8m7nwl4mmhOez4vrl3A1WBJi5/gDpj3rJTSxndgTIGIv4unAG+1EA60IFhe347UHuGsiEoAiBoLlG0KKeIwNTKWi40I4tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 MN2PR11MB4567.namprd11.prod.outlook.com (2603:10b6:208:26d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 20:35:23 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d%7]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 20:35:23 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 07/19] drm/i915/dp: Factor out intel_dp_update_sink_caps()
Thread-Topic: [PATCH 07/19] drm/i915/dp: Factor out intel_dp_update_sink_caps()
Thread-Index: AQHaTecYoSWp8BFW7UquURyncigICrD93B+w
Date: Tue, 6 Feb 2024 20:35:23 +0000
Message-ID: <DM4PR11MB63600F17333FD75CBA10B88BF4462@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
 <20240123102850.390126-8-imre.deak@intel.com>
In-Reply-To: <20240123102850.390126-8-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|MN2PR11MB4567:EE_
x-ms-office365-filtering-correlation-id: cb0a91a9-8299-451b-d9ca-08dc275324fd
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9Dfg5Bn9Cm/EfkqTR2AggzvU40nnGy3PPnIeApskAz4+g+/BDDdAEWEfG8uNpomNG78V8+fx9dSoGNCWzFzvGYSYtbnScYxvztZ1cSA/xlGUKfsxKBnP93wf8gC4Us6BUlJcii7lzwSAJZlaadp8pXvlxkeC93Rf7zGT9vs/KxkgsGBkxdMuwdDB95kIXlTaTtpIUp9xsSXExikl5liSbG01jHnqyzG+cXzISAQofDTwVNKe267Ls6XJJl31ogoXnX7smO/LAmTdez0hpLMFXPJqMHchOE/Bg5pVIQJA0aXYYmJmDDh0It30Qzh++JruqefSWkDIdQYIelpu29T8GzifhNCN77LwzSBEgL0k3EvnokHJPSOjv0Iyh/J+scucwcVGNi2k8dwQR5p5fvv6OKQBabEfz3s/RzQ/SzQVovAngU3hAZIre45ly3hw6vRkSEu1L9F8TU1wAr/0domCS8opyLHuTZYgPR9auTcVVDSk2h3B2QQNfbITbLs2rulEI78KE2sA6q2ZWmP2ZLaTSohIfobrEu/ShuxwVTUyc1lTnRmh2aotrjY4lrQBz+5Nb8lliw+S3h0A1vux8cEwzJYAklljq1ojoSvzgVaEn/GAkCeYd7TQzCslJL9sLfhf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(376002)(346002)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(41300700001)(26005)(86362001)(64756008)(5660300002)(2906002)(478600001)(110136005)(450100002)(66476007)(38070700009)(76116006)(66446008)(66946007)(66556008)(52536014)(9686003)(8676002)(8936002)(4326008)(71200400001)(6506007)(7696005)(53546011)(33656002)(82960400001)(38100700002)(55016003)(122000001)(316002)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gXBazs6bKHEaMvC0F8Fc39tEhf9euCNJ6aM2IKZ6XcIFufSlw9wPOkxNSoHA?=
 =?us-ascii?Q?usnxliRGev6UZlEvpscMkbyUYu0cfW+MWY4pBK5Nf8Rwz7iHuhNoJLOTZKY6?=
 =?us-ascii?Q?U/p26h7MDjxObW9lE7k1FcL5hW0u447Z+Xb6p6ffGS62P8geh7yllBoyXRBl?=
 =?us-ascii?Q?KEywo/2+HFgBDdGvQ8gXPLCiX7d9NO6FCWvaTSx3SO5mLpLnghoo0IJkB1RB?=
 =?us-ascii?Q?eQxpYrikj/uCAzL968YZdxWxE3b/L96HMAaZqwLL1P0oTVYdnyXE6e8AbxCv?=
 =?us-ascii?Q?a+GSuCAeMYJM3d6N62aqDG8MnmhHa2Bn1wJKCIJhhD3GMa9r3SG4O7gKR8Pm?=
 =?us-ascii?Q?wTr9kASHFS2inu53TzUy4fRNCYf+ckeT8K9oy5S6sf/uWER2n2UAJ87soY8/?=
 =?us-ascii?Q?tR0Ebb75v3mb3bBzfofjAbwDXIO112VGUqXuDy3szco3vw//CjPk2NZD8d82?=
 =?us-ascii?Q?Tjp5yFFAfYunPhq//B6kD0TW57wt9CtMhZedfYgJgseyBtGou7ltu53Q0/XE?=
 =?us-ascii?Q?8AoE5H2gkzqUIKH98Ao+nl9D/zkiF2MvoKN7XD+jtKqPaBT2Lwd8lwsmtf/P?=
 =?us-ascii?Q?GeQZocYPD/IflOOdZT4Gu4Q8PjWrW7IFjtN3yPXk/Xs4QHUOs9X+uIZCe5VY?=
 =?us-ascii?Q?FoJNdnFmj0E6tWlOQlXMJ0/rxBaNfqi2gMEej+fzTRMH6CwBrt9bssdA3y1o?=
 =?us-ascii?Q?e5YWeFeU1KPn5fPl9bbszgJICq0ozHG7ZdLWcW/qqjur2UznMK+5ZjQc8Uvc?=
 =?us-ascii?Q?36UYZ8vXjdCMONNrGiNZorsR9ca8rxV7RyDQBvCTG4s+g8H8WxeYtQPplMMU?=
 =?us-ascii?Q?LdK+Bibs7Dlu7C9S5KEJJMx/fkdIuo06yBqCBxKnCy7FieHGHlFsBya9SnGd?=
 =?us-ascii?Q?0LMCK2Cd8f5t9gGcM5lMmPtkIdd18KMartoaeMW0JA4z8qMxdObZybFP8JDV?=
 =?us-ascii?Q?FzTXHBuFi6ZjGZjgeopeVaZ/IoCBrdOtw3Nf1l7Ks5HGtL0x/QiyS4AksQqL?=
 =?us-ascii?Q?p55iciA4w6SU/Mrw4Kj0ki45/772T9L2s/Uky/qXkxIDZfD4VU17JqRuVvTz?=
 =?us-ascii?Q?3NWSQK8YFR87AGm0NUucw8f75Xu0VpNLv6q0XcsJJ+rGnkubZjAF0m1vjzUq?=
 =?us-ascii?Q?/r2wvc1gYC/sNc+MP7NgoTJ3rHASSt474D31d0W745aqSyGJRNxxPtgr9iOW?=
 =?us-ascii?Q?qF15wZyIzo6MEY6wwP83dnaXDqye5yxSO5G7sXZbm/n01cAAbLKNZSOPbfgQ?=
 =?us-ascii?Q?F+CVLsAVOewBPGUTq3s1YeOhLviNCpe9xbevZWYUdDVAxbiMyvfxCC2r0heZ?=
 =?us-ascii?Q?JeCZTfAe/3WWXOmbMebbAhD9eA1667flimTjuOSB2oOVUNaOy2W3VELkwi/4?=
 =?us-ascii?Q?iD6V0B87txDLyTFqB0sP6hV3itsVk6u1Gnr8ZlOyCTU2RxYRvuX1bVQMQa1i?=
 =?us-ascii?Q?Wtww2IvGfRSfy7PLEop5LKUfZTMMRtc4YL0xZPR68oqLXYlpRZ5Ot8+xJxye?=
 =?us-ascii?Q?vEu8k+9q1G8EB6plvO/91NQsiaNIji4Gq5vXOO6bHGPQgbmQZFd1q9Ih76hd?=
 =?us-ascii?Q?nYumXupbqqtCmdLbZfby2h32e6s2aboNjX6nq3tY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb0a91a9-8299-451b-d9ca-08dc275324fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 20:35:23.5771 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NPd+f0ZQtcFlVPl07G9w4ZGA7fWbrh99ZLXWDm3JE8pgBoYYQF5fW5UJvjkhjtarh9MB7QcCSquvdTsXWtCQ9g==
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Im=
re
> Deak
> Sent: Tuesday, January 23, 2024 3:59 PM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Subject: [PATCH 07/19] drm/i915/dp: Factor out intel_dp_update_sink_caps(=
)
>=20
> Factor out a function updating the sink's link rate and lane count capabi=
lities, used
> by a follow-up patch enabling the DP tunnel BW allocation mode.

Looks good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 11 ++++++++---
> drivers/gpu/drm/i915/display/intel_dp.h |  1 +
>  2 files changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index f40706c5d1aad..23434d0aba188 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3949,6 +3949,13 @@ intel_dp_has_sink_count(struct intel_dp *intel_dp)
>  					  &intel_dp->desc);
>  }
>=20
> +void intel_dp_update_sink_caps(struct intel_dp *intel_dp) {
> +	intel_dp_set_sink_rates(intel_dp);
> +	intel_dp_set_max_sink_lane_count(intel_dp);
> +	intel_dp_set_common_rates(intel_dp);
> +}
> +
>  static bool
>  intel_dp_get_dpcd(struct intel_dp *intel_dp)  { @@ -3965,9 +3972,7 @@
> intel_dp_get_dpcd(struct intel_dp *intel_dp)
>  		drm_dp_read_desc(&intel_dp->aux, &intel_dp->desc,
>  				 drm_dp_is_branch(intel_dp->dpcd));
>=20
> -		intel_dp_set_sink_rates(intel_dp);
> -		intel_dp_set_max_sink_lane_count(intel_dp);
> -		intel_dp_set_common_rates(intel_dp);
> +		intel_dp_update_sink_caps(intel_dp);
>  	}
>=20
>  	if (intel_dp_has_sink_count(intel_dp)) { diff --git
> a/drivers/gpu/drm/i915/display/intel_dp.h
> b/drivers/gpu/drm/i915/display/intel_dp.h
> index a7906d8738c4a..49553e43add22 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -106,6 +106,7 @@ int intel_dp_config_required_rate(const struct
> intel_crtc_state *crtc_state);  int intel_dp_rate_select(struct intel_dp =
*intel_dp,
> int rate);  int intel_dp_max_common_rate(struct intel_dp *intel_dp);  int
> intel_dp_max_common_lane_count(struct intel_dp *intel_dp);
> +void intel_dp_update_sink_caps(struct intel_dp *intel_dp);
>=20
>  void intel_dp_compute_rate(struct intel_dp *intel_dp, int port_clock,
>  			   u8 *link_bw, u8 *rate_select);
> --
> 2.39.2

