Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB19B7AEAC6
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 12:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9EB010E3A5;
	Tue, 26 Sep 2023 10:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338C510E3A5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 10:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695725522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=X4uB88kvmb2OybCMfZJsL98qGlQf9b7gdl07NjAzN9g=;
 b=GDZiAQ8euxMFhyNz26TSZuIlbzg7BilNqiLx8X+HFXAnQYvra5DvHMyPkhKOSCG4XLzAP7
 HNO48q2eW6fzxdeEcCxr2Zz1+decVXMllrLoRBYwIURgFtO2id+jrVigOCoqLGdFEd0Kms
 vG3xuoylOk+rJij8itNI8IaWBYZSjw0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-TR1AZ63FP-W8v4zOjsGJbg-1; Tue, 26 Sep 2023 06:52:00 -0400
X-MC-Unique: TR1AZ63FP-W8v4zOjsGJbg-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-531373ea109so6577875a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 03:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695725519; x=1696330319;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X4uB88kvmb2OybCMfZJsL98qGlQf9b7gdl07NjAzN9g=;
 b=qvw7udNScgXwDQonimjyeB4uECRMbgYP6QYEjiJcP2H3OZAYjuRrNnWRH59FQFKdPS
 gZydNeg2VVsx3fAtLxrC78fp8xp0++RU6Aw4KIjGbjqpEQ5yrTig/fX1Jl7V6ClGDjXo
 JMR/ZFzEP5DaP4WAhx5OBt38ol/D9rKQca1sd/EzvATNsQEZPA/f9Cz6V0/pzLDX2ZPF
 k0qln2v88HxgA0JC0u8o/xj+exxjskakTZaUCsIWBLHpbZdNdCQTVhwyH/7EH8UkHu0h
 TrtG5nQlX4LZHkyWjleJVETB/fECFasDBon1WJX2QDVshTc3RChQ/V+EQBvkYdr3lL+w
 jr2Q==
X-Gm-Message-State: AOJu0YymP090L3FuHt29C8gnEz0TuoZr4fe6j7dx6BPfbChLLVbVaofj
 2MStCICKr7eZKAorHx3iZ//ImTa9e8WJsLBnSzKILiZqHSxREnqF1ZWg4vw+/L8w14XOrvgir7D
 6kiVULyR+WpjLq52rEcFd9pmT5s5dVADIA0BqmVxtufAs1lSMOQsqaAqHVESnhWfjNfDwiaFqL6
 dkXov8tgI=
X-Received: by 2002:a05:6402:656:b0:522:3d36:ff27 with SMTP id
 u22-20020a056402065600b005223d36ff27mr8070682edx.31.1695725519504; 
 Tue, 26 Sep 2023 03:51:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH8nf0IVOQ5bt/LShjdqPKghaz5yxg+NopLj8GcqKnHIkhSFwCF49cSfbnTsxDOW26ExwKZQ==
X-Received: by 2002:a05:6402:656:b0:522:3d36:ff27 with SMTP id
 u22-20020a056402065600b005223d36ff27mr8070663edx.31.1695725519158; 
 Tue, 26 Sep 2023 03:51:59 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 d15-20020aa7d68f000000b005333922efb0sm6627881edr.78.2023.09.26.03.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 03:51:58 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: dri-devel@lists.freedesktop.org,
	sfr@canb.auug.org.au
Subject: [PATCH] drm/gpuvm: doc: fix filename references
Date: Tue, 26 Sep 2023 12:51:28 +0200
Message-ID: <20230926105146.10808-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: daniel.vetter@ffwll.ch, linux-next@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit f72c2db47080 ("drm/gpuvm: rename struct drm_gpuva_manager to
struct drm_gpuvm") did also change the corresponding filenames which are
referenced from the documentation, but were not adjusted accordingly.
Hence, fix up those filenames.

Fixes: f72c2db47080 ("drm/gpuvm: rename struct drm_gpuva_manager to struct drm_gpuvm")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/dri-devel/20230926150725.4cca5fc5@canb.auug.org.au/
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 Documentation/gpu/drm-mm.rst | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index c19b34b1c0ed..602010cb6894 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -466,40 +466,40 @@ DRM MM Range Allocator Function References
 .. kernel-doc:: drivers/gpu/drm/drm_mm.c
    :export:
 
-DRM GPU VA Manager
-==================
+DRM GPUVM
+=========
 
 Overview
 --------
 
-.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
+.. kernel-doc:: drivers/gpu/drm/drm_gpuvm.c
    :doc: Overview
 
 Split and Merge
 ---------------
 
-.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
+.. kernel-doc:: drivers/gpu/drm/drm_gpuvm.c
    :doc: Split and Merge
 
 Locking
 -------
 
-.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
+.. kernel-doc:: drivers/gpu/drm/drm_gpuvm.c
    :doc: Locking
 
 Examples
 --------
 
-.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
+.. kernel-doc:: drivers/gpu/drm/drm_gpuvm.c
    :doc: Examples
 
-DRM GPU VA Manager Function References
---------------------------------------
+DRM GPUVM Function References
+-----------------------------
 
-.. kernel-doc:: include/drm/drm_gpuva_mgr.h
+.. kernel-doc:: include/drm/drm_gpuvm.h
    :internal:
 
-.. kernel-doc:: drivers/gpu/drm/drm_gpuva_mgr.c
+.. kernel-doc:: drivers/gpu/drm/drm_gpuvm.c
    :export:
 
 DRM Buddy Allocator
-- 
2.41.0

