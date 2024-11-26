Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD079D9173
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 06:44:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF40E10E797;
	Tue, 26 Nov 2024 05:44:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="XS6Uhl9K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010032.outbound.protection.outlook.com [52.101.228.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0133E10E797
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 05:44:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eYP8YS/SueQjU7zXzvboiCq3XL9cMQyeGzJalQ46+YpdcclSe7ouq7fF4At61515r8oLeR162Lo1Lzyg40WpGadyUfFdHjbaIwkN2vnsrxVcCXtRc32DKOm4EiBNUg5GetreW8LC8GlJJcnRO0GUBxa6RLSK8D1RnSqx5HItfjM3jg00arhgaUNXoh8CaXXKpOd5a6ELIKU1gT0Xg4cgln3chVG3Xcp7w1bxnfOixvqYS3KVWlMx2TZGtFX9qcRJ2K/P0NTUPsSvkWvuPI7h+AWmgL98BNPsDzYChpknzGgQ1eDf3W/tBMNYEMPbL37e5FaWlY/VgsM460LH7Kggrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udl7J5wn14L6EW8DM/hP8ym9IDGix02EPivGCK5FMug=;
 b=LiJCdF2dyTuJsGAyOY+wI2omdbf3EYqJD0cu/94BW8HQJOtTVJf2laNkJ4d3D7qiiiRI5/Dl5voX4cniT621VjOk0eUcCtzpeuyn0MB1RZeIfWzLg6OgCs0ewQy6yj+BFxMNsRKmhgj/vKdKfE8KXc54EZWWyJGSlBOpbP67sDovkz/DeB1hWLn67XTJ6opGS9kTJKO8SX6Q8mP8xV3I7P5izKDboYM5mA+/8qt2OmBs9y6JAd2SoVFOOwNRjuPPFCTAZqHdXoQrk2huTcDqoJ8tJAuXpNdwECcjGzPFnZ8wENu+NG5GEdP1JHMf67RX55L8qyybYoVlpHBHtqUcEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udl7J5wn14L6EW8DM/hP8ym9IDGix02EPivGCK5FMug=;
 b=XS6Uhl9K4e6AI6ysA13Yer4UFTiwJPHMR6vbzplBsQ73MMydmERzyGrF2JzxDzuv0QffI1q5HNcKxmYLqsE2UOWD3B+2cPSad1qucpnF+72NUn8wLi4crz2Bh1grZDe9g3oaazR1gvWp+5jTSvPtmqY8PwPZeMcBj0uIblrM0Sc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5926.jpnprd01.prod.outlook.com
 (2603:1096:604:b5::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 05:44:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 05:44:06 +0000
Message-ID: <87ldx6sg61.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v7 2/3] gpu: drm: panel: replace of_graph_get_next_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Rob Herring <robh@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Thierry Reding <treding@nvidia.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Alexey Brodkin <abrodkin@synopsys.com>
Cc: dri-devel@lists.freedesktop.org, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <87o722sg6y.wl-kuninori.morimoto.gx@renesas.com>
References: <87o722sg6y.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 Nov 2024 05:44:06 +0000
X-ClientProxiedBy: TYCP286CA0246.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5926:EE_
X-MS-Office365-Filtering-Correlation-Id: 3129fc83-fd29-43c6-816c-08dd0ddd5793
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yIvjeOtudKGWPLYTVJgiM68kk3HiN/Ng6mKTPmHsrRYh+SPVkhxWgveY/+mG?=
 =?us-ascii?Q?Nhi/z0KdPPR1qaqd89+Ky/I2EjIbwNYxZkpwFlMfKKckhMDppqjbowfWG+As?=
 =?us-ascii?Q?lV25vhi2CBlPowMCM8WpOlHubh8iOSCr01FHOHGCZLRe349yjm71g4+q1p4y?=
 =?us-ascii?Q?Lv5sAYOV9kgHhFGtOMOuSsTpLRnla1N9ngtV6xGlVla7c4jHPMCZw/5lrjoQ?=
 =?us-ascii?Q?5AXkBXXAUeC+veX0PxmlVU49FsmF75yQnbQMKZ3j0cDid6PP/sze4kYLZYpt?=
 =?us-ascii?Q?MSFoguT0fFfGI5Asfva7SUCh34TKe+JlyR0y0qV5qj+pA8JivSmm/9R3mfh4?=
 =?us-ascii?Q?YV5uOTI0qheMs6FC060zbo0ecsOi5eZ4gr3/tabIVYbB9CnNoIQ8W1v1ATLt?=
 =?us-ascii?Q?IkDbBexAPncC/sBy6myIve3ARO2I96jIM2af2TFKlR2wmLOvvOAUKApI5jOD?=
 =?us-ascii?Q?NHkn002oPZV5sCdgzqz9uO3CpkOtSMCgFsjtW81iawzo/bZVE6SXWXBZ6ywB?=
 =?us-ascii?Q?/Eka2hU1Adb8GEm1hzwMJ/5SOoWoRL+I1mlot9OHcBuY5h4+yWvXUlT7GkLM?=
 =?us-ascii?Q?dSm3D4DHkjW5Z7FYhKeuSxiilrN7dSEbqnyTdXzWAVq+Yqp1Zh/FePuB4ZSN?=
 =?us-ascii?Q?1ZS4cwRtJzevu1E6a/tZGZmGkBFyGk44ASHl62fYOydw5SY+no4ozoBVvjqr?=
 =?us-ascii?Q?JdF7dZFBcrbgRu0u/WEf3xTDs1bYxRFwazNDV/zgCUUoFruFeLBRi6IvA8bZ?=
 =?us-ascii?Q?R0WEmiCKCZ6Ovo9rMK9a0Qh0JK2du61pVS73kpXaPLC/CDg0uaBzZFbEoVsz?=
 =?us-ascii?Q?4iUq9VPHzHzcCBNwpJCJ48sNYG+nSUyi1nHBDTowGBHLLT/hkGfhJeLgacFu?=
 =?us-ascii?Q?8+GCwBqsPoHrAoQbByQzv/8BaFvPVqr6FB5xD6rPA7xST+rif6PwxCtjeT55?=
 =?us-ascii?Q?EZkf/RNJH9N9Mof2fr3lNgdTa7eL8R+Gx59Utgf+JCp2EWOHF3A+u4Xifn3i?=
 =?us-ascii?Q?ss0OzKsCZOn4l/8LMp6fyJicJdg+6tqFWVcMoDPHhinlz9PMMJ2Aw94DdMAw?=
 =?us-ascii?Q?6RCamHkNPfQebcshFH48tYFzRPsZMZuyADjC8bl/jjJJtinFiLWWyNGEZJye?=
 =?us-ascii?Q?wqpFUj1XCmWE6oJoVkEHt58n+frpc9DtS4gwcSHjhM4zJA/VtNRI/JczIAtP?=
 =?us-ascii?Q?fJmkJU0zZuZIuVLedvLgkgKsETQpSgeuMCEzP03lNJyL28NI29e0LS1iA8nw?=
 =?us-ascii?Q?131x9ToBYX2I6nkLx/aj1JdpRDcY54gq3Lx9p0zy9DxK8vQds8zFTsYL1zU2?=
 =?us-ascii?Q?lgqGaKFiG1JfQ0fPcv6y4YnithLN596HSU+wM75mimOgK8GS5fWPQftItxMR?=
 =?us-ascii?Q?sewyVq0iTCo35sSJFoqh+hen9ckMYWJkJI0ul+8BkAqIsfzOy1G8RoZx7Rsw?=
 =?us-ascii?Q?2hRrW6iLLMI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mMzCbvi7mPP45Vlp83dCHfP6U/Ez/SleyxaXkM6dvfLws+MUgrDiL8PwpSFn?=
 =?us-ascii?Q?MxpZuck/8P95FKumEr2ZbMNtBhYkydEar9TVkOX4rfjFgGoKkT/SKB6RozrM?=
 =?us-ascii?Q?xg9j1OeNDJaxvNy//wj1Mk2vqFyNUjE3GFYSejclB6LadbRAxTBY83EGO/Q7?=
 =?us-ascii?Q?ed4CIrMZgU2+ByyeSDjoUSVxelHRiY/6eSQjiPEikRaewhL3vPdgp3e7qYWs?=
 =?us-ascii?Q?csVfdpi/PAhG7coOxW/cCWcI1tFCaODHBbS2twjTrw/RufyB3SVMTVfk1PDh?=
 =?us-ascii?Q?RDrWUyFU4OXO/AU20eVOyYg3gjpigVnBPFAdObN6QiiYvRhrHuhecVHtVNBW?=
 =?us-ascii?Q?BiTgT1nSfh5JBl9FwQAdMdDXTDU7XrkIV8fWxpqm+xxtCIK59f3C4wAAUsLK?=
 =?us-ascii?Q?S9HpYzJ8YTROmIdyvdq5sqKqF6E/t42YCFbdsOwHry2/PlmnEJ19ymymSReL?=
 =?us-ascii?Q?GPa8ixEXdtoD+4MidG1SQJvujJ7LKm7aZ5kvvVUIRUsz85ov+vRlLByqxdFA?=
 =?us-ascii?Q?E1a4cPVb3CD548VonE1hZgeJElEZcvVsQZelTjHbTkKARBkOEzLBp6Zo3x0/?=
 =?us-ascii?Q?MDgenABEIsz+CG0dZB/pGHRq6/394FeH5op5JhOWY0IkA1PHcmN0B6I/aWiu?=
 =?us-ascii?Q?/ukOICBM4oD4WkEiQV5gpCNH+cPWdjgcbiZZEX82gDpA7VxI8jc8vTPa1fUa?=
 =?us-ascii?Q?wSEyFxI5rNK7oS3k9YtWbVbmhq4YWx+obzLi89vGRkrg8Dc9HHQJKao/VYRK?=
 =?us-ascii?Q?jlB9+Eu7GZevHpjrUau0MMNjZbRNqMYuRXEwcpwvKbXbzxR+dQsPWSV2sQ0g?=
 =?us-ascii?Q?uOPd1HBPdfrod8P2hVhw7ENOAc4t/fcJCXohEbipEKUjXG29ETKsQLNlLqGM?=
 =?us-ascii?Q?lXO+qMvWW4QzIp+qDJqNrNw182S7gf7WmUdoRPlHTWppcjPlatTsLbLFhehv?=
 =?us-ascii?Q?cqedDZgjbqfmINjM721vnYPo9cLVfaz6MeLqxCdch8NoBfn+pkhHGrOK33/Z?=
 =?us-ascii?Q?y3CizdR0zFqgmsl1hRFbl88ns+0uaMYDZr2uKtvFWxuFqdnboW+w8DbRyBNd?=
 =?us-ascii?Q?cnk6fS/kx9Pup09PMbJvfDGHTmG/R0T0PeM4phn0KbnE7Sk77dWwhiOTHimG?=
 =?us-ascii?Q?dxzrydYbX4p8YeQEdMSZ8VGe4zJLFzNpHHXNPgEwRZYJxPjeueRIUXBIrRM8?=
 =?us-ascii?Q?s6rAz5hsEjKuFsLaxh4LAHEQh72yj9NgBK2nmdgnxrbiS0G+d8vHfZI3LeNm?=
 =?us-ascii?Q?CKEJY34IlUIUueJdt8Gucj0lMKpOWzELVA1tUNj8PG6Ica4RZPbTBHeGbCC0?=
 =?us-ascii?Q?a6GUcb/pe+YRZKU3AKRBmZl5+fyAtaEno00E7ZKCxzw1gMKhINd9ihQr4qId?=
 =?us-ascii?Q?MDMIQmROFQbVEiG6c4A7KJf0f6Zk1tFCmcz+FWW8WC+SpXng0FUbbXPk84sL?=
 =?us-ascii?Q?o1Mop26UwGXL5TMSJe16hPfCN0MHHWPFb92FrrEl7oda65iQ4SLVF1k8xl99?=
 =?us-ascii?Q?dsleOeNbS5NQuLeJY2mMROVzoMnQQPy879/76TjkFo9/SMPnPXXmyiTBsTYJ?=
 =?us-ascii?Q?6spk6Nk/PLqMGp09MsPh1rw/Pc0KGr6ZYD7LXZPKK+YYH1UIJP1YtMzGTiT0?=
 =?us-ascii?Q?vlu9UELqAaoCMUkwm5aQtJE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3129fc83-fd29-43c6-816c-08dd0ddd5793
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 05:44:06.5809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tmF1JfGw+bxZTeOgnLbp0rmNjZqD7svhSok/jDDqmMk7Cf3iNn+tR0uuigmSBRECvnyBEAhMc5C4lEhyG0hyuhZpjnOjGVFDRzK2iyYqBJiDxh2UCFQDSzPkq/UrjsWC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5926
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

From DT point of view, in general, drivers should be asking for a
specific port number because their function is fixed in the binding.

of_graph_get_next_endpoint() doesn't match to this concept.

Simply replace

        - of_graph_get_next_endpoint(xxx, NULL);
        + of_graph_get_endpoint_by_regs(xxx, 0, -1);

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/driver=
s/gpu/drm/panel/panel-raspberrypi-touchscreen.c
index 4618c892cdd65..e10e469aa7a6c 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -400,7 +400,7 @@ static int rpi_touchscreen_probe(struct i2c_client *i2c=
)
 	rpi_touchscreen_i2c_write(ts, REG_POWERON, 0);
=20
 	/* Look up the DSI host.  It needs to probe before we do. */
-	endpoint =3D of_graph_get_next_endpoint(dev->of_node, NULL);
+	endpoint =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
 	if (!endpoint)
 		return -ENODEV;
=20
--=20
2.43.0

