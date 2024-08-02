Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC7E945890
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 09:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1A010E997;
	Fri,  2 Aug 2024 07:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Fri, 02 Aug 2024 07:23:04 UTC
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED2910E995
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 07:23:03 +0000 (UTC)
X-UUID: 5699da2c509f11efa216b1d71e6e1362-20240802
X-CTIC-Tags: HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME,
 HR_CTE_8B
 HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
 HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
 HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
 HR_TO_NO_NAME, DN_TRUSTED, SRC_TRUSTED, SA_TRUSTED, SA_EXISTED
 SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
 CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
 GTI_C_BU, AMN_T1, AMN_GOOD, AMN_C_TI, AMN_C_BU ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:18879357-d45b-457b-b8cf-d9e8aa7d7e3b, IP:5,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:-25
X-CID-INFO: VERSION:1.1.38, REQID:18879357-d45b-457b-b8cf-d9e8aa7d7e3b, IP:5,
 URL
 :0,TC:0,Content:-25,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-25
X-CID-META: VersionHash:82c5f88, CLOUDID:15c989120bec1d690fb547910e61687c,
 BulkI
 D:240802151224UQ7DLJME,BulkQuantity:1,Recheck:0,SF:66|25|17|19|45|102,TC:n
 il,Content:0,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:40,QS:nil,BEC:nil,COL
 :0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: 5699da2c509f11efa216b1d71e6e1362-20240802
X-User: yaolu@kylinos.cn
Received: from localhost.localdomain [(111.48.58.10)] by mailgw.kylinos.cn
 (envelope-from <yaolu@kylinos.cn>) (Generic MTA)
 with ESMTP id 1078735964; Fri, 02 Aug 2024 15:17:55 +0800
From: Lu Yao <yaolu@kylinos.cn>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 srinivasan.shanmugam@amd.com, sunil.khatri@amd.com
Cc: airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lu Yao <yaolu@kylinos.cn>
Subject: [PATCH] drm/amdgpu: add dce6 drm_panic support
Date: Fri,  2 Aug 2024 15:17:52 +0800
Message-Id: <20240802071752.116541-1-yaolu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the drm_panic module, which displays a pretty user
friendly message on the screen when a Linux kernel panic occurs.

Signed-off-by: Lu Yao <yaolu@kylinos.cn>
---
The patch can work properly on the TTY, but after start X, drawn
image is messy, it looks like the data isn't linearly arranged.
However at this time 'fb->modifier' is 'DRM_FORMAT_MOD_LINEAR'.

Another difference I found is:
  For TTY, the amdgpu_bo is created with flag
  'AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED|AMDGPU_GEM_CREATE_CPU_GTT_USWC|
  AMDGPU_GEM_CREATE_VRAM_CLEARED|AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS'.
  For X, the amdgpu_bo is created with flag
  'AMDGPU_GEM_CREATE_NO_CPU_ACCESS|AMDGPU_GEM_CREATE_CPU_GTT_USWC'
I try to use same flag for X, it looks like no difference.

Can someone provide some insight into this problem or where I am going
wrong. Thanks a lot.

Test environment: X86 arch + v6.6 kernel + R7340.
---
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index 05c0df97f01d..12c3801c264a 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -28,6 +28,8 @@
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_panic.h>
+#include "../../drm_internal.h"
 
 #include "amdgpu.h"
 #include "amdgpu_pm.h"
@@ -2600,6 +2602,35 @@ static const struct drm_crtc_helper_funcs dce_v6_0_crtc_helper_funcs = {
 	.get_scanout_position = amdgpu_crtc_get_scanout_position,
 };
 
+static int dce_v6_0_drm_primary_plane_get_scanout_buffer(struct drm_plane *plane,
+							 struct drm_scanout_buffer *sb)
+{
+	struct drm_framebuffer *fb;
+	struct drm_gem_object *obj;
+	struct amdgpu_bo *abo;
+	int ret = 0;
+
+	if (!plane->fb || plane->fb->modifier != DRM_FORMAT_MOD_LINEAR)
+		return -ENODEV;
+
+	fb = plane->fb;
+	sb->width = fb->width;
+	sb->height = fb->height;
+	sb->format = fb->format;
+	sb->pitch[0] = fb->pitches[0];
+
+	obj = fb->obj[0];
+	abo = gem_to_amdgpu_bo(obj);
+	if (!abo || abo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS)
+		return -EINVAL;
+
+	return drm_gem_vmap(obj, &sb->map[0]);
+}
+
+static const struct drm_plane_helper_funcs dce_v6_0_drm_primary_plane_helper_funcs = {
+	.get_scanout_buffer = dce_v6_0_drm_primary_plane_get_scanout_buffer
+};
+
 static int dce_v6_0_crtc_init(struct amdgpu_device *adev, int index)
 {
 	struct amdgpu_crtc *amdgpu_crtc;
@@ -2627,6 +2658,7 @@ static int dce_v6_0_crtc_init(struct amdgpu_device *adev, int index)
 	amdgpu_crtc->encoder = NULL;
 	amdgpu_crtc->connector = NULL;
 	drm_crtc_helper_add(&amdgpu_crtc->base, &dce_v6_0_crtc_helper_funcs);
+	drm_plane_helper_add(amdgpu_crtc->base.primary, &dce_v6_0_drm_primary_plane_helper_funcs);
 
 	return 0;
 }
-- 
2.25.1

