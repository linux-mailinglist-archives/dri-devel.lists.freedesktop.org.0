Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C88DAB0FED
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 12:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4173710E9F8;
	Fri,  9 May 2025 10:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ldnbgYNz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547F710EA19;
 Fri,  9 May 2025 10:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746785333; x=1778321333;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x4R/SIezrCnTFsUwEWLBhLlw3jp0E1ye+6J+0wJH0Os=;
 b=ldnbgYNzOjKaqfVYvddVuz3TIfKTiEm2UjbTvyarpswRhnmTOOHwiAZP
 hsgAZ3GcBZdAY52nvRAkcnlBpj8bCaY4skGd/yZxOV6cTkdEi6O9wJc+m
 UiE2WX/9XhcVyTsXIK+zbog6/nwgjpp8ZblxVZoOiW2P04FGqpP2B0iub
 j/sVxhArkiWb7frXXO+fQl8aBZkGab1sXVhD2PMrOnbp/CxY1RuUNu4hT
 J0ue/gvDAHA6usOrPcseOKC70FTmsMY+PRrbm5V2/lYZdAJ18GwlIah8f
 qvvWDwOCLGHdp9q5hkqmiMDFxmlZN0cG737srYFFac8tb46k+U6XY/I2m g==;
X-CSE-ConnectionGUID: QoIi2e2HS86upjil0udvEA==
X-CSE-MsgGUID: 77tFyiIkSOy/xWxCskLQ3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="51264487"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="51264487"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 03:08:52 -0700
X-CSE-ConnectionGUID: Oezr3HaTRE+NMHC/YUarEw==
X-CSE-MsgGUID: 7XushXkmTbuMOpF7MCBYYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="141525412"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 03:08:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 9 May 2025 03:08:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 9 May 2025 03:08:52 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 9 May 2025 03:08:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCMzXy3q08cdtO8lPBhAt8wSTe9KOYizITVsjGEZyUw8YANbJHz8fGb6cCeW7k8ynAQC1h2K7ghF6sEMmwmMDcwuYYpPWOQPqLS8AzwCUQ9Uzs116IsukuSXBonJYqcw+3L3teFS43lF1rykSzBQcChQ+LyFWNJyIg114MtyEPWhIZBqIhgtTYR2VY5H2+j6cUzex6ZVxUNxqZbcYiwNJiKu/ng6bruvA7C/CfHeu3KyAB6qSnvBg06ObOgBI2PTc8LwgC3qjxWhjf3pdoBRjZ7zrt6JSw5WmIjTI21ObmUSBFKuEI8HGZ0RjSZSALk3oqUBGMh5rO9K0wXNlYCGgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBXXoZKQPszMJpT4aGbdv4QMHQKy8+kipWgUsCQ7FqQ=;
 b=qbAGobOkysxJTVRIcSPSziKdO1zBxBdmuMETrmKteKPsG+PT1pwKzhagJX0/CHbOIlSIQd64LvLNIBX/4nV3IzBydYeQWv2HQZnu0d/EG23pOLPbmpFsWchi7B2ZnUrqsnw5un5iUtTeNKZnT/uyqYPCvOLlAaW0eY11Z2eaxoTi7NP8bqriZ16ho6dV6E4q48xu1klCd2s7pCgG43BM72wEbOkyIJzXuTMBZsBo05CxP/khh3GnAOnJ+d/jcQoaMrP+SXyNTEIAQqa08KaNfwFYrpxSJQTOvb8UM5PPpF//+5gaQy8+51OFWFQ9Zghh9RQADA75WkZHa4U3GvxYew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by BN9PR11MB5259.namprd11.prod.outlook.com (2603:10b6:408:134::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Fri, 9 May
 2025 10:08:49 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 10:08:49 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, "Syrjala,
 Ville" <ville.syrjala@intel.com>, "Murthy, Arun R" <arun.r.murthy@intel.com>, 
 =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, "Kumar,
 Naveen1" <naveen1.kumar@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: RE: [PATCH RESEND v13 0/5] Expose modifiers/formats supported by
 async flips
Thread-Topic: [PATCH RESEND v13 0/5] Expose modifiers/formats supported by
 async flips
Thread-Index: AQHbp4IatYQ/TCOLJUy2H4gCaN9gvrPKHZOAgAAmTUA=
Date: Fri, 9 May 2025 10:08:49 +0000
Message-ID: <SN7PR11MB6750F40120B4A5D6911977A5E38AA@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20250407-asyn-v13-0-b93ef83076c5@intel.com>
 <87plgimdme.fsf@intel.com>
In-Reply-To: <87plgimdme.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|BN9PR11MB5259:EE_
x-ms-office365-filtering-correlation-id: 885723b6-0436-49be-6992-08dd8ee17e22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?bV6JJvNFF+WHFGwH8iUaNcaCPGgpUR5RdW9E4bgwaqAZkH6KXVtG4GG0iL?=
 =?iso-8859-1?Q?wVcuog6z6+qI5uVMjJh+1fr91sDNpvoKxe9YizG6KH1I+gW6B0Ru6km+EV?=
 =?iso-8859-1?Q?3ogzIEN65FFBg/XlTroJMRnuAYhoK8R6jN9tO1sdvUkKmzPRWm9N1ZHFGP?=
 =?iso-8859-1?Q?kZcB4MbOOiJKxEFVPH2ubfzZpKQiPs/Mv5/PZHdI8QgVlbcTjjrUWi/xl2?=
 =?iso-8859-1?Q?dj14/5CUqm8RRPS3e59wz3hhV5VpyWneo+YjBIshfXoiK3NZ4Ssc08CQ8U?=
 =?iso-8859-1?Q?hREKFBclx3rN0BYVuPnSFUqnyAxr/JD4FjMfh1/XPCEsYvWXMIavAhQnnC?=
 =?iso-8859-1?Q?CmmKgES02FzmL84HBNYuVy6EGMbcEk/u/4K80M3gdUHGmjmQbHZqrvboQ1?=
 =?iso-8859-1?Q?a3uXhHt7RhvdNvTchDYjsQtXgvQaOB45vIbQCoJxDTGqjmS7DLQIpTuJLk?=
 =?iso-8859-1?Q?pPU2fx0xDVm++4SDCPP41bxRx4bN67yvUnXllqFBugzx57k9cmuPtYYaaK?=
 =?iso-8859-1?Q?XWEuCACZ6u2vxLpE7vygD5fEzfZRAAvxCcGr1vSrQYPsR29N7+ONcjwSAX?=
 =?iso-8859-1?Q?vpjGfdnV06HxFWvDsUms32+OQrDa49pWda7iIPSGBz3KR62X+QTh3HQMQF?=
 =?iso-8859-1?Q?Jw8IitVE1B/FVCmPCySpyYdTzIwFS/BhmaUcrhGyxF8LU10iCd8eMmKlGz?=
 =?iso-8859-1?Q?TXzsl0BAV0v3J2UurkEBBkv16ATGZeULVxzy78LdQtF+zcbkiKrkNLGP9x?=
 =?iso-8859-1?Q?5kMd6Nc2lv6Unu7IrC/7+4p7Uv3T91MCAM131GqdPYTKvqLgRBk4X/C9XI?=
 =?iso-8859-1?Q?BorUXS1+uKSovEyITiSEP6OkVAbyuflO4A72ALuKXSJQ5oF5gzd21oU50Z?=
 =?iso-8859-1?Q?B4Y3w/4BIn6xK6oc8M80pBQfHdGDL+sraMAy7d7+0WWmtCBv4srxK3kIjh?=
 =?iso-8859-1?Q?ihSSp9+/k3HsrWIIBZsezq/7mwAsRFzFzI+dxhfApXzQCwLzqB3Y4fPSGE?=
 =?iso-8859-1?Q?ytSv/xcpvliZtyjjLcnxuIGPuglktfdtF5/efN8OG1EGlHglOckAm/szu6?=
 =?iso-8859-1?Q?sui3SUMQrMpY26UKw0AAHDdPtTU20cIh2yuwiDlQ9DxEioCyxinOK8F7Mk?=
 =?iso-8859-1?Q?dOrr2pqO+RNCkNG2KwAaaNkGo/P+E5WyFhhSY4VJDwporjr4bKnzan8KYc?=
 =?iso-8859-1?Q?Xk9Zov0mC/YJftRjYPnNnwrmP3/lRoXAHjwPQvwhGnbSl7DGo8Jj3M/DCf?=
 =?iso-8859-1?Q?wZ9R1RL3WHks/qRTeViQPootjl5U25CkAcqcuFGrN86d7I7OFoumYFiFBP?=
 =?iso-8859-1?Q?ULxnTb9Q+awfG7NC59JPOYxlEQxpXA4Ffyhqc2an9InmIQgfPiJOIvmb5L?=
 =?iso-8859-1?Q?1fiVRotBtQafsdTjdEi2GJ4WzdfOjQaFQmruFlag2deJUuMRJZHhRKIiZg?=
 =?iso-8859-1?Q?BIAmy7SCrMb1P1eqAaVwSlkbAhPvvCUde9aqeRn+y4jZULEcAN6ryxe92v?=
 =?iso-8859-1?Q?+Ew34xBNvdOh9gBu6pWEEmduYKxY2iQ3fUw4uDQhdGuNWm6ukJM2JW23gs?=
 =?iso-8859-1?Q?V2AqoiM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?A1k11O1wE9Ea4Cpf2kPs9PI9lZJqiBMZ/wmeqaPXux18icb7HofnL4U69f?=
 =?iso-8859-1?Q?JWz8idpcQagy6aASyUtLqUz+I58CEZGti9DSL8jAAfocHdWToHRJ9IVsmq?=
 =?iso-8859-1?Q?tc38Uh4zdzzMZNLNbGacRpAavq+i5aHNIWpgx1/pverYLsEmODx0jQrg7R?=
 =?iso-8859-1?Q?gpQIS9HhA0uYgkE4ztejkHX8e3n99tifXz6VxdkUr5YD9IHZe0oQTbJHjz?=
 =?iso-8859-1?Q?QNmED1uqE5J397Zei3ewaQUz8cth0182bgq/t+iKfUoXLvRQfMb3cqlboB?=
 =?iso-8859-1?Q?JlWrT79MHZa3zpTvyHEw6zIz0oFNtqamxz8VhBZpxs5+4wdhFDn9GgvJru?=
 =?iso-8859-1?Q?c7TYCaLLSbt8PiAjPKp/c3crMDzJCl92LLW5Fh1I0JH/N2COqJqoV/tv8s?=
 =?iso-8859-1?Q?7Ui1zTfA8namfrXD9c5eDIjDcTtru1wrPi9eKy6zg36Me05ufO7AMmDavS?=
 =?iso-8859-1?Q?GLJByx/4aq0fXNGdGVWGFIOqL9Gjh83o4NPON0U4vP4Bq4gK1BDMuA57F9?=
 =?iso-8859-1?Q?6UyNWM5tboqv3se2CYxcHo6nL5+Y2K9uqyGUrD5ApWZ+9kD+J8j7rIG9yY?=
 =?iso-8859-1?Q?xZkKMsMYTHkA7PWuG44qBw+Zg7MJ9z0T2sedIOX+UTKlrXKf075V8bwbEh?=
 =?iso-8859-1?Q?KOwtWYTlHa+edEzVq//TcL65S6c4Q9hJJOrwoG7+jKkw0gugwc3GAu5yb2?=
 =?iso-8859-1?Q?2R+0u7jD6Y6KKlGa+cSZX5CJ1eFfCAe2zyVv0xXkKf7uLfqTPFR05FBDbh?=
 =?iso-8859-1?Q?eiyMixq1IrOpUkjRBFxK/wgAKwJVVQeYRmYno9jFCPAiPG1mbpulLIHt/4?=
 =?iso-8859-1?Q?ufej7aYou0nDCbiYNl/gnV6J+sFdIM7JbiKGWhv02Xw20q2cN8gLINMeKd?=
 =?iso-8859-1?Q?nW5SoetGMdUthnTeV3c3Z+jPeLYe2DiI5lJku6Rm0jKvu0XNgxijCjhlLU?=
 =?iso-8859-1?Q?efEhg3xXNQDZAaBarpSGyl+xrpjNxubXFvyK/4PzlHHmBzIO/Mr2FwLeTw?=
 =?iso-8859-1?Q?hN1QVyyoNS/6gwYPDttd9SoX1n8I7dgPqiUWnAmRyabbpL48UW4Punyid1?=
 =?iso-8859-1?Q?jc0vI8pbwLpKl0kQzrWJmXasyGDJjhkz83PaUtLzcallL1LrndbxLWiVve?=
 =?iso-8859-1?Q?fxMVLuIMaRzh4SZUJezQ1R7f+CvTFa8cOFKJ3nioSTcfYFVzkMbsdS6t29?=
 =?iso-8859-1?Q?1lELvUOstHwQzUT63ijXRp5I5FSXXDXmXXh9nS6oqx9k+cogBhX10vswDJ?=
 =?iso-8859-1?Q?1c2UpxKp83m7/w4gQZKZn9PU9tMYbkkURhdv22pzmaBYM5YBI5+k1VcFgp?=
 =?iso-8859-1?Q?bv5B7GBL10ScyjdNgTjs99y+qSvHvS1tLugjIaGjPIOkWLjvJq3y/H6Dal?=
 =?iso-8859-1?Q?+5f2h25S6TrYBPlbo69xHheomSA9mPWOE1nOcUT4UeSbFPhiHPlmxfSzg/?=
 =?iso-8859-1?Q?kWsS8XRm+UErMHlbFAWojrdcE0e6jOT1M179wWO2Eskkho9WwRdcli/Cyc?=
 =?iso-8859-1?Q?0xlRlVhVGAf120I+Cno2gF8e+QKJ0MwPCLUrP5F6PXzfXcuEAYpKl2ZhEs?=
 =?iso-8859-1?Q?DjFooi9hUoFYE1h+KX486k+5vG/XsDdB6e7WQiP1CAWILgJlnX5XlXS++C?=
 =?iso-8859-1?Q?RXxBsxx03+c5ozuwlkK6bciMlyWqUkEUbX?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 885723b6-0436-49be-6992-08dd8ee17e22
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 10:08:49.1358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZhHf+ajJ8bG7cUiarx65mLqWcSrYZjxdTmIXk8xmdrNx4Mu2GCsucqOWcYtE9x8O0StMnNirujFloAoCRKHIJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5259
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

> Subject: Re: [PATCH RESEND v13 0/5] Expose modifiers/formats supported by
> async flips
>=20
> On Mon, 07 Apr 2025, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> > Arun R Murthy (5):
> >       drm/i915/display: Populate list of async supported formats/modifi=
ers
> >       drm/i915/display: Add function for format_mod_supported_async
>=20
> Acked-by: Jani Nikula <jani.nikula@intel.com>
>=20
> for merging these via drm-misc-next.
>=20
> Maarten, I see that you did the final pull drm-misc-next pull request
> yesterday... would you consider doing one more once this is merged so we =
can
> get back in sync faster?
>=20
> Thanks,
> Jani.
>=20

Thanks for patches and all the reviews merged to drm-misc-next

Regards,
Suraj Kandpal

>=20
> --
> Jani Nikula, Intel
