Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F277DCFF1
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 16:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E91A10E520;
	Tue, 31 Oct 2023 15:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D66410E51B
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 15:13:47 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39VDoqY5030766; Tue, 31 Oct 2023 15:13:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=c4v/DW7+/gZiCDJqeAm9Z/UDCV6xP11xbSB0Q7b/lMc=; b=o0h
 l5vzAMLXBuHqwaGEjYwotyUi/c+PtJyrPR2LNMd/TaITKubyy9Y70F5rYMkZoPbr
 NatDwqH7Wnz69D/G5+5T3rnKPcfaOaCcIsaQ8CUUSgXaWUOdppzC+Gyo0MuYokAS
 0J5cYvArxTH86NusTO8ncut3fX7DpmTtXmWIDxkdEx+cV9X1ql9n9Zukpo3sV5rR
 vkUegc8JRrQyzsXWVgQbO7Ut5kuf0f3Zb1w5o4Y9RpwXa7R5D1g9fM+I+TwJjDTw
 VSKwzCfaB6UYD6fvlEeRf+kG1M8OWO8nd9OhJCGXS3bnvDqeoid05aqWgP65ie9/
 +XKm9IXqhebvUoJKX9w==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3u0rjntf3v-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 31 Oct 2023 15:13:16 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 15:13:15 +0000
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.51) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34 via Frontend
 Transport; Tue, 31 Oct 2023 15:13:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIHviwEPUeWbM7H2TIdhPpwpFPKdVKE3AEz9+mVHJlolnOwmMMYF2QWA2Wk2xeCP/WW1QMyy7zUYoq0bigKo277seFLWJSCA1Pgiru+F0vC3F5ftvfvVv6YIZBXCrdNPOMwNnQWc6ZneOe4jTXPE10M7h/mlZv5wBIuW9qJwtzj6go0o0jOWSTAV7eu71fEtRdo8hum56QkoKfHx4JEQ+dqdH1154kOivBroMES1zI0jpNhx9RSDOizVRqMjnsUyqI0YB98FjdqzL93NpZjmGFsHTWtCIbpI+fd1Np2uUftOmzxXwmYlhDC2cm4OGLlYeio0bEzyv8twQasNVsKd0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4v/DW7+/gZiCDJqeAm9Z/UDCV6xP11xbSB0Q7b/lMc=;
 b=I8YkU+pXZxyvirQOt3uxskE1LVJXrC4509z2lrpp71N8iRtdyhZ+zk0InKyJZGGpWtHZ3A7j0DsnEovn7lurCtLnTfg9thDTO4rYNlITZeHOFlIxNnLQnfjqS5J+Sm+wREsBNG9vQ5jWAm+F31m2xAzgkgvndys0gsJprZtsZ6fFvFQr950KtUZV7R+xSqarwMtmLlm7/pLoODr3BtC8jeLpuexKiOtdo+wFOM9s9ORK43uq3uTvXUnRfazdaO0gLJldQ3o7pOBQO7WAqyV1r6rAbGIL1NU/3uPSPRYtnsV+WCIluhkggiSvph9B3xKkmIxNydyMGAPahRtzDP3LTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4v/DW7+/gZiCDJqeAm9Z/UDCV6xP11xbSB0Q7b/lMc=;
 b=kSM+ofOSwgFurIjQwqTuoUyog0M2wwPsZrJWwVmPYHCNInYbinzFoAJCR2lURlXt5j5CfZksblNT0rkNGLqbmz8MAPKubhG9CTn5SRQCX/zOnW7FHP91m4fDSiPBDBmsZNUR2SOUcN6V0rPk11AuTpUtogIeiIdkIO2wlZKx9a4=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by CWLP265MB2018.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:6a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.25; Tue, 31 Oct
 2023 15:13:14 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::eef1:bccc:508d:e086]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::eef1:bccc:508d:e086%5]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 15:13:14 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 03/20] dt-bindings: gpu: Add Imagination Technologies
 PowerVR/IMG GPU
Date: Tue, 31 Oct 2023 15:12:40 +0000
Message-Id: <20231031151257.90350-4-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231031151257.90350-1-sarah.walker@imgtec.com>
References: <20231031151257.90350-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0301.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::18) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|CWLP265MB2018:EE_
X-MS-Office365-Filtering-Correlation-Id: 4581d817-1a6f-46b7-7b3d-08dbda23e755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1bgrvJ8TxUoC2LJdlT9c65lJ+9oFExTLvtj2DZvqgfB+o51+YlRtgzgf7LXgpL3y1JXT+fDNH5qDxbYsG+Hx14N574RKXXzXEPl//vR9ONDpyhdkRF+bNsTgGbUCG7dRPkjpr1HUwvARhh1HBlwsB1dTCUux3N3DzP6GpoiHL3t6n18jVwpM7XLBWft7ztS27pi7O4O3cAh6LGzl9Dq7My1ebo81nFePkAp64UMU/UCI6YV37+2kmzyYvxqmOeCjYmwAbdSyx60dDfKJuYE7mptG2P09gkigsLd3JUgbLAxWYs1p/0kaH5TOiU3+BGwD0Bobs52kd8p2XH/5yMDgZ8loU+wmclYrJG7lDUfPMzQY9crN2A4q3NgN05vWCqHT/b17gpY5cqrimXNbZB9sxtFKCtV1DBEfh4ZItMM9gGdZVNP4tq28BdXyBAg6A9UhdQsA/9jaeTUEd11DP2PnA9lQMgN3fsktdNYIy/mXSgtA9crE8aFp0zI1z2NAVhWKLbKgdi51tK8/70hYMVLLQY4nOFqcvjApMyr0pf1ZfwxOcDRVHwqFY1rBiMhhqbEW3Hcva+5uVLzfQ5rHq++XjsothgfgGQy1Sj5irNIexrk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(39850400004)(346002)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2906002)(7416002)(41300700001)(5660300002)(44832011)(8676002)(4326008)(8936002)(38350700005)(36756003)(86362001)(38100700002)(1076003)(316002)(54906003)(6916009)(66946007)(66476007)(66556008)(2616005)(83380400001)(478600001)(6666004)(26005)(966005)(6512007)(6506007)(52116002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BezBTeW+9uOssmFCzAC23UsuSp7ki0ExPWw0VnYtrYzJpFlAyWdG3JiT9fEc?=
 =?us-ascii?Q?GShzHRvMxTg2wd8xX3zyQGn2oyoS+RR4YU3KAn03hFYHgscxqppK6XreCPKD?=
 =?us-ascii?Q?WHZcgNchEzO0AJsf/1qBJwd0jWRXfFyDA2qQe9auuPf9hk0YmJnpGomQTdus?=
 =?us-ascii?Q?uY7tVcMagH8imL0BC8GMQL4R4rhJ/0EkyIcggsII9DI1TmhF73L959s6KurQ?=
 =?us-ascii?Q?2qXgcSfN7jUPAcfxU+y07+ZDEtVBN0WpzyepW4+/TY7BPliFo84+tWW16D3/?=
 =?us-ascii?Q?NS/CWkmy6Whnkw1YidQOhsqgFg046A5xM22keMlI7/w3mtFq1TYLHoYbRg2K?=
 =?us-ascii?Q?/osEg4gmYmy+TphJlkJVn4PN6BXAJm1pYmFSISK8OJ/K4bcmFKn+4O/sltDF?=
 =?us-ascii?Q?qvuPO3W/aBA6DJGte9oAsjW1XYozRDYX52eD/OIwT6wC6w2OmaAJWHdad97z?=
 =?us-ascii?Q?vSfYmLdqP4IzwlF0mdNKmtY0ULqvfEXUmehUlpOjMnUywxBnUsHCBEH7bAzB?=
 =?us-ascii?Q?Dq3SvabZ4faeA0M20Y0Td4M6155J4o6/IB5DQeATDafNpvwhmO/Fzawu3NsO?=
 =?us-ascii?Q?62GrYhsTbC9zQlD6eRT8TWqaJ7vEflkt+HpFuDn7mEsc/8CvWCDtDrqcuB8G?=
 =?us-ascii?Q?Fm+H9zXvnMCc/mXc2rQYyoCTrCVA5fCMMgbGlLZoGfw4Ki3R/TBTK1YvX6bV?=
 =?us-ascii?Q?1NB3gIciYXkuygzW4KsINowDK710PXDg/1wDf8eFfRARG36+0QjFNTRNLZOo?=
 =?us-ascii?Q?SUf9MR9UYXMC+i2Z2pFVGTmOsUQyMmJ1hT6XndCQCJ7OM+qCsOGfqBHehYS+?=
 =?us-ascii?Q?9gDLr7/Kv5bwrNm+YiWakHijI/AwM7trPI4Us6PrWc/FJSDbKUjOiNfhBXX7?=
 =?us-ascii?Q?A2bOV9TIleYjF8mY1Lg2S4ND5D1tS6r71THHJtr1rMDXXTh4SdLt+09+dCrU?=
 =?us-ascii?Q?OePbeOPBuPAZoZGqAvCb6pjCQFOsnAC7WJSr3t9fSpqqzQtq+eLPEUilbHSo?=
 =?us-ascii?Q?8+Akt59LhdjigvTkOCWqdecURx9TzuH8ePnQjO+KWMdfOOLEriTThzKe4+Cn?=
 =?us-ascii?Q?duqGcwn63LDdc1mWkzSHJ+seXdavJLhYySz/RRgpX3MAbG30xZqLpqlH5UuK?=
 =?us-ascii?Q?XSpo6RwQBBve2ccodc6FYg/C/z9arZKzi6ontP+qW86C6f8hqXO+12d5IuQa?=
 =?us-ascii?Q?z8eRRS/pzw21hRMoluAL9iYl3NDqefxvN5MdDS3yM48TWsFWpl5MKxgTPFeS?=
 =?us-ascii?Q?sTwWL4lt12fv5F/6PxnU2p/ysAI4DX/uas7hunifou4F762d6sdDhsdVdsNs?=
 =?us-ascii?Q?2PwoghFPnhouCbTOsuFWAJwYFzS1Qgc2CilrLh5q+/tN7Yp1i/5aRPxHfeip?=
 =?us-ascii?Q?4TJNB6G8UUG0uLpJLhpyyMEVexQf2HkMIuSSn6OSsTI5Ph2iNPs5bwF4gIUx?=
 =?us-ascii?Q?umUwFUcetB5tBi/EoYXeq7nBXXeq9aoz69A6HBWBMM0IUDHnKAx6zRhXadoJ?=
 =?us-ascii?Q?4K4OUmYgWPuOPZ7+38SiM/G4HoF6PzasC5Iu+yceFkmI4LdMmHSjybQmB2Cw?=
 =?us-ascii?Q?K/5JbCe9Z1Uc/6nuDKmZw6Kohuzmy/C5EQnpn4r/M9py4J6NU7wcnWqOGGdo?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4581d817-1a6f-46b7-7b3d-08dbda23e755
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 15:13:14.4460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m6wQRJxC2XLdl0QQb7ogpBqSsBMMksrOMgDeCZWvJ/5HT35nJtUe/ahZD6BAxo6OJcSNICxezeyBh6mViqZ4cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2018
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: -OP1JKrPpM68cOwzNVeSj5cMnwFg9YB3
X-Proofpoint-ORIG-GUID: -OP1JKrPpM68cOwzNVeSj5cMnwFg9YB3
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
Cc: linux-doc@vger.kernel.org, hns@goldelico.com,
 Conor Dooley <conor.dooley@microchip.com>, krzysztof.kozlowski+dt@linaro.org,
 matthew.brost@intel.com, corbet@lwn.net, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 mripard@kernel.org, robh+dt@kernel.org, faith.ekstrand@collabora.com,
 linux-kernel@vger.kernel.org, afd@ti.com, boris.brezillon@collabora.com,
 tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the device tree binding documentation for the IMG AXE GPU used in
TI AM62 SoCs.

Co-developed-by: Frank Binns <frank.binns@imgtec.com>
Signed-off-by: Frank Binns <frank.binns@imgtec.com>
Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes since v7:
- Updated maintainer

Changes since v6:
- Remove unused gpu label from example
- Updated maintainer

Changes since v5:
- Update compatible string & description to match marketing name
- Remove unnecessary clock-names definition in ti,am62-gpu constraints
- Document that GPU revision is discoverable

Changes since v4:
- Add clocks constraint for ti,am62-gpu
- Remove excess address and size cells in example
- Remove interrupt name and add maxItems
- Make property order consistent between dts and bindings doc
- Update example to match dts

Changes since v3:
- Remove oneOf in compatible property
- Remove power-supply (not used on AM62)

Changes since v2:
- Add commit message description
- Remove mt8173-gpu support (not currently supported)
- Drop quotes from $id and $schema
- Remove reg: minItems
- Drop _clk suffixes from clock-names
- Remove operating-points-v2 property and cooling-cells (not currently
  used)
- Add additionalProperties: false
- Remove stray blank line at the end of file

 .../devicetree/bindings/gpu/img,powervr.yaml  | 73 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr.yaml

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr.yaml b/Documentation/devicetree/bindings/gpu/img,powervr.yaml
new file mode 100644
index 000000000000..a13298f1a182
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/img,powervr.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2023 Imagination Technologies Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/img,powervr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Imagination Technologies PowerVR and IMG GPU
+
+maintainers:
+  - Frank Binns <frank.binns@imgtec.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - ti,am62-gpu
+      - const: img,img-axe # IMG AXE GPU model/revision is fully discoverable
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
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,am62-gpu
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+    gpu@fd00000 {
+        compatible = "ti,am62-gpu", "img,img-axe";
+        reg = <0x0fd00000 0x20000>;
+        clocks = <&k3_clks 187 0>;
+        clock-names = "core";
+        interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+        power-domains = <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 8297b9198612..5b2018ff3e0f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10260,6 +10260,12 @@ IMGTEC IR DECODER DRIVER
 S:	Orphan
 F:	drivers/media/rc/img-ir/
 
+IMGTEC POWERVR DRM DRIVER
+M:	Frank Binns <frank.binns@imgtec.com>
+M:	Donald Robson <donald.robson@imgtec.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/gpu/img,powervr.yaml
+
 IMON SOUNDGRAPH USB IR RECEIVER
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
-- 
2.42.0

