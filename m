Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3761C1B8B9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 16:07:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4152A10E7D8;
	Wed, 29 Oct 2025 15:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="OZZx79nY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazhn15013062.outbound.protection.outlook.com
 [52.102.133.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CDB10E7FA
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 15:06:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lyE1GvOYlUr/eMuSg8abzymy1pXWRPGEpRd8QVcyZ7tZlCVxtaUjOe4A6Nk4gwIuPKn6eYRCIo2K6ihfMbocLGt4VhLNkCwuKPICdVhsuvyMv1pQPWVwkp2Hxg6Ui2e6gCjCViPGMtAH2SV2Siy9kYF+00sIPafyTo69UUZhtNbVa9pwvr0MC65aqT8Ge/elae5isSTGwB2ZqA+TZgHUvfItePg3pqF0Np8C/PgSe/0VhS1zg+JXLwedkaKuUl0SP2QgMO6DWXhoGPbCmkXkkSpKYxN28J4I8yMyQ9FwtetccjCgXRbgKBKk3Ya4vN0yRLqvcjjESWkNqvhSO3vTPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JN5dtJGckQ211Zw3C+oqWNzrCBAbdtTQla9uK3OWsGI=;
 b=pNoKDbZlM6X3d5lbn58uRgD4APSjIPgTUvNr5PjvnK2gupaoDSx7Auw6yKw1MmdqblG2Td58vyqotim4ViZUd4oo32JjDk6zZp2KNQ9CSneZeZwGeU8QHyMkH063iNaRqs51SAZl629oPwR4XDi95nlLwUl3zy0G8CzrbpbiMYKO6q1mAEiyoEcsgzxhwfIhbYygJSIu33rxz2siKkyXe4UoE2S74vkF9eZLfEfwECI7jz4gdAR62GnpEuprXdDU3ZiZ24gqnHi6jyekUvSDcjfyEpZBF5utFSf7InSbO9gU47Fvyna0SE1GlZ18jGk9XHAdeibVWEotHOgKBkdNPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=linaro.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JN5dtJGckQ211Zw3C+oqWNzrCBAbdtTQla9uK3OWsGI=;
 b=OZZx79nYYXkNmC7FDBh4r6s10cQGOfJge57+427YbSGRc7uGEPeIBcsKBTRlC4u96xiePgoa3gpNl07j7A2AH/QLBFLLw00QV5fayLthEISFwCXTChOo5Dz8rWeFsu/wlLHmjhZ2AIs9SZWat8cidUGrFkySuntArwuMXb+qe8w=
Received: from SJ0PR03CA0088.namprd03.prod.outlook.com (2603:10b6:a03:331::33)
 by CYXPR10MB7899.namprd10.prod.outlook.com (2603:10b6:930:df::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 15:06:56 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::1d) by SJ0PR03CA0088.outlook.office365.com
 (2603:10b6:a03:331::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.19 via Frontend Transport; Wed,
 29 Oct 2025 15:06:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Wed, 29 Oct 2025 15:06:54 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 10:06:44 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 10:06:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 10:06:44 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59TF6iEA4187713;
 Wed, 29 Oct 2025 10:06:44 -0500
From: Nishanth Menon <nm@ti.com>
To: Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Robert Foss <rfoss@kernel.org>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Phong LE <ple@baylibre.com>, Dmitry <dmitry.baryshkov@oss.qualcomm.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Robert Nelson <robertcnelson@gmail.com>,
 Jason Kridner <jkridner@beagleboard.org>, Andrew Davis <afd@ti.com>, Tomi V
 <tomi.valkeinen@ideasonboard.com>, Devarsh <devarsht@ti.com>, Nishanth Menon
 <nm@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V6 1/5] dt-bindings: display: bridge: it66121: Add compatible
 string for IT66122
Date: Wed, 29 Oct 2025 10:06:32 -0500
Message-ID: <20251029150636.3118628-2-nm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251029150636.3118628-1-nm@ti.com>
References: <20251029150636.3118628-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|CYXPR10MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: ff8d41d3-af40-450b-7ca9-08de16fccc52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|7416014|34020700016|82310400026|376014|921020|7053199007|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hqVs5pcgDJ7i2LlJurP1C3w3yyL2emai4wD8sJM9+Wi8mWyXuVbdSndAKHHk?=
 =?us-ascii?Q?KWSrFVrGOU/YRZwMtGXu0FFY28gVVnmoDekkJoo2zCCXHEmJrO3blkIzUowt?=
 =?us-ascii?Q?hxEjHccef6mUUdogqTrGnDF4OQHouyLVSf9qARTm/je4Z4dOTDRZk/abvZe3?=
 =?us-ascii?Q?qPypShmkI7IKlmskjGabTHL8r4UYrEa0RtodK8Fl1YFpdh2hVPpydFSPFfhW?=
 =?us-ascii?Q?+2oiE8nT5Khp+0/7rk/MBhQeHYguxWjD+vHZYrV/OnUdGBkvaxbZQIIdiRov?=
 =?us-ascii?Q?OwPpKyyjkTAHgSTTwr/2lFpydRvy5y2LnXyLhHL9/NDOFRLnRGjdaVTMfjuZ?=
 =?us-ascii?Q?K3hzJxIGe1r2SDHF8LUCdH4IIbpAI/vemPFh/WdUqoOmuN2R6CdIBJAFDVCD?=
 =?us-ascii?Q?1CltIVJbKbjiJrEBFZtEddk8n2V6rcWvo9VcOAGxDOTtsKCsN2LiUWNtJ5DK?=
 =?us-ascii?Q?KiRogUb+tjbsTMMzNoSbpZwtGoofMKrSJhwFG4DtF5NXjjRdMG26Qj0NvdbO?=
 =?us-ascii?Q?z+qKksHX08EMtL7/QW0loicyLkTzKIWlhe5S6FElVR7U+nRDt2sAS1LL7MSz?=
 =?us-ascii?Q?OWUX5WmHCkjANB7lCJU1z2eCNQucLCUL0zcfsicRXjAQ/Ti6MSPJNtzDIgE+?=
 =?us-ascii?Q?YUYoWE0mPRCbRP3oCuEYytghiZIuo0PcXdL6TdneboGrAxH+rqfkYore+Dor?=
 =?us-ascii?Q?bZ04+TzY/yIHwvOm4g4arM/O7xx/fY9T1oyWzzN5ropwZzG5oArW7BMecrde?=
 =?us-ascii?Q?PeKO/kDy7UaKkPSTXJs1fXHVpg9SKHP4amcmCyaDxfwAIxYmNsJJ0cxKu+y6?=
 =?us-ascii?Q?w8lF4+4iCjD11Wsed20Uq3939EMpjR3T+YyTV77d+lucHGS84t1HESUmChSE?=
 =?us-ascii?Q?sqWv9IONFa/F3a7PSWiiZqCVq4OkBfNglyvXlsb4Sg2Jb5JHacpsFj88bbmE?=
 =?us-ascii?Q?h6+1Ekeepzqf8dJE5mrUPzhwaEV0qjIMHnhO/aL6GCXd1MDoV/vs1OgW/m7t?=
 =?us-ascii?Q?xtD0z1H3+B2MyHlztFCDFwJhkq2Asupu8X9ufyBFN/gqYD3cIpsHjUPJwzCA?=
 =?us-ascii?Q?GTjDQ67+C5gCFGfU54/UrlhFgnRW1DP/a0VzYmOvFfPI/l+yoqbtctbDI39z?=
 =?us-ascii?Q?S4BRPlC8SSd9PD8E3IuAciUuOzUr7lXc5d5Ytg5zMfGncS2oNG/l4QPtTXAv?=
 =?us-ascii?Q?b/7IW3gsK179HMBcyOfQRK3i1MrBGA/WvUE7BZ72/bfK5hrHOljMYII54byf?=
 =?us-ascii?Q?yFSi7xYz4sFkB0J1dZug5hQ4xbZojLyuCF/WLfhzfsOffa/XLRXRDwJRqExG?=
 =?us-ascii?Q?0aGQDjIyCydYyIG8oYgFZr/nYsukK6dl+VBM21bG7O3kpPhVEmF54lQ1IbQk?=
 =?us-ascii?Q?6hhliu150AU6oy2aDi1CbkzvIFCORUeH17sylW60pPfehYUXOhIoBiRxfAVe?=
 =?us-ascii?Q?/eu9l5EHihzOpSzNwJXYhXjyX0QLRF4okMwHzafP+WKP7F7nYBq1cWxe4pmg?=
 =?us-ascii?Q?I1FJDlpskVSVY07ziGKSCgGY1GxT0u+U7MrHdU699SfW/4+lnZQkOeAt07N8?=
 =?us-ascii?Q?1O96ACsaEiyPMc2334Zz7aa9LJLObADrPgbt82q/?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(7416014)(34020700016)(82310400026)(376014)(921020)(7053199007)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 15:06:54.7609 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8d41d3-af40-450b-7ca9-08de16fccc52
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7899
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

Add a new ite,it66122 compatible string to the IT66121 binding
documentation, since the two chips are practically same except for id
register difference.

Signed-off-by: Nishanth Menon <nm@ti.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Andrew Davis <afd@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes since V5:
* Picked Tomi's Ack

V5: https://lore.kernel.org/all/20250827202354.2017972-2-nm@ti.com/
V4: https://lore.kernel.org/all/20250819130807.3322536-2-nm@ti.com/
V3: https://lore.kernel.org/all/20250815034105.1276548-2-nm@ti.com/
V2: https://lore.kernel.org/all/20250813204106.580141-2-nm@ti.com/
V1: https://lore.kernel.org/all/20250813190835.344563-2-nm@ti.com/
 .../devicetree/bindings/display/bridge/ite,it66121.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
index ba644c30dcf4..17d1f97ce8c2 100644
--- a/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
@@ -19,6 +19,7 @@ properties:
   compatible:
     enum:
       - ite,it66121
+      - ite,it66122
       - ite,it6610
 
   reg:
-- 
2.47.0

