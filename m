Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19643C3B647
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 14:47:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C462010E8D9;
	Thu,  6 Nov 2025 13:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="LbI/LRLH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazhn15011020.outbound.protection.outlook.com [52.102.137.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29B410E8D9
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 13:47:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWJ5cud3siIRIPfeqqSaoRgrbrCS3oKf0mu58e/B7FpGAtdAn9ZS/X0SHGRMkn/3f245rZ7KC0YzV1EIkNF3AKtUX060UGCSO7UdGBSMQrLXXZXQ4c6Z0R/iibSKPzf4cGBHk7NZzjU+BxBKZabJqXvWUP4amZhZ5iCmA57215fBoIEUzlIjuvaE8bZ516wjRJl7sQEfw2fggBWAQEUN7Cm03nQyJGF3i3U9bVmDQztQQPtlxUL6qXyZrLTO2ajMW6if9B9WEP5XCJlVQPxxPbiPZr6ozhng9Bxn8dWrr0dUyfQ+O2Y7LemAwGiOSKZib4028wOlAVxbWoCsOuEI5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+TlHiEnxW9jGZx72ciatQmh38sGCi822Wisx01uOwA=;
 b=nLc6IvL4QnEde7acnsODf2gDVCGFZrhe01DtDhBDwYzDB8KNjZr5Omp4ci1km6xqgm8rEfN2mOfi3sbQmCj6de58TyQMIXGryAiPc9rsUkvX0F4e7wknYH9RCgcljkTaujhKw/ZwPd43MjlYqFqVhxAWO8ikgO53WBsOnrFzvXkE2G4UWbOCkZprlfpoEJBsPLm0uH+mwElDgbNZDWwlCBKaDmyk1zw0n3AwOmOpw3J+E0nBIMLWAsUA1cZ+qb9D1YBKa/2D35Nf8WrJmfooQPejNmRfG0Xl7xdNPA/mZkWmWcImYcV3N1c+DGHhcDQ3xMWYCmm5CDHazu55kwie3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+TlHiEnxW9jGZx72ciatQmh38sGCi822Wisx01uOwA=;
 b=LbI/LRLHhMkRkHfcCP8GbBQEDxu/oNFBE7xEq8X7cvvfHpKwNdHfOp3mNk+Ourc5tIhWFiQGagz/2IjFVpLhGt2e3jc5bZnau1WPFzQKA5YxS9uyYh1sRGtwTj9qXEO0g+rtros2nYlaBEPeBTEi+ANveyRKf8FeDHRF9EVn8Oo=
Received: from CH0PR03CA0320.namprd03.prod.outlook.com (2603:10b6:610:118::25)
 by CO1PR10MB4673.namprd10.prod.outlook.com (2603:10b6:303:91::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 13:47:06 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:118:cafe::51) by CH0PR03CA0320.outlook.office365.com
 (2603:10b6:610:118::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 13:46:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 13:47:03 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 07:46:59 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 07:46:58 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 6 Nov 2025 07:46:58 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A6DkqDX1301720;
 Thu, 6 Nov 2025 07:46:53 -0600
From: Swamil Jain <s-jain1@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, <nm@ti.com>,
 <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lee@kernel.org>,
 <louis.chauvet@bootlin.com>, <aradhya.bhatia@linux.dev>
CC: <devarsht@ti.com>, <praneeth@ti.com>, <h-shenoy@ti.com>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/5] drm/tidss: Fixes data edge sampling on AM62X and AM62A
Date: Thu, 6 Nov 2025 19:16:47 +0530
Message-ID: <20251106134652.883148-1-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|CO1PR10MB4673:EE_
X-MS-Office365-Filtering-Correlation-Id: c069da01-719e-4ac6-50d8-08de1d3af7e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|34020700016|36860700013|82310400026|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wCl8+lkBPH0y1uiq992dyuiT+Bzxbv9015NRp4iCTVP5oLdZCalr5FPWL1jL?=
 =?us-ascii?Q?9kCYLEm9+7ZfSm9raSL+flPWYVwlQMhh13XX5sIO5kUMD0MIgKxANpsGKyCJ?=
 =?us-ascii?Q?BCbye9dy0u1dxjOIfyqg1PDMAo7v5fQItwju0WtFAg+m8ar6gTWxO7h+h9+I?=
 =?us-ascii?Q?mqlF4Ffpw/dLg9XI00ItKHq9ujIQKW1XGntE0HxSqBubicvghbwwoysYCuG4?=
 =?us-ascii?Q?hIPk0X5GFY/BDcdvvVknY0LuFlO8VQOfL1jkXLWGU/9m/kGyZv6Howov3clf?=
 =?us-ascii?Q?0xz4kl1GZL5n082dEbplQ6MehtU7Tmqmllt7KnPUc2HUKNHROnoUfdemBhlr?=
 =?us-ascii?Q?IGL/ivJCvFviS7pdHED2VudZKVttwAz3BB1hbniHfS77XSczPXFYQdlz6EsJ?=
 =?us-ascii?Q?/Tt5LMve5adYVAYr5RrJl8S4RO7o5dIttWSaRfeocGEVXbNBXylAOBGjs7Ft?=
 =?us-ascii?Q?myFdc5Oan9bvXqrtwGsjXDoorie3//gvdiP9Ra3qh8c8amGlYa4HQs6uZBds?=
 =?us-ascii?Q?DepxzL1z4+e04uFYPxlSuNeVLbauKGd7h3OP2kOZLbwRHDIUTLa2EMgUVROe?=
 =?us-ascii?Q?RV7onHfpYMm2Ll9kxOzazdK+eKvyGZxA+zzobtSNVpvgucwAnJlFxPXQe6eP?=
 =?us-ascii?Q?RGJbM/zB0dRc3csK21GDICarttAQur0ZVf65KbUvHsBiVfdl8AnCingFMSIJ?=
 =?us-ascii?Q?xt9ouynaO4lmSXsdGgEfH1UgbqFZ5vQTaTooTOwJt0E1Qf0rQAQNAyPsykr/?=
 =?us-ascii?Q?8KI9eUrf7ELdr+33CO1Ujd9CL8C0fKe2QeE+3VFVmqFa6fQQJkmJatGTg0w9?=
 =?us-ascii?Q?sWM6tR+EnkYEO5odUKaqM4jVR5Qz+uyjz3nM/xGeCg1LBnjHdEfglYCchDH8?=
 =?us-ascii?Q?/qacDK2J1m4dtt6uhLqs1qiMcdPlVOx+JahcvYHJ0RQsfurOTDwwgTqbcmcs?=
 =?us-ascii?Q?a5WmzwMy751BA6XKmV0GCSdIUDgvSilA4Qp/LhKJ4jU9+5bOkBNhHr1x8WYC?=
 =?us-ascii?Q?5KmfSE+rssD1ZPL2Jut8o9XAUtDRMG1vY9qBQ6KhrU3uW1mDpBV/SwLvyjcA?=
 =?us-ascii?Q?+itHTaKmN1VPMWvG5g9McFVCvFzbHhhtObkYeKqA9UKQhDlA0/w8bRX5Tor8?=
 =?us-ascii?Q?xfpIdt9GNWIc24JLTL5WRZYooQqahAS7/GgMDn/k6iDaXzq96uMFayckdi5O?=
 =?us-ascii?Q?N7cUR++u+0kJaf5PqNppwQupEu+2PXvKMaoCqj0hDVFjGt67BnVnS2f4OX2o?=
 =?us-ascii?Q?aLg1fBtx6sPF/hPk1SGgzeM8bpkyrQyUmWYh+vG/pMofnCOiUN6RBo3Iubep?=
 =?us-ascii?Q?g98pZIjawoYrr2CEgAnbe4dDIv3IIvfQYyT8IpsJMBPLaf4kdVyHlP+t3rAu?=
 =?us-ascii?Q?jAPJ81E3Dy8WfLN58OLnWtoxi0TB+ilGC5fQKeZibXugrhCyqhIAgLWGz/py?=
 =?us-ascii?Q?XlAOU69u4ptKJubkQN7faui6dH++kBoySXzO0vQGVntRNuo4cBcLWgxMbreV?=
 =?us-ascii?Q?P3ubHBzix11I0je2wWXvHPejvvgTpUFFvtVjQjsBf8qzzSY2fmBnYGaG3PVD?=
 =?us-ascii?Q?29OmgMrbop+1hKmIYeJIbyrgdhtItDDiCMWqrxZo?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(34020700016)(36860700013)(82310400026)(921020)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 13:47:03.6716 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c069da01-719e-4ac6-50d8-08de1d3af7e3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4673
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

Currently the driver only configure the data edge sampling partially.
AM62X, AM62A and AM62P require it to be configured in two distinct
registers: one in tidss and one in the Control MMR registers.

Introduce a new dt property to link the proper syscon node from the main 
device registers into the tidss driver.

The series targets to fix the issue for AM62X and AM62A, later will add 
the changes required for AM62P after DSS support gets upstreamed.

Fixes: ad2ac9dc9426 ("drm/tidss: Add support for AM625 DSS")
Fixes: 5cc5ea7b6d7b ("drm/tidss: Add support for AM62A7 DSS")
---
Cc: stable@vger.kernel.org

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---

Louis Chauvet (4):
  dt-bindings: display: ti,am65x-dss: Add clk property for data edge
    synchronization
  dt-bindings: mfd: syscon: Add ti,am625-dss-clk-ctrl
  arm64: dts: ti: k3-am62-main: Add tidss clk-ctrl property
  drm/tidss: Fix sampling edge configuration

Swamil Jain (1):
  arm64: dts: ti: k3-am62a-main: Add tidss clk-ctrl property

 .../bindings/display/ti/ti,am65x-dss.yaml          |  6 ++++++
 Documentation/devicetree/bindings/mfd/syscon.yaml  |  3 ++-
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi           |  6 ++++++
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi          |  7 +++++++
 drivers/gpu/drm/tidss/tidss_dispc.c                | 14 ++++++++++++++
 5 files changed, 35 insertions(+), 1 deletion(-)

