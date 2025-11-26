Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4640BC8A30B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:10:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF5810E60F;
	Wed, 26 Nov 2025 14:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="uqk01j9g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011017.outbound.protection.outlook.com [52.101.125.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C6510E60F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:10:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rm9Jybh2gLrFUCLluumh4/0Zwf2VCxJOI2SFctE0mfzuicFwGQgwALRKH45XqF/hj4rxGyqniN3QvGYX/UFFi7wocbaYoZtOW0j/UXLTyrmVzniWL7mHh7Cv3mU5SIVLu135Xi++CMVnTEpqNI3MXxBOWwMezyXZ1ahkGcVy+2I1sjeN4CTz4aggAcL082Q5jjkwFynnZ2d8mB/cUgydq82aHD4EfotwbslzTq+8WkGjZE/AFH1loXJFBte30t1HduJauuxDv4YHY0vXMa8Zidf09vz2SZUPANSss0Y7bBjdqnEK1iyJxf1EAPH87EPV4/rbDVorZLa63wcqXH1fnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Qn9l1WgKxFymyG0XPL2jCnsg0pMPiy2ZmTIqQM5ESk=;
 b=he1vDgSQ9DuPd2wLcJd9etWkTsq8M3WvpBbBda6dqp/0Xb+xHgOHhUkndMK+YKWYLlJ8biAq6/C8Hu9bABOBpZ3RXFAmpyOxeI2L8XbNBrl+fnxXiTj9wJ/jgrEixXMRBZ5bKY6w8kNaQzOF5UlSbOrUB/G5gG3VfbYEfZyg2ggyVzJWyzqGBtmdmmpjG8pI06JTqE97N2oV8gXRdKVGbhYNcQOdVhEGL462W4LYoo/DBFcDr4WS+nv/mhoEH3RmeY1+N0DlR74w2YaWyDv4jQzyDHhuRL/I4jA65OBa6xgJaRXclXbgJFQ8scFgj8wQC/iajmXDTyZwKzd15rzVmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Qn9l1WgKxFymyG0XPL2jCnsg0pMPiy2ZmTIqQM5ESk=;
 b=uqk01j9gkLtZsRRLdSnA22Gda51oWRjX+zZ2utR5ieWOwR0FJPnT1h7A8db2qEqx+hOJvSCmyu91peoSJ0l88Y9jAcmP5YJ1+4+ZX8zXWjnk1BT41zljDI0diN2RkoJrJAEynW56/TSw3DnU+0iqwj9PFkCzKXs71D73IzPdVPc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB6804.jpnprd01.prod.outlook.com (2603:1096:400:b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:10:21 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 14:10:21 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 14/22] drm: renesas: rz-du: Add RZ/G3E support
Date: Wed, 26 Nov 2025 15:07:26 +0100
Message-ID: <d7361a77744b7c8720addaaa064162470e7f3581.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::14) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b6c49af-245f-4293-c71c-08de2cf58904
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qx5rFPfKLsMwhWCbTPv7PZ+5gQ6t8V95Fsj1RG9N9i8zWmrcq6ypjqmjthv8?=
 =?us-ascii?Q?4+Z3vqGUktR54BqQhQomqTYxJX/GHcB/gGgkRMlFMmPnHZcMGIgAF8o+vEim?=
 =?us-ascii?Q?juiYWlm4oT/J/olYANjA742i8lgvQEM3mxr2nkqYw8FmMaD4rXMKIaAikAYr?=
 =?us-ascii?Q?AuQtE4TTfrf7acPo86Mtxle5HRmDfq5LZqRP9bOQB+g03L4EPZ1p3+ln6Qpj?=
 =?us-ascii?Q?Pu/19QiyTjOWcj+wg4SVPFo/KzUoFuLwiGYZQbL3JJcfk4WHP1thA55RiLoq?=
 =?us-ascii?Q?lPGqUtwjhIQd41LxtHJvu88ZFIENFRTA0+lUjLlEv9fmfVxrk8KZI7iQoaCV?=
 =?us-ascii?Q?ocPPIYdU7w17Jm1xJZMZLVan76dgWHu8suql957+oNc9jLIFn2QFRR3fusrC?=
 =?us-ascii?Q?paPzRi6K2as5swtwMO/rdckU05m7ptOgGA3n+GDkqBYrcARDr0fpDdLUnXoF?=
 =?us-ascii?Q?LRyCPjzq6EhElmkVJK13FqIR8BncYtW1N3WAN6fNAfavFhzYBbS90wsN16FF?=
 =?us-ascii?Q?S1C8KnZfp8+R5Re2ZnFMJlqnBK4cEgimWdg8qIAWmNjJw6Rl+2bMiwUXmX7d?=
 =?us-ascii?Q?8NbN4Lbf6pzC1q1AnL8mqLkp2zRDl0sGaMZrgMtv3mByqVCStoRpyWFyW14d?=
 =?us-ascii?Q?2quv7Fm7k5Kqgnr4jpaUeIIVIgfwCM3mmkNoLskGTuapxr+7EpvAf+73iBL3?=
 =?us-ascii?Q?PF91eQswQWgxgEvkqnDK7mIFuuH0j1ArDnw3oZ1l6uBrwZeV4G/IMEk5rDp7?=
 =?us-ascii?Q?Mwwh9DAgc/TF0vzMmyZNG9e3G0UYUEKjrCehwBZvLAbFGpP/8gxA9a/RdZVy?=
 =?us-ascii?Q?mGpKFv7TtCK2n1BkZtQqQfU98kV9VakWZRRzhtfzEZ0G0ltGtH95rKnfe4bj?=
 =?us-ascii?Q?kJ9AaTNJcLbXflHhrpiNdT8/axFfdlHhVGoHGb1WVATjkOQWH5y3rcRQ7xb9?=
 =?us-ascii?Q?akUX7oKHtJrytZ4wEc3w4PHTeCSWyoVoPhFy6Z+2lh8SRe/d7TOA1KjhsJhZ?=
 =?us-ascii?Q?8nzMEr35/n//DX+xl0l4fk4VfbzIg2YHK6NBLsa0XT6eNL5iRwxT+jLI+gTl?=
 =?us-ascii?Q?FSI5fp5g3bqUelVjUqG5bioHlkMTIF/Ztgx5uM91VtqIRVaBkSoGq0PvtRke?=
 =?us-ascii?Q?Qc5fb+W6y+lQd/qvjVI63/0VI/I0Nm64OOGEJGfTLjkTrlVPEDSLgIIPTNet?=
 =?us-ascii?Q?SY5zgfnrFQcQZ7X4c5H6M+W6cMDLG58I07OjhE8hkB7iDRdOHqWNiixdwVPy?=
 =?us-ascii?Q?Sbmm/0PYd5+VB+33PYjctloI3Vj1+Y8BiMwtXajQ3aWUi0eUQi0HLUzQoIGy?=
 =?us-ascii?Q?okq2xa6n/y9TP85nwc3t6PFb/Hd5lHJ5imcgoy7D1AU97ZLP2v1sOLRbQ0Kn?=
 =?us-ascii?Q?7v1nGR/Jm57m1OG6ZCrtDAE42Vn5m+26zL3agtpxs3eka2l49x9EY7oR138A?=
 =?us-ascii?Q?7Osj5UebS0FlMCmW17TiUIttXRG+JZBkT1Mg5pV1+gvf9kPRX5qgPR6hb90A?=
 =?us-ascii?Q?dwbyE79yLN1pI0QBerUPaXCNoXayzZDLl1wg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LjvgswS+ZzbIyJ5lZEeimgHEuXtxftYRHKIWMpK/1iDSo419TNmX4U10Q7zL?=
 =?us-ascii?Q?46vPAgjUujp56hDd6oC7q4cYRBM2dRYHxtcf4keuvFlRCcTKK2HIDpuax1Dj?=
 =?us-ascii?Q?ukBCdGVTziM3pMdl8viJX//KS50NZ7zTCgGg5k5JzctRhdRiQZlyg0s0hxwp?=
 =?us-ascii?Q?/D6Q7yTgSy7z7nK7/lFloMcBTl+S35dAfZ9skk4j2uq7XUEK4SZ6e3up0pQr?=
 =?us-ascii?Q?c4ykLXWjFpBq9VZ9ZGUYNQidQZW05ikqNvuwpQ77m7WjgonKCS0vckOE0h2l?=
 =?us-ascii?Q?nzUTzTGKDLHPSgwtYt/9X4bD0tgGOF+v3k/Xncg/GQWUmqfQiOVa62K81hMJ?=
 =?us-ascii?Q?m4a0FfGdN+RNmuPH4T3aZbGaQI8EdA4Qob94G5D7lVVh8pro2CCaPW9zamlO?=
 =?us-ascii?Q?G6na7GwxgAvAba/2lsMlpW9WUYuiwZe0HVwrhu1UcpJhJbutpeY/HdMrArIs?=
 =?us-ascii?Q?dOheJ8/9M+/G9iSoZcfF3kzt8nn+4odbOUvcrqCUQTM1OnMsydbTNEF6DH+j?=
 =?us-ascii?Q?F527BvW1OpcfqsSQGyLO4ijtud9XdtLAQJvIoJ8fygAb5X8QugpYHsFti3Ew?=
 =?us-ascii?Q?HEj/IcQalMJo18jsLVX4sN011NnNNB26AxsOeQEzOEvfzfXL7Rh6WiYitjED?=
 =?us-ascii?Q?x+l+a+dxtwaJkaFRR4co+1t4H6PtiqskJXhTcf0AYPA8mDiKo3y4OGZXelvJ?=
 =?us-ascii?Q?8CSl9FDuIZO+LJqd+u/N4rTDA3cKr1IAwic4UKonulj/liHYlTNBzj3RlIGj?=
 =?us-ascii?Q?Ocj3PWD+ZOYDjqu49XR+M4r7mMHJLdm3mBTXF/iRkdLhiwMjEFmAkYnAtxlo?=
 =?us-ascii?Q?Br6temCPDubRppjPa4MZWlx/CSD9wlSww8m9LhdRglVtG1J6Oj2L9f5BRRiK?=
 =?us-ascii?Q?cPOFTKYsi6LeyP7Ng2dWOVUYlGxqUULu3Ayj6MUsq6q9HISzmU8JsuEqaJa0?=
 =?us-ascii?Q?jTIn/q13x8IBLhkBLKvghjcuBZApqiikEgVnXZhku/jboAjV6MbRDX8KF+CJ?=
 =?us-ascii?Q?4WPrTy/B8urXTH6LQJ5ruQE+e6cx2DB7txUqw7CW/hVBupe9NSZg3ODYl8gO?=
 =?us-ascii?Q?3YVjKOMaw1teZBjgtubLN5AU650q9wVUwt8mksEETNcJWeann0gOeLxgcLyR?=
 =?us-ascii?Q?PlGsvcpq3d+xLfCDaLnuwhsveodx6lJCMLBKOncc1b9GleVbeL9FHyZmI1YQ?=
 =?us-ascii?Q?rkheM5HjJu0k1Wp2N0ZgLhI3cnlsOQh1MeluWmMRHrlxKG6sW/OZR1/EHwzX?=
 =?us-ascii?Q?g2l6ljNo7VDzGTr4nHMCA9ofD1hxn7yQjM3lEG0ipFlsrL/PqB0rOW42YjeF?=
 =?us-ascii?Q?r6c2R24cIzaScNe4IQniy9TQKUBXF7r5MICfC5sOQf0/cBjy+rZOth0u/5F0?=
 =?us-ascii?Q?MDPtYSNb5eiFojLe+EODUZUVK0LZ/JJ7HItWEOHIE0meJqZIrz8MNFePjJtU?=
 =?us-ascii?Q?tncL3UUQpE4KLr5z5wfTTPXGC8AsB8TYSzmcKOigc7GstNRaqUyMisBlF62S?=
 =?us-ascii?Q?U1518CRwrOoT3+nYIynXoMvqVdZ/1FlfOxnqvJTUpVAa/Oa2eQkbXyZNl7Lq?=
 =?us-ascii?Q?YYcMuE9SH0z5m4wf2MAvUB1uwT1+oTyRW/fJI5YTmKNXrDXtGv1syniCg03R?=
 =?us-ascii?Q?rgUSE4asv3Z7NKaOg42Zn8Y=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b6c49af-245f-4293-c71c-08de2cf58904
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:10:21.3664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yY9pG3YVj/vp91vDIOAdlo0fgyIofNjpQN/ktvAVlHYSqw+wWDmHn5Ed+AyDnHJCu8fUL/HL0r82Axl0MC/WkgFuNc6ywM3OyKfebzfEdrYNKE/BHZSb9RA9YTgIQ4eO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6804
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

The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
Processor (VSPD), and Display Unit (DU).

LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.

Depending on the selected output, the correct SMUX2 clock parent must be
chosen:

 - Index 0 if LVDS0 or LVDS1 is used
 - Index 1 for all other cases

To support this behavior, introduce the `RG2L_DU_FEATURE_SMUX2_DSI_CLK`
feature flag and extend the `rzg2l_du_device_info` structure to include a
features field. Also, add a new helper function `rzg2l_du_has()` to check
for feature flags.

Add support for the RZ/G3E SoC by introducing:
 - `rzg2l_du_r9a09g047_du{0,1}_info` structures
 - The `renesas,r9a09g047-du{0,1}` compatible strings

Additionally, introduce the missing output definitions
`RZG2L_DU_OUTPUT_LVDS{0,1}`.

Introduce `rzg2l_du_crtc_atomic_check()` helper to store the routes from
the CRTC output to the DU outputs.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 51 +++++++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 42 +++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  | 11 ++++
 3 files changed, 104 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
index 6e7aac6219be..044ac16256c7 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
@@ -64,11 +65,34 @@
 static void rzg2l_du_crtc_set_display_timing(struct rzg2l_du_crtc *rcrtc)
 {
 	const struct drm_display_mode *mode = &rcrtc->crtc.state->adjusted_mode;
+	struct rzg2l_du_crtc_state *rstate =
+		to_rzg2l_crtc_state(rcrtc->crtc.state);
 	unsigned long mode_clock = mode->clock * 1000;
 	u32 ditr0, ditr1, ditr2, ditr3, ditr4, pbcr0;
 	struct rzg2l_du_device *rcdu = rcrtc->dev;
 
 	clk_prepare_enable(rcrtc->rzg2l_clocks.dclk);
+
+	if (rzg2l_du_has(rcdu, RG2L_DU_FEATURE_SMUX2_DSI_CLK)) {
+		struct clk_hw *hw_parent, *hw_pparent;
+		struct clk *clk_parent;
+
+		clk_parent = clk_get_parent(rcrtc->rzg2l_clocks.dclk);
+		hw_parent = __clk_get_hw(clk_parent);
+
+		/*
+		 * SMUX2_DSI0_CLK: if LVDS0 is used, be sure to set 0b.
+		 * SMUX2_DSI1_CLK: if LVDS1 is used, be sure to set 0b.
+		 */
+		if (rstate->outputs == BIT(RZG2L_DU_OUTPUT_LVDS0) ||
+		    rstate->outputs == BIT(RZG2L_DU_OUTPUT_LVDS1))
+			hw_pparent = clk_hw_get_parent_by_index(hw_parent, 0);
+		else
+			hw_pparent = clk_hw_get_parent_by_index(hw_parent, 1);
+
+		clk_set_parent(clk_parent, hw_pparent->clk);
+	}
+
 	clk_set_rate(rcrtc->rzg2l_clocks.dclk, mode_clock);
 
 	ditr0 = (DU_DITR0_DEMD_HIGH
@@ -248,6 +272,32 @@ static void rzg2l_du_crtc_stop(struct rzg2l_du_crtc *rcrtc)
  * CRTC Functions
  */
 
+static int rzg2l_du_crtc_atomic_check(struct drm_crtc *crtc,
+				      struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
+									  crtc);
+	struct rzg2l_du_crtc_state *rstate = to_rzg2l_crtc_state(crtc_state);
+	struct drm_encoder *encoder;
+
+	/* Store the routes from the CRTC output to the DU outputs. */
+	rstate->outputs = 0;
+
+	drm_for_each_encoder_mask(encoder, crtc->dev,
+				  crtc_state->encoder_mask) {
+		struct rzg2l_du_encoder *renc;
+
+		/* Skip the writeback encoder. */
+		if (encoder->encoder_type == DRM_MODE_ENCODER_VIRTUAL)
+			continue;
+
+		renc = to_rzg2l_encoder(encoder);
+		rstate->outputs |= BIT(renc->output);
+	}
+
+	return 0;
+}
+
 static void rzg2l_du_crtc_atomic_enable(struct drm_crtc *crtc,
 					struct drm_atomic_state *state)
 {
@@ -296,6 +346,7 @@ static void rzg2l_du_crtc_atomic_flush(struct drm_crtc *crtc,
 }
 
 static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
+	.atomic_check = rzg2l_du_crtc_atomic_check,
 	.atomic_flush = rzg2l_du_crtc_atomic_flush,
 	.atomic_enable = rzg2l_du_crtc_atomic_enable,
 	.atomic_disable = rzg2l_du_crtc_atomic_disable,
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index 0fef33a5a089..73ff095e49ae 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -51,6 +51,44 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
 	}
 };
 
+static const struct rzg2l_du_device_info rzg2l_du_r9a09g047_du0_info = {
+	.features = RG2L_DU_FEATURE_SMUX2_DSI_CLK,
+	.channels_mask = BIT(0),
+	.routes = {
+		[RZG2L_DU_OUTPUT_DSI0] = {
+			.possible_outputs = BIT(0),
+			.port = 0,
+		},
+		[RZG2L_DU_OUTPUT_LVDS0] = {
+			.possible_outputs = BIT(0),
+			.port = 1,
+		},
+		[RZG2L_DU_OUTPUT_LVDS1] = {
+			.possible_outputs = BIT(0),
+			.port = 2,
+		},
+	},
+};
+
+static const struct rzg2l_du_device_info rzg2l_du_r9a09g047_du1_info = {
+	.features = RG2L_DU_FEATURE_SMUX2_DSI_CLK,
+	.channels_mask = BIT(0),
+	.routes = {
+		[RZG2L_DU_OUTPUT_DSI0] = {
+			.possible_outputs = BIT(0),
+			.port = 0,
+		},
+		[RZG2L_DU_OUTPUT_LVDS0] = {
+			.possible_outputs = BIT(0),
+			.port = 1,
+		},
+		[RZG2L_DU_OUTPUT_DPAD0] = {
+			.possible_outputs = BIT(0),
+			.port = 2,
+		},
+	},
+};
+
 static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
 	.channels_mask = BIT(0),
 	.routes = {
@@ -64,6 +102,8 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
 static const struct of_device_id rzg2l_du_of_table[] = {
 	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
 	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
+	{ .compatible = "renesas,r9a09g047-du0", .data = &rzg2l_du_r9a09g047_du0_info },
+	{ .compatible = "renesas,r9a09g047-du1", .data = &rzg2l_du_r9a09g047_du1_info },
 	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
 	{ /* sentinel */ }
 };
@@ -74,6 +114,8 @@ const char *rzg2l_du_output_name(enum rzg2l_du_output output)
 {
 	static const char * const names[] = {
 		[RZG2L_DU_OUTPUT_DSI0] = "DSI0",
+		[RZG2L_DU_OUTPUT_LVDS0] = "LVDS0",
+		[RZG2L_DU_OUTPUT_LVDS1] = "LVDS1",
 		[RZG2L_DU_OUTPUT_DPAD0] = "DPAD0"
 	};
 
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
index 58806c2a8f2b..c6f9dc46ab31 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
@@ -20,8 +20,12 @@
 struct device;
 struct drm_property;
 
+#define RG2L_DU_FEATURE_SMUX2_DSI_CLK	BIT(0)	/* Per output mux */
+
 enum rzg2l_du_output {
 	RZG2L_DU_OUTPUT_DSI0,
+	RZG2L_DU_OUTPUT_LVDS0,
+	RZG2L_DU_OUTPUT_LVDS1,
 	RZG2L_DU_OUTPUT_DPAD0,
 	RZG2L_DU_OUTPUT_MAX,
 };
@@ -46,6 +50,7 @@ struct rzg2l_du_output_routing {
  * @routes: array of CRTC to output routes, indexed by output (RZG2L_DU_OUTPUT_*)
  */
 struct rzg2l_du_device_info {
+	unsigned int features;
 	unsigned int channels_mask;
 	struct rzg2l_du_output_routing routes[RZG2L_DU_OUTPUT_MAX];
 };
@@ -73,6 +78,12 @@ static inline struct rzg2l_du_device *to_rzg2l_du_device(struct drm_device *dev)
 	return container_of(dev, struct rzg2l_du_device, ddev);
 }
 
+static inline bool rzg2l_du_has(struct rzg2l_du_device *rcdu,
+				unsigned int feature)
+{
+	return rcdu->info->features & feature;
+}
+
 const char *rzg2l_du_output_name(enum rzg2l_du_output output);
 
 #endif /* __RZG2L_DU_DRV_H__ */
-- 
2.43.0

