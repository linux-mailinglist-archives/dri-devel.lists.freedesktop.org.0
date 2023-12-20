Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F269781A054
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 14:54:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0442410E5A2;
	Wed, 20 Dec 2023 13:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2127.outbound.protection.outlook.com [40.107.21.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3ED10E5C9
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 13:54:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1ZHYtzL2Kg+OnCGmcfH1R8cByDlMqmgD1MCIzf9cBQwqvIaQ01FyIbn957DrwTG662HXZyqw1dWoNSgslHV/StOWD7Z6VAJ/QD9NEcs5xNGpH666Gu8aGaFrW06LEoXEu7neDiC6uo9WOIyaPfUiM6JoO4weXlXONzm1uTTZ7cqcUl9sgiOYj538zvcOOED4385cwxenu66tsJWsqeg8hkzQBmIAtdWZl3SXVt9tt8VQT1c6pQkm7SYN5YdfBa1YTuBCaBPOB5GvvWuJ8dmK0RzN+9Mdd9SlaTIt8+xvPsjglW4xg0uxSjyO7d/CzVyegjgjdeIUMXtP7wbrbKFFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/h79rPHptj33/p0a9XGuhp1v71FXU06Q62jJ05eKGug=;
 b=VCcr2Pca8pRt46HW/iRKYE3Zw93jg/woMQe9eesbzujVJYwufVs+dfuRnc8iSuOpIc7jCtDdkQAq+4TMWaiXaLYZuvYvf7Dzoqgwsi5lN8FefTkP2koo5aNf55FxluiieriZofIAS/bqYGmN/GxsASESYb/cgAKdfJ8lWJsvegiPVzcAWOtmS0ar3BLT585kjt9LyJD6xLskKX4a0Yv4HStLADo5CtdO+xbhxttbZpMIz6buTbMgVW5Wt1AWUiCj6xyQWHCytygb5Z5rg7lY9GrzyZdl5v7DLQEPu0aHY1Z8CYTd6vdwlcKJJHco5YF1Qa08okxu9dJxXx4oiAHPaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/h79rPHptj33/p0a9XGuhp1v71FXU06Q62jJ05eKGug=;
 b=hQRL0mrrSlNdsVxEXRjdDCHHsjj/I+jxSTepN5KvTH2EFpptVYhRCplQ/eUNRU9W7t6aF5ria4Agg9Jn2r/Y0d3EWGbqXb3myta9aVy+o6uLSxJEeJGMm0qE/QV0LBL3O2WrEuFHp8f/eaAu2SGhvMv1uwyKTYMzsr9yMhw4TSw=
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com (2603:10a6:803:b6::20)
 by AS4PR03MB8745.eurprd03.prod.outlook.com (2603:10a6:20b:574::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 13:54:11 +0000
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::67c9:f19a:51af:df35]) by VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::67c9:f19a:51af:df35%7]) with mapi id 15.20.7091.034; Wed, 20 Dec 2023
 13:54:11 +0000
From: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH v3 1/2] drm: bridge: adv7511: fix reading edid segments
Thread-Topic: [PATCH v3 1/2] drm: bridge: adv7511: fix reading edid segments
Thread-Index: AQHaM0wCqc0YD3Ch8kmtNsN2ucnlEQ==
Date: Wed, 20 Dec 2023 13:54:11 +0000
Message-ID: <20231220135406.2318148-1-emas@bang-olufsen.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB4942:EE_|AS4PR03MB8745:EE_
x-ms-office365-filtering-correlation-id: eca1dd98-c51a-4180-48d2-08dc016324e2
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sRa47bPjlRBWBY2paIFsM5WW/exIWiK8H30I582DSwhF7/YP3s9F4RBmnYr0izcdBqkC9lb4QnUEwmMbxpjakHLaYZG/YnA55Y6uH5W5M6whXjlMzxdVUj5HJH8K37TbW/20fi6BjbuIZqQz1CKSHl8AL93jsmkx5tooTGQPlZWUpyitHdjYGXC8YM4P0+zvjfeLdUNdBHrzxeDLG4s7Xs03sUstu/mfk0M8bJck33+5kAm6uew6rs67FfgfOgIYtQIWzrEWyqbUm2ICUWpew+feWOg9zIqG7+BVPEv8xlialmxL3+RintmkzpqMmajqhzacjL+AqrQ5k5IDUcL+w3uLW4xy2Dsz5sRCqhTVKEgeoak2i7LkZxPtx0YmrT+I5kPddAQ2lLQW5BXPmsA0GntmD8wtQycClFR/Hw+VhvPpknTTakSPxrOkxcCsxHhhGbFgNNaodgzUMx6jnA+csYyyhoyFUr/2L3P7Wabs2nO0ris0N6LxBGQ3BDdfAw+p/Fa/xXC/GYWYIFn7Cky4+2WZGhKuRzq/qZjtLo+EJtBJt4TvAstmJGlpjIFzZ3S1NiRMZHQcfoGAeHPE5cuw26nEli7nspHlqnr+w203osbJHMdnc7C6cBptoCY/Bn1Mk8GraR49PTzb98rCn0Mu7g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB4942.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(346002)(39850400004)(366004)(451199024)(64100799003)(186009)(1800799012)(8676002)(8976002)(8936002)(4326008)(2906002)(6512007)(71200400001)(66946007)(316002)(64756008)(66446008)(66556008)(66476007)(54906003)(7416002)(83380400001)(110136005)(91956017)(5660300002)(76116006)(86362001)(122000001)(38100700002)(478600001)(2616005)(1076003)(26005)(6486002)(6506007)(41300700001)(36756003)(921008)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?MXQRsCT/yWPHquP9fx8hJGGQaFeT1Pu87dJiS8WkMouSyYLEsrof7qSP08?=
 =?iso-8859-1?Q?XaNxPBdNjolDslIHHu1ZfATyAob6EiLNbwrsjKsCvdjDnjBOc1YZptkqD6?=
 =?iso-8859-1?Q?pvigIhmxxSSlp2tKepRWWNgyFLqNeTGuzir7Wfo+AC2ZWu52c0jdVTyaA3?=
 =?iso-8859-1?Q?nrrARQKDrAUfCD9m6fHfDVufJ8LDPcdzbL2Pf5bhDoF6Z7lOPnhx9WJvKu?=
 =?iso-8859-1?Q?J3JZhEGR8P6gj4tVQZMqPP/Hf4GvVDAZ7GTtuMjZ6ZxZKh9mDoHLaNvMwf?=
 =?iso-8859-1?Q?f/kuhQwaxUzh7xKT8HSpyPVPCqvsuDhmAkhJ2BG9E1QKSfvM6EkzQkQnmI?=
 =?iso-8859-1?Q?hPDzEtfSnaTE/fFeD8o/v5cq+P0jC274VuGT3kJW22Rhs7+IJVl+kHChcm?=
 =?iso-8859-1?Q?PpTrbHUMYU/xxCDqDH6PpklW3iWJVkcI4g+NLeG7zjSChB9xOQfsGGzv+l?=
 =?iso-8859-1?Q?+W+jJfewnSPQ4bZ6JUyTSvr3iQ+an2zKOPPiQ5sC8ajIa1IuFadLTYtns0?=
 =?iso-8859-1?Q?n6m/oXS1hfyVXJezA9E2QikIKmCdavkhM1ckGjCI/r5m50dVkwco62hd/m?=
 =?iso-8859-1?Q?pLZfyK+yOaCWsTQ69EfTvTKY0YHPiO/oZudknf1jHXbAwYqrMVEXyO8fak?=
 =?iso-8859-1?Q?+sk66W5zUOlwndkzfc83CBuzDQ4oBOJed42CV6lmeTWHVrxuyM+rLgy0mH?=
 =?iso-8859-1?Q?xb948/QTORoWHc/QxVc4kFQt8NbjAITKGQzjZi4WRgDFIWYJ9e3UVidase?=
 =?iso-8859-1?Q?FaJrAQZD3qm+Gwflq9mAPrQmJvl0Z8cEed4xzec9dHU2iJdOttTBAOvv7o?=
 =?iso-8859-1?Q?ApQcrHufUTYK+3f7wN2ypJgfk5Qn9StmGTqoWIrbpHpLiwAfhiUVj2TB7t?=
 =?iso-8859-1?Q?O7lfKrwQTFahLIo4znRtDfcYJPU330M+94yHwzS8qRh32sMXSVoczOkxwj?=
 =?iso-8859-1?Q?ft3S5EDLGnWmAzFNLUDk07wC9lJZeBAa8tRZuuiiLoQuoJJAf5E17fyBzI?=
 =?iso-8859-1?Q?UFAEItHkvJvsL05Vy2ucCR5+8b4g4bCTiBD4b4kE+KcU7lyMkzczzGI5MX?=
 =?iso-8859-1?Q?5qrVNCyeuwWvVb9d4YvPEiTls4ierxZCPspl6q06PvIyt+DoX//YvFSvGG?=
 =?iso-8859-1?Q?2L8/LIK3SJLc8D4WMN1yV87asETBnG8Bl7ROCQzpYBUpHlG/sYGW7TjObc?=
 =?iso-8859-1?Q?DPx91nhqQJ4alTlr/tDp7oOJJ47L6BmmbVEs9RFupT7g7u2z3XX3Conqfe?=
 =?iso-8859-1?Q?QZ7hEH/d5tNNS4KG0qo7InDaBb5seQMtf3ZwnHxQLHQgKrLUA0hQiRgRRT?=
 =?iso-8859-1?Q?aOwWCciun7F1ZHADlQVTlwJq1wIV3pA+wjJxZ5nWJgZNli4b75MXD9bBpb?=
 =?iso-8859-1?Q?zHQr7fvQA9AVm4gUddsG2NYQ4KpftjyHQRiuO33RspP74Ecrb+HEsxluK2?=
 =?iso-8859-1?Q?Aj71uYJSSroDqs1SFekbel8k/Nw75GP3QUCQMqKWfu2zvAhPd80K3KotQt?=
 =?iso-8859-1?Q?36J9yrGdiOFgYt9AllWwLFMNc8XAl6iqKOLyd/PDSIDToY/3dmmkAf+fPX?=
 =?iso-8859-1?Q?onglZrovbaEtIVTesJm0S48tuNtiYHEd2hRQbZ82jygGLBPAjjcou0Pi8O?=
 =?iso-8859-1?Q?QaBpcV2ch/6Uu2E9hG1z3dmWWMDtENJh5641B2sS8mIA/ixei9YYtUvg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4942.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eca1dd98-c51a-4180-48d2-08dc016324e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2023 13:54:11.1568 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XjmWXZaYIeScjdholm1qmfe7WGtgaITx5vUZN+TVCLQiguJOw4XcT0QP8wBSX+cT0Uu+THUyF/5w+640wdiwqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8745
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>,
 "frieder.schrempf@kontron.de" <frieder.schrempf@kontron.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently reading EDID only works because usually only two EDID blocks
of 128 bytes is used. Where an EDID segment holds 256 bytes or two EDID
blocks. And the first EDID segment read works fine but E-EDID specifies
up to 128 segments.

The logic is broken so change EDID segment index to multiple of 256
bytes and not 128 (block size).

Fixes: 9c8af882bf12 ("drm: Add adv7511 encoder driver")

Signed-off-by: Emil Svendsen <emas@bang-olufsen.dk>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm=
/bridge/adv7511/adv7511_drv.c
index 8be235144f6d..9b6294120516 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -537,6 +537,7 @@ static int adv7511_get_edid_block(void *data, u8 *buf, =
unsigned int block,
 				  size_t len)
 {
 	struct adv7511 *adv7511 =3D data;
+	int edid_segment =3D block / 2;
 	struct i2c_msg xfer[2];
 	uint8_t offset;
 	unsigned int i;
@@ -545,7 +546,7 @@ static int adv7511_get_edid_block(void *data, u8 *buf, =
unsigned int block,
 	if (len > 128)
 		return -EINVAL;
=20
-	if (adv7511->current_edid_segment !=3D block / 2) {
+	if (adv7511->current_edid_segment !=3D edid_segment) {
 		unsigned int status;
=20
 		ret =3D regmap_read(adv7511->regmap, ADV7511_REG_DDC_STATUS,
@@ -556,7 +557,7 @@ static int adv7511_get_edid_block(void *data, u8 *buf, =
unsigned int block,
 		if (status !=3D 2) {
 			adv7511->edid_read =3D false;
 			regmap_write(adv7511->regmap, ADV7511_REG_EDID_SEGMENT,
-				     block);
+				     edid_segment);
 			ret =3D adv7511_wait_for_edid(adv7511, 200);
 			if (ret < 0)
 				return ret;
@@ -589,7 +590,7 @@ static int adv7511_get_edid_block(void *data, u8 *buf, =
unsigned int block,
 			offset +=3D 64;
 		}
=20
-		adv7511->current_edid_segment =3D block / 2;
+		adv7511->current_edid_segment =3D edid_segment;
 	}
=20
 	if (block % 2 =3D=3D 0)
--=20
2.34.1
