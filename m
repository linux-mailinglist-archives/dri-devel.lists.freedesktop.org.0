Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8C2C9658C
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 10:16:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074BF10E352;
	Mon,  1 Dec 2025 09:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ANJIQ1/l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3090B10E309;
 Mon,  1 Dec 2025 09:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764580595; x=1796116595;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8X4uymKivhqrkZcPF5VFR5L89yWnVezz1AfUZv+JIb8=;
 b=ANJIQ1/lfHmvANrdf/M9PGuU/woWcFaUJoiAg6+LMKPoKDGE4rBD7m8R
 mzORTJuumuO1xzTMMnO4xNtmr4RxJV7B9AfBxpi+L2WwSLzkaIFP8oEzs
 7HSawRcGhpOQafjp7sCE5pO0epyhUIGvH2k1N7QVc6A1fNfh5VaSHM2AJ
 iYnfJRzCwZpO2tI4sGnlVGyPEQcApf9ZwFLD9U6U9uj6fAvimggPxFqL2
 f9sHb2rl3lacwNy0/R1GXCZYkfwxgpO063K5M7vK3Qf8EkQsojhFeAj+s
 qtXMrw1tcPcC3DsgVgFR4WPOomLc0W4xtoSoEg2mSR8ZpfKjQlK9uxMvv Q==;
X-CSE-ConnectionGUID: OeTHdPTOQHupxoK6/TmrQw==
X-CSE-MsgGUID: p5Muv3djQpi58cO743twhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="65696331"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="65696331"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:16:34 -0800
X-CSE-ConnectionGUID: kigJJOxBQ+WKkyl8m2HYxQ==
X-CSE-MsgGUID: BVdUfljmSB+p14Bb/ud3qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="224995876"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:16:34 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 01:16:33 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 01:16:33 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.16)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 01:16:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tGkzH76lotw3IMcAu8bh4AZWc28WzfNmu00zbrj4qo0k/HoputLhj3LcRE0dZGdsdl5Osql2cm0z+W/s6SXIfIsDLI0ipcqOQhwCkSxGA82JjOPGC/woH0WSNsPn5IRKLb4gJDvqymx0YBCIW6th9qkZbBtiQ1frCsY7jTEFpWWnJHX/fIDDLN0UZBic2t300qtAX9zUeH8vc37i5NltdWu2Pr7sEwU8XsAw3WnV0jqc70K9Bg0fTt0cE7Np+Fi7UZ1PPq+rlLgoVK5GFSXsYdy+Lr+POA1Qzk21lKf0D/k74irkgrzbOm/AfEW8n4Z0cULAeNuAp/13+KRs2wZVVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCFBPBjFtP9zfWwAlZEwOIOoRRjfSVnzNEcFR3sk/+U=;
 b=YH6WHguvI/oweyXdAElyTgr6Rml/IVwqiX0VeHTD7rx+3HizMdIMgfppZMaLK7r3yl2s/Uht4JZauGILxVJhPQoAvpQTxvZ5nFtkD3RMfvhPyDrQ7ePx2SIToCVbGfBW+X/q6DcpYvAxfhFpybpPiac3+poUeZmLipDZY9iRl5CyX7eoJ6Vey7YhLX5svZg989ssDOSMyz7mYZJ2BqUQ0t6jV8hiK1mCS2U+QDX2KxrFtjYo2KwJvfeIGiqjzTquNNBXVXV2A25Z3Cr4BPTYn4T3D+zTgXJ71I5BO7KNBVsIkCStDbtNt8hMmiFHA4wyeaNCJ9ZQGvb6EHkKl0PEyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CH2PR11MB8835.namprd11.prod.outlook.com
 (2603:10b6:610:285::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 09:16:31 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 09:16:31 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: RE: [v7 07/15] drm/i915/color: Add plane CTM callback for D12 and
 beyond
Thread-Topic: [v7 07/15] drm/i915/color: Add plane CTM callback for D12 and
 beyond
Thread-Index: AQHcYozERN5I/ApApEuJ8OaemsUkYLUMgPEw
Date: Mon, 1 Dec 2025 09:16:31 +0000
Message-ID: <DM3PPF208195D8DAAA63C436FA6B7AA9214E3DBA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251201064655.3579280-1-uma.shankar@intel.com>
 <20251201064655.3579280-8-uma.shankar@intel.com>
In-Reply-To: <20251201064655.3579280-8-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CH2PR11MB8835:EE_
x-ms-office365-filtering-correlation-id: 9ffdbab6-91e5-45c6-c5aa-08de30ba50e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?cYCeDfdOBxXalWOtST5HUm2JlxScs1GNNUHz33QjXkxfXztkQQWa72cngHab?=
 =?us-ascii?Q?n62B6rJ06eCnLObBXDz5hKJNtyzCZ4oVJK8MtzHvu7Ulc8QZjXmfcIkZ+kQL?=
 =?us-ascii?Q?hMLGQ47lxuAYX+HSIWqU/YvNN4h/D2J1a3GwaqOJ8t/vbjQVdOWCFnzT9cih?=
 =?us-ascii?Q?JA3ZAbrY1rT7C1kKMdH0wmowShLgr0Gle31dBwy8+OmYhZpF/dA8aYN9Lth3?=
 =?us-ascii?Q?suzSJKq0/9nyCC3Z5/i+T4w2MHu3yeLdoanlmnQDbHnUOhtNXmn4eWu/bsP0?=
 =?us-ascii?Q?RBXHgeJUgXXJAEJhHfzSZi7TkHGReNnUNBnlEcmgu3U+GDx8EIbZyIQ1RsWe?=
 =?us-ascii?Q?JdrYU/lBpxcSsjJHgnQFNj2S17v4gxLMe735snStf0TjDsKLxfVuJYT10KLd?=
 =?us-ascii?Q?TkNp7GS/KHeoAKyXAgd9HNVQWUtsM4tAripKgz7kneISKP0cRRIkyizCAeox?=
 =?us-ascii?Q?p4JcnoXDgemw+0xiHJvHe6AfnxW84XHwOGvSQ6TVF4z0D2x51TWoJ8BsjGwU?=
 =?us-ascii?Q?eVd95DPvqNEUO+f1vwbLZl7r4MxdgBnMbAbsmKl78asUNLySCYnDaVkB1XtO?=
 =?us-ascii?Q?uxQMCXUtFBZdeGXp0u/rEy26fTE+l/UrBKamchtA16Rq5IiAbb5OCCIgf0BD?=
 =?us-ascii?Q?8fQcPBcO4aJtpcogn+oOoiH+P3oRrPAA72JDgiSAwnx7lMq48+hjgimTbdV6?=
 =?us-ascii?Q?JLHHBDZjYlVISW9+Rc9Yo+XDRF5WbNAmIe0y8DDJLnyyANnRon0XbxcI4qX3?=
 =?us-ascii?Q?GMGxi7jPbLyalHYvqdB5SpwO5gei9Z8t8vtnKI+b3xFrGcocvSclfbcJ/UGW?=
 =?us-ascii?Q?xXYBFgdJNHEwDTd3oECVf65AY8RsSFxZHpCJf8eoGAGdOCgLeMLbW/LbmXrZ?=
 =?us-ascii?Q?SpS0701iOGVb2l+Wedb4Y61yZxF5ucBE58ZN67yTJXnrR5uIuPdRZT9XUqHr?=
 =?us-ascii?Q?jP/hES+35f9OZpW+aIbieYUKxFHXNBQQ9afSblIpVg2OPqOHnUhI6i7SWxw8?=
 =?us-ascii?Q?gXyedOi6bS3rr6EGGA54t40FRLmCHnvVpnvg9L3ljGfkqQRK6kx+p0se15PV?=
 =?us-ascii?Q?ofaLC2l85TGi7s9zt3n5eKzOxBZv+85zFp2ftnLAcBKxd8CVznPXO5bkqD2J?=
 =?us-ascii?Q?x0u1p7BofCMq/yj7RUQ4EmE1Ot2r6/g3pFzNlsDdsNP3nHsge7l816SjTivX?=
 =?us-ascii?Q?fywfaAahA6TMbanIW5EKjC5o12jtQXCiXDigMMjaJVVQUYHd/aca5AN8PPb5?=
 =?us-ascii?Q?A+NuMbXh7Xwe3fxRPFJ2FZxN2mO1+X9lmV6h+CwdyGcGjlvj4JbKj6t+mHX5?=
 =?us-ascii?Q?wwCqU/cNWY/6jJgGMCR5I1TiXsMLEGcMuX6vufAoNoOx2N9eq/NW3KuBvH0s?=
 =?us-ascii?Q?pkO1p+xsEAqQhcOmIu6euBKud3ZFPHHeIgKGoDR/NhftpxaqTtUWdqxRbGaD?=
 =?us-ascii?Q?VMEgNvlVZwT+DXyibvCsQRhiwXFj+URsqhXBhhd5g0+svLNq92tF7diD5+b3?=
 =?us-ascii?Q?kkxbv59FqMmGIniMtQW77EHPfwgAPw7q8QKh?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ll/ZFxRicBiiNAz5hNPqkQpFwAZ0gU0Cq/ZqyXPGdD0xlpT5IqhKIXo+Xv7F?=
 =?us-ascii?Q?jky+n9FHQy8dHyP0Vw0L78TkipHa702jZP4NKhGc3AL1Yjp3QtwtxmQMoP1o?=
 =?us-ascii?Q?/FxW45a+djG8/r1GzO0zU+MKYRw7fw+szt2iFnaCjUOeLoUjZ06Rx9FyYdzp?=
 =?us-ascii?Q?yStQgMtwcO3i9NO2Bt76U9ESSpDSMx1ZDkj1N/T9CKnyB1OKQ/Yr9NwpHme8?=
 =?us-ascii?Q?FB6EhEFcyVQLB9Kh5XMP+69+EeTPfmUMKUHQuClq91QyOYUeemYigTqv/rN1?=
 =?us-ascii?Q?UAgcrKqqhpcD24HtFEaPUclUTusQJXkSOl1skSSmrQl/ttZyFgLQoVoy6qGz?=
 =?us-ascii?Q?KLBvErWwe4hFN4GEc/Ik1uQkDJmtvoUNVUknd3mdV8VCKT5k09Bz7A8MMSV7?=
 =?us-ascii?Q?URNvJ5u++mPcwgeXlK3QsxMgIojFfjOpTkSNpUtiKIQRerDaJ80n2LQH04wD?=
 =?us-ascii?Q?YPntmwCFLCurOJITkcYjXzla+qmHNzuhtmcrH4XC+Jzo1s6A2DK2hQGnLc65?=
 =?us-ascii?Q?ZCYwJoFGiJL8R4p1YJb0lUA+DD5shWblxc736cDMfhcZjWdP3oEUv243Pofb?=
 =?us-ascii?Q?qo0gvVm6jqDqALPgpzPn61GvpmKjgS78pxoMuc9qHbJo2KL61n4alReE8EfT?=
 =?us-ascii?Q?kAgU9TM60zcCo10Sf2YchqCxL5zmNuNm3OnnhZu2Xg1xdDVR57rYeGuNl0gd?=
 =?us-ascii?Q?QoIZO4R77N4n9eNP1q7WsHwNxkfUMDwcwiovL01fAHBLZCusAlhes67E1epy?=
 =?us-ascii?Q?JvUmT1S6l4tAcTuV+0eKeuTUHOKZ3VWIVjg8bhKy9RxAui1ep3AiAXdwYEay?=
 =?us-ascii?Q?QxDQKBl/E9WtsxhiQw9KEV0woTggSiChUCG4pXPdpSAYQQkDZMygLHwxlz7Y?=
 =?us-ascii?Q?r/N8dXQqITi23ep9pc7a+9wpMn6UuBhKrIRHzPN67af5DIxBuubBZFVsLezm?=
 =?us-ascii?Q?yCVn/AN0CGEBsSZPsi9iXEIxckR8Nx/12pBwfPs6QZBmydD/U1ZcGGr+eJsw?=
 =?us-ascii?Q?QKFyUAlCFYBtDpHkiBJa+t5U2Tlj8CLiM+Hf7D440AUiE8v8c6t0ghhzWRTI?=
 =?us-ascii?Q?AW7+C+mCwZjQ9N5pnQIUOAIEJWsRKQ+puT9aSpOuuo8ln6KJjMIKFzKPmyPl?=
 =?us-ascii?Q?YRKM0bvbxTDZ/u1ndtzhKf+aRKPq93e/WpGpMlttgK9yj7DbIE3A+ZhPNPUf?=
 =?us-ascii?Q?L/cWYdlRqx0jtYgqx/XLZqNnomL3nOmfEmEY4pv2/1QGEGqgucADBc9pAOKS?=
 =?us-ascii?Q?yQ9rMxMPJQcfsaBGweg9TCuFgE/jPvrEjEJBIziX1FQZZVkGFwR1dAB0MZ/F?=
 =?us-ascii?Q?yfS4IONwuyejnCFp5+HlB4JTTtaKo+xZNsbxT0ZFF0CCBFlD2tJnxbHAH8SX?=
 =?us-ascii?Q?ez4jwimMkf87q2PB3x3b7usbTWs9hAR3kXuIawAJRuuEjCWn2wAOcLP7yEWA?=
 =?us-ascii?Q?jn78JsIvkC2HjSxSWs6DX2nf4WXAYrjg08YmOvzxN3g+Rbj3VHkRnmnolDkx?=
 =?us-ascii?Q?yfhblnhZ7KjpquPDp2ox83LvjVrSRjdL2BW1PFe767BgwmpZkQESZeIUWzoK?=
 =?us-ascii?Q?CU6SMxWRgP6fXAAgWhK3PfUnlCHv8W1VfPQZLNfB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ffdbab6-91e5-45c6-c5aa-08de30ba50e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 09:16:31.2523 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cbaYtWgELD2OGxyFZmV4RU534omXLaSR1xIZG6mZ9wwnemEN4deH6sVC9E+4rZtA7Ir4lDFmd4NJvNPOcei0eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8835
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

> Subject: [v7 07/15] drm/i915/color: Add plane CTM callback for D12 and
> beyond
>=20
> Add callback for setting CTM block in platforms D12 and beyond
>=20
> v2:
> - Add dsb support
> - Pass plane_state as we are now doing a uapi to hw state copy
> - Add support for 3x4 matrix
>=20
> v3:
> - Add relevant header file
> - Fix typo (Suraj)
> - Add callback to TGL+ (Suraj)
>=20
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c | 98 ++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> b/drivers/gpu/drm/i915/display/intel_color.c
> index 81b87fed8878..2f8e985d51e5 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -32,6 +32,8 @@
>  #include "intel_display_utils.h"
>  #include "intel_dsb.h"
>  #include "intel_vrr.h"
> +#include "skl_universal_plane.h"
> +#include "skl_universal_plane_regs.h"
>=20
>  struct intel_color_funcs {
>  	int (*color_check)(struct intel_atomic_state *state, @@ -3842,6
> +3844,101 @@ static void icl_read_luts(struct intel_crtc_state *crtc_stat=
e)
>  	}
>  }
>=20
> +static void
> +xelpd_load_plane_csc_matrix(struct intel_dsb *dsb,
> +			    const struct intel_plane_state *plane_state) {
> +	struct intel_display *display =3D to_intel_display(plane_state);
> +	const struct drm_plane_state *state =3D &plane_state->uapi;
> +	enum pipe pipe =3D to_intel_plane(state->plane)->pipe;
> +	enum plane_id plane =3D to_intel_plane(state->plane)->id;

Lets have a variable intel_plane rather than inlining this specially if we =
need it at more than one place.

Other than that LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> +	const struct drm_property_blob *blob =3D plane_state->hw.ctm;
> +	struct drm_color_ctm_3x4 *ctm;
> +	const u64 *input;
> +	u16 coeffs[9] =3D {};
> +	int i, j;
> +
> +	if (!icl_is_hdr_plane(display, plane) || !blob)
> +		return;
> +
> +	ctm =3D blob->data;
> +	input =3D ctm->matrix;
> +
> +	/*
> +	 * Convert fixed point S31.32 input to format supported by the
> +	 * hardware.
> +	 */
> +	for (i =3D 0, j =3D 0; i < ARRAY_SIZE(coeffs); i++) {
> +		u64 abs_coeff =3D ((1ULL << 63) - 1) & input[j];
> +
> +		/*
> +		 * Clamp input value to min/max supported by
> +		 * hardware.
> +		 */
> +		abs_coeff =3D clamp_val(abs_coeff, 0, CTM_COEFF_4_0 - 1);
> +
> +		/* sign bit */
> +		if (CTM_COEFF_NEGATIVE(input[j]))
> +			coeffs[i] |=3D 1 << 15;
> +
> +		if (abs_coeff < CTM_COEFF_0_125)
> +			coeffs[i] |=3D (3 << 12) |
> +				      ILK_CSC_COEFF_FP(abs_coeff, 12);
> +		else if (abs_coeff < CTM_COEFF_0_25)
> +			coeffs[i] |=3D (2 << 12) |
> +				      ILK_CSC_COEFF_FP(abs_coeff, 11);
> +		else if (abs_coeff < CTM_COEFF_0_5)
> +			coeffs[i] |=3D (1 << 12) |
> +				      ILK_CSC_COEFF_FP(abs_coeff, 10);
> +		else if (abs_coeff < CTM_COEFF_1_0)
> +			coeffs[i] |=3D ILK_CSC_COEFF_FP(abs_coeff, 9);
> +		else if (abs_coeff < CTM_COEFF_2_0)
> +			coeffs[i] |=3D (7 << 12) |
> +				      ILK_CSC_COEFF_FP(abs_coeff, 8);
> +		else
> +			coeffs[i] |=3D (6 << 12) |
> +				      ILK_CSC_COEFF_FP(abs_coeff, 7);
> +
> +		/* Skip postoffs */
> +		if (!((j + 2) % 4))
> +			j +=3D 2;
> +		else
> +			j++;
> +	}
> +
> +	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 0),
> +			   coeffs[0] << 16 | coeffs[1]);
> +	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 1),
> +			   coeffs[2] << 16);
> +
> +	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 2),
> +			   coeffs[3] << 16 | coeffs[4]);
> +	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 3),
> +			   coeffs[5] << 16);
> +
> +	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 4),
> +			   coeffs[6] << 16 | coeffs[7]);
> +	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 5),
> +			   coeffs[8] << 16);
> +
> +	intel_de_write_dsb(display, dsb, PLANE_CSC_PREOFF(pipe, plane, 0),
> 0);
> +	intel_de_write_dsb(display, dsb, PLANE_CSC_PREOFF(pipe, plane, 1),
> 0);
> +	intel_de_write_dsb(display, dsb, PLANE_CSC_PREOFF(pipe, plane, 2),
> 0);
> +
> +	/*
> +	 * Conversion from S31.32 to S0.12. BIT[12] is the signed bit
> +	 */
> +	intel_de_write_dsb(display, dsb,
> +			   PLANE_CSC_POSTOFF(pipe, plane, 0),
> +			   ctm_to_twos_complement(input[3], 0, 12));
> +	intel_de_write_dsb(display, dsb,
> +			   PLANE_CSC_POSTOFF(pipe, plane, 1),
> +			   ctm_to_twos_complement(input[7], 0, 12));
> +	intel_de_write_dsb(display, dsb,
> +			   PLANE_CSC_POSTOFF(pipe, plane, 2),
> +			   ctm_to_twos_complement(input[11], 0, 12)); }
> +
>  static const struct intel_color_funcs chv_color_funcs =3D {
>  	.color_check =3D chv_color_check,
>  	.color_commit_arm =3D i9xx_color_commit_arm, @@ -3889,6 +3986,7
> @@ static const struct intel_color_funcs tgl_color_funcs =3D {
>  	.lut_equal =3D icl_lut_equal,
>  	.read_csc =3D icl_read_csc,
>  	.get_config =3D skl_get_config,
> +	.load_plane_csc_matrix =3D xelpd_load_plane_csc_matrix,
>  };
>=20
>  static const struct intel_color_funcs icl_color_funcs =3D {
> --
> 2.50.1

