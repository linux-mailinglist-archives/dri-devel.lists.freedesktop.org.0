Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C2D9BAB57
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 04:29:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8656810E364;
	Mon,  4 Nov 2024 03:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Oe4QOmlf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2079.outbound.protection.outlook.com [40.107.105.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9E810E361
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 03:29:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lx+UuNAWeuGbuDSgSNRuRFnirQn4tKV+Qcbg/9CPz3LOk9mZpNAH6WcXjlyv8RLacocHt+r67Zdu4PvXp9PwysI058b71r0+tkoqfmobWv7aoxHK8coQbDolWPN9gZem1a7M0naaCg583oS97X2HgTWkwPBrZFs89TlMXxJeKdwxK2Td7c2VWfHfX9DEKdlqnI3kxwJ+Jdy/7AApgbcqSReSVrfNCMNVUL43J0vxppbM1BRdv0UshtzmjxZBWOtKgcTuTuwLEznTLVMIiDOnhcAOYTPPU12UKbIW6jzqRHu5zL/ZEo1DrLISTbxFJ+DFLekknLfqhI5paNJHXPplcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBYb9b3yHPqkfA+6H7mw96HGKPaBZ7DvQfYniSyZpLc=;
 b=nD1RZyVNueXmFU3z5EzlyjcMDa1dtnTR6PhDJdaepVI2Rhw0WLp9XFyT9LbjR620ONfwL8Em0KR4JdpSN7oZ8IOaNQS7S3MkwZ20JXpXPGR3RkTKUPPPSfCWj7ZLbCMKjAxu3oPvXi3zLMp8McSVfGwzQRRS0Sajg5tTAH5FexmNkLoicoyeLiXm/833Y13uPPQ2ma8p2te1VDox8f1wpY01yod3gT3wFviGPgIpAq4RkJYDixY82TufX/ZZnP+5qL9+vjWf7lr11y/XL1xxCMyL//VlqgRSwgbebbvH3gEPiNXs+QBqt4aQuHfID+XXjF4f4YHSEAii2RgtKzeccw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBYb9b3yHPqkfA+6H7mw96HGKPaBZ7DvQfYniSyZpLc=;
 b=Oe4QOmlfbM96Hmv4tSjT0Lwq4qtkbGRI9wYA4tnVEEcvrFTdAwNd0NrB9Eh1yxNYStV3eYNDJEEdpask1iELW7eQiF44DPYzpzWGnoAVBW0FhlMx3FNO66oaAORH6Hp/12pxwZfITGQUYZwtcGQMmy33Y2DSQIY5OzxQIO3pt/1ORxH5uqQWMWz0b8+20VPkn819VAlYnQjwpSyay30HWEtQYwnhxbslkJ4j8YTfokXX/jUZYQR7kc568bSTPma06hjrQ/6PgnuW9A8w5Zt/sB9Bl/ZMizoVbVjcAb+4LrhynxnWMPnpVPcV4MzCrI2aO6OMch5OeN0AUvoffFGzmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB10602.eurprd04.prod.outlook.com (2603:10a6:102:490::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 03:29:38 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 03:29:38 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 07/13] dt-bindings: display: lvds-data-mapping: Add 30-bit
 RGB pixel data mappings
Date: Mon,  4 Nov 2024 11:28:00 +0800
Message-Id: <20241104032806.611890-8-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104032806.611890-1-victor.liu@nxp.com>
References: <20241104032806.611890-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA1PR04MB10602:EE_
X-MS-Office365-Filtering-Correlation-Id: e30189ef-c115-422d-5add-08dcfc80e999
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q/bPNCI/RR1OP6cFCIOGaXCFdVEiw6qOjfBNc/gfWEXwV3yeD0ciwi/S58Tb?=
 =?us-ascii?Q?G5EztmIC2JXAxzZp93cl6gjFVwBm3wePpuktFR99HoOeGxkZ3oPqZZcwjUrM?=
 =?us-ascii?Q?uckaoqi1QuWA31S03cd039QP3UJk0zrs5efBfztk2nruzNfb08Y4m9Gw9dVu?=
 =?us-ascii?Q?urY5JAdBTet9WIyp34D0CTvqZEmMr+Yo3mQsKJXB35AC+BR6ccGknmNgH6st?=
 =?us-ascii?Q?DieTBcDKywmQI4nc3d3Z5qfbOxDjbVEruo8Hl70XRnJWcH5W3vY7UcQN0stt?=
 =?us-ascii?Q?b4abL15vYoT9P3H2ILp6DSX7KWkyr09dZrgR6PmMcifjDKkSCmKaQvH8mjyR?=
 =?us-ascii?Q?QXsDLIM9oi8C4PbbgXVHB+cfePelBSd9NuLNjq4bqydP/v68mpjGp6qQhOl3?=
 =?us-ascii?Q?wDJqfHTRtDkVihXhYq3KkdJkbDJBQBpYEgSVzcLEiB/QVqvhDKm/ZSoaF12B?=
 =?us-ascii?Q?CAyHFXK9llNC+7A1lxevLGTJfwd8/2MyUOehgrm/oNoJyKO1qC6yrUjfjCJx?=
 =?us-ascii?Q?913CiVdrF9qZ5b+RmKzdKDZm4CgQegV+wxWucR8SKjYeZqoFxZuLd+AguaYD?=
 =?us-ascii?Q?9B16QcNDRc8BJXfHfuSuy2y1XlpeM21ET1daVf6j3IzjljqDWUk+Ap4guIUu?=
 =?us-ascii?Q?jPj64WO0HSjS01uR4eGPCC2uolnJHEC5lf5aiWCD654yJCpNNsDSWT80CaFm?=
 =?us-ascii?Q?tYYPOW6ISKh8NheuQnVPEGl2rm/eRLe65nOIHy2T0lgL88yOt0CFrxz2esFb?=
 =?us-ascii?Q?q305c4Q8o16heyTOjc6TuNyypxPpOyqKsEUGYtMZkMNvvSi//m2cN3WDOpLO?=
 =?us-ascii?Q?SS16gBcjIJXC3pzzbP2Lfu99dVmdZ4Lxig09Li5W2zFrD62sz1B+O1xoISPE?=
 =?us-ascii?Q?3B+mLkAtreCHw+4HK9jBWAwHnu9nCNWP+58jfc7QJwTU4z7WL+0DW3rCA0U1?=
 =?us-ascii?Q?6jbsPvxlkkob1DvvSdtTMi56CsnGnavwGW8NckQDwzfij4j8mzLqwv4FG4O0?=
 =?us-ascii?Q?vFDgiEZk7J0Txru9N4VEPCz4IbCl1xaKV5Bg6MHxCmOW4HNzTYV4i5HyTK3g?=
 =?us-ascii?Q?UNdZFlptQQbswnKbypOHP91LkOdd5bi2irByreRTLNeLN1jeNFCeMnloTVet?=
 =?us-ascii?Q?B1l8BAdfpg+tP/1fpjwG47jvx/JReFlGJaYcMB1LInUPvfJESkwACFYHo2t/?=
 =?us-ascii?Q?x9OA7P150fsjw7nDJGs2n5WK7+YxDSrmQR/TPHhTiVYYmxzvMsEOthU3KjeF?=
 =?us-ascii?Q?cy0BWq1ohjKJzqK1I6qXnXCiK3uetlyPqfR59iXUD2igvlwg0ycgi4VVNXu6?=
 =?us-ascii?Q?lDcsqQXRjYXQIQ5/xXkh7kxJ2EaCpDTLxDx5p5aLNhomCJEypAp+coXILAHh?=
 =?us-ascii?Q?/NqtJKI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bKS6kohl2UxPXUKE6nMBsWSBT3Weo0926wI3uENUcRGj0wzyUCfN/W0yxlzq?=
 =?us-ascii?Q?vQUL/HbbBzHBBS/mjD6kWbvaRRUwmWEzrGKah8Ak9W76OxaLX5YsWIZvPjij?=
 =?us-ascii?Q?vLpfswQrjNU5zgyUnmOv2IhYWTpbQS/m7zzaOsdkXH+KY4iutsVUKY9HgVx7?=
 =?us-ascii?Q?m3vUWRpHDVDHBe06bPwP2URNKbtLpuh3tdEjzqt1caibr5Qvxm+DbQ6idqwR?=
 =?us-ascii?Q?a093edYdb/y6YIDdCiA0tJyrQ2+ilxCH144mVENqjK3G/omN/Qlwm01AGB2Y?=
 =?us-ascii?Q?4dFfA0mYtH/k4xAu819sqejEYwAdErxvqn6NNYnCwcQnOgirsemOHpGI1Z6u?=
 =?us-ascii?Q?iwO6JILo/EcKQ32Io8yXnAygOlTk5hA2t6sW9VY/1wjvXBZcmX4lkxQLvkho?=
 =?us-ascii?Q?ljJmglbaqlPVFLVnoX1oCfxNkRwKjFdfx4QfKCkCZEt/FwuFCtHxXZaYqlOM?=
 =?us-ascii?Q?m7fnuSJdKkLIIHOXCzVHRtIR1lLuDKzGbU1Q7b9wz7i1e/MprAB3czm7jxJ7?=
 =?us-ascii?Q?DHC8R8mYMhMi2qa4e9szeaBakUUw0BNUlxMFhjKBx6lpXZT8hA+NeQDVw8Va?=
 =?us-ascii?Q?87iQv420XHNKbPWHV4PD0ixya7VzhDLKJcpFdxFpagH7Z/BHFya2KRnfGn8Z?=
 =?us-ascii?Q?edUUROHRokuA0hQN8h9DxQh+3P1Jn1T+Y/isITbCQ1iakCtWDEKudQ58DyyZ?=
 =?us-ascii?Q?ZBVKkuUgT6BBc/znQRGTMWLht0DVFeYh3ZPtu8xCRvZpxVEk+T1LIrJlmhUp?=
 =?us-ascii?Q?5n4mSVEyV/EFeLuTXcyHvpJrzXamrWNoprX85kWL8nyXN86XKXqIIe/veoLn?=
 =?us-ascii?Q?kfvpcemgIyUBW7BT7kvgZn1uXtEfwKjNwqEC5Cs7MONiWW0onUlJNcOft9Ye?=
 =?us-ascii?Q?I6H1f0A3QAo0cJJm+Czq4LIBAYhOHNwot8o7xeBBzUOObOEfc21OUQ0tDelw?=
 =?us-ascii?Q?87OObRApCZUGaPbRcRJaD52WUQvTIqnmdgefCL009Qqq6EZU4oy8nadeeEbA?=
 =?us-ascii?Q?rxqTnacFka2e8gPH4kccnZPoR/jo/5SMQ/SEgNThjLwMp+AzcRLMLtvYKxfv?=
 =?us-ascii?Q?+EULs8KGLdHldkq4Wg48Cfh9sWQkRHgDr1o2peoRWSk+VYsC1KTKk+3PAPdu?=
 =?us-ascii?Q?cg+/bWgbN4EIOemQU4Xg8qn5kVp643GUGXYHNGfoMXdxHHL27Q+9ZqglGAWT?=
 =?us-ascii?Q?qqTWqWgS0WvwipnPwR4xjg6Id/S/AIjQWFweeOUR9Iy4TkDZvEl6QISrJdZU?=
 =?us-ascii?Q?ZDxpD1NeAxk0bNiVy0rGJ+N+TARQFHCncxmYJIem3Gdbj30CNZ7S03quOjjo?=
 =?us-ascii?Q?oMFyAhlUgCmGMDaujNae83kwONjKRhNWhrmXSVZDpNVn+fV9jxolfnkKadk+?=
 =?us-ascii?Q?pfia6wEzWMhDU25RRrdLsR638GAlRFXmM4957QgOKXpb+kJrwRXN7P/GKuhF?=
 =?us-ascii?Q?oADjsgF1gA+I+nTq3YKjzWbmP5w9psJV7Rm3ucm4Hs/D3GLIJ6iNIyULuQWG?=
 =?us-ascii?Q?qqX7XyoY6i3Ernhb5GSP9/hGGzr5+0v8Yk50Wd+gMv81xF/CK6EtST7v0IH2?=
 =?us-ascii?Q?zHIi8KnWQcoh58Vk+7Ci1OrBMzaVDzO3Z3Xp3hNj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e30189ef-c115-422d-5add-08dcfc80e999
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 03:29:38.6810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hzxnfUuZjm6weLbepS9ycY8+QP7/VoFkJgc3HJf6cziHrWw9mWO3XVgDm0sxoHyUDC88b1/2+LYGzW7lD3evQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10602
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

Add "jeida-30" and "vesa-30" data mappings that are compatible with JEIDA
and VESA respectively.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v5:
* No change.

v4:
* Collect Krzysztof's A-b tag.

v3:
* New patch.

 .../bindings/display/lvds-data-mapping.yaml   | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/lvds-data-mapping.yaml b/Documentation/devicetree/bindings/display/lvds-data-mapping.yaml
index d68982fe2e9b..ab842594feb9 100644
--- a/Documentation/devicetree/bindings/display/lvds-data-mapping.yaml
+++ b/Documentation/devicetree/bindings/display/lvds-data-mapping.yaml
@@ -26,12 +26,17 @@ description: |
   Device compatible with those specifications have been marketed under the
   FPD-Link and FlatLink brands.
 
+  This bindings also supports 30-bit data mapping compatible with JEIDA and
+  VESA.
+
 properties:
   data-mapping:
     enum:
       - jeida-18
       - jeida-24
+      - jeida-30
       - vesa-24
+      - vesa-30
     description: |
       The color signals mapping order.
 
@@ -60,6 +65,19 @@ properties:
       DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B7__><__B6__><__B5__><__B4__><
       DATA3     ><_CTL3_><__B1__><__B0__><__G1__><__G0__><__R1__><__R0__><
 
+      - "jeida-30" - 30-bit data mapping compatible with JEIDA and VESA. Data
+        are transferred as follows on 5 LVDS lanes.
+
+      Slot          0       1       2       3       4       5       6
+                ________________                         _________________
+      Clock                     \_______________________/
+                  ______  ______  ______  ______  ______  ______  ______
+      DATA0     ><__G4__><__R9__><__R8__><__R7__><__R6__><__R5__><__R4__><
+      DATA1     ><__B5__><__B4__><__G9__><__G8__><__G7__><__G6__><__G5__><
+      DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B9__><__B8__><__B7__><__B6__><
+      DATA3     ><_CTL3_><__B3__><__B2__><__G3__><__G2__><__R3__><__R2__><
+      DATA4     ><_CTL3_><__B1__><__B0__><__G1__><__G0__><__R1__><__R0__><
+
       - "vesa-24" - 24-bit data mapping compatible with the [VESA] specification.
         Data are transferred as follows on 4 LVDS lanes.
 
@@ -72,6 +90,19 @@ properties:
       DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__><
       DATA3     ><_CTL3_><__B7__><__B6__><__G7__><__G6__><__R7__><__R6__><
 
+      - "vesa-30" - 30-bit data mapping compatible with VESA. Data are
+        transferred as follows on 5 LVDS lanes.
+
+      Slot          0       1       2       3       4       5       6
+                ________________                         _________________
+      Clock                     \_______________________/
+                  ______  ______  ______  ______  ______  ______  ______
+      DATA0     ><__G0__><__R5__><__R4__><__R3__><__R2__><__R1__><__R0__><
+      DATA1     ><__B1__><__B0__><__G5__><__G4__><__G3__><__G2__><__G1__><
+      DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__><
+      DATA3     ><_CTL3_><__B7__><__B6__><__G7__><__G6__><__R7__><__R6__><
+      DATA4     ><_CTL3_><__B9__><__B8__><__G9__><__G8__><__R9__><__R8__><
+
       Control signals are mapped as follows.
 
       CTL0: HSync
-- 
2.34.1

