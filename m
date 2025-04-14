Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADF4A87659
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 05:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8518010E454;
	Mon, 14 Apr 2025 03:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Ok34anH0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012006.outbound.protection.outlook.com [52.101.66.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D6F10E454
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 03:49:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VzIFiLQDHaoNJcN9W++6m6EIgB78u3IcRCNktH+Hi5dUARLNy4Hw/JF5yEliTawygUZbXD9pNkYh/c26UOtsl23h0TUn4mJZEv4/PKe5zwxPkYVZ1B4WCuIk0WbjuqqULuBm4HfPljIWWLhdf5a2W3FposjB3JzefIPCTcdudwcfj1Ao//TSnzfgA8h6BL9/mr+zi0dJqZYCN4EcvHYSxjsgYTUKhGynsyXYPsdjaD5ihYpE+k54mci8jyCCf/QuVWLQwq1ykTl+gCaw/wBJbV0pzTSRa5DVtfkc3i6R50xzaG1J7vsLIe31P2tFnwhkcEagyAIXMQF6Y+JNlP9B0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWUqcxMaTIaMG1R5M8zwjBvYayjy1Q5bc6NSqTGocuU=;
 b=Gm4KmglzHUZTMto4YRIJ6v9N5mfc4ckK7GENAXfXeFXza3vU8Dt9/dpIXYlXLWTgtLqhN1VSQuS52neqZoJLd9KwnRMSGzkvKoO+WnkSqxTk57+bAM+u+7qFSli+BIa2S0DTJExqHYbagO/pw1d+CCz6iJTXI7ZF1mco93jlxtNNDUqEmv/EEIEAEPwF3klNM3KSHKxGKRXQ3jrCa4Km1xvRHg0X9qb4nUUySZZkQ1r9uqRmewBmIjT4Fv/ddnSYH6lcXAwx9PCwRSSdAcHhhKOrBaXHHSUvXfJJxz8EatFgiNYnWZ+tB0DAWHH4ylV5AJnyW1xU9dQVQoNjf9frbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWUqcxMaTIaMG1R5M8zwjBvYayjy1Q5bc6NSqTGocuU=;
 b=Ok34anH0GCgNJt/U0iiIIoj1YmRZr1O+kL327j9zKOe6xNxDKAcHMLh2MRi4WyBliu9ZZCSk/zZj1A3KcAKFTJlH6AsC9OUi5wsEyQ2IxMGsXlrEoz9dhxGGnhcsIG3w73m0vrgX6GBCemRCcAScwvO3Oj5v2dt9kqhocgBKdBZuvBoDir/Q0N6Hot1BCEzlAFXkJokVATRblMQGJSidgk1oijFwtbFhabvGQ4/uxzWsK4SOYRCeC6Yjhxaoqx9Gx5vg8lnP6prbm2aquHM+unYrhsBgo80vqnQFBCFG7prfgxWFsQe/XKpmIjsD/O1iCpR+I8DcoZ3rYAlOgJFgbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB9803.eurprd04.prod.outlook.com (2603:10a6:150:111::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 03:49:42 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 03:49:42 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, Frank.Li@nxp.com, lumag@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, u.kleine-koenig@baylibre.com,
 francesco@dolcini.it, dmitry.baryshkov@linaro.org
Subject: [PATCH v9 02/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller blit engine
Date: Mon, 14 Apr 2025 11:50:11 +0800
Message-Id: <20250414035028.1561475-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414035028.1561475-1-victor.liu@nxp.com>
References: <20250414035028.1561475-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::29)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB9803:EE_
X-MS-Office365-Filtering-Correlation-Id: 932378ee-7469-4f7e-02f9-08dd7b0763b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7qG2CO5o2sop9y1whdJOqHiRsG9lqtu05lpBVSMlUJowbUUdpnkVWGmKeE9i?=
 =?us-ascii?Q?j2GVVh4UFZPA+ZWnX1DcP+4YF96JEalcG3z4ZAk+CYhSvCFW6JBqiK+xkRhH?=
 =?us-ascii?Q?Sswsx1Yr2KDNjwxtETiMx5KMe+Ol095fxu6YG01ofuKDdnWxXKIe1MXp93Xg?=
 =?us-ascii?Q?eYNWeFK5aD9TmV6J2gEXaAoMdxoHmO6WW+PZ7OrUXW4wK3ezoJHNXB8szFtA?=
 =?us-ascii?Q?ZhPMIAXivtykOE3/d2fhFc5NqGIV4sq05CyuGDm/HO+4uIgMC4KMo3SrPUph?=
 =?us-ascii?Q?5IPpGWFafQ23fxCUocr+maKA+UUxgyhaWS+M7PppQQgSdrr3P86Rn6AMRyiM?=
 =?us-ascii?Q?kWVMKKms7G30c6P+EkUsIxvfecN9Hv5rA0vyzjagpNbD5jcnfe38RRmxFeNx?=
 =?us-ascii?Q?eztqTax4CpIAM/cyfes42RPMaX6ge+qmy20c6wPk+CmLqD56PoO2aaxm9GFK?=
 =?us-ascii?Q?bUe5W+nsAZfuBg2lv7qn5Tfo2lzJCELxrOglU94Wc7dRg6p1z+0OOhDrSvQN?=
 =?us-ascii?Q?il49/GS+ueV1qXDAHcx3KeG8Q6iRqUzVB5WaFN0wtj1/Qkt0EV+qt5KdHW2L?=
 =?us-ascii?Q?04cp8IAWcCdvqF13qTZJKJ1wkFu3zTo6SNgTleEC5TvpboOejWptpzhXDptH?=
 =?us-ascii?Q?wXgcH2nKVysBolCq/eSkc1AcUp0d9kvqXddrELS7Wx6b1/jlEFq1uaHK6TP/?=
 =?us-ascii?Q?wVqCee1ycP/M76eFcCpH9tsuayslg6yfxC7qYpKbuLYYh5rGVU0GYKf2JyGE?=
 =?us-ascii?Q?dBunqt7guwZzCa8EPvRdJJtI5ybnCoJtluyH/kjTR9RzZOWDWbrnyVygkonP?=
 =?us-ascii?Q?/2CAXcwv/OBw3sieKjpOkd4kvcO7VZ+f/5ZasHGQfwx0uwCvTbZsPgNoyetc?=
 =?us-ascii?Q?nxy4N2jML98dCIXLHxmBqTvvOGQjUuFUaqvEc9BjwJjICqc5K+pUbRGcm6m+?=
 =?us-ascii?Q?so81m24VCI1KfxcOwISpGA9mrEByp3K2GDAnj1NwGcGLfy1StT4WF1EXVxTZ?=
 =?us-ascii?Q?zsmolpEYrlSDAD5sRxC1/TnbeBT5IXL7lkuWbdKZqbjrdYmFaF2n+AwgQr40?=
 =?us-ascii?Q?+RjbL8ubM6kG6ggv3ZHeSwd8pLNUMuOk728GDJjWPvXuuSA+osw5G54nS/HX?=
 =?us-ascii?Q?YBD1+4dziengA0i7PtCbOZkwKwkcSUHtkpj7RQecw/xe6jNTb6KkUhDHnszZ?=
 =?us-ascii?Q?YTkH+S0qz+bFZDKY0wixcJGwMhjuRZ7hBOzjZeHi+JnRS//VSqhdT9xrSfH1?=
 =?us-ascii?Q?3OXmOLedboUS1EHx3OYrytWci6IA/VRLntAUyYGTY73K28Tqj8jOdyUHd6lN?=
 =?us-ascii?Q?k2k5+CF3lFBNiKMF+jL0OAXIkhXBhrTSKA5N9jJN9rUJ51O2jefRbYGxgNSH?=
 =?us-ascii?Q?BYfoQY5mjSTenRrC1PhXRI9EdlTJww6oJtydP3NZkQrg0UaYsrhfqMvOBhcj?=
 =?us-ascii?Q?xJgAt359j+E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/0O/pXT+QwRuN5QzB9zZu6VEHD67jPWmKD1sj1on4VUPsIK6K/vjkcKBnBjd?=
 =?us-ascii?Q?T8DxvDWwxaiZXJ1dDoAyAfdMJhL1YEnpQGm8+lijaoou0HN+r/b8P7586Buy?=
 =?us-ascii?Q?vqdpSyyDaiyg4BG9nFLl6mv8xTfSJi2zlByH/sP+2BGYtq6BGx40hXTNEiOv?=
 =?us-ascii?Q?Rbgme64kpEaGZaCVdMMCSEllWxewE4jaeHh7q6vPYmfan+APEZGWO0jRlc6Z?=
 =?us-ascii?Q?0VRr3KQSt+fipHEHPxUTRSw6NCvwh4xVS+MgXCtxx4cawko2RKF88NYuy1zu?=
 =?us-ascii?Q?M4haDV/bxopoYd19KNWSh4Qbl6pdY5qkvi5ibMw2odzOxjdLfpcLOrLXLOCk?=
 =?us-ascii?Q?C3vqO9h8hHJ0R7gfECIy6zn8H4fBxPc1GZ3yqKddHyVXBYaL02DguxOWxVrB?=
 =?us-ascii?Q?cX/HA3YULR11tf4r3SA2IvVpCCONm++OkVA9oP7k7nZ5weh+heanzZYtZR8A?=
 =?us-ascii?Q?dW4Gy18K7MAf9kCXuogAfgSMap9uFrLZHSXYvYFGdpp7TD97u3Mk4LeEQH5Z?=
 =?us-ascii?Q?+psOWiynntjSehEEjZkl2+aBa3GA0dTUU+S2dfqUh1W2shsS1L7mS7hzmAWh?=
 =?us-ascii?Q?uaZi5lbh+8Bu786MlqceNlQJlkoZzFT2wZXIYBIrPU5c5o+0Zh2a85jRtOrL?=
 =?us-ascii?Q?4x5Jrizm4ePFsj/yN9ynYzSq5MqXWuF09AOyeSmOKwD8eTJ2HpKE8diY71C2?=
 =?us-ascii?Q?qZFaNZI7IDOzQJgzece35vrCqcwVKDpL9X6A3z7zZhc5hIwvPJ4pDAJA6VyD?=
 =?us-ascii?Q?NJGc2nuKM/rD8R6+mlGsk12PbT3KKxUQ4/MDYr2wwDaZTEvpxpojzaYxnjBw?=
 =?us-ascii?Q?RTu9eKlWTolEjss8fB7SNWMdSsvUTGOk87rsgLt6bWv84Cof+5E+3xZVRXb1?=
 =?us-ascii?Q?plAPWlYCD3XfPTuj5++1AgddBk+6RYMvkvcq+Cfc3Q+q8xGUnqf98pvubvo7?=
 =?us-ascii?Q?IKyI/TklNmN/zK2cyc0EAKZt3JgfoStK97ZK+j+Y/lUkh704lhj+sI7ySLeO?=
 =?us-ascii?Q?8T8Ce9VdiJvxZSXmUoIojrpmSU0RcMp6A0viSEBINF09gcrSKtRPWRxq+hx5?=
 =?us-ascii?Q?2OYxrt9CaBzcjTE57owNfI5CHM80yGT7uGBiPsp+CHUz7ozYfLeF1rCITitf?=
 =?us-ascii?Q?PEDfyNaGmhGUViSCUz+t+E5Ca+2Z9Xu7ZJXO8ULfJr41Xkz1P5bafPScmJnu?=
 =?us-ascii?Q?nxSmrL/VMf6ln8rJiixsFrCYKr5B88aj9rw9T75pk/Jy93kUfXzp1UQB200A?=
 =?us-ascii?Q?1ieK+qKVfJAt/00ESGzSm7XIC9svVpK05mddjbxTHZpK4nKDE3LfU9fgZkkj?=
 =?us-ascii?Q?pzq35gVaHp1awXvqMpInwNIX0/HkpvXmvaihzyb9ts0sgT0n1ZAhfIFyW62P?=
 =?us-ascii?Q?bNpydpdkCunq//TWqnFviM8fxV/TmRHSlqaSLxTxyFUUSqM5xU52X07JNgxi?=
 =?us-ascii?Q?ITlZPLoEZEDJgLX0MAXFBCdXNjdPAJlti5PJoYB8DkahnM2kBWLFo2fiPLBV?=
 =?us-ascii?Q?GFpwOW3QiTTeBugfxB20tYqi15Dd45fChnfT9EJ5nhnasRGFUPMdSpv9VIpo?=
 =?us-ascii?Q?JAtak2OsNJ97Gy2cl2UEmmjKuuWb0krJJNNbl5LX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 932378ee-7469-4f7e-02f9-08dd7b0763b2
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:49:42.6767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6fxwJnEEIsHGDJMi5v1lwD1tlIPufNR2OpbbABEy4WkYiYceHbDy0m9YYTX/An2/sjMcgmT/TQXFnB9igUv/Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9803
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

i.MX8qxp Display Controller contains a blit engine for raster graphics.
It may read up to 3 source images from memory and computes one destination
image from it, which is written back to memory.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v9:
* No change.

v8:
* Drop instance numbers from compatible strings. This means switching back to
  the patch in v4. So, add Rob's previous R-b tag back. (Dmitry)

v7:
* Add instance numbers to blit engine internal devices' compatible strings.
  (Rob)
* Drop Rob's R-b tag.

v6:
* No change.

v5:
* No change.

v4:
* Collect Rob's R-b tag.

v3:
* New patch. (Rob)

 .../imx/fsl,imx8qxp-dc-blit-engine.yaml       | 204 ++++++++++++++++++
 1 file changed, 204 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blit-engine.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blit-engine.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blit-engine.yaml
new file mode 100644
index 000000000000..45db6da39e20
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blit-engine.yaml
@@ -0,0 +1,204 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-blit-engine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Blit Engine
+
+description: |
+  A blit operation (block based image transfer) reads up to 3 source images
+  from memory and computes one destination image from it, which is written
+  back to memory. The following basic operations are supported:
+
+  * Buffer Fill
+    Fills a buffer with constant color
+
+  * Buffer Copy
+    Copies one source to a destination buffer.
+
+  * Image Blend
+    Combines two source images by a blending equation and writes result to
+    destination (which can be one of the sources).
+
+  * Image Rop2/3
+    Combines up to three source images by a logical equation (raster operation)
+    and writes result to destination (which can be one of the sources).
+
+  * Image Flip
+    Mirrors the source image in horizontal and/or vertical direction.
+
+  * Format Convert
+    Convert between the supported color and buffer formats.
+
+  * Color Transform
+    Modify colors by linear or non-linear transformations.
+
+  * Image Scale
+    Changes size of the source image.
+
+  * Image Rotate
+    Rotates the source image by any angle.
+
+  * Image Filter
+    Performs an FIR filter operation on the source image.
+
+  * Image Warp
+    Performs a re-sampling of the source image with any pattern. The sample
+    point positions are read from a compressed coordinate buffer.
+
+  * Buffer Pack
+    Writes an image with color components stored in up to three different
+    buffers (planar formats) into a single buffer (packed format).
+
+  * Chroma Resample
+    Converts between different YUV formats that differ in chroma sampling rate
+    (4:4:4, 4:2:2, 4:2:0).
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-blit-engine
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^blitblend@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-blitblend
+
+  "^clut@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-clut
+
+  "^fetchdecode@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-fetchdecode
+
+  "^fetcheco@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-fetcheco
+
+  "^fetchwarp@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-fetchwarp
+
+  "^filter@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-filter
+
+  "^hscaler@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-hscaler
+
+  "^matrix@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-matrix
+
+  "^rop@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-rop
+
+  "^store@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-store
+
+  "^vscaler@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-vscaler
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    blit-engine@56180820 {
+        compatible = "fsl,imx8qxp-dc-blit-engine";
+        reg = <0x56180820 0x13c>, <0x56181000 0x3400>;
+        reg-names = "pec", "cfg";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        fetchdecode@56180820 {
+            compatible = "fsl,imx8qxp-dc-fetchdecode";
+            reg = <0x56180820 0x10>, <0x56181000 0x404>;
+            reg-names = "pec", "cfg";
+        };
+
+        store@56180940 {
+            compatible = "fsl,imx8qxp-dc-store";
+            reg = <0x56180940 0x1c>, <0x56184000 0x5c>;
+            reg-names = "pec", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <0>, <1>, <2>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+        };
+    };
-- 
2.34.1

