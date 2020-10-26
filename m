Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA6129985A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 22:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016146EA6B;
	Mon, 26 Oct 2020 21:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C896EA6A;
 Mon, 26 Oct 2020 21:00:46 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.30.34.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B36520B1F;
 Mon, 26 Oct 2020 21:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603746046;
 bh=igjkUN6wESAd/DH60fWZ+VmAdJIU5sWPvyCPO5XJN48=;
 h=From:To:Cc:Subject:Date:From;
 b=VzUdhLcPpA/VYtY4oGcXxakGk/klmGlbWxN7jUe4lHINDG2OR0v498DkIilt3SKQx
 9EgiYQT80bpyfptSqnLQC0nlOAwQ27biV7F2UzJBbeJzhw12tMcXZhs3tumDFTCB5/
 EPQlB8+1RK2gG1f7tadgZIZl9RITJf45G3X7XF84=
From: Arnd Bergmann <arnd@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/5] drm/amdgpu: fix enum mismatches
Date: Mon, 26 Oct 2020 22:00:29 +0100
Message-Id: <20201026210039.3884312-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

gcc -Wextra warns about an incorrect prototype causing multiple
mismatched enums:

display/dc/gpio/gpio_service.c: In function 'dal_gpio_service_create':
display/dc/gpio/gpio_service.c:70:50: warning: implicit conversion from 'enum dce_environment' to 'enum dce_version' [-Wenum-conversion]
display/dc/gpio/gpio_service.c:71:4: warning: implicit conversion from 'enum dce_version' to 'enum dce_environment' [-Wenum-conversion]
display/dc/gpio/gpio_service.c:76:46: warning: implicit conversion from 'enum dce_environment' to 'enum dce_version' [-Wenum-conversion]
display/dc/gpio/gpio_service.c:77:4: warning: implicit conversion from 'enum dce_version' to 'enum dce_environment' [-Wenum-conversion]

display/dc/core/dc.c: In function 'dc_construct':
display/dc/core/dc.c:718:10: warning: implicit conversion from 'enum dce_version' to 'enum dce_environment' [-Wenum-conversion]
display/dc/core/dc.c:719:10: warning: implicit conversion from 'enum dce_environment' to 'enum dce_version' [-Wenum-conversion]

Fixes: 4562236b3bc0 ("drm/amd/dc: Add dc display driver (v2)")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c           | 2 +-
 drivers/gpu/drm/amd/display/include/gpio_service_interface.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c b/drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c
index 92280cc05e2d..67bb5cc67255 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/gpio_service.c
@@ -54,7 +54,7 @@
 
 struct gpio_service *dal_gpio_service_create(
 	enum dce_version dce_version_major,
-	enum dce_version dce_version_minor,
+	enum dce_environment dce_version_minor,
 	struct dc_context *ctx)
 {
 	struct gpio_service *service;
diff --git a/drivers/gpu/drm/amd/display/include/gpio_service_interface.h b/drivers/gpu/drm/amd/display/include/gpio_service_interface.h
index 9c55d247227e..5f0f94e83d19 100644
--- a/drivers/gpu/drm/amd/display/include/gpio_service_interface.h
+++ b/drivers/gpu/drm/amd/display/include/gpio_service_interface.h
@@ -43,7 +43,7 @@ void dal_gpio_destroy(
 
 struct gpio_service *dal_gpio_service_create(
 	enum dce_version dce_version_major,
-	enum dce_version dce_version_minor,
+	enum dce_environment dce_version_minor,
 	struct dc_context *ctx);
 
 struct gpio *dal_gpio_service_create_irq(
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
