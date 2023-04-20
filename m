Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D379B6E9615
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 15:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2D710EC52;
	Thu, 20 Apr 2023 13:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::61b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7522E10EC52;
 Thu, 20 Apr 2023 13:43:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sn++s+aNv51tdBYHQM9ZpIg5xvVvbaNyN5XFK6Qe6WjA1RNdiKA8m8vKb+cZ4F1ER76FMco1sHVgD4CljBGA76zZxU/iB2Rktw3Fo4xoKNbEj9sJ4i+EDtmrvGvzVNwRTHAl1v7LcCaSpMKFKyvC3cedK7ome7WEHd2K1wN/QWjFp3m9+AHkL4fzHn1Pe3IISdjtNY83A8bXRbY6jF0n+uCUCQU3bQC0CtShHOTyPh/ZWct9k8tvvsf+eao7u58R4TSYJ0djgA/EHZvWiZWEHmN+ym5hdcLVPf7qOkpbKgqO8ZEJKRs8Gxwv1HuRe/NZuzmDQaEliwSFioZB4rNLmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FqJeypf4C1RWIrqYpWO+/PkdBV9QwjnGTIQ6dN2J+E=;
 b=aLJ469m4u02QuqflS5Y0H58zGL/hbzI9Eun9r5bq9qsw92SDUq4FO/UDLBBg4YO3Vd//w3EVh/IWH/AD5rcO18AC9YMq3e8RAkFGNL6XldkPJwbVXb6aduwyGOyAu6Ao8LmEY2lMRIE52AC8ZYyAanECYZ6AmEhoxZZiakzW0xVzjAjATQazhJC9HrVY2kmy8RrgBuqyWvRKITIaDT4YyryQ34tgZykkMRWcgAszsc5/+Uvm2mEGw6BBh8LYMdIKd87gEhP9Y6dqzMkzL9cvj4haLfHEHjZaT0gZU4M3PGZn1ndBp3/QgDlEoYgWXlueF4RvylecPMoL8YW1PiazQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FqJeypf4C1RWIrqYpWO+/PkdBV9QwjnGTIQ6dN2J+E=;
 b=4aDJWMbf1lO5NHQa1VaJXKO1VGmLaQpxu4e+ffDKIhibDzNL1AYdpGyhlQXe638ViysFsvSXjKUkTr8kz3ABillsn922LqAKbZvNLYEVBA1y3Fh+nLzfQTg+Bjz04EBlBXr97FTW3Nb1ZwW8jOGVRBVzhPuGeEpKQRfFZKPjL1w=
Received: from MW4P221CA0016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::21)
 by MN6PR12MB8470.namprd12.prod.outlook.com (2603:10b6:208:46d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 13:43:13 +0000
Received: from CO1NAM11FT108.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::e4) by MW4P221CA0016.outlook.office365.com
 (2603:10b6:303:8b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.25 via Frontend
 Transport; Thu, 20 Apr 2023 13:43:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT108.mail.protection.outlook.com (10.13.175.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.24 via Frontend Transport; Thu, 20 Apr 2023 13:43:12 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 20 Apr
 2023 08:43:10 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3] drm/amd/display: fix flickering caused by S/G mode
Date: Thu, 20 Apr 2023 09:44:13 -0400
Message-ID: <20230420134414.44538-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT108:EE_|MN6PR12MB8470:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a53f3d8-33d8-401d-4354-08db41a52fd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QXRhuegdxGptzatHx09abORt1qtjL4jIWhIePKY62XpWHVtPFPEHPgcGkJVopK45m4AXMgvOX372D9Y38Kb8kf+ROvHeCICRgZKI3cUJTOIj1jtIxJi7w4aOnyO3GzY0XqotdhdgRDv67S5xfYF7jtzrk6H+2Fhs4LqxI2+hbmqtOsUIxDiA/xoAsPJxENCdL84AgScCG95vGsZ8lTyE4esT+XRiYit0AFEIJZaY2oOqJ4hHEvxYg0R1jtKc/mKssXpaSdH3cy+jpfMjqUa28jCppopfA0OcfkZZsjA7lVxufNuboQOmaMpuGlFnOSLcBRTMQiOGXCc93zUQ0cSlab3BO+s7pdWKyPxLvQ3I94zK65aweAOrIWrSfCg0dPiWAEQIcPR62ofnD9SmPNmdZuMzmavzz5zEPka4KQ9Q7cD/ef5t85qQL1VDcfbLVKAaz93WB5OnzsAOF7zN6xr4HvoLl7OE68tC2i7fH9k3grxnSw1ywEOV/4IuCzwoDs/Z+k9g7L7lACLU//m/y8izzI0fgto4BegQ2wQsHf39r5YJq4LXqPbf98HFV7fx7OD1XJtUP+TNNCKGOCgBXTwNvZlYyJYT4pIqY32Vj/BTfr7qBDHtNj8PVZMuOlHA7srCnZPzMDU4XnQ+O8ZyQNKxhiIjJMx0rR+Ko4+gMfk98iy6Gr8ngpn1GauxE1JGfIUscX62tmsvvyIrzwDcKHUoAg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199021)(40470700004)(36840700001)(46966006)(8676002)(41300700001)(8936002)(47076005)(40480700001)(2906002)(966005)(44832011)(5660300002)(83380400001)(40460700003)(356005)(54906003)(86362001)(36756003)(478600001)(82310400005)(2616005)(1076003)(26005)(81166007)(336012)(426003)(16526019)(186003)(82740400003)(316002)(4326008)(6916009)(36860700001)(70586007)(70206006)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 13:43:12.9344 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a53f3d8-33d8-401d-4354-08db41a52fd4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT108.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8470
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
Cc: Stylon Wang <stylon.wang@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 dri-devel@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Hans
 de Goede <hdegoede@redhat.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, on a handful of ASICs. We allow the framebuffer for a given
plane to exist in either VRAM or GTT. However, if the plane's new
framebuffer is in a different memory domain than it's previous
framebuffer, flipping between them can cause the screen to flicker. So,
to fix this, don't perform an immediate flip in the aforementioned case.

Cc: stable@vger.kernel.org
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2354
Fixes: 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v2)")
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
v2: make a number of clarifications to the commit message and drop
    locking.
v3: use a stronger check
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index dfcb9815b5a8..875111340203 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7900,6 +7900,13 @@ static void amdgpu_dm_commit_cursors(struct drm_atomic_state *state)
 			amdgpu_dm_plane_handle_cursor_update(plane, old_plane_state);
 }
 
+static inline uint32_t get_mem_type(struct drm_framebuffer *fb)
+{
+	struct amdgpu_bo *abo = gem_to_amdgpu_bo(fb->obj[0]);
+
+	return abo->tbo.resource ? abo->tbo.resource->mem_type : 0;
+}
+
 static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 				    struct dc_state *dc_state,
 				    struct drm_device *dev,
@@ -7919,6 +7926,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 			to_dm_crtc_state(drm_atomic_get_old_crtc_state(state, pcrtc));
 	int planes_count = 0, vpos, hpos;
 	unsigned long flags;
+	uint32_t mem_type;
 	u32 target_vblank, last_flip_vblank;
 	bool vrr_active = amdgpu_dm_crtc_vrr_active(acrtc_state);
 	bool cursor_update = false;
@@ -8040,13 +8048,17 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 			}
 		}
 
+		mem_type = get_mem_type(old_plane_state->fb);
+
 		/*
 		 * Only allow immediate flips for fast updates that don't
-		 * change FB pitch, DCC state, rotation or mirroing.
+		 * change memory domain, FB pitch, DCC state, rotation or
+		 * mirroring.
 		 */
 		bundle->flip_addrs[planes_count].flip_immediate =
 			crtc->state->async_flip &&
-			acrtc_state->update_type == UPDATE_TYPE_FAST;
+			acrtc_state->update_type == UPDATE_TYPE_FAST &&
+			mem_type && get_mem_type(fb) == mem_type;
 
 		timestamp_ns = ktime_get_ns();
 		bundle->flip_addrs[planes_count].flip_timestamp_in_us = div_u64(timestamp_ns, 1000);
-- 
2.40.0

