Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FABCA43CC7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 12:07:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7258A10E60F;
	Tue, 25 Feb 2025 11:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="hdsmxPHY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011035.outbound.protection.outlook.com
 [52.103.68.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85FAA10E60F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 11:07:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TvsM074+MkhCK9Ao1h2GiSYC3+j9jTOGCmgabmqZSoQMDV0yd8JcgMcGF8Fi4BYXpbiRpMMqCFqlA8wWCdc0gsYDvn4lqoK0iTn3FxBdQGFBdirKC7kuUMSEyK7wQEaNAgDdVy/z65Y2rg4a6jKxu9kW8Vxoj1vbpYf7/QeOAeTS9BsrKVkEJYYOJtS1v9i5/O2gAetYhAdlgjPKbarZWKLh06p/Yj5gIiXhplUDoJIJWMBWoCYb3uH11u9xgl+Jq91aAahsho8+maNswMMj5aIZiPsFEBVkA2hUdUxo3zsQe2kIbxsEUk07Nbe0EnLZLKLgRH89t57RLqf1xJhXVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5E3g8QMilaBd14g/c4+6HWITmU8WGWTMs5AOkKaMdY=;
 b=ER1370fiGxDNwb3PZojD2YT1XXEHZqcNanxj522kwcni4teBVBI7FYqfKumRtofj3MVkbhGvSXm6GIYhOYSzWxhMxO5EYQWJweNgJVBT9ssrur3x+DF8JGBCBYllAXaYO704gs2Rv9V7bdvDx1IWHa59tqTbALeh71PSWtqO7yDV5MYlZkFzE/KkXCzkLNKLHgS4z8rI0AP3C5cv9ZjUEWD+Mxz75eVoB/QDQ4/l/5dtI+zUX92cdHEYct4Eo4fzydCBvWf6X2Jcg8B3YZBVYUUzA/n+5kq1WelMHfCBqBMqvDDYpeIaMff2IwDH0AUMpmn4nWaRR+ntKcgraKY4rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a5E3g8QMilaBd14g/c4+6HWITmU8WGWTMs5AOkKaMdY=;
 b=hdsmxPHYjCUy/WIqGOQhE4CXnov/yXta2A2zfA0WIdAvo1HjedM41nXoRkcHA2rE90x5RFEDh7rF78BgfZbV9LipHQYwmdKFPwXsB7z3RjAsEJMfUb7gmFgY4d5Nl9++0S6QqkSGMgkUl+KUaaflaoWnCl7Tvo/6/EwdqHah6DltLt1pGwBVfdVPDWhqBqgoXPzfNuvTbEntHtejAyb1suKbHGur19KQPg9B+ojy/W35dpmqlyivqPUlmQmMEr9MeU24/n2M3+ApdfAN2trXVu5skQXMK46urWu1feTyucx2rV5SkLrMyKSb/JWw2LQPf7fOUiV0+/BFv5MiuoLTIA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB8050.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:83::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.23; Tue, 25 Feb
 2025 11:07:08 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 11:07:08 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "airlied@redhat.com" <airlied@redhat.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "jfalempe@redhat.com" <jfalempe@redhat.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, "kraxel@redhat.com"
 <kraxel@redhat.com>, "javierm@redhat.com" <javierm@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 3/6] drm/offdrm: Remove redundant else in atomic_check
Thread-Topic: [PATCH 3/6] drm/offdrm: Remove redundant else in atomic_check
Thread-Index: AQHbh3VpAUCc4jHRrk+X/vlg/SmCnA==
Date: Tue, 25 Feb 2025 11:07:08 +0000
Message-ID: <9F565F81-DB68-4C41-8ADA-9F2EE158AE90@live.com>
References: <C8A4C8F8-1568-423E-A656-05D914D9933F@live.com>
In-Reply-To: <C8A4C8F8-1568-423E-A656-05D914D9933F@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MAZPR01MB8050:EE_
x-ms-office365-filtering-correlation-id: 8978b412-c817-4bd9-5a69-08dd558c8b8c
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|8062599003|8060799006|7092599003|15080799006|12121999004|461199028|3412199025|440099028|41001999003|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?zOgvbzMYSa+S3Ip4nA0rvPXHYCDDlx+27oyb041gUX/UVU5OEsz+rWnZZbpS?=
 =?us-ascii?Q?5Qmo9oEiO6WlRuz4Xjgj3EVw3b44mxVq/t+bKXsRIfQ03jP6MLtAG7LUE/rd?=
 =?us-ascii?Q?XVWnDuLLi/lwbS6OSgDn0yKge3PPIeiPCiG/8EHtbIsNdKjt8/lXkgHuut2M?=
 =?us-ascii?Q?fTdT/rWtbgWXLNaJbXAYQnHF5xWXAD3Lf5Lb0umaOXY1rsr19x7U38eRUzB0?=
 =?us-ascii?Q?Ps1O9eUJ8GYDVrO0Y6R1jA5YJ3fG5tai7wh9WMgKfXBF0t8HDRZh+/4IItkU?=
 =?us-ascii?Q?DDMKX82Dyynxv7adfiToRZ8bk5Oqz62GrSl8GoAAHk/abkZ07ahPDQMMhExu?=
 =?us-ascii?Q?FAB/0dYkvmtp7zgdtpMQWkjYlVC1RqSnimUkmje0HRGe+6xNEkcnK2vp4qo4?=
 =?us-ascii?Q?jPVMxIr4VTdEGNhR9xnG5+5BvUoyQqVR0aXvYLFLnxsKb15lVDVVqF79IpPh?=
 =?us-ascii?Q?OWsO3huOZ+T94O2KZCQ/N2ELxFbhFlidpNccKsPZgra52cj9epAor3HVlPXU?=
 =?us-ascii?Q?4kzyMIqh/rtwuIGH8gg870W9z3PvxVsQfWiKmUwMkqlfN/zLN9Cd62/KPvSW?=
 =?us-ascii?Q?h9ND12alQOIJOhPiJKpqsTNUf0yasnQHFjxA38gSF8R81MEfzKmKSHDSZ0zk?=
 =?us-ascii?Q?76psqpaCBSDzEdyhP8KRCz2x8lmoKc0pnUdEXC+vz/a6NQHHyQ14lyVHPpws?=
 =?us-ascii?Q?CqqrO9/Rfs5ipcg6x0ts1sosXc5//X7b9jL6536nqyJim1LfKaPKMEy17ISS?=
 =?us-ascii?Q?BhnbIX2gZtaCe+TyBcz2XNgKvbYEwiB3O802la/C1Aek4R6yBnS99zKne6Oj?=
 =?us-ascii?Q?5Piv97F9nKPl+94PQ5eRpmZFXEgWaBYraYnhyYppMm08Bpa3FiAAFbLkKd0B?=
 =?us-ascii?Q?Hk5P3Q8NWAjWU5i563IKiuGVrQlJhRb0MKMPLh5HCHwOiNYnW9BcDuABWrOM?=
 =?us-ascii?Q?pHUkRBuzts9wjuE6DuHaeOS9FagPMZfWUoVbw3icy3oE3UeWY3/Gtj0zJ7J2?=
 =?us-ascii?Q?YdOQOcSiQV6cW3Dj+6f46IruFWvyxa0pSKMIZOf8RXAzcfbNClJbmBt0KEKe?=
 =?us-ascii?Q?2ruojilVUjDFPv//803FfcTxCZd9+t2jaGq0MHhygCf/EiqVSRM5cgaRkG9Q?=
 =?us-ascii?Q?mQZndxNKmUjLPmPoov0k65N4kopAPUc7Bw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/Jp0NSNclvkUzRSsu/tGbLYv6Ft5iyCgy+qQjECVqRhR++9aW4JGfqZQebPB?=
 =?us-ascii?Q?iHomOZMUfexy56aNFltK7I0D2W0V90e/dIBSZ7cU7kIZDgKUFI4SDKDvBpWY?=
 =?us-ascii?Q?lMuzmrCtY6yYrhYoHd1iBSl3u6N8Em8DtOqMEx/+ei+cgeUAS8NR0Eowf9d8?=
 =?us-ascii?Q?gx1AVEr47ha0lLZKpytoA1CKeiSh71O1/fqKEVrNnvpWriiX8dY2Ou/R4Ohk?=
 =?us-ascii?Q?5Ru37gPodF2ljzrkUsEO779FHfLWR01A+ZlobAAcOZ/NdpNDrl5FXUqZytDh?=
 =?us-ascii?Q?iTg8wwGhetuNulTgxZyyyCt74TdJMOzJGWyItff8wKgJ/jexh2i8uuX4U+X6?=
 =?us-ascii?Q?M5JS5etCG/Pyqjdw9bzGaulTHGT7e/P7Ks/gADS7SIMo6ISuUf1TaZcg0IJk?=
 =?us-ascii?Q?OiuZNyxsWMGSZ85vgIvz0s3v1TLymAKCJw74iSjcnMme793j/KHqnQ2BitVP?=
 =?us-ascii?Q?VYYctauZA9gE1vkZ9nEPSy9a+SLmupuz5vy1WPvV7/xqomNT5X9HiOoDvU+m?=
 =?us-ascii?Q?enVtHjpS7iQ/6m6u7Oxao4phoXpbYULPDcq3Kpp759328vQtpRH7bTzksJTs?=
 =?us-ascii?Q?OhQS/sleYdiKfv5lV73CKH7xTsNhxNfumOLL44YV31r00BAJcBqgmT9B3q0x?=
 =?us-ascii?Q?AN1efOeqXtUwg4E9ID9dHrDi33bNXjgnL4KbnaqUMoEbzd2axpszcefV75rW?=
 =?us-ascii?Q?eptn/WcHRzP6nbQEFy4SiRBupEkv8Aiw9vYZ2DzrSAVbuwbqc8r9y4mOMAuN?=
 =?us-ascii?Q?dkBwu00rxlFolgk3AOavRD+UOZAg+2b/3bxkcC6ijuBtdeejyDPRjCDs55DB?=
 =?us-ascii?Q?lW3ojlwybCfsROphDgSz0VhiumBIDKBGsfFGpQqWrQQB9snLlASEhIOlAeL4?=
 =?us-ascii?Q?LP5G2tbMS/JWzxaF9l4XilPSmpS/BsIwxvYcFR+3nyPTD8/S+ogjG1abKS8R?=
 =?us-ascii?Q?pHUdQBSCahWkIHN91YDOEKo3aG36Z6e5+13yLQByKZmkO35xx6AWbPaehxLC?=
 =?us-ascii?Q?ez1hTQhjgb2wc/hIu0sPXl+w3ZK/pBJfLMi7aybflGePPM7JUdNVeO8vev6N?=
 =?us-ascii?Q?R4rkxz/yKtG/qUIUmSf+lanEuMNIYheU73Ses0gD0vlb63J4vjSFoVIciwgz?=
 =?us-ascii?Q?CqE56ADjzXjV3Juk1Zbsaqe5Zepqqb1l652rcE3Dm8Gss8xMqfrCYzEGjKm7?=
 =?us-ascii?Q?OxLR5hXX7Z8cc+aTn2c6ck4G3+60E3/R3Lg7F6G6HvDeryeXoyTVFOoRPMMx?=
 =?us-ascii?Q?OVugvs7T65++iIp/aYbkryzTR5BG5CGJvEea5uRoC9aLvAhHFMbEzKXFpSsq?=
 =?us-ascii?Q?4F9fvbE+SM2CX4SFR8Mx/ZgA?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E1B68A5B086A644AA222BDE15D4A26D8@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 8978b412-c817-4bd9-5a69-08dd558c8b8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 11:07:08.1439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB8050
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

From: Aditya Garg <gargaditya08@live.com>

Remove the redundant else statement from atomic_check since the previous if
statement was returning if true.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/gpu/drm/tiny/ofdrm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 13491c0e7..fc669ab1d 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -777,7 +777,8 @@ static int ofdrm_primary_plane_helper_atomic_check(stru=
ct drm_plane *plane,
 						  false, false);
 	if (ret)
 		return ret;
-	else if (!new_plane_state->visible)
+
+	if (!new_plane_state->visible)
 		return 0;
=20
 	if (new_fb->format !=3D odev->format) {
--=20
2.43.0

