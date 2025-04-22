Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE42A95D3A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 07:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E32310E01F;
	Tue, 22 Apr 2025 05:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGqVL0ca";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2FDF10E01F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 05:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745298888; x=1776834888;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AhEK0iZ53R1OQf9vwshXTY2AGyL5d4x1RNbML+D3EcY=;
 b=eGqVL0camuhMpzrectVKYcAg6TXzmTkxWCSC7JCZ6jygV+3Gtg359O4k
 G5paH26vJIRdrZBDD9xD3sLkkSIhjya4oav3V//c/esUIdpPRI3TdwP2J
 7zySNgCsy0qmwPrME6uLG/bRt+QZM6INxjb77idJT96EUcFtELDXFKI7f
 cseOad/FQ87CkRXYIj2DZ+5rhQHuXFv2wK1w+lDPbZCLvHMn1MND+GY4p
 wDXZhkPxKOnd0cwYNOQs86pXEA5e5hQRklBStnsVryr5EVdsOClEwkP5X
 Q8oEurj6PPorLQhp5OpiugkMKmllcAKO3O+HcttOzaWCLeGIXnrRgT/zJ g==;
X-CSE-ConnectionGUID: yC5mWGoNQC2dHA8H4C6KZQ==
X-CSE-MsgGUID: ZEnFayfERImBIDLxgOfBKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46973719"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="46973719"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 22:14:48 -0700
X-CSE-ConnectionGUID: GWmKCQd5RUSGTlRFv5Fy+A==
X-CSE-MsgGUID: 0C4dUK5CRoKiB75NYFjQ1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="169108602"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 22:14:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 22:14:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 22:14:47 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 22:14:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bji5kkXbPOmcXaRbUoXMU3S7Gfswn5P7qrcvZWfjljJOY+cFwfYbAUcdG5WlhwRMmO30LNoqjTAh2iugM7eNriSKzSoE4bcKnpiJN5iO4p29ofXvF971rGnoGyqh4tllSvjzUb5+uSRcgLwxmjTfvW7dI9WmbYGalX2ts4v5FTgVSl8ebYRt4ld9c6mrY+Lpll661b/kWsRutueVct/TuLcQT8ylUIXIK4AaZ/KJZKQmwSRib72MVrq9gduheniNPLhG+iE4zD3Z+bdvvI9KLdM/bU9tZerIhlK+VtYCoEVR/tyQpciXSKuPyPj1C19GdB6g+Q19UAIhHj0BIS0bcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0EvpvraBasdGVzeW6PEm/1acMKN4fTL7Hms/LRBujc=;
 b=HPM7muR3Pwzttqj06LYZOqdkPJsfzVcl9OsoCG7gGeFH04gpA12veQ1HIXzcOjLjY1mHTOLZ2yWK6HDdpKP2LzPdjCDNxECxZiFOUfzLkvyQfegGeF7jzlMngd3S0nnNMK10hp0KBb9wiq1figoAWpKSc9kWcK9EZyxLrXAFxSsQ8OmOZoi7lLEORsvB5zXhYl39b2DPS1k+39YFo94hBE5EgX0DGkJf1CYU3r8wCEwGJZ7nGkRwWGCYV7PayN63zgmuKb7ztgjK+RntFZTQ4XYu0jBjCQI77fDvnNB6cFyv4wewnexJ/2w7Haeri45HyLCkE71551gnYwIbVI29TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by BL1PR11MB5977.namprd11.prod.outlook.com (2603:10b6:208:384::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Tue, 22 Apr
 2025 05:14:43 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 05:14:43 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Dave Airlie
 <airlied@redhat.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>, Bingbu Cao
 <bingbu.cao@linux.intel.com>
Subject: RE: [PATCH 1/2] Revert "udmabuf: fix vmap_udmabuf error page set"
Thread-Topic: [PATCH 1/2] Revert "udmabuf: fix vmap_udmabuf error page set"
Thread-Index: AQHbrbTOcLFcE312oEOhmpPGKi4vsrOursgA
Date: Tue, 22 Apr 2025 05:14:43 +0000
Message-ID: <IA0PR11MB71852A481E8A99C9380C7317F8BB2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250415031548.2007942-1-link@vivo.com>
 <20250415031548.2007942-2-link@vivo.com>
In-Reply-To: <20250415031548.2007942-2-link@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|BL1PR11MB5977:EE_
x-ms-office365-filtering-correlation-id: eeedfab0-fc49-4a15-dce0-08dd815c9749
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?xVBdjylo0aUOaIOmcroyptlre28IobysnuxK2pPHrLtVwvj8pm6gCIXxPE?=
 =?iso-8859-1?Q?DYzDMVMSVzhUsA/XWdeWboKBM8k0fXMOiJTAndZe2vDHrSap5h54dRF+M/?=
 =?iso-8859-1?Q?BWHbHPoqOS+2V9SFunqh3LmV0mkej+dJHVwMUdGOuJcrZ00qNEvuujLadl?=
 =?iso-8859-1?Q?JVTZqLDmqNb167VY4yV84b9gRjZ2zXGBJBoqizRtcQHn2lVoYGL1FcJzcz?=
 =?iso-8859-1?Q?KjZrDrxPuav2LFgCyVaOKCzbARxadCvtGBTls8+3ahc2wziqllKpVHn1Kk?=
 =?iso-8859-1?Q?jNJp/Z18Yz22YPLUexs/ti17Nred9hr69AL6I4Ur8tsKJ0PwZkTcN2cpFw?=
 =?iso-8859-1?Q?fFR8p8K3qO9o/akg93u0sjE9WD5LQivYNcPKQ3PHAXGzW4E3FDW/3Bu65A?=
 =?iso-8859-1?Q?aFik0iXlAqTiWvDfEmH15l7PjshSwkRQZsnm8I2kWU0g+a/bMrf1GJ3jRe?=
 =?iso-8859-1?Q?+VSrQ8Px/fCMzNQjbTIpdXwE6W3e2NArNOE3zsgkPZzkjQr0iRcw/ll5G5?=
 =?iso-8859-1?Q?Lz0udKgJVY1XEYuX0DMuUTP7ywE1T5ACilNr80lcI3eb1Dnk+pOIa3MTwp?=
 =?iso-8859-1?Q?joTySxMo14cC+sEf4gKXPpI33mgF8p2/SFAJiTR8/sUiJFJ3oxfTcGNLTj?=
 =?iso-8859-1?Q?Md07tExmUN4bywlG6MjX9ldk1cGLSinEOofbMp923SuMYpc4MsAwOQQ+8p?=
 =?iso-8859-1?Q?9SMEVK8OviM7+xR9RTWrHmblQ+YGnPA1xpZN766Onfvgf37EsK/GRsi6QQ?=
 =?iso-8859-1?Q?F+O2KrHSzXoxjyXirucj3VNCeZQfBI/BvR2AhZOTecgsy150D2GiLDmZfg?=
 =?iso-8859-1?Q?BIMEgnMOjrZLUsVoOZY1bgYmwQL4xUo6LsRsBv3/OdidXs/ns+oMC44bYu?=
 =?iso-8859-1?Q?UXuMWv+UiRu69OD/X+3WC3dEgl+3Bh4aqCmsu8L4Uf2yvlTl5stiErwcvI?=
 =?iso-8859-1?Q?T3V6C7S65GqGmr8CCTFxfwM1kGpjwtc8PkOn5VKNxr7VOnZXztGS3L/ifA?=
 =?iso-8859-1?Q?Yv6QwIKHHJiEINv0Lpcjy8Z8IGxZStWWCTRaYqerKqerACD8zr20ZXnlhM?=
 =?iso-8859-1?Q?3taRx1iOEVMWwKgs563D2Rx8LYmPfjI0uhl107ctPF2+9ROjdyN/kOeg/9?=
 =?iso-8859-1?Q?Q8AH6ohZxDiJVowT+ChCsLmpT8FxRngcrKbt1gT7Xuqd/rwpyFHIFqkC1t?=
 =?iso-8859-1?Q?AyTaaOG5zWzLBqCkVRc+WLkODbEOMjmI1zPpRuCnWN3vWZiDyl9wR9qHH2?=
 =?iso-8859-1?Q?mMZ/aK9oHdCXiHxJJDLonOF8Dy5kKNfDUERx/6JAM8zZ9VnvCYlD7g2ziz?=
 =?iso-8859-1?Q?vzWIzYmB0yIUdJGtgcOAvRfN6JifVQSeIMaj6MkV7Og/aNjIHP/t6ddwj6?=
 =?iso-8859-1?Q?AZD7D6ZWTdY9rnxS9Yo1X69i2g3Sg9OPJqAguGz0PL8Pa1txrv2mJfq6YY?=
 =?iso-8859-1?Q?W8POqRlzDl3abYSm6U3Ji3sZugdjXm5PSiRha+mcxR3q9JwS2Kmb/AEuLl?=
 =?iso-8859-1?Q?x9DrZ5RVTh6XFKR/0veXU7?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Ci9NVSzUgrIG2J2npn19SNjkTQW0oZ8ebQCuNvChHnBAui9OTLP4SVh+Kr?=
 =?iso-8859-1?Q?ilbFcCYkUVvR6iKBP1GJ+cB55XoBB+l5Djx/sU2LdS6xyRSdSCR2Q8n/iH?=
 =?iso-8859-1?Q?biBZsr5snJK5D5AJ/sZdw+OnV7HdaY6k3LmCC/eYe2JsSAX5Ku5W5fBYCf?=
 =?iso-8859-1?Q?+guq3Ar/eKB4XbFRAH4tRqFTDDlLtnc4/DAZmJV58ciu6mDsmmS5kqS2zE?=
 =?iso-8859-1?Q?75pBAgQncxuWPcfQM+NUshx/u2UeDqmKgbInJW09ER7dhgzfDv3Gw6vfLm?=
 =?iso-8859-1?Q?gRnFdrykZSyyV6Ztz38Dyr+9xMuafpk8Hoc7oT4sXLIj9pUVu/iqnTZIj/?=
 =?iso-8859-1?Q?Ga7fYIV7nrjobnQtvHnXwRphniSuZDAdkPQhqIutY+mKCZ9MyX+sS1Lb5M?=
 =?iso-8859-1?Q?mPzuck01CguwRhFnKiCmkQHtaSu/RPF3a5zDXQdOzO4i64NIi3JEBaf8Yi?=
 =?iso-8859-1?Q?Kr6PxKeAZdXx0kj/ob4T5RXKI/B2B1Gl6mJfY6CoUNrP3sQ1rskmxQe1Ck?=
 =?iso-8859-1?Q?CvscfLytTor9/t7OU8eFlhQSzc+txOTQzDWBApNR1BDjlzyswvyvn07Pxn?=
 =?iso-8859-1?Q?kvzJqDMSEWzSulgvf3Hh4eqrukyeEHMKuZ7xIPP/xKO/UvbKLDsGHd2kBK?=
 =?iso-8859-1?Q?8/koS0xEE5RkzkI5rkGwxenRsOcgz6gijQW04YMttZk8/mFWvlu3zwyMMe?=
 =?iso-8859-1?Q?orlsiZeBW88neWJ+HONtyOeOSVuLOpPmdrnUs5xg1NAD6DJ8chTiZNj6hx?=
 =?iso-8859-1?Q?fMYlgI4Xd2Ch2xtlVEZHoZ0ioeU6w1mtb9LuH0nXmEWPyyoNyVpmT25USX?=
 =?iso-8859-1?Q?P+IY8pZ8/UVQkrkbzB/tdcS4Cbl4bEHvXLAs5lQf8bqQNKKq25q3W5Kr+G?=
 =?iso-8859-1?Q?6qRMXDTxxXY9610YxhWUoty2t6/Gj+zPqJITtEryOK4SPIBjF26Tlob88F?=
 =?iso-8859-1?Q?OMd7OEpaMLEbQ2GwxEItrJJu5taLQLtk59PmE1Lnl1GRPYpX5SmDWM5Rjf?=
 =?iso-8859-1?Q?n1COudfkOiIrXQ/kVAMyYgSAwllSm95dsg8eugJ9jrsqm36SWJpkHBVqCt?=
 =?iso-8859-1?Q?8oxc8tHTw/QYz/8o+RdJr/B5dmYXlBUGAcqcBKdScJTF6W7gLvFHLbV3LE?=
 =?iso-8859-1?Q?id1Af6XeLitsThFvBiAFCSD1LS8xo6XDgoK3AcKkjcerrNX39Njxlz1BkD?=
 =?iso-8859-1?Q?q6n3IjruV12gfrVDpDbvjLXLdv0mO+s4DPZHE1zGzbRY8BOmboyMPBz/fr?=
 =?iso-8859-1?Q?CRkpqG9bpn4gmTBBV38jqKEAccbStf/67gnc1d4EaJrSJicZdFEqBoRDmO?=
 =?iso-8859-1?Q?3TJ9NWjPp1yRL737GQiV14pgCONg56Ks5U9XMST3zNjBwdcDx8Nk7jdmKm?=
 =?iso-8859-1?Q?V0fdTlHwqhW8qETocuKZMCX6dqH0oaH/XcV/3thl5z1Te1eQfrNyGFky9u?=
 =?iso-8859-1?Q?6r/yKtBbIrnJUC7Ab2lbVMYmir1PnWgaADxrMa1zquu5joCdmPmKM6KZ96?=
 =?iso-8859-1?Q?+qBNV/HydTxsakclt17LKwWURiDSDkO33w4bFenYz3xhN7rUgdOzOthRtx?=
 =?iso-8859-1?Q?7gZtY2gtAMGz00PLMhJZWmEnLUVdYiuqOqb77ujqi5cUzLg3plhJLcsC8K?=
 =?iso-8859-1?Q?CtdoOscsUP8M9dFVKHBozPbrhmOVPNfRnz?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeedfab0-fc49-4a15-dce0-08dd815c9749
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 05:14:43.1263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e43XYQE/2uWkPUA/8AUC902M8Ek5y6HDNIULiN0bkKIlaSUshYbyoNzCeV+zUpWjiQUi6tfZps3JtFK9Pt0V9UgxhVA53zQ4J9kXeF5yM7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5977
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

> Subject: [PATCH 1/2] Revert "udmabuf: fix vmap_udmabuf error page set"
>=20
> This reverts commit 18d7de823b7150344d242c3677e65d68c5271b04.
>=20
> This given a misuse of vmap_pfn, vmap_pfn only allow none-page based
> user invoke, i.e. PCIe BARs and other.
The commit message can be improved a little bit to briefly explain why vmap=
_pfn()
would not work for this use-case.

Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

Thanks,
Vivek

>=20
> Signed-off-by: Huan Yang <link@vivo.com>
> Reported-by: Bingbu Cao <bingbu.cao@linux.intel.com>
> Closes: https://lore.kernel.org/dri-devel/eb7e0137-3508-4287-98c4-
> 816c5fd98e10@vivo.com/T/#mbda4f64a3532b32e061f4e8763bc8e307bea3ca
> 8
> ---
>  drivers/dma-buf/Kconfig   |  1 -
>  drivers/dma-buf/udmabuf.c | 22 +++++++---------------
>  2 files changed, 7 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index fee04fdb0822..b46eb8a552d7 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -36,7 +36,6 @@ config UDMABUF
>  	depends on DMA_SHARED_BUFFER
>  	depends on MEMFD_CREATE || COMPILE_TEST
>  	depends on MMU
> -	select VMAP_PFN
>  	help
>  	  A driver to let userspace turn memfd regions into dma-bufs.
>  	  Qemu can use this to create host dmabufs for guest framebuffers.
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 7eee3eb47a8e..79845565089d 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -109,29 +109,21 @@ static int mmap_udmabuf(struct dma_buf *buf,
> struct vm_area_struct *vma)
>  static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
>  {
>  	struct udmabuf *ubuf =3D buf->priv;
> -	unsigned long *pfns;
> +	struct page **pages;
>  	void *vaddr;
>  	pgoff_t pg;
>=20
>  	dma_resv_assert_held(buf->resv);
>=20
> -	/**
> -	 * HVO may free tail pages, so just use pfn to map each folio
> -	 * into vmalloc area.
> -	 */
> -	pfns =3D kvmalloc_array(ubuf->pagecount, sizeof(*pfns), GFP_KERNEL);
> -	if (!pfns)
> +	pages =3D kvmalloc_array(ubuf->pagecount, sizeof(*pages),
> GFP_KERNEL);
> +	if (!pages)
>  		return -ENOMEM;
>=20
> -	for (pg =3D 0; pg < ubuf->pagecount; pg++) {
> -		unsigned long pfn =3D folio_pfn(ubuf->folios[pg]);
> -
> -		pfn +=3D ubuf->offsets[pg] >> PAGE_SHIFT;
> -		pfns[pg] =3D pfn;
> -	}
> +	for (pg =3D 0; pg < ubuf->pagecount; pg++)
> +		pages[pg] =3D &ubuf->folios[pg]->page;
>=20
> -	vaddr =3D vmap_pfn(pfns, ubuf->pagecount, PAGE_KERNEL);
> -	kvfree(pfns);
> +	vaddr =3D vm_map_ram(pages, ubuf->pagecount, -1);
> +	kvfree(pages);
>  	if (!vaddr)
>  		return -EINVAL;
>=20
> --
> 2.48.1

