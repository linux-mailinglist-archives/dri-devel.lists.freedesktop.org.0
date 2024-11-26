Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8879D9171
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 06:44:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE0310E112;
	Tue, 26 Nov 2024 05:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="aMAJoMTq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011017.outbound.protection.outlook.com [40.107.74.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025AA10E112
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 05:44:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8z9oyibkB/b49rVLpcFht22lOxAhfXUSFOyWIKLPdRYOdSTgXUAuDeEUk/Ul8I4Wep3QM4b8v7rqrsLtZoQ4jvwgnQze10u3FuvGCsI2G348r7PGBUwKa+Tzs+JidFHozQdh7v5hgRrZM0HoWOTtpsCZ5ogVpRPpXuTyM8h/8+wQ1j4G5IXaO8jfkhXcEW6CgNKQIqypikJopZF8YbUbFVxFTWdDpgGkiJQkDn4vq3Mk7noTG9ebwgo2T5uiy62kW8Ql5eBGrau2P6X4m2J0xGsWQnDuIWrzZDxnCgU+20j0M552dxsnBvwNh0O6Cu+fJrOOKHgsrYUV4O2QKCnwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZdFGTdJN3ehcbxazPVepBkaAaWOXkTkIwh11C2cDNc=;
 b=vlNBpyA8eJ95eqE/+GoqGCt/ArVX0sLT11zhtyjTCNebqZHkvy8KR4snt09L004x/scS9X3G96V1M5AU4ALRL1++3WOKy8xuc6xNm0TmdtpFPV5hwrr8pKBOkaRHK2FVbrD9Bo21BRqUHF/oYrcPcUylFDIjkfIrX/TKcuYTnu4xOho1W9z8hxHLadQ96U8UTZqeWu9KaXe+jidnyxEFcObLsAyaL46drJXj+tZCmf4ylKqzjnnopKpQUKiww1yNttyNnKm56Vn113iH1ZQG3IFkzKiTsc517NlIYve9lrzQI1nOfdlOzROdHZJuLo2+HC5U0oTPH2WzgEM5qLKAfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZdFGTdJN3ehcbxazPVepBkaAaWOXkTkIwh11C2cDNc=;
 b=aMAJoMTqZ++76zdhCxdJ5EZayPt5ql9UK9HqDvWkEkAT/8bCtvdgNTojJsbKnE87Yi1tj7xDuK/aiSorapFzqZFMEGnKid/Ul/DTgeXuNOW5OpIVFNDyV0j/8oAmEm5IP6M4X7vLAq15Zewh+vdRCnHAkhRftZ/hm7uWiz9oaHI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5926.jpnprd01.prod.outlook.com
 (2603:1096:604:b5::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 05:44:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 05:44:01 +0000
Message-ID: <87mshmsg66.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v7 1/3] gpu: drm: drm_of: replace of_graph_get_next_endpoint()
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
Date: Tue, 26 Nov 2024 05:44:01 +0000
X-ClientProxiedBy: TYCP286CA0133.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5926:EE_
X-MS-Office365-Filtering-Correlation-Id: e94eb804-44f6-4c70-cf06-08dd0ddd54c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mMiBT6h8nwT3aQnbCoM/a0+N9vnBmMHpgLlxoRHKG7aWx0vjZaAn4fpGxjE9?=
 =?us-ascii?Q?iMstxoq3ybeZ0DyOfwaZf5XP7EvHRsR3epAgBp7Gg4tiGGe9g0nZU5gRbxVd?=
 =?us-ascii?Q?1zHCzNac89AQj/VutwK0ddkh+TeXt+tCteelwlNZwqQqOzzNT05aa+2OvLwq?=
 =?us-ascii?Q?cerrI7lEs//YEDTpCwiB2XIMjk+Mh1zl6icylQha7957IWlnl8sxUFS8dT+f?=
 =?us-ascii?Q?rr+WiS750T26xUIlQOJWVIPxLjOLUfrSWsycuLLb4R93FXc6P15bHM0KXWGE?=
 =?us-ascii?Q?TbeHwuG6XJZWoQ3YpT0bcCRcHLucVjG7o/6W2Hy4Dk+S3rhIHPJwosz0AAO5?=
 =?us-ascii?Q?Udk1+2ZWF5JhXckzykNUxDsY5cGyYXbXIFbMD8kuEzBbvpeBN5T/dynffH+k?=
 =?us-ascii?Q?tDKZ4/MNARuj9n7p/z7vLYvLpEUG0sgdxs+2bw1+pnsJBNGxu1sRV1FoYYzP?=
 =?us-ascii?Q?qrWEChrNHM9Dqi9ZhBLAtuRxD/41zPTELAtHTcEsaZiej7en/ccpu4o08vCz?=
 =?us-ascii?Q?qt7b/TWrX5LB3yTK6tW39X6zYw7OMVV9G1Z1uZN3Qg90S4bh216hKqOsiio+?=
 =?us-ascii?Q?hCaH/fWeRiEfDnpa1f1kiEdkputjzcg8nmgZRD6o/qYn0W6+yZAfOahOGpHU?=
 =?us-ascii?Q?EUI/5bJ7PF045CdmoYBYKpGnC3TgWGgVz6/x154SX8eb/pepR++9nxmvU6XG?=
 =?us-ascii?Q?JJ2LAvDZS3BqtwNoO7pX2qmh527aDuac5/zoTVIaVucGMTUAsJ1a2sQKeJeY?=
 =?us-ascii?Q?iLHNQRp/Z2nL36Um1pZWSYzsDK9X1ib6biEiKWGrfmOEmBWAfHLZfceAp069?=
 =?us-ascii?Q?OVD1Ovnb2nNoywoV71hDpvUP55v3cwCEu540SeeELKq8BbxP58/MjncpKVNG?=
 =?us-ascii?Q?obq91swqANRk/rYKBQYozoRa6mTvxRDlaApMPbdBz0vfraDA6Vu73ALtuNu8?=
 =?us-ascii?Q?4EcOSgCOgEz+9WsKLfqvOAKsDzumqHZ+8ddJnTItd5lcQdj/QkOXlUrQYewB?=
 =?us-ascii?Q?h+8/gYo0iHrAgTyCJ4LwGvK1Tlo8y6Z0PHC+H0hmNpp2eGkYwmZ9ycvXDc5k?=
 =?us-ascii?Q?rkwdLJ1nIz/W4bY5Iu7GpzRVGCQjpf7wu4+CDKAINA4+Gej8X9Zr18wEc+7k?=
 =?us-ascii?Q?d23IOOCthJoxG45asni78cgmXzPluQmlvKCx2b/l2ZHfUxTZS0EKbWVY5KDr?=
 =?us-ascii?Q?nxVrztynolUe5pqwsBXGzsB554m2+1lBkkleXMWxpRT1UcisOwSqQMyqN4gN?=
 =?us-ascii?Q?nk+cS7UPf9amVUe7pTUdPaoEB6Q46pX3zE823nuv/j9afq/wloYllT4OOEnl?=
 =?us-ascii?Q?PW9J/z6C3b41Z8AZm1XvVlwiA1Oms9zHDjj6teilQakvc5H9oH7j8L5qXKXt?=
 =?us-ascii?Q?YShD6/tdWZnDM/yeLrgF82oQOUy+xtx2oPO0N1Vs00o0pxOmwvOU/ZaF7VZt?=
 =?us-ascii?Q?RwDZTPRStFc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TGsRtvZpyEsQe/X56BaGS9pYet6aHgeWyBjEav1O4DRcP0vOXS23OSPK5NM5?=
 =?us-ascii?Q?i859VpqHYOCXFxdY7heqCZ8tfJVsKVSM37ff37eA+WydVpIwXXzQsTpLGxxG?=
 =?us-ascii?Q?hpYgfM3WCo/fznoxwGB2Ynnik3YpXKKvUcHX172OAnd8hUkahxrZYDhmaFEo?=
 =?us-ascii?Q?vgA80qmBHk0nYJ527a1TEERJUahpWWph+wOd3V6UosUS41b++47G33/yVRNa?=
 =?us-ascii?Q?81x1yde4YTGkesTziJVERTBraOKGzrjQvALZAj7lO0yRs3BJoMcnFl+n7mAr?=
 =?us-ascii?Q?wEbsx9+/eHe0MJFvVJrMv/E3SXP1w6+rcDJKPuD0NkguvWlA11NDjVTfgVER?=
 =?us-ascii?Q?dUUEeMp5fvNRW3kvxWRAoUxvewp+v+/e54ms2zHJyjj4Z8bfKLlHN0gvLZ13?=
 =?us-ascii?Q?RNRIks3JklcLMNt7Zq4yQoZ3j7oLt4vx9tSM3stWermoA/JpdfGg/NUk+V8f?=
 =?us-ascii?Q?5TW3+g9o1pEb2qCbCZIw0A7UeKQ1NwP1pVa/mmzOxAFojWT6B03Pq0iUin2Q?=
 =?us-ascii?Q?Xu/WE1nkCPiZm3LtfEQlKrXKVxIdM6hfrh49he2HzaqoCT1tDUg+9RGATZGi?=
 =?us-ascii?Q?fkv2m+PPWpgIDMvycOW56ILpUrJtpBs19tQp7oH9nVlHJi1tcW066fXPyqt5?=
 =?us-ascii?Q?RUMQcNhwCuDUxH7hkk7mANuGRJfHl0vy9VPPH64iOXrrCwCEn6KsmAcreP8E?=
 =?us-ascii?Q?C5mNfvQwJXzgpXezZIJIagzPHN9TLMlIz5Z65Sr8N1w0pXu44N/naOkoBMw6?=
 =?us-ascii?Q?8c4ryJoTdvwknueNPlgUHisHH8o+gsXd6My4Y0vgBGOmHeMcpIbIz5FKDT9P?=
 =?us-ascii?Q?h8lCzkM/wZwh0fX2LqfRtDLs2EZkoAwppkBFjYiqbFGmd+z56MbhcMoP7jbM?=
 =?us-ascii?Q?FwRnZ5kp1quk0GeZ/DwPBdFSIccE/xtc+ATTx4TtDti479QTNj4QrIeJW0lp?=
 =?us-ascii?Q?Vz9w7VI9gw2hJ8apymThw1Z64X0/dwkklVEWi+Ehy6dWAh6R1a6XJivAaRJc?=
 =?us-ascii?Q?IIQaFBIUpsNwwMFUn443kAcHMMHlhLahJU+k8lneagd6YH8w+TGXZrgyXSDv?=
 =?us-ascii?Q?BuEpLHtJhG7es8TWevbq2pbTrs5G/d7he40u4nJzZSVy2qXbfQzYQbTwbGxx?=
 =?us-ascii?Q?STRhZyoX582Jao7O67kj3AgV1+egtQjgzCGfHZVMHuyjghie4NubPTnFXdge?=
 =?us-ascii?Q?5bRX6SnAbuhp036LfX8iS/EzE4nJqUbzJybkjO73Ra8fGJzCEiVUPwIgl8UO?=
 =?us-ascii?Q?48Snnkhqt5NJqlocl7ZoEC65ENevOCLm1VPL9yHS/12otr3s4XVTLkH4WkBf?=
 =?us-ascii?Q?c2K4Gh3IqjwTYueZuK6fOQe9/f7029/3UqBp7mXX9QD6MgxUwjAbBYINC8xW?=
 =?us-ascii?Q?rdtWJA44it3Y+wrJTt+a8o74StS08LZUtVD1Kf63VKSbDNRIcKdRnLq8L4nk?=
 =?us-ascii?Q?kcpTGvyKiRqtoU4uodPeYXUJ/A8X51Nu+0FbagWXUemL1RB/fhHVwNLYTbQA?=
 =?us-ascii?Q?qO9cbd7KbcSK3GHfOarFp1G0f+w3BeAaf81b/rCsenAGK7ejAr6oNr+aLV2h?=
 =?us-ascii?Q?+v0H4kSnaazBXq5TBQ754H1Uaa/1EJ1uBOTdQDKaHr5aPUpFRINt7mx9B3IC?=
 =?us-ascii?Q?rWud6ZP67oZ3u6fg0aFk3wE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e94eb804-44f6-4c70-cf06-08dd0ddd54c7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 05:44:01.8591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iYBv2JwcyXhzzZelwEsskEmGuU9INJnldkPM2CsX6kjHPs5ODvK/ujON8XUw1wccHRBSh7fy0Un0dTbZb6DwTo841+Bj7eujvCU9AY4z5AL7lIoeCmEgRh+bcdkMQyF5
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
 drivers/gpu/drm/drm_of.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 5c2abc9eca9c2..5530919e0ba05 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -564,6 +564,8 @@ EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count_ep);
  * Gets parent DSI bus for a DSI device controlled through a bus other
  * than MIPI-DCS (SPI, I2C, etc.) using the Device Tree.
  *
+ * This function assumes that the device's port@0 is the DSI input.
+ *
  * Returns pointer to mipi_dsi_host if successful, -EINVAL if the
  * request is unsupported, -EPROBE_DEFER if the DSI host is found but
  * not available, or -ENODEV otherwise.
@@ -576,7 +578,7 @@ struct mipi_dsi_host *drm_of_get_dsi_bus(struct device =
*dev)
 	/*
 	 * Get first endpoint child from device.
 	 */
-	endpoint =3D of_graph_get_next_endpoint(dev->of_node, NULL);
+	endpoint =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
 	if (!endpoint)
 		return ERR_PTR(-ENODEV);
=20
--=20
2.43.0

