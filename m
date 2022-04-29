Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE252514AEE
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 15:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B529110EC55;
	Fri, 29 Apr 2022 13:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC6110ED35;
 Fri, 29 Apr 2022 13:42:38 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id e2so10856441wrh.7;
 Fri, 29 Apr 2022 06:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LNM1AEcQA1TC9gdIDYx11HgLW6iNh6oI5PWYGXlZlcE=;
 b=p/2OcZKTlgGP3GKgPfjNkt19DmFAK1dTdwQk5tAt0UhUE0cUd2X+fBDeOjf+Ffhe20
 r8F0++xJoGDy/lMVhaIPOSxtSuqyIcMOJ9HBLV9NNr7ObSnlU/diKZ9ipcFVjv+TTqwY
 HE/caSuK0kXPP4K+O8GyFhmXAMiv904Z47g6SsMj2bYVIX2t8W2ahVQId9UJdCHOXHE8
 2U49sCmK/Nk/Tc6wLGAUPWscFd7MfUUBsdWJApCLS9hINYejWXiyU5eYW/MRgg3YVVVP
 2ZzMvonSIH2W5qf9YEGGIDN+6ilSubR8i/SSkOWBWbqb76P1XR13wDBLfICZ2vArmoJZ
 b12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LNM1AEcQA1TC9gdIDYx11HgLW6iNh6oI5PWYGXlZlcE=;
 b=5e+R2TBDWa1MaZtN7Hds9JnXo3RLuCZgQnnOV2nrYMIwcUyFicMvRLMPlZe3I+GWyO
 AW7P4BiqZIUOowRcngMq78JKSE01Jvt5t2O1SoRWSXjM2JgEs+zjkcwhkqkeAT7lH4Kg
 1ciApGF9X06O0j5f6ZPXek8G4AEerh0+buUw7EebiFVWmz3rdJ+eTjA+Crxkq4/z7xfR
 f/bN7NBMWjXaeYMqlNh2mT3kdrCCT+mNDhbV5oAhDlAsEtMnajFPAEaTERIgv/7IQHjc
 o4QoQVLgyW9JJZ+BP1dxVy3jkhOyF1CghTRLjcSIAHZJBgFLODSlukkHIRpqwd5jsJgl
 +eBQ==
X-Gm-Message-State: AOAM532fAd3azCRRRcVQg2DaYvOnPY+q5a+l/zqomuC49grV1oE66rIw
 E9acc7oP+VbTcuIJDOoGaCI=
X-Google-Smtp-Source: ABdhPJwU7PzmmCxcteLi5KWHy5fqWgZ5rFNEm/7Iy4Q7eBRKgkHL9WPdF7q8HZOW2aG5+mwxhSn5aw==
X-Received: by 2002:a5d:5966:0:b0:20a:e810:5e9d with SMTP id
 e38-20020a5d5966000000b0020ae8105e9dmr14033832wri.240.1651239756938; 
 Fri, 29 Apr 2022 06:42:36 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a05600c19d300b00393f081d49fsm7301227wmq.2.2022.04.29.06.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 06:42:36 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/qxl: add drm_gem_plane_helper_prepare_fb
Date: Fri, 29 Apr 2022 15:42:30 +0200
Message-Id: <20220429134230.24334-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220429134230.24334-1-christian.koenig@amd.com>
References: <20220429134230.24334-1-christian.koenig@amd.com>
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
Cc: spice-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We could need to wait for the pin to complete here.

Signed-off-by: Christian König <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtualization@lists.linux-foundation.org
Cc: spice-devel@lists.freedesktop.org
---
 drivers/gpu/drm/qxl/qxl_display.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 9a9c29b1d3e1..9a64fa4c7530 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -34,6 +34,7 @@
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_gem_atomic_helper.h>
 
 #include "qxl_drv.h"
 #include "qxl_object.h"
@@ -829,6 +830,7 @@ static int qxl_plane_prepare_fb(struct drm_plane *plane,
 	struct qxl_device *qdev = to_qxl(plane->dev);
 	struct drm_gem_object *obj;
 	struct qxl_bo *user_bo;
+	int ret;
 
 	if (!new_state->fb)
 		return 0;
@@ -852,7 +854,11 @@ static int qxl_plane_prepare_fb(struct drm_plane *plane,
 		qxl_free_cursor(old_cursor_bo);
 	}
 
-	return qxl_bo_pin(user_bo);
+	ret = qxl_bo_pin(user_bo);
+	if (ret)
+		return ret;
+
+	return drm_gem_plane_helper_prepare_fb(plane, new_state);
 }
 
 static void qxl_plane_cleanup_fb(struct drm_plane *plane,
-- 
2.25.1

