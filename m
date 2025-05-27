Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA38AC4E5E
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 14:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEA010E4C6;
	Tue, 27 May 2025 12:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="KSunYObP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F99510E4AE
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 12:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1748347888;
 bh=L/0iOYUvrFmB2bU6oHMPLyfBc1hpgRFdxe/rWnvnSRo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=KSunYObPflWL9GGUUmQrltwsBZFrF//8xb/ZwvnnwfnzXuee++51PPlosdDpZ5YCV
 kPnF/xDzGKO1sp6I+CmiYdgC/pM/Y7TPQQRsY+hR6CbJ7qgLJpMluoPbhhuvGpaAV6
 grXewBpOlYo3GNrr4au3qcYOL+exi6KNNqrwWJmt/FrFXEWoWZ0G5obO5eMh5/cEYl
 4mavZ3UrEeTBux8jWf3axT1mBA5zAPBnbzeg/PzeCiB/he7Z2D+24ROnD2lUS++kno
 o8mvFaISPy/l4JWHIT5Hoxyf2emFFcrw3sbjdyFlMrttErbIfZfxyUZg0uOr5H9kZG
 Qd/ns9o5wSJ7g==
Received: from localhost (unknown [82.76.59.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 6D3A017E37BE;
 Tue, 27 May 2025 14:11:28 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 27 May 2025 15:11:16 +0300
Subject: [PATCH v5 08/19] drm/tests: hdmi: Switch to 'void *' type for EDID
 data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-hdmi-conn-yuv-v5-8-74c9c4a8ac0c@collabora.com>
References: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
In-Reply-To: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>
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

Replace 'const char *' with 'const void *' type for current_edid member
in struct drm_atomic_helper_connector_hdmi_priv, as well as for the edid
parameter of set_connector_edid() function.

Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index c8dc6fa0f925e35e9903a18bac7f78f9d8165960..00576f747f1f36a100e13b0316cb492f76474d45 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -33,7 +33,7 @@ struct drm_atomic_helper_connector_hdmi_priv {
 	struct drm_encoder encoder;
 	struct drm_connector connector;
 
-	const char *current_edid;
+	const void *current_edid;
 	size_t current_edid_len;
 };
 
@@ -56,7 +56,7 @@ static struct drm_display_mode *find_preferred_mode(struct drm_connector *connec
 }
 
 static int set_connector_edid(struct kunit *test, struct drm_connector *connector,
-			      const char *edid, size_t edid_len)
+			      const void *edid, size_t edid_len)
 {
 	struct drm_atomic_helper_connector_hdmi_priv *priv =
 		connector_to_priv(connector);

-- 
2.49.0

