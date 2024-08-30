Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A72396595A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 10:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875A610E566;
	Fri, 30 Aug 2024 08:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kqGDdmb8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9124710E566;
 Fri, 30 Aug 2024 08:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725005044; x=1756541044;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7TrHRWZLIwyftTVcQAG2CgFNFySrLoEToN8uQq65nX4=;
 b=kqGDdmb8bJoPu9GisNS3fMl3LX4UYxUzeSPsFanml9zK/tq1Xwl0GWIA
 sNZf189Kcv/tY/VvOHQpG2sg1te5YkiXehInVaZOLMuQJ07UH/XD6BH3P
 CpUVP7ICJ6RHc1SF8gdvcS2S1+KYOTiSBCuAFogfJzlU2FFeUPm0UgB80
 ch1olwaaslCLX0qeueJaC+r1bq8h9Bx2Sl4Wvf5eO/SQLOLqz1RhTSpjL
 PLhvDvMHbdJNXQC38PYGGyUTAtukipA5ThtoBpadbD8RuuQNosrYoRk5n
 k73vhweYS7nvq9hhXqU6Egc3rYArDl3YgLopK33/XwjDOPcR60UhUnvCt A==;
X-CSE-ConnectionGUID: nIhjwWXcRv+dgrdNjA8N5A==
X-CSE-MsgGUID: RXmD5j57RdOn4bluTDK+BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23801539"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="23801539"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 01:04:04 -0700
X-CSE-ConnectionGUID: jA22kNgDRXOELz1PEg5blQ==
X-CSE-MsgGUID: 3yy1cKUoQumjUoVfX9KgiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="68224489"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Aug 2024 01:04:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 01:04:03 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 01:04:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 30 Aug 2024 01:04:02 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 30 Aug 2024 01:04:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCPB0B4fK8KUCRYx68I2ErW8wqBGi4WSO1S9XjzEr26Oxd7wzq5G6lRd8Z4FeuVMTyLPslviSZg8TKdhM+i9RtcN+LuIq8niv/7D8nh8L9U/qBvyAL9zaiE5EaJNv2lrZ2OoYWfGhdPLrhOLKI4gE6fk6TDe681vS5j9a+aJrWxV4RC8bCSSbIonEYSlEPI9hre29FZ1UgCkYukKxSOcxn3MlrvWJzQlUY0NeBbweZ0tDNUDBEZNylGz7qVxmdnmtNgptgOTasARXsQa+K1prorC5v9YCnW7YprDkBQgDfe1eXkOO0u/9PNUvOmOwYkky4yd1oqpFYviewrqkf/Sjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHpoZzyJD27wbv3hi4rGe9AJ20p5vE+0pT/0nimi3Mc=;
 b=jBk4xWPFE8f+taNpWKZXo1yqcR4HfpHSD2hEHYLqcYq4P/RXJt05gZ4H0yQ5F2P78eqmN8jLRkArV7p0r/tCUCugqbXOmRx16uk+Bp75CZXvm68uuCLHh/XAtT12fjXZSEzdj9GfUsvCx+Ztan6yZfOJmn+CV4ja+LRWtNuM+sbJ1+J47Oxp9wqd8l37nvssUK0JVvkeVE3U8UnOJNQkfrlcsZXJKdaeRGHNAl2Hap8zbuWks896lXPwyG0tHzfOAiYkHG/wlTdqyoShDBGm8ldPAUSb078iU2zSKTIPvrv4e3Jrxmhxr6I2ag5PFPAye/0pruKOTGWT97uGj0+zpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 08:04:00 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 08:04:00 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Garg, Nemesa" <nemesa.garg@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Garg, Nemesa" <nemesa.garg@intel.com>
Subject: RE: [4/5] drm/i915/display: Add registers and compute the strength
Thread-Topic: [4/5] drm/i915/display: Add registers and compute the strength
Thread-Index: AQHa0Q5NIZJrUdazUkCRT8oeXj+CNLI/jJhA
Date: Fri, 30 Aug 2024 08:04:00 +0000
Message-ID: <IA0PR11MB7307DCA59F0772375397FCD0BA972@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20240708080917.257857-1-nemesa.garg@intel.com>
 <20240708080917.257857-5-nemesa.garg@intel.com>
In-Reply-To: <20240708080917.257857-5-nemesa.garg@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DM4PR11MB6360:EE_
x-ms-office365-filtering-correlation-id: 08bb1ecf-cf14-4b6f-23ff-08dcc8ca4e58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?UIQX6f/IHOcpVoUXLZ6yTra7SkopEHueMw4fVypPI6OpL7yzXVAkHFALPbz5?=
 =?us-ascii?Q?2xRn96fkGpKh8tjO3ofbA6VCBzMwFroSFiwIYpmKo/BzZ3VPGlCQ5YNnq3dd?=
 =?us-ascii?Q?SbVffzVmtoczVUPlaiIEAh/wJaDzyS0oLpi+ViWMBwduEQ+vDXI8bcAbm+tv?=
 =?us-ascii?Q?6P7IkNPH9OzroI9YS+EJcU0o2i70pBvMPVdvQjNboAoD2ZmQo7d2OFC1veez?=
 =?us-ascii?Q?xvCxF0Moszr3FK+c1+8IV+CAt/TwfjKxq3o/vTakEm/nhAoj8irwUeVrjLWy?=
 =?us-ascii?Q?0ichlDWnLqdgKRNQ3KD7m13AcO0YzXU9/AFwiOgvrMaV7QVkgRZ4iE2jic1H?=
 =?us-ascii?Q?aEn1txsNROdHae8vRDxkfp+nFBUy5QJkkb4LtCASPONBYdLtxGvlNcOV6yKk?=
 =?us-ascii?Q?2QVe4ci6xQS5rSQ3IYfRalSB6w23IUYLrYKVZE4TBWhPQXSpzoLQvAas3Vlw?=
 =?us-ascii?Q?Na2eSaWLuloHwINhuHXDI7COns5bEPfjw9TWnls9kWD9buncpiAssfxKdq5a?=
 =?us-ascii?Q?glVEOv1Q5p9+js+tsk39oSj/yma/SbW0TF2xKCh9y2oFP9KxXNaKAJ8J4WDh?=
 =?us-ascii?Q?hUC6K6KZbfeWTvdw6oiofSPTrJdsynshbuyUYHCcEulbsN/mblxBDZqJ78qS?=
 =?us-ascii?Q?gzwSYygwiD00mm0tgoOQ1D3obSKr1SdjWIrkMNrJu6sgg82YZxQUnB5RvDqt?=
 =?us-ascii?Q?zm3DA8qbX+W6oKJ4QSweFn8zFoMlgg1WWX2YwxWGEI5aLkPCEHqypAZiuDBF?=
 =?us-ascii?Q?xnnbp+V/h5M4zcBCg+CRyw23UfxhZKMS3V/+crl6KJ03C7ssWnYp0/E6t+hk?=
 =?us-ascii?Q?iIYcMyLoYms8IAy2KyJTDMWcCwl2PnbFinOc3f+SDTFiSqCHSMpKiuJB0gK2?=
 =?us-ascii?Q?Bs2Gq0dVe4aoDOiNAGWrWzcJOlGxCtuPL3UwBVuty6k22HG626zqE6cTXpqa?=
 =?us-ascii?Q?9ozpwO3HgmOw/At6VzeHUKL6Ej14HxBSQxPeiH2uG8NW+2CoMj8DWfny6g4E?=
 =?us-ascii?Q?5de3ETN66OKcayNh3o3QCWv064GkJWHx3Etwm6a+20BUmCjsglAapT7zPqaF?=
 =?us-ascii?Q?tVtta4wAUv6A91MmiEgFR4O1dK21FWOgJojy1kx0SOYeLx3Pv8q1yGII9D/G?=
 =?us-ascii?Q?nvCdwwba9Hqlln04Ky26iy//1fD4kCb4GsQRUAQSAJRacvEHf0aYfR5DkOpq?=
 =?us-ascii?Q?oiuY6B7622G21gfcOoZ3VKwB8uGvRE0CCHs63wu6AERfXde5WLEVzh2JFcxM?=
 =?us-ascii?Q?rArcJqN7AnFG6VLHuABONysNoJwMQKw9ZWFKcFvWGLyjhbe5reAucNhbooBs?=
 =?us-ascii?Q?6lAyEQPSGpad4I2pI6A8lA1/mpxtLX7iqza+wVs01GcRsf0zbrs0Mq/o7vkx?=
 =?us-ascii?Q?1bSyXewB4GJaCQTCC0i2UFR2eldypKUXoPi8VxNZA/SSdD0IWA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/Fz3E4wZOXbwHNAtEv1xO7Lbjwiexl3iKwG8LwrxzQPaowZ4bqkpMnSk6g2n?=
 =?us-ascii?Q?nT0n9FSOBpdYiMzTieiSmIByyRhAmVe9/Gvm/miz9UnkDGv1wrxBGOcmQgNG?=
 =?us-ascii?Q?iHi+9FQBCvV4Rc99YgD1t6SbK4+DE/DZxEI2ARmWNep1uCkyQ9EPzeecE1S4?=
 =?us-ascii?Q?64prYqNQhOSMyijpum2/zxytCZPMa0JXApcaF77YSdeOyDc/gRvT7Oz5K3zK?=
 =?us-ascii?Q?x7v8wJKdOqGI8Tp6LsHRk/fFJze4QzGBSYegnhEXJgyeaDMkrGYt7/aMGz7q?=
 =?us-ascii?Q?+medPvPoxDgfDdZ8KxOv0q77PN8kSgG+wDx+N6lHPU1JM+/B0NH9nVx55Hqa?=
 =?us-ascii?Q?6dJgwEyp3DllYnPpnPtXgASf3bkUzkV030v16XZxLJyszmDdfH7Li5DE94tn?=
 =?us-ascii?Q?Tsg9h2+59lO1usPg//doFQV55n+sS4eymiiE8fW1jXzTUORFFUsTRJ1H+zrf?=
 =?us-ascii?Q?lcz6vpZBn40LWJe8yu2iPw1mS/yF8cf5ukZwwLGWJhlMhGxMClnDvpkxUakX?=
 =?us-ascii?Q?XMJXY5gT9cNO8AlsV3/+mTwm0UJUpW8ND5GsiqxT/98AqgiTSZNDWE3qFFBq?=
 =?us-ascii?Q?Zrh0jqKpRupBAJeH59GOOLF+wmo2UOH1ViJ3aTW88gAy7tMgl7a4e5/rAwu4?=
 =?us-ascii?Q?yowFPS0jUFDF/MLGJc1YXWnAO7TLAvw/k2kpnume8bg5UKp4E9vbWnBDY/Uc?=
 =?us-ascii?Q?D6boa6swmwO6+k0FuowR3CQ/fwO7/a39SCMjsQcOaxMrbWTlprXP6S+UY5J7?=
 =?us-ascii?Q?8N1/L89cqvDWMpy6HWzuJ601Rn9UidI2QePZb+nBtpUM8PUkYKXLAzwVbdMw?=
 =?us-ascii?Q?NFWOydGBlI3FXSSOJ22LY/6cqwwOLrBLKmCv2PiKMW6NP6qeue7R8dtJDfm2?=
 =?us-ascii?Q?kTn9j2E03mauDRRaNWU7E39sxUiKi9p8rTyJ2vMHRrVeWThTCJ/7kY3S6bN6?=
 =?us-ascii?Q?rAQoSoaKaSCcEZcTl5fX3z94Tr2l2behigxpOsIr78bE0RWeQZIAfPnhVgM8?=
 =?us-ascii?Q?1w9X/uEoWjZiBCccLCGq4a+LHO7ilk07RBaUHSRqplYHtKc1lEGBGMqlQZdJ?=
 =?us-ascii?Q?+YACjqykEVh3IOQ1YJaegf/8Pet6M0/N3TyZYZxJP09zTZbnODyGFZTT3kHo?=
 =?us-ascii?Q?s79Q8mPX9aG5Nt6yZUHeuUtCNUZ4yRsvPCiu8KA9/QNHYfUoZvSN4KW20+wJ?=
 =?us-ascii?Q?ar+4mzHYtCrcr0t7jTBG0Sq0yrGGZs/6Mx0HfP/DclkzI5IlmrMAfqu7Rp7D?=
 =?us-ascii?Q?8tPG4SWo7Hg4Iqka6m02DYClNGlYeyscquWyJSrqE/1TaOrJQVdB1TmGnEwl?=
 =?us-ascii?Q?8Ypk76Ax8tJqJKTKA/gPllTF0TMSJMmLuuEp2Ug6OFCjpLyIXD/JxvTrFY8c?=
 =?us-ascii?Q?wIz6cdG/HFYRa7M5GWIaTT6yXYUOT5dfoC4SFqc6TSExHDNyx5+zGEgs2jcG?=
 =?us-ascii?Q?2ifyvsn++ZxsxsiwYiJHnsp5c7o9ahBbg24st8x12NfchHbmQKmBfsZPRN8R?=
 =?us-ascii?Q?TKE5F80m1bUiQ49XaVKStWe2UI5UGrjjg1BYfVpYtK2V0OLI/hYXCa5rL4NB?=
 =?us-ascii?Q?IejZVaydKlIXG3bCG6RVDipvdTzTtwjg4fA5bq3l?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08bb1ecf-cf14-4b6f-23ff-08dcc8ca4e58
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2024 08:04:00.2511 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QolwcZqndn+hy/+kypPU0XdKYEvnq2DSfHAuftiqwCMRD1pOk0487bIVhQ2K65cCT0rIEduylGm/1KkF+juLLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6360
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
> Subject: [4/5] drm/i915/display: Add registers and compute the strength
>=20
> Add new registers and related bits. Compute the strength value and tap va=
lue
> based on display mode.
>=20
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c  |   5 +-
>  .../drm/i915/display/intel_display_types.h    |   1 +
>  .../drm/i915/display/intel_sharpen_filter.c   | 105 ++++++++++++++++++
>  .../drm/i915/display/intel_sharpen_filter.h   |   5 +
>  drivers/gpu/drm/i915/i915_reg.h               |  17 +++
>  5 files changed, 132 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index 385a254528f9..e0a82ab46d29 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -5910,7 +5910,10 @@ static int intel_atomic_check_planes(struct
> intel_atomic_state *state)
>  		if (ret)
>  			return ret;
>=20
> -		intel_sharpness_scaler_compute_config(new_crtc_state);
> +		if (sharp_compute(new_crtc_state)) {
> +
> 	intel_sharpness_scaler_compute_config(new_crtc_state);
> +			intel_filter_compute_config(new_crtc_state);
> +		}
>=20
>  		/*
>  		 * On some platforms the number of active planes affects diff --
> git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 130740aaaa21..782192f2b9ae 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -835,6 +835,7 @@ struct intel_sharpness_filter {
>  	bool strength_changed;
>  	u8 win_size;
>  	bool need_scaler;
> +	u8 strength;
>  };
>=20
>  struct intel_crtc_scaler_state {
> diff --git a/drivers/gpu/drm/i915/display/intel_sharpen_filter.c
> b/drivers/gpu/drm/i915/display/intel_sharpen_filter.c
> index 627a0dbd3dfd..6600a66d3960 100644
> --- a/drivers/gpu/drm/i915/display/intel_sharpen_filter.c
> +++ b/drivers/gpu/drm/i915/display/intel_sharpen_filter.c
> @@ -18,11 +18,87 @@
>  #define FILTER_COEFF_1_0 1000
>  #define FILTER_COEFF_0_0 0
>=20
> +/*
> + * Default LUT values to be loaded one time.
> + */
Single line comment style  /*  */

> +static const u16 lut_data[] =3D {
> +	4095, 2047, 1364, 1022, 816, 678, 579,
> +	504, 444, 397, 357, 323, 293, 268, 244, 224,
> +	204, 187, 170, 154, 139, 125, 111, 98, 85,
> +	73, 60, 48, 36, 24, 12, 0
> +};
> +
> +void intel_filter_lut_load(struct intel_crtc *crtc,
> +			   const struct intel_crtc_state *crtc_state) {
> +	struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);

dev_priv =3D> i915

> +	int i;
> +
> +	intel_de_write(dev_priv, SHRPLUT_INDEX(crtc->pipe),
> INDEX_AUTO_INCR |
> +INDEX_VALUE(0));
> +
> +	for (i =3D 0; i < ARRAY_SIZE(lut_data); i++)
> +		intel_de_write(dev_priv, SHRPLUT_DATA(crtc->pipe),
> lut_data[i]); }
Sharpness LUT is from bit[0:11] and lut_data is u16.=20

> +
> +static void intel_filter_size_compute(struct intel_crtc_state
Can the same function naming convention be used
intel_filter_size_compute =3D> intel_sharpness_filter_size_compute

> +*crtc_state) {
> +	const struct drm_display_mode *mode =3D &crtc_state-
> >hw.adjusted_mode;
> +
> +	if (mode->hdisplay <=3D 1920 && mode->vdisplay <=3D 1080)
> +		crtc_state->hw.casf_params.win_size =3D 0;
> +	else if (mode->hdisplay <=3D 3840 && mode->vdisplay <=3D 2160)
> +		crtc_state->hw.casf_params.win_size =3D 1;
> +	else
> +		crtc_state->hw.casf_params.win_size =3D 2; }
> +
> +bool intel_sharpness_strength_changed(struct intel_atomic_state *state)
> +{
> +	int i;
> +	struct intel_crtc_state *old_crtc_state, *new_crtc_state;
> +	struct intel_crtc *crtc;
> +
> +	for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,
> +					    new_crtc_state, i) {
> +		if (new_crtc_state->uapi.sharpness_strength !=3D
> +				old_crtc_state->uapi.sharpness_strength)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  void intel_sharpness_filter_enable(struct intel_crtc_state *crtc_state) =
 {
>  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
>  	struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
>  	int id =3D crtc_state->scaler_state.scaler_id;
> +	u32 sharpness_ctl;
> +	u8 val;
> +
> +	if (crtc_state->uapi.sharpness_strength =3D=3D 0) {
> +		intel_sharpness_disable(crtc_state);
> +
> +		return;
> +	}
> +
> +	/*
> +	 * HW takes a value in form (1.0 + strength) in 4.4 fixed format.
> +	 * Strength is from 0.0-14.9375 ie from 0-239.
> +	 * User can give value from 0-255 but is clamped to 239.
> +	 * Ex. User gives 85 which is 5.3125 and adding 1.0 gives 6.3125.
> +	 * 6.3125 in 4.4 format is 01100101 which is equal to 101.
> +	 * Also 85 + 16 =3D 101.
> +	 */
> +	val =3D min(crtc_state->uapi.sharpness_strength, 0xEF) + 0x10;
> +
> +	drm_dbg(&dev_priv->drm, "Filter strength value: %d\n", val);
> +
> +	sharpness_ctl =3D	FILTER_EN | FILTER_STRENGTH(val) |
> +		FILTER_SIZE(crtc_state->hw.casf_params.win_size);
> +
> +	intel_de_write(dev_priv, SHARPNESS_CTL(crtc->pipe),
> +		       sharpness_ctl);
>=20
>  	intel_de_write_fw(dev_priv, GLK_PS_COEF_INDEX_SET(crtc->pipe, id,
> 0),
>  			  PS_COEF_INDEX_AUTO_INC);
> @@ -42,9 +118,21 @@ void intel_sharpness_filter_enable(struct
> intel_crtc_state *crtc_state)
>=20
>  int intel_filter_compute_config(struct intel_crtc_state *crtc_state)  {
> +	struct intel_crtc *intel_crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> +	struct drm_i915_private *dev_priv =3D to_i915(intel_crtc->base.dev);
> +
> +	if (crtc_state->uapi.sharpness_strength =3D=3D 0) {
> +		crtc_state->hw.casf_params.need_scaler =3D false;
> +		return 0;
> +	}
> +
>  	if (!crtc_state->pch_pfit.enabled)
>  		crtc_state->hw.casf_params.need_scaler =3D true;
>=20
> +	intel_filter_size_compute(crtc_state);
> +	drm_dbg(&dev_priv->drm, "Tap Size: %d\n",
> +		crtc_state->hw.casf_params.win_size);
> +
>  	return 0;
>  }
>=20
> @@ -129,3 +217,20 @@ void intel_sharpness_scaler_compute_config(struct
> intel_crtc_state *crtc_state)
>  		}
>  	}
>  }
> +
> +void intel_sharpness_disable(struct intel_crtc_state *crtc_state) {
> +	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> +	struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
> +
> +	intel_de_write(dev_priv, SHARPNESS_CTL(crtc->pipe), 0);
> +	drm_dbg(&dev_priv->drm, "Filter strength value: %d\n", 0); }
> +
> +bool sharp_compute(struct intel_crtc_state *crtc_state) {
> +	if (!(FILTER_EN & 1) && crtc_state->uapi.sharpness_strength !=3D 0)
> +		return true;
> +
> +	return false;
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_sharpen_filter.h
> b/drivers/gpu/drm/i915/display/intel_sharpen_filter.h
> index d20e65971a55..4fffdd99d0fb 100644
> --- a/drivers/gpu/drm/i915/display/intel_sharpen_filter.h
> +++ b/drivers/gpu/drm/i915/display/intel_sharpen_filter.h
> @@ -24,5 +24,10 @@ struct scaler_filter_coeff {  void
> intel_sharpness_filter_enable(struct intel_crtc_state *crtc_state);  void
> intel_sharpness_scaler_compute_config(struct intel_crtc_state *crtc_state=
);  int
> intel_filter_compute_config(struct intel_crtc_state *crtc_state);
> +void intel_filter_lut_load(struct intel_crtc *crtc,
> +			   const struct intel_crtc_state *crtc_state); bool
> +intel_sharpness_strength_changed(struct intel_atomic_state *state);
> +void intel_sharpness_disable(struct intel_crtc_state *crtc_state); bool
> +sharp_compute(struct intel_crtc_state *crtc_state);
>=20
>  #endif /* __INTEL_SHARPEN_FILTER_H__ */ diff --git
> a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h index
> 9492fda15627..2fa42e10bb63 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -2396,6 +2396,23 @@
>  			_ID(id, _PS_COEF_SET0_DATA_1A,
> _PS_COEF_SET0_DATA_2A) + (set) * 8, \
>  			_ID(id, _PS_COEF_SET0_DATA_1B,
> _PS_COEF_SET0_DATA_2B) + (set) * 8)
>=20
> +#define _SHARPNESS_CTL_A               0x682B0
> +#define SHARPNESS_CTL(trans)           _MMIO_PIPE2(dev_priv, trans,
> _SHARPNESS_CTL_A)
> +#define  FILTER_EN                      REG_BIT(31)
> +#define  FILTER_STRENGTH_MASK           REG_GENMASK(15, 8)
> +#define  FILTER_STRENGTH(x)
> REG_FIELD_PREP(FILTER_STRENGTH_MASK, (x))
> +#define  FILTER_SIZE_MASK               REG_GENMASK(1, 0)
> +#define  FILTER_SIZE(x)                 REG_FIELD_PREP(FILTER_SIZE_MASK,=
 (x))
> +
> +#define _SHRPLUT_DATA_A			0x682B8
> +#define SHRPLUT_DATA(trans)		_MMIO_PIPE2(dev_priv, trans,
> _SHRPLUT_DATA_A)
> +
> +#define _SHRPLUT_INDEX_A		0x682B4
> +#define SHRPLUT_INDEX(trans)		_MMIO_PIPE2(dev_priv, trans,
> _SHRPLUT_INDEX_A)
> +#define  INDEX_AUTO_INCR		REG_BIT(10)
> +#define  INDEX_VALUE_MASK		REG_GENMASK(4, 0)
> +#define  INDEX_VALUE(x)
> 	REG_FIELD_PREP(INDEX_VALUE_MASK, (x))
> +
>  /* Display Internal Timeout Register */
>  #define RM_TIMEOUT		_MMIO(0x42060)
>  #define  MMIO_TIMEOUT_US(us)	((us) << 0)
> --
> 2.25.1

Thanks and Regards,
Arun R Murthy
--------------------
