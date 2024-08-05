Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 253D094862B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 01:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D9F10E2D3;
	Mon,  5 Aug 2024 23:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="YWi2fsm7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BB510E2D3
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 23:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id CBF9441A0D;
 Tue,  6 Aug 2024 01:38:30 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2AJUJ6Gjgze4; Tue,  6 Aug 2024 01:38:30 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1722901110; bh=wlDPrqJloqXoPvzIW0o43ht0FObE1/bhLSwf/mqTox0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=YWi2fsm7oETrTu8BFBF0W3KyQH+b83JfF0V/OfakzAlOE7qTUJUTUJQGD+9i+lisE
 YKUh1aT8HiQTen61Ms6e1MXhdKUeIVB67b26H3x426/iieLIVSs0KDEMUtC6fJjjJn
 sUJUK8n637vJRgyjcplndu3blxHpSxc8BWe8zUtD+ftK7k0TQ2A9VpppTKiYxUItwf
 U+khDKe3JYEei60UwGOn4/SDpdFlYb+gWHNUCcTf5BhirCr3IGNPiyXfuHthYs/kPJ
 z5BMpLdWLpzUnCd8H8oAp28rIyAw8XTLOsgnAVNyHG3EmLW0sc4sZ/WCLQnm0qmexH
 vria+SlHeB25Q==
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
Subject: [PATCH v4 3/9] drm/tests: Replace strcpy to strscpy on
 drm_test_framebuffer_create test
Date: Mon,  5 Aug 2024 20:39:28 -0300
Message-ID: <20240805234022.18586-4-gcarlos@disroot.org>
In-Reply-To: <20240805234022.18586-1-gcarlos@disroot.org>
References: <20240805234022.18586-1-gcarlos@disroot.org>
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
Acked-by: Maxime Ripard <mripard@kernel.org>
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

