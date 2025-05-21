Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB78AC0599
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 09:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12519B126;
	Thu, 22 May 2025 07:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="M4f8IqJj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011006.outbound.protection.outlook.com [40.107.74.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D10F10E792
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 18:54:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ntn4gmtCvlfqfdmv291nLj4JroNzVuNu3cSq2bQSV7HAijb4QSnm3HWATrXbDwEJetqX3YnuC0Wy8uyXIQKu4UGFwoShLDW/3k/GVXMBPa2+nt2N5KjKgLYobtrsP7UEL0Ajx+f4jvwO8B74tTUitngr7IeLYTq9xu/HY38xSFRZq6CohiAjhOU/FrHmzTmNuBXMwKh8Mm72L+TonTpnEaZVd75kf6W840jGuZal8w59x6e+FEukrQgduhDoByxKvfy9V369px4eJs8eRp+bUHB9J4lnE2eNGzqw4T2E0c6xuKGBGtKHVYIZZLbqUdHGs8019S0vgBtQQPeUJ1B8Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8NVmt+3WmhxZpPUu+QNrDMMDWBqq7fWtxdVigwVctU=;
 b=VrlSnWss02LGcC1ZVZRdGCaBAaaSNuCRWVAYdbvefNin/3VDuLhJTnYgR9uqvjUlDPEgBlS/H93UJMLIKp9pk99tbhJP/4FEYYZYpza3bhLWQ4d9ic2lBSx1N0niPM/0/GtGsJ0k7rebD2wMSOXGfNkTWeb71129ZW2yOB+mlOM46NKOBLKN3A0LiYA/1SClkJONoK0SmtpVwyMp+ptkZzTXWk2lAbmqofn4fOy1AMzHckWlFdTiVNOAhHAaZ1y1MYhdZIBVX2708MKqp2tTABNMlSyvPzH4iaPBe94UniUuSRKlW8W1A/PdIVMtzevQTXCBi8tYscobhuv7Tv+LTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8NVmt+3WmhxZpPUu+QNrDMMDWBqq7fWtxdVigwVctU=;
 b=M4f8IqJj4L9eMtPAngksnXzm2Ii6X5zLPUKqtxoH9rm86zHmN/+9AOd8OP2AByLuwMQE+U+gdynnsENEjwczdwTGELDPsZaNIkuPKxXB3dDXOuDrKKYTOAgvAYVxoLbypuul4vJ2Cbqj0QlzXCgY/+gNCNsITbOKJaKTvgNO/0k=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by OSCPR01MB16193.jpnprd01.prod.outlook.com (2603:1096:604:3e9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Wed, 21 May
 2025 18:54:02 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::3bc8:765f:f19e:16d5]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::3bc8:765f:f19e:16d5%6]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 18:54:02 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>, Hugo
 Villeneuve <hugo@hugovil.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] drm: renesas: rz-du: Add atomic_pre_enable
Thread-Topic: [PATCH] drm: renesas: rz-du: Add atomic_pre_enable
Thread-Index: AQHbylwFhVVE5Hn9nUKcOcoNt/ZXy7PdaaLQgAABvIA=
Date: Wed, 21 May 2025 18:54:02 +0000
Message-ID: <OS3PR01MB8319FAA1011BE3ED940E8FE58A9EA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20250521142350.2134431-1-chris.brandt@renesas.com>
 <OS3PR01MB8319DDCEB00EE36F137E055F8A9EA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
In-Reply-To: <OS3PR01MB8319DDCEB00EE36F137E055F8A9EA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|OSCPR01MB16193:EE_
x-ms-office365-filtering-correlation-id: 29494f26-05b9-4f6b-3070-08dd9898da67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?fuecSAlWeVWHCN4anD8qusxyZ1n5NKaVZliZKZRcmhkVJTq5U+mT8rkzlUIX?=
 =?us-ascii?Q?B0ua0f47n8m65lEbY7XTEQ7hfRKnXUofw2UC3/9FpfUvvKAP3i6Kd5E3hBGD?=
 =?us-ascii?Q?3ok+Y0utZQvnB8aAyPqTDPosp55BFWtCQEpjrhqZ30xpheOAiKbqD7x1mXsG?=
 =?us-ascii?Q?wTHQIV4v8wyfzCJcLFykJTDGuMA1JUiYNO3T6o3LqQ9agIP0miAelLUy0DgW?=
 =?us-ascii?Q?ZBrth9wyBqEjVhqn3KOObTep7Jplcc6pRkVCmdTdAbkX85wLjS5oKC4acoSI?=
 =?us-ascii?Q?Gs8qOhKhah7MQeEujbxjGEYkrvE21MEQjIrsujpd6/AjtYCPggwc2hUoBy3N?=
 =?us-ascii?Q?lkNpU5qy9dwJ53o/EQp5tJZ4EPkb5jpQi7/EUaVIQ9C5Sxff5+VHFMi6kwxk?=
 =?us-ascii?Q?8fz/iVmc9dv/DFoOWPIVo8Li3QeXzh6Rg/0TwykY76hURDjZZ0gjpiN+DBCM?=
 =?us-ascii?Q?RmHa/eFqAGoI2jqEGHqw/jWwhRyVz7ZNCq2IUWyy1qGBVQGNtWMQZCW/QDVJ?=
 =?us-ascii?Q?HiGsqZv2qByn9djjHC97xcH6qYObYCu2zXUBk27I3FoGG0cwE+7r5IQE42a4?=
 =?us-ascii?Q?w9OvKNw6es3/MNIfUZyBA2hTzZq06K96e6v/5+TA6Tvm/fA64P1SEQnaAysd?=
 =?us-ascii?Q?QTGzrJptv3sKzaMhvJWO+L1OFGc7SSEF05XhQCeM6juMGE7L5PmA7wB3qIVx?=
 =?us-ascii?Q?mQ2naZsMJPKVzJfh6fV7W9kvlL5HAD+oz1jeNTUljAgENxNsTYaEv9nVbp+a?=
 =?us-ascii?Q?8gg5/4hviX5NsFX1M8qT/N+tYoaA0LiJCEEETXegrHJONkTxVPukbPlMXQfw?=
 =?us-ascii?Q?tsWk43BXinLMDeV3S7UGstllJGyE2W6WfYBA/FkMG0HzjYXJXBg9wtQlwsUA?=
 =?us-ascii?Q?TOEDfudBe1Osg5hZifwX3CsOKKnpyTTzk3NpcQ6e2KbN95qtCR0tNMQw8PK+?=
 =?us-ascii?Q?i5AGMgnqTfX+Xj6u4lgkKQrgS+4Vp/7SmH1Ti2KhGY2fAlRzpiS0qrQHCe57?=
 =?us-ascii?Q?V7wc4mef7EGzGED1E2fzeyscU62g0+iGpEACzPsGa2ri6qYl5i8hQhSIpgF+?=
 =?us-ascii?Q?w1B5r9D0/9y3QsgJq/pYhUnswapEFuTqieN2WteNoyAOvTdglvPqC9TxFdfY?=
 =?us-ascii?Q?dS+dKMxWAJSh7qNQrIO2ji0qVB4YKifAyE75tX0o4/wunyLlj6VqTWHucwjd?=
 =?us-ascii?Q?NmXA3SBOdWwGlnGIiY54rCb16DSbsCJyyAWX+dhPveDtG10U5Ol6LI2yJzZI?=
 =?us-ascii?Q?2WXzxejXAGypYsgFdEifWbRERGJzvUw6ksJjBkcbzG6k4ido/+AppQGUaGhI?=
 =?us-ascii?Q?ctpoWiRFB8NSQSDgBApTNR1Xmc9TydhtVMmXyeLP5K4IiDaTF+/bHN1t+V9q?=
 =?us-ascii?Q?72gsV6RU7acPt5dqNju3ov8zZyRV2U5eydAhdUmjCGL1JtKek6GOymMO5joE?=
 =?us-ascii?Q?a3+BDQay9znlgvCkHFRzyHsg2XzXlgwdxYqS0n4VdC3mU8fWfPfmTZAQCMv0?=
 =?us-ascii?Q?7v3t+7Azbr/XZ4s=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ChNYycMa2vkWKiLRnHKRG4ePUIkDuOJyPTP5zFUZc7KMY7D+IiyFIqvIUjSY?=
 =?us-ascii?Q?nXZyqtucEsB2bnui1COv4/6is7AEsDZ+OVnFyRTDyvsD29MMc2agOG9i1Oug?=
 =?us-ascii?Q?iLJFHEOr8UXiV7wnSjfBz18S4WEcSOREj1VmvtYPqc8RSyNzwGXkwik2OYQ2?=
 =?us-ascii?Q?+tzmqtZKzAj1EGTM/QWTuhwJzpsYfHN65L2rH1i+AQRVrDn741CGUJdt7UXl?=
 =?us-ascii?Q?gVISGzk96LHl5cNtko924XwjDqOuzLLqSDt6omfifW0+0eHsy/TLhNmC+W4F?=
 =?us-ascii?Q?TGMvLiQQtnxxrphfhZEWXFfvcFmbAE0/Ejd+QiRGz9brlNe2DJTgT8pUR31+?=
 =?us-ascii?Q?rDMud+z0R7NdrB1G6NXTIrd6TB1x7zstm68n+swT8og6bEg7GiYyw9j3IqPY?=
 =?us-ascii?Q?pbBZUrK8nzxrLb5ql4pvP7jvJQaKGMCIH9II219AWICtt16xS3zlI5YBPDzK?=
 =?us-ascii?Q?yIaeSUQOt117a7/gAE1WSmo4NXZlQS8z2In8x4VrSDk9WGk4XBPU1cJzN3CD?=
 =?us-ascii?Q?C/4IAmBiCFe9/PqvCMeFdMu8sOROy4zeixRD0fcfA+v9I2CYKi4GOh+VIyie?=
 =?us-ascii?Q?WjZ5oBhc0J6UxyaMZBlpAla+zs0vtEIUA3hx8BOrVKZ5iq03lv1F2cCBoK/0?=
 =?us-ascii?Q?Z3bcNSmMyoaMUicaoBq4BddM9sbKspkEu7zXiFAj7GUg39wN8HfD0VidxOhc?=
 =?us-ascii?Q?2VA9jXT5hYYauc1XGz8pNzN51NFyeNyPPU8v8y+ZOc9/mNdMF+58AdBJV60t?=
 =?us-ascii?Q?+0eiWl32ooVHHoQnFEcdpLpXZzuyJY8dSbyXCDZHMuAb+IRkhhM3WSQN2kir?=
 =?us-ascii?Q?s/ReBoi7/LDkO0XS9eNaKjhVDi6iL3V9B+JcpNtnvcssSIsEXj214+J5LvsR?=
 =?us-ascii?Q?HQd0DC+0iQCmLUvf8RCzZWYDf1LH2ornrxbJrjDcQMrr8uFjSn0KznrzMxAW?=
 =?us-ascii?Q?NUj1xfwE6DiRYtgFUagHHZhF50FbCHCeUsg/BaLgiNgLUiS1OG0y6grYig/0?=
 =?us-ascii?Q?pFdCuEUgzl7BSw+LEq/Mb9jW3Ha6eZcAtEIvo0fZSf0rCXKEnZ5lkXRNsoGc?=
 =?us-ascii?Q?1jZnnx+FT3ecRydZDg9Dq33gRJLLfEqseIjE1kNwYen/JPZxA9OpU0Q17RZy?=
 =?us-ascii?Q?XnSqrfEXdZnUkr29KbIWRxleWT0VXBx2E/ePsAsr3q8wu7jxRaKkG37w6WSr?=
 =?us-ascii?Q?UM/nQp+k6tt/zOwzQdF5VBUWeIURJCswaKpLZ2JCLpTn4dB0FMAxtLh/QwLx?=
 =?us-ascii?Q?3O+D8lsSdm+szCR4juYEledixxAg8iYeTPG17KsAlpblBwxhj0amDrldzabV?=
 =?us-ascii?Q?fqAWzRelPwQq9UvgpZKntCSD6lrip/jISX2GqCxZti/pwymKchJDlQgrjCeZ?=
 =?us-ascii?Q?tnCUVb3W6nC74TSNAOqD3y28bMSXF/ap95mGkOtgXe1L2fsxIzcGkgSCngo5?=
 =?us-ascii?Q?1JONyB/srE0gYZHjAaV1n+LlNE6SNhYjhehN6d64IrBxnsLdTOf2Z+5JMetg?=
 =?us-ascii?Q?GinkVB7kPr5cMwEFqpVxXUn8NcdFK3AOJwcZYeZis93DtIU5PNTuUHrKNYFK?=
 =?us-ascii?Q?ukfFIKbA5TGZeP2JPwJ+nmvmtQyWYGgl3bMDDqv8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29494f26-05b9-4f6b-3070-08dd9898da67
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 18:54:02.2757 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qwO8GIq4H+5jSWloinad/ZkRH57kavunoTto5yRNe4jbovaZPxov8ZFpoZDqzU2IHBhCVVe+CUjzsTulLAPbY94pa5RTrjB8zRrr+PMn1VY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16193
X-Mailman-Approved-At: Thu, 22 May 2025 07:24:12 +0000
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

Correction: There is no issue with my patch.

The problem was that when I applied Hugo's patch ("[PATCH 2/2] drm: rcar-du=
: rzg2l_mipi_dsi: Set DCS maximum return packet size") on top of mine, his =
code breaks because the enable function was split into 2 functions.

Since his new code needs to go into the new pre_enable function I made, I s=
uggest his patch set assumes my patch was already applied.

For now, I'm going to stick with my V1.

Sorry for the noise.

Chris


-----Original Message-----
From: Chris Brandt=20
Sent: Wednesday, May 21, 2025 2:38 PM
To: Chris Brandt <chris.brandt@renesas.com>; Biju Das <biju.das.jz@bp.renes=
as.com>; Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripa=
rd <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; David Air=
lie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Hien Huynh <hien.=
huynh.px@renesas.com>; Hugo Villeneuve <hugo@hugovil.com>
Cc: dri-devel@lists.freedesktop.org; linux-renesas-soc@vger.kernel.org
Subject: RE: [PATCH] drm: renesas: rz-du: Add atomic_pre_enable

Sorry, ignore this version.

The local variables are wrong.

I'll submit a V2.....

Chris


-----Original Message-----
From: Chris Brandt <chris.brandt@renesas.com>
Sent: Wednesday, May 21, 2025 10:24 AM
To: Biju Das <biju.das.jz@bp.renesas.com>; Maarten Lankhorst <maarten.lankh=
orst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>; Thomas Zimmerman=
n <tzimmermann@suse.de>; David Airlie <airlied@gmail.com>; Simona Vetter <s=
imona@ffwll.ch>; Hien Huynh <hien.huynh.px@renesas.com>; Hugo Villeneuve <h=
ugo@hugovil.com>
Cc: dri-devel@lists.freedesktop.org; linux-renesas-soc@vger.kernel.org; Chr=
is Brandt <Chris.Brandt@renesas.com>
Subject: [PATCH] drm: renesas: rz-du: Add atomic_pre_enable

When drm_panel.prepare_prev_first is set to true in a panel driver, the pan=
el expects the MIPI DSI hardware to be already configured before the panel'=
s prepare function is called because it might need to send DCS commands.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/d=
rm/renesas/rz-du/rzg2l_mipi_dsi.c
index 4550c6d84796..b31affddfc81 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -531,7 +531,7 @@ static int rzg2l_mipi_dsi_attach(struct drm_bridge *bri=
dge,
 				 flags);
 }
=20
-static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
+static void rzg2l_mipi_dsi_atomic_pre_enable(struct drm_bridge *bridge,
 					 struct drm_atomic_state *state)
 {
 	struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge); @@ -549,=
6 +549,13 @@ static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *br=
idge,
 		return;
=20
 	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
+}
+
+static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
+					 struct drm_atomic_state *state)
+{
+	struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge);
+	int ret;
=20
 	ret =3D rzg2l_mipi_dsi_start_hs_clock(dsi);
 	if (ret < 0)
@@ -592,6 +599,7 @@ static const struct drm_bridge_funcs rzg2l_mipi_dsi_bri=
dge_ops =3D {
 	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset =3D drm_atomic_helper_bridge_reset,
+	.atomic_pre_enable =3D rzg2l_mipi_dsi_atomic_pre_enable,
 	.atomic_enable =3D rzg2l_mipi_dsi_atomic_enable,
 	.atomic_disable =3D rzg2l_mipi_dsi_atomic_disable,
 	.mode_valid =3D rzg2l_mipi_dsi_bridge_mode_valid,
--
2.34.1

