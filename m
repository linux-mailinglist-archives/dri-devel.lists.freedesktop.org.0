Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B4B7D5B2C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 21:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E7B10E47D;
	Tue, 24 Oct 2023 19:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D50D10E47D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 19:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id EF2D4408F8;
 Tue, 24 Oct 2023 21:10:29 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b20wkq-0792A; Tue, 24 Oct 2023 21:10:29 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1698174629; bh=xG41h1/DHO5ER3lxWs270Udv8i/mW1twDfbQMTeqiNo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=PACCjmOAwbBwO1o2jHU80iT4hCvYQi3n1ZBT8K7Z9piCzMgHL2h7vbwyn0d1+/6rm
 YRNGkYq5fe1IfEypIZZ44D4GxSIAPhfQI7e6u37KZabv2QKQRlXaeYwxAuYpNV/sFS
 eMwzRG654pKI4/7ydpHumeVCsMPh0W29bCkErJJLr73OwRfzRGUng84uQ2xAOFhAon
 rfBS9FAsQTDuRB0ZJqgEiEwC9QX5wgj+ymtl7jB5JbhkZh3yc6jtcK4EhWEHDmFZ2t
 q32CmADfHRd8ptrNJiiirBqIuJ6vZ7iOQP79TAm6BKXt4V2yxkcAidVy2XfZSfwYWy
 rQdy/8L/J9AuA==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 03/11] drm/tests: Replace strcpy to strscpy on
 drm_test_framebuffer_create test
Date: Tue, 24 Oct 2023 16:09:54 -0300
Message-ID: <20231024191002.1620-4-gcarlos@disroot.org>
In-Reply-To: <20231024191002.1620-1-gcarlos@disroot.org>
References: <20231024191002.1620-1-gcarlos@disroot.org>
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Tales Lelo da Aparecida <tales.aparecida@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the use of strcpy to strscpy on the test_to_desc of the
drm_test_framebuffer_create test for better security and reliability.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 659cbd5a3be3..eb76a71644e9 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -397,7 +397,7 @@ static void drm_test_framebuffer_create(struct kunit *test)
 
 static void drm_framebuffer_test_to_desc(const struct drm_framebuffer_test *t, char *desc)
 {
-	strcpy(desc, t->name);
+	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
 }
 
 KUNIT_ARRAY_PARAM(drm_framebuffer_create, drm_framebuffer_create_cases,
-- 
2.41.0

