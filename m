Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 011B39B22DF
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 03:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D25110E318;
	Mon, 28 Oct 2024 02:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="FPi8D3yE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2081.outbound.protection.outlook.com [40.107.104.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A57E10E318
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 02:39:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mRvTYU18YS1Wv/fnmYfxPIqiKyyXXOkeyheknGGJ5ISH6fa3C6VUCkCUyFKN2aUH3H8CMSIQNO+aS5U9XVzIzPq0GfC8ejUdO7zCMp6fePAM+iaSvZEZmHusomxCBD/ooJeFfGzVx1TZaGOhd7pZKudrNVlcHt+G2/aIYDQ4lyWc90pEUHk5c06Kscj128Fp8H7mL8/1nyMLIfzk2p12uUej2RH+YEQjw2zRCglVL6j7NrmPHpblQBa7wB1q+PKA6gZjb2OhBK0MOF9uPLtoO+0vacYjYoCN070oeJFfOS7KAW9TDIJHG5slZzVH2gGrybZwBbCdQ08CFVisfIiWOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2JpN6ppELfOvef0lZ0Y7goaV2Ww3X/mKcfanTS1mn0=;
 b=DGqetsVqz3uRl21fx/fopwL2V2chfY0I5xNmfScL0zjmipM13q9BXXhBCM2JzufYdnT3/3atVDoOlG3TppqNRshpnSoNq9TMNRQp4QVgp0xagO4tPxU/HZk8Km2pToBr7lGpUlfuX2zTGb7UKUu/nAen8d9Kb4Rw/65Cb6csgxgvcSDW9BHhsTTQL++AL9ZZISY1M2VCLlrBKVnFoY+Z4o9AYLhDWnsnNXsZzVTSseOjuS+kCPsMDJFhRGex8gBC0sxKR6SXATx+1Q2MSa0aIsM5vNzupIwASPbHZwFAqcGBRN1wwOvmzyw8mwbH7D31eXuWlLBDEV7/LlDx+H1tmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2JpN6ppELfOvef0lZ0Y7goaV2Ww3X/mKcfanTS1mn0=;
 b=FPi8D3yEsHpEA/sGZe+oMZZ7awljH9lPCHX6zCegnNAT7Cm4jfVKX6fJbYQtCYWP0O541ASDrUR9cdgfJm8YJuxdNN9wJoWniUJRS0jIipkinmpyNeFxMbr5lvRm1Bqv4At0kzKy3KvVWfhqg7ez5TftAxQpJY9GLjhSRrek1hxw2+SrkM8WllgNotP6Z63Dju8CljvCYZiEPdC5NBIxEjy2YTH0YJeXJWwzuZpsUb7ddMADITKvJtyVTiGuC3dU23gzrrP88fg1t3zzmIaMwjdyBznFEhLjW7iNPEVja41glhLyIdpQF+57iyW/OxQQ8pZQItdgVWifAsjO/hGwgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB8709.eurprd04.prod.outlook.com (2603:10a6:10:2dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 28 Oct
 2024 02:39:02 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 02:39:01 +0000
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
Subject: [PATCH v4 07/13] dt-bindings: display: lvds-data-mapping: Add 30-bit
 RGB pixel data mappings
Date: Mon, 28 Oct 2024 10:37:34 +0800
Message-Id: <20241028023740.19732-8-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028023740.19732-1-victor.liu@nxp.com>
References: <20241028023740.19732-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fe36d55-a1ab-4580-fd85-08dcf6f9ae9d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|376014|7416014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?y/drqiiD1T34Ykf0EDBza5WchLEUIH1fKNvtvUIrsLDU1W96YoAMepXEcdAB?=
 =?us-ascii?Q?utEO/rYKxBa4fMcA5xuOYitnnZDaohPMtEUI5EObDqhGMfCPnDmy/QGA5GiT?=
 =?us-ascii?Q?vDUFL9SuD9iLAy1S9UZuq2MNIQbiQ606y9GokxfEzd6/sGkLc3GruZUNZ9W8?=
 =?us-ascii?Q?3MBI0DvmwdcIJrNdQu+mGfsxuD8Audf08ce7I7hRqQ3D1VrdelZZLHCPowk8?=
 =?us-ascii?Q?qJwJlpADEoGXW8wjY5ouj0OS+ReM7s3Z3uGECaCxNJ4ShcjH80EA1qntXGc5?=
 =?us-ascii?Q?CXZi1hXfJVYKgoiDJgjy6ZZRWO3zvwo7llsgTVAIuoIATtdBMaL7RWZKaKfO?=
 =?us-ascii?Q?WPQOXF4lmO1NKY3DkTzHPabNRwM0QLSm8gOTgCXvionshE5GDxjrlncszoqW?=
 =?us-ascii?Q?mMdb33QLwgGO5MaN5mSWUpJebbBBFs940VNPqeDHX2MVf5vhARYQgyVAwq6F?=
 =?us-ascii?Q?Uabp2Wz6TY1k9Gf3YUveSQcrxIXuJaOCiCASKz74VerOQIXKL3pEkLZHK3+U?=
 =?us-ascii?Q?Zqf8dj1fexN7IDaOAMPOkX7yU0pE5g0eCfDVSrCJE9ulfUnVRrEThy+Noc0F?=
 =?us-ascii?Q?xTRfzXKs/SLwk0VwiC6HKPDYX2JZbaeJMWVUd6PEhcAuE/8KAIV8u0ZpK7IL?=
 =?us-ascii?Q?kkH9Us9QowyHDUL4EBegue1yMHXvcunfuRvMRI30lugeDOzKcacG5ED1lN4M?=
 =?us-ascii?Q?kIwRe3aGUZIii9ucM2jqJCE7rKew5iBEcp+1ie8kTkCytbX2eG7WaDbcFMzY?=
 =?us-ascii?Q?gxW5pu87cH7u+OlZxVZdNNmnONei95tgTYer41dJy867B7dwvRPh6dUfnQwA?=
 =?us-ascii?Q?VdXJiztgKWhEUDKu54HM1vu9rBbha/W7iHuZDPyQiwAf2n7rvlRY9isyklWD?=
 =?us-ascii?Q?Fy9TG3Ukj2Lb7IFV1cejhcruV9EQ9CfqkcL6dMzvGpmWZieRMgAwtyFncp8k?=
 =?us-ascii?Q?egCEllsG41sOINCi5Y7NUKZSgdiCFhf7laamBtFUzGdFU3o0VyK+U6G1yFyP?=
 =?us-ascii?Q?cycREXDPBwV8IZeSDV8bEjRAd2G6q3+7tetAi3bmE+LpZfbzZJ9cnLo1wSsr?=
 =?us-ascii?Q?TD1G91TYix5X8gL3FxQlsGSYNKBTehIjx3b7XOE8+8mOrQpReTBCyWVA3723?=
 =?us-ascii?Q?yxvSI7EDteTIUJIwleSBa4Igt+3oo7OwWEXqpbcSJ2V8ZBVGK8dcilvl4Shc?=
 =?us-ascii?Q?2auoj3XShRgzIDw7SyWrLG6PhGfFsWruRCdKaEBAaAfBWIMGFWFy10TKFwD/?=
 =?us-ascii?Q?u2iu82FIEMza70EV+qdk5dvceIE2XImCyXWJoMLuVIYXzGIHTB/kVpI/YTuC?=
 =?us-ascii?Q?mte2AQ3YFCkPDHRk/CAz7CuH1RDv6QlpBKEpFvJrSvgWclQ3gp54m6yQ25Te?=
 =?us-ascii?Q?ijDRzO8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(376014)(7416014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R+1NhvRh0xE09/iI7DrK9KVFXZfkAuss2klRGQSLtHd+elMC6YMCiNEnqdR4?=
 =?us-ascii?Q?sLloyf8Pn98k7w0xYiD+R7Yep2095Q6OuOw39zWckAYNyjM8yX+ru98AuOHN?=
 =?us-ascii?Q?Y8juzSEIWqe3ePXJume8CyJv2IKEl0Ss6ZD6GlfarNPCXzFmKBUyYCIzT9Yn?=
 =?us-ascii?Q?ZuIqsKWj14kslslvKRxC7d7ippysPXNBa0DrYV2m+IDTPWt8eYYNHnZA1xNr?=
 =?us-ascii?Q?0zhClILGUS/Rh+dL58510rTTJ0yl4vigbgTPWJQxGlbz931A4ckf//s1Qecx?=
 =?us-ascii?Q?iCVyuEOv7jYbFaInXPp/GzDF5Vcxi7eur1Nn5HrNtlML5Ddu8a3OyT+3/ViD?=
 =?us-ascii?Q?s9hDSi4eq2m12a7cWBHUkk6SJ9tEsrQ8r24xETSkgZuT33zoHvQ1YHRDR/ZN?=
 =?us-ascii?Q?avq/vBuvlrh1B5iVI2iUOOU0MOX987O8EtizgJBMpvAcVb5zavt//TZx+RPL?=
 =?us-ascii?Q?5TzFxPqBdV+Z4sYIQaCfVBLJlMLUGpUJgrPGCFctUnjQPIfUlKb1yOYw02ka?=
 =?us-ascii?Q?5ZIX7EB+6UYYVZPjnTv2qB7qX6SmYBp4KSzdtdgbYqiUPaIVe1lMnouHvOQv?=
 =?us-ascii?Q?rzx5IZRVj1AFOsTmtQF092oSkmhqVGD9aj9rM6kZbEEMAHVa6daFte8AtY+q?=
 =?us-ascii?Q?3U9M/G0UCG7grOu5oIwlLK3TV1iaTGqPtUnC2G3cdLeqLqQd/qEnPROSopKZ?=
 =?us-ascii?Q?JbTdt9aJWLfgGxYEe8BC1z183uzaeGLJN4nhpbnxvsI3aw19pP1ZzZMR72si?=
 =?us-ascii?Q?MR1Jsi9Lwuvdp5DU1edOF2wYhSpVdGm1Yq2B/GtTcKKg6X2r40khjgX3WuGA?=
 =?us-ascii?Q?sp5rfMLX7vo5SclLpGQFfHjUCLWN8ZD9sLYYscrVDoTTTjuGDB6rXB+yoy9r?=
 =?us-ascii?Q?SqRzWDYCVDFaxQ0DkwYrcJh/tAFJVDI5ZkmyvBXfRApuj4LV6WtYSq9UIr/m?=
 =?us-ascii?Q?MZ0/zMXfjWi1cESyT6TUGnIZwgDu826/5keodabsvqz6FkU1C9XFuQSSGtdi?=
 =?us-ascii?Q?yieylMfvRu0vdOQM5nxk/IpaJJqDG/mjNMyjR8edtXtiDaCrxP/VZLzJKd3E?=
 =?us-ascii?Q?12rid6khW2Z6LJW/HQcas5vMcPlkUmaZox6D6UnUFQluhUzPh/G9JRsnPUwY?=
 =?us-ascii?Q?mte05QGJwszx9To2AbFhYiFhEWuL7dnMFeF0gwNKhy6ApnO+9M13IHaY8b3t?=
 =?us-ascii?Q?BNeqVVc37IpHem0TWpRQxszZZAMVecLgHsVn8j4LxTyp2PckuHrIncIzIMXj?=
 =?us-ascii?Q?gzFQChVgeOSx72blLU2zz86a7n3WWyNBAhaUlnsw2ibVSuUpCoxM9HEsASyd?=
 =?us-ascii?Q?ffPcem5dTB6/uv6pHlV/xEcy1/KDOk2DPfyodGEkzQVJ4UMH4qsKd/OmPvax?=
 =?us-ascii?Q?3aLtfMADoLHs4Q86nGk3cQ2XS4YgOLHnNd1L67w6J/1+QncsIK4A26vKoaaA?=
 =?us-ascii?Q?5VDb4Ig2el3GllUbHXW88LVeGz7OzMumC/WHRZ2esKQYDSt9dFnggpu9BSLY?=
 =?us-ascii?Q?hmsQF8GrZUXhtsVxXEyInFJvyDTZe5xqD0/0auQHfxHHnx+wugJiP9UOLEpV?=
 =?us-ascii?Q?OcXcECPA2V1M2AUmBY8dkwItp+n8ERh32KkWudyv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe36d55-a1ab-4580-fd85-08dcf6f9ae9d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 02:39:01.9335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTVihxhnGv5xp7Y8WwaMEzWAic8gYKI3PL3kfXlEEi2s2VzKRU8zCNvg3Mq7qpwgxE2o/g1Rqi6gs5lJlF5f3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8709
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

