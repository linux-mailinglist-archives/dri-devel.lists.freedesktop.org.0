Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD9B3C6407
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 21:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B7089D81;
	Mon, 12 Jul 2021 19:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D807489D7D;
 Mon, 12 Jul 2021 19:46:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKbjz1fimuuUhRtllOZE2aDH2DDUx0XYTwlbXRoqUe3OuhMKfo7g3nyzjx0h1Di/EqjEnKW4XEJraLaWHScbM2aGz0N3nADHVl4gfHD/je3Jth8slnuZ1ukNVkP5zv4dT3X5QQal54nGkHZOnwjMWW1T27kKH4Ez34ZTvmA1xijMYHHjadyiNWICI9Nbvi0i4vm5iwN/SZ0OxlbIRqlVDEOxa1M0JCkHs6Lje+tb7QjWMEz6+ejfmIeyCKFMBTcOpgJd+XQR+/g/E35KjUp0sYaNBm1EoejUJpFBlfeXLz15mm+e8m5AtAfaSL7UZ2pgPLdoeUX5T05v4hYxD0dlaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXhG+YipmsWAcNIv2qlksaELl1YdzALDxuR1/TkUeKY=;
 b=R21VvplHeWQeW6y+5WCezmMZj3tCxuIfO3mtHHFVp2QhQI3GtqW3n0S83KvviAFmNmvqCh7ckTukiYkdbpev+e7jiaFjl/97Ea3Reko0KkBGzVDZvY4puUo3TZ0gEt3COAl+qR597hAzsyMoFDuiPRmh3vCZqG1agroJhLmMB02HfAZBGM0yIW6rzzAqLa9sZcTf5moFadnJ0nnch1SSU5+2naPNiyAoF9gVpcyveyBcTnnWh8CKdTGDwlmkL0ZWqGH7P7H05Dj1s5/uyGeDKzS4BuREFPRFzgCxrueee7ctajT5MCEMcd5a21ZDvW9jsVUk4OEr3qM3XgRqQxqEoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXhG+YipmsWAcNIv2qlksaELl1YdzALDxuR1/TkUeKY=;
 b=bgd0t5Ci+Xw6UvbMzYip4se1mrjv9G0t9M3sP+EfAVYVULlkD+kCUNrkKY2Ekuu6GFfo7bTayqqzKOsiD9oEyMoOM8yMvcEEWFQVGeCAYeGNbWwfxVyBFRnzgX/gGJbTRoofDTN/3zV6+m0W0anc96NMhSD7wzzR4BWXMmbuzGg=
Received: from MW4PR03CA0231.namprd03.prod.outlook.com (2603:10b6:303:b9::26)
 by DM6PR12MB3115.namprd12.prod.outlook.com (2603:10b6:5:11c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Mon, 12 Jul
 2021 19:46:47 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::f8) by MW4PR03CA0231.outlook.office365.com
 (2603:10b6:303:b9::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Mon, 12 Jul 2021 19:46:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4308.20 via Frontend Transport; Mon, 12 Jul 2021 19:46:47 +0000
Received: from devbox.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 12 Jul
 2021 14:46:45 -0500
From: Ryan Taylor <Ryan.Taylor@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amdgpu: create amdgpu_vkms
Date: Mon, 12 Jul 2021 12:46:27 -0700
Message-ID: <20210712194629.4569-2-Ryan.Taylor@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210712194629.4569-1-Ryan.Taylor@amd.com>
References: <20210712194629.4569-1-Ryan.Taylor@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7f4b0a4-e804-46c8-11d0-08d9456dc8e3
X-MS-TrafficTypeDiagnostic: DM6PR12MB3115:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3115E9144FB39334001FDEDFEA159@DM6PR12MB3115.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y4pgXgthimfTREosXK8OsuDGByzTmp48Xc3I4Oh1k8xn6SB+hmP+yfXnPp4jX8Zk9SGlJTvQqEOtm/Jom9m55Qxy3XBhCsQfb23DzXDVb6BLbA+Pd/MHfiHkOSQWED41l5XNLCMJLF5u1kZxrpE4X/tbED3+wX82a07oBo5XlK8yRX4tvTZuUt+9GlXTOjeP2v9wBz2OHdhw0LjqBXU0HEsurQoyTpvOgGbW3HgjkD9wEQcZ1sTcrNLJMr/ZyIgXs5iyZIASucOIb4Q1FR6Y/R3Nmz35G/nCSBZ23BNQdMQqIUoLDgnSXNWUfX+6e+UzGnasAqvNyrY5HjaTuUIo9QJlemtziuEfqG0sflKGR4GsUAK5i40CFCOVIhdq1ZJisOd7jXMxS6JdsPoOQTeUhULKrAcSMuv6ppkJZjgJ9p41R9oSijxhxj2gnpRbdnt5Rsc/YSBbIKthG9N8xRlIcEvGFwJ5Ub6ygKizQhXudENAmLGV3AvefM4GIj2uQ27PCspgPpDswR7CLszl4MNehi3an//VYOQ8dYl+Agjru4Pzjg04w8GvLSqygHGBatNW0fc2DsE9l4mL1m6/GKWTLwJ1Nzt/nTwCuJQpZKGCIFvX4l68HR99hMDt3LUyTt98DW8iwXCbEoKEJFqoec/wYeaJy8jrxoEINfKZFhM2kL0OlDMXc/JM0ZM2Rlw0YVMY1hUX8BgTEejWCOAUeyZCAP974SYHzAxnwjKn3K3tC+I=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(36840700001)(46966006)(426003)(356005)(5660300002)(16526019)(2616005)(86362001)(36860700001)(110136005)(8676002)(7696005)(336012)(6666004)(8936002)(54906003)(1076003)(2906002)(316002)(478600001)(81166007)(82740400003)(70586007)(82310400003)(4326008)(47076005)(83380400001)(186003)(70206006)(36756003)(30864003)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 19:46:47.2063 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f4b0a4-e804-46c8-11d0-08d9456dc8e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3115
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
Cc: melissa.srw@gmail.com, daniel.vetter@ffwll.ch, rodrigo.siqueira@amd.com,
 Ryan Taylor <Ryan.Taylor@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Modify the VKMS driver into an api that dce_virtual can use to create
virtual displays that obey drm's atomic modesetting api.

Signed-off-by: Ryan Taylor <Ryan.Taylor@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile      |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h      |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 410 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h |  29 ++
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c |  23 +-
 7 files changed, 457 insertions(+), 11 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 7d292485ca7c..dfcf3b39a2f6 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -119,6 +119,7 @@ amdgpu-y += \
 amdgpu-y += \
 	dce_v10_0.o \
 	dce_v11_0.o \
+	amdgpu_vkms.o \
 	dce_virtual.o
 
 # add GFX block
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index d14b4968a026..a0198963fc8a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -912,6 +912,7 @@ struct amdgpu_device {
 
 	/* display */
 	bool				enable_virtual_display;
+	struct amdgpu_vkms_output       *amdgpu_vkms_output;
 	struct amdgpu_mode_info		mode_info;
 	/* For pre-DCE11. DCE11 and later are in "struct amdgpu_device->dm" */
 	struct work_struct		hotplug_work;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 179f2d01a082..5c774d6625e4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1222,7 +1222,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	int ret, retry = 0;
 	bool supports_atomic = false;
 
-	if (!amdgpu_virtual_display &&
+	if (amdgpu_virtual_display ||
 	    amdgpu_device_asic_has_dc_support(flags & AMD_ASIC_MASK))
 		supports_atomic = true;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
index 09b048647523..5a143ca02cf9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
@@ -344,7 +344,7 @@ int amdgpu_fbdev_init(struct amdgpu_device *adev)
 	}
 
 	/* disable all the possible outputs/crtcs before entering KMS mode */
-	if (!amdgpu_device_has_dc_support(adev))
+	if (!amdgpu_device_has_dc_support(adev) && !amdgpu_virtual_display)
 		drm_helper_disable_unused_functions(adev_to_drm(adev));
 
 	drm_fb_helper_initial_config(&rfbdev->helper, bpp_sel);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
new file mode 100644
index 000000000000..58bd0d7b4602
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -0,0 +1,410 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_vblank.h>
+
+#include "amdgpu.h"
+#include "amdgpu_vkms.h"
+#include "amdgpu_display.h"
+
+/**
+ * DOC: amdgpu_vkms
+ *
+ * The amdgpu vkms interface provides a virtual KMS interface for several use
+ * cases: devices without display hardware, platforms where the actual display
+ * hardware is not useful (e.g., servers), SR-IOV virtual functions, device
+ * emulation/simulation, and device bring up prior to display hardware being
+ * usable. We previously emulated a legacy KMS interface, but there was a desire
+ * to move to the atomic KMS interface. The vkms driver did everything we
+ * needed, but we wanted KMS support natively in the driver without buffer
+ * sharing and the ability to support an instance of VKMS per device. We first
+ * looked at splitting vkms into a stub driver and a helper module that other
+ * drivers could use to implement a virtual display, but this strategy ended up
+ * being messy due to driver specific callbacks needed for buffer management.
+ * Ultimately, it proved easier to import the vkms code as it mostly used core
+ * drm helpers anyway.
+ */
+
+static const u32 amdgpu_vkms_formats[] = {
+	DRM_FORMAT_XRGB8888,
+};
+
+static enum hrtimer_restart amdgpu_vkms_vblank_simulate(struct hrtimer *timer)
+{
+	struct amdgpu_vkms_output *output = container_of(timer,
+							 struct amdgpu_vkms_output,
+							 vblank_hrtimer);
+	struct drm_crtc *crtc = &output->crtc;
+	u64 ret_overrun;
+	bool ret;
+
+	ret_overrun = hrtimer_forward_now(&output->vblank_hrtimer,
+					  output->period_ns);
+	WARN_ON(ret_overrun != 1);
+
+	ret = drm_crtc_handle_vblank(crtc);
+	if (!ret)
+		DRM_ERROR("amdgpu_vkms failure on handling vblank");
+
+	return HRTIMER_RESTART;
+}
+
+static int amdgpu_vkms_enable_vblank(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = drm_crtc_index(crtc);
+	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct amdgpu_vkms_output *out = drm_crtc_to_amdgpu_vkms_output(crtc);
+
+	drm_calc_timestamping_constants(crtc, &crtc->mode);
+
+	hrtimer_init(&out->vblank_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	out->vblank_hrtimer.function = &amdgpu_vkms_vblank_simulate;
+	out->period_ns = ktime_set(0, vblank->framedur_ns);
+	hrtimer_start(&out->vblank_hrtimer, out->period_ns, HRTIMER_MODE_REL);
+
+	return 0;
+}
+
+static void amdgpu_vkms_disable_vblank(struct drm_crtc *crtc)
+{
+	struct amdgpu_vkms_output *out = drm_crtc_to_amdgpu_vkms_output(crtc);
+
+	hrtimer_cancel(&out->vblank_hrtimer);
+}
+
+static bool amdgpu_vkms_get_vblank_timestamp(struct drm_crtc *crtc,
+					     int *max_error,
+					     ktime_t *vblank_time,
+					     bool in_vblank_irq)
+{
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = crtc->index;
+	struct amdgpu_vkms_output *output = drm_crtc_to_amdgpu_vkms_output(crtc);
+	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+
+	if (!READ_ONCE(vblank->enabled)) {
+		*vblank_time = ktime_get();
+		return true;
+	}
+
+	*vblank_time = READ_ONCE(output->vblank_hrtimer.node.expires);
+
+	if (WARN_ON(*vblank_time == vblank->time))
+		return true;
+
+	/*
+	 * To prevent races we roll the hrtimer forward before we do any
+	 * interrupt processing - this is how real hw works (the interrupt is
+	 * only generated after all the vblank registers are updated) and what
+	 * the vblank core expects. Therefore we need to always correct the
+	 * timestampe by one frame.
+	 */
+	*vblank_time -= output->period_ns;
+
+	return true;
+}
+
+static const struct drm_crtc_funcs amdgpu_vkms_crtc_funcs = {
+	.set_config             = drm_atomic_helper_set_config,
+	.destroy                = drm_crtc_cleanup,
+	.page_flip              = drm_atomic_helper_page_flip,
+	.reset                  = drm_atomic_helper_crtc_reset,
+	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state   = drm_atomic_helper_crtc_destroy_state,
+	.enable_vblank		= amdgpu_vkms_enable_vblank,
+	.disable_vblank		= amdgpu_vkms_disable_vblank,
+	.get_vblank_timestamp	= amdgpu_vkms_get_vblank_timestamp,
+};
+
+static void amdgpu_vkms_crtc_atomic_enable(struct drm_crtc *crtc,
+					   struct drm_atomic_state *state)
+{
+	drm_crtc_vblank_on(crtc);
+}
+
+static void amdgpu_vkms_crtc_atomic_disable(struct drm_crtc *crtc,
+					    struct drm_atomic_state *state)
+{
+	drm_crtc_vblank_off(crtc);
+}
+
+static void amdgpu_vkms_crtc_atomic_flush(struct drm_crtc *crtc,
+					  struct drm_atomic_state *state)
+{
+	if (crtc->state->event) {
+		spin_lock(&crtc->dev->event_lock);
+
+		if (drm_crtc_vblank_get(crtc) != 0)
+			drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		else
+			drm_crtc_arm_vblank_event(crtc, crtc->state->event);
+
+		spin_unlock(&crtc->dev->event_lock);
+
+		crtc->state->event = NULL;
+	}
+}
+
+static const struct drm_crtc_helper_funcs amdgpu_vkms_crtc_helper_funcs = {
+	.atomic_flush	= amdgpu_vkms_crtc_atomic_flush,
+	.atomic_enable	= amdgpu_vkms_crtc_atomic_enable,
+	.atomic_disable	= amdgpu_vkms_crtc_atomic_disable,
+};
+
+int amdgpu_vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
+			  struct drm_plane *primary, struct drm_plane *cursor)
+{
+	int ret;
+
+	ret = drm_crtc_init_with_planes(dev, crtc, primary, cursor,
+					&amdgpu_vkms_crtc_funcs, NULL);
+	if (ret) {
+		DRM_ERROR("Failed to init CRTC\n");
+		return ret;
+	}
+
+	drm_crtc_helper_add(crtc, &amdgpu_vkms_crtc_helper_funcs);
+
+	return ret;
+}
+
+static const struct drm_connector_funcs amdgpu_vkms_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int amdgpu_vkms_conn_get_modes(struct drm_connector *connector)
+{
+	int count;
+
+	count = drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
+	drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
+
+	return count;
+}
+
+static const struct drm_connector_helper_funcs amdgpu_vkms_conn_helper_funcs = {
+	.get_modes    = amdgpu_vkms_conn_get_modes,
+};
+
+static const struct drm_plane_funcs amdgpu_vkms_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.reset			= drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+static void amdgpu_vkms_plane_atomic_update(struct drm_plane *plane,
+				     struct drm_plane_state *old_state)
+{
+	return;
+}
+
+static int amdgpu_vkms_plane_atomic_check(struct drm_plane *plane,
+					  struct drm_plane_state *state)
+{
+	struct drm_crtc_state *crtc_state;
+	bool can_position = false;
+	int ret;
+
+	if (!state->fb || WARN_ON(!state->crtc))
+		return 0;
+
+	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
+
+	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
+						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_HELPER_NO_SCALING,
+						  can_position, true);
+	if (ret != 0)
+		return ret;
+
+	/* for now primary plane must be visible and full screen */
+	if (!state->visible && !can_position)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int amdgpu_vkms_prepare_fb(struct drm_plane *plane,
+				  struct drm_plane_state *new_state)
+{
+	struct amdgpu_framebuffer *afb;
+	struct drm_gem_object *obj;
+	struct amdgpu_device *adev;
+	struct amdgpu_bo *rbo;
+	struct list_head list;
+	struct ttm_validate_buffer tv;
+	struct ww_acquire_ctx ticket;
+	uint32_t domain;
+	int r;
+
+	if (!new_state->fb) {
+		DRM_DEBUG_KMS("No FB bound\n");
+		return 0;
+	}
+	afb = to_amdgpu_framebuffer(new_state->fb);
+	obj = new_state->fb->obj[0];
+	rbo = gem_to_amdgpu_bo(obj);
+	adev = amdgpu_ttm_adev(rbo->tbo.bdev);
+	INIT_LIST_HEAD(&list);
+
+	tv.bo = &rbo->tbo;
+	tv.num_shared = 1;
+	list_add(&tv.head, &list);
+
+	r = ttm_eu_reserve_buffers(&ticket, &list, false, NULL);
+	if (r) {
+		dev_err(adev->dev, "fail to reserve bo (%d)\n", r);
+		return r;
+	}
+
+	if (plane->type != DRM_PLANE_TYPE_CURSOR)
+		domain = amdgpu_display_supported_domains(adev, rbo->flags);
+	else
+		domain = AMDGPU_GEM_DOMAIN_VRAM;
+
+	r = amdgpu_bo_pin(rbo, domain);
+	if (unlikely(r != 0)) {
+		if (r != -ERESTARTSYS)
+			DRM_ERROR("Failed to pin framebuffer with error %d\n", r);
+		ttm_eu_backoff_reservation(&ticket, &list);
+		return r;
+	}
+
+	r = amdgpu_ttm_alloc_gart(&rbo->tbo);
+	if (unlikely(r != 0)) {
+		amdgpu_bo_unpin(rbo);
+		ttm_eu_backoff_reservation(&ticket, &list);
+		DRM_ERROR("%p bind failed\n", rbo);
+		return r;
+	}
+
+	ttm_eu_backoff_reservation(&ticket, &list);
+
+	afb->address = amdgpu_bo_gpu_offset(rbo);
+
+	amdgpu_bo_ref(rbo);
+
+	return 0;
+}
+
+static void amdgpu_vkms_cleanup_fb(struct drm_plane *plane,
+				   struct drm_plane_state *old_state)
+{
+	struct amdgpu_bo *rbo;
+	int r;
+
+	if (!old_state->fb)
+		return;
+
+	rbo = gem_to_amdgpu_bo(old_state->fb->obj[0]);
+	r = amdgpu_bo_reserve(rbo, false);
+	if (unlikely(r)) {
+		DRM_ERROR("failed to reserve rbo before unpin\n");
+		return;
+	}
+
+	amdgpu_bo_unpin(rbo);
+	amdgpu_bo_unreserve(rbo);
+	amdgpu_bo_unref(&rbo);
+}
+
+static const struct drm_plane_helper_funcs amdgpu_vkms_primary_helper_funcs = {
+	.atomic_update		= amdgpu_vkms_plane_atomic_update,
+	.atomic_check		= amdgpu_vkms_plane_atomic_check,
+	.prepare_fb		= amdgpu_vkms_prepare_fb,
+	.cleanup_fb		= amdgpu_vkms_cleanup_fb,
+};
+
+struct drm_plane *amdgpu_vkms_plane_init(struct drm_device *dev,
+					 enum drm_plane_type type, int index)
+{
+	struct drm_plane *plane;
+	int ret;
+
+	plane = kzalloc(sizeof(*plane), GFP_KERNEL);
+	if (!plane)
+		return ERR_PTR(-ENOMEM);
+
+	ret = drm_universal_plane_init(dev, plane, 1 << index,
+				       &amdgpu_vkms_plane_funcs,
+				       amdgpu_vkms_formats,
+				       ARRAY_SIZE(amdgpu_vkms_formats),
+				       NULL, type, NULL);
+	if (ret) {
+		kfree(plane);
+		return ERR_PTR(ret);
+	}
+
+	drm_plane_helper_add(plane, &amdgpu_vkms_primary_helper_funcs);
+
+	return plane;
+}
+
+int amdgpu_vkms_output_init(struct drm_device *dev,
+			    struct amdgpu_vkms_output *output, int index)
+{
+	struct drm_connector *connector = &output->connector;
+	struct drm_encoder *encoder = &output->encoder;
+	struct drm_crtc *crtc = &output->crtc;
+	struct drm_plane *primary, *cursor = NULL;
+	int ret;
+
+	primary = amdgpu_vkms_plane_init(dev, DRM_PLANE_TYPE_PRIMARY, index);
+	if (IS_ERR(primary))
+		return PTR_ERR(primary);
+
+	ret = amdgpu_vkms_crtc_init(dev, crtc, primary, cursor);
+	if (ret)
+		goto err_crtc;
+
+	ret = drm_connector_init(dev, connector, &amdgpu_vkms_connector_funcs,
+				 DRM_MODE_CONNECTOR_VIRTUAL);
+	if (ret) {
+		DRM_ERROR("Failed to init connector\n");
+		goto err_connector;
+	}
+
+	drm_connector_helper_add(connector, &amdgpu_vkms_conn_helper_funcs);
+
+	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_VIRTUAL);
+	if (ret) {
+		DRM_ERROR("Failed to init encoder\n");
+		goto err_encoder;
+	}
+	encoder->possible_crtcs = 1 << index;
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret) {
+		DRM_ERROR("Failed to attach connector to encoder\n");
+		goto err_attach;
+	}
+
+	drm_mode_config_reset(dev);
+
+	return 0;
+
+err_attach:
+	drm_encoder_cleanup(encoder);
+
+err_encoder:
+	drm_connector_cleanup(connector);
+
+err_connector:
+	drm_crtc_cleanup(crtc);
+
+err_crtc:
+	drm_plane_cleanup(primary);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
new file mode 100644
index 000000000000..5dab51fbecf3
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _AMDGPU_VKMS_H_
+#define _AMDGPU_VKMS_H_
+
+#define XRES_DEF  1024
+#define YRES_DEF   764
+
+#define XRES_MAX  16384
+#define YRES_MAX  16384
+
+#define drm_crtc_to_amdgpu_vkms_output(target) \
+	container_of(target, struct amdgpu_vkms_output, crtc)
+
+extern const struct amdgpu_ip_block_version amdgpu_vkms_ip_block;
+
+struct amdgpu_vkms_output {
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
+	struct drm_connector connector;
+	struct hrtimer vblank_hrtimer;
+	ktime_t period_ns;
+	struct drm_pending_vblank_event *event;
+};
+
+int amdgpu_vkms_output_init(struct drm_device *dev,
+			    struct amdgpu_vkms_output *output, int index);
+
+#endif /* _AMDGPU_VKMS_H_ */
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
index 7e0d8c092c7e..642c77533157 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
@@ -22,6 +22,7 @@
  */
 
 #include <drm/drm_vblank.h>
+#include <drm/drm_atomic_helper.h>
 
 #include "amdgpu.h"
 #include "amdgpu_pm.h"
@@ -40,6 +41,7 @@
 #include "dce_virtual.h"
 #include "ivsrcid/ivsrcid_vislands30.h"
 #include "amdgpu_display.h"
+#include "amdgpu_vkms.h"
 
 #define DCE_VIRTUAL_VBLANK_PERIOD 16666666
 
@@ -374,6 +376,12 @@ static const struct drm_connector_funcs dce_virtual_connector_funcs = {
 	.force = dce_virtual_force,
 };
 
+const struct drm_mode_config_funcs dce_virtual_mode_funcs = {
+	.fb_create = amdgpu_display_user_framebuffer_create,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
 static int dce_virtual_sw_init(void *handle)
 {
 	int r, i;
@@ -385,10 +393,10 @@ static int dce_virtual_sw_init(void *handle)
 
 	adev_to_drm(adev)->max_vblank_count = 0;
 
-	adev_to_drm(adev)->mode_config.funcs = &amdgpu_mode_funcs;
+	adev_to_drm(adev)->mode_config.funcs = &dce_virtual_mode_funcs;
 
-	adev_to_drm(adev)->mode_config.max_width = 16384;
-	adev_to_drm(adev)->mode_config.max_height = 16384;
+	adev_to_drm(adev)->mode_config.max_width = XRES_MAX;
+	adev_to_drm(adev)->mode_config.max_height = YRES_MAX;
 
 	adev_to_drm(adev)->mode_config.preferred_depth = 24;
 	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
@@ -399,15 +407,11 @@ static int dce_virtual_sw_init(void *handle)
 	if (r)
 		return r;
 
-	adev_to_drm(adev)->mode_config.max_width = 16384;
-	adev_to_drm(adev)->mode_config.max_height = 16384;
+	adev->amdgpu_vkms_output = kzalloc(sizeof(struct amdgpu_vkms_output) * adev->mode_info.num_crtc, GFP_KERNEL);
 
 	/* allocate crtcs, encoders, connectors */
 	for (i = 0; i < adev->mode_info.num_crtc; i++) {
-		r = dce_virtual_crtc_init(adev, i);
-		if (r)
-			return r;
-		r = dce_virtual_connector_encoder_init(adev, i);
+		r = amdgpu_vkms_output_init(adev_to_drm(adev), &adev->amdgpu_vkms_output[i], i);
 		if (r)
 			return r;
 	}
@@ -428,6 +432,7 @@ static int dce_virtual_sw_fini(void *handle)
 			hrtimer_cancel(&adev->mode_info.crtcs[i]->vblank_timer);
 
 	kfree(adev->mode_info.bios_hardcoded_edid);
+	kfree(adev->amdgpu_vkms_output);
 
 	drm_kms_helper_poll_fini(adev_to_drm(adev));
 
-- 
2.32.0

