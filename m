Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBF777DC20
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 10:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41C210E29A;
	Wed, 16 Aug 2023 08:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7412410E2A4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 08:26:34 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37G5e2k3025650; Wed, 16 Aug 2023 09:26:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=m6CKlzn0ZuZnil/cYcqAAgs6UXBHDnhvNUqeqmhjsKM=; b=HD8
 zKngzfjAQMPxt0Z8cpKgPXBs7VOs4++mevOVsMSQ1NIzFdzGhY5UxeMouqWCp+rt
 7PnA1p3r7hTtsWnjcxarV4S5amzfNn+Z6eNiaiN36bARL8KHpFfXSyMPKKiAMLwj
 rhN1kbi6/TCHqIUsLlna0lEdFTx+dqD26ceRJwDFsgZKVcZU3vGI99zhXQ+rOusy
 P+7h82FHN7zJPVV7CiUxvzNyYbbJZ16/g3NIw5gr7qSu+tCr5vbl5VfJoRXKLknm
 4JrFFYdtgllwtx/4DClmPdTkNr6aHaQlHJtYmAvnkvk6lQCrwB7KMmYCxQBiu1xF
 du4TyhsJRFGhSdgcIrw==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3se0brawmb-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 16 Aug 2023 09:26:19 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 09:26:19 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.55) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 09:26:18 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SsQxQucGMfZHfJ7kb0mXvFDWk8jbNZ/uUCr6NQ4SSRTFcEZ+m1nKOrW1BQHR56NBvkHNakJwIugQiw2mqeZtNVAZGv9KI27iccBiAZtP6JugSjdlSfonasxpZCy/hIQm3PpGpl9uHlVnLBbTpzhQpyPI7yMbFLY23GWe0YbHWvv+NaAVfr5BjEDYZTfuQx4KOEIeA1HHYc7++sYpN1cIM9U02f+T3mjtIMLt6sdV2EIA4uaSmKpzyaWPgM5V1eLQCFLNWobfycLt2EYxGxEVIhgTWstPfdvkPf/6HlGuQ5F+8H3RgaZpY6Kk/Gb8S0L/ITyiRBFyEUo80nFxlQ5HRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6CKlzn0ZuZnil/cYcqAAgs6UXBHDnhvNUqeqmhjsKM=;
 b=XPP7FIpbGGcm6/68ikAA3GuO8t2z6nw317sd7COwjUpDV+xj2ksY5nmiV6FwEOgXL5fBIs2teBBkkQuPyyqVDOEcAo7trDOciNi2TCjTIkWIe6gkMnaUMZB5kx/N/l66HFG/+xR8TW9Y5Y4rUiOYjXaGBjUVXJ8W+iKsGZLNvtKVkKHhw0Skki3V266h1YhkzEhURjIv8RK1UjLh62ycJ8Zy504rUsPIYRIY2G+c2xQG88jf3jnkfduBfe7KbXUBcEmI+K8KXT75nB2v0gmytUQYS8R3g3WfDIn7py7SRk5t5chYK3hdp35txHzf0+zbTEQPKReG5ahsd2geKfyXrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6CKlzn0ZuZnil/cYcqAAgs6UXBHDnhvNUqeqmhjsKM=;
 b=cOpOhVuwpr961gYiwdkPFcOp0CzPaDZ+xzv5IyguxrRS2xkHGvvdAE3XQAm8GfdGnMQkwWw2rYNLHCqfoMYmRNmYXvhN/8slb+uqmtZe4BBEE9/NN0vGDgsRQp43cy31bMQyoUMOI+V42hM6uUd6BMyRmH7K+Qz7CN45RYLvdEw=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LNXP265MB2491.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:130::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 08:26:17 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ee4f:2d71:fe8a:ffdf%7]) with mapi id 15.20.6678.022; Wed, 16 Aug 2023
 08:26:17 +0000
From: Sarah Walker <sarah.walker@imgtec.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 02/17] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Date: Wed, 16 Aug 2023 09:25:17 +0100
Message-Id: <20230816082531.164695-3-sarah.walker@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230816082531.164695-1-sarah.walker@imgtec.com>
References: <20230816082531.164695-1-sarah.walker@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0023.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::10) To CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:170::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB4817:EE_|LNXP265MB2491:EE_
X-MS-Office365-Filtering-Correlation-Id: 9795e3d6-b921-4bb2-ab85-08db9e32766f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: um04gPC91D01OLTnBShC8Ovq0+E7pY/hSE5e1sb1SuEchcJgt33Iz7V+0X5Fduvk5DhM2iw6yiNOI9Ay1n4iJ1isIcjq9obIyuPMyfz4pzrFk5lUhrC6+pAW2tM8JZSjBA0+vh2c9VRvjMEIjrQVMh4iwF0hMfXmAQ6iJO3jWCkq18Eu4PZ0SsLJ5rE8PO3WnGTK7KfZN12+0N7RAPcOCPrcwSDse/DBdt81SFKN8Y2c0fS0NZ91dATSMNHFxZh2+DnRfdMacGBjvQnGFgvsNW2q53KimfSDsOrWDCkVavEyV/TTmkU3aW5Dmr8a26V2fFSzMRi74l/NhlURON2v3JRuBm3rVuG6sRGKws5+B2EYfUdjyhOIZLAcP0KC83z4kyG3f7i6wksyOHCA+llyT+N4qbFS7S79q3O9dbQqHN34i0Y3p4ljvvFREVEOAEeRWekFNQSucIBwSC6pIFEjxAPEDA0IFxwMJCjaDfiBYXWuHCRVBW27hKmuJz3unxz2/rJhha4dSxWWUI6C+Fmhs/RQT0oYqdVTQ9IX1uSCMCa+IstP3kMTLJvA4xe2RMNSWT3I6pIjriA3ure1bqsUu0nQ1ra7V2umcHlrC9AFo7I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(39850400004)(346002)(136003)(1800799009)(451199024)(186009)(66476007)(66556008)(66946007)(6512007)(6486002)(6506007)(2906002)(478600001)(966005)(1076003)(26005)(6916009)(7416002)(5660300002)(2616005)(83380400001)(41300700001)(316002)(44832011)(52116002)(8936002)(4326008)(8676002)(38350700002)(38100700002)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ujp1mhaqQLv03tFiogCaPbSY5+oLzX0J6RKRjXLHBbdIa9ByEoP7r2FKxxCk?=
 =?us-ascii?Q?mMC58/hqYeXpH8XPxTH1xUWjtZ7b/vLv61WQaUCDqKB1E1FlXNnYI6m0knpb?=
 =?us-ascii?Q?ST5Wssh/L6OUTjoNv7YAFuKjxUx6TC282JczOLpjhXIroiXcoMoYDAQnky+f?=
 =?us-ascii?Q?6Yd8E5f/yXl52E3HbrkL6sVOxhCFgb0v0xatEtjIxm6479VW7hjMZIwRR0pM?=
 =?us-ascii?Q?NDI6v4a4UTaja/ZkAj/nggEVJ1cx/ybPJA4OxBBU2dbwMBMelWZIHLEPolbO?=
 =?us-ascii?Q?t+c7f0lfiRUfKFuWpwfsHlNt/tsiIDd3QOF+j7+zukgOMAbzF/a5Fobi7IUK?=
 =?us-ascii?Q?Tu2kJOK5TBfJsUfM9mlvEVBOmZQRXA2gG0P0s/ebp4HvNgvGjxFFz1lg7io3?=
 =?us-ascii?Q?kkWYWhuKWwOVmsrse81tnCHzy4BaCFH1CayL6y4CagJP3TsjX9vHX6gbguGX?=
 =?us-ascii?Q?i2cRTPTXh2sNYMdqUPNT36FBEGiugvh690pzIhJnqTHGdVs0RonKn2kwqQ0r?=
 =?us-ascii?Q?0XMgha2HU2iQ17Ny1tkLKP675ZS//ABPTZ0ACwf90Qod2BFRH2kb2AKxRQAn?=
 =?us-ascii?Q?GBhkfvNHnmBeAxUCeYx0tewHSmvzr5hjpwJdF0gJDAd6JlQ+Cs1GJQWGpqun?=
 =?us-ascii?Q?021LMGNpyKZcYoeRNWlJYgv+QZ/LMjIfBEqyDK3dbEOSItG3Bk42lKP/4qzN?=
 =?us-ascii?Q?JQaiAOLafBNaSCpbBrb5H9M3gQNkins5w/fy/4PZ/ya54c0Fvd8vmN1wJrzA?=
 =?us-ascii?Q?QtebKisPGK6QybHTbus0/E3T0C9IUJdYWlSl44QbTQE8bh5icFEPEKmK7fyk?=
 =?us-ascii?Q?8itTjrmbk+cK6KzIQ69O0gRA/8LWQSyACRoyBxhPq/xqe+8jIapP/jCEg93L?=
 =?us-ascii?Q?coK/Cq0HIdiToBgvPirnqOWI7X8VD0dkpzpIcPgkTXrdbAsDtJvX2Bu8qQNG?=
 =?us-ascii?Q?mXCChGlZ6Zoe4e4gwT1u8PLMiSLS0zXxbV8QJFCbKqoKLdqUCmj45btwnueP?=
 =?us-ascii?Q?Yh6fFicHQNz4BSHADDXTvbWDY/1pN4gbnPcEQ1DEszsvi2tRXSX9oyqQHDvK?=
 =?us-ascii?Q?kPVJ/WGXfCvLnkb9UaJFCIISRakMmc69BDZEuQc48lwAV5QFoGESIgM6Ahjf?=
 =?us-ascii?Q?qXWRZXa/Ye97ZgGC/zcVBXN4u3hcj40ehQSAYRxcvKPvtXLWVYqhXU6OYsPJ?=
 =?us-ascii?Q?oXs5pOZVwBAR/SzP40cRBVLLkDVZXn5qFxcVE/u0m9nIB5nQhlj7i/aLYyDt?=
 =?us-ascii?Q?pkRbJkYq7WG5RW6I0unxT/c+WxFYl0e9ergD1V2CsAcY9wqg5XFn9/7DTGeX?=
 =?us-ascii?Q?udGxZwhLFxJ/dClS8QF7/SeyWHIfTLbHYAD4udzYOzKzRCabUeKMeIXdG0ia?=
 =?us-ascii?Q?vD+gbo/7JKQPV/mp/0Bckmq1p9RxWfz0yqeDfi1hvydOvKQ4YSJ/EFGeUeR2?=
 =?us-ascii?Q?3RaNuHimM3tkBHrH43xOw8k3oLZZ5+0u110ha2xB8rsEzkc3t2NCnK9+afM8?=
 =?us-ascii?Q?b5+ryqjPo3HMVkvODqbaz9dL4Onwb9payAmABbUjiXO0D8opDiASrTBSFKVr?=
 =?us-ascii?Q?YtpvF5/kPz/dA5Qlhq09YHAEZCU3qK0q/woLoM6lUzj19QsKUD1Bbx7VfHKN?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9795e3d6-b921-4bb2-ab85-08db9e32766f
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 08:26:17.7020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yxcq2MQBjoyDWqLEf9J9s4OlAGQzP22m6eC/ZWjHMK4hjWAUOpEGDyhJqvM0UI+sJOglny1ioo0toAARAhxufQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2491
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: UY5bicqNVUoNbgo6GN2BZSkbFlDoIGx9
X-Proofpoint-GUID: UY5bicqNVUoNbgo6GN2BZSkbFlDoIGx9
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org, mripard@kernel.org, afd@ti.com,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 hns@goldelico.com, christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the device tree binding documentation for the Series AXE GPU used in
TI AM62 SoCs.

Co-developed-by: Frank Binns <frank.binns@imgtec.com>
Signed-off-by: Frank Binns <frank.binns@imgtec.com>
Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
---
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

 .../devicetree/bindings/gpu/img,powervr.yaml  | 75 +++++++++++++++++++
 MAINTAINERS                                   |  7 ++
 2 files changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr.yaml

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr.yaml b/Documentation/devicetree/bindings/gpu/img,powervr.yaml
new file mode 100644
index 000000000000..40ade5ceef6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/img,powervr.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2023 Imagination Technologies Ltd.
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
+    items:
+      - enum:
+          - ti,am62-gpu
+      - const: img,powervr-seriesaxe
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
+        clock-names:
+          const: core
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+    gpu: gpu@fd00000 {
+        compatible = "ti,am62-gpu", "img,powervr-seriesaxe";
+        reg = <0x0fd00000 0x20000>;
+        clocks = <&k3_clks 187 0>;
+        clock-names = "core";
+        interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+        power-domains = <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index cd882b87a3c6..f84390bb6cfe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10138,6 +10138,13 @@ IMGTEC IR DECODER DRIVER
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
2.41.0

