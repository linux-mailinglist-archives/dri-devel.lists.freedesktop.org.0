Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A92C9D238
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 23:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B9310E6EA;
	Tue,  2 Dec 2025 22:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ki61ujAi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F02510E6A7;
 Tue,  2 Dec 2025 22:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764713032; x=1796249032;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kXz0hE8jMIO4funy52d3l4i0rC39ktGg4+RZHzSX9FA=;
 b=Ki61ujAih3Vx91ZafB7n/BquD5URk0XNHohJG8FYfG8g0P5Tx3abQo/x
 NXs/7mZfdsXVOZg7v5BxygQF4Hqoiu0GRY18cj4WySu8prcWZsrSPg0K5
 m+mAjgpPm30nETj2/R36AXPb8Yd5zPymkORgi219R3e+otTkHY7UHpdVn
 wc5GRcMR7RwgrG15Udw3S/w7QyUuP4JRfUP38uQRCHHmxkPkg/8Q0oni6
 Sfb8xbcUIxhG80Sv5RMj15ykvt18IymG+/5N4NLsrzSojZRMNJNv6gWaL
 s0s84Q6nWhifFHNI8DhHIGge+jHOJ/7W9LmN4XtZZNRbgn3kHkjd0ZjfN g==;
X-CSE-ConnectionGUID: PfEaQMmwQ6KwSX3ivK5uxg==
X-CSE-MsgGUID: nRcI4IQCSP+yu3TJ9x9TTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70555193"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="70555193"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 14:03:52 -0800
X-CSE-ConnectionGUID: DDoufCSqSnysqESUEJ5OjQ==
X-CSE-MsgGUID: 7SMdIWLgQuCHW6BBRNZJRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="193783804"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 14:03:52 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 14:03:51 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 14:03:51 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 14:03:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZ/1EOae69EDXY8flFW6Kemt0rU/jFlqAZgbfgBn/Xu+nkpcjzo/pCZ2wFvTevxPNpVANkwqT3pEubb9T/S2Tp5Hc9/MftkdK00TjWKJ9j9jq3t9THQXRAykiNaopUwe1D5g/cG2zZIuNUXgTjekQXTV0NiTOC2KqhU40gNao4Y8JW+jF5F+XjX0Nrv/4elbS6dfUPR/i70+gEjxlUYcD/I8x0mrff2/L+6fJtKrNFOp25iZ4szw5+oIPbAJiRdqKxcjjgfpkbP6gB0vg6fIfgZkJXLNoWKcLeg+Jrtj1AyXtgpAM8PBEuLqezzpe4Xv8ZNskl44ochqLAQFrGZDgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRPYLSdm7k70PdugBTypHcz6w+G+GsbEOQtdtTbnBxk=;
 b=yPak8i1W6zBuYWGW2inHzNZ0eKq6lW/8Zct7r46umnGh/5q2AhUITQcq9VduRZW5HtGYr0xP006ySUQsnFDPrVmx6/rNCFNccRrRw4vmxDZkG9IEy3snPdMvApY+dUn1m8Qixf28rTYW66YLyX7GTIBg4YThBYA/vy9DYFjbInMfBdUYuui6WEEAU1Po/xkrciwGhpHNA5KtV6gTl2rOtYsYdGnacp9EeK6VVFz6adNJSVwKbcvrihTIqO9DbzmqWglv0W67HUf6LVSnkxvLQlO2+AmRPN7KZ5KhqC4y6gmiaFgZ5vgLCWu3BMLIXdTx8FxzovoblHtgenp+41xTlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB7296.namprd11.prod.outlook.com (2603:10b6:208:427::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 22:03:49 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 22:03:49 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Zhang,
 Jianxun" <jianxun.zhang@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Mrozek, Michal" <michal.mrozek@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>, "Briano, Ivan" <ivan.briano@intel.com>, 
 "Auld, Matthew" <matthew.auld@intel.com>, "Hirschfeld, Dafna"
 <dafna.hirschfeld@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v29 0/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Topic: [PATCH v29 0/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Thread-Index: AQHcY7wFW81MRE4Cjki7Yqpof74BILUO5H8AgAAAGeA=
Date: Tue, 2 Dec 2025 22:03:48 +0000
Message-ID: <CH0PR11MB54445B55ACA3FF6DBF92C0D7E5D8A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20251202184636.96142-7-jonathan.cavitt@intel.com>
 <aS9fqikvSVFJCkre@lstrano-desk.jf.intel.com>
In-Reply-To: <aS9fqikvSVFJCkre@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB7296:EE_
x-ms-office365-filtering-correlation-id: c31e7179-eb5f-44f8-d1cb-08de31eeabf5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?XQR7JkrA6NiFMr50ZaGZ8eaa8NzHBh1cxxfQctqzuMtUQxJpLj8jTowXsSqU?=
 =?us-ascii?Q?gITDZ3oeA1fKZfHR3BEvW8fGI84k4EFpEOy5JQ2DUc2mVrKI6DbQQt4nnHHE?=
 =?us-ascii?Q?qiAFgeM4sW7/7suZrj3dX4VfygvmQYVnxeVOegih6g5bC5LQ38zcO28uegR9?=
 =?us-ascii?Q?WEykSrmuAMAVdNsPKbhkr80XxWSxIbtzRyNZuJ1chM5lcILfWRQE9Lf28xKN?=
 =?us-ascii?Q?sF8XrgiYt4QiF2dQsUxLUm8cjug4ZE3+iqEHNYOYHOrv7sjvdkaSFACweyzh?=
 =?us-ascii?Q?PD+eMalIFRDme1BqmeQaF/AtOLl6pi4R1vNHBxqliYdq8I5QNCGAfo1p7Pjq?=
 =?us-ascii?Q?5bv/GVVydK1mR/s2isnCoxzKVaBVe67w3/N/kKB4MGQfhdjPg3FQMk+b1l/1?=
 =?us-ascii?Q?4Cpk9NxmRGIBDFT+U0+oxfDfUyg2dQlln2ZOPEnPPtnmF9SZU7LRyy/Wi2PS?=
 =?us-ascii?Q?eAQ6b5Cer4caAT+oQz1nhcMSr/g0jEXErUFo4JvngPr9jILDzBsrTkCCQw1l?=
 =?us-ascii?Q?VVtgXIbpnXIYsL8mbHbC5zRscf7wvtjv5FKv+x24QtJ89+4A1ADamtTxVUlf?=
 =?us-ascii?Q?vDXOvj/iI3Ju3CELrj/+1rk2AB10khuJ4/VcHG+JDAStq/L9NG+lSAp4m1gs?=
 =?us-ascii?Q?W46I7rYpmiCS7SwPqKD4fVNkHepXcIMHW0lU31OrDfsEIuNstca6QaS6s9XN?=
 =?us-ascii?Q?gfdeUsWlSYqtkcQ+65UXp9jNicR0plG4sapLRrjru7SZUzr2CuVeTunoH8oW?=
 =?us-ascii?Q?xOZHRur7QH9jiWWu2T7iVM4/9rLDvLZOHki/C2rCBixDls8S8D0TVSBOzwu6?=
 =?us-ascii?Q?yvLBoHeqFKHjctbpvxkKOLLlCr5TNx0vTzKGNKAbkovg61U98TRQZy89Qqdn?=
 =?us-ascii?Q?UsDV61Eig+2U827JrEd/jX0a8KtdLKpt3L0FWmbGsdYILf40WmKH9tAYIzcd?=
 =?us-ascii?Q?c1myNkUm2xCZh/4LD/FL2qTrbvHVyKVdKRjpy3E5VvXnLsAzhprUJhi1sX4h?=
 =?us-ascii?Q?TwP0QvRrsyMRt9wXzAItwEoZ32vZYxXEX/CCi/aDJ/wl0CCOhPhf/GWFaGLq?=
 =?us-ascii?Q?rb6oKxeNirE5fABKwe4auicSdG/bh5PnfpINONV4ADJCbnF3UkVmAcID9j8G?=
 =?us-ascii?Q?3tslu1kLETYOIO9Wk/ZwJotWmz7PxRpRD4evbGVpUybk+3k6v/Y9SWJ04Xh3?=
 =?us-ascii?Q?QAr3Mp1rpzvhenxq9gMtoTmgyr2ScxsS0fqHRhBYM2Ixefdlf2EqrKNUU4hs?=
 =?us-ascii?Q?zE+qXyHaSzii685jtl2Hf5AUatd+m7PBiVDpvJnzxbz1Uu/OZixReKV4e/vp?=
 =?us-ascii?Q?S5kiK8kzz96mlIW0TG5dVDxjiL+auQFhpNpVcajmVJeg40XLkUgpR29kkLFT?=
 =?us-ascii?Q?sztVJPNIag8otP4TWt+Zti1F2Gv/8Ly1BL2SCig99lWyRP+TufCaoeDIzUoI?=
 =?us-ascii?Q?MXkgf996m4JBVy+f40AWkB9PSGOkhHUMs67hSR0gUYmRjv/LqklBkPMCSyZj?=
 =?us-ascii?Q?2pQFRVIySf+S6ttFR/CBuEz1zH5bn7FuqatI?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xfoD6pjR+zAqfbsOIAt6H3DY4g1X6EPpOM56dH3I2wsY5aMY2PpBI26gxm2P?=
 =?us-ascii?Q?LY/zsXhps18UYQV1m7WBcOvaLG/R6M6BH5eLDZ3qsb7/AGDSfkMyb3KFRlh7?=
 =?us-ascii?Q?na3AaM5tUUlIzULdJsDyW6zOLsbktbnNzYsaltb3RP+iaDxWTBk9V7+RgOGX?=
 =?us-ascii?Q?BtDbLERH7JhYIhBpMeuZGWtfz6AcxEUrde87D6GIlDCTpbQD9BBlrohGYbmu?=
 =?us-ascii?Q?udZuANxX+AUA2si9FcprHMmjOykEWPUdkHy+5wNkOJpNmlzPqeq84H40lTez?=
 =?us-ascii?Q?o/F+O2/Pj6G1LBNVfyVq2cyT9YYBtQGiIgwTUT1+7zMdwz5ACfPBlILriByV?=
 =?us-ascii?Q?KNlJSMu59rqXR94d5qwRkMzTcWDL1Mtb9YPgq++5B+dd6RjF/aLLuG2lGouJ?=
 =?us-ascii?Q?h2LICybKAA5efAVSgJ3Pg/doB6mkfcIx8w5cnK9RI/PwHZnTYr3liuh3GHjN?=
 =?us-ascii?Q?pBziWTt98RzvxHuFTG5K01o0U7TlbdjIFT3UfzSeDoqnCcPEWUM/NN2gaKKF?=
 =?us-ascii?Q?Fa4LfocurzDXmw+8F1V1fJnqtyVXKufjPNf5u1Cey3sGXfpmggG3jzP7+dqt?=
 =?us-ascii?Q?fQAfysubEtKJpbExEq/fAL13cdvpycSSrvuBPZWt7elh/CG1JqBPyRhLujcU?=
 =?us-ascii?Q?sFXil8ipuXPak+nOTorLqnDQQMVIgeTC37vxpzOY6OeFZ4wN4d8FfiGSK51A?=
 =?us-ascii?Q?MEHlzgMrKSno1VE5OKhAZgDfswP1u1r9lzY84yY+UvTwaHVugc98iB7dpstc?=
 =?us-ascii?Q?mTwLT+rNlLIzuL9H+NWeZO8aTe++X4QzC22B7T3/E+twZl5hIdQ1Meot1u5u?=
 =?us-ascii?Q?e8R6h2HQSTQq+hIAvB0/CusHdaDoX+59FPgtLsAGxcinGhM7zKNs26G4aToz?=
 =?us-ascii?Q?IdWj6OmtNKiwXoKLKgzOeUgBMW2ryHl3lChIEsF0ub1pECqxGKUXNz7s5ZUu?=
 =?us-ascii?Q?elUg6kJ5aDnaJAIh8mvjYL/dwE9PUwMTQ03m67/p5GpOSFfJCTUzgP/JXEVG?=
 =?us-ascii?Q?eu5DK94VzU/IUqYxD7AhPvGCgU6y1fJK46CyfH3xn345idMfUO6yAoj2VR77?=
 =?us-ascii?Q?jCfccDjRLcLxETYfrFKMHw9mOtKxvyAvjeN5Lctl81Zr0OL1CRdzg33ayc2B?=
 =?us-ascii?Q?U99RgYvcuZJ3sXtQVIKm7wOfLuxdYXcJCW/7/AKIN2b1Zk1s8xZvYgpJ51SC?=
 =?us-ascii?Q?Gqtx9GIjA70nBwNC4FwFJ7DRTeplJYuaw04NgstkDeaZEMknt7UzcuUe53RK?=
 =?us-ascii?Q?QZRZWAK8s8J4LTctVvIojLCtYuFY+0ICzrGJqngJRcp+FsPH6rtPKMRwe6FM?=
 =?us-ascii?Q?OsN4RvoisqX3d7vBX5iPUHVAijo6zeh8tSjKmPiMLD0Unk3W0q07dwi4Iqz1?=
 =?us-ascii?Q?5MifYJZdiMIOj/NqENEeSuZEFv0WxgY1jyzRAXn+PYxbjJBUFUjFjNwbg81a?=
 =?us-ascii?Q?eqpwipU4x4K90lfV71+UXN/Ee4ERYbAAbwKlAcQGuWW5a/c118HZD4mdXju9?=
 =?us-ascii?Q?H81ZtTgTj+Sl09BFxEZat8X6AfwEl29zXyPNE1tNmZcTfgGFYEa98ZT34K5f?=
 =?us-ascii?Q?5purDV4e7LiMyWZyfjFjBppCtCwlXi1dVVka+s07dTsQoQCMc8PGKSlpb+Vv?=
 =?us-ascii?Q?1e7XIuMRbWf5f/hCc9MyiHgBgpJk/GtaV8SeKy4xaUJm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c31e7179-eb5f-44f8-d1cb-08de31eeabf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 22:03:48.9553 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pXc+ycXMBMis7LSF04AAddK1zRK77zUGBbFsP/3jw+ueZQadBqG/vas6zgl30/43yElZcsJkK+8ZcEqq839q4e/jb7LFpu0Hv5cMvh+KaT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7296
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
From: Brost, Matthew <matthew.brost@intel.com>=20
Sent: Tuesday, December 2, 2025 1:53 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Zhang=
, Jianxun <jianxun.zhang@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.co=
m>; dri-devel@lists.freedesktop.org; Wajdeczko, Michal <Michal.Wajdeczko@in=
tel.com>; Mrozek, Michal <michal.mrozek@intel.com>; Jadav, Raag <raag.jadav=
@intel.com>; Briano, Ivan <ivan.briano@intel.com>; Auld, Matthew <matthew.a=
uld@intel.com>; Hirschfeld, Dafna <dafna.hirschfeld@intel.com>
Subject: Re: [PATCH v29 0/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioc=
tl
>=20
> On Tue, Dec 02, 2025 at 06:46:37PM +0000, Jonathan Cavitt wrote:
> > Add additional information to each VM so they can report up to the firs=
t
> > 50 seen faults.  Only pagefaults are saved this way currently, though i=
n
> > the future, all faults should be tracked by the VM for future reporting=
.
> >=20
> > Additionally, of the pagefaults reported, only failed pagefaults are
> > saved this way, as successful pagefaults should recover silently and no=
t
> > need to be reported to userspace.
> >=20
> > To allow userspace to access these faults, a new ioctl -
> > xe_vm_get_property_ioct - was created.
> >=20
>=20
> Do we have a Mesa PR for this series? We will need one before merging +
> Mesa ack for the uAPI patch. If any other UMD plan on using this, we
> will an ack from them too.

Mesa is a bit preoccupied disentangling a circular dependency on their end
before this uAPI can be applied for them, so they won't be commenting on
this for a while.  However, there was a Compute UMD request that's currentl=
y
being workshopped.  If Mesa needs any additional information beyond what
Compute is requesting, there should be enough reserved space to add the
missing data fields.

I'd point to the Compute UMD request prototype, but it was sent to me
directly as a private email.  Though I can say that the prototype is curren=
tly
an addition to the xe_compute.c set of IGT tests... which is probably not
sufficient for a uAPI request, admittedly.

-Jonathan Cavitt

>=20
> Matt
>=20
> > v2: (Matt Brost)
> > - Break full ban list request into a separate property.
> > - Reformat drm_xe_vm_get_property struct.
> > - Remove need for drm_xe_faults helper struct.
> > - Separate data pointer and scalar return value in ioctl.
> > - Get address type on pagefault report and save it to the pagefault.
> > - Correctly reject writes to read-only VMAs.
> > - Miscellaneous formatting fixes.
> >=20
> > v3: (Matt Brost)
> > - Only allow querying of failed pagefaults
> >=20
> > v4:
> > - Remove unnecessary size parameter from helper function, as it
> >   is a property of the arguments. (jcavitt)
> > - Remove unnecessary copy_from_user (Jainxun)
> > - Set address_precision to 1 (Jainxun)
> > - Report max size instead of dynamic size for memory allocation
> >   purposes.  Total memory usage is reported separately.
> >=20
> > v5:
> > - Return int from xe_vm_get_property_size (Shuicheng)
> > - Fix memory leak (Shuicheng)
> > - Remove unnecessary size variable (jcavitt)
> >=20
> > v6:
> > - Free vm after use (Shuicheng)
> > - Compress pf copy logic (Shuicheng)
> > - Update fault_unsuccessful before storing (Shuicheng)
> > - Fix old struct name in comments (Shuicheng)
> > - Keep first 50 pagefaults instead of last 50 (Jianxun)
> > - Rename ioctl to xe_vm_get_faults_ioctl (jcavitt)
> >=20
> > v7:
> > - Avoid unnecessary execution by checking MAX_PFS earlier (jcavitt)
> > - Fix double-locking error (jcavitt)
> > - Assert kmemdump is successful (Shuicheng)
> > - Repair and move fill_faults break condition (Dan Carpenter)
> > - Free vm after use (jcavitt)
> > - Combine assertions (jcavitt)
> > - Expand size check in xe_vm_get_faults_ioctl (jcavitt)
> > - Remove return mask from fill_faults, as return is already -EFAULT or =
0
> >   (jcavitt)
> >=20
> > v8:
> > - Revert back to using drm_xe_vm_get_property_ioctl
> > - s/Migrate/Move (Michal)
> > - s/xe_pagefault/xe_gt_pagefault (Michal)
> > - Create new header file, xe_gt_pagefault_types.h (Michal)
> > - Add and fix kernel docs (Michal)
> > - Rename xe_vm.pfs to xe_vm.faults (jcavitt)
> > - Store fault data and not pagefault in xe_vm faults list (jcavitt)
> > - Store address, address type, and address precision per fault (jcavitt=
)
> > - Store engine class and instance data per fault (Jianxun)
> > - Properly handle kzalloc error (Michal W)
> > - s/MAX_PFS/MAX_FAULTS_SAVED_PER_VM (Michal W)
> > - Store fault level per fault (Micahl M)
> > - Apply better copy_to_user logic (jcavitt)
> >=20
> > v9:
> > - More kernel doc fixes (Michal W, Jianxun)
> > - Better error handling (jcavitt)
> >=20
> > v10:
> > - Convert enums to defines in regs folder (Michal W)
> > - Move xe_guc_pagefault_desc to regs folder (Michal W)
> > - Future-proof size logic for zero-size properties (jcavitt)
> > - Replace address type extern with access type (Jianxun)
> > - Add fault type to xe_drm_fault (Jianxun)
> >=20
> > v11:
> > - Remove unnecessary switch case logic (Raag)
> > - Compress size get, size validation, and property fill functions into =
a
> >   single helper function (jcavitt)
> > - Assert valid size (jcavitt)
> > - Store pagefaults in non-fault-mode VMs as well (Jianxun)
> >=20
> > v12:
> > - Remove unnecessary else condition
> > - Correct backwards helper function size logic (jcavitt)
> > - Fix kernel docs and comments (Michal W)
> >=20
> > v13:
> > - Move xe and user engine class mapping arrays to header (John H)
> >=20
> > v14:
> > - Fix double locking issue (Jianxun)
> > - Use size_t instead of int (Raag)
> > - Remove unnecessary includes (jcavitt)
> >=20
> > v15:
> > - Do not report faults from reserved engines (Jianxun)
> >=20
> > v16:
> > - Remove engine class and instance (Ivan)
> >=20
> > v17:
> > - Map access type, fault type, and fault level to user macros (Matt
> >   Brost, Ivan)
> >=20
> > v18:
> > - Add uAPI merge request to this cover letter
> >=20
> > v19:
> > - Perform kzalloc outside of lock (Auld)
> >=20
> > v20:
> > - Fix inconsistent use of whitespace in defines
> >=20
> > v21:
> > - Remove unnecessary size assertion (jcavitt)
> >=20
> > v22:
> > - Fix xe_vm_fault_entry kernel docs (Shuicheng)
> >=20
> > v23:
> > - Nit fixes (Matt Brost)
> >=20
> > v24:
> > - s/xe_pagefault_desc.h/xe_guc_pagefault_desc.h (Dafna)
> > - Move PF_MSG_LEN_DW to regs folder (Dafna)
> >=20
> > v25:
> > - Revert changes from last revision (John H)
> > - Add missing bspec (Michal W)
> >=20
> > v26:
> > - Rebase and refactor on top of latest change to xe_pagefault layer
> >   (jcavitt)
> >=20
> > v27:
> > - Apply max line length (Matt Brost)
> > - Correctly ignore fault mode in save_pagefault_to_vm (jcavitt)
> >=20
> > v28:
> > - Do not copy_to_user in critical section (Matt Brost)
> > - Assert args->size is multiple of sizeof(struct xe_vm_fault) (Matt
> >   Brost)
> > - s/save_pagefault_to_vm/xe_pagefault_save_to_vm (Matt Brost)
> > - Use guard instead of spin_lock/unlock (Matt Brost)
> > - GT was added to xe_pagefault struct.  Use xe_gt_hw_engine
> >   instead of creating a new helper function (Matt Brost)
> >=20
> > v29:
> > - Track address precision separately and report it accurately (Matt
> >   Brost)
> > - Remove unnecessary memset (Matt Brost)
> >=20
> > uAPI: TBD
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: Zhang Jianxun <jianxun.zhang@intel.com>
> > Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> > Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> > Cc: Michal Mrozek <michal.mrozek@intel.com>
> > Cc: Raag Jadav <raag.jadav@intel.com>
> > Cc: John Harrison <john.c.harrison@intel.com>
> > Cc: Ivan Briano <ivan.briano@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
> >=20
> > Jonathan Cavitt (5):
> >   drm/xe/xe_pagefault: Disallow writes to read-only VMAs
> >   drm/xe/xe_pagefault: Track address precision per pagefault
> >   drm/xe/uapi: Define drm_xe_vm_get_property
> >   drm/xe/xe_vm: Add per VM fault info
> >   drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
> >=20
> >  drivers/gpu/drm/xe/xe_device.c          |   2 +
> >  drivers/gpu/drm/xe/xe_guc_pagefault.c   |   1 +
> >  drivers/gpu/drm/xe/xe_pagefault.c       |  34 +++++
> >  drivers/gpu/drm/xe/xe_pagefault_types.h |   8 +-
> >  drivers/gpu/drm/xe/xe_vm.c              | 184 ++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_vm.h              |  12 ++
> >  drivers/gpu/drm/xe/xe_vm_types.h        |  29 ++++
> >  include/uapi/drm/xe_drm.h               |  86 +++++++++++
> >  8 files changed, 355 insertions(+), 1 deletion(-)
> >=20
> > --=20
> > 2.43.0
> >=20
>=20
