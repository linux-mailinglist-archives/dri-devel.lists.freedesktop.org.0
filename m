Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2569B839F
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 20:47:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BB810E17A;
	Thu, 31 Oct 2024 19:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="FnKnc8Vq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2086.outbound.protection.outlook.com [40.107.105.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4118310E17A
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 19:47:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJNI3dSQBwqOd1MnXEO12yv9A9hkrAuydez0TbPgubDBBCq7drHWDLPd2F30XQwhClbp3UM6KE2QokbjGzJfs1AtNrBpEnU7bhphBW7qb7cUN61wOepCpuz4gXuLENEIKW46Sfkz4IpMuy32QvoKmMCIr5xqBZbglpJ85UzstWYE71auZWud+ypxStP5oMCBM2TZQisbSeaA9eZeleKGPFNJtlbQVbTGmXAzdvn19GCMTpvjJWo3cl6Kz9ehhJQFyrMORF/9qYTHpvUbsA9FKaG9FOypSsP2TULPuMDGbUL76Y+EpFCzo8ZII/aWL78Nm+9Jb84iFuJwDcQnPdTDIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bK3kAZ9RyHcJai0t4FqhVPhOqmIo6ZraaAzbna2I480=;
 b=U/5R0F4e3Ww2e/q8AgTI+WnWcbwTqQUnCH6sm7/ESNlSm5/SIB43lZD2K68qzKCLkgOsNLVy1D9FbFP6DvDR1za1f2ilSa9vzisUuZPdeuUmI1hF7r1S4CstubmkY48g5p8MpSnTFThJD6GMXP5hOfM6g6mlDs++jHgt//H+swaIM+DiS8kNY6IcyTWbNwYnLTxzCi2f/DAe+D/v9sqnLISAG6ppeh1I6JC8fuxmHZiONP4+PPQEkSjD22cozCrHt7635fS+9SQju09ibAyntHUdhiYmE1Es30Dh0wsNKWlELESgosyiKBbtsGk4KzD1WkHJTKde7VacpKADfPy0ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bK3kAZ9RyHcJai0t4FqhVPhOqmIo6ZraaAzbna2I480=;
 b=FnKnc8VqgyieHdMcQ8LeEVN/3sVNVmkIozyT0d5g0RK3YdRYTxI6owS2kj8o4SHmgvOnG0P+ur5gF6KcxqfzeiPr0B/ueNTx0Q1BJGnvsHYlpMeyUg+FUMjSL1ZixSARku5/zDrYo1ged7ozP2kDgMDb+woniQt1kgowNJlYQJ8/xrVThPV8HvzxTyDSWhsAZ65ISsQE4ugDXtC5hmhmUY7wD3yKFJi9Lzls3sYqgAPBpORob5yKaEPuO3kxv4deC/FT0GwoR5CPqcJcVtEcOx8qKEZf67vsKhqBJHGJRmR7hbCz0wgY+eCg5fWeZXzY72s3+JAhkNeIMHOu0X4ikw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PR3PR04MB7211.eurprd04.prod.outlook.com (2603:10a6:102:93::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 19:47:32 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8093.027; Thu, 31 Oct 2024
 19:47:32 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?q?Guido=20G=C3=BAnther?= <agx@sigxcpu.org>,
 Robert Chiras <robert.chiras@nxp.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: display: nwl-dsi: Allow 'data-lanes'
 property for port@1
Date: Thu, 31 Oct 2024 15:47:14 -0400
Message-Id: <20241031194714.2398527-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0091.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PR3PR04MB7211:EE_
X-MS-Office365-Filtering-Correlation-Id: b1469958-3bfe-456c-791e-08dcf9e4dbfa
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8pG8ZOGdtlRzVbc7H0zg3nb8vZckMPKLQjeoZ30ODRnGngt5WLM3gdSlwWvG?=
 =?us-ascii?Q?9A2/akhgCP9HV8WtDRKYoEnO7JCwRiWZebuzVhUplURUxxEMTCGZFk/fgWL4?=
 =?us-ascii?Q?/xhzo+bM01oP2e/vJwyrWd2osaMAo1AC4XFy9H0GWO64F9NB6BSv6csLrmWM?=
 =?us-ascii?Q?TSSSwcbb86SUKCrsbYgI0QLCx24Wgqqhd3bdfPzN8SS7oSkqvX32EiXZ1LAP?=
 =?us-ascii?Q?yUdSkwCHwh2yLWOx25gE1jfRlqDY7PobcT7Mz6S9pdKHouAzypiI0YPlQxe5?=
 =?us-ascii?Q?xAB5xiA6+VoNeCxHg0lJ1namLmzaZNlgs4pkFni0FMRxDxNbIQTwt15XT4a/?=
 =?us-ascii?Q?QxZFkrV6675HRxo3TiB7ErSXNjcUCCYUrcYzLbj7ANAunLz3tzKfsrLtWfhh?=
 =?us-ascii?Q?6/hIfxxHt/C/zEVFkKZaashtv/O7TOINR381MNjD0s8KW9x1Rd5Joj+hSXyX?=
 =?us-ascii?Q?GgGlqUBtE+rtyQT09RC7TFL9L134FvBW1+yrRDDTEEN4ixW5yQbyRUZ4MFOv?=
 =?us-ascii?Q?qMx6f+UTzmIk+xJzqaT6uczoDBPUOnlPVDoQDSlrwy9B2gDGW+ClPUUs5Qez?=
 =?us-ascii?Q?Igy/4jEwirnptdCbZcSGs5PL101o7AMNM/6ApSBtVKlNvln4TlcAZAHWvgAp?=
 =?us-ascii?Q?lNs8ORFmVLrF2b+TKCCzmMP0HQgfUEqXG9NRP2Al1PKYjq4YXmtFAUljIxhZ?=
 =?us-ascii?Q?eBKyrcl//7J0+RiUGRwaM1yztvpwkyq2W4hsg/C3rqxkL3oZfSA3n6ol2vp0?=
 =?us-ascii?Q?73VLDAGm5TIT8GpKY5yhpBjXjOaZk6K9JOZkYXTqpdzp3yFVwM5lyGjwSi+2?=
 =?us-ascii?Q?HtsObkLMiZmpndhSLBk6NDKy+Gz0Wu8jhCPE+j94XMZLLk8UG5ggPSCSk5T8?=
 =?us-ascii?Q?dR/x+W/KwY00TGO/tlQZrrCsuxOPVOu+2qS39cPgRqjo99GWNCMsA6GeNbyz?=
 =?us-ascii?Q?pmXvnJEA/u070VvKXssDvn9CklSZ6oTBScxhwmj+n7FVszIf7CUQO/L8gZ7R?=
 =?us-ascii?Q?+jmD6xHPaQqIfD4CnII5w34cZPYRaOBGtdE69tm0ORlhWGPboMoyU9Poenvh?=
 =?us-ascii?Q?Jk5XEQBRwYYLyoH/ZfDZuTiQQCh+JG7gboohpukjikMXZqIHYez9kQXGwA7z?=
 =?us-ascii?Q?7A1zewBHXkHFugQkmVJUT26q5iADKWyQlip9FiTVk6VbV5aJDV4Gb4M13yhY?=
 =?us-ascii?Q?KFVNv+uQ1ULb4G4lOMBKzyZ2FiHAzuPdm1V7yAaEArDlCVyNr23nKizC40D2?=
 =?us-ascii?Q?RqASpSsPjLx2k3uvJQWvHibu2zwDh3a8W+9d0z0gtUy6mnSabfb9vXNVoOAD?=
 =?us-ascii?Q?r+PYzqSx3kWBeHpxq7tcJj8cvWGP++ePeZAAk3vhxv49eRm98BOr3GBM4HS+?=
 =?us-ascii?Q?aWB070HNA53wd7/TV2zzXFn8NyNO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SHcsSt2MQQ4Z0Kre3kj+LXHstggZMo7QpvRxz7ZKGAsHh6rBTLfYrILx+Zps?=
 =?us-ascii?Q?wI5s2aJ4tghxuSH7DOR5u7JcHQOdE3xbGkmxgq6XMlWintflmDRJ4nAK+L2Q?=
 =?us-ascii?Q?Mt1zsX5tTOK4SgfOwygTWSC+1lTCVUwmtGH+XtTXpX34BOdcTAlAwVMSP12U?=
 =?us-ascii?Q?8ai2X/3vJRZ+hIzF26atLs5Oo6+LGQ0BUTyvbxJfeuxrJa/5ujo2IxxCqpao?=
 =?us-ascii?Q?+NKFBnC5V/VenKMrXpMY/jwekjYVahfw7m4lqtDLr0zSZ3zJx9+E4SMtG/99?=
 =?us-ascii?Q?QgWMWnZUmrNpTNbBYWdZsa4kzJ8WGEW7SQXY69lM3ujf6Ga5eFt2tdLenvpE?=
 =?us-ascii?Q?DdUdUeyGVZWRRq7rjCj5GHuEL5D9HB/lupWxzZfVMWMG5wC6EHIz3ZKCHUO/?=
 =?us-ascii?Q?0G9A3jgGVcbo2H+bvh55cbQZoirghhF+Pdj+dvhGRnOIwAl5W1NylszqhtJI?=
 =?us-ascii?Q?8uzGrubn9yrsCBQEjkzIpp2zkiIgAEMSaVj5+SV2NLUpQT/AaRGecwHF1qx0?=
 =?us-ascii?Q?BI2Xc/PAUIg2+AOM0DHAOJ0XR8Pt3jahdAoGZXkdo+4a/0Jc9HrCncn6Jqx7?=
 =?us-ascii?Q?/8j9PxbOo4Hw4zuvEjLLQNcMwpsezXjPksrjtHBUvlaocwJvNYqXYPyFb34V?=
 =?us-ascii?Q?kHL0zD+m3i0yjrYZTwyXhPFm23LceR3lSuKIwBHjITlIhbZovzArAT5lwUyf?=
 =?us-ascii?Q?hb4aOURXkHbvXUnE5UslcX9JtKOeB5UBw5oSNwQKk75wDpKKCaBDzvqQclIk?=
 =?us-ascii?Q?LGV1YFZKfLOH5lgoDFSziQh/+B7GAY25YrdwLmMR7tecxR5XaT4xSxpVOXr/?=
 =?us-ascii?Q?KZ9Fa4PYemk0hTfLbZpZsZySzcZf4fUtNPqatFB4bI67GmIbj/4MWnl84KNN?=
 =?us-ascii?Q?OiknElp2Uel5tQ+GFN3pyVpJeqcG1nyxJZANbGGU1oaNhIAKVSMcy+UwmNdj?=
 =?us-ascii?Q?7WHkF9KYrOFbkagCJcp3wv5zB2gqLfiPN4P2lxtJsugcNKXJdkpqEVBlq9Qp?=
 =?us-ascii?Q?oTeX33F6tiSoXAgWXvP7Ct4K6DGdqWW1dDve7+Sk/odrA3DUODUBdwXFOAzi?=
 =?us-ascii?Q?Kx6PPIa6IGxgjnh9T2hWyMG6sXNEXDsk8FsJ1pdAuOj5qgHRfJzpoxTUnaLA?=
 =?us-ascii?Q?WQ1Br8EmLyOYnh0+DalXv7vdRYdAffM/T+hxDILXDZMArCA/oJBNZylgVxgC?=
 =?us-ascii?Q?vum28ByjTkIJ2c8/a/+0mad9vSRy4ViPy2jQaFuBPfiH03n3clAmAZgvYkC4?=
 =?us-ascii?Q?hoOcvCxJAb0oQVMVsMjTQ3rnUyJc5cOGcQeXXC/2hGRVf0ZU8iP/qSju/05E?=
 =?us-ascii?Q?yuoHIc/UZrDOOJRBrjXeFwR1xt11nNV2/MnIwDSt/5B9vH6jycbSu6mzbn4e?=
 =?us-ascii?Q?+DZpzcBlW8m2+8sC9UDf5egeSPycTP7Gg4JVH8mLYztM/af/InAwPXQMW53J?=
 =?us-ascii?Q?2ntXgnISHlDcdafaW+AmaaipPgiuAFBJZ7WC7o0VEErg9uUsZ5sBZmjcxlN8?=
 =?us-ascii?Q?cbbfPJ3wQJ49PwmnQoAalu+izJTDk8IawUghwTWEytKUACA8YidXb2s2elsF?=
 =?us-ascii?Q?QBgZD96OvAGjt5aTtA3nMG/7n4c4jjFrDRM0q/nu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1469958-3bfe-456c-791e-08dcf9e4dbfa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 19:47:31.9867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: foakFjrETiwKalrUlH8uBKdOYwKO+TKWwHQvcJYtuEgW6pmMDNntl8+/1w8gvnqISHBFIJb3+q5XOeMG/SKAew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7211
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

Change $ref of port@1 from 'port' to 'port-base' and add 'endpoint'
property referencing video-interfaces.yaml. Allow 'data-lanes' values
1, 2, 3, and 4 for port@1.

Fix below CHECK_DTB warnings:
arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb:
 dsi@30a00000: ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/display/bridge/nwl-dsi.yaml       | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
index 350fb8f400f02..5952e6448ed47 100644
--- a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
@@ -111,11 +111,27 @@ properties:
         unevaluatedProperties: false
 
       port@1:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description:
           DSI output port node to the panel or the next bridge
           in the chain
 
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                description: array of physical DSI data lane indexes.
+                minItems: 1
+                items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
     required:
       - port@0
       - port@1
-- 
2.34.1

