Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7165C923D58
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 14:13:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6853310E034;
	Tue,  2 Jul 2024 12:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="by3ON6Nq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2047.outbound.protection.outlook.com [40.107.22.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9EBB10E199
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 12:13:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0sybhQsoRVzCPySeolVSaY8EGkE9MxyLAAZPL0KscVMiDocINQHH16ry/gmcDLmij7z0UOz4Iao3MBQCCLUIQ4EiBDHEuTXKhdV3VNEybXgJUrnvpck+ypkyUqbIvZ6gHTa3bm65QqkyM0d+X777k1ku0gNgC5orq08XFlaS3e0zUzlrLTVM850cjyNavBDqtOQ3BcCUXnZpxzcxGMt5yvt+ke+o1VY4VjrlTpxLE9CIVjNgEqHq6AiccF6VTeTuqOjMeZA0xFU8ILSMFxhbWwFW4JVHvevB1Axsc+Mt/l39S4KVrkOQtN8ypfxE4j+S6Jy7P9bvsvJJ8edOoOk3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ct6m1hEnVBKMrsU7wLSjpUANa7GTvKmBtXcoWtV7UQ0=;
 b=ecWUs2jx8P7J85QRSV9yvNOmIwcvgbiJCDS6QISLzeDyffLEVtBKcPc0/a/w92QrrWJ9whal8jmGJyvOj14CjG+zNZBos93jmf9gLdSZfu3ozBPOV68w3RbDo1izNrs2OuC19ECUuDkDJLEvHigbSZxPUsmpqhJCzcrkdcPjJyUafyXdBWyHNoKc9TEkviYKVIRLeDQ4r6+mEmBNDd185CWKcrWWtZOX+Boiu5p0F46812iyic+Vun4Tg46hRpoVYJlLb68QiCkFDzUQEkp321OtVFRBgrZX7sBI+uO5FoqnB+hul83AzGORB/S367zJNBX307kZyXSiXHHnt6tHPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ct6m1hEnVBKMrsU7wLSjpUANa7GTvKmBtXcoWtV7UQ0=;
 b=by3ON6NqAtBCCIl6duNS65XD76RX5NfyMcp6XN9ruT/eKlzY4DC/dIhYFjkbq2EBoidLyK4h9GbjRnKuW9axpAuTxHS9HqfTqw0+G9jg0ElXla99ZPDOdHS+e4rJXu1aOz0lPKHB/3dq/7wkU02eCPAIW0oGPswVjgMxz1wFePA=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU4PR04MB10362.eurprd04.prod.outlook.com (2603:10a6:10:563::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Tue, 2 Jul
 2024 12:13:16 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 12:13:16 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Maxime Ripard <mripard@kernel.org>, Alexander Stein
 <alexander.stein@ew.tq-group.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
 <linux-phy@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux@ew.tq-group.com"
 <linux@ew.tq-group.com>
Subject: Re: [PATCH v15 4/8] drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
Thread-Topic: [PATCH v15 4/8] drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
Thread-Index: AQHazHk3datqF4R27UqkZAN9l14P0g==
Date: Tue, 2 Jul 2024 12:13:16 +0000
Message-ID: <PAXPR04MB9448829F4BA8F8AF18F371F3F4DC2@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <20240306101625.795732-1-alexander.stein@ew.tq-group.com>
 <20240306101625.795732-5-alexander.stein@ew.tq-group.com>
 <20240306-mysterious-hoatzin-of-faith-49aec0@houat>
In-Reply-To: <20240306-mysterious-hoatzin-of-faith-49aec0@houat>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|DU4PR04MB10362:EE_
x-ms-office365-filtering-correlation-id: d6ebe70b-3f98-4763-ce75-08dc9a905a7c
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?R8Lp+SZbQ9wnONRLJxzw7e5r+FRk4tWJPHA7NjBcNrZ1ll4nb0bl2GlZTNAC?=
 =?us-ascii?Q?nDaHeIdOtZQOm3HznkWiq1/Qp4GYMppXffmeQ0PREZ+/856TBPT3t7pokp6R?=
 =?us-ascii?Q?63uZ28XXexlAiJuNAaXdQhShM5TGIvKWiqWg0Tnwn0kY+WGpfy6Jp/qgZhaK?=
 =?us-ascii?Q?Xly+kkL0kvfPj0XRTxDIPEseqJNVXJPdWlfz/q9JiI/DN+XUhSIi1WuN3loA?=
 =?us-ascii?Q?Yz6zZuacEAmosibbduIcvShZX4GSqv7FLdhFXW0bB7ixf+u46v+uiZ6LqY0G?=
 =?us-ascii?Q?PZ6sHrlumKWZjcDDbl3EXz07YYzVQaqQr3sgjCnS3yenSs0XuGR3Y3sfQiU3?=
 =?us-ascii?Q?7fbo9wgNLrIBgFIN+A4lE/3Yjxyhv52M8+vB/+QhBZ6wTuGZlX9IWgLorzqq?=
 =?us-ascii?Q?k48vByLEyK3tLvQhQDuIZHT6ylSan9dtyoRYzeiuAPqG4NFA5NXW01A0ppqe?=
 =?us-ascii?Q?TiO6SsHB5/X7zirllb6GpqnB1eBX/NS00c5+cNH3evwXhj12pKXHk1/CNvqA?=
 =?us-ascii?Q?CT4TR3nAP/iszSZR7LAHkHbchogWto0pWFhc3lQh5htCm3PRWHljkKHDsn4U?=
 =?us-ascii?Q?j/61qnM9hv72+nUSbli3Tz7IrnqFKy1Bo64cPTUvKxf9wlDOEWRE4kkFjEyd?=
 =?us-ascii?Q?KyJyUxi7Z4gzgLOrvSa/xIMqp+W1qj+EsEkgiXREHOGkZco5qOZDKd7F6yru?=
 =?us-ascii?Q?FR3IF4G02SRqIUX8quct6MHRdMxjn+3FwTZyUqj9PrmXdBdQ9DU8K2vZCTuu?=
 =?us-ascii?Q?IQVXeIRkKpZay6lFc5wS5Vt3jH2igAPv5tKHJ7bYvZxRQ+TVtcgcNr+8Ylha?=
 =?us-ascii?Q?LM0dmHiGT9rWrQfqZv2PZIlYaTAh4P9sXg3Weh/cMl6e5HW1W6YnMkk8ymPf?=
 =?us-ascii?Q?wf6DPKTANZubFYdKaMr9YudrDIcVmHG+gTFARleHEd5IS4IZiSOilTl3+WLU?=
 =?us-ascii?Q?MCkGySNlG3SBZfvkmO2RSRYaZ3iEAjx6hxYKsALCeOa+xEA7cTwSdS1RHM4n?=
 =?us-ascii?Q?ul0mTQd7iDFcfl2GPPnfzx9dMTTmg66M0M2Zcplzeyvp3pVwTouM5GTeCrP1?=
 =?us-ascii?Q?iL+UfzRZuW7C92BWZN4TVulrzUE1lezSLC8kK5Rj5mZaQJzzAE/LVDUTtzOO?=
 =?us-ascii?Q?lVYcBYJXXdV8Hst2YcRGQ1aUWZ+VLhEq9UPz5ua3kDrSkVPpQbHOwH8CyTxK?=
 =?us-ascii?Q?1KY7G+xnoxU6FYaP06kvZ5Wk+x/r5vo4+kN7nnArN/CX/Y/6NdDCTRiewM/q?=
 =?us-ascii?Q?cyE2cCrCe215gzZRZkfUENSKcduWcd787p8CfO88V5hCJFIMS+4TSftbz7iV?=
 =?us-ascii?Q?RHe3L65ogAXhNkNIpFN2h4Q86dxTll9CriMuGEgh31JmPRyrVCiQhV4rzavG?=
 =?us-ascii?Q?v4udqK8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4AE+yAPkP6EcjZKvrTCU6bi+uMsd5eVusuQ5/NJUfKlKAC7qx9cr8v8NDQD7?=
 =?us-ascii?Q?zMCDvqQk1fzWEsfwaD6pmTQh0P8cXyUyxAXwz//TirCWMe/faHczrjxe+ZPU?=
 =?us-ascii?Q?R+qERAbC2U3TTSB5dA/W4RZuvVLqhoSot1kC28/910PY9LpM/Ex9RHptC3vJ?=
 =?us-ascii?Q?yme+MhCx7Oazvt6m4kpXTvyuGuxr0j/Knb8kSeMrMO8AL0n1L7qeAmJD6ERv?=
 =?us-ascii?Q?mIEbx0yrnR2Nb+5UD5AYMvt3NN8mmF7FVi8DPrDpJYUtsccnZjcbIZMcZ2Ed?=
 =?us-ascii?Q?P72StS9MQhMxJetnc3RHjLWRI2GxmvrqvMQhN8z37sCpsfwSr9u8MiQXOPcd?=
 =?us-ascii?Q?GqUoETGa5UpNEFtJWUN50uPjtWvsl2fFjat5yGY749tvfSGLTdBalYQc2+5C?=
 =?us-ascii?Q?S7WupzbncEzUfGQVUGntuLn7VcwUZkcbE84u9LPdllwVJOUUEipg2rUSCSoE?=
 =?us-ascii?Q?YGldDTMMw1oXRrp649MyXrUff6vgBAwzuXJrJtE0JwB0NUK+0Ui9sUrfl600?=
 =?us-ascii?Q?SoV44rTbYr4+RFLgUMHhMuVqQncdMY7ewHxKW/f2in8WG8Sncqspa0eVzCzV?=
 =?us-ascii?Q?/Kwskt2/rq/WV568hPgSkOdgyFxbmKDtGGUFy22gxm9fdDZQMC+r4FnJx8TN?=
 =?us-ascii?Q?H+RT6J5SynRjLRtYxxBU6QIeInTQUeeetw2XhBJSF3k6pXDOrW7Psyo7qouF?=
 =?us-ascii?Q?wOgX7anxkwfXNoEOvwdAjuUnmxBEnm+T0ZXKnm3PI053N3+o/TDS6HWDENLJ?=
 =?us-ascii?Q?tr6bxnKXUU6cwgT31SGvZVbSzFjKcevzb/ZPDEIvxZLwuAS0nnPigzg3/FDs?=
 =?us-ascii?Q?qwrV99mI1m48SRf3qCDaVw5s/n7UdPBZXusiIo9/zPjfYvekWdf42IsYdv6Z?=
 =?us-ascii?Q?wO9T8qhH9b5/lhjrZlOuFHszwspqgQUNuTfUdN94aPh5nxbCVRi+slcJrUjH?=
 =?us-ascii?Q?hNrV+rmy9Umbt4h5fGIO2N0wtVLHL491xMmI4UxyKCVkZeGKFtxUxZZiDKr9?=
 =?us-ascii?Q?DLAajzc39hvlg5bM1LMrWeoud0QaoXNamFPAjDPgnEhyHlR+fDchzD6Fv3w4?=
 =?us-ascii?Q?ng6akKJvf662dlrmsXYaDdo5QuWSTwiJjQ2T7Y3ASS9NEVW3bI3zusUAj0yt?=
 =?us-ascii?Q?DheYlwBYXXKF6oT4ilOuCObcsO9jDY85z1O8Y0yymoWVjVVnbns3Y+JlbgEE?=
 =?us-ascii?Q?iqn49SeDDtScRZcgO9nzt6ukM3JPb+aonqQ2OF7PLophga4ulTWDni6yZMNv?=
 =?us-ascii?Q?258VFacI893uFhG0m+qywXhOihfswIHltXoDcWVi1DUGzy39/fKtJ/f+L+ID?=
 =?us-ascii?Q?ijRiavlc5Ormmqs7hybcMv1OI0t6Vvo/e8U099DhntJfDf0S8kUzzg3IDFQg?=
 =?us-ascii?Q?fMxnOwWy8VU2FQflfwdZSKF5VW3j5OAEW/x2bMZCereEeUhoKpWCm0DxXDNl?=
 =?us-ascii?Q?EtYQTJR9bv+krBdBJfwjKRodBbqTMFaChvTqcU/9kSTUJlV3zgq+kK/t3fXd?=
 =?us-ascii?Q?bQn3IDBGtaPXsD/Mp5VMAYjgXUKfHgaQe7Xoy+bVqgICH7AGVVUBxGIQdYhL?=
 =?us-ascii?Q?yvMOLhmvX2xX+PBnMPs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ebe70b-3f98-4763-ce75-08dc9a905a7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 12:13:16.3640 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H9xuesqJZQBLHQwaedG2D13OKJPCVHP8vls1ig+fjs6by/FCes0M211PdtDjoH7Yys9IaPYeNuix1SatFjw5Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10362
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

Hi Maxime,

Thanks for your comments,=20

> Subject: [EXT] Re: [PATCH v15 4/8] drm: bridge: Cadence: Add MHDP8501
> DP/HDMI driver
>=20
> Hi,
>=20
> On Wed, Mar 06, 2024 at 11:16:21AM +0100, Alexander Stein wrote:
> > +static int cdns_mhdp8501_read_hpd(struct cdns_mhdp8501_device
> *mhdp)
> > +{
> > +	u8 status;
> > +	int ret;
> > +
> > +	mutex_lock(&mhdp->mbox_mutex);
> > +
> > +	ret =3D cdns_mhdp_mailbox_send(&mhdp->base,
> MB_MODULE_ID_GENERAL,
> > +				     GENERAL_GET_HPD_STATE, 0, NULL);
> > +	if (ret)
> > +		goto err_get_hpd;
> > +
> > +	ret =3D cdns_mhdp_mailbox_recv_header(&mhdp->base,
> MB_MODULE_ID_GENERAL,
> > +					    GENERAL_GET_HPD_STATE,
> > +					    sizeof(status));
> > +	if (ret)
> > +		goto err_get_hpd;
> > +
> > +	ret =3D cdns_mhdp_mailbox_recv_data(&mhdp->base, &status,
> sizeof(status));
> > +	if (ret)
> > +		goto err_get_hpd;
> > +
> > +	mutex_unlock(&mhdp->mbox_mutex);
> > +
> > +	return status;
> > +
> > +err_get_hpd:
> > +	dev_err(mhdp->dev, "read hpd  failed: %d\n", ret);
> > +	mutex_unlock(&mhdp->mbox_mutex);
> > +
> > +	return ret;
> > +}
> > +
> > +enum drm_connector_status cdns_mhdp8501_detect(struct
> > +cdns_mhdp8501_device *mhdp) {
> > +	u8 hpd =3D 0xf;
> > +
> > +	hpd =3D cdns_mhdp8501_read_hpd(mhdp);
> > +	if (hpd =3D=3D 1)
> > +		return connector_status_connected;
> > +	else if (hpd =3D=3D 0)
> > +		return connector_status_disconnected;
> > +
> > +	dev_warn(mhdp->dev, "Unknown cable status, hdp=3D%u\n", hpd);
> > +	return connector_status_unknown;
> > +}
> > +
> > +static void hotplug_work_func(struct work_struct *work) {
> > +	struct cdns_mhdp8501_device *mhdp =3D container_of(work,
> > +						     struct cdns_mhdp8501_device,
> > +						     hotplug_work.work);
> > +	enum drm_connector_status status =3D cdns_mhdp8501_detect(mhdp);
> > +
> > +	drm_bridge_hpd_notify(&mhdp->bridge, status);
> > +
> > +	if (status =3D=3D connector_status_connected) {
> > +		/* Cable connected  */
> > +		DRM_INFO("HDMI/DP Cable Plug In\n");
> > +		enable_irq(mhdp->irq[IRQ_OUT]);
> > +	} else if (status =3D=3D connector_status_disconnected) {
> > +		/* Cable Disconnected  */
> > +		DRM_INFO("HDMI/DP Cable Plug Out\n");
> > +		enable_irq(mhdp->irq[IRQ_IN]);
> > +	}
> > +}
> > +
> > +static irqreturn_t cdns_mhdp8501_irq_thread(int irq, void *data) {
> > +	struct cdns_mhdp8501_device *mhdp =3D data;
> > +
> > +	disable_irq_nosync(irq);
> > +
> > +	mod_delayed_work(system_wq, &mhdp->hotplug_work,
> > +			 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
> > +
> > +	return IRQ_HANDLED;
> > +}
>=20
> AFAICT from the rest of the driver, you support HDMI modes with a charact=
er
> rate > 340Mchar/s, and thus you need to enable the scrambler.
>=20
> If you unplug/replug a monitor with the scrambler enabled though, and if
> there's no userspace component to react to the userspace event, the code =
you
> have here won't enable the scrambler again.
>=20
> You can test that by using modetest with a 4k@60Hz mode or something, and
> then disconnecting / reconnecting the monitor.
>=20
> We addressed it in vc4 in commit 6bed2ea3cb38 ("drm/vc4: hdmi: Reset link
> on hotplug").
>=20
> Arguably, the whole handling of the HDMI scrambling setup should be turne=
d
> into a helper, and I wanted to extend the work I've been doing around the
> HDMI infra to support the scrambler setup once it landed.
>=20

Yes, for userspace components that do not handle HPD events (such as modete=
st),=20
if they are connected to a 4K display and enable scramble then the cable is=
 unplugged/plugged, HDMI will not work.
However, this is a userspace component limitation. fbdev and weston could w=
ork well for this case.

The patch for vc4 in commit 6bed2ea3cb38 ("drm/vc4: hdmi: Reset link on hot=
plug")=20
assumes unplug/replug the same monitor as stated in its commit log.=20
It does not support the case where unplug/plug to different displays.=20
For example, if the cable is unplugged from a 4K monitor and then plugged i=
nto a 1080p monitor,=20
4K video mode will be output to the 1080p monitor because this userspace co=
mponent cannot respond to the monitor change.
Therefore, for userspace components that do not handle HPD events (such as =
modetest),=20
this patch can only partially solve the limitation, but it is not a perfect=
 solution.

If helper functions are used to restore the HDMI scramble bit after hotplug=
, I would like to use it.

> > +static int cdns_hdmi_mode_config(struct cdns_mhdp8501_device *mhdp,
> > +				 struct drm_display_mode *mode,
> > +				 struct video_info *video_info)
> > +{
> > +	int ret;
> > +	u32 val;
> > +	u32 vsync_lines =3D mode->vsync_end - mode->vsync_start;
> > +	u32 eof_lines =3D mode->vsync_start - mode->vdisplay;
> > +	u32 sof_lines =3D mode->vtotal - mode->vsync_end;
> > +	u32 hblank =3D mode->htotal - mode->hdisplay;
> > +	u32 hactive =3D mode->hdisplay;
> > +	u32 vblank =3D mode->vtotal - mode->vdisplay;
> > +	u32 vactive =3D mode->vdisplay;
> > +	u32 hfront =3D mode->hsync_start - mode->hdisplay;
> > +	u32 hback =3D mode->htotal - mode->hsync_end;
> > +	u32 vfront =3D eof_lines;
> > +	u32 hsync =3D hblank - hfront - hback;
> > +	u32 vsync =3D vsync_lines;
> > +	u32 vback =3D sof_lines;
> > +	u32 v_h_polarity =3D ((mode->flags & DRM_MODE_FLAG_NHSYNC) ? 0 : 1)
> +
> > +			((mode->flags & DRM_MODE_FLAG_NVSYNC) ? 0 : 2);
> > +
> > +	ret =3D cdns_mhdp_reg_write(&mhdp->base, SCHEDULER_H_SIZE, (hactive
> << 16) + hblank);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret =3D cdns_mhdp_reg_write(&mhdp->base, SCHEDULER_V_SIZE, (vactive
> << 16) + vblank);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret =3D cdns_mhdp_reg_write(&mhdp->base,
> HDTX_SIGNAL_FRONT_WIDTH, (vfront << 16) + hfront);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret =3D cdns_mhdp_reg_write(&mhdp->base, HDTX_SIGNAL_SYNC_WIDTH,
> (vsync << 16) + hsync);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret =3D cdns_mhdp_reg_write(&mhdp->base, HDTX_SIGNAL_BACK_WIDTH,
> (vback << 16) + hback);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret =3D cdns_mhdp_reg_write(&mhdp->base, HSYNC2VSYNC_POL_CTRL,
> v_h_polarity);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/* Reset Data Enable */
> > +	cdns_mhdp_reg_read(&mhdp->base, HDTX_CONTROLLER, &val);
> > +	val &=3D ~F_DATA_EN(1);
> > +	ret =3D cdns_mhdp_reg_write(&mhdp->base, HDTX_CONTROLLER, val);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/* Set bpc */
> > +	val &=3D ~F_VIF_DATA_WIDTH(3);
> > +	switch (video_info->bpc) {
> > +	case 10:
> > +		val |=3D F_VIF_DATA_WIDTH(1);
> > +		break;
> > +	case 12:
> > +		val |=3D F_VIF_DATA_WIDTH(2);
> > +		break;
> > +	case 16:
> > +		val |=3D F_VIF_DATA_WIDTH(3);
> > +		break;
> > +	case 8:
> > +	default:
> > +		val |=3D F_VIF_DATA_WIDTH(0);
> > +		break;
> > +	}
> > +
> > +	/* select color encoding */
> > +	val &=3D ~F_HDMI_ENCODING(3);
> > +	switch (video_info->color_fmt) {
> > +	case DRM_COLOR_FORMAT_YCBCR444:
> > +		val |=3D F_HDMI_ENCODING(2);
> > +		break;
> > +	case DRM_COLOR_FORMAT_YCBCR422:
> > +		val |=3D F_HDMI_ENCODING(1);
> > +		break;
> > +	case DRM_COLOR_FORMAT_YCBCR420:
> > +		val |=3D F_HDMI_ENCODING(3);
> > +		break;
> > +	case DRM_COLOR_FORMAT_RGB444:
> > +	default:
> > +		val |=3D F_HDMI_ENCODING(0);
> > +		break;
> > +	}
>=20
> It looks like you're only using RGB444?
The limitation will be removed in the next version, RGB444, YUV444, YUV422 =
and YUV420 could be supported by HDMI driver.=20

>=20
> > +static int cdns_hdmi_avi_info_set(struct cdns_mhdp8501_device *mhdp,
> > +				  struct drm_display_mode *mode)
> > +{
> > +	struct hdmi_avi_infoframe frame;
> > +	struct drm_connector_state *conn_state =3D mhdp->curr_conn->state;
> > +	struct drm_display_mode *adj_mode;
> > +	enum hdmi_quantization_range qr;
> > +	u8 buf[32];
> > +	int ret;
> > +
> > +	/* Initialise info frame from DRM mode */
> > +	drm_hdmi_avi_infoframe_from_display_mode(&frame,
> mhdp->curr_conn,
> > +mode);
> > +
> > +	frame.colorspace =3D
> cdns_hdmi_colorspace(mhdp->video_info.color_fmt);
> > +
> > +	drm_hdmi_avi_infoframe_colorimetry(&frame, conn_state);
> > +
> > +	adj_mode =3D &mhdp->bridge.encoder->crtc->state->adjusted_mode;
> > +
> > +	qr =3D drm_default_rgb_quant_range(adj_mode);
> > +
> > +	drm_hdmi_avi_infoframe_quant_range(&frame, mhdp->curr_conn,
> > +					   adj_mode, qr);
> > +
> > +	ret =3D hdmi_avi_infoframe_pack(&frame, buf + 1, sizeof(buf) - 1);
> > +	if (ret < 0) {
> > +		dev_err(mhdp->dev, "failed to pack AVI infoframe: %d\n", ret);
> > +		return -1;
> > +	}
> > +
> > +	buf[0] =3D 0;
> > +	cdns_hdmi_infoframe_set(mhdp, 0, sizeof(buf), buf,
> > +HDMI_INFOFRAME_TYPE_AVI);
> > +
> > +	return 0;
> > +}
> > +
> > +static void cdns_hdmi_vendor_info_set(struct cdns_mhdp8501_device
> *mhdp,
> > +				      struct drm_display_mode *mode) {
> > +	struct hdmi_vendor_infoframe frame;
> > +	u8 buf[32];
> > +	int ret;
> > +
> > +	/* Initialise vendor frame from DRM mode */
> > +	ret =3D drm_hdmi_vendor_infoframe_from_display_mode(&frame,
> mhdp->curr_conn, mode);
> > +	if (ret < 0) {
> > +		dev_info(mhdp->dev, "No vendor infoframe\n");
> > +		return;
> > +	}
> > +
> > +	ret =3D hdmi_vendor_infoframe_pack(&frame, buf + 1, sizeof(buf) - 1);
> > +	if (ret < 0) {
> > +		dev_warn(mhdp->dev, "Unable to pack vendor infoframe: %d\n",
> ret);
> > +		return;
> > +	}
> > +
> > +	buf[0] =3D 0;
> > +	cdns_hdmi_infoframe_set(mhdp, 3, sizeof(buf), buf,
> > +HDMI_INFOFRAME_TYPE_VENDOR); }
> > +
> > +static void cdns_hdmi_drm_info_set(struct cdns_mhdp8501_device
> *mhdp)
> > +{
> > +	struct drm_connector_state *conn_state;
> > +	struct hdmi_drm_infoframe frame;
> > +	u8 buf[32];
> > +	int ret;
> > +
> > +	conn_state =3D mhdp->curr_conn->state;
> > +
> > +	if (!conn_state->hdr_output_metadata)
> > +		return;
> > +
> > +	ret =3D drm_hdmi_infoframe_set_hdr_metadata(&frame, conn_state);
> > +	if (ret < 0) {
> > +		dev_dbg(mhdp->dev, "couldn't set HDR metadata in infoframe\n");
> > +		return;
> > +	}
> > +
> > +	ret =3D hdmi_drm_infoframe_pack(&frame, buf + 1, sizeof(buf) - 1);
> > +	if (ret < 0) {
> > +		dev_dbg(mhdp->dev, "couldn't pack HDR infoframe\n");
> > +		return;
> > +	}
> > +
> > +	buf[0] =3D 0;
> > +	cdns_hdmi_infoframe_set(mhdp, 3, sizeof(buf), buf,
> > +HDMI_INFOFRAME_TYPE_DRM); }
>=20
> This is another thing that was supposed to be handled by my current serie=
s
> here:
> https://lore.kernel.org/r/20240222-kms-hdmi-connector-state-v7-0-8f4af575=
f
> ce2@kernel.org

I will use the hdmi helper function hdmi_clear_infoframe() and hdmi_write_i=
nfoframe()
from Dmitry's patch in the next version.

>=20
> In particular, you're missing the SPD infoframes here.
>=20

I will add SPD support in the next version.

> > +static void cdns_hdmi_mode_set(struct cdns_mhdp8501_device *mhdp) {
>=20
> You should use atomic_enable here

Actually, this mode_set() function is called by atomic_enable(),
I will merge the function into atomic_enable() in the next version.=20

>=20
> > +	struct drm_display_mode *mode =3D &mhdp->mode;
> > +	union phy_configure_opts phy_cfg;
> > +	int ret;
> > +
> > +	/* video mode check */
> > +	if (mode->clock =3D=3D 0 || mode->hdisplay =3D=3D 0 || mode->vdisplay=
 =3D=3D 0)
> > +		return;
> > +
> > +	cdns_hdmi_lanes_config(mhdp);
> > +
> > +	phy_cfg.hdmi.pixel_clk_rate =3D mode->clock;
> > +	phy_cfg.hdmi.bpc =3D mhdp->video_info.bpc;
> > +	phy_cfg.hdmi.color_space =3D
> > +cdns_hdmi_colorspace(mhdp->video_info.color_fmt);
> > +
> > +	/* Mailbox protect for HDMI PHY access */
> > +	mutex_lock(&mhdp->mbox_mutex);
> > +	ret =3D phy_configure(mhdp->phy, &phy_cfg);
> > +	mutex_unlock(&mhdp->mbox_mutex);
> > +	if (ret) {
> > +		dev_err(mhdp->dev, "%s: phy_configure() failed: %d\n",
> > +			__func__, ret);
> > +		return;
> > +	}
> > +
> > +	cdns_hdmi_sink_config(mhdp);
> > +
> > +	ret =3D cdns_hdmi_ctrl_init(mhdp, mhdp->hdmi.hdmi_type);
> > +	if (ret < 0) {
> > +		dev_err(mhdp->dev, "%s, ret =3D %d\n", __func__, ret);
> > +		return;
> > +	}
> > +
> > +	/* Config GCP */
> > +	if (mhdp->video_info.bpc =3D=3D 8)
> > +		cdns_hdmi_disable_gcp(mhdp);
> > +	else
> > +		cdns_hdmi_enable_gcp(mhdp);
> > +
> > +	ret =3D cdns_hdmi_avi_info_set(mhdp, mode);
> > +	if (ret < 0) {
> > +		dev_err(mhdp->dev, "%s ret =3D %d\n", __func__, ret);
> > +		return;
> > +	}
> > +
> > +	/* vendor info frame is enabled only for HDMI1.4 4K mode */
> > +	cdns_hdmi_vendor_info_set(mhdp, mode);
> > +
> > +	cdns_hdmi_drm_info_set(mhdp);
> > +
> > +	ret =3D cdns_hdmi_mode_config(mhdp, mode, &mhdp->video_info);
> > +	if (ret < 0) {
> > +		dev_err(mhdp->dev, "CDN_API_HDMITX_SetVic_blocking ret
> =3D %d\n", ret);
> > +		return;
> > +	}
> > +}
> > +
> > +static int cdns_hdmi_bridge_attach(struct drm_bridge *bridge,
> > +				   enum drm_bridge_attach_flags flags) {
> > +	struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +
> > +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> > +		dev_err(mhdp->dev, "do not support creating a drm_connector\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static enum drm_mode_status
> > +cdns_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
> > +			    const struct drm_display_info *info,
> > +			    const struct drm_display_mode *mode) {
> > +	struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +	enum drm_mode_status mode_status =3D MODE_OK;
> > +	union phy_configure_opts phy_cfg;
> > +	int ret;
> > +
> > +	/* We don't support double-clocked and Interlaced modes */
> > +	if (mode->flags & DRM_MODE_FLAG_DBLCLK ||
> > +	    mode->flags & DRM_MODE_FLAG_INTERLACE)
> > +		return MODE_BAD;
> > +
> > +	/* MAX support pixel clock rate 594MHz */
> > +	if (mode->clock > 594000)
> > +		return MODE_CLOCK_HIGH;
> > +
> > +	if (mode->hdisplay > 3840)
> > +		return MODE_BAD_HVALUE;
> > +
> > +	if (mode->vdisplay > 2160)
> > +		return MODE_BAD_VVALUE;
> > +
> > +	/* Check modes supported by PHY */
> > +	phy_cfg.hdmi.pixel_clk_rate =3D mode->clock;
> > +
> > +	/* Mailbox protect for HDMI PHY access */
> > +	mutex_lock(&mhdp->mbox_mutex);
> > +	ret =3D phy_validate(mhdp->phy, PHY_MODE_HDMI, 0, &phy_cfg);
> > +	mutex_unlock(&mhdp->mbox_mutex);
> > +	if (ret < 0)
> > +		return MODE_CLOCK_RANGE;
> > +
> > +	return mode_status;
> > +}
>=20
> mode_valid is only called when the userspace asks for the current modes
> available on a connector, but not when the userspace programs a mode.
> This is atomic_check's job, so you probably want to have a similar
> atomic_check here.
>=20
atomic_check() and hdmi_tmds_char_rate_valid() will be added in the next ve=
rsion.


> > +static bool
> > +cdns_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
> > +			    const struct drm_display_mode *mode,
> > +			    struct drm_display_mode *adjusted_mode) {
> > +	struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +	struct video_info *video =3D &mhdp->video_info;
> > +
> > +	/* The only currently supported format */
> > +	video->bpc =3D 8;
> > +	video->color_fmt =3D DRM_COLOR_FORMAT_RGB444;
> > +
> > +	return true;
> > +}
>=20
> mode_fixup is deprecated. I guess you wanted to use reset here.
> Generally speaking, the bpc and color_format should be part of your state
> anyway.
>=20

mode_fixup() will be removed in the next version.

> I know Dmitry was interested in plugging my HDMI series into the bridge
> infrastructure. It would benefit your driver quite a lot I think, so you =
probably
> want to sync up with him.
>=20
Thanks, the driver will use the new HDMI helper functions that Dmitry added=
 in the patch
'make use of the HDMI connector infrastructure'.

B.R
Sandor

> Maxime
