Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C66A71721
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 14:11:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A7610E027;
	Wed, 26 Mar 2025 13:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oovkl2U0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A189810E027;
 Wed, 26 Mar 2025 13:11:03 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-39149bccb69so5960983f8f.2; 
 Wed, 26 Mar 2025 06:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742994662; x=1743599462; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=coBo9zTOkV+54/uJ8ZjRiGU/vI3P1bGg7BoPmlBVdVs=;
 b=Oovkl2U0YZmZnG5M9dABmXvaCvFpG4hMx23zKsrpkPTZQJdFilbP7aAX1iY3GskkLZ
 qURo4fC9ZVppaa3Hjdfv8IsnrX0zFVe3677MjEY1YQCVLAs7lu8D5qrFQeVpSzZ69JBO
 NQgT3rxCWLk3ghzwP9gbp9Y3R+uoO431Y4HDJXf7cBN66LwYc1FeMNrMz6r0j8W49La6
 6h8c8nn0UjtN/u9wVzzl9PTpUygSCeqGgX7FqU9kIriC8lRVrs0R8P5hHH1fIjgqgVi6
 Vdvyr83Y/W2cjNQy/2mvS2ntAIBGKVj3Q91151g2ykQJkoz3hsf9+/f/UWLbRSdI5wRb
 pqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742994662; x=1743599462;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=coBo9zTOkV+54/uJ8ZjRiGU/vI3P1bGg7BoPmlBVdVs=;
 b=KFnJoCRw596xaXy9BWGhv5Jv26lJdJwULolrwzH7ni8dYEA9+mGUfX71UIO6oPgCdV
 cx/5OA0lHvUfRSdKVCSyBTbZzHXJVHTzmLFChkajqqOd0CrDCD0s1epdzVY+ciaPD+WH
 Kz0HH3Ichr69E30m870LxlIxVWFpMMrpYGY4O8ipytY/DXMIvb7yOrVGPE/BriZZaErc
 igGAHB+my+N2ugLzE1svDcd9RgXvb9HO5A1KMg33TzIlMLIjLms7Tm/vbalXIgHbMXl0
 bRdLlwdidAT4LuX/IDEn0MSUiK0F1MamcOgy2ehEuJ3Cecx4ekIQMdOJTLz5dzKKP7kR
 ViGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXIxbOJWFOtKXU/QDyBPHbPP6uj8EWJFZ79rA5ogmzNOeOaYJcCGmHO5QFaiXjXDkwbsZmzq5Mm4U=@lists.freedesktop.org,
 AJvYcCVg98jqKCAmWpOgnFLcPscaI7HCR1WPrMvdCGSzPscv8Sugd13JgyKmRoCJZYmpXj0+YlGa487l/g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbD0wWU8bZkKOa/KaV4bXbwRf7EQqCsBnmJ19URltrT100pbWo
 V5Px7CeodYDAY+TF7fcGSqlQkpYqAKHalz0M3rc8UYqGIK3xaU3h
X-Gm-Gg: ASbGnctpiEwRgK/myAADQA4nHS7yex089OMLiPjvxRx6NQxdEjuc/Kd/puCtm6FAzXX
 szx4t527bkYcLhqublup4BYh6ULDO6nDzds578u0nYD44PrmK1T1CIt6OXbI9niK9r6UFjIB2Xl
 mi7fpuNzI57E+X4zsyJqMmthWXfrMNQwjtO8F2vXA7Xm/dRkqjnblK6Q9Olx5r7BPpZczZSIZOT
 NyI4i4/1A9ejeTYoOTQ02DyWRCU5Mec+BP3yeD5INa57Q8mxsfIsOQUVAGKEtJ+VIUUGv0yP7c7
 TkKrDedUBxtPygYgxQE6s8fMkjwpa2hkUeYS+9TEv6f9gHBVa01Vnsj6
X-Google-Smtp-Source: AGHT+IGo5kRZQjK7go8ME7rLgXCUGjJN5HdX5Ne05KaMSmNpoFgkpvAveAfXQrZVzmsvdqDm6os96w==
X-Received: by 2002:a5d:584b:0:b0:390:f9a5:bd79 with SMTP id
 ffacd0b85a97d-3997f90ab9emr20396175f8f.26.1742994661851; 
 Wed, 26 Mar 2025 06:11:01 -0700 (PDT)
Received: from debian.local ([2a0a:ef40:4d4:f101:e41a:977a:f788:910f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82e6ab48sm1773125e9.10.2025.03.26.06.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Mar 2025 06:11:01 -0700 (PDT)
Date: Wed, 26 Mar 2025 13:10:58 +0000
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lyude@redhat.com, sumit.semwal@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/prime: fix drm_prime_gem_destroy comment
Message-ID: <Z-P84iMUP4NBAY7k@debian.local>
References: <Z9GHj-edWJmyzpdY@debian.local>
 <00e4d9c4-ecfc-4784-b603-12db04cda806@amd.com>
 <Z9q-ggKKgTsvW-Rz@debian.local> <Z9rA0G2urlVHFOSx@cassiopeiae>
 <1f4a534f-8883-4793-b191-60c2773f6217@amd.com>
 <Z9rSTkXlub-JZAz0@cassiopeiae> <Z-P4zQ1464SeZGmB@debian.local>
 <94eeb36a-9aa5-4afd-9ba6-76e8ace10122@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <94eeb36a-9aa5-4afd-9ba6-76e8ace10122@amd.com>
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


