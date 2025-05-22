Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF07AC137F
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 20:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D9610E746;
	Thu, 22 May 2025 18:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZEyBwIpD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010046.outbound.protection.outlook.com [52.101.228.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB0A10E746
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 18:40:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsNvbBZ4t25HphqU7vSEuO5QVuE/5e0hg7+ABIHnRENmcj0hxfL606ZChlZCIxUZgPt0xOfr7KlF7Dx4kOPCa7HSuHfiN52WmP1Rl848GBE4wFY0vcxnXb9gbdodQiPSvY9SGaQk9LpqVb19wEJGrmbMFUD8HJDrQyvTX0pA+0PYrLfnLqz0CnyA51e2HOsPztG4StLK1nAWSkoZSdb8vkf3b096YavrL5wlN7Votm/LQb3y/mMHbztU6i4Ez32bPTsELQQKYFUbWSVia6ryd/wyMxKpTS06aqfNJh+nSwoWUpHZcNdhsWoHoNqN4nWZ4cqNgOm8JQP+144Aj/IuNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1a2h57tFf2WyKC8eleeXkKcGZq2P8848JutLB1VpI5s=;
 b=XKCd3ILl/7oJzt7B+97qWxs8CGXQ4jCtZXaExsS9KPpIaMRsuM+xMorwKI7JT9Mm1PDpIbpUoPDpuTc/ycQs3KlaCZx8Edth7jwTXHshCiAhOBCS1vAnkhKybSIIh7sJknXxNEk+yBc2uDpIyT/4HWU5q+Hnod3jCFIt1mm3UBN5gBH/lZ4HUCMp1FzoumC7As/cnWJUPRPC9vmnFoLCsHcqjyUTBGRNsZ+8WtREK0LHt+vsx5muy5F5OmCTzu9jUI514v7aAuiWZ82Ybng2ObeqrI3wKxGQT1QUSigr94i3Rzavvqxc8XT8QQF7nIiwA5disu6/OK1LVqFqdhrDgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1a2h57tFf2WyKC8eleeXkKcGZq2P8848JutLB1VpI5s=;
 b=ZEyBwIpDA0XgQSOGPEaKpriHNU+6/KsjTSkvmtqKMkTBM+XJFZp6pe5tUUCTEYyrZYUgSwn0DvRnw530N1AOu2XTVxC/6+EN5gW25T3v4avf6EoLSIovzNF++3E5Eef1/4Q89QaCPJ13x7mT5GgRfC9PR2pSsgvU7pvD5Cz+XCY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB14541.jpnprd01.prod.outlook.com (2603:1096:604:388::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 18:40:29 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8769.021; Thu, 22 May 2025
 18:40:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 Chris Brandt <Chris.Brandt@renesas.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hugo
 Villeneuve <hvilleneuve@dimonoff.com>
Subject: RE: [PATCH v3 0/2] drm: rcar-du: rzg2l_mipi_dsi: add MIPI DSI command
 support
Thread-Topic: [PATCH v3 0/2] drm: rcar-du: rzg2l_mipi_dsi: add MIPI DSI
 command support
Thread-Index: AQHbyydT2d3anTEXM0CXN2vGc1WQM7Pe+rIw
Date: Thu, 22 May 2025 18:40:29 +0000
Message-ID: <TY3PR01MB113464412C75E0AC1928A4FBA8699A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250522143911.138077-1-hugo@hugovil.com>
In-Reply-To: <20250522143911.138077-1-hugo@hugovil.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB14541:EE_
x-ms-office365-filtering-correlation-id: 1894a0af-c592-4286-84cc-08dd99602062
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Z/HI9vL7gOodaxqXreCBnXyRZKGNnLwhVqen1D9EI3bAeJv4n9ZW8fGD67X+?=
 =?us-ascii?Q?se6SxrTupj8wRbhlzaVeG0nU1ACF53xhNMB38Jx47qDobmuYBWXYWOv+PBVZ?=
 =?us-ascii?Q?qGC7HTUyYZnI9wJK3i2oV6carzBKin5JMGhSDWYuwCcJbkJ7A1FSRKIjs/Tq?=
 =?us-ascii?Q?Ddtl8bCPUx0bhQZVZudSaqW98ArikfXgFIfVMszgx7u5pR5P1UXLGH7m2QNP?=
 =?us-ascii?Q?JclcBDf8CEisEZ88weWGSVP/qSl86rYuIG8eO7NuxFTSbiGGvYobwAZkW2bD?=
 =?us-ascii?Q?kUBU4QzrBG33L+6My/MuW08uzqBdbB1lZ/Xp7Fpex/19dgrtaW2zlWjmqYMS?=
 =?us-ascii?Q?u4WEN84IkTALUJRTWySXbU+iSS/6jswYSBcxLXpioVCRKgIu6bcuurKpQriT?=
 =?us-ascii?Q?WTCw4Beag+yxAkkrJaw+vt5EfwabgHj2acHPms46sXOCk7iU7nvtuKVOtPxw?=
 =?us-ascii?Q?w9QspCLQwJzfuCfgVSQJxKws/RWPz7zBgmCZ6gt444SA4xsD0kbTSjtoLCsD?=
 =?us-ascii?Q?aVYtZ/kaymiYilf+BOon7WCpMRMZzP72ZAI0SiHEuH5Qpvoh6M/QaAN+jWsB?=
 =?us-ascii?Q?U+1B9sQFgosU/97K/dQP3QoM8kAryIf6zeZWtq8AG5s3+kkuwC55xyOVZ/Wj?=
 =?us-ascii?Q?VpYcacAOiAXAzm1RMgx3Yzewrnrfxay4kP1j6w0Evgj7IdvE1dJiwzc67u+3?=
 =?us-ascii?Q?sikAr04cvgXU/1vwXqYdgGPm3GqMeegiS+6T05yl9LpcGBqhZnqM8lwgovDL?=
 =?us-ascii?Q?PbsTsgMKKjpc7kmlSQiTio6lfjK53EA+V5CBigKjE3W8srNVjALj6u7OJq0V?=
 =?us-ascii?Q?eVrN/KCrvLamEA4e73oDZud9WAWGUBuAuegfAJTFSTVVDNQp1tlH6FLT8CIO?=
 =?us-ascii?Q?4I/FaIfgyZzqxPal1xQsS3Y1KESuaHSH5ARCSUnTt1v8QbHv7zvTXi+27uXs?=
 =?us-ascii?Q?Wp10irLZf4S5y0l1A8TiNKW8Tr6OoLlzG6Zbmgra/2QmaFXbY5eybngLYb+b?=
 =?us-ascii?Q?vRNcLWsFaHQ9B7O2GwSKR8K+o5MDIVFn70nooa3CjKX6JmYyedGcU2mDG8wq?=
 =?us-ascii?Q?2K7fiqMxPK9cvABus3aHdsQ50wPxIRYSprZiFzkCSyJUR4est7CxHpD7i/Z7?=
 =?us-ascii?Q?Uo4y1e1OE0jH08QBGfA3KFUWEZFBuKssrPf7rD7EkHCFMLcKY5sASllEk6um?=
 =?us-ascii?Q?D1GJHFnPuZylfmWdH2bfAaLNxUlim/0uu35TZ9fe4m2uKiaxWZ2joU+Au165?=
 =?us-ascii?Q?I21GJ7K5rm3Zmqfyj57t+kFNyk1Pz61/WaNwfjgy/DnjdGxwAJ88XpreQJwT?=
 =?us-ascii?Q?Q4OJoBSjhB4fstqMeZb+Bo8eGOZ9QhjviwctQI1WMm5j7bCNxmhDWzcqUQEY?=
 =?us-ascii?Q?b2wz5nwCtt+rfMFfUxonz6nBViLJf6bsEp/W6YdtDrSfPF/iOKOaPYox+L9v?=
 =?us-ascii?Q?aoRP9e3tXil/USZ8KKKRxpgeOQASCVEC?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rTZhb+QehZI6hNwTQHUuYBmsl+gq9p87RCJne4may2dbHoFqa6kRbHUPs2OD?=
 =?us-ascii?Q?p2uGdREbMrOIN2qUlW/rrqiKJRtFq/c8MFNNV9p+P0XNR58EUEYhTPM6LeDH?=
 =?us-ascii?Q?tFOEtO68JTOalV/x/2D514VZWO9QLHoBMBxAEXGkwIjBglVSMFpSkJCZJzvt?=
 =?us-ascii?Q?JhozlYPw1WuLWS6qDZ07lYLNULVwwwBOaIZs+CvTXDU4f9HqYzxn25mpFDS3?=
 =?us-ascii?Q?SmyLh1GQdiYhL3BzwrS3t+50AW5qHPOGBL0KwMpxtDgSZ8WSMrQuFJkwKHCk?=
 =?us-ascii?Q?qyEIPxmfHpFq1m4ta5OJW+4AnR39dVBbzzowiR21Zsmvr+B6ATJ1+YNan0CZ?=
 =?us-ascii?Q?2bTVCQq8qj8IhBW9VjTI6FPiPGhP5LUS06j6Gc1GuKEkn1tmokN9D6fnZTPL?=
 =?us-ascii?Q?YWmLm7Q6PkLi8ic5CzLQpmYuXD9rQbQmF2reMc/d1OFPhSJceQfomv24EFeE?=
 =?us-ascii?Q?/0RIpiQX68jW4ymPb9NTSLM/ayxqsFohRb9etkgjAk3w7Q+1t7x3/HlXdaYe?=
 =?us-ascii?Q?l/2bQ92/Kni3Scz0fzcQb7AneQk9g0ppO7EJg9hgTA1SEwW6JHUi+OmxFc7E?=
 =?us-ascii?Q?ysOZXACaBc+6kbZNCwtefjgqxxEGCqerewJwR4XA5wGF/7Z/UnLRclxmV0FC?=
 =?us-ascii?Q?m7x6c9W3hqSP9Kda+lZDQkH0HT5IiOZKyL54cwShv3CIEqnLwBeDRBKnTOYZ?=
 =?us-ascii?Q?eigcdjAAjJv+2egrpp+oCrGF9VhzcP3V/Q77UYf159gjAx+PoGSUkKxxG+F6?=
 =?us-ascii?Q?CzyYcEqM0ra6WtF8Vwbc68muUX4ykruEpr3lA3ujFbPWlEVI3Hy45TMvRZ5t?=
 =?us-ascii?Q?qDfGAldtONjjNCFnaUgAbCa4eVR6m8GoaLJ7biKnZ1pY98+oJkkMSOmqEZZ3?=
 =?us-ascii?Q?ozv24P/ZWHT1Fm78RkmRfnUaesL7gDkodu6h6euScwvgKIlJPOaUZzyugg9E?=
 =?us-ascii?Q?CBUUWqfySS1v2dTmCiihTbffRi2mVJ4jIrxYjoHsXDbrr7i9UlxBbJPhjaSI?=
 =?us-ascii?Q?psBnw/S5Hls6w3l75u9NO6wnVVd9eGndGioU61/Zd8s7iEt6q/L+uuNB+Dan?=
 =?us-ascii?Q?jAr/hRw/+JnawjkpwxONsllv+FxXK498YTC55TEPhgnIZXN6p2z2+/zMOZG6?=
 =?us-ascii?Q?0HrmwijkEABoJhWlOjiyIMysWS+kostfhMjhgquOtZfIJ+bpIrlM7H6t9tj4?=
 =?us-ascii?Q?Zk4TXcV/kKvJy2WSiwthJx2RjY3edF7JPqUoZYsBTh9ZFCDt0onwZF2cxPIV?=
 =?us-ascii?Q?WBwc7ZReBh28er7HZF3LQrwQ9rs883Y9ydJqNDRRn8yQRnK9DkFjuH79f/0k?=
 =?us-ascii?Q?Qg25GbvDeAPWAvZ3Vra1SbBwq6/z/rXyQgk7/9gDDgrMy+T0S75pfGIfFm4A?=
 =?us-ascii?Q?9PbqgVPYP5ypaEqwAHTWQH5cmwVGz+gGA7BcABi8rDKGMN3BNYnpbUZX1xH1?=
 =?us-ascii?Q?xE7YZCJpNSNoNx8uFwabPxcTm676WDmbUBa6U8ZXo2Mk2TlWR1gb2UESBOTh?=
 =?us-ascii?Q?JFJIiPleB4mNMNvaOs8mgtqF4no4s57E0hzIkELBk2adyj0xxhcxUh+wMlcg?=
 =?us-ascii?Q?P7PYBqjpr4TsUGFF3g8hqDri9W3fWso5zmDqTITOXesmiUh5ufCT/FKvlwdB?=
 =?us-ascii?Q?2A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1894a0af-c592-4286-84cc-08dd99602062
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2025 18:40:29.5657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MqerU5SBWm7ktxSjbBu1crLTpksx7q3zvx64gUh+JunPiSKNqsIUnhfMsVcmpry+GXVRYTG6HdJxRGWRbSQFAxzzAGxhr5nNAUnakG7YqBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14541
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

Hi Hugo,

Thanks for the patch.

> -----Original Message-----
> From: Hugo Villeneuve <hugo@hugovil.com>
> Sent: 22 May 2025 15:39
> Subject: [PATCH v3 0/2] drm: rcar-du: rzg2l_mipi_dsi: add MIPI DSI comman=
d support
>=20
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>=20
> Hello,
> this patch series add support for sending MIPI DSI command packets to the=
 Renesas RZ/G2L MIPI DSI
> driver.
>=20
> Tested on a custom board with a SolidRun RZ/G2L SOM, with two different L=
CD panels using the jd9365da
> and st7703 drivers.
>=20
> Tested short and long writes.
>=20
> Tested read of 1 byte, 2 bytes and long reads.

I see tested-by tag for patch[1] and this patch series is conflict with tha=
t patch.

Can this patch series work without patch[1]? If yes, no issue.

Otherwise, you need to rebase your patch on top of [1] to avoid merge confl=
ict.


[1] https://lore.kernel.org/all/20250521210335.3149065-1-chris.brandt@renes=
as.com/

Cheers,
Biju

>=20
> Thank you.
>=20
> Link: [v1] https://lore.kernel.org/all/20250520164034.3453315-1-hugo@hugo=
vil.com
>=20
> Changes for V3:
> - No code change, resending after fixing mail server config resulting in
>   only cover letter being sent
>=20
> Changes for V2:
> - Change commit message prefix to "drm: renesas: rz-du: "
> - Reorder variables in rzg2l_mipi_dsi_read_response()
> - Remove unused macros
> - Add missing bitfield include (kernel test robot)
>=20
> Hugo Villeneuve (2):
>   drm: renesas: rz-du: Implement MIPI DSI host transfers
>   drm: renesas: rz-du: Set DCS maximum return packet size
>=20
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 186 ++++++++++++++++++
>  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  54 +++++
>  2 files changed, 240 insertions(+)
>=20
>=20
> base-commit: c4f8ac095fc91084108ec21117eb9c1fff64725d
> --
> 2.39.5

