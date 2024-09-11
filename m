Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 152C7975331
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 15:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A89510E9FF;
	Wed, 11 Sep 2024 13:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="N/CmqCVS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2069.outbound.protection.outlook.com [40.107.249.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCAAB10E9FF
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 13:05:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rsAgGpGfF2sNHWxHwXDglxQwwSc1ZWHW2tM9OYf0RGbqE2m7KTUk0Jsq7+ZWhvB1g2JFyWI2IiBvDnTQU2tgM0MhEIwnkP1OzgKSxm5u0LuF7srZiL5Ii6vgDgN2DyneHj0VjX9uygjCgvxY6pGvJVj6vgiyD6XKZWOlJyLJLd/8ejr9JACxLkQciRlakkiulTcpDiilC/I2y3m1aOrlqR/u/NAC5xltqzEcALP0/94hyyHpyHo2aiaM2DwED7ss1WIvAL8pFDVVLB3qohOrRSubecUiJBr/6S59Dmf2GXrn1WU6krEESJVAs/rG1v0XCPshVM0DcG/lyyoChTJqLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yg3JXkaMb/HvtDtyTUP70jh0RioP38reKDYfU1bUf6c=;
 b=etADzTCDAQK54lx8YB9HKt5GurDMtexrokGoX9ZKjZGhGVPjj8S6v9Z/N+s4jwcP452CXYNF7toONiWsxYoHEd2gLqqY4lzX1CITEWIAQdMc8R/pMAcQQwifWaDbRxmwOS8EeoYPn2I8+I0ne2I/1+GZXhmIHvsvEkcdqq57Fyk4KOy7xpovFDOrt/DB2ZQjuYfMgtdL68SH4oxGJ0pHb9gCV5Cjm5FqIudSyRRjbwKGW/oS0utM1KT9kSuOv85Y3DNInZy6lK2lDICQRwpB7wPeohGlzbZ41dfxXLhro7yfEm9dR751gVIRIaUjoigV5bUlt38ke1ibhqKgJRetnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yg3JXkaMb/HvtDtyTUP70jh0RioP38reKDYfU1bUf6c=;
 b=N/CmqCVSjGPJLKIaKOueFZg7XBFhdtWNzvPRuC9wTxaw1BNfW+FNYZbiIss5dZn4On6LxIyA+heBrmSwAym/B3fxD/zE3Wx+NAfMdMUOQ7MMRDZpQBdLu2hKhdgGDc21Rd8d4igIgl89RcfK2z6rnnkEB4JcFh3kTXE0YNwhzdk=
Received: from DU0PR08MB7763.eurprd08.prod.outlook.com (2603:10a6:10:3b9::10)
 by DB9PR08MB7889.eurprd08.prod.outlook.com (2603:10a6:10:39c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 13:05:40 +0000
Received: from DU0PR08MB7763.eurprd08.prod.outlook.com
 ([fe80::861a:fed3:8d04:25c3]) by DU0PR08MB7763.eurprd08.prod.outlook.com
 ([fe80::861a:fed3:8d04:25c3%6]) with mapi id 15.20.7962.014; Wed, 11 Sep 2024
 13:05:40 +0000
From: Yulia Garbovich <Yulia.Garbovich@arm.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, Liviu Dudau <Liviu.Dudau@arm.com>, Rosen
 Zhelev <Rosen.Zhelev@arm.com>, Yulia Garbovich <Yulia.Garbovich@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] drm: drm_fourcc: adding 10/12/14 bit formats
Thread-Topic: [PATCH v2] drm: drm_fourcc: adding 10/12/14 bit formats
Thread-Index: AQHa/USFV+g+/C5soUS1Egjqil09sbJSXQ/Q
Date: Wed, 11 Sep 2024 13:05:40 +0000
Message-ID: <DU0PR08MB77635C9319D0907324E2ECB9E09B2@DU0PR08MB7763.eurprd08.prod.outlook.com>
References: <20240902142910.2716380-1-yulia.garbovich@arm.com>
In-Reply-To: <20240902142910.2716380-1-yulia.garbovich@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: CDF152D281633347BF8433C3CEEEBB74.0
x-checkrecipientchecked: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR08MB7763:EE_|DB9PR08MB7889:EE_
x-ms-office365-filtering-correlation-id: c968d5c7-47fa-4bf6-0eac-08dcd2626fb0
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Dk1bzi3cKnwp8fTVJYpRxx38uKSzwlfh68FL5AUaA1CA5eViKWacnj5n11qy?=
 =?us-ascii?Q?czIIp0wjZZTSd3yX2dXaNVZrKYShdzoZGK/MADTqxQW8hAeISOY+C4KMKlDJ?=
 =?us-ascii?Q?nhcK/wWSxxhOGCe5Ia4k6/pFjKep3nAhchx2NGTRfcNRrMGxQeXYGAWMRZHm?=
 =?us-ascii?Q?sVQs6OIVWCI5tzmoYKDYpsrg/I8KbAfmJEZLlKsguQLYko6YpLoVMyAXPSnU?=
 =?us-ascii?Q?evZqIbyn4R3D/ZdiA16k2kIhMprpG/CpsD4NoFAa4ne2ZYvqXGezAauVc280?=
 =?us-ascii?Q?xjtUeC+jNglN0lKFnIwXa8ovuZKpnENhG6xkD0fyomDr/jq/55yU/S2stgSf?=
 =?us-ascii?Q?SW25yjrwH8JHRdEXrNRCB4Ew+0FtLbQTp1tkah9J6Fb1l9IwuxpthccAXNjF?=
 =?us-ascii?Q?DLtHtZ/sAEzvv7GS2Md8pqoam/cBOynKl1yx3GxnhFLnQOU/QbWbokrddiui?=
 =?us-ascii?Q?Dx01HQu0/abV6vRUeLpbL8AipFhhaDqjhnryae83QQ9AND1VtJ6bFlZp0p+S?=
 =?us-ascii?Q?lEGKBXElSlgEmEfMZy9CauVInLVUoSB46N36oXwj9B5qo3QzYsRdZZVX9W3G?=
 =?us-ascii?Q?w1vVJef0nNkTW3hWLTDPaeYheMfKfRpi99AyEtvO1DX3lIFExR5AzmQFnf1/?=
 =?us-ascii?Q?rJTO5ec1NMhdkMGvP6hR5c6zuZRb+uqzU2T9wwHRd30hiey+Epda/NBzQ1je?=
 =?us-ascii?Q?p3gWZQtSmqvsNBtLCarPE33KkLekYwg7Vyq2kMZ9f35NwIcVDF8B3yYAe6RG?=
 =?us-ascii?Q?rVAKfvAxUgaCeg5NqYN1dCEP+qiRCzGXAlq9PZhdAsePyvjPGNEVD+gSnbiy?=
 =?us-ascii?Q?WCxmcbvYM9bIt0+FyOzStOXSh3uoxoK1xF9ZNE99lkTvT0+Wr7ePwUjOl/gi?=
 =?us-ascii?Q?Xn5AQv45WJqTabUI4zYviFizpvHdzHTNXXBUYVYBZMoypknEXftzNBWyym27?=
 =?us-ascii?Q?PePAs9FnvNtrUY9RPU9oE2PVnWy8GeH0LkNo2YNBf19kXPVirR5m30CfoCXk?=
 =?us-ascii?Q?LhQFqudUoa2XSmFKN5aFZvA3qu81EO8U8lSrB4hzUy9hY60Sdh8Ym0oKF9N9?=
 =?us-ascii?Q?BmjbQiUK9RxlQY/XGcedKwGuo2dEoSrtxaPrigR7vQV0VSALsqCNpkpFQ3MD?=
 =?us-ascii?Q?ov6uetqJZV7DsX0DsgnFw1MJ7dCSuy2M6nu9Lub4fCsyRVgeGrRcm8UzWnaU?=
 =?us-ascii?Q?2YTT5vggUw+9E+1hDCs3z2uyGLvsO2HqPnBF3XJQaubK3sHRKb7rF40nVvgF?=
 =?us-ascii?Q?YCkNU654qixotuit/sOH4W2QG7Zhx5rhC+bF3d8LCT+y8QfeQMZcHjD8bhRV?=
 =?us-ascii?Q?SDg7A26xlvskb8zi2L76C6pkIyh/rzIcfBoFDxsMZUyyGhrjt8IQmBNbRu1I?=
 =?us-ascii?Q?Dwvl7C88z++hVk197QqfrYeY4D8CMgEsaat+ZFbkOqEnsxUMUw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB7763.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dGjy4XSZO/eLwNNF1rP1+0G+NPiIit3I2UeeDHzQdm+mYttJOGXxpPh3+OjT?=
 =?us-ascii?Q?5OHh2Y+PCvyN9U7Tvl/yYg2dvm8bg3jiKhTymOuW8dYhJf9VrkdnsN6k/3yZ?=
 =?us-ascii?Q?e5JKMnJYkOsLc+lBXYgoL7sZYZK+QaYquKO8bnWMUQE66fZDnFLl/fIrfN2y?=
 =?us-ascii?Q?ZY2B9RfrKu3kzZ3uSlZxu4b7gdbqXszR8KxC6/b0+U5Kr3Y14M2/rIMt4drA?=
 =?us-ascii?Q?k062WqIq1+sGp9MBHxZTJukp560NgW9eaRm3RXkV8+GLd8fPGfAfTLVyiqdh?=
 =?us-ascii?Q?gYUjXVsJ8NZXPKbmBhuT2cloyt/eakPc0gZ8+iwI0EVdbsuQ/qt8EvBnQIce?=
 =?us-ascii?Q?HZ0Rgq9M2jPayoydoiMb1txmz4ArcnWYWHonwdHvfoZ0QRrylLYdzHqTK03E?=
 =?us-ascii?Q?8YxectXgxUwCMAS1T9ppwTo1LSqVx8ETpFtbst7LX+FVWyK5dFYYxj3b2qaP?=
 =?us-ascii?Q?fvAj46W8n5jVSMN/wdIQ0/26b5zgMyVcU+C0H3bUSl5ONB+ejdNdLATFa2aq?=
 =?us-ascii?Q?8WPuGeUgAKsemRSZcr9Q2Xw6r5qqutmX5q+6z0L28WvzQddIRhaidWCXXQnC?=
 =?us-ascii?Q?pEbbUKjjrC91J3801TqUCGpy/1Dm6SP2avv/8xa2QE93YxI29qq7PxU313i3?=
 =?us-ascii?Q?umsl87N3VVr9076Z7j/RnyXPnGI4SCWcsWLK2HlNFx61yKL1/phrP8JGQUI3?=
 =?us-ascii?Q?OVEM70Ui3Tqgrh3dM/HsHVxRtbz0tb0BKfFg8QOk1RBMMg8vbADNGlDNpqm7?=
 =?us-ascii?Q?zIxEeWwU6br9PsdibI7U+YaRbAzdgEnDaUzb1Zx/xg49D18Tle9+HnAiC6a8?=
 =?us-ascii?Q?x8L+t1KsYUOFPJ9kWlIEimlGM5wfaZIqDUPS4Qq48dprNzEcnOFxgj7G9GLq?=
 =?us-ascii?Q?tcsjg6+yZHXglxmT+RwOAsWRgs92e5dwsF7lHIx4cSmqI9VKLUXbpWIBVgDo?=
 =?us-ascii?Q?Q2mGruOo7JwtF5bp5qpyTrvCQsVroFIvosivDFOcCrhQgysUjSw0kEevL0i0?=
 =?us-ascii?Q?arcTDEJsUOsGA/2OzJOmpO0hOTaMOKqEcu0wdoWr0cwKic3AcIAP+dzpWC5G?=
 =?us-ascii?Q?C/jYwMAudH5vUbmoOz6bRGJfVUMaN6LItWVuqBAAjp1uiFrH03ppFqkozVD5?=
 =?us-ascii?Q?7NZ65bHtDbvleTMI9IHdyNoM7R/N8QqtXRJGdZgFmC1cko5Z3f4LxQR2E10g?=
 =?us-ascii?Q?TtEn/AWW6f5ZuQfXfF3uIvQz577wloddT1pBRQhgz1hTLbBJXEZm96X+JMxp?=
 =?us-ascii?Q?iYXvy3z8TeNUL+LRYRG/KbLCKcDExMQbFRP1B0LCjnGHgZ8GyAYnlZnM7C1t?=
 =?us-ascii?Q?g4watdjell50jP1gyPJFG0G933lGYtmpM1Sho+4Q2o0Bibz7IaVsWBm9PI4W?=
 =?us-ascii?Q?W+d5UYEUQCEavu2ZvLkfkSz3pcq51FzINkmfwTj/mseIhe6edgZozHVV2YsZ?=
 =?us-ascii?Q?s31djRiPtsI80yF6jlmkXy4SbvrUw+CKLKD8S8mE+RFDBsNKhlFbDVnWlbLR?=
 =?us-ascii?Q?NvWmNEpPpw5+jHRrjBsSHgSz5j5r2jcWuH9qrG1vOkqTnKwf8uLlxxfeiNkD?=
 =?us-ascii?Q?zRzfkWl2ZnFg5RQ9zg5zkwLFrT6RDXxNTV3+0RF0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB7763.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c968d5c7-47fa-4bf6-0eac-08dcd2626fb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 13:05:40.1682 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 21cAnzx00SCAd3Lpoz4BCTxggWWvFcoFmnSO026eyrQIRZbO2URpH8wQkrl7+Gy2FoCv5bcJt86/rHVynmNTsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7889
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

Hi Ville, good morning.
I fixed my patch according to your comments and posted it for another revie=
w.
I didn't receive more comments from you.
Is it mean that it passed the review and can be merged?

Thank you
Yulia

-----Original Message-----
From: Yulia Garbovich <yulia.garbovich@arm.com>=20
Sent: Monday, September 2, 2024 5:29 PM
To: dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org
Cc: maarten.lankhorst@linux.intel.com; mripard@kernel.org; tzimmermann@suse=
.de; airlied@gmail.com; daniel@ffwll.ch; Liviu Dudau <Liviu.Dudau@arm.com>;=
 Rosen Zhelev <Rosen.Zhelev@arm.com>; Yulia Garbovich <Yulia.Garbovich@arm.=
com>
Subject: [PATCH v2] drm: drm_fourcc: adding 10/12/14 bit formats

Adding the following formats
     - DRM_FORMAT_RX106
     - DRM_FORMAT_GXRX106106
     - DRM_FORMAT_RX124
     - DRM_FORMAT_GXRX124124
     - DRM_FORMAT_AXBXGXRX124124124124
     - DRM_FORMAT_RX142
     - DRM_FORMAT_GXRX142142
     - DRM_FORMAT_AXBXGXRX142142142142

They are useful for communicating Bayer data between ISPs and GPU by emulat=
ing GL_R16UI and GL_RG16UI formats

Signed-off-by: Yulia Garbovich <yulia.garbovich@arm.com>
---
 drivers/gpu/drm/drm_fourcc.c  |  8 +++++  include/uapi/drm/drm_fourcc.h | =
61 +++++++++++++++++++++++++++++++++--
 2 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c in=
dex 193cf8ed7912..cd5f467edfeb 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -170,6 +170,9 @@ const struct drm_format_info *__drm_format_info(u32 for=
mat)
 		{ .format =3D DRM_FORMAT_R8,		.depth =3D 8,  .num_planes =3D 1, .cpp =3D=
 { 1, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
 		{ .format =3D DRM_FORMAT_R10,		.depth =3D 10, .num_planes =3D 1, .cpp =
=3D { 2, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
 		{ .format =3D DRM_FORMAT_R12,		.depth =3D 12, .num_planes =3D 1, .cpp =
=3D { 2, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
+		{ .format =3D DRM_FORMAT_RX106,	.depth =3D 0,  .num_planes =3D 1, .cpp =
=3D { 2, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
+		{ .format =3D DRM_FORMAT_RX124,	.depth =3D 0,  .num_planes =3D 1, .cpp =
=3D { 2, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
+		{ .format =3D DRM_FORMAT_RX142,	.depth =3D 0,  .num_planes =3D 1, .cpp =
=3D { 2, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
 		{ .format =3D DRM_FORMAT_RGB332,		.depth =3D 8,  .num_planes =3D 1, .cpp=
 =3D { 1, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
 		{ .format =3D DRM_FORMAT_BGR233,		.depth =3D 8,  .num_planes =3D 1, .cpp=
 =3D { 1, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
 		{ .format =3D DRM_FORMAT_XRGB4444,	.depth =3D 0,  .num_planes =3D 1, .cp=
p =3D { 2, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
@@ -200,6 +203,9 @@ const struct drm_format_info *__drm_format_info(u32 for=
mat)
 		{ .format =3D DRM_FORMAT_XBGR8888,	.depth =3D 24, .num_planes =3D 1, .cp=
p =3D { 4, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
 		{ .format =3D DRM_FORMAT_RGBX8888,	.depth =3D 24, .num_planes =3D 1, .cp=
p =3D { 4, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
 		{ .format =3D DRM_FORMAT_BGRX8888,	.depth =3D 24, .num_planes =3D 1, .cp=
p =3D { 4, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
+		{ .format =3D DRM_FORMAT_GXRX106106,	.depth =3D 0,  .num_planes =3D 1, .=
cpp =3D { 4, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
+		{ .format =3D DRM_FORMAT_GXRX124124,	.depth =3D 0,  .num_planes =3D 1, .=
cpp =3D { 4, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
+		{ .format =3D DRM_FORMAT_GXRX142142,	.depth =3D 0,  .num_planes =3D 1, .=
cpp =3D { 4, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
 		{ .format =3D DRM_FORMAT_RGB565_A8,	.depth =3D 24, .num_planes =3D 2, .c=
pp =3D { 2, 1, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alpha =3D true },
 		{ .format =3D DRM_FORMAT_BGR565_A8,	.depth =3D 24, .num_planes =3D 2, .c=
pp =3D { 2, 1, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alpha =3D true },
 		{ .format =3D DRM_FORMAT_XRGB2101010,	.depth =3D 30, .num_planes =3D 1, =
.cpp =3D { 4, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
@@ -219,6 +225,8 @@ const struct drm_format_info *__drm_format_info(u32 for=
mat)
 		{ .format =3D DRM_FORMAT_ARGB16161616F,	.depth =3D 0,  .num_planes =3D 1=
, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alpha =3D true },
 		{ .format =3D DRM_FORMAT_ABGR16161616F,	.depth =3D 0,  .num_planes =3D 1=
, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alpha =3D true },
 		{ .format =3D DRM_FORMAT_AXBXGXRX106106106106, .depth =3D 0, .num_planes=
 =3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alpha =3D true=
 },
+		{ .format =3D DRM_FORMAT_AXBXGXRX124124124124, .depth =3D 0, .num_planes=
 =3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alpha =3D true=
 },
+		{ .format =3D DRM_FORMAT_AXBXGXRX142142142142, .depth =3D 0, .num_planes=
=20
+=3D 1, .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alpha =3D true=
 },
 		{ .format =3D DRM_FORMAT_XRGB16161616,	.depth =3D 0,  .num_planes =3D 1,=
 .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
 		{ .format =3D DRM_FORMAT_XBGR16161616,	.depth =3D 0,  .num_planes =3D 1,=
 .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1 },
 		{ .format =3D DRM_FORMAT_ARGB16161616,	.depth =3D 0,  .num_planes =3D 1,=
 .cpp =3D { 8, 0, 0 }, .hsub =3D 1, .vsub =3D 1, .has_alpha =3D true },
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h =
index 84d502e42961..7248b96ecf7e 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -146,6 +146,24 @@ extern "C" {
 /* 12 bpp Red (direct relationship between channel value and brightness) *=
/
 #define DRM_FORMAT_R12		fourcc_code('R', '1', '2', ' ') /* [15:0] x:R 4:12=
 little endian */
=20
+/*
+ * 1-component 16 bpp format that has a 10-bit R component in the top=20
+10 bits of the word
+ * in bytes 0..1 with the bottom 6 bits of the word unused  */
+#define DRM_FORMAT_RX106	fourcc_code('R', '0', '1', '0') /* [15:0] R:x 10:=
6 little endian */
+
+/*
+ * 1-component 16 bpp format that has a 12-bit R component in the top=20
+12 bits of the word
+ * in bytes 0..1 with the bottom 4 bits of the word unused  */
+#define DRM_FORMAT_RX124	fourcc_code('R', '0', '1', '2') /* [15:0] R:x 12:=
4 little endian */
+
+/*
+ * 1-component 16 bpp format that has a 14-bit R component in the top=20
+14 bits of the word
+ * in bytes 0..1 with the bottom 2 bits of the word unused  */
+#define DRM_FORMAT_RX142	fourcc_code('R', '0', '1', '4') /* [15:0] R:x 14:=
2 little endian */
+
 /* 16 bpp Red (direct relationship between channel value and brightness) *=
/
 #define DRM_FORMAT_R16		fourcc_code('R', '1', '6', ' ') /* [15:0] R little=
 endian */
=20
@@ -157,6 +175,27 @@ extern "C" {
 #define DRM_FORMAT_RG1616	fourcc_code('R', 'G', '3', '2') /* [31:0] R:G 16=
:16 little endian */
 #define DRM_FORMAT_GR1616	fourcc_code('G', 'R', '3', '2') /* [31:0] G:R 16=
:16 little endian */
=20
+ /*
+ * 2-component  32bpp  format that has a 10-bit R component in the top=20
+10 bits of the word
+ * in bytes 0..1, and a 10-bit G component in the top 10 bits of the=20
+word in bytes 2..3,
+ * with the bottom 6 bits of each word unused.
+ */
+#define DRM_FORMAT_GXRX106106	fourcc_code('G', 'R', '1', '0') /* [31:0] G:=
x:R:x 10:6:10:6 little endian */
+
+/*
+ * 2-component  32bpp  format that has a 12-bit R component in the top=20
+12 bits of the word
+ * in bytes 0..1, and a 12-bit G component in the top 12 bits of the=20
+word in bytes 2..3,
+ * with the bottom 4 bits of each word unused.
+ */
+#define DRM_FORMAT_GXRX124124	fourcc_code('G', 'R', '1', '2') /* [31:0] G:=
x:R:x 12:4:12:4 little endian */
+
+/*
+ * 2-component  32bpp  format that has a 14-bit R component in the top=20
+14 bits of the word
+ * in bytes 0..1, and a 14-bit G component in the top 14 bits of the=20
+word in bytes 2..3,
+ * with the bottom 2 bits of each word unused.
+ */
+#define DRM_FORMAT_GXRX142142	fourcc_code('G', 'R', '1', '4') /* [31:0] G:=
x:R:x 14:2:14:2 little endian */
+
 /* 8 bpp RGB */
 #define DRM_FORMAT_RGB332	fourcc_code('R', 'G', 'B', '8') /* [7:0] R:G:B 3=
:3:2 */
 #define DRM_FORMAT_BGR233	fourcc_code('B', 'G', 'R', '8') /* [7:0] B:G:R 2=
:3:3 */
@@ -229,11 +268,29 @@ extern "C" {
 #define DRM_FORMAT_ABGR16161616F fourcc_code('A', 'B', '4', 'H') /* [63:0]=
 A:B:G:R 16:16:16:16 little endian */
=20
 /*
- * RGBA format with 10-bit components packed in 64-bit per pixel, with 6 b=
its
- * of unused padding per component:
+ * 4-component, 64bpp format that has a 10-bit R component in the top=20
+ 10 bits of the word in bytes 0..1,
+ * a 10-bit G component in the top 10 bits of the word in bytes 2..3, a=20
+ 10-bit B component in the top 10 bits of the word
+ * in bytes 4..5, and a 10-bit A component in the top 10 bits of the=20
+ word in bytes 6..7,
+ * with the bottom 6 bits of each word unused.
  */
 #define DRM_FORMAT_AXBXGXRX106106106106 fourcc_code('A', 'B', '1', '0') /*=
 [63:0] A:x:B:x:G:x:R:x 10:6:10:6:10:6:10:6 little endian */
=20
+/*
+ * 4-component, 64bpp format that has a 12-bit R component in the top=20
+12bits of the word in bytes 0..1,
+ * a 12-bit G component in the top 12 bits of the word in bytes 2..3, a=20
+12-bit B component in the top 12 bits of the word
+ * in bytes 4..5, and a 12-bit A component in the top 12 bits of the=20
+word in bytes 6..7,
+ * with the bottom 4 bits of each word unused.
+ */
+#define DRM_FORMAT_AXBXGXRX124124124124	fourcc_code('A', 'B', '1', '2') /*=
 [63:0] A:x:B:x:G:x:R:x 12:4:12:4:12:4:12:4 little endian */
+
+/*
+ * 4-component, 64bpp format that has a 14-bit R component in the top=20
+14 bits of the word in bytes 0..1,
+ * a 14-bit G component in the top 14 bits of the word in bytes 2..3, a=20
+14-bit B component in the top 14 bits of the word
+ * in bytes 4..5, and a 14-bit A component in the top 14 bits of the=20
+word in bytes 6..7,
+ * with the bottom 2 bits of each word unused.
+ */
+#define DRM_FORMAT_AXBXGXRX142142142142	fourcc_code('A', 'B', '1', '4') /*=
 [63:0] A:x:B:x:G:x:R:x 14:2:14:2:14:2:14:2 little endian */
+
 /* packed YCbCr */
 #define DRM_FORMAT_YUYV		fourcc_code('Y', 'U', 'Y', 'V') /* [31:0] Cr0:Y1:=
Cb0:Y0 8:8:8:8 little endian */
 #define DRM_FORMAT_YVYU		fourcc_code('Y', 'V', 'Y', 'U') /* [31:0] Cb0:Y1:=
Cr0:Y0 8:8:8:8 little endian */
--
2.34.1

