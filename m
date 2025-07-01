Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C99BAEF1D9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 10:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D2710E53C;
	Tue,  1 Jul 2025 08:51:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IA7G370q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584F310E534;
 Tue,  1 Jul 2025 08:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751359897; x=1782895897;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z92Yh7xI/pkneeULF+KRbze6r3R1oAPI+BoVFjtYhM4=;
 b=IA7G370qhBKnzKafW14V6/+q6HRYQEu8gZjcbGnFPdWZCnYrPaaU3ME2
 0xtB7CPcyjS7rZB1S/zhCpim1on69yyJUTjZq+Yd8iuswVzyAtePkEVTU
 oiVj9epbQ4uZe5ZKju3peNMeyyoeHqSanzSqdIJdi9Fpt5Uj8soOKa0HA
 MMd/hiHC8fH9cBjZbQAFwdhRdmj+8Cvj9VBAx5Jk4HXOyZSA+ENnalbTJ
 9Yp+fHhaLUAnVjg0gKIa9FT448YUv0Da0o0gAiNdaSAR77I/08QyyxCKJ
 +uxtk4bAyN25IHEPtQcQMDd39tiMBTYyv6sIe50xLKQtAHnNyKwg/+SSz A==;
X-CSE-ConnectionGUID: UyNCS7wgTw+O53cUQgFJww==
X-CSE-MsgGUID: ArCqPOUWQxW7dO0tH8UTMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="63863953"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="63863953"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 01:51:36 -0700
X-CSE-ConnectionGUID: jJuJ9C1tQ1u2Tvp08u+g2A==
X-CSE-MsgGUID: oMDW1XdVQF615BGPwU4I6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="184751652"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 01:51:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 01:51:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 01:51:35 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 01:51:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8YFHYXqaSUkIJt9m14RpJH24goprfBifAToSyCdFHsmE9Lhdl1DI3kmQA2GhqnkUnobB0LeoL/L5u9ZH9/HULo1JrSXbk+QjDQEQzxiqeeWcBZGSaA/6kPPkjBoz12tj3Q9YIw1DQ1huxGzvXlYUtfgwIb6cGcUoViGDYWF5GnCdyUw7rHonEGRMaFjEwi0DdGEuKekSLCs9/eMyhegTtLvus7Nb2lTtr9o7pOFKvXGMhR200dueFHdqZqYcRg5q6GOIEgkgu7a5H8Q/Cp/+xWLvh/y6uAj5NBkjV7Af/i0TFJx7+qQ48byVAqELx9lbVRTxVSIWJueS/D/mKrpMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKiJTUvZyaJ/dBUfryGXPRQiNK7zff68U2aR2Qk4qWM=;
 b=bUwVKCD4GDpA9Vm08gQ/BBjMfhlWdLjk9IG9uE5n+IjpSvmM4Jq2jJyD6oc5YMPPzZFMs7c+xWErVEFz2ZZfoPquJ8xSl5/i89qQwP8ZxlqWnYIOL97SXSJdEWymuXOcdc1Y9Iu+DeVfczs2WTgie4EW9HDI2XDGHfMIjM3VmVFizKkKQiHxOsciGYmBZb8wPlNZg2QeA6SCBTvqaqywYrSQBc92mUrH1A9RB9C5n4esfn/HIhpVsq5JoGq96zyAo9Z+vNRUdkPNWnqc1L1pmgJKETZMW7eFJbU3rEI+RX3kG6aHkFtopo46bsPS2L2XpUmTiX7UOSjxntNe/5rxXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by IA4PR11MB8916.namprd11.prod.outlook.com
 (2603:10b6:208:55e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Tue, 1 Jul
 2025 08:51:33 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::9c2a:ba60:c5fe:6a64%5]) with mapi id 15.20.8857.026; Tue, 1 Jul 2025
 08:51:33 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Simona Vetter
 <simona.vetter@ffwll.ch>
CC: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: RE: linux-next: build warning after merge of the drm-misc tree
Thread-Topic: linux-next: build warning after merge of the drm-misc tree
Thread-Index: AQHb6l+emhMrH/Y6BU6UNeL5uaqDjbQc8sdQ
Date: Tue, 1 Jul 2025 08:51:33 +0000
Message-ID: <DM3PPF208195D8DE7A0FFA6A52982F77DF1E341A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250701180955.0859f046@canb.auug.org.au>
In-Reply-To: <20250701180955.0859f046@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|IA4PR11MB8916:EE_
x-ms-office365-filtering-correlation-id: 46467339-89b2-418d-f938-08ddb87c7b11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?BnbSIAlTiNmLx6kmrJkY/1d26fqVT6kmBFC5kf0xbMSjwFvltVzB9ikk9fGr?=
 =?us-ascii?Q?RG0AKyWNS33HSIchy77oabWHwEvOqIIyEGHiO6McDDG/uYk8CLmdag0nBWEP?=
 =?us-ascii?Q?Wb/MajRIEJYg5yFrUceXDSfLtTzdXyfVnv4x52bGRWUyK0zNVibwb+yPNB8e?=
 =?us-ascii?Q?f7XSE/hlA6XV+iUaQIJXRmt7MZks+Qq6A6hqzB9ZPwThpZ2/2VDtmqyuK7Ec?=
 =?us-ascii?Q?VJ6EaUlzbdQ1xOcumnEiaUDwQfwmq+8Uf+ox4ZCiHKc/f6YeTG0teKzXRkWQ?=
 =?us-ascii?Q?rBwv91z518yIjn2sLK9tpTAR8Xwi0oE+7oiJelG0jOvU2FNAB9A/TKxcr3UW?=
 =?us-ascii?Q?OkDfmLo4abxZiEFh/LpYC4HugQ5n7lEYdztKbweqHMDJeCsWJRK/JJKVTJqL?=
 =?us-ascii?Q?SFlQF19xdp4VsVHl2S635CjxpbnoaVPPxppGDTw+wgS0NFY6X0J2U/URNmD6?=
 =?us-ascii?Q?2hRoKr2OBEXD8UnIR9K8VKwTas4lteBC4Z1c12+uJIPRuzSOYYElLn8AXasx?=
 =?us-ascii?Q?Hk/AkoqLHkOZPa0LLBDmbLyjXxFMsSkBAiPS2KtwsRtqKQUH2BUvVe7YXbhd?=
 =?us-ascii?Q?hEetUFxw5JbeIhoikGnkA60AhDH0ZsJ7Lgnu8EynWAhWoPl63Gnq6coNodQZ?=
 =?us-ascii?Q?FftMKJU3JWqvihoaLr6W+n79nTdnzPjeUtUXFSkIw7ZofirKgTsHkx5U1C0k?=
 =?us-ascii?Q?EtkgiimrxIf1j+8yEB5wR/oUUv/nxjf9gR9E4nWRE88bQqfcwWxjDLPiMnhp?=
 =?us-ascii?Q?UqZiYfUP2qQHJBXhlOUZUgQNb29rwLrV9+GzOPF6EcSUM+bQY7a8k4UPehW7?=
 =?us-ascii?Q?5Jz/NGIB+txC5POI+2qyH++glgFihFM2CCzAgke23bWmFZxRCkyIy305GvA7?=
 =?us-ascii?Q?jVrSvasb79kJcdBnJDFIq0NAcKtIqIswuZiViNckbdVzoBLaghibN6Bjd6mE?=
 =?us-ascii?Q?FAjBfC6j1o+Ip+iQXG/O3SkKdd9jKdKOWlgHkLWSyfAq0wVEVqZ8NoxQ9nvE?=
 =?us-ascii?Q?YYAOLnZh8FB/Jl7eKZzJr7YcyNxhNVW1MMv7Kraq2Aut+0dxVrbkvI2nsr9w?=
 =?us-ascii?Q?jyYpmfl1E2znw2/QMfIFMWB+oc3LBlp8n3ivVOvWOlzHX1q10gyQaQzZQ17a?=
 =?us-ascii?Q?EChLVUlsMLePbO+daYLhZNpwYEKwsslQewfAhDcosjBvTpZtmifLM+BHqU27?=
 =?us-ascii?Q?S7XNbyOaii14oxDf0t7r9+4sS4/0F2SiT6EGVGqrHY4tMFxyz5tQGfBMPx70?=
 =?us-ascii?Q?yfkEbjopl+pxd1wYMtPV7qMRrVh6aU53onTf0vfYZIkKhwRUAwu4LkHiPnJ2?=
 =?us-ascii?Q?zzcWa4s9ltx2oTlolr0IgJhseQXtBdpuSSv1JUlsB189VndwK+RCuYTVx+Aj?=
 =?us-ascii?Q?6P66uYMB2e4mFNiy40TAsrKkxxqYRVkB37nlQ3UTnSXNEYwW6VYdkY5jtyz/?=
 =?us-ascii?Q?M+O7Jr37W3skOzPin+mgFaU6Qfr1rfqbyug0rSpEEvS5XHsqVDaxdZ222/e3?=
 =?us-ascii?Q?V4ufWmM/WChT4SI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zPvtHzzpHl4CX1YHqeLVsN8NNUgoEwQulqXHU5mR4xSB9pSr+QhGjJnNR7c0?=
 =?us-ascii?Q?3pp20pZ8aI/0W2BtiP8FmAthm+B9O8ddlCt0SUXOYW5VvqvDIQ7rhCRfsAfI?=
 =?us-ascii?Q?k8PUITyjhutXU1kqadYKr9DgbWuTk67/0hZo2XjTGnvUqTDBAdIySUWIWUby?=
 =?us-ascii?Q?vdT+WRPLgE0VwKkwK0WnEd5PmtSFoIlUR9J4fmhT4wA/6ewEYhQGJJcFbuJh?=
 =?us-ascii?Q?wkVaqK2VkDYYCz7X8nVtQWx4HWvmW8J7/mjjPRuhjTlYavMUNREAWTuk2jfr?=
 =?us-ascii?Q?4rnzKj9EaKDIQR8jICdWF8m2qZOuYJX1Slsh8LO9kSb7L3qPvvLUBwxc6f29?=
 =?us-ascii?Q?E7oBW+SnEfiHUA3zXhvLLMGgxl1VdHM/zLXyDje5j+Jtteq6kNwHy9WgzQvF?=
 =?us-ascii?Q?AGSyixeGBcwzHrSo3s0u60fTathi+KVQITO0blyQkiSqPsnTzegxymE1rWVn?=
 =?us-ascii?Q?q494UZHTx9QQIwlsWXQOyT/pE6U0C5PiurXUF9uQat5AypYbzsssH5cR5bFd?=
 =?us-ascii?Q?nwLckibVilKWQZSfRuhhWNw22wYfR4xvjbYo32roP2cWw4pwx8+ohI9y0MHY?=
 =?us-ascii?Q?jsBG0BaCiSuVKaxg3KCGin8oqEHVpvpgkfh0/oMKQy/IO6lj24ACqZxOk+ov?=
 =?us-ascii?Q?H4mBu3HI45OCqq36fncx3qaKWwYPrM7yrKrT4W96jDtkOABwYVbymFI62mzC?=
 =?us-ascii?Q?D+c/QxeS7rrvNn0qH2wxYXotqW7+0dGNqkGFSS3zrk6Wdl+K2rGo0iK8FmtX?=
 =?us-ascii?Q?Zv91kluz/s69CB81so7dzX/LO86EF++JiYXG1U1ax59xKt87oPfEjFk0yMNQ?=
 =?us-ascii?Q?2sM5WKQ/lZzOiDPdLzH0D3VuLMKuixGh3HKXtM8dum8ELQVU93xJht6kR+xg?=
 =?us-ascii?Q?qjPZm24aRKqNzlmrSfxdsLDFJT6KWtM6SkPh7RmsA6dG3KWSdpp2Mu18SnZ6?=
 =?us-ascii?Q?G1glwcubZbXXrxHVxYSG2g7mrZ7z6hEa1lwDHjAJCrlURwGL9+cjECE/VTnz?=
 =?us-ascii?Q?z9vgx0sA9qoVUBO0vJxzWGZPSa1KVFl4B7yNUWXepoCgL2y/WTCz5Ezzu375?=
 =?us-ascii?Q?sGVoHI91evTj4ri+eD5rc1+UzmZWaOflQdRkNR1EJd0U4rrvJtoyZ+5Y9otx?=
 =?us-ascii?Q?yFPtigODcRH9XJ56q5eQhwdHpYmfcZNcR2iHz6PdglznkvjXFcymrBCRcQd9?=
 =?us-ascii?Q?1BiXA6Dp4LcLSU7sWjo0+p3MQ/1nUwhDNkq8oVo1Za4rmhDZY/jbinbCuYKJ?=
 =?us-ascii?Q?r01xhWTWNvI3l+OVvk7prruXb9x7g/bwOydA9jvZkfuiYpz1fM4FgW1F9gRW?=
 =?us-ascii?Q?tOcIdFBX2HxVIz7xNYWUTRfeUHB8KJa2Ob5Xu+OSDgQ6s90tnzqFR/wKMZA/?=
 =?us-ascii?Q?addPq4KMv8Wt3cjqwddXk3wtupsm1tL7ZTYmt5B1t/GV/Gd5t6GYk/jPao1Z?=
 =?us-ascii?Q?ctQcnsDk0xGqc8/Thi+nYoaAhvF/ZwkH8GIxPlKaSYkwJlggrag5KBtGRDlT?=
 =?us-ascii?Q?DtBTAJV4QGMAHFS3x9JdxtkJX9SsGlmxPwt2nJLvjpNylqk6S9rZDKRezZLF?=
 =?us-ascii?Q?00psdNCVBkjzMrNq2dA3Q5ShLaH7RprkSKRjsLvQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46467339-89b2-418d-f938-08ddb87c7b11
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 08:51:33.6269 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cn67ms3Unsvgp7Yr7qGQ72cXTXWVoCRt4USyp1YDCqDE6pY9xMqal9IMnd92HlEZZeBn0CmGhGeT1fpLJd+NYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8916
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

> Subject: linux-next: build warning after merge of the drm-misc tree
>=20
> Hi all,
>=20
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> include/drm/display/drm_dp_helper.h:859: warning: Function parameter or
> struct member 'luminance_set' not described in 'drm_edp_backlight_info'
>=20
> Introduced by commit
>=20
>   2af612ad4290 ("drm/dp: Introduce new member in drm_backlight_info")
>=20

I see I missed adding a documentation sent the fix patch do have a look.

Regards,
Suraj Kandpal
> --
> Cheers,
> Stephen Rothwell
