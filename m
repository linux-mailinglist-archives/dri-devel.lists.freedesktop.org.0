Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F12EA9C563
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 12:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB0810E932;
	Fri, 25 Apr 2025 10:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ev7YgVTr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B8510E929
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 10:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1745576903;
 bh=et9K11m7U26jM/XhRhXMdA0treky0/PVv4RY8I3cu50=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ev7YgVTraWglrd9Hx6RzDmVepZgXMJv9yN/OKqrsnmgLJQlEAJx5c8T8dcC0V8xtA
 uwV2N9DPBu/gt7ZlAjyBImmvaHsyJsM+WqAdDzk3q/RuCmfBxMh5fRUU48EQhj9oLv
 6LHcob9nuCaU3wbQ6pvd2ubTx+XKxta+RABeui6XhsRhRtzsh8W5+QlEaVy8RlkBa4
 0pcO/XSFySky3jT0GB/4vxyGvByU13fsiQx7eo83gpDrEg7ERvmAXZNS0tspBhQ9ZL
 6SVUZLTxoSu7rNs/QKWO7y+ZgdEdRDXxopcz7LRGwUPrRTurm/J7EguboT2mBTzPF9
 TrUgW5O7bCSyQ==
Received: from localhost (unknown [82.76.59.226])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id BC4C517E36C8;
 Fri, 25 Apr 2025 12:28:23 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 25 Apr 2025 13:26:57 +0300
Subject: [PATCH v4 06/23] drm/connector: hdmi: Use YUV420 output format as
 an RGB fallback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-hdmi-conn-yuv-v4-6-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
In-Reply-To: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
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

Try to make use of YUV420 when computing the best output format and
RGB cannot be supported for any of the available color depths.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 9e0a468073acbb2477eff1abef1c09d63620afaa..1fba10b92a6baa49150b6ff1e96bf2c2739bf269 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -648,14 +648,26 @@ hdmi_compute_config(const struct drm_connector *connector,
 				       8, connector->max_bpc);
 	int ret;
 
-	/*
-	 * TODO: Add support for YCbCr420 output for HDMI 2.0 capable
-	 * devices, for modes that only support YCbCr420.
-	 */
 	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
 				      HDMI_COLORSPACE_RGB);
+	if (!ret)
+		return 0;
 
-	return ret;
+	if (!connector->ycbcr_420_allowed) {
+		drm_dbg_kms(connector->dev,
+			    "YUV420 output format not allowed for connector.\n");
+		return -EINVAL;
+	}
+
+	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
+				      HDMI_COLORSPACE_YUV420);
+	if (ret) {
+		drm_dbg_kms(connector->dev,
+			    "YUV420 output format doesn't work.\n");
+		return ret;
+	}
+
+	return 0;
 }
 
 static int hdmi_generate_avi_infoframe(const struct drm_connector *connector,

-- 
2.49.0

