Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7DDC12FD2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 06:39:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FD910E583;
	Tue, 28 Oct 2025 05:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B5qY7Lpw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D196310E57F;
 Tue, 28 Oct 2025 05:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761629990; x=1793165990;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mgZWfv0dBV5vpGB/xKP2NVK240PBEDIhsX5sXCUL29k=;
 b=B5qY7Lpw9pN/Le29IJAJuGZyQEImPHEx4gO6m9Z4tXng7x3aWApx60mH
 SUPeDEZ7LwTkpiCyZ0ogz7U2ckCwpN6mQAeCYej19pDKYz1bvw6bLuiUz
 c15o+vrBDVlcixTVeleTn5vvUc9z6fQxy/HSX6u/zxrFWm50N2Kgw3Xff
 yx9HoZcD4PLsmNneoEGdiFLOS+YTrn2NKb0awlRMpjZzKoBQAKiIOvv09
 57v3revJoUidfQj1egapkeX7C3rz1g+wfxGaVLROy4Zouz4mgiM6Xki0H
 WqTk4tofW6FvkU5vZiXTKiBEU5gLJ4ea2YbGH63f8R8doiKOxYbipXXW2 g==;
X-CSE-ConnectionGUID: lNpMGNIVRh2A11w10IMOGQ==
X-CSE-MsgGUID: lTN33Jy+SX6OYys5HJlGRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63608318"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="63608318"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 22:39:49 -0700
X-CSE-ConnectionGUID: ggseUyW8SV2Dx+02BT0qcg==
X-CSE-MsgGUID: dRokDA1SQU+gfXvxZFFbEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="189561782"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 22:39:49 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 22:39:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 22:39:48 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 22:39:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EcgOOR8YWvjMnMrprx3UNLMx9+jVDgT2HNa09Q6+CGklqb3lMRiH39+OyEC16yP++sSKLmUuYOAOWvVTt72oNQxkdQSte86JD3+rMVNYg+7goc1VI8QyIUDpzgeBNiHy58ZCe4yPK+EqDByeoneibUjX/TsEECJ9TyGiHIM6fqaIh2bmF73z2vp23nm3wJjZaYHWR9stlFJqQ/j9FRAP1PFLdGZM7NhGK/X8wOAfkOz8oYk/GFRMTydwBWNM+r+ItZXo6jgnYpJY0kqopxEQ8V8wvG5M3A8w6ac7f8PRHqZ7Sp5VUpnOOtTmVOk51urb2CUNh3sEfKga7xfuBvzA/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ztxa87lvzfiNy48TErR/exv1TMWPy1g61daXbYiM5k=;
 b=CtdHlLi++9UEj10jaLCj9oO6rmoV1gcZZkQbIMiWorKM3llaY4TqpDazu5u/m0sTabKC2X2ZpnobqRQuI6dmQdgzeZedreyTFGn9W4pqODu4sGxPgm47g9DkfNKq9OFTCZYNXVcZDanp9T+xZh7M1Ed3RvFZGeuGzJS41vSEU04HkMX1ljpVHg+b2cD3rBpNFB84Jm5JpSWc+/NQRm9hCfTvUWEznZGzypXwqSiZ190rgr3Imu0LspAIOahgHgqUiKboMSz+NAbBluabxjLrKMpisQrYZiD190D0hlvkw+ruN/UNZGInqrAz/WlQEzzIq5iTP6jVgeAjOMKvNZTcOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by IA0PR11MB7380.namprd11.prod.outlook.com (2603:10b6:208:430::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 05:39:39 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 05:39:39 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, "Christian
 Koenig" <christian.koenig@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: RE: [RFC v2 1/8] dma-buf: Add support for map/unmap APIs for
 interconnects
Thread-Topic: [RFC v2 1/8] dma-buf: Add support for map/unmap APIs for
 interconnects
Thread-Index: AQHcRvz5XpQuDeF4ak2URy3/E7CD9LTWRYWAgACfLqA=
Date: Tue, 28 Oct 2025 05:39:39 +0000
Message-ID: <IA0PR11MB718509D24638796FCAFACF79F8FDA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
 <20251027044712.1676175-2-vivek.kasireddy@intel.com>
 <20251027174723.GB1018328@nvidia.com>
In-Reply-To: <20251027174723.GB1018328@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|IA0PR11MB7380:EE_
x-ms-office365-filtering-correlation-id: d6db7d1a-1534-446e-425d-08de15e4634c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?nyDaRwE2aR1L1ejSfmUZMn0qDsnBMqOABn2FWdvM+UAZFgoDMuYDE3nXiE?=
 =?iso-8859-1?Q?X1ZpH6K4nUjEXOmziSi/J8pBw7yn4P6ODDMrObtyzR1mzmYB9VS4BkOhoP?=
 =?iso-8859-1?Q?R5a3fTIjA+rvmfJHe2cI+RxR2ayWxVho9ajCYnI4h0IaRsF3uue6+OYALX?=
 =?iso-8859-1?Q?NhKCrAyetzy78yJczp4zpDtqtGm9zT1sb4+g6evY3PLpvYapJXieZEGnuI?=
 =?iso-8859-1?Q?MFmSMkplts/0zM0uIOSTz1v+bF2DTw+LsEb8GxEDQPJZVMNiqTt2eVAg5L?=
 =?iso-8859-1?Q?D78TNZUzhGFr/+PsuyQmoQwwzu9k8JMi1xZFwu4CoGG8R88b10WPAH2ikl?=
 =?iso-8859-1?Q?gZtlm0vkN6d9k3TNojt+dfe7zN9loBJPaO2ZUHmPtLneh7IL/QRe2VfdLM?=
 =?iso-8859-1?Q?jBxHGOpzXj7u7Q5Eqp4Ode8uxv5zpAr1VCGpf1pzL7l1WgA3tXeV6tYSs+?=
 =?iso-8859-1?Q?NbqB26594E8EoWeztbDGMzIIwn4TNo1j1yjQ76YquSXKgjy7gHCKRUngws?=
 =?iso-8859-1?Q?gQBWRNyFxC1Nss8CJHyruM1DfQXH8tilpFiSa78AG1zzej+jUMBMF/VNT1?=
 =?iso-8859-1?Q?mwyfaUVfPJ875cFCuUnlWsY1GQQESdlL4VUgSB8Pbq68v1zhiVd7XpSdah?=
 =?iso-8859-1?Q?srJVhgPCnReX/IiXL1mrPFumvIstOIYka4te2yogbC7ZBb3og3zrrccUpY?=
 =?iso-8859-1?Q?8PMbYyOg3p+3aS4rWpzozJGauMNSFECclIQaag3kxV6yN5i2ZTvVf69D9C?=
 =?iso-8859-1?Q?zC7rzCrB+Qzb8M6JAAG3Fu0DKOm5a78c77Sc9iZ5phhSYdowK+LNfkUII7?=
 =?iso-8859-1?Q?PC9Hqnv0xRyAGC9kwZ5w2aYk9Nq+cUIj/8aJIspkCkdk3xyqJDZaiTCxEJ?=
 =?iso-8859-1?Q?5hoN3/rqojd2Ga/3qCqs8EC46zATS7S8A3sQpUIdJ4Xth0QvT4fy10OKvR?=
 =?iso-8859-1?Q?tpxalDYJeQKAj/TWjMd/oPb3gMyi3SqiVKzI0Kei52QN0XSRPOBU9dJjIU?=
 =?iso-8859-1?Q?tqAe99XvW5bIA353WG/6l2MG0fDhxzC7NAjfwXgmMwVh777DD0iQ8FbFSL?=
 =?iso-8859-1?Q?8OyeL9jGiO0eKDMbtkl/0+g3n7MbCVed2mrGMEX4OOJTEEtJIC+ax+U04y?=
 =?iso-8859-1?Q?CfkDkM9dnz/9iN7/6+IK2Bjn5ulc9cp2k+fpE+Abs8QNoJiMfT9bzBYYuq?=
 =?iso-8859-1?Q?FYVttWlXwxFQQ4JKvkpJYu2jgaICIIy6nfoAWnoxqQecXh4Iyc/xla+h4N?=
 =?iso-8859-1?Q?WISON8dTT9vTUneIMvNfR8lYR7P9KK/jsSywDou4zRlUzhhVWvuFjp0jWo?=
 =?iso-8859-1?Q?MganzlNRi3Za2c1K1w6Fw0Nk7Y+aypZRtNLeVEsikunZu65bQvFs7XtWbO?=
 =?iso-8859-1?Q?zglM0NDMxbHKDsCWjA5TzG6hcHTv0oDXnH4zLs8mdRmrj8eCNc59ZblAeR?=
 =?iso-8859-1?Q?CoFczsGM7kb2INqxCmJ5sGdEDpsWJ7yaIK75+vKb/4XEbezD/OPO5Q4QJe?=
 =?iso-8859-1?Q?AeYFrB8Sy/gPWhSpWW9xNXSfA5+uBrjKt1orrHR8eERyACrBeVbzyWRmR6?=
 =?iso-8859-1?Q?h4bo7irvsv6SBop6NklE7Mj+PTip?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?fQqcM9ziQ9Hfmzx29NoyGA9ey/0wNMq49y2tga1GVqKhs5rDgxAwXjS1Di?=
 =?iso-8859-1?Q?xIOcCaaGwHozXRprL8AVbXn3wEXo2jQEC25pleVvf3M84KabYqXT9HEDfc?=
 =?iso-8859-1?Q?08RP9UQC/BSuyCN4DQn8uXGuw5eLyKV/xKw4uVUTV+61/Unhg/NUspw67x?=
 =?iso-8859-1?Q?Z8gh4sXQleRgrDFlOBW+ThmC1FC770LbZdfhlmWOFoJ3ZOgDlLHcPofCTE?=
 =?iso-8859-1?Q?Q+o2Ri3pS8jeRZ7N1igEL3HtAvDo4ZJbHRfHhiGHLZCAu43AVk82bX+ux7?=
 =?iso-8859-1?Q?AbGzfbpqKdebj53bJS2GxsnniYKAmLYyb2poGTYqroqYV/a3noeUOo1ORV?=
 =?iso-8859-1?Q?p/FvoDyVmeLhVRqcHRRc1Mog87RRMCXHxteEF50PbWFPU1TqFM5AHniO3/?=
 =?iso-8859-1?Q?l2s+x7y+0rhq18SD0y8ISgrCMC6BPLY288SMuE7XyNFiqp9Kum5xgxS/EO?=
 =?iso-8859-1?Q?GEk3wdIYU4jo+w5b8hsaXvuQK9iKqvAYM0IR0cBUigf1VexyqrtOICnJAX?=
 =?iso-8859-1?Q?eWo00rZH5xYU/d64jNTpReZgmIpScae7o3rgbU6wTFtKDj+QmYqypEOnJ6?=
 =?iso-8859-1?Q?3ZOrviT596ANEyacB4yKmH8ePhvuUlBfN9SadIl/qSpH7hGAklYyiCxMul?=
 =?iso-8859-1?Q?Sgixvc0vfnVTkKSc01o2q5lFOH5meMq+TDccY5MC6RAgnZUVJLaIEy078t?=
 =?iso-8859-1?Q?TZk57SiDmBSF7qT8OHvfDYX2Fjv7PONDlbw36JFSTufyUP94ldEl5kU0q/?=
 =?iso-8859-1?Q?u/Cg0XXAgQ/2NTXQ1s9LmqUUwblFARtOwOmNI0SAA2qxf7g7gJWA5/Amer?=
 =?iso-8859-1?Q?ixVChnJtWLU/2H8z79p0wpyNCjGzVgYVbZq4fb5rk37UEBAuSBY1TYogQB?=
 =?iso-8859-1?Q?O68WB+DRiTGCPzPnfdsGJvWX6FL41m6GFKJF6GTXsT5kuHsSR2Hf6x2OjV?=
 =?iso-8859-1?Q?u7G2dgXhpZe93j0d0rDS67Rc0OaHUax+OopZrlFMS+543QHCXh1fES2rvR?=
 =?iso-8859-1?Q?ZpiaDubImCSutUAHect/6e8YeP7njl6E7BJzXzLJ0NZaNhFA0tJTYj6aXw?=
 =?iso-8859-1?Q?ln4IWhGZOBYopP5iGYB/5ZPtweq5hp+trjYwkg9JWtU197dgonUnIyp0mv?=
 =?iso-8859-1?Q?4Ai61beIZ6xEOGY56ZJdoqS2xF3cAUuulMV+M6XhSJtPNBBrlcXmIoVjz6?=
 =?iso-8859-1?Q?oht4wKKEehWxNDBmB1A5nLIDeNMfaNlgS7+POrw9ibi79Audrg3i4y7Eiq?=
 =?iso-8859-1?Q?lnP2WF4FJcoRQvY72fu9MX0+UIFfeC0+UiGBI73bw9uTGZwkmvcAVcjiXI?=
 =?iso-8859-1?Q?zaVpFoKmmQL2cua4py/D0x53IvEVhfQ2A8+6SMhUU3Xg0F63QZPdUA+a87?=
 =?iso-8859-1?Q?HTMUHKv1jKNqVkRzMbEA/qwXxuV2d5F298nE6u1BMjK64VfG5PNJuarZCW?=
 =?iso-8859-1?Q?q2X9UC8YC2rPVNoDuNzK6MRoHyepmKftaoJLFIobs+qHrwe10gujN1w2ZJ?=
 =?iso-8859-1?Q?lcattehCC9xGf0v6siE3EGLK6oYvvL/oOBYe3Bqgd8YoyHipjNxc4kiotp?=
 =?iso-8859-1?Q?09a1+GOd2ytX3/z2baQfn9YqdUi6UEAd2pKNi1Ew0vRVpjctKPJWSOKhyy?=
 =?iso-8859-1?Q?Hv42mvXrj90k16L41Eg1vfhFsu+d49tv2B?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6db7d1a-1534-446e-425d-08de15e4634c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 05:39:39.5823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NmrlX4qrBm1n/pBMHd8FlgUqZREZIEbXVKtvmgclUBb29KI0EAdyqpvNboJeKRAl/iZyURkU3WDuUlbmb4Jn77TxbkHV9MzLZqZgoqOJxUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7380
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

Hi Jason,

> Subject: Re: [RFC v2 1/8] dma-buf: Add support for map/unmap APIs for
> interconnects
>=20
> On Sun, Oct 26, 2025 at 09:44:13PM -0700, Vivek Kasireddy wrote:
> > For the map operation, the dma-buf core will create an xarray but
> > the exporter needs to populate it with the interconnect specific
> > addresses. And, similarly for unmap, the exporter is expected to
> > cleanup the individual entries of the xarray.
>=20
> I don't think we should limit this to xarrays, nor do I think it is a
> great datastructure for what is usually needed here..
One of the goals (as suggested by Christian) is to have a container that
can be used with an iterator. So, instead of creating a new data structure,
I figured using an xarray would make sense here. And, since the entries
of an xarray can be of any type, I think another advantage is that the
dma-buf core only needs to be aware of the xarray but the exporter can
use an interconnect specific type to populate the entries that the importer
would be aware of.

>=20
> I just posted the patches showing what iommufd needs, and it wants
> something like
>=20
> struct mapping {
>    struct p2p_provider *provider;
>    size_t nelms;
>    struct phys_vec *phys;
> };
>=20
> Which is not something that make sense as an xarray.
If we do not want to use an xarray, I guess we can try to generalize the
struct that holds the addresses and any additional info (such as provider).
Would any of the following look OK to you:
struct dma_buf_mapping {
        struct phys_vec *phys;
        unsigned int nents;
        void *map_data;
};

Or

struct dma_buf_ranges {
        struct range *ranges;
        unsigned int nranges;
        void *ranges_data;
};

>=20
> I think the interconnect should have its own functions for map/unmap,
> ie instead of trying to have them as a commmon
> dma_buf_interconnect_ops do something like
In my current design, the exporter would call the interconnect specific
map/unmap functions from its common map() callback. But I guess I can
try to implement and test your suggestions to see if they are more robust/e=
legant.

>=20
> struct dma_buf_interconnect_ops {
>         const char *name;
>         bool (*supports_interconnects)(struct dma_buf_attachment *attach,
I have this as part of dma_buf_attach_ops for the importer but I'll explore=
 your
idea in more detail.

>                                       const struct dma_buf_interconnect_m=
atch *,
>                                       unsigned int num_ics);
> };
>=20
> struct dma_buf_iov_interconnect_ops {
>      struct dma_buf_interconnect_ops ic_ops;
>      struct xx *(*map)(struct dma_buf_attachment *attach,
Do we want each specific interconnect to have its own return type for map?

>      	 		   unsigned int *bar_number,
> 			   size_t *nelms);
>      // No unmap for iov
> };
>=20
> static inline struct xx *dma_buf_iov_map(struct dma_buf_attachment
> *attach,
>      	 		   unsigned int *bar_number,
> 			   size_t *nelms)
> {
>      return container_of(attach->ic_ops, struct dma_buf_iov_interconnect_=
ops,
> ic_ops)->map(
>                  attach, bar_number, nelms));
> }
>=20
> > +/**
> > + * dma_buf_attachment_is_dynamic - check if the importer can handle
> move_notify.
> > + * @attach: the attachment to check
> > + *
> > + * Returns true if a DMA-buf importer has indicated that it can handle
> dmabuf
> > + * location changes through the move_notify callback.
> > + */
> > +static inline bool
> > +dma_buf_attachment_is_dynamic(struct dma_buf_attachment *attach)
> > +{
> > +	return !!attach->importer_ops;
> > +}
>=20
> Why is this in this patch?
I figured it makes sense to limit map/unmap interconnect ops to dynamic
importers (that register a move_notify callback) only. I guess I could move=
 the
above change into a separate patch.

>=20
> I also think this patch should be second in the series, it makes more
> sense to figure out how to attach with an interconnect then show how
> to map/unmap with that interconnect
>=20
> Like I'm not sure why this introduces allow_ic?
Ok, I'll move it to the other patch that introduces dma_buf_match_interconn=
ects().

Thanks,
Vivek

>=20
> Jason
