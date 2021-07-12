Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1563C640A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 21:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1DB489D99;
	Mon, 12 Jul 2021 19:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB0189D7D;
 Mon, 12 Jul 2021 19:46:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cKBvb4e52c2UCP/0YwGJRl2hQ5E77zJHWROAnKMtiD/XIstGayCfr4+UqChHv7nUcG0795HI5020wWH3gEOG+67ixpyZh50uVygPSDo9kKsluihWOlZ/FeKrtCA4h2AUqZdZYUIWhvvNkk09Fv81keXS4iCwuWFzuRHsTFRV4yXXTIAxoptuJyxAEtbTFT/dfImzDo7NT6hPd+ovhztaqUFSX2wL3aI4LzAdo+wOyvU44BWEZ9t4KcWDZ0YqjvAzkqTPs0jRjyXOXaluplqBqRjjkgKHFZubqL6RToaG4A/xI4KXo82tqN5UT3MXPuGxroUQr4R4fH81s0EQyKBL2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQoe7kmSP9M3KF+FmFx7Cq8UCwk1Tspn85K3nYAs9hE=;
 b=XOlB6bpe30t6uBXeMbkRW0vmZwiA2i7KUSidbYMDzKScZxWJQxBYzToCE94gDSY3d1jTUACoG5bNOFQHNTk1uCuuiHaFUZob+vlOIrbn9V3fFlL8reSRU7EdnaHpB3OdDc/Ut4I+jz5z+9XlpcQZLQTsp2c5CXjIRppVra8bfNQEObiYd5cE00hvqJRGeoF6Kcr0yngYwKxjINve+miKPEOZDDRH/qrgz8Fn+06mTrDi1b3FjMc/Qq8ty4hVNlORwzOFdkTuDi8MVIjBOxCZB3GphpfxqsO0eyBh9O9yrgmqMCxK3vq3lAm861uNv/mqcOku482D2xj/3TM8VaXDYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQoe7kmSP9M3KF+FmFx7Cq8UCwk1Tspn85K3nYAs9hE=;
 b=b9y7vS5dJ5FePX/+3H7eJp2Nh7loDobaHfHws3kX7m8DvXWXPZly8V1xevU8nNNrFsOeVzPOr/OlGMKD7/VUSSs9+DE0IDRs+3GO+yo5H883mmIw1QGQ1nh6qtz2XGrXRKVVZogzn19Ga5WnqV75WDvrJiYmfKvm+U8tSv6EhQU=
Received: from MW4PR03CA0040.namprd03.prod.outlook.com (2603:10b6:303:8e::15)
 by DM6PR12MB3292.namprd12.prod.outlook.com (2603:10b6:5:18c::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.25; Mon, 12 Jul
 2021 19:46:49 +0000
Received: from CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::79) by MW4PR03CA0040.outlook.office365.com
 (2603:10b6:303:8e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Mon, 12 Jul 2021 19:46:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT030.mail.protection.outlook.com (10.13.174.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4308.20 via Frontend Transport; Mon, 12 Jul 2021 19:46:49 +0000
Received: from devbox.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 12 Jul
 2021 14:46:47 -0500
From: Ryan Taylor <Ryan.Taylor@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/amdgpu: cleanup dce_virtual
Date: Mon, 12 Jul 2021 12:46:28 -0700
Message-ID: <20210712194629.4569-3-Ryan.Taylor@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: bee11ef2-a916-46f3-6864-08d9456dca12
X-MS-TrafficTypeDiagnostic: DM6PR12MB3292:
X-Microsoft-Antispam-PRVS: <DM6PR12MB32929BF50EB0E37765D5F840EA159@DM6PR12MB3292.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:166;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z+9TanxLI4GQ30GMm/Q8sJLZVpfaAsDsPVmnzCyiFu8QWfJzF3hnBzN9Zol52v5y4d2wXnQKNkwAcT5oGbVnodaANYwwIwNtvS/05nFq/EZzsxQiuPjaE0V57Rb3dFHEEnffJJDKWsAV0+2gi8xRtRJV/2V0Z+KGWQKSgNaDu/rOOrnOOLobc60S0EG3IYDsLGwh5JqKm1RcTUyuo3+VTvytuLpvDWHWZI8UEFPEMA6fuG8Z9N8vCHkHkKdXMsyqpmEFIHQqlUMaW881DhJRpB5Q7H7LoFZtH+BGekr8jt8zlgkHrF1IR6g6/Ra0Ha40QySp1+CiTD80w8aNwSgZ4INH/hCnGuUPpTsPtrqXIfpqbG9edFstyfc4vajxwZ4QHg29IX3nlUo/2pjztIihdrGdJ1w0GRigHVC6Ov9PYsMQYZ0Q9SiOxQhELlx0clsOdCOgDIySBMmnu7dIQ6wRbreM6fZgUimF0rUczhVeZAGESOojRwQDG2pRB7iZEd8zTzX5grFqjOkffV5dCk/3xA5o6X/ybppzj/YZjpSgQz3xo0Py6UbORHiQhmKtLFkQn8RDnbXt7Tpk+YxQTGQuklpcKdyAxZNmDfhBk0dDis0Vdb6Qki+RhUmp7fZNNsxZppDjRrgOFbSy2ct6Ab1eJHWeBgJERntbzRto/hJkUEROm2GgffhCujxvNR5M/hy0DGrDiPE0HfDnCgTRrAXry4relXW4lEtHNtODYJ243IU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966006)(36840700001)(2616005)(4326008)(83380400001)(81166007)(336012)(186003)(70206006)(36756003)(6666004)(16526019)(86362001)(30864003)(54906003)(316002)(70586007)(36860700001)(478600001)(5660300002)(1076003)(82310400003)(2906002)(7696005)(82740400003)(426003)(356005)(8676002)(26005)(8936002)(47076005)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 19:46:49.1892 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bee11ef2-a916-46f3-6864-08d9456dca12
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3292
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

Remove obsolete functions and variables from dce_virtual.

Signed-off-by: Ryan Taylor <Ryan.Taylor@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c | 568 +----------------------
 1 file changed, 3 insertions(+), 565 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
index 642c77533157..18369b47eac7 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
@@ -21,15 +21,9 @@
  *
  */
 
-#include <drm/drm_vblank.h>
 #include <drm/drm_atomic_helper.h>
 
 #include "amdgpu.h"
-#include "amdgpu_pm.h"
-#include "amdgpu_i2c.h"
-#include "atom.h"
-#include "amdgpu_pll.h"
-#include "amdgpu_connectors.h"
 #ifdef CONFIG_DRM_AMDGPU_SI
 #include "dce_v6_0.h"
 #endif
@@ -43,339 +37,6 @@
 #include "amdgpu_display.h"
 #include "amdgpu_vkms.h"
 
-#define DCE_VIRTUAL_VBLANK_PERIOD 16666666
-
-
-static void dce_virtual_set_display_funcs(struct amdgpu_device *adev);
-static void dce_virtual_set_irq_funcs(struct amdgpu_device *adev);
-static int dce_virtual_connector_encoder_init(struct amdgpu_device *adev,
-					      int index);
-static int dce_virtual_pageflip(struct amdgpu_device *adev,
-				unsigned crtc_id);
-static enum hrtimer_restart dce_virtual_vblank_timer_handle(struct hrtimer *vblank_timer);
-static void dce_virtual_set_crtc_vblank_interrupt_state(struct amdgpu_device *adev,
-							int crtc,
-							enum amdgpu_interrupt_state state);
-
-static u32 dce_virtual_vblank_get_counter(struct amdgpu_device *adev, int crtc)
-{
-	return 0;
-}
-
-static void dce_virtual_page_flip(struct amdgpu_device *adev,
-			      int crtc_id, u64 crtc_base, bool async)
-{
-	return;
-}
-
-static int dce_virtual_crtc_get_scanoutpos(struct amdgpu_device *adev, int crtc,
-					u32 *vbl, u32 *position)
-{
-	*vbl = 0;
-	*position = 0;
-
-	return -EINVAL;
-}
-
-static bool dce_virtual_hpd_sense(struct amdgpu_device *adev,
-			       enum amdgpu_hpd_id hpd)
-{
-	return true;
-}
-
-static void dce_virtual_hpd_set_polarity(struct amdgpu_device *adev,
-				      enum amdgpu_hpd_id hpd)
-{
-	return;
-}
-
-static u32 dce_virtual_hpd_get_gpio_reg(struct amdgpu_device *adev)
-{
-	return 0;
-}
-
-/**
- * dce_virtual_bandwidth_update - program display watermarks
- *
- * @adev: amdgpu_device pointer
- *
- * Calculate and program the display watermarks and line
- * buffer allocation (CIK).
- */
-static void dce_virtual_bandwidth_update(struct amdgpu_device *adev)
-{
-	return;
-}
-
-static int dce_virtual_crtc_gamma_set(struct drm_crtc *crtc, u16 *red,
-				      u16 *green, u16 *blue, uint32_t size,
-				      struct drm_modeset_acquire_ctx *ctx)
-{
-	return 0;
-}
-
-static void dce_virtual_crtc_destroy(struct drm_crtc *crtc)
-{
-	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-
-	drm_crtc_cleanup(crtc);
-	kfree(amdgpu_crtc);
-}
-
-static const struct drm_crtc_funcs dce_virtual_crtc_funcs = {
-	.cursor_set2 = NULL,
-	.cursor_move = NULL,
-	.gamma_set = dce_virtual_crtc_gamma_set,
-	.set_config = amdgpu_display_crtc_set_config,
-	.destroy = dce_virtual_crtc_destroy,
-	.page_flip_target = amdgpu_display_crtc_page_flip_target,
-	.get_vblank_counter = amdgpu_get_vblank_counter_kms,
-	.enable_vblank = amdgpu_enable_vblank_kms,
-	.disable_vblank = amdgpu_disable_vblank_kms,
-	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
-};
-
-static void dce_virtual_crtc_dpms(struct drm_crtc *crtc, int mode)
-{
-	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = drm_to_adev(dev);
-	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	unsigned type;
-
-	switch (mode) {
-	case DRM_MODE_DPMS_ON:
-		amdgpu_crtc->enabled = true;
-		/* Make sure VBLANK interrupts are still enabled */
-		type = amdgpu_display_crtc_idx_to_irq_type(adev,
-						amdgpu_crtc->crtc_id);
-		amdgpu_irq_update(adev, &adev->crtc_irq, type);
-		drm_crtc_vblank_on(crtc);
-		break;
-	case DRM_MODE_DPMS_STANDBY:
-	case DRM_MODE_DPMS_SUSPEND:
-	case DRM_MODE_DPMS_OFF:
-		drm_crtc_vblank_off(crtc);
-		amdgpu_crtc->enabled = false;
-		break;
-	}
-}
-
-
-static void dce_virtual_crtc_prepare(struct drm_crtc *crtc)
-{
-	dce_virtual_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
-}
-
-static void dce_virtual_crtc_commit(struct drm_crtc *crtc)
-{
-	dce_virtual_crtc_dpms(crtc, DRM_MODE_DPMS_ON);
-}
-
-static void dce_virtual_crtc_disable(struct drm_crtc *crtc)
-{
-	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
-
-	if (dev->num_crtcs)
-		drm_crtc_vblank_off(crtc);
-
-	amdgpu_crtc->enabled = false;
-	amdgpu_crtc->pll_id = ATOM_PPLL_INVALID;
-	amdgpu_crtc->encoder = NULL;
-	amdgpu_crtc->connector = NULL;
-}
-
-static int dce_virtual_crtc_mode_set(struct drm_crtc *crtc,
-				  struct drm_display_mode *mode,
-				  struct drm_display_mode *adjusted_mode,
-				  int x, int y, struct drm_framebuffer *old_fb)
-{
-	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
-
-	/* update the hw version fpr dpm */
-	amdgpu_crtc->hw_mode = *adjusted_mode;
-
-	return 0;
-}
-
-static bool dce_virtual_crtc_mode_fixup(struct drm_crtc *crtc,
-				     const struct drm_display_mode *mode,
-				     struct drm_display_mode *adjusted_mode)
-{
-	return true;
-}
-
-
-static int dce_virtual_crtc_set_base(struct drm_crtc *crtc, int x, int y,
-				  struct drm_framebuffer *old_fb)
-{
-	return 0;
-}
-
-static int dce_virtual_crtc_set_base_atomic(struct drm_crtc *crtc,
-					 struct drm_framebuffer *fb,
-					 int x, int y, enum mode_set_atomic state)
-{
-	return 0;
-}
-
-static const struct drm_crtc_helper_funcs dce_virtual_crtc_helper_funcs = {
-	.dpms = dce_virtual_crtc_dpms,
-	.mode_fixup = dce_virtual_crtc_mode_fixup,
-	.mode_set = dce_virtual_crtc_mode_set,
-	.mode_set_base = dce_virtual_crtc_set_base,
-	.mode_set_base_atomic = dce_virtual_crtc_set_base_atomic,
-	.prepare = dce_virtual_crtc_prepare,
-	.commit = dce_virtual_crtc_commit,
-	.disable = dce_virtual_crtc_disable,
-	.get_scanout_position = amdgpu_crtc_get_scanout_position,
-};
-
-static int dce_virtual_crtc_init(struct amdgpu_device *adev, int index)
-{
-	struct amdgpu_crtc *amdgpu_crtc;
-
-	amdgpu_crtc = kzalloc(sizeof(struct amdgpu_crtc) +
-			      (AMDGPUFB_CONN_LIMIT * sizeof(struct drm_connector *)), GFP_KERNEL);
-	if (amdgpu_crtc == NULL)
-		return -ENOMEM;
-
-	drm_crtc_init(adev_to_drm(adev), &amdgpu_crtc->base, &dce_virtual_crtc_funcs);
-
-	drm_mode_crtc_set_gamma_size(&amdgpu_crtc->base, 256);
-	amdgpu_crtc->crtc_id = index;
-	adev->mode_info.crtcs[index] = amdgpu_crtc;
-
-	amdgpu_crtc->pll_id = ATOM_PPLL_INVALID;
-	amdgpu_crtc->encoder = NULL;
-	amdgpu_crtc->connector = NULL;
-	amdgpu_crtc->vsync_timer_enabled = AMDGPU_IRQ_STATE_DISABLE;
-	drm_crtc_helper_add(&amdgpu_crtc->base, &dce_virtual_crtc_helper_funcs);
-
-	hrtimer_init(&amdgpu_crtc->vblank_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	hrtimer_set_expires(&amdgpu_crtc->vblank_timer, DCE_VIRTUAL_VBLANK_PERIOD);
-	amdgpu_crtc->vblank_timer.function = dce_virtual_vblank_timer_handle;
-	hrtimer_start(&amdgpu_crtc->vblank_timer,
-		      DCE_VIRTUAL_VBLANK_PERIOD, HRTIMER_MODE_REL);
-	return 0;
-}
-
-static int dce_virtual_early_init(void *handle)
-{
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	dce_virtual_set_display_funcs(adev);
-	dce_virtual_set_irq_funcs(adev);
-
-	adev->mode_info.num_hpd = 1;
-	adev->mode_info.num_dig = 1;
-	return 0;
-}
-
-static struct drm_encoder *
-dce_virtual_encoder(struct drm_connector *connector)
-{
-	struct drm_encoder *encoder;
-
-	drm_connector_for_each_possible_encoder(connector, encoder) {
-		if (encoder->encoder_type == DRM_MODE_ENCODER_VIRTUAL)
-			return encoder;
-	}
-
-	/* pick the first one */
-	drm_connector_for_each_possible_encoder(connector, encoder)
-		return encoder;
-
-	return NULL;
-}
-
-static int dce_virtual_get_modes(struct drm_connector *connector)
-{
-	struct drm_device *dev = connector->dev;
-	struct drm_display_mode *mode = NULL;
-	unsigned i;
-	static const struct mode_size {
-		int w;
-		int h;
-	} common_modes[] = {
-		{ 640,  480},
-		{ 720,  480},
-		{ 800,  600},
-		{ 848,  480},
-		{1024,  768},
-		{1152,  768},
-		{1280,  720},
-		{1280,  800},
-		{1280,  854},
-		{1280,  960},
-		{1280, 1024},
-		{1440,  900},
-		{1400, 1050},
-		{1680, 1050},
-		{1600, 1200},
-		{1920, 1080},
-		{1920, 1200},
-		{2560, 1440},
-		{4096, 3112},
-		{3656, 2664},
-		{3840, 2160},
-		{4096, 2160},
-	};
-
-	for (i = 0; i < ARRAY_SIZE(common_modes); i++) {
-		mode = drm_cvt_mode(dev, common_modes[i].w, common_modes[i].h, 60, false, false, false);
-		drm_mode_probed_add(connector, mode);
-	}
-
-	return 0;
-}
-
-static enum drm_mode_status dce_virtual_mode_valid(struct drm_connector *connector,
-				  struct drm_display_mode *mode)
-{
-	return MODE_OK;
-}
-
-static int
-dce_virtual_dpms(struct drm_connector *connector, int mode)
-{
-	return 0;
-}
-
-static int
-dce_virtual_set_property(struct drm_connector *connector,
-			 struct drm_property *property,
-			 uint64_t val)
-{
-	return 0;
-}
-
-static void dce_virtual_destroy(struct drm_connector *connector)
-{
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-	kfree(connector);
-}
-
-static void dce_virtual_force(struct drm_connector *connector)
-{
-	return;
-}
-
-static const struct drm_connector_helper_funcs dce_virtual_connector_helper_funcs = {
-	.get_modes = dce_virtual_get_modes,
-	.mode_valid = dce_virtual_mode_valid,
-	.best_encoder = dce_virtual_encoder,
-};
-
-static const struct drm_connector_funcs dce_virtual_connector_funcs = {
-	.dpms = dce_virtual_dpms,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.set_property = dce_virtual_set_property,
-	.destroy = dce_virtual_destroy,
-	.force = dce_virtual_force,
-};
-
 const struct drm_mode_config_funcs dce_virtual_mode_funcs = {
 	.fb_create = amdgpu_display_user_framebuffer_create,
 	.atomic_check = drm_atomic_helper_check,
@@ -387,10 +48,6 @@ static int dce_virtual_sw_init(void *handle)
 	int r, i;
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	r = amdgpu_irq_add_id(adev, AMDGPU_IRQ_CLIENTID_LEGACY, VISLANDS30_IV_SRCID_SMU_DISP_TIMER2_TRIGGER, &adev->crtc_irq);
-	if (r)
-		return r;
-
 	adev_to_drm(adev)->max_vblank_count = 0;
 
 	adev_to_drm(adev)->mode_config.funcs = &dce_virtual_mode_funcs;
@@ -436,9 +93,6 @@ static int dce_virtual_sw_fini(void *handle)
 
 	drm_kms_helper_poll_fini(adev_to_drm(adev));
 
-	drm_mode_config_cleanup(adev_to_drm(adev));
-	/* clear crtcs pointer to avoid dce irq finish routine access freed data */
-	memset(adev->mode_info.crtcs, 0, sizeof(adev->mode_info.crtcs[0]) * AMDGPU_MAX_CRTCS);
 	adev->mode_info.mode_config_initialized = false;
 	return 0;
 }
@@ -498,7 +152,7 @@ static int dce_virtual_suspend(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	int r;
 
-	r = amdgpu_display_suspend_helper(adev);
+	r = drm_mode_config_helper_suspend(adev_to_drm(adev));
 	if (r)
 		return r;
 	return dce_virtual_hw_fini(handle);
@@ -512,7 +166,7 @@ static int dce_virtual_resume(void *handle)
 	r = dce_virtual_hw_init(handle);
 	if (r)
 		return r;
-	return amdgpu_display_resume_helper(adev);
+	return drm_mode_config_helper_resume(adev_to_drm(adev));
 }
 
 static bool dce_virtual_is_idle(void *handle)
@@ -544,7 +198,7 @@ static int dce_virtual_set_powergating_state(void *handle,
 
 static const struct amd_ip_funcs dce_virtual_ip_funcs = {
 	.name = "dce_virtual",
-	.early_init = dce_virtual_early_init,
+	.early_init = NULL,
 	.late_init = NULL,
 	.sw_init = dce_virtual_sw_init,
 	.sw_fini = dce_virtual_sw_fini,
@@ -559,222 +213,6 @@ static const struct amd_ip_funcs dce_virtual_ip_funcs = {
 	.set_powergating_state = dce_virtual_set_powergating_state,
 };
 
-/* these are handled by the primary encoders */
-static void dce_virtual_encoder_prepare(struct drm_encoder *encoder)
-{
-	return;
-}
-
-static void dce_virtual_encoder_commit(struct drm_encoder *encoder)
-{
-	return;
-}
-
-static void
-dce_virtual_encoder_mode_set(struct drm_encoder *encoder,
-			     struct drm_display_mode *mode,
-			     struct drm_display_mode *adjusted_mode)
-{
-	return;
-}
-
-static void dce_virtual_encoder_disable(struct drm_encoder *encoder)
-{
-	return;
-}
-
-static void
-dce_virtual_encoder_dpms(struct drm_encoder *encoder, int mode)
-{
-	return;
-}
-
-static bool dce_virtual_encoder_mode_fixup(struct drm_encoder *encoder,
-				    const struct drm_display_mode *mode,
-				    struct drm_display_mode *adjusted_mode)
-{
-	return true;
-}
-
-static const struct drm_encoder_helper_funcs dce_virtual_encoder_helper_funcs = {
-	.dpms = dce_virtual_encoder_dpms,
-	.mode_fixup = dce_virtual_encoder_mode_fixup,
-	.prepare = dce_virtual_encoder_prepare,
-	.mode_set = dce_virtual_encoder_mode_set,
-	.commit = dce_virtual_encoder_commit,
-	.disable = dce_virtual_encoder_disable,
-};
-
-static void dce_virtual_encoder_destroy(struct drm_encoder *encoder)
-{
-	drm_encoder_cleanup(encoder);
-	kfree(encoder);
-}
-
-static const struct drm_encoder_funcs dce_virtual_encoder_funcs = {
-	.destroy = dce_virtual_encoder_destroy,
-};
-
-static int dce_virtual_connector_encoder_init(struct amdgpu_device *adev,
-					      int index)
-{
-	struct drm_encoder *encoder;
-	struct drm_connector *connector;
-
-	/* add a new encoder */
-	encoder = kzalloc(sizeof(struct drm_encoder), GFP_KERNEL);
-	if (!encoder)
-		return -ENOMEM;
-	encoder->possible_crtcs = 1 << index;
-	drm_encoder_init(adev_to_drm(adev), encoder, &dce_virtual_encoder_funcs,
-			 DRM_MODE_ENCODER_VIRTUAL, NULL);
-	drm_encoder_helper_add(encoder, &dce_virtual_encoder_helper_funcs);
-
-	connector = kzalloc(sizeof(struct drm_connector), GFP_KERNEL);
-	if (!connector) {
-		kfree(encoder);
-		return -ENOMEM;
-	}
-
-	/* add a new connector */
-	drm_connector_init(adev_to_drm(adev), connector, &dce_virtual_connector_funcs,
-			   DRM_MODE_CONNECTOR_VIRTUAL);
-	drm_connector_helper_add(connector, &dce_virtual_connector_helper_funcs);
-	connector->display_info.subpixel_order = SubPixelHorizontalRGB;
-	connector->interlace_allowed = false;
-	connector->doublescan_allowed = false;
-
-	/* link them */
-	drm_connector_attach_encoder(connector, encoder);
-
-	return 0;
-}
-
-static const struct amdgpu_display_funcs dce_virtual_display_funcs = {
-	.bandwidth_update = &dce_virtual_bandwidth_update,
-	.vblank_get_counter = &dce_virtual_vblank_get_counter,
-	.backlight_set_level = NULL,
-	.backlight_get_level = NULL,
-	.hpd_sense = &dce_virtual_hpd_sense,
-	.hpd_set_polarity = &dce_virtual_hpd_set_polarity,
-	.hpd_get_gpio_reg = &dce_virtual_hpd_get_gpio_reg,
-	.page_flip = &dce_virtual_page_flip,
-	.page_flip_get_scanoutpos = &dce_virtual_crtc_get_scanoutpos,
-	.add_encoder = NULL,
-	.add_connector = NULL,
-};
-
-static void dce_virtual_set_display_funcs(struct amdgpu_device *adev)
-{
-	adev->mode_info.funcs = &dce_virtual_display_funcs;
-}
-
-static int dce_virtual_pageflip(struct amdgpu_device *adev,
-				unsigned crtc_id)
-{
-	unsigned long flags;
-	struct amdgpu_crtc *amdgpu_crtc;
-	struct amdgpu_flip_work *works;
-
-	amdgpu_crtc = adev->mode_info.crtcs[crtc_id];
-
-	if (crtc_id >= adev->mode_info.num_crtc) {
-		DRM_ERROR("invalid pageflip crtc %d\n", crtc_id);
-		return -EINVAL;
-	}
-
-	/* IRQ could occur when in initial stage */
-	if (amdgpu_crtc == NULL)
-		return 0;
-
-	spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
-	works = amdgpu_crtc->pflip_works;
-	if (amdgpu_crtc->pflip_status != AMDGPU_FLIP_SUBMITTED) {
-		DRM_DEBUG_DRIVER("amdgpu_crtc->pflip_status = %d != "
-			"AMDGPU_FLIP_SUBMITTED(%d)\n",
-			amdgpu_crtc->pflip_status,
-			AMDGPU_FLIP_SUBMITTED);
-		spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
-		return 0;
-	}
-
-	/* page flip completed. clean up */
-	amdgpu_crtc->pflip_status = AMDGPU_FLIP_NONE;
-	amdgpu_crtc->pflip_works = NULL;
-
-	/* wakeup usersapce */
-	if (works->event)
-		drm_crtc_send_vblank_event(&amdgpu_crtc->base, works->event);
-
-	spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
-
-	drm_crtc_vblank_put(&amdgpu_crtc->base);
-	amdgpu_bo_unref(&works->old_abo);
-	kfree(works->shared);
-	kfree(works);
-
-	return 0;
-}
-
-static enum hrtimer_restart dce_virtual_vblank_timer_handle(struct hrtimer *vblank_timer)
-{
-	struct amdgpu_crtc *amdgpu_crtc = container_of(vblank_timer,
-						       struct amdgpu_crtc, vblank_timer);
-	struct drm_device *ddev = amdgpu_crtc->base.dev;
-	struct amdgpu_device *adev = drm_to_adev(ddev);
-	struct amdgpu_irq_src *source = adev->irq.client[AMDGPU_IRQ_CLIENTID_LEGACY].sources
-		[VISLANDS30_IV_SRCID_SMU_DISP_TIMER2_TRIGGER];
-	int irq_type = amdgpu_display_crtc_idx_to_irq_type(adev,
-						amdgpu_crtc->crtc_id);
-
-	if (amdgpu_irq_enabled(adev, source, irq_type)) {
-		drm_handle_vblank(ddev, amdgpu_crtc->crtc_id);
-		dce_virtual_pageflip(adev, amdgpu_crtc->crtc_id);
-	}
-	hrtimer_start(vblank_timer, DCE_VIRTUAL_VBLANK_PERIOD,
-		      HRTIMER_MODE_REL);
-
-	return HRTIMER_NORESTART;
-}
-
-static void dce_virtual_set_crtc_vblank_interrupt_state(struct amdgpu_device *adev,
-							int crtc,
-							enum amdgpu_interrupt_state state)
-{
-	if (crtc >= adev->mode_info.num_crtc || !adev->mode_info.crtcs[crtc]) {
-		DRM_DEBUG("invalid crtc %d\n", crtc);
-		return;
-	}
-
-	adev->mode_info.crtcs[crtc]->vsync_timer_enabled = state;
-	DRM_DEBUG("[FM]set crtc %d vblank interrupt state %d\n", crtc, state);
-}
-
-
-static int dce_virtual_set_crtc_irq_state(struct amdgpu_device *adev,
-					  struct amdgpu_irq_src *source,
-					  unsigned type,
-					  enum amdgpu_interrupt_state state)
-{
-	if (type > AMDGPU_CRTC_IRQ_VBLANK6)
-		return -EINVAL;
-
-	dce_virtual_set_crtc_vblank_interrupt_state(adev, type, state);
-
-	return 0;
-}
-
-static const struct amdgpu_irq_src_funcs dce_virtual_crtc_irq_funcs = {
-	.set = dce_virtual_set_crtc_irq_state,
-	.process = NULL,
-};
-
-static void dce_virtual_set_irq_funcs(struct amdgpu_device *adev)
-{
-	adev->crtc_irq.num_types = adev->mode_info.num_crtc;
-	adev->crtc_irq.funcs = &dce_virtual_crtc_irq_funcs;
-}
-
 const struct amdgpu_ip_block_version dce_virtual_ip_block =
 {
 	.type = AMD_IP_BLOCK_TYPE_DCE,
-- 
2.32.0

