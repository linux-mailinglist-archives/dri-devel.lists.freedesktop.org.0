Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9470740F7D1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE906EC53;
	Fri, 17 Sep 2021 12:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B566EC48;
 Fri, 17 Sep 2021 12:35:35 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id e26so7213186wmk.2;
 Fri, 17 Sep 2021 05:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ibIrVYeDdndjRxY0zDZkaJhUSUXFhvWWL8GzRn7VBN0=;
 b=nTpCSrxBWqRflD7TltRYtMBxjZX8oKi2IfhO13ZCBM2qt4GQXfVswJjDOlUmCP/mgA
 plaBw1Bdhb01gWkBwiCI/ZkLJmNMg0cOADZis0pl3cKZ89M+LDa5Wgsq74d5U5lLTes4
 R7N4C+UMo88xEXk5VplBMOtug+/L6kvPIjDa7PPLfETO0K7xaKVSeQB9MfqZtQd+kpfd
 Wv0YzDPkI5pIkjFriR66hqR8W5uJ3w2GB+I011kxPnT5/59ek4+gHHpGx7MDpA7yrbFI
 BAzZ533uV6YXtkP+88k6UJ6g6iBn8SXC5Hnus14t+2M+1QoKlqhIFYLxQXJXruX2vaCd
 WF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ibIrVYeDdndjRxY0zDZkaJhUSUXFhvWWL8GzRn7VBN0=;
 b=WvwgHmKtVQFiTVJ9fWZDXU2d/8sG5Aa8qhLdfsOK7lZ8C5sG/TRakSsOJWdz+pmV1B
 t2dIWYqXTt/qzceHh/FtTX9qJRx6LBeDCWd2MgCE5RkoSwghh6bu+abdZLxGfCv3rR25
 4iJeBWK0/VtrokfEQE4paUImTQYBsAoz55/XGf2dYOD2HCviG8txNH9smGFOiueDLQOL
 vU9dPS9SvHYz3kFcWFoRCpqZ8Dem8m0UMB/FwcFM55gTp0b/JHs1vQDWCC8KYRRTfsQQ
 EQSgaCj9oeHzAElvchfrVKbQMu2w3yhLaTg4TbzdZzw6OAA4VBCCmWnxvdLLQoZjZgca
 fj/A==
X-Gm-Message-State: AOAM530fksEx3TY7qvRLzTl4bxoH9DrlQfaHncPSj9itQxLRQskvWySw
 uB1qTNok3eYCXbQAQ0bzeoAguy33wzo=
X-Google-Smtp-Source: ABdhPJxaaMctBBBSc/yluqiL4tEsEQ0z0EM7vwHWdMAeiTkXSi1P8pCp+SZzIrt68qrV1FTEXvFuPg==
X-Received: by 2002:a05:600c:414d:: with SMTP id
 h13mr14900043wmm.121.1631882133974; 
 Fri, 17 Sep 2021 05:35:33 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l21sm6122049wmh.31.2021.09.17.05.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:35:33 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
Subject: [PATCH 21/26] drm: use new iterator in
 drm_gem_plane_helper_prepare_fb v2
Date: Fri, 17 Sep 2021 14:35:08 +0200
Message-Id: <20210917123513.1106-22-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Makes the handling a bit more complex, but avoids the use of
dma_resv_get_excl_unlocked().

v2: add missing rcu_read_lock()/unlock()

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index e570398abd78..d8f9c6432544 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -143,6 +143,7 @@
  */
 int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 {
+	struct dma_resv_iter cursor;
 	struct drm_gem_object *obj;
 	struct dma_fence *fence;
 
@@ -150,9 +151,18 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_st
 		return 0;
 
 	obj = drm_gem_fb_get_obj(state->fb, 0);
-	fence = dma_resv_get_excl_unlocked(obj->resv);
-	drm_atomic_set_fence_for_plane(state, fence);
+	rcu_read_lock();
+	dma_resv_iter_begin(&cursor, obj->resv, false);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		rcu_read_unlock();
+		/* TODO: We only use the first write fence here */
+		drm_atomic_set_fence_for_plane(state, fence);
+		return 0;
+	}
+	dma_resv_iter_end(&cursor);
+	rcu_read_unlock();
 
+	drm_atomic_set_fence_for_plane(state, NULL);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
-- 
2.25.1

