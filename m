Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DEE9A3FC1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 15:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E87C10E92C;
	Fri, 18 Oct 2024 13:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NKj+3305";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09A910E91D;
 Fri, 18 Oct 2024 13:33:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yhrRYxq7A09bm7SGnQ7s6qlJnn5WdQW2qxj1/mqHjU+ae7B3FKRW1aCNgyaKXire9uGjkYFwx/HkZ3obqlMix+cq4yw5PAVR4Oo244N18FwNFwSKMgEq2CZTgtBWgUE1c6SweY/LkBkMaAFhN3a5hjHUwywyP/EAZypWRS6FLG+fvd7qQD9nGEb+sdz1T+pSYgaRkw8b9/3nF8cw9I2noJ1yKxBFudox8dHTrJu5B6VMn1eRUrKszfHf5LZ3v0h0eq9goV4bExwf1H5Nf9A/qXjZRE9aXtT9ns3nkpUOt2AGZKznWzPxmY3hG2Y3SaXp+pcHLqOZJiNQRVPrcIly8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ekkHb51M+zTWLb7MQ36UCtqa0BX/ZSr7+X480rFhLM=;
 b=DPbtQlfFmB+VjJt1TM2YQ/d1x5So9gkRNU4NQczoMDMJhjB8WPzyBq0GB6i+KEDAEEec59xi3NuiMoiqTqcmqiKbTBg3K2SsyJBzo9r8Av1wzAQkG/Ms80iWsd1J5wj3jBvB9tbEz/XG1stMAzAu9xRFxW8JdKTFdJGOkLZGOqRjNlSF3mDJL8jfhrgfNQQP9qBNpfVIRDvNb4lxOc012nGescLKVazVTkEpQ9Z5TnmLlUKf8BW49PVF7swybWVF6/0OJKlndXr241UISFfj7XEc8J3TRmHUCPXypE7tdP8R8S5jWzSQtCkSzrd5t2kfA2giyVPPfzSEL1mgx3eH1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ekkHb51M+zTWLb7MQ36UCtqa0BX/ZSr7+X480rFhLM=;
 b=NKj+33051tKNdfiB7YXI/gikv08d5ePuTy9721BhCi7E8x1RzTuvvnbBwpM7OZoJbfSv/DGS5hjuX7AIdImnVjyeXmZhlOPe2w2v7nbrQSYcFiPEl3cT0ZLosNmdAXmE1fWOZi+wvzkeo4KBRGuUKyi+3XvNbH7TI9K7U0uIy1c=
Received: from BLAPR05CA0041.namprd05.prod.outlook.com (2603:10b6:208:335::24)
 by SJ2PR12MB8926.namprd12.prod.outlook.com (2603:10b6:a03:53b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 13:33:51 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:208:335:cafe::21) by BLAPR05CA0041.outlook.office365.com
 (2603:10b6:208:335::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.10 via Frontend
 Transport; Fri, 18 Oct 2024 13:33:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Fri, 18 Oct 2024 13:33:50 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Oct
 2024 08:33:48 -0500
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, <christian.koenig@amd.com>,
 <tvrtko.ursulin@igalia.com>, Yunxiang Li <Yunxiang.Li@amd.com>
Subject: [PATCH v5 2/4] drm/amdgpu: make drm-memory-* report resident memory
Date: Fri, 18 Oct 2024 09:33:06 -0400
Message-ID: <20241018133308.889-3-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241018133308.889-1-Yunxiang.Li@amd.com>
References: <20241018133308.889-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|SJ2PR12MB8926:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c0d4b0a-8c56-46d0-5169-08dcef79809d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ih7I1pwL4L+su5sAOanzZMmJimu/+olwaswNjm5F0NQtTc9QdJrplpU1izYR?=
 =?us-ascii?Q?KXbJ1X/LJrThLwuWWuMj0qP86Zhsv7RnbfxuM/kEAQFCB5X5bAmlNFaLHfpX?=
 =?us-ascii?Q?E9l+Z9hvktpcRDaC7zdYYQYMFwTHd2lYSBCDPNTw4c91/EIN2OgLeiU33Uuz?=
 =?us-ascii?Q?p+W54aWGNccGCkzOZtnUa5bt0xxxbV1OUqN6XY7QbVOnqZQ5jSj61tXIwatM?=
 =?us-ascii?Q?GtIJ7qzOIm+LXuGOqcEn+yYGpZYLQRrJFdpvNeb9Iqo0Zod0UPo41kB8er55?=
 =?us-ascii?Q?ckypOSIvJG7b1XAkefPzokovJbjaBkvpwHpDMYZm3V042ahUXhYC62B8wU3m?=
 =?us-ascii?Q?3WrHpwkAFnIDzvNVub3W0nTefmj+4UxXbYW+CeecIqrJ1UO86e7P14pf1nNM?=
 =?us-ascii?Q?WdJHIjvT9uJ639f4m9QJ2bVkZleR9/dG9XJjYnwF9epl7CzTNuno1LXIftB9?=
 =?us-ascii?Q?jzXZJ+fA0m3wUuQphCnJl/35Q1SbBg4gcjt/9EoAwvZkZVun39EOd7+uroOP?=
 =?us-ascii?Q?HP0txo9EMOkDjI7BCE83lrCSsEscwyX4HecY42JPw4pqqJtIfnuRIMgb0vF2?=
 =?us-ascii?Q?aZ/9BJO8Hs0SUSoLbX9oM1arQI+GvVmgOxi8jPOz93cVeluAUh4GHzBn05bS?=
 =?us-ascii?Q?rMuuQebPHw0JFqiZfoKSY5Y0MITKrTF+J5upWvwxJ2D9d4PCrxrizqr1Jd70?=
 =?us-ascii?Q?YNVFagKAoizuJZt2k98tbOE77ldhjl5C4w7URgKB+4xvUaF72PfeSuO3gfg/?=
 =?us-ascii?Q?emubRNvolBrBrnEdKJb+EO6nMIdnVHe5cuEZE0xNijsu9EbtV6oRPYe2XeSa?=
 =?us-ascii?Q?jPAHVlzSEGQh49aR2L9+YOsF+4FDLtbGkyMs93NPkrrGK/lc+ZvOkrXrpArv?=
 =?us-ascii?Q?3+2QLtAL6ZMdon+Xo6mErknbXhGB58g7+vrVpL0Gu7qmgTZORdfudddFJZmj?=
 =?us-ascii?Q?WyV3JCV2YCTg8o5wQOSWc9wfKxaFE9pHAu+ljTNCifQb9hEhjZi9ZCrUbT0Z?=
 =?us-ascii?Q?QfsW/6knoF+QnZsIki0+iCeWYsFuM6WweHw8e3c2yOW60ezwuspBaCb1U86K?=
 =?us-ascii?Q?DIZDngyj8GZI0iQGlr+yoI+OEMlcdRqrfBfv4tt/CW7VRJHuJ9DeDplceh0r?=
 =?us-ascii?Q?ZFO97DFufLuegiBpbQb79B4nCtUr1q+vgbB98E9y0+9u67eeZfbf9BnF6gHb?=
 =?us-ascii?Q?12XmX772pJlBhFu/u/jzW1gHwHdQRWhjDXU6tAsf44Tscw4U3hXmn9Wt4VC1?=
 =?us-ascii?Q?6x/MbPNGn1z5Ywwda55LOyik/Xam0hfjJHT+VpU0oGOoQTjuHAlFI4etq7+K?=
 =?us-ascii?Q?l8vsRAcTkoeCY1hQPRaKKODbkpesc+tEfzX/KCNo366+vYTot16oC6j5JUuG?=
 =?us-ascii?Q?WvB/bpO+ZIokl7T2Bge4w0uWQw3ZJLxSidC9o2TqLEAyqQ5JVQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 13:33:50.7017 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c0d4b0a-8c56-46d0-5169-08dcef79809d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8926
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

The old behavior reports the resident memory usage for this key and the
documentation say so as well. However this was accidentally changed to
include buffers that was evicted.

Fixes: a2529f67e2ed ("drm/amdgpu: Use drm_print_memory_stats helper from fdinfo")
Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c | 7 ++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h | 1 -
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
index 00a4ab082459f..8281dd45faaa0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
@@ -33,6 +33,7 @@
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_file.h>
 
 #include "amdgpu.h"
 #include "amdgpu_vm.h"
@@ -95,11 +96,11 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 
 	/* Legacy amdgpu keys, alias to drm-resident-memory-: */
 	drm_printf(p, "drm-memory-vram:\t%llu KiB\n",
-		   stats[TTM_PL_VRAM].total/1024UL);
+		   stats[TTM_PL_VRAM].drm.resident/1024UL);
 	drm_printf(p, "drm-memory-gtt: \t%llu KiB\n",
-		   stats[TTM_PL_TT].total/1024UL);
+		   stats[TTM_PL_TT].drm.resident/1024UL);
 	drm_printf(p, "drm-memory-cpu: \t%llu KiB\n",
-		   stats[TTM_PL_SYSTEM].total/1024UL);
+		   stats[TTM_PL_SYSTEM].drm.resident/1024UL);
 
 	/* Amdgpu specific memory accounting keys: */
 	drm_printf(p, "amd-memory-visible-vram:\t%llu KiB\n",
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 045222b6bd049..2a53e72f3964f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1223,7 +1223,6 @@ void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
 
 	/* DRM stats common fields: */
 
-	stats[type].total += size;
 	if (drm_gem_object_is_shared_for_memory_stats(obj))
 		stats[type].drm.shared += size;
 	else
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index 7260349917ef0..a5653f474f85c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -142,7 +142,6 @@ struct amdgpu_bo_vm {
 struct amdgpu_mem_stats {
 	struct drm_memory_stats drm;
 
-	uint64_t total;
 	uint64_t visible;
 	uint64_t evicted;
 	uint64_t evicted_visible;
-- 
2.34.1

