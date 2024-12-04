Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BC49E3304
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 06:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFDAF10EBE2;
	Wed,  4 Dec 2024 05:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ce+u9j4/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C616610EBE1;
 Wed,  4 Dec 2024 05:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733289309; x=1764825309;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZE6CuEfKOkPgPvzH8SFY2gYBcZbPh0W1Cy1aUJxKAvc=;
 b=ce+u9j4/IeR2rOBFZjlA8UIy6K2x6sdBGzXAKeKuBczWJwMWk9vMGUlL
 GQK2+4frGpu44lBW+yfbWprr8mfuJWTFMmK3BqH3RfQjNHXmJh0w+U7IX
 MEspvkZtw1vLKr+NrWzwTmV2VhzPbh3xG5J4NxTuYpIcIR9gioh2VCO/k
 dlUa85pUrDcBDiaO/V+TDfT44ZYdR7bF9X9Orgwpw6YewRSOaHX8QaYGh
 RDp7kSYoBhkpzslMu/TN51PtyJpt9qspPv3Xo01jvQz871VClfG4yWU92
 3aYVVjeB2ifI3SCmOBFBsYCEzYdInsU+IacDZxjnYCV4Z3s+YfbOsK9/q A==;
X-CSE-ConnectionGUID: zku8BrC0SaOiDrHua3F6xQ==
X-CSE-MsgGUID: l1m9/qDaQ4yOUk02i+t/7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33669208"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="33669208"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 21:15:09 -0800
X-CSE-ConnectionGUID: 8OsDMbhoSRqPfO22U6j7Sw==
X-CSE-MsgGUID: qKQwriztTSmuuG8jQ5qEEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="98642456"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Dec 2024 21:15:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 21:15:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 21:15:09 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 21:15:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FYL7zoW7zia4eAgvkPCq6eZ7qNYqD1alrY7BQjlT1QOxaN0RwBIe9587S6OYpTgb6hIJFazUV4PvhKvCRIhWGNGEQlp5N/cgQEyeAF+YixGWttnX5/BWDe1gZdtENVHE6aSSy0hwTJETGcZ0FGqBA6wFhv8swRtIk/Y0e6e0cUVAg3/dvVPQCQzMKlFQFrsCk1Mx8fpLPnO6u9V95ZU51OQ1/bfG3uwIyYKVq+CFfHJndcOjnhMIfozgmQAqKHjd1EBP7FwQVDcfXuvuohFWsOvFmPMyTXGRSVeAwUw4+yi+5Xzjk93QyNRImS72OG+Q2tI0l7b/CDbtx5WvecCF7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHmoYAuOQYXJwfiKayd5TgPemMt9pDmmrWXTHvUzYD8=;
 b=xU7UgljAN4d9eOiWHgtZLjqX4hjA2pvYcuTei8Yccy22duf1679E4UokgoYBT/x0KCfnKFk+kKDiG+31BbOgnGVQW+BVGc89ez73HfWVW99/xgVTGiO9CbvSTW4CyEdGSdQAU+FEdqq+bSGfcsC5nEbTOfkIbP1RFm8lSOf9QIZ7g9oiHzwQ1O+vdweVDm1XD5YgCVqTLSEFfU9/r5fvRbH3ZaNHyXJ0yDb0/mf+4Z5JduUovpdisL6PymsfP9h2nayRSYmnCPPlHaSoDoTM6Kq8h3b8MMZ4t3/ykxZ9g3abzjidbF57KPF5aIVDdDt0wAPMcvwRU42BAPl1aUZ7sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by SA1PR11MB5780.namprd11.prod.outlook.com (2603:10b6:806:233::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Wed, 4 Dec
 2024 05:15:01 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 05:15:01 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCHv5 06/10] drm/i915/histogram: histogram interrupt handling
Thread-Topic: [PATCHv5 06/10] drm/i915/histogram: histogram interrupt handling
Thread-Index: AQHbRUlhqWHs6Um2PE+fX5ncm54h07LVisXw
Date: Wed, 4 Dec 2024 05:15:01 +0000
Message-ID: <SN7PR11MB6750253E6B76B67B3AE4CD65E3372@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241203055520.1704661-1-arun.r.murthy@intel.com>
 <20241203055520.1704661-7-arun.r.murthy@intel.com>
In-Reply-To: <20241203055520.1704661-7-arun.r.murthy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|SA1PR11MB5780:EE_
x-ms-office365-filtering-correlation-id: 56471623-4177-47eb-7ce9-08dd14229aaa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?5ik+FaZXRt0aGHd2maVpXMgndxTTqR2YpNDjxK5Da1YLZ4OmPm4rjvT3zUPA?=
 =?us-ascii?Q?vNAx2yrRFPTYPmLpAAEARU4iC9zex6zZNots/0xk8TIjrmAswYxgzglGUxpS?=
 =?us-ascii?Q?IfQ4EFVBaqwvmh/UyjOvY1qdp/Qymbw3M0i87y2+EKgrn3CMfzN2n73k2X18?=
 =?us-ascii?Q?JjesBlW3oS443pXgH5lcvd7F81I+sWFv+q0bAuZBaO2RrOcWl51NzyDmWB8J?=
 =?us-ascii?Q?gz4pQiER1Xd9ru0W4Z7GitO1x9ls4d8kvM1xcnAK9iDc7CV+YtxHH9oYrOaI?=
 =?us-ascii?Q?tY9zjiHXFgKTunLQFYZLLTC17dL1JKOgzSTTI+FWXAcylOMGa9NinWFt1hzd?=
 =?us-ascii?Q?l472jy8uHTRh26jot1ajEBDCvJMxNr2xRTn4iOCk1z6hTdkDVP132nkV4THr?=
 =?us-ascii?Q?Xud27Tz+jKfkMQZDBGzSXEhgId2EcOcR08lCmRW38zKbao4ryziWz2Ba0eDU?=
 =?us-ascii?Q?I2hV7IhnoeJG99E8+Zsv+JSX+lAAqdW6KLLKp7JLhT80QK5uNpFyVpHHPLyX?=
 =?us-ascii?Q?BSEap9qlkM3sxYEEl43GdnGq/UgCbTrolOnf1CkMbWkaYGqgyTNnA7Yb0E84?=
 =?us-ascii?Q?a0M2We+TsF7enDPn9ZOHRRuCpJnTCklj2nO22X7DLLr5sSYHCnQqcPN+ut58?=
 =?us-ascii?Q?PP2hnW2u80WSDpX95cjZ+nNatU9L0NXsmaTgAHoQdqXDGWxP5R4dQDuRoDvC?=
 =?us-ascii?Q?OS7WyTvBoJCpbw8TOFWQ+dcHlJY6TjDug8xljFHkyedh9ivPcUycW0FuqCC6?=
 =?us-ascii?Q?pr6aIMVTDsc8nnQ128QeUjZ1PmTvlx4zV32oTb8mq/MigQ2dZ/pOOkJQzqYB?=
 =?us-ascii?Q?AI2mk/f/VtyWNYQdOB5hMLgAqTg+msqSW6ULBBz8zP4+6uOWS/GYsEDlbozY?=
 =?us-ascii?Q?eeCtTQim+Q9/BLNyqPQ5CfKrUjotGBtVjbMlGx4fEl0QXy6JHCukvL8H0aJQ?=
 =?us-ascii?Q?mpyAmxrtfcYSLw13l02xYKmBh5o1OCT9RWIHMYLdNhtuYEAKdK2OOOMod4h9?=
 =?us-ascii?Q?6e1Z2vM6vDJ+fm4IUg2dugceU0erW/C5ByzCraRXsWwdjqhjhRTB0SvdCw5+?=
 =?us-ascii?Q?fvOpHMr/cCPHkmHbXGpl8N9Ys2esPnj5Ft/tYd80oysE7NJ+6RGX71s/kAKF?=
 =?us-ascii?Q?bWYaQRRNvjrGG2xxqs/JTNk81aqNLGqV6dcMOE0fmuthOTMDuVMWOBvOa7RP?=
 =?us-ascii?Q?xn7GuB3TZQxEZR6ZEfGR+qt/CZCxmTmGGHQEDrWpIYpoCQTgXR1ojV3W5Q4l?=
 =?us-ascii?Q?NRsgVjh7nd/+PlbfFiLptJAauUa0cPSBKrCJrA+9rvzVnCY52RNyoF/OfIBJ?=
 =?us-ascii?Q?FdR2l8hwSeGqPsDcLvC3CTktgPqbBVZtjrJRZ44oRtyBiCOE+r7OhUAgucpl?=
 =?us-ascii?Q?JhZ9hENBCH3u83iT6K8IvIxEU6PVCVu0A9dMtUvCaDCGhHlv7Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dyur+8XWnnZJKFQmGcQfpPlFgkn/uuCk1FCwzX+eTZTYRf/wvJoiRqseEIfn?=
 =?us-ascii?Q?OMHbNQjU2JDK/PvjdU6eguO6mPsIV8C8+aXQ+8eAf4jAiUWrtTPqD7L3I8sZ?=
 =?us-ascii?Q?AB4pch0C+n+BB5Ukrw40fshegEYfo8UjDzLm2JK2fhsF+Ef7IrFxFBJC0CzC?=
 =?us-ascii?Q?VvMFRJieLX5f+Lh4Z1BzyjvFFPmoDIbIeCCY7VIAOyI/exAm7RhKFGgP9s7g?=
 =?us-ascii?Q?HS+eJWqQrnpSL7JtalX+H4pDH0/9DzK5t3zt2pEoUNkf4H3bPajPB5WVLo0q?=
 =?us-ascii?Q?sACRp9rXLpVfrMQTTUA2xY/gpoBF4WJb3KFSWKbBzLixa/uktloTpaTYKFwZ?=
 =?us-ascii?Q?s+z+vbrsbIF7Htvhx10weYs1fy9lDtTm4xCG9ihOTtGJ4GybP0aC2GXSCVLk?=
 =?us-ascii?Q?L9XPGB9rWg9/IroNsQmE8dkM96xnuZZ63O6YSZGFPJks5weg8PeJeQn21d4D?=
 =?us-ascii?Q?3CXym535ujkFXBIA7fVSI8Axyk5s93zHQqxHwDjwDFEVQBRrbSAHemKryTvq?=
 =?us-ascii?Q?Qi6peSny/deJslVIhsjtZoKzHx6RQIdTD1mOstatua5GfILW3lH9vPTbqwym?=
 =?us-ascii?Q?rdpsOUskwtBcQEE4Ow6suk0jCJRNh4iTNRKO2pWSPdEkmaNVD5pV/puoY2GZ?=
 =?us-ascii?Q?FSalEsYkmkMCKYeOU9ZKFsG7nIjF7ofhT63UFbd55IYzs90hybGyeIAlkKEG?=
 =?us-ascii?Q?MA2UaqJjhJDsmUDGV00xZvvkJHZjx64RIZeK/lX3DW5mJpd7kk6N/N5RYxuh?=
 =?us-ascii?Q?jlKCvZXswNdY+Gh2FANnC52P091hJLcVPdlhCFXrtF8Osqo8h7Q+1Nwr84LY?=
 =?us-ascii?Q?fZtONQpcxtfha8JyrkazJOkC7Uk68O+g181IwUQd1544b2oW/ed5ZY/qxnMf?=
 =?us-ascii?Q?doGHiev6j8XdBL8LSv4FfyiVYRSS2yULjzyVS2x1ZBsEceTYVzfXDEFX8r4Q?=
 =?us-ascii?Q?/xGrkkpAYjrfqsTrraN8SkK+GE+pQqzCLsikrGqFDjBJK+1XIqK3pUrAAuVu?=
 =?us-ascii?Q?7uKiz9LoXMfERlL5BdqseDb1Y2Ldbvt6OrikfWlSNI5BT1jzTmoXEYHDkxs6?=
 =?us-ascii?Q?3wni1Hjm9pJ2rjZMksKlPUaN8FlmJeQzxdtbyv9d11dg3bm+FkSf/HW1VZvZ?=
 =?us-ascii?Q?2r/sBYNX48y8yUvJ6m9WHi60UzHYyUbpMI1iYPnpvNz++Q0V2sN6IfNtQ4tS?=
 =?us-ascii?Q?oYcUU1BzcyM8l8aHMBy9i+6AqqXRudLtRcmlEDImauRMZwswQWStGL//u4kV?=
 =?us-ascii?Q?4QnytIZFMQoYbaKNLJIz+3tONMnq/b39je6pFYyLmvB1p0Butwi7/0mu1Eps?=
 =?us-ascii?Q?L1PkJYnoRGmPLJII8nS9480RDV3RiQx67jPR5Ee8E9wXt1DYAKhKEjUAmIhi?=
 =?us-ascii?Q?QVrtD+GSYmCOTy/MdlmCrShpKIq3xHLVKX2qJ95hX+BMe55uknzS2ircOZn6?=
 =?us-ascii?Q?XUcd7aorKBgXiqqDY1D+I4X2r02HGmCfvPsjkp3LDF5lK6h6Oa8dTZ1uG5Pe?=
 =?us-ascii?Q?TuKZJXTDimCWIRJGl8uJ51d0z3mIR4VIUG0HTe1dAsDjDccimKC4WYaHqJLB?=
 =?us-ascii?Q?sl394TAsqV3J7tQ3R8ehpwinPh5tS/Wli2Qw/65p?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56471623-4177-47eb-7ce9-08dd14229aaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2024 05:15:01.2492 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8i+CLe72a9rjfsf+uu7JC/Mf7GgJSfGcc3TnFwnkkYAe69tXzhs/rU8tQ2yfNBWWVNLhjIZpenPya4gzRjtf2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5780
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Ar=
un
> R Murthy
> Sent: Tuesday, December 3, 2024 11:25 AM
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: [PATCHv5 06/10] drm/i915/histogram: histogram interrupt handling
>=20
> Upon enabling histogram an interrupt is trigerred after the generation of=
 the
> statistics. This patch registers the histogram interrupt and handles the
> interrupt.
>=20
> v2: Added intel_crtc backpointer to intel_histogram struct (Jani)
>     Removed histogram_wq and instead use dev_priv->unodered_eq (Jani)
> v3: Replaced drm_i915_private with intel_display (Suraj)
>     Refactored the histogram read code (Jani)
> v4: Rebased after addressing comments on patch 1
> v5: removed the retry logic and moved to patch7 (Jani)
>=20
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  .../gpu/drm/i915/display/intel_display_irq.c  |  6 +-
>  .../gpu/drm/i915/display/intel_histogram.c    | 87 ++++++++++++++++++-
>  .../gpu/drm/i915/display/intel_histogram.h    |  3 +
>  drivers/gpu/drm/i915/i915_reg.h               |  5 +-
>  4 files changed, 96 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c
> b/drivers/gpu/drm/i915/display/intel_display_irq.c
> index cb79c2796e3a..9eaca7125bf7 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_irq.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
> @@ -20,6 +20,7 @@
>  #include "intel_fdi_regs.h"
>  #include "intel_fifo_underrun.h"
>  #include "intel_gmbus.h"
> +#include "intel_histogram.h"
>  #include "intel_hotplug_irq.h"
>  #include "intel_pipe_crc_regs.h"
>  #include "intel_pmdemand.h"
> @@ -1180,6 +1181,9 @@ void gen8_de_irq_handler(struct drm_i915_private
> *dev_priv, u32 master_ctl)
>  		if (iir & GEN8_PIPE_FIFO_UNDERRUN)
>  			intel_cpu_fifo_underrun_irq_handler(dev_priv, pipe);
>=20
> +		if (iir & GEN9_PIPE_HISTOGRAM_EVENT)
> +			intel_histogram_irq_handler(display, pipe);
> +
>  		fault_errors =3D iir & gen8_de_pipe_fault_mask(dev_priv);
>  		if (fault_errors)
>  			drm_err_ratelimited(&dev_priv->drm,
> @@ -1774,7 +1778,7 @@ void gen8_de_irq_postinstall(struct
> drm_i915_private *dev_priv)
>  	struct intel_uncore *uncore =3D &dev_priv->uncore;
>=20
>  	u32 de_pipe_masked =3D gen8_de_pipe_fault_mask(dev_priv) |
> -		GEN8_PIPE_CDCLK_CRC_DONE;
> +		GEN8_PIPE_CDCLK_CRC_DONE |
> GEN9_PIPE_HISTOGRAM_EVENT;
>  	u32 de_pipe_enables;
>  	u32 de_port_masked =3D gen8_de_port_aux_mask(dev_priv);
>  	u32 de_port_enables;
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c
> b/drivers/gpu/drm/i915/display/intel_histogram.c
> index e9a431800553..57bb45b36a03 100644
> --- a/drivers/gpu/drm/i915/display/intel_histogram.c
> +++ b/drivers/gpu/drm/i915/display/intel_histogram.c
> @@ -19,7 +19,7 @@
>  #define HISTOGRAM_GUARDBAND_THRESHOLD_DEFAULT 300
>  /* Precision factor for threshold guardband */  #define
> HISTOGRAM_GUARDBAND_PRECISION_FACTOR 10000 -#define
> HISTOGRAM_DEFAULT_GUARDBAND_DELAY 0x04
> +#define HISTOGRAM_BIN_READ_RETRY_COUNT 5
>=20
>  struct intel_histogram {
>  	struct intel_crtc *crtc;
> @@ -29,6 +29,84 @@ struct intel_histogram {
>  	u32 bin_data[HISTOGRAM_BIN_COUNT];
>  };
>=20
> +static bool intel_histogram_get_data(struct intel_crtc *intel_crtc) {
> +	struct intel_display *display =3D to_intel_display(intel_crtc);
> +	struct intel_histogram *histogram =3D intel_crtc->histogram;
> +	int index;
> +	u32 dpstbin;
> +
> +	for (index =3D 0; index < ARRAY_SIZE(histogram->bin_data); index++) {
> +		dpstbin =3D intel_de_read(display, DPST_BIN(intel_crtc->pipe));
> +		if (!(dpstbin & DPST_BIN_BUSY)) {
> +			histogram->bin_data[index] =3D dpstbin &
> DPST_BIN_DATA_MASK;
> +		} else
> +			return false;
> +	}
> +	return true;
> +}
> +
> +static void intel_histogram_handle_int_work(struct work_struct *work) {
> +	struct intel_histogram *histogram =3D container_of(work,
> +		struct intel_histogram, work.work);
> +	struct intel_crtc *intel_crtc =3D histogram->crtc;
> +	struct intel_display *display =3D to_intel_display(intel_crtc);
> +	char event[] =3D "HISTOGRAM=3D1", pipe_id[21];
> +	char *histogram_event[] =3D { event, pipe_id, NULL };
> +	int retry;
> +
> +	snprintf(pipe_id, sizeof(pipe_id),
> +		 "PIPE=3D%u", intel_crtc->base.base.id);
> +
> +	/*
> +	 * TODO: PSR to be exited while reading the Histogram data
> +	 * Set DPST_CTL Bin Reg function select to TC
> +	 * Set DPST_CTL Bin Register Index to 0
> +	 */
> +	intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
> +		     DPST_CTL_BIN_REG_FUNC_SEL |
> DPST_CTL_BIN_REG_MASK, 0);
> +	for (retry =3D 0; retry < HISTOGRAM_BIN_READ_RETRY_COUNT; retry++)
> {
> +		if (intel_histogram_get_data(intel_crtc)) {
> +			/* Notify user for Histogram rediness */

Typo readiness

> +			if (kobject_uevent_env(&display->drm->primary-
> >kdev->kobj,
> +					       KOBJ_CHANGE, histogram_event))
> +				drm_err(display->drm,
> +					"sending HISTOGRAM event
> failed\n");

Nit: Start the debug statements with capital letter *Sending ...

> +			break;
> +		}
> +	}
> +	if (retry >=3D HISTOGRAM_BIN_READ_RETRY_COUNT) {
> +		drm_err(display->drm, "Histogram bin read failed with max
> retry\n");
> +		return;
> +	}
> +
> +	/* Enable histogram interrupt */
> +	intel_de_rmw(display, DPST_GUARD(intel_crtc->pipe),
> DPST_GUARD_HIST_INT_EN,
> +		     DPST_GUARD_HIST_INT_EN);
> +
> +	/* Clear histogram interrupt by setting histogram interrupt status bit*=
/
> +	intel_de_rmw(display, DPST_GUARD(intel_crtc->pipe),
> +		     DPST_GUARD_HIST_EVENT_STATUS, 1); }
> +
> +void intel_histogram_irq_handler(struct intel_display *display, enum
> +pipe pipe) {
> +	struct intel_crtc *intel_crtc =3D
> +		to_intel_crtc(drm_crtc_from_index(display->drm, pipe));
> +	struct intel_histogram *histogram =3D intel_crtc->histogram;
> +	struct drm_i915_private *i915 =3D to_i915(intel_crtc->base.dev);
> +
> +	if (!histogram->enable) {
> +		drm_err(display->drm,
> +			"spurious interrupt, histogram not enabled\n");

Ditto.

Otherwise LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> +		return;
> +	}
> +
> +	queue_delayed_work(i915->unordered_wq,
> +			   &histogram->work, 0);
> +}
> +
>  int intel_histogram_atomic_check(struct intel_crtc *intel_crtc)  {
>  	struct intel_histogram *histogram =3D intel_crtc->histogram; @@ -78,7
> +156,7 @@ static int intel_histogram_enable(struct intel_crtc *intel_crtc=
)
>  		     DPST_GUARD_THRESHOLD_GB_MASK |
>  		     DPST_GUARD_INTERRUPT_DELAY_MASK |
> DPST_GUARD_HIST_INT_EN,
>  		     DPST_GUARD_THRESHOLD_GB(gbandthreshold) |
> -
> DPST_GUARD_INTERRUPT_DELAY(HISTOGRAM_DEFAULT_GUARDBAND_DELA
> Y) |
> +		     DPST_GUARD_INTERRUPT_DELAY(0x04) |
>  		     DPST_GUARD_HIST_INT_EN);
>=20
>  	/* Clear pending interrupts has to be done on separate write */ @@ -
> 111,6 +189,7 @@ static void intel_histogram_disable(struct intel_crtc
> *intel_crtc)
>  	intel_de_rmw(display, DPST_CTL(pipe),
>  		     DPST_CTL_IE_HIST_EN, 0);
>=20
> +	cancel_delayed_work(&histogram->work);
>  	histogram->enable =3D false;
>  }
>=20
> @@ -181,6 +260,7 @@ void intel_histogram_finish(struct intel_crtc
> *intel_crtc)  {
>  	struct intel_histogram *histogram =3D intel_crtc->histogram;
>=20
> +	cancel_delayed_work_sync(&histogram->work);
>  	kfree(histogram);
>  }
>=20
> @@ -198,5 +278,8 @@ int intel_histogram_init(struct intel_crtc *intel_crt=
c)
>  	histogram->crtc =3D intel_crtc;
>  	histogram->can_enable =3D false;
>=20
> +	INIT_DEFERRABLE_WORK(&histogram->work,
> +			     intel_histogram_handle_int_work);
> +
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram.h
> b/drivers/gpu/drm/i915/display/intel_histogram.h
> index fb01ffe8903f..d7ddaab7ef54 100644
> --- a/drivers/gpu/drm/i915/display/intel_histogram.h
> +++ b/drivers/gpu/drm/i915/display/intel_histogram.h
> @@ -10,6 +10,8 @@
>=20
>  struct drm_property_blob;
>  struct intel_crtc;
> +struct intel_display;
> +enum pipe;
>=20
>  #define HISTOGRAM_BIN_COUNT                    32
>  #define HISTOGRAM_IET_LENGTH                   33
> @@ -28,6 +30,7 @@ enum intel_global_hist_lut {  };
>=20
>  int intel_histogram_atomic_check(struct intel_crtc *intel_crtc);
> +void intel_histogram_irq_handler(struct intel_display *display, enum
> +pipe pipe);
>  int intel_histogram_update(struct intel_crtc *intel_crtc, bool enable); =
 int
> intel_histogram_set_iet_lut(struct intel_crtc *intel_crtc,
>  				struct drm_property_blob *blob);
> diff --git a/drivers/gpu/drm/i915/i915_reg.h
> b/drivers/gpu/drm/i915/i915_reg.h index f48b5c809cec..836602e47511
> 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -1605,7 +1605,7 @@
>  #define   PIPE_HOTPLUG_INTERRUPT_ENABLE		(1UL << 26)
>  #define   PIPE_VSYNC_INTERRUPT_ENABLE		(1UL << 25)
>  #define   PIPE_DISPLAY_LINE_COMPARE_ENABLE	(1UL << 24)
> -#define   PIPE_DPST_EVENT_ENABLE		(1UL << 23)
> +#define   PIPE_HISTOGRAM_EVENT_ENABLE		(1UL << 23)
>  #define   SPRITE0_FLIP_DONE_INT_EN_VLV		(1UL << 22)
>  #define   PIPE_LEGACY_BLC_EVENT_ENABLE		(1UL << 22)
>  #define   PIPE_ODD_FIELD_INTERRUPT_ENABLE	(1UL << 21)
> @@ -1628,7 +1628,7 @@
>  #define   PIPE_HOTPLUG_INTERRUPT_STATUS		(1UL << 10)
>  #define   PIPE_VSYNC_INTERRUPT_STATUS		(1UL << 9)
>  #define   PIPE_DISPLAY_LINE_COMPARE_STATUS	(1UL << 8)
> -#define   PIPE_DPST_EVENT_STATUS		(1UL << 7)
> +#define   PIPE_HISTOGRAM_EVENT_STATUS		(1UL << 7)
>  #define   PIPE_A_PSR_STATUS_VLV			(1UL << 6)
>  #define   PIPE_LEGACY_BLC_EVENT_STATUS		(1UL << 6)
>  #define   PIPE_ODD_FIELD_INTERRUPT_STATUS	(1UL << 5)
> @@ -2470,6 +2470,7 @@
>  #define  GEN12_DSB_1_INT		REG_BIT(14) /* tgl+ */
>  #define  GEN12_DSB_0_INT		REG_BIT(13) /* tgl+ */
>  #define  GEN12_DSB_INT(dsb_id)		REG_BIT(13 + (dsb_id))
> +#define  GEN9_PIPE_HISTOGRAM_EVENT	REG_BIT(12) /* skl+ */
>  #define  GEN9_PIPE_CURSOR_FAULT		REG_BIT(11) /* skl+ */
>  #define  GEN9_PIPE_PLANE4_FAULT		REG_BIT(10) /* skl+ */
>  #define  GEN8_PIPE_CURSOR_FAULT		REG_BIT(10) /* bdw */
> --
> 2.25.1

