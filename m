Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CA8D0792D
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 08:31:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C5E10E7F7;
	Fri,  9 Jan 2026 07:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="d/GBUMzy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9E010E7F7
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 07:31:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 073EB4E4201C;
 Fri,  9 Jan 2026 07:31:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CE3FF60734;
 Fri,  9 Jan 2026 07:31:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 56B9E103C8820; Fri,  9 Jan 2026 08:31:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767943911; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=gRp+L8UjoWDmuIpXqFfLmzodLWWfkNseQ+dp2qEU4qk=;
 b=d/GBUMzyOhyO6LiVGwWMVSTwjXJiCKoYcpKd9hSZVUfHnaWKqsfm77Es/Y3M4CDLrDmE7T
 q/Np1b0DiwrGutUJuMxA8VlxH1GAcBbWgs29aOxh2sDn/VAKdmRdsonPD8pAkXtjNncmKF
 v3BlnsL78EGj5KNwKQUqRZTqdsK8euUgX2TPT/czOtUTnFD2q//gOWMBEjNkagV6DWwt6M
 j/7bGcj+3gJAKAZ7ek+YNMxHT2YYYSr1+41gzbCQ+BYmbzBmRVgi4sTSJfR0KnobunBHnJ
 YlGEYY3wHaMXPR7i1nzIQeRV7OouKo0K3C0EX6FNJu+ti976/h4aPcemX+uSUA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 Jan 2026 08:31:33 +0100
Subject: [PATCH v2 02/12] drm: of: drm_of_panel_bridge_remove(): convert to
 of_drm_find_and_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-2-8bad3ef90b9f@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philippe Cornu <philippe.cornu@st.com>, benjamin.gaignard@linaro.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
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

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 include/drm/drm_of.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index f3e55ea2174c..f2f2bf82eff9 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -171,9 +171,10 @@ static inline int drm_of_panel_bridge_remove(const struct device_node *np,
 	if (!remote)
 		return -ENODEV;
 
-	bridge = of_drm_find_bridge(remote);
+	bridge = of_drm_find_and_get_bridge(remote);
 	drm_panel_bridge_remove(bridge);
 
+	drm_bridge_put(bridge);
 	of_node_put(remote);
 
 	return 0;

-- 
2.52.0

