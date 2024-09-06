Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5714496EDB5
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 10:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A292F10E9B1;
	Fri,  6 Sep 2024 08:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TmNMcYVS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE0710E9AF
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 08:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725611029; x=1757147029;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F0FEiN8H70ONGlJSnGe2078EvzFNW8c9ED9sEgthSYU=;
 b=TmNMcYVSfvKV4kQlOJSSeVLE3IlFryaGdFW7pTCN584v+aZ2hbkzFpu4
 8WL1EHzWVFmvBb+HP3RL8XxlSiy691QRzpIcCjpOe7rTM0nozQZ5WbzZy
 F5zQDUAQ+pjl/69yn1f2Lr6WX09CqB3vtLuJPAHfymVGiLCS5UYHRbNTO
 XoC9UPIn0q8yH3t7EqiUw7aHxLSjVvWD9oG/E9U4+PFhyBUW5wJvmMi/l
 u9OXbO4p94RaX2gR/kjvvpT30n3JNHOtgw4pnEmjG63ZKaTyJXTKzSPkv
 hJ/Z/MNJF5QQoObwgI26G7pcg1M6dKAxpMFt4x76vsVJGVggqp0ZgxHJC Q==;
X-CSE-ConnectionGUID: 16u/dmDRR4auAG83KOHU3g==
X-CSE-MsgGUID: v2h6eIPYTMmprMTlnoXEag==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24229045"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="24229045"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 01:23:48 -0700
X-CSE-ConnectionGUID: OS0KmzH7Su6mQ+qJt1/VuA==
X-CSE-MsgGUID: V3p0ToYaQquicMBsQIFcAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="96670273"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 01:23:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 01:23:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 01:23:47 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 01:23:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjIWJdjTTa/sbwnXV58pPKzh06HpvN/o/8b3Jk7VR/0ffKLcahkSbh0YiymG+S6f/Tx3Nw9wJ+v9NoXYtRX/HLweOQSCDYWU+qhZjoUpaoGrT/KuyKWU+efeYuqS2wge3YqKlMzoZtxRgnk/YcASgxbK7MrgwuegiaObrYdwKmrPVI+gzUwsa6QftDNaFudDV1cfTUmqwLgJXDLEsAYNgAWSNQBV80jch0rO0R2d3LDa4cJvMgP+CmHi0dPybwqnCeyR7ny5jZ2o8bmx6Nyke67UnZtP91zoI+UnqRomKAMEb60kq/qOsiDOZOjNm/la/B+d9qBEzloUAra5sUxmnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1G6+lDbNrKwpOJairo7Pgl4Wo6edZQY6w4eYy84sBE=;
 b=S9MB+fS9usj5zY4h5XCpbvZnkuVT8ndWRuho2My5wR0Jp27jOA0acu218IfZaVLpNluDfiqe2bfIHnXVsbJDR9QAI8giK8JfWAVjM8Pq2TY176fhppn1AbbyPLmQD7akO3AZOMGu5jkSSdTXwMg6ca2Y5axjZk87jUrp9X7lWkhFtjdKDTnn/6K3uOyBlK/NPhyTiKLDpP5B3gKe/74lGb2a7ibJSZwOcAS6/2I6i18BcUVQOjpejq78hWmp7Tc9IwScc5aC4K3tkFFCzazR4LUMUyMZ77odEm3iAECWxl9KDMlld4yAWeHUZTVx1hEcwK+O5oHELPLGTFf8TLtkRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by MN2PR11MB4678.namprd11.prod.outlook.com (2603:10b6:208:264::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 08:23:39 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%5]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 08:23:39 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Gerd Hoffmann
 <kraxel@redhat.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH v5 7/7] udmabuf: reuse folio array when pin folios
Thread-Topic: [PATCH v5 7/7] udmabuf: reuse folio array when pin folios
Thread-Index: AQHa/d0qEhTrDE1KAU60PiLwV6IO7LJJdOzw
Date: Fri, 6 Sep 2024 08:23:39 +0000
Message-ID: <IA0PR11MB7185D2C5AE98C2EBD72B72C3F89E2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240903083818.3071759-1-link@vivo.com>
 <20240903083818.3071759-8-link@vivo.com>
In-Reply-To: <20240903083818.3071759-8-link@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|MN2PR11MB4678:EE_
x-ms-office365-filtering-correlation-id: 8d491714-a309-428f-e1be-08dcce4d3645
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?b5qfbPPZJBqF3PxfPvKKoPWEohOntCj6LMXSEHjaXSrqLPTBl+F6m9CJhs?=
 =?iso-8859-1?Q?gi3hiaCU4RdSVFeHHJYDCCs/MJoH9VrSuUIKEOAycoSeo5ibE5TV6q8k7C?=
 =?iso-8859-1?Q?Kt91TQaeZBAgVmbssbuizvJN1pputeKaNG4U6yAxmMFihqc1XSQUA1JMCQ?=
 =?iso-8859-1?Q?IfYBQFv/k37mmd8vQdTu53ds6GCwJ+Fo0yrFDLGTtHp1DUJBPYoJwt51Lh?=
 =?iso-8859-1?Q?kty6dhjjlZ1PQD0bjfW6L/sIO7hP7dbHjan5hFkFhKnD+PbRdnUbA335f0?=
 =?iso-8859-1?Q?sfrGOWrL3LSyxaAFE2ZO3EW0rWoknjPHgcX3fRqkKUoMIP4H4KIRrZTLGV?=
 =?iso-8859-1?Q?VgGueLB31uAwUtbaJyRirqfNTw7BFtssQdSip5KhCkSWx2PjVOFxRtvEz2?=
 =?iso-8859-1?Q?nwUf5lBVm/HAtkbNcoOpOS2XSGRMOjWVU2psHcCFYtvn/z1eWakr9KQyHr?=
 =?iso-8859-1?Q?Z9iIaW172rUUGDUH4AkIEJGscEElDRmjkWy63FFcbBNqEZ2U8PFaJo4aZT?=
 =?iso-8859-1?Q?+ytQeGIUw4VYj2PES8tu7TrVPo4cujtbyUdb5HxDLjaLhf52llj08xEKYv?=
 =?iso-8859-1?Q?MrOgYiprBXzanVXzBrqQwBxL8cUSM/J7Bm/feHhx0mHYEVWBpxpm20ZC6q?=
 =?iso-8859-1?Q?4B3nZNT4AaG6QZI9boN0CM80chKEPK5CPVwoxFwM+0IU/YqVt7FQ812P+d?=
 =?iso-8859-1?Q?1V0Qb2N26zLkyz1bW76ilWqRLLQhdQMiY+K1rEFtIeys7qasxVdhBKAM1v?=
 =?iso-8859-1?Q?gvGJSRHecKUpApE0pat+8qtfRvjwl/SJv7rFG8vyn+VOSoB4AMxeOwqeNC?=
 =?iso-8859-1?Q?XOKn8VgXVeWslNlKUr2xUpbSSQDiF/tVwn9iTOJF4Id2dDQI/oohZ7DGgM?=
 =?iso-8859-1?Q?a0OObl4vhpee7pbTeGFHM83ghj4Zuka/ijDCoF+Xnl2biR2Zm3TpcVhRRt?=
 =?iso-8859-1?Q?TwYqx0Vzm6Psp2oCLLg1prGC46pPQdOH1DkRHeryIpu+Pj7/18euznnv1K?=
 =?iso-8859-1?Q?gVBmtbVj3Pyel9uVk9DGKdU5ltzqcOrS0jl7Ublwmgq+M+OrVC7mgyiClR?=
 =?iso-8859-1?Q?sfi2Y9jD72ap3SZCAvAv2tFQWwB6sD1r/c/refQjFsowPKZzcy/+eUKR7M?=
 =?iso-8859-1?Q?Ihfd8QHniPoJOWqwLVgBNxKfp5aTDS0IvUHPp/Azd5oSRQBgKkJidxqMny?=
 =?iso-8859-1?Q?uhcVKb5XRjkduUkDu7al406PpRl9h+gb+YelQH6RBoTO8AkmtdlsGf39B9?=
 =?iso-8859-1?Q?QYzo6I8ddHyXbvvSLrJBI9VShS16EQ4xnouIDGCydYzJ8Yn/V8eKtUYJZA?=
 =?iso-8859-1?Q?GZsEDv8vWLIx9EtBDX9Nm2cRC9O1FLZ9u0hva0pn6um1nYdYyR11nae8N1?=
 =?iso-8859-1?Q?4YEf/ajcLm0OBJ50oB7FL78Yloq0dimkrJg3qJkmQB68sMAR0ec9mMtFlU?=
 =?iso-8859-1?Q?/mm6LFoRRHbVH6XfJc0M7d8ZMOzKSl4P+wEjfg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?NNF/QPcVKMupgDx7ucMQWWBi3JPISb1EjgNwQdDpuuS1diYqT+fr9VVJOM?=
 =?iso-8859-1?Q?X9CGCnoJL8YsJ8/esZJFxIWE0lUz+X6T+TEce3mRlDjLdZVw2mXpzn1CpC?=
 =?iso-8859-1?Q?b1Bg+kwaJGJadw165H+ZRavDS0BYsJdbCbIb/MjNUTqoGQSnCGu2A570Nn?=
 =?iso-8859-1?Q?qK/JfI/IR/5Oeadx4DjEkly3pOx6tENXGtugHArfktpTWJCjdXt2ONTup7?=
 =?iso-8859-1?Q?ro5g0mhUir8YISyEDiENE6RDuHghWabnUFn87Gbv5s15PkAFsIJNNWwnJR?=
 =?iso-8859-1?Q?rq4hcY9A5uRqAT9eJ539+xrG13DBYvWQqIGF4zzWyhYwrhIXBHhXlkcCj9?=
 =?iso-8859-1?Q?564RRbDLxNv2MeFgDiVuvZX5nJKuIJbmmWbHLal2zsDisYQu1dy0RdK7DN?=
 =?iso-8859-1?Q?mWQePX00tqICHPDxo1BSqNsrDL3jq2TOmXBsd0yd8bqP0vSvv+tPoB7heC?=
 =?iso-8859-1?Q?kqrv8STHJ6Md1ctQR2xvHxuZtKhmEp9litoY6xFML9cgpfplAbMyBLYIoI?=
 =?iso-8859-1?Q?7Ny/uQehMa5M1WUXA6uIkwLV+8euCI0YU1oMXF+fxX7iNHNL4UwD+tUiID?=
 =?iso-8859-1?Q?2ntn92S4VnLcpWF3UenEOA/9AO6hL84KoZgRpJ1yZp/+Ok+US24eYuKJma?=
 =?iso-8859-1?Q?PoIuxDvWJasOYe8Zs5aWamOo8XDUHIm1ljv5Oek5bu6DpQgtyuu6rR0NdV?=
 =?iso-8859-1?Q?jWKPOKQ9py+u9beF4FPvtQyRY0l5B1VF6tUjhnpXrOYMrkDIVUFI4L+DB6?=
 =?iso-8859-1?Q?sH6dg2XIjo2sGVASjMa++H7ZaJIwL47pO37+58fQFd5fKbs789N/ICC7je?=
 =?iso-8859-1?Q?WyTgZ5hVuMgHGEl7wAF0MOM2Kmx/H5fUMF/hnQz84FvMrYooj9RZ/JNgFq?=
 =?iso-8859-1?Q?BaqMGU7GZVSmZuccmf6/CXvm4GDar9U9gLT5Kqfs2OY/ZnHmMqfRVVcC8l?=
 =?iso-8859-1?Q?YFWRqKuiPok5tD0x0wOyNl+sbL9H0BOFsRYfi+K0npc8Eosw8zMEUH8bu+?=
 =?iso-8859-1?Q?qSkXAtjnzMWkmoQ2nZrGLpxK0t4TExuQWjq0ta6jVlVKkdrhsETSohTuWk?=
 =?iso-8859-1?Q?Mj5UwNqDdibnpLicDa84dKQ9YvOMf4QQXg00Kcb8XwDW3orLs4uKOWxviQ?=
 =?iso-8859-1?Q?y5EkpVUDIIQS2Jlm9Ct6l6BcqEQmegR4Ga7Xq2XC+YjjL3dV5QP5ZAO3dj?=
 =?iso-8859-1?Q?3Wq7ND3DJ81ciwS0czRAXo1JvPZlNxZPXBe337v3ZAX5BMvlNsC5aKVeTZ?=
 =?iso-8859-1?Q?m4VPocnDt1d/sE8/3fOX49GKGHbbq3TjmdffZtNWZ/EeruZ8C6z/tRTHr6?=
 =?iso-8859-1?Q?T2Dch1uqgQON2eMr5lXAY/m3IXmG/Jpl34B81D00081wCJy/syR7G1zds5?=
 =?iso-8859-1?Q?UUdBKfNN2ixNWEKTdLyrXiIGHSGRglrvTHF5Y3ZrbMkiJfqbJjT1wkT4cQ?=
 =?iso-8859-1?Q?qKeNEobN9h7ZXPIZUlTJE+AQvMcLSWTCugcp/xUq6NyKaLY39mBV8wx2LK?=
 =?iso-8859-1?Q?c2zZgQkbjArzocH0Wbf30Q+yiDjR1QidWpVWAyGEk2CbjDSFHYZhOkmluT?=
 =?iso-8859-1?Q?oLsK5MTji2liyP0diiM5Xa0/mtcPVbqB7Id7LlymiXv9NGCdvUItgaa7kY?=
 =?iso-8859-1?Q?LnYCXoU00oq5viMG2mua2uQLr1injhbIz0?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d491714-a309-428f-e1be-08dcce4d3645
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2024 08:23:39.8100 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tFDlf5cV78UZsdvh5ohwlgKQlmE3fAq1JpIM6x74vqnIgULwkUp9HOqHZ3z3bj5bXvpNC8ZK0bb3PRwh2kIOh5z0ufLiit4twNm47+DR1Lw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4678
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

Hi Huan,

> Subject: [PATCH v5 7/7] udmabuf: reuse folio array when pin folios
>=20
> When invoke memfd_pin_folios, we need offer an array to save each folio
> which we pinned.
>=20
> The currently way is dynamic alloc an array, get folios, save into
> udmabuf and then free.
>=20
> If the size is tiny, alloc from slab, is ok due to slab can cache it.
> Or, just PCP order can cover, also ok.
>=20
> But if size is huge, need fallback into vmalloc, then, not well, due to
> each page will iter alloc, and map into vmalloc area. Too heavy.
>=20
> Now that we need to iter each udmabuf item, then pin it's range folios,
> we can reuse the maximum size range's folios array.
>=20
> Signed-off-by: Huan Yang <link@vivo.com>
> ---
>  drivers/dma-buf/udmabuf.c | 34 ++++++++++++++++++++--------------
>  1 file changed, 20 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index d449c1fd67a5..d70e45c33442 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -343,28 +343,21 @@ static int export_udmabuf(struct udmabuf *ubuf,
>  }
>=20
>  static int udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
> -			      loff_t start, loff_t size)
> +			      loff_t start, loff_t size, struct folio **folios)
>  {
>  	pgoff_t pgoff, pgcnt;
>  	pgoff_t upgcnt =3D ubuf->pagecount;
>  	pgoff_t nr_pinned =3D ubuf->nr_pinned;
>  	u32 cur_folio, cur_pgcnt;
> -	struct folio **folios =3D NULL;
>  	long nr_folios;
>  	loff_t end;
>  	int ret =3D 0;
>=20
>  	pgcnt =3D size >> PAGE_SHIFT;
> -	folios =3D kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
> -	if (!folios)
> -		return -ENOMEM;
> -
>  	end =3D start + (pgcnt << PAGE_SHIFT) - 1;
>  	nr_folios =3D memfd_pin_folios(memfd, start, end, folios, pgcnt,
> &pgoff);
> -	if (nr_folios <=3D 0) {
> -		ret =3D nr_folios ? nr_folios : -EINVAL;
> -		goto err;
> -	}
> +	if (nr_folios <=3D 0)
> +		return nr_folios ? nr_folios : -EINVAL;
>=20
>  	cur_pgcnt =3D 0;
>  	for (cur_folio =3D 0; cur_folio < nr_folios; ++cur_folio) {
> @@ -389,10 +382,8 @@ static int udmabuf_pin_folios(struct udmabuf
> *ubuf, struct file *memfd,
>  		pgoff =3D 0;
>  	}
>  end:
> -err:
>  	ubuf->pagecount =3D upgcnt;
>  	ubuf->nr_pinned =3D nr_pinned;
> -	kvfree(folios);
>  	return ret;
The variable ret is now unused in this function. Remove it and just
return 0 at the end.

>  }
>=20
> @@ -403,6 +394,8 @@ static long udmabuf_create(struct miscdevice
> *device,
>  	pgoff_t pgcnt =3D 0, pglimit;
>  	long ret =3D -EINVAL;
>  	struct udmabuf *ubuf;
> +	struct folio **folios =3D NULL;
> +	unsigned long max_nr_folios =3D 0;
>  	u32 i, flags;
>=20
>  	ubuf =3D kzalloc(sizeof(*ubuf), GFP_KERNEL);
> @@ -411,14 +404,19 @@ static long udmabuf_create(struct miscdevice
> *device,
>=20
>  	pglimit =3D (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
>  	for (i =3D 0; i < head->count; i++) {
> +		pgoff_t subpgcnt;
> +
>  		if (!PAGE_ALIGNED(list[i].offset))
>  			goto err_noinit;
>  		if (!PAGE_ALIGNED(list[i].size))
>  			goto err_noinit;
>=20
> -		pgcnt +=3D list[i].size >> PAGE_SHIFT;
> +		subpgcnt =3D list[i].size >> PAGE_SHIFT;
> +		pgcnt +=3D subpgcnt;
>  		if (pgcnt > pglimit)
>  			goto err_noinit;
> +
> +		max_nr_folios =3D max_t(unsigned long, subpgcnt,
> max_nr_folios);
>  	}
>=20
>  	if (!pgcnt)
> @@ -428,6 +426,12 @@ static long udmabuf_create(struct miscdevice
> *device,
>  	if (ret)
>  		goto err;
>=20
> +	folios =3D kvmalloc_array(max_nr_folios, sizeof(*folios), GFP_KERNEL);
> +	if (!folios) {
> +		ret =3D -ENOMEM;
> +		goto err;
> +	}
> +
>  	for (i =3D 0; i < head->count; i++) {
>  		struct file *memfd =3D fget(list[i].memfd);
>=20
> @@ -436,7 +440,7 @@ static long udmabuf_create(struct miscdevice
> *device,
>  			goto err;
>=20
>  		ret =3D udmabuf_pin_folios(ubuf, memfd, list[i].offset,
> -					 list[i].size);
> +					 list[i].size, folios);
>  		fput(memfd);
>  		if (ret)
>  			goto err;
> @@ -447,12 +451,14 @@ static long udmabuf_create(struct miscdevice
> *device,
>  	if (ret < 0)
>  		goto err;
>=20
> +	kvfree(folios);
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

>  	return ret;
>=20
>  err:
>  	deinit_udmabuf(ubuf);
>  err_noinit:
>  	kfree(ubuf);
> +	kvfree(folios);
>  	return ret;
>  }
>=20
> --
> 2.45.2

