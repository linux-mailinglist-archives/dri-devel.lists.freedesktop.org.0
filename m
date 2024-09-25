Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F975985ABC
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 14:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C30910E9E5;
	Wed, 25 Sep 2024 12:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MVU3GxMV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4895410E9E3;
 Wed, 25 Sep 2024 12:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727266395; x=1758802395;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1IsW4PIleq60Gxdf7PaAcS0OOmLvXHsqg5SPc0dcQh4=;
 b=MVU3GxMVWz6Ncws+EdqUIMXnRWlH5pub2uX2I7mzsvkkkOZNQE2+9MBu
 HlacU1fbdhNsNEZR66VqjA4A0JfteA00NvWxcy2/gBKZyClrq0Zcn6F/+
 fvrDsxlDvTA4EQDA7yFeaBuigLalQzGWnKsUOQ2b88NWRh3H5o7993euf
 mG/S8+w0t9XoNELwOtWkimF5RzeBHADkF9Kijes5t4ZhRP/Dmbz/zmivk
 lUsWw/o8Zlh9N30sceCu+MEmje1esFhLmAgdwQcOH01XpLsMnyl45bjRD
 wz72mSTadX8i5Q6CdGQZG13PD2CyohdcA8ZWrV5dbhWmIfsmnNyEnw7Ys A==;
X-CSE-ConnectionGUID: 7Uwdl9TURW+6UshSj6fXOA==
X-CSE-MsgGUID: YRq2sq3WQ5OU9s9co1KMbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="37450607"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="37450607"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 05:13:15 -0700
X-CSE-ConnectionGUID: ysXwaEysTAiov2v6g4LtaQ==
X-CSE-MsgGUID: OyPu0wD3RiuS9/08XPR++g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="76680836"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2024 05:13:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 05:13:14 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Sep 2024 05:13:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 25 Sep 2024 05:13:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 25 Sep 2024 05:13:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RywF516QhUF7kyNsYEfl1DVnM65Sh5xIr/kSCS5Xetri0MeX4vnv7UcFVd1No0lguHaKgt/y9BLZYvTdNn1a1O++7vTY53dTxTmLGwHf8+L1YRTbuCHyN1pmwbNHvcmFKhqx14DOYmssRN0ZmibbP7UESEnrLZJb6+RTf31RzbgU4myCz5V4olDiuiQc3Fo07tjPta38k20de7J+//ExRYFgBDhgUyxs6dOuZrbSdjsArPu69iaH8NPLnrfksegr0VccJ2Jorz1DrfX4eP0TH4nHKY2R28HZ+7cBR1On30M3iwzsZ0Ei/ghZsysBbHuU68zEkavPbi1DS/mNmzLZhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yYMDYBGq5AJa8vEMIYzxamnNkZ/fxxdS2hzHcasss0=;
 b=GDSgQkzUUnCSH0Tzurd/pIXaN/iMYnHPd9J+ySUBQt61JgYbB8ipOgviRMfB7JmVVB4PHwk2dvrFzJExQ78nn0kQfW+xWZ/NMsmOgEfSs7YD9myVlwa2LJb+9v8k+PW9qBdNu0D3guoryvPNUZ4FmwDqEv9K6EkpuPKHD5H2AwBTpxtwzLc7wnroaZpIEEc1Hhkq5t3gnsX8pY98IlQk1+ualbluHY88YnwJu1z1Wh8MbF9Qzjw5yvlw/IGHiwTONVtHeytsiaIXsllqFT2uHsMcteyE3bfPdhHNKr6/1SvBqxcDR/7iU5gKG/PcCMfuzyL71Z2/jzV1fIdUmRSH8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DS0PR11MB6542.namprd11.prod.outlook.com (2603:10b6:8:d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Wed, 25 Sep
 2024 12:13:11 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 12:13:11 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCHv3 6/6] drm/i915/histogram: Histogram changes for Display
 20+
Thread-Topic: [PATCHv3 6/6] drm/i915/histogram: Histogram changes for Display
 20+
Thread-Index: AQHbCpm5LC6VBtL7VUmDLd8pXFhs7LJoPcyAgAAVoTCAAA9gAIAAD3KA
Date: Wed, 25 Sep 2024 12:13:11 +0000
Message-ID: <IA0PR11MB730798D926F4304971D16283BA692@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20240919133140.1372663-1-arun.r.murthy@intel.com>
 <20240919133140.1372663-7-arun.r.murthy@intel.com> <87y13g2jkq.fsf@intel.com>
 <IA0PR11MB7307181EA5C6C135E28BD6A9BA692@IA0PR11MB7307.namprd11.prod.outlook.com>
 <87a5fw2dfz.fsf@intel.com>
In-Reply-To: <87a5fw2dfz.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DS0PR11MB6542:EE_
x-ms-office365-filtering-correlation-id: 0b760b5b-865c-4f0d-7594-08dcdd5b6cbd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|10070799003|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?V+uVKC8/GcLeevfIFwBzo+uGzRiomRygo1crkGsvp3mX19xK79vopJNALU0H?=
 =?us-ascii?Q?9UJ5UJUcyszBi3VVvo+Cy+HiYX0dlhJywn07mOoynYj7887u25UYezcVwZmR?=
 =?us-ascii?Q?tkdhYFSzV/siVJzj6lV6+bJ6goqYkgRRz9h27eZ6icdiRW0sWL946BN3/jDI?=
 =?us-ascii?Q?Fa7OntS448mLlu22mquA7VYIa0DPpk3/RpEWhRJ3B2CJwfYbD/qblcIH57Vs?=
 =?us-ascii?Q?30C6cbKxarnf2lK4zDugcPhnTU/aus4WoaBrJM8ds89qcoFy2R41olXgHGe9?=
 =?us-ascii?Q?jn7zPbuwphn3C1P9adyYpw41PWSMyMeUlH8If5aSqPgfgD3oKkU7RWPlDv7x?=
 =?us-ascii?Q?YVj6uZCSCm+K7MJHxiyBtOxsqDsp2L1FDJBXZ+yHwlfbjkPiKDfQ87HjgaPL?=
 =?us-ascii?Q?sT3+A0PscXyOq8798vdmsNegGI+APd/bzd1ZZxJS0DJfPfHU1X/hht9nEi2E?=
 =?us-ascii?Q?7QH56jMBXgH35fF35kGROA5c97Vvp4nni0vJY3kiB2YaRw3LpWmY+rB0nbSw?=
 =?us-ascii?Q?s/2HuP6RTRH0Xk9kLerVxoBxxjt7093RnKplzNAPUHJbVo2MYc5o4s4RpGaY?=
 =?us-ascii?Q?nbRXS6yAZRurIGba6iTzWqm7L4HIYBjtQAWIJTRU7yK4MjwXajWVpakBjU7h?=
 =?us-ascii?Q?z4PV2wQB+NSBd+ohJd6y0oRZMSX/nLzBdq2aL02Sp/pV8PGGM3hpdoRwbiyQ?=
 =?us-ascii?Q?wAqYCVdbA9LfEnnFHofiRA65/3wXFpPxHcqmC76ukPuTMNFIEJnvTpX+6X8s?=
 =?us-ascii?Q?jzsdl9pyaqczunXj7TTomzRcDeNmB5+zXfTYOoTurd/S9sB/t1xBVK/Yny6E?=
 =?us-ascii?Q?cUXDeLycNF0/dxP9jbcD+Q6fJBBeCY3rggUElqAXqOz3qglF1Ryio7J2qjsa?=
 =?us-ascii?Q?ET7D7xmn6yKakvE/Sb6NkvJEjWSJUi0N37SvGl2GXUv5B4KKrVkhOiaoL4fV?=
 =?us-ascii?Q?wp1XIw8x2HvW90G7zo8aIZiOaW3BK5/ADmeQgZFBqkl0hN/Dj4/4K29F4l9K?=
 =?us-ascii?Q?wuXV+nuvPzID6TCvyxvuo5VRUWOdS+zF+cX7IogWMrPsxfGO/P4vL4CiHWaM?=
 =?us-ascii?Q?AKq4/VMVaNhyvWMKLNZLr8pELg0UKZmNUmejsKEMocoAkas8Ym7KETfPZbv0?=
 =?us-ascii?Q?gfdE5wM+kh3E/kiFVYciON9tXinD202qWA/WHjtT75ZVXdg+kiQhWbs2YI7k?=
 =?us-ascii?Q?kHIGyFZ1/12b22ltqImWLa+HWpMu6pzHlH0Oz8M7y3T4EpO0qryQl3juZ2CV?=
 =?us-ascii?Q?EMMok7BEBGas/qbilbYUWeGG6oURKi59+RFxjSN8hIC82XId3Nf4hhofz9fH?=
 =?us-ascii?Q?CVCnLOYHlOOJveKdLru/y5OtIfyFP1N7Nep9ZVBXF9/2pA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NSKAz621zeYPwRiuomJPzFkMOkundftkQ9ZCbH3P6KyYBgX9QedSUopG/DmS?=
 =?us-ascii?Q?cQ/P5450J9VWP1Bq5LhMpX+c5OFCx/gXxoHrFK0+7Wkw/XfQZ27GiRHze8Y8?=
 =?us-ascii?Q?1sJB6y6HOwGL1VptRJRCqJj6sMNxhd+2nU+EeFgC5s6TSBQ+SZJg3wAxk51T?=
 =?us-ascii?Q?fbHxLduVzSZOTl1JJGXfl64Hx4eJtCjxVvTO2Mwj79S9fBHHxrmVTuwR+wjf?=
 =?us-ascii?Q?aD4zPfg7YUYXmSGGFti8dil+VIRGvFrN9apLTghhBETFEYi9K+U153HQqBCO?=
 =?us-ascii?Q?LIcbSBkhHARjvcZCzPEmw63GBBbRIABGvvdBC5fRZ84zBz2/wRNMKNGlo0D1?=
 =?us-ascii?Q?kseTHnXzmHFaadTeguwpGS5/lB4q1wo+XmJqOzQa5rYcjAvsMlWN3gm5E8o1?=
 =?us-ascii?Q?9v1Ayhob3Gyke2Q1GvDkOdv3k3UlredMowik1/Z6FLY0B06pz6QmJoFmm7k8?=
 =?us-ascii?Q?Ew4wv8CUxeDW8f7zqhUZHaaON1S9FqVtl8q8hS/2bpElzHdblf/ft0sEM3To?=
 =?us-ascii?Q?AeTxxpIfkbKiLeDgIjLTP7DGcQSaC5+Un8ICY9mkwTqrCBpsUeq5+vZs5ByG?=
 =?us-ascii?Q?CCTDHOKAcMu3wqi56xRGKw4GX8eZPRUAp84Z+/BCPqswuA9HURQ48ufe7kp0?=
 =?us-ascii?Q?o2VTpGjlAutAsBHnFYNnEfLFEgxD6pDdDta10gMAuSsMslLjt0weQ0bPvRr7?=
 =?us-ascii?Q?yYsuuNnmx+wHUrVdnRZpe2C4q8hEBk/Bf4t9iKsSq58aSwpdW/U7Zjrfnj57?=
 =?us-ascii?Q?UhPkYBo2Mw8aEbymerkjl3aYHp31UY2+DJESwY8GAv9TgmTt2EewG9VBSaqJ?=
 =?us-ascii?Q?Y4VI2EymcirTp+iScgxHlDsMakMQJH4llfd2QiGxyu64/hYgnAzM0/m7a2/G?=
 =?us-ascii?Q?B5tkPIfbkPLqKOP/tF8lYmdM8KT0mNwNY9qX8DLzmpJk3FmEbee/YQk+3hBE?=
 =?us-ascii?Q?LS6nXerxqD8HEvf0mv5n4wwCWEjvgDXY4YkfirLp8CsLPlIJoD7NflK72Oa9?=
 =?us-ascii?Q?HqfVftpukp6VC8dgeWfz/vFald3HKmA2Xi1AX9MYr7CzVANty+saP8Vn7E49?=
 =?us-ascii?Q?4sJGGQaXyiHX3u4wnO8cyBKCmQdxC+d/YR2tqNk3+0BNQ5QkQs+8ndQNL+WQ?=
 =?us-ascii?Q?rGghutB96LT6dCnLv3G+CqofsVCnWZGHvDJgm3PoDFJK0Wk7545njLsRx+y5?=
 =?us-ascii?Q?0QGVnuAAHiVhVH1HCJnOPxdG00w/5+9hopwKe0iamDarpQT98zHACz6yJZLR?=
 =?us-ascii?Q?CjnSYjkirV4mlikx+tAKvul1TUouIRbM6/na5eu5tDStWMTXjw3GhGcyRBa5?=
 =?us-ascii?Q?WZ5DLM9hbprSudqLaHRAprOR01MJIQde0iXNdjZ7l19WxNgOYSu6POG+wkMP?=
 =?us-ascii?Q?ELBCaoxTBKhMNI4a2hIVEI/aqZy71cSk7cfUogfxL4m0c9g5paqGCYM19Z4D?=
 =?us-ascii?Q?8CL2EAXx6iPVlObeHhX8W63bdZ4BTsGF3yo+6unlGx1xFBta5x/qkSSiPFJO?=
 =?us-ascii?Q?UoRjB10bNYAxR8CPzVZ+SsZk7JPHXpx7deXFSizWdMbWvSyTb/0Djpw6PwP7?=
 =?us-ascii?Q?GEXUNkb4PpCTWc6p/S9fK+q+43thVpvERt9KN/5AL2oG6EaKbeOwEyLGdMbm?=
 =?us-ascii?Q?bMtzeLJmfrF5bKMdcZoWQv0R6jxYgOkTcmOedVgt/epL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b760b5b-865c-4f0d-7594-08dcdd5b6cbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2024 12:13:11.5582 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xRrNfHuEF9D/zS7Ikda+3W0VhAG9QyC2w69QidUXXEeZWbbEkzZCbD6uDnNVPBiC2I3llVz+xjD8tcp5M0E9LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6542
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

> >> > +static __inline__ void set_bin_index_0(struct intel_display
> >> > +*display, enum pipe pipe)
> >>           ^^^^^^^^^^
> >>
> >> Why?
> >>
> > Sorry, didn't get your question. Is it why "enum pipe pipe"
>=20
> No, why __inline__? What's the point?
>=20
> (I tried to underline it with ^^^^^^^^^^ [1].)
>=20
> You should basically never use inline in .c files, just let the compiler =
do its job.
> And if you do need to use inline in headers, it should be "inline", not
> "__inline__". See include/linux/compiler_types.h.
>=20
The code within the inline functions is very much small and in order to exe=
cute
that small code with functions involve register usage, hence thought of usi=
ng
inline.
Will remove inline!

Thanks and Regards,
Arun R Murthy
--------------------
