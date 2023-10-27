Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3057D97D6
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 14:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E22410E990;
	Fri, 27 Oct 2023 12:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0715.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::715])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC0110E990
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 12:22:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OgybxZKyItdNbRwDXu8uosncZf6iv9T8DkripjNIdPRj6RVPGAChGaldFYZEZ4WhC77pAm13uuHRGkfz8hJ7Q8DYgomJ/FY5svi8a+L9Te8KvjZXWuJHk76Z0CT97k9qGsEqCjnE5DUbE1Io8DUBv3ipyfQrVKleA57/44Cc+XMU3THgmQZEd551ktj1iMJGrHLgmBLsaAWna4BNK2qx2ngopCfkoXgNPuRK+GzPFenJdWNWtwkiQLA/6Anw2c2VIFZshWn9pPEwijauMG7jvU97sOE502FpzIwMjUlcf4p8a3NCe9AxBHeh2EilKb9h6kUD8+4Y1evqtvmIsLYBlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdNeI5yuNXaMNmVWLdD/+zfx1yJ3pmbKtdCxZRg8Bi0=;
 b=SqraQfeJWrueFbXdBcxGGb6va1SMjlc5xKYaiAe9tGxNTLkcj5oifRM08G8AxG34UVQzkG5BXUMEUq8edK2jqeF7zH3XwIU4+yYXuvGwTGVtV9P65WZ48bc7swDej48uwjGRyJDBGsXNjiopRJC/6X2IX22yY/NDbZd5X/0L0QYqNldBN6+t+Qv5am1vNiDbRV2Kw+41qGlXljtF013lZXDSk8UkB7lmPiEvXsT9n3Op3PtuBS7RFJr647y8tJe058CUS7o/8BRXu1ETkk8pekuWQvkO3EJvuzTZcOAlcHMSmkeN5M0qa6ZWNuXLb4PJW0m4sk/pwc/y9pePchFmXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdNeI5yuNXaMNmVWLdD/+zfx1yJ3pmbKtdCxZRg8Bi0=;
 b=pr/vFCGlv+aPrWgdlJA9fNjGe+Zm6SfyhQkA3jS+/G9oDxuTBOmzaWXsxUN+blxT0+20ouu9+tZpzVudRym8AeLgFncj9atRqo7J+88d7YxCENRdRNea4wLZ6gj5Vt8LoDMvLXZXmy7BR0mpbry2DGYwlr+Dii3hRVa34k3DXHI=
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com (2603:10a6:803:b6::20)
 by PAVPR03MB9822.eurprd03.prod.outlook.com (2603:10a6:102:310::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Fri, 27 Oct
 2023 12:22:35 +0000
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
Subject: [PATCH v2 1/2] drm: bridge: adv7511: fix reading edid segments
Thread-Topic: [PATCH v2 1/2] drm: bridge: adv7511: fix reading edid segments
Thread-Index: AQHaCNBEeoF+BOSElkqjnDUZsMG67g==
Date: Fri, 27 Oct 2023 12:22:35 +0000
Message-ID: <20231027122214.599067-1-emas@bang-olufsen.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB4942:EE_|PAVPR03MB9822:EE_
x-ms-office365-filtering-correlation-id: 7ac968c7-88ec-47ba-476c-08dbd6e766c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZoqTo+EUd4LZtJPPb2sv87czjO+FVj8A3eHMNfXWe14wSVHvUjk3LQEWe89eilDGo6fBKylCxMncyiaJJNIRiYxUPminrRV3UdGtOrn0pF1zytW5fKJImx4iwaWY39IYIznzvNF94oFyMkq6j8iUKHb4j/SxCsIpyENw05ZkDKNK8MapHCE59td4vBD0Dn1QnT/+B2au1a725ITGiED4GjSGW0CKsbDb+R1I+ktUH0bdL+v3hlu0a5h0hhhgw7qv29gTkTZCrRC+1s2Z/Z3ylV1OfA96qJlaxX0hyofrqPTVH+pie4ogoinbVIE7NP5OfDMQjMcVeIgAl0eqSsVt8FGV5ePgltJUcM7nhtzWJ2uB/4IQ+2QpgFh3UtUXQ6upH0mGwH8NoxYph/ohzyCQN6wLhczzLzs2239MECVBSQ8h4nQ3QmLcckrYqGj8qQaYAyR0F/Qd0WQcrGBbbr/CdD/moAUV9HDjTsoTAUhzUGTmrEEyA1Bk6xzC+UZMtuz6C8qLlDA2MeD3yq6XZafgCG1LGw14BC+wYYygFeulxsB25IUi5re//26zzAQG4KT3OuXiETa6BILlPR2dJ8ydlMUvFF1z57MKdoxt3NIjzHZannu7SH0VQ0u0VcYBcNLI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB4942.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(366004)(346002)(376002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(6506007)(71200400001)(86362001)(5660300002)(41300700001)(83380400001)(26005)(2906002)(36756003)(7416002)(1076003)(2616005)(6512007)(122000001)(38100700002)(66556008)(66446008)(66476007)(91956017)(478600001)(6486002)(110136005)(54906003)(64756008)(966005)(76116006)(316002)(8976002)(66946007)(8936002)(38070700009)(4326008)(8676002)(921008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?zIN8u1DQRltHdoYBlp5B2Qvt42CzODPaXVA3QGrXnFXndi7ivbNCLW3ZzL?=
 =?iso-8859-1?Q?xbsTNKmTbP7imSZFfl8uyVqzL0MUoEmM4xKkwJDGKJ69wDk21Zc8YuvG8G?=
 =?iso-8859-1?Q?92ccZYKH49FbwR7eiAPsij8dGgZWLjtc2XKiF46caLElgeV8DPQK+u2MRh?=
 =?iso-8859-1?Q?KNTuzHL6zWR7GTUPPFOO2YpS2ZRiOE0UxnL+ggUIUWRyaXWJ7JHpTnAuG5?=
 =?iso-8859-1?Q?kKjpjjBRiEc5VMjuuFNZtImwr6MTr2oHuTG5cONrkcK5rTcywYlD+pp/8V?=
 =?iso-8859-1?Q?ZaGtUiK+CBFqc7EopgrFIxYCo4KHmPFqUun4TVUeSrGRbfc5HqoBYikIiM?=
 =?iso-8859-1?Q?NHUuUGkBlWVhM6ejW+ydvmTypnnwf0WQXjWMQjyg2ilLsiYey2Ujl+WzqY?=
 =?iso-8859-1?Q?qXr9eIl3d46gmem/zXpp4f6hlkdB9cWXXF8iSm2y2bM45ONW83WhLU4YKb?=
 =?iso-8859-1?Q?7+Q7zqOSfCyVO3GslbpDoEVBk7NoaQg0VxVFVMqb+t8sKtZH+Vecquep0C?=
 =?iso-8859-1?Q?Gjyd7G7WOaUDrQo+FTcG5DRZbwtl6X3swodqtvqC/36Gdfj3APWBBwGfgd?=
 =?iso-8859-1?Q?t/vgvD4ViOf2ZLoO/bcRi4eNzkqCpysEZFwMpxCLNSyEJKuDHTjZmo3Gnt?=
 =?iso-8859-1?Q?xRARU6a/BO2yCuz/Uedrr4B3mVSfmKaffhk3QKAzmjSvUWLzN9IwSS0HCh?=
 =?iso-8859-1?Q?7k/HxJlRoX8+1sGWJHcg1CrX/+7Ijd+f3popCozXBIfsPBrLADEVNc7Twm?=
 =?iso-8859-1?Q?BOnsc0qHjy0AnxS+I89KqUD6CW6wt6vhPfgkN+KPZP0+Iagi/0PZ764/QU?=
 =?iso-8859-1?Q?Jxv7/p7tpZaVuBQ1bUcSI4Mx58jk9YxOrRwfGwCqRC52V3JSp2xATnZ/5X?=
 =?iso-8859-1?Q?tceXWGk03Ii+Pl82mEZlQM03EbytpjWCc4Qt7S0/qAKLRoSwA7aDPJ4dvy?=
 =?iso-8859-1?Q?tmhoi7gYJFlarhX+9v3+HejnmslzRx54dSsMQJUUf96lB3ND2Paz4JKHBw?=
 =?iso-8859-1?Q?3VIlQMptXawJDAh8RiWzbdTZxgrtAAwW5sgM7h7dKf6X+hIE0zBZjlxmmG?=
 =?iso-8859-1?Q?rpgCitbaXy5P8ecggjGZIBONLRllmdsGO6oM1OmA3ii69Nzgjmhf5BLPEP?=
 =?iso-8859-1?Q?0TqtII00Q4C7KDAzshzwXFsJCBrcaRbWF/GMGasIpEznwfApeFqZYg2W56?=
 =?iso-8859-1?Q?FleOWLY/J5uZN6yeI6HqeqIhHLnPp56qHWkvSoyogKI0npr6wG0pXWc/Gx?=
 =?iso-8859-1?Q?2kbu+U32XHSYvkkQ/2cj+XKqh1e0F4SZOq5c7d1L/zoSYHezCKHTIDKsdh?=
 =?iso-8859-1?Q?MT3dIQRbvQXfIZHRvKavryGXDwV3A/UZBiwrcKnmjx0i6l1POUrxP6x/42?=
 =?iso-8859-1?Q?tz7GvU/5S6bRPbkkvX28AWU6iEGeTsOHowwleoB4VvpPntsZ0v5EtztbBA?=
 =?iso-8859-1?Q?t+im0faZoSA9vJAd2Nhc0s25PXglOhPmEH+R1VEqO4qLjkbIL6z2uuO2m5?=
 =?iso-8859-1?Q?vvSNnO67CFmg5hmPOEOqBaA8qRkWc1GeGOIH4paiQtM55VhibvIS440Sli?=
 =?iso-8859-1?Q?eUwb03Umk1UgAaPicUcw5VZ21hmAtCYkrm/iO0jkshq4owaHY2TpDnSQ+D?=
 =?iso-8859-1?Q?OvlREOkGKZkANxmMfp96F+HDVYdlhYLFRBkSkXJxxEFKzf67LXGSHA2g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4942.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ac968c7-88ec-47ba-476c-08dbd6e766c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2023 12:22:35.2670 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QKLnUxselrmB/xBIVpc/98F7eYE/a3oQZdDQLJkABIjgPvg+1jrw9xaMnHl4W8V9PPuFPEFza71rTKQSAuiAfg==
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

Currently reading EDID only works because usually only two EDID blocks
of 128 bytes is used. Where an EDID segment holds 256 bytes or two EDID
blocks. And the first EDID segment read works fine but E-EDID specifies
up to 128 segments.

The logic is broken so change EDID segment index to multiple of 256
bytes and not 128 (block size).

Fixes: 9c8af882bf12 ("drm: Add adv7511 encoder driver")

Signed-off-by: Emil Svendsen <emas@bang-olufsen.dk>
---
v2:
 - Split into two patches.
 - Add Fixes tag.

v1: https://lore.kernel.org/all/20231026113029.575846-1-emas@bang-olufsen.d=
k/

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
