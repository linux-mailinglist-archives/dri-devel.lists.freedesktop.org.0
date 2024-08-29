Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B73963AFC
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 08:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D978610E328;
	Thu, 29 Aug 2024 06:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ctGU+emN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CED10E328
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 06:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724911813; x=1756447813;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kwpdWu0atFg8YxnrsQVlK/oOIZ5Q0CL0XaHIyrYiCv0=;
 b=ctGU+emNI1CLLuo5j2ROQ7Hh4srLtg8eCPzfoPSBFSb/SJj5roUkMTS6
 n3FFx6+5lz1yez/44tjpwYWeu3+/KHEx2rDXiZxGzpakLYBC7kFqOqtiZ
 9PNGpPogGUYIAeVslMoYjWAEI0AWeHWUQQ1rbS5HAp3tpAsNtgOuVz3Nu
 a/nHxoIrxlpvgXNbvY5Ql8jm9FxvcQlGx1WQTfp3EmicvbyY3nzQRPDFH
 Sfyl0r7oz5UQG+TGHeqhiIYjsIuo+6tQc5cpLqifvSFPRnVJFyQcSsqVo
 3gjaOeYUkzZDwKd70SwD4JbQdMtvpqHZI8QxQrlliext99n1/8tl7Lmzz w==;
X-CSE-ConnectionGUID: 0munwgJtTqmX+t9q2leUcw==
X-CSE-MsgGUID: TfasGYP3QQWGA6tg82T6Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="40955733"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; d="scan'208";a="40955733"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 23:10:12 -0700
X-CSE-ConnectionGUID: 5SDVtDqlTm6ui+MQX/dAew==
X-CSE-MsgGUID: m3McWSzLTU2QyHrrL2beFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; d="scan'208";a="94209069"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 23:10:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 23:10:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 23:10:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 23:10:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yto+TNCoK2we1oODQ8hRdMq1xGTXC6zB7E9bC3kvO4lK0iZ+y69dCAb22dyl/4SdiBGxG95ctUtUJkww7IQF0JvnruIIxzETKbwjJJe4JY7pP2oyehAVhXBOl/p37jRtIorKd15c+bycg4iEGnRbTWbMw38bz9cajPY6rd7MEC3BszC7+v1MPtoTOW4npWs3EbkRo3jvzoUTFqE+So/B6rDj2TUXYKu7PyUmHyf4eHg5fP8h/WwezaLJq+F/fGWgUT/WhLSLmN257SCq57ViGBs4SSLGR9duqgnKjVTcVhIyBKDm+MJxnQn0ZomDa4H2qBL09b7hVGTup0DVYCH2bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tsZ8rcifamSxC6YBcOWSzhSyNQ9pm3xZkINN5jKjtbY=;
 b=kXFNn/IG1t97PXl9l58PBSCY9BW6cBofQpGDuU9vkzCvKBl0CkkzYEMDfuzIBDa7bCanb/f3WyH5JTkFdHv7LAGV4ANgHJOA6tEG6e2YL3IC5xLWFp4XluKhHia0x9FO9+GGYDI7QYNJOPEIWeUItnlOZeNtGRaSQHOAPnW3j41iH/H107QbC8V5K8vNQp2Qofxs6DcXHlfzWecbg7DqMnzUKziXvAg+J/OLhn1MZofRGSo4Nl/N2sG4Zy4JANTC6cS28WIqil/7gTGSvr0R12lUpOsSiZZf6b2luKK08d7bVjCEEDy01gL+eDzhHzCSrZHXIHZEn9RAHJ7cY5My0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SA2PR11MB4969.namprd11.prod.outlook.com (2603:10b6:806:111::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 06:10:09 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 06:10:09 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Gerd Hoffmann
 <kraxel@redhat.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH v4 3/5] udmabuf: fix vmap_udmabuf error page set
Thread-Topic: [PATCH v4 3/5] udmabuf: fix vmap_udmabuf error page set
Thread-Index: AQHa9G+SH72HGb75Ek64fX/MKxnz57I9NIXw
Date: Thu, 29 Aug 2024 06:10:09 +0000
Message-ID: <IA0PR11MB71850BEF2982A75E45552F3FF8962@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240822084342.1574914-1-link@vivo.com>
 <20240822084342.1574914-4-link@vivo.com>
In-Reply-To: <20240822084342.1574914-4-link@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SA2PR11MB4969:EE_
x-ms-office365-filtering-correlation-id: 807826ba-34e5-4936-56e5-08dcc7f13c9a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?LiSNBfy9hvoKqJ0h0yLhniBSaIV4KLEhvmpjMAob7VSewcaggmD8wKsQYJ?=
 =?iso-8859-1?Q?EuJ99YB53P2P2kbTz/tLIDUeVjhemO3zaNtz2TJJ3y6Wf18z7+jRPwOvb0?=
 =?iso-8859-1?Q?WPjuC8og9OiDCE4MpRLFFn3k59+17ljhNJH4nyCOroiAnKRRnRCYmhU4+7?=
 =?iso-8859-1?Q?NnSGCCbI04Gd5XAkBjOHZT02AGHHEN1T1suzVWz+iatB98uAr/ZvQMfad0?=
 =?iso-8859-1?Q?L4CVXU8XaFJp1tj2DixHuSwG/2bX+G+/JvwNg5TXt0axqd7zmjcqisZ5zz?=
 =?iso-8859-1?Q?tWjTJiSN1UJmFS8kH3ksXl7cgfy8KsMKvh6Xkxv5G/r8py+BWKhrdAu9+j?=
 =?iso-8859-1?Q?EmJQJok2ih9Ah6fadqyWmgtms/aPhIfzpwNWbApxHE42sauOqlprRBrNBt?=
 =?iso-8859-1?Q?xqQLqGYaZAxz2ZxNx8gSvz7zRFE3H+ZY37ooYpOS6dnhSQHujO65ZP6JJC?=
 =?iso-8859-1?Q?8R3VG++iSiiGUssat14HL7p1GOK5pI0oeso9vzjo7QC5v86/X9mIsxTTtd?=
 =?iso-8859-1?Q?1xUgM+G4ETFEQcFxk+26+FhjEUtHJ4ww/st7u7QbXnLUQQ0cWynUsCyT53?=
 =?iso-8859-1?Q?VY1ois6t5OevFJQB3cdKs7NkZxkWEb6AMPgPTdQ669xLFoKst6fgBqRNhP?=
 =?iso-8859-1?Q?Tz+6HTxE3Gf1S5TGLJLjQDmVLiHqZ6jWUfD2Hz7EGuuTLTaRenBmo8Lvre?=
 =?iso-8859-1?Q?txAX720QGaT4pxaWH0YLUzNDJRpqOw+/axvNJif8BqcVlvk4+bN0xqvgk9?=
 =?iso-8859-1?Q?AOqLYwpr2B76No/kth4O/dL/Kq7pY/RP1eQ5A2nmFenlIfWuCnva+OHh86?=
 =?iso-8859-1?Q?UbtEhD0cF8z1tYC/U27Wn3CUrKRsA5Z7pwfa6lhp1LCgr4f/5DopX+bc3W?=
 =?iso-8859-1?Q?K5xuR8Y45Cj05Ay2ly5yzkqJKgo9Y82CEyuEtdNsTQMb9EMLJFeO56mXAb?=
 =?iso-8859-1?Q?dL4uDc8oGNP2zDApOH6xNysbPqkT8EUu27LRBws95MzUfcehEem5mCMLj2?=
 =?iso-8859-1?Q?5TkWYh0sIJzCg7BmDF6r3xhFTuRU4N5YNKwVCYJseZU/pMwnU1Ely3peFE?=
 =?iso-8859-1?Q?yM1wwR1uJbx2jPQeq+fl47TOb7XbES0O0ygCPHHw9uMraJBFcftMbdV9+Z?=
 =?iso-8859-1?Q?lz65RYqXRziXgWp7GoIr/WpYyT4JJ6XFDIxXFH4LHgvwpOlWTPq2YUxgm0?=
 =?iso-8859-1?Q?dD+17/GXMu4MgQK5FQ77KhjVMJv7FcMWgSmaUwj0xinMa/Rq50VQRjpI5e?=
 =?iso-8859-1?Q?MR6rIpK/ZMY2XjBCpkjJdfLMd9akb3xZr5VwFBFZZMCjv3KKyHpWWegAva?=
 =?iso-8859-1?Q?KKZ1hr6Ec2gPwdIVs8frzlpn+J2nO4Dbkpbq+CF6uw+ckAIZ9Rq9U+iUUd?=
 =?iso-8859-1?Q?LHvnnva6kbzkLLkv/y2aH6A9p723GphcUZ0JMJNvobPlpvGDP/C1XIr1B7?=
 =?iso-8859-1?Q?bEfCJ6eHYx3dPdeYn+m5RnnO4iVawe/vxuM0aw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?oBLtxYqUOg/N/jotmqNGYzNZ9iE3uXc4HLX0WOC3k7je8EHbmxAsTFZPpu?=
 =?iso-8859-1?Q?xl0jDMPx0g5mUdhuwpk/ComAy4zAouGE1VfOY+ZxPZe3xuGkaoj7ZVbXD/?=
 =?iso-8859-1?Q?HNFu0NbEOcnLJNzwB/t+AI77LYkCdrmBdYVNRnHTI0z/sP8u4ypsoEu1Zx?=
 =?iso-8859-1?Q?S7o1XOazgpLX8iS1BNoFDkbwfzFXiQukpEFgDd3ztVPuWpOOSy/SGuX9tJ?=
 =?iso-8859-1?Q?1A8QoRZO2kM050FUaYX04leRkXYGbsYK3ZqZj11r03+cbUN6PHr3ZOx7Jw?=
 =?iso-8859-1?Q?A7mS6qYO4saf681nU6U0UDLXzsh+HesM1bdTAHxgZ+eNECRv+6ccUMdaNa?=
 =?iso-8859-1?Q?dN1h8a/RD6Da/HcKgwUS5ahgK3+o1oky7LYKHGXMckhHNbucg6vw7QxnuP?=
 =?iso-8859-1?Q?W5f5wSz0UW8zw3lC/V/5Er1/rTjZNAyOwM1Y9Q1CdQSwvLnsbyI47D9Mtj?=
 =?iso-8859-1?Q?0OfOa0ReDJnfiZfyh9hZxHNMZ4bpXhZ7WtM5nOtMOFVHnqFtE+0L3sQBN8?=
 =?iso-8859-1?Q?sp9l4zKtzsR7eNOIWW2271LHiRU6ZNvTbWDn0uhFHZ1l2xw30WaE1dkoaI?=
 =?iso-8859-1?Q?E/KOACxz9x68yO6wA79gbMbc+bcZj10hZUdsztLFE2ckc38sqAQoo6IZRc?=
 =?iso-8859-1?Q?+FbADnt1YF9ZKi0+luJkG1JlSInRuPQC1bQglqiEBj4AbAzGNVUfwTZCXE?=
 =?iso-8859-1?Q?MlE8F2WpuKDtJPsg6CFoUUPSeY9Pq5EceE6JG6CXOwNJyC5uOceR1lTBN5?=
 =?iso-8859-1?Q?B2R4wMMmR4uHBsWGB9+ypw0r7BwUjBIp4baM32PYg1U86AYV9hTPfE5OYs?=
 =?iso-8859-1?Q?KZmwZyZR+DZSYSMuHR6ccvdExgzALDTA6YP0aRdmcgw/8xRKfsNUnin2HX?=
 =?iso-8859-1?Q?Nj688Ot+CPvyIJvTiOlTaVVVNZTZZoOgBjuE6cLi5QZWBo2EjMsmI67+Cn?=
 =?iso-8859-1?Q?SlHdPBc7AYqH2tHLHGNqz/fDTunKn7lKOHO0bUSqdzMJ5VPbt5mr+EolBX?=
 =?iso-8859-1?Q?8zUPd7C3yfM3dJfmIC59zPtdHBu7GmURwDFhsrhAGOlfjCSbUIAiI+HXvE?=
 =?iso-8859-1?Q?vXbnOGEGUNr1g4BU4LDPevZsl0+faoFe2qTbGHrNv063n5GDuSq8s2lBkT?=
 =?iso-8859-1?Q?kXDaPZYNA22p18kzfIyFK5fS1apUV5shQ8bAtAjscn++aFdhuiZMq5FQLH?=
 =?iso-8859-1?Q?Si0D9agm+VcroVKmIsf7c10mbsd6HHhEdKGLQmf18lyMiEgY8P/tcOaKR4?=
 =?iso-8859-1?Q?7EG7T6MuFkGz8wBIs6gARE7DuvgaA/T3m0xs+s/Ry97PFyJkDoyYiXsWVu?=
 =?iso-8859-1?Q?xGpIOLG2TWvn3Pu4YchV2hAXjSXpvt+qUD9rp0t4U8KuPup49FDaOj1cKj?=
 =?iso-8859-1?Q?G4JeGCmTUeJZWyaFAxmggg6MgN78/V8bzhqKBEn8hzeWTZ7GYK6r8LViyt?=
 =?iso-8859-1?Q?ycWBZ5pS76CaFi1erxNiU51ixUDPW+VXnBl5xIGteR4VSgploCdODSNavX?=
 =?iso-8859-1?Q?cM702tKTnOWLv+fyO2m4ZXeEXW/KmiEs/OzaBenol1MjkWIcKCJy3qnN/z?=
 =?iso-8859-1?Q?JAKluBdObok+VY+RKhMUOUSu592ouVxx0flfnP9jMvYNSwGBBK/Z+Gy6rD?=
 =?iso-8859-1?Q?uEzvTiyPwVklapgRln70GQxylOJbz5xzUV?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 807826ba-34e5-4936-56e5-08dcc7f13c9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2024 06:10:09.7461 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t/xwug9i8NGc8UevPueffWYVstuh0KFXPmYtE95mp30cdOJRoX0FG0rofs6wFSQkls5WPk61OcC6Om1HVPAZpch791H2Tkcp53p4MgXEAmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4969
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

> Subject: [PATCH v4 3/5] udmabuf: fix vmap_udmabuf error page set
>=20
> Currently vmap_udmabuf set page's array by each folio.
> But, ubuf->folios is only contain's the folio's head page.
>=20
> That mean we repeatedly mapped the folio head page to the vmalloc area.
>=20
> Due to udmabuf can use hugetlb, if HVO enabled, tail page may not exist,
> so, we can't use page array to map, instead, use pfn array.
>=20
> By this, we removed page usage in udmabuf totally.
>=20
> Suggested-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Huan Yang <link@vivo.com>
> ---
>  drivers/dma-buf/Kconfig   |  1 +
>  drivers/dma-buf/udmabuf.c | 22 +++++++++++++++-------
>  2 files changed, 16 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index b46eb8a552d7..fee04fdb0822 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -36,6 +36,7 @@ config UDMABUF
>  	depends on DMA_SHARED_BUFFER
>  	depends on MEMFD_CREATE || COMPILE_TEST
>  	depends on MMU
> +	select VMAP_PFN
>  	help
>  	  A driver to let userspace turn memfd regions into dma-bufs.
>  	  Qemu can use this to create host dmabufs for guest framebuffers.
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 1bad4576d492..0bbc9df36c0a 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -96,21 +96,29 @@ static int mmap_udmabuf(struct dma_buf *buf,
> struct vm_area_struct *vma)
>  static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
>  {
>  	struct udmabuf *ubuf =3D buf->priv;
> -	struct page **pages;
> +	unsigned long *pfns;
>  	void *vaddr;
>  	pgoff_t pg;
>=20
>  	dma_resv_assert_held(buf->resv);
>=20
> -	pages =3D kvmalloc_array(ubuf->pagecount, sizeof(*pages),
> GFP_KERNEL);
> -	if (!pages)
> +	/**
> +	 * HVO may free tail pages, so just use pfn to map each folio
> +	 * into vmalloc area.
> +	 */
> +	pfns =3D kvmalloc_array(ubuf->pagecount, sizeof(*pfns), GFP_KERNEL);
> +	if (!pfns)
>  		return -ENOMEM;
>=20
> -	for (pg =3D 0; pg < ubuf->pagecount; pg++)
> -		pages[pg] =3D &ubuf->folios[pg]->page;
> +	for (pg =3D 0; pg < ubuf->pagecount; pg++) {
> +		unsigned long pfn =3D folio_pfn(ubuf->folios[pg]);
>=20
> -	vaddr =3D vm_map_ram(pages, ubuf->pagecount, -1);
> -	kvfree(pages);
> +		pfn +=3D ubuf->offsets[pg] >> PAGE_SHIFT;
> +		pfns[pg] =3D pfn;
> +	}
> +
> +	vaddr =3D vmap_pfn(pfns, ubuf->pagecount, PAGE_KERNEL);
> +	kvfree(pfns);
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

>  	if (!vaddr)
>  		return -EINVAL;
>=20
> --
> 2.45.2

