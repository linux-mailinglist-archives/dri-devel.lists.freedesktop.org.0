Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C8A669DF1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 17:27:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4948C10EA78;
	Fri, 13 Jan 2023 16:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB48F10EA4E;
 Fri, 13 Jan 2023 16:26:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0GEDIMta4BSHqdw4Z18pR4XrOL8Merlk3XFczCSxcsKvMRQ4UcxPFl0pplCTDq4MYla0vQnjz9hGHK27pv3BL7j2GPF3ksn8av4K8x6ysIFJJbMdftq/EtIxdwdQLI/EB9rUTBKP17MGl+XkuJCheJFVMiO5QAH2KyX0G9WbmKOwwEL8jtCjEjUaV0cQEFHnqhLtojy5L10GsR9bPiR3oiJVMr1C+y5jhuqbcXaULYHDLaf3O0eOO//AogPShKduNwiVsqHYbWiNvSvcdkU5qUObKdXnjkb1eK2dU18tuMnJY04cUAD8mArVHqBI3lXHKHRppKbRXOo372MBNm0YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hq7w1UEWNfnftb+hxeKOS8k47NZxHLK1KEq9ZQ3uOIQ=;
 b=LzMK+Pv2QPZToUbtQTFNoB2FrPM9dM5dkXpm9iNL/wStM9liE3mPwVJgJhc77Nrx6p7/1OQpfCct1Lcmpt/UxyZg5AyoaYYRWCBlDzrW/wxdKq19MhcySruXWGEI6RF003OkgNkNgD8J0AwuR6fZlTyoh2xcaBDPnuS3oyhWnmmrPw0nUrB3s7NzdpkaxnGUKNlyC1s0fF/G+dL5LDR8jT4eYiio7nlaq3eiUrFbuSkhT6ZI8y6xHXjsqeU7NU6WFf7nEdfk5CPR4suMa8/CLgQnacU0UKfdZRLkdw0VcA8NwU0l4bN2peSQ/1HB1AHhFyP22tUSB629KmJ95kDmWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hq7w1UEWNfnftb+hxeKOS8k47NZxHLK1KEq9ZQ3uOIQ=;
 b=VaYaRNgaJF7pWSWlnQHJz01WDTHiPN1AOvSbqNP7iGKpvt8QMXY/9rMPsp3mKwWveLRDmcGFwPGqRuX23uHVHKw+NWfuZJLYbLVej1d1neOiIxvzHa/jigm0TGAzycuhPlr4JhDKfyRtUx4iWmoGxgyREsXtuS3eGjvQj8XkwxE=
Received: from MN2PR10CA0028.namprd10.prod.outlook.com (2603:10b6:208:120::41)
 by MN2PR12MB4285.namprd12.prod.outlook.com (2603:10b6:208:1d7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 16:26:46 +0000
Received: from BL02EPF0000EE3D.namprd05.prod.outlook.com
 (2603:10b6:208:120:cafe::bf) by MN2PR10CA0028.outlook.office365.com
 (2603:10b6:208:120::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Fri, 13 Jan 2023 16:26:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000EE3D.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Fri, 13 Jan 2023 16:26:46 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 10:25:03 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 08:25:02 -0800
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 13 Jan 2023 10:25:02 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 14/21] drm/amd/display: Add debugfs for testing output
 colorspace
Date: Fri, 13 Jan 2023 11:24:21 -0500
Message-ID: <20230113162428.33874-15-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113162428.33874-1-harry.wentland@amd.com>
References: <20230113162428.33874-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3D:EE_|MN2PR12MB4285:EE_
X-MS-Office365-Filtering-Correlation-Id: da520e1b-c4f6-4714-674c-08daf582f701
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u/MwsOnWQtkmnYG6qWy4f/nRWLtj54ZFdRpfr02713eQ4Ye39X34JvHiwTEFBZlZvL6/rJmlDmdbwK3fKDjpQaBgassnYTK2cMO5HS91bZsdEWGtl4wnSFIVhu9+6vCSX3ioGDsZU94iTEjyZBKc2KkBS2cY4wb/chVsF5AQeC/2PgG4gt+VAqzbhGX5wssso0exR2CE50Sxs8/+WuNTimMzKhKN8ODr+SKv8CUf0NiMWzNse4CHJVDPVm1C/6JCePscOmZo9Q0rEw71HMXw17zFDtOsxXTeAGWgByAEhmNv2pFJvBc6ZC1mCl31rTTR4MjA4Zpi1N8pb4mJTILrJE6khDY10tiNCOrQvOFsuThhbvnQz1pXjlDdo8IxdPmh3GF8TCzAJ3iSlBgesJVkwx1MAFVSOl0nOjKnEs3Z+RIfAsTK+KRWTu0FGE+rd4/EvOV09HJM1c2IUoGm8fKw0h4ddbc2V0oXNOmyKpYIMVl2b3l/qohivJNMbh1r+hQRQQ/57hPt3uQD2Jm1IpL0WyOB3/hwZOYdSgbpgaKOacvIBWEoZxgZ8j+SZlSaknZQ4nw9PJv04EC4yKTL7zmxo0VDNK1Tn6F/3s9CdO+ZPPCUbtWCyqkLJKlzfHgnIL6YRwO3QG+ID1p1T+cgtDR2RWYlWT4tWcdC7uVWNKQEtX9kkzZZGvHuup/uY2HfJSoIEvYP/T4ZYjulnDvdtxbUFAzmgju81TrSocT2W7USI2s=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199015)(46966006)(36840700001)(40470700004)(36860700001)(36756003)(6666004)(2906002)(70206006)(5660300002)(44832011)(83380400001)(4326008)(8936002)(8676002)(82740400003)(426003)(478600001)(41300700001)(356005)(47076005)(81166007)(26005)(336012)(70586007)(40480700001)(82310400005)(186003)(7696005)(1076003)(40460700003)(86362001)(2616005)(316002)(54906003)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:26:46.4495 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da520e1b-c4f6-4714-674c-08daf582f701
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4285
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
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
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-By: Joshua Ashton <joshua@froggi.es>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index a29952cd8f22..5473f022d9ed 100644
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
@@ -3304,6 +3359,8 @@ void crtc_debugfs_init(struct drm_crtc *crtc)
 #endif
 	debugfs_create_file("amdgpu_current_bpc", 0644, crtc->debugfs_entry,
 			    crtc, &amdgpu_current_bpc_fops);
+	debugfs_create_file("amdgpu_current_colorspace", 0644, crtc->debugfs_entry,
+			    crtc, &amdgpu_current_colorspace_fops);
 }
 
 /*
-- 
2.39.0

