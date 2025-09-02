Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5726CB3F894
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0929010E5E7;
	Tue,  2 Sep 2025 08:34:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mAkzWtc0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC18F10E5F7
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:34:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 547E860208;
 Tue,  2 Sep 2025 08:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB6EC4CEF7;
 Tue,  2 Sep 2025 08:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756802051;
 bh=IschafHJlnxfPmLAmtyZZlIURuTFkl8YKzxycliOS4U=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mAkzWtc08wcIQ/JhwLldU+WE3kZGxJ+fJn7+L5uxozbxHTcwKeSdebNb+fSMgwjlX
 /Wr6th7qQAOCiEV3POxfqLYB2KtbxZ5+loh3TacEDSUxxM9RNWWoXdBaS/7Zr/7ZXA
 jT/3NlBYyjjehiS0JBi4niie616P8n0/C7/lbhb5cHDwytcUkzP8f5H0+3clL/3mEb
 YvU0rMupO7EjxWJAOZXXs/8jZhcbmHld61gqgW01LOi04lQgNFbuMIeva/4ZxSL+SR
 z5eyTqZyo9p6MWZbZdZIOmNCWczmV6i56w2AtspXHJxYKzKMeNSzWQHsF8Pau14EvO
 DTyBkWF7e/qhA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 10:32:51 +0200
Subject: [PATCH 23/29] drm/tidss: dispc: Add format lookup by hw value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-state-readout-v1-23-14ad5315da3f@kernel.org>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
In-Reply-To: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2072; i=mripard@kernel.org;
 h=from:subject:message-id; bh=IschafHJlnxfPmLAmtyZZlIURuTFkl8YKzxycliOS4U=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbVu/b9qRfbEXn5o8vNp95YTJfQfz+l0DzB/eVN92c9
 qpTTGPL/46pLAzCnAyyYoosT2TCTi9vX1zlYL/yB8wcViaQIQxcnAIwEVlZxjqFcoXJ593/xB0R
 KLmYcNqwPFDzx2H2xwzp847Lyk0vXWrori/LoyjCfjdb91nbrnU77jE29B/aWZglqrt/3uF9B1r
 eWPny2zAd33RB56uzhyP3jhNH+mbobhaPXs+zwyb7lMyGpAxBAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The tidss dispc driver has a table associating fourcc's and their
hardware representation.

So far, we only needed to do the fourcc to hardware lookup, but we'll
need to do the hardware to fourcc lookup in the future, so let's provide
a function to do so.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 11 +++++++++++
 drivers/gpu/drm/tidss/tidss_dispc.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 7d94c1142e8083dab00fcf5c652ae40f98baeabf..32248b5f71b7566dc33d7a7db0efb26d3a9ed1c3 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -2117,10 +2117,21 @@ static const struct {
 	{ DRM_FORMAT_UYVY, 0x3f, },
 
 	{ DRM_FORMAT_NV12, 0x3d, },
 };
 
+u32 dispc_plane_find_fourcc_by_dss_code(u8 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(dispc_color_formats); ++i)
+		if (dispc_color_formats[i].dss_code == code)
+			return dispc_color_formats[i].fourcc;
+
+	return 0;
+}
+
 static void dispc_plane_set_pixel_format(struct dispc_device *dispc,
 					 u32 hw_plane, u32 fourcc)
 {
 	unsigned int i;
 
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index 60c1b400eb8933dd13efd4ae3d09dc9569eed96f..849ec984026e223de7c8a55a4b5672c2262f38c0 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -146,10 +146,11 @@ int dispc_plane_check(struct dispc_device *dispc, u32 hw_plane,
 void dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
 		       const struct drm_plane_state *state,
 		       u32 hw_videoport);
 void dispc_plane_enable(struct dispc_device *dispc, u32 hw_plane, bool enable);
 const u32 *dispc_plane_formats(struct dispc_device *dispc, unsigned int *len);
+u32 dispc_plane_find_fourcc_by_dss_code(u8 code);
 
 int dispc_init(struct tidss_device *tidss);
 void dispc_remove(struct tidss_device *tidss);
 
 #endif

-- 
2.50.1

