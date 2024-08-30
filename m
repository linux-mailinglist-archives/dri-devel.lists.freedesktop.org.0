Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94329965685
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 06:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555C310E1C1;
	Fri, 30 Aug 2024 04:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f430H+Ny";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1471210E1C0;
 Fri, 30 Aug 2024 04:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724993064; x=1756529064;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1qVZGSGOrTI5UalHLg9RTgtHz9gROg8YjGfOtZaih8Q=;
 b=f430H+NynOOKl8JkOSzBEeMT65TuifU4ZcyovJUdtnOuGb/tKvxU0nMF
 mHPrxcGmSRyPP3PmSDC3wNBH3q5bvvJj5IFmmv19gKQIfqlDu+Fs3JpJR
 aDNDMNRqOzL4kb7mN0vjIq9wPpbFMJpfMo5HGLjQiPfBoKulpRo9nyiwO
 IQj6+Kj+ruim4W12ngBKl/wDkSaaX5Bm8X7hya6lDzAyL5de1LzAfdELk
 3OIiavfPsH1oNzN6uxrG0/ZGEstCMlljiBQn6eglaQIHS2UiomO5dOM86
 UZyzuPLaXmfbsbQI0oe90jgiZgrJB6h91ufNClglqzwhzK4w+iVhjQX2I w==;
X-CSE-ConnectionGUID: Vhg0XScSTDOsAFrpdab4Nw==
X-CSE-MsgGUID: im1s+4uZR9Cn+TCmioV83A==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34238268"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="34238268"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 21:44:24 -0700
X-CSE-ConnectionGUID: GlZbBlNzTtaYQTyUgGOzzg==
X-CSE-MsgGUID: 3B3DocsfQuarWx+NC1yZFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="101297626"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Aug 2024 21:44:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 21:44:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 21:44:22 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 29 Aug 2024 21:44:22 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 29 Aug 2024 21:44:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0cpOCdSALrYsYYYncL7XPiK5+oo3FVLhfnB0iUIkrTaUJ82ft0wocXD42KBFK/62THncO21KIg0AcMNadHLGrBlZlbCqw59smW8/fdq8ViCLoWt+99mzi2SeDpdx0ToffaLIhMYew9B1q88IBNIhmdOs1uUfJb8AYP7VUZTLjFGXOT8hBQollhU+x++LmgS9h15JzlGjqeJyEPkhiW3b7pkYa7Njzm5oxkfX3CpD9Uk0mS0Ivts4ATLd70HTS44TW4AlJM5qObXouuygQFCBriYsd5Lgv3NHC7BvdYvNLjN26P54lN+3w8pY4u7Q53mHkWDEmUPk5b5WQpvG3eNeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ysGL4YNtxygRrJOno0LxkjGaa1dVdsZNjJ8asc81qs0=;
 b=FE90CMKZlfO07362TCMYeKZrsSyvTBo3cpPk5aXWPS25Z0H8z5mPTNv/zr4PC/Y+KLhmfAHBqDNl1aepcFpXm2z88EEHegFjVpzg62OsGwM36e6UGJbJl48h/toNq+6lN5HTns893JMVubbk9RRm9l9CbX6dK2VLppRkM1ZYPuLi07AsVXR/gokVHpKfXiSvIgXcGBYOLogV6a+kuxlGomG3qLK4q1CXeEP1qyaQaYMmElL13ZEtwPDYi0XixSz4ECjovDcxkvrEtG13yHeBk1xBcTtN3wqH/S17vaigngK6097BkjrDkv0xMuU5QCF3ZJEPff+kh+lSM/Lv9UQTbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MW4PR11MB5776.namprd11.prod.outlook.com (2603:10b6:303:183::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Fri, 30 Aug
 2024 04:44:19 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 04:44:19 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Garg, Nemesa" <nemesa.garg@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Garg, Nemesa" <nemesa.garg@intel.com>
Subject: RE: [3/5] drm/i915/display: Enable the second scaler for sharpness
Thread-Topic: [3/5] drm/i915/display: Enable the second scaler for sharpness
Thread-Index: AQHa0Q5H7ZRgASvyk0mcdW9+0ov4TrI+RCFA
Date: Fri, 30 Aug 2024 04:44:19 +0000
Message-ID: <IA0PR11MB73074677799E85AD887310C4BA972@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20240708080917.257857-1-nemesa.garg@intel.com>
 <20240708080917.257857-4-nemesa.garg@intel.com>
In-Reply-To: <20240708080917.257857-4-nemesa.garg@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|MW4PR11MB5776:EE_
x-ms-office365-filtering-correlation-id: ba75f7b4-5580-4e87-dea8-08dcc8ae68f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?TenXlGF7UjNdbjOPyg6z+k6yqaoQ8xdMpe5MyIUDjHCmc+sORsqx+vyXpi0z?=
 =?us-ascii?Q?P6UPAAZ15cbQOxvIdgJXYZo2tnAWQQB8y3Y/Z3ze0FbpaMkwfIghVLG6hzVb?=
 =?us-ascii?Q?e67QnrbCBHw1Ww+OLfsiMezzXSoFWvhXE0vFwBVHZkR0K53RjU3d+RIwWq3I?=
 =?us-ascii?Q?m1lHOGDDgtdl5PXBt9ENjt571JMGP829gV4MbEYjmyvLcEE/b2j80BBkL7G2?=
 =?us-ascii?Q?QXooM8llTPrWujWVddqu4LiDm8SWOgwzWuc4RhXmT4Kzy5HTrmos6upZPd2j?=
 =?us-ascii?Q?rKnmFBqb+w/xEwJQHUDrvjj0UTukOkcCziV9EdlKy4dnVK7q7r1uTlvek8Ic?=
 =?us-ascii?Q?rS4xCPPrOxqZA8oQWvpb8J+w+xEj29QNF1RTBTAGlSZSbRGFVhcLsiAVrwG5?=
 =?us-ascii?Q?/88PQ+eASneQSiF7oNprsz96C890Fknzv8Y7RpEXYYTAC9gKT1bg50lS27/q?=
 =?us-ascii?Q?UKo5XjM5yWH1CnABGiyJZv2ukAT9MvkEiMUW4d8OfL0zGbOdXgeq4YBKVu0L?=
 =?us-ascii?Q?YUyOmunVoqqBWfgG5clk8fvT47q906/F+Hu2zutyRxVcT2BD6w1fUfG+GEQa?=
 =?us-ascii?Q?yHOLkEkTWzTHvBRF0yuLhxdiYDhOeW0dUfrPlz0oCUCxEOWO7+0lzpu2V56T?=
 =?us-ascii?Q?zsEAHBOs9YB2YSoqjSMfkxyCKAhBU8kJkVv+XToCT34Hn0MseJN1ssh5NS6b?=
 =?us-ascii?Q?DvP2WisSh6pOpil6IsF3WWFyNlyi8TK15RYVzfRbePfdG+Fk5MDoIZp5Kc0Y?=
 =?us-ascii?Q?EDamy4xmYTzGvgk8DEnWZVodK22Y4eglAqdfZ+BeoUo1RhOqxh8fRyvrxydQ?=
 =?us-ascii?Q?+WmIgyr/chiabry9Ax/2UI6Bs9UimgFZrATcZ6n4zdLYYjRGfhovpiMITtak?=
 =?us-ascii?Q?fLGvJhptbdY8vfOLWX6gboHdoPM5KbcmumTJWBclwclHWpfe9H5saL8nh7H6?=
 =?us-ascii?Q?eHGgfZuzZoHgg3Q/3huTq8L5DLJ2W6GSgp6hbbmyQhVKipQjXjHsZwZgqbWR?=
 =?us-ascii?Q?mRI9Nqi580joTF/nRJ1Dzv+sx9HdNXpOZTm0mLdgYinAQ8GY5Qx9xRsWF/iI?=
 =?us-ascii?Q?1KZRwEXrtEIqZm3fFPlV2O1uX1VoJJOYVzWG9kaf0mvnDndanACIX2K9QD0U?=
 =?us-ascii?Q?dXgj4B2Ocz2zFEZys5ix5bYNxgqEB1SyJIS/bUQhfAIPDYn7ryoAGUhtADmk?=
 =?us-ascii?Q?gb8dMg5oRXaj/sM7XtZadlZrRE3wfQkpEO/wNN56Q30aIt82Ua4ifccPloA6?=
 =?us-ascii?Q?FMzNDiyq/EPAABeLCzw89GU1hPsbNUAHpjCsjqiMvdz/UGoTKxPDfLaoXyL3?=
 =?us-ascii?Q?Q7U85PwSJmSoE9t/RuhY7vVa9xaBwetUs2oGu11aVrvxq9o5c9Ejs1Y4pRtm?=
 =?us-ascii?Q?AbMzZnBK29hMbLSIk9fWvHZRcmIkjUCEHGx/MOgZi8jVYr5bLw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q2G/g8g+37pH5FXiUoXmPNXhiUE31QaJgkplX4b5f1poWmBRNRL7UoXAd6Ln?=
 =?us-ascii?Q?wd2H83TmWvv+zENnsrqnVtZ9N1L19d3PAfKyOhoGGPps0iQqgRCQERrYVT9Z?=
 =?us-ascii?Q?wgtbJcUhV+ObpJ6r5lbEwTxJTS4KI5/wVAu+c+7I5R1HHYw8/rnUWng0bUMP?=
 =?us-ascii?Q?dzErW8wrb1yjMXoPeANs3xbG+XrAatHKlNFPz5ZEeqIV8qm19DLV35CC+QtP?=
 =?us-ascii?Q?QPKkZFjiu71ZgHWBPpDWClF46YYxT2vVA3IV7Ms8k1kOUMXfJB9hiindwSul?=
 =?us-ascii?Q?NY9WuHlulCgJ5KTqZRFP0beWGawCN3u9iReHEZXvfZAg8FhFEN7Lt+OWL/DF?=
 =?us-ascii?Q?FWpL9//rQjgq4bqzvO6G/b2rkrwowbMmfgWhpE1ZhzzcoCam8J1NONdpZzjk?=
 =?us-ascii?Q?HtdIT6HKNEol5jwBI4EIvRzyeuMFl6/e3PcNul/2k2GxrinTfbjmqmmCY964?=
 =?us-ascii?Q?NCIU1H2frNpYIE544ZqzxmEI4yB1irDwjupaEw+kVG1erOo+JCX3p2yxMhIF?=
 =?us-ascii?Q?taIBZ4SMLZoha5YCN13doj4orCwGUralWNxSRyYPD/bxWp50aXzkXF4QGsCd?=
 =?us-ascii?Q?ndt2d2BYBWgG7/7uLbfQN5f/n4Jdp6DV3ARieyJW2nFM/PyOcDgIHSJQtMrR?=
 =?us-ascii?Q?I6DELDozqq6zKqYjwBjqX/eytXs00Qo+vxRJloLCNXe8ELSIKCGvsinqmDGB?=
 =?us-ascii?Q?WS84/aTyVorgC15vLNfCIx+SNTSdos/D8T7XN8YG2e/wcv1ndnyp8WYlXw0e?=
 =?us-ascii?Q?Ux7zeZvRs3G0KZ6Fmso28Etb7udglvqM6JQU1dFmIrhRGf2ogGIeOF2+2GN0?=
 =?us-ascii?Q?m6Jx+TuJJs0MuR+wexyCuJbT7a8i0X7A0niKQrDQm7ueKtdePOJh6eGLbPY/?=
 =?us-ascii?Q?nhHkwuSGBP7m4q2ag3rl44Wy8ZvpH2DYfjmixXmoIFp4Z57Tbyvy+Zwn2uTT?=
 =?us-ascii?Q?6/sshYC5PMZS0XAc53L9KsIVe6/ifjr9DL5hXJ2zncpbp1XYkWFyn1b7AXEY?=
 =?us-ascii?Q?rlveulTvCSeWwyy9OkTeFnAjfn9ic1lM+/f03SvhR8ZeedjkiDk7u7G0XAkJ?=
 =?us-ascii?Q?ThZHf2561QaW2S5D0A5ZIoXkVCYJq45WNUVsLkQ5y30x7sYKCvJtxDdZOUCx?=
 =?us-ascii?Q?NsBTz06aGJElmjFvkNKJRZynqm4uKrqCTY5MtzMTEBTCOWmEXLVqy2NBJMA6?=
 =?us-ascii?Q?qMnkgV+LW2SdpbFtqUj+Ra08UPrARdKSiXWhLtd47xEHHi1R9BtvSgkUhmmS?=
 =?us-ascii?Q?KlaCD0oQJNSoGKq+pzvv8lxFpB6vs2LwwJsTjD6LOkr8tStpesYi+Nbb3eue?=
 =?us-ascii?Q?S2Jk3Tv5q4bUFB3ozm2CwUhFboRtu35tCbA2VfhdbwI9Ihk0Rltc3+x0KEnO?=
 =?us-ascii?Q?dyZTrM6ahSAQ1yx6WP9U4cC63YG8zGRTggDV2WfsKCQDmcEZb5JNYsbmC+MP?=
 =?us-ascii?Q?rzlbraVcxo2G2DNzViKqqJFL1Hk+wHpG0p3xXUT1hFODmC/y03noPIgLmmQm?=
 =?us-ascii?Q?9HELFDSeHWZNcRBlk1kK5heqoiRa6etTmJfSSHX8IEfS4On5gt7zsnUO6P8m?=
 =?us-ascii?Q?A75Z1CN48NAh2NR7W39Cadm/pxeKedKjXufCjd3qPrC9TQEIAzmPdMK3rnEu?=
 =?us-ascii?Q?t1FxOx857+AlkC242zD5wk2g+uxBaqttrhQjzAxLqont?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba75f7b4-5580-4e87-dea8-08dcc8ae68f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2024 04:44:19.0121 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U6QdfknH3mnSVe1KMYB7K1rEkeoLFP+ggh//YQisP0rxAt7s96EwWPAs2OhU3iY5her8k55JHLNHwcxhnim8yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5776
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Ne=
mesa
> Garg
> Sent: Monday, July 8, 2024 1:39 PM
> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Garg, Nemesa <nemesa.garg@intel.com>
> Subject: [3/5] drm/i915/display: Enable the second scaler for sharpness
>=20
> As only second scaler can be used for sharpness check if it is available =
and if
> panel fitting is also not enabled, the set the sharpness. Panel fitting w=
ill have
> the preference over sharpness property.
Can you reframe the commit message, it's a bit difficult to understand.

>=20
> v2: Added the panel fitting check before enabling sharpness
>=20
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c  | 10 ++-
>  .../drm/i915/display/intel_display_types.h    |  1 +
>  .../drm/i915/display/intel_modeset_verify.c   |  1 +
>  drivers/gpu/drm/i915/display/intel_panel.c    |  4 +-
>  .../drm/i915/display/intel_sharpen_filter.c   | 10 +++
>  .../drm/i915/display/intel_sharpen_filter.h   |  1 +
>  drivers/gpu/drm/i915/display/skl_scaler.c     | 84 +++++++++++++++++--
>  drivers/gpu/drm/i915/display/skl_scaler.h     |  1 +
>  8 files changed, 99 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index a62560a0c1a9..385a254528f9 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -2028,7 +2028,7 @@ static void get_crtc_power_domains(struct
> intel_crtc_state *crtc_state,
>  	set_bit(POWER_DOMAIN_PIPE(pipe), mask->bits);
>  	set_bit(POWER_DOMAIN_TRANSCODER(cpu_transcoder), mask->bits);
>  	if (crtc_state->pch_pfit.enabled ||
> -	    crtc_state->pch_pfit.force_thru)
> +	    crtc_state->pch_pfit.force_thru ||
> +crtc_state->hw.casf_params.need_scaler)
>  		set_bit(POWER_DOMAIN_PIPE_PANEL_FITTER(pipe), mask-
> >bits);
>=20
>  	drm_for_each_encoder_mask(encoder, &dev_priv->drm, @@ -2284,7
> +2284,7 @@ static u32 ilk_pipe_pixel_rate(const struct intel_crtc_state
> *crtc_state)
>  	 * PF-ID we'll need to adjust the pixel_rate here.
>  	 */
>=20
> -	if (!crtc_state->pch_pfit.enabled)
> +	if (!crtc_state->pch_pfit.enabled ||
> +crtc_state->hw.casf_params.need_scaler)
>  		return pixel_rate;
>=20
>  	drm_rect_init(&src, 0, 0,
> @@ -4295,7 +4295,8 @@ static int intel_crtc_atomic_check(struct
> intel_atomic_state *state,
>=20
>  	if (DISPLAY_VER(dev_priv) >=3D 9) {
>  		if (intel_crtc_needs_modeset(crtc_state) ||
> -		    intel_crtc_needs_fastset(crtc_state)) {
> +		    intel_crtc_needs_fastset(crtc_state) ||
> +		    crtc_state->hw.casf_params.need_scaler) {
>  			ret =3D skl_update_scaler_crtc(crtc_state);
>  			if (ret)
>  				return ret;
> @@ -5481,6 +5482,9 @@ intel_pipe_config_compare(const struct
> intel_crtc_state *current_config,
>  		PIPE_CONF_CHECK_BOOL(cmrr.enable);
>  	}
>=20
> +	if (pipe_config->uapi.sharpness_strength > 0)
> +		PIPE_CONF_CHECK_BOOL(hw.casf_params.need_scaler);
> +
>  #undef PIPE_CONF_CHECK_X
>  #undef PIPE_CONF_CHECK_I
>  #undef PIPE_CONF_CHECK_LLI
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 1c3e031ab369..130740aaaa21 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -834,6 +834,7 @@ struct intel_sharpness_filter {
>  	u32 scaler_coefficient[119];
>  	bool strength_changed;
>  	u8 win_size;
> +	bool need_scaler;
Always for sharpness filter scaler is required, so does this need_scaler ma=
ke sense?
Rather should we not check for sharpness_filter enabled?

>  };
>=20
>  struct intel_crtc_scaler_state {
> diff --git a/drivers/gpu/drm/i915/display/intel_modeset_verify.c
> b/drivers/gpu/drm/i915/display/intel_modeset_verify.c
> index 3491db5cad31..ed75934bed6b 100644
> --- a/drivers/gpu/drm/i915/display/intel_modeset_verify.c
> +++ b/drivers/gpu/drm/i915/display/intel_modeset_verify.c
> @@ -177,6 +177,7 @@ verify_crtc_state(struct intel_atomic_state *state,
>  		    crtc->base.name);
>=20
>  	hw_crtc_state->hw.enable =3D sw_crtc_state->hw.enable;
> +	hw_crtc_state->hw.casf_params.need_scaler =3D
> +sw_crtc_state->hw.casf_params.need_scaler;
>=20
>  	intel_crtc_get_pipe_config(hw_crtc_state);
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_panel.c
> b/drivers/gpu/drm/i915/display/intel_panel.c
> index 71454ddef20f..bfc725d2e178 100644
> --- a/drivers/gpu/drm/i915/display/intel_panel.c
> +++ b/drivers/gpu/drm/i915/display/intel_panel.c
> @@ -451,7 +451,9 @@ static int pch_panel_fitting(struct intel_crtc_state
> *crtc_state,
>=20
>  	drm_rect_init(&crtc_state->pch_pfit.dst,
>  		      x, y, width, height);
> -	crtc_state->pch_pfit.enabled =3D true;
> +
> +	if (!crtc_state->hw.casf_params.need_scaler)
> +		crtc_state->pch_pfit.enabled =3D true;
>=20
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_sharpen_filter.c
> b/drivers/gpu/drm/i915/display/intel_sharpen_filter.c
> index b3ebd72b4116..627a0dbd3dfd 100644
> --- a/drivers/gpu/drm/i915/display/intel_sharpen_filter.c
> +++ b/drivers/gpu/drm/i915/display/intel_sharpen_filter.c
> @@ -36,6 +36,16 @@ void intel_sharpness_filter_enable(struct intel_crtc_s=
tate
> *crtc_state)
>  		intel_de_write_fw(dev_priv, GLK_PS_COEF_DATA_SET(crtc-
> >pipe, id, 1),
>  				  crtc_state->hw.casf_params.
> scaler_coefficient[index]);
>  	}
> +
> +	casf_scaler_enable(crtc_state);
> +}
> +
> +int intel_filter_compute_config(struct intel_crtc_state *crtc_state) {
> +	if (!crtc_state->pch_pfit.enabled)
> +		crtc_state->hw.casf_params.need_scaler =3D true;
> +
> +	return 0;
>  }
>=20
>  static void convert_sharpness_coef_binary(struct scaler_filter_coeff *co=
eff, diff
> --git a/drivers/gpu/drm/i915/display/intel_sharpen_filter.h
> b/drivers/gpu/drm/i915/display/intel_sharpen_filter.h
> index 6ab70a635e2f..d20e65971a55 100644
> --- a/drivers/gpu/drm/i915/display/intel_sharpen_filter.h
> +++ b/drivers/gpu/drm/i915/display/intel_sharpen_filter.h
> @@ -23,5 +23,6 @@ struct scaler_filter_coeff {
>=20
>  void intel_sharpness_filter_enable(struct intel_crtc_state *crtc_state);=
  void
> intel_sharpness_scaler_compute_config(struct intel_crtc_state *crtc_state=
);
> +int intel_filter_compute_config(struct intel_crtc_state *crtc_state);
>=20
>  #endif /* __INTEL_SHARPEN_FILTER_H__ */ diff --git
> a/drivers/gpu/drm/i915/display/skl_scaler.c
> b/drivers/gpu/drm/i915/display/skl_scaler.c
> index baa601d27815..9d8bc6c0ab2c 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -253,7 +253,8 @@ int skl_update_scaler_crtc(struct intel_crtc_state
> *crtc_state)
>  				 drm_rect_width(&crtc_state->pipe_src),
>  				 drm_rect_height(&crtc_state->pipe_src),
>  				 width, height, NULL, 0,
> -				 crtc_state->pch_pfit.enabled);
> +				 crtc_state->pch_pfit.enabled ||
> +				 crtc_state->hw.casf_params.need_scaler);
>  }
>=20
>  /**
> @@ -353,9 +354,10 @@ static int intel_atomic_setup_scaler(struct
> intel_crtc_scaler_state *scaler_stat
>  				     int num_scalers_need, struct intel_crtc
> *intel_crtc,
>  				     const char *name, int idx,
>  				     struct intel_plane_state *plane_state,
> -				     int *scaler_id)
> +				     int *scaler_id, bool casf_scaler)
>  {
>  	struct drm_i915_private *dev_priv =3D to_i915(intel_crtc->base.dev);
> +	struct intel_crtc_state *crtc_state =3D
> +to_intel_crtc_state(intel_crtc->base.state);
>  	int j;
>  	u32 mode;
>=20
> @@ -365,6 +367,11 @@ static int intel_atomic_setup_scaler(struct
> intel_crtc_scaler_state *scaler_stat
>  			if (scaler_state->scalers[j].in_use)
>  				continue;
>=20
> +			if (!strcmp(name, "CRTC")) {
> +				if (casf_scaler && j !=3D 1)
Should the scaler id used for sharpness filter be stored and the same be us=
ed here to check if its in use?

> +					continue;
> +			}
> +
>  			*scaler_id =3D j;
>  			scaler_state->scalers[*scaler_id].in_use =3D 1;
>  			break;
> @@ -375,6 +382,10 @@ static int intel_atomic_setup_scaler(struct
> intel_crtc_scaler_state *scaler_stat
>  		     "Cannot find scaler for %s:%d\n", name, idx))
>  		return -EINVAL;
>=20
> +	if (crtc_state->hw.casf_params.need_scaler) {
> +		mode =3D SKL_PS_SCALER_MODE_HQ;
> +	}
> +
>  	/* set scaler mode */
>  	if (plane_state && plane_state->hw.fb &&
>  	    plane_state->hw.fb->format->is_yuv && @@ -598,7 +609,8 @@ int
> intel_atomic_setup_scalers(struct drm_i915_private *dev_priv,
>=20
>  		ret =3D intel_atomic_setup_scaler(scaler_state,
> num_scalers_need,
>  						intel_crtc, name, idx,
> -						plane_state, scaler_id);
> +						plane_state, scaler_id,
> +						crtc_state-
> >hw.casf_params.need_scaler);
>  		if (ret < 0)
>  			return ret;
>  	}
> @@ -678,6 +690,15 @@ static void glk_program_nearest_filter_coefs(struct
> drm_i915_private *dev_priv,
>  	intel_de_write_fw(dev_priv, GLK_PS_COEF_INDEX_SET(pipe, id, set), 0);
> }
>=20
> +static u32 scaler_filter_select(void)
> +{
> +	return (PS_FILTER_PROGRAMMED |
> +			PS_Y_VERT_FILTER_SELECT(1) |
> +			PS_Y_HORZ_FILTER_SELECT(0) |
> +			PS_UV_VERT_FILTER_SELECT(1) |
> +			PS_UV_HORZ_FILTER_SELECT(0));
> +}
This looks to be a constant value, can it be a macro?

> +
>  static u32 skl_scaler_get_filter_select(enum drm_scaling_filter filter, =
int set)  {
>  	if (filter =3D=3D DRM_SCALING_FILTER_NEAREST_NEIGHBOR) { @@ -705,6
> +726,48 @@ static void skl_scaler_setup_filter(struct drm_i915_private
> *dev_priv, enum pipe
>  	}
>  }
>=20
> +void casf_scaler_enable(struct intel_crtc_state *crtc_state) {
> +	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> +	struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);

dev_priv =3D> i915

> +	struct drm_display_mode *adjusted_mode =3D
> +		&crtc_state->hw.adjusted_mode;
> +	struct intel_crtc_scaler_state *scaler_state =3D
> +		&crtc_state->scaler_state;
> +	struct drm_rect src, dest;
> +	int id, width, height;
> +	int x, y;
> +	enum pipe pipe =3D crtc->pipe;
> +	u32 ps_ctrl;
> +
> +	width =3D adjusted_mode->crtc_hdisplay;
> +	height =3D adjusted_mode->crtc_vdisplay;
> +
> +	x =3D y =3D 0;
> +	drm_rect_init(&dest, x, y, width, height);
> +
> +	struct drm_rect *dst =3D &dest;
Declaration to be in the beginning of the function.
Also I don't see the value of dst being changed and dest being used elsewhe=
re in this function. In that case why is a copy of dest made?

> +
> +	x =3D dst->x1;
> +	y =3D dst->y1;
> +	width =3D drm_rect_width(dst);
> +	height =3D drm_rect_height(dst);
> +	id =3D scaler_state->scaler_id;
> +
> +	drm_rect_init(&src, 0, 0,
> +		      drm_rect_width(&crtc_state->pipe_src) << 16,
> +		      drm_rect_height(&crtc_state->pipe_src) << 16);
> +
> +	ps_ctrl =3D PS_SCALER_EN | PS_BINDING_PIPE | scaler_state-
> >scalers[id].mode |
> +		PS_BYPASS_ARMING | PS_DB_STALL | scaler_filter_select();
> +
> +	intel_de_write_fw(dev_priv, SKL_PS_CTRL(pipe, id), ps_ctrl);
> +	intel_de_write_fw(dev_priv, SKL_PS_WIN_POS(pipe, id),
> +			  PS_WIN_XPOS(x) | PS_WIN_YPOS(y));
> +	intel_de_write_fw(dev_priv, SKL_PS_WIN_SZ(pipe, id),
> +			  PS_WIN_XSIZE(width) | PS_WIN_YSIZE(height)); }
> +
>  void skl_pfit_enable(const struct intel_crtc_state *crtc_state)  {
>  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> @@ -875,16 +938,19 @@ void skl_scaler_get_config(struct intel_crtc_state
> *crtc_state)
>  			continue;
>=20
>  		id =3D i;
> -		crtc_state->pch_pfit.enabled =3D true;
> +
> +		if (!crtc_state->hw.casf_params.need_scaler)
> +			crtc_state->pch_pfit.enabled =3D true;
>=20
>  		pos =3D intel_de_read(dev_priv, SKL_PS_WIN_POS(crtc->pipe, i));
>  		size =3D intel_de_read(dev_priv, SKL_PS_WIN_SZ(crtc->pipe, i));
>=20
> -		drm_rect_init(&crtc_state->pch_pfit.dst,
> -			      REG_FIELD_GET(PS_WIN_XPOS_MASK, pos),
> -			      REG_FIELD_GET(PS_WIN_YPOS_MASK, pos),
> -			      REG_FIELD_GET(PS_WIN_XSIZE_MASK, size),
> -			      REG_FIELD_GET(PS_WIN_YSIZE_MASK, size));
> +		if (!crtc_state->hw.casf_params.need_scaler)
> +			drm_rect_init(&crtc_state->pch_pfit.dst,
> +				      REG_FIELD_GET(PS_WIN_XPOS_MASK,
> pos),
> +				      REG_FIELD_GET(PS_WIN_YPOS_MASK,
> pos),
> +				      REG_FIELD_GET(PS_WIN_XSIZE_MASK,
> size),
> +				      REG_FIELD_GET(PS_WIN_YSIZE_MASK,
> size));
>=20
>  		scaler_state->scalers[i].in_use =3D true;
>  		break;
> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.h
> b/drivers/gpu/drm/i915/display/skl_scaler.h
> index 63f93ca03c89..444527e6a15b 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.h
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.h
> @@ -33,5 +33,6 @@ void skl_detach_scalers(const struct intel_crtc_state
> *crtc_state);  void skl_scaler_disable(const struct intel_crtc_state
> *old_crtc_state);
>=20
>  void skl_scaler_get_config(struct intel_crtc_state *crtc_state);
> +void casf_scaler_enable(struct intel_crtc_state *crtc_state);
>=20
>  #endif
> --
> 2.25.1

Thanks and Regards,
Arun R Murthy
--------------------
