Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F5EC1E413
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:48:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24EA10E8EF;
	Thu, 30 Oct 2025 03:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5j5Awwkw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013054.outbound.protection.outlook.com
 [40.107.201.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B1410E8E1;
 Thu, 30 Oct 2025 03:47:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqW7OdgolFblNaseQk1yNuntiLRejrP+QOqbeeLr8NKgCoJrlns+9odR3luiOiZVaHFNKxyE87MSgXFWqxkz3RhAu6Yq5TNWB3vTz1LSnwNFVzconVqWlhA3XIglFTaSUeR8ITXP72IzlHQZNvP+xjk2xxiiSdGZUH4tfhtLujQDkvdiDACOWwRf+tfTRpIB8m219ahNeu7B3An2WEGooIyk9ldkQcCA6ZV5iwfRHqK6VgfuIWERMy5pwOcZLch/EIYbxqYAKs3hIwbMDhkGQ+32JwK7eFNI31oRyqBY0sRN6SMgGkuLtStyFaptwXQOd3HCQDYF8WKUpYLhjcSnnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33wecZ3kUikF1jyZ/6ISJ/nY9vgLLzL5Qt3ebWd8Pfc=;
 b=LDIB2EdTZCl3sfUNr9O8YlyqfjXzbdiPRh5bm4W9zud0G71OqHtMz96i2EaiAsgD521y7dIUDJfFO3qS2eVDEdWHs8mMNL7dLk3+A2tXUQEA25BXls9rEJYAilTsbJpPcBwpb1SYzy5bKS22bL4YGr6EkBcVTl9N2949W7sMzn2Q49YpyDy7sHYWl0QixbqWiELhqk7p2MEHymFqlyzKYYx4YRd3CXXWKqE/XcF/MdVHx+8adZFElaGnXydZxhzYJ0GpKCdeqyATnBQrsvbwQLLAJ1YBJ3u6NRamzy23icrNcWQgcA3bOU1FSUMvWG5mreAIp7LRN+VCFIc9dQTOTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33wecZ3kUikF1jyZ/6ISJ/nY9vgLLzL5Qt3ebWd8Pfc=;
 b=5j5AwwkwleIwpv+ohHG0chJZjzzQuBqD1KFeXyEdwshxHy6DQo3RBZNi+d21mZN8Wk1Sd3+g/k6AADMeyl3n5dXJGrI1DrY8fduw9tYB2GRq9COEtymqImzllv7ddAREW4sF9GPB2eL+kvc1UpsRtlXmfDT/lOBodV6fZp31S8I=
Received: from BN9PR03CA0773.namprd03.prod.outlook.com (2603:10b6:408:13a::28)
 by LV3PR12MB9143.namprd12.prod.outlook.com (2603:10b6:408:19e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Thu, 30 Oct
 2025 03:47:55 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:13a:cafe::73) by BN9PR03CA0773.outlook.office365.com
 (2603:10b6:408:13a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Thu,
 30 Oct 2025 03:47:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:47:55 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:47:48 -0700
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>, <leo.liu@amd.com>, <ville.syrjala@linux.intel.com>,
 <pekka.paalanen@collabora.com>, <contact@emersion.fr>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <sebastian.wick@redhat.com>, <shashank.sharma@amd.com>,
 <agoins@nvidia.com>, <joshua@froggi.es>, <mdaenzer@redhat.com>,
 <aleixpol@kde.org>, <xaver.hugl@gmail.com>, <victoria@system76.com>,
 <daniel@ffwll.ch>, <uma.shankar@intel.com>, <quic_naseer@quicinc.com>,
 <quic_cbraga@quicinc.com>, <quic_abhinavk@quicinc.com>, <marcan@marcan.st>,
 <Liviu.Dudau@arm.com>, <sashamcintosh@google.com>,
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>,
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH V12 13/49] drm/colorop: Add destroy functions for color
 pipeline
Date: Wed, 29 Oct 2025 21:42:18 -0600
Message-ID: <20251030034349.2309829-14-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030034349.2309829-1-alex.hung@amd.com>
References: <20251030034349.2309829-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|LV3PR12MB9143:EE_
X-MS-Office365-Filtering-Correlation-Id: 34f9063a-71fb-40c8-24b6-08de17671c5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDNwdU5aYzhGRkhaR3lPUFdLTmZ2dXZqbzhKcERad01EWnV5UTZyQlNwKzVF?=
 =?utf-8?B?cSttSFpLY2pXYy92S2NtVlk5dWVCTU94b0V1SWh5UWVGOWh1MlFkUkZLTUVL?=
 =?utf-8?B?Nm9PZ1UyOHU4eW9PaVFkZUxqQ2laT0hndWNzZEl0b2VUT1dxWnZ6QWZRZkV2?=
 =?utf-8?B?Q1cweksrd2lwYUQzZ3lFcGJFbW04QmFVNXY1QVh5WHRwSFpKNlNNLzhHc3JD?=
 =?utf-8?B?YThXbW9pVHpuYjgycmhyVWhZaDRjZldkZEZuc21WTWk4Q2pWV243dXM0REg4?=
 =?utf-8?B?Z0pDLzBhOXF0aEpYeFlCSjBpMUNhL2Uwd2dxTys1dU9WQWRCN0xVR3dFV2Jo?=
 =?utf-8?B?QUNFbEpKc2NVTEE4RWluak4xRFNPR1ZaeUl1QnZWZ3NiN2hqaDB6dmI4Y2hq?=
 =?utf-8?B?MXNUbGFtUEpaeXBPUUlWSTV1ZkxCWlA2dlR5YjlKcmQyekFaR1NrR1BFQTQw?=
 =?utf-8?B?L3EySDBIWHdRYlEzTWJHOWR2V0p5RUE3b1haYWFDSWYvSVczcDZCQmt0YjFH?=
 =?utf-8?B?UVltRTF3NWppYWIvNDlRbHp0VnF2WEJxbVJ1YytDV1VaTXROT2NtNTl6QVRE?=
 =?utf-8?B?T0dreXI1VTlSL2RqYzZBb3locXF5eWN6cWtXMGozWHlsb1A3azNhVE5pV2Q0?=
 =?utf-8?B?NDNDSGZnUHlEbTQvL3dFUVlzakx4VmtRUkdScWdRZWtYVDFxTzdYM3JLeFRY?=
 =?utf-8?B?NVp1RGRsWlhWbEdFSFhlcXdpSG1EZ2IvL0liclBrVHhYMDlhNFVGTmZCbE9U?=
 =?utf-8?B?aEZtYlNpeXoxekdWajJtSjRzMDBmSkhXRkJ4aStYdTVqbkxFcSt3bTZoSEMr?=
 =?utf-8?B?MDBsdThpeTViTFJBYTQxTUZkQmFIREdwYlJQR2hXTzJ5U3h5K1BiVUJCZGJj?=
 =?utf-8?B?K1RUVHNqSFZXMlV6M25vRy82cXVmdm9mVDh6VDZFbWIrckR3Qkx1R3R0RU85?=
 =?utf-8?B?NUZycXlGLy9wWVJyYjZFNE9rSmMxWjkxWEZJSjc1b04xaS80eDJTV0JLQTdD?=
 =?utf-8?B?S05rdmhTS3V2VG9HbnhqSWlYRTlQc08xNEF1dFNwbEZIWktsbllIUVdwNzFV?=
 =?utf-8?B?UHhrZzNaR3V0L0N4TU1CY2srdFJ3ZGVxOUFvbWdEWStvNTdzeEpXckxZeG1J?=
 =?utf-8?B?WU0zWi94ZTg2SDVGVUVNYVYxNmY1ZlpjNHFuTmFBTGJmcmE3RGllK1U0aGpt?=
 =?utf-8?B?cVc3dFRsdnRMWGpnWXIxcS9LY0FPOFdrK29PUE5mUjlIS1V3UFNDVXlhTW55?=
 =?utf-8?B?bDV1MjJQUXBHeXl0MGQ1NUNSYXRnTC9FUmVITm92UGk2RVZZMmcyT2VMdTdm?=
 =?utf-8?B?ODNSSmRmS0swQmJXSkUxVEJ5ellkR2huTU9IQ1c5M0lKNHJPTUJGTkVLZ0ZU?=
 =?utf-8?B?T09vMmRoT0R1NVFaamRBOHB2bjBkd2VnZWVSdXpGdkRqbHJXeHNEenN4TmRq?=
 =?utf-8?B?Mm15R3RUY0VSbWQ3YWZzS3lLUW5JdTV4citudmhZSGhJNGhwTXgvY3hwNWlw?=
 =?utf-8?B?VkJ0Z0V6aklBQkNlM2FPc0o5Q2pBWUtvaExCTHB1UTJ5N0hPWXFVVjR4V1hp?=
 =?utf-8?B?Rjd0dXFuZTdheGU4VHgyalhLVEVxRlpPNUhWQTNNandWZ295bFcrTFdYQXA0?=
 =?utf-8?B?MDdMWHdJMGZ0NGo1bjZscmFITk5YSlFyUFpqNFBsM201TlNhdXJOZm95Yld4?=
 =?utf-8?B?eVNVNG9FWndmd3cyd1VGcjFoYUxhMEVVMXpzWnJTczhhWkRqenNDNEp5ZWV0?=
 =?utf-8?B?SlVUQkM4QUFiNTJCcEFEUUJaekFNZlVQWnNjZ2VmQXloTVhyR2dPWGhoNVB2?=
 =?utf-8?B?TUpFOGhxUWNXbkJqTDZkbjNvOTlIY1BUTXNCYWFLM2lDaDB5RVJwWU13a0hu?=
 =?utf-8?B?NGdjNERKSUxzQnZUUE9VTEhuWWNIZ0xjSWxoYjBhSEJlRlI3REtTaDFWMHM4?=
 =?utf-8?B?TTZES09HcklaWjNLQmpHNUg4cjFMalYzU1ZncEF5alYvamd4Zk1yWjFVUGxL?=
 =?utf-8?B?c0ZCQWljUnljbGRnNEZIZ3JlU0tQZXNWcXBTQzdPVTJVL0FObWVIYXEzbEpq?=
 =?utf-8?B?N3dKV3NBYU14RWtTVldHMHVmeDEvOGcyWVhUL0V6Q1J5cFljdUdOc3QxOUFO?=
 =?utf-8?Q?E0LQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:47:55.7506 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f9063a-71fb-40c8-24b6-08de17671c5a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9143
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

The functions are to clean up color pipeline when a device driver
fails to create its color pipeline.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
---
v12:
 - drm_colorop_cleanup is no longer static (Nícolas Prado)

v11:
 - destroy function takes drm_device *dev instead of drm_plane *plane
   (Nícolas Prado)

v9:
 - Move from from latest commit to here, and drm_colorop_pipeline_destroy
   is called in respective commits.

 drivers/gpu/drm/drm_colorop.c | 36 +++++++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h     |  3 +++
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 7b3ecf7ddd11..182468eb2897 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -135,6 +135,42 @@ static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *co
 	return ret;
 }
 
+/**
+ * drm_colorop_cleanup - Cleanup a drm_colorop object in color_pipeline
+ *
+ * @colorop: The drm_colorop object to be cleaned
+ */
+void drm_colorop_cleanup(struct drm_colorop *colorop)
+{
+	struct drm_device *dev = colorop->dev;
+	struct drm_mode_config *config = &dev->mode_config;
+
+	list_del(&colorop->head);
+	config->num_colorop--;
+
+	kfree(colorop->state);
+}
+EXPORT_SYMBOL(drm_colorop_cleanup);
+
+/**
+ * drm_colorop_pipeline_destroy - Helper for color pipeline destruction
+ *
+ * @dev: - The drm_device containing the drm_planes with the color_pipelines
+ *
+ * Provides a default color pipeline destroy handler for drm_device.
+ */
+void drm_colorop_pipeline_destroy(struct drm_device *dev)
+{
+	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_colorop *colorop, *next;
+
+	list_for_each_entry_safe(colorop, next, &config->colorop_list, head) {
+		drm_colorop_cleanup(colorop);
+		kfree(colorop);
+	}
+}
+EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
+
 /**
  * drm_plane_colorop_curve_1d_init - Initialize a DRM_COLOROP_1D_CURVE
  *
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 791ab940c158..2c6b761fd182 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -239,6 +239,9 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 	return mo ? obj_to_colorop(mo) : NULL;
 }
 
+void drm_colorop_pipeline_destroy(struct drm_device *dev);
+void drm_colorop_cleanup(struct drm_colorop *colorop);
+
 int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 				    struct drm_plane *plane, u64 supported_tfs);
 
-- 
2.43.0

