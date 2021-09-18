Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D894105DF
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 12:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D288979F;
	Sat, 18 Sep 2021 10:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 429 seconds by postgrey-1.36 at gabe;
 Sat, 18 Sep 2021 09:33:53 UTC
Received: from qq.com (smtpbg465.qq.com [59.36.132.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6546F6E06B;
 Sat, 18 Sep 2021 09:33:53 +0000 (UTC)
X-QQ-mid: bizesmtp38t1631957163tm68odgo
Received: from uos-PC (unknown [124.126.19.250]) by esmtp6.qq.com (ESMTP) with 
 id ; Sat, 18 Sep 2021 17:26:02 +0800 (CST)
X-QQ-SSF: 0140000000200070B000B00B0000000
X-QQ-FEAT: Vu3iPXV3AZAa8kafthu9Q/cBgjocWEAYC24x1QF0ClkBzXmw3Qub6jfvMUIPw
 gSk8+NjCNLHKmVGBygWOczWqVdX2HHefCDuUFNOBUD0U4vP0/i5NknQiV9C3DkW2mDk0mc7
 8wTNiQkQE8Lu0jhJZ2UxSWocFViEsVnYAJqXXdYGlnl6m2n0OfbYMMasNmmgpkK/XfqXaos
 u2qDwE0IBNqiJwaWhOAgt7tfby/8s9zPg2Z1OBMJ/COViGt4yLd/VYgezn3zlp34ichGF8e
 YkmxfxSirOK4vMLWBs/3OgSs8sUHNVPBtbLyq+AoU5i2mFB83eT3YJ9BiETSw/1Mwehcslg
 fdwPewS
X-QQ-GoodBg: 2
Date: Sat, 18 Sep 2021 17:26:02 +0800
From: yangzhiwei@uniontech.com
To: airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com
Cc: christian.koenig@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 yangzhiwei@uniontech.com
Subject: [PATCH] drm/radeon: fix uninitialized bool variable
Message-Id: <20210918172602.2f188d04c996274b9ac318bb@uniontech.com>
UOS-MsgId: <1631957162144-0>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="Multipart=_Sat__18_Sep_2021_17_26_02_+0800_MqdPVTW.=gkCsImu"
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Sat, 18 Sep 2021 10:06:27 +0000
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

This is a multi-part message in MIME format.

--Multipart=_Sat__18_Sep_2021_17_26_02_+0800_MqdPVTW.=gkCsImu
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html xmlns='http://www.w3.org/1999/xhtml'> <head><meta http-equiv='content-type' content='text/html;charset=utf-8'></head><body><div><div id="MailBelowDiv"></div><div style="word-wrap: break-word;"><br></div>


</div></body></html>

--Multipart=_Sat__18_Sep_2021_17_26_02_+0800_MqdPVTW.=gkCsImu
Content-Type: text/x-diff; name="0001-drm-radeon-fix-uninitialized-bool-variable.patch"
Content-Disposition: attachment; filename="0001-drm-radeon-fix-uninitialized-bool-variable.patch"
Content-Transfer-Encoding: 7bit

From 23dc76b1a4c7eb516b2830e1d2bb588316e18e93 Mon Sep 17 00:00:00 2001
From: Zhiwei Yang <yangzhiwei@uniontech.com>
Date: Sat, 18 Sep 2021 16:17:06 +0800
Subject: [PATCH] drm/radeon: fix uninitialized bool variable

The bool variable detected_hpd_without_ddc in struct radeon_connector
is uninitialized when first used, that may cause unnecessary ddc ops.
Make it as false when a new connector is alloced.

Signed-off-by: Zhiwei Yang <yangzhiwei@uniontech.com>
---
 drivers/gpu/drm/radeon/radeon_connectors.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index fe12d9d91d7a..c1987a66373f 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -1866,6 +1866,7 @@ radeon_add_atom_connector(struct drm_device *dev,
 	bool shared_ddc = false;
 	bool is_dp_bridge = false;
 	bool has_aux = false;
+	bool detected_hpd_without_ddc = false;
 
 	if (connector_type == DRM_MODE_CONNECTOR_Unknown)
 		return;
@@ -1923,6 +1924,7 @@ radeon_add_atom_connector(struct drm_device *dev,
 	radeon_connector->shared_ddc = shared_ddc;
 	radeon_connector->connector_object_id = connector_object_id;
 	radeon_connector->hpd = *hpd;
+	radeon_connector->detected_hpd_without_ddc = detected_hpd_without_ddc;
 
 	radeon_connector->router = *router;
 	if (router->ddc_valid || router->cd_valid) {
@@ -2384,6 +2386,7 @@ radeon_add_legacy_connector(struct drm_device *dev,
 	struct radeon_connector *radeon_connector;
 	struct i2c_adapter *ddc = NULL;
 	uint32_t subpixel_order = SubPixelNone;
+	bool detected_hpd_without_ddc = false;
 
 	if (connector_type == DRM_MODE_CONNECTOR_Unknown)
 		return;
@@ -2414,6 +2417,7 @@ radeon_add_legacy_connector(struct drm_device *dev,
 	radeon_connector->devices = supported_device;
 	radeon_connector->connector_object_id = connector_object_id;
 	radeon_connector->hpd = *hpd;
+	radeon_connector->detected_hpd_without_ddc = detected_hpd_without_ddc;
 
 	switch (connector_type) {
 	case DRM_MODE_CONNECTOR_VGA:
-- 
2.20.1


--Multipart=_Sat__18_Sep_2021_17_26_02_+0800_MqdPVTW.=gkCsImu--


