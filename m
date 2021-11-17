Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0DB454865
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 15:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE1C6E471;
	Wed, 17 Nov 2021 14:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBBB6E051
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:19:35 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id w29so4975422wra.12
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 06:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ybygRqz89X6PWHUm5yVoNp/ouF0lEkQ3IO8ZQyZIpmw=;
 b=6A/IHLLB6/oQZkGwdVYvRX0+wArc2hL3/y8nPki86c+4dU8T7I50askZ82FWCnEmsS
 qyyvwjQhCHnDiu+tgb/XnhyIVZLR8UR7TJ6z1SutLU//aHzEXDBaApAGOQtplQNDDU/9
 NKB+Ed37syi/YU6XehLpKgu366RAL8YPBozm1LGaLDrmKyY19WUy3IwxVaSzsWxZSAso
 giT8YIGO1RoPwwZcRt0a/1jCP6l1merJdQd9aAy34obaSgxnYkGG0Ea2QPshWVpwPNA6
 WOy5SMaUiwIXoGB0Oydb44ej87rqFyVQdJBfSgNbn/p9xJYv6rSuuo0sT1cGuOIitZ2H
 /l1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ybygRqz89X6PWHUm5yVoNp/ouF0lEkQ3IO8ZQyZIpmw=;
 b=bRnZu6ouzq3G+Y38U0Sq6sSAhcRWJgOjmrRq40b5Y/Ni7shAufH/ddt/i9uv0a9x70
 IfLyVunk9a6fU9+ous2I5CbPLbVepHboc4zkm/Hh1gYzZE9UbHDzZLnWnTs9pBV4Qiyn
 8d0m7TobfWkthUcrobVHdrrDGNdrVA9q5LXievJZA+AzIzlKkD2oF0rI5jmVQ78bJkWu
 rih3ZTT5tu591vc1UY8MC36MvBeOXlpwtIKoanmCNPaDik/ZDm56JNvZQcAdqIu9qizJ
 zt6LOSJkXWlwDAPuTnIq/KGild2+IdXamwIJmdsPPy7Yw/rdE8YyK2qF7dy700c/0OEE
 2imA==
X-Gm-Message-State: AOAM533w9nrDzemxUkgNr+oXfn6yYqSO+xpcQ1jCVxydWXXMFhLAB7yU
 NMqw5c8h7pWskTT1mwLL+Yk1EA==
X-Google-Smtp-Source: ABdhPJyGYg9Z2tde6LZd6N3n1S6Xjr7QCyaRmF3v5j14j0oLqwEn0zizDO/pf+hpuGrawjr3nMH3uw==
X-Received: by 2002:a05:6000:381:: with SMTP id
 u1mr19710700wrf.383.1637158773387; 
 Wed, 17 Nov 2021 06:19:33 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f98b:434c:566c:492d])
 by smtp.gmail.com with ESMTPSA id o10sm33803wri.15.2021.11.17.06.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 06:19:32 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: tomba@kernel.org
Subject: [PATCH v7 1/9] drm/omap: add sanity plane state check
Date: Wed, 17 Nov 2021 15:19:20 +0100
Message-Id: <20211117141928.771082-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117141928.771082-1-narmstrong@baylibre.com>
References: <20211117141928.771082-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2065; h=from:subject;
 bh=fRkx/RPkFxPenXM1+XojYlY6DoZHNd/vTOwe0D2eHgI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhlQ9LcfQR81+VKXldrcyliXmf4wAP1+2GSxnSWUvK
 iH4ZMFaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYZUPSwAKCRB33NvayMhJ0c0REA
 Ck1IPmCiheHrRrGeQ9Rsgt9sOU1sUsI4o8CIeVTG2Tp2iBf9DrA9Dc6A9OVkpfHkG4eaaqPvycyX0N
 ucX+m58NAKu89/S7Pp+Aa4Pekj8qnwae3shxOq9Lbk/SaEqqpUTYQhoSYpG1pp14LJxM07pmjQ/xgU
 AKusu1twKCUaWR/2LHtF+kb71frnhnvwepacO4o7UZFP0XNGd7OIbUBrBaUdtoJHrpYuxqc1TAenYq
 5ApLS6cLdZ6rdo2kqXbyqtUdrUr/Ol8Hpepz+V1tUFUqkF2voOalYEngbO5jLFIoOIc7DKXi5/VSYx
 beo9lPw1z3gZcTLqQdQzf4aL+txhac3IfXFTM/CJTHpI+qSBtq5UZgDv5uOAiUfU3RVKr9vRrnk9ju
 OtNM6xGjVk22CO0NKqJW+OIE5rAvSLKtiRaR5+CzJEivfcb5Cr959TkDTawwy8Ut0j3njHyLcSIJeo
 wKVoMhjcCNKXfSG3QyTXly4uFYId4pgUHWZGupLtPAt1JtuTKcYO9KAR4r3rlvuC5UOw6cXBj+9GlF
 LQDcn7Q8fpcOFx9IxXtzpereG1wPxpfLxiUVhBf4p2j1LSORGpJC47h2C4bCvJnj8ZNaZm+S+B+qha
 A+dv5cgMRRwZJzBQMo8NzuDkhNwmtP4AVTh6E5J9gRGwFYehgpF+0VVRTg6A==
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

Call drm_atomic_helper_check_plane_state() from the plane
atomic_check() callback in order to add plane state sanity
checking.

It will permit filtering out totally bad scaling factors, even
if the real check are done later in the atomic commit.

Calling drm_atomic_helper_check_plane_state() also sets
plane_state->visible which will be useful when dynamically
assigning hw overlays to planes.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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

