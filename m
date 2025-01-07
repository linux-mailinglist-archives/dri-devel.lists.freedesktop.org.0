Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5CBA033AB
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 01:01:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9C510E146;
	Tue,  7 Jan 2025 00:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="i4nQzo6u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985E210E146
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 00:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1736208053;
 bh=orwkzm53fje6xyZyzrYqG7Y6aJ6xlLrIY6mv0qH1TWw=;
 h=From:Date:Subject:To:Cc:From;
 b=i4nQzo6ulju+3Xg9UHJ8xo3tRydcjJVT8dAvCZYMfJn2khlANZw5UiX5pU0RRwJIw
 2v8IRfaFQsv5Mr8ioEoXhacYPLsUme2S57EL4K4O6ntbkqvLObwkACYa+1Irbkzo/5
 hHtLOvGDElBoJybcX6MrIa44r4uIDwqqcDZp+a+7j1foC3M6RwoGPLealk73gC8nbl
 8wFhnqEXW8GqxVd+yCT3qeYGkni3xU9+Gri/xS4PK/CvPbbbTdXu582+ec28flp6W7
 F4XhOB+hJQ5DN99cI5xHuQ4gIxP6Mx7EISODjwfZi1RLoLLxcZdk77XCAZAD06m1oY
 O8CeC6eyKkdXw==
Received: from localhost (unknown [188.27.57.36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B4EBC17E0DE7;
 Tue,  7 Jan 2025 01:00:53 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 07 Jan 2025 02:00:35 +0200
Subject: [PATCH] drm/connector: hdmi: Handle NULL display mode in state
 check helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-hdmi-conn-null-mode-v1-1-fff4be46d106@collabora.com>
X-B4-Tracking: v=1; b=H4sIAKJufGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQwNz3YyU3Ezd5Py8PN280pwc3dz8lFTdpFSDZNNUE8vUFItkJaDOgqL
 UtMwKsKnRsbW1AOzer8ZlAAAA
X-Change-ID: 20250107-hdmi-conn-null-mode-be0c5e49ed8c
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
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

---
base-commit: 938fbb16aba8f7b88e0fdcf56f315a5bbad41aad
change-id: 20250107-hdmi-conn-null-mode-be0c5e49ed8c

