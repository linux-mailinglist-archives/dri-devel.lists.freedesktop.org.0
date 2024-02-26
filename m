Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AA8866B3E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 08:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1262810EF0F;
	Mon, 26 Feb 2024 07:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="MXrX96vV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2080.outbound.protection.outlook.com [40.107.14.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2DF10EF0F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 07:45:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iw6bKH/CxTmOTJcIzgy3wBsdmtAigr8vTNrsW0Iv42/4w4bcSkEoXgB7HT8+mfQbRLt1JVzatZMaZJ/2Aa+TvibceQmcslt97Yb5UmgMyzlF+uhc6fuMrEDBJKtnYY1MOnA0Vt6SM2MGsWGcGexp7/5TOp6g/JiWBTxYTwQfLvKNB3/QFJYtL1ifGDrv3wzHMAee8zWQAJ3pTVy9XFCMpmO+Fg6mbgGQ0eDpku8984Dk0H3OrMvmdSQG47gNBG9fi2yeg/p7i5uQMPEgeo9fTCVKS09WOX6cv3DMU0wx4t9xTsi8C/PMqJG5i1X8y30y0aRh3YuQsSmj39mLH69aDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqV4JaQZRyEjQx9eoyp1JGrheVncQjWsZw3Y5y16quo=;
 b=S03SOcCRyWKkNw8VuPEks3cvJJhx3nfXTXolIsOzMlN5AgOba5+A+tUTo2rx5WaX0LHLYZEjYHcrxAhCUTeZPQASTuTlnFRhccOxfd8d4PK+1ejrzJnJURrdxrWskxFMSn05vxn57aqJ4RFoBqI3yt3vbzce9cvLe7qwdLpkVNBHOX9fa46gFAKOyZ33foKp0n/jlWwd84VvMY5lgYbIvtvL1yNLhwccsTuZercVaWKMEGHVUQLIg2E5rMMbulgGBMqDoXFY9fA6ka2FMb6LXimS0SyUl8KsiUEm14c5dxbmpY6eQPAt+h8JDz7gtQ+HDOXW7Co1biMaFJeY1ziXig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqV4JaQZRyEjQx9eoyp1JGrheVncQjWsZw3Y5y16quo=;
 b=MXrX96vVJ0RLe+pWcVtANQSYZ08ksNRk/Se8Krq0SUeT1pV4FjjZ9GtlHX2fz6RM9gkL+Gjxql2Sa4bbjjz94UvfEgS7MIyXzdgbgqHEibiCez44if99DLUuj2SVlJG7t3OsiGFBhgCcOAm6FhdHMB4jGlFMZQsyNpnhph64jNw=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM8PR04MB7731.eurprd04.prod.outlook.com (2603:10a6:20b:249::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.33; Mon, 26 Feb
 2024 07:45:25 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::6ab4:485b:3d5e:e0e6]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::6ab4:485b:3d5e:e0e6%7]) with mapi id 15.20.7316.034; Mon, 26 Feb 2024
 07:45:25 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Marek Vasut <marex@denx.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Fabio
 Estevam <festevam@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo
 <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Thomas Zimmermann
 <tzimmermann@suse.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v2] drm/lcdif: Do not disable clocks on already suspended
 hardware
Thread-Topic: [PATCH v2] drm/lcdif: Do not disable clocks on already suspended
 hardware
Thread-Index: AQHaaIWCoFsz0zqp4kCmgF4jAmAIsLEcPcAQ
Date: Mon, 26 Feb 2024 07:45:25 +0000
Message-ID: <AM7PR04MB70469590E3845F3B166C3F46985A2@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20240226072904.26861-1-marex@denx.de>
In-Reply-To: <20240226072904.26861-1-marex@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|AM8PR04MB7731:EE_
x-ms-office365-filtering-correlation-id: 22eae334-9a7f-4af3-08fd-08dc369ee4ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tg6slGt8PmDCEW5HMMPQ9txWrf4KwyiMDm1+8aTwv/JnHleGQ4noWBge51CkKfvaEK1LdtxARftU/biRSrP9qr4Re99CED9r5XrMzUP/d4mn5stc/UbS0rVMTSJlmRi17pap0Q3gbqCe8h8k6vUv7AJXXnC92OH9T8/KZ5a0+AA/ClPrfzlTzD27JOp9JkvlHRQKZQPw0Vu86jh3EGBaGaiVdt09rHAhCBGvkLc/INDGviQ/nkhVnAh03bsXM+BqjKOzsSD4OBAsaNlmhDBQ9oSPc4GXrVVwE3dSzf0DIDLQpBkWO9A9UI510+cm3zVOwCZsY19HNPmCY8SAAvA/5lxaP7P+Hzkigzj5xwyJzdk5jmKPih8XV0aBU9/3l9sDdRvtE2otEuyF9C85D/+zv0OILzYiDf3yFvKqfAFAuwycc+wchefJOpdLxh9gWQ1qkM1BQ7yHk1cz5nMxtVHH1t9WoqD5D06RkoEW8/Lk6fewNYrjfJ7s0CSvL9PU1P4Z2OkWEx9XyTvf/Wc4zWTlObsYks/LsUXoOU1NBsAwePh5ekd4lovboQuVjHjQ4o8j0QP8DlGTpXMdlhvNdw3YhFcWIABYA7NbaT3DssKx2MFJxYyDfDv29/wRIrFZAeSCN3+0TWDQC0Dwo/4SbaxqVRRnB8Nsasev5CnXboE3LV8sSHHTzoaxlC2AzPf4xIz9g5N9hu3dcabTMQtF3gXUNN2vWHtbPJZKflGRF9Ca4jU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/EIm6VPh0YXwU1tmSU8zv3R2GW3KhzLvPuzyjwuk/3nnX6fULJt45Jep3604?=
 =?us-ascii?Q?hb87+muWGdOP82aqHFTpyVh3UiwkxYQTPjv7tL7kTQY93QrAKqh9jtpp66h7?=
 =?us-ascii?Q?nAaaMx6HNXBkgBvJMiwYDcMfQiqMIpadM7HsJRFeYYp27T19w2uAhrG+53sr?=
 =?us-ascii?Q?yBmbPTpAqm6DhDJSjfFU4A+x6KReVqTVwHpJSiCvwESe2qs9lJgsY8L76SRx?=
 =?us-ascii?Q?oKyvKC1C0DnXA1alFquXYHozk+LLrkznMbAFmE4oXwtvCY0kK6rJQ5HTQ68i?=
 =?us-ascii?Q?7Rq6jRsmm2V2B9/d1+9PSKD+heE6oSyxqd73+ZfT6up4TmJEYqY5jrQeFYi4?=
 =?us-ascii?Q?XsGfSO+NovamO7AMgSUFJCuInnsBeIpkM2quogWpiFHY8DUUfsYR3sH32sjC?=
 =?us-ascii?Q?Qk0AO3FOD9Sfq+w6J5qIrQkpgsAXn9OCkUA3YzGq0KUfZ6i7NkiBkCehzAZL?=
 =?us-ascii?Q?BwtBT0rfnu19lcE/bPjSDa1PFF8U/MYW6/FEKU1D7snw1hw+RseRYIWgiSFL?=
 =?us-ascii?Q?OQEofmqMUBT43/qC2dl20CDktltKF/ouxy1FJGegKy7EBGv1nnNALNDFg72/?=
 =?us-ascii?Q?ze01tMBS7iPYk84WofHk7AauR9wdpy/avovz5Z8vNlPklGw+bAwNCBxGKc2G?=
 =?us-ascii?Q?0rWg+BjCU2HF/WELBikZ4CjSUltWAnQvW1UH1EEINuKYwnq+bfJpy0ajDcUX?=
 =?us-ascii?Q?LjUCi+X5TqRk3KHhrL+kwEaL/4izP/AFyMERECfgr2d3UA8oeVYjJ3ZVnOZB?=
 =?us-ascii?Q?c/Nr14KH7vFOM8W4CxiNHZdEMsOl0b7KDB/7S/BhwHIHTU9iurDmt/ZcDbcY?=
 =?us-ascii?Q?FOkEei8LuiXG2Ik3vPTM4nbvDVQfRp6rS9tqlDAUkSxjKFfv7amENDzx13kw?=
 =?us-ascii?Q?qVxS6OSM4YCY6d1deXxAQWki2pMLkE8s4iTv02AZyJtC3hcgsSmvzKaGYy5a?=
 =?us-ascii?Q?zlHgsyixbo2BRP4De8ffXtRb1oWODX7vcjzxOrNzBr/4RypAVyKUpjLjUoxk?=
 =?us-ascii?Q?YvEH0BhabNpZftzAhW6bUuFbmQcf1HJrxr3qC2lhxzrKLiPOTH7UqwwBa/Dv?=
 =?us-ascii?Q?WCzHPz8qtWxgGpE34aBO80DrUSvTEYTwmA7V3Ip7EZ1E8cqFJW5ccwR/eQpK?=
 =?us-ascii?Q?j5TIlkRmwdEmt38gu2NfGBYMoqS/018mgqt5IJGQr1kxDr4GmVQ1M12Ujs65?=
 =?us-ascii?Q?YQO8pter2yf3sEZyGq0S5QKLpAGjw8ozY3w7LY2sJhLSTvX/WnqfZDcHr0yE?=
 =?us-ascii?Q?kujrIytc58qJPJoMp59z8jniMPZyVnqHOAmzlLpQTvNckYFRVy4CkzAsO9fm?=
 =?us-ascii?Q?cA+BzdalmjnLfO6nrQrxs5Jo2CYHw5BTlfn1vs14uudwfCuN/4jtWkUd815W?=
 =?us-ascii?Q?9v8k1EhVS2cbzRS4Xq9lpiOdlNwFNIOWZ1NYIeDPEZrXCRCBlAah3fiKs6Ko?=
 =?us-ascii?Q?83PZLVBkyv9TXc0bNlqVizho9plTAwyuCZgYjNjwobBNvyaBXNCbS0tsp6wq?=
 =?us-ascii?Q?EFb5SuPylsNI2+vpxqGSJ2FomTayJ+0PM58Zp3sxkegh6EBT/d4HXaUPD/gz?=
 =?us-ascii?Q?OSj6Tu71TsuDfGv2CQs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22eae334-9a7f-4af3-08fd-08dc369ee4ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2024 07:45:25.3188 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4idOwUvqQINdpgI7it4yVQTxy4DqLSK88yNm+2uKS2mxBlgQIBDkKM8twDUEsqsfUT//9yTzieu0jgj4p0T23g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7731
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

On Monday, February 26, 2024 3:28 PM, Marek Vasut <marex@denx.de> wrote:
> 0, and would trigger a warning from clocks core about this condition.

s/clocks/clock/

Liu Ying
