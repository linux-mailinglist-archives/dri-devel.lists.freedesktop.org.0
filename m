Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF2098F7CE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F59110E989;
	Thu,  3 Oct 2024 20:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Nt5k2p5V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9727110E910;
 Thu,  3 Oct 2024 20:02:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIcoMp3vcqpOfEgmlHjZUh5uV4Dg74ozY4TAnj4iOXoCqBgXXuy2TKPKuqOxNRkvRKhKiSu+dbmehoCvhkRc/ss7kzH1FFVgoMDbpj/g2dxumUtCz1RVxZiU4VHmlbZd0roe6/3C2IeeEgDjS6UCBJDJk/r8W1MTd9diCsrp8AjKoJsD5Xsh0h3MSY9DGCD3tERDDUthfofIQE5YCbId0HtS5lgqWdiOcjVncwEvGuE6xqJU4GvLm3yQSgqo/Cvkfa2UW9SH7eahHvpCOoJ2wU5VGTl/+d99uutmmWk87LYBDXKzrqtmpsHQuNdLS4xXffootlxuNN/C58hxMhQFAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJnVB93cRXbKDWSkvDnKM9aQuqQPYiGuzi5HvVwt1VU=;
 b=wsLD8HMmevbwXkAVdnfe71xC/29y1X2gW54wWKpBhLrqU4dphKa1sOsa0TKmx6/khNE0tdrCUHBmw6dxBaHEEUk1J7lpMlKsDYLTb6RF8LEY6XdDPjMisf6QPWbP8z4KrFDk4+cgfKEZvlbyWn7TSYOoOtQrFI53cUUxaDncZhlXlpqQr7HQO2MS6tqj12aXoW6tlzIoqNqC5ICUEzIIC0+vDMTm//TQh5GDq/vJaphvdqxUc4f4dNfwyiQWfIoWR/S8lUkqKgRchWGAtD3GnumZciUcFJZp5b5ReHIWwMaTOIotebeUtRanly2blhx/xpTd0hE3f6ifsNql5kHmNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJnVB93cRXbKDWSkvDnKM9aQuqQPYiGuzi5HvVwt1VU=;
 b=Nt5k2p5V5ftEbxbo2LVjxzEtbxE/+LaaX9LxmTM+v2boye3YIpXi6lhkCgGK0hvnwfcsTrj4JX0T3mL0khAqf8zNuisV9am41LaNY8cf7P6nmh3R7iKrrcsOsA6OB6YZhHSFCBBbsVM16EPC7w7nYSg2qgxjZyuL+1Fac6so6/U=
Received: from DM6PR04CA0021.namprd04.prod.outlook.com (2603:10b6:5:334::26)
 by SJ0PR12MB6757.namprd12.prod.outlook.com (2603:10b6:a03:449::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 20:01:59 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:5:334:cafe::b3) by DM6PR04CA0021.outlook.office365.com
 (2603:10b6:5:334::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:58 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:55 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:55 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH v6 38/44] drm/amd/display: add multiplier colorop
Date: Thu, 3 Oct 2024 16:01:20 -0400
Message-ID: <20241003200129.1732122-39-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|SJ0PR12MB6757:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a807480-586b-4133-93f3-08dce3e63d46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+tvaowef/mgJ+CxsEjpVUdKe1BYoIL//JyAG45/bYKR9T+FAuYv1cGVq5kke?=
 =?us-ascii?Q?GDKcoExhl5Y8dyrdUg6ZbzqWuq56HClkPY0v5t5fNoVrrT6wjsihAbl6bg9Z?=
 =?us-ascii?Q?/RoyJxO0P9kXL28AgmhIQDjqcKFEgPybsPDjP3OoXatw3UANcs0xL4K4e1Eg?=
 =?us-ascii?Q?iWQucC3+qcf8CTsa3hGtA0Uyvo80JsQ1G8+V7KdTi9CnXCzObFyPdZH00qQ+?=
 =?us-ascii?Q?Dhyt221mCtQS2SM/aol/YQrT4BuOqNVOW/vSqDPiTnopfdJ7m4N/s1IgWdT+?=
 =?us-ascii?Q?DSnu+evw/wTn8R8UHHSEtafDh5nESQcxraGH2B/rqEfT1mYu+wCBOfqqsOLT?=
 =?us-ascii?Q?6jNhv2Ebub9xtnYIhduzBWaGfCEEArw/6KOnJU4cntHy/750tjHUubJSFVud?=
 =?us-ascii?Q?VD9YW0IZnT3J/X8V55rZPHoUjlrt7S+GrMkG2aHnjQiILke2x0qPVw4UlHPZ?=
 =?us-ascii?Q?rgtwPpzZH3Uae3ZBhEeUmF2akEhk192KbJJ4NHTNRWMF3YzlpeHBQz5WOg7B?=
 =?us-ascii?Q?q1JlcX5qAOqaAY1qFz0LVIdBCDaRoLbJiK89eii7O+R0p3HGAkMDi0yrthlB?=
 =?us-ascii?Q?+WQAAucYj0/PfyhOZHtLFi9gFcB7PvE+LRZb9ndLm1ANcsCWuupx+2B1oNfy?=
 =?us-ascii?Q?mRrPMys2bIWSZxmuFetncYfgj1PZ2ZVlOzAeDcz5qC5cxetpiLkvmVgBYG5J?=
 =?us-ascii?Q?euuSODFnq919lRm/v1EsVtUDSAUJumBbU/wcDM61AXTA4bTK/w7kzW5T2pu6?=
 =?us-ascii?Q?Cny9n1WjGhf0bKRE+kVmWX+02En+6g3/74A6SNaNLjlEJnvCN0JSqeMXPP51?=
 =?us-ascii?Q?eOMhXUYuQmzSHMOp+oC34UmKErx3eKAx2UGzDS6jSwj8ECRRcZvzR49O9lPi?=
 =?us-ascii?Q?dJGNooEzWEYYbL+9t5doWgpCDDWmzdFrgYYf/+jdOIrkaR4WaG+KiWlFYIDx?=
 =?us-ascii?Q?PORNkc/VK5VYrkPiWK5crhArM9QPBz6opSsAIzLCQ7tlro8PystnlT7DEvTF?=
 =?us-ascii?Q?SlBybaGvNRtFbfgasgg6d30N5bWzfM/nNu2fvrv/lI7mq+KKl9MwIrY2c7kw?=
 =?us-ascii?Q?0wlZEaUaBJuxSA1SX97iLQ5NiWI3rw2l2pGPqerTD6SXfTcGPUcw14WiDXq1?=
 =?us-ascii?Q?Lw/75WLVRTde/84B0kJ7rlNjXGxOy4v0xU/TIneVgwsAeK3VuCJ6zcLK4wpa?=
 =?us-ascii?Q?KH+EpJ0oBokzTHun5bM/D1q09/6Qil0W5Lq/9VM1XTk6vTaZswtweV4Zzsxg?=
 =?us-ascii?Q?U2t+PnH+yEkglyV/WSWFfGxZOB6eAkZkArl9rHXjU3VOzgGtzKCDP2ff9mG9?=
 =?us-ascii?Q?ig+CCqMyoSCt8WdVxqgaUMwaj6FGA/BzMBU12IfNnrTvnVl8Z9DMjrVtgZ/A?=
 =?us-ascii?Q?AbQM0CFxOrrDFgns1mQN7wek+u7g?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:58.8536 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a807480-586b-4133-93f3-08dce3e63d46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6757
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

From: Alex Hung <alex.hung@amd.com>

This adds support for a multiplier. This multiplier is
programmed via the HDR Multiplier in DCN.

With this change the following IGT tests pass:
kms_colorop --run plane-XR30-XR30-multiply_125
kms_colorop --run plane-XR30-XR30-multiply_inv_125

The color pipeline now consists of the following colorops:
1. 1D curve colorop
2. 3x4 CTM
3. Multiplier
4. 1D curve colorop
5. 1D LUT
6. 1D curve colorop
7. 1D LUT

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 40 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 16 ++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 9861e2608d16..cd545adbb13a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1251,6 +1251,35 @@ __set_dm_plane_colorop_3x4_matrix(struct drm_plane_state *plane_state,
 	return 0;
 }
 
+static int
+__set_dm_plane_colorop_multiplier(struct drm_plane_state *plane_state,
+				  struct dc_plane_state *dc_plane_state,
+				  struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->state;
+	const struct drm_device *dev = colorop->dev;
+	int i = 0;
+
+	/* Multiplier */
+	old_colorop = colorop;
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->colorop->type == DRM_COLOROP_MULTIPLIER) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_MULTIPLIER) {
+		drm_dbg(dev, "Multiplier colorop with ID: %d\n", colorop->base.id);
+		dc_plane_state->hdr_mult = amdgpu_dm_fixpt_from_s3132(colorop_state->multiplier);
+	}
+
+	return 0;
+}
+
 static int
 __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 			      struct dc_plane_state *dc_plane_state,
@@ -1461,6 +1490,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
+	/* Multiplier */
+	colorop = colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no multiplier colorop found\n");
+		return -EINVAL;
+	}
+
+	ret = __set_dm_plane_colorop_multiplier(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
 	/* 1D Curve & LUT - SHAPER TF & LUT */
 	colorop = colorop->next;
 	if (!colorop) {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 9152f0a771ef..a431de9d2b8f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -91,6 +91,22 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
+	/* Multiplier */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_colorop_mult_init(dev, ops[i], plane);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+	i++;
+
 	/* 1D curve - SHAPER TF */
 	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!ops[i]) {
-- 
2.46.2

