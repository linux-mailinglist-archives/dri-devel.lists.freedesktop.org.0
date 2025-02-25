Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D388A43CBA
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 12:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8DC10E4BA;
	Tue, 25 Feb 2025 11:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="hGfoiBkx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010000.outbound.protection.outlook.com [52.103.67.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9BD510E4BA
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 11:06:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLZmS3CWN0QJB7m6gvc183PppIdGpnu8LFtkciamUMqOnbACSRt0PFVGHh5NxS1rM5chV05MkaONalm2slt3xMidkqxbTzn1Ib6KMqixuKX5xKfsIJl87dnwdHv04JFOSSTLk+/B6rG5sOvR4ofG0A+HuuKI0LgvQWRc/GhlFF6QW+6Od6N5f36Eyfxdb4cv6zDSeTdSO2bEgZ5KnAoItYY1cGh7YETiH9xYWRjOx+6uYFP6/+z7k7ArWbo0bfbj3NxGBkR8iaWNtYjlGI9FFp+aPq8J3dI4cjWr9yQgkLrVqI/Um790Yuckn1QZxceGvVW3p9DgYJIfb1OpFUuv4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yts9bZQAaO+R2LbWbBH9Nx3QMynqSGPgSj847sgTzmQ=;
 b=B9lG91Hzk+C9qSgm3uelYIdD3VONgygaDjo8RvJn8bE90spKGH6mDrmTSR38qrJGWuXuucysrmZpPObRmcdHKaKEuyXSDoLP0bV5gQ1Uh3UQTBT6MfdzQsqooG8gW3MB0nA94/4Hk4F3ho+mHwOEA1EEt5UgD6xIH7Ucdq6JEaUhsTXbh5lq5d8y5mHQIVjkJeMJX455muSVv6NCyJ6nQ9PpbXvBYrrjgYL6IxDyAjMGsopI8RrbVvdmI9k3O/eHoQg9IsSPlq6c6nPTpbQ1bnwM9ASOXkqB4zcm+tKCBIsWezGkE31HdjbVVIffsg2J0ewfa5LlzyTj0Sg6+7cV8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yts9bZQAaO+R2LbWbBH9Nx3QMynqSGPgSj847sgTzmQ=;
 b=hGfoiBkxEAu2hbarXPEPXOv216Lxd6wpJWZvkcqHEJGVO8iuMJZW0OkSaf9pShTeGnJtRkDy4mQf0+McnD2MDy+nR3aMMe/KNATQLzXgbfA2uYUfZ5QnCWstsXH00tqRrdHoCRPN65Bl0CO+Ww4SaWdpVfB/53v1zqrsJW8EJnd5XFeehazckBkAJUiGAykC6N3vnrG89nBL4vJQfX3DMkGRGmZvubBtLugwrTB/LP9SrK1SN+A7bhmIFP1flMmg5aAxaESS6Y+i7oTR7rG3IG75/KSEEHE2vbOfgsfymiX9PgNqEq0CVKrSM9tfrB1XptHWCw2vGEQqmoihaVFX5A==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB8050.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:83::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.23; Tue, 25 Feb
 2025 11:06:03 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 11:06:02 +0000
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
Subject: [PATCH 1/6] drm/ast: Remove redundant else in atomic_check
Thread-Topic: [PATCH 1/6] drm/ast: Remove redundant else in atomic_check
Thread-Index: AQHbh3VCVyNi4daYg0mU60+I+/4tfg==
Date: Tue, 25 Feb 2025 11:06:02 +0000
Message-ID: <BD2BA1E2-D61E-4D25-857C-C9F435D41EF3@live.com>
References: <C8A4C8F8-1568-423E-A656-05D914D9933F@live.com>
In-Reply-To: <C8A4C8F8-1568-423E-A656-05D914D9933F@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MAZPR01MB8050:EE_
x-ms-office365-filtering-correlation-id: e2628023-bf42-4f0b-fd8a-08dd558c64a2
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|8062599003|8060799006|7092599003|15080799006|12121999004|461199028|3412199025|440099028|41001999003|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?I69wH3CbS8eDM+tJ+gSRo+djOarIcoCU3BVKhzs15HDSOE35doYhAzP9QNbz?=
 =?us-ascii?Q?zeOwmc2S4ws6GxgXF2vyK5fxjcyT/CcyzXGQuC79cWrBdgY8mYEDdYYa+dba?=
 =?us-ascii?Q?b6BvgihFAqZr3hv9Ankdm/0Cx2wH4sa2Cv6J0ueiCxMdWlVrHzUezqZ7LGrx?=
 =?us-ascii?Q?rHqWMQANf/FKRftogJ5wrfu+CrlxGS8OVHoKIzBRUz/OBORuuS0h1Pe8L0+9?=
 =?us-ascii?Q?E7tY+k9mhRF/7jHVMTAIvHtBfLEzrd6z1lTBbhG+/0ZYZxl+fZMkDCXlLRud?=
 =?us-ascii?Q?g3zGEVOeZ2t7HIzmOo3ktIsNGpm8fl0EF9r6BVgpGeJH674JAODs1PUn9iMy?=
 =?us-ascii?Q?xvzOQ+oLQiBuLreUYO24DXEwzLk+7+SW9UeLra5tEik0AO0BLyAp57ce6hze?=
 =?us-ascii?Q?wOPxzcsiXCK2Ng8yuTmCiMFKqL8MNclIwL6ojgV3TwhQAMOamXMwL62WJmeN?=
 =?us-ascii?Q?okRZoqxOlpi8u5Gqa0y4NdicZR/rnHTHCKDEE/W5pZI4FEh1KJM3x/nFk5yI?=
 =?us-ascii?Q?gUkuOeNJ2JLOfhyT8vGPGP+j7h0nHY0tdbR6JZTuTdYqUl8JtTF0nPMUWRqL?=
 =?us-ascii?Q?cO9CFVTxdHbivyf6oRwGpz71bB9SBAL/80T3SKSAHLWbLvBCbS57Vm32YNhX?=
 =?us-ascii?Q?hGnpAzGOow9JzEQNQC0Nr+sm6lj0668nLlhWU0kqdv9z+Yh1D1/EdnMxR4eh?=
 =?us-ascii?Q?Pk09NtgZOY3x4POd+xK0Sr206zl3/tyJealp+rK9da9ISCGzifylnkD2DFDA?=
 =?us-ascii?Q?+U58fmEZDqq2oO9n6udo14Dt2OzVsagPfwAGNoDzFT3Ts37okMT1+PMVGHNU?=
 =?us-ascii?Q?y9lpizRuSc+zQQCbv804a7I8Kmzf64VZJV5PHOSd1wXu/FfRrmQY5AYuYmi/?=
 =?us-ascii?Q?dJW81ss8xHKkhRmXBYeY4M23rS7n+W7dIwJPdMUwKZP//hGUsZciYgxEwFsh?=
 =?us-ascii?Q?tvuDPQF2HC4K9OlUWkwfcn4dE8D8n7J6hAvTchaHcyAZFFhh3zaLHXNaVjTW?=
 =?us-ascii?Q?pqomBCuFE2/QYkuCdnqW8fs3b9cGAOqXiNwcZbB3bSmF0+wtOeM3vigaoh/C?=
 =?us-ascii?Q?pGfJjht7Umu5x1/OoIIycNYVRYmoG06r8ZRTm5JJhAA9mk2DU10NBDbvcjCn?=
 =?us-ascii?Q?Z7n/AC2679xuixgU+M3r7ulyp8tVdA3uhw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vLTrCdAlrmuwFXv71vWvPXqbLYAKdhHhOQefNrgaHdD0oGOCLEglQFzhNBJF?=
 =?us-ascii?Q?pWz4kfhadCXd9QDykG0QaA8caQ2m6jAM/QT51gj+BME0a638eCqieAii3f55?=
 =?us-ascii?Q?kwwe+i8dTL6oSSZ6I10zTryPZrWpaLbwC9Ije3z6t7hZSLQX00dAk+BONwu0?=
 =?us-ascii?Q?5UhkA1/NugCoLpHFcI3dpoG1ddalj8TAi2HpjaXlE/O8hEpmHKbpF23X65Y6?=
 =?us-ascii?Q?lBH2VOh3Bw5n7i80Am5B30cnlWoMZl/t6kp4oq2xO4dHeoprCx4+cC8yBPj5?=
 =?us-ascii?Q?jA73Ze+/L+NN0EC35T5T9L14mRYsbzm3SdgKAnVha0SVvwFSsx32FVKbD1rQ?=
 =?us-ascii?Q?3YAvt0WAb+DxufNCKkBvMmjPMGkOOyDS6+/0jrjDNJE7uc4z8q/pdzELfPSl?=
 =?us-ascii?Q?DeMRcZIL6H4SK7HWieeFMEODxykjhlGGEHwA2XmpTQGQ7G06y6H3aYelLaKL?=
 =?us-ascii?Q?2ok9KrTUpvm42U7/tCDrrv4i4rowWVlVQ3UzxKy6S5DlDpJ/WTAG4GPhxZjo?=
 =?us-ascii?Q?gFunP/qBlWRuDm3tz+pMs+s4J1yB5ktYULPGHDBQw3g3uGejVT8H7pvNi87C?=
 =?us-ascii?Q?Kg1n3dG8AkBGzhcLOB1EkTrhIPDaYIVY7B9Pe2EHTU9KbNaYbUhEeNyaJhwL?=
 =?us-ascii?Q?DHO1xMaDntOmEpIjgwo/As9Xj6VQB3ehknYYKs9B4rHy3+LH4qvp6WNsOjWM?=
 =?us-ascii?Q?ePNEuffkIDknnRRSrDsQyh38mazu+oxwNgMZy9FAioYUARyArro/IHWu1oab?=
 =?us-ascii?Q?KvKt5OgY74NnmIN+E5mXzhdgtIJw6eOZx5eTpgz+HPjkwRaKOnmSInIDdjkE?=
 =?us-ascii?Q?iV3Q8+/waXoX6WbfTxn7STpY0Sm/jYLQ/PlZtX9xZAbiBm14ygF9+oUao6oG?=
 =?us-ascii?Q?u0cFOjVVyoiA5bGnjsnNAHBVPTnnlOXvITNKE0cJz/YU3Dh01LuiYzvgd4Q6?=
 =?us-ascii?Q?7wwj64HF9323+EWk/Em2xBRxUB4RYM/Y3un4fNAex0O3J6rwfsDxI3oLot53?=
 =?us-ascii?Q?XE/RkBwvGgzegR/SMJX5SobEc8soR28sB4mzfgMMP0NUL7l9IHWbkot1XBFx?=
 =?us-ascii?Q?WyDzrhoc7aSlx9iAJj/KLjm+3rRHa6XHNm4+l9/LW6fkbNCBC5mJYSv2zhky?=
 =?us-ascii?Q?Vxhbgt68c67+coODT+3ns/d5g8t9yqsId20KwUnB/ajzad0QcPu9yIGMxZoS?=
 =?us-ascii?Q?12WjQBjqCL7PSCl930h/zwcf6gVDqvtulqcd5OtHlQ7XUXhdNqekDkf8MpPv?=
 =?us-ascii?Q?eFl8H32M0mJyuvRIC8c7hZDq1AJkiI9Iu/anVyGN0QFDRKioReYzNihT7crV?=
 =?us-ascii?Q?pPlPMfRzI6Szowab+XBQ5yZL?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <79AAF3C94DAA26419E3636C60430C2ED@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e2628023-bf42-4f0b-fd8a-08dd558c64a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 11:06:02.8367 (UTC)
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
 drivers/gpu/drm/ast/ast_mode.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.=
c
index 9d5321c81..3817d1e4c 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -610,9 +610,10 @@ static int ast_primary_plane_helper_atomic_check(struc=
t drm_plane *plane,
 						  DRM_PLANE_NO_SCALING,
 						  DRM_PLANE_NO_SCALING,
 						  false, true);
-	if (ret) {
+	if (ret)
 		return ret;
-	} else if (!new_plane_state->visible) {
+
+	if (!new_plane_state->visible) {
 		if (drm_WARN_ON(dev, new_plane_state->crtc)) /* cannot legally happen */
 			return -EINVAL;
 		else
--=20
2.43.0

