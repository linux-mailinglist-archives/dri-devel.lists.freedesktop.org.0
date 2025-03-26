Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C61DA71495
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 11:20:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C0210E68B;
	Wed, 26 Mar 2025 10:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="IT6INH7l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D93110E696
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 10:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742984402;
 bh=YwDJVq02TOowWFPqiY54kVfZ8/K6L4M+Y6kDYiCoe7A=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=IT6INH7l+9NWFFa/WJlXKoFFyYRXEANCtn+XKUUQvMfE9nhWuCkkuytA/Ly2M34lw
 DI3xq6NvoyInLoVZo3ceNvnhJHtR5X6PX1MxsMAecQO6Bq+r45wlIoM4/FbXchqHCx
 rN3dErhYe98o5AVXdsEXw1tdF+tNiVxgM24gnelpn9Kpe50Kz1e3S8Y8Esd+FqSAKr
 P9NokjkFjOBdErmPGmffZ2f6SeS7LZ8thx5SvsG6G8wdqWmBwg+f+lo9bk7eqduDIC
 Z4rnthr3ttPeFGhbtdWUCp/Q6K3ymmBc2dpC7XFSBLsBU6w0hvKk051NfWDTzP8fLv
 e4XCsHgwcBOHA==
Received: from localhost (unknown [84.232.140.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id E854F17E0FDB;
 Wed, 26 Mar 2025 11:20:01 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 26 Mar 2025 12:19:53 +0200
Subject: [PATCH v3 04/15] drm/connector: hdmi: Add missing bpc debug info
 to hdmi_try_format_bpc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-hdmi-conn-yuv-v3-4-294d3ebbb4b2@collabora.com>
References: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
In-Reply-To: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

The very first debug message in hdmi_try_format_bpc() is incomplete, as
it doesn't provide the given bpc in addition to the tried format.

Add the missing debug information and drop the now redundant message
from hdmi_compute_config().

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index a0cb3163f457635cf27e53b009bd83f85eee9336..f54eb5c594cddbd67dfacb5e06d54e9ce7851013 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -578,8 +578,9 @@ hdmi_try_format_bpc(const struct drm_connector *connector,
 	struct drm_device *dev = connector->dev;
 	int ret;
 
-	drm_dbg_kms(dev, "Trying %s output format\n",
-		    drm_hdmi_connector_get_output_format_name(fmt));
+	drm_dbg_kms(dev, "Trying %s output format with %u bpc\n",
+		    drm_hdmi_connector_get_output_format_name(fmt),
+		    bpc);
 
 	if (!sink_supports_format_bpc(connector, info, mode, fmt, bpc)) {
 		drm_dbg_kms(dev, "%s output format not supported with %u bpc\n",
@@ -638,8 +639,6 @@ hdmi_compute_config(const struct drm_connector *connector,
 	int ret;
 
 	for (bpc = max_bpc; bpc >= 8; bpc -= 2) {
-		drm_dbg_kms(dev, "Trying with a %d bpc output\n", bpc);
-
 		ret = hdmi_compute_format(connector, conn_state, mode, bpc);
 		if (ret)
 			continue;

-- 
2.49.0

