Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDA1AFC909
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 12:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 541F710E5FF;
	Tue,  8 Jul 2025 10:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NQD1GUbZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0697C10E17B;
 Tue,  8 Jul 2025 10:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751972282; x=1783508282;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BvJEJzaXXBbzUrixFxoM5/qXCa46QiUF7pwWm0ISUHc=;
 b=NQD1GUbZBKcFpTX5FRyI6rlJ/d3I1yb6157ub3SlBvk7JVbmT2EmMFcT
 tsjY5MCw3AIk8nRgwUroplXyQD4UoQP6afYqPdhxcbpl/R2SxWwIm4k/0
 l2zDEidJpgqEw+VLNoXxWwVDDUOudhCxiFN2KRE0qB5PO8wdpI+rxctYH
 nOgjudOlL0s6+JyRvxj2t+qMCR7odSH31SJAuS4GimyJ0q/ekU6Cd3HVL
 tYVTtODI70wXC8edSIAiYlWyrOBeCCxXoGBqvegXb3fWl8qzDV0/6jotG
 y8eWy/QElARK8qHr8lR+nxvbSOWdWKin3mGp0+0hZCTSGXPQppGWIVXuL w==;
X-CSE-ConnectionGUID: tiV0oY8ySCe7DIi494pcfw==
X-CSE-MsgGUID: 9/I1KP49Taaq9Q5Iz+XBJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54135619"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="54135619"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 03:58:01 -0700
X-CSE-ConnectionGUID: dd2GO06vRR+AtGvXwKet+w==
X-CSE-MsgGUID: 0KnhksIzQim0oBoUP8PyvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; d="scan'208";a="186489874"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 03:58:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 03:58:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 03:58:00 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.79) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 03:57:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4T+TGA4uXUQS4uRjwMo88cz7bevzUAAB6pibyfHQLfRGoR6K/KOKIk66+objnD7fP39cCPcBvLjNhdrxg4p/xXfMPDv2VlZqIJYpARX0NZqFWVXkW43IZBH90t+PaktOMR83v0s41HDOiNB283ap5rwIvM7PzpQa6S8xG4IhskbXTiwzK6gKXd+Dor++72yAYeBboY07RCW6XYq6/WVf67UsgqUUFI6VbjyaGCoGANgECLSynuYgyF8AYMS7gEOTTLZ13rUnkmqkRj/8baXSMbf0gs7Q78FYmDXLQgyuu9rx9/Fud0lQUgWDIo5JcUUjWJ+3eCO9x0BXhoH0VnQrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fULGPQ/NBXZt3cPXhZKH3IlKQHlANmcLkdTEP1a/xLs=;
 b=JWlmDo0n8xcRoRndq9QhF4HcrlOz3xKIFWTgnHGQc3Jz5XKFYkiwL4ZkcIkA48GrZdDbklJEzNdLpzm/aH5gJou/LMR1C2eYTnlG2eVQx5lOE4M227fBiYbk04yZva+DGKFaQ1oQkITFbzit1WeI2KK3+NAeIv+t0zGnHm0Ucw2TyYDBGOyhVVQzr4tklgQFPfmqJx30b2ooPdUBP+jNBIqMj+QWXIcdvurr9o3kVcusItPI+hKPwm2I6Od/+RFpedZk0diFAZcHrmsf5ymWyYIzEyn01lreIpQzxcKClFtD9uxyB7AEQDb1BNEcUFokZumlD10TNaedToG/q8+H6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DS0PR11MB8051.namprd11.prod.outlook.com (2603:10b6:8:121::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Tue, 8 Jul
 2025 10:57:58 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%4]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 10:57:57 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>, "Nilawar, Badal"
 <badal.nilawar@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Usyskin, Alexander"
 <alexander.usyskin@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: RE: [PATCH v7 0/9] Introducing firmware late binding
Thread-Topic: [PATCH v7 0/9] Introducing firmware late binding
Thread-Index: AQHb73KDAOJhKgF/nUe6yTSAPJzRWrQnyekAgABD5rA=
Date: Tue, 8 Jul 2025 10:57:57 +0000
Message-ID: <CY5PR11MB6211D6829C6B3A39D2F48013954EA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20250707191237.1782824-1-badal.nilawar@intel.com>
 <2025070824-uncertain-exit-eaf9@gregkh>
In-Reply-To: <2025070824-uncertain-exit-eaf9@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DS0PR11MB8051:EE_
x-ms-office365-filtering-correlation-id: 434d692f-c4b6-4c2c-042d-08ddbe0e4c72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?H7vki+yBA2YzOs3aiV1bISlZEEs94Kkwz4575AiqMJkiJFG8ieEYwy8PwF1q?=
 =?us-ascii?Q?BIBroRCw1jgAbqQRLqjhpDe0r540OWHSLLYLGJjGi5ZgQkupFVUSVKA83WeS?=
 =?us-ascii?Q?HcuVUCX2cLtkglmKCyf6N9T3frLXPqa2J8yHTX+rNlDqBbOhEmbemDH2txW0?=
 =?us-ascii?Q?xF5srj1kB81hCM8w/TNhb4hI4g7vwjZ+dvLj1IEpmMjKpmu5GPm+Gz1Ft8In?=
 =?us-ascii?Q?s8Xf27c8o/JcfQsrWSsUzZp4sTK5Y8QuKXZwpInUBWumuFtq4k21xKsxCy69?=
 =?us-ascii?Q?NN5JPb3km9jmXkaTC8g8XjURPYwFPPTHFN1B1HQ9sWyLVuO9oi/9X+Sfax1l?=
 =?us-ascii?Q?cD3ysUOD7EtuTYTRIdeK3hX4nz21kiopQpEDem19gqwx4F6qkKStL7W/96YV?=
 =?us-ascii?Q?Fd8ztlWqiEGA6cGriL+6hJalOQT5qXm5KlvZppthf7TiA+NbFzXjD55hS7O/?=
 =?us-ascii?Q?PRuCKeAOfjvEcvqeedwEAft/s5LAIAuxVh6yQxsMgXUiau5cqCscdoz63UJw?=
 =?us-ascii?Q?kW8vOZerUYhO7Rnw6JrH7GZCSzMaMWojU9gO+g7djO4aoRSYq21Zq7IY2NPh?=
 =?us-ascii?Q?cDD9pkKThz0MPnqFdRLAnX6ICDD2u2+zMcf+vDELFUa1f+N0DEmfC6AR8LLe?=
 =?us-ascii?Q?Kt8N8/JQl+OmgtQs+awbmJANfgiGkH0H46FNn6TD7G8TE+2EZGggmh2BLaMN?=
 =?us-ascii?Q?r68w3TlnBBQgEDssZTcF6tjJR/IZ4kNcRyvzvRds2lvVVhI0hMOxtMmdZBC/?=
 =?us-ascii?Q?E7Mvwdqhg6kcyrhYckF6v4UrjCs4iJi1YaUqh2t9Lu8ssIhZDOUmaQqc2ZRj?=
 =?us-ascii?Q?7QBF+zTcLPoa4Fmc50Y0vP1tXpLBetmIfGqBER2Fg5IvPiqjDDwYtVh0iKw2?=
 =?us-ascii?Q?3pDFc4SVtkpLsNk+w44uy0rPn9gMSDLJ5ltY6gDD4xZ8E+Lx5DupXENbXs9t?=
 =?us-ascii?Q?lSujCHU0hsomyrzFdyBpKLSEYPWtiHo/aDWGJjrv7n/xffwcLCj7yv+5SUpk?=
 =?us-ascii?Q?vMG/6Hw4W7ZnG0Qdgv5hHbVmxSHY4/Zkaf5H5q1Q0h+J6TVFb0uWTaLftOi0?=
 =?us-ascii?Q?1nyZowcwvD8CVq/pHBSh2yBrrhXdcEokq5Ub7HCzBoFOrsai2FiJye5Nz9WX?=
 =?us-ascii?Q?rcVS2X4lefg6qdWYsr7gGBvfptQ5xJ4Aw7pTRdq9ccTeKWxKMJXjo8U+l5bc?=
 =?us-ascii?Q?SHehZcra9DVhDcCgTgCeBtM1DP2Og2tqHAyxKb3jVwfk2SBlzhp3NZCPlrMa?=
 =?us-ascii?Q?/HcozP6uy8y2j0CHo/S+aZNa8SbAHxDYn2tHa7IfFMKT3y+aHubqHf3lgy5t?=
 =?us-ascii?Q?tVQlT/Ml+t1L6Mc8nvKqKY5vGZBybgxl+37SRsAFoxdr+ensvFAKlUtkabh9?=
 =?us-ascii?Q?U6pkLhu7aNTWUZ1N9JBrxASuQ1Dl8RMu+LVPV6E+l5wL1TAJhiUJxEPsLlH+?=
 =?us-ascii?Q?ERKZfvnqhYQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mecGxiad5YRourrprCbfnhyhKNhPh1umo6cq+Aux9hJkpMvWBZe1C8CvugKh?=
 =?us-ascii?Q?WOAGeaN2sWVkOcXyNNI/ZBQ0Q+1ozj97oZNIxT2zM4sTPeTfObhHB4xQ9CHO?=
 =?us-ascii?Q?dWGeVQmjJ+4k8X2FzkkEpeSUEyR5VRUeINmurRo2kkh1v4rn97AitI2bE1zt?=
 =?us-ascii?Q?g3xYhTIduiT0bp1IQwoKyV8RqiLZ08acCTiNmw9dUE+DhWceZg7XS1wbhNHi?=
 =?us-ascii?Q?FAHai6Pev+nTBc8xcmKuPhgrcMtTRaRQmIlLkoEolPKICgU47EywCCs6v72d?=
 =?us-ascii?Q?Io6WrJv43wSV7/t8A7cYfnwmktV2JnQZwmGB1+1KYhCed1C+vuP1JDwqzpbl?=
 =?us-ascii?Q?F3JYdXye1WtWvCM2s7B8l3zJfQRrtvf7ybANiFcDtwERKcWOoIe9uwTmIcdC?=
 =?us-ascii?Q?gNlIZak6ThgnnPQZWKfOVHaywkIg2JcziuszzQU5hGV3apVUcUAClfgF6cTE?=
 =?us-ascii?Q?/8uR1pDvJH8m3CEKIEbHs3NYeI9/Nhx7dJJ709FDh3FQMx/FQsKWgHppPk8T?=
 =?us-ascii?Q?r4rgSCrBRS/VzNvFZC4pjVrGsfWa73kA673GzAR+qOT6cZi4TRxOctWrwxWO?=
 =?us-ascii?Q?Ah5xyjv5W8XNCFI6/hPZ1qY2CeiMsdi7n+hBGUztTMH7lhkxiioh3a2BOg82?=
 =?us-ascii?Q?TBcuEKX9uuHnQZxSj756S6LUYz9ajcio7L4stnMLYPmW6YRoUZtc5QH2HP2Y?=
 =?us-ascii?Q?Wa4xHMZIB3RQkn9Vp36N/k/B8x/dbmUpoN4a6Pp04GxPqhzLHFmb+9WTP927?=
 =?us-ascii?Q?xpvvvYmm6wV0mM2JfxNzvxPJwtN/f9lmDFReu4I0p5DzGsdYxud4m0aE1yf/?=
 =?us-ascii?Q?7HAUKEDO4ay4HvoUKJHcHYSS49keHskx4jPkqrnR6wjb0QduGOm48z+Ccy+3?=
 =?us-ascii?Q?MDD2vm1TxiQ8payuJubvo3Vw68lJW37Dw/w7sVpoOp29BPmRVfMUa/HbiKnx?=
 =?us-ascii?Q?4g5UMbOg9kn6yaTuJ8RQQgyjmis3i3Txk3VBvxCchemQZ+VG0i5iwCxyT/lg?=
 =?us-ascii?Q?ujddXNRG669cm8kF6Z92lDsfLdUKvdeIwU0pj+bXsXAEolCtR67aRsbmGS/L?=
 =?us-ascii?Q?VOfb0P09YZvk/Lf6k7cDd3afyC729lev9EIazr87kADjQM3wiOb4woacAg11?=
 =?us-ascii?Q?mAw9Mv/8Dq3Ixj/+iYUJBMcYm/Odtv17q3tOEplV3waUlMGcTWqXNQX6dyA/?=
 =?us-ascii?Q?QW6fJJunkc0x1hOafeDH6+pZN3/OZhIi8nFq8uTYs+xZQcGWkXPBeS6/EFEO?=
 =?us-ascii?Q?p090ZucqW97qxgX+9sM1fwPin+PpfNrbd/l1i8gEE3VSWX7hXJR7yoX+Yt3N?=
 =?us-ascii?Q?AcLuaxTINtQGUG7JKjaRPMqbmMi56RHF93R1Iyccoo5Vv8ss6q7cwXDqLBc+?=
 =?us-ascii?Q?+rzJYeyNraNQWGtlszFDMZy5V+GsOr0H9dkPUM8hG1jj8UWE6ph5RoVQOkid?=
 =?us-ascii?Q?s2WELfVO6A1HKYT3J2X69vA/s/ED+rLfCwDXiIdPNB9Qk4zpP7x9Y9PWA+Xi?=
 =?us-ascii?Q?Jcvh+w5nmvknU3+mJjgaOrDtilvVE7vRmVijid+HptmZFlXJsLj/4udITIlx?=
 =?us-ascii?Q?uNU4e9Ggxjz6l5WNOOYTUjmr5aN/hRq0H44KOdKX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 434d692f-c4b6-4c2c-042d-08ddbe0e4c72
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2025 10:57:57.7321 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uky0187SE/tOx1r+sBNspYLwrUypULxK926MJtyF3ongjznRtHSuv/34HClhbnFImtNtYF0RfpgjADE6Xpsb4rOd+zJZP0Nvwb9dimMLpr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8051
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
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Tuesday, July 8, 2025 12:19 PM
> To: Nilawar, Badal <badal.nilawar@intel.com>
> Cc: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linu=
x-
> kernel@vger.kernel.org; Gupta, Anshuman <anshuman.gupta@intel.com>;
> Vivi, Rodrigo <rodrigo.vivi@intel.com>; Usyskin, Alexander
> <alexander.usyskin@intel.com>; Ceraolo Spurio, Daniele
> <daniele.ceraolospurio@intel.com>
> Subject: Re: [PATCH v7 0/9] Introducing firmware late binding
>=20
> On Tue, Jul 08, 2025 at 12:42:28AM +0530, Badal Nilawar wrote:
> > v7:
> >  xe_kmd:
> >  - resolved kernel doc warnings
> >  mei:
> >  - Address v6 review comments (greg kh)
>=20
> I don't know what comments you addressed, please be specific, as in the p=
ast
> other ones have not been addressed (i.e. the .owner stuff) and I had to f=
ind
> that review again...
V7 series patch changelog has the details of addressed review comment.
https://patchwork.freedesktop.org/patch/662505/?series=3D151202&rev=3D3
---
v2:
 - Use generic naming (Jani)
 - Drop xe_late_bind_component struct to move to xe code (Daniele/Sasha)
v3:
 - Updated kconfig description
 - Move CSC late binding specific flags/defines to late_bind_mei_interface.=
h (Daniele)
 - Add match for PCI_CLASS_DISPLAY_OTHER to support headless cards (Anshuma=
n)
v4:
 - Add fixes in push_config (Sasha)
 - Use INTEL_ prefix for component, refine doc,
   add status enum to headerlate_bind_mei_interface.h (Anshuman)
v5:
 - Addressed review comments
v7(greh kh):
 - dropped sub directory
 - dropped .owner from late_bind_component_ops
 - In csc_heci_late_bind_req/rsp headers
   - used __le32
   - updated doc for reserved fields
 - used conversion macros le32_to_cpu, cpu_to_le32
 - fixed duplicate print in dev_dbg
---

It seems Latest series[*] after dropping patch 10 does not have details of =
addressed review comment.
* https://patchwork.freedesktop.org/series/151290/=20

Thanks,
Anshuman
>=20
> thanks,
>=20
> greg k-h
