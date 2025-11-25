Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA8BC86108
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 18:00:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31CDE10E553;
	Tue, 25 Nov 2025 17:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="VC9lf38r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011053.outbound.protection.outlook.com [52.101.62.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1071210E553
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 16:59:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWP3KTpyv3XQ+ATFMKT0CFm6h7rMlfGb3feZDMo8xy+vOG3/u8fsKqd0hSZqzPGIGyorU/yXJYu3Vdhw50Q3Db0B9D4tLhZzpLRdGF3sGPUtNZjFElMydi28HP0MrJ1DHyx+mUang9Vjd+loRDPOrcgzuEZs76DhxJ7ElWQe+cmG3NdqO2RQCswJ9npUNSQVA0R78qIStAd8Cma1pu/A2im4Q0CfP5aqXqV4eDc1VCa9E1/+6GOfQW/jeLOIT8/3neXQZh9p5W6RPR++Y1M4ye2xr256cmmUIiicrDQeaRUUCU39ffUXFAgGl1m9YkMhn7wWWAHk8WtGDD64ovsziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXHgeqPdOgYbm+wn3/32J5zIsSivZJ5CH2jUorvlzzQ=;
 b=ZZ59Ahyph04ahNla498Z+12cPelpwbhbxdig047oHqck6BkRXTx7mV6BF2IlslQkX1hnsjt+GweJNGjHxkVwjOI1olh7JFw4KPggQSV4qjirDwA4169BT+7c49SRP1Ea+fCCSeAHpMHpltn8g1lppmptQf+8brnlBltMS4ou3Odqmsy3DyfytoNFsZKhL5xYrJWZW4CbqWhxI2JgvHuGxg6ihE4hO0+yNOEOmpwDTZN5eJqcvOkNb7PiXxgLmI3ZVmjNEEOLXsT31NzbRwtzjMnkLFf7adUTQzyDq3oq+Qswuby3L++Qi0iAZOUazSAHlQd73u+lO1uShA11GP/kAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXHgeqPdOgYbm+wn3/32J5zIsSivZJ5CH2jUorvlzzQ=;
 b=VC9lf38rG2wZAeiK3TrJQL10f5SGdBayDPkWsxYjNRwjlBV+v+TfNj22Vb7dUpYeyx8ELaYr0dYXV0/POasm9P9Axdvu4tyfr/RZNwF1oXQv45p/6xOBZEJO9jcTFyI/E12UBfKHpqdaMjDXMmDA8lsl0nz65IVzYMjVZaxcqXc=
Received: from MN2PR20CA0023.namprd20.prod.outlook.com (2603:10b6:208:e8::36)
 by CH3PR10MB7742.namprd10.prod.outlook.com (2603:10b6:610:1ae::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 16:59:53 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:208:e8:cafe::d7) by MN2PR20CA0023.outlook.office365.com
 (2603:10b6:208:e8::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.18 via Frontend Transport; Tue,
 25 Nov 2025 16:59:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Tue, 25 Nov 2025 16:59:51 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 25 Nov
 2025 10:59:48 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 25 Nov
 2025 10:59:47 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 25 Nov 2025 10:59:47 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5APGxgbR3987080;
 Tue, 25 Nov 2025 10:59:43 -0600
From: Swamil Jain <s-jain1@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aradhya.bhatia@linux.dev>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <praneeth@ti.com>,
 <h-shenoy@ti.com>, <u-kumar1@ti.com>, <s-jain1@ti.com>
Subject: [PATCH v2 0/3] Add Display support for AM62P SoC
Date: Tue, 25 Nov 2025 22:29:39 +0530
Message-ID: <20251125165942.2586341-1-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|CH3PR10MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: 71ce2a7f-757d-40e8-a8b3-08de2c440caf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|7416014|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VGsm6ibU+6lhvweorcFs5sM/rkWbrk5xPGueJAI+KTf5T2yhmk4anU/z86G9?=
 =?us-ascii?Q?lz2TNEXdwZMtG9bfcuQCWERZEPhY0Mcsvtego1mFbyFPVrIuSXYeSfRY/SMZ?=
 =?us-ascii?Q?h3q8InXH59IFFrzDR7iMvNRuRBLuZbnuuCn9m6yPy5ECPokc9UVBcTRh4lWA?=
 =?us-ascii?Q?oJpnBlMq5SLUO807jJ7djWwNShmgE3MoCS3R0QyLDcx3F3ihVNGDxYnPQevA?=
 =?us-ascii?Q?nG0/DknGpLxqS7rlU4GHXx6WCIAbIjNjY1z/4OsfA5KEloFNpe0c7+y+Mcmg?=
 =?us-ascii?Q?1VeXCYuZEIkrFk9Ld3LVg6ReYfIboXHoaqLpHU8q3v0tofN6gDDT50LxPDuG?=
 =?us-ascii?Q?YnB1o8ZuLHNAGEnluJahx4vVvIXZ3xgi/PCS70KEBNuEtakEnX5YaofIQEmm?=
 =?us-ascii?Q?iOKi9cfy+sg2ldrP84HYByLeSEHqIhE8ytGFxJmJzZFMHRHg3XM81iSiEVUp?=
 =?us-ascii?Q?xbqAfoDcOmj2EHhGcfPKnaq6djthL2M02JOE/TO7mSFox9m+0I9LaRzuB24w?=
 =?us-ascii?Q?nEU38PBbNSpQ3EHtWTmbcu0YrdlKrcIFCh8eNPS6nk+5SMt+bogDmX+fy6i9?=
 =?us-ascii?Q?IMsU1tDganjfPpniPjAM7lnzwCHbsSzyDAKdvCyFOOsvMLIiwx7E8pk3l/4n?=
 =?us-ascii?Q?LNYn1F5S37Fr0Bipjmbzx4mZhsuNkElns3RKpJOx+XYdOhP9uuqKUT+Stapw?=
 =?us-ascii?Q?/ZC0KOH2GvSZNH01/7Xpco99w8et8r6YJlpl8jcFYSOgqnACNEm5KUU7acIj?=
 =?us-ascii?Q?byuEES74gvtI3Z8kD1pzeRjUBTuOJZlbixhQb/JRxhsXKf60ABna1Sboo6aW?=
 =?us-ascii?Q?z9PNcKpemmtSexJbJnh8Jmk2/JAozMeGqibYLmScLG04ZOjUsrkxHj2fGpGE?=
 =?us-ascii?Q?ZSks5wA8CUI/AnnYa12MJsjvylctNaAbhmZwp5iGwAFgWF7pN8Fio9sjzDwk?=
 =?us-ascii?Q?OF4kxBqotiQ1w2AK434cLnmv6c6MGcAXtGPPJhekj2w938rZ9Evg8mpYU0V4?=
 =?us-ascii?Q?PSWq1TZHvkIsvkjELOCqpSqZ4fgI+v/oKyI27sgLW+fArsAQCPAOdRWZf3Ro?=
 =?us-ascii?Q?72OHV55gzv2QmGfBJWvZjuAt32Fzf0Jduq+AjwmkuP1Fp8EEd2y8mop919jn?=
 =?us-ascii?Q?hCTUndDzaOTgOrLtRLXTX7ZpU0stjfPIwQ4C2HHg7YXoMYXklPTeOKoQIRGf?=
 =?us-ascii?Q?AczX/H/8i56CpPkGnJzhncT7cAIRAh//myVOVdko+7m+UFgxlK0Xc+n7UVB2?=
 =?us-ascii?Q?T/BzOH/vtunRpSPOf8MJzhNpzznsMq4KTY70CkFWDg2Rc7YCNuOU2zUYo1II?=
 =?us-ascii?Q?9nQzaoDbvr9rmZQIIW7rHlSnlOxhSfTrtl2nZRIYuvmg0OaU6ZMu3PI7yMk6?=
 =?us-ascii?Q?0WBjl2JOh8tszIudpZ8N6Ayvdb4Q1pX34ZBL2QKw+dzF1Vqn7BFZN78Ohsy8?=
 =?us-ascii?Q?N+iwpwjk8+7GezH65G6+ADgxva/6pbmED0yGjy94xqWipn5+419+sRmrIb0G?=
 =?us-ascii?Q?fqOJobSR3/K/FmQFnsTi3mkzt5btqxZNC5STiQZ2SQmVYn6aH3kiqLk84Tz6?=
 =?us-ascii?Q?qakGAEzpb27eSq/LMHQBsA0cooUY6ZcyQ/FJDJut?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 16:59:51.4175 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71ce2a7f-757d-40e8-a8b3-08de2c440caf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7742
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

 .../bindings/display/ti/ti,am65x-dss.yaml     | 25 ++++++
 drivers/gpu/drm/tidss/tidss_drv.c             | 89 ++++++++++++++++++-
 drivers/gpu/drm/tidss/tidss_drv.h             |  4 +
 3 files changed, 115 insertions(+), 3 deletions(-)

