Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037F89FC406
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 08:57:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A38C10E366;
	Wed, 25 Dec 2024 07:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="T7SSCBpI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2613::628])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAD410E366
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 07:56:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3n9n2CNctta4ApyR8LPSQoIvUC+7nw10M/+TRbRIiHHzh0YsmeSRkZVp53X/fG0fVMg/wuh1b+xyhuFNXvDsSofFkxKz43S+hnJyhMyFAFalTfOOszMUw66PPG76in6IDDZ3mVYW+nuykxIF3PhcMoX4Nwjr0BYSe9bsLsqNhzMHHCqvde4wi5TKmQ3vvkjHjopOZwB/whycE0epcsFFBdxDuTngJMy5+/25tvc7+eZf8gEegoMwIwQ9Jv8Pig2aD1+TXEMMDeRIPCDmP4y2w0sMvo5nj1rjLKYDG93s5DNQAsMHAugSDNzRlsk5aFoeQ4iVsdUkOLsqJ8omkE6ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rTNrP2+rLfZaSlW24TKkMEWv/Zq7shKmJp3470puas=;
 b=mvyUVevAntCoJPVce0+IhG+G2342+tuORmO01v8vNOVV5H9cPjkqBUhQVchBSMduE0KKngyOnnG4j2GrliJ+DjeE8S+x+ZhC1tMwFptC+jfAUheA6S7tPkZk8r1ZZe/lVXEsJVRvxie79BS5uWW1/N+G0BLFnKC+uMpc6altl9ejxH2xNZVQvzeNgglOFrS+Y6UZ63ry6QQCeEtcTZGNVLtEZDUPVy7ISswTGZaKmVzeF8edGfSqI1xFD9vcV+p0HABEv4cFjr72ooBAcpsYmeyhWkB6Bha0LwYHWExnxT9FhfbJTx97xFW+pEiRO5j98/IjEPpCvJ6GFAhSMkFtoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rTNrP2+rLfZaSlW24TKkMEWv/Zq7shKmJp3470puas=;
 b=T7SSCBpInPSlZmiDJxXU8fICDBkAZsV9uISF2bT+XPvYeusZY2E5s6Bc/IeH+2iXuJ8SPZFljR/wrghO3eMDFr+4jj0LlCcp/G1LvQXW7LpDnoW0vhsFpVI5oVKE2iJRl+IkeKXaJGNgf/oRH1qZTb1waEnfxoIYRsH1ziz9Zqp9QXOeNCvufuKkbKipoxA4YUvuDJgWLvjrUIv0UnFdB6wZCj2HB2V1a5PGpNZXmTlSgPFrwFqpqTzL9MG/MLl+keWYZPPdO4BWUuls/XBWJf949HhYVtIY43O//L0cNlrCMj+lcFv2z77EA2lA2zQ5rl/5DkHOQmhf8UYiBHhPig==
Received: from DB9PR04MB9452.eurprd04.prod.outlook.com (2603:10a6:10:367::13)
 by VI1PR04MB10026.eurprd04.prod.outlook.com (2603:10a6:800:1df::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Wed, 25 Dec
 2024 07:56:24 +0000
Received: from DB9PR04MB9452.eurprd04.prod.outlook.com
 ([fe80::4c69:3f0c:6701:a1cd]) by DB9PR04MB9452.eurprd04.prod.outlook.com
 ([fe80::4c69:3f0c:6701:a1cd%7]) with mapi id 15.20.8272.013; Wed, 25 Dec 2024
 07:56:24 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Maxime Ripard <mripard@kernel.org>
CC: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
 <linux-phy@lists.infradead.org>, "kernel@pengutronix.de"
 <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, Oliver Brown
 <oliver.brown@nxp.com>, "alexander.stein@ew.tq-group.com"
 <alexander.stein@ew.tq-group.com>, "sam@ravnborg.org" <sam@ravnborg.org>
Subject: RE: [EXT] Re: [PATCH v20 5/9] drm: bridge: Cadence: Add MHDP8501
 DP/HDMI driver
Thread-Topic: [EXT] Re: [PATCH v20 5/9] drm: bridge: Cadence: Add MHDP8501
 DP/HDMI driver
Thread-Index: AQHbUFBu3BvLbmor5UewCR/yRWHyfbLqFI+AgAkUPSA=
Date: Wed, 25 Dec 2024 07:56:24 +0000
Message-ID: <DB9PR04MB9452B7B53EC16CB1965973D2F40C2@DB9PR04MB9452.eurprd04.prod.outlook.com>
References: <cover.1734340233.git.Sandor.yu@nxp.com>
 <fbd12029fab1f60e2ba4fad75ef650298a59cb15.1734340233.git.Sandor.yu@nxp.com>
 <20241217-judicious-stereotyped-centipede-5ddb27@houat>
In-Reply-To: <20241217-judicious-stereotyped-centipede-5ddb27@houat>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB9452:EE_|VI1PR04MB10026:EE_
x-ms-office365-filtering-correlation-id: 0a0a6ea0-1e98-4926-24c0-08dd24b9a12a
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?1SjGWnoNSM5YCTd4qwpFPHc28WVfNSC/l5LFQtHST3eYmPw8LcPn1YMThVCF?=
 =?us-ascii?Q?XxRX/q3WTPxTthDqmjq/qs2wkwI1u5uKDitEABm+FLBM86/PdcW/bbP5VRyl?=
 =?us-ascii?Q?Rn1qeqPvjXYGz7XtD7uCmXNzGyHjHtye6CK9cut0WGhP61k/+iexw9HNPOmL?=
 =?us-ascii?Q?BUlpL4ZLRjm2uYSiqOZu0/weqohnueqFXXcBXXpuyWwTTPkaoZv9X8+prOt9?=
 =?us-ascii?Q?wv0GtWvpwRQ0V9itS2OxvsotYJO+M1t0Br3W38hGKTF1h5OQyYVBEBW0vQaq?=
 =?us-ascii?Q?1S7hyKI8Lhd5Lk3ZRUEzOLJ3h+6npzGAZOV4dhGs5SwjGZDb3tDz7kI08Am9?=
 =?us-ascii?Q?laYbIlltqaaGgkfVIwZD8wExHSvpz6sg2QxHCvmkmP0B8DhbJrSX/77E46Yj?=
 =?us-ascii?Q?csW7ivBarLXvJGe+qovUdFLvhgQFZolSZs+FehJ6dhqekB+UOM/wrDrD+kci?=
 =?us-ascii?Q?4iGtIJc6ozoyN8u4lS2KIt70QTZMjfPpy4v+JTO8w4s4wYZtio/kBsbIU4+M?=
 =?us-ascii?Q?HejVOC3Enyr1zYw9xEiLSbd/vg0LISfpjhmPXu59a1OVPJ07h6lh4ENnJYzO?=
 =?us-ascii?Q?QapLs0C/1w9e23lEH0rb+A2GCRbke052EX+UHU2mxRAoCvTE7KRZLojqvO7W?=
 =?us-ascii?Q?r4WXqOCntZIjSdrTlyR5HxTbwh+y2m6ytW+ChAjgiKwnvhYc+hV1gn51svZ3?=
 =?us-ascii?Q?Udhvqqk8saaJcUzxT1SeddB4tFfuZjLxO9r4puQdesK7QsLK/ljUSpQyyztn?=
 =?us-ascii?Q?cgArSw6i8D9Tsa1MnLr7G87nVYs1FuYOUXbpcSHOP3BRbEt/XiNj3V8mbxH+?=
 =?us-ascii?Q?VhYw1NNW77i46OMmt6Rp0wyt6s0AWrnYqhYblnmA+FAzxQFhcG7BT6KkO4y2?=
 =?us-ascii?Q?XBGUgLz0b/vblVNwV/vGcr0PqS+q24+rsRlKewU5WY5roT72F6YoRqSd4F7D?=
 =?us-ascii?Q?ftvfw6DxZ0sGXidDDTgZioJUeOKKCFEXSdzwDvX7alMJM3YeX4d2Hq44ILo3?=
 =?us-ascii?Q?3x2OShn//0mly73itF1cCM2BtFYIvI96teGMEebloz0WZqt+eNRSbrgTYc9/?=
 =?us-ascii?Q?3dZbS83td0pSxbpxnVr7+VtSoPPsp6/CULZEWWd5/W4W1SmQyloFw17Rxi65?=
 =?us-ascii?Q?gqpyov2dtcMZbO9USyukLgB9zBgvM+z+5OrDE6V3CHdmnKN/tPCRPKbO9G7n?=
 =?us-ascii?Q?DObEWuFJNhM0Ctp5nHcw9mDQC/i2aLkq7MuLzIvcixdub5VifXMLHt3zUw53?=
 =?us-ascii?Q?Dfk0KCeM5kbfmOF7MZnwMzvq9vlOvZpaIvW1TZ08QbgETxT+0sZ5zu3kfuZS?=
 =?us-ascii?Q?oTs0pxOxfXRpM6JP73XYoNEWdy9Nvg7DDCxM076GuA9fdh+s8LlSdtXYYV14?=
 =?us-ascii?Q?FW95+TTWmjKIIL95j6zyyx2n7mQbi5p1URkD621fV8xkLV0qN6PX535TOp6b?=
 =?us-ascii?Q?nRGpxyd8WeYXziwiuocF5/NTrqPzaq2u?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9452.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cZauYuae+XK2Fi5L4zPXLAX/nDCDFIGiE6fXpc4oHboj8uJmWO/UkyLs1fCW?=
 =?us-ascii?Q?WtMUbklADFNbblmn1z8NdZniMFVrLfkoPkGajUwU6Lzca67dQ5GKx3WuMLsj?=
 =?us-ascii?Q?S9VVvJjUfU2O8RFRnxEfOsUg/ZPR/PLGMkc3ODfW3ma72WV9H2D2s72VGtJh?=
 =?us-ascii?Q?O1rfX+sjw43o6TLGkihk0x1mOUtRFu1dJWwunYsOlDw35g7gRccVxm+O+jLA?=
 =?us-ascii?Q?0Ew6z4+c0hYXY4mNjYC79xBaZK0c6Hpm03GPwwUr0UZaXMozgLhVTZGoRow4?=
 =?us-ascii?Q?+9FKZLPveiEmHF2RRuqQ0CDwBqJAoE+5TYyvruU5mOBwl4wjQkKVq/ke7UCa?=
 =?us-ascii?Q?9BM/2t6Fp9xu7OnaYgIMThMP/K3IZCrTjufMNWpJv94lGJCz3VplgnR3rpeC?=
 =?us-ascii?Q?OnDISGBUQwMOnDgE6mxMCg2n1LXXdjWsuzdh8HTERbpBm5QY/ccqpWMlkeQD?=
 =?us-ascii?Q?J7gHhG4Kr6uvnwHa52gjaKbaiUakt3uLq0iSOHPidTezB7OCONOX9SQHfCkb?=
 =?us-ascii?Q?97NrP4Cp70vsy3zd9q/yfp6tzEW88CBw/w0JJeHqobf5bzVXi6DEYy1YKyRP?=
 =?us-ascii?Q?pFDMk8UHN+mvs5SQAKYcaHiOxXepW4hhEPHk865sh9BZVJ6rgPPEh1zJ97cz?=
 =?us-ascii?Q?kZrs8dv7Ey/qoDCKOTWnjxC7JK35XRdaQ4ROUo25S3/oMPhQPiSCITe0fYqP?=
 =?us-ascii?Q?8Lrby6aJBznC7NsEFa7nxGRMl4dpx+iJbVRKMuabIl7XfK5lC9CaBsS1kq/y?=
 =?us-ascii?Q?hW/cvX7hZqAwX8P9APu6f0PCPJaYfa30MVETT68v6RlObsq6kMWezt7me0er?=
 =?us-ascii?Q?BmY6sTNOM/De1dwdo11hjj7mpiniqz5GcQseyexc0lwOnlAMsgg2zHQ84H9B?=
 =?us-ascii?Q?B6/x1CuoW6WIRdUXv80esGew5a8PGVx9RRalFJc3Fsb65DauW+5SnhwKXFL8?=
 =?us-ascii?Q?Siin06Na7k30PlhHx0YIyubZKr8PkSR/Q+nIkLf660jsHGzWygTo9P25J9O4?=
 =?us-ascii?Q?UY1CRfGh29zqN48bX9t7hFVzz7qgTG/u36QibFuUkjkmYxCo9SkT/ngmL3rl?=
 =?us-ascii?Q?4THTyzAT0pj8ZxX3j6kFWFJpn4eSRRn9N/1xDyBSL7eIlaasiEKw/S2eb8q7?=
 =?us-ascii?Q?5gIIdiGJ+/Y1gZuyCmJcA6cCC2p+eHBgijKrENTD6j4W252J8yd6YEiPLP98?=
 =?us-ascii?Q?/Y+PuASc1BgVHuKYw0qcqzES24Ie4fWg2OxpZ7tiAnzKZ7+y9BnBkQe9kVD1?=
 =?us-ascii?Q?mv/w6s1JRKZBwTk+068KCT1aRiongxwt1DeB2ZFigUwSVMKhKEmwYqvxbyJY?=
 =?us-ascii?Q?Yy0/PuDIP16D1vD8HuKi7r6npBB6bLZIdvJdn3l9zA10vzgM3F8QkkZCetYr?=
 =?us-ascii?Q?KD6ef9w2eghuMSMc89N2gT+fRKncZORmVIaTCsRUAmDtNXa3cdThXD1pOnJD?=
 =?us-ascii?Q?M7liLuFwTcR/hvfD3qZN2QgbSoZbTcHfFsf7J6dkU9Ni5056P7QECqQcVc6N?=
 =?us-ascii?Q?L1mGVenSXuIUPVyUxwzjLzYOpwRSRAcDs601rfanrXZS4vgOHRdbfXOxC1Fi?=
 =?us-ascii?Q?qzawCVUSdoX9KLkZgfI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0a6ea0-1e98-4926-24c0-08dd24b9a12a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2024 07:56:24.7369 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Fxtg7snYQD134xb0Biy7PBJXyvQHfI3q2jwe0f/7CuvbzHTLctWoH5CJM8m/U5MIgPAYxThdrhmOkZKUz3czQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10026
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


> Hi,
>=20
> On Tue, Dec 17, 2024 at 02:51:47PM +0800, Sandor Yu wrote:
> > +static ssize_t firmware_version_show(struct device *dev,
> > +				     struct device_attribute *attr, char *buf); static
> struct
> > +device_attribute firmware_version =3D __ATTR_RO(firmware_version);
> > +
> > +ssize_t firmware_version_show(struct device *dev,
> > +			      struct device_attribute *attr, char *buf) {
> > +	struct cdns_mhdp8501_device *mhdp =3D dev_get_drvdata(dev);
> > +
> > +	u32 version =3D readl(mhdp->base.regs + VER_L) | readl(mhdp->base.reg=
s
> + VER_H) << 8;
> > +	u32 lib_version =3D readl(mhdp->base.regs + VER_LIB_L_ADDR) |
> > +			  readl(mhdp->base.regs + VER_LIB_H_ADDR) << 8;
> > +
> > +	return sprintf(buf, "FW version %d, Lib version %d\n", version,
> > +lib_version); }
> > +
> > +static void cdns_mhdp8501_create_device_files(struct
> > +cdns_mhdp8501_device *mhdp) {
> > +	if (device_create_file(mhdp->dev, &firmware_version)) {
> > +		DRM_ERROR("Unable to create firmware_version sysfs\n");
> > +		device_remove_file(mhdp->dev, &firmware_version);
> > +	}
> > +}
>=20
> sysfs files are part of the uABI, and need to be stable and documented.
>=20
> For these kind of things, you should use debugfs.

OK, thanks, I will change it.

Sandor

>=20
> Maxime
