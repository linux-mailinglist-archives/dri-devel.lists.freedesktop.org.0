Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBD29452B9
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 20:32:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEB010E028;
	Thu,  1 Aug 2024 18:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mNUMVz2x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2CF10E028
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 18:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722537157; x=1754073157;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/pRm8CxDl6Itcr/E48/VgVX553gCT/wu/rj+OgluKRs=;
 b=mNUMVz2xRR6Yqe5fa6j9D6b0qLMZaNcQ97xggagkiQx3PAVCBeUJVanZ
 RBA07MCWZuAhJDD3NN7ZKmNRXU/F1w9nHRIxWQvV5Duan6gGQVaBlqYXI
 to2m0sXkuxnrs+Etnu5nTRuk/TFdrYLLnntVGx4zhJbNT5kFzMC72vqsK
 3s2j4K7hzrCHleAbczs6tDeLiBOToLwAQrEec6scZ2aWUob+NLCBsdBob
 /sXnfVpJ1vicsSUU3guJj2inUtmiq2H9qpK3x9LNORM2+oKXWr+i/1rPA
 AJntLaG7NwL9jUSQbIwqPDtK+S5iBOBFwUf91N9rmW47YpQw9FDuyY4nL w==;
X-CSE-ConnectionGUID: wAQhPggSTduVIRUuubQNcA==
X-CSE-MsgGUID: EdhTrBRYQUS/7YEsWRIDLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="24290505"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="24290505"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 11:32:30 -0700
X-CSE-ConnectionGUID: ftYxphWvTMmfUebLyhaHOQ==
X-CSE-MsgGUID: Hq0p41wZTQ+S4oTcd4eUDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="55057681"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 11:32:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 11:32:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 11:32:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 11:32:29 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 11:32:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e6kValQcX5lPPet90q6RbRejrsDDnDY74liJweZeUbUfnwHpKB9ig6Kihif0cYjTpdVnzd3kPXrOKd05ZheOnGpguQaBJKyaTdMxrRIZJf0VAM0x/0/fmdleySjzCVlm/ODYnkc22nZcbIHlQvyWZJS8hBQKZt18iIa0KX40w3/dz0TyF4KBXQrCLDzLBFNNlE649O/52tNymmXBipzs5ZQdSRb/WXVOgHppD+GiMBd6v2TCKS8y5TR++Jpg4Z2WgGwBekXgLk/PFT6IoD9j7rtfp8RY4d9tbpg3b1GuUdsdgPFjOBfevhYA5s51BvwDAUWSWgr3L8yumnbNqka3KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DCppiaJJSG9IIhq4/zxDat/HAuPxhO4r9XdBeKVJOE=;
 b=JtoVVNSTIOFn6ZKjZIVJaaRiQ/XL2D5Zl/JMHCVVWifJi/U4sC2JKM03KqM15IEN4rK7A/tkyzP4fO3WAUY3dYPG9i4WOgq/kShagSDCSqmN6g7PkhoP3rX6cDcxZCynLpmPaYOy2/pEm9q6SxOXbNZHd4FStkIvVx8hpWNw+Xc+YwcmwgZlL+BHSFB/sgUrHVW/IcHLNEW7ZASGgevDhy4xu1gqV+AqueO8wwtKrO2wOO8qg0HdM2+nrI5dETxbWWRc87rmUrYdYYwnB6DzLZ4beI9s6Yd8l5gNMeP3Ez0PSaOPY58GQLLyPQDcpi8Y+34NhQJ2P4LbNclg5MDIjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SA2PR11MB4921.namprd11.prod.outlook.com (2603:10b6:806:115::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 18:32:25 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.7807.032; Thu, 1 Aug 2024
 18:32:25 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Huan Yang <link@vivo.com>, Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <christian.koenig@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH 0/5] udmbuf bug fix and some improvements
Thread-Topic: [PATCH 0/5] udmbuf bug fix and some improvements
Thread-Index: AQHa4///5LN9XFZvvk+YHtmHcHOwMbISscug
Date: Thu, 1 Aug 2024 18:32:25 +0000
Message-ID: <IA0PR11MB7185EDB259502BC6937CE566F8B22@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240801104512.4056860-1-link@vivo.com>
In-Reply-To: <20240801104512.4056860-1-link@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SA2PR11MB4921:EE_
x-ms-office365-filtering-correlation-id: e8fe3735-f831-4fa0-bb5c-08dcb2584a96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?3gYBL1Py492iQzCl746MM87t4Lx7HTD4NtemHdPonc30ZlEyCRk2UPJZbC?=
 =?iso-8859-1?Q?cTyTu/RmHhmdEn0ee9OgY9M5EIz4XTJUKW83Sc0pon5Lqw5g3GWVz4Pkfk?=
 =?iso-8859-1?Q?u08k4/i4c+CQgwcxmvzKkYh/outMFXiNipDWtoFMM7bPvlszd/OjfNMWj6?=
 =?iso-8859-1?Q?OOyYBKEb4bpFlZ9hEBu43JLnSepFoT5mDwfgJ/fXtn9J7HLWfeb1j88hJW?=
 =?iso-8859-1?Q?s1bUO7Gpuwzi1hsNzOHH2pgzhZ3mtQsNVaOIOVyjMC8CxKnQ2LZkJTaDfE?=
 =?iso-8859-1?Q?wdAXqJs/HD4eW79d1/3rzyNEq1r3BYl3zcA+rq7BMsKdyVIBZsfV+skeJ5?=
 =?iso-8859-1?Q?7lS7dO5vfXFKFGbWmjKw7fRPGDpnGPHII1kwI9gwYhPq4Rfqt9KSgDCxl/?=
 =?iso-8859-1?Q?7EoX0xkZkFer4VtaH52yXSaEWqyTM6s+64QEDv6hNwXQH/43eynVAuVCNv?=
 =?iso-8859-1?Q?3/fdKLXERKNb27bjt+kS6kIjkG97fntoNesdGlXBdYPJ5Le4At0AT2LTFR?=
 =?iso-8859-1?Q?9LpRaQEDUHdgPfox0j89hv3n/hjqVxP//S9yptPUq6PdSoY1K4sd4rhmP6?=
 =?iso-8859-1?Q?DGwifJXoSrVs7UqDBbtLLaYnNOCL36dwGTAx0f3/r/4CAEf90JaAJf8fiH?=
 =?iso-8859-1?Q?72xsv3cPcSFtsj8RPp4ACS9UQ1KyefMXL2SdbtHksOHcfBDrqupawjVUJW?=
 =?iso-8859-1?Q?ZS0oqMsETZLpIYv26EsaIb7on/lCl+E6zmNnAGqoIR/ebxAS8ye2gCtdDW?=
 =?iso-8859-1?Q?g8MU4OK90h+5PHt1knsXGjJC/0b4QXX0YhbbOsVH+OuiKwTcE/5TupJwU2?=
 =?iso-8859-1?Q?BALj8mTWmqamgmfj0ESCGGJ1YLRT7XDoTEtLJLM1I10kK8PSCC3frd5lXd?=
 =?iso-8859-1?Q?9Ob6+WLpiSOIIlV1WY9lxdKBfCwgpDh23Z/ZgWlmxVc3US5fifeZg7ciZM?=
 =?iso-8859-1?Q?kFcY8tLnOdsOdVEJdk1ZpvW3R6r9NicMboI1V5RkWa8vV8UIJa+qWEwFgw?=
 =?iso-8859-1?Q?xQpxoeRN1g7KwL9+3VYWfpM3rIZF+o4sNw148Fl1lgPqxUBDTWCAqmdw+B?=
 =?iso-8859-1?Q?AkR70kx9J0Iq7UEATwnxs3DSsLlT3PpQ482dswtsCixRRG85FkpM6BGP14?=
 =?iso-8859-1?Q?tropfZ9yzOxpo4qWGtS6Anz1CcvEKIN3Or5Ejc3WpdDMfwkpbWbmbOuEeJ?=
 =?iso-8859-1?Q?pVgxlRkmRsU7lql7AoYp/sAbEZYMtAgoCwZkbthXgP2vQyAHdsYV/2hT82?=
 =?iso-8859-1?Q?szsPHgWBCC+D5O6YWc1UmmW7zEOvfZPl/v5SWQSwRayEr0XHxiPkiQUttX?=
 =?iso-8859-1?Q?fMNcekX0mLeGQlKlzJvwDeuS94yUPaGEdq9Cb3loSvbxErmpI/NVMqQzwn?=
 =?iso-8859-1?Q?EGIRVcS27iIGJBm0VCD1A9n6TVx9/m95IQQvKgPSjXN3luSfNldwo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?RNJrDst0wbkJAyGzA0P/7qYvn5Tu6QVBn+uekK4rk93rQHuYAXpH1eQipB?=
 =?iso-8859-1?Q?trj3KWs+A4JhXqrA7EfdsyeQSb9qbhX+HH3QGXAcc44fhoBL8nv8qe/6uK?=
 =?iso-8859-1?Q?+sviSSh0QLR2C6Lz17yLkBF8PTDR2hgj0mYvdTgkA/o2o4wptAFuohB7bh?=
 =?iso-8859-1?Q?zB8tmikJ7/d32vN9KRcO2L5kSZlHZTS6p+Aj5QBIfOBHX79giDzy7KBKb4?=
 =?iso-8859-1?Q?WV83kS0DaDIXt+ZF9VWz7XyfYK1fKyJWx/oVzD4gjT1Yv+a71sE275UC4O?=
 =?iso-8859-1?Q?qjJ5IMmX5zD5toixN2WHZ7xKFTXGjHUMlj5xb1jwK3chwQftpCC0o2lvtJ?=
 =?iso-8859-1?Q?1+5c8Qk/I+AUd9sQcZXsg4lDbQnvqfAKpArQzys2Y+4B54k8dWTpN6N54I?=
 =?iso-8859-1?Q?fRoch1ql/fGGvsntyyJqZRJNzLq80BXsj0FqRJCYuNRqKpaxN3ipzthbZk?=
 =?iso-8859-1?Q?Wm5F+s4xsTHX0wobZRcSJAJQMLhZgW9wcmlKcpZakAKJnkypx0q9U5B4CV?=
 =?iso-8859-1?Q?Z/6AYz32Igys5XiZO+UY01P1sIwSs/K1YbL/fEnruzN16qyqMWPdqbhTnK?=
 =?iso-8859-1?Q?rKHCcWa70AAKPEerQ7BOAfQ5FUYPcOi6g/RqQamiBpwHlQLWNogeFJwHey?=
 =?iso-8859-1?Q?Hv8O/LPyyuikdzdneBG0qlNW+kLaGJKvM0dVBPiwS3+c++iHJvA/j4KQwR?=
 =?iso-8859-1?Q?/1EThm8TtM8UtfwtqHsOXFCYAo/aTADxWjXEkCCILEKB17MD9HTO4vk+fD?=
 =?iso-8859-1?Q?tyrXEpW7f0bI0hKFdocam+pwtM0QoC3dE7HpuMjDwckaVHjKCkP834dyca?=
 =?iso-8859-1?Q?KarwggEgxaIUjshkWrJScHerf+v7BvflUUeiji8WsHlIR08SstCKYmJPR+?=
 =?iso-8859-1?Q?gXIQl8CJqsiG/jJEHj97mwZLPAhx0POxT6UacTFz8mfKBDwP0nHK/3UveY?=
 =?iso-8859-1?Q?2AxiCracEeaCYzOze1Ovl5YV6S3oOP0V/hYTd7BmAl4PQVk8kUL+dCvOBj?=
 =?iso-8859-1?Q?KZQnAkdxx6QITwk/t0OBow9BQ+pAg2WPJBct9o+nRFLpYCxKSeqlgJcmcJ?=
 =?iso-8859-1?Q?E2g/25mhyNWqHQJw+YqBAkq1Z1PlF0P4sqbZazEDhXdcKZVQIAeBfLfNLx?=
 =?iso-8859-1?Q?0CnwAVJG4Pax6d3blPjmtBlqrerWyu+TS8jfMGO/m44k0O5TRerbkAyHNA?=
 =?iso-8859-1?Q?vStEkZRZgbo8rC153KjdHSl+ZNtetAneLKTI+IGbnPkQpeBVTN6fMTVard?=
 =?iso-8859-1?Q?zpbRFGyVl9ybRwRl7CCkVO8H2zPWjPhWaZZMdN4gWa9H7nNJYNu2/YPiO7?=
 =?iso-8859-1?Q?CngEV+rY7S1NVHz1rFxliHxFsvGP468F76ha2nmBKGwRvztNWmKqLKCiGt?=
 =?iso-8859-1?Q?x8d9FmDZomUmBG3/0gqOfZLDEkZAqR5PY/S439sj/SzVUoYvGoxXZV/SFY?=
 =?iso-8859-1?Q?xkWS7g43Yf3OZ3YKV1vjGOeDJIbRLfyW2Adpycpi88F+Z1ZHvI11RsC5Wq?=
 =?iso-8859-1?Q?+MdmjUCENf8MAvXTTh1TWiNz5v/8IntDkwBNcICk9L4X6DA1ljvhrKJ6cw?=
 =?iso-8859-1?Q?dygU9fAwkop9bctmdMTjQWx5EqdVZxJ9KqTcCSYMU3M7y6hW3nCwWNYXq+?=
 =?iso-8859-1?Q?8s5w08kqEeLTDznrJKVu8230ASTJzl8mio?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8fe3735-f831-4fa0-bb5c-08dcb2584a96
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 18:32:25.7582 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 57QNouegtvDJCEIZG9tT0BWp5rbTjwvuRpxZyj90NRwjrZLxxrv3FGv0dbCXcE3D59HmEm5cUkP3AdVmDztwmMk/fT7cQVpBVoH1Zg6ToSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4921
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

> This patchset attempts to fix some errors in udmabuf and remove the
> upin_list structure.
>=20
> Some of this fix just gather the patches which I upload before.
>=20
> Patch1
> =3D=3D=3D
> Try to remove page fault mmap and direct map it.
> Due to current udmabuf has already obtained and pinned the folio
> upon completion of the creation.This means that the physical memory has
> already been acquired, rather than being accessed dynamically. The
> current page fault method only saves some page table memory.
>=20
> As a result, the page fault mechanism has lost its purpose as a demanding
> page. Due to the fact that page fault requires trapping into kernel mode
> and filling in when accessing the corresponding virtual address in mmap,
> this means that user mode access to virtual addresses needs to trap into
> kernel mode.
>=20
> Therefore, when creating a large size udmabuf, this represents a
> considerable overhead.
Just want to mention that for the main use-case the udmabuf driver is desig=
ned for,
(sharing Qemu Guest FB with Host for GPU DMA), udmabufs are not created ver=
y
frequently. And, I think providing CPU access via mmap is just a backup, ma=
inly
intended for debugging purposes.

>=20
> Therefore, the current patch removes the page fault method of mmap and
> instead fills it directly when mmap is triggered.
>=20
> This is achieved by using the scatter-gather table to establish a
> linear relationship for the page. Calling remap_pfn_range does not cause
> the previously set VMA flags to become invalid.
>=20
> Patch2
> =3D=3D=3D
> This is the same to patch:
> https://lore.kernel.org/all/20240725021349.580574-1-link@vivo.com/
> I just gather it to this patchset.
>=20
> Patch3
> =3D=3D=3D
> The current implementation of udmabuf's vmap has issues.
>=20
> It does not correctly set each page of the folio to the page structure,
> so that when vmap is called, all pages are the head page of the folio.
>=20
> This implementation is not the same as this patch:
> https://lore.kernel.org/all/20240731090233.1343559-1-link@vivo.com/
>=20
> This reuse sgt table to map all page into vmalloc area.
>=20
> Patch4
> =3D=3D=3D
> Wrap the repeated calls to get_sg_table, add a helper function to do it.
> Set to udmabuf->sg use cmpxchg, It should be able to prevent concurrent
> access situations. (I see mmap do not use lock)
>=20
> Patch5
> =3D=3D=3D
> Attempt to remove unpin_list and other related data structures.
>=20
> In order to adapt to Folio, we established the unpin_list data structure
> to unpin all folios and maintain the page mapping relationship.
>=20
> However, this data structure requires 24 bytes for each page and has low
> traversal performance for the list. And maintaining the offset structure
> also consumes a portion of memory.
>=20
> This patch attempts to remove these data structures and modify the
> semantics of some existing data structures.
>=20
> udmabuf:
>   folios -> folios array, which only contain's the folio, org contains
> duplicate.
>   add item_offset -> base on create item count, record it's start offset
> in every memfd.
>   add item_size -> base on create item count, record it's size in every
> memfd.
>   add nr_folios -> folios array number
I am not sure if these changes improve the readability. Instead, I think it=
 makes
sense to add comments to the existing code.

>=20
> So, when building the sg table, it is necessary to iterate in this way:
>   if size cross item->size, take care of it's start offset in folio.
>   if got folio, set each page into sgl until reach into folio size.
>=20
> This patch also remove single folios' create on each create item, use it
> be the ubuf->folios arrays' pointer, slide to fill the corresponding
> folio under the item into the array.
>=20
> After the modification, the various data structures in udmabuf have the
> following corresponding relationships:
>   pagecount * PAGESIZE =3D sum(folios_size(folios[i])) i=3D0->nr_folios
>   pagecount * PAGESIZE =3D sum(item_size[i]) i=3D0, item_count (do not
> record)
>   item_offset use to record each memfd offset if exist, else 0.
>=20
> Huan Yang (5):
>   udmabuf: cancel mmap page fault, direct map it
>   udmabuf: change folios array from kmalloc to kvmalloc
>   udmabuf: fix vmap_udmabuf error page set
Do you have a test-case to test this patch?

>   udmabuf: add get_sg_table helper function
>   udmabuf: remove folio pin list
Please run the newly added udmabuf selftests to make sure that these
patches are not causing any regressions. And, we also need to make sure tha=
t
the main use-cases (Qemu with memfd + shmem and Qemu with memfd + hugetlb)
are working as expected given the invasive changes.=20

I'll be able to test and provide more detailed feedback on all patches once=
 I am back from
vacation late next week.

Thanks,
Vivek=20

>=20
>  drivers/dma-buf/udmabuf.c | 270 +++++++++++++++++++++-----------------
>  1 file changed, 148 insertions(+), 122 deletions(-)
>=20
>=20
> base-commit: cd19ac2f903276b820f5d0d89de0c896c27036ed
> --
> 2.45.2

