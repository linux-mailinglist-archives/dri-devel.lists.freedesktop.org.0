Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0707B9E16F1
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 10:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FA810E99E;
	Tue,  3 Dec 2024 09:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K2iZ0oCK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF2E10E99C;
 Tue,  3 Dec 2024 09:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733217302; x=1764753302;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XEMiFI4YfB+5LFkV8flbE08I9oK0agzKb/d+cH/X59I=;
 b=K2iZ0oCKuIrVOghEQHpKG0+3xmZLpvPXq/OIBkbQpq9mvMOM4ih7q7Fs
 T1hOlHQRwxuha8UgMaKg37pMkMCFJ5f+KnhNjnf8yrEW45p8v+B/iGrQD
 YVPklJVA5MNYWyWyA2gtEyJXrA0cDxzu6Mnm8zYi1I45DP2sNwBTNxBd3
 QDjAtQxEpD/iZrVDYVBbGCYBmm5wKVJgc+94e6osrg8MF1NTRcjkKjwDl
 0k9sHquPZRz4CIOPx4LmguxTLTtjeS1ULrKFBySLKeDTJEXvm4xD6WMqk
 aqhKymrlTjz5npL9Vdf7RRjKRNT38MbZyHa6GXI99qUwp0lDyCZuXZO3e w==;
X-CSE-ConnectionGUID: 6ekefklrRtC9Ay24jHQt2A==
X-CSE-MsgGUID: PGyoOetOTQWBAwn6EqEohA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="37354010"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="37354010"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 01:15:02 -0800
X-CSE-ConnectionGUID: +NlqRdv4RzyQBc2pzboT/A==
X-CSE-MsgGUID: pbqg9/UNTbOLJy6JXFXpWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="93708973"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Dec 2024 01:15:01 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 01:15:01 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 01:15:01 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 01:15:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iOEviMIGMu3r9Ve+/ZIvAaHGOhcWuiqdmHI5tiUr4EV51EA3r6G3N18GMVZaRJIZ0Qtfo8+LL/HoJ6/RX/mp5/dWjN73UVkMrk+3VtaZ+FVAab/WGH+ey1/X5b9howUxtlNxd45jiOpl6Pi4N8v268wwBsumWqW4+gudoqIwopQpcV1lei4x9TSegAUNPobkD3abO2uVupB28ToUjXP9RfGx8m5iLZFpF2Q6+J+9Jzjm2CbELtdb2ToocLwPghlo3IJK7kxoNjdpJZBtP0bno5JZsaoZw6mQi9ylwHIsoqqPff58okWTu0OPDQg6w85h3xeVkkV9nBm214BRrrXNsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/2Epv8oBUyqKQ+n24SwuVbEtraglBH8BWuKTj5u6eU=;
 b=Hf2cjEZ76wbbj+tMcNOkLHB6fUkjeI3blx3zD2S3Kqek4qA9FyJadApgQjjmn5EeWOCikDxL6ZDpsw6xeN+WwWwbLisNp+WhTpRMiN9mJJXvCg5CT0WzihDf00jn9uMVMrRiJRFvA60Tn2Xm3TNuAy6S3kDdh6cVtQxABS8prKlWb83zXNcF7ougRQoIQuYPf81fvPJuNV+JQpcv53eNVEP+YEt0sY8CnDR4ApYsfMxWIjqHbQK0FyxCo8HsHbGdOqc0rAjhFUNK59UNVTkKWcluIRHWMy1FNzHzaYj5oPZ0BzMtvG5pLQVXPdOEnzUd8qiqrlIG6nxd+6w8ZGBn5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 IA1PR11MB8149.namprd11.prod.outlook.com (2603:10b6:208:447::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.19; Tue, 3 Dec 2024 09:14:58 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%6]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 09:14:58 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "pekka.paalanen@haloniitty.fi" <pekka.paalanen@haloniitty.fi>,
 "sebastian.wick@redhat.com" <sebastian.wick@redhat.com>, "jadahl@redhat.com"
 <jadahl@redhat.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "Kumar, Naveen1"
 <naveen1.kumar@intel.com>, "Borah, Chaitanya Kumar"
 <chaitanya.kumar.borah@intel.com>
Subject: RE: [v2 09/25] drm: Add helper to initialize segmented 1D LUT
Thread-Topic: [v2 09/25] drm: Add helper to initialize segmented 1D LUT
Thread-Index: AQHbQAXtuEUKwXyID0+ARtO7DGr7jrLPmWoAgAStrDA=
Date: Tue, 3 Dec 2024 09:14:58 +0000
Message-ID: <DM4PR11MB636063F43127CCDF65F7249DF4362@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20241126132730.1192571-1-uma.shankar@intel.com>
 <20241126132730.1192571-10-uma.shankar@intel.com>
 <bhjkznwq2776cpjun56fqi6qgfu7ezojxs6mv4itb3njws3aeu@ixhixfv6uknj>
In-Reply-To: <bhjkznwq2776cpjun56fqi6qgfu7ezojxs6mv4itb3njws3aeu@ixhixfv6uknj>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|IA1PR11MB8149:EE_
x-ms-office365-filtering-correlation-id: 678f82e7-9662-44c7-e810-08dd137af5be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ivGW3/XH8jUWcpGZHKGvvUD/JwV/SmjZu+926EzrdCTv8PxxAZ0hxQo/ZMcQ?=
 =?us-ascii?Q?RX9BwK+zetwNdacnHw+NGL7znvSa/96iflf3cbVMLK9+U1xA1HsbrFbtoYBk?=
 =?us-ascii?Q?cx3eouBCaS0gujk3ST6e4K+rDMkeEnNHdmsb1tOxVEDQY6Te0hFKJS2nMEwf?=
 =?us-ascii?Q?kV03/FeQwXMVikqQPK6Z38jGlShZ4yqVwvcqmHXQ6RKMrg/gzOlJIreZwIhG?=
 =?us-ascii?Q?JMZfoeTLU9u7vXkzJpnxQFU24nYfStbzL3fAHYdqQNypcWp0eKsembHQXkdl?=
 =?us-ascii?Q?sbye12O0xOuHCqIvxP1Vh5yC8vLdqFKyIy9xmNyY2Hezj6AHTYPCSDy0FRnv?=
 =?us-ascii?Q?tQReOY9zHxaFqNMsklzM/H50oDQza9ykw9qwC3+hmKBLOsrgOX1/pbp0GHxI?=
 =?us-ascii?Q?otrWDxu7/FDx9wieBXwa5zWl5XtF8xWkr5cC3+44VXu2CUwCIG9EMaMpXKiG?=
 =?us-ascii?Q?C4QdobFjytpoKvRsdA0OhpbOporXOFLT2bZzl5BclPg+nDg8OCjU1nWEfUl0?=
 =?us-ascii?Q?4MwKnxpRh9e5khZHrFPX6h44GnU4TNILwrtfckLyl4r64AvxPFJUovN4zqDM?=
 =?us-ascii?Q?zr0U3mxcvqwYfQgGmuO+Fvi5TX/DqDlb9PYvL5ws3p1/aoHSGTuysvwKzJ2v?=
 =?us-ascii?Q?7ls8AG5Hp4NTktiOzpnigsre7MbhTJbAsntla9uM3pc9EUx3i2s+IMDUK6bR?=
 =?us-ascii?Q?iQPiHZiUO/VKvOfSEUaQP+nHtszCYUXhIuigwA6Qb0eapk8fw/90R800tzD6?=
 =?us-ascii?Q?nMOXJcNL5I3I2Q3ZeZhsFROVCEssAs3MUyEdzY5FjuuxGrZ6a3VpFay9nPy7?=
 =?us-ascii?Q?1FXyQ2W6Vkhm1AvSZbUng75WsOky2s3H3IbNCHY5MZAyz3641b5qLDyraKpc?=
 =?us-ascii?Q?Azun7sMig8bOz5JDaxCv4XxZXD3vD4/O8tFb+aNh7XVzvyBPHUjgFngBXXmn?=
 =?us-ascii?Q?NwVXuHCSviEoL1Vo8am4ab8WznDgKb9Jx48Tl3j1vh/GOvvWu4oj1plsh9Te?=
 =?us-ascii?Q?WFM3KCxU78Pa2F29wjDYnK0d9Zpt/7O4t73NA12BbmaKScUHtk+YOGGkt3x9?=
 =?us-ascii?Q?iVBr09AJEnLxZWjq9J6MtsTiMOSvWC0nYlSXP7HcMcxprqndEBMfuYji6Lt5?=
 =?us-ascii?Q?skwnnYK0l9xj/1SxwQxhjFBMKbSllX7bqwej5vL6hVFrcnBgXBNjnnjFJnOG?=
 =?us-ascii?Q?kmiV2u0wCprqnc9cTkxhCdrCHASkjQnLJBU/igAU9oybCBU2FigEVXmvWDcJ?=
 =?us-ascii?Q?aMtE4Yom/2FshPWou11pOW1/aDjsjyB9Hnpel/xKTJUv2p2ETIxtqe1o4rFa?=
 =?us-ascii?Q?1ILiQFe5JRf9peQiQteI/ipayRiwj61vrym812nq9CB6THpaF8/AcBDojAFx?=
 =?us-ascii?Q?BZvMIO+fjMQYGmaN2ExRfFxuqGjp92BgL2mg0bjbxpJWaLH+KA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Da3pDzE83jdhH7HgKOJjwNy9/fLBzjj7/f1kw6L/EelU0OBhRT6Lhi5ETCT/?=
 =?us-ascii?Q?1ZJxoeGNcmsJhNxMzNVIdL4s55kjRuWc/9e8JfQF1OPXd5QKutUXGxrYerlh?=
 =?us-ascii?Q?+v+6GILYRGO5z2AoqYF4ZUK0+AFvGAvA09juuvrEuKF+mbwarrhqChLJpfl+?=
 =?us-ascii?Q?M18Y3pihxZbOtRS5Dj9JLQdLv25u2dlAfP8npbTrHFu25mNpLM3nWf9P1Eu8?=
 =?us-ascii?Q?f2DA7lrZliHAm87O5rjxzztivh+MAkRFkd13Kgljjp6KuXOjKALDDbls2ts7?=
 =?us-ascii?Q?3Uw99B7I2l56oMKK3etu2wHqwP05y444BwuCg8F5eFoSTH4o5BH67Odr6kUg?=
 =?us-ascii?Q?wvluQxPA4LmimuodlVHnJ23X+VFHrGfd7GuvSh/CsWWCA+MNvgDHB0NybvBA?=
 =?us-ascii?Q?PpnlMeGXzCI7qMFdvAevotHn11m+Zzlgb7CTVgZphf8hSEBTzTzx4uBj/Wjr?=
 =?us-ascii?Q?hTbO+F7GjPvz+0apxTua7tIZNHsF5pP7LhxUcSTF95lKvzfNvcrs7dUsLD4j?=
 =?us-ascii?Q?wrnjCIs80gDJkj7hO9v50qSN/zyBLrNRPfzlS4E1YCfKvEOWW3zOOITSx7jB?=
 =?us-ascii?Q?iIjSwiZtr2XPirAMDj5/ZxrhWUfbPICyK/pmQESZSXgidZNqsAUQ1FPb3JwU?=
 =?us-ascii?Q?2buvLmbpLzgx3gNSKoCDWmp/ZAH1JJJ+NKkWYtzcnnBrts2jI1jCBtJHqABL?=
 =?us-ascii?Q?PQkQbpoGxy87MVEtOzRPeroPKlNw+Bk6RLC+lBAIbu8ZsXdYKQqt/d8KmRrv?=
 =?us-ascii?Q?h/gDxnD9Ionn5PeDf41axxLm/gvFrDZ1HTs/Cb74W3vOVhs7L1GLNjv/5fMr?=
 =?us-ascii?Q?GM8QPXlT5RPGSk/T6CC4rz2gq+1ytfv4Kh9GRNOmD54cXq4r8ajrvIVUYWAL?=
 =?us-ascii?Q?t5YvsJ5qyPibQIG3Eh40Si7MWCljatbWINcJFn+konyPq+ZAZq6dmZsdSk+q?=
 =?us-ascii?Q?u1YPoTpeiuiU459EiXX0q5qFRDVAE9/U368ZbL8CNpXumnpz8M8vSyrkEMwN?=
 =?us-ascii?Q?4vHt3fA4fVIt2RnNO8nEGzwO5OR4p87TJEanDONBaHs/lilmDoE5n27OYLQp?=
 =?us-ascii?Q?T4JStWp7nPmTHwxc7PfJgaJWAqBT9fDMcqtgpq2IwZYlU0/JpfXTa6DYkZK9?=
 =?us-ascii?Q?yr46w120fueNRahi6Qg7QRPeYG8gdy0pQ7ZO02T1fILb4pTAKiqOd16Acmgf?=
 =?us-ascii?Q?eCyP89JPj0bgwhbXrqxk5wUKlnhZi72x/IGXdAAOZbGLWyPb/eJuPyDDtrL5?=
 =?us-ascii?Q?1GsUMSeJlKZ6KWhESEWooVBmuGAkhQzltLR6XOV98t8W9BEZWvpag0ODWQAf?=
 =?us-ascii?Q?G5QAlqGvdzwytoJ5EAez6hto3pl/aSiumYyIh42MgQ/BbXQhCQrtmK7j1dmo?=
 =?us-ascii?Q?i2oxxTuaqs5Lh0U6Gw+a7IVy1HpisOK3gZ5vREXblThU8D9uQ9Hof9t0VLPt?=
 =?us-ascii?Q?jc8Vgw8R5x0moP73tAUMKC7e8KGohnHOEhaX5eUofylOgSSozZw+BKtE+8WK?=
 =?us-ascii?Q?TGCarGbAjOFB0/O22RWg9jDT+L1Puh+U+acImYxEz8WaDxm63v2DoVnfUmah?=
 =?us-ascii?Q?osZRr4z9MIJNXhMAyeU7A7vf8TPUAY4S4xDSgK5a?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 678f82e7-9662-44c7-e810-08dd137af5be
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2024 09:14:58.6271 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wG7Ex93vFT3vtQ6Fz+lC99/H41lXwEnZG2Uf2rni0QmJAp1dPdpyOTTkl5hz6lUKT3PTCkdmr4aP6dEvR3G3wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8149
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
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Sent: Saturday, November 30, 2024 3:17 PM
> To: Shankar, Uma <uma.shankar@intel.com>
> Cc: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; int=
el-
> xe@lists.freedesktop.org; ville.syrjala@linux.intel.com;
> harry.wentland@amd.com; pekka.paalanen@haloniitty.fi;
> sebastian.wick@redhat.com; jadahl@redhat.com; mwen@igalia.com;
> contact@emersion.fr; Kumar, Naveen1 <naveen1.kumar@intel.com>; Borah,
> Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Subject: Re: [v2 09/25] drm: Add helper to initialize segmented 1D LUT
>=20
> On Tue, Nov 26, 2024 at 06:57:14PM +0530, Uma Shankar wrote:
> > From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> >
> > Add helper to initialize 1D segmented LUT
> >
> > Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > ---
> >  drivers/gpu/drm/drm_colorop.c | 27 ++++++++++++++++++++++++++-
> >  include/drm/drm_colorop.h     |  4 ++++
> >  2 files changed, 30 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_colorop.c
> > b/drivers/gpu/drm/drm_colorop.c index 111517c08216..871d5660e3b2
> > 100644
> > --- a/drivers/gpu/drm/drm_colorop.c
> > +++ b/drivers/gpu/drm/drm_colorop.c
> > @@ -104,7 +104,6 @@ static int drm_create_colorop_capability_prop(struc=
t
> drm_device *dev,
> >  	return 0;
> >  }
> >
> > -__maybe_unused
>=20
> Squash all three patches so that you don't have to play with __maybe_unus=
ed.
> Then please expand commit message to describe the problem that you are
> solving.

Idea was to logically separate for ease of review. But we can squash if tha=
t looks better.

> >  static int drm_colorop_lutcaps_init(struct drm_colorop *colorop,
> >  				    struct drm_plane *plane,
> >  				    const struct drm_color_lut_range *ranges,
> @@ -338,6 +337,32
> > @@ int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct
> > drm_colorop *co  }  EXPORT_SYMBOL(drm_colorop_curve_1d_lut_init);
> >
>=20
> Missing kerneldoc

Sure, will update and add it.

Regards,
Uma Shankar

> > +int drm_colorop_curve_1d_lut_multseg_init(struct drm_device *dev, stru=
ct
> drm_colorop *colorop,
> > +					  struct drm_plane *plane,
> > +					  const struct drm_color_lut_range
> *ranges,
> > +					  size_t length, bool allow_bypass) {
> > +	int ret;
> > +
> > +	ret =3D drm_colorop_init(dev, colorop, plane,
> DRM_COLOROP_1D_LUT_MULTSEG, allow_bypass);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D drm_colorop_lutcaps_init(colorop, plane, ranges, length);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* data */
> > +	ret =3D drm_colorop_create_data_prop(dev, colorop);
> > +	if (ret)
> > +		return ret;
> > +
> > +	drm_colorop_reset(colorop);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(drm_colorop_curve_1d_lut_multseg_init);
> > +
> >  int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_coloro=
p
> *colorop,
> >  			     struct drm_plane *plane, bool allow_bypass)  { diff --
> git
> > a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h index
> > 58e5b87c6d56..9268fffd04f6 100644
> > --- a/include/drm/drm_colorop.h
> > +++ b/include/drm/drm_colorop.h
> > @@ -391,6 +391,10 @@ int drm_colorop_curve_1d_lut_init(struct drm_devic=
e
> *dev, struct drm_colorop *co
> >  				  bool allow_bypass);
> >  int drm_colorop_ctm_3x3_init(struct drm_device *dev, struct drm_coloro=
p
> *colorop,
> >  			     struct drm_plane *plane, bool allow_bypass);
> > +int drm_colorop_curve_1d_lut_multseg_init(struct drm_device *dev, stru=
ct
> drm_colorop *colorop,
> > +					  struct drm_plane *plane,
> > +					  const struct drm_color_lut_range
> *ranges,
> > +					  size_t length, bool allow_bypass);
> >  int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_coloro=
p
> *colorop,
> >  			     struct drm_plane *plane, bool allow_bypass);  int
> > drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop
> > *colorop,
> > --
> > 2.42.0
> >
>=20
> --
> With best wishes
> Dmitry
