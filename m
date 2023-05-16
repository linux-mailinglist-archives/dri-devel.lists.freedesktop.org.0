Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0D77044C7
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 07:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23C510E2E8;
	Tue, 16 May 2023 05:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42F710E2EB
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 05:40:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSg/xHVuQMkGyIzYK26AHmQtQYW60UlhTqqeQm/UwaqUniIM+RhJiXrIOCWhmUvrUMEcoMLUrKv15qR7/4v89Yn7jW2EVx60QtzyNSpoM85TA4b6g3wZGxIHRMxiSg4VXmw3ATz/J/zfIN9eij5qbq/CtXZ9EBlDVgwuH6XqRDWWMoOolSrezQrb5r8qOh1uFTbYwfDeDaogs54hdNYUz4zZ5wxhc3tCNQnJmOrysVBSDlWihVfFaMLFZNj8NNrbFqb4XHjFEc7Fvp8mcgytomz5+zqXC34ocP97yhxiczjZDizabeSmiOUKJlmPMkXMp3Pm4x+PUIqgaRtDymNdyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48kxUz08mAb8fDxUIAcEiAd9ZrKwKus1OCtqsKpihG8=;
 b=oevrattiduJeQCNStM0eZ46ot8kXvuTOfdoWdEPZcS7sPRH9edfs1JA5FHs/xkRouBVah5g/D6cWaBXmuKPQTMFGYEZ17j1yNg0QRRBiS5l9zX/WymdTJSvrHfXEhnTMTCO4YdwruKMNtIObuTLPZWHQ4hbTmMHrwpVg4bK9n5ZhQFa4Ry2fGYhjAW2pSujygRmnTe9Ij3uRFAPaOtoHlEdi82kth6vwVLwAyc3+sTulXBTw8CW0K5V/SG83UoGRHV9IwjBnxhAvy0DX0C/NFM/xOR4OPXSxDPaWqkpxftYwUjiH/2/KGFvCyALbpmu6ikl6qvT7d1hsiScRCiK/gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48kxUz08mAb8fDxUIAcEiAd9ZrKwKus1OCtqsKpihG8=;
 b=Bxp9mW5DfdxLJ0u5mFmutcYf2ccC+Tzg3tp4hD3dOZekPo0Rs0WFF/J9iDC2QvGDMRalXCc+nZwyxdC6bNilxM/HbtYwc7y3uNZF7JbeQ2O8pgAPJQFRwxWoyxJEvPWI7aDCzcV13qo5xdskNikwztUUHCdWXMZGjT3Tlu0E7IY=
Received: from DM6PR08CA0012.namprd08.prod.outlook.com (2603:10b6:5:80::25) by
 CH2PR12MB5020.namprd12.prod.outlook.com (2603:10b6:610:65::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.30; Tue, 16 May 2023 05:40:30 +0000
Received: from DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::25) by DM6PR08CA0012.outlook.office365.com
 (2603:10b6:5:80::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.32 via Frontend
 Transport; Tue, 16 May 2023 05:40:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT053.mail.protection.outlook.com (10.13.173.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.15 via Frontend Transport; Tue, 16 May 2023 05:40:30 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 00:40:29 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 00:39:56 -0500
Received: from alan-new-dev.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 16 May 2023 00:39:55 -0500
From: Alan Liu <HaoPing.Liu@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/7] drm/amd/display: Processing secure display new ROI update
 in atomic commit
Date: Tue, 16 May 2023 13:39:29 +0800
Message-ID: <20230516053931.1700117-6-HaoPing.Liu@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516053931.1700117-1-HaoPing.Liu@amd.com>
References: <20230516053931.1700117-1-HaoPing.Liu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT053:EE_|CH2PR12MB5020:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eab4699-1d7e-41b0-9e32-08db55d00f7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LqW8Ko8fi4IH50WluDo5rAsORRvHjZ4Pa/y4V0qY6547jfrvPBh+QrO3T0St6VgN1hjlGRGVo0h5FBWGcSr11/wpxAFO5WZ51hjG6ik9HzGr1Hm6e2m67VOtAqAoVuXnZpm112wmakvsobcBnRDn7haE05DY9RqWKUzDIuoqq4gLsILTCnPGBy59+C9QecsI8Qtrk3CrMRzUSWZijSXLG24Kc+HsMK6kufgF+YWvSwi92+s6gyFd8CER/8bFmQEI1btikcJVRW+8ZhQQiZ1LBrsoAegYee90349SB/bZhvL+2gofPZ76JMJt/z4Oo5FCqx+ZbmVwh102ufPsab3W7a7wsKZjSOwKqgjX+ElkGyyi9YAhVYueop98C7KiwzsTtR/gbEl0Yctrb8xo0SKTXRjmZUnaOZCeWiPKVspqrhqSRGIsbKoyo7C49vm88Vx4VGLAR4WvW0f7q1AuAOXA8+9naPabcIC7eS13DqkoG5FNb5Gr6ms0fD+XxkNyI7XJyBGLLjxKi9yHh1l2QvM9H0biCO8Xh5lJ5QXysL9DjEY0eyFu7FWju6revGAve2sU0oYjmc/XZwZPj8y245Fg/pmNM67dl2WoZ/bnm5FMuw1C+nQoLNrWWug1vtTFCcFtRt8gqA1W1wP5I/8zBgK8fnweYRf67kvAMgs7bY0qAdEb9oBn+RfWYIbabZEgDbNz+36Y53LmngUQHv0NAnAOA104fmtaWBullaIYxG7Da9DpgHG+6PeciGcxCrJPcp17d17ctxqLgfva9jazo/IYtA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199021)(36840700001)(40470700004)(46966006)(356005)(2616005)(26005)(426003)(36860700001)(336012)(47076005)(81166007)(1076003)(82740400003)(186003)(83380400001)(40480700001)(15650500001)(2906002)(8676002)(41300700001)(5660300002)(8936002)(36756003)(478600001)(7696005)(70586007)(70206006)(6666004)(6916009)(316002)(82310400005)(40460700003)(54906003)(4326008)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 05:40:30.3700 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eab4699-1d7e-41b0-9e32-08db55d00f7f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5020
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, wayne.lin@amd.com, lili.gong@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Check if there is a new ROI update during the atomic commit and process
it. A new function amdgpu_dm_crtc_set_secure_display_crc_source() is
implemented to control the state of CRC engine in hardware.

Signed-off-by: Alan Liu <HaoPing.Liu@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 38 +++++++++++++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c | 57 +++++++++++++++++++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h |  3 +
 3 files changed, 98 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 14b296e1d0f6..ee016d5be7ac 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8857,6 +8857,44 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 			}
 		}
 #endif
+
+#ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
+		if (new_crtc_state->active && dm_new_crtc_state->secure_display_state.roi_changed) {
+			struct drm_roi *roi_data =
+				(struct drm_roi *)dm_new_crtc_state->secure_display_state.roi_blob->data;
+
+			if (roi_data->secure_display_enable) {
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
+				/* Update ROI: copy ROI from dm_crtc_state to dm_irq_params */
+				spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
+				acrtc->dm_irq_params.window_param.x_start = roi_data->x_start;
+				acrtc->dm_irq_params.window_param.y_start = roi_data->y_start;
+				acrtc->dm_irq_params.window_param.x_end = roi_data->x_end;
+				acrtc->dm_irq_params.window_param.y_end = roi_data->y_end;
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
+			dm_new_crtc_state->secure_display_state.roi_changed = false;
+		}
+#endif
 	}
 
 	for_each_new_crtc_in_state(state, crtc, new_crtc_state, j)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
index a83cabb9b1a6..81e9995183ad 100644
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
index f2def8c20d83..1b85d60488b6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
@@ -110,12 +110,15 @@ struct secure_display_context *amdgpu_dm_crtc_secure_display_create_contexts(
 int amdgpu_dm_crtc_create_secure_display_properties(struct amdgpu_device *adev);
 void amdgpu_dm_crtc_attach_secure_display_properties(struct amdgpu_device *adev,
 						struct drm_crtc *crtc);
+int amdgpu_dm_crtc_set_secure_display_crc_source(struct drm_crtc *crtc,
+						const char *src_name);
 #else
 #define amdgpu_dm_crc_window_is_activated(x)
 #define amdgpu_dm_crtc_handle_crc_window_irq(x)
 #define amdgpu_dm_crtc_secure_display_create_contexts(x)
 #define amdgpu_dm_crtc_create_secure_display_properties(x)
 #define amdgpu_dm_crtc_attach_secure_display_properties(x)
+#define amdgpu_dm_crtc_set_secure_display_crc_source(x)
 #endif
 
 #endif /* AMD_DAL_DEV_AMDGPU_DM_AMDGPU_DM_CRC_H_ */
-- 
2.34.1

