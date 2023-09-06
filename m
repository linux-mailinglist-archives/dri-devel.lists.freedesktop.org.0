Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9138879390C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 11:56:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7073E10E5C8;
	Wed,  6 Sep 2023 09:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BD210E5C8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 09:56:39 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3865NKQQ020237; Wed, 6 Sep 2023 10:56:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=0aB8w7Zc6XjsNnnpxkiGrUBTovCF1W12VnjhwFCc7Gk=; b=VzQ
 S38Og5Wc/JhGiu2/UzpmSc3iAUY4hW9Ed3x1jps78fmRRFF9GZV2zsWTSQSjsYoZ
 Yunumyd6PALcHHmShkzlMuLacn3MecScMSSll+1nHkaR+XQlRolOHO8Bn35qvnj3
 uEzoqJFwUdbskSx9n9M3iwRUdSG65TKRJUZk3pO4l2xpFP7nMmImfW5GzUxewUx5
 ekUuy8Y5CDMbWfEfoPqzhqs8bxlqc4k3BIXJa9THULKY8cOGDlusbxq8aYcNenVO
 glR+yO7mxKBcyvViqnwjX3+Lpd0S/TvRhQXNq2u4hwp9g8SU8dFQ4YZamjgsESzY
 eIrSggc9pCToV1dOhCw==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3suwpqu25x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 06 Sep 2023 10:56:05 +0100 (BST)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 6 Sep 2023 10:56:04 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.55) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31 via Frontend
 Transport; Wed, 6 Sep 2023 10:56:04 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvZkJgnrqEgeTSF/jCj4KLwoCnurhGpjTsXb9Ow/QEb6kqnF6Pr6BqriTQPdVZey123aKjekeJJLgY+4jhP94oMPl9gGVB4MJht4R8/Zlq8pFMKmLg9bNJT31aQLGgHhQNuDbMqQnihn9Hbmh/Q0Q3OwZFUm1kN/O/dgLinLtLjT4KqDT1Snj0VuSUhszc9MMtsuwH9bTw87gcoQv6SV45gamw/mBlk/5Koq6jZTZ2Nk85/T6U3O9Mu6jkwOERhxHaY/NQwgpkLV7UH4VRZg0bVd8f2v71wWaDvl+pnh86N7Go+CaZrY2EGYEFGbzvP7GS+xl6rDH8KqIKk4gez7PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0aB8w7Zc6XjsNnnpxkiGrUBTovCF1W12VnjhwFCc7Gk=;
 b=mP1ZjxVa3XJlBoZ7wrj44aK4kgI+DbsD3nvII37AO+ULTZLY2UNgcttGFbLnmTK3XEdM5s+jEt4De7ylQPr9DluH3UE3qGRzUsYn5RvATe0n7CDRfkzMhvjBkLMaqo9z7paDhxjZxi7LU8RWzHnWDYaRlwCqb01ctasZlfyiIrLnAirHfVUZk9ZsoDpihqlw7QgHoPvRvahJMq2bzUyY2P8W8tr147vY3O5rpIjUCqzRDuOnelXeLUeyuF/Ir4f2hMGTEmM1PC8WXSULfVPFsZkVpGQvu+JQfh0WU+cnxCSY46nVZ0uQLMmY5mfNCUe5BgRq47Eqiqexken+EmY0Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aB8w7Zc6XjsNnnpxkiGrUBTovCF1W12VnjhwFCc7Gk=;
 b=Qp5RCOOWN3EeXtYQSe3V8nF+pi9R+V7fmd6a9UaXXIfjEoFfT5dGv7IqsaxYb/7DarbtxowDCCqbBxlA8GvOZbFEnSCldEyQCxOLQIXPWcyVaMCtpCggDZS8sc4Z/Nw0Ta7XlnH77eMdYPX1wj3z2TmLvOYQnYZO53KzVQ9RWp4=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LO2P265MB4992.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:22f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 09:56:03 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b3c:3f6:e3d0:a81b]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b3c:3f6:e3d0:a81b%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 09:56:03 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 03/20] dt-bindings: gpu: Add Imagination Technologies
 PowerVR/IMG GPU
Date: Wed,  6 Sep 2023 10:55:25 +0100
Message-Id: <20230906095542.3280699-4-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230906095542.3280699-1-sarah.walker@imgtec.com>
References: <20230906095542.3280699-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0279.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::18) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LO2P265MB4992:EE_
X-MS-Office365-Filtering-Correlation-Id: f07ea807-1bb1-4887-acf2-08dbaebf7b14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W4n1AM+rVm4ZuBD8X7McDiEf6rDJn2N5pzdlGx6AgVaPhFbR3SFD/0mWEUZY4k+Guyhk47QGke+2b5zFyEwQErFY+L5kmSpvWIaz1w1NJyBr5/eIEs6bnIj/5jRwSIW7lqnv3C6vHwRzSuduIKJRaGWdb+O8qKnMl1oN4Es7+/7l5EwyJ1qMf13SRFPyaCL08QglajbGJwgvJfUX9lTzU8YctgdybVqItgyENnHQEEYrSYXXLOwTjTBL0Wme6VPr1VzBHE4Fm5tepH5wM0cHqlrsStMOqvdhO0DdIwFmzML1gnA5tmWjAFgYmLLSefWwL4fpCjn78TrBaFka0NBCM+tX/jmAtzP2oBRovtI6da/NlzZlsjE/FpyP26Y7nfa+tnnTeUMHG4HgZllkUoLIGg8TpesuK+RjUdQnUpDRtJTJuLF2r/EaQbo0m3zKXQBfFQDCZJgqiGG/FWcty3JfhTr2f+DMcesgOLie26xaQdrcjyBWiFbTt6gSXKh7GyA3O2mbiBokxL41nQLTm+Qg6+idIERcI50bXgcoRIU1md9xtPUFZehwidCUGLRL6WQ2GlBmDhwD/KxNPwDVnnD/nB7423OX/o7ufFgsisMlqVY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(39850400004)(376002)(136003)(1800799009)(451199024)(186009)(8676002)(44832011)(8936002)(6506007)(5660300002)(6486002)(4326008)(6666004)(7416002)(66476007)(316002)(66556008)(66946007)(6916009)(41300700001)(478600001)(966005)(52116002)(6512007)(2906002)(26005)(1076003)(2616005)(83380400001)(38100700002)(38350700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eHanndjqHUWCN/g76vBFTZ2mEII4/Y+5a7DsejGzjmFVEGR4IBFhwup17u6I?=
 =?us-ascii?Q?ZNGHTUJ+wsxYtswSNIusZufsZi99XHF0Vc0+kivXCUBjVEk2IaYyzveR3Pl9?=
 =?us-ascii?Q?dNFXAQymbQVGfFbJ/j03dlPHqmYaVG+37h32H7ztjR2BwLI3C8o8gd64QBqj?=
 =?us-ascii?Q?F49NY+RIALJtQPSdN4/mfp2FBZrpG2XxZdsythLsydNMLGSRz8fV53PBoouR?=
 =?us-ascii?Q?m5HQcuyEQ0V8rDShvdYLTZAFBerC2Ud86O3mah2EytWJ/AE2P9aVdsuf+/jw?=
 =?us-ascii?Q?VKwDbXFe+X0xHrw2v93FTrQBHIU0Fd6H0lqctdoQQFtITjtjDUxUm7x5WaWx?=
 =?us-ascii?Q?5y+U8+pVurQVKZb/Ee9YZ8Ldk17utD4lQvm/7/wOwatZWyIMbeUCMvHES40m?=
 =?us-ascii?Q?ILD9YH1b9oZPWui3Oe6YQ9guA6DKFNcaggUTRooQthKMQAnxAh+c14WgOa8f?=
 =?us-ascii?Q?Wvbed0LfkMFuAa5sqWk91cCsz97YRVH7F3yXOq582fPl1iIkhfX7udr9gNBU?=
 =?us-ascii?Q?rZintgjoMUO0HS4DIjd9tFqIs70eGQGlq4YaDuRnKSvLF94w2utEghPSRifa?=
 =?us-ascii?Q?z6XuWRDj5U4d78OD8fGHBn17A/GxIOYqgKdV5DgqK8eEt06JqyrdZ/2AE7n4?=
 =?us-ascii?Q?T+KkPh7uiWjP4GklE7gW8ZuxcPG6JnSeWR6SSa09ncx7XWuf1xy7ZqZ40HmK?=
 =?us-ascii?Q?DpPIU+6OCJuZ/q4G+rvr62nZsh9S/ZzAEeBCtUG1R+BSXN4yRt0R+LBn5POa?=
 =?us-ascii?Q?XlIUlfg2r7bBPv9f85qHICiAQnTxpg6nltdC9Xgt4K2prg/oWSEn4Uo9g7Jl?=
 =?us-ascii?Q?JCWHA8tKDmieJpNsNSuluPQ3Pg6VkXqCPaXc79Vt1v73zY6O9hJ0VbgJnX9M?=
 =?us-ascii?Q?AHRfUHrPA4ZYWsQt/YxGNp3tvUGDuQF5kcjC2uxtEpJC99wPE/6h3NJAOTZe?=
 =?us-ascii?Q?fhF5MJdck6QMj2QMKAPTtlC0/Sapx7oqmdYheOjUzz0XXLTbmoDftIvsJZfX?=
 =?us-ascii?Q?TTWrYquPBSVrMvxTaG7Vqbeu8RlEsUA/JNjcYy7yiSLeY0VZcmGocoOgirNr?=
 =?us-ascii?Q?KDIYam8dfLBLAVqriS4KAuSuLdVBo9l+bM0kLpfkc9xiq9KcLwcPS8oObWu3?=
 =?us-ascii?Q?H68hWZnvDUTlWado6ERZ3cqnApcXM0lN5WMP2mrpUsiFWZj1UcDNF/xZVhFK?=
 =?us-ascii?Q?IBfkT04HQb80MyFKgYBIAUWmx8BmjtJhtKDQ3RRAJgSnIUkyAcQfXlCOXIFO?=
 =?us-ascii?Q?v7YE3D/NcRoXLHU2aRimxHVrEU4zUzVL9cojWmXxsJ+1mXuFZFxXOra8wL9K?=
 =?us-ascii?Q?2UoIBYDPprdfe/FrXWExMwTkC/WB0+hdqy0QLQa6hemKPeBZDWsxFIg0EEH9?=
 =?us-ascii?Q?4zKxMqXwgNi+5cN0T73hCV+I4HFVdQZH5voHLgBjwEj3UW8U7BfRGBGzwy+b?=
 =?us-ascii?Q?HIfrYGTZ1X5qTDA26HiztU1go/xWaLxwUaBibF31FO6/r5hWWXHMCebP3SSK?=
 =?us-ascii?Q?zgb6yd4EeqMufUZPlb9eQc2YDTekdIkptJKjAD9mPwQvA2vtRS0kM0ivo3nD?=
 =?us-ascii?Q?405FsU0d6t8Rgrrm/dX1Nd+E0W7LTMnwRmK2KP69EDWNNREX0pl4I6GohOLQ?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f07ea807-1bb1-4887-acf2-08dbaebf7b14
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 09:56:03.3176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/T3MHNgeOk0rQG+YnEVYsXfeAbQKsn7Q9uxwbfbV3a38t3J2crzpRrHRSGw54vCaGQdAQObjLo3ZmZlA8gboQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB4992
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: VOLTTLWQ0sAh9oLJdy6aDZn54GVLDynk
X-Proofpoint-GUID: VOLTTLWQ0sAh9oLJdy6aDZn54GVLDynk
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
 krzysztof.kozlowski+dt@linaro.org, matthew.brost@intel.com, corbet@lwn.net,
 luben.tuikov@amd.com, dakr@redhat.com, donald.robson@imgtec.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, mripard@kernel.org,
 matt.coster@imgtec.com, robh+dt@kernel.org, faith.ekstrand@collabora.com,
 linux-kernel@vger.kernel.org, afd@ti.com, boris.brezillon@collabora.com,
 tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the device tree binding documentation for the IMG AXE GPU used in
TI AM62 SoCs.

Co-developed-by: Frank Binns <frank.binns@imgtec.com>
Signed-off-by: Frank Binns <frank.binns@imgtec.com>
Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
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
 MAINTAINERS                                   |  7 ++
 2 files changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr.yaml

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr.yaml b/Documentation/devicetree/bindings/gpu/img,powervr.yaml
new file mode 100644
index 000000000000..51ee0f3d6e48
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
+  - Sarah Walker <sarah.walker@imgtec.com>
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
+    gpu: gpu@fd00000 {
+        compatible = "ti,am62-gpu", "img,img-axe";
+        reg = <0x0fd00000 0x20000>;
+        clocks = <&k3_clks 187 0>;
+        clock-names = "core";
+        interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+        power-domains = <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 231a5e6fd52e..c057daebbfc1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10140,6 +10140,13 @@ IMGTEC IR DECODER DRIVER
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
2.42.0

