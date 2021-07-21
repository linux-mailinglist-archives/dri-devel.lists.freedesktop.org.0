Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9963D1234
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 17:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F90A6EB21;
	Wed, 21 Jul 2021 15:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E054A6EB21
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 15:22:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 10FD360E0C;
 Wed, 21 Jul 2021 15:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626880936;
 bh=ntVtjVZCxN1d2TjZ6e0NTRp27wR6oy4/mFhQaboSbjo=;
 h=From:To:Cc:Subject:Date:From;
 b=R7G3apDmT1Zaf3nzzVcHkuv4gHOEJQpRu0GRSyuFF6Bn5gIKlwEWrahfZU5PiGtKv
 wZdVY2j7+4YsMPmQyAzjuNsskDF2xP2WpcTlynHe/nHGs3wcx8i51E/7P5vJD0O1hT
 28eQPIxKmJ4Un45w709FaWFSv0NWhPVervQ9/T8NhW6hmXfwqe3rHuH55mkaldTqxb
 eqdg2tH/2b1nwZpuGpPjaBG/fk8jGdUY2723YHLlMAE9n1NtcqNCfHi4fdABngZb5W
 Sg0PmiBPyTgpOIoPxXizQfpqkdSyEExtQbpnixI6j/V7diy1SXHccySRpd+dpkvEwB
 AhNKx3CTQBMPg==
From: Arnd Bergmann <arnd@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kees Cook <keescook@chromium.org>
Subject: [PATCH] drm: fb_helper: fix CONFIG_FB dependency
Date: Wed, 21 Jul 2021 17:22:01 +0200
Message-Id: <20210721152211.2706171-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Deepak Rawat <drawat.floss@gmail.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

With CONFIG_FB=m and CONFIG_DRM=y, we get a link error in the fb helper:

aarch64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_alloc_fbi':
(.text+0x10cc): undefined reference to `framebuffer_alloc'

Tighten the dependency so it is only allowed in the case that DRM can
link against FB.

Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 7ff89690a976..061f4382c796 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -98,7 +98,7 @@ config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
 config DRM_FBDEV_EMULATION
 	bool "Enable legacy fbdev support for your modesetting driver"
 	depends on DRM
-	depends on FB
+	depends on FB=y || FB=DRM
 	select DRM_KMS_HELPER
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
-- 
2.29.2

