Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 537A83ED0A2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 10:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0D289294;
	Mon, 16 Aug 2021 08:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7478289294
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 08:52:43 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1629103959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zi8Fdsey5Ms6/cH7nMjYLOX5iy7SsQjRJfozlaRoY+c=;
 b=kVKsu1C86IC5tb8pzbZUAwDUJvTsUK6BgoG81gF02/idvBtvUUFsI6oyNUXjpaNu1KG5De
 NDE1LFjtMiWJwNVD7+4jPvoW4bjL7T1YhUSzH0Y52w+UIctfMphSsIadujvA6BTA4ssUfW
 J/y8eaco78JZYm9wSDy+SpEsihI/2v0=
From: Jackie Liu <liu.yun@linux.dev>
To: jani.nikula@linux.intel.com, keescook@chromium.org, daniel@ffwll.ch,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	liuyun01@kylinos.cn
Subject: [PATCH v2] drm/fb: Fix randconfig builds
Date: Mon, 16 Aug 2021 16:52:31 +0800
Message-Id: <20210816085231.2455369-1-liu.yun@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: liu.yun@linux.dev
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

From: Jackie Liu <liuyun01@kylinos.cn>

When CONFIG_DRM_FBDEV_EMULATION is compiled to y and CONFIG_FB is m, the
compilation will fail. we need make that dependency explicit.

Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 drivers/gpu/drm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 7ff89690a976..cd129d96e649 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -98,7 +98,7 @@ config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
 config DRM_FBDEV_EMULATION
 	bool "Enable legacy fbdev support for your modesetting driver"
 	depends on DRM
-	depends on FB
+	depends on FB && FB != m
 	select DRM_KMS_HELPER
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
-- 
2.25.1

