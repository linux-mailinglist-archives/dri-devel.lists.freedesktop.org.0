Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 989E7726492
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 17:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209EB10E519;
	Wed,  7 Jun 2023 15:26:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A87210E513;
 Wed,  7 Jun 2023 15:26:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PB8BE4mYFyoAq4uODRoNMhmCtUuoff+sq0J9+oUm6QJNjTjoKLer0mkmRa7oaT/3KoZ4brd7ZYoSNXbQGV9eiszrODY2qN5fZnW7G91Al7SbEl5vlq5Cg6/IsXBhjkyd3/gltRkrbLT67D/W/xfeLsXo2uwwjQcIcE3zm4rxPCoEmvei0Is2ULSOJvCgARciz0qF6bIHdSa1gctVfyTyO1GQKCjuvlNtxhW8/PyIzBHrvlfnMVQqWe9J80vhAYGV21ddzkwTAAJ/79P4C3YoZbxaPoopN2FVH0xGf6qM532/ielz7JFUx5ETb4zCXOpRe0X2Cz1bFlcI9uZNXYTahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rn5reteYR2HdgDftsI/4TpxA4HC9GyZGJ/5HzxeHUY0=;
 b=bO4U228NKRYIWfOWirrolkkvVKcnCv3yv3rvMy35llI5akxqKI7UmmDPlgQBp7h8je9BObFYOwWLC9/rGgEIGvN4kwDTdhDyYpaJNwH36HDX9cl3Wr7mgIkPT8NZirlGzOhByMS4JTduO0K9sBAqf//P3hia4Zy0wtiv+C1m8/2UAKMZQLCBjphJkACeLJcmzdroMOkGAz8Ad/4mSco7oxOqmAj8jA/ano5yb1HbzRHhrwFl2Up2udSZfrI84lFHCZx+YI0TJln5exQCdRrPULjAfAYeyza3/wamwd7PdtQdAkErwQHuZeKwGwXBQH0yJQByCV7BMz900DZERBHdmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rn5reteYR2HdgDftsI/4TpxA4HC9GyZGJ/5HzxeHUY0=;
 b=qRKMOt8MxmcQh+VeGv5Tto2DCGyfTanKMV5obT96wAIMcdUKNeKlfGPTTfNCIQlVOnUTRh+VizBDKx0gfcVhLN225fsmyGEKMPxWrnjvKvji0UCRtiLEorCtjh43EHbByazcu13/pp7vKdO7JFgaAOhqVP2AYfspsfBsGs8JZrk=
Received: from MW4PR03CA0091.namprd03.prod.outlook.com (2603:10b6:303:b7::6)
 by SJ1PR12MB6097.namprd12.prod.outlook.com (2603:10b6:a03:488::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 15:26:35 +0000
Received: from CO1NAM11FT097.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::8f) by MW4PR03CA0091.outlook.office365.com
 (2603:10b6:303:b7::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Wed, 7 Jun 2023 15:26:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT097.mail.protection.outlook.com (10.13.175.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.36 via Frontend Transport; Wed, 7 Jun 2023 15:26:34 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 10:26:33 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Jun 2023 10:26:32 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 12/13] drm/amd/display: Add debugfs for testing output
 colorspace
Date: Wed, 7 Jun 2023 11:26:16 -0400
Message-ID: <20230607152617.997573-13-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230607152617.997573-1-harry.wentland@amd.com>
References: <20230607152617.997573-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT097:EE_|SJ1PR12MB6097:EE_
X-MS-Office365-Filtering-Correlation-Id: c432fc3c-119f-48ce-a13d-08db676b9445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xMlSSb/S4Q9cOtofxiCkwyAZFwpGeYFeyCIIAWpjjAbVDOUV216ojHPc0hvqnsCEjhMROC9T1EZ8LmHhymXwgX/TAiHKySvkURdWpGNygeGgi0+sAqnYRd5wcv5Vbt+xsDpuhhch/t/geaxT8eG/IOd3HpHcmwn+SZ7+aRSktG8P2KovtxS1BnxPjXPZgdRgFze2hI4wXVUpBJlYLP3t2cfh2FFAd9VJaOgBTvGauOLVtxbWvZCJlQqVPEfYk2MOUkPubupdDXvvYXP5NO0CJt5hNWcaqtocLnNCtvK4rxnaZhK9YGQBe/hb9tdQ0ChUuHdFqwWNAfXeBi+uv2zBG5qiZ829+rcwEtKjEO5LrZTMRR7pMNhzAj2WnAnTuQBeyd9nWBVe+JOBlt0cUIv8HBzPjd+KEbo45BGZ2eK28y5p/TCsOUL9c0JrAJAKrKQ/9E4KqFVWHv6tYPc7dxxOoKniEukBqz3KPXPaaUQsOboLZAKn8FOXlKGbDd9B0lCbvWFmwLKz6dj/Mr4+SStXZJFWLvwNbuz1UW8ZJKSeKPoh+j7kkdi/XdW9w0jj4TFodOY4JEei12Vu46krHkMbOdcipO1Hu3w4CwjC1pRflC2CiWaaiIHCSYJH+Z2Ln1iLWgvItSpZO1Ybyx05ABZQyfl2+lSgFaBRWmTvRer04qEc+5Gd9zfaSq/v3rnbRX2DTJbQ/mTEToRZBM2WoxvJjMylAKd0qWWULDPwz6NLxwGQog0kBLaTI00Fa72vRx0Z8z4a7gQCczaEJ8k7882wgQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(426003)(2906002)(47076005)(336012)(83380400001)(2616005)(82310400005)(36756003)(86362001)(356005)(81166007)(82740400003)(36860700001)(40480700001)(41300700001)(6666004)(5660300002)(316002)(8676002)(8936002)(54906003)(478600001)(70206006)(70586007)(4326008)(1076003)(110136005)(26005)(186003)(44832011)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 15:26:34.8403 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c432fc3c-119f-48ce-a13d-08db676b9445
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT097.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6097
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
Reviewed-by: Joshua Ashton <joshua@froggi.es>

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

