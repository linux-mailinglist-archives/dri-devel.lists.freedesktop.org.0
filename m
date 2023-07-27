Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A76766025
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 01:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE5D10E048;
	Thu, 27 Jul 2023 23:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4598F10E048
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 23:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690499443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6weMTuIpszNXHkxpzKCFeAxVKVKCcANl7NKRIpHMrd4=;
 b=dEwpsERQJA/j9t40cQGTPA1dlaX+rmgrj0I8E/H2MvdqqGGDBkxluhSVKSjnSX2Qg8V127
 VM7NyUSjAAlfk4PQSxIdswXdYzwzJj0y8PymW2+yNxB3Lzzl4jqrnx0FipqZcuathYo5bu
 2refGiJRCmpTEWSa1DzTySa0pyCIyM4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-DmgbDCjjMNeCmTFCjC_LKg-1; Thu, 27 Jul 2023 19:10:42 -0400
X-MC-Unique: DmgbDCjjMNeCmTFCjC_LKg-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-50bf847b267so897905a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 16:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690499441; x=1691104241;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6weMTuIpszNXHkxpzKCFeAxVKVKCcANl7NKRIpHMrd4=;
 b=M8oRSkJAu9zfU+T6JCsC6WHN6hFhdLsgaUGY8rntbJmKGzRjrbyM5sBQvacjPNKU96
 o0gKe3Nqc1EXf6RR6hpTE2O6p0L7I285kINGLsEqF2GCV1gkbINh8rWG6N/qvjHkfaqy
 JmaNxqiksNoswH/gMnAeC5rs8wgTATevYc+WrQQcPD4XV7NdluX5kkSXK/btLeqJtwJC
 J1u9eaLKgycF+a3NvOrHovVClcWljW9kfN7PUFE0rFYiIbDnv7Vcq5c3fvBb217qJLPn
 df1OtOSvyOJ3Jaboaa+YPblUyprCuKe7Ru5+++jGs4+ngBqBljyz2GsyRAPKDi+Tihip
 UhRQ==
X-Gm-Message-State: ABy/qLadY8mXPmTKWfK53FaUNoRDggDcuTmbWzkYFDpRq5+l9ccM8oGQ
 U9kbqwkeleH4INgaTlJ+9z2ZLMZrmhI5a0S/7RmfbG4fTedX6LOnEiYoZacNfZbv407vuXyg4id
 Nl5qN330Ur5RebJLLY4Ckp/SFLPng
X-Received: by 2002:a17:906:51c5:b0:993:ec0b:1a27 with SMTP id
 v5-20020a17090651c500b00993ec0b1a27mr439234ejk.24.1690499441027; 
 Thu, 27 Jul 2023 16:10:41 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHUrTLDUvyW3xVYY9d7PdNdUMDSsSTZWNlXYh7cW8nBlIxTJhayg6BbjNw9w2E28yu4KbEVGg==
X-Received: by 2002:a17:906:51c5:b0:993:ec0b:1a27 with SMTP id
 v5-20020a17090651c500b00993ec0b1a27mr439226ejk.24.1690499440783; 
 Thu, 27 Jul 2023 16:10:40 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 y20-20020a17090629d400b00992e14af9b9sm1292554eje.134.2023.07.27.16.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 16:10:40 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, christian.koenig@amd.com,
 alexander.deucher@amd.com, arthurgrillo@riseup.net
Subject: [PATCH] drm/test: drm_exec: fix memory leak on object prepare
Date: Fri, 28 Jul 2023 01:10:36 +0200
Message-ID: <20230727231038.4943-1-dakr@redhat.com>
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_exec_prepare_obj() and drm_exec_prepare_array() both reserve
dma-fence slots and hence a dma_resv_list without ever freeing it.

Make sure to call drm_gem_private_object_fini() for each GEM object
passed to drm_exec_prepare_obj()/drm_exec_prepare_array() throughout the
test to fix this up.

While at it, remove some trailing empty lines.

Fixes: 9710631cc8f3 ("drm: add drm_exec selftests v4")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/tests/drm_exec_test.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
index df31f89a7945..80761e734a15 100644
--- a/drivers/gpu/drm/tests/drm_exec_test.c
+++ b/drivers/gpu/drm/tests/drm_exec_test.c
@@ -118,8 +118,6 @@ static void test_duplicates(struct kunit *test)
 	drm_exec_fini(&exec);
 }
 
-
-
 static void test_prepare(struct kunit *test)
 {
 	struct drm_gem_object gobj = { };
@@ -137,6 +135,8 @@ static void test_prepare(struct kunit *test)
 			break;
 	}
 	drm_exec_fini(&exec);
+
+	drm_gem_private_object_fini(&gobj);
 }
 
 static void test_prepare_array(struct kunit *test)
@@ -156,6 +156,9 @@ static void test_prepare_array(struct kunit *test)
 					     1);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	drm_exec_fini(&exec);
+
+	drm_gem_private_object_fini(&gobj1);
+	drm_gem_private_object_fini(&gobj2);
 }
 
 static struct kunit_case drm_exec_tests[] = {
-- 
2.41.0

