Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB72A749F3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 13:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7CF10E1DA;
	Fri, 28 Mar 2025 12:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kkZWV106";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A839A10E1A2;
 Fri, 28 Mar 2025 12:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743165788; x=1774701788;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wYtQuqHO2zllgHF2IgSH3FPZs6OVr+5pMGT+9OnryPU=;
 b=kkZWV106SyjDW26OJ82lY89oc/Ux2NcbVwftOqnJBHsafI0XmizsZL2w
 ceNM+Uab83TfoTKnghbP3putTOyQMV9s8DCSY4IMYeoKazsX04oEW1jH0
 gdeSUr4i+B0FSQdmiLsLB3mCRA9LkVEkUcXVlK3A4wAd3+WWjPlda8yE4
 /kSz/542DwRGkxMt6dl5VgFtOG1MF67qB+8XGK54rTWeNBeEaxLY5NV4A
 XU/m48rSKw57lb0LPI0QMhptCeD2Yi8wNKk1mfgYBjS1kB5CK5IpBuxCb
 xoLYTYbg71OhbHxKlFZzqLhAta4rAaCgDuPmkA/KL/dl46n4TYmugcnJ2 A==;
X-CSE-ConnectionGUID: xz3f14REQvalMLFDajg6xw==
X-CSE-MsgGUID: OT7hkgqwQaG/cWeInj82Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="47257487"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="47257487"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 05:43:07 -0700
X-CSE-ConnectionGUID: hnsNZZlXSuKb2/LPW5NasA==
X-CSE-MsgGUID: HVPXoP31R4ihE5J/G8nZ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="125663372"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 05:43:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Mar 2025 05:43:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Mar 2025 05:43:06 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 05:43:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmVZPzeRrF7k0wfOWBZv5xnoRd4E+ZlYh8PHIZMr4O9f2m88lF3MXuv9GN3bF28WOX8InBrePtW/21gfTO2NB5yqfUTrOQWZpNGmDZF+S94yUsshFk+9lNagmd8wX3sXWL8nEPv+ivbH+JUemVAUYZ1yLkIx3PZUgzHfAFvwZAFdfBAm5AyTUrE01yq8hdRTIscxtB7GKMHaT45CFV0JkOgm+xhp9uUsQ1ff0OytLr9lrs6okGivUE7H0ngK/tKDIEcN84gGN09KxdDARi3dIsCpu7TBKvfS42iBmTEeR5vy9LPX51G6GMQkyTugfGNdoLHi4qn1t1mT1Tlr2JBtLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCdq4PQLZiec73J17vd/jfDtMNVINYS65SU00/teXCY=;
 b=NsbhwwicqP9eD/YOUg96NO6cLI01VL9lVmL6uxGPOyukDh1LYXJ8lK/sXrewQC5eIYPve7H0hj2hCB5tb4IueJ6sNL1IN+E+vtJQTGeqmPBgr1QXoLezZiirBz+/oqchqRcmItYKebvHFmwG8G9BAa7SFI43uGhwXww6X59TybZ39I+49l+dAFdDBcxGmRo8cCioB0363VWWlzgyx+zVkwHkhJ7Pev85TgABvMItQj4WbaQzHOYSrMK1CkE/9TnNjzdjumKWbldLjmZKh1miibgPGAQlQjO/umuriMqDfV4sd34LW5NZdgsW+GWCSjEDgtwq9K79CkutV1YGaf0C7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by PH8PR11MB6902.namprd11.prod.outlook.com (2603:10b6:510:229::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.49; Fri, 28 Mar
 2025 12:42:36 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 12:42:36 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>, "Syrjala, Ville" <ville.syrjala@intel.com>
Subject: RE: [PATCH v10 3/4] drm/i915/display: Acomodate format check in
 can_async_flip()
Thread-Topic: [PATCH v10 3/4] drm/i915/display: Acomodate format check in
 can_async_flip()
Thread-Index: AQHbn8X3JWxRxLbqjUisRXX7BQhKqrOIXBgAgAAh7VA=
Date: Fri, 28 Mar 2025 12:42:36 +0000
Message-ID: <IA0PR11MB73074EE529D2C3A90CA4F3B9BAA02@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250328-asyn-v10-0-8b8ad12cfc97@intel.com>
 <20250328-asyn-v10-3-8b8ad12cfc97@intel.com> <Z-Z8nIPjHA1HWu-G@intel.com>
In-Reply-To: <Z-Z8nIPjHA1HWu-G@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|PH8PR11MB6902:EE_
x-ms-office365-filtering-correlation-id: 0fb04c57-97ca-4f19-5539-08dd6df604a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?EKmtxdTZM19rVDa5USMjIbiIH1MB5p/nQ81FxPlp7TRkOb7yxLOj7phsgt?=
 =?iso-8859-1?Q?AVpnD2DMFMU4L2VCcO6tVOlHTThLg7fqCv4kkRLBmAXQjXWNG1m16O8FLl?=
 =?iso-8859-1?Q?iAN9BagvLHv2feG/IbwJ4ie9qrgYi13rroVRbIubgquILgOLmHCqA7NpnS?=
 =?iso-8859-1?Q?WWu2HTRywN5nVCOL25DnbEkP5CRwernsIOmNLi7+GIEGP1o5R8kTU6MzIQ?=
 =?iso-8859-1?Q?DX7wqhj/xkE4I2R3WLmkWL8rotGhCMtHJ+Jl/i6qiJAmXraIw+3/fEEEQs?=
 =?iso-8859-1?Q?4V8JGL9Stf2biGf+78ER6+s26g6lr+GJSipvXn4RK92W+nt6zI3tzbOJmj?=
 =?iso-8859-1?Q?CdLkYrUdMjOCmDIq6GDmAwqkm3DOmPgnVkLO+VZY6l6x/dPBwKcbHwJ/0M?=
 =?iso-8859-1?Q?5PXFYTHIcmvSULwmMiqSfqPHYURPTwlOMpE0KNwIGGnCEeXPaYjv5h7pOH?=
 =?iso-8859-1?Q?uyBrAxWF+mHNWYHRLmHeMGdXf+0La+JvdB6vKlyCrud1f5i3aWwJqzOw8z?=
 =?iso-8859-1?Q?bzQIYqILghnGZBNXTWocXokzuB/+N15fREfzT1kh7dMsjFNvnwKdvR9c6V?=
 =?iso-8859-1?Q?S4tJneMhpzu1ntjMJO8scOxPYPQAX9XPUmp5XqW/CElYmxYQnfbiHj/C6J?=
 =?iso-8859-1?Q?yge2wE5iO1pueWnlhq/D7dhiUtbA3eTN0fc+6yGVhYpF12sl26DRp1GrNo?=
 =?iso-8859-1?Q?7SMLM42nBcDchmrJ5TLpEmop/ulh3GyZfxLlaKu1dIpDdoAg1SFXsgKXbU?=
 =?iso-8859-1?Q?n5ETZY7f9pSldN3udkHBGftX29qAsrvd+WgMlLeh6GJXDeyGqjiAp6YDVG?=
 =?iso-8859-1?Q?DiI94H8nISbe9kXhTDpOoBikmq8HO62d+DFCtAO+PVmJM/KrWAqsrLYkNL?=
 =?iso-8859-1?Q?2+kQMpCO7GBG1XehS/HoTZetVv3y0XqIEwrp0no9E8rGol7FoMSqJnLtc6?=
 =?iso-8859-1?Q?FAhR4rKm86LK1hXsxP1DNOkqUEy3Wiejr3i7sZN++/Xv9QkFRTnp48R8wT?=
 =?iso-8859-1?Q?jrp6jc0bTW0/8+oZZAskHbYPYdkpnWgqMZ2o9lVrOQL6GjB2+C/c+WnsPL?=
 =?iso-8859-1?Q?DjOPHziDLBq741oW5ScmNjzeIxP0em3oU7iUbfakgICIzOYrYn+0XcQlIN?=
 =?iso-8859-1?Q?3LvT7HFkZPU8m7dSBMsB0pUw8j3HBUx3V1zZL34COF49I5IJIGGqlCI6xf?=
 =?iso-8859-1?Q?F9CmLaOmiOoN9p+B8DUNKhnCwAWxdvId2v0JD0LwmoZpr2eAn3fjGh4AJ6?=
 =?iso-8859-1?Q?dOxd/Q7qXY4ziUmPrv4Y0Dye6/8puVLSrgvQdJBk7WH7qROh0kAH3sEk1j?=
 =?iso-8859-1?Q?OkoiYbeA9fhW+dS1ldvJJXqKgGIYEv1dgGDd1gD36fkuD09XGHZ3LmGEAv?=
 =?iso-8859-1?Q?ugFF6JLRR4I9rib2auBxc0sMLCwF8ot5Kp/JjqEOyVijfdsb+EnTp7CAXa?=
 =?iso-8859-1?Q?4kPfgPsd+V8UmoKP/sapbI9zRLGPVsY7sN/WoOSTvHZMAa/2tHzLWfZGXT?=
 =?iso-8859-1?Q?vbqFr7OvZJPjDx5pp3CPQh?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?R+EVdPWlA7+q8Gd1Pv/zDYHBzJxgBRS2wmIyhzwLqN0Fg3Ev6qDDkGoCKP?=
 =?iso-8859-1?Q?g2zNMGZ7oeA0mwfGXdZPVR2Z9o17rLcSWvoxCJ+EAoV9ntGxjAkOfXpdbR?=
 =?iso-8859-1?Q?OBalYsRDnGFiSCGuFvrzg6UwKJ3V3YNBf28aMk2peRvNCodUSvlt2GnZWx?=
 =?iso-8859-1?Q?NworivscQFis1FMicEJcJ+ikNjlCTFyCoS3rTPHQXvbK2FSHQAJRQtudYM?=
 =?iso-8859-1?Q?Z8tka6+R52eHDGRfYe2B8EkJ9/i/STSvca3jMy8ud234X2TcBG7jGBOZLu?=
 =?iso-8859-1?Q?+2wjGUpBMocFF7hH7SlQiCVy8knpN/53+5hbqmOdUsMu5D3Q4hTH4rWwpc?=
 =?iso-8859-1?Q?6fNrlI+yWIAr7owAKPSpL1xhcHTZNCi7PFb162lIepTvU1sUkKEavoV/lf?=
 =?iso-8859-1?Q?T3qGkowANqwzgti/sG98d9OL5pOXZ8YDUB69DGvutjMgjvOgbjDbw7u5kL?=
 =?iso-8859-1?Q?i7wStiCa9m+uBOZcrx6N4gbTfHoRBY/o/6fSCc9ou3pNd1jvV9t6VaiEZL?=
 =?iso-8859-1?Q?SHlLv0zYJqbdmTQ9A/9sAbvBBo1TgZlnCAktNITpEbyiIhie0EeH16UYAf?=
 =?iso-8859-1?Q?VOx5MXoadQWDl8J+ahGoHQ2ESikArMosezM/K+DP+epYtr2nhyHlwZmpC1?=
 =?iso-8859-1?Q?iN7t/jdF+xz2Qi85xSVI4Rb8pu9Y8mUFT0hRKDHK1L0rZSczizVHLzjQR4?=
 =?iso-8859-1?Q?2FGVn6DzAVstmSJmXxy+HEDHxM9zVPqAh90lsMQfTRYwidCnorgN7vpv6W?=
 =?iso-8859-1?Q?avqzr/T7dAUV8qdU3x59hByS8cYmw1j4NxqWHIX6MFq3sHaSGDT75ve3Zk?=
 =?iso-8859-1?Q?ZiRhKjyNa2DKTufjJp/cvinchQm5nFtW93ImD0hoReZ6VJkjp1xje+ZSeZ?=
 =?iso-8859-1?Q?O8fhQTWRaME8NdZ3EVfZlt7O79cbMGLnIEwnc0tsMfdi7qHKJ9fHhZyRGH?=
 =?iso-8859-1?Q?VoSJOd8qTgRCDk6BWERU42S18SiSyDbi+lsr7I+h54AeGluhPZBFL11wQy?=
 =?iso-8859-1?Q?0ZzhQzuw8gsahmKKMwoWrv42dOLj38VDBatyYXXwKsv2qTbNEoojznw0JQ?=
 =?iso-8859-1?Q?8pV8yRXuYbgzIYOiUzKimF6IZSBMjBQOnTUfsnWEQPBnxcUoTMyLwcKFCj?=
 =?iso-8859-1?Q?/1lW093ZnKYXNGaQ2pSfm2UP/TN66J0ArKG9SCmy7esbtsUooTuJSH1g0G?=
 =?iso-8859-1?Q?M4FHulZuo6go/ECVAZRlcrGHC0YW78gFM2aB7tXqUAZL9KM4BlXxoHDdXe?=
 =?iso-8859-1?Q?41Yl31aoXwykLEl4E36iaSrOYo7ePt/hF4VZAmgqM5jNaLQhmzNEDVRVhS?=
 =?iso-8859-1?Q?53s6JMPpJpibhI4VDgSRVl9z7kEHoQHWAx9y9GdNOnYA2KYEr87pfFX3S8?=
 =?iso-8859-1?Q?OXhjeoEHQ/lwzvyIUUzeRx6J7yGeXDHNQOn0cmnwa0AM1g1x4ktcusa4dW?=
 =?iso-8859-1?Q?5WXsHwU5u2vak0L59Bc6fTGDLI80i6wsiPP7YMM/24R0xsj/WhLiH6fC+m?=
 =?iso-8859-1?Q?RRaBRsD7RcZeidWhcDGLBhevP7LfeRJxQMnPSWHtsi27RIM1mpWxfmhGke?=
 =?iso-8859-1?Q?kwin7XrvNQrVJaaFiP44J65eOpEWLbRFkm4VtVStkvlCWgb7oty02H2dfC?=
 =?iso-8859-1?Q?LOKLyjDJiLkgnC4DMrL0Y2MJSDFTgr3D8h?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb04c57-97ca-4f19-5539-08dd6df604a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 12:42:36.3591 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ldtyso+ogz1TzK8becCwP/i96CCGNk8Sz0UcvZh17PbnP0BAXi7/YJKLFyoUhvIlewUxODFKzuAs/n6vxJlW+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6902
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

> On Fri, Mar 28, 2025 at 02:59:15PM +0530, Arun R Murthy wrote:
> > The function pointer can_async_flip() checks for async supported
> > modifier, add format support check also in the same function.
> >
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/i9xx_plane.c          |  4 ++--
> >  drivers/gpu/drm/i915/display/intel_atomic_plane.c  | 11 ++++++++++-
> > drivers/gpu/drm/i915/display/intel_atomic_plane.h  |  3 ++-
> >  drivers/gpu/drm/i915/display/intel_display.c       | 14 ++++----------
> >  drivers/gpu/drm/i915/display/skl_universal_plane.c |  2 +-
> >  5 files changed, 19 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c
> > b/drivers/gpu/drm/i915/display/i9xx_plane.c
> > index
> >
> 5e8344fdfc28a311dc0632bb848a0e08f9e6c6d2..20c47de6d8bfd1d8ddafae02e
> d68
> > 370df799e22b 100644
> > --- a/drivers/gpu/drm/i915/display/i9xx_plane.c
> > +++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
> > @@ -828,7 +828,7 @@ unsigned int vlv_plane_min_alignment(struct
> > intel_plane *plane,  {
> >  	struct intel_display *display =3D to_intel_display(plane);
> >
> > -	if (intel_plane_can_async_flip(plane, fb->modifier))
> > +	if (intel_plane_can_async_flip(plane, fb->format->format,
> > +fb->modifier))
> >  		return 256 * 1024;
> >
> >  	/* FIXME undocumented so not sure what's actually needed */ @@
> > -852,7 +852,7 @@ static unsigned int g4x_primary_min_alignment(struct
> > intel_plane *plane,  {
> >  	struct intel_display *display =3D to_intel_display(plane);
> >
> > -	if (intel_plane_can_async_flip(plane, fb->modifier))
> > +	if (intel_plane_can_async_flip(plane, fb->format->format,
> > +fb->modifier))
> >  		return 256 * 1024;
> >
> >  	if (intel_scanout_needs_vtd_wa(display))
> > diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > index
> >
> 7276179df878658b7053fe6d8dc37b69f19625e3..5260b9e723af3f654cb36512
> fe0b
> > 5368523082e6 100644
> > --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > @@ -174,8 +174,17 @@ bool intel_plane_needs_physical(struct intel_plane
> *plane)
> >  		DISPLAY_INFO(display)->cursor_needs_physical;
> >  }
> >
> > -bool intel_plane_can_async_flip(struct intel_plane *plane, u64
> > modifier)
> > +bool intel_plane_can_async_flip(struct intel_plane *plane, u32 format,
> > +				u64 modifier)
> >  {
> > +	if (intel_format_info_is_yuv_semiplanar(drm_format_info(format),
> modifier)
> > +	    || format =3D=3D DRM_FORMAT_C8) {
>=20
> You're still mixing refactoring and functional changes in one patch. The =
C8 check
> needs to be a separate patch.
>=20
> Also the || goes to the end of the line.
>=20
Will change it.

Thanks and Regards,
Arun R Murthy
--------------------
> > +		drm_dbg_kms(plane->base.dev,
> > +			    "[PLANE:%d:%s] Planar formats do not support
> async flips\n",
> > +			    plane->base.base.id, plane->base.name);
> > +		return false;
> > +	}
> > +
> >  	return plane->can_async_flip && plane->can_async_flip(modifier);  }
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.h
> > b/drivers/gpu/drm/i915/display/intel_atomic_plane.h
> > index
> >
> 6efac923dcbc757e6f68564cbef2919c920f13cb..772a12aa9c6997d77b9393f96
> 4e9
> > 1f3e8747d149 100644
> > --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.h
> > +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.h
> > @@ -21,7 +21,8 @@ enum plane_id;
> >
> >  struct intel_plane *
> >  intel_crtc_get_plane(struct intel_crtc *crtc, enum plane_id
> > plane_id); -bool intel_plane_can_async_flip(struct intel_plane *plane,
> > u64 modifier);
> > +bool intel_plane_can_async_flip(struct intel_plane *plane, u32 format,
> > +				u64 modifier);
> >  unsigned int intel_adjusted_rate(const struct drm_rect *src,
> >  				 const struct drm_rect *dst,
> >  				 unsigned int rate);
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > b/drivers/gpu/drm/i915/display/intel_display.c
> > index
> >
> ee7812126129227971be89d3a79f944155620b03..ff349355ac95a039272f2fe1
> 7403
> > 4ca06a555249 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -5998,22 +5998,16 @@ static int intel_async_flip_check_hw(struct
> intel_atomic_state *state, struct in
> >  		if (!plane->async_flip)
> >  			continue;
> >
> > -		if (!intel_plane_can_async_flip(plane, new_plane_state->hw.fb-
> >modifier)) {
> > +		if (!intel_plane_can_async_flip(plane, new_plane_state->hw.fb-
> >format->format,
> > +						new_plane_state->hw.fb-
> >modifier)) {
> >  			drm_dbg_kms(display->drm,
> > -				    "[PLANE:%d:%s] Modifier 0x%llx does not
> support async flip\n",
> > +				    "[PLANE:%d:%s] Format %p4cc Modifier
> 0x%llx does not support
> > +async flip\n",
> >  				    plane->base.base.id, plane->base.name,
> > +				    &new_plane_state->hw.fb->format->format,
> >  				    new_plane_state->hw.fb->modifier);
> >  			return -EINVAL;
> >  		}
> >
> > -		if (intel_format_info_is_yuv_semiplanar(new_plane_state-
> >hw.fb->format,
> > -							new_plane_state-
> >hw.fb->modifier)) {
> > -			drm_dbg_kms(display->drm,
> > -				    "[PLANE:%d:%s] Planar formats do not
> support async flips\n",
> > -				    plane->base.base.id, plane->base.name);
> > -			return -EINVAL;
> > -		}
> > -
> >  		/*
> >  		 * We turn the first async flip request into a sync flip
> >  		 * so that we can reconfigure the plane (eg. change modifier).
> > diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > index
> >
> 8739195aba696d13b30e1b978c8b2bb5e188119b..8f6170a5c108a000582f341
> 5f78b
> > ad279254d8cf 100644
> > --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > @@ -601,7 +601,7 @@ static u32 tgl_plane_min_alignment(struct
> intel_plane *plane,
> >  	 * Figure out what's going on here...
> >  	 */
> >  	if (display->platform.alderlake_p &&
> > -	    intel_plane_can_async_flip(plane, fb->modifier))
> > +	    intel_plane_can_async_flip(plane, fb->format->format,
> > +fb->modifier))
> >  		return mult * 16 * 1024;
> >
> >  	switch (fb->modifier) {
> >
> > --
> > 2.25.1
>=20
> --
> Ville Syrj=E4l=E4
> Intel
