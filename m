Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F6C72E6E9
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 17:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FC310E392;
	Tue, 13 Jun 2023 15:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD86E10E39E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 15:20:27 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 35D6A1bC019659; Tue, 13 Jun 2023 15:48:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=ccgwpb+/hQuK6EdsZjdPgyve7cgT4+CMEE9hqxjVtSA=; b=VJ2
 DwuY11ZXBN3Zkjv5GFxeSGVU0Y2QULSUpKOYx9W87d+ViWsyaMEUU/naYnpdKUMF
 xV5vunxrmVaaYY2YrVp/VDdQ2ulVYp8jf68Pw4lgaTVN0NtAsSs6or9p1XfxEHvi
 SGHu1Xxzz3tgbsHsX6pa7F0YXKJtqQaKf4lnJdeA/+Z4gMQSI9cRl7XTzQQ17qke
 A3Mg4ljsONMGwLAG+bk4JUFbM4TVDqhmp4aHnGMoJZ5B+NCtRjxOGl2juOhGzQrB
 58YMnV3Vl0USzwFqqA0sNcL81Jx6XlRJaYn1bwv43TCZqG1UwbpleTg6MZKDCEDx
 5gbJKpzrlappWuCyQwg==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3r4vqbt0k7-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 13 Jun 2023 15:48:15 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 15:48:13 +0100
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (104.47.20.59) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23 via Frontend
 Transport; Tue, 13 Jun 2023 15:48:13 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iG1mRx2mQ+SIvOqXQ55am1SKZuFi0knevHIx3kPuhOvDoG0bYDgx1fUfccliP7W9RPtYq8WO61c8dNGhKyo/nVWzdnq7lZsZfT7wYzUCh+BLOyFyWMSAPolYTHIS61A8mwQHVN4FQ0gM0MLyVPmC6nA7zJgmFvZdU6ZGYjHKu+f7ZiBu1yrtCm5norWF3LWbErzkxR8QCTTpScxikgbRPxNcvHzYs9PP+51xsNWMizs23FQ2vWq1J6Tsf1W5T1so181mOoTu/+y2s/CkAtvzYlBQgZBsUxxrYT49hsoKuaaBkiSxwFzznjxcdQvFO6WS7MH/YQN3CAq5kxw7/qX14w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ccgwpb+/hQuK6EdsZjdPgyve7cgT4+CMEE9hqxjVtSA=;
 b=baOE+K07ZQpHUQb95kjLRvFxtdQK+QtpXGfgEhwM+M+NB0b901rpSGxSPisDZK0Uk6R8M/uHAaDGJCRLwtrCSPZJNqVCv6z8cSn+kDLo5W//agYPdhHzkhOOBWlFoVqTjoDUrAC8MofZ4zvpD4ffFg0OcCgJA6dS8cQ/Xaq6dXjm47biYNlfOJT2neb5XzSUvEF0q35DgwP5BlMhPgcjxEmHKpZ9qENH5KQjG2zxz7SrOx33Ci9xp0buNTzp6iKkFkOsDqqlOexDEHgbR3ftn9JVN+uwsDbftBpaKtjl5wyeWVZoWw/qJY090KbpeTCv+h1NOS3DRQyaS8fBwdDfmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ccgwpb+/hQuK6EdsZjdPgyve7cgT4+CMEE9hqxjVtSA=;
 b=jOXNUTZk6SiAekhWVvRbLhbZZg0JP9aVupzcHYlebzIiwYhkqP24xtQF213X1jyLM5wXP45Myh8ej5gYYobda7JnNaJWzEn+0PQNR4t7ABYXpSo+ZC9xOnA0uwuEq3pT71fkrhXfwD7pdzQjvWuPltcrHY62pkW0t16ir69Ane8=
Received: from CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:155::11)
 by LO3P265MB2282.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:100::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.21; Tue, 13 Jun
 2023 14:48:12 +0000
Received: from CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 ([fe80::23bd:d6e:8ecc:fa5f]) by CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 ([fe80::23bd:d6e:8ecc:fa5f%5]) with mapi id 15.20.6500.020; Tue, 13 Jun 2023
 14:48:12 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Date: Tue, 13 Jun 2023 15:47:45 +0100
Message-Id: <20230613144800.52657-3-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230613144800.52657-1-sarah.walker@imgtec.com>
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0375.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::20) To CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:155::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWXP265MB4826:EE_|LO3P265MB2282:EE_
X-MS-Office365-Filtering-Correlation-Id: 35f0f8de-45b3-4c25-7f32-08db6c1d3688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 68ru6JfpgorgGeQ7oZ5tDfR26mDil63yy55eZhbfS14WyZBuFtX6c5d74OMOgurtVjIrIyuuRgSxHNB2nmgq5yxsbrI3C4ikMmthXKlFdBRr9Gm2QmMxl2ZFiznevKXIZ0WWncuqG4mC/Mxd3pacYk+rIE7rSfCOxQCfXmYpEPHwn/xyjIIXRkpgH1xaOn8PjIrFeEinT9K/PYni0rUtK5sCe6ueWt0E25/jmm//lIXjDW6hKEF6K2O8LYbRJiw24LkldOY9bMwY+iJ+5SRDvz8041xMF5kPBIuhMrFJiYXC6qzFN2SroL4Gh/iSj3+gcFilNz65Hoc2qog3VA7T/mFew4fsPTFz0Hq9S9fLQk43r1aH7IHVqJeavrlfJE9AxTEiPpDkNluiCLn2KaDlEpPETk99q/ykB2eWDrCv3eQ78OQLRPRsHqXz4YE/y0rKcGAG/RLJbU+52t+4/LBULYcGvw6yRQmBXPQcl+dknBAV+4yNvCK6wvOJ5xspZZhncOPw4QVT9wPUbZE/oEt/c1vIMIM3I8x91NQ8eBEdf/zJF6pyVa/5RuGVq/KctBSC5QqsAhoqZSrLo3czpfC0cIw1FxuEuT206cxZ8kAdnuE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(136003)(376002)(346002)(39840400004)(451199021)(44832011)(4326008)(8936002)(316002)(7416002)(66946007)(6916009)(66476007)(41300700001)(186003)(2906002)(66556008)(478600001)(8676002)(5660300002)(6666004)(966005)(52116002)(6486002)(6512007)(1076003)(6506007)(26005)(83380400001)(36756003)(86362001)(2616005)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qhIWLHKhhAp3KL2d+++L/F4g6jejr6v4cc9Bz1aeHfEWZ9fjJyrO0ecpAMzI?=
 =?us-ascii?Q?gXCKiRlfB+CEibUtGR+SK3ZeoRh8S5hD+eI5iwCSog5ytJQgFYxu9TCf5kMy?=
 =?us-ascii?Q?I++s4C6MVGyH/+xJ/Coep3l7ZQkPkJ2TZQg2nuDaPXumsgUlgqL86E2veUH1?=
 =?us-ascii?Q?NtC7V4femBuxfUALas3WRmnuESp31pNiNwB6jvmmFVIQm78KnPy2HWWvO+X1?=
 =?us-ascii?Q?o8B39OilFjFO7S1aSRPGAiRiaQof95aZmWDsvxFyEs/VMaNVdxysKw9nw4uk?=
 =?us-ascii?Q?+GWdOII9fE3kRUyynu60UxH7/3uc/b/7nyQzQmpeQoHvV/lkDIr3WKSEfksT?=
 =?us-ascii?Q?/MLbc/sHdge6ZPJeSlJJ58lZjKZT0dtOowu0FeGnJpTeqD4WazwK0FRlHeQ+?=
 =?us-ascii?Q?ZK3rOWsMdZoI7s8so6S7dDn2+XcueB+tHhB6B+moEP3KSotLbRYQvaqocQhC?=
 =?us-ascii?Q?yeIHdfgwHLLVVx847EqZxfGNuunbND9jPd6XbH2CaaiN0ynLNiR6SFO6x+7K?=
 =?us-ascii?Q?6eXMobXMKg+CP6svGvkadoBrxNVEBZjoIKefCG5p34Fu6ajvwejcYlePMKol?=
 =?us-ascii?Q?3m5t8oD3Umjb1czam4PipKG0lFnuEwWZ4YTqUIUP8YcCHfm0eL3/M7U9OlmE?=
 =?us-ascii?Q?30W8aNgTJRwRcuDoq8mf4cMOHLo/Z0mfNwzjbLa0OogCYHVmLWmMJtC1fkol?=
 =?us-ascii?Q?t8HSycZGNlrXJYb0//WI9zizKmbJdSyZvYuSSxkA6J0pA4PSxnlhk4YzHH2M?=
 =?us-ascii?Q?sO26mi34sLIWReKmnbEeh2W+1P8mzQGJjAqyitkbSoWxxfHKiJ3AGEgA6QBN?=
 =?us-ascii?Q?EUhDMjMhnYInbPb4OOs+DJIKlh2XBocqRI7SzTtQmwtSRUT9wige6HBHq1lb?=
 =?us-ascii?Q?xL0xxwPP5wKVkiyH9enKT5X3DipoPNdAmSZBuvX8TTOTzv4GxXiVdH38Cw4/?=
 =?us-ascii?Q?tIBuo4EozfxeBgH36T1TG6sLaJ/oLrRLnn6DTA4drPkuHlhiUGB3i/uJ3bGR?=
 =?us-ascii?Q?ArcpIGUTKpbH5O6KDR5nFbcnRjE4t0K97j47Tb7a0UZNkOpBbnMGuaEkPK1T?=
 =?us-ascii?Q?USmubcD9Yi0MzxDq1RbY74bXLkwhmsKmK2nfslfzNFITS+LvDOM+TftfPvpO?=
 =?us-ascii?Q?Awbuni58B15nLcC0WAFfaHENg7dtNR9wy+gaEtcwZB3gMcBMmnhmKfRTcGsL?=
 =?us-ascii?Q?E8Tfsi7ZkXdrFiBIW4aSyQZoxegqwpsuDGOj2cipUZhpfIX25GYd18pyUJ2Q?=
 =?us-ascii?Q?afDq952u2ekg3+lUpIrnSPwjKQoPoLsiIrfGGdZNfoNE+qphxz6r0upR6NIO?=
 =?us-ascii?Q?ZjvD2nWfKPqLbt3j5cZ++ejTryc5ur8d8JZIZoPrgMLwhEZHAzy3+eX5k4xN?=
 =?us-ascii?Q?S0f9w5PmyD+SYUOdEoPoRRp/IMRFvLkwRJceSMENMhti9p6yLfRvUmar83q8?=
 =?us-ascii?Q?7Yjgb8BcCWremDga5Yq5L0lsT0svojUessbm2WFwtGaWZ0LPNNqk7fr+fXp2?=
 =?us-ascii?Q?ZjkR1pfGFgo9Q4ec36NtjK+QFuMQaxTRfBjcPchsuCrI1LpQixwBROIh9alb?=
 =?us-ascii?Q?X2PxsXHBU6eW8bNJFdPvLLb+CX/WP5/gjad4pQFrKGLE+12SWo9PVI5P8U1t?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f0f8de-45b3-4c25-7f32-08db6c1d3688
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB4826.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 14:48:12.9061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhf+GroG+kizhjEfyFPZlT09zYbPpxZD1pR5/APKZ+dgjpLoThvHmNTaxYARhTs+bEUIytDUZjlXSulPBH1NXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2282
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: KyevjITliykSYadnJc-xmOmSd9ssYt-B
X-Proofpoint-GUID: KyevjITliykSYadnJc-xmOmSd9ssYt-B
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, sumit.semwal@linaro.org,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the device tree binding documentation for the Series AXE GPU used in
TI AM62 SoCs.

Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
 .../devicetree/bindings/gpu/img,powervr.yaml  | 71 +++++++++++++++++++
 MAINTAINERS                                   |  7 ++
 2 files changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr.yaml

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr.yaml b/Documentation/devicetree/bindings/gpu/img,powervr.yaml
new file mode 100644
index 000000000000..652343876d1c
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/img,powervr.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2022 Imagination Technologies Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/img,powervr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Imagination Technologies PowerVR GPU
+
+maintainers:
+  - Sarah Walker <sarah.walker@imgtec.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - ti,am62-gpu
+          - const: img,powervr-seriesaxe
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: core
+      - const: mem
+      - const: sys
+    minItems: 1
+
+  interrupts:
+    items:
+      - description: GPU interrupt
+
+  interrupt-names:
+    items:
+      - const: gpu
+
+  power-domains:
+    maxItems: 1
+
+  power-supply: true
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpu: gpu@fd00000 {
+        compatible = "ti,am62-gpu", "img,powervr-seriesaxe";
+        reg = <0x0fd00000 0x20000>;
+        power-domains = <&some_pds 187>;
+        clocks = <&k3_clks 187 0>;
+        clock-names = "core";
+        interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "gpu";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index b344e1318ac3..a41517843a10 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10084,6 +10084,13 @@ IMGTEC IR DECODER DRIVER
 S:	Orphan
 F:	drivers/media/rc/img-ir/
 
+IMGTEC POWERVR DRM DRIVER
+M:	Frank Binns <frank.binns@imgtec.com>
+M:	Sarah Walker <sarah.walker@imgtec.com>
+M:	Donald Robson <donald.robson@imgtec.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/gpu/img,powervr.yaml
+
 IMON SOUNDGRAPH USB IR RECEIVER
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
-- 
2.40.1

