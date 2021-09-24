Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 330774177BD
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 17:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD1D6EE55;
	Fri, 24 Sep 2021 15:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76ACE6EE2D;
 Fri, 24 Sep 2021 15:31:41 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id i24so12741470wrc.9;
 Fri, 24 Sep 2021 08:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=embkrJo3e9xiJFTU9PfC3+rsuixYC3ybu+PUBE5n6do=;
 b=gbdY/KA3GiigP6gfzDXQt0kMvxgGUf2PrYOU3yOPF9Kh8nJa9t1fKH9GDL9tktcv7i
 gKBby0cEHW216F0Q3ocIcvrj5fJPs1++oQEOdfDdKv4Bvlt+6tHlqahiQYtyXHBs82iu
 QA6YBMC60kODJvJLwsB2c+cOGwoEtRWfDkUHL0ZExuHvZ0YNmUEksOwXHtJqwFacYSNa
 zvL+YtxiqCgZRCNxqIC87FKyfkvmI+vCAoz5xsV445eo1QUFL0LypbJLbGIhUX/7u82Y
 QEeT+8HjaoFMoWgPJb3TA/UaTMp4SHLyCr43SnnnjC35G6QXBOV5dzhtpel9nPd36qCw
 R4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=embkrJo3e9xiJFTU9PfC3+rsuixYC3ybu+PUBE5n6do=;
 b=XzKVY0j/F/zdTSk81lcAlgGT9OyKJLtovw0J501rgx99rJqQP4j7vhEsUAIFhWxn+P
 SW/unq1xBA8xDY+s4Bi/5alJ3nnicP4rKxjk4KQA8yUo4Y9gmZuG9iiDc3unfpdhS++T
 Min7OozabDtOxTQKPGFGryFhATFPqycs2GHvMry3fgJS99shYAbuXvtXwZHuCdAWgAtz
 DFmFhtLCPgcHd2Vn8o0pJeuuo2Sh1sDhLkF/P05rUGtWAZpJJI6Bi6Lmh7mjQW86fnzH
 fjacQKEQiTynEEGoxT/a0gU+rpmMcRE0iFJrWf3ktlpujNO2y01hFQr/iezT0JRplM8B
 OsFA==
X-Gm-Message-State: AOAM531Uke75XSbECnVplFVje6Cfqm8uYvwd565iw5uoaG83RaeTFaI9
 DSJGR2MmPTQyw/T+2SQ9G+M=
X-Google-Smtp-Source: ABdhPJythMo56KnpHAm9/NvsZq86P+VwYHnzlv11F1l50InYobwErKrgQWC9UACBlTFYmZT6gOlsYQ==
X-Received: by 2002:a5d:67cc:: with SMTP id n12mr12094112wrw.381.1632497499953; 
 Fri, 24 Sep 2021 08:31:39 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 u25sm9902248wmm.5.2021.09.24.08.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 08:31:39 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 23/27] drm: use new iterator in drm_gem_plane_helper_prepare_fb
Date: Fri, 24 Sep 2021 17:31:09 +0200
Message-Id: <20210924153113.2159-23-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index e570398abd78..21ed930042b8 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -143,6 +143,7 @@
  */
 int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 {
+	struct dma_resv_iter cursor;
 	struct drm_gem_object *obj;
 	struct dma_fence *fence;
 
@@ -150,9 +151,17 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_st
 		return 0;
 
 	obj = drm_gem_fb_get_obj(state->fb, 0);
-	fence = dma_resv_get_excl_unlocked(obj->resv);
-	drm_atomic_set_fence_for_plane(state, fence);
+	dma_resv_iter_begin(&cursor, obj->resv, false);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		dma_fence_get(fence);
+		dma_resv_iter_end(&cursor);
+		/* TODO: We only use the first write fence here */
+		drm_atomic_set_fence_for_plane(state, fence);
+		return 0;
+	}
+	dma_resv_iter_end(&cursor);
 
+	drm_atomic_set_fence_for_plane(state, NULL);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
-- 
2.25.1

