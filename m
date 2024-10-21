Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3A29A6B9C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 16:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABEFB10E525;
	Mon, 21 Oct 2024 14:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SlEDc8Bm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A78F10E524
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 14:08:20 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAB5E19F8;
 Mon, 21 Oct 2024 16:06:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1729519593;
 bh=3lKvoJyc5GCASmOzrHd7zuyVDvlv3n+wB5AYfd2tH3M=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=SlEDc8Bm5JwReBKKhmIzf2Kpaj0X8qJs80rKRIEuEAf9vGmx6ePxD7ulrdqdm9A7P
 CY+FwHJuQPjVz57xAARYkPS5n+GZi+V44nqe85cL4SDiS0aCOqjzrISfKQ5eFRuzn5
 NpXGIG8jJbCJ8ZaJoK9z0Xq/pj6LbTiEEV+E11D8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 21 Oct 2024 17:07:48 +0300
Subject: [PATCH 4/7] drm/tidss: Add printing of underflows
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-tidss-irq-fix-v1-4-82ddaec94e4a@ideasonboard.com>
References: <20241021-tidss-irq-fix-v1-0-82ddaec94e4a@ideasonboard.com>
In-Reply-To: <20241021-tidss-irq-fix-v1-0-82ddaec94e4a@ideasonboard.com>
To: Devarsh Thakkar <devarsht@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jonathan Cormier <jcormier@criticallink.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2501;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=3lKvoJyc5GCASmOzrHd7zuyVDvlv3n+wB5AYfd2tH3M=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnFmBN0uzdnlnXgYBoLHvewlQcuKZ2YjzxIEHo8
 l6U4vEbzheJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZxZgTQAKCRD6PaqMvJYe
 9d/DEACsWQSvvw1DFMNhDBKPKC5ATHWGCl/HqMpfy+YZxFiI9QM0r0HNAa6cujKt+NM0Oie6CE0
 +FEgyfyH73S5QNNTGASLx2WbE9WxzlolHN6+ROSSunNaaxMOvuZ3uhmSGLIArH9C5REpd2N4giz
 SAGxlQ0zP5V7RvXCpDlEV5oX6iFLLSIHjzaDwJ78WXzayJuekZJ0fwFWA47a96nAGxFxsG7YaoI
 BlAH+EtecDH9+zIo1yuBmTyntIGO9Zh8yTUmUtz3FNiycpu77UNW3DsimyjBmhU109H55YBqaL4
 7Y+CFOYz4XIWaYK4MOYkmke4nD8naZQSAgfYDxrLTE/SGFI2Ue2QeRZ3kIa6ktt/i/zrP5b+4fx
 r59RyYffgkdOqN8PABzSHkKFZFztF8FGkrCUn4Zj/wCHubaxNKNU9I1A8+4Q7au2dXyQFC7MJiC
 8y2W4Zt61lVWqbnO/YzPFuuOvCnGe3nSoIihw52eoArceKrQXtO7ZX4dInzXqwjBgE9TI0D4mjx
 Y29cf03a7RNHQ+2y2kquAANHR2OJW88qv4bm0SD7uMWyHH7sIKOpFYnJQaB1RDERNrKC73luO/B
 TZ9UYPUJvOiOKJ2/1kr35+1dGj+L+KGkJpMWVWaxAz9s2z4YIEqXx5QBv72h4XHruCChyD9hTUW
 Xn9DL2e7CixOdQw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

Add printing of underflows the same way as we handle sync losts.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_irq.c   | 14 ++++++++++++++
 drivers/gpu/drm/tidss/tidss_plane.c |  8 ++++++++
 drivers/gpu/drm/tidss/tidss_plane.h |  2 ++
 3 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/tidss/tidss_irq.c b/drivers/gpu/drm/tidss/tidss_irq.c
index 91498ff664a2..3cc4024ec7ff 100644
--- a/drivers/gpu/drm/tidss/tidss_irq.c
+++ b/drivers/gpu/drm/tidss/tidss_irq.c
@@ -78,6 +78,14 @@ static irqreturn_t tidss_irq_handler(int irq, void *arg)
 			tidss_crtc_error_irq(crtc, irqstatus);
 	}
 
+	for (unsigned int i = 0; i < tidss->num_planes; ++i) {
+		struct drm_plane *plane = tidss->planes[i];
+		struct tidss_plane *tplane = to_tidss_plane(plane);
+
+		if (irqstatus & DSS_IRQ_PLANE_FIFO_UNDERFLOW(tplane->hw_plane_id))
+			tidss_plane_error_irq(plane, irqstatus);
+	}
+
 	return IRQ_HANDLED;
 }
 
@@ -112,6 +120,12 @@ int tidss_irq_install(struct drm_device *ddev, unsigned int irq)
 		tidss->irq_mask |= DSS_IRQ_VP_FRAME_DONE(tcrtc->hw_videoport);
 	}
 
+	for (unsigned int i = 0; i < tidss->num_planes; ++i) {
+		struct tidss_plane *tplane = to_tidss_plane(tidss->planes[i]);
+
+		tidss->irq_mask |= DSS_IRQ_PLANE_FIFO_UNDERFLOW(tplane->hw_plane_id);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index a5d86822c9e3..116de124bddb 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -18,6 +18,14 @@
 #include "tidss_drv.h"
 #include "tidss_plane.h"
 
+void tidss_plane_error_irq(struct drm_plane *plane, u64 irqstatus)
+{
+	struct tidss_plane *tplane = to_tidss_plane(plane);
+
+	dev_err_ratelimited(plane->dev->dev, "Plane%u underflow (irq %llx)\n",
+			    tplane->hw_plane_id, irqstatus);
+}
+
 /* drm_plane_helper_funcs */
 
 static int tidss_plane_atomic_check(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/tidss/tidss_plane.h b/drivers/gpu/drm/tidss/tidss_plane.h
index e933e158b617..aecaf2728406 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.h
+++ b/drivers/gpu/drm/tidss/tidss_plane.h
@@ -22,4 +22,6 @@ struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,
 				       u32 crtc_mask, const u32 *formats,
 				       u32 num_formats);
 
+void tidss_plane_error_irq(struct drm_plane *plane, u64 irqstatus);
+
 #endif

-- 
2.43.0

