Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 062FFA7149A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 11:20:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0737B10E698;
	Wed, 26 Mar 2025 10:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="EgG127FC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32D010E696
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 10:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742984405;
 bh=kWYvxqjKorV2NXGSW+7sreFvakOrQdavOIvZdsoGzbo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=EgG127FC9lgj/sxZa/b/xS6vEnHEOjjXci2q1HlF+HA9b7ZOPJnvS/+wgapN++Vul
 LWe7beitKH91r+WN0oq9BBw8X2y0Ng3GAN6tYb7EEKCvM0WgaJe/C7AbhH7EFkcwpp
 BUmbvmez2o6svAIQe+WgxjK0mZY5lBlUzaaCKsjhfggZI2DgvAST8ijKIcEgXyHAYw
 EaWSUHO34NadBdMPQFo3T5u6BqTlx4O5sVsTR5g+77NWJyyb6yLoc1+iln4IFuwUE5
 SVPwS9Z9IdVHNJijBl7wNXbpn6BHWGXXZu9qZ/pbXUy1mg8EX523yVeZhaH7BcGa3e
 Yrbmz3VNSY63Q==
Received: from localhost (unknown [84.232.140.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 5641D17E0B9D;
 Wed, 26 Mar 2025 11:20:05 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 26 Mar 2025 12:19:56 +0200
Subject: [PATCH v3 07/15] drm/connector: hdmi: Use YUV420 output format as
 an RGB fallback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-hdmi-conn-yuv-v3-7-294d3ebbb4b2@collabora.com>
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

Try to make use of YUV420 when computing the best output format and
RGB cannot be supported for any of the available color depths.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 6de0abb15ecb36fd4eb98725e2a3835e5e0db134..3859600c6af4a79f30858adfc9f9a710dfe561a5 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -650,7 +650,17 @@ hdmi_compute_config(const struct drm_connector *connector,
 
 	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
 				      HDMI_COLORSPACE_RGB);
+	if (!ret)
+		return 0;
 
+	if (!connector->ycbcr_420_allowed) {
+		drm_dbg_kms(connector->dev,
+			    "YUV420 output format not allowed for connector.\n");
+		return -EINVAL;
+	}
+
+	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
+				      HDMI_COLORSPACE_YUV420);
 	return ret;
 }
 

-- 
2.49.0

