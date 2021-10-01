Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E96B941EA89
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 12:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F596EDFA;
	Fri,  1 Oct 2021 10:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60B36EDE4;
 Fri,  1 Oct 2021 10:06:35 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id m22so9154885wrb.0;
 Fri, 01 Oct 2021 03:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=embkrJo3e9xiJFTU9PfC3+rsuixYC3ybu+PUBE5n6do=;
 b=Q5fsXjqZacYAaNCcYSLJtyR71stnzbiX9gtPzj7ceKIeRysoqMaOtUNllAvvgd2ZoQ
 Sc5D057EX2p+NDRuTem2faYmnkbO43kWuIuS+RbsMlLREQ+P22kmAFgGUaFzNec5ugqD
 OLcj30xorhSLnNJLon3PdbY0boGcwnhVrvYCH2+GauY5bybmqLL9cylzhgca4EhRe7hh
 f+Ko3Dix7MvOGdih49HSBRBf8jlQIzNadjJ63NOeUnw/DcptLjx6EvXSlvHWyyGq4jac
 ze1k0PdHgLhw1ssuJI6N5O89xBmMlrlY1L4Tcr8UXVl2/OLehgJE25IVdX+WbI9UVv2A
 pOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=embkrJo3e9xiJFTU9PfC3+rsuixYC3ybu+PUBE5n6do=;
 b=lZ9wIbN51od8JgIJ7SvpMPOzpuWkc267qP0BoSLjgvHf5b7L0xLlZMLhb/sDKhvXJr
 ZRlLaDpzGwV+OHZHX4FLAOXxGWN8Awt55jsJ89xaitloIEko9mjlGaCsHQ0iHSUXGbs/
 lSNFeOsfwgX7QpmnvSHWMvlVGBJsj6AM8PFe6ooptrlG9uOrvn4jqXMz1EK/LflQ/R++
 y191/zMJ3Vb047FpDwp1itH2wsbsdfe7EUuukKKyzwcV5qdqMiMTTTYJErilXbJ9PgZw
 s+BITIlE3q5tUM+dLwC1BjMBlbph6xblKNEHgqu7++DrkXM/S9OaqRDQHKF2RlwygG1X
 4QnQ==
X-Gm-Message-State: AOAM530qf2ygG4GTGhiUJHnIxmz8KUY0x3H62oxPjs04dyzFOF0kc3X7
 sk97CJIPtmeAuWzE3SDIeJ0hWtJh10A=
X-Google-Smtp-Source: ABdhPJyyVqiekh0Qo/9t/1Ebo4yekIFwSNoQ4xwKqMx7ARLoWIBrbcftHj6Gp3duatEx2cQ8mnEMNQ==
X-Received: by 2002:a05:6000:2cd:: with SMTP id
 o13mr11033052wry.193.1633082794324; 
 Fri, 01 Oct 2021 03:06:34 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 v17sm5746069wro.34.2021.10.01.03.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 03:06:34 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 24/28] drm: use new iterator in drm_gem_plane_helper_prepare_fb
Date: Fri,  1 Oct 2021 12:06:06 +0200
Message-Id: <20211001100610.2899-25-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
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

