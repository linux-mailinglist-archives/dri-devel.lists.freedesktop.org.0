Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 048CED2F174
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 10:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229A310E1B3;
	Fri, 16 Jan 2026 09:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="cGW/y1xI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazhn15010016.outbound.protection.outlook.com [52.102.128.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E912610E1B3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 09:54:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qpGSeIWCiO4R6uVwyO53U7VGOVTMoOchTPY1GuqRBrVO4TAhA6BQtMiyxdid9Pq7VmgMiGnkdu9byDoKzvDKn1SsbUbnuGd79O0RF9MYeuFh7Vwk2aFsY/5xIikKeKLonUr96Gn6R5SMIMEuvAOjIwtM412F7+AbM3tJDNj4TJDfcMHhV+9szlcCL2xzklW4KZuo+satAfKcAtmw562OyDvEr2afnbtexKunTpqvkuL/iqNk2xnARmrNBwsxjHRAkoRY6n6tNDbgX8y+XBOITV9o6a9HQFmk1JjgCmNDRwJ96ptztqvOsNP9F4ypgTzAHBDoNuzUjUsemuBViBedQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZxKsNYyppTV2lSuFj9BY5Ny4idLS0mOmwECCp6pYlr4=;
 b=x/ZbAD8ksrjsNENpLWh+5pJkkFnFbbaGsNlfezdjx8DT2j0vuv2Ij4nvlp0osvud6KG/MlzPE7QEaUwaWlL+2R4tSIQHK6+X/HKvPmKvBBixAggL1M/COgJzjYClanBYrMrzyRDyF5MEK4o8qe5gVZV7345CKMlHIHMnxlR6rXSC5oMk6g95uCAIz8FoUArpOsnyIgN+XxayeLyUWmgboih1sxp9o/y6k4bNNmWTJ0KNSS+umFxt7ULkyrzkAQsEzQ5jGbKE9jRJzdM66m6bMB6q409Bd6rJTAaxOFk3vCRrQkUVDgpcDWw1Z4T6XPMI+zuy60Pcs2L0l+Zpalmixw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxKsNYyppTV2lSuFj9BY5Ny4idLS0mOmwECCp6pYlr4=;
 b=cGW/y1xIvE8MbLqlpp2PUP2GVG49KoCiXx11gp4v+eRD4LIm/u31H43fLE9xEnuRUUtRyJeH+278X9Jvw4dtvwv5wuC4nfEt/UYUjqlB3HrsHjuy8/9rmvh/VXx0ihfb1HGNLRi3eCcWTnzJCFbapFfn7mIO5rtK5PMLXhbE8mc=
Received: from BL0PR02CA0063.namprd02.prod.outlook.com (2603:10b6:207:3d::40)
 by CY5PR10MB6045.namprd10.prod.outlook.com (2603:10b6:930:3e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 09:54:14 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:207:3d:cafe::80) by BL0PR02CA0063.outlook.office365.com
 (2603:10b6:207:3d::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.7 via Frontend Transport; Fri,
 16 Jan 2026 09:54:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 09:54:14 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 03:54:13 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 03:54:13 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 03:54:13 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60G9s6ST2958972;
 Fri, 16 Jan 2026 03:54:07 -0600
From: Swamil Jain <s-jain1@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aradhya.bhatia@linux.dev>,
 <mwalle@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <praneeth@ti.com>,
 <u-kumar1@ti.com>, <s-jain1@ti.com>
Subject: [PATCH v4 0/3] Add Display support for AM62P SoC
Date: Fri, 16 Jan 2026 15:24:03 +0530
Message-ID: <20260116095406.2544565-1-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|CY5PR10MB6045:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c50e2d3-90b1-46e8-8749-08de54e534ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|36860700013|34020700016|82310400026|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Gor+ux1IGv6t9Dk36pnZVWTpooFel/gs3AxHs7DV4tMogJ6o5rT3a5cM36Vu?=
 =?us-ascii?Q?hkiQH7NkmrTkrwubZxPPovbH/yoicAm9mUvcZmcOSnOvhGQ+Gj0SpXEmUrV5?=
 =?us-ascii?Q?jldhnsWBrrlkSNCrG/VaCBsSmxcK/8sp8ZUN2PnZ31Uaxirke5OdqJcSfX2+?=
 =?us-ascii?Q?wn02Gs/1LBUdhxQQPWT03X42FIYJDSYFRCsM2UPIJ+FEzjFQTT+HNsI4Gold?=
 =?us-ascii?Q?e2uiW/2KzRPg7n6uMxnhB0bqgTiVlF/oCgdUlCXM0Kc/YX1QIgzqQAWN9h9x?=
 =?us-ascii?Q?MDqOD2E/2WDy+0q+9yOAgA4Yg0QcGDfLEzA6YtItH49/H2ybILsZpQ8PE+IW?=
 =?us-ascii?Q?yEYpg7PhDRbyrLE1TEcpkwyvX6Y/9iAFpqUPUj6WLYg5KyxV07zcsytQktT+?=
 =?us-ascii?Q?GBxndP7gP31SLkQvmpOwSNvhBHQdNy5SAbObAfnlylI6DLj52sSXWmwkOSrN?=
 =?us-ascii?Q?3v0YlwnkAN674XHLNUt0Qd9NHOvnBEN24HVWVFMw3SdL9DdmSamO9FtbO56h?=
 =?us-ascii?Q?xO1n0Yd/8xmjiyhnAPhQFKK0FdwPnr7T9NGfshX9EEAESKfDeqJos7RwGfbN?=
 =?us-ascii?Q?J1jUUgbUSXVPRjhbeLTLTAwItl73BE12oDDWTHcsO6xYpy4v73Pqsv6pHsNh?=
 =?us-ascii?Q?KUqWEfL7wYo/COV/75EY8bUx+l0xd4mWj+ClTbxZXqvsNj2AGGv8StJlFmjX?=
 =?us-ascii?Q?BYl+BrgWBSnNIqwTRGbLCfGuUbMYtP/fjCKeeZxLx6n+AR9Fj7+xqRn2k4F0?=
 =?us-ascii?Q?HA1h7vySzMyx7stMDQult244ARLNbuTzvBMp+e/qqK8x0QodNjfUlMiGEGGK?=
 =?us-ascii?Q?cwoQXBZACzK1wZtlgjNaZWin+oZxr5lZwuSH1Yhiu9+j9AQ6/TIGfIm9ry1m?=
 =?us-ascii?Q?gYLOWNSWvVDB6ihJyw9+bm3ijSodGtrhpNRxYTQyRD+SIms9RvmJkL6GFRZy?=
 =?us-ascii?Q?bgEL8THupvgnTecbzdoEdnn+eZxW9nT9kdDy4vIjb2PmF1jNDZaYmUZSPy7R?=
 =?us-ascii?Q?jg1yxxqLco3nDo1MR2qE2upxWjkUdm5tfoBvjSYGKqRUQBnSBppx/5arREPv?=
 =?us-ascii?Q?1GXUsH/wqVw06tQBZAriLG2jdlJQibMAPcbWDR47sySY61Z3g37hmvFdQAhj?=
 =?us-ascii?Q?tipeAmnIVn+BeI1V+aGJuxQGXHmWasSoWPCpT/+/xAv9xVf4yryzQarkk9rp?=
 =?us-ascii?Q?gBJTYu9vnRHSGBgb1ctmldelSSvH/cyL5f+Du/3iV590uTWWQy0EFB/MblGA?=
 =?us-ascii?Q?zeaH646MDI1E1EzI3TkgC5weKxfv/QlXrphrL0f+ubaUoqq23rfnirHG9lEA?=
 =?us-ascii?Q?EdJwfRUx0wNkqHpWBsnn5AMrCdXI0BOMBTHDD8kp72bc6g23lnYXZ5+J1pIV?=
 =?us-ascii?Q?Yy+zWnpo1nFMZQjKui8YHJhMhEmUXg9bGd8NHoTzkhwTQy3VwJgj/mwSupe7?=
 =?us-ascii?Q?085dt5pOSRC5TUfbmT8PkJXuEXlfVd4pmu8W+GYL1mwxeO8yGFWWpQCANjiT?=
 =?us-ascii?Q?nYvDxruv9TUosgvfbQvH0+sAaJLX/FUw1vhY89S8fWVD5CUADg5zcaH6etp3?=
 =?us-ascii?Q?Cyi0Xo4yUq4nxWiQj5tYnl5Gcg59KMxQE54+hFwB+QbIz2HaRaejiZsvLI6T?=
 =?us-ascii?Q?1kwKWeGrqWtYn92kW95m0NZ6x6A5t7s2HqrbK9WqwS0uWhnHIlpj+p/n0s1L?=
 =?us-ascii?Q?Mhkz24hdzKuAivXk8ScmJUGMDk4=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(34020700016)(82310400026)(921020)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 09:54:14.0124 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c50e2d3-90b1-46e8-8749-08de54e534ae
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6045
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

Display Controller Overview:
TI's AM62P[1] SoC has two instances of TI's Display Subsystem (DSS).
Each instance contains two video ports. Combined, both instances support
up to three independent video streams: OLDI, DPI, and DSI.

This series:
  1. Updates bindings (PATCH 1/3)
    - Adds "ti,am62p-dss" compatible string
    - Modifies power-domain requirements
  2. Updates driver (PATCH 2/3 and 3/3)
    - Adds power management for attached PM domains
    - Enables AM62P DSS support by adding compatible to the driver

Note:
  - Device-tree changes will be submitted after this series is merged.  
  - The device-tree patches are available here[2]

[1]: https://www.ti.com/product/AM62P
[2]: https://github.com/swamiljain/linux-next/tree/AM62P_J722S_DSS_v1
---
Changelog:
v3->v4:
  - PATCH 1/3 - Cosmetic changes in commit message
              - Explain why 2 power-domains can be used in am62p-dss
              - Remove redundant explanation
              - Add item description for power-domains property
              - Define constraints properly by removing min/maxItems
  - PATCH 2/3 - Remove err_oldi_deinit if tidss_oldi_init() fails
              - Pick up T-By tag
  - PATCH 3/3 - No change

Link to v3: 
https://lore.kernel.org/all/20260107174525.1702585-1-s-jain1@ti.com/

v2->v3:
  - PATCH 1/3 - Add a broader range for top-level constraints in the 
                bindings to resolve dt_biniding_check conflicts
  - PATCH 2/3 - Remove and modify some comments
              - Use IS_ERR_OR_NULL() instead od checking for both NULL
                and IS_ERR()
              - Changes in error handling paths
  - PATCH 3/3 - Pick R-by tag

Link to v2:
https://lore.kernel.org/all/20251125165942.2586341-1-s-jain1@ti.com/

v1->v2:
  - PATCH 1/3: - Remove unnecessary example
               - Use "am62p-dss" compatible check for multiple
                 power-domains
  - PATCH 2/3:   Add Signed-off-by tag

Link to v1:
https://lore.kernel.org/all/20251114064336.3683731-1-s-jain1@ti.com/
---

Devarsh Thakkar (1):
  drm/tidss: Power up attached PM domains on probe

Swamil Jain (2):
  dt-bindings: display: ti,am65x-dss: Add am62p dss compatible
  drm: tidss: tidss_drv: Add support for AM62P display subsystem

 .../bindings/display/ti/ti,am65x-dss.yaml     | 37 ++++++++-
 drivers/gpu/drm/tidss/tidss_drv.c             | 83 ++++++++++++++++++-
 drivers/gpu/drm/tidss/tidss_drv.h             |  4 +
 3 files changed, 118 insertions(+), 6 deletions(-)

