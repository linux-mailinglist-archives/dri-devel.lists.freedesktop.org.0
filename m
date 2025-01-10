Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFC1A09D8E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 23:04:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2B110E185;
	Fri, 10 Jan 2025 22:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hoz3ptrU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E11910E185
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 22:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1736546668;
 bh=8LdbeT1mE2mr1iztuyhRojrP5Op0o8wlqWJtnwNuwV4=;
 h=From:Date:Subject:To:Cc:From;
 b=hoz3ptrUQUjZailrOYYWV0rGu0ZH5rbFe+5OUUfK08Py1W3t0v4Mq+rKW6XoCiyCj
 aeBbZEoc76xJOmKHQDC8kl5SqRm7XnXjF1Uv1FoGHB+poo0kCf9s9EgTkycb1Ykz/G
 VMT1EBE9+vy+k72+J7mN9HIbeYAVXvxYRTdw5DFeg/oaex/np5fVRT+tcxmpB/1cYq
 Bcg4JsyB4r+HMfMfGCwGqtPvF35pe/4GWzCTfKcbRH4hIgR0/LoyKXUN9nfj5JSxeR
 IHVRRoimVS3AMyqLUmGUHdwEOJRqOnxLzjVQ5kb8MaMz41C6Y2pdHgBkpBilV44RqW
 Wmgm54QFNXMkw==
Received: from localhost (unknown [82.76.59.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 58A4E17E0DFB;
 Fri, 10 Jan 2025 23:04:28 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 11 Jan 2025 00:04:09 +0200
Subject: [PATCH] drm/display: hdmi: Do not read EDID on disconnected connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250111-hdmi-conn-edid-read-fix-v1-1-d68361624380@collabora.com>
X-B4-Tracking: v=1; b=H4sIAFiZgWcC/x2MQQqAMAzAviI9W1gnovgV8TDX6npwygYiDP/u8
 JhAUiBLUskwNQWS3Jr1jBWobcAHF3dB5cpgje0NkcHAh6I/Y0RhZUziGDd9kIaxp87bdRAHtb6
 SVP2f5+V9P4CdZURpAAAA
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

Ensure the operation is performed only for connectors having the status
connected or unknown.

Fixes: ab716b74dc9d ("drm/display/hdmi: implement hotplug functions")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 2691e8b3e480131ac6e4e4b74b24947be55694bd..8e4b30e09b53b84cfd36199d56db3221a00085b0 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -786,8 +786,10 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
 	const struct drm_edid *drm_edid;
 
 	if (status == connector_status_disconnected) {
+		drm_edid_connector_update(connector, NULL);
 		// TODO: also handle CEC and scramber, HDMI sink disconnected.
 		drm_connector_hdmi_audio_plugged_notify(connector, false);
+		return;
 	}
 
 	if (connector->hdmi.funcs->read_edid)

---
base-commit: 1854df7087be70ad54e24b2e308d7558ebea9f27
change-id: 20250110-hdmi-conn-edid-read-fix-178513c2b7ea

