Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ED8926722
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 19:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4DB10E952;
	Wed,  3 Jul 2024 17:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="kvb/fq5H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CF310E953
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 17:30:24 +0000 (UTC)
X-Virus-Scanned: SPAM Filter at disroot.org
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1720027269; bh=KWo1rlNsCTscqaXq8ZXQXtHfhOVJd4TJRwjJjBi/FN4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=kvb/fq5HbbtI82i1Yuy9YSxJK/XUK6rXTLfRG45uhCEIyrEqPy9Aky3C5kk1s3dut
 Xnu6L3f70k/SOVLqwk6ieXMZe7KXMXTkRgHQrIZMD8tEIZuR/PhgflHr0c1mE203AR
 MvEw2Ab2w7XoTh31PCVI5lxmOtJv6XUn/bN5QuPmFMUz6UWwIV2c3UM9kpl3qbRGOY
 7jyuwbAUrJwSxby1ci6hn16OGkSP5a8PTuLzGrxsAtHOLeUgVHsvG9RpPO9eXlGVGH
 yucZGovoEzEs1jFHAXeID/LTWOUefPeS1YOW3DHiD/k0eZq119zMVyGJ54wqgeuGlE
 dW79ZKsoPZUeQ==
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Tales Lelo da Aparecida <tales.aparecida@gmail.com>,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Subject: [PATCH v3 3/9] drm/tests: Replace strcpy to strscpy on
 drm_test_framebuffer_create test
Date: Wed,  3 Jul 2024 14:22:22 -0300
Message-ID: <20240703172228.11166-4-gcarlos@disroot.org>
In-Reply-To: <20240703172228.11166-1-gcarlos@disroot.org>
References: <20240703172228.11166-1-gcarlos@disroot.org>
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

Replace the use of strcpy to strscpy on the test_to_desc of the
drm_test_framebuffer_create test for better security and reliability.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 3ed987423322..4b1884be9d7a 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -409,7 +409,7 @@ static void drm_test_framebuffer_create(struct kunit *test)
 
 static void drm_framebuffer_test_to_desc(const struct drm_framebuffer_test *t, char *desc)
 {
-	strcpy(desc, t->name);
+	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
 }
 
 KUNIT_ARRAY_PARAM(drm_framebuffer_create, drm_framebuffer_create_cases,
-- 
2.44.2

