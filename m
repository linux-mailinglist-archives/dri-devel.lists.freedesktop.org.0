Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 827FD1CD54F
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 11:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A3B6E416;
	Mon, 11 May 2020 09:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CEB6E406
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 09:36:03 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id k12so17253184wmj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 02:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mNifH0m3qqiHY33SE6VQHyHlHvenLFaDmPGPAEsZvyk=;
 b=jKHJHfDoDkf/XjdHtSkrEW+/wOnRGqRS9IO6GaSc/7SOSo5xCaC9zAOPVptZG+S+7n
 SncgoZ7nOAS0QoLhc7sUUm5Dr0eRQd72DfazQM04sOTXFaOHyS6/uhSXjW9ENGf8ps0w
 /JauubLcp2NtflEk+o2taynziqNzYmpu85bBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mNifH0m3qqiHY33SE6VQHyHlHvenLFaDmPGPAEsZvyk=;
 b=EcYeCGcPJZJTK4bicP58W8m1ic0DqyVRjzdI7MaoUYNGdr1uGmW29TPvaPOdRr6M+H
 9slNd55nc5dmfbSy+feuM8stPuK+f8jQcdhVhZdP11seR2dq6gu6sDq9gjvir1m/wRI/
 hOQTbGco2HsoHS4Zp5BMiHvsXVNRbLS5jTzv3PP487/ZzF6ZcuCGcDXaTSp+MlHNEmN4
 6gVWrrrpEA7ouK3+KCvMGaSGYNDVyZpVz7lo/gAs2EI/kHghuZ1P97YAoxRq/CyzROos
 441C6p397dDr8+6Rz/yqzVz2Hurqv3bM84d4DXq1jA060jja+xz8uMZMgiBXg97jr5tU
 pc/A==
X-Gm-Message-State: AGi0PuaaXgRXL3DraQPEgdFq2n1Hhd7PEZML/1kbuPgHuJeRpJ62bWJr
 vmvEXYNLu+yCKh1Cr73DI3QFJL78Yjw=
X-Google-Smtp-Source: APiQypI+hKFQ1TVTlAbMvk6+CfRIJiFjrVjcwRpLyLE8pfuY4Ftmd/mMhs5Bs8JWjJa3HVDIgnIBwQ==
X-Received: by 2002:a7b:c955:: with SMTP id i21mr32376991wml.25.1589189761718; 
 Mon, 11 May 2020 02:36:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q17sm9013945wmk.36.2020.05.11.02.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 02:36:01 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/9] drm/gem: WARN if drm_gem_get_pages is called on a private
 obj
Date: Mon, 11 May 2020 11:35:47 +0200
Message-Id: <20200511093554.211493-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
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
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No real functional change, since this just converts an annoying Oops
into a more harmless WARNING backtrace. It's still a driver bug.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_gem.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 7bf628e13023..63bfd97e69d8 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -548,6 +548,10 @@ static void drm_gem_check_release_pagevec(struct pagevec *pvec)
  * set during initialization. If you have special zone constraints, set them
  * after drm_gem_object_init() via mapping_set_gfp_mask(). shmem-core takes care
  * to keep pages in the required zone during swap-in.
+ *
+ * This function is only valid on objects initialized with
+ * drm_gem_object_init(), but not for those initialized with
+ * drm_gem_private_object_init() only.
  */
 struct page **drm_gem_get_pages(struct drm_gem_object *obj)
 {
@@ -556,6 +560,10 @@ struct page **drm_gem_get_pages(struct drm_gem_object *obj)
 	struct pagevec pvec;
 	int i, npages;
 
+
+	if (WARN_ON(!obj->filp))
+		return ERR_PTR(-EINVAL);
+
 	/* This is the shared memory object that backs the GEM resource */
 	mapping = obj->filp->f_mapping;
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
