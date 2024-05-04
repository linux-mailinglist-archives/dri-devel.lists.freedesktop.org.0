Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEF28BBED8
	for <lists+dri-devel@lfdr.de>; Sun,  5 May 2024 01:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6550C10E646;
	Sat,  4 May 2024 23:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10olkn2012.outbound.protection.outlook.com [40.92.40.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6239F10E646
 for <dri-devel@lists.freedesktop.org>; Sat,  4 May 2024 23:58:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jS2dnEF2o2VQqWe80lIhVH6aCiAhhxFSQwlf2VRTiHTdRB6lHt8vWCRmys61oucCor16vGu0fQq4QXbIivNTva6cXLN83i5vUsogmoX9zvNyhXlDV5iNGKlTajS59id0Me725nmj3cVqb9XVNmXS1/+sg44mFUO4MFd3LSXmw/KN2QbB9shSR5mSEeFaqovUvu1wHGPhazskro1xX3qLsYWMPJjHV6sIYarO/2P7mnfcn0yE5ufzfetLd/0HT7XixAvxTpAOkVl5GxEDm1rh5SEPTfoxDPpw59CupNPtksSUpocfFv6JcI3EgaFwjuBrSe3fJhtVL3tSinXmAONxNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pk5zcYosJRyYf4sn3sBcWOWCXl6Kfz8MwmJ05GLEW7A=;
 b=T9gkzsldH1zFPESh57v0gBzi0ZWMaIrdqaectjkD+DbtjsZhtgSQmonDRjxJ30yM5wG9b5CTZ6SOpsKIVMwH+Pw2qGD0EUIC9a095mmxZJs2G7OwBEvi0L0qbNoLNYoBe1UI4iYE6mY84i/dVx9+F2lb3U05kPMNxJFJo8TJ0KsEPlvTnQG0C58gB8kNQCLQMjz/W58nNtYHDKtnRjYIkSBeycFNv6hbjo0n5i7TMf7mRYuHAMVxD55oyhzd3qR/+1F/1REQgHuDJ1A8juuV1N9k7kcLZbyW+TLxYsa3lcQwWNeETus7Z//op+wbNpwInsQsc5cwCTDM4apUTQyQXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM4PR02MB8959.namprd02.prod.outlook.com (2603:10b6:8:bb::12) by
 PH0PR02MB7189.namprd02.prod.outlook.com (2603:10b6:510:1f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.39; Sat, 4 May 2024 23:58:11 +0000
Received: from DM4PR02MB8959.namprd02.prod.outlook.com
 ([fe80::f2a0:7076:1567:9f75]) by DM4PR02MB8959.namprd02.prod.outlook.com
 ([fe80::f2a0:7076:1567:9f75%6]) with mapi id 15.20.7544.036; Sat, 4 May 2024
 23:58:11 +0000
From: Joel Selvaraj <jo@jsfamily.in>
To: Douglas Anderson <dianders@chromium.org>,
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
Thread-Index: AQHanaIO/k7pPw0oNk2UsoHQMRYmRbGHwevF
Date: Sat, 4 May 2024 23:58:11 +0000
Message-ID: <DM4PR02MB89591040D0B0F2B088CD5ADEEA1E2@DM4PR02MB8959.namprd02.prod.outlook.com>
References: <20240503213441.177109-1-dianders@chromium.org>
 <20240503143327.RFT.v2.19.I67819ba5513d4ef85f254a68b22a3402b4cdf30f@changeid>
In-Reply-To: <20240503143327.RFT.v2.19.I67819ba5513d4ef85f254a68b22a3402b4cdf30f@changeid>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [5RPD+7ez2n0pBC338paDV2PNd3LIlAlG]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR02MB8959:EE_|PH0PR02MB7189:EE_
x-ms-office365-filtering-correlation-id: f976643f-e1de-43eb-63b2-08dc6c960e07
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199019|102099023|440099019|3412199016|3430499023|1602099003; 
x-microsoft-antispam-message-info: azR32sAeuuRZXAABFCndxtTrwBuxKoiarFwaTJsPlFTBROzPfWk6VQVNJg6KZ8w5Mu7wC8EKdcwkZhQ7RRWC0lhV2Q5ghC94qVvqgyBkDjtbCOyAnrFYTM9OS0DX61nssAg31dOuD2beTCasZcCPv3ENF1WC/02Nd8laXyBaUHipJqf1dZkqWISAXNaM1W58lZy2WXQYxCnLKm3/dsqDQ74Ba3QgBDn5bPg2t+teDGTklz/B46w1KzhlmwSe9TQMeqoXa+awRnq4g2LMz1/n2kL0i2tsrSILyDM9UU9SQNJyFJbT/RHlHmogs+d5KxJ2nu/vbbf4VMqOjFd8k3DFxaEP/zCM9VTEO14lX2wbrPgzgPJJ/3gVEuqXZ5MDZrO0x7iIoYhszwH5EDxOuXDWfGALMGWTwmNUNbp/FzvE7vtHPlLDZRPEsmHGAa0aep/EHnokMH6dKmwCEAxVHIh1xHlfASofzo9xjKSqVbD5j3FTzw5KQhcpc26a3WIi0DzP41l13z99RfLoSwBqGpDQnoZ0QQhxZ9a9daRVWtXUxaXfGc/cFIHOfnUP7tw7ky4gQo6vbsMNzfWdqysXgnV4vq0ycRI+iAm+krEuPbHClRKsoW0490sPDBibTrGdI7byT4Otz28/q9MZRwUdd4ziDk5UHszPIb0x7dbglCNHwkU=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mhSaKSVLgx6gNATYzkT+snvycckcDkuqexYxa8oZ6REMCCTjuhmV57joLSMC?=
 =?us-ascii?Q?tzck+OCy2rL5vCk3TFFyRqec2jdVRzuwWmN5Cbe3tw3JKTJSfi6Y8hJWid20?=
 =?us-ascii?Q?ZYvAcvI8wkEfU1HxRmK5ZNVWEXOSHU6MAR1b9YfiUq0n2qH0qFyOfC2wMvRo?=
 =?us-ascii?Q?6BrA+aVhtYAl2raLHY/QOwDSpNYvy+D9TrX2EFQNi8jTmzqL66PQ9QqS5mpv?=
 =?us-ascii?Q?cnQfZTRl8Tt2CFHtg0Arp/I4Dk1D2l4vnCnLu7rkp+dNcFBJ6ISpbgvsSiqs?=
 =?us-ascii?Q?7pBWTrVw4j3ePg7lzGZOJaJ8z0EbFQJkkpU/1Mcp+Ma1yTD8iNP6BW6+ipvi?=
 =?us-ascii?Q?NZBaHp2Xo/fHNqiabKdrYnODWeZZB+qzmK0jX7JSFmLKPtr3kHEacxHXK6xj?=
 =?us-ascii?Q?yor4rxqN41OBGAFF2voj+OnuvV4QhKbNZ0JysXQHuLJ3oaFmqVYv6IH/T7VQ?=
 =?us-ascii?Q?y/QnZ8hlk4H4tkDfkdsR7VSDTq5xylXPKnXqXpVtNNvC8gJcfwhHf1uqA/Fz?=
 =?us-ascii?Q?mqgQeTIRW3XB/1LSiwHFWHYFvOr9/+JI826WkTDENb0aZYJVrAc0Z9yb6213?=
 =?us-ascii?Q?HTpcUh14qKS/mfGEkEDOUIG+d/FiyEjD4OyNlEib8qdjzFz/1FXekQi9pJMg?=
 =?us-ascii?Q?KQ98nHoOOhMkXYxmMkmNR1hCzrJcpNlNC2gUD18qVu2gWcYY9HIFnQCDJ1Qu?=
 =?us-ascii?Q?+MJPtYwXJeFkMXO0HGNbYnE6ylV4NyRRXaxiJt6fWNc/5JPvF0PAiziJQAHb?=
 =?us-ascii?Q?PC6cU17cAU2nOLAVcu7PDyB3QMWMtkzOQtYQ7XcN+nfzoaoxUb2A0ik67T56?=
 =?us-ascii?Q?FdWPiI95lha5XDuNMZ5UcB8DJsPxwFgx3j8H66Z9784/yij0dWphS3OG0vlJ?=
 =?us-ascii?Q?7lxrtNqDONF3XqzaYovN7A4iEv4NlKFQI7NX2M7x5qMeS9yL2DhWG3fidsn7?=
 =?us-ascii?Q?RfihizU8j54FGcUpIlL0uoAQ7NqPMMwN90IFSBba/2qNocKc78X5MhbMogQR?=
 =?us-ascii?Q?eUN7t5mX9fG2fxzdNwhrJbTVNCvcuM5TZifV9qV5bEesLZwPLHSyhBfOCuHE?=
 =?us-ascii?Q?MBAck58q5kAN0r2TKi1GHHY1NlAQKIDG7T07lvYf0EZZxQN7g2wLK8ZBytKC?=
 =?us-ascii?Q?CKoP/scTW3sESh6VGwP915mkl/JmR05p1A7EpqNvtE8oBghVNoxP8f9HYM7X?=
 =?us-ascii?Q?MZCupTD5spf601MoriOB89MQ4lTQdRg6avEbl3u52IA88QXGy5Y3jvKcOmc?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3d941.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR02MB8959.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f976643f-e1de-43eb-63b2-08dc6c960e07
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2024 23:58:11.5785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7189
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

