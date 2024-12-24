Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FD49FC13B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 19:23:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA2E10E34D;
	Tue, 24 Dec 2024 18:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qzI7FbCW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADA710E27B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 18:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1735064581;
 bh=JtCEEwmYZPadtfHTgKuyPEYfaljhF6+DmUW9Qug1I4M=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=qzI7FbCWnx/0g6jIYxWEd+JuYqJXEbRwwVIjXxn7RQO7LD4Xj8bJbWQWqihG8aFw3
 OltivGsPgga1xixCuqC1dfDln2S05NeMcWJWaEKtJCCFP96LDP4i0+GgWh8ASkOZH/
 36iJQ9rV0U9V24GYioy4/sDAtXAAVAFloik/JmG9Jl8WKt7jG0iEtNh/VHHMNeLIfr
 AqYUbEz5kaSVJm3n3R2LhaO5VzWgkwDiDGR5lyV637BnVNuyE3WoVMJCPhP2DFHjV/
 LrZ4tbVdBvWarPHbjsnFtkzt52z0Fu+6hDRknO35u9hesZHF5oDAtIuIVXlI7e4phg
 qNQcJJw+eDsUA==
Received: from localhost (unknown [84.232.140.38])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D682A17E15B4;
 Tue, 24 Dec 2024 19:23:00 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 24 Dec 2024 20:22:43 +0200
Subject: [PATCH v4 3/4] drm/connector: hdmi: Validate supported_formats
 matches ycbcr_420_allowed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-bridge-conn-fmt-prio-v4-3-a9ceb5671379@collabora.com>
References: <20241224-bridge-conn-fmt-prio-v4-0-a9ceb5671379@collabora.com>
In-Reply-To: <20241224-bridge-conn-fmt-prio-v4-0-a9ceb5671379@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
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

Ensure HDMI connector initialization fails when the presence of
HDMI_COLORSPACE_YUV420 in the given supported_formats bitmask doesn't
match the value of drm_connector->ycbcr_420_allowed.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/drm_connector.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index ae6e71305f3000aff1cfe96b050061a300b9478e..46295176f39f91d69eaad716bb9315002f38e633 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -590,6 +590,9 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (!supported_formats || !(supported_formats & BIT(HDMI_COLORSPACE_RGB)))
 		return -EINVAL;
 
+	if (connector->ycbcr_420_allowed != !!(supported_formats & BIT(HDMI_COLORSPACE_YUV420)))
+		return -EINVAL;
+
 	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
 		return -EINVAL;
 

-- 
2.47.0

