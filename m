Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C625431F90
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 16:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB966EA12;
	Mon, 18 Oct 2021 14:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F7196E0A8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 14:28:47 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id o24so1527326wms.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 07:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jHztITnDF4fFQXSKxud+QNz8Jtqj0NJjpDNYvgJfDX8=;
 b=a75bCI54fwhIwi6iZBBIUBOxKcoSSV0MXSYc+y1b39wdrWdh92RsRkKHhkx/2lOioN
 NUrd6JMCWMYONmkG7r4RxW0akwa8sd5rnt60p/WCFZozGLxjW3tKtJI3X0SDWMlqC4j8
 GdQJs84k/L93E9LPe8IqA2id9EcqcweUNJKHx82dr9DhWbp0kxq/VRLYq78pDSHl+ro6
 uN0Z9qtazeYNbjPxGZzvaqMhEJ5vH3UvTSk2tXo3bEg7wC30bhJ7ZXBILjuDefnD+Gpq
 YXxZPRFeGBQkmeV3Ixjg89V4Wr8/9OX/WXv+tQdwAzpYmoo19DJUCABCp+KUCZLipBtL
 wWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jHztITnDF4fFQXSKxud+QNz8Jtqj0NJjpDNYvgJfDX8=;
 b=yuL0xVXHv4sd4ww2TCTBlUOfW7syvg70A+/7frrRy6PKT4zjURxlgEK/PWmoqmGVZ1
 tTU5RHcJkrd91RMn9YmqAmuXX7hZYIEKoY7EITK2Og91PYFxYJV9WSkSfXPsK55DnuWt
 G60XAl7zsdkzGLcQNwzXjyqdh3UTNbck8udN7M4QTsoXB9O+YnFubmjLikep2Doq7OZy
 GSBXAimly/pEARe/Miny5QGIDleIr/ipos+hpxvdp0hemS1Q8wnuoMXCOd+3EgEMquAS
 gDaqf1stfdyGJkBKXAOl2ioDYUFB8RdnV3tLVa4nzNWjDE/zmQ20bk6TkUqzD7yH8e17
 5P1g==
X-Gm-Message-State: AOAM532XDiOtQsUKEcjgV22icMWOhg2Fl7JwYWR0GTA7LVCp1sbGqqeC
 Zi7Sv7iCPAkI/32T5jghx0/OFg==
X-Google-Smtp-Source: ABdhPJyUNbZdGJGYbv9xfyRTzLs3LcBStntNkLkja8uWayfJChDiCc4fbZiJlRd1tOqhu1H9OGuY7Q==
X-Received: by 2002:a05:600c:cc:: with SMTP id
 u12mr1446004wmm.46.1634567325978; 
 Mon, 18 Oct 2021 07:28:45 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:2dd7:d5eb:6e87:f924])
 by smtp.gmail.com with ESMTPSA id b3sm12908495wrp.52.2021.10.18.07.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 07:28:45 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: tomba@kernel.org
Cc: linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com,
 Neil Armstrong <narmstrong@baylibre.com>, Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v6 1/9] drm/omap: add sanity plane state check
Date: Mon, 18 Oct 2021 16:28:34 +0200
Message-Id: <20211018142842.2511200-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018142842.2511200-1-narmstrong@baylibre.com>
References: <20211018142842.2511200-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1849; h=from:subject;
 bh=jRkIww6GJd5Wg+RgwNKRyh7OLNc3fS8CQvhWZ54HJl0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhbYSFq/A8B8ssl6yiFVlKdW61NXQ3l6SuPbdR8b6q
 ZKp4TeGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYW2EhQAKCRB33NvayMhJ0QgoD/
 0Y1G67QzeQnlWqz4y6rQyfTlmnlBQghuyus96kzr6X2utUqn2CCy0rJ9L4kqsuuFqHrruLjF2XBPcb
 JacJ0DIMHTX0WGr/RBWIxTyqlEE10Zg7uV/VTVBHmgE2bOCWNgMqRK3lFvdIr3IzNlt5EGlajO26rz
 gs2FwZdhTtneTdZUgUxIV2m7lSCLWgBuLjUw6lUzDJo4vw3R/3Hr8iGVGGvfG6SiGGC7M+drWWNxPi
 RoRYmryEINz3U1ywpQDrXP8SAJiZosCPNDyjCzn0HJxh1jZbOAW4vUw2YnbiZlw4qIcqvs0+3Ydlfs
 JP1Xjl68doj6DwP+PFEsGFrr9p4MpWfSmKdcZ9xq2lZJSOOVhZ1EqxE1bjKX8t7+zN8Jz2tgaWO9XY
 FxjXp8awUzmnEdJCKDZA862mFjykRKxKsP0mwTOsDkSt3jgv5F8yVnoUDUcRrDklqx1ludUPywsrp3
 bUYtEUceq922sYSFFAqh2xGwmhtenxQKFWvf+z8HnSKWb9zJfh5pI0W64P8DrQR4mgJduDvb0lcfCy
 XfnLnBSRkkwwwZF3vczcvn9kijPmlpJOLdUvvbGq0cix7niwxmb67CpkfCp6JLamn48z0M6zc+HHLz
 BEudz0ht0gXv2v8TZjyrwJGwJslJnq/p89npsqExjha6xb4KdjTNG6M9JMxA==
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

Call drm_atomic_helper_check_plane_state() from the plane
atomic_check() callback in order to add plane state sanity
checking.

It will permit filtering out totally bad scaling factors, even
if the real check are done later in the atomic commit.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/omapdrm/omap_plane.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index 512af976b7e9..c3de4f339387 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -104,12 +104,15 @@ static void omap_plane_atomic_disable(struct drm_plane *plane,
 	dispc_ovl_enable(priv->dispc, omap_plane->id, false);
 }
 
+#define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
+
 static int omap_plane_atomic_check(struct drm_plane *plane,
 				   struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
 	struct drm_crtc_state *crtc_state;
+	int ret;
 
 	if (!new_plane_state->fb)
 		return 0;
@@ -127,6 +130,18 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
 	if (!crtc_state->enable)
 		return 0;
 
+	/*
+	 * Note: these are just sanity checks to filter out totally bad scaling
+	 * factors. The real limits must be calculated case by case, and
+	 * unfortunately we currently do those checks only at the commit
+	 * phase in dispc.
+	 */
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
+						  FRAC_16_16(1, 8), FRAC_16_16(8, 1),
+						  true, true);
+	if (ret)
+		return ret;
+
 	if (new_plane_state->crtc_x < 0 || new_plane_state->crtc_y < 0)
 		return -EINVAL;
 
-- 
2.25.1

