Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64304776C74
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 00:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C799110E131;
	Wed,  9 Aug 2023 22:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A05D10E131
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 22:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691621440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gF/DsPM8L4MqlHp9tlfI2YXb+0b5z0aTjeRWWwXcwao=;
 b=ceEqM6uDKOYdW+WBSv4TfEaMxqG1fOg1R8a+oYYumOC5Qg0D/1RlhDx1DG9vdUMT1bpGhN
 e7nPtZoK1lrkwWCOz1Gp7ZEj6IQDJlTaSVou3IpWPW0IrOfllGf0DeVujSuxOV/6HUTw+P
 zjaogHmzqHyOkdbrhai8xtn8c8VCxjg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-fdiilVrePN6SviSIMivJJw-1; Wed, 09 Aug 2023 18:50:39 -0400
X-MC-Unique: fdiilVrePN6SviSIMivJJw-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-99bca0b9234so20273266b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 15:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691621438; x=1692226238;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gF/DsPM8L4MqlHp9tlfI2YXb+0b5z0aTjeRWWwXcwao=;
 b=O6AI5i2nQm52lxhcRgTiaINHGQxP3ZNCOc0lJYp5PGt5mqAJ14lLCpKIT8hYk9tFIE
 fNX0JUCOlJZ6jM6zEQxt0+jzCHKWwZm1eA9k5hiwLZbOULbEaRyVOAbnp3srG0cNb9KL
 ZYHTNuBaDRppWhKDhkpHT+capQeTDLuk2s+XzNx43ELpdnza/h08rGpWPUPSGgZ8vWg0
 dj2K/tc4xi3UfLuUHjt1ORnwd3uwnfhrTIc9eEtQwQhBnQafmUurbpkpwcy8C0AmTaK5
 Gkz5Og2GeUL7cz1d3FC2wq6agfgG1icUu6bkeNJasHOvueC8V20xro3KBaJe3RyEgTNj
 t8Dg==
X-Gm-Message-State: AOJu0Yzpm0G9NIF7SBOJ2fh27yc59T/8I8ccEH02DthGbhlN5kMganoq
 0AilD+2o5zXh4GISlr4IjIR+oviu0g9LREYJCK35JUBO0aD+UfTwxVu7QVW0kudBfznxDV6BpOL
 Rtr96+yehdFcSPMG0vsVFfXO+3sa4
X-Received: by 2002:a17:906:105c:b0:99b:4956:e4e3 with SMTP id
 j28-20020a170906105c00b0099b4956e4e3mr366947ejj.8.1691621438188; 
 Wed, 09 Aug 2023 15:50:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6vRNFFeqAB3QpQbIXjT+bkqtYOwBj+1lQOt4+Ju691WeyIdUOlvAcgM88u9tqNgL2EABoqQ==
X-Received: by 2002:a17:906:105c:b0:99b:4956:e4e3 with SMTP id
 j28-20020a170906105c00b0099b4956e4e3mr366938ejj.8.1691621437902; 
 Wed, 09 Aug 2023 15:50:37 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 kg23-20020a17090776f700b0099cfd0b2437sm99580ejc.99.2023.08.09.15.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 15:50:37 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, christian.koenig@amd.com,
 alexander.deucher@amd.com, arthurgrillo@riseup.net
Subject: [PATCH drm-misc-next] drm/test: drm_exec: fix memory leak on object
 prepare
Date: Thu, 10 Aug 2023 00:50:14 +0200
Message-ID: <20230809225034.8803-1-dakr@redhat.com>
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
index f79c9f0359aa..9ccf0dd9ca89 100644
--- a/drivers/gpu/drm/tests/drm_exec_test.c
+++ b/drivers/gpu/drm/tests/drm_exec_test.c
@@ -125,8 +125,6 @@ static void test_duplicates(struct kunit *test)
 	drm_exec_fini(&exec);
 }
 
-
-
 static void test_prepare(struct kunit *test)
 {
 	struct drm_exec_priv *priv = test->priv;
@@ -145,6 +143,8 @@ static void test_prepare(struct kunit *test)
 			break;
 	}
 	drm_exec_fini(&exec);
+
+	drm_gem_private_object_fini(&gobj);
 }
 
 static void test_prepare_array(struct kunit *test)
@@ -165,6 +165,9 @@ static void test_prepare_array(struct kunit *test)
 					     1);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	drm_exec_fini(&exec);
+
+	drm_gem_private_object_fini(&gobj1);
+	drm_gem_private_object_fini(&gobj2);
 }
 
 static struct kunit_case drm_exec_tests[] = {

base-commit: e05f3938c5a7896d09736e3381675a57ffee7a0a
-- 
2.41.0

