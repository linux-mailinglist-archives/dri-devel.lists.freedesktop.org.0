Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7FC9326A8
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 14:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 133D810E6C0;
	Tue, 16 Jul 2024 12:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VKS1ibiF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA04010E6B4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 12:35:25 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-427ad8bd88eso15733875e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 05:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721133324; x=1721738124; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BSNwQZGLWYfH9juZdEAPWV7Ekom8+34q1/sNTe+8RBs=;
 b=VKS1ibiFQl4lzqk1yEy5rAHjPBHVfk3ZPcT7yjF6bV9QzBy61bu+YFs0AgoICXE1nd
 KSiHPDO6B2TW2k0Ve5euUNnIuLm8If5p5n3Zkv/p9LlD2Gsl+j/apvQTgztPXR5MxpnT
 DNYLqmGdyqs3s0NyLDMefUiwJuRxsqwDj171aSFGkmbD9hHvIBZMaTmRrzGyt0Sv2x+G
 u3S1LqxCQJSw5YM7g96q2Skl8n8aJoPFbTnYPETSD4eURrlSkUoBPYCf4fr6UNVVEwuM
 FPBYSyQpBVcrO7O2fPmbcdwU6mOX4+5NiNyr1axr44eBbJhLlgRx+8n+3dMhanLg+Apn
 Z2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721133324; x=1721738124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BSNwQZGLWYfH9juZdEAPWV7Ekom8+34q1/sNTe+8RBs=;
 b=HJm6pHlcMVViJu+FODxrsa2cfbLmuFN33Lxj27Xxm+p4C1mSfcW+WYAb/cs7XsGtfu
 w3CtXqy6KfFZvPAor20R+2HGgXospaWjMtHK9a1qPwthjJLRmLx6xnbfs2/EMTJKmKx0
 0w7AmfJeQkC17LuUR8WUxm5VR+Fis10GVqc7fw0t0C1QwRDRAY0q93flWtSBShZ9KGDK
 T31UrPbd+HJV9/IEMEHeGOCRywYgo5HVKQEX2ik2yYNU1SEr+WPCTglOsEdHSm+dcFpS
 z5r+tLpmaD8tfx1UzK13Pua7xiICzj6TEr90TC7ef9xfrhOXO2uvsmwRzJ2qwGJOCPVr
 42Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfbH/62ga8j6t5g1gD5+Jh/IT5fokR47+WjzCRt9L0w/oC4h7hL7BFqVaTgNRFBYQB3/F+v9GKRK/DAOl6Z/FYydKl1wGRq0U41GZMNZGL
X-Gm-Message-State: AOJu0Yw/aTSHxuM7+9Cit8EBwL0yct2RCDCghdzQ1771l3IMLaSP+WDq
 5Ljn+tlsKBd0b8G2YHYq2bxK6PxRXs6OAI4xiIKwRIMbLI9ykoyu
X-Google-Smtp-Source: AGHT+IE0rUaTIN3uW4tuYO+OgZAZKRsUXeHgpFFwpWtcCPTtsLiUpQAJmfjNZydJobXbFq2KJm3Gjw==
X-Received: by 2002:a05:600c:3146:b0:426:5f75:1c2c with SMTP id
 5b1f17b1804b1-427ba62bc59mr12373235e9.11.1721133323728; 
 Tue, 16 Jul 2024 05:35:23 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1592:7f00:1c98:7fd3:7b80:1cc1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e77493sm127058225e9.7.2024.07.16.05.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 05:35:23 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/9] drm/loongson: use GEM references instead of TTMs
Date: Tue, 16 Jul 2024 14:35:12 +0200
Message-Id: <20240716123519.1884-3-christian.koenig@amd.com>
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

Instead of a TTM reference grab a GEM reference whenever necessary.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/loongson/lsdc_ttm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongson/lsdc_ttm.c
index 465f622ac05d..2e42c6970c9f 100644
--- a/drivers/gpu/drm/loongson/lsdc_ttm.c
+++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
@@ -341,16 +341,12 @@ void lsdc_bo_unpin(struct lsdc_bo *lbo)
 
 void lsdc_bo_ref(struct lsdc_bo *lbo)
 {
-	struct ttm_buffer_object *tbo = &lbo->tbo;
-
-	ttm_bo_get(tbo);
+	drm_gem_object_get(&lbo->tbo.base);
 }
 
 void lsdc_bo_unref(struct lsdc_bo *lbo)
 {
-	struct ttm_buffer_object *tbo = &lbo->tbo;
-
-	ttm_bo_put(tbo);
+	drm_gem_object_put(&lbo->tbo.base);
 }
 
 int lsdc_bo_kmap(struct lsdc_bo *lbo)
-- 
2.34.1

