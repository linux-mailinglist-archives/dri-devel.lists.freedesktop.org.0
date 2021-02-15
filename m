Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AE631C128
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 19:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8D66E30F;
	Mon, 15 Feb 2021 18:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1095 seconds by postgrey-1.36 at gabe;
 Mon, 15 Feb 2021 18:01:58 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FC888924
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 18:01:57 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11FHfudN010278; Mon, 15 Feb 2021 18:43:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=cudWOI+/mL1lav1oA8NR0gj4Ts+T/F8qJxsc/43b/fQ=;
 b=TaWEdb/HbYJCIUFa92n1hqfEEvVEyq5YI58k1aOY1MiowHfjLcdT+3h7aCasefVCDn5V
 5Wp97fHgJSiLvizkLCL9RFOO8aeUemWp+hl8l+L+qJuQ7xRaDmwuI0zdmVGJxpiEOaD6
 OiubVBxlMGIkEwZYnCKvUgdV2Yqg/KS4sZnbo/CcTY6xEjOkRkoHcGTklDL2MhGPbFEA
 pvBQTGg+rmeXtjLTDwYe2/bzVs01nkWOWyVDuq/umeq4pVIKhVh7jGLCdbsZyHlGDd67
 yR3NX/P1LQSj1Mj6HRbV1EbQQbplgegZiz2d2Z87fnIIRGo9SL9J3QtIsJLnnITDHHf6 /A== 
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2051.outbound.protection.outlook.com [104.47.5.51])
 by mx07-00178001.pphosted.com with ESMTP id 36p706barb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Feb 2021 18:43:37 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EAj4joH70Xk56Kn4V+07AdcFbMPG8juBZWXlgbHtLP6Uoa954pynDB8Ig2Hn/e3cFQY9XgDHxwDZA7OiQ9YNEmh/KplVKglWDD5X+RKlxljeKYydrGK2Tjo/0NMoG4dVuKptgYZeOgePS5jPqG3C41suAugdo6NwGzYIoxMdX8J/ba/JIK7xNlClhPAyS0+UNLGiEE40RDFBGyiFLDz/ZAaHQUmknNFyhSasgNa4dOBhyAN3Sjb3NOK19cmv2Ud0Tk9GUBUV8KsDlj4eEzm6Y6JGddSsxzN3/L9Zxt/mP48j6syIv/rlH9Qpy9qLjXpIKRfVpOjnTMDlzsFpTo0FMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cudWOI+/mL1lav1oA8NR0gj4Ts+T/F8qJxsc/43b/fQ=;
 b=HdZO1oCU1mTvjru/JjLG3t2Kip37KFIt9rUWwPQkJIz/VOSHSQt+DUL/cc0gFG61LWGF4n7boS5IPuFPXy8iIm8gBWeF9601BRT3Bonc7wBwWK+xsoMl0qpkQq8ax/B/r79g6m4OZFyDFFaOZ0Drbxk4TwAWzVxvPKjwHCQ5fnl3HofQjXhG7XRRrnE4+QailAVtpGzD6l3SzyGVghNsCBFVmf5D8V2g15Peu2+nHh1ncJTIRgLnQxsXEjprLyOCCWqGrlR5EChGQNYVjY6VG5vWV24hYsp/JUeD2JQifH9mUQLcSqVhR+cpoRJqf98Sq3+KPceUvUxJI2Lz+OWojg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=st.com; dmarc=pass action=none header.from=st.com; dkim=pass
 header.d=st.com; arc=none
Received: from AM9PR10MB4451.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:262::12)
 by AM9PR10MB4216.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fa::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Mon, 15 Feb
 2021 17:43:35 +0000
Received: from AM9PR10MB4451.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8825:fbb4:9a98:688d]) by AM9PR10MB4451.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8825:fbb4:9a98:688d%4]) with mapi id 15.20.3846.041; Mon, 15 Feb 2021
 17:43:35 +0000
From: Philippe CORNU <philippe.cornu@st.com>
To: Marek Vasut <marex@denx.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH V4] drm/stm: Fix bus_flags handling
Thread-Topic: [PATCH V4] drm/stm: Fix bus_flags handling
Thread-Index: AQHW9JyxzYBW/1+bCUeqYMGBudKtDqpZmYyw
Date: Mon, 15 Feb 2021 17:43:35 +0000
Message-ID: <AM9PR10MB4451A72664F9F32DF583665EE8889@AM9PR10MB4451.EURPRD10.PROD.OUTLOOK.COM>
References: <20210127110756.125570-1-marex@denx.de>
In-Reply-To: <20210127110756.125570-1-marex@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Enabled=true;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SetDate=2021-02-15T17:43:33Z; 
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Method=Standard;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Name=23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SiteId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_ActionId=b3a6b039-abe6-4eb1-8d1c-71944644620e;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_ContentBits=2
authentication-results: denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=none action=none header.from=st.com;
x-originating-ip: [165.225.76.65]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9d8262a-3dc5-45e1-06a6-08d8d1d9387a
x-ms-traffictypediagnostic: AM9PR10MB4216:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM9PR10MB4216726BE22AB5ECC0A5DBC6E8889@AM9PR10MB4216.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FiKghtCFMdmyqHLKF8pXHvJaldNHaXTkUTI2vw8XvmFgVlNLFzOIWoLBoPpVH0GMOQeNf+Hy3/bPdqS0CANaAS6hzv1Iv8mgOnXpiiTRMJMNWAmlD7O8n4RGMG7vm37F7aWlTClm6h4eMFyRP4xFcMnLDQMQpLPS0W7s8/01AtYg6oTHDdMBWZddOeNohI37j4sBhALphJ6cIgMReUYmITMvPGeslacn48zLHjIZ4NfRpXaxI0gKCtWE/FJXYCu3f7YdbolfhUbNyyRowK2s9rSnDNwga7cMUxtVEWxZf0+J5hsBWkskbc4u9JHpgu6uOTyukP4HCTK5kZdHiMz33IIYgjttiDq1QMhCqbDJRusv5OorjnWNU4FnW5m1z0nerzYHLDx5YukpaiU5ZJWtX3Bn85i3kQjXXZZhA7vciVC6T0VHJs8IGVpTE8aWW5ZNvmfOtPiTIbW1M53qkR40RBT1tHnsUrDxPXRrlmAJwM+rCNnWCMGi4mwk2JebzXVfxV5ZNzuEQTGljPQp4mr6pA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR10MB4451.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(52536014)(8936002)(7696005)(86362001)(55236004)(186003)(8676002)(2906002)(71200400001)(6506007)(478600001)(53546011)(5660300002)(26005)(4326008)(66946007)(83380400001)(66476007)(9686003)(54906003)(66556008)(33656002)(64756008)(76116006)(66446008)(110136005)(55016002)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?kYEUPA7IlXTW+7D7oWv1Zto8iUPHVNI/fWonsi+sZG5GMsvjzMkPYSRhXCG8?=
 =?us-ascii?Q?sp9hIW+qSpQVFOV4HBKvNrSpLJOfzf7HFYlIsfVzGGhGeeWTNllc/+5HK9NH?=
 =?us-ascii?Q?qS0YWPb6ZeRMNJCADL52Dai40/7KVPGmZPmV7w8nuv0A39/nLSfgwjwohvbf?=
 =?us-ascii?Q?gNGhUJyHKcnMR94M1tuzKmS2RIB6jG1/dkfvA7Z3aoK5ANcLvNfVqugRnkFp?=
 =?us-ascii?Q?NVYDoixXiVdhJTzJmCmGP/kAYGfHz14Tu3/VgiTThxppak3wk454KJb7uW1q?=
 =?us-ascii?Q?af/GW/8ngeOS1updPUpJ8Qtw1kvcVnUguGaQ+lYtURdjvxzRDc0Ew25u76OA?=
 =?us-ascii?Q?IYz6Jqpx7bu0w0U4nlr319HC5rXpWCGrdPkL7exxIxsbmRbfNCSwPWJ9IJGT?=
 =?us-ascii?Q?8f3i7yjliIcy8jQo27kmiUFvpW6frtuOZJVw2ujYfkj2eqVGdCPqdboTZkf+?=
 =?us-ascii?Q?vyWWAtlPwxxDElPILiy1DFWyaN1VlprvdaM6U0XgwRfCYSEi+m/RSxM3id6K?=
 =?us-ascii?Q?qDY6cp4hvplF4PksJDAjuqfDBUYZsuiJnr/T7laJF1uh+CuZ7QSmD2nF50aP?=
 =?us-ascii?Q?MNIeL1Dk91yXRyEMaILyrgvW0RxUI7aJGTOIOej4AQx5TYhvk7yjOATvkRlc?=
 =?us-ascii?Q?4WwusTkKCqkwT9eMhzUE/voLIVazA18FamRM3O9ieCcUL5g+zRkC1MpjVJkw?=
 =?us-ascii?Q?+wwIPjfRei7bDz10J+MgTSGaknEk2lQ09GualqnStpk+cDPj/UpExdNOwtVm?=
 =?us-ascii?Q?nT3ol4och3HFcmH85KGDS3oS5Xv77ADCouwRz30bo5dk/xHtON6xxym2FExc?=
 =?us-ascii?Q?nuVBfMxBlgF2QGucuKlpWVsfbj/q8r2p7xghDq4s6kE6Xl/9kqqXMcr9wx2B?=
 =?us-ascii?Q?Bcr7Ws1QHZX0VPJZna04FecZtzq3MteE89opjsG2mnjrgzW7S/4kv5DlIFxk?=
 =?us-ascii?Q?ieXoTk1Wb3I+ogEQMP6wLKu1DHnW5DLO0m9eQyhsYFBizNhK1EZO6Uhw+abc?=
 =?us-ascii?Q?HPlTcCDIL9AfZMqgE2sLDcnYcpBiqBwBZRN0qx3yv4hSFM0qDSy/jyvFiFEy?=
 =?us-ascii?Q?/F9vQ++Jv++GDYgxC+yVsVHS45XuJ7JkcsKKjuhD3s3tCpfQdICK6zmyW1PE?=
 =?us-ascii?Q?TpWLR9ZNsQMuLTWDbTZ+8M8NiF3FBelIQn8oIwYDHAqffVNv6TKqkvRNnrWR?=
 =?us-ascii?Q?RWYUoKkia9ypUYrwdju8ZMRZ4of6gvw7yFeyFGUAmzJiGHDJsZ+d6vkaM5L0?=
 =?us-ascii?Q?oDUY95TpMkJk1ubrCsV8D/sZnnsoUwd9Qs2xPfvDBwbZZd5Tn0aI5xYXKNTk?=
 =?us-ascii?Q?cjuef1ABtoRddI9UoEjY1wAO?=
MIME-Version: 1.0
X-OriginatorOrg: ST.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4451.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c9d8262a-3dc5-45e1-06a6-08d8d1d9387a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2021 17:43:35.7180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5+6hjo8mor+4o15n2IC5r4zAdB9letZ9UuL6GzA0HEBlD16sFgYYo6KSQes6+zFZzlIcon9VdGW0UwMpdwWcMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4216
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-15_14:2021-02-12,
 2021-02-15 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1011 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102150138
X-Mailman-Approved-At: Mon, 15 Feb 2021 18:08:42 +0000
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
Cc: Alexandre TORGUE <alexandre.torgue@st.com>,
 Antonio BORNEO <antonio.borneo@st.com>, Vincent ABRIOU <vincent.abriou@st.com>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Marek,
Applied on drm-misc-next.
Many thanks for your patch,
Philippe :-)


ST Restricted

-----Original Message-----
From: Marek Vasut <marex@denx.de> 
Sent: Wednesday, January 27, 2021 12:08
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>; Yannick FERTRE <yannick.fertre@st.com>; Alexandre TORGUE <alexandre.torgue@st.com>; Antonio BORNEO <antonio.borneo@st.com>; Benjamin Gaignard <benjamin.gaignard@st.com>; Maxime Coquelin <mcoquelin.stm32@gmail.com>; Philippe CORNU <philippe.cornu@st.com>; Sam Ravnborg <sam@ravnborg.org>; Vincent ABRIOU <vincent.abriou@st.com>; linux-arm-kernel@lists.infradead.org; linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH V4] drm/stm: Fix bus_flags handling

The drm_display_mode_to_videomode() does not populate DISPLAY_FLAGS_DE_LOW or DISPLAY_FLAGS_PIXDATA_NEGEDGE flags in struct videomode. Therefore, no matter what polarity the next bridge or display might require, these flags are never set, and thus the LTDC GCR_DEPOL and GCR_PCPOL bits are never set, and the LTDC behaves as if both DISPLAY_FLAGS_PIXDATA_POSEDGE and DISPLAY_FLAGS_DE_HIGH were always set.

The fix for this problem is taken almost verbatim from MXSFB driver. In case there is a bridge attached to the LTDC, the bridge might have extra polarity requirements, so extract bus_flags from the bridge and use them for LTDC configuration. Otherwise, extract bus_flags from the connector, which is the display.

Fixes: b759012c5fa7 ("drm/stm: Add STM32 LTDC driver")
Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Antonio Borneo <antonio.borneo@st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Philippe Cornu <philippe.cornu@st.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Vincent Abriou <vincent.abriou@st.com>
Cc: Yannick Fertre <yannick.fertre@st.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: dri-devel@lists.freedesktop.org
---
V2: Check if ldev->bridge->timings is non-NULL before accessing it
V3: get bus_flags from connector (from Yannick)
    - Display controller could support several connectors (not connected at
      the same time). ie: stm32mp15c-DK2 board have 2 connectors (HDMI + DSI).
      Driver check which connector is connected to get the bus flag.
V4: get bridge from encoder (from Yannick)
---
 drivers/gpu/drm/stm/ltdc.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c index 6e28e6b60e72..acc9f6694eb6 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -544,13 +544,42 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)  {
 	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
 	struct drm_device *ddev = crtc->dev;
+	struct drm_connector_list_iter iter;
+	struct drm_connector *connector = NULL;
+	struct drm_encoder *encoder = NULL;
+	struct drm_bridge *bridge = NULL;
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	struct videomode vm;
 	u32 hsync, vsync, accum_hbp, accum_vbp, accum_act_w, accum_act_h;
 	u32 total_width, total_height;
+	u32 bus_flags = 0;
 	u32 val;
 	int ret;
 
+	/* get encoder from crtc */
+	drm_for_each_encoder(encoder, ddev)
+		if (encoder->crtc == crtc)
+			break;
+
+	if (encoder) {
+		/* get bridge from encoder */
+		list_for_each_entry(bridge, &encoder->bridge_chain, chain_node)
+			if (bridge->encoder == encoder)
+				break;
+
+		/* Get the connector from encoder */
+		drm_connector_list_iter_begin(ddev, &iter);
+		drm_for_each_connector_iter(connector, &iter)
+			if (connector->encoder == encoder)
+				break;
+		drm_connector_list_iter_end(&iter);
+	}
+
+	if (bridge && bridge->timings)
+		bus_flags = bridge->timings->input_bus_flags;
+	else if (connector)
+		bus_flags = connector->display_info.bus_flags;
+
 	if (!pm_runtime_active(ddev->dev)) {
 		ret = pm_runtime_get_sync(ddev->dev);
 		if (ret) {
@@ -586,10 +615,10 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	if (vm.flags & DISPLAY_FLAGS_VSYNC_HIGH)
 		val |= GCR_VSPOL;
 
-	if (vm.flags & DISPLAY_FLAGS_DE_LOW)
+	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
 		val |= GCR_DEPOL;
 
-	if (vm.flags & DISPLAY_FLAGS_PIXDATA_NEGEDGE)
+	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
 		val |= GCR_PCPOL;
 
 	reg_update_bits(ldev->regs, LTDC_GCR,
--
2.29.2
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
