Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6E5A95D44
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 07:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF3D10E4EB;
	Tue, 22 Apr 2025 05:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uq70kC50";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFDC10E4EB
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 05:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745299350; x=1776835350;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VLrS2UcX99zfEp8UHsTR81Q7ULSdDPB9Jb6+qEXhKTw=;
 b=Uq70kC505gASUsUAfZDyVdbWPcxFu6IWnomcZwz2nxe1TGPFMvRW8D58
 +rpeH+VU+yY8xamQmM3xOmJAZ8opOyGdYjMbwFAVfcwEuihCqWBbxLNMz
 LQ1yKsvkP1r+8GDKAZ8q50FHWeVkKziv63MhfWzgQ/jT9U4x5ncDissCu
 p/BUJFJ350Z4ierWwJJmnA6vEZ14xTFyAEq+nxQjhYeIkhxC6KAjapwUm
 lRLpkDgKlr2wf74045sXk/MfCt853z+y683me4zwF/xDS6Lc35mWzniR2
 ynt0wXeyuc2/KHU+j/j17CuGlZoAOMxnW3kl7PdWfzFqawYr2wMl4BPHV w==;
X-CSE-ConnectionGUID: 6cezAdzKTvaUXMokFyva4g==
X-CSE-MsgGUID: +QiJ2oStROS/tDK8RVcHyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46852836"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="46852836"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 22:22:29 -0700
X-CSE-ConnectionGUID: 1LNW/MQBRCCL++pxgP/pUQ==
X-CSE-MsgGUID: 9hazhXK3SLuu7JrcOspXnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="131902255"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 22:22:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 22:22:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 22:22:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 22:22:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2MhEp3ZszH9OmxnhDyjFj7KIoluGxsHRJKdH/EkqmJXWJ7Jmg/ngin6Butmk8DD+H8kVIDOmvIlB6BR0uzW1D3W8Av47VIoTjrV2rACXooUa59IUk414hzrcTyo/GmqvDPiP34fDughLxAlGa7NaqwIIzaGF/3uOkTxi8yHAL9dxPJEgxbRMxiRHfLz/vpM2fFHdMVJWJ8WzFcLMHFUs97mem7EWCZtvLmGKn1EabCxJWzl3piC4/AQa35PwTMFyooekncCqOxh4zRchwLCTIwvFmzU/vzUO3ZL30TN/8hSF5okQ/5G4aZgwCTEWKTVkR1dBodjcgg0Rb77T68hfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZqBvongslN+B19+l9h+O7o8W3e1DUpsYTNtFebb85ho=;
 b=G9FzFF7vqBv2hY8bLY6Rqrb3I8c0EMzbNHo4ZT3RqB8GLAXXgkTDTu+EE1oFfDLiQbJaSFuDxis7dCYr77Cy6sypyiYH8f2DxJE0ftvqboOButSrGilFdas8WFC7CQLjhRCgS+mlpWvFgqeW7piRpAdvpzkDBtNjFXjjNNocSmt5xn+s+G9sgR0HOj6gMaMCSjYXxaKpG/NGD9RQ9aVHvK0t4rlQb2OMHQfA2M3mIJ3szkrXg/6AQP5c3KASrltAW3em/2Zjuuy62i90b2jzYFnvpEEUky74JgGUZlavTVpqsduA8IH8R0UoniBmlJTMHrF0JMDg32DWFsAVMvv5iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SN7PR11MB6701.namprd11.prod.outlook.com (2603:10b6:806:26b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Tue, 22 Apr
 2025 05:22:25 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 05:22:25 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Dave Airlie
 <airlied@redhat.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>,
 "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
Subject: RE: [PATCH 2/2] udmabuf: fix vmap missed offset page
Thread-Topic: [PATCH 2/2] udmabuf: fix vmap missed offset page
Thread-Index: AQHbrbTO+SUK7YEs90+awIgExJW8wLOurx5A
Date: Tue, 22 Apr 2025 05:22:25 +0000
Message-ID: <IA0PR11MB7185796FAA2A065CBE4EAB37F8BB2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250415031548.2007942-1-link@vivo.com>
 <20250415031548.2007942-3-link@vivo.com>
In-Reply-To: <20250415031548.2007942-3-link@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SN7PR11MB6701:EE_
x-ms-office365-filtering-correlation-id: fd94a98d-1ea1-4f81-4ec4-08dd815daab7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?bvgr8EdH7fwcO91EJTBx6gSmqfG+PT3TD/umo34jRFQYIdchifIfF3EWyE?=
 =?iso-8859-1?Q?1cGLiBzjrY1uFnLVgC4la+IX6G04G0jcWt1sj8PmT1UDtvnUdWJobP0qKn?=
 =?iso-8859-1?Q?AGAuiyyOtsDX3fvNuosllOoRVgt3sPx1iYK34Buund35lS43vG6q0qBQIP?=
 =?iso-8859-1?Q?RDdlW8Lo7x6tl/GuAQMBN7Dcvj+XWCuLDCe19XINk274frDKsg8Yj5leFn?=
 =?iso-8859-1?Q?ztRYi452INNUXAL6JC4GYLu495m3FcJbRo68PdaNGQON9ZrquHtJy1SWWb?=
 =?iso-8859-1?Q?kEmnMg7vk9eer9opf/P1nyyfM9AjHWFJ0ocds5aIqrdla07A8dS0PzK2HZ?=
 =?iso-8859-1?Q?WFVhIH9R2wYQit/q5nxgW1OIzQP44kKoRYWsFoMZix4IWFyV185f3IHP8w?=
 =?iso-8859-1?Q?5JW+TKchHCeK4+UZNsPajOWjDd0kegCMuOTRRc8LcxJhDtDTeofkPxiWBC?=
 =?iso-8859-1?Q?q6P75SsffZHHJcIO/uRt4C5XA+ZRisKQOUMvbDDd0XIdm4NKXydHCg7fuV?=
 =?iso-8859-1?Q?cZU9V6vpbRbUXtRbv/Q57C05Es5C8+XWDQOUcevgHsarIgqo6L3btgc7oq?=
 =?iso-8859-1?Q?4UlpTb1k+fpRVIoh2MT3bo8bn6HXJ+KS0glwpgwrfMQ0pUPahfAAom+KUZ?=
 =?iso-8859-1?Q?pjnjtyZ8HCGR3OsWovZn+kUu/W+BoQPSiqCsDBf2FJu0UiPaTM+y2ZqUqg?=
 =?iso-8859-1?Q?Ztb1kR0+BK86RXw95a6sXs+UMGvHUY4mIaMIE+h+9ABE9fxVLBRpK5FXNV?=
 =?iso-8859-1?Q?DV0rt5OMCVZEd7IeP2vY9XZmlRmlbE5X7GsFmGEv02vB3CwBKUsgNeqY4G?=
 =?iso-8859-1?Q?jYw27EUi42vwynhx+0H3CEJK1P5YjEWnGoxdK6jvek5aIIpoYSae4rxX/u?=
 =?iso-8859-1?Q?ccWHU/B6VLkqwGLReGFkYFDU7Ofz/LDU0Q3uzQKr1dD3QbA7dWfEUJ5/TF?=
 =?iso-8859-1?Q?PJhjWx2hoz0RfjIwUKN9HMk2FuIStfvyS/9YIh2DT7qV7BI9FTEAS25ZB3?=
 =?iso-8859-1?Q?D0GkPEzUEAST62hmj/A57AGBySPFqOF6KRfF3TMNccdE6CkxxQHqR3SwBH?=
 =?iso-8859-1?Q?08I5lVnnFoVCdfBzze7qbHSop0U9L36WmWBYKNb1EN47VZ4PeyXESNcD8c?=
 =?iso-8859-1?Q?i/6yWNID7oeqqlyN0vnVPEgAy2a+6S/U3HimouukFwxPDAaylR207IPvEX?=
 =?iso-8859-1?Q?WjTY40VmRZchLx5gxsxSB/o7GXIKWqY25YivkyfXqIL7u7psA20GaBPNkG?=
 =?iso-8859-1?Q?1uP6WLgBUsMwj7ldGgL1ajbHOYmfd90n6NUcN5r41xXBViqUeLJDLyYY/k?=
 =?iso-8859-1?Q?ckWI+jFOAKFNUsmoMPc4+qxVnRrsLtpAwW6c+Ej1YawA7WblVddrbS7cBg?=
 =?iso-8859-1?Q?PXk9CK5/HvOZKHzVBLK2mw7Lpz+odWAhZwxYibXoZma/2s6/BcgOWNmY76?=
 =?iso-8859-1?Q?coucaLX9FYjXjNmI5D9mkhZwQanfYiVfmCcE8PpYDwswbYKpDY1cni5Vaj?=
 =?iso-8859-1?Q?To1XjNpXMGfi3FjQAxNxwWsCDAf3Os3ijZ3pWyw0AtYUOI7KNXlO+W7hmq?=
 =?iso-8859-1?Q?gqmq3R8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?OOPnwp8QUqiIOOXRl8p2P5KRDKGpwlK9HDVHhYwD8dyt1FJEV6hA//wnLp?=
 =?iso-8859-1?Q?tOo0kuVAcrbjEyLPBOeXdSyGshJ9aukg21TiLJA3Z4jEbN0T0nivsGHQV8?=
 =?iso-8859-1?Q?u9FL1sXMNdbnKICMGNh/6WBInDgRl1UuP5xymTBBXCUG4pJhC1M5FosZXI?=
 =?iso-8859-1?Q?KOQwfFFrQfDgNovTDVL36zrzRO6WMBaaQTsv+ZPiouph1DhPkCNuJ1L1ja?=
 =?iso-8859-1?Q?mQzI30fr3R0kast8Rg9DpeiLSpSv4C7zJItGH5+ptMHQc3qg7bM8CHlm/w?=
 =?iso-8859-1?Q?GUD8pMcbbeSpG1rxx0hu7vLygyZH2dNGpsIi6H5zEiiHp46U2VU7bSSsEN?=
 =?iso-8859-1?Q?xq0N1ClLAfjnuQTuGqBWkk6xzwhsqeDafNwNSIzvRRo7uN+sa2bZ4xKu1b?=
 =?iso-8859-1?Q?elrk4pXp8dj3RE/E6voXMymOfUBA6Vj7i3PQstLVG6+TGHCHoC2hCHY4nB?=
 =?iso-8859-1?Q?bOqztFNAA7hoxwnHxDhkMzAQSPLKc/kxZ9m11auJiOLv5FvVF686Lpgf5l?=
 =?iso-8859-1?Q?tOnFETSI1jANfrr3eP1Wwuaw6tonxfaWg5OaATJ59yhb97HukOGEO9xlr4?=
 =?iso-8859-1?Q?XK+ls5M2rD1adWA6wtOCcsQxSOkFlE+5UsTP/dzU1JVsh9OlgS6pc9i1dQ?=
 =?iso-8859-1?Q?KTklZZ/aEScROB4eXaZlyE4rj+sg/azH/jAxEkiZrEtTyX9MX5OpDpu+Mv?=
 =?iso-8859-1?Q?7g+u8SS9z7Zpasl8+Iqn9yKJuREyCHQonHwP4Zli4T9waiTwNtzBUiX1V8?=
 =?iso-8859-1?Q?oy6zbPMWYVRNo1cRJukP5YMpzi987gZ673ryCsHFOcDSF8Lnx1HuPjU3AZ?=
 =?iso-8859-1?Q?vUCxj+7O5F2Jdt/zKJW3P/gBsd200tS54JQaQr6VqJMxxpqALvGLc+lXvI?=
 =?iso-8859-1?Q?0/7fAMbh8u91Z6Igm/PGo0YssbD6z4qVI15Uws1K/hvvN+zPrF4/7R4e4S?=
 =?iso-8859-1?Q?CAusqEVCIO0iJp0MA6BipDsRMKnBKjw+DuUfWJ6lg7bsQjInEUpOV5qiAC?=
 =?iso-8859-1?Q?1hQp8gOrnj0l9Bz1t+I92GOBzyaNaGsMHoEXAbAozAJL55jcYw6IE3FnMw?=
 =?iso-8859-1?Q?r3G1efMIIUJ3qcuoyFd9X2gTslcgx1P9q/+o7Sk/qUFop0K2BL9CdQ2h2J?=
 =?iso-8859-1?Q?x3qR80Fc9juqihiDWdDXyYqcXMzGNaubOWq4nIwnRmz7y/MsiWoRMww8qx?=
 =?iso-8859-1?Q?gTF60VVQNVg3VeKi+J7MQENGxoj1U9n3Gnlmzck8THznijjushdPMzXyFY?=
 =?iso-8859-1?Q?1/Myb3xYe0R/mJa6WNnV5dJ5doIf5/2crVvuOEoYMXgFFUbHYQDwEh4l1z?=
 =?iso-8859-1?Q?cd0oiv6aX0rKO5Kmu5dqE0W8NeLCbKKggJs1aYmbzepemOqfWQNLOvv8ZW?=
 =?iso-8859-1?Q?LHcH4OYJCyS4OUsV7RPM99ybvdaCQ99R96jaV+e9G/fs9K/BzkRc6Ve6K9?=
 =?iso-8859-1?Q?bgzRfGE3OhrDjrGRzvl40fkqv+ccyU0v7+GJV0mF5QDHZ8tXcq8/wJznpG?=
 =?iso-8859-1?Q?jWX9lGMHHV0HMayyx3O971okuhedMBKivOSJCz9e4Qdr6yNr5Be+ilEoiY?=
 =?iso-8859-1?Q?6DqfUmfRSjCgSFKlI173i9mjV7mbwJAf/vJlACiqnI+tXOTEe77EfrpNaC?=
 =?iso-8859-1?Q?Ro6YeyYf6awQln666LI5QlyLNvdE0uUj62?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd94a98d-1ea1-4f81-4ec4-08dd815daab7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 05:22:25.2444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: smzkLURq3g/MDUaTabICS0+6EjKjTPP4sW7867NU/a0LQ17KD686AftowMpDYIde4HxwI5iA/wmPGVutcm4OBLL7iPyxzGScJBhBJdL5u0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6701
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

> Subject: [PATCH 2/2] udmabuf: fix vmap missed offset page
>=20
> Before invoke vmap, we need offer a pages pointer array which each page
> need to map in vmalloc area.
>=20
> But currently vmap_udmabuf only set each folio's head page into pages,
> missed each offset pages when iter.
>=20
> This patch set the correctly offset page in each folio into array.
>=20
> Signed-off-by: Huan Yang <link@vivo.com>
> Fixes: 5e72b2b41a21 ("udmabuf: convert udmabuf driver to use folios")
> ---
>  drivers/dma-buf/udmabuf.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 79845565089d..af5200e360a6 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -120,7 +120,8 @@ static int vmap_udmabuf(struct dma_buf *buf, struct
> iosys_map *map)
>  		return -ENOMEM;
>=20
>  	for (pg =3D 0; pg < ubuf->pagecount; pg++)
> -		pages[pg] =3D &ubuf->folios[pg]->page;
> +		pages[pg] =3D folio_page(ubuf->folios[pg],
> +				       ubuf->offsets[pg] >> PAGE_SHIFT);
IIUC, it does not look like vm_map_ram() or the other functions it calls wo=
uld
write to these tail page pointers (struct page*), which should be safe even
when HVO is enabled (based on your conversations with Muchun). However,
I am wondering whether Bingbu can test this out with HVO enabled?

Regardless,
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

Thanks,
Vivek

>=20
>  	vaddr =3D vm_map_ram(pages, ubuf->pagecount, -1);
>  	kvfree(pages);
> --
> 2.48.1

