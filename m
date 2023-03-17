Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CE26BE900
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 13:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F341510EF07;
	Fri, 17 Mar 2023 12:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9D710EF07
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 12:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3MBGRyVcfZD+2SmE5BBIh6mlfln4sjziRqqN19lxLOA=; b=FTtyXD8St5MctcW02ez1YiXt8o
 P+y/eYpxKR51E0UxTHtaV8HV8cjjbly+jKpJ5+GePpclczZI4GunG4jT8Q2M9Wl/YLDQVK+k1a+Bj
 YrKAuUn15K95vTltUzUlqbY1Xy9l03bgYlAA5qAQo/x2TESecak2b+4SHIJoeymo5m60t9Veq+f5K
 WN64aM0dvksfpxGuJuISAewHmlaReZImsWxyELVIc3Q3OiLs1JAkeoTuZ9xVKjkHI2WAQKCPV8EXV
 /aKqKazL8v9v/pGBKj7LFAStm2sOTNo3mgmDsJjuyy80T6+OIv+HQuJnDOixUvTwhDIoMLhXSFLfS
 X81v2rbw==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pd8xw-00FrGz-JZ; Fri, 17 Mar 2023 13:13:49 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Asahi Lina <lina@asahilina.net>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: [RFC PATCH 9/9] drm/rustgem: create dummy IOCTL with number 0x00
Date: Fri, 17 Mar 2023 09:12:13 -0300
Message-Id: <20230317121213.93991-10-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230317121213.93991-1-mcanal@igalia.com>
References: <20230317121213.93991-1-mcanal@igalia.com>
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to declare IOCTLs with the current Rust abstractions, we use
the kernel::declare_drm_ioctls! macro. This macro considers that the
IOCTLs are in the right order and there are no gaps. This isn't the case
for vgem, which start the IOCTLs with 0x01, instead of 0x00.

With the intention to use the kernel::declare_drm_ioctls! macro, create
a dummy IOCTL with number 0x00, that returns EINVAL.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/rustgem/file.rs | 8 ++++++++
 drivers/gpu/drm/rustgem/vgem.rs | 1 +
 include/uapi/drm/vgem_drm.h     | 4 ++++
 3 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/rustgem/file.rs b/drivers/gpu/drm/rustgem/file.rs
index a3714e8ca206..f26b74204361 100644
--- a/drivers/gpu/drm/rustgem/file.rs
+++ b/drivers/gpu/drm/rustgem/file.rs
@@ -27,6 +27,14 @@ impl drm::file::DriverFile for File {
 }
 
 impl File {
+    pub(crate) fn dummy(
+        _device: &VgemDevice,
+        _data: &mut bindings::drm_vgem_dummy,
+        _file: &DrmFile,
+    ) -> Result<u32> {
+        Err(EINVAL)
+    }
+
     /// vgem_fence_attach_ioctl (DRM_IOCTL_VGEM_FENCE_ATTACH):
     ///
     /// Create and attach a fence to the vGEM handle. This fence is then exposed
diff --git a/drivers/gpu/drm/rustgem/vgem.rs b/drivers/gpu/drm/rustgem/vgem.rs
index c2fc55bb39bd..64e8f1c2cbca 100644
--- a/drivers/gpu/drm/rustgem/vgem.rs
+++ b/drivers/gpu/drm/rustgem/vgem.rs
@@ -55,6 +55,7 @@ impl drv::Driver for VgemDriver {
     const FEATURES: u32 = drv::FEAT_GEM | drv::FEAT_RENDER;
 
     kernel::declare_drm_ioctls! {
+        (VGEM_DUMMY, drm_vgem_dummy, ioctl::RENDER_ALLOW, file::File::dummy),
         (VGEM_FENCE_ATTACH, drm_vgem_fence_attach, ioctl::RENDER_ALLOW, file::File::attach),
         (VGEM_FENCE_SIGNAL, drm_vgem_fence_signal, ioctl::RENDER_ALLOW, file::File::signal),
     }
diff --git a/include/uapi/drm/vgem_drm.h b/include/uapi/drm/vgem_drm.h
index 53ee3af0b25a..1348f8e819ed 100644
--- a/include/uapi/drm/vgem_drm.h
+++ b/include/uapi/drm/vgem_drm.h
@@ -36,9 +36,12 @@ extern "C" {
 /* Please note that modifications to all structs defined here are
  * subject to backwards-compatibility constraints.
  */
+#define DRM_VGEM_DUMMY		0x0
 #define DRM_VGEM_FENCE_ATTACH	0x1
 #define DRM_VGEM_FENCE_SIGNAL	0x2
 
+struct drm_vgem_dummy { };
+
 struct drm_vgem_fence_attach {
 	__u32 handle;
 	__u32 flags;
@@ -54,6 +57,7 @@ struct drm_vgem_fence_signal {
 
 /* Note: this is an enum so that it can be resolved by Rust bindgen. */
 enum {
+	DRM_IOCTL_VGEM_DUMMY		= DRM_IOW(DRM_COMMAND_BASE + DRM_VGEM_DUMMY, struct drm_vgem_dummy),
 	DRM_IOCTL_VGEM_FENCE_ATTACH	= DRM_IOWR(DRM_COMMAND_BASE + DRM_VGEM_FENCE_ATTACH, struct drm_vgem_fence_attach),
 	DRM_IOCTL_VGEM_FENCE_SIGNAL	= DRM_IOW(DRM_COMMAND_BASE + DRM_VGEM_FENCE_SIGNAL, struct drm_vgem_fence_signal),
 };
-- 
2.39.2

