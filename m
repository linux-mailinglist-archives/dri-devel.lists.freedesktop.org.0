Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9359AB32776
	for <lists+dri-devel@lfdr.de>; Sat, 23 Aug 2025 09:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EEAD10E2A5;
	Sat, 23 Aug 2025 07:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YwVHRzT8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEA010E2A5
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 07:51:47 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3c607029266so879018f8f.3
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 00:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755935506; x=1756540306; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QjBThWlI+y1/suOLDhw9XzEjYdkK/QFob0Uq6Qp8aHg=;
 b=YwVHRzT80oyKS/2XH8nCgMvUg4IwElko3GgbCI7zsIY6NGjVxm8wFaN4Cb3GAZxfd8
 rrAlQw/NsG5QcgS8TASKrCHAjHJdoFn6n+DQQvU4mtnKiUAAdI++uOItwI8AmjDbdmPT
 LGS67vU+zzjz0z0NxM8FIIbZeGsTiZWSpnQHIRBVC+iveu4ACnU18S5fpNus93jOz/4+
 a02/3YcPBt2pz2zc9Mx8fiWk07n0aAVPvnWO99M7l4kwf/QPE3lW/y5YGxtedNlBc5Zr
 18GXdgkxdCZkg6quyga2CeOOP14PYBzyHcnVG7y0HZECVeB7xN35/PULITT4shtRa3X4
 nTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755935506; x=1756540306;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QjBThWlI+y1/suOLDhw9XzEjYdkK/QFob0Uq6Qp8aHg=;
 b=Wrdyq7CiAKQvhP5Z+0PmBmNy70l8iPJPzYYhW5IbwCXWlArflD8UPC2Go+vl3lgVkY
 NXfESMVhYW2f88rHBqOjY3deBWmLvwbqTi5zGs+pmmUp3fKcV7EDdgQSfR3QqhKIC+kM
 jlfC2HwOQCudvQnemxTyzZxQTrW10M6XpSd6WpbwQhi1a7ZN0hf82gfk1Qia2nVtcRw+
 YX4+FNQRrf9Bg8w0+yme/MDSZrQQBS2Yt1aiuAGYXe4pFFuMc49iMwiaIqMlPwgAvXaB
 PRYL53Z8DKXNgS9lI7uqUtAjb+fDlq/FS/8MJK+5WF3UzQJJTCnxYfRgILjsiIWq04w1
 2+Bw==
X-Gm-Message-State: AOJu0Yyuvkb9NZIMIGqrDFIeyhWBMAXV/jmoD8Xewm/uCKk+Mce05A6l
 3WyCQdt5UtPZM++zsxCv1Yby8AZFxgX9X7KLcyVoG6ipaZXmpRh7en1P
X-Gm-Gg: ASbGncsBQnKeRPfjpvarrmDaSA/AmlbkC9sMKit/v9b0NKMGmlFh+VVkAGcZh7cnCN/
 jLWH4WB1Fh4oVQxUIipFC8lbu5s9HhBHglbXi5V0vGr4ake05zpW3P/hNu+6PmffMkuKEh5So8R
 MDvNRo6l6ejLhv19F3IwCDwAQxSoXpDjofJjk/6opyEU2F3sOCNEObz2OxcIUMDOF9LrhbqKIxK
 ZKn+5l+rqJgs+t2/3t+7QeQMwaPUJwI4KOT6jK7d4IZuwqOv+jGPMDB9i+5i8Y6U5bc5zg2QqIV
 C7d8vytF/lCQ7LqiWFfMDvtYRLBACxpkn3c/YMcgyoHuWTRjd1pXP1Cx/h6FXc1Okk5OVqvCB5R
 TnsnYFm2tEGE4hWOVRniFvolZmrKDsInI6+A+zIT+dk7ZiVA96V0IJPE=
X-Google-Smtp-Source: AGHT+IFd9sVYyZE3sI5Ey4wdQ15aVHWFhxBBI0yTcTBvbkIbotuk1JFW62jPaxc8WPpjFhHb4ZpS3w==
X-Received: by 2002:a5d:5885:0:b0:3c5:356c:8a7c with SMTP id
 ffacd0b85a97d-3c5dde75899mr4358435f8f.51.1755935506021; 
 Sat, 23 Aug 2025 00:51:46 -0700 (PDT)
Received: from dell (117.red-81-33-123.dynamicip.rima-tde.net. [81.33.123.117])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c711211cd3sm2512295f8f.40.2025.08.23.00.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Aug 2025 00:51:45 -0700 (PDT)
From: Javier Garcia <rampxxxx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Javier Garcia <rampxxxx@gmail.com>
Subject: [PATCH 2/2] drm: fix kernel-doc struct tag for `drm_modeset_lock`.
Date: Sat, 23 Aug 2025 09:51:39 +0200
Message-ID: <20250823075139.34797-2-rampxxxx@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250823075139.34797-1-rampxxxx@gmail.com>
References: <20250823075139.34797-1-rampxxxx@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Add needed "@" to avoid warn messages about duplicated symbols
as there is function and struct with the same name.
- The fixed warning is:

	./Documentation/gpu/drm-kms:476: ./drivers/gpu/drm/drm_modeset_lock.c:377: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:48.
	Declaration is '.. c:function:: int drm_modeset_lock (struct drm_modeset_lock *lock, struct drm_modeset_acquire_ctx *ctx)'. [duplicate_declaration.c]

Fixes: f3a808817fdb ("drm: fix drm_modeset_lock.h kernel-doc notation")
Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
---
 include/drm/drm_modeset_lock.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_modeset_lock.h b/include/drm/drm_modeset_lock.h
index ec4f543c3d95..0de7046dc653 100644
--- a/include/drm/drm_modeset_lock.h
+++ b/include/drm/drm_modeset_lock.h
@@ -75,7 +75,7 @@ struct drm_modeset_acquire_ctx {
 };
 
 /**
- * struct drm_modeset_lock - used for locking modeset resources.
+ * @struct drm_modeset_lock - used for locking modeset resources.
  * @mutex: resource locking
  * @head: used to hold its place on &drm_atomi_state.locked list when
  *    part of an atomic update
-- 
2.50.1

