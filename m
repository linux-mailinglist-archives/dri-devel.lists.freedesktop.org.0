Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE4EA716F0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 13:53:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E04710E6BB;
	Wed, 26 Mar 2025 12:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ECQyfGYF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847D110E6BA;
 Wed, 26 Mar 2025 12:53:37 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso46730575e9.2; 
 Wed, 26 Mar 2025 05:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742993616; x=1743598416; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=coBo9zTOkV+54/uJ8ZjRiGU/vI3P1bGg7BoPmlBVdVs=;
 b=ECQyfGYFCBjaN1gXte9EvKKS1smaInpTcIW+gvLIGQuUeIvRQT5/eShQn8T4OLcI97
 hV9RfoIE9kAa4L9rL6YPY/Tj7hn2fHs8xHS3DJtSgETm7kpN8DX3KlcgJkDx6pfw2ALb
 eQx/cA1HLCswpr4eMgEGeDnm/0JzIA/nP/TcDnhcBWOFdOkniysClX2yrAUpEaCGd4PB
 bjb2hw/2AOSoYosDapMnv34Lm4aSPxop+gYp17oMumdHHovHns5lhq8IGHZluSa5E9X3
 9ci3TvkbiaUNDxUGnn0JHTTn4/vPVdFxTMTI3qnA0yGBIeNhVmnEOT9zbFihRSRw6lmC
 FutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742993616; x=1743598416;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=coBo9zTOkV+54/uJ8ZjRiGU/vI3P1bGg7BoPmlBVdVs=;
 b=n8vtyCucN8l3yFHIWBsBZCmTz5G1grmsTn1rJ/olTZMED98H4YXFhfiTOV6ZK1xbb7
 tOnjfbjtuZ16JKUyPhpinKdBaGoj3PFE64HHx17hJBLfnTmcQ0D9dCWPtQ5eH5MwHwdS
 sQCwGOUyeG9yAngnDuzYIT1JKa0wR7WmyR5EcXbebqORyLGd7OPORvicD0EzdEgb4i7i
 ywDkWoHyWpJlLYJs6Amgazz5QYzdMM0aeuSDVxgk+uprCxH9dNCUBD2hjV+45plf1zHs
 xbsAj5F4b4uB+GOps2BJqBdK1ibZUGf0CA4APhXCdsb2P/+6HWrQBVGfgljIapUegoLn
 WQwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCyK32wBwfnvvj7c64OzkLmB9CM6fljZ+ojTBiEmSyskYKSkB44CD3PkwUWjfNcRRP1PeRkpZ9Sg==@lists.freedesktop.org,
 AJvYcCWzisuGwoK3eaVpPfSNlN/2tVH0/A9cN/Mz5UBfO3X1Yl1cmcN4JWi9HaQCLa1iZmSFNmRDa6oqFv0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0BD3sxqYq7WVe2TUs0Ou0w/0julsQXU5UoH5G01MuMt5glDeb
 rY8d1+J4/vkYrF8W00wgNuT+m6EpX2+v8eFGYZGpyoiDRHcFFM/L
X-Gm-Gg: ASbGncurbjKHBwn2vnwNYSY2FWF+nqMAbe4TMtHkVCyHzFFaKuWVUwrByGsvXCgxFwg
 luGyIFJXrujizqkZQsMSlkGh++SSaJKr1fbIKQtjm2YPnusj6r9yEAwB4VnJwkhlWD9Dj90FvbS
 3Tm8+Inn0Yu4a06oAXS8wR7wK050MijGGOnqeDhj6uuEBEIXnf48ZHuQKGL4QpvEPsMEUtje1XY
 fQYy8aINPHJBTbQOPJQ21vXINPCRt/WNRCeHzQ1kkkPhE4t+T6cWHSZ+K7m0zIgAnJAzUt53Wli
 81mjjcujCP0/4f8DFSrRolWJIyS8rwUHoUmmsyEkaF+GwKeH4Bbr1cwn
X-Google-Smtp-Source: AGHT+IFx/B2y4pVZ+fIGudSc0pHJcHiMF94Yu3KK2XDJYxFrBVKU4DKqM242i+DiiGBlB3U5k+xijg==
X-Received: by 2002:a05:600c:198a:b0:43c:fd27:a216 with SMTP id
 5b1f17b1804b1-43d52376b88mr200235635e9.23.1742993615726; 
 Wed, 26 Mar 2025 05:53:35 -0700 (PDT)
Received: from debian.local ([2a0a:ef40:4d4:f101:e41a:977a:f788:910f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9e6651sm16793284f8f.75.2025.03.26.05.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 05:53:35 -0700 (PDT)
Date: Wed, 26 Mar 2025 12:53:33 +0000
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 nouveau@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lyude@redhat.com, sumit.semwal@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau: prime: drm_prime_gem_destroy comment
Message-ID: <Z-P4zQ1464SeZGmB@debian.local>
References: <Z9GHj-edWJmyzpdY@debian.local>
 <00e4d9c4-ecfc-4784-b603-12db04cda806@amd.com>
 <Z9q-ggKKgTsvW-Rz@debian.local> <Z9rA0G2urlVHFOSx@cassiopeiae>
 <1f4a534f-8883-4793-b191-60c2773f6217@amd.com>
 <Z9rSTkXlub-JZAz0@cassiopeiae>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z9rSTkXlub-JZAz0@cassiopeiae>
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

Edit the comments on correct usage of drm_prime_gem_destroy to note
that, if using TTM, drm_prime_gem_destroy must be called in the
ttm_buffer_object.destroy hook, to avoid the dma_buf being freed leaving
a dangling pointer which will be later dereferenced by
ttm_bo_delayed_delete.

Signed-off-by: Chris Bainbridge <chris.bainbridge@gmail.com>
Suggested-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_prime.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 32a8781cfd67..452d5c7cd292 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -929,7 +929,9 @@ EXPORT_SYMBOL(drm_gem_prime_export);
  * &drm_driver.gem_prime_import_sg_table internally.
  *
  * Drivers must arrange to call drm_prime_gem_destroy() from their
- * &drm_gem_object_funcs.free hook when using this function.
+ * &drm_gem_object_funcs.free hook or &ttm_buffer_object.destroy
+ * hook when using this function, to avoid the dma_buf being freed while the
+ * ttm_buffer_object can still dereference it.
  */
 struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
 					    struct dma_buf *dma_buf,
@@ -999,7 +1001,9 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
  * implementation in drm_gem_prime_fd_to_handle().
  *
  * Drivers must arrange to call drm_prime_gem_destroy() from their
- * &drm_gem_object_funcs.free hook when using this function.
+ * &drm_gem_object_funcs.free hook or &ttm_buffer_object.destroy
+ * hook when using this function, to avoid the dma_buf being freed while the
+ * ttm_buffer_object can still dereference it.
  */
 struct drm_gem_object *drm_gem_prime_import(struct drm_device *dev,
 					    struct dma_buf *dma_buf)
-- 
2.47.2

