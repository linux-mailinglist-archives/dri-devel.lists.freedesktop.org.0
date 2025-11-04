Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644A2C31C81
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 16:14:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A743710E61B;
	Tue,  4 Nov 2025 15:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="RClxM+dA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazhn15010019.outbound.protection.outlook.com [52.102.139.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCED10E61B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 15:14:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxTXy63HwnYdPdX6Y1URUXyeB/jmyO5hrzv7tJ+XPlSIkLX0iFtLF0UlN1ntcRWPzWF7Sn35aFpFMeLu1gOJvXw4yuHoBH8xa5rr07d+ixQq6dgOoeOC6fgSPKN3aUM9lzIVHQdj5W9WnmGvxZI58GgFayIw4Oqe3naH1ad/HXcfzk1/IXPUQBwcFd7eY0DPs6hGfGQ7hduGwfKfSV7eilj1UOtkWheQOXozlJgwkhZMjgue6wR/8w/DA+Xz9L0XX5dW/kH9LC7rFQT1a3PdX1NSiIHeYM2nm04d13TtqOoP0gM3KpdOz9s+VXWS2Eqqlsqyv0mBUFlQNaFUqBM1RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EI0ap5drBb+X8ra4oZd0BI/qUNDGX3/8t5M0DOvQOn0=;
 b=ZYdeJEhXaCDsR+5zOSEntFMZXxaDlfW0l8Sy8UGXpTS9BkuMN02Pc/eq9X+Ymk1LcZqDBVXOHJ3WrB9Ta0pDEzPTRq25OjysT0XeUgnvcg7/t8/FqUrc1ZwJpqKK/BNBZZzUc5gkwEitdB0593Ast+N2/hrU1J9J2kTdVEQbWeUgpnJz7FjVW4aw5rWOEb94ZdwfuIi/XvEx2GUuGQVVlDWSDlvBRmVsnsKoON8keBjRlVvpsSz43RaolAoGZ+1k+3AFge8zWD+d3XNuRi+apRDScueg0j3MnaE/MAesdoPRcA6jD5rzzwmI6jHTvhEBbVysmRuPQwkr1SdALJcX9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EI0ap5drBb+X8ra4oZd0BI/qUNDGX3/8t5M0DOvQOn0=;
 b=RClxM+dAJEIJZXOhtKf5WlQUdZlU9NuFde0U8QAp7XFK1oJBUmQb0VxT9PSCWikzzTRwdC/HgGJZlWU0Cj5Div4dm+Z7vU5Q9QY6C/orKEYkLB8QEc2x9KxvB1N0e2VvltinNeyYnNPjpu8LVcX1McVM8MRCtaZ6Q8Tw2Ul4sHw=
Received: from SJ0PR03CA0298.namprd03.prod.outlook.com (2603:10b6:a03:39e::33)
 by SJ0PR10MB6422.namprd10.prod.outlook.com (2603:10b6:a03:44c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 15:14:30 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::5a) by SJ0PR03CA0298.outlook.office365.com
 (2603:10b6:a03:39e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 15:14:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 15:14:30 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Nov
 2025 09:14:28 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Nov
 2025 09:14:28 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 4 Nov 2025 09:14:28 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A4FENHa2142428;
 Tue, 4 Nov 2025 09:14:23 -0600
From: Swamil Jain <s-jain1@ti.com>
To: <aradhya.bhatia@linux.dev>, <devarsht@ti.com>, <mripard@kernel.org>,
 <tomi.valkeinen@ideasonboard.com>, <jyri.sarha@iki.fi>,
 <maarten.lankhorst@linux.intel.com>, <simona@ffwll.ch>, <airlied@gmail.com>,
 <tzimmermann@suse.de>, <h-shenoy@ti.com>
CC: <praneeth@ti.com>, <u-kumar1@ti.com>, <vigneshr@ti.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <s-jain1@ti.com>
Subject: [PATCH v8 0/2] Decouple max/min_pclk_khz check from constant display
Date: Tue, 4 Nov 2025 20:44:20 +0530
Message-ID: <20251104151422.307162-1-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|SJ0PR10MB6422:EE_
X-MS-Office365-Filtering-Correlation-Id: fa6bbf67-f0f1-4998-228e-08de1bb4da74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|1800799024|36860700013|34020700016|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YAN7OZHUc5z1wBIwvmV8/FfL9IAO787X16Oud4YFWTvFM99yeC1ZYBYzqXbQ?=
 =?us-ascii?Q?n2bKIz7hhH8eG4/tJAtf6ohd/mbyDVxmRVuusIQ7ZABxDhAquZ/S1q46HRlw?=
 =?us-ascii?Q?B3Vpr12vQ2wC53u9PIdsedO/96lLmmSyWiSgwuOHGnKHPuB5qESNUkt3bvoK?=
 =?us-ascii?Q?xCAtuclp7HeGZQrcYWhGTsI1El0c+SnzFeve56ILMwmQ8L9h/O/xFwI/zrX8?=
 =?us-ascii?Q?wYsIOksaW2fGAJguCAEYdhSRMutM1drF+dBOBRl6bmaFEo0e8kIvvq2GDEz2?=
 =?us-ascii?Q?yZNhINsMIpRotBD0X8ZrKNMg7eusWi4wQD+NYeW79tJTb0bqysOVeGAfdVIA?=
 =?us-ascii?Q?6pOYG89igscDyGNiaCRxXuIhrwN9Y31or/tTZo+EeYX5fAhb0r3MLZL+p1ab?=
 =?us-ascii?Q?11rvJmAmYF/X79FpaDdYppv0TpEn8dw+9iaQuutGuV4swLwZgINk99l42IAV?=
 =?us-ascii?Q?vu51tWqiV6TuB0H1r62phZ7D0JrmzQQ3Jl8PgAwF3huBKb1v8vFgO48xDjUd?=
 =?us-ascii?Q?xlCRhrIcYE0ZEv0Fx6J0kIDpehlM9jl4lyQmjNKmUirDM3SjXcN4SPijZBwn?=
 =?us-ascii?Q?RZdyUI9gIqf0YGdUkC4RSZ6RErbMOv8aEKk+DGD7pAq8VrqQjWRtyMBnKnaD?=
 =?us-ascii?Q?Z7TQN8jHZ++5G9dX1m9pFrDpqXq3kMDBvH15hMOM2mhGluMAPrP5SWz6PsA/?=
 =?us-ascii?Q?1CU1LRnrjJQxNmmlov14rxu+9mKOPOAxs70YTUKoULb8HdeOKf4H8n/LvMKH?=
 =?us-ascii?Q?vXQ5+5VPzJpPT1WHaEx3X4Qn735kMCGGd3bes44t9D4kFgo0x3FRseEpBK3J?=
 =?us-ascii?Q?LKzCFJMvKw2Bho/R8OqdFxNKPWAPfdcBpH7W7FoUB4ySFqGz8oZAvlO8z5GN?=
 =?us-ascii?Q?qrwi1zorUTPY236NrBEm80szEULmsypQRW2QsVQ2RrbYTfb7XhD7cS59X6Xw?=
 =?us-ascii?Q?s9/xcLwyQZtWOjuWAOhpnq2yyn+uPupFDDM6r9Hq9nFE3itxeDLTbQwMcwuO?=
 =?us-ascii?Q?3f4cXP6ZB7JqySeiG4wkNQ/iAaoYDIUZ4IplinRlm9dc8ZxNQtb5rQybqjsq?=
 =?us-ascii?Q?Mk//ghjlj4Gk0Dg/nkMmUQ9zx3t6DTT1/t5LaMKia2QjuihcthQDfk7CiE2h?=
 =?us-ascii?Q?MtfaKkIt0m7ogzJBslElPq4mtB+1YjTkZDN98KLwG16ZarO4L/+kPvwMAOU9?=
 =?us-ascii?Q?Qbjj8vQONLAUO75sgL8N7Tes0kHAaFGM5euCEzqzjcA8BMDve4o91h3OpAit?=
 =?us-ascii?Q?A9sYzck11uzwa/hurJcyDy4GvOhY8s8r/8S6mYo0pfxRzh64zmOi3a4x6nJU?=
 =?us-ascii?Q?K1OHXucw6xNkWWIB/oljcOFEhLG9AI/o3XZ+aN4K61QLb3xHc7x06VKLXJ8b?=
 =?us-ascii?Q?RtjpfK/+3tBpDzaCnax8dRSdel8BVF0WZRrUwMyUuGJm18gea2udY1ROKGcD?=
 =?us-ascii?Q?yHBO9FsQY2fu/xoDQ3EAMorvnQ7b9ssrdNB4mqjaNw8Ts79Zu/vk0reZn14b?=
 =?us-ascii?Q?oQqvYw3CeAJU6+03ahJztt/CO1XzCmFhz6xXReQI3zZpbU1duZBX/D3BlW0B?=
 =?us-ascii?Q?rb3Uym6T11Y7tJdHRT6p64HouWuJksLHGbxKsHKM?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013)(34020700016)(921020)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 15:14:30.5246 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6bbf67-f0f1-4998-228e-08de1bb4da74
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6422
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

In an effort to make the existing compatibles more usable, we are
removing the max/min_pclk_khz form dispc_features structure and doing
the supported pixel clock checks using clk_round_rate().

Changes are fully backwards compatible.

- Remove max/min_pclk_khz and use clk_round_rate to validate modes
- Skip OLDI mode validate through dispc_vp_mode_valid and add
  mode_valid hook to validate modes for OLDI bridge in tidss_oldi.c

---
Changelog v7->v8
- Add commit message in PATCH 2/2 to explain the need of skipping
  check_pixel_clock() for VP's having external clocking
- Make check_pixel_clock() inline
- Add newline for code readability
- Pick up R-by tag

v7 patch link:
https://lore.kernel.org/all/20251028033958.369100-1-s-jain1@ti.com/

Changelog v6->v7
- Remove both max/min_pclk_khz as suggested by Tomi
- Use mode_valid() instead of atomic_check()
- Squash patches v6 PATCH 1/3 and PATCH 3/3 which is a fix to OLDI
  series[1]
- Minor fixes in commit message
- Update commit message to include more reasoning to add Fixes tag to
  Patch v7 2/2

[1]: https://lore.kernel.org/all/20250528122544.817829-1-aradhya.bhatia@linux.dev/

v6 patch link:
https://lore.kernel.org/all/20250911110715.2873596-1-s-jain1@ti.com/

Changelog v5->v6
- Drop caching logic
- Add comments for tolerance value
  (We are targeting another series for reducing tolerance value)
- Minor fixes in commit message

v5 patch link:
https://lore.kernel.org/all/20250819192113.2420396-1-s-jain1@ti.com/

Changelog v4->v5
- Rename is_oldi_vp[] to is_ext_vp_clk[]
- Store both pixel clock round_rate and attempted_rate to reduce
  clk_round_rate() calls while validating modes
- Code changes suggested by Tomi[2]
- Minor fixes in comments and commit message

[2]: https://lore.kernel.org/all/8cd9d1c4-2e9f-4766-b224-21925c4f991d@ideasonboard.com/

v4 patch link:
https://lore.kernel.org/all/20250704094851.182131-1-j-choudhary@ti.com/

Changelog v3->v4:
- Minor cosmetic fixes in code, comments and commit message
- Pick up R-by and add Fixes tag

v3 patch link:
https://lore.kernel.org/all/20250701095541.190422-1-j-choudhary@ti.com/

Changelog v2->v3:
- Add changes for OLDI
- Rename max_pclk as it is misleading
- Change commit message to make it more appropriate
- Drop unnecessary zero initialization

v2 patch link:
https://lore.kernel.org/all/20250618100509.20386-1-j-choudhary@ti.com/

Changelog v1->v2:
- Rebase it on linux-next after OLDI support series as all of its
  patches are reviewed and tested and it touches one of the functions
  used.
  
v1 patch link:
https://lore.kernel.org/all/20250618075804.139844-1-j-choudhary@ti.com/

---

Jayesh Choudhary (2):
  drm/tidss: Remove max_pclk_khz and min_pclk_khz from tidss display
    features
  drm/tidss: Move OLDI mode validation to OLDI bridge mode_valid hook

 drivers/gpu/drm/tidss/tidss_dispc.c | 93 ++++++++++++-----------------
 drivers/gpu/drm/tidss/tidss_dispc.h |  3 -
 drivers/gpu/drm/tidss/tidss_drv.h   |  2 +
 drivers/gpu/drm/tidss/tidss_oldi.c  | 22 +++++++
 4 files changed, 62 insertions(+), 58 deletions(-)

