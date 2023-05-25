Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F44471172B
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 21:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF25910E73F;
	Thu, 25 May 2023 19:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328CA10E198;
 Thu, 25 May 2023 19:18:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eP9XF4i0gSXLcu1t0nnpo3NmVAXIDPBYxLeuplRNnKEsjCGwrQqlx5opT3OrnH4kFtSgOaB/ulPhkeCa8+HV4PhOZIKblusiTs/zdk6ixU/C6M+Cgz2WVUirbIfRPhpOSk4n+ZAVea/b7f4qu8v8Aeoh055VeFy37XWeVTOq45NHB2ryKTZSDrZ6+nxe4OoV+EKFswX6QWNiSKBAnhxwnIflgUpKjecbdEAU3fOeJw02b26/stYYmi5xg9BEEzoDQ1tNZ2E/tdo/2VDkLaii7zJrq+JEUHyHuG5rmZ0E6ylaQcoNUr25l15bhFrP+dPGYvvLAybk0qcP6/+SIC8CLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGkKQhkxkuYZmj5Eh9KNYBFQbS7/bk3BbIlCZLMoNwI=;
 b=iOdUugGo3sf379yZGU7+lbeBPtmC4YbPCIz+DOGDnlLTge2y65hEEAyvasX2hKtPA7VrszET93gyDzv35Gkuu88L+1oCbOU4YDmzTe/7mdcubgUYRkws4xYkOh5TZRVFRWSMrKdYAjX5llWGuT2SoEy100MMjfyo7IzgptZMD25DDHGoJuuG6TVfDieiFTMUwlzg0LwsATRB2Ide8EclXBqe7slehwwPw1He5q1O52ideQi1KUEmyJio0kdSoIUfRU/I+e9apedB7WsfHQNmObdOSMrBA4jITm2eiegAVR1VdwqaVcD5f47PT814ZYmREKL1LD5f5yk6NzqIL7ZrSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGkKQhkxkuYZmj5Eh9KNYBFQbS7/bk3BbIlCZLMoNwI=;
 b=dsza9sy8/7uYKcj6YRb7tKD/wR67JFRTYkTbY9hJF06oxHe2yrZyNWXUJVihaxKnKbqXRo8UG7CC1AaFn1fJflqpzPKCSOD8rmt96hUZbeGNf8Yyxo4dA+OwMydGzRxcFaoIqxgdEXdYDxH9sfLSP/jDXC09MJde6RVptFQAfNI=
Received: from DM6PR12CA0030.namprd12.prod.outlook.com (2603:10b6:5:1c0::43)
 by DM6PR12MB4418.namprd12.prod.outlook.com (2603:10b6:5:28e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 19:18:47 +0000
Received: from DM6NAM11FT104.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1c0:cafe::60) by DM6PR12CA0030.outlook.office365.com
 (2603:10b6:5:1c0::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 19:18:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT104.mail.protection.outlook.com (10.13.173.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 19:18:46 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 14:18:46 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 14:18:45 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 25 May 2023 14:18:44 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v4 12/13] drm/amd/display: Add debugfs for testing output
 colorspace
Date: Thu, 25 May 2023 15:18:08 -0400
Message-ID: <20230525191809.3524-13-harry.wentland@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525191809.3524-1-harry.wentland@amd.com>
References: <20230525191809.3524-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT104:EE_|DM6PR12MB4418:EE_
X-MS-Office365-Filtering-Correlation-Id: 46b882d4-a5b1-4410-86bb-08db5d54dcd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1sR8yLYDsD4FLBZkP9lyG3WyArmRcOWdQ1Bv5VvHmgihmNsl7ta5ISm3JKA5fsm+A+uo/i1QEny3JV85bszycB+WENmv0P5E8z3PPThvN1os+dnmnJy5Vxz1HjCr2OjkbdUtHFUTxcgCrqzxSIxpIGoD6bamvHEnOIasMqmy91OorRj+q4SdTwii3CgyDb2rgLWqJuADpJdgR7SMGKLdua4rNjvBge1D0ttKB0nFfRgCIGGygSp/K8iwF5hDuMBWKPgdBcvxYTH3BAo4cYowL15C5IAUxMEcq9N0gGYxA1D/LaFRIufdi8D/aLwwTN5Fy0NEdb8lfV1OG4nMvQY/Hw/L6ZSHRZAxnUoQA0uNwh+fIuqyhxaUhJvLsQfTbXwlwhwo7zMp9Lwetg+s3PSJO4Ct+B/hOOfmYBkS9bLI35Sh84utI1BeVXOAK/aUGWGqoSInhFMOlpFNaQ10bAolCaTxjMDUMirwglV/eDrKwe9b0sUBHiMFQRj6PL9r8tnPaoiDHvlf8CQMXXQMXqGkihF6LachON2jYylBd6jZOOcw4lggW1Mrfz6EhZzfn8EKzAoYsT2NEXMTfOU8JS9kq/UdoiFqkWYIuZ2z40klfD4mFLHuk7xMZLANU4zFVYUlc+0I/RMRtCIfhrtxhY1v8j3H+WAplk4AGE6tuAPkBJSKO4MXaCKnw3EagtarYYtjkoG40cDgcHjKZ/LOEQ2ZeJUSJ6TgZm8hCpmlea+KKM1F5c4wtPBEO3E5qeyS3ZHWT/qisribyXqJcBnGRbzgLA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199021)(40470700004)(36840700001)(46966006)(6666004)(110136005)(478600001)(40460700003)(83380400001)(2616005)(336012)(36860700001)(356005)(81166007)(86362001)(40480700001)(82740400003)(26005)(1076003)(36756003)(186003)(41300700001)(47076005)(426003)(8936002)(316002)(82310400005)(5660300002)(8676002)(44832011)(2906002)(54906003)(70206006)(70586007)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 19:18:46.5762 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46b882d4-a5b1-4410-86bb-08db5d54dcd3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT104.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4418
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
index 827fcb4fb3b3..9a885e2effec 100644
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
@@ -3246,6 +3301,8 @@ void crtc_debugfs_init(struct drm_crtc *crtc)
 #endif
 	debugfs_create_file("amdgpu_current_bpc", 0644, crtc->debugfs_entry,
 			    crtc, &amdgpu_current_bpc_fops);
+	debugfs_create_file("amdgpu_current_colorspace", 0644, crtc->debugfs_entry,
+			    crtc, &amdgpu_current_colorspace_fops);
 }
 
 /*
-- 
2.40.1

