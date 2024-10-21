Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD4C9A5ABD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 08:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCEE10E416;
	Mon, 21 Oct 2024 06:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Is/7Q9JG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2050.outbound.protection.outlook.com [40.107.247.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4056110E417
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 06:47:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HlYLsrMdpJHVY9AKG7cZP1kL7r6slOwR6YFco7DAMF1adnNxTFrV/O3QwKERMCD1JRbTU4NS3iGKrybnmLdXL15KByeyzIBtk3DphXjHdE5i9EO9Bb6Jlr1CSTuM1e9quBBi3t77jk+FjnmZmh/ojpKAc8PxbKO4XK5sIQp00NwMYBajOPdBfprNcrvf5GFjLFCVtzTBdkz1wSNAi90fXTwdt16A6FDLwg/MJxbon1zAm5mMoCC5e/V5n6xwC11Bso1GNbXyLRIcjDXRCvDC76mVxcP2Vq3aDcVNKtboPPuwFocOO2y40oiPzRF2Q2kXdPHTauxUY0jVbB62aQMMaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M634R4S1WWqTWtnbcUmZp+QgxhcDWb6qattsLotylYw=;
 b=MquCzwW5r9e96EENN7XQIaUiPG8WqFW8zkZNiYT21+a2kOLUs7uWm46+L91iATrthB+Ymo1SS7OwHxQGgoXbewRXEq92H6fXFzQZUPkFrRfEGLQkzm8toApX4Yiem3LODq8p0V/qg2evUV40WS4+zBwZn1EqeNHKpCNtZuHEcEJxT8UmgJp7wANh/mS/9xjaQEsdDIR2Jw9D9lFF/6kAEKNMeDboB8SkHgLYTrHXKv2aCWoECQ01/RM3HSbnxMEy1+EWWO3Bo4hyb4mF0IJyaGRoDviU5yOiiYBVaayGYpdpDW+tPODtaCO5ADTS0Rd3mFMtr5QDq7/fSdcK9yjXqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M634R4S1WWqTWtnbcUmZp+QgxhcDWb6qattsLotylYw=;
 b=Is/7Q9JGf23LinmyVrSBd5veuHMqosygFhV+6Ucjcv2QH+I/ZJf9bIFclkwJsWfrMRXvLJmndmDhwGRVCAUqE/yqsQZwAtB4c4uNwEP3JGXO/1Lop2LL8Sk9lZzB7b1V8tYSDNGkCsGhivoKz13ZjFkfbUTb8pWoCURJ9uV4gk7ozfDMkrXa2aqJ5fLUCRr4HHt7E42UJPOvCMPTMRq/28m14cSmCEYC0t1c9XVois4bxXrzoSmd8GQpDVHC2GchiHYjpzmjXxPTztqDVdsKMNzY4NO8w1Un1b0pVycEzvo5NuTOOsWo7w5l4fXJOSbQqRSTnhqkChUAbF1fOzPQxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8440.eurprd04.prod.outlook.com (2603:10a6:20b:3df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Mon, 21 Oct
 2024 06:47:17 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 06:47:17 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v3 11/15] dt-bindings: display: bridge: Add ITE IT6263 LVDS to
 HDMI converter
Date: Mon, 21 Oct 2024 14:44:42 +0800
Message-Id: <20241021064446.263619-12-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021064446.263619-1-victor.liu@nxp.com>
References: <20241021064446.263619-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0111.apcprd03.prod.outlook.com
 (2603:1096:4:91::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: aa378d80-cd4d-4580-e90e-08dcf19c3424
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0V4gvsLcxbeleSx+qB1TGRzkJkE/isOFtmLjhwZI7ZSPlFRtj/3b37QG7H33?=
 =?us-ascii?Q?nYtX/SGdizMDAlrQGygqr6SZpofzVZXnDPlHOWVHXdrgU9UaeGZJvMVw6xg6?=
 =?us-ascii?Q?8jOsXLrgMm82QHKIV+AA2KiqS82fpavZo1+lJBIHOsmpjX4joHoMbEQ1Tl1m?=
 =?us-ascii?Q?Vtf/3PRwsUu69rKmLrtUP5h/GnKiBp6X4yljXuRldQoudua1o7XyjryBmCOA?=
 =?us-ascii?Q?oXuCWe6C/aaIThBHoMwNRSsoEq82yQiVCSeIOZ3oDu0u40lqGLDa1tDL8KPZ?=
 =?us-ascii?Q?pIGrSP3fHENySY0eonkyn7ZtKdszfCyX3bVdiukGssJ7e3ZvtM4Rb0Gl5LNh?=
 =?us-ascii?Q?8AFqayWZZPs/6TRUZXrLTVEQpypVIL5z6Tc5t8HNuQLQFnr4f7ze77TmPfJe?=
 =?us-ascii?Q?4XWtEGlOrzpNs0t6+gPM3FtBSSF2a49y1KzAiZiWJz29tKKYFQOx3OYwQ3HZ?=
 =?us-ascii?Q?9BahSHtwrSFvyLxnmZhMpE9Cx2+exvR+DZz5Qg9t61+728IPKxqKe2NzqL0R?=
 =?us-ascii?Q?EGyFJOAwqVVXLwAEUb0NiHTxhZBxrogOm5jmN2TLteSU2yEMdIzIz6K5a1oi?=
 =?us-ascii?Q?W3s29DlCn7mhkcqNOYzUka08bo17Ii7zFBpUZmwFQabHDjanROKwglwLTiuy?=
 =?us-ascii?Q?8xt6Iok6t9M4KDB4P6uiRSzMn1EblihECS0KinPTd73+uf8iZ0h4/OGUM2eD?=
 =?us-ascii?Q?PvwUElHfRVERPgTyb6NiO8wuHRnqdbZGCQkPvaE02xlOTaZlzrhZL7DPZjwd?=
 =?us-ascii?Q?BGkuSpiQTJKliZwddDXQH17/wfv0ZBf6/e9tzg6mjPWS9qSVJ8KXQiJOe0cI?=
 =?us-ascii?Q?GzdVTmORAoN22NpdaSxDun6Ba8j0XiMs/HfuMMuUl9T2qpIGaJRY3oIeuR88?=
 =?us-ascii?Q?5oBbJlvmVt0xWS4jayX7h7vlmyy+Ivdg4J0YutZ0JepakU8sWx6ZhIXlOjcY?=
 =?us-ascii?Q?1YE9W6c1hdtLLYqu2xpB7ju/QBxsC+BBrc2wGhiOze8Yeh941Ap8jh5N4Ru4?=
 =?us-ascii?Q?OBWTArmltJWG3fhDs2lhZd+xteC/ewSd/rsodD7hHVIiQqPFqvwma2X2F6L3?=
 =?us-ascii?Q?IhUEtYriHhGLVLdWkjIoHq9IpOBswzTaMYJyuCniPnYVBtvT5lNm/I2H05Z6?=
 =?us-ascii?Q?Cp8edOxMqm8hWOjz0v1KhEafSWxgC5IG54SuEv81d7odziiy/GeF7T4V6IiY?=
 =?us-ascii?Q?bpB7RfQ1IThtaaTYebJTc1YltjxZfhVjbxih4ajuB1jfzY06vQFOjtT8Cqun?=
 =?us-ascii?Q?nhZqxADHmNCCmozniwk7yp3ad7w0XYFUMBKvJEHlgmu/hAPpPk0GbEjq5UpO?=
 =?us-ascii?Q?RRaMRwCYNoEEMngP6LVAxdYq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oDSqxiTvPcDFsXemvJ6G6sd3dGXrnxnfbxZLJBfDQQDmlQ/QrJZgk9DeMuux?=
 =?us-ascii?Q?0wRbYWVWaWEUwTkHq6mTjTKQu4R3cKkPjnhuqDXM9SBJnCinm5IpFAb9o8Tp?=
 =?us-ascii?Q?kk9TvbxiuwK+I1zjmGFzBIMH8MILI2kRbvEgdr7FqK92Zy4HFXK2chHkLvZg?=
 =?us-ascii?Q?VzNNRAs2erev04DgzCFSLBTdMvKSAzRFUr26jmsXnRvTY6RmbVY2aMIA+EH9?=
 =?us-ascii?Q?+3VcH7NKNtme0q0d5osZuXzmACLK1bmg5DNkxn6/KNVOWGlVHNcY+yFfVXpL?=
 =?us-ascii?Q?mloxjusM3aAdSQot8mXHwt6yrYqCjwke7J66H4yA5TxMq4voswL+bgZgjVFW?=
 =?us-ascii?Q?12mcZRWXMXChuOWlVjmO9JBvhxatdQd4TZXE6BfNL2j3dK5xS6yFlKr1oLoj?=
 =?us-ascii?Q?Dxxu/05l18sQC/PYbZKBcxl5gF3oL99NlrBqSNKnCEFgz0oAaNiTWRxeVdcd?=
 =?us-ascii?Q?NLsdeCrpZTBFRqJigQekFjEjueB5nw/YUZbt3qrd8P6nD9KSgs7rcZdNWXFp?=
 =?us-ascii?Q?vniDBH5f0Is3X27/bMW6Whdmo7wXv6f7Ht8uO5+mFH4nvdDcp5rgSNrt7hPG?=
 =?us-ascii?Q?qlcFNLX19wlN0Suq6xEqNRCTO+d/iUv0+CjGBFnFtFvMbj5EXxUW+V7S/4jp?=
 =?us-ascii?Q?1vymeWqY8LdqP31Av0/zSRoKc4W1BAk9R1v9M1Zgn0kPUgMwuaHF/yvSq26f?=
 =?us-ascii?Q?No6wsUQBfOIPbVaFrDb+gLkhYgY5Fdeq/HuGzSB0OOncWm28JB2R0w3Xyg5M?=
 =?us-ascii?Q?cRl/jgCX3tllStWhdc49X12pgcgZqyzoL9loZe5hsodXtzLRwKmwSxEb9BCk?=
 =?us-ascii?Q?IJxvdolzWSeSuoL6aDn9ZRBea8kgxctmXx7dL4EAjJ2UDUAwmzUHmpYR8gAM?=
 =?us-ascii?Q?/3CV9QPInxoxbm1PWdnoOwZ2w+zo3rydppeeezmcQpEHO/jel3JvK5fBTCQG?=
 =?us-ascii?Q?+lY1b8GldnLuBBVk7+C0KBPSMFpPOQ+PCFH+6G8tfDjfQjQCJT+FjabOtc1/?=
 =?us-ascii?Q?gckInlmtuEkHPF0/v6oDgKKCk8B186Qcx9/DU2XZlb2bCwQwqE54lUVK1mp/?=
 =?us-ascii?Q?uFVhguMAv+1lKluaVmJY28EZnCVqq9GnnBa+I5ezLG9bvTbrs3x60Cyw+t5H?=
 =?us-ascii?Q?KC7W7cLyQU9FRmFxmeA4F7bREymA/WaDBFIdcMsyltPsE63cO8xn2Fq20Uoh?=
 =?us-ascii?Q?LNMiDYG+qx5suLLwaa9Hh2wbgQADJzd0E1JRdJnX+876/QNzGJy1COV7n7MB?=
 =?us-ascii?Q?qxnGWECeonQbpGBT6MoH5euJY1aUW2PC6lnpgXJu1gdoY1ZENKlVyTRHPY1l?=
 =?us-ascii?Q?U85avO/jmvHwLYMvqiZPiDbMCOqBcctdNcq2RLUSmGtvr1FOIgs+eM3YtqFs?=
 =?us-ascii?Q?NL5Nor45/F97MzVIntJddWnZUQpcVstLoYVhTV8CbJL7kJxRf2eIZHkLJJHo?=
 =?us-ascii?Q?VLInzdYVCZzRiCUiWsPrqifzjJMhPYmPGGadn1XCxNUc9qtl+rL8W31KiPvV?=
 =?us-ascii?Q?T77ry9tk4jQb0NkLRSAff9Sn/mmeH+zqHegfcJvJ6ZYu8cHU6aYzs9i7u7K3?=
 =?us-ascii?Q?qS+aL4mpwYJPeDjkHokaetelZ2+Fwla0hqNlCIyW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa378d80-cd4d-4580-e90e-08dcf19c3424
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 06:47:17.3622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GhC0L367pETJXeeItp64B5xs5eQt1uNii/lVhCE3BIORN4QMW7XuDiqbe/SifY7jgmO/huGeecGBPCA0ap7Ogg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8440
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

Document ITE IT6263 LVDS to HDMI converter.

Product link:
https://www.ite.com.tw/en/product/cate1/IT6263

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
* Reference lvds-dual-ports.yaml.  (Dmitry)
* Add data-mapping DT property.  (Dmitry, Biju)
* Allow data-mirror.
* Drop ite,lvds-link-num-data-lanes DT property.  (Dmitry, Biju)

v2:
* Document number of LVDS link data lanes.  (Biju)
* Simplify ports property by dropping "oneOf".  (Rob)

 .../bindings/display/bridge/ite,it6263.yaml   | 249 ++++++++++++++++++
 1 file changed, 249 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
new file mode 100644
index 000000000000..8aedbaab5510
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
@@ -0,0 +1,249 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ITE IT6263 LVDS to HDMI converter
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The IT6263 is a high-performance single-chip De-SSC(De-Spread Spectrum) LVDS
+  to HDMI converter.  Combined with LVDS receiver and HDMI 1.4a transmitter,
+  the IT6263 supports LVDS input and HDMI 1.4 output by conversion function.
+  The built-in LVDS receiver can support single-link and dual-link LVDS inputs,
+  and the built-in HDMI transmitter is fully compliant with HDMI 1.4a/3D, HDCP
+  1.2 and backward compatible with DVI 1.0 specification.
+
+  The IT6263 also encodes and transmits up to 8 channels of I2S digital audio,
+  with sampling rate up to 192KHz and sample size up to 24 bits. In addition,
+  an S/PDIF input port takes in compressed audio of up to 192KHz frame rate.
+
+  The newly supported High-Bit Rate(HBR) audio by HDMI specifications v1.3 is
+  provided by the IT6263 in two interfaces: the four I2S input ports or the
+  S/PDIF input port.  With both interfaces the highest possible HBR frame rate
+  is supported at up to 768KHz.
+
+allOf:
+  - $ref: /schemas/display/lvds-dual-ports.yaml#
+
+properties:
+  compatible:
+    const: ite,it6263
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: audio master clock
+
+  clock-names:
+    const: mclk
+
+  data-mapping:
+    enum:
+      - jeida-18
+      - jeida-24
+      - jeida-30
+      - vesa-24
+      - vesa-30
+
+  data-mirror: true
+
+  reset-gpios:
+    maxItems: 1
+
+  ivdd-supply:
+    description: 1.8V digital logic power
+
+  ovdd-supply:
+    description: 3.3V I/O pin power
+
+  txavcc18-supply:
+    description: 1.8V HDMI analog frontend power
+
+  txavcc33-supply:
+    description: 3.3V HDMI analog frontend power
+
+  pvcc1-supply:
+    description: 1.8V HDMI frontend core PLL power
+
+  pvcc2-supply:
+    description: 1.8V HDMI frontend filter PLL power
+
+  avcc-supply:
+    description: 3.3V LVDS frontend power
+
+  anvdd-supply:
+    description: 1.8V LVDS frontend analog power
+
+  apvdd-supply:
+    description: 1.8V LVDS frontend PLL power
+
+  "#sound-dai-cells":
+    const: 0
+
+  ite,i2s-audio-fifo-sources:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 4
+    items:
+      enum: [0, 1, 2, 3]
+    description:
+      Each array element indicates the pin number of an I2S serial data input
+      line which is connected to an audio FIFO, from audio FIFO0 to FIFO3.
+
+  ite,rl-channel-swap-audio-sources:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 4
+    uniqueItems: true
+    items:
+      enum: [0, 1, 2, 3]
+    description:
+      Each array element indicates an audio source whose right channel and left
+      channel are swapped by this converter. For I2S, the element is the pin
+      number of an I2S serial data input line. For S/PDIF, the element is always
+      0.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0: true
+
+      port@1: true
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: video port for the HDMI output
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: sound input port
+
+    required:
+      - port@0
+      - port@2
+
+required:
+  - compatible
+  - reg
+  - data-mapping
+  - ivdd-supply
+  - ovdd-supply
+  - txavcc18-supply
+  - txavcc33-supply
+  - pvcc1-supply
+  - pvcc2-supply
+  - avcc-supply
+  - anvdd-supply
+  - apvdd-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    /* single-link LVDS input */
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hdmi@4c {
+            compatible = "ite,it6263";
+            reg = <0x4c>;
+            data-mapping = "jeida-24";
+            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+            ivdd-supply = <&reg_buck5>;
+            ovdd-supply = <&reg_vext_3v3>;
+            txavcc18-supply = <&reg_buck5>;
+            txavcc33-supply = <&reg_vext_3v3>;
+            pvcc1-supply = <&reg_buck5>;
+            pvcc2-supply = <&reg_buck5>;
+            avcc-supply = <&reg_vext_3v3>;
+            anvdd-supply = <&reg_buck5>;
+            apvdd-supply = <&reg_buck5>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    it6263_lvds_link1: endpoint {
+                        remote-endpoint = <&ldb_lvds_ch0>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+
+                    it6263_out: endpoint {
+                        remote-endpoint = <&hdmi_in>;
+                    };
+                };
+            };
+        };
+    };
+
+  - |
+    /* dual-link LVDS input */
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hdmi@4c {
+            compatible = "ite,it6263";
+            reg = <0x4c>;
+            data-mapping = "jeida-24";
+            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+            ivdd-supply = <&reg_buck5>;
+            ovdd-supply = <&reg_vext_3v3>;
+            txavcc18-supply = <&reg_buck5>;
+            txavcc33-supply = <&reg_vext_3v3>;
+            pvcc1-supply = <&reg_buck5>;
+            pvcc2-supply = <&reg_buck5>;
+            avcc-supply = <&reg_vext_3v3>;
+            anvdd-supply = <&reg_buck5>;
+            apvdd-supply = <&reg_buck5>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    dual-lvds-odd-pixels;
+
+                    it6263_lvds_link1_dual: endpoint {
+                        remote-endpoint = <&ldb_lvds_ch0>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    dual-lvds-even-pixels;
+
+                    it6263_lvds_link2_dual: endpoint {
+                        remote-endpoint = <&ldb_lvds_ch1>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+
+                    it6263_out_dual: endpoint {
+                        remote-endpoint = <&hdmi_in>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.34.1

