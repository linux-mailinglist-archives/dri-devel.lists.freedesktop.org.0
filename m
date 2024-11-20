Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 932909D3848
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 11:25:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5DE710E6DF;
	Wed, 20 Nov 2024 10:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nt3BjLiv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3E710E142;
 Wed, 20 Nov 2024 10:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732098339; x=1763634339;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DQI8Qn/k+lXi5kGo6bksObcEUjWwsF1yEo8bsy2kso8=;
 b=nt3BjLivCziWFMHU/OY/EhT/FkTChY9avHx8s6HXqEzNlMopb8QKA+JM
 5OBMl+QEAezMJ2mZjboazdUT0hkoI9u2bsZr5y26xYsWcFQLXvD/oFaoA
 11I4V5LtNw64DGPGRzqCNToeGlJd6JYUCamNzLk2EQVkQJRYIUdSfUlCi
 7HRd6TsZGPLoLt0CcrQ0A2zcQm8q/ThOT/vV1TyEZORhm2Yx0ZpVqqJ5U
 zbQjLqNz4bUMsUjCFJtamJZbF12N8/d7lFnYFKkrdYTZAD3fAyP0kcxGd
 zL1qhxOJ3+WEFa2bC9AXoh7yf892uQL8kccS5nvf4SWE9Fxft0E3yprPb g==;
X-CSE-ConnectionGUID: 7u71COLnREOgsQeSd0MWYg==
X-CSE-MsgGUID: hOvQyQO1R1eKk5wBM6RIZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32080658"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="32080658"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 02:25:31 -0800
X-CSE-ConnectionGUID: /nOBdSagQpGdQsBYMZJELg==
X-CSE-MsgGUID: 00SP/rNuRESXu9jBOWEpWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="90681883"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2024 02:25:31 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 20 Nov 2024 02:25:30 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 20 Nov 2024 02:25:30 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 20 Nov 2024 02:25:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JMYfDhVucFkOUyF1dBjtk5zivdMY5PuEobI4F3a3hPBFSIlpio/jy95wNWAjE+rAAn7z00zVC2M0kyyfNAr+etfx7z5CYJI1mq23N+Wi4c+HS0lZOF3Bk6TKrimGUEjcfG4gMtVNKxaYuR8wvFUDdCySlTs5uu10IESkjNsIYCQDbE8toUlskQhoGqJy71vkt37Dcof1qgWb878v1++3xClgQqCiblubc6rRBPl62ajPfElIh1ph8uKOxVCL7xKIa44IT2zsppdx6aG5PqLgeK1k3mEGDFW6rU4BxUPhu8nNm/nY+/3r+ApE5KD6vTOrbq/73MBQSWklhfmTTw8Usw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLJpmr7gJEa+LupY3nElbT5JLaF69Kh0kpCGWQn/3mg=;
 b=psEi9gdBz2edOG2DHsG2iFegqBfy6zqbDtfst7z0QoFnXg2bpIrLY+gZpI55XFKiioj3Px4FiiPQpTi2NWXUqoeTkEdXNUzBcNOedMBu1KsQg3ftd0RxF7lBLtXcKH5Tbn1grMWuEEy/8GfhCEteRo8BQBAoHMW8Zh684HK37RGH0xOyfFmgHPmgW00JkUkCjeKcZVdwon0k1cNR1NnFQk57YNEA+3O0tqVQJCpBhI1KtYHqKecKSQkZsb20fB9ttJo3cSL1XfNhs8ZHeOYgi8Irk1uiqF1iuy2jwUkGs8w2MAqj2eJEvArU9RorslgH9B/hfjRrd1T8ZZ6l/JBD3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Wed, 20 Nov
 2024 10:25:28 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8158.021; Wed, 20 Nov 2024
 10:25:28 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCHv4 7/8] drm/i915/histogram: Histogram changes for Display
 20+
Thread-Topic: [PATCHv4 7/8] drm/i915/histogram: Histogram changes for Display
 20+
Thread-Index: AQHbOnGPPZPc7ElHoEWYm7UlnLI4bbK/5Cbw
Date: Wed, 20 Nov 2024 10:25:28 +0000
Message-ID: <SN7PR11MB67501686D5E73E6311F4CC95E3212@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241119104521.575377-1-arun.r.murthy@intel.com>
 <20241119104521.575377-8-arun.r.murthy@intel.com>
In-Reply-To: <20241119104521.575377-8-arun.r.murthy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|LV3PR11MB8603:EE_
x-ms-office365-filtering-correlation-id: 153a989d-30d5-43b1-8427-08dd094da76a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Mgw+ZeBFvbH3i+lAK6DU1eCePjw6bIbaqYw6P2StODr63RbWRgJcNEQuIV9+?=
 =?us-ascii?Q?CFNePRJXu61Bp4nbtFhCn9xeq/4k5yVkR/w3ZfBxHrMupwfCIq2KgtkHbKks?=
 =?us-ascii?Q?zNlOzKO5jQL0IZTH5GB005sDGuzO2EpNuUafMNbmkyDr/KTmNTeRwZcOi83d?=
 =?us-ascii?Q?B9qQjVzOFoOiBCU00FrJ/y+y7veIzcVJ2Vz5pqYRnC7vE5QE3/TYbLbM6kUA?=
 =?us-ascii?Q?7MryLDSdq0Pz8khaBQVOTTvYZMZhWRwM2OsuUGH7jcnu17OREeAlPKIKgSef?=
 =?us-ascii?Q?2UkCpTPQL+pd4x103x5joggIlp+puU3YmP7ehzPAUKGwvtjpEnDfXtrYG4fR?=
 =?us-ascii?Q?7/b/N5jIE342N/qTB3lL+ieVrNeuSjP0+1yX5QrHnUAtG3w/gJEKw+z7gGiL?=
 =?us-ascii?Q?8P+eQlQ6cvPmGTpA3/W92ImzJr3WWnoBWi2MarbmysD1TddzPaIdDounQ1oL?=
 =?us-ascii?Q?wjZI5gyErrAiPGhiGQGUhXt3WQIETsi7g39vyL6fWZukZx9X6/ykdSUCaYTZ?=
 =?us-ascii?Q?E60a6JQfu65ql1XkBBWlgoxyn6KuBYF7nWAedhNhbV85WB88e+HGrtYjOr8t?=
 =?us-ascii?Q?uk0hrtV3Dgn2rzIXq6cCb6wDg2sUhYCR9lZDjY8yZDvjX0XcyTEr4xkjb35b?=
 =?us-ascii?Q?X9eyr3w32OfVrfcdK4dQp9pf0SukA+tTkbpwxZ/mbMaxpC4BxhYx9x+PVg6b?=
 =?us-ascii?Q?EDqRZE2EHtI3KI4fce44edC+O/l3ePuzMcSfyKEgK8iFl4hIXKGFpPmWS6rF?=
 =?us-ascii?Q?VXxMHxaJ56RF/rZCslRzfX5klXdOWxJvB4IdQ57NV5/5Mvak8xHvxvym2nYl?=
 =?us-ascii?Q?lvOydh70puSvFkPYvFjA+xzkpjf+3/VtaoKMs1vkbKJaKL0v2w+t7U5b+cwV?=
 =?us-ascii?Q?0uumjz7Bld2eEAdA61fSf3HFp4/TGrKVj5KL3bt2kt40G6XRAwc6POvOqtht?=
 =?us-ascii?Q?AKU9jpTdrPbvDWJ3bYGfNYc6aPAvV76Oi4kBRFb9EjeVVIupHl4tyFiKkGhS?=
 =?us-ascii?Q?cBCHLjIzdBNHk4zsu5ct3bAZvY4tAuuiMLVwJhVjHDXqCbzzYn0g+MurtH1R?=
 =?us-ascii?Q?aqBf7kR9HTyLRIuJUYxOS1uitLInVhke3PnxvE13nW2D91EEr9CEYi4Uz5Li?=
 =?us-ascii?Q?iiwuI2jK2X+GZaSJ2V2AhtBQi471Un6DeISpd1h+OFsKh9sh5IS/ow7uZm4J?=
 =?us-ascii?Q?cL4l/s6HmoU5BXPTiXqUmofTba2mN+90iG7fWksZWrLJFgL+HbHvCterpeAD?=
 =?us-ascii?Q?hnqfowVEn8ru0EVU/nkYAuYn5eKhplmVClWVStvt/NadUbafBk/O6AGxGcFA?=
 =?us-ascii?Q?ITdrtCAzlUpKACZCPSAw+2icKG6EgrBdSFdkHyLcuYRdBbpcknoJcyBP03M2?=
 =?us-ascii?Q?NAJw+ts=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Umlv+TV5saLCeDzxR5PubJWOt7QFG9Mij1Fc1YcC7mNTH3fL3J19XgmqTKyj?=
 =?us-ascii?Q?nGdjTzVBcFnz6JRLZfVNrvMtHisahTBJsA8v0f4qiCXFaW3EdrEglFlL3/gk?=
 =?us-ascii?Q?JcYUcpUEdknyxE3qBeQOMPl6/1KwKe0RNoT7dMK0Vq3/dP43cWhMx6ixjFGj?=
 =?us-ascii?Q?z4R9rFpNKoGAzwYm3FYSjbB4mkfC2beJtdnqk85j311/lsxLWOEO3u3duGmw?=
 =?us-ascii?Q?VINWb8aYe71rBX2iG3QczQZwJ7KtzzkDOv6y0VZaXH/Z/ufeyRC3yYbRFXIj?=
 =?us-ascii?Q?WzgFrSZZW4LXnIDVsayt7jmevPoftsXtqRMPPmAlMHRTZ27uG2Fw3EXjX+hg?=
 =?us-ascii?Q?PoLT72unmCRrCEiR3IjP89DCXAlr06+Amc0I5Xl34iIjcTjNBwG/ZnQKhQui?=
 =?us-ascii?Q?Ty2oX5TNCu6V49/s0S23J2N0P63IWCSeOM5wJUnzuj1ay96vPeLi8vxZWbYz?=
 =?us-ascii?Q?SVY7AxToTAX1HEg3Bi844agX3P4n4DSuNme+LAr3ssylaebtAMSFzNP3NtaW?=
 =?us-ascii?Q?o303SCA3QLwoT/u7u1mPc8EvODC3zunrubu+O7kxMlX8v1ezSFniDlGmDGi4?=
 =?us-ascii?Q?0MpOeVVWr7tqCSnMCvgc8XYoecorllqfmDOa2i1TKPxymLHNr6rLKlkw21ml?=
 =?us-ascii?Q?7nD1OgMUFFnGPgxe4NKNAojyJelCZG5+5k/Ewx/6ZdvZNc3ZihZFgS5O7Tlr?=
 =?us-ascii?Q?diy4PYYm5afTen+BxfarWIyxRfZbuu58mGwLzWDJHsX5dgwZDPTlrATz6Czo?=
 =?us-ascii?Q?G1VMgt9G33pelflLy76luMscyvy7nDtsY8egSTy7CEE3puKUqrxlX/xziAeB?=
 =?us-ascii?Q?wHtKDQb0HjbsJjmddvlfmB2Pk/mZdc2w84XPgSXYtzFyXFqDoVHSpXExT96X?=
 =?us-ascii?Q?iUFYF4DS4IWrOKtBR5uXt4aV3ZBxEwiMxcuzn4N66BHqMdNsR4v2244RKCYE?=
 =?us-ascii?Q?azeO2NRCyE0Qf2XdlaCXJTvH4JtKXji96VtxA+2yeIkdLlvfxs2kSNztsGWO?=
 =?us-ascii?Q?rIXs3A76Fh9278rqru1ErkGjXp7Yc6RLCnqcSh59S0596Ztli3ZQ4SD13oXC?=
 =?us-ascii?Q?OE6adP7eMZAfb5PzKSTAKIWYMb1j/AMlTls1Wdlx8y/Oz2ab8Y842TXhIq5W?=
 =?us-ascii?Q?CS03IE/064A8wzWkf7eqCrV0ag73za6oo7YAvEF4zEC5Pmj90oarNzKNxQik?=
 =?us-ascii?Q?DswAaEYff8OPICKKPLOic9pZEZ0ugleUjFqA2uTV/qXr8GGWBBAAPijDPMFf?=
 =?us-ascii?Q?yBgyb1SJ22psQG4P/agi+gs48vnpPvTMAcYYAHEuAuzC9GKSXcbyE4vtbU66?=
 =?us-ascii?Q?SZSH0QetFKrpCEahvRhKrmRNUWjcaFACCZE3iUk+1doC8RQeLyjjoZVcifb/?=
 =?us-ascii?Q?lgNVzbF87CAbu+pNWJXyPy7PZjHGBcKLrCh9zUL/VLV3RGoRHukIDTbYBO7I?=
 =?us-ascii?Q?0ERcr0RSaLVPBm61WIGcNZQmnaCyVPNqJNHACtfaPW13PWi1MONA2hQuVwWd?=
 =?us-ascii?Q?hdSGIuA9PWYLXG2I53zPDcKfIQ6MtQvFk73T02lfQhq7wKSQsGcfeQtLE85p?=
 =?us-ascii?Q?v0wow9s0UTuRCnLO8lt5GDaMp/YgrQsuiGjt6gAM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 153a989d-30d5-43b1-8427-08dd094da76a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 10:25:28.1427 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3E8Y7UUGEb0xBYgn0p76UJ+/6RBrnhhJ3gkcifAbB9RZMC9ZrgMr2nXQHro8dDdAmJoX+HsdYEM+P042uOi5vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8603
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Arun=
 R
> Murthy
> Sent: Tuesday, November 19, 2024 4:15 PM
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: [PATCHv4 7/8] drm/i915/histogram: Histogram changes for Display
> 20+
>=20
> In Display 20+, new registers are added for setting index, reading histog=
ram
> and writing the IET.

Bspec reference for new registers being added please

>=20
> v2: Removed duplicate code (Jani)
> v3: Moved histogram core changes to earlier patches (Jani/Suraj)
> v4: Rebased after addressing comments on patch 1
>=20
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  .../gpu/drm/i915/display/intel_histogram.c    | 111 +++++++++++++-----
>  .../drm/i915/display/intel_histogram_regs.h   |  25 ++++
>  2 files changed, 105 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c
> b/drivers/gpu/drm/i915/display/intel_histogram.c
> index fdcc64677e96..beaad9256e01 100644
> --- a/drivers/gpu/drm/i915/display/intel_histogram.c
> +++ b/drivers/gpu/drm/i915/display/intel_histogram.c
> @@ -29,6 +29,51 @@ struct intel_histogram {
>  	u32 bin_data[HISTOGRAM_BIN_COUNT];
>  };
>=20
> +static void set_bin_index_0(struct intel_display *display, enum pipe
> +pipe) {
> +	if (DISPLAY_VER(display) >=3D 20)
> +		intel_de_rmw(display, DPST_IE_INDEX(pipe),
> +			     DPST_IE_BIN_INDEX_MASK,
> DPST_IE_BIN_INDEX(0));
> +	else
> +		intel_de_rmw(display, DPST_CTL(pipe),
> +			     DPST_CTL_BIN_REG_FUNC_SEL |
> DPST_CTL_BIN_REG_MASK,
> +			     DPST_CTL_BIN_REG_FUNC_IE |
> DPST_CTL_BIN_REG_CLEAR); }
> +
> +static void write_iet(struct intel_display *display, enum pipe pipe,
> +			      u32 *data)
> +{
> +	int i;
> +
> +	if (DISPLAY_VER(display) >=3D 20) {
> +		for (i =3D 0; i < HISTOGRAM_IET_LENGTH; i++) {
> +			intel_de_rmw(display, DPST_IE_BIN(pipe),
> +				     DPST_IE_BIN_DATA_MASK,
> +				     DPST_IE_BIN_DATA(data[i]));
> +			drm_dbg_atomic(display->drm, "iet_lut[%d]=3D%x\n",
> +				       i, data[i]);
> +		}
> +	} else {
> +		for (i =3D 0; i < HISTOGRAM_IET_LENGTH; i++) {
> +			intel_de_rmw(display, DPST_BIN(pipe),
> +				     DPST_BIN_DATA_MASK, data[i]);
> +			drm_dbg_atomic(display->drm, "iet_lut[%d]=3D%x\n",
> +				       i, data[i]);
> +		}
> +	}
> +}

The above code can be configured as shown below

int i;
int register_base, data_mask;

if (DISPLAY_VER(display) >=3D 20) {
    register_base =3D DPST_IE_BIN(pipe);
    data_mask =3D DPST_IE_BIN_DATA_MASK;
} else {
    register_base =3D DPST_BIN(pipe);
    data_mask =3D DPST_BIN_DATA_MASK;
}

for (i =3D 0; i < HISTOGRAM_IET_LENGTH; i++) {
    intel_de_rmw(display, register_base, data_mask, data[i]);
    drm_dbg_atomic(display->drm, "iet_lut[%d]=3D%x\n", i, data[i]);
}

Regards,
Suraj Kandpal

> +
> +static void set_histogram_index_0(struct intel_display *display, enum
> +pipe pipe) {
> +	if (DISPLAY_VER(display) >=3D 20)
> +		intel_de_rmw(display, DPST_HIST_INDEX(pipe),
> +			     DPST_HIST_BIN_INDEX_MASK,
> +			     DPST_HIST_BIN_INDEX(0));
> +	else
> +		intel_de_rmw(display, DPST_CTL(pipe),
> +			     DPST_CTL_BIN_REG_FUNC_SEL |
> DPST_CTL_BIN_REG_MASK, 0); }
> +
>  static bool intel_histogram_get_data(struct intel_crtc *intel_crtc)  {
>  	struct intel_display *display =3D to_intel_display(intel_crtc); @@ -40,=
9
> +85,13 @@ static bool intel_histogram_get_data(struct intel_crtc *intel_c=
rtc)
>  	retry_count =3D 0;
>=20
>  	while (index < HISTOGRAM_BIN_COUNT) {
> -		dpstbin =3D intel_de_read(display, DPST_BIN(intel_crtc->pipe));
> +		dpstbin =3D intel_de_read(display, (DISPLAY_VER(display) >=3D 20
> ?
> +					DPST_HIST_BIN(intel_crtc->pipe) :
> +					DPST_BIN(intel_crtc->pipe)));
>  		if (!(dpstbin & DPST_BIN_BUSY)) {
> -			histogram->bin_data[index] =3D dpstbin &
> DPST_BIN_DATA_MASK;
> +			histogram->bin_data[index] =3D dpstbin &
> (DISPLAY_VER(display) >=3D 20 ?
> +
> DPST_HIST_BIN_DATA_MASK :
> +
> DPST_BIN_DATA_MASK);
>  			index++;
>  		} else {
>  			/*
> @@ -58,9 +107,7 @@ static bool intel_histogram_get_data(struct intel_crtc
> *intel_crtc)
>  			/* Add a delay before retrying */
>  			fsleep(HISTOGRAM_BIN_READ_DELAY);
>  			index =3D 0;
> -			intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
> -				     DPST_CTL_BIN_REG_FUNC_SEL |
> -				     DPST_CTL_BIN_REG_MASK, 0);
> +			set_histogram_index_0(display, intel_crtc->pipe);
>  		}
>  	}
>  	return true;
> @@ -84,8 +131,8 @@ static void intel_histogram_handle_int_work(struct
> work_struct *work)
>  	 * Set DPST_CTL Bin Reg function select to TC
>  	 * Set DPST_CTL Bin Register Index to 0
>  	 */
> -	intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
> -		     DPST_CTL_BIN_REG_FUNC_SEL |
> DPST_CTL_BIN_REG_MASK, 0);
> +	set_histogram_index_0(display, intel_crtc->pipe);
> +
>  	if (intel_histogram_get_data(intel_crtc)) {
>  		drm_property_replace_global_blob(display->drm,
>  				&intel_crtc->config->histogram.histogram,
> @@ -158,13 +205,20 @@ static int intel_histogram_enable(struct intel_crtc
> *intel_crtc)
>  	if (histogram->enable)
>  		return 0;
>=20
> -	 /* enable histogram, clear DPST_BIN reg and select TC function */
> -	intel_de_rmw(display, DPST_CTL(pipe),
> -		     DPST_CTL_BIN_REG_FUNC_SEL | DPST_CTL_IE_HIST_EN |
> -		     DPST_CTL_HIST_MODE |
> DPST_CTL_IE_TABLE_VALUE_FORMAT,
> -		     DPST_CTL_BIN_REG_FUNC_TC | DPST_CTL_IE_HIST_EN |
> -		     DPST_CTL_HIST_MODE_HSV |
> -		     DPST_CTL_IE_TABLE_VALUE_FORMAT_1INT_9FRAC);
> +	if (DISPLAY_VER(display) >=3D 20)
> +		intel_de_rmw(display, DPST_CTL(pipe),
> +			     DPST_CTL_IE_HIST_EN |
> +			     DPST_CTL_HIST_MODE,
> +			     DPST_CTL_IE_HIST_EN |
> +			     DPST_CTL_HIST_MODE_HSV);
> +	else
> +		 /* enable histogram, clear DPST_BIN reg and select TC
> function */
> +		intel_de_rmw(display, DPST_CTL(pipe),
> +			     DPST_CTL_BIN_REG_FUNC_SEL |
> DPST_CTL_IE_HIST_EN |
> +			     DPST_CTL_HIST_MODE |
> DPST_CTL_IE_TABLE_VALUE_FORMAT,
> +			     DPST_CTL_BIN_REG_FUNC_TC |
> DPST_CTL_IE_HIST_EN |
> +			     DPST_CTL_HIST_MODE_HSV |
> +
> DPST_CTL_IE_TABLE_VALUE_FORMAT_1INT_9FRAC);
>=20
>  	/* Re-Visit: check if wait for one vblank is required */
>  	drm_crtc_wait_one_vblank(&intel_crtc->base);
> @@ -236,7 +290,6 @@ int intel_histogram_set_iet_lut(struct intel_crtc
> *intel_crtc, u32 *data)
>  	struct intel_histogram *histogram =3D intel_crtc->histogram;
>  	struct intel_display *display =3D to_intel_display(intel_crtc);
>  	int pipe =3D intel_crtc->pipe;
> -	int i =3D 0;
>=20
>  	if (!histogram)
>  		return -EINVAL;
> @@ -261,24 +314,20 @@ int intel_histogram_set_iet_lut(struct intel_crtc
> *intel_crtc, u32 *data)
>  	 * Set DPST_CTL Bin Reg function select to IE
>  	 * Set DPST_CTL Bin Register Index to 0
>  	 */
> -	intel_de_rmw(display, DPST_CTL(pipe),
> -		     DPST_CTL_BIN_REG_FUNC_SEL |
> DPST_CTL_BIN_REG_MASK,
> -		     DPST_CTL_BIN_REG_FUNC_IE |
> DPST_CTL_BIN_REG_CLEAR);
> -
> -	for (i =3D 0; i < HISTOGRAM_IET_LENGTH; i++) {
> -		intel_de_rmw(display, DPST_BIN(pipe),
> -			     DPST_BIN_DATA_MASK, data[i]);
> -		drm_dbg_atomic(display->drm, "iet_lut[%d]=3D%x\n", i,
> data[i]);
> +	set_bin_index_0(display, pipe);
> +	write_iet(display, pipe, data);
> +	if (DISPLAY_VER(display) < 20) {
> +		intel_de_rmw(display, DPST_CTL(pipe),
> +			     DPST_CTL_ENHANCEMENT_MODE_MASK |
> +			     DPST_CTL_IE_MODI_TABLE_EN,
> +			     DPST_CTL_EN_MULTIPLICATIVE |
> +			     DPST_CTL_IE_MODI_TABLE_EN);
> +		/* Once IE is applied, change DPST CTL to TC */
> +		intel_de_rmw(display, DPST_CTL(pipe),
> +			     DPST_CTL_BIN_REG_FUNC_SEL,
> +			     DPST_CTL_BIN_REG_FUNC_TC);
>  	}
>=20
> -	intel_de_rmw(display, DPST_CTL(pipe),
> -		     DPST_CTL_ENHANCEMENT_MODE_MASK |
> DPST_CTL_IE_MODI_TABLE_EN,
> -		     DPST_CTL_EN_MULTIPLICATIVE |
> DPST_CTL_IE_MODI_TABLE_EN);
> -
> -	/* Once IE is applied, change DPST CTL to TC */
> -	intel_de_rmw(display, DPST_CTL(pipe),
> -		     DPST_CTL_BIN_REG_FUNC_SEL,
> DPST_CTL_BIN_REG_FUNC_TC);
> -
>  	return 0;
>  }
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram_regs.h
> b/drivers/gpu/drm/i915/display/intel_histogram_regs.h
> index e50b1448bd40..2a52ac9282c1 100644
> --- a/drivers/gpu/drm/i915/display/intel_histogram_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_histogram_regs.h
> @@ -44,6 +44,31 @@
>  #define _DPST_BIN_B					0x491C4
>  #define DPST_BIN(pipe)
> 	_MMIO_PIPE(pipe, _DPST_BIN_A, _DPST_BIN_B)
>  #define  DPST_BIN_DATA_MASK
> 	REG_GENMASK(23, 0)
> +#define  DPST_BIN_DATA
> 	REG_FIELD_PREP(DPST_BIN_DATA_MASK, val)
>  #define  DPST_BIN_BUSY					REG_BIT(31)
>=20
> +#define _DPST_HIST_INDEX_A				0x490D8
> +#define _DPST_HIST_INDEX_B				0x491D8
> +#define DPST_HIST_INDEX(pipe)
> 	_MMIO_PIPE(pipe, _DPST_HIST_INDEX_A, _DPST_HIST_INDEX_B)
> +#define  DPST_HIST_BIN_INDEX_MASK
> 	REG_GENMASK(4, 0)
> +#define  DPST_HIST_BIN_INDEX(val)
> 	REG_FIELD_PREP(DPST_HIST_BIN_INDEX_MASK, val)
> +
> +#define _DPST_HIST_BIN_A				0x490C4
> +#define _DPST_HIST_BIN_B				0x491C4
> +#define DPST_HIST_BIN(pipe)				_MMIO_PIPE(pipe,
> _DPST_HIST_BIN_A, _DPST_HIST_BIN_B)
> +#define  DPST_HIST_BIN_BUSY				REG_BIT(31)
> +#define  DPST_HIST_BIN_DATA_MASK
> 	REG_GENMASK(30, 0)
> +
> +#define _DPST_IE_BIN_A					0x490CC
> +#define _DPST_IE_BIN_B					0x491CC
> +#define DPST_IE_BIN(pipe)				_MMIO_PIPE(pipe,
> _DPST_IE_BIN_A, _DPST_IE_BIN_B)
> +#define	 DPST_IE_BIN_DATA_MASK
> 	REG_GENMASK(9, 0)
> +#define  DPST_IE_BIN_DATA(val)
> 	REG_FIELD_PREP(DPST_IE_BIN_DATA_MASK, val)
> +
> +#define _DPST_IE_INDEX_A				0x490DC
> +#define _DPST_IE_INDEX_B				0x491DC
> +#define DPST_IE_INDEX(pipe)				_MMIO_PIPE(pipe,
> _DPST_IE_INDEX_A, _DPST_IE_INDEX_B)
> +#define  DPST_IE_BIN_INDEX_MASK
> 	REG_GENMASK(6, 0)
> +#define  DPST_IE_BIN_INDEX(val)
> 	REG_FIELD_PREP(DPST_IE_BIN_INDEX_MASK, val)
> +
>  #endif /* __INTEL_HISTOGRAM_REGS_H__ */
> --
> 2.25.1

