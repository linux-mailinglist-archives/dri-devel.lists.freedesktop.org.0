Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 870BF81A055
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 14:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB7C10E5B0;
	Wed, 20 Dec 2023 13:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2127.outbound.protection.outlook.com [40.107.21.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093AE10E5C9
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 13:54:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDUthKx/F5ZN8KC7ras07CxY+O7IP4wfhWHfFkizdiEf9Kepb1LAajwIR+jHgklB2vGbBXb1h+ssswa+WOO7XnY0BlivCmIXPbReG3+ouYTLazKgYnRdv7BeBIuBiUsUtQ+qx9cPkB9FXSF48MK0nySIMhVefg5nKCW8J32Bmd8qwAb59TebEnaXarfg21kQdLda67C4cIwBhe3dTvST8DNgf46MttPyCUIUITL5WeNsGNVnfGuqbU+xOtdXz4QPwAeujH5luKsL8VQS8DJT76kH4qK2/Wbtqwu2E6AsH89fTLxh6tZU9/F5pq6lLnbFB23mKFYJBU7aftgpzf+xRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpGpDqO0cKZZaBZLIgNyZiwpN10fXY1FZTiWEJTC450=;
 b=CGlvhVW2ZuMxqjZVRn3fSy3CtH5oe9N2uQiTXwsJL6nF113YyTO0HSOFL0rsYTXn+pt3pJCATq67gVpp80fAw9qD36ksems8c3K5P8iiKkq3ygJZVOAFnm3R9EinOxl9YTNIWeoLLCHayd6kJ28AScsb7Vaz5XuWijNCxfXq1e5MJbPlSs34ZSXqpyRcLMEgpKuoB3/Y4ZxnjZBZuI77Ji14hVin07eQAsX9G0FGDYYufswzqpcsOIIzevKZr6wuzAZU5Cy8oaPIYMDmKRXV0R7vk35F4UrtgYPVVAOMLrABXqjhAo5jhcY7WSkX11QGMYfkoieV+cmAy/liM1bB8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wpGpDqO0cKZZaBZLIgNyZiwpN10fXY1FZTiWEJTC450=;
 b=pM3Ue7+pyLf1i0GOE3Ls+gTuXInmy3Ef3QsJteK1cxho51PiJXAsTOoEx0EiDXGuv4N4ckclorU6srT0ePl/5lHrDPU91H7Ff41jFwVdOnYE4rE9NgFByrzaUSKeSaC3TayuwCM4GTbh+VcqGgACZIgi6W4QmAii/Yg4jNJTvnM=
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com (2603:10a6:803:b6::20)
 by AS4PR03MB8745.eurprd03.prod.outlook.com (2603:10a6:20b:574::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 13:54:12 +0000
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::67c9:f19a:51af:df35]) by VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::67c9:f19a:51af:df35%7]) with mapi id 15.20.7091.034; Wed, 20 Dec 2023
 13:54:12 +0000
From: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH v3 2/2] drm: bridge: adv7511: fix edid read in hdcp state
Thread-Topic: [PATCH v3 2/2] drm: bridge: adv7511: fix edid read in hdcp state
Thread-Index: AQHaM0wCPbiHr5EVEE6fduOswVHF7g==
Date: Wed, 20 Dec 2023 13:54:11 +0000
Message-ID: <20231220135406.2318148-2-emas@bang-olufsen.dk>
References: <20231220135406.2318148-1-emas@bang-olufsen.dk>
In-Reply-To: <20231220135406.2318148-1-emas@bang-olufsen.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB4942:EE_|AS4PR03MB8745:EE_
x-ms-office365-filtering-correlation-id: d648703d-c91c-4646-41c8-08dc0163255e
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UUo2Xmbo+guVkge11STiGWlkNwF1SMGl+uIJ8d8Z7gMoLBqje9Zin4btKgnClwzgoPUEBUzuo2INVzuziCYYk0DENPzUuxOcb4U8uy0nm+Z3HTmzqX4WM39WLjVfs2n+BSgZgOOC7+ejnr5Zj+r/Fcu/491dgkE+gIgUi/4i4528LO0aOSDYSJdmIbbOavx56lP3U2ukmTFZy3PMQGMkU4wJfULMlZLMO/uuKCjI1g/BUy/iDvAUxCzb1/zLctTEZSVB+lgpDiLNN37eYqzjaoczLJhvF1zdgPlagLW5ty357mNoeGOie+RTd2RWr95P3WnLza1hhSOXZKBJMrNwLxwovVXrU+J4ybOsYCrJMvNlH1TX+MJiZblkW1Oc+XqP6xyi8Gwminh+eyEgAUAdip1/qS4lAdjZAkAVF//ONZy/l1S4NWMQNHEyBrg6udjJvl9pTXIkCjxFOMUDB2GMVIG8JQdB2PlmUwzoLaOsPA4E40HkACvpYYskV20uKx0sX8zeQkcIrPwLongnYc6V5qOLlA0n6I/ATcdrGfRX1D4WYio9I2BxO32kFOB4O2kDUIhx9+gbXj3VhJTTJSh7nDOm27Bqec4JGI2aOEdAfodneNoSp7iXeRAmQWs29bjH01jHq7shXEAiXscO74lAsg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB4942.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(346002)(39850400004)(366004)(451199024)(64100799003)(186009)(1800799012)(8676002)(8976002)(8936002)(4326008)(2906002)(6512007)(71200400001)(66946007)(316002)(64756008)(66446008)(66556008)(66476007)(54906003)(7416002)(83380400001)(110136005)(91956017)(5660300002)(76116006)(86362001)(122000001)(38100700002)(478600001)(2616005)(1076003)(26005)(6486002)(6506007)(41300700001)(36756003)(921008)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?gFVWA36JfcJxk5/mpYK32/Lhi86RcDc/+47W8bArACuEp4j/+WEk9UwtEt?=
 =?iso-8859-1?Q?LBanmRLYFQQK2Sl76bT6QImFqww2StXD/24d45k8v6FYnahtxAiWalVEkg?=
 =?iso-8859-1?Q?ipxeKapmR4IXF2aL1tRacX0tAJUCIwBWjsXj4HANdqTQCzAIVM2SoysoKh?=
 =?iso-8859-1?Q?x5OedthoWfc4MwbJhMty1IzGxNslGmIuwnb2r2nE4gGO75sSM6e0fbDbIR?=
 =?iso-8859-1?Q?rpmPsh5w8BMJ9T0PD0hauV6UFv5PLBylBS0As8ThA71TRTNF6GDAFDHDVv?=
 =?iso-8859-1?Q?xnmRgoGhA0alPmpGNNd7okcoWC0Ksn1Jgo/2DxQBtQsoG9QZW1Z7DpgZ9B?=
 =?iso-8859-1?Q?GogPV7BTIW/RYqq8mm9ICm5oYjtyMggX10iXmhbjbCObr5oFUykrOXp/74?=
 =?iso-8859-1?Q?92tVaV+1wsvTinUK+5kiIMoZWW6Wgq7TjBswucLI4t+wuX2YxgejBnoAF2?=
 =?iso-8859-1?Q?fJFZ22cPlL9KRUCvA/gjCkrtoCCEJ5C86XaO402F04ht76q3SvsLpIT7g2?=
 =?iso-8859-1?Q?YpIOWstbBRIL/0Qw2sm/5vQTLkkcIThYifi/IAB06SHAYYXD7V/HrrdFm6?=
 =?iso-8859-1?Q?gC1llipUc8E6OaS8j26HnbHeZomxT1OaLc2ISPx2HNdvu7+Rk4S2K8xqSo?=
 =?iso-8859-1?Q?o80M+UEqHe0Mpr8UsG5GqzfhkS8k5plE/c7BrKFynopu2PIuZpSajUp8rh?=
 =?iso-8859-1?Q?bImRvWuX8d/yd8uwyo4WSLZIlUjRbA4ITmb0xUcBv2hLOii+Zf6moNtWw8?=
 =?iso-8859-1?Q?UjrGRGCI+r9lT9Prm5fD8al2Xjv//CWC1e1eKJyzH1Kk2hFgT157t1AfOn?=
 =?iso-8859-1?Q?txKX4vIyOWFvoBppSjKICOYrbbSl49CFCK2SOYhlM3xMWmDFzhoII7aOs5?=
 =?iso-8859-1?Q?aIVHwltPEMJmnMdHbXt+epWgeZYGp3KY3AvzVqhZSIwsnLJ0LWKCySTtgp?=
 =?iso-8859-1?Q?v08qemUlzihrKpBTP6gD+uke6hBzexx13gEGhRBjiSlaZTt0kR4JNvpSkA?=
 =?iso-8859-1?Q?XimwVM8jB/JqXQi2OO+fn6v0ZzHqGqEzjLRwo9Zc5r4GCBqPtzf/CaE1ab?=
 =?iso-8859-1?Q?si0jxJH4QRLqmP9CfN1BlhnEmwKdsBzt8j54TaBMagF3uSVYNBy0Yn1sOd?=
 =?iso-8859-1?Q?Xvw5kDIHbR+O2x/f2y9zqildOCIPF+D8xXrK3/PSNObRRKEm4RhvNdMfP3?=
 =?iso-8859-1?Q?ITpfQMtjhc7GSJjd0ZTjJKeVceJ2Dm+Ok6454xW2Naxxx9e6RQJplf4+9J?=
 =?iso-8859-1?Q?1MNSIGaUqqdgjeQb/jR/fJuGVGbL04Sy7KphxoNwGZnyqmab7RP8XPP8cj?=
 =?iso-8859-1?Q?Lay2JbyGTbp3xnHea/+PiwQj/8x2qp5VaV4xuk/1+2SrD8G8j696PsgLaP?=
 =?iso-8859-1?Q?XrP+8OPRwtNcF9ki6eq/2Try7+dlcm+fcEyBpIPVUd554jVJqjkpfycIlQ?=
 =?iso-8859-1?Q?Q0sRzEK2GuE3PH8UZycviprj9wOyAo2A2S+Oed9GUUVp20oKgkSlGFKFv9?=
 =?iso-8859-1?Q?ansK1NJIOp4+zIJDCDCgsXTLxKXvRJoMt/IqOfeMW3OxUFcEr21sxP3LuH?=
 =?iso-8859-1?Q?Y6jsBtgCerNpWum5cHMsMFUx5HntbP511Hp3nii4i3oJORJb1ajeTyPK0b?=
 =?iso-8859-1?Q?p23cLz/HLLpfFWsuv4sh9A0S1wifDTpz5kb6YbLrm7IFbSY0avWDAcig?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4942.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d648703d-c91c-4646-41c8-08dc0163255e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2023 13:54:11.9657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mxHzWNIPypn2ir4ZYjSNzA4q8EysZhXsr7OZpGB8yDJi0MQacdxUjp5SRb8yj2S0JZG1MWQBsE5AkrlZb1Wd9A==
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

Change check of DDC status. Instead of silently not reading EDID when in
"IDLE" state [1]. Wait for HDCP being initialized because the EDID and
HDCP block shares memory [2].

[1]
ADV7511 Programming Guide revision G: Table 11: DDCController Status:

  0xC8 [3:0]  DDC Controller State

  0b0000      In Reset (No Hot Plug Detected)
  0b0001      Reading EDID
  0b0010      IDLE (Waiting for HDCP Requested)
  0b0011      Initializing HDCP
  0b0100      HDCP Enabled
  0b0101      Initializing HDCP Repeater

[2]
ADV7511 Programming Guide revision G: 4.6.1.1 EDID Definitions:

  EDID and HDCP use a shared memory space. During HDCP repeater
  initialization, the EDID data is overwritten with HDCP information.
  EDID is not re-read after HDCP initialization. If the user would like
  to re-buffer an EDID segment the EDID re-read register described in
  section 4.6.1.4 should be used.

Fixes: 9c8af882bf12 ("drm: Add adv7511 encoder driver")

Signed-off-by: Emil Svendsen <emas@bang-olufsen.dk>
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  9 +++
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 65 ++++++++++++++++----
 2 files changed, 62 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bri=
dge/adv7511/adv7511.h
index 39c9ece373b0..16d77f4a0aa8 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -247,6 +247,15 @@ enum adv7511_input_sync_pulse {
 	ADV7511_INPUT_SYNC_PULSE_NONE =3D 3,
 };
=20
+enum adv7511_ddc_status {
+	ADV7511_DDC_STATUS_IN_RESET =3D 0,
+	ADV7511_DDC_STATUS_READING_EDID =3D 1,
+	ADV7511_DDC_STATUS_WAIT_HDCP =3D 2,
+	ADV7511_DDC_STATUS_INIT_HDCP =3D 3,
+	ADV7511_DDC_STATUS_HDCP_ENABLED =3D 4,
+	ADV7511_DDC_STATUS_INIT_HDCP_REPEATER =3D 5,
+};
+
 /**
  * enum adv7511_sync_polarity - Polarity for the input sync signals
  * @ADV7511_SYNC_POLARITY_PASSTHROUGH:  Sync polarity matches that of
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm=
/bridge/adv7511/adv7511_drv.c
index 9b6294120516..f50efb3beb69 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -533,6 +533,48 @@ static int adv7511_wait_for_edid(struct adv7511 *adv75=
11, int timeout)
 	return adv7511->edid_read ? 0 : -EIO;
 }
=20
+static int adv7511_wait_for_hdcp(struct adv7511 *adv7511)
+{
+	struct device *dev =3D &adv7511->i2c_edid->dev;
+	unsigned int status =3D 0;
+	const int interval =3D 25;
+	int timeout =3D 100;
+	int ret =3D -EINVAL;
+
+	for (; timeout > 0; timeout -=3D interval) {
+		ret =3D regmap_read(adv7511->regmap, ADV7511_REG_DDC_STATUS,
+				  &status);
+		if (ret < 0)
+			return ret;
+
+		status &=3D 0x0F;
+
+		switch (status) {
+		case ADV7511_DDC_STATUS_IN_RESET:
+		case ADV7511_DDC_STATUS_READING_EDID:
+		case ADV7511_DDC_STATUS_HDCP_ENABLED:
+			return 0;
+		case ADV7511_DDC_STATUS_WAIT_HDCP:
+		case ADV7511_DDC_STATUS_INIT_HDCP:
+		case ADV7511_DDC_STATUS_INIT_HDCP_REPEATER:
+			dev_dbg(dev, "DDC status 0x%x\n", status);
+			break;
+		default:
+			dev_err(dev, "Unknown status 0x%x\n", status);
+			return -EIO;
+		}
+
+		msleep(interval);
+	}
+
+	if (status) {
+		dev_warn(dev, "Stuck in HDCP state 0x%x\n", status);
+		ret =3D -EAGAIN;
+	}
+
+	return ret;
+}
+
 static int adv7511_get_edid_block(void *data, u8 *buf, unsigned int block,
 				  size_t len)
 {
@@ -547,21 +589,20 @@ static int adv7511_get_edid_block(void *data, u8 *buf=
, unsigned int block,
 		return -EINVAL;
=20
 	if (adv7511->current_edid_segment !=3D edid_segment) {
-		unsigned int status;
-
-		ret =3D regmap_read(adv7511->regmap, ADV7511_REG_DDC_STATUS,
-				  &status);
+		/*
+		 * EDID and HDCP shares memory so make sure HDCP is done before
+		 * reading EDID.
+		 */
+		ret =3D adv7511_wait_for_hdcp(adv7511);
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
-		}
+		adv7511->edid_read =3D false;
+		regmap_write(adv7511->regmap, ADV7511_REG_EDID_SEGMENT,
+			     edid_segment);
+		ret =3D adv7511_wait_for_edid(adv7511, 200);
+		if (ret < 0)
+			return ret;
=20
 		/* Break this apart, hopefully more I2C controllers will
 		 * support 64 byte transfers than 256 byte transfers
--=20
2.34.1
