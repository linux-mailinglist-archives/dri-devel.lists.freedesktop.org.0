Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D275881BE4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 05:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4051F10E956;
	Thu, 21 Mar 2024 04:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DIppo7dr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2783510EAAE;
 Thu, 21 Mar 2024 04:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710995366; x=1742531366;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wgzIPLnFJ48dvqOyGTnlHun1zb89gaRTkxdFOv7Ye/w=;
 b=DIppo7drYhHkIOMRJQ4jqVOq7jkcuCj8qHcSRdtUOyimOBpVxG1C9BQQ
 J/Hka2u2U7189fC6QaToHdpw9gvDA0scvI86mX9ZllzirmYC6GplOS5Nk
 s+Z8vEr1gBAa8NxCdRSVhEoz+/Xp+vS8HJ05p9SVEIM47kdU6uujPAU2Q
 b3i/8olOwB4UOBDj1yWTWqP0ZFcO/j8bkA3dY8Qpmd9Ic7vnNxMBJMulJ
 QLipzD8i6B53sJJhmUV3cUMkGxZAtzc5NrCSJaG1HB3cGaZZxWWpMvpT5
 8TCfirEqSJ4OQ1MMK2M8xheyB4TZuCKlSWHAwtTDgGYef56hW3S7FVOrf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5792897"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="5792897"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 21:29:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="19021513"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 21:29:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 21:29:24 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 21:29:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 21:29:23 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 21:29:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLKsav9DMcXKzMwTg4EQkfYccskFEWyh0gWI7G9tnMXsvDy+drQH1ncP02Ljl3IqMlVXn6rE+PpYVBBfrbUIJRc+PYaoOLNw9hq1qANBgxkRDP8RVFGP3XUdOwDh4FIzv6773VrdzxG04bLTwcmffupJ8/4ZgNeBh8+GOeSkcyHkG4GyYk1djzxpljBQRiZFV1GG+Wib1YKC+6t8Gef87lNzZxEfuLkVfkmiJAF9+E/O2H+NEWFDQuQ9EYLFDLcEMGmBtuLf4l8IERc5p3H+nG5LRnQL8mO5ebMoaSuj6F/GgGGs+xQqunVPzkKUCiT3tcDd11RVJV1uY/ibDHH/2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgzIPLnFJ48dvqOyGTnlHun1zb89gaRTkxdFOv7Ye/w=;
 b=OdRj3uz9vfP49dywzVM/NJ+czKDiWMR0FSYhDpnz7xbIl22vgQhQsJIOeMUZCfzxqK7CyGGNmYhm7ebt94uWtuwq3zui1Vto2wZoRvK3h0dzRdZKlXP/OamCd7WDPKC8jFIC3QuZtBzzd2IsqXgnTkjIiWtKkiH8oAWDlUgFLyUujQF+W4+k84Hz70TurRLGHz/VU+J8EoVDla0eijUIyYUsn6nTCZ/QeMeQ3NLoO2gc5E/YIzU3caQdSfpkfHBcEGyO51hyxgqooBvA00dNf/4wd/x7R41XVrRpq9VOp6Nnsrr/ogGFfneZvYG8qwQNfcPT0m1n+XaqKJpA+SjhCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5275.namprd11.prod.outlook.com (2603:10b6:408:134::24)
 by SJ0PR11MB5895.namprd11.prod.outlook.com (2603:10b6:a03:42b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Thu, 21 Mar
 2024 04:29:21 +0000
Received: from BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::46dd:6e91:5461:35a]) by BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::46dd:6e91:5461:35a%7]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 04:29:21 +0000
From: "Mrozek, Michal" <michal.mrozek@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: Nirmoy Das <nirmoy.das@linux.intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>, intel-gfx <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Andi Shyti
 <andi.shyti@kernel.org>, "Hajda, Andrzej" <andrzej.hajda@intel.com>, "Chris
 Wilson" <chris.p.wilson@linux.intel.com>, "Das, Nirmoy"
 <nirmoy.das@intel.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH] drm/i915/gt: Report full vm address range
Thread-Topic: [PATCH] drm/i915/gt: Report full vm address range
Thread-Index: AQHadX44Sh9xWy77xE2oPkbaYDlfvLE3RheAgAAhsQCAAaQigIAD8QaQgAQBbYCAAKb08A==
Date: Thu, 21 Mar 2024 04:29:20 +0000
Message-ID: <BN9PR11MB5275DE4BABACD254D551A7C2E7322@BN9PR11MB5275.namprd11.prod.outlook.com>
References: <20240313193907.95205-1-andi.shyti@linux.intel.com>
 <46ab1d25-5d16-4610-8b8f-2ee07064ec2e@intel.com>
 <35df0767-384f-49f2-806a-f83765ca7c4c@linux.intel.com>
 <ZfSAo791UDRnBSwc@ashyti-mobl2.lan>
 <BN9PR11MB527575D97CB63C5E4B1B0E7AE72D2@BN9PR11MB5275.namprd11.prod.outlook.com>
 <ZfsrQWNfzDGl8IVV@ashyti-mobl2.lan>
In-Reply-To: <ZfsrQWNfzDGl8IVV@ashyti-mobl2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5275:EE_|SJ0PR11MB5895:EE_
x-ms-office365-filtering-correlation-id: b33e9f83-3c1c-4e2c-8add-08dc495f7ac6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pnW6QwQ2xMIEa7GnyiVBX5seN4IcBEhJcH0tneOX4rCmU8mt2P0mqKVrhvDst0X6QCh7h+XjCUMqLgnF35AMj5bg/2B8F/LQZATxCDQpU1QGVSWJ85So3kR/VugJ+CjSwzec0JIHQs41hOHYNlFNcIFPKoxLXI9nwHS5DvHGyBEeHV8fZj2iqGIxO09GndDRpSA4VO/Swb060u5zUriE+WyUM4paqdRl2Lk2b8agW+mzF9zDky8U8mKsxq8jXtJl4xFXvd2AVvJlgBB+lcoaRL/Q3Nm4a/duW1jru2qN2v44gsxTDeOk09JCBHmhAkSa1qc1GslfveILOm0qycW573Tv6KZtWMh/COnWDPskz5dp/lmlmlaXNSlqOvIIQOqVIXBUY82R3VM9pt9uvCAp1ONkTFWVq9fkIQXUqwNCpETTGUqQmAs2RigC0xpzMXP0bVbSOQ5aRq2y3zbToRuNBOKiw86gkqrnNewiNpef9cmUlVFnH45xMpb9MbkeHI7G0d/umAaY/7ExxfM8d4RBGus2zdJyKxORPGOgb16NpsQ7ghcd1kBSgunqXp5da6xdPZRieojlPrg878xy38qa9qEiRuXsQHxfu7G8/YMBHSjv167XysuL8oyx9yH8ZJxFNd95Euf4uhOdHAaHoAU6NYxLTY3MXo+t5TOIhCJKg+OsVgZE8vAGuywoYl7SA2IkVtfZNDKc00RRMUIuDmc8FQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5275.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?U1eeHLoLbFBE0+cWYUBcVBMG0x0YCodMuSHyNhYel0tQq59J6rsjjvwH4kz7?=
 =?us-ascii?Q?Vf5aIuFHT6yKfrenhL7pFoqNrtn7631AubNzMWSHgJ4jpS5JJ03xZ9Q3ZoEw?=
 =?us-ascii?Q?OUyi549IdZ/EMf0fkVOR3KQo2ud7hKxAa6jVrh3Div6fSWSS3jGFGYiCtnNx?=
 =?us-ascii?Q?xkuPX7XOmCkmBNuU+THI2PPAQTpHywtSbFuXlne/tZtSP/madJkx9KREuJrg?=
 =?us-ascii?Q?T36bNDq2IlEdMh0P03hWfdFXolntj0/FpauviEgd1XL1ykJThHEv4RiotIA7?=
 =?us-ascii?Q?PxIJtgeDgm+hvejrRZNl1jppojFJsSHtbFCAYzm6CGnwIvCT7f7CJh27c7t7?=
 =?us-ascii?Q?BTd4k8G7PMbK27UmoVfn2KvQbQr34l/W+4yLBgcYLV5nVhjO2D0HhLfYgLza?=
 =?us-ascii?Q?/3jeE0B8rzvfe2sTOlLW1dAGTIB4Gfn//o/yAroBIQh5LzpUJq4ldjJAV+cr?=
 =?us-ascii?Q?so7qwR55KJVC4l2j2418FbWgwEYRvUFmGhjGCOvTmG3ddiEoeKk4AGcPPqT3?=
 =?us-ascii?Q?nFzFcmosi4XC8UoFd5z4KEo5VLYmjJt1eo0irpaL1dsb4ejR9gaG83fv7w3f?=
 =?us-ascii?Q?+i/k/NxgTIOD0x7+urov83jr3gMNELMEG3f0JeOLnYqhz2PPoxeoPM7kv0ck?=
 =?us-ascii?Q?RIHnbAUcsaVuYh33itkYcxLJ2yQXggAlT50JJUfsvSU1tv5fKZn4dmSNvJuR?=
 =?us-ascii?Q?cSWDVdB6mQSl5Sxk+2zVpyi/zoLtuIVMLd32y955ItnBnBwTtGiOQPZBJI/W?=
 =?us-ascii?Q?88hAC+cpeVQJZbwSa+ZwUnATzpCuQAea2vJrr3e8XOAKS4tP/h3Ab2QdKwC7?=
 =?us-ascii?Q?okqlITOzICQo6xS1qdfCSG45bHsxPm82yxRfNkWQLGBR6OiOUV7ODc+15KMi?=
 =?us-ascii?Q?Ywp+XnFZfyXPXurxW+aA9QXhtz+KgGC8QWVi0YEI0Tv3irbJkgV2JzKgo9co?=
 =?us-ascii?Q?ry0OjpYs/IqQl3GvxMxzurQBZ2YFCOLtvm6Ig8rjkeY1IUy5ifaIxzXcw5Ey?=
 =?us-ascii?Q?3c7koohfNwpkBHxxg9g4sTZLV7a4WEHU+/XtymuQlrNlQFkf3qaBvx/8fxr0?=
 =?us-ascii?Q?vU/uSX9AZDlkWJyH4UQ5wobv3WT8q/Fwq2h/TjbntD8NFfRDI1RTMKGVrn0O?=
 =?us-ascii?Q?8QW3K7o/ewVSwctaFq+9+bTOuP78m2t9wJz36YweTt036dmAm6jzyjxqqNYH?=
 =?us-ascii?Q?OVcVe/B5Azk380aG7irgEQyheoGpnMoQwcY1pzzySBLxmcXwdsxDB4pJXLDL?=
 =?us-ascii?Q?mo3uAk7DSq3wBogYYke5MsmwwOcK2MxOiFi+/6wuVgvldnRFX1s60Lg3NALE?=
 =?us-ascii?Q?YmdVo1Y3NQw9a1V8ILucYwOmNChxRy+m0AZvwIAxHe/m6fc6Pfub0wPPM3Py?=
 =?us-ascii?Q?UWf5IPzAL6ZMs8wv5Gxhjo2GdX9dZWGgPP091OnTb+Cp0hslV9Nz7mhkI8e0?=
 =?us-ascii?Q?q6HyikPkKaUFsFTPP6+7b3gmqflFgLlFotNP54EL5/7AhVmvyJfHRulNpAIX?=
 =?us-ascii?Q?PrrpRKhk6nLGL1G/aDBKe8XhU3IDv2KMLcAf00NdTRdY7mjIQJ3Isx66G2Um?=
 =?us-ascii?Q?GwQtnHWcdWYRkVLnQtYfSf5TGZOA/yVj8YObuoPT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5275.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b33e9f83-3c1c-4e2c-8add-08dc495f7ac6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2024 04:29:21.0118 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ATIxjxuo2qB+VerguVdwzhYIai2QGJNDOMi3Wf2iSJXAgha3r1VehjB0rc4tkaI5r314hMfHSfSraTiXid870g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5895
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

> If we provide the total GTT size we will have one page that will be conte=
nded between kernel and userspace and, if userspace is unaware that the pag=
e belongs to the > kernel, we might step on each other toe.

That's fine, Compute needs to know total GTT size.
Not available GTT size.

