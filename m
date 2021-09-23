Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F27E24158CE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 09:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B3A6ECE9;
	Thu, 23 Sep 2021 07:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46196ECE6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 07:07:08 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id t7so14060687wrw.13
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 00:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dhy9/QR4L3UcC/+5+wWB+hUZ0V3eL4h1DgQ/CLX1xJ0=;
 b=eeNb+O7m+K3bKw/yz9oaaxoTxxKLqkl1QJxdlb+5acSY1Efpz6BrzuEV1zEeBTOiuc
 waJmyVq8Iu5EnoLMtyNU1Ltim6cZ0Bnm6BBLtEFcTorpiZ9rDhiEnXB5bm+BVxS9/okQ
 iIJdiNRjPJuoBn0/dZSn2P2J2DHAGF6KBvZW7iXjyyZ8KIHsE6eIaPPhIa+zbK7IWZKi
 tyRHExWws5AYKmLSqwApKZ921IYqnnugJSuHX88z9UpMulmXB73nDrZUdQd3KqVIDnTt
 QfsnsU8NDeMkUiuNTcXiC01wEgy/E/pzgKQE3WmTjXshweBew7a7WE2U1uLSyPE4Rd7U
 Kg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dhy9/QR4L3UcC/+5+wWB+hUZ0V3eL4h1DgQ/CLX1xJ0=;
 b=BWe1E8rPopDy29pOMplub3nGriZ2wxtZ3QjWoS/coWGIaydlAD3TgJ+Rj5WdISwbhF
 k7uTxAsBbTuFBeZ5yg4M7JlBwmY3/lh2TMOX4NakQdbdHxdeHyDB8V0vnTMAjwNyITUK
 g2Sz8jihZ7uPIuxoFMZE4C9Y+d/pmnPocx163Yo6OonSbhTYNG8ZBwtVbdLiMbcoE0bu
 3orjuVp4mSmh0xIdOxQeMT240Ni+xfVS3tzm/0wjAbTFHQN+bQLC7yIIflBZoSYh7tDa
 qITwTWTh38H0vOc26wLX3+gQVevuJannZmd5588vLtbLqoz/I7PBW5m7MOg9aKgw7sE9
 GguA==
X-Gm-Message-State: AOAM533wilJVw40QoTw/oBzNndYtsJ0iwesJUqHNpYZtUWo6eCuZYAoV
 sZR1l6FVc5x6pUq4ETztPeRl5M448GskSdk7
X-Google-Smtp-Source: ABdhPJyc4wwekASLFc5/C6gQyqTnGmAKv0w/S3Te5s0VBUMBraqNQE9yNUXgzsjAxKpJ1Ekas7+LYA==
X-Received: by 2002:adf:d1cf:: with SMTP id b15mr3170799wrd.181.1632380827255; 
 Thu, 23 Sep 2021 00:07:07 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:74cf:b054:76f4:7692])
 by smtp.gmail.com with ESMTPSA id d2sm4380357wrc.32.2021.09.23.00.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 00:07:06 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: tomba@kernel.org
Cc: linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com,
 Benoit Parrot <bparrot@ti.com>, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v5 4/8] drm/omap: omap_plane: subclass drm_plane_state
Date: Thu, 23 Sep 2021 09:06:57 +0200
Message-Id: <20210923070701.145377-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923070701.145377-1-narmstrong@baylibre.com>
References: <20210923070701.145377-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2877; i=narmstrong@baylibre.com;
 h=from:subject; bh=Bv1MHMANvHxeV2t+37ZVGiGFuepdThzrdPx6MB8l2pU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhTCchQiRBSVCNm38RVnltb/bJqf2t0Rf1ZP2TPPIV
 lyMe5JSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYUwnIQAKCRB33NvayMhJ0SQCD/
 4gnL+7/g669cM6jktAXoRr5TNy8stFoUwRZKuRwpV3k0jCDsl1ZBnqtYyz9JntfQTK3CRprD9uvNbq
 OVC1TITYxg+cJgCUSzUujaDJGUPHHU0l39kJAtrifllLcfvNzex2UuV64Y3vBJLfuvPbh8WvY8YORg
 P9PB/ZJosDTh511B5SV1sXyPvoEmE5wjC6UCj/o2He1ulv5oliJM4sCrA2Jh6bo5qWk7W3uUUKjbje
 pyFu679Vtq7lZQ7oLXVVf6o3iZ4jeOpbl/LsFz2leJxRtwsAOAYHSmkw86mYMfJCU7SUXjMemePV4i
 8HTjADsYwgXgvQSBWweyXUrnPM3VQRgfMYAcrLmw04QTlWPcYBjMr1tGtxGvauQ/dDEzazJaaD3YKR
 aDNzo1vf+wm2gEZAvH5KbtwGD3KsonjkYSXLeThNI3fJht0GG3qH+2PfCX2lK40WhAxPPMU2us0JI5
 M1gFAVH2m8kzQngcxbhDcomRBhWRaLxeFpeG1MlYt1nTX/24ZCsRxw+m+nN8FhK0KfI7EhwD1i942S
 n+dorsMRwNQrZuW3RUdbiZD2Z9ElYXNj+i8zjIP+GUXJW8iWchsgo3CfnL1KslgaZWeShVVxWumrcu
 fDuJjT2QaUwjwOgX+OclLCyh+7NN6AGarh1UzFXfld1w+/TLiQDz6oqqGqqQ==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Benoit Parrot <bparrot@ti.com>

In preparation to add omap plane state specific extensions we need to
subclass drm_plane_state and add the relevant helpers.

The addition of specific extension will be done separately.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/omapdrm/omap_plane.c | 38 +++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index 0df5381cc015..bda794b4c915 100644
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
@@ -207,11 +214,17 @@ void omap_plane_install_properties(struct drm_plane *plane,
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
@@ -222,6 +235,25 @@ static void omap_plane_reset(struct drm_plane *plane)
 	plane->state->color_range = DRM_COLOR_YCBCR_FULL_RANGE;
 }
 
+static struct drm_plane_state *
+omap_plane_atomic_duplicate_state(struct drm_plane *plane)
+{
+	struct omap_plane_state *state;
+	struct omap_plane_state *copy;
+
+	if (WARN_ON(!plane->state))
+		return NULL;
+
+	state = to_omap_plane_state(plane->state);
+	copy = kmemdup(state, sizeof(*state), GFP_KERNEL);
+	if (!copy)
+		return NULL;
+
+	__drm_atomic_helper_plane_duplicate_state(plane, &copy->base);
+
+	return &copy->base;
+}
+
 static int omap_plane_atomic_set_property(struct drm_plane *plane,
 					  struct drm_plane_state *state,
 					  struct drm_property *property,
@@ -257,7 +289,7 @@ static const struct drm_plane_funcs omap_plane_funcs = {
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

