Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA1039A3E9
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 17:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6D96F492;
	Thu,  3 Jun 2021 15:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1CE6F48E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 15:03:34 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id ci15so9676203ejc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 08:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=881IREVhQ433IxHCLkAiv7fS8sBZqG3xsrJTTjrxYc0=;
 b=K8mVQ+Z96ikoYo8dWmOAklwbcDRNywL/rUhmAEsDFbAA3bfgUMnfya8DpokRy4wpw3
 CgsMTIHb1BnkGI6Sm9vlSdicIxN03/ijKAF5NGkrocLhMMkWc/IMfXehFuvzFeBavqN6
 UNxnWUNi5PNejIHG/9UmdpAzpPVpE+nggcnsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=881IREVhQ433IxHCLkAiv7fS8sBZqG3xsrJTTjrxYc0=;
 b=m3FiDB59YBRREQ6NlvXQd54/elti28NpseZ81GgA8Z0YXk/3RP6PsyW3BKh9qMg1ml
 YEhVvr+WznSghPnJekrQ/JPXEsZdxt+wdqaKvOJOMuUMkRI5zI8NvnaUT/+Oaxw51cKh
 M4mvneDXxfEHZ44JEun/Ku+HutGpama6OtO7FPYcCCQRHHzEpMJxDVNx5apF/4xSgBXg
 sChGFDrOoaElD5BR/lF/pCftX1/hho3PcvdMNDUi0eFhjaO5nIhCcagcCOv5GcDOb2at
 r6/hlazIbo7Lo4NYIf4GigUa1CxRvbiLhyqw90X5cUFRuUBK6Xkx+ZErq0WToqML4Woj
 eEzA==
X-Gm-Message-State: AOAM531WtUTvfLFq2xuP5v1YhuzxCPVCoT3AlVZXRO9Yhp2vlztOsowb
 1gh9T6lq1mw7H6CZA5lWQW5hjQ==
X-Google-Smtp-Source: ABdhPJxFSsEENj2f42clRHkYCZJL0EzssIpyTz/h9r8xcU4UT5GLXUJutmKpTZ0eeI/HLouw1mBBKA==
X-Received: by 2002:a17:906:1591:: with SMTP id
 k17mr15722ejd.401.1622732613033; 
 Thu, 03 Jun 2021 08:03:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id hz10sm1621791ejc.40.2021.06.03.08.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:03:32 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v2 1/4] drm/gem-shmem-helper: Export drm_gem_shmem_funcs
Date: Thu,  3 Jun 2021 17:03:23 +0200
Message-Id: <20210603150326.1326658-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210603150326.1326658-1-daniel.vetter@ffwll.ch>
References: <20210603150326.1326658-1-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drivers which need to overwrite the drm_driver->gem_create_object hook
need this. Specifically vgem, which wants wc mode, but everything else
is fine as-is.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 3 ++-
 include/drm/drm_gem_shmem_helper.h     | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 6d625cee7a6a..4439004e62fe 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -24,7 +24,7 @@
  * allocated using anonymous pageable memory.
  */
 
-static const struct drm_gem_object_funcs drm_gem_shmem_funcs = {
+const struct drm_gem_object_funcs drm_gem_shmem_funcs = {
 	.free = drm_gem_shmem_free_object,
 	.print_info = drm_gem_shmem_print_info,
 	.pin = drm_gem_shmem_pin,
@@ -34,6 +34,7 @@ static const struct drm_gem_object_funcs drm_gem_shmem_funcs = {
 	.vunmap = drm_gem_shmem_vunmap,
 	.mmap = drm_gem_shmem_mmap,
 };
+EXPORT_SYMBOL(drm_gem_shmem_funcs);
 
 static struct drm_gem_shmem_object *
 __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 434328d8a0d9..b29667f2b8a3 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -106,6 +106,7 @@ struct drm_gem_shmem_object {
 #define to_drm_gem_shmem_obj(obj) \
 	container_of(obj, struct drm_gem_shmem_object, base)
 
+extern const struct drm_gem_object_funcs drm_gem_shmem_funcs;
 struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t size);
 void drm_gem_shmem_free_object(struct drm_gem_object *obj);
 
-- 
2.31.0

