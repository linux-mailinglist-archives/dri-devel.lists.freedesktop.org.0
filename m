Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C012FEEBD
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 16:30:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66B16E90E;
	Thu, 21 Jan 2021 15:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF9A6E910
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 15:30:18 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id a12so2147829wrv.8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 07:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nT+xFkEB8Axtncn6B4uWChuQT7lAEwC+p7RPQBXx5s8=;
 b=JDt/QZ+adjvZ10dQHqdAkqWPVEFMmiMDwq68f6FxiuKIFKHCrBTI3aKMJJv96B1ulb
 km+KB/8KSh3DCsp+JnCep2eOGNAN9/6EXe1QnC9rKEX+SyVdz3o1kb/O82SM8DY8H0e7
 kbi+JUIG3pHL92DJ3IIjVaAdoKgWUFFQK2lCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nT+xFkEB8Axtncn6B4uWChuQT7lAEwC+p7RPQBXx5s8=;
 b=pZAeHSREWfK7Edg1bGOkD/66K+w+3ETGrPGMaylTCihSsfx5tESUtF/0WYfS0jOyKm
 /Bd6t+VyhSPKQ9QuHOMeDuIzf2s5i/9BJJX6Dqg/frZTVtyuvisIGbW0AxqgPfhaJmsZ
 PswY/9JI/TqROEMint9jhT458VcDDXFlaTs3/uTRkSRSP5q6L3U8gh4U7h0PNKU/3yKq
 UTFHkA0MsVEWXtE7chmqLotAaSG58NiyGvKnvObrduG9GJE2FloyiEf641J7UVCBqRpi
 quUlCUUCUJp+aAoJI0cYJpTN19gKrYfBV0LPBtL+3G0h2XOFoLqcEBHGYxIqAwgfzSGf
 hMQA==
X-Gm-Message-State: AOAM531qPPWISvmTLdpB43pt3rQBT8A1kHAKXdFx/GXwCsohfpmaMt/f
 h3wqKOdr0LUkU4Zr2kdoCZfK1gap3cY3Zv2n
X-Google-Smtp-Source: ABdhPJzCw4iOEWh4Gr445pOsQ9SgiIif6C0IKGEtLiNYW9/ktkgcJoh4TumF8L0vOP1BwFknl5p6VA==
X-Received: by 2002:a5d:49c1:: with SMTP id t1mr34073wrs.56.1611243017177;
 Thu, 21 Jan 2021 07:30:17 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f14sm8269866wre.69.2021.01.21.07.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 07:30:16 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 11/11] drm/tidss: Annotate dma-fence critical section in
 commit path
Date: Thu, 21 Jan 2021 16:29:59 +0100
Message-Id: <20210121152959.1725404-12-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210121152959.1725404-1-daniel.vetter@ffwll.ch>
References: <20210121152959.1725404-1-daniel.vetter@ffwll.ch>
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
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
