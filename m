Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 951EE84BEAD
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 21:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8028112DF4;
	Tue,  6 Feb 2024 20:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XuVwjzyu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24956112DF3;
 Tue,  6 Feb 2024 20:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707251247; x=1738787247;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N7lGEyk+P7c0zNeKUuY6mavEuDcTJ88yiq9ntXQJS3A=;
 b=XuVwjzyuM7/Y6+Jwqtv4fJogOPWXqyPgBA1soDPMEhPM7g0MoHMem0pR
 /ZfHEd1+DcOIJfl7vMnuVYlRgoFnFMoxoue1Enhqtis9kM30QXnZzqzp/
 HvU0aMToK2xe5fMpbtAirfXNDr5PV414TzpOo4R/JceFvaCS5VUZlVfe7
 eBODuuNpPyBaWt1goSJ3Cgocy1EcOIFxl0BTFb0AmrQHSD9AxV1uRYx0P
 S6sCd59IJP3zLR0WO0lCRyWMGCM0cJ+OLUaUqJpJPxeR55z1HWrSnae+y
 h/0mm9xP8U/fuN3dSL5OGBlcxuzdNJuA1riQW90UPhTVAhUr6U1dChyG3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="997162"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="997162"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 12:27:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="5901701"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 12:27:24 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 12:27:23 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 12:27:23 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 12:27:23 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 12:27:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3y0cuLcTZfanxWtlyv42r/pMe4u6MxqD/7v4Q+BvIz12RY69p1w6ekksMapNMGuoalAuKNbEG5KDUE9R3TJg44hK8wBRxzZ4eLct0qz21MWReLi+3NdPgTnHpRs2ZH+EqvTtb6LJnhltgzIlyscoRnWd2oRgi4lau+E7uz22aS2h6I4c7VkFZgHLsxO1uES+iZbcVNf4bt46Fc3N/Psz8SxuWxRb0ywbQ2n0e5pLPgdI4y30qb+4JxWgIfZRxcAnylr0Le0epnDGW4s/Hb/OIZ2HeIuScXPR6etqhNi5nls8wRMjOOiyrcoUbnlVPv8c4Ov6IDYjqhVMNKVVK24oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlmyDIEJZQVEjB0q0kq8Z8lsqCkvWVBpuaCkAtjcwyc=;
 b=a7zGBBw73uiOQzrEjT5AHAziJHyvwyJqAHheGLRenjKNIk/DP5FezPHwYspUruaQCZSs9/GzC9jgwAaLu4bMJQ/7y5k09gIpAgJfKPwbdCrW2rgzX/scZY9zVT7aXWyU7zC/JiM3QYxvlBygNv+J4V2Quiq1qHHWcxxtjfEtY0l6sHY+9GQpLS0waGXBJwKqhVACipHJcPuxIFju9PTIaEIH5soiTQD+OWseHerMhRR10F4sPclMMkVr7OYXO7paGF/qyRZQNnbzid6hkgnSjffhjsLSB5yiHPtqa9fM9CqZi9Mw/vN3TyM4UL0fhGc1DEdt4F2/Obx4adIKHMS2Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 CY5PR11MB6414.namprd11.prod.outlook.com (2603:10b6:930:36::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.36; Tue, 6 Feb 2024 20:27:18 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d%7]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 20:27:18 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 04/19] drm/i915/dp: Use drm_dp_max_dprx_data_rate()
Thread-Topic: [PATCH 04/19] drm/i915/dp: Use drm_dp_max_dprx_data_rate()
Thread-Index: AQHaTeb/a3teyHHVQk2NAEzu1WgplrD92drg
Date: Tue, 6 Feb 2024 20:27:17 +0000
Message-ID: <DM4PR11MB63602545FF6005BE44BCBB14F4462@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
 <20240123102850.390126-5-imre.deak@intel.com>
In-Reply-To: <20240123102850.390126-5-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|CY5PR11MB6414:EE_
x-ms-office365-filtering-correlation-id: fbdeb818-bd93-4fc5-fbec-08dc27520385
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gitt3ETAvqJe0PKa4+ZDjpGSBaeMxC19WEq/V5q7d+hh2fAYGEdFt1pN9HG/8GCI4/ekq1HTcI5AWjmTPxxk4HtS/aJMDxe7o+BWcgygAemjYaNsIJFe0h1FScdqkWs/CAio/1VugIjnsgkezl3FFHIp+VQcFByCebnlRw+B1Euk3brloqJj1lKYUr4jVIzJdVJHYNsQryHm2/+cV1QMahQoMl/6UGKOtDKiNiKqPqY3fRwMzbDM46ukvd+h4k/oWQEVGssR2fWwgwJ7C3qOFfjml1O2rBMLr6Drp0qBO2D3WBG6wshCTfMaSunRtaL1IeJL2AgdWoFZWRy6eSlnrICgOjk32V3jwrHie8xIB1c1yiJZUG1uMfNf57Sm+i52M3D0p4+ciWKfJ4VInq72E6mgKUD4j+rA07ZTBI5lr/y+GdZw2YzSJ4HGOBc4KVRzX9GQXIkP7UTazGNpxZiV/e1/g+Z8J75D204AIFiMRkHE4en0Hz6rkUY5tBoj7qsdXh3swT4QbH3fiqBLOuEtY5uadMvjUN+yq5kMjj/gUccSnKGy35CNe+ij0rtdIitaPFzUx/xC75LemHjBOKfyKLQXJ2Ih9QGU7artRW2FmnPrzuf8rqV9+hNxKi7S9URz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(376002)(396003)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(122000001)(38100700002)(82960400001)(55016003)(83380400001)(26005)(86362001)(6506007)(33656002)(7696005)(71200400001)(478600001)(9686003)(53546011)(76116006)(316002)(38070700009)(41300700001)(66556008)(66946007)(64756008)(66446008)(110136005)(66476007)(8676002)(2906002)(4326008)(52536014)(8936002)(450100002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ArZIl2RRaGm5BbUHUmhogwwCEzBQ7nrNV15hlqixNMJKQyeCDrCki1uTIyMt?=
 =?us-ascii?Q?bYIR//7kDMNjNgg1bj3lqggH6WbsMSa2BZXDfdN6HDUi1NYnMtQW6DlCPDNE?=
 =?us-ascii?Q?t/KQUlXIXY7k5czDO3jVHscMQRttwcTsw32bqRH1JtkMipVwurpRJyGHVHYh?=
 =?us-ascii?Q?MODRimnoICv9wOvvp+VCmNTrXee/sO5DKY9eRvaRkk5tOfIWEmtsaqLBQe39?=
 =?us-ascii?Q?Q3ctGYX/gC2JCpY5QCgDzrJauSeh7mfcNYDcDY6gvtQCHeuHXSSHRbMQ97Gg?=
 =?us-ascii?Q?tG8BZOcCbt90ZUjvkle27Xx1ZlEDFGptuO/PzNiGoj2W3pqNA9qLxHPu3ESM?=
 =?us-ascii?Q?vJhRAQBEzVTFQgES+JtXA5gMyEVth1U4MoG2mnpjscWAFz80/fmQd+cXAmrJ?=
 =?us-ascii?Q?e9gjxCmji3e7k8M+eQSgur0JeYbTtICGgNggLB/zTEr5Gqjp9htnms1nwtQG?=
 =?us-ascii?Q?vBFUTiUisqq9HtA0Tl56Sr1BYcYioHAzGSaVMmwTazA2jp3zvzrQ4qrKImZh?=
 =?us-ascii?Q?gKHM5lwRNqUjpegzvTmDhPcQQz/B5GAnU2UgrktmAoNqMnjREZ7qB8Wdw8tX?=
 =?us-ascii?Q?xwPm82a+rrFooxUTiWI4nglHlcLxb3VNHvOhCLEoNK3H32tILgLJgEq/n0AY?=
 =?us-ascii?Q?Q87L2tT1F4p+5WIpB/0CVBMNlBm1jnKi4OhYcMz5bw1Knn0YSQfM3wsXZCjF?=
 =?us-ascii?Q?xV6sG9cQbAjPgRKPgLU3GQw3h8nsTJ//ewiNgUW8lzTd3Pd7vJPWdgqFLyxY?=
 =?us-ascii?Q?yISYE8r4b9zRiuL2/EvKcpxvyCFFK+Awzn+kC1Ktmn4TTomPmLUxiVFu4gTh?=
 =?us-ascii?Q?PNLeUp+ErkiFHgU/iykwU2j0xutiXVp1mWdJBhDE5nS0ZZchBWFXWl/BLMen?=
 =?us-ascii?Q?YTbZqAVdFK3WaoJUeHAD50rS3l6NXij5gFTjYtCm4Ml9+IWCdhMv79xbozP1?=
 =?us-ascii?Q?TJkGaCR32lk+irL2cskrho4AU304nF4paL3Ie/HVVTWrLmzt+Xh2SfnX/ZxL?=
 =?us-ascii?Q?16OoYdSOplXEWkHXLcaLthuBYxxe4v39ApyPDe/b9ele2YMsziJFfFo+DF6l?=
 =?us-ascii?Q?RVt50Jz/Y1pvQbycS5xwZmF/yWgu1+J2YtSEO0eSdlooVKcigCLVfBopAm/p?=
 =?us-ascii?Q?pPSX2/bSx27qbcIK5hhYpBPZsePAKP8F5L8JoiOHle6EtaIUUV6cC6K/ZfXC?=
 =?us-ascii?Q?oj6fh9FaN1xfMa/i7NMwu3/q/25Yz2MWZjY3ZTOPEisJBUqJqzNR+X4wP4Gg?=
 =?us-ascii?Q?276btIrGuMRZa3XC4gkWlYWzjw4WIjl8qyB12vgXhog15GsaZ/6aftACWh//?=
 =?us-ascii?Q?FkpwgMQ+a9Keatz8Gi0r71S0KnInmJsFW4Wh6eYn0yeTp7bqBVPi0Vowmj0n?=
 =?us-ascii?Q?aBNiwSQVi41NytH+TkSBNbGVCNrxCOOkc/3OFWoBRH+usNJKN6a0xcTOzB3W?=
 =?us-ascii?Q?hvR1UUFbpb5VqpwVhLC6D49EuwEQSyS1SK3E5rVedXPZ+dQXZMMCRj1UBGA0?=
 =?us-ascii?Q?KZVNiYYZA0Byn7/0Vz7L/yiu40jz8RIsNC3offRJeBjGw2KUKoeDIliwQfog?=
 =?us-ascii?Q?IA1+2Bn/Moh3bRHrFfkZHd0qM8T4Ta8TaUIvBZ8A?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbdeb818-bd93-4fc5-fbec-08dc27520385
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 20:27:17.9113 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wrVqXwvxgbHFrsGZBnWHB8Uaq2CW8YYhh2bdzU1dtp+gG6TPyBNxVOxMH8I+2WSEbl5a3cj18KZnYsAQ29kFzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6414
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
> Subject: [PATCH 04/19] drm/i915/dp: Use drm_dp_max_dprx_data_rate()
>=20
> Instead of intel_dp_max_data_rate() use the equivalent
> drm_dp_max_dprx_data_rate() which was copied from the former one in a
> previous patch.

Looks good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c |  2 +-
>  drivers/gpu/drm/i915/display/intel_dp.c      | 62 +++-----------------
>  drivers/gpu/drm/i915/display/intel_dp.h      |  1 -
>  drivers/gpu/drm/i915/display/intel_dp_mst.c  |  2 +-
>  4 files changed, 10 insertions(+), 57 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index 0caebbb3e2dbb..b9f985a5e705b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -2478,7 +2478,7 @@ intel_link_compute_m_n(u16 bits_per_pixel_x16, int
> nlanes,
>  	u32 link_symbol_clock =3D intel_dp_link_symbol_clock(link_clock);
>  	u32 data_m =3D intel_dp_effective_data_rate(pixel_clock,
> bits_per_pixel_x16,
>  						  bw_overhead);
> -	u32 data_n =3D intel_dp_max_data_rate(link_clock, nlanes);
> +	u32 data_n =3D drm_dp_max_dprx_data_rate(link_clock, nlanes);
>=20
>  	/*
>  	 * Windows/BIOS uses fixed M/N values always. Follow suit.
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 4e36c2c39888e..c7b06a9b197cc 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -383,52 +383,6 @@ int intel_dp_effective_data_rate(int pixel_clock, in=
t
> bpp_x16,
>  				1000000 * 16 * 8);
>  }
>=20
> -/*
> - * Given a link rate and lanes, get the data bandwidth.
> - *
> - * Data bandwidth is the actual payload rate, which depends on the data
> - * bandwidth efficiency and the link rate.
> - *
> - * For 8b/10b channel encoding, SST and non-FEC, the data bandwidth effi=
ciency
> - * is 80%. For example, for a 1.62 Gbps link, 1.62*10^9 bps * 0.80 * (1/=
8) =3D
> - * 162000 kBps. With 8-bit symbols, we have 162000 kHz symbol clock. Jus=
t by
> - * coincidence, the port clock in kHz matches the data bandwidth in kBps=
, and
> - * they equal the link bit rate in Gbps multiplied by 100000. (Note that=
 this no
> - * longer holds for data bandwidth as soon as FEC or MST is taken into a=
ccount!)
> - *
> - * For 128b/132b channel encoding, the data bandwidth efficiency is 96.7=
1%. For
> - * example, for a 10 Gbps link, 10*10^9 bps * 0.9671 * (1/8) =3D 1208875
> - * kBps. With 32-bit symbols, we have 312500 kHz symbol clock. The value
> 1000000
> - * does not match the symbol clock, the port clock (not even if you thin=
k in
> - * terms of a byte clock), nor the data bandwidth. It only matches the l=
ink bit
> - * rate in units of 10000 bps.
> - */
> -int
> -intel_dp_max_data_rate(int max_link_rate, int max_lanes) -{
> -	int ch_coding_efficiency =3D
> -
> 	drm_dp_bw_channel_coding_efficiency(drm_dp_is_uhbr_rate(max_link_
> rate));
> -	int max_link_rate_kbps =3D max_link_rate * 10;
> -
> -	/*
> -	 * UHBR rates always use 128b/132b channel encoding, and have
> -	 * 97.71% data bandwidth efficiency. Consider max_link_rate the
> -	 * link bit rate in units of 10000 bps.
> -	 */
> -	/*
> -	 * Lower than UHBR rates always use 8b/10b channel encoding, and have
> -	 * 80% data bandwidth efficiency for SST non-FEC. However, this turns
> -	 * out to be a nop by coincidence:
> -	 *
> -	 *	int max_link_rate_kbps =3D max_link_rate * 10;
> -	 *	max_link_rate_kbps =3D
> DIV_ROUND_DOWN_ULL(max_link_rate_kbps * 8, 10);
> -	 *	max_link_rate =3D max_link_rate_kbps / 8;
> -	 */
> -	return DIV_ROUND_DOWN_ULL(mul_u32_u32(max_link_rate_kbps *
> max_lanes,
> -					      ch_coding_efficiency),
> -				  1000000 * 8);
> -}
> -
>  bool intel_dp_can_bigjoiner(struct intel_dp *intel_dp)  {
>  	struct intel_digital_port *intel_dig_port =3D dp_to_dig_port(intel_dp);=
 @@
> -658,7 +612,7 @@ static bool intel_dp_can_link_train_fallback_for_edp(str=
uct
> intel_dp *intel_dp,
>  	int mode_rate, max_rate;
>=20
>  	mode_rate =3D intel_dp_link_required(fixed_mode->clock, 18);
> -	max_rate =3D intel_dp_max_data_rate(link_rate, lane_count);
> +	max_rate =3D drm_dp_max_dprx_data_rate(link_rate, lane_count);
>  	if (mode_rate > max_rate)
>  		return false;
>=20
> @@ -1260,7 +1214,7 @@ intel_dp_mode_valid(struct drm_connector
> *_connector,
>  	max_link_clock =3D intel_dp_max_link_rate(intel_dp);
>  	max_lanes =3D intel_dp_max_lane_count(intel_dp);
>=20
> -	max_rate =3D intel_dp_max_data_rate(max_link_clock, max_lanes);
> +	max_rate =3D drm_dp_max_dprx_data_rate(max_link_clock, max_lanes);
>  	mode_rate =3D intel_dp_link_required(target_clock,
>=20
> intel_dp_mode_min_output_bpp(connector, mode));
>=20
> @@ -1610,8 +1564,8 @@ intel_dp_compute_link_config_wide(struct intel_dp
> *intel_dp,
>  			for (lane_count =3D limits->min_lane_count;
>  			     lane_count <=3D limits->max_lane_count;
>  			     lane_count <<=3D 1) {
> -				link_avail =3D intel_dp_max_data_rate(link_rate,
> -								    lane_count);
> +				link_avail =3D
> drm_dp_max_dprx_data_rate(link_rate,
> +
> lane_count);
>=20
>  				if (mode_rate <=3D link_avail) {
>  					pipe_config->lane_count =3D lane_count;
> @@ -2462,8 +2416,8 @@ intel_dp_compute_link_config(struct intel_encoder
> *encoder,
>  			    "DP link rate required %i available %i\n",
>  			    intel_dp_link_required(adjusted_mode->crtc_clock,
>=20
> to_bpp_int_roundup(pipe_config->dsc.compressed_bpp_x16)),
> -			    intel_dp_max_data_rate(pipe_config->port_clock,
> -						   pipe_config->lane_count));
> +			    drm_dp_max_dprx_data_rate(pipe_config-
> >port_clock,
> +						      pipe_config->lane_count));
>  	} else {
>  		drm_dbg_kms(&i915->drm, "DP lane count %d clock %d bpp
> %d\n",
>  			    pipe_config->lane_count, pipe_config->port_clock,
> @@ -2473,8 +2427,8 @@ intel_dp_compute_link_config(struct intel_encoder
> *encoder,
>  			    "DP link rate required %i available %i\n",
>  			    intel_dp_link_required(adjusted_mode->crtc_clock,
>  						   pipe_config->pipe_bpp),
> -			    intel_dp_max_data_rate(pipe_config->port_clock,
> -						   pipe_config->lane_count));
> +			    drm_dp_max_dprx_data_rate(pipe_config-
> >port_clock,
> +						      pipe_config->lane_count));
>  	}
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h
> b/drivers/gpu/drm/i915/display/intel_dp.h
> index 105c2086310db..46f79747f807d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -113,7 +113,6 @@ bool intel_dp_get_colorimetry_status(struct intel_dp
> *intel_dp);  int intel_dp_link_required(int pixel_clock, int bpp);  int
> intel_dp_effective_data_rate(int pixel_clock, int bpp_x16,
>  				 int bw_overhead);
> -int intel_dp_max_data_rate(int max_link_rate, int max_lanes);  bool
> intel_dp_can_bigjoiner(struct intel_dp *intel_dp);  bool
> intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
>  			    const struct drm_connector_state *conn_state); diff --
> git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index b15e43ebf138b..cfcc157b7d41d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -1295,7 +1295,7 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector
> *connector,
>  	max_link_clock =3D intel_dp_max_link_rate(intel_dp);
>  	max_lanes =3D intel_dp_max_lane_count(intel_dp);
>=20
> -	max_rate =3D intel_dp_max_data_rate(max_link_clock, max_lanes);
> +	max_rate =3D drm_dp_max_dprx_data_rate(max_link_clock, max_lanes);
>  	mode_rate =3D intel_dp_link_required(mode->clock, min_bpp);
>=20
>  	ret =3D drm_modeset_lock(&mgr->base.lock, ctx);
> --
> 2.39.2

