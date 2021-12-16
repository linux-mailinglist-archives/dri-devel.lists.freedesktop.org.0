Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF9E477F93
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 22:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FD110E883;
	Thu, 16 Dec 2021 21:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB89B10E4CF
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 21:51:58 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so2032343wmb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 13:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RB3fMXoOY8ZqKBmOHEoBPoLB+I/8eguXqvxcww695dc=;
 b=TsVnhEaM1BQM5Q3Vn4IG4m5DjYlqrMhYad32itINzshXXxDH797U0E6+SL0qDO/Qed
 Req+iAUZbJUBTvji7sv4yXk83T5B2oKm/PZhuNy7KQ9II0NWybag05Yf2YZPnD3OAsk/
 KYIPpkpNW3xeHbU8cztMOvKgrkrXAHDRgDeECEG6PkhLkD0g4G3eLOuV0mBV89AOKtIA
 AV/jI1R3dg0xIrGttzA5IsDCzx0qvA68PPY8vwVqQ0uP9VbT1aopd00jNieCYkl7Kkco
 rZM6u3Fr9PCj5g1RdhZ4pyCy6N89XdZz35Ul1jqr7fhVm/vJTm1n66gpngWWea7mLnFV
 ltFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RB3fMXoOY8ZqKBmOHEoBPoLB+I/8eguXqvxcww695dc=;
 b=yluX+Z76YBdDmyu3iTWoKuIfPqheETa1Zy9k+8ljosH5o8g4mKtH9AZ98TfIyqxaCf
 xy6ILa3MiJaAvkurOgC2zStR17rgcnrFp2MkNAGkx862mFbGoAyy/DBRGUM0KAazexY0
 qp7kUciz5WfURgDioa2vtaxYn/79UZ8Apzvz5Qovpf0lLBUxTctmMTDy0Kz746S59jO0
 Pn1Hi6a+N+E626NDphfJ+wq5Kc83Wny20SwD+jD1W1M8HPh8oDmLOk/awN+vsr2QbSvy
 4xB5OJCylHRp1zmHF6DmnZdfVGWnL2ySsdW/Hd3p34/2JnA3PofK0v/McaYz3hSHQzoc
 IjmQ==
X-Gm-Message-State: AOAM531NPdT0SPIbGJP2ppJL2qYUyrIQoj92qP0EneHJTRjuFIWLJF2x
 mUItOXLdoZYrGXwjTPuUWGodHA==
X-Google-Smtp-Source: ABdhPJyOYv8BYWem45op9gy5qlPAcHNmEgnBGi/gWQUH6CFAxrO4gs6RrBsEcuClfwLqcWlm0xkWAw==
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr6839099wmg.67.1639691517074; 
 Thu, 16 Dec 2021 13:51:57 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id r5sm1483716wrj.4.2021.12.16.13.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 13:51:56 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/cma-helper: Describe what a "contiguous chunk"
 actually means
Date: Thu, 16 Dec 2021 21:51:45 +0000
Message-Id: <20211216215145.21981-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211216171004.18166-1-daniel.thompson@linaro.org>
References: <20211216171004.18166-1-daniel.thompson@linaro.org>
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
---

Notes:
    Changes in v2:
    - Oops. I did a final proof read and acidentally committed these
      changes as a seperate patch. This means that v1 contains only
      one tenth of the actual patch. This is fixed in v2. Many apologies
      for the noise!

 drivers/gpu/drm/drm_gem_cma_helper.c | 35 ++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 9d05674550a4..81d7181deebd 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -25,12 +25,18 @@
 /**
  * DOC: cma helpers
  *
- * The Contiguous Memory Allocator reserves a pool of memory at early boot
- * that is used to service requests for large blocks of contiguous memory.
+ * The DRM GEM/CMA helpers are a means to provide buffer objects that are
+ * presented to the device as a contiguous chunk of memory. This is useful
+ * for devices that do not support scatter-gather DMA (either directly or
+ * by using a built-in IOMMU).
  *
- * The DRM GEM/CMA helpers use this allocator as a means to provide buffer
- * objects that are physically contiguous in memory. This is useful for
- * display drivers that are unable to map scattered buffers via an IOMMU.
+ * For devices the access the memory bus through an (external) IOMMU then
+ * the buffer objects can be scattered in physical memory but linearized
+ * in the IOVA space by the IOMMU.
+ *
+ * For other devices we must rely on the Contiguous Memory Allocator to
+ * reserve a pool of memory at early boot. This is then used to service requests
+ * for large blocks of physically contiguous memory.
  */

 static const struct drm_gem_object_funcs drm_gem_cma_default_funcs = {
@@ -103,8 +109,14 @@ __drm_gem_cma_create(struct drm_device *drm, size_t size, bool private)
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
@@ -154,9 +166,12 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_create);
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

base-commit: 2585cf9dfaaddf00b069673f27bb3f8530e2039c
--
2.34.1

