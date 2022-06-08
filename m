Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2021543208
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 15:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A66710ED12;
	Wed,  8 Jun 2022 13:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CBA10ED12
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 13:58:32 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 p6-20020a05600c1d8600b0039c630b8d96so728297wms.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 06:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R8VISYkcT36CEH8dMwAYw+ltzDmUvfvK80231Ui7esE=;
 b=J7G/eT+pCEdsUdaKgEq2rWy3gbNxitJi8XbpO5rq/p3uX8phRW3JuT9+ipCapfg7L4
 tV3QU9HJCETelVZpmzXAHuIxa3KDPL//3ISMfZBRnO8YKsTV+w0krxqGU0iG/TTyGKwQ
 NAE9MRlK/RdhXSInOE6/zl2arKI6sxoIqC61g5vZV7zqAeYYe/5MZSLvwMvHIDYZP0wg
 n5iGTArVAygP4+qWHfyglNOHscf+GtBuWTbtYDbm9VI2PRS4/ptLk6MbFhJMTdBazsZ7
 Ci2+QSU8MoSBryOZJjrTzAsH3Y1K3iifa1Ctoh/l58ZVmq5+X5ggmTkfOjZKIHXIqeaj
 xmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R8VISYkcT36CEH8dMwAYw+ltzDmUvfvK80231Ui7esE=;
 b=a0rxMNx2ANkHDXoij10AwxFTXuDPUDtxWsZL69VZqG8109dnMBoxsf5v7yRyXQlbqh
 IRTjxm8fmO0jm7jyGA90diz0er5EBLxvuCn9t+OCzIZa6y/8xhaoMwBwtsHrnCpOUKPY
 uNpRIf+vu5lkhIblXW2l3wqVbswTcl9pR/wcYPdA6Y5aEuen12MUSxXj0oa8SapjoqFI
 D7FBuKj3GQKcGwIljSH6P+fkq9dy/T8BqnWruGchEmmx5Q4Kz5DIwHRZA/X0pvxsTXDs
 ga/2E4m757JQtDypF9Yt3JqrYrljJExQhc7IlZxCTvLDPcAoEVXIAecP0n/k5ZqEfxKj
 StKw==
X-Gm-Message-State: AOAM531fTdHWZS5Sho/sHeBrQRHY9WkfzuF+MCr9OXAMaSoQ7tLpqDTK
 +BoqgrZPKUD+491jB0fZHR+emw==
X-Google-Smtp-Source: ABdhPJzezq807irvaFo462Vn31bjZwnJ0ZSAMoyQCnfO++eLUY5d9+VSN4Nt8DFAJeB9pEhbZAASBQ==
X-Received: by 2002:a05:600c:2c46:b0:39c:55a0:9533 with SMTP id
 r6-20020a05600c2c4600b0039c55a09533mr13137412wmg.104.1654696711042; 
 Wed, 08 Jun 2022 06:58:31 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 m125-20020a1ca383000000b0039c5b4ab1b0sm4852519wme.48.2022.06.08.06.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 06:58:30 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [RESEND PATCH v3] drm/cma-helper: Describe what a "contiguous chunk"
 actually means
Date: Wed,  8 Jun 2022 14:58:21 +0100
Message-Id: <20220608135821.1153346-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since it's inception in 2012 it has been understood that the DRM GEM CMA
helpers do not depend on CMA as the backend allocator. In fact the first
bug fix to ensure the cma-helpers work correctly with an IOMMU backend
appeared in 2014. However currently the documentation for
drm_gem_cma_create() talks about "a contiguous chunk of memory" without
making clear which address space it will be a contiguous part of.
Additionally the CMA introduction is actively misleading because it only
contemplates the CMA backend.

This matters because when the device accesses the bus through an IOMMU
(and don't use the CMA backend) then the allocated memory is contiguous
only in the IOVA space. This is a significant difference compared to the
CMA backend and the behaviour can be a surprise even to someone who does
a reasonable level of code browsing (but doesn't find all the relevant
function pointers ;-) ).

Improve the kernel doc comments accordingly.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
---

Notes:
    Am I Cc:ing the correct reviewers/maintainers with this patch? There
    has been no negative feedback but I've been rebasing and re-posting it
    for three kernel cycles now. Do I need to queue it somewhere special or
    get it in front of someone specific?
    
    Either way...
    
    This RESEND is unaltered (except for collecting tags) and is rebased on
    v5.19-rc1.
    
    RESEND for v5.18-rc3
    - Unaltered but rebased on v5.18-rc3
    
    Changes in v3:
    - Rebased on v5.17-rc2
    - Minor improvements to wording.
    
    Changes in v2:
    - Oops. I did a final proof read and accidentally committed these
      changes as a seperate patch. This means that v1 contains only
      one tenth of the actual patch. This is fixed in v2. Many apologies
      for the noise!

 drivers/gpu/drm/drm_gem_cma_helper.c | 39 +++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index f36734c2c9e1..42abee9a0f4f 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -26,12 +26,22 @@
 /**
  * DOC: cma helpers
  *
- * The Contiguous Memory Allocator reserves a pool of memory at early boot
- * that is used to service requests for large blocks of contiguous memory.
+ * The DRM GEM/CMA helpers are a means to provide buffer objects that are
+ * presented to the device as a contiguous chunk of memory. This is useful
+ * for devices that do not support scatter-gather DMA (either directly or
+ * by using an intimately attached IOMMU).
  *
- * The DRM GEM/CMA helpers use this allocator as a means to provide buffer
- * objects that are physically contiguous in memory. This is useful for
- * display drivers that are unable to map scattered buffers via an IOMMU.
+ * Despite the name, the DRM GEM/CMA helpers are not hardwired to use the
+ * Contiguous Memory Allocator (CMA).
+ *
+ * For devices that access the memory bus through an (external) IOMMU then
+ * the buffer objects are allocated using a traditional page-based
+ * allocator and may be scattered through physical memory. However they
+ * are contiguous in the IOVA space so appear contiguous to devices using
+ * them.
+ *
+ * For other devices then the helpers rely on CMA to provide buffer
+ * objects that are physically contiguous in memory.
  *
  * For GEM callback helpers in struct &drm_gem_object functions, see likewise
  * named functions with an _object_ infix (e.g., drm_gem_cma_object_vmap() wraps
@@ -111,8 +121,14 @@ __drm_gem_cma_create(struct drm_device *drm, size_t size, bool private)
  * @drm: DRM device
  * @size: size of the object to allocate
  *
- * This function creates a CMA GEM object and allocates a contiguous chunk of
- * memory as backing store.
+ * This function creates a CMA GEM object and allocates memory as backing store.
+ * The allocated memory will occupy a contiguous chunk of bus address space.
+ *
+ * For devices that are directly connected to the memory bus then the allocated
+ * memory will be physically contiguous. For devices that access through an
+ * IOMMU, then the allocated memory is not expected to be physically contiguous
+ * because having contiguous IOVAs is sufficient to meet a devices DMA
+ * requirements.
  *
  * Returns:
  * A struct drm_gem_cma_object * on success or an ERR_PTR()-encoded negative
@@ -162,9 +178,12 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_create);
  * @size: size of the object to allocate
  * @handle: return location for the GEM handle
  *
- * This function creates a CMA GEM object, allocating a physically contiguous
- * chunk of memory as backing store. The GEM object is then added to the list
- * of object associated with the given file and a handle to it is returned.
+ * This function creates a CMA GEM object, allocating a chunk of memory as
+ * backing store. The GEM object is then added to the list of object associated
+ * with the given file and a handle to it is returned.
+ *
+ * The allocated memory will occupy a contiguous chunk of bus address space.
+ * See drm_gem_cma_create() for more details.
  *
  * Returns:
  * A struct drm_gem_cma_object * on success or an ERR_PTR()-encoded negative

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
--
2.35.1

