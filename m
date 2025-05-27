Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD55AAC4E64
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 14:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCA710E4CB;
	Tue, 27 May 2025 12:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="HCfS26OV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8000B10E4BC
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 12:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1748347891;
 bh=q9WzOnxUTPg/Zdl2c63Tbt+DCpbXd/HVonjfgjlirC8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=HCfS26OVMTU0wAKANDLsMt9kRoP8+VFbq8f50t8xbUIxjhjRBlNC9Fpvxzd2+kKjy
 mOI3K9hKksP7/9leOiJbxOemaXY6+1aVrTZyzEJVKdKHfHbZmtvEJ8w5H3D/7f3G70
 XjDIqpniRJpbA56IwMUOFDMuD0mMyf9SBfFy5jrT2NhrcDe+dGyF35Ca7Y73E14NwW
 V6IONDg8QT3xFdDyoo4Hpa+meyqcnVG1hMtbUbauUzuLvCu0fI1qo1GP68N9GfyWHC
 u1puA11cXvb3JRgyQAMF3P1o9mDhK5dCKE26P3BfbzMo2x/a3ZCBBapX6YQbfSzLBj
 iSh6/cc/aJqbw==
Received: from localhost (unknown [82.76.59.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id B9FA017E37D0;
 Tue, 27 May 2025 14:11:31 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 27 May 2025 15:11:20 +0300
Subject: [PATCH v5 12/19] drm/tests: hdmi: Setup ycbcr_420_allowed before
 initializing connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-hdmi-conn-yuv-v5-12-74c9c4a8ac0c@collabora.com>
References: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
In-Reply-To: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
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

Initializing HDMI connector via drmm_connector_hdmi_init() requires its
->ycbcr_420_allowed flag to be adjusted according to the supported
formats passed as function argument, prior to the actual invocation.

In order to allow providing test coverage for YUV420 modes, ensure the
flag is properly setup.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 64037110bcaa9713999d77a254fc9377170a41bb..e3e2878d29ea5bfe107a5098d0cbf2653af0bc9b 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -183,6 +183,8 @@ __connector_hdmi_init(struct kunit *test,
 	enc->possible_crtcs = drm_crtc_mask(priv->crtc);
 
 	conn = &priv->connector;
+	conn->ycbcr_420_allowed = !!(formats & BIT(HDMI_COLORSPACE_YUV420));
+
 	ret = drmm_connector_hdmi_init(drm, conn,
 				       "Vendor", "Product",
 				       &dummy_connector_funcs,

-- 
2.49.0

