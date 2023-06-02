Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C84B720257
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 14:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B60310E04D;
	Fri,  2 Jun 2023 12:45:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4A110E04D
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 12:45:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 700BA616D1;
 Fri,  2 Jun 2023 12:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9ADDC433EF;
 Fri,  2 Jun 2023 12:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685709946;
 bh=5tsFEnVqyWViniqebIjKt9Ya28HTseKy3clt1psmZfY=;
 h=From:To:Cc:Subject:Date:From;
 b=O7//ivusxkzvhpdpQH02dhNTkRC0sOvOF+YB0GwZhXGeBCAxwHULuqQQ9EpYeA7Y7
 HqqWMyv7IKFQe3LBqy6LE7meK3hQOkXI2u0n7KqpER8SIEKY3OpcxsZ8JqXHVK/mFQ
 l4y9ojcLWGGvBnGtYeHIGYcZYjgBCydx/1IUBI6lJwHfCISxvWbVvGVOhMAR/nxe5l
 YOqXBfenMxlami2rOk0x2hxi6TmMy2uVKFH+VoupA6dmdZ72/6C/x2A+EFO4j98FZn
 dT1cOVWYEQtQms+qsyzg1s8YBmiRMoQUi97nkETQ7gauSh8kyFxpU1LCjBVDlMsnK1
 TukFu1vyjOKpA==
From: Arnd Bergmann <arnd@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Nicolas Belin <nbelin@baylibre.com>
Subject: [PATCH] drm/meson: venc: include linux/bitfield.h
Date: Fri,  2 Jun 2023 14:45:24 +0200
Message-Id: <20230602124539.894888-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Arnd Bergmann <arnd@arndb.de>, Carlo Caione <ccaione@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Without this header, the use of FIELD_PREP() can cause a build failure:

drivers/gpu/drm/meson/meson_venc.c: In function 'meson_encl_set_gamma_table':
drivers/gpu/drm/meson/meson_venc.c:1595:24: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]

Fixes: 51fc01a03442c ("drm/meson: venc: add ENCL encoder setup for MIPI-DSI output")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/meson/meson_venc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index 2bdc2855e249b..3bf0d6e4fc30a 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2015 Amlogic, Inc. All rights reserved.
  */
 
+#include <linux/bitfield.h>
 #include <linux/export.h>
 #include <linux/iopoll.h>
 
-- 
2.39.2

