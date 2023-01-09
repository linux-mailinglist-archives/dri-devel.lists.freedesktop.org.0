Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7BA66239B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 12:01:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E1710E3D1;
	Mon,  9 Jan 2023 11:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F88710E3D1;
 Mon,  9 Jan 2023 11:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o4/GAvUPZ8JyReLwXLAtNiGfcLFGj5BmLx5PJZsZOdI=; b=BWCGlFG5f8mAyuWcqAsjd10bok
 yhdDvORYlP3Fs3F1XWCQGqjR+rhhu3rCoLoZ9jxbg6nMj1vs4eDOBK0ho/Y2MCLUAd6HJxvIgDkjJ
 cG+pR5L/pl+qkp8TrFRLWS418irL8hilxZPKzj38iNuinurNlfpkxbs6E4rcd0lWLI42ZYJlNkcQl
 s9n9EDr4F+Mm+iPv/GlUIwbMAX1lesAFSodflQ4PjUbIpqmWB84YPkWDZxP1xAd9hl/Jm3Wurjonn
 KCDfG5iA5PXaHDIyY32KTNiSsqXQ2KiLDaHZofzzgqkCJd4bdmE9Zmh2wath4VtAlIxT4p2vGuJtA
 Hy6ORsMw==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pEptC-003J8T-M6; Mon, 09 Jan 2023 12:00:27 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Simon Ser <contact@emersion.fr>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zackr@vmware.com>
Subject: [PATCH 1/5] drm/framebuffer: Check for valid formats
Date: Mon,  9 Jan 2023 07:58:04 -0300
Message-Id: <20230109105807.18172-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109105807.18172-1-mcanal@igalia.com>
References: <20230109105807.18172-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, framebuffer_check() doesn't check if the pixel format is
supported, which can lead to the acceptance of invalid pixel formats
e.g. the acceptance of invalid modifiers. Therefore, add a check for
valid formats on framebuffer_check(), so that the ADDFB2 IOCTL rejects
calls with invalid formats.

Moreover, note that this check is only valid for atomic drivers,
because, for non-atomic drivers, checking drm_any_plane_has_format() is
not possible since the format list for the primary plane is fake, and
we'd therefore reject valid formats.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 Documentation/gpu/todo.rst        | 9 ++++-----
 drivers/gpu/drm/drm_framebuffer.c | 8 ++++++++
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 1f8a5ebe188e..3a79c26c5cc7 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -276,11 +276,10 @@ Various hold-ups:
 - Need to switch to drm_fbdev_generic_setup(), otherwise a lot of the custom fb
   setup code can't be deleted.
 
-- Many drivers wrap drm_gem_fb_create() only to check for valid formats. For
-  atomic drivers we could check for valid formats by calling
-  drm_plane_check_pixel_format() against all planes, and pass if any plane
-  supports the format. For non-atomic that's not possible since like the format
-  list for the primary plane is fake and we'd therefor reject valid formats.
+- Need to switch to drm_gem_fb_create(), as now framebuffer_check() checks for
+  valid formats for atomic drivers.
+
+- Add an addfb format validation for non-atomic drivers.
 
 - Many drivers subclass drm_framebuffer, we'd need a embedding compatible
   version of the varios drm_gem_fb_create functions. Maybe called
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index aff3746dedfb..605642bf3650 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -280,6 +280,14 @@ static int framebuffer_check(struct drm_device *dev,
 		}
 	}
 
+	/* Verify that the modifier is supported. */
+	if (drm_drv_uses_atomic_modeset(dev) &&
+	    !drm_any_plane_has_format(dev, r->pixel_format, r->modifier[0])) {
+		drm_dbg_kms(dev, "Unsupported pixel format %p4cc / modifier 0x%llx\n",
+			    &r->pixel_format, r->modifier[0]);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
2.39.0

