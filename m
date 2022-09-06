Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2603C5AF524
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 21:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CA510EA71;
	Tue,  6 Sep 2022 19:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2938F10EA71;
 Tue,  6 Sep 2022 19:58:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KqlsLPnO0R/ikCznhYd72v93eoQcHC0umO6G8EgDlG1hSSTi4z/w9mmJBq+MHjYwu1yG5b/6q1WBc17JE6LXTyXIQ+byidvNINZ+MIJumqta+2zMUAokEp3xSraBGoterhEXrYDtdcPXo6/8ktXXgxi4cqQHYJeTYHc+xV6YKURAI6AYsBoZQIXCwpmrJGEUdBrtO2ulF9DSYtV5AlXHBj1hAhdq0LxZoN9tBkwhGfq1tdJBPzMjEacOK1JuHzym/m9WRjC4IxKSdZ19GhWSzKaCTwZycEa1sUrxFjTsuZ0z9uoKlogGPusT4JQoGLwTyIkznz+VqIgX9ZbryocN8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/A0VjPIpxRk4uT4RJ8rAWI1igWPcuHgCVBC+CTrE+IM=;
 b=d+bLuizBm0lmCS2jIGz35OifbkBaqkXeoZRftb/GAoAfQDK2MU22+1SYo4Yn6aW+z/dHtVR/H985nxPNmAQirPWTtjhHHdm+sjsamaxZUgMqsQww7l0jW22Ew2WZ3dZ1ZhslDHa2NJz+2UfxzomGnEksa7uiKk2vi/c1jk2Mn25AlWCQk7EFBqTyx138dL88x6aK4OH/wV0Bv5QTYP/DU5GnUG6EK7i1+7VP9g8NXh6zN8rZt9g94msH5kazbKKoMns9E+g0w3SBbXkl8EsQV+FBwTKzQ1Bk9LM5LjdepNKCfUjzoJyZsbZkSe67ClaL9Vqw5OM++ycgWVb+udptTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/A0VjPIpxRk4uT4RJ8rAWI1igWPcuHgCVBC+CTrE+IM=;
 b=Ygo3nw0Ll0a45LtQFt0KgsAN0XxB3bVAYOZACRkdCfea68bl67Qfch6iC+5AytUUYH++tEyukHIBhNst0jsgtBEqG0qSnxXXDaPjRgoiEsWu/Im7qWTBHA2Iytq5lL2vHUfcT2egXZNusGVOVjYiaUfZufuWdJU0DjciEpAHAo4=
Received: from BN9PR03CA0960.namprd03.prod.outlook.com (2603:10b6:408:108::35)
 by DS0PR12MB7536.namprd12.prod.outlook.com (2603:10b6:8:11c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 19:58:18 +0000
Received: from BN8NAM11FT099.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::d5) by BN9PR03CA0960.outlook.office365.com
 (2603:10b6:408:108::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Tue, 6 Sep 2022 19:58:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT099.mail.protection.outlook.com (10.13.177.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Tue, 6 Sep 2022 19:58:16 +0000
Received: from hamza-pc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 6 Sep
 2022 14:58:14 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/amdgpu: use dirty framebuffer helper
Date: Tue, 6 Sep 2022 15:57:20 -0400
Message-ID: <20220906195721.143022-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT099:EE_|DS0PR12MB7536:EE_
X-MS-Office365-Filtering-Correlation-Id: 412f0374-5242-4eb9-b129-08da904223df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fn/MB5uQ4L1tS1kzM92uNggkjyHMo0CS/h/bWYNHVVpMWfAtfLrX0HfPMWMACwSj0SLZ7iA1visGkHakuEd5d8e6ad7uuR3xCEPNpQmgL1VdaFDLp4GPkWqPr4VBm1D4DdljrTXvRHGzMa4Kh0JPqLWTMoEFh/2yUjW/PopJoaFfsJCSewWCnNleKglXFEWcNBwcZIaKCJn2ohHIGi4jZUfhmSYzTijn2zFhXhx2XLxSBCelan7LYiy3DSfSARKf8r8QDebrOP9KRMyEPv49JedcNtU6VlsuP9zlC/28JllLGPQeIc18RppoviIMzlMYbjJKLMlthYJXYXezQjO0OTeQ/ZMEHGxzYaKPtIp1yTD4DbjYr2TqM141dgndmCB8yU5KuLOIiNqZ2KEoOj3CKhpi/cl4tFA5IubrkrUevY4Ufej03blV4d/wPlzCog+neb3g2DPv3KZcxD+CEdQNngIGUN+HbzKZQU0rSO5qaZEtBPp+p4rko2iocDyqo7rfyh0zSJA3s5Mls7Q9MidY5fZD9li70kQM0ZoGP7uEgSat7cjSu3GqGg/TXA20nPhxkZU/xqe4JSLLCHNKeuzORVDzfq5jxEGqfSCEKIVUgySfzeEPsTHM+1vDfGhu7HBBLux1stO/bF0mIuwqihaQ3c5/zZNebDD1T9yQgiIbstRuMW74jldw0Qerr+D67NfEDYzn7QVMZw90c2vxaw0gk7nraYINOVGX8r9soq3MzQ62emha3IdOuTZ/zNafJuX4ueyCzclq+55OpcOhL76fczXlPqOQHxDHyr/g+NhC2WPX2s2nHpMNdOz11aIn68hgRVbZ7ElfXy5dXj8oVd2O3FtgCzzzv5hDtAYVpDQIMDg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966006)(40470700004)(36840700001)(47076005)(8936002)(426003)(6666004)(82310400005)(36756003)(26005)(36860700001)(7696005)(2906002)(82740400003)(336012)(186003)(2616005)(1076003)(44832011)(16526019)(5660300002)(70586007)(70206006)(8676002)(4326008)(41300700001)(478600001)(81166007)(40480700001)(40460700003)(356005)(316002)(6916009)(86362001)(54906003)(14143004)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 19:58:16.9825 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 412f0374-5242-4eb9-b129-08da904223df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT099.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7536
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
Cc: Guchun Chen <guchun.chen@amd.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 amd-gfx@lists.freedesktop.org, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Sean Paul <seanpaul@chromium.org>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Fernando Ramos <greenfoo@u92.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, we aren't handling DRM_IOCTL_MODE_DIRTYFB. So, use
drm_atomic_helper_dirtyfb() as the dirty callback in the amdgpu_fb_funcs
struct.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index c20922a5af9f..5b09c8f4fe95 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -38,6 +38,7 @@
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_fb_helper.h>
@@ -496,6 +497,7 @@ bool amdgpu_display_ddc_probe(struct amdgpu_connector *amdgpu_connector,
 static const struct drm_framebuffer_funcs amdgpu_fb_funcs = {
 	.destroy = drm_gem_fb_destroy,
 	.create_handle = drm_gem_fb_create_handle,
+	.dirty = drm_atomic_helper_dirtyfb,
 };
 
 uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
-- 
2.37.2

