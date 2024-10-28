Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B64719B22E1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 03:39:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F66110E31B;
	Mon, 28 Oct 2024 02:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="NM0qdkse";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2046.outbound.protection.outlook.com [40.107.105.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4525A10E31A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 02:39:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YNYOEkixx2r5yvrVG9LrjgFlD6uxwPP36u94O0f4EwZI9udH7VUjM09K7sTP4hdGNa4BJ5oh0HKx/N093kZqTWdNJKBGzPK5vk9gkYMgeIF5FEp5/PMRoqMMDm44/JNVKSMUVJWQwag8dTEnPi74pj/BO3Eee0wZGjUkV7pLmQ4w5emIt6v10JPelPnHex7j8KxFmzyg8jlRByjOg6gDbJfSl81tNBOk6symEx0MRE0o61nGjAOmxuyfGcqKC2Oo7JIucUhmBmrJvkGTIhN1JNn5h5365HXH83dPm+Xw9xfQ6mdw/y3uMWrmO64JeP+ZEiAKIsWiaoQXW8a8J4OEhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0MXb51dWLwzIYBv3HCuE9rQsm7JB2ox21JOfSc/9sE=;
 b=vmOREsrL5h6nUauAAbT8/QSedTVUAo9jtBRwtWpMl6TS273RWAhDHkLCWxiEvr4ZqjeJjWrSGfXCbdaoAXlwy7LL92q2W1AYlYR1d+hZ1oVLkf5QjcjIyw00PsuVLYHG9AGkOGu7lIjLhk+UKGA1cpNDw2BbH0U96ItG/qnGQUK/9m8eVLdfn6e6xEFpsTa1bSX25ANm+vT3SbOkD/pBbiwVgFTvbUCXFSwa9LYzH8k/eC8fYaFkMI1KsU9SN/vonNsdGhSKuFlWiifVn9bS8YuECaEf4Q5ye+1xVcqcl8OXDFMCTqtzTuLykJG+bZ8EHUIKXJAMs9ZW31dDeA7FIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0MXb51dWLwzIYBv3HCuE9rQsm7JB2ox21JOfSc/9sE=;
 b=NM0qdkseoi1R1o89pqcLLz8EKMA75f4dtgmL/43pjEB6bpogUyhTmeOeVWlEnrmc+CZ3LVuDcrgePpOS9TS/ugU/zaQnxRCg+rc3xr6hn9J96hhAQ+yLijDTr1IWPOgmFfwJxs2FqgILX0DMdFsvgDn1A5mgYL4YR2iQ9gJnib1GquyPXB74xT43zxvuil5I3XLaP5OIdRpg5n9+U0F52dGOt98sLUePlH5+KN2mQGTjK9ZyWLWCUcqdJwjaSIeow9FIDK/bNR1iWmEPQ7NTPADW6rF9xAnOd0VARXiBXGleaIcdsCkv5gEzGV8DXuwyLH3f/P9CWY0CWy82hW6Q9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB8709.eurprd04.prod.outlook.com (2603:10a6:10:2dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 28 Oct
 2024 02:39:12 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 02:39:12 +0000
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
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v4 08/13] dt-bindings: display: Document dual-link LVDS
 display common properties
Date: Mon, 28 Oct 2024 10:37:35 +0800
Message-Id: <20241028023740.19732-9-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 65c68bdf-4b61-429d-c027-08dcf6f9b519
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|376014|7416014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LwTcbiYLiMUHjWwYyXjepMDZj3eaUfQEq6xqVIRZwoT75WKpESSHjRqoGLlz?=
 =?us-ascii?Q?mOpbmdiog4GXBoAayDUKn3o29bdMeM/Gj6P7wSbQyD5vltf3/fLNP23lyWL7?=
 =?us-ascii?Q?99EyD96ERlH3T+wRrDCXpEuIl1Csw79e0AloGOF5Z7pj9SoGQZlrOhGvLQ/A?=
 =?us-ascii?Q?dDv3mbIcnay528UoUvo4jsDybkcKUjTFqCOCN659EOGoh5i0yfLU6+nsA7mW?=
 =?us-ascii?Q?BiiHYPO0dVHsm084jW/U0ZTZNzF0oMhoM8slv+6RGDloYUnc06uQlWgy+qcC?=
 =?us-ascii?Q?tpPul8SVRrgBo50LSvDzsd4vc8WrlthFq42DUXHMa0qDS7VKcyJ9w5no059y?=
 =?us-ascii?Q?nTEiznMOrPW7kPP0HRmxl/IEkmvezDSpVyzXlFU0hcV7kScvmvVVKETA2+VI?=
 =?us-ascii?Q?3wrbFbzUqMgoewL8cktiKdtBY7UogXtpMh6GnajXUs34RSGNCGnx7zJSu/q3?=
 =?us-ascii?Q?r0b9acFEN3qBr7g8X1r9prbJuzs+WmeoC51XHRBvlNz1LHJCAu7oTHjpH8eL?=
 =?us-ascii?Q?iJlPTDAbBYa6ubFHMlIh3gdn1iozxRHRpXd0sIvLlVFzCtOJ8iiTYYXun/y4?=
 =?us-ascii?Q?t+CMKeuoZOzgYnu58q9V7VM2rWOot0qmxiINrbaiGGOz3tqVPn0+fc3YwlMS?=
 =?us-ascii?Q?Bz0+cLtVRF3Q80jVq9D4X7cSgV6bOWK8mbfU39aKHZyIseGtpI6AVENIVIfP?=
 =?us-ascii?Q?Y38EDPpirsHPeUdgudG6GE6gzPY/F7BAqQ1s4DNh0kEJKXzD0yl3MWAkiOGk?=
 =?us-ascii?Q?w4VIWrOJ8Qboxcm1MInfKdCACuv1o6zy5NknU3BAcJa2E6YB7r8H2vTZJxxo?=
 =?us-ascii?Q?HShog4LO4evcI8oEM1lSJU8Jhzl8ZyIFBBKzjexAhWfOFdJ3aqPTVIWUW7L0?=
 =?us-ascii?Q?AzkusxW+XEW3WCxmct33+t8LrmsM/GkI3DBfj09O6HqXxy/ynbD+H+sOT+vc?=
 =?us-ascii?Q?dV5Iem8hEguTifIkorR06VKrKOCVLJb9GSyQ2orIok5uTqspW0S4p205J8Bz?=
 =?us-ascii?Q?kfXA4nZjLK4UQPJ67kxZAim6ibdXi5O/NWsrdusdfmaqdbLwvLEwewZ+CVSl?=
 =?us-ascii?Q?NTa14ZM9GIhZMSHyRPwOqIucj6ZDKhm3qNr//nSRKOF6vyWicBNKaVWmtzuy?=
 =?us-ascii?Q?AOu4a6ctNS3EoRRGLYTjpVehFnDCA1hlNYStyGsX7R6g2w6CKNz5/1sgbAu5?=
 =?us-ascii?Q?jU+6ur38NIAXViKe7O+JK6ElksCJdwi8gZ3r9+L/uXw+lP0/QkDm1EebMF6n?=
 =?us-ascii?Q?BCWhAuuwelsWCUz+ECSMyO0cwuwDJjhEn8eZEFS7Y6Xlq/o3jsjG93f4gEXe?=
 =?us-ascii?Q?I+th+QBZYJsNZSfggWONHkuz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(376014)(7416014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/GZBue8I3eGxfLT8uabOU2T1Y5P0sx8jmwTIVmycpxGh5jVkxzDJwBvFeDZ/?=
 =?us-ascii?Q?sgvjv+C745sjoQB7J+TbbWpP4+cEB36AcShR+yNmPgE5MNV5xMNnsWWNvaRF?=
 =?us-ascii?Q?le+P93n9JQ7bvnuXgBMFSSUAgrc/XK1uM2Rs1ZahSd5Fu6fZ66XleLV8B8Bs?=
 =?us-ascii?Q?2C9PxmZEauUL7Clb4aji+94UBtjsTrb+T7SpFXV2TnocJNsQPqeT0gkg8OgB?=
 =?us-ascii?Q?zi0OLm4sFGQh5aiaXw7MYxLvrmYgzphMunb4YJUnY2i91kRzWLTW2CFQbIfo?=
 =?us-ascii?Q?0FgCWjBoRNydlx3FEeA16FYpbAPdmbf22Y65K2L2E30wRxxCxRZi/8lhsesO?=
 =?us-ascii?Q?RaiIqZcgbqUkfnVfpHk6OMKZYFrv2E9gQ6te24Ak6YF2b2/SnYSCWxT5M/n1?=
 =?us-ascii?Q?sMqffJhC0wZVxCgFe8e93SDAiS9Stbhs5DnlEnE65jjAr0oB+Prh4ZFXhj0x?=
 =?us-ascii?Q?PFurSDwYaoCjSBuTH6LHD/11R88ljFVcSP0DcBCBnlaYdp5pLygB5CwLoEwC?=
 =?us-ascii?Q?I7Ch4nebpyjQr9fBc5MME1twYpOVu/XZa9PfkZFqWwDFwT33snI+yIwrDQRN?=
 =?us-ascii?Q?ArLt48IQ2XKAkckG+IjGk5MYuGFmhl8r5C7TmfXsNu+1OmySAEzDXjzlGF0M?=
 =?us-ascii?Q?WM/aZqfRVzXeJh5wzEDryyY2jR80M4/t92soo7rSsvqs/maCPmDQCiuYjRZr?=
 =?us-ascii?Q?zxv7aD60wKHZ2jQBapOUZNQ89+vfcUQDRoR8ywApxTXC33GGtM4wToS8urzO?=
 =?us-ascii?Q?qRxecSE8PPQa07zeQ/El+UXRBRavGFjS0VaiHPqi71W886DxBue0M3fk7CUQ?=
 =?us-ascii?Q?k3ki9eCQgj7p9ZsBzF/h4WGxUnuoGMpD8byl7OeyeEBpLITKexFM6+A7AE8w?=
 =?us-ascii?Q?LrY16Etp5jxcJyfx2uxr75Igd3baUWd9THNnNsewowoJNVDiUhymEz7kDBt4?=
 =?us-ascii?Q?Z7PRkzA7IP1YKqf6zI/k3/uJhtsKeGAylWbngyWNZZgU0VnuaCR6RCC1cCIU?=
 =?us-ascii?Q?ujx9izycK4PpEbBHBuGMq5IDrs8YyyBeZNTOktIAUz+PsbjxvZzTUSrIsD3p?=
 =?us-ascii?Q?/9Eipda1b6kJU3Ks9IWPUKnZmehbBJq/vWCgqSsf4s02o2R6yoN4O75jlbC7?=
 =?us-ascii?Q?/4IndSGKQJNt/3yIG7kaER+Nc9Rlw0WFZejtCms3MA3vTVIM7Uglmu8QpPS+?=
 =?us-ascii?Q?kg1G/ACNOcIBJhmU/XlbaxqJIIzD/XfE0jR86/JQIRhL4m8CzuOgLB/Yi+W+?=
 =?us-ascii?Q?rjz90V0SWNfxO/1MzchhIH/lkBhmn3rek1vVKBg5UqtYDUSoj5PyzxaMtBg0?=
 =?us-ascii?Q?gnt/EP0LUU1A6b2wEiflxzxZj5+SlJVTyRDx+r3jkVG5uBGQDR6iTFaAEapS?=
 =?us-ascii?Q?q63wzCtvaX33Om5NMzrjz3XTj4rzUTwPDR+BSk25J6Rth2Pa77m2ix29cKeE?=
 =?us-ascii?Q?6dVMOGDcdggyrLeXVIKrKd7s3mncDi/fAzJ+ZYB3On9xW8Y8ZmIMn/qSrlpm?=
 =?us-ascii?Q?XNKBWjNC7b6DN2PINtXIGN9FfeRWeJ/UV5sgL84tR22v7yvS9nTeJcOSjaeF?=
 =?us-ascii?Q?uM944AHSNpgtsWf8dnSgwOYEpgvNDrV0GqwsM12L?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c68bdf-4b61-429d-c027-08dcf6f9b519
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 02:39:12.7225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CnoOGy2n8yFWd/lrXQQc61f8HYTiTCSduZbWmmib7cpEw051n1TjhM0tBFYB0RcgT+5vxXwpbKLvlmzi4rtV0A==
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

Dual-link LVDS displays receive odd pixels and even pixels separately from
dual LVDS links.  One link receives odd pixels and the other receives even
pixels.  Some of those displays may also use only one LVDS link to receive
all pixels, being odd and even agnostic.  Document common properties for
those displays by extending LVDS display common properties defined in
lvds.yaml.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v4:
* Squash change for advantech,idk-2121wr.yaml and
  panel-simple-lvds-dual-ports.yaml with lvds-dual-ports.yaml.  (Rob)
* Improve description in lvds-dual-ports.yaml.  (Krzysztof)

v3:
* New patch.  (Dmitry)

 .../bindings/display/lvds-dual-ports.yaml     | 76 +++++++++++++++++++
 .../display/panel/advantech,idk-2121wr.yaml   | 14 +---
 .../panel/panel-simple-lvds-dual-ports.yaml   | 20 +----
 3 files changed, 78 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/lvds-dual-ports.yaml

diff --git a/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
new file mode 100644
index 000000000000..5f7a30640404
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/lvds-dual-ports.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dual-link LVDS Display Common Properties
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  Common properties for LVDS displays with dual LVDS links. Extend LVDS display
+  common properties defined in lvds.yaml.
+
+  Dual-link LVDS displays receive odd pixels and even pixels separately from
+  the dual LVDS links. One link receives odd pixels and the other receives
+  even pixels. Some of those displays may also use only one LVDS link to
+  receive all pixels, being odd and even agnostic.
+
+allOf:
+  - $ref: lvds.yaml#
+
+properties:
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: the first LVDS input link
+
+        properties:
+          dual-lvds-odd-pixels:
+            type: boolean
+            description: the first LVDS input link for odd pixels
+
+          dual-lvds-even-pixels:
+            type: boolean
+            description: the first LVDS input link for even pixels
+
+        oneOf:
+          - required: [dual-lvds-odd-pixels]
+          - required: [dual-lvds-even-pixels]
+          - properties:
+              dual-lvds-odd-pixels: false
+              dual-lvds-even-pixels: false
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: the second LVDS input link
+
+        properties:
+          dual-lvds-odd-pixels:
+            type: boolean
+            description: the second LVDS input link for odd pixels
+
+          dual-lvds-even-pixels:
+            type: boolean
+            description: the second LVDS input link for even pixels
+
+        oneOf:
+          - required: [dual-lvds-odd-pixels]
+          - required: [dual-lvds-even-pixels]
+          - properties:
+              dual-lvds-odd-pixels: false
+              dual-lvds-even-pixels: false
+
+required:
+  - ports
+
+additionalProperties: true
+
+...
diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
index 2e8dbdb5a3d5..05ca3b2385f8 100644
--- a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
+++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
@@ -20,6 +20,7 @@ description: |
   dual-lvds-odd-pixels or dual-lvds-even-pixels).
 
 allOf:
+  - $ref: /schemas/display/lvds-dual-ports.yaml#
   - $ref: panel-common.yaml#
 
 properties:
@@ -44,22 +45,10 @@ properties:
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
-        description: The sink for odd pixels.
-        properties:
-          dual-lvds-odd-pixels: true
-
         required:
           - dual-lvds-odd-pixels
 
       port@1:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
-        description: The sink for even pixels.
-        properties:
-          dual-lvds-even-pixels: true
-
         required:
           - dual-lvds-even-pixels
 
@@ -75,7 +64,6 @@ required:
   - height-mm
   - data-mapping
   - panel-timing
-  - ports
 
 examples:
   - |+
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
index 10ed4b57232b..e80fc7006984 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
@@ -22,6 +22,7 @@ description: |
   If the panel is more advanced a dedicated binding file is required.
 
 allOf:
+  - $ref: /schemas/display/lvds-dual-ports.yaml#
   - $ref: panel-common.yaml#
 
 properties:
@@ -55,28 +56,10 @@ properties:
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
-        description: The first sink port.
-
-        properties:
-          dual-lvds-odd-pixels:
-            type: boolean
-            description: The first sink port for odd pixels.
-
         required:
           - dual-lvds-odd-pixels
 
       port@1:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        unevaluatedProperties: false
-        description: The second sink port.
-
-        properties:
-          dual-lvds-even-pixels:
-            type: boolean
-            description: The second sink port for even pixels.
-
         required:
           - dual-lvds-even-pixels
 
@@ -88,7 +71,6 @@ unevaluatedProperties: false
 
 required:
   - compatible
-  - ports
   - power-supply
 
 examples:
-- 
2.34.1

