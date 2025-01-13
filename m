Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72633A0B84E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 14:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B152C10E684;
	Mon, 13 Jan 2025 13:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hk0K63DF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED13710E684
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 13:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1736775389;
 bh=Y1kWdYZ1cSP52tdJOWKKUUGp+uBr6UO+JoyQye7joaU=;
 h=From:Date:Subject:To:Cc:From;
 b=hk0K63DFA8qXE6U7cFUFPj8FHLUREna+H3fh77hdU6eK7XwIp3WxJv9kETjqeht0c
 AUGR/oQUBnXA/1P79emngYpbU5UTdpOgURYUDOR8WLzaq0CMgh2OHbTEiBvRxyROt0
 BSoNMbBvP9QhVRzJEOSQC3j3yBVNUIuE9qIpEbyiSDEh7aZQtzhZIsqmhBmUVIiK2c
 knVN8A5tQob6V6FBVj2BmjjhfMHJu5OjzXFpukDCnqPOhMEbMYKUSF6NkxSInR0sVP
 DmWEoQrekJWhI2wmV4f1RJl1NXWclH+bc/8fA35b7AlNNKA3tSurBP7RXoGfUyY0EW
 EY5CpnGjbUOdQ==
Received: from localhost (unknown [82.76.59.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7569F17E0C20;
 Mon, 13 Jan 2025 14:36:29 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 13 Jan 2025 15:36:18 +0200
Subject: [PATCH v2] drm/display: hdmi: Do not read EDID on disconnected
 connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-hdmi-conn-edid-read-fix-v2-1-d2a0438a44ab@collabora.com>
X-B4-Tracking: v=1; b=H4sIANEWhWcC/3WNywrCMBBFf6XM2pFMah+48j+kizQZ7UCbSCJFK
 fl3Y8Gly3PgnrtB4iic4FxtEHmVJMEX0IcK7GT8nVFcYdBKN4pI4eQWQRu8R3biMLJxeJMXUtc
 3VFs9dmygrB+Ri97L16HwJOkZ4ns/Wulrf03621wJCV3b1y21+lT36mLDPJsxRHO0YYEh5/wBe
 HFKzcIAAAA=
X-Change-ID: 20250110-hdmi-conn-edid-read-fix-178513c2b7ea
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
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

The recently introduced hotplug event handler in the HDMI Connector
framework attempts to unconditionally read the EDID data, leading to a
bunch of non-harmful, yet quite annoying DDC/I2C related errors being
reported.

Ensure the operation is done only for connectors having the status
connected or unknown.  Additionally, perform an explicit reset of the
connector information when dealing with a disconnected status.

Fixes: ab716b74dc9d ("drm/display/hdmi: implement hotplug functions")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Moved drm_edid_connector_update() after
  drm_connector_hdmi_audio_plugged_notify(), per Dmitry's review
- Updated commit description to mention the explicit connector
  information reset (Maxime)
- Link to v1: https://lore.kernel.org/r/20250111-hdmi-conn-edid-read-fix-v1-1-d68361624380@collabora.com
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 2691e8b3e480131ac6e4e4b74b24947be55694bd..ca3c99b3805fbd78fb3162818b3877450d72b178 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -788,6 +788,8 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
 	if (status == connector_status_disconnected) {
 		// TODO: also handle CEC and scramber, HDMI sink disconnected.
 		drm_connector_hdmi_audio_plugged_notify(connector, false);
+		drm_edid_connector_update(connector, NULL);
+		return;
 	}
 
 	if (connector->hdmi.funcs->read_edid)

---
base-commit: 1854df7087be70ad54e24b2e308d7558ebea9f27
change-id: 20250110-hdmi-conn-edid-read-fix-178513c2b7ea

