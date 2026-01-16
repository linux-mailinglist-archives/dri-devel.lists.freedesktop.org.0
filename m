Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D01AAD2D892
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 08:54:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E798410E1A8;
	Fri, 16 Jan 2026 07:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="YgA10Uf3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011061.outbound.protection.outlook.com [52.101.125.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2F710E1A8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:54:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VUctp+hCWtWExvWIMHLm7wvk70HGOQf1S+gQSrXMXMSHmQLUt5iSjHpZDkEhmgse5HyszWiktnNtenlTPJB0PyWTLw9TAzFdeC6x07wkq+CXk/AXhPcMIJwiuHcvNMCmdUFPbYRPWIUGB09/QNWMY9eSsBHlNHrvetX/F9LI/YRD7SIgdVaZ2El8qOoxvJD6lWNMLJjWi//QH7RXeYEs6f0b5ri9XH2pL7MiQhsBNk5kHpIeiNfj27pMlCw0LumLJaxEuZ8NDySlaji5oQuZ+DCgVUc0nsxThb78evXONIqiHQ5zMI+x6/nI3N3J2G01oW5aYwJdyCOe6j4F4OpiiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DrKi4Y6WFrA6WazCPfG2VMBF0qWnv+unjkDtfPhMmA=;
 b=tjHNVo6+FiaMqN5IvSx/N1z2UnGuHskD36m5m1PMPkbHT+FVTfvzD4ICUMnb0pbHuSbz0SeYzrRbk9q4+3tFuZ0ef2XR1fFIsOvIPkCXTgHysDoalXHLUBty0qHe4LWIT1ZGYh45x8IbAc6U+ZJeOLSeRq10tyYfJELrWVj72XIfH9lnLBZDl6shbi76aZ6sOhG2W8+yldfvaq7UE6TzvmLmz73RYdSVvakeX/DfU6J4huZkCOXTL/J9CERe9ffSG0vbODt+mU0ii3sWHF5e8qS4+QPvlp9b7P6jUT4MRTWcXrTV+tAAO9z7uSuGJom86guKahB5qKYoVzahW0oZzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DrKi4Y6WFrA6WazCPfG2VMBF0qWnv+unjkDtfPhMmA=;
 b=YgA10Uf3dWOgN/BPPZdbVqCtCBwZUaM/6J8Rkf7Bd6FdmvTvm6yArYMwUHX7HDv+wsE4x3DK0+TDyTbl6luFrhhsqmUA4vHkHYPFcfLtGcQBuVZvg9/m0FRYIuFTYIC/xf4SBnK54EHf62ks/6NjoqKiSlzgtfMjvodkHZmJt9E=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB6794.jpnprd01.prod.outlook.com (2603:1096:400:cd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 07:54:48 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 07:54:48 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm: renesas: rz-du: mipi_dsi: fix kernel panic when
 rebooting for some panels
Thread-Topic: [PATCH] drm: renesas: rz-du: mipi_dsi: fix kernel panic when
 rebooting for some panels
Thread-Index: AQHcg9pRFBCIPGLnxU6ZGk2qBR3uvbVUcoww
Date: Fri, 16 Jan 2026 07:54:48 +0000
Message-ID: <TY3PR01MB11346A22C0CF2CB5A9C45B8EC868DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260112154333.655352-1-hugo@hugovil.com>
In-Reply-To: <20260112154333.655352-1-hugo@hugovil.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB6794:EE_
x-ms-office365-filtering-correlation-id: 113e76dd-9237-4df8-ade3-08de54d4857f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?saPDBi/OAs6+Cz7fhbFgQ9ah7bbFfEBgS2BeQE7AYoX3L0rSklwGxPOPcx3W?=
 =?us-ascii?Q?qTUp4x3U97Tje5FbtwIjtMsVs7BioDG8InFh/74AEnuW6TwiNKfbqW6RmnWC?=
 =?us-ascii?Q?x5axUpbRbdWuZ4V/1biZaQiRUbyyeYURIhuSy41F7kbnSKlpyM3w6cFXFJqq?=
 =?us-ascii?Q?7GldbHohaYxS9aHFqk+OcN5COthciAzWyIbKQTXYjTOnzrUSa/t718vCPFVw?=
 =?us-ascii?Q?23IPibMltw/kBxstfaZ2zM7o7jYnbfjN5imgC56YcnNFAu/viy7ftyySlWks?=
 =?us-ascii?Q?24yCyjU6fvO6dzUNeTsNQjUhblKaEKJpL635BWR2UlhuebT9SM0hqYr9zBTx?=
 =?us-ascii?Q?NVrBG+3+kEROZ19SVQtrEQWJfcg1GhllOMFgqwweW3bVwIEXJTbemSMcE/wC?=
 =?us-ascii?Q?4JQ47DzpiCbBJnGe9Ds4tzuhoAMWlucKiaeDq1epZ8qCRbCQhIWLj0lxWyPl?=
 =?us-ascii?Q?ATbFZiX7c2zUtm1Fa0l73Yog4AhYgHt2MqZ3SkJ53x/FHvXAEYbeEz4ZOtGJ?=
 =?us-ascii?Q?gnzSTaJmYiLsPGvZHfkaq0I2IJoQxWx2KiNW5HJ6fkmLkkDXFJ2TD1b/pQnG?=
 =?us-ascii?Q?Lz6zzq6cfz9gF+ii7+AO/k+mE6MIZDx5vE/d/GhLfRa1qex7xUAuWIkYQhAn?=
 =?us-ascii?Q?ZZ/++sXWOWlCT6jURAwtqCXBCBWScYx9sJlbDNJnfzf6o0uaKW9o2U/SwlN6?=
 =?us-ascii?Q?okzj6FFkjddjVAxIGLrTn1Zor06JgR0k7BYPR0rUNSE1sO8ANM8yGUgdf6+L?=
 =?us-ascii?Q?T553IUAQvoJQKcA7SQyRi+fwxvSt9zEVDoPTQOfx0CP+13nwgDNom5a3Cz7m?=
 =?us-ascii?Q?TWmGiYjaounhifonjYJoIZopPhdb4JZiiaHKTh/Zo/mkj+ECYq7R3/b3KsrY?=
 =?us-ascii?Q?8BhAo27Ve1p4ZSVfm9W8srhfoXzPGwrAxkjNzH+YTJRgrMI0PA9pf3L6iOad?=
 =?us-ascii?Q?C0l2hSW0tsfDbX6pKBdI1jPVoIF1AbqPB+sl63jHy3Ngz1cpMccvnkibMssx?=
 =?us-ascii?Q?bJkBM8a00Tj4WVqpTp5j6hzPRhStgcLbi26+3PzHkXrkJXlM9lMXQK2z/8eK?=
 =?us-ascii?Q?amL8WPabGcGOfnOA7oOLWWMExiNIDn6TS48+CcYv/yWDfQRa1AFWEtPusa8J?=
 =?us-ascii?Q?C0pYA1Jif5aZm3IK8+0a0Llt6ljWidtffUFXcZwXACrK3jIgTBQ2u8nz3LwQ?=
 =?us-ascii?Q?sAbaL7FWN0wAeogBvzTmksDOHEk6d8ZtwSZueavcurV9obXec6rsHfRX/t3N?=
 =?us-ascii?Q?F5p2zBLDlJP08jaUH66bVa8i1YzwzHWoY3ZpMBx9J3FJyTry9RzyT25tPLMx?=
 =?us-ascii?Q?s4EIDaoH+dsIf5fQk877ALLy9JKDRPYZJcnQMsK1xiOtyphi3hVk5AJFloDI?=
 =?us-ascii?Q?e8z5Eq+QjTVRIWHNL2pL+dhxfZc9Me61uEUlpjY1XLtARplRD95IAr8jIEt6?=
 =?us-ascii?Q?CXrEn4dj2P7fkdrxUsEYf4bOtYbPNPfKFU/j8GZxpJmrAAqSbOJNCZbq65FJ?=
 =?us-ascii?Q?mXx4dtNeEMSonRKXhUpVtNecx3KznhC6dl9KxbZsdDUCSkVMlxnhpANma8t5?=
 =?us-ascii?Q?ZMyQuogUwljSfyDPsyySoVgEDoGrPafGlVTd3OLHWjlQfudPfpg3M9VGVY6O?=
 =?us-ascii?Q?U0PqfLXfCLquusBO++RrYEs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RmS3uUz6I1MR7/Sx1BSxXBiApZFxvbx6DFTVyJuQFhzpqQNNKvybR7dpvia6?=
 =?us-ascii?Q?Fb7xvAuUszXMdz3VyelF2jHl6brYUk2qSSkvcx5VgtVVD7NvixS6QPCS7JHY?=
 =?us-ascii?Q?2W46u48/pAwJxRUregPVMLkbswPGSOnC1SahZJh09V20v8oZevK59hIaN6zU?=
 =?us-ascii?Q?BCpO6tKIxhQhh/m++Nnqtihz+kHnMQZRhPBbOATyDFimZ3hfAvd8UAtWTHRe?=
 =?us-ascii?Q?ymZA1whl4dkFrGdH34KaG3bEV3QpFptEY0GvFlrit5jqvAxPItzoPFitLVRL?=
 =?us-ascii?Q?u/MCSEsp7BTFe7MiXKvgFfKJA82LhhKJYFaJAwc1j3B3LSUMMIZSCyrtwLPM?=
 =?us-ascii?Q?YNhdJ4SoE9Xu3rFM9gFwcZJum1+G86E6z0oarU2VSG/xTe2YVs9f21Ei2u3M?=
 =?us-ascii?Q?sfDWtHDVRunLIljcw+0EeUOUrBVta8JpLqq5iTeM/7qagsSgyZXZRrVuhzIp?=
 =?us-ascii?Q?bhLNRKZ6cuMEqjpSBe9uutPkP3o2iI4hLDUTGMzzKw9g2ah9wVA/LkOZfQ3J?=
 =?us-ascii?Q?ZhX9TICndgeFyi/7UqCibG+KdLuln+lSiZIlj6zcjUG1MYMA+i/P/MuDr1N9?=
 =?us-ascii?Q?qb3xXlwHxBFz88O1pddYxOEeEQOl01qHn0N3sHyOMN1FmCm+vmJuLpyjWYZa?=
 =?us-ascii?Q?k4A21+My7LgZs3yGF//QGdAFkb2jcnnO18jIfymT2b+vIFxENC9GlJdHzjQi?=
 =?us-ascii?Q?NbrlkGjaNOCcn9kqOvLAcLeDaZrtucWTaN0SDCAQCpcaZIyEJGA3K0/JOT0i?=
 =?us-ascii?Q?IKCn4biZD3sXRj1dZRr9wF2rFZgIcWMSO5HirEGUfQow/F+SPTw0jZsh7vJU?=
 =?us-ascii?Q?uqTe0KpQRztNVToKGdrDTqwjOph+9KR7p/ujZpgM7ygCGO+gx4A2rGPb2+zg?=
 =?us-ascii?Q?CLhUwmV4seW1dEGeqUi3/McqJgsXxbm1eCej0H2yFcGLiQ3bqfqWaHLQs+aM?=
 =?us-ascii?Q?mATT4Xk3A6QtIl+XhO/Zqt38V5UCe75c46k8InVxXcqWTcmXjS6wXaqT0/vV?=
 =?us-ascii?Q?NhwdegvZY9y/Z7h098c32rtC2OmnXiZDzkT7NU961NeDuvPjhetg+0d2DUPM?=
 =?us-ascii?Q?hDD0eEmED6aMiNx3cF2ZgzvEIh4D9VdP64dlyJDqtWXe4Aa5xcaNbbMV9Ajc?=
 =?us-ascii?Q?1ie4Q/An2/bLokyMfb+i/7n6ANT3+nfDoLJfHb/JnGUXfG7sib2TBIdkG30T?=
 =?us-ascii?Q?I/fLk15wYL5jsG+7Mtm1I86wU/jO7STDhFGS0xXQOgr8B+keq+019RkKSPDm?=
 =?us-ascii?Q?VYaQKUyKeaaGsFdmOCFjSiwKObkMNCDicUAGq1v1FTFhjnI5wAO+YezzkGOR?=
 =?us-ascii?Q?tUVPPp7Y8xiJQfE3vLXg2a9Y2XQ7poReDgohokXCrEUbfnYoY0U+4nUsUU17?=
 =?us-ascii?Q?L2miY8DZfB0urMQqUNmG5GeoekjM8m/6kMnoVY51kKNMu3ttWXlQ2BqvC+ex?=
 =?us-ascii?Q?T5OrJIeZyRVCjz8u5CTcCrb048/h9D6TFemtBBtgUOvEQK6NvwwW7Z8mjBFh?=
 =?us-ascii?Q?mT7OT5NQySnL2y4zZykVN80oZlU461wRXZgCdAheZsiRzTeqfPXun49EcwzR?=
 =?us-ascii?Q?Uo21gjdfSyXd2zfgDn0Rpzzuw7Xrs1lH8rTbeOUsfn5onTAv2nx1gRG1/ZDh?=
 =?us-ascii?Q?YiELyrotgBEGWd0twlQw7WSAAKrX8jITCc0Sy1FLtQSiZJTYhTL2Bs2UcrCL?=
 =?us-ascii?Q?auONt0JBgh3ZlznHP6HyXLVNR3hSz+eL9Bikot7yodbcn14lkuW+IGVC1BOH?=
 =?us-ascii?Q?8lfg5jwDRg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 113e76dd-9237-4df8-ade3-08de54d4857f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 07:54:48.2343 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: edVmpWiSo8V/LxCvmkA76UzwI+emS53orh5cwJ8Kab2UIC38n/xptaGolFrFrYPRtaDxFQTyFeo0taIBMLSjJMaNcs82+JuFhYj7M5jnc8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6794
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

> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Hu=
go Villeneuve
> Sent: 12 January 2026 15:43
> Subject: [PATCH] drm: renesas: rz-du: mipi_dsi: fix kernel panic when reb=
ooting for some panels
>=20
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>=20
> Since commit 56de5e305d4b ("clk: renesas: r9a07g044: Add MSTOP for RZ/G2L=
") we may get the following
> kernel panic, for some panels, when rebooting:
>=20
>   systemd-shutdown[1]: Rebooting.
>   Call trace:
>    ...
>    do_serror+0x28/0x68
>    el1h_64_error_handler+0x34/0x50
>    el1h_64_error+0x6c/0x70
>    rzg2l_mipi_dsi_host_transfer+0x114/0x458 (P)
>    mipi_dsi_device_transfer+0x44/0x58
>    mipi_dsi_dcs_set_display_off_multi+0x9c/0xc4
>    ili9881c_unprepare+0x38/0x88
>    drm_panel_unprepare+0xbc/0x108
>=20
> This happens for panels that need to send MIPI-DSI commands in their
> unprepare() callback. Since the MIPI-DSI interface is stopped at that poi=
nt,
> rzg2l_mipi_dsi_host_transfer() triggers the kernel panic.
>=20
> Fix by moving rzg2l_mipi_dsi_stop() to new callback function rzg2l_mipi_d=
si_atomic_post_disable().
>=20
> With this change we now have the correct power-down/stop sequence:
>=20
>   systemd-shutdown[1]: Rebooting.
>   rzg2l-mipi-dsi 10850000.dsi: rzg2l_mipi_dsi_atomic_disable(): entry
>   ili9881c-dsi 10850000.dsi.0: ili9881c_unprepare(): entry
>   rzg2l-mipi-dsi 10850000.dsi: rzg2l_mipi_dsi_atomic_post_disable(): entr=
y
>   reboot: Restarting system
>=20
> Suggested-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
> Tested on a custom RZ/G2L board with three different panels/drivers:
>    ili9881c -> sending DSI commands in unprepare()
>    jd9365da -> not sending DSI commands in unprepare()
>    st7703   -> not sending DSI commands in unprepare()
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index 3b52dfc0ea1e0..b164e3a62cc2f 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -646,6 +646,13 @@ static void rzg2l_mipi_dsi_atomic_disable(struct drm=
_bridge *bridge,
>=20
>  	rzg2l_mipi_dsi_stop_video(dsi);
>  	rzg2l_mipi_dsi_stop_hs_clock(dsi);
> +}
> +
> +static void rzg2l_mipi_dsi_atomic_post_disable(struct drm_bridge *bridge=
,
> +					       struct drm_atomic_state *state) {
> +	struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge);
> +
>  	rzg2l_mipi_dsi_stop(dsi);
>  }
>=20
> @@ -681,6 +688,7 @@ static const struct drm_bridge_funcs rzg2l_mipi_dsi_b=
ridge_ops =3D {
>  	.atomic_pre_enable =3D rzg2l_mipi_dsi_atomic_pre_enable,
>  	.atomic_enable =3D rzg2l_mipi_dsi_atomic_enable,
>  	.atomic_disable =3D rzg2l_mipi_dsi_atomic_disable,
> +	.atomic_post_disable =3D rzg2l_mipi_dsi_atomic_post_disable,
>  	.mode_valid =3D rzg2l_mipi_dsi_bridge_mode_valid,  };
>=20
>=20
> base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
> --
> 2.47.3

Queued to drm-misc-next.

Cheers,
Biju
