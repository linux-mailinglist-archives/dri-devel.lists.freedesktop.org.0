Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07693454866
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 15:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015DB6E47A;
	Wed, 17 Nov 2021 14:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947C26E471
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:19:39 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d5so5077247wrc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 06:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z7XROMuoMUndfAObhvgnMrtL9JrHT86GQvneGL5hOEY=;
 b=AVRpLMfxCJQRGv0y6ImphRLweCTVNdidTEV3BLg7/KA7ozeKmVcjEjCNl3BgYPV3ii
 3ngHNZJaBnzSh7PLPu5GA6/lWggGssH9WARO913D3cH3iIF5fkFH+f92OCiuF0KUl3iI
 owDxFaIvPLAh3BJFnIO4sz80tjKqMnt7dzQPu9jLtdF8LH/G8wdFhXf+lKRAjgxGD9Ks
 27+jisIvXyu2wXEBR0cmeE4/1wwvvAyi5Czgh93CRuhYpniz+5pW8O8j2oXzrXILSwPl
 OT+MahWH50o0URrH4X2h32ppkTTf5ktPCytDdfJ6m72474bYRuckHpQXt3kCGmpifwcd
 JTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z7XROMuoMUndfAObhvgnMrtL9JrHT86GQvneGL5hOEY=;
 b=qk6x0usXUrjy3WBGu8nn1EA0WzhF3qsp0cJ63FoLnveCelsMjeu4JJWDeU0AHlL0rS
 COX6Wshfu5hvMEqztk7Ms57VtMvZbjpR9JwuoIAMM4nIBPHCc++/MNgSCv9znX02zXWl
 urXbvnBDqVbNT0RNC0nboJIXvaM7mPH4MKfNLl3quCv4JPErlzDmi088MfXs2EfGqe6Q
 N/OfqaB1y1wtgHRuHe/XhADMs38RYKKWNetL+blzQtXHHZRLc8yHl6E/9xtrrJH1e1WD
 N6qQhaOIPKT/VAlVgs8BLTl+144nAAP3NlFSD+rbTV3DyQ586JAyDTDgCY3ODKKseQ+I
 B8Sw==
X-Gm-Message-State: AOAM530q20H9uU0tst6Wv24KZjAw4uA2P2ippINYHp3prQLza/QLie37
 pRbO+PcPwtsCk3w0kC8P0vUZdPFhjLoEhPLc
X-Google-Smtp-Source: ABdhPJxtqq9P4rD5wH2L6JkUHJ8yLqNqWeuBSt1tS6kZhEWgYfB/kb6C4FIfFmVMXeKVach9cdPrRQ==
X-Received: by 2002:a05:6000:1862:: with SMTP id
 d2mr20330364wri.251.1637158777855; 
 Wed, 17 Nov 2021 06:19:37 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f98b:434c:566c:492d])
 by smtp.gmail.com with ESMTPSA id o10sm33803wri.15.2021.11.17.06.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 06:19:37 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: tomba@kernel.org
Subject: [PATCH v7 5/9] drm/omap: omap_plane: subclass drm_plane_state
Date: Wed, 17 Nov 2021 15:19:24 +0100
Message-Id: <20211117141928.771082-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117141928.771082-1-narmstrong@baylibre.com>
References: <20211117141928.771082-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2857; i=narmstrong@baylibre.com;
 h=from:subject; bh=wprebf5uOc8BWQya/EJqV1uICFFQ6AiuRw3piy3F3/s=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhlQ9M1QiYTusr8ZvoTMumWHhn7A0DvlhqufmL4C8b
 36n+Rs+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYZUPTAAKCRB33NvayMhJ0fg7EA
 CqoUSF+KiXfDfGX6aACnQAeSwlsftC1xouMBP1Hqg2KclI0fX55XTlpznJogIaPJ5K2iRi2Fs1iqRB
 ++7IFCAjlSw5nrPK+EU9BKk97airrlU0aC4ek4DqQebw0DP1YpZB0OhzKuNe9W6XDhGW5g6WTc0DUr
 9ASwVbluz/ABEj6Ko580UAtDE77N3ICOBTUdNpBgJzjmlrL14ipHEatLwf+6AvviQ2vzCLfjOVxj9J
 id2wGXgseghtV0pax0THuQMWTFOm6avj+YMpGTJimJyG9/DvPBSONBQmAQCtHcu4OJb3bWt21XWvBe
 WHAlCrftlkC3oKsfxlkgxA+DeIvKiH0fyqKeSkLb3IwZDaYgc9aqmW1OdJMlPYMJ6B1UQO3TUBiOP4
 f7l3eBhWXjdx1JbueO0gZBGwCynIPHfiPX6vG1JYeAvIXF9QGd4HrJPzbMof/Q9TIU/NMzo/9N0ZtK
 l1BeEHFTVDs2YUXvR6Nmc0gvqzUD962DOeXuDcqnDJfaMt0WAb7KvVzCWxxhuzif+UBBOnJtOAcU1i
 XBvyNKBGOy18gCXKM5X434MNpu6IYEOGTFrWL8hHkjpJQNH8v7A5DEbpysP8f3MoRxtxN4ZLTIn5Vr
 qcR/NIhKdJ4AWeuOZYZca+1No3EAPBe8vhsP0Ac1s7pkFjZysbpyoXqqQpwg==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Content-Transfer-Encoding: 8bit
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Benoit Parrot <bparrot@ti.com>

In preparation to add omap plane state specific extensions we need to
subclass drm_plane_state and add the relevant helpers.

The addition of specific extension will be done separately.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/omap_plane.c | 36 +++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index 8cc2b899f20c..72d5adbbadfa 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -16,6 +16,13 @@
  * plane funcs
  */
 
+#define to_omap_plane_state(x) container_of(x, struct omap_plane_state, base)
+
+struct omap_plane_state {
+	/* Must be first. */
+	struct drm_plane_state base;
+};
+
 #define to_omap_plane(x) container_of(x, struct omap_plane, base)
 
 struct omap_plane {
@@ -221,11 +228,17 @@ void omap_plane_install_properties(struct drm_plane *plane,
 static void omap_plane_reset(struct drm_plane *plane)
 {
 	struct omap_plane *omap_plane = to_omap_plane(plane);
+	struct omap_plane_state *omap_state;
 
-	drm_atomic_helper_plane_reset(plane);
-	if (!plane->state)
+	if (plane->state)
+		drm_atomic_helper_plane_destroy_state(plane, plane->state);
+
+	omap_state = kzalloc(sizeof(*omap_state), GFP_KERNEL);
+	if (!omap_state)
 		return;
 
+	__drm_atomic_helper_plane_reset(plane, &omap_state->base);
+
 	/*
 	 * Set the zpos default depending on whether we are a primary or overlay
 	 * plane.
@@ -236,6 +249,23 @@ static void omap_plane_reset(struct drm_plane *plane)
 	plane->state->color_range = DRM_COLOR_YCBCR_FULL_RANGE;
 }
 
+static struct drm_plane_state *
+omap_plane_atomic_duplicate_state(struct drm_plane *plane)
+{
+	struct omap_plane_state *state;
+
+	if (WARN_ON(!plane->state))
+		return NULL;
+
+	state = kmalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return NULL;
+
+	__drm_atomic_helper_plane_duplicate_state(plane, &state->base);
+
+	return &state->base;
+}
+
 static int omap_plane_atomic_set_property(struct drm_plane *plane,
 					  struct drm_plane_state *state,
 					  struct drm_property *property,
@@ -271,7 +301,7 @@ static const struct drm_plane_funcs omap_plane_funcs = {
 	.disable_plane = drm_atomic_helper_disable_plane,
 	.reset = omap_plane_reset,
 	.destroy = omap_plane_destroy,
-	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
+	.atomic_duplicate_state = omap_plane_atomic_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 	.atomic_set_property = omap_plane_atomic_set_property,
 	.atomic_get_property = omap_plane_atomic_get_property,
-- 
2.25.1

