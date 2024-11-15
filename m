Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 466EA9CDC58
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 11:19:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0F310E84D;
	Fri, 15 Nov 2024 10:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="KotL9glM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2050.outbound.protection.outlook.com [40.107.249.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A76C10E051
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 10:19:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=geC1oO9Vi2/mY3yu2tUbXZ0sOLQLeJwW0ycofGfsBn19JSRQCg2M8N4DD1gvfNDiINL2PFLk9zQo/UKny4MIcy2wL5n3mX1XbiTw2sBgL+dOnXbKfRF0tE7KmPYGdDbUuaRxS92MTk6bzHxQeho19aFILYHTOr04ZJsSYaFs90FPUeZ7VhqXCKSyP1aGdKESb3tGzreWKPwxbI+Pe29qxhw95vMoVSfNSfYPaXbC8Bd1wOTRiztGyi0KxKIZHWuF906AwzEJSkaWuTbwoA1mU+gVjielt9HwREvCktVyn8tJsT6FtWL52zCSeaSwu9+UE0e8y2X+1RjYpFGH3WodMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJLnBT8DMPQ+CTicnTqVsU++jGsuIuNXIpGjZS+mOcs=;
 b=Z1IjDjaMBqF1h0Z8HYhvtsXVK+CKBO29Spx7yV8WqkLVXPrZ0KAhu+RT2dSrCVHjATQxI5ck/Ot86KgP26cb67qUtPMVosel/HALQEB+l/eJnX/VFJDdjxcrdInwxRYEkwIvj7fx8xmgh2+YZRfBQicJRMoHZPyLK3unGCZREa0FnP2gLDAxNhkGh+gZkOQ4uvm1iLr99NotVjth6OO/T7Nlh7/76OzWe487mYD8jJSrdIp/B8AIilLaDjoAQXof0v3IhAD0HeeB+ouAgljL/ev/p7ieS7zGz+l+Mb++u7Lr/l87wf/eAvvTs8jOfOloVW8mC5vhz+cvcmtByWT1Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJLnBT8DMPQ+CTicnTqVsU++jGsuIuNXIpGjZS+mOcs=;
 b=KotL9glMjQ5esszmWa5RWPqoj3D9T88r8VfZYmuQbs6OpV9dqt4r5UerH8AE+lSc7EMPJP0kLHCWJn2/lwgqPO1F3iiwdGounMluSccXexSdQX8A4chjML8QI2reQdObaJWt45E7KusvaFd7VWG2OHKu7yVMGoX4tMHsxQ8lpcA6eB4ibms5S/nj45zmkOf3lWcoJ+5v5HKbjzTekaBlMEy/kqCAKvi80PKwi/+QZaCxJhI9+jVdsNmPCI0p0Zi32m36wW9sFGuKPjetX8CwYWMo0iaT9V5GtqY6U8pss4hwnRODNV1qZsKlDOpFR0qtcVSONOpO9IzTC/AKIjxYcA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS4PR04MB9508.eurprd04.prod.outlook.com (2603:10a6:20b:4cb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 10:19:00 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 10:19:00 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Ying Liu <victor.liu@nxp.com>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "catalin.marinas@arm.com"
 <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
 "abelvesa@kernel.org" <abelvesa@kernel.org>, "mturquette@baylibre.com"
 <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org"
 <rfoss@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "marex@denx.de" <marex@denx.de>
Subject: RE: [PATCH v7 2/7] Revert "clk: imx: clk-imx8mp: Allow media_disp
 pixel clock reconfigure parent rate"
Thread-Topic: [PATCH v7 2/7] Revert "clk: imx: clk-imx8mp: Allow media_disp
 pixel clock reconfigure parent rate"
Thread-Index: AQHbNmKPsdMS3GH44ka1InYw8jGl+LK4IqkA
Date: Fri, 15 Nov 2024 10:19:00 +0000
Message-ID: <PAXPR04MB8459C6337B096C4326547CD888242@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20241114065759.3341908-1-victor.liu@nxp.com>
 <20241114065759.3341908-3-victor.liu@nxp.com>
In-Reply-To: <20241114065759.3341908-3-victor.liu@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS4PR04MB9508:EE_
x-ms-office365-filtering-correlation-id: 99d527c6-760a-4c8e-97e0-08dd055eec79
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?1nOHs0+fhTALFybSWZrAfOJc19VN+8+XH7cVRqCrG1K6zBXBUkFSyy78W0jb?=
 =?us-ascii?Q?PPpP1UqFXQJsaPWx3Dpa7AMoskDym4eQtpbFBt3FGfXuDE+h9vNHFlq1M42M?=
 =?us-ascii?Q?+DHHFDitnXr6uC9//dIJoVFYuJtA3ngMsF80f0FH/YEahoQOCnXJm/gxO40q?=
 =?us-ascii?Q?fI84Q2eDNCLzVSc2sS4FfjqXs2HDFFb6VXHlboOK/uWJ87waO3ULQWrX0j1J?=
 =?us-ascii?Q?9HyeUErVoSbhAumPi/TGSKY0phZ1hX7XKfIHLwiL5PNq8hl+Ifa9Vgqsbc6g?=
 =?us-ascii?Q?izIiT0janVcrlNffJkAkawsa4soii6GSwXnYZfe4ZDw1ehSdn1fxOL3e4fJp?=
 =?us-ascii?Q?sznxbHN3wBheo5UDAwR9hbFIh//JYOoTZ8SHJGg2NubtMasJXyXfP3LhHYLg?=
 =?us-ascii?Q?lm7LTEE3FkNB6/pk2m3E/VBvnOc3hhiRgK2pSsQM4UqN/6RyM7ISa8hX/jDX?=
 =?us-ascii?Q?RzarnzhvLzEJbMOfK/dkTMBAK3K1fgBcQZMBlMOpE3iRQ3+gGJifmKOsxndi?=
 =?us-ascii?Q?O8GVYHuWPNozFALgURJ+NqOBGHPu59v32ECY3yXCK7cyTqWkGPMXn1iaRVMF?=
 =?us-ascii?Q?TFVJZInYspsfDBHw4oU8iYkB9ew0Ct3GBYT6auWHa+1ZJWNoFBlddQVKDC8L?=
 =?us-ascii?Q?/OOfFXo2f+0A55hNeP4WLoXu0ySXKSOj/AXm9bPuf6u6HUsBztyOqJVeXiVF?=
 =?us-ascii?Q?BtKbg2NwIB5Ly5cnvj7wCkih66BD50gxXOl+IEsDayr/YvHB5py1X46OD5mN?=
 =?us-ascii?Q?hoV0Lypsbxvz/Fk7JbnGWUb2Ku3Ld8/CysdaxQPcQFtF/7fCwDsLa9gy1GOa?=
 =?us-ascii?Q?mBbJWn8TG6Wu2tiNK+eQcmeCjhfZ9K/QJOVQmtJrh4f0K159l+iQBG6rfM/W?=
 =?us-ascii?Q?ExFT1J7pNkqcSDo2htk8HVc2vaon5LO3oX7Y4HCEmuUYPJQYkqpgM/I2V/yE?=
 =?us-ascii?Q?iIz7gYhYO53ZOYhro8T9vJpQMsPde2WD3htp0zohtZuJi7sUjall1VzzqByn?=
 =?us-ascii?Q?6m58WbW8m+5yYOc+g8QkLUUjjsmtjbHVuGNe41lcvDpixPHyXVC6MTDTyiGG?=
 =?us-ascii?Q?qA/xXSLEN/crqbwPIvNKIjZZdkVltI/KxXapkGK+LlwvEnufQ3lm6VMYSyxF?=
 =?us-ascii?Q?ze6fpQGUYlDtcPOL4M4b93JRvXtN6I5qGC53kYvf1OZMqJYryB3tWdo4uBZh?=
 =?us-ascii?Q?IkGKAEDm1nzQ4wsck2aEu48lWNDPesJbsHaINXswY7MjJqWYi9RmvWRLmgKs?=
 =?us-ascii?Q?BAUY457uSkLBLzTSdpkAQRJGvztU0wOkftXAJ6/KYKfhqE/W57xRE6oz9Usp?=
 =?us-ascii?Q?Tn/n9Uk+6WQbKHbt5iMoILTa/8qAmd8pz7oLZkjrCppcs/BKu0ZKg42s7Jtr?=
 =?us-ascii?Q?R+aAC4M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?St2eCZQh8sWaz6d/zls0haG7qGojsUFUictFqVXqFek/xSYI3lwaq8eceq9E?=
 =?us-ascii?Q?U5prwMFkQSOiywqYqrqxevyNA+fKO6w73bkHzeNUcz1hIQQG67BnfomC61Sx?=
 =?us-ascii?Q?oVwyg2kVTm/2VcCfcnyW9gNpnfwzEFI+K03+2hZURuoesIlU8gPDJ4/q/JTi?=
 =?us-ascii?Q?jp33lpt5s981BSyhPWWxMsQpBJ1rLb+aulJP13bYr1a8eJ99kuOPhcGR94vd?=
 =?us-ascii?Q?aOSJoGUVyex6wTHdTdSWlcm32aee0fn6LNVRA+5HeE9iAC4vIGGbm5ogEhev?=
 =?us-ascii?Q?JP1o4mjfYB2TOunkbtmZhOzVaV7ajGt420cQxio1KWvs8igYpYwDr8lJl78o?=
 =?us-ascii?Q?2wn5m14vusVdUkFAWnuFD0Kdh5VgcF6G+cyX7S9GO8jN89RSxLo/Oy0YGkbS?=
 =?us-ascii?Q?zSKVBJYYulq6IvbQkUVXJDlhRc3NuO4DIDuM9AcQNqxeQjRute/iALzaWC/V?=
 =?us-ascii?Q?jyVlHLw3YLqWSMDkhuMHIkVWm3tyAHMrCUK7kdfrACAQGk+jtUePGcouOiKg?=
 =?us-ascii?Q?YbFnhAJRPl8Aqov49BmicF4hnRTamQaQ1m6GDYMMY+wEGwT5ZPAjVWQjwzYZ?=
 =?us-ascii?Q?Oyec7DkIPqK8gT3ZEo2Yqokkd453Jk8EPWYgcVOgu5XeU9aT7upKrtF1rZCK?=
 =?us-ascii?Q?PORPiAzcSFf0h0Nc0Tz+X6JN+don3q5D+RbrzptSLYXsDWcxAtshHFQHyax6?=
 =?us-ascii?Q?KVpGiVa6LWYGEhb75HcoI2Y7Z/dg00fQm1685z95mUY3Kwnm1j2LxGIyZLEs?=
 =?us-ascii?Q?/kiqgt7Gu++cDIk19b8lY5o+6vYzSg4RTk1h/OSku3bOeKYES9YIkEsEXkDl?=
 =?us-ascii?Q?OvZByltLzoXEDqNtlhQJ4sv2vlNDCf0IZwIv16/a9kBx3FuQ8HrcCfwSxRWC?=
 =?us-ascii?Q?xv6bdJLiE6Uspq1Pm65EewfQnbXO86g2uOJOrUn+1A1h6T+hYT7xY3lbMrq8?=
 =?us-ascii?Q?APmW6DIutDK5boV/NHjKOLAGEhH7AAdsdgXB7zZbNZCrJCzXuPbqYmwlYgRp?=
 =?us-ascii?Q?XtA+Ia4WYaj3DDfdAqHxwdNmULmDYY6axpXXkjZ8Pt3THpIxsCIcGz+VKZR1?=
 =?us-ascii?Q?ht92eExzd2Po+oBCZMA6VslHbXWWX4/RR8FArudgHSatsEq2TxPePhvI4i13?=
 =?us-ascii?Q?ZgZVAnD0nWsy9sYG3RpBIx5Z9eBkDSDAhaBr7eIaeG+Ygm8/ehr2wp4cARqm?=
 =?us-ascii?Q?Xt2JHKoROdr4qwVNNojzihBb1bkFmZ6Dldt/KcSsa6Ey0zO9ukLIgkDFqbVN?=
 =?us-ascii?Q?xAhfgE22cJoY9sehBvvVARp7KtREZ0A4Ax2bNTPtIk8iSIIQnZ5oYt2CIND+?=
 =?us-ascii?Q?lAal3FfphauY3SDmgVUR6R6LloxlCze/ES6Bj5/fN82ke4CWNeb41hR9AzkD?=
 =?us-ascii?Q?txeH/oX0KP69jSov1MGRT2Cm5i5vdKOQ14bnBJo8Cle2vO3synOOoDujGPXY?=
 =?us-ascii?Q?IhXCnHSBkrJq52M/5+0b39teJ63XPSuxFuu8oBE9+QQi9D5lFLp+tDx4gImj?=
 =?us-ascii?Q?C7pzq4+bqJ3FYa1loybe4Ne5vtkv3U6/hS/SUdFzaPV3MrzK3nQ6avMhNSeE?=
 =?us-ascii?Q?KSwHyQsEoJGaJ7CDsik=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d527c6-760a-4c8e-97e0-08dd055eec79
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2024 10:19:00.8799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: utDYT26WAieS8JcLRGvvWFUtCXNmBfFXpPU1ZQE9uNDL+SHif0inaiiFrWKoPYHHohPdpBNIiWwnCZG1h2FjDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9508
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

> Subject: [PATCH v7 2/7] Revert "clk: imx: clk-imx8mp: Allow
> media_disp pixel clock reconfigure parent rate"
>=20
> This reverts commit ff06ea04e4cf3ba2f025024776e83bfbdfa05155.
>=20
> media_disp1_pix clock is the pixel clock of the first i.MX8MP LCDIFv3
> display controller, while media_disp2_pix clock is the pixel clock of the
> second i.MX8MP LCDIFv3 display controller.  The two display
> controllers connect with Samsung MIPI DSI controller and LVDS Display
> Bridge(LDB) respectively.  Since the two display controllers are driven
> by separate DRM driver instances and the two pixel clocks may be
> derived from the same video_pll1_out clock(sys_pll3_out clock could
> be already used to derive audio_axi clock), there is no way to negotiate
> a dynamically changeable video_pll1_out clock rate to satisfy both of
> the two display controllers.  In this case, the only solution to drive
> them with the single video_pll1_out clock is to assign a
> sensible/unchangeable clock rate for video_pll1_out clock.  Thus, there
> is no need to set the CLK_SET_RATE_PARENT flag for
> media_disp{1,2}_pix clocks, drop it then.
>=20
> Fixes: ff06ea04e4cf ("clk: imx: clk-imx8mp: Allow media_disp pixel
> clock reconfigure parent rate")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---

Acked-by: Peng Fan <peng.fan@nxp.com>
