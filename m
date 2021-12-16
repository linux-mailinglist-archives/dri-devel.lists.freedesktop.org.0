Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E35E4779DB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 18:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D43110E260;
	Thu, 16 Dec 2021 17:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459DC10E31E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 17:02:03 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id o29so19369117wms.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 09:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Axe4Q9VXvpGCP1w03oKYpmEgDNQia2jUa2INQifyMYg=;
 b=JnUskR6BQSx107PSNjQbFwC/egoZKWvzdtEKNpoEOvAysW1fM+UaksTnVw1zAJv45Q
 blVtyxzcM+gIQEv0XcennrIDlLGZ3x0h1D325REsRQCK2P+5UoLgMLuDHx7gxvnV2zt6
 YECEfteZqW+PXKPurXESEjbHSSjeA9ZS7CxlDARUK8T9F1dfcLAnib/Uh3WBhu6tgU+K
 na0ZZhrjI3TfsiFHOmm0HrWY9ZTMk+zncmkrr7Kc2TLs24yVUaMvEJa+X7cEkopuMbBN
 7f9tBr9qIELlIsKX7yR+QMwW8tIJ/mC1/cboxPH60la/L3MWL1WypHthAgDMe6I7GUIu
 sEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Axe4Q9VXvpGCP1w03oKYpmEgDNQia2jUa2INQifyMYg=;
 b=sH4FYUT39h9UTpK3ZPmfi21QJjqr1uF+tYLwpxSiaccYy7Jadc9OblxuIJoP+luu6U
 2Rm0qufQcRCICMWtg+Fga7nQbqd61tTtirM7kwKmAI4aq513Nn6sqmUFbBsR08vzDQro
 iURtkfIOGLsgkdfqcI1tQ7igzuuZruJU5eLdbUMhX7/8tRH7w4xJlWhQpVQorDzSh41a
 nIGEODBTNnyiKXbFsZJE7Dfi/S8W4G5XWhYARfV/N8XPNdM6CXw8+XWkThGEUyeW7Y3n
 Coz9yd6ZETLJTzwFLZequUNaUf+9WU8/gDpLO5Ab+oLB5zD51y8jSpPh9JfGnTtSccaE
 6I+A==
X-Gm-Message-State: AOAM532D8KqNQL7s8/n41j1DTZDi8S6TfUkQUexUKWi9jppZtffmKtEv
 s+E18hUvbSXu3zrNRcGi1lSghLG9MjWdgw==
X-Google-Smtp-Source: ABdhPJyZR9qKxhXWhLSPZaa52rhCTCx7Oj3ZEeDXV7onBiivQ4yQXVK574JzTm6Dy+Uqi8ND6aP6nA==
X-Received: by 2002:a05:600c:350a:: with SMTP id
 h10mr5786912wmq.62.1639674121776; 
 Thu, 16 Dec 2021 09:02:01 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id n10sm5452472wri.67.2021.12.16.09.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 09:02:01 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Subject: [PATCH v2 1/2] drm/vkms: add function to get plane formats
Date: Thu, 16 Dec 2021 18:01:39 +0100
Message-Id: <20211216170140.15803-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 cphealy@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the logic to get the plane formats depending on the plane type to
its own function.
Refactor, no functional changes.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_plane.c | 37 ++++++++++++++++---------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 32409e15244b..76a06dd92ac1 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -83,6 +83,23 @@ static void vkms_plane_reset(struct drm_plane *plane)
 	__drm_gem_reset_shadow_plane(plane, &vkms_state->base);
 }
 
+static void vkms_formats_for_plane_type(enum drm_plane_type type,
+					const u32 **formats, int *nformats)
+{
+	switch (type) {
+	case DRM_PLANE_TYPE_CURSOR:
+	case DRM_PLANE_TYPE_OVERLAY:
+		*formats = vkms_plane_formats;
+		*nformats = ARRAY_SIZE(vkms_plane_formats);
+		break;
+	case DRM_PLANE_TYPE_PRIMARY:
+	default:
+		*formats = vkms_formats;
+		*nformats = ARRAY_SIZE(vkms_formats);
+		break;
+	}
+}
+
 static const struct drm_plane_funcs vkms_plane_funcs = {
 	.update_plane		= drm_atomic_helper_update_plane,
 	.disable_plane		= drm_atomic_helper_disable_plane,
@@ -167,24 +184,8 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 	const u32 *formats;
 	int nformats;
 
-	switch (type) {
-	case DRM_PLANE_TYPE_PRIMARY:
-		formats = vkms_formats;
-		nformats = ARRAY_SIZE(vkms_formats);
-		funcs = &vkms_primary_helper_funcs;
-		break;
-	case DRM_PLANE_TYPE_CURSOR:
-	case DRM_PLANE_TYPE_OVERLAY:
-		formats = vkms_plane_formats;
-		nformats = ARRAY_SIZE(vkms_plane_formats);
-		funcs = &vkms_primary_helper_funcs;
-		break;
-	default:
-		formats = vkms_formats;
-		nformats = ARRAY_SIZE(vkms_formats);
-		funcs = &vkms_primary_helper_funcs;
-		break;
-	}
+	funcs = &vkms_primary_helper_funcs;
+	vkms_formats_for_plane_type(type, &formats, &nformats);
 
 	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 << index,
 					   &vkms_plane_funcs,
-- 
2.25.1

