Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D34893A797
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 21:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB7910E59B;
	Tue, 23 Jul 2024 19:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZCiTVTg1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC79510E59B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 19:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721761847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sTmt+mPR6Dh8yvYNnj7E89BbgXp2IxTdtH3bFQH013s=;
 b=ZCiTVTg1JGDTRonzjPxuC9+R7XfII4osdGWrTy452aNcnryBAiuqYAM0X7NvdrtGNH2N5c
 HL7EwCe80XWyggLW8hfH7vP1MzwiSTCcaVJuIp5VWLRFqcDmrBuJ6UKKhE4uNJSiLLzbSO
 p65tdGku+MvNiC5FgSg33eKyWCuRItI=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-PMQ4E3tTOU2gEdSRGj6CkQ-1; Tue, 23 Jul 2024 15:10:44 -0400
X-MC-Unique: PMQ4E3tTOU2gEdSRGj6CkQ-1
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-81025ee3f12so1929623241.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 12:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721761844; x=1722366644;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sTmt+mPR6Dh8yvYNnj7E89BbgXp2IxTdtH3bFQH013s=;
 b=PKo/rOR1pWh9fYGMGZ+iXDtI6Pq1o+DdcxS7KDSk/Z4+UESl72PQJyT1HjRnlRg1BB
 l10vMnWYjqIpmM0Ikqw5F6ThpSnXL/mzM4lkWre/6TYEHzCDpm8jVfkb/vIihCz139tL
 2CpZmqu90ZG+ZsgVVJaTcW9bMjupksb13+jwWOBsVpc06zW6Hb8+j5CGGIKXsRkSwqkl
 E1YL4rPA4u5ViKrl1YMKPg40UNKIlvtLNHHSOkjtejE1IJPEqvMyf906/3GaY1864lP9
 /PM0zyLVjySfBpX1yh74gzJUMqDL1a8fwhWFKFdAPFeK6LeNUPMA3UPuydsW37hV27Qh
 Lz+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWUVMGPLAileHQYopSrq8swbFBLaNoTAOTlhHL2yD/XPi0udFZFRvlxqgHmNcPij6a9twlGPcDdrpyZY4+mD9Waw4m4jVOM2e1AETgK++z
X-Gm-Message-State: AOJu0YxO8K7katmtN/2TLfADANOGnxHM4dtV8mhk/AMt5x105q8uNPWS
 Vx8aVDbe0H/HLTo+sOdbreCJ77F9dbxw26FAN46WkJ1wsrbpIO8sLzHGsEAdifsqnZ9UUOABb5a
 rFDuM0r8EbhfSzU83Sh8T78mD9lFHNtktzdSBRxtDjVZNeS9MkzheLMcTCR0cqOzN
X-Received: by 2002:a05:6122:1da3:b0:4f5:1d9a:ad5c with SMTP id
 71dfb90a1353d-4f51d9ab5f3mr9493108e0c.14.1721761843684; 
 Tue, 23 Jul 2024 12:10:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbsG3Spdqe024LSLYLFda/r1gVi4vp0VlP6ZUyCQKUEMpONzanpiYNPezzXds561tCZPFRZg==
X-Received: by 2002:a05:6122:1da3:b0:4f5:1d9a:ad5c with SMTP id
 71dfb90a1353d-4f51d9ab5f3mr9493080e0c.14.1721761843282; 
 Tue, 23 Jul 2024 12:10:43 -0700 (PDT)
Received: from klayman.redhat.com
 (host-82-62-247-97.business.telecomitalia.it. [82.62.247.97])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a198fbd489sm505744085a.31.2024.07.23.12.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 12:10:42 -0700 (PDT)
From: Marco Pagani <marpagan@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Marco Pagani <marpagan@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/test: use kunit action wrapper macro in the gem shmem
 test suite
Date: Tue, 23 Jul 2024 21:10:35 +0200
Message-ID: <20240723191036.131286-1-marpagan@redhat.com>
X-Mailer: git-send-email 2.45.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace deferred action function wrappers with equivalent ones defined
using the macro introduced by commit 56778b49c9a2 ("kunit: Add a macro to
wrap a deferred action function")

Signed-off-by: Marco Pagani <marpagan@redhat.com>
---
 drivers/gpu/drm/tests/drm_gem_shmem_test.c | 27 ++++++----------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
index c3758faa1b83..f7f7d8b0f61f 100644
--- a/drivers/gpu/drm/tests/drm_gem_shmem_test.c
+++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
@@ -23,29 +23,16 @@
 #define TEST_BYTE		0xae
 
 /*
- * Wrappers to avoid an explicit type casting when passing action
- * functions to kunit_add_action().
+ * Wrappers to avoid cast warnings when passing action functions
+ * directly to kunit_add_action().
  */
-static void kfree_wrapper(void *ptr)
-{
-	const void *obj = ptr;
-
-	kfree(obj);
-}
-
-static void sg_free_table_wrapper(void *ptr)
-{
-	struct sg_table *sgt = ptr;
+KUNIT_DEFINE_ACTION_WRAPPER(kfree_wrapper, kfree, const void *);
 
-	sg_free_table(sgt);
-}
-
-static void drm_gem_shmem_free_wrapper(void *ptr)
-{
-	struct drm_gem_shmem_object *shmem = ptr;
+KUNIT_DEFINE_ACTION_WRAPPER(sg_free_table_wrapper, sg_free_table,
+			    struct sg_table *);
 
-	drm_gem_shmem_free(shmem);
-}
+KUNIT_DEFINE_ACTION_WRAPPER(drm_gem_shmem_free_wrapper, drm_gem_shmem_free,
+			    struct drm_gem_shmem_object *);
 
 /*
  * Test creating a shmem GEM object backed by shmem buffer. The test
-- 
2.45.2

