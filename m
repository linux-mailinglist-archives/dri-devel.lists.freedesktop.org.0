Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B29B2296EC1
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 14:23:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F936E573;
	Fri, 23 Oct 2020 12:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228316E536
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 12:22:42 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c16so1299103wmd.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 05:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K6XeM/Ew6hbu/TmcnUXSsOfom77SnJ8dy6oN4nERL2I=;
 b=Z+R0iewNM214pFWkbIbN2yiZjD3o8xLoJeTqtDy7oL0Sp5wMCkSk/gSlvKtjX0d4/Y
 kt1wKpgE9w4MW3gnyfra6BE58DAqnnLTyXxLUQiyJdYSG9klqAtNX0AC+OuGS0N46h1S
 wMDaSxz1pzk2tRKscc9k6cTNpt+6bztRQYiq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K6XeM/Ew6hbu/TmcnUXSsOfom77SnJ8dy6oN4nERL2I=;
 b=aKkXVSNuVCFWe94bnJkFLi3XNj7DP9n7yrTfVEVonP42PcOKzj3kmLcjvPhtZghfx7
 i8WUxvdjUppYOcsdszz75yMl9pYLoFYPp5L5d+sYl4zd4jJhmgw6uRgdjJ1Mpw5JspOV
 L06tFwjUX+Ssnb0Pz0o3K1HWKG+sMcIjMD1XTtUHK/iaoyNVjU0WbUEChF0/nPeejO/t
 euticgX+g+BQyAbV/cQYixN7nmpxwnroZs3AGNMFNsBEV3K0pnjZwaTtD3TZDjt/rWsj
 Pn7V7YdSBW1+MEZ7YmZG3FosfEXuMJMhzmFXuaL2CSR//SFaVqWzuKga0k9y+f0tiRM7
 YQew==
X-Gm-Message-State: AOAM533PuwfMkU9rua9DlyWhxNzl/BFwVbF1u4rSEp636eD7rWBdd7Qy
 DEpD5WT+Lk8+FD61YaxzcMHeQMZMKBdocAfP
X-Google-Smtp-Source: ABdhPJz/ZNfcgSbs/Q66hZZqnzMzMZA5UabECGLLhOLOmJyuFxJwvtnRB/JJNauzc6bkb0ut8Q+y2g==
X-Received: by 2002:a1c:ab55:: with SMTP id u82mr2196701wme.152.1603455760522; 
 Fri, 23 Oct 2020 05:22:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 05:22:39 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 16/65] drm/tidss: Annotate dma-fence critical section in
 commit path
Date: Fri, 23 Oct 2020 14:21:27 +0200
Message-Id: <20201023122216.2373294-16-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ends right after hw_done(), totally standard case.

Acked-by: Jyri Sarha <jsarha@ti.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jyri Sarha <jsarha@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/tidss/tidss_kms.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index 09485c7f0d6f..95f8e0f78e32 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -4,6 +4,8 @@
  * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
  */
 
+#include <linux/dma-fence.h>
+
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -26,6 +28,7 @@ static void tidss_atomic_commit_tail(struct drm_atomic_state *old_state)
 {
 	struct drm_device *ddev = old_state->dev;
 	struct tidss_device *tidss = to_tidss(ddev);
+	bool fence_cookie = dma_fence_begin_signalling();
 
 	dev_dbg(ddev->dev, "%s\n", __func__);
 
@@ -36,6 +39,7 @@ static void tidss_atomic_commit_tail(struct drm_atomic_state *old_state)
 	drm_atomic_helper_commit_modeset_enables(ddev, old_state);
 
 	drm_atomic_helper_commit_hw_done(old_state);
+	dma_fence_end_signalling(fence_cookie);
 	drm_atomic_helper_wait_for_flip_done(ddev, old_state);
 
 	drm_atomic_helper_cleanup_planes(ddev, old_state);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
