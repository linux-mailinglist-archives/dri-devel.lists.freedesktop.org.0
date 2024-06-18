Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDE890DC86
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 21:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB71210E5A7;
	Tue, 18 Jun 2024 19:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RCjDOSwT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0877810E217;
 Tue, 18 Jun 2024 19:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718739266; x=1750275266;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K2EqHtIR8zoaW0RFHMo8yWf48hFOv5vfEl8FdllrWwc=;
 b=RCjDOSwTSLsAzfD+Jcj6i48fkRatdkhfVnd7upaoMxuPsxyOg4Lwbsxf
 UkM2ZfQIhOJpfC3t5WBQzTrg3pncTCIIlRPSRufPS9ppHwan2Am1ry/AL
 5Hpusohes/hs9B2DIqfX/rlW9k+3GyKUVbNM4pEOyD3PqMKo2CZdqw+pt
 6Bo87GAJ8xWg0EirZAw6VQDmQkgTwsgHj8W/K4i760jvEoIpQv0Jp3mp9
 x65vIKbC4+7I+qggWsNM+bj+lvftUqBtaCJtoabR/0+jWIMfpfnX1DAaz
 bNMsaLlu6cuXP7Aej0b6QaS9H+0vyZdFZYrQvI5mk5hV1Boasf9n/RBmB g==;
X-CSE-ConnectionGUID: V9dMDBoYQ9CPPGWCM2mBfg==
X-CSE-MsgGUID: HNu47dhaSB2/9iUi76y1gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15614773"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15614773"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 12:34:25 -0700
X-CSE-ConnectionGUID: usrjzS+ATuGP+d1r5w0E5Q==
X-CSE-MsgGUID: MlmSukW4QA2RwIzNLZIJ7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="46613569"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jun 2024 12:34:26 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 12:34:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 18 Jun 2024 12:34:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Jun 2024 12:34:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tjf45ff+KS311bx5uvCc49H5WeAiASBSPNt7+5o4SCG4SExfIsGZ/vSHnXcvZ1aAQkASLL9jac8zZ0YCUA2KF/AE9x/ergbWZXWtsIRMAWjjIyI9tA8n6l+NE60Do8bo/8Nh4/ewXlEVXn1ASOxJsLNuDVk6c/FDj+KmplTjqHeoYEavoVOOmL1NC8UlYMfKyURSykMwpVmY4AAupkjb/hbpBnoiv3Veo/3KF3Ew92DLBEObyQDjR7cYC9kTGLL+jTrzb+ni+a7hwEU7ErcPtYwHKGQemGzI/wR5zdjz5FSX05EtMmXfNXdD5w8NNQCg4lnfIZy6q7Ws1lxpzWrM3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4IDESE2cdoRZCKXD34PmsQRS3K8mjubgnC6SvEMpwvY=;
 b=QYbFGy8TR9tQehprvfrtCR+IdFNOru1qp12W2PHrA0Rxz43ZQSfL2eKdP27jDKT2tcwXjJSbq26elUgz+IiU7vONMR76O3s4uxeX/IKkcV7PmpnX+4Zycq7ursWFgAtU6Aq75FY8JkzlXsS7hn/JGtH6sP3uAZuoGVat/eJL4eF86oAV6FJbU1M/Ds9uopGpbno2QgfEYscnJLoVUEpO5DdQJcLb/fY0yJECo23VXefHpWcMAMaoJl3/h9zIF5V1V3/2DM9KIe7sK2IK/MvUGaADZS4VWW/8J/zz2CqSoXIJrT4wb1iRDSS7/8XEv/c7H6DOnRarIYuEP6HHkD2ypg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW3PR11MB4668.namprd11.prod.outlook.com (2603:10b6:303:54::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Tue, 18 Jun
 2024 19:34:22 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 19:34:22 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH v2 0/2] Sparse errors on the i915_gem_stolen
Thread-Topic: [PATCH v2 0/2] Sparse errors on the i915_gem_stolen
Thread-Index: AQHawOYxeSvavwEnV0aDn/vQCl8wrbHN6vig
Date: Tue, 18 Jun 2024 19:34:22 +0000
Message-ID: <CH0PR11MB544406358146035F905D6862E5CE2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240617184243.330231-1-andi.shyti@linux.intel.com>
In-Reply-To: <20240617184243.330231-1-andi.shyti@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW3PR11MB4668:EE_
x-ms-office365-filtering-correlation-id: 3e42b734-326d-4906-0847-08dc8fcda79a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|376011|366013|1800799021|38070700015;
x-microsoft-antispam-message-info: =?us-ascii?Q?IA0Ro58kMjLBDRQ5gSqiaf+Ao/tcRWT5LnYp9+qgFkzTp099mYZoYgLMyjzD?=
 =?us-ascii?Q?gN0azrxHJ0UF8IXZsaIRHPWeDlfJJHh3yfcKuIL7/P5nEzuB/WQc95InoaT7?=
 =?us-ascii?Q?d333uAzjA8vPpy7g4IgDLGBy1pNtgoDgF6QJu+YT5vZq7dpntt+I7APtDxEw?=
 =?us-ascii?Q?CcbVTT/buGelshl7YcUt3PYXDDP4pnpzIsweBuFht7XRFu4gslyt6iqACryQ?=
 =?us-ascii?Q?CurP5OnfxILUrrj8iIHdQA7O0ZCzcYTj8bqqWsxzWFRlpm2ocWWWhek1jOpm?=
 =?us-ascii?Q?WzbQq19Vv8p3mFEq+a0QyfFpavdq58wAXNZq9Syix0SElK9Tw3r/H379Ouii?=
 =?us-ascii?Q?CbqGxFoff3AlhGYUGDRMAJDO4ikfS7fGS8q6aNF47CkmaONoCBnoGk69QF/s?=
 =?us-ascii?Q?G08bTcTyYw0aqZyZ55gfZnGhe0Sd7O9j6v4zotf93wkRmQe8bgLSwORFezrD?=
 =?us-ascii?Q?3l59e/3vkS9MNtA/D2pqkJUw4wxNh8was+JC23vRaCNb/sVwg4dNPTFr0z14?=
 =?us-ascii?Q?F4UKOitD6XI/AstbalhmCokRkrK3saFMW0iLRpww2Gw8uy73fuicMBTLtZfp?=
 =?us-ascii?Q?UhzVXGD1Fp1XwVxYEZeDLRFKVrrZFEzGVoKYQG942MBCMl4uq/5W+vB41TE2?=
 =?us-ascii?Q?i4g0Pn/N12EV1i1MO8KlMRFPKFFPrTqbQUA3OJoGM46deEmOkqlSf1KQzZRK?=
 =?us-ascii?Q?tX2ptHcREMyhrg2bL6n2MqeBHIqmQDq6B6xAtFpxVpAnAenz46SSDl0+kupk?=
 =?us-ascii?Q?5/2ZgklGu6UkA3EpYfpckhCmIGG0yrJNvMaqXIQzUWRYdeoBuwykUHQzhfgF?=
 =?us-ascii?Q?VFkhPOgVPneZIneuruRi0j/r4YrtRGF80Iwdsgued8xX/NJ77pqrhmBWDsBg?=
 =?us-ascii?Q?p5dLxPszRCHlwGRmBo+3Ti7vjox8TDZZWs0Pn97RVbbN3kD3y6GHIhEINp6P?=
 =?us-ascii?Q?EgTEwrGcvdGkEhpQ0JMg0PDFQ3pJaXgn76zeafgenPB2YtYuVTtA3QdFvmRT?=
 =?us-ascii?Q?g28dtZ7+IM7lNUxnExaeGS854Wi/o5HJehnGRBxMU8207QdxHRco6kbSGUls?=
 =?us-ascii?Q?ucd95M7FntGoBuZUd5E3KujwNuoCxFT5gQkQtEmutAYhC/YqMpm8A/kBTKpV?=
 =?us-ascii?Q?MqC5pfwnwrc5dwj8pgkJC20VFs4h5otanevJQLG87iFlddB4L8BfT0Y4Bc+a?=
 =?us-ascii?Q?GqjjjZRvzTTsGDHiu0puzetr+P883n7xKMECJUi/eXa4YmjHpz1NqVMU2/bx?=
 =?us-ascii?Q?WVbn7a4SRW9A3l/gx/uZSY+W9wVLD0v5KbPUap8uoEl+UZarHK4VVRYkHf6q?=
 =?us-ascii?Q?tRnLTVmEl/7pVPCrFrcaIEFdbH939CvteuhKxBbzLrhm5t9b36h6NT6LcX2j?=
 =?us-ascii?Q?MdNdjIQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021)(38070700015); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gY5Dm9g+Oe/Z5qpz/CK76qhQqaWqGEwZ1FWr7qsPZPsLRHWA2aTPadcsAhzX?=
 =?us-ascii?Q?4rGK2ZroRXt9mfdoWhZUTchhTiKyYitdhNHfnxwawemMpAEAXgVKC1tzQouT?=
 =?us-ascii?Q?+HwxW2TkYDGpjSTvyqmQ8UzcT1Uwvi1pltuihDaAOSKz/44v3dq0iIG/a5nG?=
 =?us-ascii?Q?ocZsn6Jvo17QP1Dzke0SLBW2O9cCqHqdTDpRvlx/+JobD2yHdNj8RHcYtNO5?=
 =?us-ascii?Q?dR+xR/jlU+msZCzm47lZ7vXE4tDQeGgzz6nKB+1/dPxIzCSsRsDagJVHVzLL?=
 =?us-ascii?Q?QuC8d8g4WiGPmOEJtfawS6Z7oaUjXJP5xZfuYzQVuEbAcpd/scS1GXfAzg+k?=
 =?us-ascii?Q?MdRYuSKRACAyD5WxAUNxuFa8lLmva8JTi0fXeo75bnWwW4AnRvZasVvBUvvr?=
 =?us-ascii?Q?JZK+sUKpONX3xNlPn7g71tXm7cgrphd5fcPw88MCzonIvwdLzv8bgoZc0SnW?=
 =?us-ascii?Q?0c9LwWjy/S1IU1MFLxb5Lt9CqYwfPLjFbeiKloXFW1nkSUD8S4P0C12M07ej?=
 =?us-ascii?Q?/GulvsgOh2DaEApvIz1qhoIaWZM6uKVRxzpkR6Vgj0f1ak7Epr06z4Mb71qF?=
 =?us-ascii?Q?ProuYYfbQQFgW1VSAXLHRfDe2vYtmYPPPlHU0/ImiWnLSMwx0qH9yPvSaRBk?=
 =?us-ascii?Q?WmUync44z22hhQxLf7lyUIEah8AtazAWBC6hLIs03ni+uGXTp4ULnszf+6uQ?=
 =?us-ascii?Q?IBVDzn7ZsO5eMcwjZ68Di5NQlqGFb+goL0UCMtE1bD0nusPz8lBuTSNR0XN/?=
 =?us-ascii?Q?k9SCCA6WKiGd0iuYEHTgD233SIq5ENRMmr9ZFQoHbNPHRJdLDhJczKRpPRKj?=
 =?us-ascii?Q?DrCP0x50VcgxHEk9TVA9wZjSNvPIXuBWFoK8odS1A1mqKcnIf4F9ekb15/ZM?=
 =?us-ascii?Q?O6su6JTCc4IeiYmuzKyAkNaHFUNq9d3y6DfiFr2LwUG8rugo8yogr/w91pxy?=
 =?us-ascii?Q?VxesQhRx1CP/UtPtrsYtVtlMtTdonTjkh49uvtuhabdr8M6B/Z8SpYPXnmyH?=
 =?us-ascii?Q?jYaYDLM2bzJDqfjSOeADEcqgtXNwxk9vmWseQYztjTmHps4PTPQ3pp6AtE/9?=
 =?us-ascii?Q?VGMkL9rGgwaAAgLpXWhkdbprPrxf2X1mvWJ0r9cVZosu/RQe4PmQPsciCwRF?=
 =?us-ascii?Q?LiI7+rSy9vvhtmOm3yis65AJeLOEu6NzlGfN8dydykuA7yfg6pro0Nv67EkJ?=
 =?us-ascii?Q?GeFW6ZKfahjELCBZ8WW7OVfBt5lh0QusY6wxJkPEFrCBewIEZP7xn6ofxH71?=
 =?us-ascii?Q?DTBsdSZFuCYd9ib/Z6yVTakVrJlaaksffTCBoETkpRRkwUlkNrrzl4VjTB81?=
 =?us-ascii?Q?gtnEPKdFP4aGNDqTCIuGMm//ro+HvIenFeXcicX/hEt9tEMY3XR69butjfwf?=
 =?us-ascii?Q?wNiwE5nTKr/7oLgGCFbFkYwIuANaEvWlkLS1/F+DyXw7iGByoreZe5peZ0sU?=
 =?us-ascii?Q?yhKdRk6UNPywmc7Gc9RNOjTUVOp6EhZ0YJ3Fwpx9czYCzUfLm6ex3SenGxOp?=
 =?us-ascii?Q?bUbl+WkNCT2ZoAqNAxvNUBpb5+gMvxdwKdVkFS7pjoOR0T7GZTJeBTxNBG2D?=
 =?us-ascii?Q?EQxFq2LYxGScjVZ2vpa8dK1+J5BePm11L0dkSeoB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e42b734-326d-4906-0847-08dc8fcda79a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 19:34:22.2147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c235leVefgmClS7ANXXWccAfePNg1+gta33yHi1Yy/859YbjA2ymVrlMLiiVQgi8DE18qfMIsQg87L1A7bXr3c/vqIMWKQw4+zeNomdjeRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4668
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

-----Original Message-----
From: Andi Shyti <andi.shyti@linux.intel.com>=20
Sent: Monday, June 17, 2024 11:43 AM
To: intel-gfx <intel-gfx@lists.freedesktop.org>; dri-devel <dri-devel@lists=
.freedesktop.org>
Cc: Andi Shyti <andi.shyti@linux.intel.com>; Cavitt, Jonathan <jonathan.cav=
itt@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
Subject: [PATCH v2 0/2] Sparse errors on the i915_gem_stolen
>=20
> Hi Jonathan,
>=20
> Commit 05da7d9f717b ("drm/i915/gem: Downgrade stolen lmem setup
> warning") produces two sparse warnings. The first one being a bit
> more sever as it might cause a segmentation fault.
>=20
> The difference between v1 and v2 is that the patch should return
> a NULL, which won't cause any issues.
>=20
> Andi

Sure.  Apply to all:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

>=20
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>=20
> Andi Shyti (2):
>   drm/i915/gem: Return NULL instead of '0'
>   drm/i915/gem: Use the correct format specifier for resource_size_t
>=20
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> --=20
> 2.45.1
>=20
>=20
