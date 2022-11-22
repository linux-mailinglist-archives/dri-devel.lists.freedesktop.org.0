Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE282634445
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 20:05:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4910510E44F;
	Tue, 22 Nov 2022 19:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D520A10E44B
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 19:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YOKduRxqOQ+ggRn/s0wpQfzORzZWr0CzU1FGkX5EVD0=; b=XARQrOWmHsmbi/5rMRbRZ09CRO
 2+oqzluHVHcGiSh6iOg4vwK2ACwy5Zqc+WRY0ZzP6BcyEkpVyUFVZdpQyDmWiL8iUnco+eSz/Nq4f
 Y3koU5xlQjmQzKyAqyGMxZLRT0/b9s09u6q5cGiQ7zBFaLz9Z9YH4vqiFp/hWKLCbcLNzPMFUiPWI
 rzvQNyLNBfq7A12zNwXHfg3aKEm8xPzmM6sSntE5pb+6RkmZ4/BFXVyJ1ZQgj3neSiQr5wAOGswAn
 g6G3Lx4PhCcfig1gD0HWZqTP2RTqtOrVNN2A8B4kZ9TeFaYb+4WXt2O2ozloooluoobatWQsprLfj
 uTUHpFaA==;
Received: from [177.34.169.227] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oxYZy-007AP3-4U; Tue, 22 Nov 2022 20:05:10 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>
Subject: [PATCH 6/6] drm/todo: update the debugfs clean up task
Date: Tue, 22 Nov 2022 16:03:14 -0300
Message-Id: <20221122190314.185015-7-mcanal@igalia.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122190314.185015-1-mcanal@igalia.com>
References: <20221122190314.185015-1-mcanal@igalia.com>
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
 Emma Anholt <emma@anholt.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wambui Karuga <wambui@karuga.org>, Melissa Wen <mwen@igalia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The structs drm_debugfs_info and drm_debugfs_entry introduced a new
debugfs structure to DRM, centered on drm_device instead of drm_minor.
Therefore, remove the tasks related to create a new device-centered
debugfs structure and add a new task to replace the use of
drm_debugfs_create_files() for the use of drm_debugfs_add_file() and
drm_debugfs_add_files().

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 Documentation/gpu/todo.rst | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index b2c6aaf1edf2..f64abf69f341 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -508,17 +508,14 @@ Clean up the debugfs support
 
 There's a bunch of issues with it:
 
-- The drm_info_list ->show() function doesn't even bother to cast to the drm
-  structure for you. This is lazy.
+- Convert drivers to support the drm_debugfs_add_files() function instead of
+  the drm_debugfs_create_files() function.
 
 - We probably want to have some support for debugfs files on crtc/connectors and
   maybe other kms objects directly in core. There's even drm_print support in
   the funcs for these objects to dump kms state, so it's all there. And then the
   ->show() functions should obviously give you a pointer to the right object.
 
-- The drm_info_list stuff is centered on drm_minor instead of drm_device. For
-  anything we want to print drm_device (or maybe drm_file) is the right thing.
-
 - The drm_driver->debugfs_init hooks we have is just an artifact of the old
   midlayered load sequence. DRM debugfs should work more like sysfs, where you
   can create properties/files for an object anytime you want, and the core
@@ -527,8 +524,6 @@ There's a bunch of issues with it:
   this (together with the drm_minor->drm_device move) would allow us to remove
   debugfs_init.
 
-Previous RFC that hasn't landed yet: https://lore.kernel.org/dri-devel/20200513114130.28641-2-wambui.karugax@gmail.com/
-
 Contact: Daniel Vetter
 
 Level: Intermediate
-- 
2.38.1

