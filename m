Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 854C264A6FB
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 19:23:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626AC10E27B;
	Mon, 12 Dec 2022 18:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FD910E26A;
 Mon, 12 Dec 2022 18:22:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGV3mbbsVBl+cHqOg2IN2d4fcVeTPNoGGp8oAA5K8z5+L7+jWMWA14AqEQLVQAAyz5CevtfNyB5e8aaoM978NHHhy1pWfvKSODXVlwU44GPLa7WXV7bxduYzx/XYkBVxoY7dcJHN2w6kPvsN+EkkumHm4y6HPJsYN/g5l3jEv1lPYbbQUI/JbSSn3v3/dhXbPaCYV/JHCXmRPky+x1yQxkSRFRTI5A4XJj6tm54SPAkycE8v8cgGm4EYFTUq103YWmAs0Sj+KNJVTPda4DzilORk+JZsEv/YmUXv2CUrvE+ylAlL3Z64wZFWHUzpNqcrf05rs8/6bSg75DZavCKBCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=strXx8EAnWxVGo0HQWV/YiVdscdt38EhBux5Osi7zdA=;
 b=l2+d9ja/9P+VrMQeczaN5q4P6ORpsOfCyWzdsbQgiQJpOd3uLpUTvjZVFLd+YB9VSWzuo7GVQCC/sPBOEKSevlsAY07cXXHDLwyEsjClRtV/Jomo7Z82ka0/hCKry0ps3uF+l+/RhsnB5EjDFjc9yDlFoHFmShJzyUZ7As2YAqmPjt1L7QgHoOPpmWUzn81hV6nSLE/b5G+SnoKz75uRks0dWbpCreruKG0GM+khtqUi46jqT/9WMQyCb2v8fdHN7gV248DKw82OsKX0C/qUmliIbzttg3p/Eqv9OR7+oS01A+0YY8xhqBd17ihb8C71XBLUkUeodIksKQWZnbMLgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=strXx8EAnWxVGo0HQWV/YiVdscdt38EhBux5Osi7zdA=;
 b=l4p38IctjeoJUvFXKGWTN2b/n2rYuBZoSBKD5SGFLRgHBvvR/99higEM6qVkWdve3XPP7fvfvY53A1GtiHFaohRaIuqfpDV4oJ+g8gGyfBp3KQEG/tYw59mM2VbBZo8Ew2ilRONN0RdS0t1bZYjpIQD9Y5IC1dbihHrleGJuvSM=
Received: from BN9PR03CA0530.namprd03.prod.outlook.com (2603:10b6:408:131::25)
 by SA0PR12MB4447.namprd12.prod.outlook.com (2603:10b6:806:9b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 18:22:33 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::4e) by BN9PR03CA0530.outlook.office365.com
 (2603:10b6:408:131::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Mon, 12 Dec 2022 18:22:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.21 via Frontend Transport; Mon, 12 Dec 2022 18:22:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 12:22:28 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 12 Dec 2022 12:22:27 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 14/16] drm/amd/display: Add debugfs for testing output
 colorspace
Date: Mon, 12 Dec 2022 13:21:35 -0500
Message-ID: <20221212182137.374625-15-harry.wentland@amd.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212182137.374625-1-harry.wentland@amd.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT013:EE_|SA0PR12MB4447:EE_
X-MS-Office365-Filtering-Correlation-Id: 470806fc-f965-4049-e37f-08dadc6dd688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WtpsNPfXpOxN6K1ihpAGHACM5lyVSUK/P6leA8DqKhkPC6UGk8m1JVmkyLbvj8nbs1tj7+wAMNNi2ffb4IHDFlSuGvIA3yvt6J7KFAtvXxr5WqYT7b+LCLiXd3g7NInh2UjsnBjK/G5q12kaCgbIGn8pMTf4juMdTmX7B9+hiQVD7Q3F9R6q1J2uEuwO2CaSWDlqMam5K5MtFVxCRqDMC5uK1coG5ZhiIpDYZ6c9XZNG9lqEplgclHFMsPNliI6cyl8M0MHrGv0DNWOBCvgOm75DlKFzb/XnpjxSSbTrRly6IEsoX8YLfazYxakDZwmxeXppoLAKopT6EaSBmS5HQ0NnxoOai2n10eXeOZGsH1fNGD04ei42c5Z/4GikT1e7MjQGODbXpsympeStFo29cJfXj5gTK5xLkKqoQwqUSxnUYjNk3WKOqBT0JfsgtOKCWXYpHtwOl4CiRfN636OW1mfAsYhHmY1MIt9zxD4wcntznIIEavgQcmQKAMsovFn2vcQm0aNjaNPA0LaJPj02+ps9ddYSc0XIX0MBUdWHjxoUXAJBLtrhYiP7n1J9mTIsLaDv59s8zCx50Fn5BLOo1GG3D+wcfEOWMXZU2UFzV2W8Zy0x9eiqVfJx6ijAV1U1HaRaZJyKBD0x1BOo7lOaJZIRJ07p4Ig9WhefN//B5c7pdvz9HAFlOC/BuecasauoX98CsJ8G+BaAbayBxw9MuswNH7HdZKUZZIMDEBCvV+w=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199015)(46966006)(36840700001)(40470700004)(478600001)(70206006)(316002)(4326008)(26005)(40460700003)(41300700001)(6666004)(8676002)(54906003)(8936002)(36756003)(7696005)(44832011)(70586007)(5660300002)(336012)(66574015)(47076005)(426003)(2906002)(86362001)(2616005)(186003)(1076003)(40480700001)(81166007)(82310400005)(110136005)(83380400001)(36860700001)(356005)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 18:22:33.4875 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 470806fc-f965-4049-e37f-08dadc6dd688
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4447
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Vitaly.Prosyak@amd.com, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to IGT test colorspace we'll want to print
the currently enabled colorspace on a stream. We add
a new debugfs to do so, using the same scheme as
current bpc reporting.

This might also come in handy when debugging display
issues.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
---
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 461037a3dd75..d95d1c9f4805 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -935,6 +935,61 @@ static int amdgpu_current_bpc_show(struct seq_file *m, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(amdgpu_current_bpc);
 
+/*
+ * Returns the current bpc for the crtc.
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
+		seq_printf(m, "RGB");
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
@@ -3326,6 +3381,8 @@ void crtc_debugfs_init(struct drm_crtc *crtc)
 #endif
 	debugfs_create_file("amdgpu_current_bpc", 0644, crtc->debugfs_entry,
 			    crtc, &amdgpu_current_bpc_fops);
+	debugfs_create_file("amdgpu_current_colorspace", 0644, crtc->debugfs_entry,
+			    crtc, &amdgpu_current_colorspace_fops);
 }
 
 /*
-- 
2.38.1

