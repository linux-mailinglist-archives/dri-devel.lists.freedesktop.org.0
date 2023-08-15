Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFB177D0F9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 19:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3061210E252;
	Tue, 15 Aug 2023 17:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB47610E1A9;
 Tue, 15 Aug 2023 17:27:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gz+RXLK3KcAJpvk5F/pGsFNCbzDIuunFkWV6W5Q8tEiAU6g4g268XoeQYkUt9L7l3GG4GyuLPOVSTlA160luO8AUZt5/77ay1gjx0THqfAYmiZaGTPIAeGIQyS5PMTEMN4L12Wp4Q3RF9ZmoDoDv0Ni1+lw1OBKlYooKrXnL/MoeY7P8Ds+lmxX9druV/T9Q7NdazvOQMRYtCSIfqaeHmCVNnQAVcv6bSbhzgxOzqR3LB68YxliBCuurIQQKKnNJTB0w4N9dGkVB6nUVNVMqzuMndTH1kPZi+uwY9GOwfWLijmi8NcfJhtmK0rLck352alqOo/C+q3OJplragwCzcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOUSCsNDCAIp8YpWpHMbfh2vVSKvFWnaq1lN09g7NGo=;
 b=HRx7t+AGb3H4sXSm5WV2E/H1aLcnfMGVz62iipEnDrS7xjKky1SJnC1xo4W+2btXgaxRbFbZbm2aG3ZSOSbg3dEGF6fUNZ13SBrXBS/1HMM6FT9RS2QtBCLrbOVz+YdANjRHBfEK3bhEUdkL9l+CWRzWGESN6ZCJeaf7oVm8iaA0W0GX/g8mwCb1wKlxopzKyjTMvq3yoWYgXE0+DzQhZu/6mpb04sZhkLlteex91iWgZrzz3snrq+Fog2dgrj8xZeux+o4kTwhPc3LWMxMKIvgBrdiHkLCS5VNB403W5A516G7JzDpE+1WW2uJXdRFT5iwMf44QwlUV4oaJ3vLG2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOUSCsNDCAIp8YpWpHMbfh2vVSKvFWnaq1lN09g7NGo=;
 b=d2ft8p2xkefN16eEW0bgdh54gSdhk8/vYLCy9NGfWBJp38dmy3SZI9dsYbL0W34+XrTIvso2sREdsTp6jGVar8YkEpjzbTOTAUmFs9V80VBzsgbxMd/W252nS7SzgEA5LuYoTLOztSJqRSeNIbYvV6OuRbPXIirG3tyBM7KTa7Q=
Received: from BY5PR13CA0010.namprd13.prod.outlook.com (2603:10b6:a03:180::23)
 by SJ0PR12MB5662.namprd12.prod.outlook.com (2603:10b6:a03:429::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 17:27:16 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::fa) by BY5PR13CA0010.outlook.office365.com
 (2603:10b6:a03:180::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Tue, 15 Aug 2023 17:27:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Tue, 15 Aug 2023 17:27:16 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 15 Aug
 2023 12:27:15 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amdgpu: register a dirty framebuffer callback for fbcon
Date: Tue, 15 Aug 2023 13:26:59 -0400
Message-ID: <20230815172700.255596-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|SJ0PR12MB5662:EE_
X-MS-Office365-Filtering-Correlation-Id: ed5f8ff1-ff06-4fb9-1b5d-08db9db4df18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /XMMgycdlRLzrrzs8SE14ORgQpc6AeFJg20xmiIaMa9jMvgJRL2kZHDe4wsx0XAJzm3W1D/ceBfq9b9jhCiY5rO2JspiHMj7L0U0VGcLXo4duUR8ZBEbgf/wAWFi7n6LP/LzpciWq86DmYlekMc0+gWaRxFn3pKtCOp+HuZMAIxb2xXgLbJa1pe79kNgZoErvbQeaz55jFzlpIqqrIpDGmhOG5G8yTTz6anZiJDopBISe/xnlXrUwZV81WyCbQ14fyLAPE61w3EWdHYsZg+7rPu0XUA9wdduB8gak+G3mpBOeObkxlTReG3Rdd1UvDxyXqFAoxycoSmvruvCg5U0+jMKRUZzndfp7HQjSZ9i5aWrNXUK7c3AHKDoz7jpSD9QDbObUQnB3yqre076pQmkF6c2VWTHEdgINLAU0CCfzGd67Sgsla5+ZGO9hHz3CXexHGBpxICHWi202S1j51ZTNPpVwvsQ32pLs4mF6NyfeRKIuEgA73Fho5T5KeGDo9ryjUBLOyHj5n6DxY7lEtpFxq8oBuj8Lh93rhj/kzAGPpRCo34+ywFyDUy4L+e+s6W6QCTZAUbL6WvlHKYnEiE97elCqs4S8gPb5/6LUws94Y/rLMNPqYP+lzi/JsYO8sRFC+bDlECp6Sls/P++/9Yf0f4KUAoncYtOhukbw57VY8iCOmPC7VOwH1XbLsXr406YeSQQOE6ZlVaE0fx0GldF0i/n6oWlZTqBmSi/E4Myg/WpNmG5W/iV2M2th4rBss0PPo1WSLdeG+EOB036uAlK1bUCRKgWtx4sPoZC20xxurHYR35h6ad0ToldnbG+V8qk
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(396003)(136003)(346002)(186009)(451199024)(82310400011)(1800799009)(46966006)(40470700004)(36840700001)(26005)(1076003)(336012)(40480700001)(36860700001)(81166007)(966005)(6666004)(16526019)(54906003)(478600001)(356005)(70586007)(70206006)(4326008)(316002)(6916009)(44832011)(47076005)(2616005)(41300700001)(426003)(86362001)(40460700003)(5660300002)(83380400001)(2906002)(8676002)(8936002)(36756003)(82740400003)(14143004)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 17:27:16.5161 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5f8ff1-ff06-4fb9-1b5d-08db9db4df18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5662
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
Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Guchun Chen <guchun.chen@amd.com>,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fbcon requires that we implement &drm_framebuffer_funcs.dirty.
Otherwise, the framebuffer might take a while to flush (which would
manifest as noticeable lag). However, we can't enable this callback for
non-fbcon cases since it might cause too many atomic commits to be made
at once. So, implement amdgpu_dirtyfb() and only enable it for fbcon
framebuffers on devices that support atomic KMS.

Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: stable@vger.kernel.org # 6.1+
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2519
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
v2: update variable names
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 26 ++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index d20dd3f852fc..d3b59f99cb7c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -38,6 +38,8 @@
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -532,11 +534,29 @@ bool amdgpu_display_ddc_probe(struct amdgpu_connector *amdgpu_connector,
 	return true;
 }
 
+static int amdgpu_dirtyfb(struct drm_framebuffer *fb, struct drm_file *file,
+			  unsigned int flags, unsigned int color,
+			  struct drm_clip_rect *clips, unsigned int num_clips)
+{
+
+	if (strcmp(fb->comm, "[fbcon]"))
+		return -ENOSYS;
+
+	return drm_atomic_helper_dirtyfb(fb, file, flags, color, clips,
+					 num_clips);
+}
+
 static const struct drm_framebuffer_funcs amdgpu_fb_funcs = {
 	.destroy = drm_gem_fb_destroy,
 	.create_handle = drm_gem_fb_create_handle,
 };
 
+static const struct drm_framebuffer_funcs amdgpu_fb_funcs_atomic = {
+	.destroy = drm_gem_fb_destroy,
+	.create_handle = drm_gem_fb_create_handle,
+	.dirty = amdgpu_dirtyfb
+};
+
 uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
 					  uint64_t bo_flags)
 {
@@ -1139,7 +1159,11 @@ static int amdgpu_display_gem_fb_verify_and_init(struct drm_device *dev,
 	if (ret)
 		goto err;
 
-	ret = drm_framebuffer_init(dev, &rfb->base, &amdgpu_fb_funcs);
+	if (drm_drv_uses_atomic_modeset(dev))
+		ret = drm_framebuffer_init(dev, &rfb->base,
+					   &amdgpu_fb_funcs_atomic);
+	else
+		ret = drm_framebuffer_init(dev, &rfb->base, &amdgpu_fb_funcs);
 
 	if (ret)
 		goto err;
-- 
2.41.0

