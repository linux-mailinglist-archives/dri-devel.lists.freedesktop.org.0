Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 791C28BBEDF
	for <lists+dri-devel@lfdr.de>; Sun,  5 May 2024 02:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF6E10F66B;
	Sun,  5 May 2024 00:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02olkn2078.outbound.protection.outlook.com [40.92.44.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B1C10F3AD
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2024 00:10:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKzsFYYpbVhyfW8OjwtxnsQKO4ua9Jn8EmSMAWEoG4E2aA4YIPaR99Zx6DKX0czAUFWr11/OZryHdM/HLaY0Rp8XL31rFyJZvrQa1osA1KxvY28BqXMij1uK4ihTrQeg1ceyu3KiY2ZY6Ip4SQWMPnQiKICHunoNrYxWzOTkBtDkZi7KAJ1QMvQJ82+2EJBYhsOtlwn9pSewIOgBgvejBmUfWBcRsoqDVpVNKfOiK2f5uP15MLAGv1X4lN+U+QGDEM1Vw2BzwA1a+QjMsxI+ryZhVczAppaHkPC6oQwbSOs/46kZNlkigxDbdKbz8xlbf2+DzAoHBLPA3nO8tYpW7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6yShcBahcuPmgQoZBW5kGDE5OeK7cEKEu0W0kS9FI0s=;
 b=Z+KItYvQfECFpVSD/mI5fD6whaOLTiHEEVGyaUp3s/G6iKHJCJeHJwylerVjPaeO5YoIy46sYXEan85GJnqMsFPsTmWSfeKx08LQ4o2Xb6A5mVf+i0AxAlnTVTcXYdJvoRmzWY7Qetkcru+95NVMXRwhb6X9YUajr4Cqs6+Xc777Wxoy2PEeR2S3kRuvUtCUVg3v+FgA45tmPpr8ID7J8uAgBF9ffG/IAUERoDXWg9PhL2AtAWmU6TkEdDsuT50W7aV3K/4CsC/qc+8iXMGdKHobkEF1jkF9XheRlC3CWV+WJQPJ5dXI/SUeVg8ZHTqthWxqINw3R7F6cVNlNeZpWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM4PR02MB8959.namprd02.prod.outlook.com (2603:10b6:8:bb::12) by
 CH2PR02MB6476.namprd02.prod.outlook.com (2603:10b6:610:67::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.39; Sun, 5 May 2024 00:10:26 +0000
Received: from DM4PR02MB8959.namprd02.prod.outlook.com
 ([fe80::f2a0:7076:1567:9f75]) by DM4PR02MB8959.namprd02.prod.outlook.com
 ([fe80::f2a0:7076:1567:9f75%6]) with mapi id 15.20.7544.036; Sun, 5 May 2024
 00:10:26 +0000
From: Joel Selvaraj <jo@jsfamily.in>
To: Joel Selvaraj <jo@jsfamily.in>, Douglas Anderson <dianders@chromium.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Maxime
 Ripard <mripard@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Chris Morgan
 <macromorgan@hotmail.com>, Yuran Pereira <yuran.pereira@hotmail.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Benni Steini <bennisteinir@gmail.com>, Marijn
 Suijten <marijn.suijten@somainline.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sam Ravnborg
 <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFT PATCH v2 19/48] drm/panel: novatek-nt36672a: Don't call
 unprepare+disable at shutdown/remove
Thread-Topic: [RFT PATCH v2 19/48] drm/panel: novatek-nt36672a: Don't call
 unprepare+disable at shutdown/remove
Thread-Index: AQHanaIO/k7pPw0oNk2UsoHQMRYmRbGHwevFgAADXkw=
Date: Sun, 5 May 2024 00:10:26 +0000
Message-ID: <DM4PR02MB89591952CC35EE0E488A92D0EA1D2@DM4PR02MB8959.namprd02.prod.outlook.com>
References: <20240503213441.177109-1-dianders@chromium.org>
 <20240503143327.RFT.v2.19.I67819ba5513d4ef85f254a68b22a3402b4cdf30f@changeid>
 <DM4PR02MB89591040D0B0F2B088CD5ADEEA1E2@DM4PR02MB8959.namprd02.prod.outlook.com>
In-Reply-To: <DM4PR02MB89591040D0B0F2B088CD5ADEEA1E2@DM4PR02MB8959.namprd02.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [uwscyyYQ0brqn0vly7Gag8vZcMpkW1II]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR02MB8959:EE_|CH2PR02MB6476:EE_
x-ms-office365-filtering-correlation-id: 39a0e0fd-328f-4b35-3924-08dc6c97c440
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199019|102099023|440099019|3430499023|3412199016|1602099003|1710799017;
x-microsoft-antispam-message-info: jJk8HD6/7tJfovxv8kymB0r+gVqKkvGAdtIcQEcOCsqXzgjgliImjpkWjIEHyxfVAtZSdXAQtSvHELhO05+9ti/TSOYW5iTaeFrnt/dveBSNWpX1tahKnAa3smG3X59lOfPrB0Z3low0m7hwt4C1d5Fdv3gj1XfOrgUAvPTh7WuDwj7NzKX0TDaO2mkAtWxGYOWiPrkSyjItkVFPg1gmvJEjL4B/ubL96hwj2j/RkbZhlCw5Vk7+Nw5e+xyX+x7GcWDNsR6UTG3JRyRIfy7cY3PqGasNbUbvaHSU4lEGigsb+zWn5BOKVfcdJpuY5/fkmosIddpOBPt6SaDk+EfrU+YjkWHfs8hZA6Y/XUVKb+CpxoNfdPZnfGNeTlCreVi8aRLzJ5L670Z6GVare79tQYXRPFESDcCoYNYtqYzi2MgilMDiUGD+AXsRLLiITl1vsnTo4PJVcAdA/nKrHulcrJQJ2dh0ieQ3Suq7lCz0S5OPmYxoGY+RvGRZmoOz92OtAVCQOncuhgO1K61XLGEJ8bmUZcYmC0hSB3eRyeVMbFgPLj6Jra9GVn/c/B47nMr+0xwtHc47zmhmFgHvYWe5OfOOKT531pnMx4BOkRQiHwugYcWge2UVc6TIZZQCNiojPlwJ/c6DI0Akq6aIl9rWBCveC9C8NIwLF9waokxfEB+4tCHlMi/VnjlKkt+H/VpK
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2PZvJAlLQsvfn0Nd93AoHJSo7bRY79c0OxQCaOYKK18wBTqq7gdq2bResagg?=
 =?us-ascii?Q?tMgrUx5DXKHO3vZ2tFHux+hLuReAEbPA6jc8n0x7rIy+UM7oB+BurWrudhbM?=
 =?us-ascii?Q?JS51oJ8J247n+jQ31GIxYEwXoWlinFctolJeLoEd255VHLex/Mi/KIM//wTy?=
 =?us-ascii?Q?0yGrfIZMRjgCan4rBkgdCgcTYW1qY5XIiUinjBT5H9QQZI/N3cB/0c6FX2Nh?=
 =?us-ascii?Q?dC2R81O3z9KQ5rYrHA0fknh1Y1l63yoWJsU4CNMARsOVmHqifdnJbBjAfmrp?=
 =?us-ascii?Q?U7jZc5zg5IQ4MKVIUws/M0mwqcW6rknIvv/fMVq+oKd4b13NGC4HayIm7UzB?=
 =?us-ascii?Q?He6TsZ/jkQbTLqnE6lEJmLzkVy1pDey4PdY+5AYDmzjEmI8Flrn6tBAmIJHL?=
 =?us-ascii?Q?lTZEAYJ/khME+2wP4evptegiKl/k6ZwxWUSndf+i2S7f8qI38Gt6e6Exf10q?=
 =?us-ascii?Q?rkdQOVr4cB+hT6GE8EnYRjg0sgGAGbNMKDnpLgDiomOCAGoqf5pzMYBn3LdC?=
 =?us-ascii?Q?sAJoixLGoGejrqedo0gxl4ZaIPDcwebgAO+jXZcldXDHr9RdPrkdfqTsQG5Y?=
 =?us-ascii?Q?MdRaMRH9cp70/QHhxfEtFx03YiWacL7o2W2kQekDCENDvzTW9dXfdS6Ysx3U?=
 =?us-ascii?Q?mZKkaQjVngPw4Rd5Gl/xk+JKkWf72YVeN0LVF5yb353nRq/5QYopCRT4Jcm2?=
 =?us-ascii?Q?QXP2I3JZN3BnePmrDcshQTZtdjnw+zXgPM6dabcgGLwGxu6+zD7Q1gVftmYT?=
 =?us-ascii?Q?d3rP4fmGESTVMeXiOW+x4F9phAIbXoIMN4+hI1ptAS2DB4f7WpyVHyuTpzZ2?=
 =?us-ascii?Q?W20bNfc5v9e9EjgTvm1W2zP1VGyDjOOAt2SZm10Q+BjUgrWd5AWoWd16cuMD?=
 =?us-ascii?Q?XUiKJVOzaH/hvIRgSn+l5N3gnkk98dOFqYyvL9DyHtEnaEwd8nGqf5DBG3kv?=
 =?us-ascii?Q?BAR3r7yOlVL+rXLjdpqyLnXB90jCJr9PdBPRUJy1CS9zYgnvgkw5cNYRixbg?=
 =?us-ascii?Q?0u7VJBB7Q9EToJ2lQAnQMyovugZw35yC6q6uYyqK8+fbUeSRwklwYpPpnC2g?=
 =?us-ascii?Q?iuog4gDjo9KFA+l8seJ5uaWeSX4GNgWmYz5vnYwyC6O7Yxv2qWkOFuUYSWzO?=
 =?us-ascii?Q?2GwIOcXaqGkom3QFcQ1+PsDZ/3dZ0EpQ3MKnOR+niUMgwfkctz2fFvGnTDNY?=
 =?us-ascii?Q?3Vu35hcasjzEFDjg4uKTIJQtgO/C3a+iBFA2korAZijeOta2UAmnYhvj9yw?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3d941.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR02MB8959.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 39a0e0fd-328f-4b35-3924-08dc6c97c440
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2024 00:10:26.7593 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6476
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

Sorry for the long lines. Had to use a different email client and ended mes=
sing it up.

Regards
Joel Selvaraj

________________________________________
From: Joel Selvaraj <jo@jsfamily.in>
Sent: 05 May 2024 05:28
To: Douglas Anderson; dri-devel@lists.freedesktop.org; Maxime Ripard
Cc: Linus Walleij; Chris Morgan; Yuran Pereira; Neil Armstrong; Sumit Semwa=
l; Benni Steini; Marijn Suijten; Daniel Vetter; David Airlie; Jessica Zhang=
; Maarten Lankhorst; Sam Ravnborg; Thomas Zimmermann; linux-kernel@vger.ker=
nel.org
Subject: Re: [RFT PATCH v2 19/48] drm/panel: novatek-nt36672a: Don't call u=
nprepare+disable at shutdown/remove

Hi Douglas Anderson,

Poco F1 is one of the main user for this panel. I tested the patch in my Po=
co F1 running postmarketOS. It works fine. Thank you. The panel itself requ=
ires other extra fixes to work properly which I intend to upstream in the u=
pcoming weeks. But your patch doesn't break anything and works as expected.=
 So.

Tested-by: Joel Selvaraj <jo@jsfamily.in>

Regards
Joel Selvaraj

________________________________________
From: Douglas Anderson <dianders@chromium.org>
Sent: 04 May 2024 03:03
To: dri-devel@lists.freedesktop.org; Maxime Ripard
Cc: Linus Walleij; Chris Morgan; Yuran Pereira; Neil Armstrong; Douglas And=
erson; Sumit Semwal; Benni Steini; Joel Selvaraj; Marijn Suijten; Daniel Ve=
tter; David Airlie; Jessica Zhang; Maarten Lankhorst; Sam Ravnborg; Thomas =
Zimmermann; linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 19/48] drm/panel: novatek-nt36672a: Don't call unpre=
pare+disable at shutdown/remove

It's the responsibility of a correctly written DRM modeset driver to
call drm_atomic_helper_shutdown() at shutdown time and that should be
disabling / unpreparing the panel if needed. Panel drivers shouldn't
be calling these functions themselves.

A recent effort was made to fix as many DRM modeset drivers as
possible [1] [2] [3] and most drivers are fixed now.

A grep through mainline for compatible strings used by this driver
indicates that it is used by Qualcomm boards. The Qualcomm driver
appears to be correctly calling drm_atomic_helper_shutdown() so we can
remove the calls.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.or=
g

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Benni Steini <bennisteinir@gmail.com>
Cc: Joel Selvaraj <jo@jsfamily.in>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/d=
rm/panel/panel-novatek-nt36672a.c
index 35aace79613a..c2abd20e0734 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
@@ -656,14 +656,6 @@ static void nt36672a_panel_remove(struct mipi_dsi_devi=
ce *dsi)
        struct nt36672a_panel *pinfo =3D mipi_dsi_get_drvdata(dsi);
        int err;

-       err =3D drm_panel_unprepare(&pinfo->base);
-       if (err < 0)
-               dev_err(&dsi->dev, "failed to unprepare panel: %d\n", err);
-
-       err =3D drm_panel_disable(&pinfo->base);
-       if (err < 0)
-               dev_err(&dsi->dev, "failed to disable panel: %d\n", err);
-
        err =3D mipi_dsi_detach(dsi);
        if (err < 0)
                dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", =
err);
@@ -671,14 +663,6 @@ static void nt36672a_panel_remove(struct mipi_dsi_devi=
ce *dsi)
        drm_panel_remove(&pinfo->base);
 }

-static void nt36672a_panel_shutdown(struct mipi_dsi_device *dsi)
-{
-       struct nt36672a_panel *pinfo =3D mipi_dsi_get_drvdata(dsi);
-
-       drm_panel_disable(&pinfo->base);
-       drm_panel_unprepare(&pinfo->base);
-}
-
 static const struct of_device_id tianma_fhd_video_of_match[] =3D {
        { .compatible =3D "tianma,fhd-video", .data =3D &tianma_fhd_video_p=
anel_desc },
        { },
@@ -692,7 +676,6 @@ static struct mipi_dsi_driver nt36672a_panel_driver =3D=
 {
        },
        .probe =3D nt36672a_panel_probe,
        .remove =3D nt36672a_panel_remove,
-       .shutdown =3D nt36672a_panel_shutdown,
 };
 module_mipi_dsi_driver(nt36672a_panel_driver);

--
2.45.0.rc1.225.g2a3ae87e7f-goog

