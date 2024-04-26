Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFDC8B2E11
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 02:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7EE10F8CB;
	Fri, 26 Apr 2024 00:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2HX3Sj3W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2071.outbound.protection.outlook.com [40.107.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7B510F8CB
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 00:35:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amcgq9VpUZ8jDbUVJk9Jsf/CGhq1MhVvJFmrqxcbrdmpSQbfLixKLNo66Az/jYn5/aGxTU61M7Y/tmH9vsZD3ca2PuhkTMQOFzg16CGZKPdMe/1ny4ExS6J2i0KN+BaHUIdh9W73MUSOLGhyB4RglSg7+42/dGNLAci3BnskO11GA+C8EyptcRZu6dAKBTVqMmkRuibMod0emCktdjI6vQdsbXHj6GICo+C8iLEyywiV+A8p1sJqfL/f1kDKj57z3z/q4vmEw/XFbYHwhm65pqRd0AweAZlms0yC+kqAENeV+7/tWpD6urgxOl8X1RR8B7HoLS/pa9MFhVrnec1/mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/U2woOTNOSWWS9dGFsA+3kusVaf9XIhvNg5tnwM4y4=;
 b=d0atXFJ2vbAjvdj4eCAfRL1VyGkg7FHmXE83Iz7OKGrh9ddVY/Y//mFSaGXvVmqRt6hj4Gy5OH2SK7FtZTfhkFp8pT2uiFH8Y0foWn7n9D6FpcUd1PebEq74j+3KPkl34igCY2rZ7EmzGaazCtbEz33cRLHtUkqw+bzubaBTEtEmSKUTE9VF6rL2xgJNNRwNteyRIDlwgL9H1fsCJ3I6KH03wfdm7Rc5sQhitLGetI9lfOzjT8JzGmDQwLYG9qn0SPR8FXo1Fui9ywJHfVEZAsxFah0lFIW7xwDERGyyFgkhpuQS7kbCfdKBMqSmLKSZFMyildpd0B0uR4vtonnDxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/U2woOTNOSWWS9dGFsA+3kusVaf9XIhvNg5tnwM4y4=;
 b=2HX3Sj3WxnqGGTTOy+xynJaHHhNkgq4W209mM1iLpWUDwANUKhnw4HzWug4EOr1EyHUCl1nqGRBXmxajWop+1THFOCqPSDtjgymySQ7qjg9EyyfXg3UNQaQmBU6NO9kXGeI7tS1J5kWWAwfG6smmRoCaH79vMCZfvSmNSIeJKbY=
Received: from CH2PR11CA0028.namprd11.prod.outlook.com (2603:10b6:610:54::38)
 by BL3PR12MB6596.namprd12.prod.outlook.com (2603:10b6:208:38f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.49; Fri, 26 Apr
 2024 00:35:16 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::db) by CH2PR11CA0028.outlook.office365.com
 (2603:10b6:610:54::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.29 via Frontend
 Transport; Fri, 26 Apr 2024 00:35:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Fri, 26 Apr 2024 00:35:15 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 19:35:15 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 19:35:15 -0500
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Thu, 25 Apr 2024 19:35:14 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Date: Thu, 25 Apr 2024 17:35:08 -0700
Subject: [PATCH] drm: xlnx: zynqmp_dpsub: Fix few function comments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240425-dp-live-fmt-fix-v1-1-405f352d3485@amd.com>
X-B4-Tracking: v=1; b=H4sIALv2KmYC/x2MWwqAIBAAryL73YKZFnWV6KNyrYVeaEQg3j3pc
 wZmIgTyTAE6EcHTw4HPI0NZCJjX8VgI2WYGJZWWWhm0F278ELr9RscvjqWcXNM2lWlryNXlKev
 /2A8pfXj0VFJhAAAA
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Michal Simek <michal.simek@amd.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>,
 "Anatoliy Klymenko" <anatoliy.klymenko@amd.com>
X-Mailer: b4 0.13.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|BL3PR12MB6596:EE_
X-MS-Office365-Filtering-Correlation-Id: 30294092-fb74-4b1d-0ef1-08dc6588be1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sm03Ym1SekxTOG45QmZvMUovT0NZckp5dDFQTGtjK0JmR3lVdG1Eak9kSUdH?=
 =?utf-8?B?eHBySzIrUXVNWWR0aHNwd01FVklpMVlTQ3k3czJIVWNkaGFQbXdkbHNXZFJo?=
 =?utf-8?B?OHVZVmx3TkNJSnZiVk5hZmtFSURZY0M1d3JXL0Fqek5ESzFvOXBXY0RPNHN2?=
 =?utf-8?B?SmRwVUNJdlJQZ1o4WFJWbWVBVXAxODJVSW12L0NWdlFJTEJqWDBrKzZlcUV2?=
 =?utf-8?B?Q215NU1oWDc3dVNjbHpETE9NbHk3RUlENVd1SHJFYW1abU9SYkVJQnAxTlFJ?=
 =?utf-8?B?NnJQSHdaV3Nkc0VlK0lvSVZDTUQ2dk5xcWhmSUNYZ1NsREg5QkxwNGNZR085?=
 =?utf-8?B?Zkg4eFZ5VGpLSS9sQ3NCeVNzVXVVZzVqZVFveFNIZzNkRXRVWHB1MVc2S0R4?=
 =?utf-8?B?KzZBaUtQK2RjelhDUzk4QjZHYUwxQVpIUFFNdHNLNFNkQitqNW9aZmZlRmhC?=
 =?utf-8?B?N3RBQjlaaXVYaERXcFBoQXFURjhUT1R3Wm1IeUxXdmFJdElYT3A5UWJuaDIy?=
 =?utf-8?B?djFGa1puN0RLb2dWL2E5cG9IWE1qbGVFSERCOC8wM0NzTHA0SmlCa0FhM2Mv?=
 =?utf-8?B?SVJnck1lZ3l5S3gvWmVuUFU2bWI2RE93WWsrTUdpVWQwd1JVaGllUjZ3eXRW?=
 =?utf-8?B?eVI2MDY1M3hCR0krbXhMZ2U1azFoeWtWajNoOUZZV0E3UThwMmtPck5JUDIr?=
 =?utf-8?B?amxhcWlOREFiRFRMMFp4Wmoyb0dGbFh2YWF6UlFqSk10bVNYdkpmcHJIbXRu?=
 =?utf-8?B?MVhmK1Zhcmp0dndxcXFmRWQ1NThhRklTaTQyTDh3Wll2Z29ndnBubEQyUDRH?=
 =?utf-8?B?ZXUzMDJuQkZGUmc2Z0d0YzRFendjZlZTcDZ6VGJ4K0NYV0FLNkxyVTNnMWVz?=
 =?utf-8?B?RWQ0aHd1TjhBa3VNSldMbU9Oc0wva2N1b3YranB1bFpjUzZJMUppcndzUjB6?=
 =?utf-8?B?U3plaEFOR3h2K1IremFUbUx3dW1XWkxEOHRpUVdtZi9uRnRNRUFpUXNkTFk0?=
 =?utf-8?B?UEhMRXRjcTl0dmlWME4wYWJuWXFlTnQxZGgxTHVDbUtaMlIwdDZBb1FOTkZV?=
 =?utf-8?B?VGJoYzNUeUZpaU5YTURjMysweHh1anNOcFpYeVM1M0VaVHp2eExMSU1WMW5X?=
 =?utf-8?B?WEZlaDZRN3Y3NTZNenk0RVc5ZkthM2Fyb0hkaU1rUWc4d2pzTEl5L2VLOUFZ?=
 =?utf-8?B?eWw4WmM3VllJRmtSblFuNmVXK0dSQnZUb1R6LzhxNHdlQWY0NDc3VXIvVWc1?=
 =?utf-8?B?MXZoWSsxRUVKOExuT0NVWnZkaXJ6cWFSMisyYUV2S3VTaFRXcjh4Qit2SFp5?=
 =?utf-8?B?bTNSemxWMFRranZrcU1uZVh4WmJYamQyQlVQWWFTUkR3eWV1V2IzQzhZNzc0?=
 =?utf-8?B?c3FNVlNrSERsbHlBZTRwYmszd3VzeHlwUXNBRTl4NXBTZXBvWjlqQ0llV2JV?=
 =?utf-8?B?TFp6VHprRlladEtON3lIZDZacEtyOWRZT2J6NnUrSFM4STJULzR2b1JaWnJN?=
 =?utf-8?B?T2V5bWZFMi8wNi94QzEvUjVKNjUxK0ZYYnNoMlJHcEZxM2JTeGd0Z3A2bmIx?=
 =?utf-8?B?RjN6ald3ZG1uUThYR1JCa01KRzBySlM1UlRaT1VLdUJYSXdsK3RGNzQ1L1Ra?=
 =?utf-8?B?T3VOb3ZEL3BycHIvOG5KcFhRbnVJalp2ZG11SEtrd2dDenA5UTBxR1dpK2Ny?=
 =?utf-8?B?N1BES1hkYkhYYkhwWmVUZG1tWExWMVlzT3hMTzU2eDVkY0lnenJ4K1B0cWds?=
 =?utf-8?B?aTFTV0JjU2tDdUZsS1BrdHVGbjJZMWRNZGpXb3FwNm1nNTVXVFNSR05DTFNk?=
 =?utf-8?B?TnJCOWNHL1lLR0U0cEpseUUzWG45M2tYWkY3SHNzSlR4VS9KMzBpWGZJU0g3?=
 =?utf-8?Q?iA/MNpgeLUK+r?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(1800799015)(7416005)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 00:35:15.8585 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30294092-fb74-4b1d-0ef1-08dc6588be1e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6596
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

Fix arguments description for zynqmp_disp_layer_find_live_format() and
zynqmp_disp_layer_set_live_format().

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404260616.KFGDpCDN-lkp@intel.com/

Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 13157da0089e..423f5f4943cc 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -940,7 +940,7 @@ zynqmp_disp_layer_find_format(struct zynqmp_disp_layer *layer,
  * zynqmp_disp_layer_find_live_format - Find format information for given
  * media bus format
  * @layer: The layer
- * @drm_fmt: Media bus format to search
+ * @media_bus_format: Media bus format to search
  *
  * Search display subsystem format information corresponding to the given media
  * bus format @media_bus_format for the @layer, and return a pointer to the
@@ -1117,7 +1117,7 @@ void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
 /**
  * zynqmp_disp_layer_set_live_format - Set the live video layer format
  * @layer: The layer
- * @info: The format info
+ * @media_bus_format: Media bus format to set
  *
  * NOTE: This function should not be used to set format for non-live video
  * layer. Use zynqmp_disp_layer_set_format() instead.

---
base-commit: 2bdb481bf7a93c22b9fea8daefa2834aab23a70f
change-id: 20240425-dp-live-fmt-fix-a10bf7973596

Best regards,
-- 
Anatoliy Klymenko <anatoliy.klymenko@amd.com>

