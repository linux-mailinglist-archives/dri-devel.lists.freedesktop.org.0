Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CC9C685AE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:56:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFAF210E448;
	Tue, 18 Nov 2025 08:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Va+y3Kpi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7CB10E448;
 Tue, 18 Nov 2025 08:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763456180; x=1794992180;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PrRaOVBqySKsMe+geXL7pmx+k9pPnX1xebKoSfdNUg0=;
 b=Va+y3KpiidR/6xCndp7lAUezUYL3o04SOWnygInh0RAlDV8vpc3vr9Sp
 ReA62qyz9Ao0CKW5AxGsOpBBoHQYhcwVNdnGvsB3HF0j6lBF95X1oNgwE
 FMAvoh/zFSa/dPfc8bRvGAcvdCbPn/W1S7qDy9rZ84yxIYcTcWSIHezmZ
 /lVAusUkI4fixS+3tTuBb3We6pWEim2VzIYob2mfrGroaOBIU4iai/EBs
 bS7tM8MqcfBH112ikA+UaLbx1C3GVD2r3XpnA3Ox/i71aEe2hAfMW3ml4
 JdEBsd7ojz9Dxcgx/V+CDs1XISj6Ju/xm71HvkU3VI8Vf74lNWkp9a2G8 Q==;
X-CSE-ConnectionGUID: 1Iwe4DBFQyWNITb7Xn9d3Q==
X-CSE-MsgGUID: +jvz3DuXQO6PWat1D9fARw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69340513"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="69340513"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:56:20 -0800
X-CSE-ConnectionGUID: ksooTfAGTBumYx7pLwOwSQ==
X-CSE-MsgGUID: yPuow8UYT0m4r6weu8iA4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="221363951"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:56:19 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 00:56:18 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 00:56:18 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.57) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 00:56:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKVWs0c5IAaS58Jp14O3lVJRs5lS1K0W+T8Vas0fpuwX9ClhJCuOXsyl2dnRcEuhzW8I2sHNN1Oc5Lt3cl3uN0Mj5Y1nwKzBkq3OUyLrIJty3jtCPcKERldGGxAFEawnHgNGkgciMnbbwmx1Fv+06HbVyAmLMgq0T71ZxWFTVFMbY5RN9fvZL3nmuh4LHFNwUff7+XDRUWrKwC1WXKb+Mx/96jtRtxkGKj62YNh43Vg/4TCv42q8K6NCLZQYz+X5+kXWzIHqO5D4xIQWymijWHio1mpDOZ/6I4FHDPh2fNAZxkSA6wS3DxOfMnTlODf2cJ08rpRDJYXgz7Y0Awamyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WucLjoK1N9Mr7xduzGjXkJK2ory3q3QCPs0kTvD2fm0=;
 b=H+KE15P8cA03vRvNTnPZT5OdUhEfkd2s16ADWR6g29E18MssKwse/dlya4dwMMdHtnTpwrkNOCC6sQHgafvz8Zaj7qZ5xc+l9mRuP7Q5IgJOxzykAW30z0W4B7bfMfSMW2uykXzr5uhzvfyo+efZ03SLXz/8M+xTUunRPi7fkae+Nx9Tx+bbz6B35WrUZKl1habD+8jbUkXuQrg0HDh04pxMtMyeO7KLCb3HJmQ0RIYEsoAmMupinXklRTFR3cWnRNhLzCWk/59WL8g2DqEEJUEjyDpG14t8WrHtQX+sXIEdhk+E6ti//leD50C3xTxW3G1z0tNQvmLsiBLErs1gwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH7PR11MB7987.namprd11.prod.outlook.com
 (2603:10b6:510:242::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 08:56:11 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 08:56:11 +0000
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
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [v6 09/16] drm/i915: Add register definitions for Plane Degamma
Thread-Topic: [v6 09/16] drm/i915: Add register definitions for Plane Degamma
Thread-Index: AQHcTk75+/dtw2JlTEm9wllyWi5F5rT4NZFA
Date: Tue, 18 Nov 2025 08:56:10 +0000
Message-ID: <DM3PPF208195D8D15A0B18135B6C8A4179BE3D6A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251105123413.2671075-1-uma.shankar@intel.com>
 <20251105123413.2671075-10-uma.shankar@intel.com>
In-Reply-To: <20251105123413.2671075-10-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH7PR11MB7987:EE_
x-ms-office365-filtering-correlation-id: bd06d829-9d80-43f2-6bdc-08de26805237
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?WBPDipF3quSFlB8spxObMoQmiPWWfSuhhoqFtsgoG8oK+swqnFjXyM6w3ZBO?=
 =?us-ascii?Q?tScHwpMV0StrrAhedjN7+LVYFxzKltrFrTmIwT2r0hqw02HvBKAEtHqHIP24?=
 =?us-ascii?Q?fgHzPehtWa/hDNuf3CTIi16clY4xnGKc8eQyoYSubkw8m2flGpWTlFWK1UkX?=
 =?us-ascii?Q?mp1O9nR4e9Xj96BqwOBjRc9Y/70vl0vdevL6D3W+ex695ZHWl0hfG9swrvqI?=
 =?us-ascii?Q?nFxlDGTkXyVUFgOtYcyn8AjmpCdeGMWGMis3XngWxpdOu1v/7xIuq4ssxCYs?=
 =?us-ascii?Q?ix8WUsqYRz7IylTC6kOxRK7+fOI7SBmpGDVEkio2xSPHewU+pQYcgL8e3E+K?=
 =?us-ascii?Q?DtqIBbn9lAyT3m/jR650TjDO4WXpGkobEW6kRX9WW0m1yDIzQl5kE/uf6DCw?=
 =?us-ascii?Q?gl1+CCWyZ4DONoXvvHdZRGFuqbGVViPJhgkJIQavEh+QxzBuYfGs5btrqtKW?=
 =?us-ascii?Q?WA90a4En030IfxJbUVawd3b61RIU3i18A+c83DfYDTdT+qWYtzu+KzHX+iDt?=
 =?us-ascii?Q?53mkQ0K98q9phI3KEG8ueMyeircT5gYsSHGvAB0Pfiv8MFys5Uj73/Jf01+u?=
 =?us-ascii?Q?oUZdyedLGa5HamwvF9cNqY+8MN0t7ZBq6drDWj6gNgZboZsFPamCBPW9APZv?=
 =?us-ascii?Q?s6/UxoWhHzfMrcm++iN9RLHYUlIxNMxdoiLVWEPlyYCW32eaGcHcP5JX+Dxh?=
 =?us-ascii?Q?QuE8WkNkVOocbIXXDcGTnknwc4vEBqzK9cIJ43WBjSEl34zuXW99oea5rynj?=
 =?us-ascii?Q?SPuxnsW7LV/YbTvf4TG/+4F/Z3d6OS5DQAgRcWpALPfRBG6SiMvJl/gIjtUb?=
 =?us-ascii?Q?+21pyKv6vuOgeZvpH3X3+0QUWXqOrPjPi1DUTlZlTBi7tRrujxkkjwDsIcb4?=
 =?us-ascii?Q?xS++7MBg0vyh6OOfp2eeyIvbr6PcAqBFxtmGBdgIvFHhTxy4zq6oRetsGy6+?=
 =?us-ascii?Q?C/kwL7dJOOwZYtW9tK2I3k8l+U2iwEY0Gba/gAmQOLAfhLJbLJa1OkKaZLMx?=
 =?us-ascii?Q?eAvsd7MoSbdlZB+FhlUsmgcuTxUDDwROaifJwbXTZegIf2GNqLJjdsRhHyES?=
 =?us-ascii?Q?aFw5IZ4bVc+g9ISlRCA/KWHOqBUqfOcyoCd8aNr8KYVyRisCfd8WUgiNCutf?=
 =?us-ascii?Q?Vy/p2ffuW+Q/Z/w/AE9QBNj2lcdZx6yDwK1Yreg+qDhzJwuHE4vuvYyUgwPD?=
 =?us-ascii?Q?22RAGGMountMuWOP40Y1Zf+AFqX7scK3UnM5idGPJ89C1yodMixlVMG8RBJW?=
 =?us-ascii?Q?7qfdf02LAPEmmvqMOyKWF9BkP+J0mHdouLbSrH4WsCtVtbU2gr+Yr4qkC/kY?=
 =?us-ascii?Q?ybGQ7+B2rrHBNnSmD10/KzzkPABd0ENmjjU5zs9YPOApcJOPy5EI30NU7cFK?=
 =?us-ascii?Q?ev1IYiM/yGa8AoUMRi7wZB9/ol63GXB46tQ3yOkCzCWOmvEbB5IYE/DMeHZv?=
 =?us-ascii?Q?Bovxpld744rq5v/wxKAzYWQIRqxd/LoiP1KYqqCMo4EoJFgEqZF6p4koNA2K?=
 =?us-ascii?Q?OryYuy2P9ox/b7l27nNQH4toV/LmWdYnSlg0?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?z8Pydkq3vf5M87gmfEEhZlqMkBm1r29AN5wwx2W4cry6nkHkwgGP+UVsNprx?=
 =?us-ascii?Q?kTC+dM4EozvNvlSEVWOxja/n64QVslgkTAqY5zzvyGRmWRbjNMWCJ/acUxaY?=
 =?us-ascii?Q?OBsrvC2aNgN1MYLtxx+gGgZ5RVklqvi6+GJf+MWSy//fNGonHV8DftgrvNI8?=
 =?us-ascii?Q?9lLWkRRa6KjbWrgHsNoxXOSkS+oK3un4pbGOtOh3OrV1wgqEmeD0tHPfwfos?=
 =?us-ascii?Q?OTFZUjTCyGXSx5+uGU4KFkLsWeSlYl0IiWmbNfNESg3HOE/SBUnCSxpaa1p9?=
 =?us-ascii?Q?XTDh/Ymk2//IcadQxJG5ukwRZiRgXqgrX+D1iSIhvXZhSagj0qFUyXpjaEZm?=
 =?us-ascii?Q?SZqRWGiROBY1g+FoUMv56/c57CFAVbDghqbo+Qjl/H4CuJNwSZoZaGLlULR5?=
 =?us-ascii?Q?+8LeK5WuHYGV7n8hIiTdUs2EnzQ+5FHeFQJMop63694+7s5zTUk1NQuODFAc?=
 =?us-ascii?Q?7DVTxO8Hp+/sG5QvjCW4gMjJXx2yMdRMTFr5Fxl0It6gH6+3npdc5cEbEEGP?=
 =?us-ascii?Q?Tqvu1xNYOS89NfADRU9wIsiVvcyCFw08G33tMC3X5ChIv3URFDA9aTuE9qy/?=
 =?us-ascii?Q?EvvlPlqI6kijZeAYNSoA1NLGm56d4O/xxA8u4BWujs8dDGlBYkXHnaDKFhb3?=
 =?us-ascii?Q?+0FA00kHONrImCdpiYhL4qW4TpjajjFqVgXkDS2VzeY8PXA8RtcGUbbdqgsb?=
 =?us-ascii?Q?aqTfT8ndkQ8xsM7AnWzSUyZKD3lAxE5PjjHuYrY5zxA8L7bfPtlPfRWQsS9b?=
 =?us-ascii?Q?6t33lTfIITLkVIeMmfcAGGWip3/gwDzAsaZwl3bWBE2SHTBvvexi67N8P+pD?=
 =?us-ascii?Q?PtDohVFVF/meJeAhhK9KJyU+sINy5hU0vzUVpjm1G4nvZYzDJRld7OkvAwh0?=
 =?us-ascii?Q?kXHzN0dN0NkPjoIDP7cNoCcbYJ7wYTQniIBNcGLVSKLDErx0PeAP9ckoGgIa?=
 =?us-ascii?Q?XGQCK5qmrZoC4qb42CuytwHC3V48Z/lOwwhbk8+sdCiN5DpbFQojX4b5aIwO?=
 =?us-ascii?Q?Blfz/wYcyIhbUogbTI5bWIQ6eBHDn/xaEvxaeFpQfa5k6GfHje5jv6G+F8C3?=
 =?us-ascii?Q?nX/cJhPLjq1utzsYzheObyyTmldeYW7+H+UnS4LKDo10VxLfB89/fqqeFOsY?=
 =?us-ascii?Q?XCYgQAmX8fwRml8aXEK06M92vaD7Ca8QCiK1Ih8SHa9GTlCbUuHGIYX0Z+a8?=
 =?us-ascii?Q?iVBlGRNDDsAtlvY4yexqBlV+cStxha1twWK/SYrp+oPA3xdGOW+UlIekmBaX?=
 =?us-ascii?Q?SnAbaciVX2EEt0ay8WmRBPPIrEvY63IuAXZZ95moJp1VzrHLUajUOnT3U3c7?=
 =?us-ascii?Q?FtNcL5men6F3XCCvVeVmdXgE7aTToKrKpTjMfEkVc5331wzyOJ+zWpbxvJ0A?=
 =?us-ascii?Q?pukX56hKY7ajlIUT2PM8VYTMqMJqA+DBSGhFPYkISt6BDPxjFLSIWD7ix0Pn?=
 =?us-ascii?Q?cvQGm3S+dzsE0H0WWwPKvn30OUJaGNQf9B//S82GDcDWsGc9sNd68Q90jH1k?=
 =?us-ascii?Q?Ov+C2S6jqt78Ys0aIjLoR3YSRvnHhWV8WFd5MKkHQMr3777ZA4zoE7jOL5gB?=
 =?us-ascii?Q?IFMfqQp85G0kJ0YUgfuD2b/4I5JPBs/3FBc9HtiW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd06d829-9d80-43f2-6bdc-08de26805237
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 08:56:11.0122 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HUlQjMp9jA1YPdWsHnz4MEsrovJgAY678n8CMU39HZfjBtae2KrI7KzB4oRohDGqHLAjI4fVcsyzIOQ/bryhpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7987
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

> Subject: [v6 09/16] drm/i915: Add register definitions for Plane Degamma
>=20
> Add macros to define Plane Degamma registers
>=20
> BSpec: 50411, 50412, 50413, 50414

Need to be in trailer right above the Signed-off-by

Regards,
Suraj Kandpal

>=20
> v2:
>  - Add BSpec links (Suraj)
>=20
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  .../i915/display/skl_universal_plane_regs.h   | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
> b/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
> index 7c944d3ca855..b3fbe1e20dfe 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
> @@ -254,6 +254,7 @@
>  #define   PLANE_COLOR_PIPE_CSC_ENABLE			REG_BIT(23)
> /* Pre-ICL */
>  #define   PLANE_COLOR_PLANE_CSC_ENABLE			REG_BIT(21)
> /* ICL+ */
>  #define   PLANE_COLOR_INPUT_CSC_ENABLE			REG_BIT(20)
> /* ICL+ */
> +#define   PLANE_COLOR_PRE_CSC_GAMMA_ENABLE		REG_BIT(14)
>  #define   PLANE_COLOR_CSC_MODE_MASK
> 	REG_GENMASK(19, 17)
>  #define   PLANE_COLOR_CSC_MODE_BYPASS
> 	REG_FIELD_PREP(PLANE_COLOR_CSC_MODE_MASK, 0)
>  #define   PLANE_COLOR_CSC_MODE_YUV601_TO_RGB601
> 	REG_FIELD_PREP(PLANE_COLOR_CSC_MODE_MASK, 1)
> @@ -290,6 +291,58 @@
>=20
> _PLANE_INPUT_CSC_POSTOFF_HI_1_A,
> _PLANE_INPUT_CSC_POSTOFF_HI_1_B, \
>=20
> _PLANE_INPUT_CSC_POSTOFF_HI_2_A,
> _PLANE_INPUT_CSC_POSTOFF_HI_2_B)
>=20
> +#define _MMIO_PLANE_GAMC(plane, i, a, b)  _MMIO(_PIPE(plane, a, b) +
> +(i) * 4)
> +
> +/* Display13 Plane Degmma Reg */
> +#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_A      0x701d0
> +#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_B      0x711d0
> +#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_A      0x702d0
> +#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_B      0x712d0
> +#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1(pipe)  _PIPE(pipe,
> _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_A, \
> +
> +_PLANE_PRE_CSC_GAMC_INDEX_ENH_1_B)
> +#define _PLANE_PRE_CSC_GAMC_INDEX_ENH_2(pipe)  _PIPE(pipe,
> _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_A, \
> +                                               _PLANE_PRE_CSC_GAMC_INDEX=
_ENH_2_B)
> +#define PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, i)   \
> +               _MMIO_PLANE_GAMC(plane, i,
> _PLANE_PRE_CSC_GAMC_INDEX_ENH_1(pipe), \
> +               _PLANE_PRE_CSC_GAMC_INDEX_ENH_2(pipe))
> +#define         PLANE_PAL_PREC_AUTO_INCREMENT          REG_BIT(10)
> +
> +#define _PLANE_PRE_CSC_GAMC_DATA_ENH_1_A       0x701d4
> +#define _PLANE_PRE_CSC_GAMC_DATA_ENH_1_B       0x711d4
> +#define _PLANE_PRE_CSC_GAMC_DATA_ENH_2_A       0x702d4
> +#define _PLANE_PRE_CSC_GAMC_DATA_ENH_2_B       0x712d4
> +#define _PLANE_PRE_CSC_GAMC_DATA_ENH_1(pipe)   _PIPE(pipe,
> _PLANE_PRE_CSC_GAMC_DATA_ENH_1_A, \
> +                                               _PLANE_PRE_CSC_GAMC_DATA_=
ENH_1_B)
> +#define _PLANE_PRE_CSC_GAMC_DATA_ENH_2(pipe)   _PIPE(pipe,
> _PLANE_PRE_CSC_GAMC_DATA_ENH_2_A, \
> +                                               _PLANE_PRE_CSC_GAMC_DATA_=
ENH_2_B)
> +#define PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, i)    \
> +               _MMIO_PLANE_GAMC(plane, i,
> _PLANE_PRE_CSC_GAMC_DATA_ENH_1(pipe), \
> +               _PLANE_PRE_CSC_GAMC_DATA_ENH_2(pipe))
> +
> +#define _PLANE_PRE_CSC_GAMC_INDEX_1_A  0x704d0 #define
> +_PLANE_PRE_CSC_GAMC_INDEX_1_B  0x714d0 #define
> +_PLANE_PRE_CSC_GAMC_INDEX_2_A  0x705d0 #define
> +_PLANE_PRE_CSC_GAMC_INDEX_2_B  0x715d0
> +#define _PLANE_PRE_CSC_GAMC_INDEX_1(pipe)      _PIPE(pipe,
> _PLANE_PRE_CSC_GAMC_INDEX_1_A, \
> +                                               _PLANE_PRE_CSC_GAMC_INDEX=
_1_B)
> +#define _PLANE_PRE_CSC_GAMC_INDEX_2(pipe)      _PIPE(pipe,
> _PLANE_PRE_CSC_GAMC_INDEX_2_A, \
> +                                               _PLANE_PRE_CSC_GAMC_INDEX=
_2_B)
> +#define PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, i)       \
> +               _MMIO_PLANE_GAMC(plane, i,
> _PLANE_PRE_CSC_GAMC_INDEX_1(pipe), \
> +               _PLANE_PRE_CSC_GAMC_INDEX_2(pipe))
> +
> +#define _PLANE_PRE_CSC_GAMC_DATA_1_A   0x704d4
> +#define _PLANE_PRE_CSC_GAMC_DATA_1_B   0x714d4
> +#define _PLANE_PRE_CSC_GAMC_DATA_2_A   0x705d4
> +#define _PLANE_PRE_CSC_GAMC_DATA_2_B   0x715d4
> +#define _PLANE_PRE_CSC_GAMC_DATA_1(pipe)       _PIPE(pipe,
> _PLANE_PRE_CSC_GAMC_DATA_1_A, \
> +                                               _PLANE_PRE_CSC_GAMC_DATA_=
1_B)
> +#define _PLANE_PRE_CSC_GAMC_DATA_2(pipe)       _PIPE(pipe,
> _PLANE_PRE_CSC_GAMC_DATA_2_A, \
> +                                               _PLANE_PRE_CSC_GAMC_DATA_=
2_B)
> +#define PLANE_PRE_CSC_GAMC_DATA(pipe, plane, i)        \
> +               _MMIO_PLANE_GAMC(plane, i,
> _PLANE_PRE_CSC_GAMC_DATA_1(pipe), \
> +               _PLANE_PRE_CSC_GAMC_DATA_2(pipe))
> +
>  #define _PLANE_CSC_RY_GY_1_A			0x70210
>  #define _PLANE_CSC_RY_GY_2_A			0x70310
>  #define _PLANE_CSC_RY_GY_1_B			0x71210
> --
> 2.50.1

