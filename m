Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0441AC6303
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 09:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1278710E0C7;
	Wed, 28 May 2025 07:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rzMg1nSh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010006.outbound.protection.outlook.com [52.101.228.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D027E10E0C7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 07:31:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNmAyFUm0JHrxcxRiRjzsMwsI1+nE2STnMFVbWvvvggTRhZoxuJjzXohZw38OG2X51BLKGUigcO951h9Oc7AmM+sPkTfEj+HoPAIJOvbe4na2pDr4lpFrkifemkR6YLEgZln/m7cvaEZbCmZl44jJcU4qzTtsWganIM0jsB5o+bAJKC64q29B+mq8gCqgcFBg2dx7K19oiDcqVxQynzNFrOJcsZewEldNEZLVLw2xVrlx5/gtoMG6G7fn8IQtBrajxXPEwfJtUG+xaqPdvWP/p2+9S3LYB+QqmqKqpkCbkNuG3LxBZisgTGRWJi3l1fDuwiLVl+a4Huhy6/F+zjWOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zighSZvWEtRa/8Hf/Euy454XiEtxf2VUKLM6MTdxRc=;
 b=vA6bgSQPvBzCPH7v/4Cm3BiWKFdMchycA+ioDi2NO7GNOCxVdSK3lB1NRjDpU5/GU+z890dIZTZqY3XQFMCWoqn9aSnmdWObgZzi2lRFz4guY0Tyhbvm6elI61VMVzihz4APjN4aHbJNM3ztj2KJIJZ0PYgHXPGJ9LcDxF+B2+zgLWt7urCLWYfTAa0w1kidkbMjsNsKq+gWwTz1Ygui3ICRwKW3X0JGeTdvPJpOxTbonquO0oAwUVWUAAK5XVG/DsvbMtAswDy3YmD8Wnudkd3KChmO0trYwOrkWkg4rFDl0JYgEU0f4faqAHkrIsQ/cUqLWkszPY6tFl0ZpKRYhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zighSZvWEtRa/8Hf/Euy454XiEtxf2VUKLM6MTdxRc=;
 b=rzMg1nShz6MreuDLB4UAookjxrw+82+MiccaMWjr2S5sNUBK9zlKqp3x1kcXAhzZI8+1vKUqC2toFSCdYtTWfpE0PZr21d5ufwXfSj/f2V/1xujY43oPIXgj5Ms0CxK33ktPMoNZqRwMlYXNl5Voj0SHC6qot84+N85FRLMIEQo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TY1PR01MB10626.jpnprd01.prod.outlook.com (2603:1096:400:325::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 28 May
 2025 07:31:05 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 07:31:05 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] dt-bindings: gpu: mali-bifrost: Add compatible for
 RZ/G3E SoC
Date: Wed, 28 May 2025 09:30:40 +0200
Message-ID: <20250528073040.904033-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0210.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::14) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TY1PR01MB10626:EE_
X-MS-Office365-Filtering-Correlation-Id: a0776d37-aaac-4ead-87cf-08dd9db99af1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?finU/OuGHSQqv8gc/izeZl/BPaw4g2oHrmJRduKKagjZKhUSXPHD1c/kU5Yx?=
 =?us-ascii?Q?a0oQ44b4W8rePes9jhNJ4rEr46K1aLjJX8xvFY3uyFiWbfWPwv8wHGPmbAtz?=
 =?us-ascii?Q?3GbpJhchWjrQcnPcDFF51cIQCjSkL89JZRas5yoKD3AedJ0p09GJUzpJ07j/?=
 =?us-ascii?Q?ZqI+qzjVWHj496PQIK/f/ZTwVTfid8V2aybjDUkEGtwcZ9KW4Yr0fSkLLz5J?=
 =?us-ascii?Q?gvZ3yRsRu5Qx3VmOTxOzAm65vg/7RJ9fYouHfTDDd9jIVCbTrskHbaZICJKV?=
 =?us-ascii?Q?QFAGcS665AnIvm49YmTZw0TlN9nrUhFkXxyEbmaRKFmbUbcQTXm/IiuECTem?=
 =?us-ascii?Q?gjWCyQtuLd7E4CMCrMG1IQ7ux/g6Sfz15YGihhr1QeunChWWIMgZweH3qGeN?=
 =?us-ascii?Q?QyOuZ060MKfTNlJ5HprRWrp30sU5xwg7THUkhqVWN4LqH3/PVtEkLVVUIrQT?=
 =?us-ascii?Q?N+rYc2Hs+uwS7spB/rxOryQIvu7NlahbzgeIopyppOY8aKz22l0q0YxJFd0L?=
 =?us-ascii?Q?c8gac0ER5WWJOq75je36zVlNLjE2XesitnwTlAtu6upEan/L4H6/b8B5Ez2c?=
 =?us-ascii?Q?h1gvx6PWHovX75mvWWUPylZsG9yrP6V5bEeAfB06hIGCCvXzI/H6faqB2nbU?=
 =?us-ascii?Q?GO2Bw4PbnFe2+XjS0Lo0ht4LKDN623xJ18aKSgHHjJpO+cahtnXWdl/hxpIF?=
 =?us-ascii?Q?iTyBi2L48vNxefpN8rk2vo0OgM532vq8/Rpm2KhoV28dHhQEeOcqoMfgo1K3?=
 =?us-ascii?Q?7lbdIdEP5GZNIS+vyTjWqnp2L/hX6LPjvgcLEJ3Pg7KfdQ0c+naQqrY86M0U?=
 =?us-ascii?Q?d504EsRblIbNHbgjbzlCcBCb4pCQ9aw0WGkRzA5ZYAu5bVTd6gZG4q9TTrDy?=
 =?us-ascii?Q?At5fwo7gsBTjW8I9ZRbzdJIJme2Hoy6zAmfy2Q+n81Hj/aMCygwTNOuRNYKn?=
 =?us-ascii?Q?yQ//frsdd6+e4YIkdIms2r/+UPihpcVXmTk9w7RKHchbf/NnoCk7a/xMQL7w?=
 =?us-ascii?Q?exYu8LZOMNq601S/kVzHbitV/7T9N6gG7m0P4p1uotKEUxYM71Q3ovHUp7Td?=
 =?us-ascii?Q?vUvUxqUFFvs/7dEr4Pm7FqSG5Sx1+xm0Wj9rCyXYYCDYfi11RxdlHrHTqFQ+?=
 =?us-ascii?Q?13/SnUmvOUM3mye4nqLkvkVQHX4U42GIdb2QyNzYaziK1DQk03/x1Scmv640?=
 =?us-ascii?Q?aLXi2sJgnhnFlUAoPZnd2GMV+SphMtq6O6fdaMrM1FMfpPIxZMBq1KsyYFKo?=
 =?us-ascii?Q?fn5exlPiVQnFmuYOgeNldEfg1Q9DMUi0+NJhxDliWkpGEBdyloEvvP4/zq3J?=
 =?us-ascii?Q?so3CrafnqNMhHaqm5kZehB26E9OQCFe+KLdW287Y7c8wtEmEc0svnQSjEos9?=
 =?us-ascii?Q?lAv0jNdXv8XxJLHSgVRdeRMUtUphtH7b5G2aivNbpjmEX11wu6aucMIE6szf?=
 =?us-ascii?Q?1ycpK7JBQIa1yikLL0u0wIApMhr+gMY/nYi4EQpC0vn7QV6ML95HZg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS9PR01MB13950.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HxDmMJnG35Y7x88viA0cNWLjiuQMCns7N/tUtPc/8VK8bKNwPL0d/uT+FgTV?=
 =?us-ascii?Q?vlWQFsJw1bYAvSO0KsHGUTquBTMN6QIAtIuDli9wxmYxMKEulCQJXoF9df0H?=
 =?us-ascii?Q?n4L/IZ2PGPY8rHYnT+ssLqVl7QHJJ2ViBsGBzfHd8LFwfMC0PJ+Drwn0yaGI?=
 =?us-ascii?Q?Q9NqOm1Wy5pQ3gkI9hfvwjmemJEvO6HhKFMqt6OtbFOxuhHZ79qpZvTLZJPj?=
 =?us-ascii?Q?/L0JGX/KyrfHq4aHdh2HYMT6XRREjWv3eCxnH1D8mUEFXaYZBTKf53woG2BC?=
 =?us-ascii?Q?O1TaIR6MYLP6Bv2lnbwK3CI4/qS1BMGI6X5FVThJAXAF96EXEpMRvJcpaF9H?=
 =?us-ascii?Q?XWdEJRioLHuw5usWmHobcI6DZ1zpLfGED6iHaQhPdRUNggNOPhy3i6OQiM4e?=
 =?us-ascii?Q?C/3CcvgdTCxcMorvksyZg3l2z9qNS4bUhwN5nwdbIG17iULKoU3ib2iZkByW?=
 =?us-ascii?Q?66i6lNjJLOfhqjWiMK1tuug/w9NpfBhqKBziVOiyogXDoF7VX/7DGUHQx25Z?=
 =?us-ascii?Q?x4tZz/657fMdvMpfNlXxiPJmQsjYbrDe1gPunu9RyQESxGSc5vX4AUD8cCrI?=
 =?us-ascii?Q?HZ1dW6LxVyGyzEAUIhFPQUMlmxMl4YcKAi+Wh5gLsD0P5ERTuzUimbKg1475?=
 =?us-ascii?Q?arBEHBIZ/tf+NPbxXTqqOALhauzJfPA44bcxNhpxJReZy0FJEv0Og5qTYiCQ?=
 =?us-ascii?Q?99lBeuZk+v+WMs2XW6hm5t3nUP1FO5Cf1cVmRFikEyu26KfsJCD7jgIgj1x/?=
 =?us-ascii?Q?1fMG/6Lfwe4pRJkPQWEA/6bz+unu2rRsqtcGI9NCtdiw7uOzDrouYfnzEZCS?=
 =?us-ascii?Q?QnSOxeK93+ykz96hggfbLtwldFJtLN6TKeRWBsSeTj7yRWIi8TJhp/ftgvZ/?=
 =?us-ascii?Q?I1z54IulS4BFFvgvFcAzwwn8LsEiZu4BS1WL11pfMbaIP4x6L7/jr6F8N6au?=
 =?us-ascii?Q?7VB1xTAonya0jRWzz05yCi0pZCCnm4PasDZ7OPCD+hWAdSlBGSpVekL9V1bD?=
 =?us-ascii?Q?rk/G5WbRxc3oyOTr8aAyaFUiUiHwgVEjP/tWUb6xhx53G5ulySpxJBM/S3rQ?=
 =?us-ascii?Q?PL2fnEoDW31wB/cvHzzXCW0f/om5tJgmALzwq/32D0I7ACDDwESDDZrBuCIu?=
 =?us-ascii?Q?V3yJBakuWM1PAklclLKA4EMlYPcstTjZUhT3sT1Hgg2W9HBvGJ6nGsPYsu+L?=
 =?us-ascii?Q?pVe4Im+wFsy5emCy1kK8zdZ7+XnsBH4SEIk6TxqwhL2HTZ3NZdb8raKBwXnt?=
 =?us-ascii?Q?9cA6lK9TMsDupUQbB/58fsi6TsWYz15bh3rvCNVM6V1xfRceXKbR7kimLf1S?=
 =?us-ascii?Q?2WGLMwIhoIg3Br+hxO4CW/g66j8i6Px9IbP2os4qx3uxJzXB4La8SYPVXtZI?=
 =?us-ascii?Q?v/fYT7R8aewdLgdMllsNt19fmIvhvnnwj96VWi/4nRyYmytApg0WP29sj84Q?=
 =?us-ascii?Q?VyzIf04AOgjFrjDLlAhOme2TUVEY16MEe1SJKGuZB0GbEF3CDjvTzzPW/B04?=
 =?us-ascii?Q?XDB1P6OQhMa4bShcqVgQsLyxQ6fOGyKCTKDeBcHrT7ioFDGVI+nlH3DsOVgm?=
 =?us-ascii?Q?AWrjHZ/D+3IgU/zZ84rneGs+y4xK46xuzstI4cgUmc0plbVEtzTJCSKdl8wj?=
 =?us-ascii?Q?/v7fxRqpUmVBHmYQwcBPRcE=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0776d37-aaac-4ead-87cf-08dd9db99af1
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 07:31:05.1771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4tlfFZTJuwLN0FU0Ij7Al/45t/2/jfGu6FIJ8ogZekQV0ck21oSRjCZDVL/0RdHr58J67RdGImOXwpY7R/tzsv1vtv0cdreXJ9VLt//okS9Tw7CSaebJ/azdaQgMyWfL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10626
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

Add a compatible string for the Renesas RZ/G3E SoC variants that
include a Mali-G52 GPU. These variants share the same restrictions on
interrupts, clocks, and power domains as the RZ/G2L SoC, so extend
the existing schema validation accordingly.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 3297ed160ebc..b8d659d272d0 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -25,6 +25,7 @@ properties:
               - realtek,rtd1619-mali
               - renesas,r9a07g044-mali
               - renesas,r9a07g054-mali
+              - renesas,r9a09g047-mali
               - renesas,r9a09g056-mali
               - renesas,r9a09g057-mali
               - rockchip,px30-mali
@@ -146,6 +147,7 @@ allOf:
             enum:
               - renesas,r9a07g044-mali
               - renesas,r9a07g054-mali
+              - renesas,r9a09g047-mali
               - renesas,r9a09g056-mali
               - renesas,r9a09g057-mali
     then:
-- 
2.43.0

