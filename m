Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 728DB7D97D7
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 14:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CBA10E991;
	Fri, 27 Oct 2023 12:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0715.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::715])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 900C410E990
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 12:22:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXyUzx8XjK8XYaQMR7ux4ab9aKiP8SanJrKvjVERaRpCTEBnU4alkvJp/iBfZ1p1uvOzZjl/U38HfbWJsMRzbc1g8LhBi7Z8G8BhQrpO2ZcWIsRxQE9JmdFXuBZfez5UEWj0Kwk2y305rXjDIcgoB953AVRIrqh3qcLFWlQkXRBP0RJmBNoecimUjV2LIu9btXRLexILMcP7au3aD6Twmd+0Dt+9Zq0cyemQRIxe4D8uyb/AWg0WDg9ixrlBL/tdeqpbRznuNorhte/j+0rBLnrZKP0Sfq0RUvxwIVNeVo9fgRe/xLL9RMYguBasxEq6FAbTjHqH8AV78Y8/TnW06A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Gpgnx0M4KisGfgNTNvIoX7z+mtz2Tm+g+Z+YwzB2tg=;
 b=HxZxcQ0Gfv/ri62lb76Adn0qqT62cLRjl2MnPaBRK2JYhK+HjaCFdbxOzRrR62djEOxSFMS/h/BbO5+LtWmamsis+uiqFnkaFU9MN9wvVmKoiTS0s8SwhvPwiCtVsr2TjTEjb/6s8m0YmdI6qJb5Dz7MZqExxJ1mbbmo7GEm80GduaLqM79Ida4Fxi3p3ACjCtI0rgTGnTfwG4WeQmwf5jjy+f2UeUVu+R4u9K7FdUt07ny+DtG/0nrDziEaT4vUk9VJiDm7dQjJeKiiVGR2PuvzdPlXt4HLcTO2Z1YVS4r+07V0uZInL/wLBJquXW1tv9tvkdOpWCGcjDQEgLmQeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Gpgnx0M4KisGfgNTNvIoX7z+mtz2Tm+g+Z+YwzB2tg=;
 b=toeAqdHmIZbYKAtMvva9GE7OkuZ+nbY8TLGvBUwEngPutirI9wrBOpE6yeACzBwY9qLjofu4HsPiHmfluEF90DDKlJ0BDxyqv5MgM7F+HB89RufKxxpPk3Rl18BzQiACUTSZav2hNFAzbo4YB/qwpIy8JnBub/fyoiNjTOLkDz8=
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com (2603:10a6:803:b6::20)
 by PAVPR03MB9822.eurprd03.prod.outlook.com (2603:10a6:102:310::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Fri, 27 Oct
 2023 12:22:36 +0000
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::67c9:f19a:51af:df35]) by VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::67c9:f19a:51af:df35%7]) with mapi id 15.20.6933.024; Fri, 27 Oct 2023
 12:22:35 +0000
From: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH v2 2/2] drm: bridge: adv7511: fix edid read in idle state
Thread-Topic: [PATCH v2 2/2] drm: bridge: adv7511: fix edid read in idle state
Thread-Index: AQHaCNBE5XPNVB1FYU2YawuwR7uICw==
Date: Fri, 27 Oct 2023 12:22:35 +0000
Message-ID: <20231027122214.599067-2-emas@bang-olufsen.dk>
References: <20231027122214.599067-1-emas@bang-olufsen.dk>
In-Reply-To: <20231027122214.599067-1-emas@bang-olufsen.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB4942:EE_|PAVPR03MB9822:EE_
x-ms-office365-filtering-correlation-id: 5040617f-ee3b-418e-a582-08dbd6e76724
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h+CC47di24EpsrtDJg5XYGPiIfNqbzGbkSLkZXg1Q5PjIPkz+U59IhzavUnQ3tMe5beDqNNBtLirceO8cQstUc/mBTMSI+YULl1gEze68Z6C+3yLVWfCeZcDWfcJksIm/Y4hfiJuf4t5EFE4eDPSwJjgOMhlz6U6yD4voovQYnf/bUnKQx7t6n74uhjJz2/qXIpKc2vrFkjFeJgv4RWT6BgsApynVXpnVV/OLd/F/bReKUMkbFda7mJMGDuqOO9fsxCxHNWKmg6VHEeRNJg2pMyexfwtvb0NXiAzvPw3Da3jyAHLEJmxqjI4f4XlGJqi1mrnXLSMZuJkDUweaZbmdNElLjoULkKfSUUfb7eKf+nAUIEfo5L4+zp82KiNuJbJ5TrNzand0xETthMdqE/qpw4RG9OKi2uUyywGZOG922oDgIAosfezx2haRvsf2Wc1m/o2JJ41RKkrIFiXLdrXRAnt20/VRZfWiTe8CZoGslh7TWZhC8jx5u3O40Kpb+nW+kqZ6mxbqoP/qH+U+Dnm4i4iHXZdvgUIK4sHaouPLBZVTfzl2V/8KxJdKIaIkWKZPcqr0KSFi+sJb9akAlU9gExPRkMvHgKDK7gHyySOSiLijvpVjuSuhn3aiYzulrSi
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB4942.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(366004)(346002)(376002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(6506007)(71200400001)(86362001)(5660300002)(41300700001)(83380400001)(26005)(2906002)(36756003)(7416002)(1076003)(2616005)(6512007)(122000001)(38100700002)(66556008)(66446008)(66476007)(91956017)(478600001)(6486002)(110136005)(54906003)(64756008)(966005)(76116006)(316002)(8976002)(66946007)(8936002)(38070700009)(4326008)(8676002)(921008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?B5TBJZJaTJpAHPE0eXipDhApLWD6G//uQDIh+H3ERL22wMoUuKT22Mi/Bn?=
 =?iso-8859-1?Q?eN2j4cZun/2DTAImB1DccajPK7Zo2PEe+z0iubCGwqf+SfFEKnTi+Y/gK0?=
 =?iso-8859-1?Q?CPWlvB7m1kaP2kdqEL6+47GJESnPT64FkMHUQ7tg2GShRSwhh/O/C1bx3u?=
 =?iso-8859-1?Q?NlCaHEwnTV3U1XbNQwEzyzzks3FNwmZThxu2CfcdyqAG8Csd7TDtSi/KBY?=
 =?iso-8859-1?Q?8afj7SIPTAsLSpHW0aP/p6UU+ELICpo+jpYf2v+A/am5yw3+LUft+gJJjI?=
 =?iso-8859-1?Q?sIyEcRub/ivKHN8CxvUXGvmjdZZ4RRjSAd2LGKHNAGS72aJnKdnXFXWsT9?=
 =?iso-8859-1?Q?YV54EIvDE6Ax8YH31xDKWLMaTC+0HPUJqHqLdtsy+CLRFH8fOqHNg7v7kN?=
 =?iso-8859-1?Q?0/zWAHdmMUy4mrFCIoW5mBEVqnexdNmys1DM+3HD8xbd0paAZxxakc5Lzu?=
 =?iso-8859-1?Q?35aAfVxdurzSx3FDfEpcQBy3Uz2cCKAAzR3LCszL9MHSzJnm5nnrQNMoq4?=
 =?iso-8859-1?Q?OQ+a/Sk8ewyXoMJ8WwzFwecVyLCuPm1PUccBxXU+Ku2ARik4Gb4n+GWfe4?=
 =?iso-8859-1?Q?/1Ayku7RI1YFlvJsO6vG/4Hll5QnLVMiD1hpE/dX+tBo/yP+4T4EDX8Ufd?=
 =?iso-8859-1?Q?+a4Zw3YXOVnakDTa0U4wluNnXag6DlvotXe8XCJFx2hSEY7O6N6XDE4Nzt?=
 =?iso-8859-1?Q?wPYFb+tLE9wm2ULO4R6jTV/bZhmZ1ocuuU3MuCq+vJDIgqMXcs0gpDb59A?=
 =?iso-8859-1?Q?9XgqZWg958ggfvB2003XDbeiG9t0VDpcFKIqkVi7fDGl3NTVz/2hkFUiqn?=
 =?iso-8859-1?Q?D2CONFi4PTmo/S7qqkyh7Q3P+ayj/TqiDt0xFVqFLWr0UdSYT8FyJKepJI?=
 =?iso-8859-1?Q?jhTh8DDCfaOt0IomddTHIbdCs1O7ic4b8yJzOb1HZR30BlkOjB32kTxWQp?=
 =?iso-8859-1?Q?t/zqxET/mNBh224vH/asV5H4sg0QvhXMjRqaieZYnA1DUPFS08HDoQytuA?=
 =?iso-8859-1?Q?eWXloNVjQEo5PttoLe5yTWBZLSOB+kT1KJE3c4UlwrpQ0TUgA/HSoqa6MI?=
 =?iso-8859-1?Q?T9fi6ti8EoMUpSr0ttfaZcGFN+hE3vbgHivV2/QLmxlo8tG3wmS0CmIudC?=
 =?iso-8859-1?Q?aPtQ0TfSL3Xi61btBFQ/LQg6RFDQkcEpqTs94iwsLuqy+1mg5Fw0aKKZxm?=
 =?iso-8859-1?Q?V98qg7qowyCSODNDHNE68bkxM5gKARkHsm2rqhLc6FP27v0baxIAz4llQm?=
 =?iso-8859-1?Q?JSCajyPDN4W3ppqupcqSgXcUV5TlmuYlsc3+JEj+vcV0n795svOu9SwJvM?=
 =?iso-8859-1?Q?XtdG/+jA5rDXQqdz3t7USrevNpYmtE7JLaw/VxBGt8jpEpS7iFyzmCXD/W?=
 =?iso-8859-1?Q?gY+xi0mrNxL12kNYawmSGF5jMQZ3zHjom8dR/zn5eIhL8MJ8LXam5j3klw?=
 =?iso-8859-1?Q?PP76vddBmGukW90Oz3krkkJcNn2q6iv209x74bmMXfdzG94eBG5teCcZar?=
 =?iso-8859-1?Q?vwyDbVLw16PBWziqneS8hgsQMu1tQBbQX6mKuE1eYGRHhqCRhllAdaUKEm?=
 =?iso-8859-1?Q?/OdR295CEBxadxiSgNo0979d0l4o8mka07GbCsH3cMsGlCZ+9hvUscjk/o?=
 =?iso-8859-1?Q?lbvvPDQ/bouV61BgqTu7e14xJwMLRQoO4kmWOdWvfrARRzrwtcOvsOhQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4942.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5040617f-ee3b-418e-a582-08dbd6e76724
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2023 12:22:35.8885 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sZ7htH1ErJ9EKaZD7FH8UZ+mCRh/ndJi3tFC6XFygDlklpswjTw9GftW24haCXMFh9SmZGL4QuAorQ3vw6jo7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9822
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
 Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change check of DDC status. Instead of silently not reading EDID when in
"IDLE" state [1]. Always read EDID but add a debug log when DDC
controller is in reset.

[1]
ADV7511 Programming Guide: Table 11: DDCController Status:

  0xC8 [3:0]  DDC Controller State

  0000        In Reset (No Hot Plug Detected)
  0001        Reading EDID
  0010        IDLE (Waiting for HDCP Requested)
  0011        Initializing HDCP
  0100        HDCP Enabled
  0101        Initializing HDCP Repeater

Fixes: 9c8af882bf12 ("drm: Add adv7511 encoder driver")

Signed-off-by: Emil Svendsen <emas@bang-olufsen.dk>
---
v2:
 - Split into two patches.
 - Add Fixes tag.
 - Don't return -EIO when DDC controller is in reset state, only log.

v1: https://lore.kernel.org/all/20231026113029.575846-1-emas@bang-olufsen.d=
k/

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm=
/bridge/adv7511/adv7511_drv.c
index 9b6294120516..713ad348dc46 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -537,6 +537,7 @@ static int adv7511_get_edid_block(void *data, u8 *buf, =
unsigned int block,
 				  size_t len)
 {
 	struct adv7511 *adv7511 =3D data;
+	struct device* dev =3D &adv7511->i2c_edid->dev;
 	int edid_segment =3D block / 2;
 	struct i2c_msg xfer[2];
 	uint8_t offset;
@@ -554,15 +555,18 @@ static int adv7511_get_edid_block(void *data, u8 *buf=
, unsigned int block,
 		if (ret < 0)
 			return ret;
=20
-		if (status !=3D 2) {
-			adv7511->edid_read =3D false;
-			regmap_write(adv7511->regmap, ADV7511_REG_EDID_SEGMENT,
-				     edid_segment);
-			ret =3D adv7511_wait_for_edid(adv7511, 200);
-			if (ret < 0)
-				return ret;
+		if (!(status & 0x0F)) {
+			dev_dbg(dev, "DDC in reset no hot plug detected %x\n",
+                                status);
 		}
=20
+		adv7511->edid_read =3D false;
+		regmap_write(adv7511->regmap, ADV7511_REG_EDID_SEGMENT,
+			     edid_segment);
+		ret =3D adv7511_wait_for_edid(adv7511, 200);
+		if (ret < 0)
+			return ret;
+
 		/* Break this apart, hopefully more I2C controllers will
 		 * support 64 byte transfers than 256 byte transfers
 		 */
--=20
2.34.1
