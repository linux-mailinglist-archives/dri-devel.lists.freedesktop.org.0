Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FB37345D9
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 12:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A46910E061;
	Sun, 18 Jun 2023 10:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44B410E061
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jun 2023 10:39:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQY28TtOGi7esEciBkpEs4wrgM2j97lSC3EtHPFJz2n3LeGiGM7LVssLeSDNLN6f/XC6jR3c89yZkd+Pq759a8HXtty2BELq7NU3bKvbnw+2tPQNFiZGDx2aSi7L+VAJN7eWA0PBbHcQISCFkA+sWUVNEnOaPbHyuYuOhMaIKhirGkihWMpTsfBR3Ns9GSjhHRsWBcx/jznLRNdSfeJria9TvGohj2ywT9l/CO1q2GaV3wcKrsB3gOy0Uclh2mC3KGQVAusTKMtLeFQqCJ8akVue6+lDn3JwIVgVR6Rq9DeMKZMjPR2vWFY4yS58t+1yV69PDdiOnUuGFHtXYpCB8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MqPfhxr5kKr4EzbFil1U6HjVF1Ff4gEnqLZbkDeA+i4=;
 b=Mzb9H0uELjijbAb6D1EYZHbgcAXWu7RVaFQO7VUrEhpYif6SQYR0hjRir1UQzNhwFV85RZc3kD69ws+uO04MUqreC5uCcEsT8/Vixbj9XUq9KWJxygo4aJ+51/YhcyL/eQa+uuTBv9mz1+YO2yG+5/OpcRQOUP69RRZCrhqmz4nZU//X0hsdYPVseMw7WLfqzBdE0pIjNMnCWINi1b5Mc6aKoppB+VvHThBgJX4ZLCEW7+y87+nDkIPpGpz93aLd6g0DQaYecerSdj/iIqf9JlGAOfh5qdIsgB8QLltB0szmZv47xAMP5q4eNrJCcUdyz1I6MEr1A8kfVwoaHAo5WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MqPfhxr5kKr4EzbFil1U6HjVF1Ff4gEnqLZbkDeA+i4=;
 b=yn1sTTBC6UCPNdHPx/0o5OdqVkQKRNJXBamruZloSZF1qxgIgEUr9OX5Gt21ryQ3m3p6KsI0ZubRiG9A+6i/0AW5aVu3dG6X3c/hltKHX7dScwiWabCXaDwtUSR/KfpGRnHoneu+OPakCCYDXhrlOaRAsOxPeQlkKLAKqgmy7hU=
Received: from MW4PR04CA0072.namprd04.prod.outlook.com (2603:10b6:303:6b::17)
 by MW6PR12MB8999.namprd12.prod.outlook.com (2603:10b6:303:247::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Sun, 18 Jun
 2023 10:39:13 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:303:6b:cafe::a7) by MW4PR04CA0072.outlook.office365.com
 (2603:10b6:303:6b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35 via Frontend
 Transport; Sun, 18 Jun 2023 10:39:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6544.4 via Frontend Transport; Sun, 18 Jun 2023 10:39:13 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Sun, 18 Jun
 2023 05:39:12 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Sun, 18 Jun
 2023 03:39:12 -0700
Received: from alan-new-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Sun, 18 Jun 2023 05:39:05 -0500
From: Alan Liu <HaoPing.Liu@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 2/3] drm/amd/display: Create checksum_region properties and
 handle new region update
Date: Sun, 18 Jun 2023 18:38:46 +0800
Message-ID: <20230618103847.614721-3-HaoPing.Liu@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230618103847.614721-1-HaoPing.Liu@amd.com>
References: <20230618103847.614721-1-HaoPing.Liu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|MW6PR12MB8999:EE_
X-MS-Office365-Filtering-Correlation-Id: 389513a8-b1e8-4fc5-ccf9-08db6fe841ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZMUnYTPiFEGCyYcp1vuLFGNQW+tBPM/UJBmMmEubiG7ZVU7TyerSsE1LcRRRTMRBCfu+x6lucGtY1O2rEFRP3wmEnD0tCxL23A34vPtzYMqgrIftipjC+rm3t4CDv7Z40uBcbpimCAWhFZ0yFbpGRVh6jCbq5tNSIBF5/1SaoaxgG8BDHFqV5bsgeOlf8VBIMHvHFF5pQUzfZMAKX0FkZxJxVwAb2BS97IbathlBCxMcV41YIZVhhoIDROMJNF7DLws2oeyKlGVwDDouiGcwNLXnzMXVqZ1LvVfvoKSzFaiuV/nSRh9Cwks0kU6t/l6nAomhkY8gS4sECKMht2hxjcpJdFKNElyZ8TGjqIclcw7fA7pMKOdh0iu1xZbLbfmlmAmm07JoZypOosOb1HH5NIcTX+Tw7l1C4STDeeY0V4gXCAtK8YXtfkDJgCX78QPX9DEPol9zTbAPro3arFKom9TXcn1cRykp7VY87EHOfTMbZuk1arns7a9Yz1vJ3Ru9r93sRP5f0NbS33hcB3bjK2lIa26AO5RycUqfqJcrbA5pPatpbRbE1ZC7EOxEnmkzAU7WGStc6LJsUvspZp6FvRZIJD8Oy+4wo++mzBt4RLSJDAvX/wwu9o/bjKEgAGwcoPDTsnuZFTIZioHy+SLSD9KG03vKbNLImcN/pqqXVWHGwD6Vonfr7VMr3d/xM7GEcsTFpEXlMz+5MsOKQ1zZUtU6RHqxtrSqkm85DLV7l96zLAL+qccEO6aAq/TYdO5ry81YR1WrvE4KRfjH57sU7A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199021)(40470700004)(46966006)(36840700001)(82310400005)(356005)(82740400003)(81166007)(40480700001)(40460700003)(36756003)(86362001)(6666004)(7696005)(186003)(26005)(1076003)(8936002)(8676002)(15650500001)(5660300002)(2906002)(478600001)(54906003)(316002)(6916009)(4326008)(70586007)(70206006)(41300700001)(36860700001)(336012)(426003)(2616005)(83380400001)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2023 10:39:13.1717 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 389513a8-b1e8-4fc5-ccf9-08db6fe841ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8999
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, Wayne.Lin@amd.com, Lili.Gong@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This commit creates checksum_region properties at CRTC initialization,
and update the new region during the atomic atomic. A new function
amdgpu_dm_crtc_set_secure_display_crc_source() is implemented to control
the state of CRC engine of DC hardware.

Signed-off-by: Alan Liu <HaoPing.Liu@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 38 +++++++++++++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c | 57 +++++++++++++++++++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h |  3 +
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  5 ++
 4 files changed, 103 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 90de0d37f1d2..26da07a25085 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8870,6 +8870,44 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 			}
 		}
 #endif
+
+#ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
+		if (new_crtc_state->active && new_crtc_state->checksum_region.region_changed) {
+			struct drm_checksum_region *region_data =
+				(struct drm_checksum_region *)new_crtc_state->checksum_region.region_blob->data;
+
+			if (region_data->checksum_region_enable) {
+				if (!amdgpu_dm_crc_window_is_activated(crtc)) {
+					/* Enable secure display: set crc source to "crtc" */
+					amdgpu_dm_crtc_set_secure_display_crc_source(crtc, "crtc");
+
+					/* wait 1 more frame for CRC engine to start */
+					acrtc->dm_irq_params.window_param.skip_frame_cnt = 1;
+
+					spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
+					acrtc->dm_irq_params.window_param.activated = true;
+					spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
+				}
+
+				/* Update ROI: copy ROI from crtc_state to dm_irq_params */
+				spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
+				acrtc->dm_irq_params.window_param.x_start = region_data->x_start;
+				acrtc->dm_irq_params.window_param.y_start = region_data->y_start;
+				acrtc->dm_irq_params.window_param.x_end = region_data->x_end;
+				acrtc->dm_irq_params.window_param.y_end = region_data->y_end;
+				acrtc->dm_irq_params.window_param.update_win = true;
+				spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
+
+			} else {
+				if (amdgpu_dm_crc_window_is_activated(crtc)) {
+					/* Disable secure display: set crc source to "none" */
+					amdgpu_dm_crtc_set_secure_display_crc_source(crtc, "none");
+				}
+			}
+
+			new_crtc_state->checksum_region.region_changed = false;
+		}
+#endif
 	}
 
 	for_each_new_crtc_in_state(state, crtc, new_crtc_state, j)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
index 0802f8e8fac5..26017e9fbc4a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
@@ -465,6 +465,63 @@ void amdgpu_dm_crtc_handle_crc_irq(struct drm_crtc *crtc)
 }
 
 #if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
+int amdgpu_dm_crtc_set_secure_display_crc_source(struct drm_crtc *crtc, const char *src_name)
+{
+	enum amdgpu_dm_pipe_crc_source source = dm_parse_crc_source(src_name);
+	enum amdgpu_dm_pipe_crc_source cur_crc_src;
+	struct dm_crtc_state *crtc_state;
+	struct drm_device *drm_dev = crtc->dev;
+	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
+	bool enable = false;
+	bool enabled = false;
+	int ret = 0;
+	unsigned long flag;
+
+	if (source < 0) {
+		DRM_DEBUG_DRIVER("Unknown CRC source %s for CRTC%d\n",
+				 src_name, crtc->index);
+		return -EINVAL;
+	}
+
+	enable = amdgpu_dm_is_valid_crc_source(source);
+	crtc_state = to_dm_crtc_state(crtc->state);
+	spin_lock_irqsave(&drm_dev->event_lock, flag);
+	cur_crc_src = acrtc->dm_irq_params.crc_src;
+	spin_unlock_irqrestore(&drm_dev->event_lock, flag);
+
+	/* Reset secure_display when we change crc source */
+	amdgpu_dm_set_crc_window_default(crtc, crtc_state->stream);
+
+	if (amdgpu_dm_crtc_configure_crc_source(crtc, crtc_state, source)) {
+		ret = -EINVAL;
+		goto cleanup;
+	}
+
+	/*
+	 * Reading the CRC requires the vblank interrupt handler to be
+	 * enabled. Keep a reference until CRC capture stops.
+	 */
+	enabled = amdgpu_dm_is_valid_crc_source(cur_crc_src);
+	if (!enabled && enable) {
+		ret = drm_crtc_vblank_get(crtc);
+		if (ret)
+			goto cleanup;
+
+	} else if (enabled && !enable) {
+		drm_crtc_vblank_put(crtc);
+	}
+
+	spin_lock_irqsave(&drm_dev->event_lock, flag);
+	acrtc->dm_irq_params.crc_src = source;
+	spin_unlock_irqrestore(&drm_dev->event_lock, flag);
+
+	/* Reset crc_skipped on dm state */
+	crtc_state->crc_skip_count = 0;
+
+cleanup:
+	return ret;
+}
+
 void amdgpu_dm_crtc_handle_crc_window_irq(struct drm_crtc *crtc)
 {
 	struct drm_device *drm_dev = NULL;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
index 748e80ef40d0..f4765bcae840 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
@@ -97,10 +97,13 @@ bool amdgpu_dm_crc_window_is_activated(struct drm_crtc *crtc);
 void amdgpu_dm_crtc_handle_crc_window_irq(struct drm_crtc *crtc);
 struct secure_display_context *amdgpu_dm_crtc_secure_display_create_contexts(
 						struct amdgpu_device *adev);
+int amdgpu_dm_crtc_set_secure_display_crc_source(struct drm_crtc *crtc,
+						const char *src_name);
 #else
 #define amdgpu_dm_crc_window_is_activated(x)
 #define amdgpu_dm_crtc_handle_crc_window_irq(x)
 #define amdgpu_dm_crtc_secure_display_create_contexts(x)
+#define amdgpu_dm_crtc_set_secure_display_crc_source(x)
 #endif
 
 #endif /* AMD_DAL_DEV_AMDGPU_DM_AMDGPU_DM_CRC_H_ */
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 440fc0869a34..e94fe4a7e492 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -461,6 +461,11 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 
 	dm->adev->mode_info.crtcs[crtc_index] = acrtc;
 
+#ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
+	if (drm_crtc_create_checksum_region_properties(&acrtc->base))
+		DRM_ERROR("amdgpu: failed to create checksum region properties.\n");
+#endif
+
 	/* Don't enable DRM CRTC degamma property for DCE since it doesn't
 	 * support programmable degamma anywhere.
 	 */
-- 
2.34.1

