Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C367ACEBE0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 10:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C35F10E81B;
	Thu,  5 Jun 2025 08:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="Z8LqoEAq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011030.outbound.protection.outlook.com [40.107.74.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41ED310E768
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 16:23:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4/eQ7wsWbfTxA4tyUnmuszwrSR06MNzJwQKuF0z4TYJTftG0cOBFUy+e8BNzwJPpoa2rVXnbokbSS3cHfu1jwf66Zwx/BCPH3IXfMhST80UJ0LUgap+uN5BDbeK5u+fWTLmcz1/EFLL8N1QbFr020RIaaUr8Zzz4fRmAZSUdh1Tk7qC5uZ1SXz8KWebqbSuZhikbpyrwgC5S94RQxU/N7z5BMmOTAIXIOcKHtkVXPn5GsxcDkSKQj0tbmJWjnoTzSF/RGzED/no3a5It9a0FQCDyfvTQAUpwfv5JAGjFWDuiezXgmv7Lnh6H18u/xnJ7FHM8RRAgoIzDBBBL1pyhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JF9lkg2vxj5NkODe2Nn0xu0Gxb1kAk2vpLbW6h+WrDo=;
 b=N+zuUB+z7xalGdC9vbxGtc5s9FZDjK37ENq8bAlVUnx8nTOKgy+jaC5BQoJwAhffezcEsIR6bVErS3QC7EbjijRvGa9rCwiCM314JeHXaG8OU9kCDZlNE+SLk+naNonhRGpqWw79jlGbx3pLPIMe36HQb5fR8ctg5P/DZg3qmd+ck5bakeKWAgpO7tY+Ac1Obw5VktNXM+THv1oCzXm/cs/ypUCEFbC41bpJ5LFSR/lop/lRmGveoIuRbJwWx76vV7UYrDx7xxzvkoCDObhwS2e7uHjQsoQrtm2Rgv//z0cn16h8L+O69ErC3ERMkiPc35idOQjVbpNjEbOrJq2XpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JF9lkg2vxj5NkODe2Nn0xu0Gxb1kAk2vpLbW6h+WrDo=;
 b=Z8LqoEAqpz32VIyP2q1nuDplLEB+Th3MkSAXK2cAJ3fmU8c0CSyu73CV2RBj90O4moakwHjVG1Qi08kG1cQg2d2ftPubyTRWaSXmU0dKfeS3OJeSuZNnydKpI3JUFpFcTIHgyRpbl8t1ERxgxBGbwCsUrXx3/UkY5F/OeBsL9uA=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by TY7PR01MB13730.jpnprd01.prod.outlook.com (2603:1096:405:1ec::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 4 Jun
 2025 16:22:57 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::3bc8:765f:f19e:16d5]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::3bc8:765f:f19e:16d5%5]) with mapi id 15.20.8813.020; Wed, 4 Jun 2025
 16:22:56 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hugo
 Villeneuve <hvilleneuve@dimonoff.com>
Subject: RE: [PATCH v4 1/1] drm: renesas: rz-du: Implement MIPI DSI host
 transfers
Thread-Topic: [PATCH v4 1/1] drm: renesas: rz-du: Implement MIPI DSI host
 transfers
Thread-Index: AQHb1WC3wlwFteFT+UaegR5pEc2kwrPzLeMw
Date: Wed, 4 Jun 2025 16:22:56 +0000
Message-ID: <OS3PR01MB8319EF8B4BD1508D753FDF568A6CA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20250604145306.1170676-1-hugo@hugovil.com>
 <20250604145306.1170676-2-hugo@hugovil.com>
In-Reply-To: <20250604145306.1170676-2-hugo@hugovil.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|TY7PR01MB13730:EE_
x-ms-office365-filtering-correlation-id: 4b25fc74-f941-4010-b1c6-08dda38410c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?TaFlIOz7Tcj6n3YCekzLTL6J0T37Y/pC9CC13+PR6ypYsdfutPGNTCEaB7bD?=
 =?us-ascii?Q?P/9OxUnImf3YUWzqWypDFlo6Zvxb184U8YIsnEQ+LexsNCSVh7qitYig5URq?=
 =?us-ascii?Q?xzIgQwlOuDLzMmqSTimi5bDhms4yqvhAaqHaEv+28NBEu2kE62apF5Nm1iP7?=
 =?us-ascii?Q?KNQl2BWjmb3BHlam+n+bbGD532xJGIorT/JwPnbhFRt/YfNVZvUSzaBr2hv4?=
 =?us-ascii?Q?EEiKq08oNJvXfbwhHy/D/6lPWd0bbhTd/AgntC7HHfrnmlI2OHZmPLY9eBd2?=
 =?us-ascii?Q?5+6ED7jjggMc/6gTJQ6PXv8yq6d2+0UjaEM2huKF2AmwOCHdf2Omp9A7ugT2?=
 =?us-ascii?Q?CZyQ+r+OBQUUQ54PxPJNXqFja4KQ6HmKDJQ2/X3PhcBGxkzwZ0if33Owv20C?=
 =?us-ascii?Q?pxcmCaChBteCZJn/y3SFnDYPmQPm68Oa/vRQ2JLcOLyf/KoSWoUtpvfrzyEt?=
 =?us-ascii?Q?Y1r8QTwqSzU/9AFvMOUsaT8MM5vlYjqy0FMgULMD7EXdkcFECqMWup9OBZDC?=
 =?us-ascii?Q?WWvnvyWawv3E4RSimZzmoqyTvhjTWEGdeI57zpHWxyznH3gGhpr9xVIIx5pj?=
 =?us-ascii?Q?DHjjNijvTkV9Cmd32U/nRWDXwownot5HYU3vvjJmc05nEwJST9O2bjK0MStK?=
 =?us-ascii?Q?kbXoJThJva8qpfqEUmY4Z91vLjJ5iYhv3F5QcVo2EKv0cbHbBPex2TCU7wpb?=
 =?us-ascii?Q?/B241LE+kiCmqb5TTSyuqRkxi4O2a1peR414qaI/HYS3idHJfBYd9Pm6duVf?=
 =?us-ascii?Q?Gxl1xoxEKiWSwnjvOYyo/v18Smtv9OvnE+gz4FadfjQKsuyVLQvD3JBuk/Oz?=
 =?us-ascii?Q?GJmy7l/0tw99kD87cYstnED6MoKNyOraRgpVXiFcWJ5TuUHTw9OMQWB6p0Ax?=
 =?us-ascii?Q?l90R2+P9uVwxwKw81tRoE00MicsoRnnjYhihvBksBtuKp9OMmj51VTa1YYp8?=
 =?us-ascii?Q?KszFEwLBLZ48sKZo1GQbu9yXHkh18HeutxI1lvb/oJY2DHpmbyW/1QiOUrej?=
 =?us-ascii?Q?UF0RMLRuACyskpoCWIbSK/6t1D2gKg12drsmnvnPNKrioRxVwjrsTUhtgKHn?=
 =?us-ascii?Q?t47W3ErjAak4ZDaERoLAXHXQxTOtv5Fv4hCdbCqAyyqhKwk4kvknooonrb8m?=
 =?us-ascii?Q?OgIXu29XyRF5a7BgkQETtq9ZM22k7W+scNCvRldRDLroPhHR0MvvcKzg3PIr?=
 =?us-ascii?Q?xpVG97KexYJWnfjY9UQSOi1IDPWf7GRfat7Ne5aLKLpmSpYXoCuPc3HBaydq?=
 =?us-ascii?Q?VWtkMIZGG3jVp0sjgLMq7X7Iad7UGPf4sopwsf27WSmOEZK8HgryP9e8Th7T?=
 =?us-ascii?Q?AwDPTS4RjYlLSZXwzDjA2LqAV2oYxPRurx+J0muOjd285pIyUSpvgIL7d9yK?=
 =?us-ascii?Q?hyngLk7MQ7HwsB//KYSQ/T7BjoClThJAGV442zDdOEGiK18NiW0h4vLnAuwD?=
 =?us-ascii?Q?TOo4WoQXaX3Lq7pGzkr6ZQikOCuo9s8u4uIe8hfGNgUcYKkrhozbpdwcO4rR?=
 =?us-ascii?Q?bGp8koslIZ91yGk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yR0IIgiyiUlcGqfykGv5k0t/E/6qCOzuZA/bSfffKbViuWmlp3evPQ+L/U5+?=
 =?us-ascii?Q?zcAs+ohqtnte9w+MsvYZSCjKTQK15kENZj5aAcSXpR1G9DVM+M4Cy7mXJeLk?=
 =?us-ascii?Q?GJnJb+t1U1uENYHq5IfvUD9i89qsbn5HxOQu/z0eK+Z0rh2Gva/XpSaBIhfB?=
 =?us-ascii?Q?xBUQ+eQNx2MEZh6WZ/ybjaTqZPb3moH0wyG+g/YGB1lgRE55fLp75+bgTPZc?=
 =?us-ascii?Q?yF7pmdHK4oLkz9BOUxhpSqjgkOeVnY333i/gfg99SfCHje2r2qVg7L7cBd38?=
 =?us-ascii?Q?1PubYLEY6Y+U3thfgagfKpQMFY7029I3RwkPwd1AtJlT2O8sxu3Ls/1+Xz/J?=
 =?us-ascii?Q?Sy8dF8iNbzzCs6IU+xIf4CuXRmdYzmNwVHyfDxRzo3T78omhaLAOhiZClW/O?=
 =?us-ascii?Q?AVHurkduTI7nz+LSE1hAtil/bIoKq8HLGrldiwdx+w3V3CBH0KAqxNYq33T7?=
 =?us-ascii?Q?N4jdvj9g4q2n4t5bwc5V/6dBRgLNdPd9CKFdPEpT0i4S9IJvLOo744vy2BsY?=
 =?us-ascii?Q?OzP/Llhy+Rd92lBzQ3Ph9ONeSyIv304pR5KOWWjLPKWpMyTNpeAz4S+I9ddu?=
 =?us-ascii?Q?JLSXqewF+xokfIyq+bdzXvxphphRJpZuf69yup1jHxmVQEH3s1DTdGF8oKH1?=
 =?us-ascii?Q?bSNofMVglHWZLT2ODztTkd2iGK311FisCk9Cw24UDwEozcnNOy6jkBLOQx8z?=
 =?us-ascii?Q?brXJ2CbG36hI2r3b1Gx0kgBmn1D4x9Y8bgiMr7H35tg7wiHggKYVdbnwT5fW?=
 =?us-ascii?Q?w+uHc6bBJWHv87ctaWu/OiJkS3ixtA74Q69Pa00OfeUIn3rv2jyBz+NmNCS/?=
 =?us-ascii?Q?brLKx9gaifqjgLvorZrPw9uHRJPCIKzOLX4HBJ6IDzj6K4cVMatT+nRjqEaw?=
 =?us-ascii?Q?wm3RiqxQMzN6y6Q4Ft8PwdJgnriAm/wd1AJRVySoslR1fKAW31NT4QGE49KR?=
 =?us-ascii?Q?dPI2c89eT+9/ZyXeNXCg7aT042ik7J4dhJxx0TUfL/u3lE3hk6Clym2rOQBf?=
 =?us-ascii?Q?nT4KH8w3QbkEc0OGD9zsWMtXgfey81QB9LZfFgvYLCX7cPiOcxoDmMw9CHxm?=
 =?us-ascii?Q?RC7JnmRfKfhrYNyJqm8ebCQNy7t0JjSoBdw2QXX1TZvnpOJqYMvGZ2UQLT2J?=
 =?us-ascii?Q?z/IUvy8w+H897nn1icqc6oheXUqZXQwRsEGT2Xz33wJtSyZGRkH4QXzKmPCD?=
 =?us-ascii?Q?p1e/if7g61xE4F/ULynPzo4TAA8XIcSWnAXGwPkzqHL7WKAJjTN/sCRR914h?=
 =?us-ascii?Q?YG7xApnxVC8PCp0oSuvsBbO1Y+zb+z8VNhRyQnClCwFiCz8SEoAPWdiqgZwZ?=
 =?us-ascii?Q?GJzDfe4WQZc4qTEtSH35wTPkN/piLYTkP5u/ECbp3CiGAHtuQ6/B4VmKnqQc?=
 =?us-ascii?Q?b9y7P17Mt4B8giARs98xewuSrvj4XccKF15T+e12Razsf3b7BAUPP2Sv83GM?=
 =?us-ascii?Q?GkdXcc1fdP2u5vncDB1BzfiiltU3CcPajJ3OY9wpMx5XeLp93/8AKv4F4pkg?=
 =?us-ascii?Q?MDZSAQ2gBp9mG8DdjqlC/XWOwugeJGb6KEmWW5kc6/QO2xP/1pqkdrrXevHv?=
 =?us-ascii?Q?nGbgUZS7woE6whaYVcZL1fjug9CYi/YXAgGF1ggc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b25fc74-f941-4010-b1c6-08dda38410c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 16:22:56.8132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vZLTyFvT7Y2pB8y85WxJsFSZa93Z078j/g0n/O+AW9zg+cE1O8av4HpEcJPvToVPBDwUahpkGhHNy+YSvfyGOnHVTAXbEGHMGMgH5YW7/c8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13730
X-Mailman-Approved-At: Thu, 05 Jun 2025 08:29:58 +0000
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

Tested on 2 different panels, with an RZ/G2L and RZ/V2L.

Thanks Hugo!


Tested-by: Chris Brandt <Chris.Brandt@renesas.com>





-----Original Message-----
From: Hugo Villeneuve <hugo@hugovil.com>=20
Sent: Wednesday, June 4, 2025 10:53 AM
To: Biju Das <biju.das.jz@bp.renesas.com>; maarten.lankhorst@linux.intel.co=
m; mripard@kernel.org; tzimmermann@suse.de; airlied@gmail.com; simona@ffwll=
.ch
Cc: dri-devel@lists.freedesktop.org; linux-renesas-soc@vger.kernel.org; lin=
ux-kernel@vger.kernel.org; hugo@hugovil.com; Chris Brandt <Chris.Brandt@ren=
esas.com>; Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v4 1/1] drm: renesas: rz-du: Implement MIPI DSI host transf=
ers

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Add support for sending MIPI DSI command packets from the host to a periphe=
ral. This is required for panels that need configuration before they accept=
 video data.

Also for long reads to work properly, set DCS maximum return packet size to=
 the value of the DMA buffer size.

Based on Renesas Linux kernel v5.10 repos [1].

Link: https://github.com/renesas-rz/rz_linux-cip.git
Cc: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 186 ++++++++++++++++++
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  54 +++++
 2 files changed, 240 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/d=
rm/renesas/rz-du/rzg2l_mipi_dsi.c
index 91e1a9adad7d6..50ec109aa6ed3 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -4,8 +4,11 @@
  *
  * Copyright (C) 2022 Renesas Electronics Corporation
  */
+
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/dma-mapping.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
@@ -23,9 +26,12 @@
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
+#include <video/mipi_display.h>
=20
 #include "rzg2l_mipi_dsi_regs.h"
=20
+#define RZG2L_DCS_BUF_SIZE	128 /* Maximum DCS buffer size in external memo=
ry. */
+
 struct rzg2l_mipi_dsi {
 	struct device *dev;
 	void __iomem *mmio;
@@ -44,6 +50,10 @@ struct rzg2l_mipi_dsi {
 	unsigned int num_data_lanes;
 	unsigned int lanes;
 	unsigned long mode_flags;
+
+	/* DCS buffer pointers when using external memory. */
+	dma_addr_t dcs_buf_phys;
+	u8 *dcs_buf_virt;
 };
=20
 static inline struct rzg2l_mipi_dsi *
@@ -267,6 +277,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi=
 *dsi,
 	u32 clkbfht;
 	u32 clkstpt;
 	u32 golpbkt;
+	u32 dsisetr;
 	int ret;
=20
 	/*
@@ -328,6 +339,15 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_ds=
i *dsi,
 	lptrnstsetr =3D LPTRNSTSETR_GOLPBKT(golpbkt);
 	rzg2l_mipi_dsi_link_write(dsi, LPTRNSTSETR, lptrnstsetr);
=20
+	/*
+	 * Increase MRPSZ as the default value of 1 will result in long read
+	 * commands payload not being saved to memory.
+	 */
+	dsisetr =3D rzg2l_mipi_dsi_link_read(dsi, DSISETR);
+	dsisetr &=3D ~DSISETR_MRPSZ;
+	dsisetr |=3D FIELD_PREP(DSISETR_MRPSZ, RZG2L_DCS_BUF_SIZE);
+	rzg2l_mipi_dsi_link_write(dsi, DSISETR, dsisetr);
+
 	return 0;
=20
 err_phy:
@@ -659,9 +679,168 @@ static int rzg2l_mipi_dsi_host_detach(struct mipi_dsi=
_host *host,
 	return 0;
 }
=20
+static ssize_t rzg2l_mipi_dsi_read_response(struct rzg2l_mipi_dsi *dsi,
+					    const struct mipi_dsi_msg *msg) {
+	u8 *msg_rx =3D msg->rx_buf;
+	u8 datatype;
+	u32 result;
+	u16 size;
+
+	result =3D rzg2l_mipi_dsi_link_read(dsi, RXRSS0R);
+	if (result & RXRSS0R_RXPKTDFAIL) {
+		dev_err(dsi->dev, "packet rx data did not save correctly\n");
+		return -EPROTO;
+	}
+
+	if (result & RXRSS0R_RXFAIL) {
+		dev_err(dsi->dev, "packet rx failure\n");
+		return -EPROTO;
+	}
+
+	if (!(result & RXRSS0R_RXSUC))
+		return -EPROTO;
+
+	datatype =3D FIELD_GET(RXRSS0R_DT, result);
+
+	switch (datatype) {
+	case 0:
+		dev_dbg(dsi->dev, "ACK\n");
+		return 0;
+	case MIPI_DSI_RX_END_OF_TRANSMISSION:
+		dev_dbg(dsi->dev, "EoTp\n");
+		return 0;
+	case MIPI_DSI_RX_ACKNOWLEDGE_AND_ERROR_REPORT:
+		dev_dbg(dsi->dev, "Acknowledge and error report: $%02x%02x\n",
+			(u8)FIELD_GET(RXRSS0R_DATA1, result),
+			(u8)FIELD_GET(RXRSS0R_DATA0, result));
+		return 0;
+	case MIPI_DSI_RX_DCS_SHORT_READ_RESPONSE_1BYTE:
+	case MIPI_DSI_RX_GENERIC_SHORT_READ_RESPONSE_1BYTE:
+		msg_rx[0] =3D FIELD_GET(RXRSS0R_DATA0, result);
+		return 1;
+	case MIPI_DSI_RX_DCS_SHORT_READ_RESPONSE_2BYTE:
+	case MIPI_DSI_RX_GENERIC_SHORT_READ_RESPONSE_2BYTE:
+		msg_rx[0] =3D FIELD_GET(RXRSS0R_DATA0, result);
+		msg_rx[1] =3D FIELD_GET(RXRSS0R_DATA1, result);
+		return 2;
+	case MIPI_DSI_RX_GENERIC_LONG_READ_RESPONSE:
+	case MIPI_DSI_RX_DCS_LONG_READ_RESPONSE:
+		size =3D FIELD_GET(RXRSS0R_WC, result);
+
+		if (size > msg->rx_len) {
+			dev_err(dsi->dev, "rx buffer too small");
+			return -ENOSPC;
+		}
+
+		memcpy(msg_rx, dsi->dcs_buf_virt, size);
+		return size;
+	default:
+		dev_err(dsi->dev, "unhandled response type: %02x\n", datatype);
+		return -EPROTO;
+	}
+}
+
+static ssize_t rzg2l_mipi_dsi_host_transfer(struct mipi_dsi_host *host,
+					    const struct mipi_dsi_msg *msg) {
+	struct rzg2l_mipi_dsi *dsi =3D host_to_rzg2l_mipi_dsi(host);
+	struct mipi_dsi_packet packet;
+	bool need_bta;
+	u32 value;
+	int ret;
+
+	ret =3D mipi_dsi_create_packet(&packet, msg);
+	if (ret < 0)
+		return ret;
+
+	/* Terminate operation after this descriptor is finished */
+	value =3D SQCH0DSC0AR_NXACT_TERM;
+
+	if (msg->flags & MIPI_DSI_MSG_REQ_ACK) {
+		need_bta =3D true; /* Message with explicitly requested ACK */
+		value |=3D FIELD_PREP(SQCH0DSC0AR_BTA, SQCH0DSC0AR_BTA_NON_READ);
+	} else if (msg->rx_buf && msg->rx_len > 0) {
+		need_bta =3D true; /* Read request */
+		value |=3D FIELD_PREP(SQCH0DSC0AR_BTA, SQCH0DSC0AR_BTA_READ);
+	} else {
+		need_bta =3D false;
+		value |=3D FIELD_PREP(SQCH0DSC0AR_BTA, SQCH0DSC0AR_BTA_NONE);
+	}
+
+	/* Set transmission speed */
+	if (msg->flags & MIPI_DSI_MSG_USE_LPM)
+		value |=3D SQCH0DSC0AR_SPD_LOW;
+	else
+		value |=3D SQCH0DSC0AR_SPD_HIGH;
+
+	/* Write TX packet header */
+	value |=3D FIELD_PREP(SQCH0DSC0AR_DT, packet.header[0]) |
+		FIELD_PREP(SQCH0DSC0AR_DATA0, packet.header[1]) |
+		FIELD_PREP(SQCH0DSC0AR_DATA1, packet.header[2]);
+
+	if (mipi_dsi_packet_format_is_long(msg->type)) {
+		value |=3D SQCH0DSC0AR_FMT_LONG;
+
+		if (packet.payload_length > RZG2L_DCS_BUF_SIZE) {
+			dev_err(dsi->dev, "Packet Tx payload size (%d) too large",
+				(unsigned int)packet.payload_length);
+			return -ENOSPC;
+		}
+
+		/* Copy TX packet payload data to memory space */
+		memcpy(dsi->dcs_buf_virt, packet.payload, packet.payload_length);
+	} else {
+		value |=3D SQCH0DSC0AR_FMT_SHORT;
+	}
+
+	rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0AR, value);
+
+	/*
+	 * Write: specify payload data source location, only used for
+	 *        long packet.
+	 * Read:  specify payload data storage location of response
+	 *        packet. Note: a read packet is always a short packet.
+	 *        If the response packet is a short packet or a long packet
+	 *        with WC =3D 0 (no payload), DTSEL is meaningless.
+	 */
+	rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0BR,=20
+SQCH0DSC0BR_DTSEL_MEM_SPACE);
+
+	/*
+	 * Set SQCHxSR.AACTFIN bit when descriptor actions are finished.
+	 * Read: set Rx result save slot number to 0 (ACTCODE).
+	 */
+	rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0CR, SQCH0DSC0CR_FINACT);
+
+	/* Set rx/tx payload data address, only relevant for long packet. */
+	rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0DR, (u32)dsi->dcs_buf_phys);
+
+	/* Start sequence 0 operation */
+	value =3D rzg2l_mipi_dsi_link_read(dsi, SQCH0SET0R);
+	value |=3D SQCH0SET0R_START;
+	rzg2l_mipi_dsi_link_write(dsi, SQCH0SET0R, value);
+
+	/* Wait for operation to finish */
+	ret =3D read_poll_timeout(rzg2l_mipi_dsi_link_read,
+				value, value & SQCH0SR_ADESFIN,
+				2000, 20000, false, dsi, SQCH0SR);
+	if (ret =3D=3D 0) {
+		/* Success: clear status bit */
+		rzg2l_mipi_dsi_link_write(dsi, SQCH0SCR, SQCH0SCR_ADESFIN);
+
+		if (need_bta)
+			ret =3D rzg2l_mipi_dsi_read_response(dsi, msg);
+		else
+			ret =3D packet.payload_length;
+	}
+
+	return ret;
+}
+
 static const struct mipi_dsi_host_ops rzg2l_mipi_dsi_host_ops =3D {
 	.attach =3D rzg2l_mipi_dsi_host_attach,
 	.detach =3D rzg2l_mipi_dsi_host_detach,
+	.transfer =3D rzg2l_mipi_dsi_host_transfer,
 };
=20
 /* -----------------------------------------------------------------------=
------
@@ -779,6 +958,11 @@ static int rzg2l_mipi_dsi_probe(struct platform_device=
 *pdev)
 	if (ret < 0)
 		goto err_pm_disable;
=20
+	dsi->dcs_buf_virt =3D dma_alloc_coherent(dsi->host.dev, RZG2L_DCS_BUF_SIZ=
E,
+					       &dsi->dcs_buf_phys, GFP_KERNEL);
+	if (!dsi->dcs_buf_virt)
+		return -ENOMEM;
+
 	return 0;
=20
 err_phy:
@@ -793,6 +977,8 @@ static void rzg2l_mipi_dsi_remove(struct platform_devic=
e *pdev)  {
 	struct rzg2l_mipi_dsi *dsi =3D platform_get_drvdata(pdev);
=20
+	dma_free_coherent(dsi->host.dev, RZG2L_DCS_BUF_SIZE, dsi->dcs_buf_virt,
+			  dsi->dcs_buf_phys);
 	mipi_dsi_host_unregister(&dsi->host);
 	pm_runtime_disable(&pdev->dev);
 }
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/=
gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
index 1dbc16ec64a4b..26d8a37ee6351 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
@@ -81,6 +81,20 @@
 #define RSTSR_SWRSTLP			(1 << 1)
 #define RSTSR_SWRSTHS			(1 << 0)
=20
+/* DSI Set Register */
+#define DSISETR				0x120
+#define DSISETR_MRPSZ			GENMASK(15, 0)
+
+/* Rx Result Save Slot 0 Register */
+#define RXRSS0R				0x240
+#define RXRSS0R_RXPKTDFAIL		BIT(28)
+#define RXRSS0R_RXFAIL			BIT(27)
+#define RXRSS0R_RXSUC			BIT(25)
+#define RXRSS0R_DT			GENMASK(21, 16)
+#define RXRSS0R_DATA1			GENMASK(15, 8)
+#define RXRSS0R_DATA0			GENMASK(7, 0)
+#define RXRSS0R_WC			GENMASK(15, 0) /* Word count for long packet. */
+
 /* Clock Lane Stop Time Set Register */
 #define CLSTPTSETR			0x314
 #define CLSTPTSETR_CLKKPT(x)		((x) << 24)
@@ -148,4 +162,44 @@
 #define VICH1HPSETR_HFP(x)		(((x) & 0x1fff) << 16)
 #define VICH1HPSETR_HBP(x)		(((x) & 0x1fff) << 0)
=20
+/* Sequence Channel 0 Set 0 Register */
+#define SQCH0SET0R			0x5c0
+#define SQCH0SET0R_START		BIT(0)
+
+/* Sequence Channel 0 Status Register */
+#define SQCH0SR				0x5d0
+#define SQCH0SR_ADESFIN			BIT(8)
+
+/* Sequence Channel 0 Status Clear Register */
+#define SQCH0SCR			0x5d4
+#define SQCH0SCR_ADESFIN		BIT(8)
+
+/* Sequence Channel 0 Descriptor 0-A Register */
+#define SQCH0DSC0AR			0x780
+#define SQCH0DSC0AR_NXACT_TERM		0	/* Bit 28 */
+#define SQCH0DSC0AR_BTA			GENMASK(27, 26)
+#define SQCH0DSC0AR_BTA_NONE		0
+#define SQCH0DSC0AR_BTA_NON_READ	1
+#define SQCH0DSC0AR_BTA_READ		2
+#define SQCH0DSC0AR_BTA_ONLY		3
+#define SQCH0DSC0AR_SPD_HIGH		0
+#define SQCH0DSC0AR_SPD_LOW		BIT(25)
+#define SQCH0DSC0AR_FMT_SHORT		0
+#define SQCH0DSC0AR_FMT_LONG		BIT(24)
+#define SQCH0DSC0AR_DT			GENMASK(21, 16)
+#define SQCH0DSC0AR_DATA1		GENMASK(15, 8)
+#define SQCH0DSC0AR_DATA0		GENMASK(7, 0)
+
+/* Sequence Channel 0 Descriptor 0-B Register */
+#define SQCH0DSC0BR			0x784
+#define SQCH0DSC0BR_DTSEL_MEM_SPACE	BIT(24)	/* Use external memory */
+
+/* Sequence Channel 0 Descriptor 0-C Register */
+#define SQCH0DSC0CR			0x788
+#define SQCH0DSC0CR_FINACT		BIT(0)
+#define SQCH0DSC0CR_AUXOP		BIT(22)
+
+/* Sequence Channel 0 Descriptor 0-D Register */
+#define SQCH0DSC0DR			0x78c
+
 #endif /* __RZG2L_MIPI_DSI_REGS_H__ */
--
2.39.5


