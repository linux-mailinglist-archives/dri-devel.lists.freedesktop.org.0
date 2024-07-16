Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8199326AA
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 14:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D2F410E6C4;
	Tue, 16 Jul 2024 12:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LPl+1zPf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0914010E6BC
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 12:35:29 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4266f3e0df8so36781465e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 05:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721133327; x=1721738127; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kYgYhQ4Oz7F4mcrrJIlI6PdlNNIhYV67uSt9q4ql9pk=;
 b=LPl+1zPflmdoJkhFs1hj2MS0Gg9vaWEDjD4qT66ksv1IhmakfBredejjk3+Dfg0uxs
 /m7rS/PWzXB5j8KpAHxFVJkZY7USx82K6lEwObf6JVJO68EuDYQk0AIZTfhs6WAgb9AC
 6uY+DcEps8fA7Bwy2N9UmsV9fe71ckPNvc7M4Hs3pd0TEzjxV9aAh5Cs4RcxIjQXUZ5K
 hsiuOleNhjnI6BVtvh9tzySgubSJPcZdfWrJTzVw4I96Y8Wca8nAlnRtTE2DMiGNAcqk
 Mdj5iPgQs9HGqqquR2AK8E7w1QYRP3O+ea6GOzcnjoUi6vxR/kaX8TAHu5XSLkEXNiyQ
 VP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721133327; x=1721738127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kYgYhQ4Oz7F4mcrrJIlI6PdlNNIhYV67uSt9q4ql9pk=;
 b=R5aP868Eg8LChTPwt8pXGOQJpAhfvHl9mfL7j7u6uYYc6BF2pqnIi2pFe/GpLTZ9ol
 ++rmxslLvcFV4L9pCanSbz5sXpXYpbNhG8+MVlAjN1zdSklQPpM9RGZ05xDYM3+L5Yuz
 RmXYmluMzAuxbQCfvO9PNBxaIvQPYc1TbBFsG6h7azSchNdS66jtVld6zCCkPyZyt6mV
 A46VGnMnx8RXTPbyAmoDpGrGAAMKm6HMhuzdMQjPAAAUOidgPDxHm3ssCyde3L3ESYWR
 G1QEFSt2uJ+YaFx5LshM7Q7iYzBiT8lLgUH71kual7U0yI7K2rpaFIZWa8t0l/fq7Ud8
 cGFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU796o2JxsroXYR3NAG37UY/MdMvMSvIzliVjuKSfXcyqetemktfM6cOxpy87E2mb7IEqnFuKBSq0nm0SHF7EFSbMuF3f0+3P+mLthAt8nS
X-Gm-Message-State: AOJu0Yzf9YVBDtvZadQSi8ZvbPcxV5NU9d1qkFkuTRqHs0RiDhAc2AHU
 6imZUojPK+gIc1DD1TSemCZjrKifvVYYrejJ4jwUzaLySQzTXwZS
X-Google-Smtp-Source: AGHT+IHzYluqxxu52gBtSwwDHbDBha1v2yrpI/eMiMblvbYvULgdP+9mAOvDfNtnU5cjksZa6sMSMw==
X-Received: by 2002:a05:600c:1c26:b0:421:7bed:5274 with SMTP id
 5b1f17b1804b1-427ba628678mr12792675e9.10.1721133326725; 
 Tue, 16 Jul 2024 05:35:26 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1592:7f00:1c98:7fd3:7b80:1cc1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e77493sm127058225e9.7.2024.07.16.05.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 05:35:26 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 6/9] drm/vmwgfx: partially revert "Adapt validation code for
 reference-free lookups"
Date: Tue, 16 Jul 2024 14:35:16 +0200
Message-Id: <20240716123519.1884-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240716123519.1884-1-christian.koenig@amd.com>
References: <20240716123519.1884-1-christian.koenig@amd.com>
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

This reverts commit 64ad2abfe9a628ce79859d072704bd1ef7682044.

To me it looks like this functionality was never actually used. At least
I can't find any protection in vmw_bo_free().

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
index e7625b3f71e0..e11837e484aa 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
@@ -262,7 +262,8 @@ int vmw_validation_add_bo(struct vmw_validation_context *ctx,
 				bo_node->hash.key);
 		}
 		val_buf = &bo_node->base;
-		val_buf->bo = ttm_bo_get_unless_zero(&vbo->tbo);
+		vmw_bo_reference(vbo);
+		val_buf->bo = &vbo->tbo;
 		if (!val_buf->bo)
 			return -ESRCH;
 		val_buf->num_shared = 0;
@@ -656,7 +657,7 @@ void vmw_validation_unref_lists(struct vmw_validation_context *ctx)
 	struct vmw_validation_res_node *val;
 
 	list_for_each_entry(entry, &ctx->bo_list, base.head) {
-		ttm_bo_put(entry->base.bo);
+		drm_gem_object_put(&entry->base.bo->base);
 		entry->base.bo = NULL;
 	}
 
-- 
2.34.1

