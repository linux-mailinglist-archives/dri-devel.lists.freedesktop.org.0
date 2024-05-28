Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6298D26AD
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 23:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9745710E8D8;
	Tue, 28 May 2024 21:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lKIjxef1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2074.outbound.protection.outlook.com [40.107.212.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0692588DE5;
 Tue, 28 May 2024 21:03:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4/uOwnI+WKu2ZrxKXa/WapuD9ZoXh4KdCDomb5kyPYxfzxcSCm6gI5duJHbfkgPtru6Z0Ew/vf96uyJORd7rgdoEbPLBswxsg4zB7r1IeXjLH1Kv5HJPfhcgCZ8CLd1p7KBNPImW3NZq9b18BagFaIY6Y/nTdl7I62ztwASae2VpRi1w5BmoWAfZZD+0pbQN1ycuXrOYPoloSfAKgyBTdTbeyV+8Np8zFNGvgtZ1URBrDfr/BRHu9TPob0CUcIYcquYGwAJqZI5hKNmj6b9D4wdt34Wdn7rmVVND+j2NLEyVJogrm6HH82P7sXtgD7jn+LcdIlJlrsWa0Ck6Gp3jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrFwAPgvpKPYzfFe7KPvO+P4TVBNHndb1Jvx1pbos6w=;
 b=Lr8nBJyzL6AClT1yYsBy/aep/M/Bj6HkH4GgwvrhzNP++tMB6adSvieNiFuqAe5vFw2ET1kFps62yezSaVIwo+JytMv+M3U/8pgBHI5soNeMh9sjiHHcR9a2MCf1gpnOUWd86dLbJn9k4RLcB829ZUue1EODYkkt8jh78cz0ugwDxqy0oTBYvEVthiF0M5bZoIuoipn7P9F6T7n7lNoY89UsKod8bh26CiU60CzG4hQc9bZw55KQGXhR2lcoxdpfhp+kK6Am9PqaHYjU/w49sa7aIoc8kOt8n7XiwrGBqS9Ez5hkhHwUHP8asC0mtYOVuQwITW8zvp7sekaxZ8onQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrFwAPgvpKPYzfFe7KPvO+P4TVBNHndb1Jvx1pbos6w=;
 b=lKIjxef1t7grUYWW24QZ0o3ehqARq8zT2ovL6xPj85MNUSvzkEva1QWmgcVnKox5Ks0Dzn97RiP/NktxuTctH1bhvckKlQBgPkvTgYCjIAPKHp/lycA8HqFwVblNeXy0xKtKCS/6a3f/g+MgyNNXKw/stQ3ZCHO+G0z6msym8uc=
Received: from DS7PR05CA0050.namprd05.prod.outlook.com (2603:10b6:8:2f::9) by
 CH2PR12MB4103.namprd12.prod.outlook.com (2603:10b6:610:7e::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.30; Tue, 28 May 2024 21:03:30 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:8:2f:cafe::68) by DS7PR05CA0050.outlook.office365.com
 (2603:10b6:8:2f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.18 via Frontend
 Transport; Tue, 28 May 2024 21:03:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 21:03:30 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 28 May
 2024 16:03:29 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <linux-kernel@vger.kernel.org>, Mario Limonciello
 <mario.limonciello@amd.com>, Chris Bainbridge <chris.bainbridge@gmail.com>,
 <hughsient@gmail.com>
Subject: [PATCH v2] drm/client: Detect when ACPI lid is closed during
 initialization
Date: Tue, 28 May 2024 16:03:19 -0500
Message-ID: <20240528210319.1242-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|CH2PR12MB4103:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d0a1bf7-17b5-44cc-bb58-08dc7f59a07e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|7416005|376005|82310400017|1800799015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q8GDRQJXUS7ftPLMh+dM7LE0gNwteXqRJqtWkEXn/LmgJMr4AIGgdLoUVm34?=
 =?us-ascii?Q?3Pa1VrUJpqK2vuWVRbZISf5sIpBGWgi4RHkxhbzgqEfC2NcCq+sii01QRsbW?=
 =?us-ascii?Q?7gBYtwuSUDFwqPVvT3i8ixyDKGWfjFwO9mp26ECVlZJTUmUvogLwIb4TO62t?=
 =?us-ascii?Q?GiYVUBUiySOPs6QqC1AfdwuzpJYn3RkWwNwllu6Lksu7kJdKn7clWaLEuNGn?=
 =?us-ascii?Q?dXkIeALHD4FvnC8KhxcUcXYo7QnQkv6idWLtPqhyatdf7wPH26QJY+j7w+P9?=
 =?us-ascii?Q?5oKL7nmkRk6+BkAGllxugxy0PqQVajAODv4YUqMtnhSJGbhO9yGpY1wFIFTI?=
 =?us-ascii?Q?2b+2AnEDdSpiqDsiCU1xuQiTM58H65gpzWZEB7mO2sQGPJyGdCZwSKFmNzab?=
 =?us-ascii?Q?yX8ZlPp/fiXnYpApmA2NwoQNKe15sDwpsSL9qDE7eXR2vFd4lbueMFe7pjjN?=
 =?us-ascii?Q?lHF4EDTfDkhlcmh8tbeE/fhbBYfBO5fxMd0sn/28oCNIkAiQ6f4tSABzXF+2?=
 =?us-ascii?Q?8f9xOT/XJ/6vP3166yKafnGJMTGl6e+WpaLIfkVSJxw9TSHf0SW6EGLVi3Tp?=
 =?us-ascii?Q?9vg/2ZsGPoPWb1Nkthm0Pv44Or5o1oLEEnJU+vs6QVEhGF7TgCkongdSwWol?=
 =?us-ascii?Q?8MNpY7teixR8maOMVBqenINzXb06rSM4ns0b749h0agADceaLd2BJbVTw1xs?=
 =?us-ascii?Q?BQUN76dVoUxb188o7DFBnHb8pKM8WKy3dQdVQQC1DrSZ4t8hPAsyws22f7YR?=
 =?us-ascii?Q?n7T7QRk4/hGQQ/WFrnxWH/1Fh0bAjfk7LHlBcSZNkqMxiH9lYQHKzGSafzKo?=
 =?us-ascii?Q?07S9ZqnU0bS8stwwO/pfWU/D2JOeIxpSPQsgC3l5SuGKCqRn4YaaJ7d8Jzbe?=
 =?us-ascii?Q?Y/O1Ap+VtQpyGrMFHW64wlJW4i4p589PvoSsPRsuQk+/GQQQVxXy5nODZV+Z?=
 =?us-ascii?Q?XxUVNNokQhpMtLZmWK4RA/Qkrk1F/8Vm/pQ2eVCV0XXWHKvrqENi6fDKN55A?=
 =?us-ascii?Q?bvJ3NAS959G+JP+1rotkS+C22Xa5khH32/6JeqH0WiCkWuDFx/FyHOxeR5BI?=
 =?us-ascii?Q?iMtwecPJaj68unkEcQCoZhka6o3rSfFiw48hkCR0rSng1w5seRjRFKRlZ6+i?=
 =?us-ascii?Q?06QW0x6AWytG05cz4w1B1gcniJ4i1NtucuaS2Yvp8qKCHAH4ne16P2wz8vcR?=
 =?us-ascii?Q?gJTkrPZwnh9jvixyREsQTxZd/qJd+AtQDnVyGkzfd/bgwOpLMdvDOWRNRSNk?=
 =?us-ascii?Q?Pr2Twmeb0ggFmFh3/mrexrJHoiGtL0MWVG5idakQq1bHm11RhW8zyCezLNtv?=
 =?us-ascii?Q?W38BU4bsceKZfk7rvOVN4Xvh?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(7416005)(376005)(82310400017)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 21:03:30.0464 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0a1bf7-17b5-44cc-bb58-08dc7f59a07e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4103
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

If the lid on a laptop is closed when eDP connectors are populated
then it remains enabled when the initial framebuffer configuration
is built.

When creating the initial framebuffer configuration detect the ACPI
lid status and if it's closed disable any eDP connectors.

Reported-by: Chris Bainbridge <chris.bainbridge@gmail.com>
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3349
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
Cc: hughsient@gmail.com
v1->v2:
 * Match LVDS as well
---
 drivers/gpu/drm/drm_client_modeset.c | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 31af5cf37a09..0b0411086e76 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -8,6 +8,7 @@
  */
 
 #include "drm/drm_modeset_lock.h"
+#include <acpi/button.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
@@ -257,6 +258,34 @@ static void drm_client_connectors_enabled(struct drm_connector **connectors,
 		enabled[i] = drm_connector_enabled(connectors[i], false);
 }
 
+static void drm_client_match_edp_lid(struct drm_device *dev,
+				     struct drm_connector **connectors,
+				     unsigned int connector_count,
+				     bool *enabled)
+{
+	int i;
+
+	for (i = 0; i < connector_count; i++) {
+		struct drm_connector *connector = connectors[i];
+
+		switch (connector->connector_type) {
+		case DRM_MODE_CONNECTOR_LVDS:
+		case DRM_MODE_CONNECTOR_eDP:
+			if (!enabled[i])
+				continue;
+			break;
+		default:
+			continue;
+		}
+
+		if (!acpi_lid_open()) {
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] lid is closed, disabling\n",
+				    connector->base.id, connector->name);
+			enabled[i] = false;
+		}
+	}
+}
+
 static bool drm_client_target_cloned(struct drm_device *dev,
 				     struct drm_connector **connectors,
 				     unsigned int connector_count,
@@ -844,6 +873,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 		memset(crtcs, 0, connector_count * sizeof(*crtcs));
 		memset(offsets, 0, connector_count * sizeof(*offsets));
 
+		drm_client_match_edp_lid(dev, connectors, connector_count, enabled);
 		if (!drm_client_target_cloned(dev, connectors, connector_count, modes,
 					      offsets, enabled, width, height) &&
 		    !drm_client_target_preferred(dev, connectors, connector_count, modes,
-- 
2.43.0

