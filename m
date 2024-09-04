Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7D796C5D6
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 19:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885A310E786;
	Wed,  4 Sep 2024 17:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cz7RCYR2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E27510E786;
 Wed,  4 Sep 2024 17:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725472605; x=1757008605;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l/O/NzOO33wHfkaIuHPuyGaV2emFel/8UMyz4tZGw4Q=;
 b=Cz7RCYR2zTxuRIUTWOQRy4WBICgToFAOQPQJ62s7eOHmgB1KXK0BM4E3
 CXApRoC2R8VhdfUDDqpxwlC7Z/kEyPH3yTVu8uW9I11sbWj4TtcdFC9mT
 Ud1mQAnnjvQkx7u5xuh7C0G4pCzdDsxQxGFmlMtmSFNzY+EkN6Y0qxHss
 PyQWBhmlnEHBltVkx1RJc3B6SkrKyfcwaDNgg2ghglsCFNUfp7sGGjiY9
 Kvqvbg3Qj9npqu6fYff8st1F+/h9YrVvmrH0gbvhKD5WcvO7PLQoNu/Qa
 0tgiCmOj3/2igyutVl1q56NgJFwJHcCOUBSZBG/tl3wzgf2ti+9A8xeEF Q==;
X-CSE-ConnectionGUID: cBSQnWHnSZi4Dayz+yw9aQ==
X-CSE-MsgGUID: g2/Ure0XRR+hecgDJU7lXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="35312013"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="35312013"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 10:56:45 -0700
X-CSE-ConnectionGUID: ZYj8Ub8YQ8KZKZLhV4+wZw==
X-CSE-MsgGUID: MUO0ah5sTuKVvT652Eo8mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="64997567"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Sep 2024 10:56:44 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 10:56:43 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 10:56:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 10:56:43 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Sep 2024 10:56:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvsZwndYe7iKLlBZM/kJRdIcYTaDTn3y5XwC/XIpCxdpL8pGbl5U3naLbTkObXB/0kAFvMg+zuLKinYgMds6VFLXuQq1PB74uqilL9tOn9VKT31shpWRt3f2f/QecuteiVCGSwkl2A1ESScDP0Gvfs5i1ylIgbcVO1d/gkHLGiut3lFAN3HBXfJMoUll4bJ0I031UtFyRPK857CoOR51PE6MaON6jYOc1ZUjHn8LuTSc9nqxyXzxlURZh8jL/3WiFKAEST3XAyACKRuP2F+7nPOgJSSxLwfU/8RIbTvcUagfiyg7+wn90AFPVk6R6MsShcUXacUa1kNFhi8xEm9eXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbGT4stCv2Vy0V8aQ2vnwtBK6dLy1HLxBPGxzB7UkQs=;
 b=qKYFKpRlkd5RSgo0xS+iR+zZ7mTI+oWnQ7LjAPuy8u1YxKAb9NqXmQLq0UNUaOLP9yzxfTVFFzG9v20l+8/ZfWqh5uZKhuaQkPgau7T6Pmcef8MTsN/1RaFlZfjcfB+Gur/VNvDNH9potG1OeTRsKKc8405zzAuE3FtFmDUFqkthLXNb9GqHDxoGftxu7iNdc29in5YHSvzF90KlAiTomdH/fbzaT963la3+s8TsdJAHodZJ2ryqVRpove2ABPGtqhocYjj5A0J9uOX6oQYw7ZQuAAc9V9AKrP1u6KkMzTUJrR+gVXV1rDb8PsWz2IkYiLnCfeqebifn4h0Al+pvKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB7189.namprd11.prod.outlook.com (2603:10b6:8:137::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 17:56:28 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 17:56:26 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>, "Landwerlin, 
 Lionel G" <lionel.g.landwerlin@intel.com>, "Graunke, Kenneth W"
 <kenneth.w.graunke@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/2] drm/xe: Wire up DRM_XE_VM_CREATE_FLAG_EXTOBJ_BOOKKEEP
Thread-Topic: [PATCH 2/2] drm/xe: Wire up DRM_XE_VM_CREATE_FLAG_EXTOBJ_BOOKKEEP
Thread-Index: AQHa/uyelnRjlCeaZUKukH3MdUIou7JH5DgQ
Date: Wed, 4 Sep 2024 17:56:26 +0000
Message-ID: <CH0PR11MB5444A0863DDD5B12F3C199EFE59C2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240904170500.3303081-1-matthew.brost@intel.com>
 <20240904170500.3303081-3-matthew.brost@intel.com>
In-Reply-To: <20240904170500.3303081-3-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB7189:EE_
x-ms-office365-filtering-correlation-id: 959e90df-8651-4503-8d15-08dccd0ae556
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?9CVeuxhM0NFRY0XbiWLAIIM8/3afK7bzablO5QFpazrfJHdKcZmQCWCwaKKR?=
 =?us-ascii?Q?DJ6m9Ml5d6YnU12weqNWery71Y5GVR4kOa7S5GA1zjKfhcj9EPusAAYJfcIi?=
 =?us-ascii?Q?UR4Dm37fE69/NUcXSLHlO2uLGljrsbLHeLr8Z6rJ1/jeFWetwOFm/+1TgNwt?=
 =?us-ascii?Q?SQJyeJhHjVhGZQffYazkPhA2GszGYudoqZOe7SO4SWnKs1I3WGGJrxeqhhXD?=
 =?us-ascii?Q?uhc9DwRFwKGHzLxPReXhyeRNWFW/6THTLTeDevZAjtm9krY0EaEN5S0uNi2u?=
 =?us-ascii?Q?06hL5b3fdSgOAoN4edH3wTR0YoF7PkucmYAWNUCunrXaAyxVqEBgalPB2RnA?=
 =?us-ascii?Q?6TQKC0RTVKwSHKsYiWh3T48QGUmgYqgKXTOcb6w+saSqAs8gqtO+doxtLkY8?=
 =?us-ascii?Q?Z6Y9Hq8hlEoO/IyTxSCzsfPwfOU80voYYSIz4XJLMGXH4r2aO8ZZsA2VU5P6?=
 =?us-ascii?Q?32iYyIP6okYIZ9NfQ57eFmsywS0CgJy26xZow5/ye/926ijek/vkoqvqQg9/?=
 =?us-ascii?Q?MTss6AtAL5VYAUJIx62XfunrUpHUDojJmN51C3aYU0W3ae7/ingJl0GdN81S?=
 =?us-ascii?Q?n1lD8sAHHNGOSF66Pfbh9Vj8epvVQKG0yM6MZ+vzAPFnEMSKjJaLVOLY65c6?=
 =?us-ascii?Q?6At+uQ81NxupXduNv8CG4mDNQkDE2K/7hDt7e2JESHbMJgS2mykWP8rQGWAf?=
 =?us-ascii?Q?FUPrk5SBHIvkr6eEtoDcSlU2RAdyqnCD0ABQBsZQdAual+hJIO7rxsK4Y7Qf?=
 =?us-ascii?Q?85L/Q0aCj9R1R0Sd8K277e3Ld3SW4jLvOPVaIHRe3bNB6GbRcwZyuQXnG6ib?=
 =?us-ascii?Q?VfZMEiYjTEfIhyCALlZZNhGkK7Y5t4V6HDJB93JrTVV+OxSTHKbr6B2RedUR?=
 =?us-ascii?Q?JKbFdRMiimUN4yJ7c4M8MYbLwysNn4W29+y7KyffikhEqjGXrrtsDnHdIRn3?=
 =?us-ascii?Q?/iVm7v3DsXj55jOuNPjJxN/1JjWZlRODX7Icj6aATohn/SCon9mqMp+sPEMl?=
 =?us-ascii?Q?OFa1+LECMQ0/01E1M7M5aq1GYkyJyV4UtOmC68g7HfhrY4tnaEWQ1vr8UkPG?=
 =?us-ascii?Q?ANEURd1Y5ES+QMMd+Bn4GiH/j8qRfrheAjcpKw/gtNU0kwV6elFP+Aacn7Ib?=
 =?us-ascii?Q?Kn6t14knHUgzQ/eJsz2PUBLQdj7u5yNogyCgZFOGOgPymQG+mesD3g0l/dSv?=
 =?us-ascii?Q?oyzK3dpoJKvoVfFVHH0Uk4hoc4lTH9N8CPSqmuDhDOORPh4h99LINdn2ZR6q?=
 =?us-ascii?Q?FVk4PxDT4Ltt09Fset6G3OBa9Z9qMm5IRvaVIUTaoV7N6LusFbEKLAaxetfv?=
 =?us-ascii?Q?4/J8GHh/JQBkcqZMFUPtyRPq7NwBuMIPp9AOvuBciSjt8LENsBcoxUhT3Izm?=
 =?us-ascii?Q?0shp0eA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pbDSl2rDIhxh7qOPJfa61NOWo0qPUtr5n8VBSLuJjnJtOTDVtUMy5JB4e0SV?=
 =?us-ascii?Q?Nhq8QfO1Tlu5CouMlD9GmBAJHVahHh66uOY1ggm2MlGWPPYw02XhGrR+KIPr?=
 =?us-ascii?Q?aQfjIoifmC7mwwVRiouZiWn5iMjeh9BsEIFhIKwQtHE6RTz6nId6NVDwiUdU?=
 =?us-ascii?Q?YRu7Upo1qpakWxic3ireH7cRlxFIrVCsBR9D/Jf1/R8bivR9/s97Sf/stozN?=
 =?us-ascii?Q?21zMo/ZdBPUrKdW+uGHCSDDMlKIpnSZwmeCYttddrd+oyZSOLESDMoL8HKDm?=
 =?us-ascii?Q?G4c/pyQPmYoHcGVirzTPTyamZ+Mo88OoPRQ0Cp8JebqwGQ1hWUOeu+b1yYdc?=
 =?us-ascii?Q?WfznPEjwPVVyuMTLCAUjznE9Vl+oY3ZvVV4RnV6SknqpUWZgXP1dTiJLr4I3?=
 =?us-ascii?Q?0Iqvon3NO7EN3mUgyzm/mvkeoCob++MlCeuwSQbPj+gY5gldqYay5Y/+l3Gu?=
 =?us-ascii?Q?r3wsEJqxbwOJxtE0iEGBQ3bA+eG/t81p4UIAF6tV0u+b4dY2YRaMKIex0/5t?=
 =?us-ascii?Q?X0XBlmA7GYzsIbfuAcBbUU9gghcT4a38Wp7vg5h6HpIDhHfh4SMHXiHMWCih?=
 =?us-ascii?Q?QNT92A+1XjIklp0l714SJGc16M5PZoUyup6+QKyvt/utrR4ty6F4QRInH5As?=
 =?us-ascii?Q?lW3HnWdJfm7/AWnrckG81DUmWh+d1eWvdjg0cpWCwAtYpu6h+XipxHNMOO+3?=
 =?us-ascii?Q?91RyPgEMUHd0eKbpqTIrpXJqabtup6E1L0q12AJLEaigdaztXDHc01rLAJpP?=
 =?us-ascii?Q?+WunK2pqvyyi8WWolqW/0S2BFJLicgsQaWV/IbDn0FIVOO9+eAW8a7R4LH9K?=
 =?us-ascii?Q?HLCbdaU+7YyFaz7iIT7bj6Rle5UiG6PMqszuEgRr5zGHxJxH/rPAiOobb/0C?=
 =?us-ascii?Q?lWPsBTKi54sJhs3K++4cmtCnOhpAQUQlqEjDbO4VEyf30W5JEB/eanhCtkA+?=
 =?us-ascii?Q?7/UhH1/L+w3hWTZ6y4cNkG5hWcr17z6YxGADpy8S7X69X+8cwJnssHD0gz+9?=
 =?us-ascii?Q?l4LRxzM6zbqk2B3kiSNjHwTrQ8flvarnTZ+A7iu0DrSM1jW2gGm00BWABqQc?=
 =?us-ascii?Q?hyGk+9om9CjMHG4hOQffboWKcq0ArCGymWAB1uin0MOa7tAYhbSpPa4lCsDq?=
 =?us-ascii?Q?c/RA1iYPZQguI303t9mkH8URD4MMsrZ87uU/YnpLa4uhKDzHSC/YaGfZ+4fC?=
 =?us-ascii?Q?Zpt3lW2N2KKYs/Ug8x86ccUuB5qnTZ+BKZFhxnLCGza+nwbadTmaJqUGabBE?=
 =?us-ascii?Q?ytYQ+g9tFCz+FjKH2PJAB/6FUdKoKUysOQwf4kB/xU9eGG9+d5R9yodKpBjG?=
 =?us-ascii?Q?vH1YDqY91LnLx9QPbdmiiMSIDT2qrwpCAPda7xeLev3o6Y+S9uNI5rSNbvg0?=
 =?us-ascii?Q?biNALT2SdmjDPFTiZgxNBqXzDrmi6FclFIM/7IMpZPd4uT9Zt+QOUWyh88Cb?=
 =?us-ascii?Q?3E0P7XdMJKBpJlcTE5SD3gh+WKQHgYz7ve709tdZLW59tEa5hQsiJjwFxFYW?=
 =?us-ascii?Q?vWEARDehlaDo4X709fiVhHslxJR5nSOj3/eqWkl6p9f47/GQ2mNnD7LvCe2X?=
 =?us-ascii?Q?rBsWoUoGVghbalnwp+1H+1xKyDRqtaR3AH5UiKDc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 959e90df-8651-4503-8d15-08dccd0ae556
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2024 17:56:26.0509 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ov7w8AGHYN4L94RZsBvXGyOnP6CluMd/i69JuB2rt+SS48Tg3SuXkEwkGKG0J54YepUczxgHaUGZyTLIHssgngTDm2akaOeweSSuxl2SULw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7189
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Wednesday, September 4, 2024 10:05 AM
To: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch; boris.brezillon@collabora.com; Landwerlin, Lion=
el G <lionel.g.landwerlin@intel.com>; Graunke, Kenneth W <kenneth.w.graunke=
@intel.com>
Subject: [PATCH 2/2] drm/xe: Wire up DRM_XE_VM_CREATE_FLAG_EXTOBJ_BOOKKEEP
>=20
> Fix external BO's dma-resv usage in exec IOCTL with an opt into bookkeep
> slot. This leaves syncing to user space rather than the KMD blindly
> enforcing write semantics on every external BO.
>=20
> Cc: Kenneth Graunke <kenneth.w.graunke@intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2673
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Nit/open question below, but nothing blocking:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec.c     | 11 +++++++++--
>  drivers/gpu/drm/xe/xe_vm.c       |  5 ++++-
>  drivers/gpu/drm/xe/xe_vm_types.h |  5 +++--
>  3 files changed, 16 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 7b38485817dc..ea0aba77db84 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -302,9 +302,16 @@ int xe_exec_ioctl(struct drm_device *dev, void *data=
, struct drm_file *file)
>  	 * the job and let the DRM scheduler / backend clean up the job.
>  	 */
>  	xe_sched_job_arm(job);
> -	if (!xe_vm_in_lr_mode(vm))
> +	if (!xe_vm_in_lr_mode(vm)) {
> +		enum dma_resv_usage extobj_resv_usage =3D DMA_RESV_USAGE_WRITE;
> +
> +		/* Override original incorrect behavior */
> +		if (vm->flags & XE_VM_FLAG_EXTOBJ_BOOKKEEP)
> +			extobj_resv_usage =3D DMA_RESV_USAGE_BOOKKEEP;
> +
>  		drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, &job->drm.s_fence->finished=
,
> -					 DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_WRITE);
> +					 DMA_RESV_USAGE_BOOKKEEP, extobj_resv_usage);
> +	}
> =20
>  	for (i =3D 0; i < num_syncs; i++) {
>  		xe_sync_entry_signal(&syncs[i], &job->drm.s_fence->finished);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 7acd5fc9d032..a1f98f233c37 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1713,7 +1713,8 @@ find_ufence_get(struct xe_sync_entry *syncs, u32 nu=
m_syncs)
> =20
>  #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |=
 \
>  				    DRM_XE_VM_CREATE_FLAG_LR_MODE | \
> -				    DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
> +				    DRM_XE_VM_CREATE_FLAG_FAULT_MODE | \
> +				    DRM_XE_VM_CREATE_FLAG_EXTOBJ_BOOKKEEP)
> =20
>  int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  		       struct drm_file *file)
> @@ -1760,6 +1761,8 @@ int xe_vm_create_ioctl(struct drm_device *dev, void=
 *data,
>  		flags |=3D XE_VM_FLAG_LR_MODE;
>  	if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
>  		flags |=3D XE_VM_FLAG_FAULT_MODE;
> +	if (args->flags & DRM_XE_VM_CREATE_FLAG_EXTOBJ_BOOKKEEP)
> +		flags |=3D XE_VM_FLAG_EXTOBJ_BOOKKEEP;
> =20
>  	vm =3D xe_vm_create(xe, flags);
>  	if (IS_ERR(vm))
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_=
types.h
> index 7f9a303e51d8..b7056d63d8dc 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -162,8 +162,9 @@ struct xe_vm {
>  #define XE_VM_FLAG_SCRATCH_PAGE		BIT(3)
>  #define XE_VM_FLAG_FAULT_MODE		BIT(4)
>  #define XE_VM_FLAG_BANNED		BIT(5)
> -#define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(7, 6), flags)
> -#define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(7, 6), (tile)->i=
d)
> +#define XE_VM_FLAG_EXTOBJ_BOOKKEEP	BIT(6)
> +#define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(8, 7), flags)
> +#define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(8, 7), (tile)->i=
d)

I don't know about any formatting restrictions, but if you use BIT(8) you c=
ould append
the new flag to the end of this list instead.

-Jonathan Cavitt

>  	unsigned long flags;
> =20
>  	/** @composite_fence_ctx: context composite fence */
> --=20
> 2.34.1
>=20
>=20
