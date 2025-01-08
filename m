Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD836A067BF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 23:04:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1253F10E959;
	Wed,  8 Jan 2025 22:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CeBbHRnI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D21010E945
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 22:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1736373840;
 bh=5CKTYzeFI9xVT6Gfp9lhBqTUfnNdcMGy8htgqm9SI44=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=CeBbHRnIvBKd9wYG/Zr4eJc54hcgpkrkIfoHIFcFdO6oS0IdJAoHR6slWoDzjC62h
 XmTX8zyaCj1kScPSqOMSFQ4Eb2yuAHQIa3YJjbypVAAnInzT/RFqFor7igFiAU4/7A
 6JpkVO/PqHJOGgsTSR0f4wjVY++BvnjKjYopZdKLSZ2DmaLrYQCWkFFNMjRm0OQHh2
 QndkYZ2RaxDpk0tJ6dXbSRW4p+0904v/aWdGxGYBdzT/2jttYlR7Bj88qC8PV1sRC1
 zqbV1r3n1RSJW7ZKBGX5Uj0sVPtgIUl/vqzR8sb39COCOO1xcqj6bsyNS7SIS+PsnF
 8cmO7Hb7thJmQ==
Received: from localhost (unknown [82.76.59.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E313317E3600;
 Wed,  8 Jan 2025 23:03:59 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 09 Jan 2025 00:03:39 +0200
Subject: [PATCH v2 1/2] drm/connector: hdmi: Handle NULL display mode in
 state check helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-hdmi-conn-null-mode-v2-1-9eeaf1109547@collabora.com>
References: <20250109-hdmi-conn-null-mode-v2-0-9eeaf1109547@collabora.com>
In-Reply-To: <20250109-hdmi-conn-null-mode-v2-0-9eeaf1109547@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-Mailer: b4 0.14.2
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

drm_atomic_helper_connector_hdmi_check() helper makes use of
connector_state_get_mode() to obtain a drm_display_mode pointer, but it
doesn't validate it, which may lead to a NULL pointer dereference in
some cases, i.e. unloading a DRM module:

[ 1002.910414] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[...]
[ 1002.923833] Hardware name: Radxa ROCK 5B (DT)
[ 1002.924819] pc : drm_match_cea_mode+0x30/0x280 [drm]
[ 1002.925318] lr : hdmi_try_format_bpc+0x7c/0x580 [drm_display_helper]
[...]
[ 1002.932411] Call trace:
[ 1002.932626]  drm_match_cea_mode+0x30/0x280 [drm] (P)
[ 1002.933120]  hdmi_try_format_bpc+0x7c/0x580 [drm_display_helper]
[ 1002.933662]  drm_atomic_helper_connector_hdmi_check+0x10c/0x478 [drm_display_helper]
[ 1002.934355]  drm_bridge_connector_atomic_check+0x20/0x40 [drm_display_helper]
[ 1002.934993]  drm_atomic_helper_check_modeset+0x698/0xd28 [drm_kms_helper]
[ 1002.935607]  drm_atomic_helper_check+0x28/0xb8 [drm_kms_helper]
[ 1002.936143]  drm_atomic_check_only+0x794/0x988 [drm]
[ 1002.936635]  drm_atomic_commit+0x60/0xe0 [drm]
[ 1002.937082]  drm_atomic_helper_disable_all+0x184/0x218 [drm_kms_helper]
[ 1002.937678]  drm_atomic_helper_shutdown+0x90/0x150 [drm_kms_helper]
[ 1002.938243]  rockchip_drm_unbind+0x38/0x80 [rockchipdrm]
[ 1002.938720]  component_master_del+0xac/0xf8
[ 1002.939089]  rockchip_drm_platform_remove+0x34/0x78 [rockchipdrm]
[...]

Add the missing NULL check before passing the mode pointer further.

Fixes: f035f4097f1e ("drm/connector: hdmi: Calculate TMDS character rate")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index cfc2aaee1da08a103cbf933c891d5cc31b0886a8..e4d4fce6ab59d37067327d3e6da235c9a5a45b42 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -503,6 +503,9 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 		connector_state_get_mode(new_conn_state);
 	int ret;
 
+	if (!mode)
+		return 0;
+
 	new_conn_state->hdmi.is_limited_range = hdmi_is_limited_range(connector, new_conn_state);
 
 	ret = hdmi_compute_config(connector, new_conn_state, mode);

-- 
2.47.1

