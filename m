Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GOwKqC6nGlHKAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 21:37:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0272717D00C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 21:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 461A610E445;
	Mon, 23 Feb 2026 20:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mEvc5e3V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0830A10E445;
 Mon, 23 Feb 2026 20:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771879069; x=1803415069;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UZ/tb5gttBk4J1cQL7VfB6S3HcgrRCbrSx3NySahRhU=;
 b=mEvc5e3V9saydGBll5YB8Plahjv+2BWVnoLFfgSCXxgqrnRwVF+LgdCF
 K01I2GcouVaHEOTtx0x3Jt6IA+BiK1yTP8NeHUZ33T4nK3CXPsoTzmkIY
 fW4wxR55HpQ+PiKRmD2Xk+eS0LowwsHc8j+LGvKh03Qmb7RgfovbWB0Zr
 t40xoygPHKMCOuqxeNAYtRGk5QGlIIznUXxidKB+HBQIpRlVYCL/irwNN
 QIbkNHF8vREekMaNzvzS0cbbN5HRmF90YSd7AdeoZ6ulKx0LsV/0zfMAB
 UY7xOAtk0r/N7zVUYF43EPRId6XXirLWrsk7Cu/cNjA4boDrOO8ip2LGa g==;
X-CSE-ConnectionGUID: 2fXT9xB5RUi7TRKCsfpzNQ==
X-CSE-MsgGUID: vFY9fFfbQaKNlJC2hQIizw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72951300"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72951300"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 12:37:48 -0800
X-CSE-ConnectionGUID: JcCAtzjfS0KzlVse5CxYgQ==
X-CSE-MsgGUID: Cvmrtgf3TIie3d8o0swJ1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="219787573"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 12:37:48 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 12:37:48 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 12:37:48 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 12:37:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Or8ltLOULR+64S5Bg3pd+yIXsqG54mlgGya5ZH5sKPwbe9d5ENsH8kou5siWnYhfHrOztvD5Dd26A+1e2TjYFNfAfpfd2DniM2wwlL0JvHSIn9nmua/IDLqy9hjlEXp5WCkkD7QDTOkIGgyGDX8IYu3Y5PHbRN8G8/4+XMl2LIciOzPhpvxGvXNM314r+ROr7P09uzw3d1649svzwf/4iNfKwFeM4ipZ2SUDfUyQIveWx1AZ3G3XLKGimidsQdPFLHgHO5689CpnB5P9PLvV26O1pWP4Df7MG4aQdCknqYgMYolfG4qxfsGf4gndpo5NSTqlHZAKezMAuF5BdV9Mlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqdGRR2j0mPE8+ANupq4C0x5ksZ8DqAs3PhzvpSI6Xw=;
 b=NvdBru9K08H1EiZctCLJF6sJN8xQ7nUj4Wk9vVKbGsRAmaU4NNdYyInRPEAe9VoVWrhpmPx9YIwMMq6FBX+wP0nlza8rg6j8ReKZoMUDM99aya3Jkz5OUt5R7noxPyvyLArCt8iXQtfFr1Z0e8//QVqyXcpROgFZuyNXbVHLZCjkja2eL9aTADnM45oojgAiY6v7DZqPefb3e3M8fQ5TlRX2mApQggPS2QZza0iSEXSeiR7kqjimApH+WoMqV6HS4UvOtGhVAvZxnAPN5kbkrnO64Hx0As6hTF9sdxohIR5UWd6Dj7JxFwy2/JiRAdzaj/WhzWVMjuw7tTGEp6u/gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Mon, 23 Feb 2026 20:37:44 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 20:37:44 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "contact@emersion.fr" <contact@emersion.fr>, "alex.hung@amd.com"
 <alex.hung@amd.com>, "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "daniels@collabora.com" <daniels@collabora.com>, "mwen@igalia.com"
 <mwen@igalia.com>, "sebastian.wick@redhat.com" <sebastian.wick@redhat.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Nikula, Jani" <jani.nikula@intel.com>, "louis.chauvet@bootlin.com"
 <louis.chauvet@bootlin.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH 2/2] drm/atomic: Add affected colorops with affected planes
Thread-Topic: [PATCH 2/2] drm/atomic: Add affected colorops with affected
 planes
Thread-Index: AQHcoKdcDe6hPRIWakywN++n0JGOPbWQxlaA
Date: Mon, 23 Feb 2026 20:37:44 +0000
Message-ID: <DM4PR11MB6360F90857302E3EE94FAB73F477A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20260218065713.326417-1-chaitanya.kumar.borah@intel.com>
 <20260218065713.326417-3-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260218065713.326417-3-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|PH7PR11MB7605:EE_
x-ms-office365-filtering-correlation-id: 0beb913f-2455-4050-9be3-08de731b65c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?iST6MEiz3pfPipgtSBELLBoEpo0U8mtF9fTVInvw25KRNddtu4duqwWfs7SM?=
 =?us-ascii?Q?c2Dc85JoMp9Q39hCqhnMH9Yr/v3qk6g4NgHPsQfqVWO9YjZbiehfTT/y4Cg0?=
 =?us-ascii?Q?5H6zkBrNxj/JOb74NJ70GYUtXotunCoDFsbWYAAfkiJuMNhYg23gEugHpFNO?=
 =?us-ascii?Q?HpgtLc+qyt5eJM/yvN6qjpv/+vhgePiVbYuV/SZw1JjQ7Wi0j7e/2mVRQPtd?=
 =?us-ascii?Q?YmYb5HEF0iY191HFE2pCAvNaZfDJPz4VYNsbn5rm+sf4SnVo214XRaxxopiX?=
 =?us-ascii?Q?AvEQdvPTRkSJAGwuSTXFg4W/NCAOmkkUxbaXiujV/zg2taT5A7vZvp7qgSz8?=
 =?us-ascii?Q?Qw18onIcR3E0rhdz0ygRoVgiNQZSL/yWCtxeJr2B0BxLroch3Q+WI7na4kCY?=
 =?us-ascii?Q?6zDCLZ3M7sBDq4KYxLC9yWG1MUt/+KF5Ry6HlZKNIECo91F8KO4NdBwixhgh?=
 =?us-ascii?Q?gHDbwIlKHHjjf3VG9c8T8Pl/bNhqDVH02i7T0LGKCpl5k5qnGBNMRf/SHN+N?=
 =?us-ascii?Q?Fs6KIR4Kjk9ymisU8/Ulay58gnLfpx1uu8Xmk4AMntxdO03/QltJPpkdd9EZ?=
 =?us-ascii?Q?lPDzYI7ESeCO8kF3Q4GFymL7NVRG5uQk425yHb+8WfvahmBXYqLwvO6NvIRX?=
 =?us-ascii?Q?ixwK/NddeLX4zAzmZ9xw6qNvGVXRBhaHnKKiDAk7n7KHdBNnfSUJaBnWqND6?=
 =?us-ascii?Q?TNX6pk85omvXS5d/J3nXgYuDvBiY8uZMt/DMx5cFtwE7YrZeALbTlTxolyTF?=
 =?us-ascii?Q?kCGd3boVyvSTEi7cQORDyvun2ZlQ9fa9s51EdEIqeIZhtf81kfLRpSoscqZb?=
 =?us-ascii?Q?jRTW/WNbBg61zRb/J8W2oOjtXwjOVkwDX8YcoM3cZHNuUJzpR3dgg/oTtK22?=
 =?us-ascii?Q?lcyumOgC5eoOjh5q981z1yVXVOe2zqaXXv9MDnwmu5U8NL34rEKqD8LkX5KX?=
 =?us-ascii?Q?vF12305010ceILcfBrBlgYWgIGBGnNgjtcp2hddzWk2lUmcbUE/35IgpePaQ?=
 =?us-ascii?Q?ST5sonz2hc4BLUCF73x8sK1Ue9gzSD2O0SZEdoNxc33XCM2Zmvn2G+XlDdH+?=
 =?us-ascii?Q?X0VYCpnRAqzqo6R8Y+SC09YzU2BSGXYDC9pVeRqvus91NTiWtGmoKiVmKpU9?=
 =?us-ascii?Q?Mw8M0VaeI01qcBh9l/ARsihtiIyJtZoKDrKsZOdUxuNN0UAYXpjvY7ElSA+r?=
 =?us-ascii?Q?x1KfawTilIO2LaYDjIuyjHKS2Rq9ZO97ez3qYYdxLsCIQkYgBXskY7oYrE+8?=
 =?us-ascii?Q?QY6jqa3jNRcgYMbzIZ3iEnTK2Hl9OeiItHjF3uemsbfs3S5tSzCuwwz7kG7y?=
 =?us-ascii?Q?aJXFtKwB0i/OSCzWexd9SCV4i+qTI1pBa3q4dRhz0wmWLvMPaW9tnUs7luQk?=
 =?us-ascii?Q?XnC08NnjRMNrK2v/N41JIBwmJCsEa98r9WA+L2D7tEwf+ERwQT1UyGUPPzQr?=
 =?us-ascii?Q?jnSBREXKRqQaZ8l+urEj1EX/VQC9MwZXh0I9GIo37Iyr3b+6nJrzgj/EFpkb?=
 =?us-ascii?Q?hwQr++Z5QTfiaS9TZsd16qhMNt0l6JuQ5yp0tfeIHEbKi0qAkfVtdcJRj1wf?=
 =?us-ascii?Q?uM+fttS53mhWjPK5qw6+KRtTkk8dIWAMUH/kvSGwL5xIksue+gmjSnMMdKsP?=
 =?us-ascii?Q?vc4aCYJYG/fK5iPMR71h/CU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7tETKiKbaPqnVBiyxYxZIeu8aSz9AzLkTXxZCSatF3/c/s2t1TtmtjcADbgw?=
 =?us-ascii?Q?iTbjyeVrvlB3SqXkRM1us/t8vUwkAXhdXmTD8Bt7xDfSn6Pcv8SpmAK/I0bM?=
 =?us-ascii?Q?fAVKLVu7NWbkVvmfZzQ/jnaGI1cETb/dyGjfth3tkbwUl0NYBAu1fSggJUWV?=
 =?us-ascii?Q?HCUBx0rI7HBniUSJb/M3Elcl53Db/J7jIn2aisZT3sF2DifKFcIch6oBcrKz?=
 =?us-ascii?Q?uOqmY5rN9GNT3bCY51vYdLrWKyWcDDk/GI8NcouvL8NYvrGlqxW6uhx+oycZ?=
 =?us-ascii?Q?D+ZXVGNhYLJdSLWSlJUnAH9/MnBz/GZcWweNSnGXlXUgEYuQphAKMlj5bC/Z?=
 =?us-ascii?Q?4SXzdANuzO+oZSz2gSUg/+/4sqkPAd+JIYnn0uuhpYOhOZ0z+R8eIaZeev3I?=
 =?us-ascii?Q?uT8ye3ceKGItaNfR+P4hqb5kpOhpMrKmHLsj5x28jUfxnq6/v7Jdl6M2+uEd?=
 =?us-ascii?Q?oTp35WWEl7N7bFUZZfkuKnqvcho5/BH7JRAKT30VFuHnGPI75G1lJa1pyh1B?=
 =?us-ascii?Q?Y49Z+gDz0BYLDhFn+ccpRK79Lrgr+HX2JjqQiczdoKgndKJBBRkcCDyE7b1b?=
 =?us-ascii?Q?24mXZTZYVTjWgzl6SqbcZ5Xzugc1PzCm44XyuxQfdPozNTu8zMKjN4IshvEM?=
 =?us-ascii?Q?ALtRAYgXcbahkmQn5nGwCnVi+aoj8iMUJJHP+wHCHBwsubTk6WMEsOwwDQ7z?=
 =?us-ascii?Q?pyMbSiA0i6Zv6wBkxslXujCGuz8TeojN5qp/f56gcf5LtvrGCXgBRWseAS/m?=
 =?us-ascii?Q?Zpvr3iFyviDFGqTVxWI4YdP2f/HEULBW5GQJl8As3ybanrNQm5BqAt9YMoZ8?=
 =?us-ascii?Q?1Zu1cynWWkoyJjH2EZmFZJQdqAPM9YRrwFGXEpKmdcTsmuypDORhiM6/zBek?=
 =?us-ascii?Q?X2ji+BGmoFIEezXdEpbUp7kkT0OL/lCxK9oJTkoBecFksZLLMW9A4WvjkkTB?=
 =?us-ascii?Q?0ZTH0Z24da/UyVfvvlejuvGWaHYTBOZKlGgFHplGkwjt2Kjulao064K9TROC?=
 =?us-ascii?Q?p6INk8B3DoCAD/uwKbtO29JIYj0z4KHwgiP4Wp272yrX7WBrBnluNf7fXq5o?=
 =?us-ascii?Q?3g/C3j7GZ/RaA11IDrxmcWQqHDOJcqzuwwnKn7gilo7ECpnrYq8fZweQFPTi?=
 =?us-ascii?Q?iu0hA50E+jBU/MVxMyX/c/jOqFDjEwIGrWJz8a4cHulAEY2fEZK1wamCxT/2?=
 =?us-ascii?Q?kKZistlw4JEpILYAyUgIQOHRu0ICSYglrY0GEOH8TgFS2isX6gDuYDsPyHWT?=
 =?us-ascii?Q?OQH7CmKtod2irv+0lUpO4UrA38RBZmyaZJKf6EcS3jV92mFDLoBaMfPOn+i5?=
 =?us-ascii?Q?1FBNnGsGvCjrFuqC4702ZqaoGIz2BkAr8l+xF3DkXVM/w0276AJjc/VJ+KEs?=
 =?us-ascii?Q?XLDKoASRt5NqctQNF/YL/IAHXFh+WYcalxWUh9ed1tUeeUTeKAZjoLfZZZZf?=
 =?us-ascii?Q?r5XjSWAZEYRRqNl2ED1imTPpHOO4PXcnVNTz7b3AlGWK8d12jqrrO4sxbfB2?=
 =?us-ascii?Q?IVV5z34muRl5BUv3cWgkuQ6R9XpfHNkcV0y1gRuqLkaEpzl/Zi8FKU2uM3zK?=
 =?us-ascii?Q?hOLx1LN8VMGqw3bW0EBY1fV6WddBtEVh1ZhJhHY7kooYekqEk+uXsOFi+x8b?=
 =?us-ascii?Q?T1w5KFujjLsbW0uKI0tfPZqjUZ9TsjL5etXSJyCuUbu2m8+eUX+HQhI0OJIc?=
 =?us-ascii?Q?k4sM64GO82t2RVfcGxkmzfsx80i/H5qXGWL/Vgijf5nWMC+QYORRo21ASvg6?=
 =?us-ascii?Q?dR7ffTMw+w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0beb913f-2455-4050-9be3-08de731b65c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 20:37:44.1686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UtyFfKngJChJS7NIb5MUjWoPDr74Cr47hFplrAe8vPt3ZBkwCNSQUKwLdcXijGqc1Avjj5fwsK1Hb8rzJ59DHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7605
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[uma.shankar@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 0272717D00C
X-Rspamd-Action: no action



> -----Original Message-----
> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Sent: Wednesday, February 18, 2026 12:27 PM
> To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; int=
el-
> xe@lists.freedesktop.org
> Cc: contact@emersion.fr; alex.hung@amd.com; harry.wentland@amd.com;
> daniels@collabora.com; mwen@igalia.com; sebastian.wick@redhat.com;
> Shankar, Uma <uma.shankar@intel.com>; ville.syrjala@linux.intel.com;
> maarten.lankhorst@linux.intel.com; Nikula, Jani <jani.nikula@intel.com>;
> louis.chauvet@bootlin.com; stable@vger.kernel.org; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>
> Subject: [PATCH 2/2] drm/atomic: Add affected colorops with affected plan=
es
>=20
> When drm_atomic_add_affected_planes() adds a plane to the atomic state, t=
he
> associated colorops are not guaranteed to be included.
> This can leave colorop state out of the transaction when planes are pulle=
d in
> implicitly (eg. during modeset or internal commits).
>=20
> Also add affected colorops when adding affected planes to keep plane and =
color
> pipeline state consistent within the atomic transaction.

Even though colorop is an object in itself but practically it doesn't have =
any existence without
the plane. So to add to state along with plane seems logical. Also its good=
 to handle this in
drm core than individual drivers.

The change looks good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Fixes: 2afc3184f3b3 ("drm/plane: Add COLOR PIPELINE property")
> Cc: <stable@vger.kernel.org> #v6.19+
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c =
index
> e3029c8f02e5..8bcd76aaeb6a 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1588,6 +1588,7 @@ drm_atomic_add_affected_planes(struct
> drm_atomic_state *state,
>  	const struct drm_crtc_state *old_crtc_state =3D
>  		drm_atomic_get_old_crtc_state(state, crtc);
>  	struct drm_plane *plane;
> +	int ret;
>=20
>  	WARN_ON(!drm_atomic_get_new_crtc_state(state, crtc));
>=20
> @@ -1601,6 +1602,10 @@ drm_atomic_add_affected_planes(struct
> drm_atomic_state *state,
>=20
>  		if (IS_ERR(plane_state))
>  			return PTR_ERR(plane_state);
> +
> +		ret =3D drm_atomic_add_affected_colorops(state, plane);
> +		if (ret)
> +			return ret;
>  	}
>  	return 0;
>  }
> --
> 2.25.1

