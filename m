Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 708A5724E19
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 22:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175A810E3D1;
	Tue,  6 Jun 2023 20:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2058.outbound.protection.outlook.com [40.107.96.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC0510E3C3;
 Tue,  6 Jun 2023 20:26:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVB4XWbMybD+o7h0JU2HCspE5xCxkcjJYfwb/sOIi3BqLMJKibGTWSl6avvjHXaOjj1eE144X68JTvge6LaKPHURxS56Iki0LnrS5zVUj0wSUCmHxk4AemYIRV8XpzaT+niSeVQjAjMnaaw287GYoltlBBieBagP9uzxqQ07wcBWS8FnrP+oeIiFpR6BF2z3k5O8HsJevJOrdO/SWUyZfzaAiEi4Hl/hXAoYx1lUybUd2oy5dcWXC+HgRdg64UeWnqiTa2YPWlbD7nuY65fxikV11i/4W0p9JhLqYCLVPCz6WYdhZl3Npx2BA7PXRsyliRrhfsXh5+7x/xnkkPMbHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOIaxi2xBCKUKc9JeC9I6qADLCCZVemIcloGzCYBGZQ=;
 b=XmqIxTJvV4hNNYXhLqmLSjLvIquyLgroF5aZyAW+U7L01NOCDjUOi7U2TM88jQixz3llRajMnc0HXZHB2iIsJQI2oL6lcboaayfVhGHyd8tnEyfzgYAE0qkl/piMa+f+LYRsK/mNsrq5h1or62e9ceGvUvXsBOIHEiDLctluI4q61qpe6Pa26Az0o3ky8smyrMTV59y0p3iMR8FBmDq9Z27MXK3Mcso/3i3BMmhGiN0qaa42d4uWZt2DNCwhBhGmk585ST/dVTurKsIeMvCZmAyVu2/YuJ9G1L+gZXwSZLEgVkWTZi9Xy1foKJV9DSXY8WitubwWCuTWSO4iN75c7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOIaxi2xBCKUKc9JeC9I6qADLCCZVemIcloGzCYBGZQ=;
 b=t/hQo7kAUL2ncWJi1deVaExz5C1AIf8O7ewe47fIm/duLZoQ5iI1+bsSfqrhBeyNfFWCiiax3BNf0stDBRhrH2agCJmVUctyPxka9fvntjUiVX2xMyG/wR8kqt+hpWIMU0i9fSrWJV9pPPfjkGAL1wrVoTbZrJqfCQH9mTvzPUI=
Received: from BN0PR08CA0016.namprd08.prod.outlook.com (2603:10b6:408:142::35)
 by BY5PR12MB4917.namprd12.prod.outlook.com (2603:10b6:a03:1d1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 20:26:26 +0000
Received: from BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:142:cafe::d1) by BN0PR08CA0016.outlook.office365.com
 (2603:10b6:408:142::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Tue, 6 Jun 2023 20:26:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT026.mail.protection.outlook.com (10.13.177.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.36 via Frontend Transport; Tue, 6 Jun 2023 20:26:25 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 15:26:25 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 15:26:25 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 15:26:24 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5 12/13] drm/amd/display: Add debugfs for testing output
 colorspace
Date: Tue, 6 Jun 2023 16:26:06 -0400
Message-ID: <20230606202607.122914-13-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230606202607.122914-1-harry.wentland@amd.com>
References: <20230606202607.122914-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT026:EE_|BY5PR12MB4917:EE_
X-MS-Office365-Filtering-Correlation-Id: 515741f1-033f-4876-1d66-08db66cc4d4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Id7R28tCqk6FryRQyBezwD+axRYMjxWWk0E0GO9ldckLDrr1rGM2RotmlOAlfdOnFv1Cj4lGSAVFkdp2PUbgrAmSwcRkB4QZ7cNn5n78v9ATSEOKV4QiLRdyqchfWuB3O7U2W0z2u/7lbYXbjDQpVO2FP223NreWpm/ArGmnkzO1f1a3EXk7wgOe4LFJ9MEjDAu+n0sqoRcc2Z8GnclWeOr7MjWOQWrys+c5reSaFhZ76TFrJOjpm8ctl5b3FekUvH8/lq/eQ5qJAC0ANdeXRDlpzhLkys3J/wcvb92n4sJZ3ivFSroq4bTLrfocutR5YjbGSyOh/Jnc+alW7lJ9O9a/i/aXgJyJEt0X0kfgNSdjDLENZARJauEnvS/kp+JB8CeBv3rdiShm6+/ZpnbW0tagCkyTvkvlYQSU7i6qo9azzGdQ/RrAiSVKh9NpbuVtRCvuu6Wzc9bGZpcaRLs1bMJ1N9sPHL4P6cVBkZ6Wabra4DNwdQ7fanAyroBz1K1jo89AWoMoGM7x+nm9RcAulb2r4OOazIrp5wZArFzSfAiNEwHN8Yt6kj10UluKUmp8kpuhRhMXw6o7TltPxFuKYgNSDlknNawUQuTr9nUXatl7TBG7OvSot7I5Zn0mPEcrcNJJZ0SYRNeMG9ZcG/IZoKC5WOBcAByxv8bXhOXcC6aU1UVYzhvrZcQP5+QEiR3xbNYNNFVskb+k0CdY8/TIMHSSzd9tk4ZDEK7jJBgiRLTqnjcpuO95ElzK7DJuHpHkHtfwNCU45MYuqwZCrBU91g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199021)(40470700004)(46966006)(36840700001)(41300700001)(316002)(478600001)(8676002)(40480700001)(40460700003)(47076005)(2906002)(36756003)(82740400003)(44832011)(356005)(70586007)(8936002)(5660300002)(86362001)(81166007)(4326008)(70206006)(110136005)(54906003)(6666004)(82310400005)(36860700001)(426003)(186003)(336012)(83380400001)(2616005)(26005)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 20:26:25.8718 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 515741f1-033f-4876-1d66-08db66cc4d4b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4917
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, Melissa Wen <mwen@igalia.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Vitaly.Prosyak@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to IGT test colorspace we'll want to print
the currently enabled colorspace on a stream. We add
a new debugfs to do so, using the same scheme as
current bpc reporting.

This might also come in handy when debugging display
issues.

v4:
- Fix function doc comment
- Fix sRGB debug print

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Simon Ser <contact@emersion.fr>
Cc: Melissa Wen <mwen@igalia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
---
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 82234397dd44..caf13b2e8cb6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -906,6 +906,61 @@ static int amdgpu_current_bpc_show(struct seq_file *m, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(amdgpu_current_bpc);
 
+/*
+ * Returns the current colorspace for the crtc.
+ * Example usage: cat /sys/kernel/debug/dri/0/crtc-0/amdgpu_current_colorspace
+ */
+static int amdgpu_current_colorspace_show(struct seq_file *m, void *data)
+{
+	struct drm_crtc *crtc = m->private;
+	struct drm_device *dev = crtc->dev;
+	struct dm_crtc_state *dm_crtc_state = NULL;
+	int res = -ENODEV;
+
+	mutex_lock(&dev->mode_config.mutex);
+	drm_modeset_lock(&crtc->mutex, NULL);
+	if (crtc->state == NULL)
+		goto unlock;
+
+	dm_crtc_state = to_dm_crtc_state(crtc->state);
+	if (dm_crtc_state->stream == NULL)
+		goto unlock;
+
+	switch (dm_crtc_state->stream->output_color_space) {
+	case COLOR_SPACE_SRGB:
+		seq_printf(m, "sRGB");
+		break;
+	case COLOR_SPACE_YCBCR601:
+	case COLOR_SPACE_YCBCR601_LIMITED:
+		seq_printf(m, "BT601_YCC");
+		break;
+	case COLOR_SPACE_YCBCR709:
+	case COLOR_SPACE_YCBCR709_LIMITED:
+		seq_printf(m, "BT709_YCC");
+		break;
+	case COLOR_SPACE_ADOBERGB:
+		seq_printf(m, "opRGB");
+		break;
+	case COLOR_SPACE_2020_RGB_FULLRANGE:
+		seq_printf(m, "BT2020_RGB");
+		break;
+	case COLOR_SPACE_2020_YCBCR:
+		seq_printf(m, "BT2020_YCC");
+		break;
+	default:
+		goto unlock;
+	}
+	res = 0;
+
+unlock:
+	drm_modeset_unlock(&crtc->mutex);
+	mutex_unlock(&dev->mode_config.mutex);
+
+	return res;
+}
+DEFINE_SHOW_ATTRIBUTE(amdgpu_current_colorspace);
+
+
 /*
  * Example usage:
  * Disable dsc passthrough, i.e.,: have dsc decoding at converver, not external RX
@@ -3139,6 +3194,8 @@ void crtc_debugfs_init(struct drm_crtc *crtc)
 #endif
 	debugfs_create_file("amdgpu_current_bpc", 0644, crtc->debugfs_entry,
 			    crtc, &amdgpu_current_bpc_fops);
+	debugfs_create_file("amdgpu_current_colorspace", 0644, crtc->debugfs_entry,
+			    crtc, &amdgpu_current_colorspace_fops);
 }
 
 /*
-- 
2.41.0

