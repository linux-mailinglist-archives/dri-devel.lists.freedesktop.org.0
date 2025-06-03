Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91033ACC230
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 10:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F35D10E643;
	Tue,  3 Jun 2025 08:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dugkb7A9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082BD10E5DF;
 Tue,  3 Jun 2025 08:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748939449; x=1780475449;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eJKxa3GvESyewDl3VjbpbCbDAkG56tVAPhT7bQV3aN4=;
 b=dugkb7A90y258ri2y4szs9/uwMPWV6ZN962tq8uwPBnrjgIEECqs54bd
 FRYXhshGK/M4UO99szaxpuFKzE/Zox1/wl7S7G/IVxtu1lVcqVit9r0IV
 uzxaUddIvuMliHTNsAvD7EpoXNET9Y7FrlaB4ikOL9z6ZXlJdmAto3Rc+
 cH4U9XnrUrNnJgHEdJ+B2YgZbKU+Z1FCVJc9RU9hLAnrE5rUxRJk9y3DI
 gwFulwJ8py3O5BNoLqqlUa14M4a8gqKnvVFVppqqQ2uSo67WrxoxlzLqS
 Kx2rpIJEd1Gv9/pT7sSMyEzBVSS3U98Hrj5kI3sNDGs5kJWX/GFtBLhUA A==;
X-CSE-ConnectionGUID: RK3BNp27QPukSSzLRaGK6w==
X-CSE-MsgGUID: 9bnlk2dMQI+agyBKSESxxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="38595502"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="38595502"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 01:30:47 -0700
X-CSE-ConnectionGUID: STG+fTk4QH6gzWpLFcy4IQ==
X-CSE-MsgGUID: LW10FEi2QCy/3dJy+oGh6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="144762247"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 01:30:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 01:30:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 01:30:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.83)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 01:30:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RQ04jLz6r6F/NI3TrlwM+EpIgROibWxhyMXl9SQz3ahGRhzAGWgoHxIOp2kMQqbJscpdZPVOwOA5SM8oQfbOq51jOVu+rI+oJ6TFTJSL4pydNvvH98eBiHePxpAFNlhklo34z/uUHqbQsmJuZMUQk9PpIVtRPjEyYqL7TnA7PYrQNcSJ/kfwZSguhMOTNlZ5bkSjcA1sJhVMEbUs9MyKmnJuJnD16OgCvN/5l1zmyLkQ4W4PzdMhdKu8EnnV3yuiDcHTixCFZ4Eb0kyAGHOU1sHDPNodcktS7kudC2VHWMjPIuoEfYyiHPrngeXMoXvEnr+LGBS4w0z8DTKCSCIWrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KbwCwPvlXzJjujokqK9eJ+eHuN5zJTVW1UnoaIZk084=;
 b=D6/UK/+ZO698rjaxoJxAtcnvU6DzY9q1NPvaE+62DTBWqn2CmnYmNONQCWiAD3fz+e7QQl6aX//g3meL/ITk05y0TiYedZtNloAqntImzIzcNvkLl2I6PIi2RcfB3+DrbD+wpu9fWqWxgTlminDeTPNL4N1GE1Ioaov3TG2GhjWniAVUhmVbKwo0QG3g17xj1Ng3zYMibHWijHZ9KU+XCZ1r0tuuUc9yF+aBo7m611NgES/tbQlTQJ9rkOZi8mgrqdx/1Vs/K3QXMrak6/0W5OITi31WVg+PFhxGZ4r95ttj5d7EUFFV2bU+L+Oi530pj0rVIZoW09RK0sIBWGIUGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 SJ5PPFEC87B8781.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::85c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Tue, 3 Jun
 2025 08:30:24 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%5]) with mapi id 15.20.8769.037; Tue, 3 Jun 2025
 08:30:23 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
CC: Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>, 
 Alex Hung <alex.hung@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, "leo.liu@amd.com" <leo.liu@amd.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "mwen@igalia.com" <mwen@igalia.com>, "jadahl@redhat.com" <jadahl@redhat.com>, 
 "sebastian.wick@redhat.com" <sebastian.wick@redhat.com>,
 "shashank.sharma@amd.com" <shashank.sharma@amd.com>, "agoins@nvidia.com"
 <agoins@nvidia.com>, "joshua@froggi.es" <joshua@froggi.es>,
 "mdaenzer@redhat.com" <mdaenzer@redhat.com>, "aleixpol@kde.org"
 <aleixpol@kde.org>, "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 "victoria@system76.com" <victoria@system76.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>, "marcan@marcan.st"
 <marcan@marcan.st>, "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>, "Borah, Chaitanya
 Kumar" <chaitanya.kumar.borah@intel.com>, "louis.chauvet@bootlin.com"
 <louis.chauvet@bootlin.com>
Subject: RE: [PATCH V8 32/43] drm/colorop: Add 1D Curve Custom LUT type
Thread-Topic: [PATCH V8 32/43] drm/colorop: Add 1D Curve Custom LUT type
Thread-Index: AQHbnqqz2YhtxDgq7E6gFv3ZntqEdLOkXCdQgAACfoCAAAPEoIAAj/AAgAAWPQCAOdBI4IAMv5WAgAXmbmA=
Date: Tue, 3 Jun 2025 08:30:23 +0000
Message-ID: <DM4PR11MB6360BFCB5756A16F38945DE7F46DA@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-33-alex.hung@amd.com>
 <CY5PR11MB63441E057180C043C51230A3F4B22@CY5PR11MB6344.namprd11.prod.outlook.com>
 <fzuE3KXuocsKA0I9kWXruyw7IVbw3jwH2yeh59SfE0Qb0SGxa29rrj9X_XgNCdmj1vWgxLO619xyJY3r5R3hsZK6ElIkTvbyNfu40x1SiZM=@emersion.fr>
 <CY5PR11MB63449DBA54519766E345CADAF4B22@CY5PR11MB6344.namprd11.prod.outlook.com>
 <3ca1958f-62e0-4a5c-837b-3cd705acc181@amd.com>
 <ZqHOWK3X_Ici9wNgijgeUt9r3asi4jhqw-0-keIfXYAFxbsGLaFTIozGHHR64SnkAzPA4CM-zmc6OwVtrKMKjVyoblti88KpRf9wEu8daP0=@emersion.fr>
 <DM4PR11MB6360CE0C5C99FB02CD6CC0BFF499A@DM4PR11MB6360.namprd11.prod.outlook.com>
 <20250530165818.0e6cb846@eldfell>
In-Reply-To: <20250530165818.0e6cb846@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|SJ5PPFEC87B8781:EE_
x-ms-office365-filtering-correlation-id: 3e0d9b08-584d-4641-e2c4-08dda278e2a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?PqlB1vgYlaTnDdHJUncEjYNaXkHPCyBIYZ37YU34BrqlgHaOa/dRkg3lueZI?=
 =?us-ascii?Q?e4jTXuIGpf+mqhc9AdVlcCH9bjseM2laTa73wAYMiNXaCXViSnzEY4/4js3y?=
 =?us-ascii?Q?BtcZie+GDBO07k+8OjUkwOUzyScRjx1AYB4f3quZhtcSi09G5sbw60Alkw1h?=
 =?us-ascii?Q?cP4YyjmrNm1K8VmutK2s4lpoY/DPhUixFHqAvcK1of79jO4HmgVC58fdn5lP?=
 =?us-ascii?Q?Wg+r0dMhXVw2YdJJ+5B6gVVb2AHgpwsLC2SbiYeEUbO5QLtoQ4+JJvE5/n1z?=
 =?us-ascii?Q?5kFalLunyIDwLfhcHqfQakcXp+2uHa6gHDjn1jmR0gJAGp+BWmiKKW88S2hO?=
 =?us-ascii?Q?RMaVvXxIm6RJD61V5za7cbZX0GAyyPV2LMyXuFk6OLJXXDOt2c1nWJCKtjlI?=
 =?us-ascii?Q?AhcMvIDFZUbU407zGbpxKHPRj1ntdCR+6mjuayYY0JJrlbuqaITQm5OjTbos?=
 =?us-ascii?Q?0iF841Xif3Gd1EmLPNVjsGq/WXf/+snj4cGP1hORVpR/0dh5PviyQESJ1CLs?=
 =?us-ascii?Q?AuGpi+9aZaTGx9pHuJLAKv4oO2fN/0bvAJVezTgETt2AclGGpafNiQjKzYEx?=
 =?us-ascii?Q?G9f5hgrvTML4hbYkIvvF/WN6DsZzcPeXcUtlkqz0XjTmMDXWnbpGvKc/bu24?=
 =?us-ascii?Q?ImWx7RutiMbUOV3MtUVYMjsBqzzNlN2Mp5+Q2k4w65I6QdbOGlmnLFrgxP45?=
 =?us-ascii?Q?fbl0DYM6NkmL0uhwPOfD+LdJnLquO0MqwcvQnoPnP4TjO1EcIjrF/U9gxw3W?=
 =?us-ascii?Q?Df35OitMaMYYTKrCT+O8rRP3cPjTIm2yjyDkFXtJvs6iMHCSYgs/NUPaf6/r?=
 =?us-ascii?Q?ASIKbxeZ2XqjNRQ98youv+QjphaMUiunNDha+Bq+8fn6AABngUIwDwODgWz/?=
 =?us-ascii?Q?HCDV3HxdyQ5j+T3/+M6PqH50coIYTYO7G1Yy4LcQbzK63f5qcq+QKEpIRi5J?=
 =?us-ascii?Q?SvwBAYQm31zwPgglUPUtdiApsOt8/u8eqjbyso0WIdQR354tPd7l4taHEFgC?=
 =?us-ascii?Q?14otuok+80XWiUV1c5zXYT0RX0dqIx5KAj+V6W5RIWtdb/Fj2GwnV5ddDd+R?=
 =?us-ascii?Q?hfYhEN9bjSWMfAPMK8r49UC+wxAkDpXpMOLCYqmdJhRbjvoy1HgC7H4QqSQx?=
 =?us-ascii?Q?Qyfa01QLFW/qwXIZymmT7aK/gXxloPBN0qGAWOw9t6kYI1s9/HurjPMyMTvw?=
 =?us-ascii?Q?hChrN566Cf6Aca+I+VWwPmHoIabbsny/6zafcxvkXjYkIduD/ZaYNdbgH4Hu?=
 =?us-ascii?Q?EM5ZtmiERyv4Vn7O1IuyPrq1DyW22nRsiR+KHqNmuCU7sIKKxoRmSxU1XL7V?=
 =?us-ascii?Q?fj3bBmJx5t8SOx+kpUqtWFJsOJ7NX2Cuu0LOQN1hzFCYFZdZYrya2ufCQWZk?=
 =?us-ascii?Q?avVyTUmQ1rYOtXwhw5WJpS+D6HLpS4ty6RJee31oBMk7VT+xV8pj2gWC9SFt?=
 =?us-ascii?Q?DTIFGN9KitM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zTmuXIe2HsHjuja8DvZb4gLaGILx05xErb3wTYb3QNHQNFClE6pXg06e7Ffb?=
 =?us-ascii?Q?KyP6mc2NUzUdf4n+CiLAqRGm1uS3D+nLkulMfO5yNbWCFwT9rDkkT0UXytYO?=
 =?us-ascii?Q?/cdn8wnh23+8dkbf19NTYXUVFN4n8vCSDN0RW+3pvxgpiy+SbEYLxPov4Cml?=
 =?us-ascii?Q?pjickQC+oqNYwQ7i6KrBRuHskEoTXovVZN78NBF9H6TP+tEM2DfQcNC9Q4iR?=
 =?us-ascii?Q?ucqCiCD9WNh1lVucj4gTwWIeC9jEOoVXF1aBCED7OYP0I9g3wysZqtQDeevK?=
 =?us-ascii?Q?zhZ3M2VdXrkNigXW58PHKUeG7ht8RHiJjnwS4oSKqgVRxKGFxt1HnnVb72JY?=
 =?us-ascii?Q?r4xoc/YClIQ7rO6ppeqHXc/x69X89dkL6GazmQi3pdSqvOOuRKDf44f0yQfA?=
 =?us-ascii?Q?wj0/HTPg1RuR84GGKsUrHKqjK2TXRuORRX/0CMfRb157a1pvL4xeQrcIN7AE?=
 =?us-ascii?Q?ZrSeOngzhQoK0gEgYiPNl8VlFwWRgFmW1w28C3UHMxnTB8uNDenrT71ovHHu?=
 =?us-ascii?Q?6cn7sW5h9ISLLe3Y3GDlz1g8ifbXwuDqP9vxqHZFfiG128MhQeUPvp6KYY4w?=
 =?us-ascii?Q?VV2uFSuCNiANwzXIC1A++bqICO6D0PrQNeyMHDh9R7a59fj44hJeULCOCT77?=
 =?us-ascii?Q?mHs38HE896fgVbSCn3E13nJfHIc52i/CwKhkNzY3aGp3Kid6kXfYQOexLM88?=
 =?us-ascii?Q?+1IethYXCA55YYoBbN3CUb0mRM3bGiVxH3RL04w5oeS38oAk7HH06qPXCDsI?=
 =?us-ascii?Q?KjPlqGiYwhvBUoWsomys7uHvEfHZrfi0Hq4b8oe+Fb76re/N4YJBu3jIwXgg?=
 =?us-ascii?Q?EdsKUtRlq9NEbRBRgRtaXZX0VgbgHy7r921XeESHaQLZClUHlHRlhIceK4oO?=
 =?us-ascii?Q?2Is6zZQ+QWe0wvtHv9OsrsnP4mmcdOX1PtjKi6QfaEqtpTOBx2YrOAV7DEwP?=
 =?us-ascii?Q?6TE8a/Vwr3Xh8w0Sj/g5I1uFkKkN98RknwhF604kZ8XaXAvw3vx7UAaPSmGA?=
 =?us-ascii?Q?XoogCglm9Tt6PN/8ar9/4rhIhO46yCB8QndF9xmgeAC93LaBC9bOdTsYU3Sb?=
 =?us-ascii?Q?maC0qQXEjbMD2ol4MXMbJ19QtjnUX9JXjBdwrNDfmfusFH4CDm0Ov8bk+nSw?=
 =?us-ascii?Q?DMGh1n+GBUxdUv0xZAVEi//H/aDcgO4Z5HFvJKSXxuMxX8Sn8aP1XNbN+F6A?=
 =?us-ascii?Q?8d21MY8KkjoBzOrRytHO6xER1A4hJ3Dxg/xD0f/SMMA1tF4Dr3Yj+MXbMbGj?=
 =?us-ascii?Q?rsPfc1FsFuXgXbBxITrch5NC3ao6lhseZUlAEd27YpeNLu7um0X0KwdnM7+r?=
 =?us-ascii?Q?zMqyMTG2PVVhRmXnqAumxk05Omle3wBz9WXSBKS6FDEKq68mGH/2S/052srq?=
 =?us-ascii?Q?FleKlXGUndBRvChOEsWa2E1l1dW616p+cUncFhtp0PVJKMR6vqZtt4262Jtb?=
 =?us-ascii?Q?2XR8MyN0hqGfedai1XqLIPIzov3yH73DqvxDax8p4HOFuXIawhzzQsx1lM6b?=
 =?us-ascii?Q?R2SB+67b2u4/nPcWxtJoCuLbALIvw9aLmtIgpBYpoJKNh/1S4GJfK0hWDPPM?=
 =?us-ascii?Q?Xk3AEeXHc7Smo+ZHos7oS5mv+9F9NZNkMeFiQycf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e0d9b08-584d-4641-e2c4-08dda278e2a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 08:30:23.8353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2++7297HZncEHorYJqPUrw9V50FI4MM1L4jm369a27/IxGRA1ZwZisqNa3LzW9O9++LWZHhhLgfqnDvVH/Zeww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFEC87B8781
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
> From: Pekka Paalanen <pekka.paalanen@collabora.com>
> Sent: Friday, May 30, 2025 7:28 PM
> To: Shankar, Uma <uma.shankar@intel.com>
> Cc: Simon Ser <contact@emersion.fr>; Harry Wentland
> <harry.wentland@amd.com>; Alex Hung <alex.hung@amd.com>; dri-
> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; intel-
> gfx@lists.freedesktop.org; wayland-devel@lists.freedesktop.org;
> leo.liu@amd.com; ville.syrjala@linux.intel.com; pekka.paalanen@collabora.=
com;
> mwen@igalia.com; jadahl@redhat.com; sebastian.wick@redhat.com;
> shashank.sharma@amd.com; agoins@nvidia.com; joshua@froggi.es;
> mdaenzer@redhat.com; aleixpol@kde.org; xaver.hugl@gmail.com;
> victoria@system76.com; daniel@ffwll.ch; quic_naseer@quicinc.com;
> quic_cbraga@quicinc.com; quic_abhinavk@quicinc.com; marcan@marcan.st;
> Liviu.Dudau@arm.com; sashamcintosh@google.com; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; louis.chauvet@bootlin.com
> Subject: Re: [PATCH V8 32/43] drm/colorop: Add 1D Curve Custom LUT type
>=20
> On Thu, 22 May 2025 11:33:00 +0000
> "Shankar, Uma" <uma.shankar@intel.com> wrote:
>=20
> > One request though: Can we enhance the lut samples from existing
> > 16bits to 32bits as lut precision is going to be more than 16 in certai=
n hardware.
> While adding the new UAPI, lets extend this to 32 to make it future proof=
.
> > Reference:
> > https://patchwork.freedesktop.org/patch/642592/?series=3D129811&rev=3D4
> >
> > +/**
> > + * struct drm_color_lut_32 - Represents high precision lut values
> > + *
> > + * Creating 32 bit palette entries for better data
> > + * precision. This will be required for HDR and
> > + * similar color processing usecases.
> > + */
> > +struct drm_color_lut_32 {
> > +	/*
> > +	 * Data for high precision LUTs
> > +	 */
> > +	__u32 red;
> > +	__u32 green;
> > +	__u32 blue;
> > +	__u32 reserved;
> > +};
>=20
> Hi,
>=20
> I suppose you need this much precision for optical data? If so, floating-=
point would
> be much more appropriate and we could probably keep 16-bit storage.
>=20
> What does the "more than 16-bit" hardware actually use? ISTR at least AMD
> having some sort of float'ish point internal pipeline?
>=20
> This sounds the same thing as non-uniformly distributed taps in a LUT.
> That mimics floating-point input while this feels like floating-point out=
put of a LUT.
>=20
> I've recently decided for myself (and Weston) that I will never store opt=
ical data in
> an integer format, because it is far too wasteful. That's why the electri=
cal
> encodings like power-2.2 are so useful, not just for emulating a CRT.

Hi Pekka,
Internal pipeline in hardware can operate at higher precision than the inpu=
t framebuffer
to plane engines. So, in case we have optical data of 16bits or 10bits prec=
ision, hardware
can scale this up to higher precision in internal pipeline in hardware to t=
ake care of rounding
and overflow issues. Even FP16 optical data will be normalized and converte=
d internally for
further processing.

Input to LUT hardware can be 16bits or even higher, so the look up table we=
 program can
be of higher precision than 16 (certain cases 24 in Intel pipeline). This i=
s later truncated to bpc supported
in output formats from sync (10, 12 or 16), mostly for electrical value to =
be sent to sink.

Hence requesting to increase the container from current u16 to u32, to get =
advantage of higher
precision luts.

Thanks & Regards,
Uma Shankar

>=20
> Thanks,
> pq
