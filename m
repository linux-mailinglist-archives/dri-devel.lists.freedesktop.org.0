Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B7050B33A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 10:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E8910E1DF;
	Fri, 22 Apr 2022 08:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2113.outbound.protection.outlook.com [40.107.95.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6C310E1B1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 08:48:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nD1yZl204GnOc/I2WvSmWN9A1BzwInUlKyeV5NCLYqP2xxIRDLoRMO0S+FHxB2rpH6C+jSl+5sjlWqf7BTAZBCYQjY/gQ5oO0o8uaDHzBu5KEWwiUZQTfifssSTLU/fxjNHz381hyUOcesJn7WSTncYpcdIy0x3IzxPptbHu0lpmrDf6gwD//EVOdN0nOeSYQMVPhg7JLXQD22bktfqVWMd3usCihp6gRBdnWbAsNjdXGzXSm53DBTM6dgDk1eugo0wTJ6+YDslTwJqON4hDkozyk2IlvY5cjtr09iUfxiWcxmP0qF8rHZgQqhXRw8PUeWdiRhre37/ezuWhp4IHvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mF7U2yYwsnSeyE88fXr+Du2zot2Z6/lVLuIY1a7BAzo=;
 b=XgpCBOhKa1ps3WtSochcSPnkcVZSq259Qw/WuMXW4is2CrInDraooRf1fPV4OiS29emHY1QlGw/Eoh8CWcGfBfMHSqeGISE3nk5kEXde9UjEWz0r2VY9XYlCZekUgLKw5Sn5JDvFxN8IGIt1Su1x+ypP2MhaUCRDI/sm3zPtgQ6y8s46GAGv6UuARuCwBC8Fkfa/xHa+xKduk6Vy5BGhkBUObfOGwNajlRq9+oZsjwwXxYEJxDeR9cC1kuiDPO15FPYSQIsFVxwfluK5Tn6egS9pISg7KTmfimGIl32iPh+OGuAoZfI5R/NhpDlyIZNBUa4Ht1tbBL687hd4DqkPtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mF7U2yYwsnSeyE88fXr+Du2zot2Z6/lVLuIY1a7BAzo=;
 b=uFdJcG9y5WaC377R+5haNndb2lEazeF4MEEHeJehJ6X9oNosm6IHHEdJav6upG6rOjsGX3B7UjGmT+6Mx9dQw88lYMXKDZ6uPGxToVNecbu6DXjWW3DNnwGNS8Cw1DYQL1frNUpagrrUjyiNA51vm8IPjQnKTdxUYvSqRMOtHLM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4598.namprd04.prod.outlook.com (2603:10b6:a03:55::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 22 Apr
 2022 08:48:50 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::e9ba:4c90:6e9c:39f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::e9ba:4c90:6e9c:39f%4]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 08:48:49 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v2 3/4] dt-bindings:drm/bridge:anx7625: add port@0 property
Date: Fri, 22 Apr 2022 16:47:17 +0800
Message-Id: <20220422084720.959271-3-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422084720.959271-1-xji@analogixsemi.com>
References: <20220422084720.959271-1-xji@analogixsemi.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR0101CA0027.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::13) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db84a3e9-8528-46a8-08db-08da243cebb0
X-MS-TrafficTypeDiagnostic: BYAPR04MB4598:EE_
X-Microsoft-Antispam-PRVS: <BYAPR04MB45982F2C8584F2788232BCC0C7F79@BYAPR04MB4598.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H2wZKF7NHFdhM7tpLF+QzT4mJdTpOwFgo0mER0XUFeCA7BAvKmAhXKTqfxkxi3ik1zgGTFbEUKbKGa//NjieSH8/r+FB33Ne1tYCjyWEXt981HivwamRMFwsO2B0LOSGMsM0tcxii/Ub/c71R9rgP/+2QLSZM2vnS3+BPl19/ZenXdNkJcPgWDICp3P6oA54NMDDTCBDrBRr32Hp58JrQOeJniCyvMxbeEGXDiUVu2NkJBicbwijfoHO8yNCns/l/qW8s8BoMAvnxlnbY7NPAnK+2OdDBbq4yd50P9cJTo6nO8xdfldtffLQyP9giXWbyyLiRB8oy3nWhahPchZOiusyEfG3phiK+8IsXSuFKSmFCDhPBveP+cWZb4N4ocqIjVYgCYxSIFQpdzXGB0Qbg/ZeODRhWmE6pHQb939HboCEbnjnAEwpTSwfPweoXb41Q8FmdEsOOZii0jWU/pMBrM8iY1Ctw0uJsYTznXxDg0w/JTBgOrvRTyxYKi4ChqvfRi9nCq0OhLfqMcClaWvkKHBKq6OVCxTGJcJRs1rNJuVy5mrpm1ex5IlZlU5vl3OgRBvm63IFb1L7aP4aAEdZ8Z03eiDdUWh4apRIvN+67hDOHaqsxdfSc5tiJkIKNsV4F6oH1gdAwrHjGmkaVaH7tTWIUCeljB8CxYrd7PcxllHgG7l9VavnQWytN+KTrtWXoFjDO1+3Qn6615Es23KGdDzndNcRUWEd/qerCwG7kutQr7Mfre2oy7juOK/IMEqyfTjLlJbKUekQoA5IBlcRTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(7049001)(2906002)(8936002)(110136005)(7416002)(5660300002)(38350700002)(921005)(38100700002)(6506007)(55236004)(508600001)(86362001)(52116002)(6486002)(6512007)(6666004)(36756003)(66556008)(66946007)(66476007)(83380400001)(1076003)(26005)(186003)(4326008)(8676002)(2616005)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2RT19GIqdenwHss361DDnRY7YS0C58cVYwsXKkxe/eAeFVxd8TA21/JCWg9H?=
 =?us-ascii?Q?Y1jExDJ5bgYJBkQnltsQogBkVC/5Ug7HyOQsxiQeOS6lSHpu+Awv6zA8oUx4?=
 =?us-ascii?Q?7ZaORFEyJy9UTidwzQrRAOGZp5upKQfEicGLeHt03MC9NmYTY0WOgEBd+K1n?=
 =?us-ascii?Q?C3oUkKQN2do1INyy92pgkw6jFEMqP3VzS47X9CAwpWiImJ85Y0gDOa+3VbUa?=
 =?us-ascii?Q?EiaVfXf8MKGdYP9jGuM+q+Z/r2r9CY+8e+fU4KUMy5+iHFAg+Xpr/oJn+sCv?=
 =?us-ascii?Q?dZ7wn0fxISw+zcCr8Lc2ktQnmhfAx+Yf9GnJ72PD7HXlxc72tO7Ylcs3qvbK?=
 =?us-ascii?Q?k5F0yb2iqA4We0artsSy02sVGcOYyzZE9B4FNUF4lNiyxrBuid+8na1ZI6Kr?=
 =?us-ascii?Q?Cn7UmH5uvC6nUPgnwwTBf6vh7lbilXp17EiCgvxMvErj8FHeBoxLzYUhKNv/?=
 =?us-ascii?Q?BGb2GHV5it3bowJB67jSNBBIa6NvNaAiG60TryqH4rcNOSJpJ7P1JRKCvQ6H?=
 =?us-ascii?Q?mG5LdThqVCdTlUmOyhCdLEUe3n8SrXgbyQ1vhC+CDxq+iJzMVLw6St2tsXa/?=
 =?us-ascii?Q?2YEmaZvPuckLJfrFr1U9ZRcP2etVNibi/Dc89tKR+pb1hfUUAUFW1N/l2P6U?=
 =?us-ascii?Q?D2oJ6xFMxP1qfFTu1tR2juOEfLKf8X85p3TjmHt4ea8OgCvjiBYZp6YEs4a9?=
 =?us-ascii?Q?vnXDXg313etg2LMpYzYpAgr8NEihXG7BSyeQwyg5qTmMKSDFt871pW6UAXvU?=
 =?us-ascii?Q?Dbe7jjhSN0DEWqAlxDa1OzKOVvhSJUEzs8uMj5sLWJYxjytoNh3QxKE4szGt?=
 =?us-ascii?Q?1a5I1fFI0sdKkyBKP7b8mt1IYpGDMxM0jSPvRz+csejFoja+/6n44BbizuV1?=
 =?us-ascii?Q?JXnzqjoeq8m7415MwxkpfECNQU1dTZCV5sAab6U9yz50LCGsLp57v8oyKlQJ?=
 =?us-ascii?Q?quMzhKfB5rZXTILSN0+fguP6loRi1T8HEA7FQdgcmQ65VJfynN8YgWdYF5TP?=
 =?us-ascii?Q?VZ7p3E0tftUHo3uTb1cmvu9vM6Ow1ggyEzTEzcw8XJjJQcp6PUKUJfI2GICM?=
 =?us-ascii?Q?wBn/eWdCQPkCP1zTv4iVVDCR/msWVMDWR7VmtrafGRR3B+EtJGkixv/0Q8bz?=
 =?us-ascii?Q?Fs016OLD1F3iXkNVNj3u3Mtiy/QfBgcxr2s7BJjqqpzo97D3x4WBLdtX3Wf6?=
 =?us-ascii?Q?skcQrkcJSrh6pH52H7scg/hm1zeT/wiE06+hqvH4pQgip3nW0yhXxxvdpLDk?=
 =?us-ascii?Q?6LtgWGErvKCs3mA2AWVN/iEbz3VeYdp2w9nLotT/ASA2C3D1YCpNvpqgmxoj?=
 =?us-ascii?Q?Lk5qUNzUhgw+rcXtn3TEHHhG6+5acZAEB3ETtIcwmeFnz4CzLQ+FOfO8Q+7g?=
 =?us-ascii?Q?LIRbHVwoDzCy0gZM+tAMXIxeT4uCQtu0MWIPjSz2QgLh6XrL1TCxKRHrvncH?=
 =?us-ascii?Q?4Ux5mkT4QTqtf/B43ScsqILHxNRBggWWhgBoIcgn6EYkImA19cYx2MmagAhj?=
 =?us-ascii?Q?op3dHZVvSJsyQCfcoEcq+/Y5FUi64qUDcKTqPgHEWUNT5LWao7vrbDPvUCOD?=
 =?us-ascii?Q?4XNuAVdhkm851TA9TGuq7WJR43/Zyg8Vk4Et7vpvPbrBcHu9M4tywhp9Q7Cl?=
 =?us-ascii?Q?DPU4R+FVtpDTBmPaRZCZQRByfg7EKgyP8IUM8/aRCk1U1CU7z0LQAbJR5bL8?=
 =?us-ascii?Q?PIw36K4h2QIhsahDu12wAgrILbF7d9Hj9WqSPmcaXPbKle3WwZvYNG5ZwPzM?=
 =?us-ascii?Q?rZKUNrACgw=3D=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db84a3e9-8528-46a8-08db-08da243cebb0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 08:48:49.8415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 33o5gUjaI2B2u4ou1Dm3F7Knn4rh2BFfZThgv4stYJeKVasGEzXNnaiW4mlX6PeYLYXRVsbY9t1h/bfKT8OpyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4598
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
Cc: devicetree@vger.kernel.org, qwen@analogixsemi.com, bliang@analogixsemi.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add 'bus-type' and 'data-lanes' define, bus-type 7 for MIPI DPI
input, others for DSI input.

Signed-off-by: Xin Ji <xji@analogixsemi.com>

---
V1 -> V2: rebase on the latest code.
---
 .../display/bridge/analogix,anx7625.yaml      | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 35a48515836e..4590186c4a0b 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -94,7 +94,22 @@ properties:
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
         description:
-          Video port for MIPI DSI input.
+          MIPI DSI/DPI input.
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            type: object
+            additionalProperties: false
+
+            properties:
+              remote-endpoint: true
+
+              bus-type:
+                enum: [7]
+                default: 1
+
+              data-lanes: true
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
@@ -143,6 +158,8 @@ examples:
                     reg = <0>;
                     anx7625_in: endpoint {
                         remote-endpoint = <&mipi_dsi>;
+                        bus-type = <7>;
+                        data-lanes = <0 1 2 3>;
                     };
                 };
 
-- 
2.25.1

