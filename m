Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F91AA87625
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 05:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB66410E2D8;
	Mon, 14 Apr 2025 03:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526C510E2D8;
 Mon, 14 Apr 2025 03:15:07 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.141.245])
 by APP-01 (Coremail) with SMTP id qwCowADXfwCtffxnLIbCCA--.13743S2;
 Mon, 14 Apr 2025 11:14:54 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, alex.hung@amd.com
Cc: chiahsuan.chung@amd.com, hamza.mahfooz@amd.com, sunil.khatri@amd.com,
 aurabindo.pillai@amd.com, hersenxs.wu@amd.com, mario.limonciello@amd.com,
 mwen@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH v3] drm/amd/display: Add error check for avi and vendor
 infoframe setup function
Date: Mon, 14 Apr 2025 11:14:39 +0800
Message-ID: <20250414031439.1895-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADXfwCtffxnLIbCCA--.13743S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF4UAr47KFyUJw47ZF4rAFb_yoW8uw1Upw
 48t34qyrW0qFZxCryUAFn5ua90k3s7JFy7Kr45Aw15W3s5KrZxJa1fJF1kJ3y7ZFZ5A3Wa
 y3WUX3y2qF1vk3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPYb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjc
 xK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JV
 WxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI2
 0VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r4a6rW5MxkIecxEwV
 AFwVW8GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
 4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pKLvKUU
 UUUU=
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgwMA2f8WvF21QABsX
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

The function fill_stream_properties_from_drm_display_mode() calls the
function drm_hdmi_avi_infoframe_from_display_mode() and the
function drm_hdmi_vendor_infoframe_from_display_mode(), but does
not check its return value. Log the error messages to prevent silent
failure if either function fails.

Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
v3: Fix error-logging function error
v2: Fix code diff error

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 5f216d626cbb..cdf1a07aa8af 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6104,6 +6104,7 @@ static void fill_stream_properties_from_drm_display_mode(
 	struct amdgpu_dm_connector *aconnector = NULL;
 	struct hdmi_vendor_infoframe hv_frame;
 	struct hdmi_avi_infoframe avi_frame;
+	ssize_t err;
 
 	if (connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
 		aconnector = to_amdgpu_dm_connector(connector);
@@ -6150,9 +6151,17 @@ static void fill_stream_properties_from_drm_display_mode(
 	}
 
 	if (stream->signal == SIGNAL_TYPE_HDMI_TYPE_A) {
-		drm_hdmi_avi_infoframe_from_display_mode(&avi_frame, (struct drm_connector *)connector, mode_in);
+		err = drm_hdmi_avi_infoframe_from_display_mode(&avi_frame,
+							       (struct drm_connector *)connector,
+							       mode_in);
+		if (err < 0)
+			drm_err(connector->dev, "Failed to setup avi infoframe: %zd\n", err);
 		timing_out->vic = avi_frame.video_code;
-		drm_hdmi_vendor_infoframe_from_display_mode(&hv_frame, (struct drm_connector *)connector, mode_in);
+		err = drm_hdmi_vendor_infoframe_from_display_mode(&hv_frame,
+								  (struct drm_connector *)connector,
+								  mode_in);
+		if (err < 0)
+			drm_err(connector->dev, "Failed to setup vendor infoframe: %zd\n", err);
 		timing_out->hdmi_vic = hv_frame.vic;
 	}
 
-- 
2.42.0.windows.2

