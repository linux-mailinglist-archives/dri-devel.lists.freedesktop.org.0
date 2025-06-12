Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35765AD6738
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 07:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2EDD10E3EC;
	Thu, 12 Jun 2025 05:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQSsUZZZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D8810E3EC;
 Thu, 12 Jun 2025 05:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749705618; x=1781241618;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D+cPGgVMV1HptnEyBnBKkJlPGurSe9eNYytP84LTsh4=;
 b=AQSsUZZZEJ5eSBaXpDJD60xmjv5E5x72qLfmq1Upt9lhGexFV3+Ska5N
 V5/VA0GSFSc6537J00wVTnTFgT7H4W/N4/qZj/8ZaTinwCuVnCz4SsI+D
 Za7PM414NBmvlv2S1rT/YTx/nHexkhyonIpv1Ryya8ac0cEX72BMDX3/z
 7Qtzvl4gbNnx5h47k29OhEcDg3DPSLGXs0f0JKDO1DKyYrLLEL/ooOTA7
 FbJ8DSjolc9En8Vg3xDzwQdmukKPz4tYRfkOJKplio2dSwGEIIPvXWhtN
 JxPSykrFAuOae2CqAHuxiOgwUMx4qztDuVuZoudKZk93rHAGPawgAlKBq A==;
X-CSE-ConnectionGUID: 6FyafSlYQfyN+ZFq4pU0CQ==
X-CSE-MsgGUID: Ve9Qeo32QuGUWxoACXaD/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51967647"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="51967647"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 22:20:17 -0700
X-CSE-ConnectionGUID: spsCP4Y7T7+H8SOiZaUi5A==
X-CSE-MsgGUID: 57YerHvhSk2TDsnnSVaAKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="147899881"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 22:20:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 22:20:16 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 22:20:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.52)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 22:20:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVJcDdPWpZ4wrtFKegoA0BO07PFXQ3TR8WYiLE2dt4JKFaFv0xjKBjE7pLXCYgdC+pS4RnYjuyOrouOLF79FifK8S6A+gkdT+yEiqkZEr0EEO/NmTN4CWPPwhqTOOADQeIHOt0zmgDy3m9UhCRSwS8HzXfWsw8Y+Jeac+sSoxBbo4wcsem8uWCeiaIglZjNeBu8q+u6l/exXY26k12aYNSVmJqR+j3lne4duAOgQ3nOdtKkFHS6DTuHDc3gpY9uvuI5YqGObAljG8cgisqzn1FC1m7bwGs6akfVPqq6CXI8hwdS4CxI0brNDdT70MitRRN/0S09BrYFw2NjJl9gm8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lTfzpVhJWiiXDDhtMVP3Stk00zxVo3cVpC3oE800sQ=;
 b=ZOIMi6hjwGZ9q3G2QCLfnxnXEusDGQs1h/+0kz7oNBlSGVM8J99/sftrj4jGaqNFWTIm0d+2+CHQHlP27yu68qhliK963EK0AnpG0vEPGjv9YFIgy8Ftpeae3FI/3Z238jjnuFKgiLtM8/d1e9R56RLw9GixAOtmjNvmjZqf6eBHpqqtNBc8T5JmKr0oyBb4zhh1D0LTCzHA0VPZreffiH+KNlNMLPPIaD/76QJgG6OgPFEJnuZL6FCLyt7yJPE+EOvxnJ9Hp3LZgPos49kMs5/uWa/UTqfoXvbP2PEQF8Z3ifeZtrfHtvyX2z0kTK87d6QFCjvMT3zQDq4E+ZSNWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by PH0PR11MB4855.namprd11.prod.outlook.com (2603:10b6:510:41::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 05:20:00 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 05:20:00 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH 01/13] drm/dp: Introduce new member in drm_backlight_info
Thread-Topic: [PATCH 01/13] drm/dp: Introduce new member in drm_backlight_info
Thread-Index: AQHbrPQg9LSWc6AOU0WqEfhBxBzyv7P/VgJw
Date: Thu, 12 Jun 2025 05:20:00 +0000
Message-ID: <IA0PR11MB73070D9FFDB87B6DF4B3E41BBA74A@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250414041637.128039-1-suraj.kandpal@intel.com>
 <20250414041637.128039-2-suraj.kandpal@intel.com>
In-Reply-To: <20250414041637.128039-2-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|PH0PR11MB4855:EE_
x-ms-office365-filtering-correlation-id: ef889334-8c13-48f3-4014-08dda970c7b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?zVc+uPEQ2sfI5kzf7lPm7hccsDFt9eeRO+Mtcu3TvZ0qeO20nGaqh/fDa5Zp?=
 =?us-ascii?Q?fvg2G/JRaezX9bOLWZIdJrd66cz1GCE0zAp71T3ztU42u+zXjfZ9Qslov+Jd?=
 =?us-ascii?Q?XAfkue0MHdT5h+f9lqGKyXAqPVQTdtKoXfkdbr8qwHYUUAC55Cth0W2uiDIW?=
 =?us-ascii?Q?3gwx4SIowBxL9HDrLF3I/RWQPf5DEV2aNiEsGeHaHSMtSozPqhCRo4H4oNY9?=
 =?us-ascii?Q?WLuZjqhC+GIYfV6Qrji1UtIFf/5+jsz9IZQCx66C1QH503ToRQv3vBcBXRix?=
 =?us-ascii?Q?uJCl6sP3OraEY/Kk2lZxXH4ss3/q5NsC77qE/M2JpjNE4YH2hSNwsvZd+3GW?=
 =?us-ascii?Q?vSDIQ0bcgL5O9lgIS/p/6Po2X7tNDoMb8pvRsa8eVUToAT2+pruWSTCBnsW1?=
 =?us-ascii?Q?2Q5tKBcOFsJ6Qw+oq/9YCWNH0CmX7cZDh39s/Lsxzeb7zPy958r31v7GL3DJ?=
 =?us-ascii?Q?SO3Y9c903vVcdK2481g7JyZh833JS7xUW4GfdwgoWxmygtYi6h2LEB0flWT2?=
 =?us-ascii?Q?U3/c6lRHlKz8YmolVmuVIvTogiRX4RPTzC3gE8wueSlCk9spitJstGrRrPNh?=
 =?us-ascii?Q?z6VfH4QlNL8hNTRV9oY9uVK/t2/70UTWVjEYwgxhIVeTTtL3RGh9KApAAKlZ?=
 =?us-ascii?Q?cpaE85foCK5b/lmBYD7i1Bbgk0t8RuT+t3fRiv9LpW7Zu17pkx0ESYkzddo6?=
 =?us-ascii?Q?P6s8+40PA3fVfvjBX/BjCXkPlpmMMe+6ujpWvuM1/bOHH2+tbYzOb0YE1btO?=
 =?us-ascii?Q?LdF/if6u7p+ovLBZavQf+ODnOQK54nvDkM5jAasBxVGGCEOc7oN6VTMFCfSX?=
 =?us-ascii?Q?6W0BC1OM1gmW4DDhoJeGgY7cvMpZ3JZH4ucKP3MSlKePlGfYaRecvFX+HelL?=
 =?us-ascii?Q?Fxq1XPDeDFuTwymXQFzHzqjlK3fwbtleBDyw91MaocQ4ZhM0akv4Qwk+m69G?=
 =?us-ascii?Q?mwhIj965SMB/EtnLG8O1/Eu6Z1J827E380TKH/OaEEe6bK7sa+RpwFTZ4pV9?=
 =?us-ascii?Q?218OcoI7sk/QU9CeuEbQuLlVWELFyHev3Ltx1i/qtpSAjnOjVlCllEIYHeNJ?=
 =?us-ascii?Q?ic69yzxivcsx5EV3J3+/U60K5WL5JUP7wL+iUKHiX+5boae5KhkPo5yf41ks?=
 =?us-ascii?Q?/YffeBVZnVcOKFChEVLDyfailXtBkCSJNscjajK5Y2ENb7e3HrM4JaQFlZne?=
 =?us-ascii?Q?Gm65dp4P0919I61NJU6GN1oWoToJxTMSFcVcVD0eFNto+oc7ODjS79raJwFs?=
 =?us-ascii?Q?PlkJvLEArMYkesFYwgpUsbUQoWBcZYaw4Pefg9J7Z+9wAKzEXI+Kjb7HtHsL?=
 =?us-ascii?Q?CTcD4F+wPDZE7JMBv6fSYN58zay1LpgWaO0Xa6GiS0QVWYRNRzz1JWtzZvDc?=
 =?us-ascii?Q?gTXilmVxGPb6JkRLkD6Cd9KLfcnnlDYRGUbUdkyvs27FR6w8U5Mrn4eg0lCY?=
 =?us-ascii?Q?20IDEQLATdtc7kRl8dATPjJ26Dxm90saY9Gp0/6HBpHV0QtGQmnu2bOLHpAG?=
 =?us-ascii?Q?5ToG3jz5TAIPTiw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?L4KfIrn44W5EmSsEaiom+++5LTQspReDKSLVBnEXMy0cQjUnDrRFAhsrZevk?=
 =?us-ascii?Q?RUh2Mj3FUdyVAAESS3J64qZMHtlQA5v7w0InG2pWex8SdfwxL/glwWpHfuoL?=
 =?us-ascii?Q?HG99K+ctzbHmNCegoP7IPqjjC/77Tm+Dwt0Vf7hjzJawohoEY6wDEEbvDb/q?=
 =?us-ascii?Q?yfLlIoZshmsyeqBvrmiLlVAcAHyiUK2Rw5HUoXkFHYVVmKDl8cK5ILIAujIZ?=
 =?us-ascii?Q?jDQ2kkJJXnsphMWuGDVYQNq1nE6RJOcpH4yxpXj1iX7EeT/R3p5KII1p+JmV?=
 =?us-ascii?Q?mf2HUyEtgUmT4rkl19XPAy3EGyIjf5QitlTjqboXh3HIp1Qlv5h64ZQw4mzd?=
 =?us-ascii?Q?KVzcYBucfu7oe973zVVyxWvIGm/qWk8R4AfukdSBHWBuDkw5e4Y/w2ypRxWo?=
 =?us-ascii?Q?GL8sOMV1w3A2hBiw8sXV44gegyX6530UpmeKvSW9bF6iC7khDvS2W4i7uwhc?=
 =?us-ascii?Q?szFjybT5ac0NREPQKSl74ai5MVRKeOMilHXM96eA+5wKmNgO44urhxVyRnkW?=
 =?us-ascii?Q?VT5TdEm91z6mQrRf5x5XoPvjtRQ8TO6YCAqg4HKoOUgfd7V3S9wsQKTjJ3Jc?=
 =?us-ascii?Q?z7aWe01SwmWfN4ZQCd+6aPRTpfQM282c0DaHDLw+dGtY2sQFk4qqr/fxrpq4?=
 =?us-ascii?Q?W4w/VQKTi5F92A8lB0Y7WVnThTokc/68Yob4FdotLzKTfIIye3QXZEuvonVG?=
 =?us-ascii?Q?b6fiX7K8K8QAB2S3tSyu9afc2tuw2MccWLijzaJGaHokX0DI3eIS823s3Z/5?=
 =?us-ascii?Q?kOnuWQx+VijjHZDvomvRvueG+6AHC529cRlFEVl3pPe29QUed5ZBmP/j5xVM?=
 =?us-ascii?Q?rjhLXEkrfnXArzaqGJMs7YwZQv5Y7d5Ms878mavasTaqM5tB/va5r9uVpAK1?=
 =?us-ascii?Q?Wr8JAY7lZAqwdxbiIADb1eh0+Fgjn03I/9tGttywsxx2Leymhv9XCsM3rGdZ?=
 =?us-ascii?Q?I4CgH23tcxFxYTELngQDlIQP2c3ev0v9jQUVnzYJkcF0Q9Cl9CCMEklNOmJz?=
 =?us-ascii?Q?2xyMwG6qm7kaVQQaz7bi35UgpH5XXEd+8PLmMIkygcBaTYGsfEOL1qJrB/A/?=
 =?us-ascii?Q?C+UZI6Q+tdyyTGDbgkOyaa7+edbtENJMsraAKhQg2mpXc5QMfGg7x7DvrEmq?=
 =?us-ascii?Q?Ks5uglyMXRtGJKxHrWTyg+803xsIxX6MVJwk4RUWNLHmylj0WtCvAmHUtyda?=
 =?us-ascii?Q?R0E8AIuy0jJ5vTQlPOsgqi9YAN0knN/nXxgW2amAfMSZEtLVBRrUen3oGX/u?=
 =?us-ascii?Q?P8oIpaG3HquaNm0ccjWNGxJV5V6S2W8GWUNILR9J8jz5JzdQ7hFxsaD3de/G?=
 =?us-ascii?Q?4Dx3TGkyFZVvaOq+wHyawPYydKfgkfBE6k2U6Evk0PNXZeBqNOiSDU0Xo/zL?=
 =?us-ascii?Q?B/NqJgWAgvR1LkEFzRLfxL7W9Vv86t+6YxG3QHAZwt/Dace/4sQj9KliSHwJ?=
 =?us-ascii?Q?eS/MyERH9STAI+HfakGtXOHtbD4/wPGa4CLwlD7vNnRMafpkCC+ttXl6Yan0?=
 =?us-ascii?Q?EyHDwsBkEN55oLQ13C2dbdFiJ962pV8KwQmxiIAwFLjaNhSH72GbeemikC6g?=
 =?us-ascii?Q?hr+5HYZlSH118/TYr0QbOk0gSX+BJxY0TlyLBGzL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef889334-8c13-48f3-4014-08dda970c7b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 05:20:00.8190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kDoBGWuidWv1w8MbQHXG8/wxyIE0v3ZtO/sMlBfEsouK8Y89rtCz0iecsafjKqv45TQnG94trBICnbmI+VrL4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4855
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
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Monday, April 14, 2025 9:46 AM
> To: nouveau@lists.freedesktop.org; dri-devel@lists.freedesktop.org; intel=
-
> xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: [PATCH 01/13] drm/dp: Introduce new member in drm_backlight_info
>=20
> Introduce luminance_set flag which indicates if we can manipulate backlig=
ht
> using luminance value or not which is only possible after eDP v1.5.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
-------------------

>  drivers/gpu/drm/display/drm_dp_helper.c | 8 ++++++--
>  include/drm/display/drm_dp_helper.h     | 1 +
>  2 files changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
> b/drivers/gpu/drm/display/drm_dp_helper.c
> index 57828f2b7b5a..41de7a92d76d 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -4253,11 +4253,15 @@ drm_edp_backlight_init(struct drm_dp_aux *aux,
> struct drm_edp_backlight_info *bl
>  		bl->aux_set =3D true;
>  	if (edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
>  		bl->lsb_reg_used =3D true;
> +	if ((edp_dpcd[0] & DP_EDP_15) && edp_dpcd[3] &
> +	    (DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE))
> +		bl->luminance_set =3D true;
>=20
>  	/* Sanity check caps */
> -	if (!bl->aux_set && !(edp_dpcd[2] &
> DP_EDP_BACKLIGHT_BRIGHTNESS_PWM_PIN_CAP)) {
> +	if (!bl->aux_set && !(edp_dpcd[2] &
> DP_EDP_BACKLIGHT_BRIGHTNESS_PWM_PIN_CAP) &&
> +	    !bl->luminance_set) {
>  		drm_dbg_kms(aux->drm_dev,
> -			    "%s: Panel supports neither AUX or PWM brightness
> control? Aborting\n",
> +			    "%s: Panel does not support AUX, PWM or
> luminance-based
> +brightness control. Aborting\n",
>  			    aux->name);
>  		return -EINVAL;
>  	}
> diff --git a/include/drm/display/drm_dp_helper.h
> b/include/drm/display/drm_dp_helper.h
> index d9614e2c8939..b8fdc09737fc 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -844,6 +844,7 @@ struct drm_edp_backlight_info {
>  	bool lsb_reg_used : 1;
>  	bool aux_enable : 1;
>  	bool aux_set : 1;
> +	bool luminance_set : 1;
>  };
>=20
>  int
> --
> 2.34.1

