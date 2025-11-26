Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4D4C8A2E5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:10:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03D910E622;
	Wed, 26 Nov 2025 14:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="lnqRe/Ai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011045.outbound.protection.outlook.com [52.101.125.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6AB810E625
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:09:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttYUAefk1I74Y2T3r/WTmIhR0KywZPDrjGA1vWYAqyTBT1d6kr9EwPfpNjNGu8XkXuNit+y6s5S64ercOh6XZs+cWLyJ6XIK2DhzNwLXMAFsD7zCwYnNmyhcHiHrmsgo/oKOWVjnGFFAPsarGLIQHtU14V41OknHVoOfeJXGPBE4MEvAj7v5cx3PgJnqIYvLqc+YaArXAIymSjfVf6MF5JLyEW1HdqGeB4gZsBYyQsJ7PUruWy5oVlbo0BmISTKQTSiqWAimMIkz49tQXEHFkka6NEEnJ7RGo4joVAfCfX8h+wFNiTWfOrbrqbhYfefbSG/y58Bb+gBgFalBTsFNIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Udd8BQYQRdXDRU8qXdFuaLVOPMvChT3wYL4xzV2DPgY=;
 b=xlfBTzDQ/LKcKWvBDzZw38eZLbtoc1LFcUO+qboieTyetgizu9egCm6RqPSX7nYmYxTFMa9PuSh/I1vh1QFBZEKX/DDl0y5VfRxM6jGiWXBQgzkzal66N8fJAKx5Ddh8fSsQSVLkZ+HieJMZcVEM1uSKG63j20jsz8TJ0J/EObpzTaCObNmI+okHioUhQA5ZUC20tFgYDfIadoq+fnD4n4PgGDPsD1mD/To0UmH462H8JkjWx8aSYh+xluojDWZkggrHYDk21ZXwUH67YcyY79WQwbw2+n5+UJtA4Khz5GS+u9eRfJExKJklsmG0863Yr0ijTwZbhw4NWKwcp5kNFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Udd8BQYQRdXDRU8qXdFuaLVOPMvChT3wYL4xzV2DPgY=;
 b=lnqRe/AiBHo8K6pBy5Rg4vGjnQRbPChMgePrlYPOc+0IYvDtnc2MVO46XT4IHF+BDcszgvghIf8slVVHhyhj5krVp+vVXgiFT3eyjB9e+02H1c/9Cxmh7iuiANHHcVVEZtk6FlBee79cNvHJ6VWLMwG429Pcuca0eb2Xp1/+7jI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB6804.jpnprd01.prod.outlook.com (2603:1096:400:b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:09:55 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 14:09:55 +0000
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
Subject: [PATCH 11/22] drm: renesas: rz-du: mipi_dsi: Add out_port to OF data
Date: Wed, 26 Nov 2025 15:07:23 +0100
Message-ID: <6aef512bc792f2aa14774346fec9e0e3768480a7.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: badf65b0-cdd0-4ef8-88ee-08de2cf57940
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b9siUPm81ypkUehdp8Q8k2XL8r1t7gKLlKJncdsze7I3TjkquBESJidalPjv?=
 =?us-ascii?Q?srRVD7ndGuk8+sNg75iiOqji1IfYYs2Ey/x7EFZzSWfb0ZRcDu/NqXHtCyAf?=
 =?us-ascii?Q?/8I5zsh+rKPVPje6PbJLZB7cIutAY+MNEjk/lvXQpJXABu2eA++ePwfRT79U?=
 =?us-ascii?Q?/CbFYgmiBVPDDZT3bHues6WDIAHe43+g3Lkc87+66xsnXd/3713g9pBPkduW?=
 =?us-ascii?Q?Dj+wUNuCpq2/8/4WSc0SDUFml1wJWuQf+Brzu8tLEcPOoJfxhyObPJbrMHAp?=
 =?us-ascii?Q?Jpn4ABNw6nzsR76hNmx8vG+ni29LfHj7MgCp+jk1/XLHkiogHXDVRPxraqmV?=
 =?us-ascii?Q?3dge5HEELdqIY4wrj0673Et2T1S0YrJ2hHcCv/HRb9NtMpzmflHT5lpopYwI?=
 =?us-ascii?Q?KK/+EbkQTCC2RdQz+HHtYdkLtMJ8YNzrILT+1K3ckrIr3ComI12CdBl2kHBp?=
 =?us-ascii?Q?v4oqTn2eSs2ZQ8z3aZgs1dJBcbzgw/slw2GgWEAIcLix4Q//7tx878OZdyLz?=
 =?us-ascii?Q?oM80FBGzTneqqu0lvSlLif60Pu6eA6v8joHPgl8TkXCXe/ff71DsHpvuMv58?=
 =?us-ascii?Q?DITFZd7w9iT6r/WCtoIoJ9MiFJEpFInzOofAcQ5W+ZwpYYa6oBQr3pMXdiaB?=
 =?us-ascii?Q?tqCebRqgc9BUN6pU/FHcUiGfhRRqAeKJu1k4mFEcSQdyKo7Ahk3yZO4kXBAQ?=
 =?us-ascii?Q?GHwFFvxZbz2mS9W4xGKdh6ONvJkDI543g8aCxFGyvDOTYNYaTlI48pzkH/3+?=
 =?us-ascii?Q?iyvEBP7iBCb1gRM925/HH3q8op3mRfkqWDPpzwyV+ULXHIzhqO1nqN6kFmUr?=
 =?us-ascii?Q?JLzXBHjLz/yejY0g6Z9N+bPAqcMw49Ir0BkvD8xLg+uh81OXaG7Rv14yTY5+?=
 =?us-ascii?Q?D4fNmMctGQVmqT7ER0DGVAVuUtjFqDyyuAPOQLsxIddewGCQ1sLy/9rw6XN9?=
 =?us-ascii?Q?NarI0l4PKgYebSPWunyrhxzyqo3lwh0xeSKSMV/QWEcSKRr9JLPOnY/mEZj6?=
 =?us-ascii?Q?173hlgrvOUPybcv6ljbPROLDiBsCGn3QNcpiCofLzwvfMFTzGRHfM/RI4tNC?=
 =?us-ascii?Q?bUS+Vl4ZUvXKshrHby1/ortO0i9pqRQlkbGMZowY31mm0uIu1uG3dcXUVdNb?=
 =?us-ascii?Q?KQXDh3VVK6X/Z6/7EWhs0M8yg6kVO55drvvw5eDetUwD+Hup/VZQlOjbFMM6?=
 =?us-ascii?Q?YSNP/Ax4IWqKMrQ5UESj/lIDeThxJEHElKSYH7lw6LYaywCCoVrNZJDEuUGE?=
 =?us-ascii?Q?4ZRGo9KrzMvUp0YVzZO7F0McPqDYoSJLnXX7P9mxP8U+yRDbcCbbxUZavYh9?=
 =?us-ascii?Q?w3bV/C+tLcr9quZe7SE+Xy3/rDd+mebuzYdsnejwIyjaX2LFSRz0uD6/hVZ6?=
 =?us-ascii?Q?mkXt0fUKAv/0FvToSTZM3/mKk4owNTtiTY6NIEF1ojb3XEg/v9XHQe+cl6cC?=
 =?us-ascii?Q?fUzW8e4JbFLIBKnZ9VO8Kw7WNXEeisuNU5Bp9ZxFW3k92kZH6D/BUUGQ6SlS?=
 =?us-ascii?Q?wSzJ32VYKK4HebE1T29pN3mv0NQdwDRFdCm5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zwo3VjwVh9QRTvAIaLPP9XUd2DImEOvCpA9zF4Ug+k8bGV/0Y6ey+snpwW2m?=
 =?us-ascii?Q?X089KdD4HuEil6nXwG85T++8+0Twalvp06JnCegb9idH0WlRrE7E2rL+Ppjj?=
 =?us-ascii?Q?MD10lHjUV55GDQLDZVk9lI4AoFOXSDlzWfzRP4N5g0ae032t5jD1boIYL9uD?=
 =?us-ascii?Q?WiWYZ2utaS1Y28m6eSobudy4EGkPIacdLAMB0x+IQE1hAXT4DwVrS17ZmNvB?=
 =?us-ascii?Q?4TDP589b+m/7UpuZHkG3+GTCXmEnlhvOkUdAPrvdOdxi5kby1lLEmR6nr8ls?=
 =?us-ascii?Q?CQCszJnjMC56injKdS8b/8TeWn71+O5uA/1DrSZbzjpgnjpN+kHMn24Mi0Eh?=
 =?us-ascii?Q?puDZ0WhACLxhpdxQ5oKM9yKKyJCF3fF3hhxvTgsiSKMJ4PqMokE8F0gb1qRE?=
 =?us-ascii?Q?n3xNVdtfb16DRJmWTm57bmcudS0PmXiva55NfxRerpTif/69YXVTuy/ufZkx?=
 =?us-ascii?Q?oyrYkx0GxLs8SOYzt8PVCy0PS8ZmHUKYL49w/AkhS4JTZPfe+FBLxGLZclUb?=
 =?us-ascii?Q?c6pc2WGyhzqTwe1ZW7dfvJ3lRZlgbYYFfgA6rZr9XRWPQ9qWGpyXx2wqMj4l?=
 =?us-ascii?Q?v9DAMdVysScdPy+HDKhrNB7CITnqiZBW7BVMgxl59VZmnOg1ioSnWpw4THqq?=
 =?us-ascii?Q?BCpuTtQh556gRetD//VnN1Bs/89YVoYKUxsK4+HwmeFqAHT6lfuOtp1FinUF?=
 =?us-ascii?Q?Al/jVDGZ+EXUmbuD72ZCELZ0ziZBMQntlU3j0ig5rE8GovLo5bnfNt51QHDz?=
 =?us-ascii?Q?CB14De/jZ/XFWXahLWYUnj6Et9BWOOpTXA+qONF5crTC27ZcJ5P2YylKn8SK?=
 =?us-ascii?Q?1CdtTH4q35xa+QHWN4+gpV2PBeNQohQb2G5m23PhTtcZYj9EPp+qUH7hV0+r?=
 =?us-ascii?Q?JC+TBAvjj3DXPKYTh/WsDp5r2rWK7cXhlsv+4i+ctvHkFuZk+8bWDcMqv2nj?=
 =?us-ascii?Q?LEObfijfPLnVNjX0w4EXuPh9OmZlKDgXUM24sDK2fEKl1epeGxOBj7yS3ZaA?=
 =?us-ascii?Q?j2m2XJGdXd0/74VYnbq7ohxOH1x4sgMkWqfqWTBrDW9YRUoAqODbSRBTvmki?=
 =?us-ascii?Q?lEKwLtRXcrg76fu5A22wwIpWgRL3gt3uMZ64wF8WXGdK4puChgB+8XGocu39?=
 =?us-ascii?Q?s6kbuzO7dC8fryfmJmv/KPEWFLygt/lCO5Swdoq0URcOWfmkHRnsJlFuMbEt?=
 =?us-ascii?Q?/IM9P18IkHnYLMA/R3Ey2U3ikoXC/d2cRvGX6WfjQo6ArxJ8IxMVqdHp4ZSe?=
 =?us-ascii?Q?4hT7JkskwAUZ8DD5ufvJ9bDziviWsyVoOPL52HLv2yeawQzz0QLpMsNJbnYI?=
 =?us-ascii?Q?JBGFr8jOAlja7ScyGp0p6RefgGKWCa6ejyTY7sk8Nq+d3/4xrdwuP8GDCbEk?=
 =?us-ascii?Q?S1qygu66Czbe8p2PaksHoRNweOY8iM4y1At5qT6DnEzxbMWw9nKuzUSTf6y2?=
 =?us-ascii?Q?osRbCuovMFCrhZfj+I/JgNHnmqgi2fzfQKLRd3XwN4O3EFTk1HVwzIPEnqtI?=
 =?us-ascii?Q?bxpZqY3mhuMNldlpsY/PY/8YdyyxFv2kWjEnFA5rqBDPZFCof3Yw6sEuvU0N?=
 =?us-ascii?Q?SHYSD78kNzOG9ZnXj1RYulef8c2a0tmVcwT4fkciJo293f+Y40V2mUpclAoK?=
 =?us-ascii?Q?I5RsnYVj33zenUZYBv/lbMQ=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: badf65b0-cdd0-4ef8-88ee-08de2cf57940
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:09:54.9359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tiA1owQY5Pp0mOnKV+NdbLBG0PtFnf3OQil3stBnxk1NJkfdHtuDYiwIhhxlGgTHdlsc1AtiswmHwnEC2gKoJSTvw4s0k7ZSX3RTtQsaSVNRbb5q2X2B+n7TpowH0BE9
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

Add `out_port` field to the `rzg2l_mipi_dsi_hw_info` structure to store
the DSI output port index. RZ/G2L and RZ/V2H(P) use port 1 for DSI
output, while RZ/G3E uses port 2.

Update `rzg2l_mipi_dsi_host_attach()` and `rzg2l_mipi_dsi_probe()` to
use this `out_port` from the OF data, facilitating future support for
RZ/G3E SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 5edd45424562..ccc2758bafb0 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -58,6 +58,7 @@ struct rzg2l_mipi_dsi_hw_info {
 	u32 link_reg_offset;
 	unsigned long min_dclk;
 	unsigned long max_dclk;
+	int out_port;
 	u8 features;
 };
 
@@ -1145,7 +1146,7 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->mode_flags = device->mode_flags;
 
 	dsi->next_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node,
-						  1, 0);
+						  dsi->info->out_port, 0);
 	if (IS_ERR(dsi->next_bridge)) {
 		ret = PTR_ERR(dsi->next_bridge);
 		dev_err(dsi->dev, "failed to get next bridge: %d\n", ret);
@@ -1386,7 +1387,9 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 
 	dsi->info = of_device_get_match_data(&pdev->dev);
 
-	ret = drm_of_get_data_lanes_count_ep(dsi->dev->of_node, 1, 0, 1, 4);
+	ret = drm_of_get_data_lanes_count_ep(dsi->dev->of_node,
+					     dsi->info->out_port,
+					     0, 1, 4);
 	if (ret < 0)
 		return dev_err_probe(dsi->dev, ret,
 				     "missing or invalid data-lanes property\n");
@@ -1500,6 +1503,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzv2h_mipi_dsi_info = {
 	.link_reg_offset = 0,
 	.min_dclk = 5440,
 	.max_dclk = 187500,
+	.out_port = 1,
 	.features = RZ_MIPI_DSI_FEATURE_16BPP,
 };
 
@@ -1510,6 +1514,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.link_reg_offset = 0x10000,
 	.min_dclk = 5803,
 	.max_dclk = 148500,
+	.out_port = 1,
 };
 
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
-- 
2.43.0

