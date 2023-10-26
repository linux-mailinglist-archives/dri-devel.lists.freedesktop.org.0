Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDEF7D843B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 16:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1137F10E7EF;
	Thu, 26 Oct 2023 14:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2091.outbound.protection.outlook.com [40.107.8.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4642E10E0A5
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 11:30:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHdj7Utx0eSuaCbmA5bg9tyERSBLAFxwewnITJp0fsInictd9QldtskmL6ehLBc4347ZgP67XUzErYyQUqdl/DotvVajF42kwtxLKHRP/N10Buru2jM4GS6x6R0rei0Rw4s/Kt0XB3Jqc2qPVK6auRHpOzODUb1y9FGK09/qPsC7L7imZt2XRnw4SR9FwiFg4qTQZAkRllrx8TMqRd6pTYNNjWP8MAim33XK+n6IHZRo7zdraYz6MDq63ereFYV3TGXew2lMvPNYQ6tIQpjU1fUPcPXuBbLg0YdlJpBFbyOKN3l1wLkOUjelJfYpfau+SbcQnmI7DAXYDZjfHICtnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3Kjz9hWw/s3Go0RsMSkbaa0IeOE46/wWffOnff303s=;
 b=WidcNkoFTm0Xulmd6ernsN8eysq+fm63rjQepe2Sx70Hyd2oM3Yai524RLMxZ78XWY5YEFCEWEoRvgcoWlNsUYXJ6rFmKeeUn74l1y6N92uI0s3dcv0AxRpbkFhcYphUmtSsIpJZObQnKKQYYE7C/smEIRXMTtI55UX46tKfQ/GCndOnQDWq4ZBmnbw+/GZ1Nii9Y1dY1LBw42hS6uHxvs6OgzJtqLQdsFJInoSrNtMDhAXh7ErIBnedIkC22TdbHdBoneHluLTknCs88bBrg3AUMyopWta9UzOmNldgNw3sfCRPv0uPc8cfK6tyd7JiZ056y2vNyb0eI7abkPh6Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3Kjz9hWw/s3Go0RsMSkbaa0IeOE46/wWffOnff303s=;
 b=Xd8AQiflrOz2nKVPIYVFLmUT9IiCwb5R/j4NU17tBrkMfbEWGrbXdIcd7BhpqviaiO1BScaIAdxEUwdmWL6+haiJnLtlzwiN+gelJ6Z3Wp26nCiy0/NG4rqDBkD2Rc9hVS5Sv/MNM5ut3Fx5nVzGZ5X7XXl9uk4GGXKU4uBAeW0=
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com (2603:10a6:803:b6::20)
 by PA6PR03MB10433.eurprd03.prod.outlook.com (2603:10a6:102:3c9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.20; Thu, 26 Oct
 2023 11:30:34 +0000
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::67c9:f19a:51af:df35]) by VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::67c9:f19a:51af:df35%6]) with mapi id 15.20.6907.032; Thu, 26 Oct 2023
 11:30:34 +0000
From: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: bridge: adv7511: fix reading edid segments
Thread-Topic: [PATCH] drm: bridge: adv7511: fix reading edid segments
Thread-Index: AQHaB//Vr2lGoiWaYEqV/lAWTsFsCA==
Date: Thu, 26 Oct 2023 11:30:34 +0000
Message-ID: <20231026113029.575846-1-emas@bang-olufsen.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB4942:EE_|PA6PR03MB10433:EE_
x-ms-office365-filtering-correlation-id: ea5e6177-6c8a-48c0-5519-08dbd616f86e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I5KDXPpDFVQWfZf7YEwpIMfmDwAQqieElhvnnPh/SSCb1qPTihwvFa+NkJyAVaJehXU0R/UGO1s4kuBmTlFgO9EznHFnxJHRzFzlH5BU5s9MVmlVKbU5NXJKB2iKF3UkdAIYszwovNDn4PsPgqQXVA/800OgFaiIRxUwvA+ThqmLq/P9N5RDAnFO8+2WTapN7VeoWeQ4MZmUnhRhdZIJ++i/JKXSW+PZ4NVvTKAUMg3qklYFwoQqfzglyfEn2BHuom3tm8rZhTJRPMmCejFlroBi3XUNAOus3OtIbMPhDBHwGbNfeWOHP7ByEBh/cSBvFYxgt6ILQui9pzKgQkD5+AnsDXN6V+QanTWyCK6oo5d3/IGwIT5sYQxiMFX9fqjJQ8zvzVHRsIJr+NQuAHNa4tbV3/y246I6OGnXtjsdHF3HUm+F5biFZKxP2xoXknehn0FgFenzuA0kT7cWQKSsXoSCJQs84HSV00O7VQ2Afm8qLPyrGS+CfTcDHeaJ8OZ9EoVPYp35H7Nj42fmpadSGgD5b6KosfQfTeO14JcJnB8KKLS2cu+JxycK/M4YSkuwD8gN5pzuTMjnD7gww9hvvBNUSNMLHTrh7U4wbwDlSBGMJ4DZl3bvhJQ0o7pRZ4w5Dcb9euhxmzGuASvSzp1vyQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB4942.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(39850400004)(376002)(346002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(38100700002)(2616005)(122000001)(1076003)(6506007)(6512007)(38070700009)(921008)(36756003)(26005)(83380400001)(2906002)(41300700001)(7416002)(5660300002)(54906003)(64756008)(66556008)(66476007)(66446008)(86362001)(316002)(110136005)(76116006)(91956017)(66946007)(71200400001)(478600001)(8976002)(6486002)(4326008)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?zzvpvH6Sc2IkwkvA4rKCpErO2AD/fvoeqOUJRYsqqqk7+LrWlsNwOk0PVl?=
 =?iso-8859-1?Q?rg7tutaeCaXLI/WWRjoiQSiOavKSUGMNy2xbF9r4rlCTJEBD/TGaOag+MF?=
 =?iso-8859-1?Q?IuF3R85smOFw4XGm72Q46piUePOCMoerqF/rC+da4Q/yQ6OVfyEw5N4vfi?=
 =?iso-8859-1?Q?Ttua7eofb2OLsXyJmHT+FUm7aFL/aDBrr5hANP7eqTNFSWTYj/CKYd5gYq?=
 =?iso-8859-1?Q?SvZrpkrHWrThPRsvOXLUtJRiiwdx72Wfnn0WHkT1u2Sgm52cfP/MQN5WBU?=
 =?iso-8859-1?Q?j1i0lgXqyllnbQcgd7UFpPVrWa22vs5ZaLAdmRTRWHYfb+zC2gR+fAB1SW?=
 =?iso-8859-1?Q?r0SNAGj4PmpU+lGE0Wlf/7YO3tgwjzl98KMCl/4b7dXyHfexKhwhOdg3+D?=
 =?iso-8859-1?Q?kgummza3UzV93L67p1lvV1n4rzSBzFRIOTBTCfoX/kwo6iONtcqopWzADm?=
 =?iso-8859-1?Q?ohjpoTmLoHv6wp8kAUvZYnd5J8982yvXcLjvlqmL4csk5qqgixSEhf0Zgd?=
 =?iso-8859-1?Q?itTbQnI130n3RmrPxHLj3AfqHcTrGYc16XYqpBFwpsCMYb1kZQS57Xpx5s?=
 =?iso-8859-1?Q?5nftgngmCkK1DX9NDFUXwqWtmO1qpUpRJPz9vS9hD8Zx2WNfz8yVuajAA6?=
 =?iso-8859-1?Q?22idfycVvjQGvqITyHmMSqObyilnucyXZtXAI4Hqc9i4ubTKBh5USplVJH?=
 =?iso-8859-1?Q?tDXoPYoa1wfGjTDEYRo1FxY+mELAtm3B06GYkZVoUHUgnYb6tT41/qSRvv?=
 =?iso-8859-1?Q?UQvLstzsieej+YjhchzvTf4huMqtn/84M4n5WleZQr8vHeHqD6UOGnsMQT?=
 =?iso-8859-1?Q?ZKBizrvEdL+OTybFOcTYv8qtiJv7F+Y2T3UoDvoYB6oTBVnHrxWWya2zO2?=
 =?iso-8859-1?Q?XqwekuVnbGsw7LqCbRbXtCkZUQX1pV5ucZtFvAVAxQzZfK/+BbQSSuc+1g?=
 =?iso-8859-1?Q?kglRnubmyQ+vL4BhWX5cMOI4qtszNztQkGys47fcQ99efRSFqABWVbEo9V?=
 =?iso-8859-1?Q?2FV5rwN7jqj5UOQE8MLb6xmNYWoj50jB2/Md/zQggz/pH/OrufdcasZeuD?=
 =?iso-8859-1?Q?n5sM1ezK42Y6PXCSXSPRoZrexaa6k1gGQOoHCbwE9eI5ez5KzPdKE6S8nz?=
 =?iso-8859-1?Q?sK+5vOz0Ih4ZWmCMY+Ad2/1gR/mfCgRvu4Wnu/JtwxT7daczhnYLQAQBRe?=
 =?iso-8859-1?Q?QKYqahLipQQt5AS5fdupa7KzvlZ84G/yfYzbPLz8fsnavL/6ljrTt97sWw?=
 =?iso-8859-1?Q?dMiBeFD1/dNZQexJc6myK6ce1iWK+LH7hMMqAiBklb+YNIcsATBSKiCupO?=
 =?iso-8859-1?Q?c5WJ2cQoDrYHJf8zq8jJTvknVZGFpKtP3b/1bHzyzBBM92kt7NyBX7am+Z?=
 =?iso-8859-1?Q?dT/20Zm7p+ihvObi3pHmgbiIyzSpgOq7fzeZ9FfxhCKja1D5C7/GK4VKL4?=
 =?iso-8859-1?Q?DDZOqBbhIt/uEjY3yfWKxm58dP6kOe9j+h4Wo7Lv9/6mgFqwyn/ZtZ+dgz?=
 =?iso-8859-1?Q?XsGtTS3CltFyzikdN4Kwgx/0q1emKEuW2OLsfpbboFfIIOK8KYhnD3WTin?=
 =?iso-8859-1?Q?MmoWlj/gn3unu+Rv2HjKikixL/3aBOVVvIqIdvCDuvgP6KnYQ0Bhw69Zv6?=
 =?iso-8859-1?Q?tl+PgxQ15uia3MRpLlk08TsHAGKvtzpfqalUcYYXJyUmlh8HwcWet3uA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4942.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea5e6177-6c8a-48c0-5519-08dbd616f86e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2023 11:30:34.8528 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /D6G/k5zv/XxOFzeF5WL9IPX540NPLJ9w690YuemLIDw83KLYWgC/LvyL00gI3MIeB7lcdPivaaNCqAlzFBIsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR03MB10433
X-Mailman-Approved-At: Thu, 26 Oct 2023 14:09:02 +0000
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

Also change check of DDC status. Instead of silently not reading EDID
when in "IDLE" state [1]. Check if the DDC controller is in reset
instead (no HPD).

[1]
ADV7511 Programming Guide: Table 11: DDCController Status:

  0xC8 [3:0]  DDC Controller State

  0000        In Reset (No Hot Plug Detected)
  0001        Reading EDID
  0010        IDLE (Waiting for HDCP Requested)
  0011        Initializing HDCP
  0100        HDCP Enabled
  0101        Initializing HDCP Repeater

Signed-off-by: Emil Svendsen <emas@bang-olufsen.dk>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 24 ++++++++++++--------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm=
/bridge/adv7511/adv7511_drv.c
index 8be235144f6d..c641c2ccd412 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -537,6 +537,8 @@ static int adv7511_get_edid_block(void *data, u8 *buf, =
unsigned int block,
 				  size_t len)
 {
 	struct adv7511 *adv7511 =3D data;
+	struct device* dev =3D &adv7511->i2c_edid->dev;
+	int edid_segment =3D block / 2;
 	struct i2c_msg xfer[2];
 	uint8_t offset;
 	unsigned int i;
@@ -545,7 +547,7 @@ static int adv7511_get_edid_block(void *data, u8 *buf, =
unsigned int block,
 	if (len > 128)
 		return -EINVAL;
=20
-	if (adv7511->current_edid_segment !=3D block / 2) {
+	if (adv7511->current_edid_segment !=3D edid_segment) {
 		unsigned int status;
=20
 		ret =3D regmap_read(adv7511->regmap, ADV7511_REG_DDC_STATUS,
@@ -553,15 +555,19 @@ static int adv7511_get_edid_block(void *data, u8 *buf=
, unsigned int block,
 		if (ret < 0)
 			return ret;
=20
-		if (status !=3D 2) {
-			adv7511->edid_read =3D false;
-			regmap_write(adv7511->regmap, ADV7511_REG_EDID_SEGMENT,
-				     block);
-			ret =3D adv7511_wait_for_edid(adv7511, 200);
-			if (ret < 0)
-				return ret;
+		if (!(status & 0x0F)) {
+			dev_dbg(dev, "DDC in reset no hot plug detected %x\n",
+				 status);
+			return -EIO;
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
@@ -589,7 +595,7 @@ static int adv7511_get_edid_block(void *data, u8 *buf, =
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
