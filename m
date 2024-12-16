Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F999F3DCB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 23:54:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB8E10E7DB;
	Mon, 16 Dec 2024 22:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Cm/rg9ZA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A765E10E12B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 22:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734389684;
 bh=3Yv9HXZbZ6qFS04G/TTVkzxJkRaupXuzYL93ruy4RrE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Cm/rg9ZAzJp+Ba1aPf8zhm6N6tEvrGa7bWdhx82EL9brhfSMaNLqMzq2Gf5m75ZKb
 KtIDHWGlU0DSStagLTq9FqzCcb91NnXLb6TRVBUXr25MEsvkFa4D4iLRcg5rtaZmRA
 fn2TQEpDbbptzge0WpqiFDX5njooUt7ZplzdoaYvw+GpvPGVfHTwsa3GOrGqCMNiLK
 DtpA/ZEe/eplP1iJ0BOn90d3q6AORm+YGfUfL+ojwyO8uzezYlyCmYFqF5Oqzv0aKH
 /T8iqlWbamMhK9y3YoJlXkdxe81UzalQt1QH7MDw4zh1bC5WDMd9YGAk+jQLJcwVsV
 dFQxiP23D/sGA==
Received: from localhost (unknown [188.27.48.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 41D1717E3834;
 Mon, 16 Dec 2024 23:54:44 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 17 Dec 2024 00:54:08 +0200
Subject: [PATCH v3 2/2] drm/connector: hdmi: Validate supported_formats
 matches ycbcr_420_allowed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-bridge-conn-fmt-prio-v3-2-3ecb3c8fc06f@collabora.com>
References: <20241217-bridge-conn-fmt-prio-v3-0-3ecb3c8fc06f@collabora.com>
In-Reply-To: <20241217-bridge-conn-fmt-prio-v3-0-3ecb3c8fc06f@collabora.com>
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
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/drm_connector.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index fc35f47e2849ed6786d6223ac9c69e1c359fc648..ca7f43c8d6f1b31ef9d3a1ee05f4df930ecffac4 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -507,6 +507,9 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (!supported_formats || !(supported_formats & BIT(HDMI_COLORSPACE_RGB)))
 		return -EINVAL;
 
+	if (connector->ycbcr_420_allowed != !!(supported_formats & BIT(HDMI_COLORSPACE_YUV420)))
+		return -EINVAL;
+
 	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
 		return -EINVAL;
 

-- 
2.47.0

