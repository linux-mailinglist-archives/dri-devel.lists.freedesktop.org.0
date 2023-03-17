Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF336BE8FC
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 13:13:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 220E810EEF8;
	Fri, 17 Mar 2023 12:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5FE10EEF8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 12:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/WKUdMa+rFnar+m5MEJR5FApwgbeESggxlzzv31hPyg=; b=YUSpuvwvXF7w6JCAchHXh5anX7
 dDTByVK9yPgwGjG5XK9RP986Wre2Ezb4sKF75mJvDNaMByhSijDWSVpWvRq/V6wOeFSXnVCq94YWO
 4vrv8KZjQeiCIhezvtzi182KP7xUQsOTcNoPAlP1UYCEc7r4D/w7kfq+JNtR6nfwPv85VgONOx4j+
 paXk8FzlkZYTC7gZywj+Acgd1gyBbzgYFHxTBDFiP4ZrXfPgmyA/bco885ABF4D4db4j++88sObbl
 Vp/48QO2spyJn2jPDes9hDzfCNEWedBqn6zq9857QX6sv4d53OqN7Ajzpx5KPZoQefNQmDngKsAam
 J7ZjWCmQ==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pd8xf-00FrGz-9a; Fri, 17 Mar 2023 13:13:31 +0100
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
Subject: [RFC PATCH 6/9] drm/vgem: move IOCTLs numbers to enum
Date: Fri, 17 Mar 2023 09:12:10 -0300
Message-Id: <20230317121213.93991-7-mcanal@igalia.com>
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

Bindgen doesn't expand C macros, which makes DRM_IOCTL_VGEM_FENCE_ATTACH
and DRM_IOCTL_VGEM_FENCE_SIGNAL not accessible through the Rust
bindings. So, move the IOCTLs numbers to a enum, preserving the same
values and the same name. This won't produce any functional changes to
the UAPI and it will make it possible to use this UAPI in Rust.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 include/uapi/drm/vgem_drm.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/uapi/drm/vgem_drm.h b/include/uapi/drm/vgem_drm.h
index bf66f5db6da8..53ee3af0b25a 100644
--- a/include/uapi/drm/vgem_drm.h
+++ b/include/uapi/drm/vgem_drm.h
@@ -39,9 +39,6 @@ extern "C" {
 #define DRM_VGEM_FENCE_ATTACH	0x1
 #define DRM_VGEM_FENCE_SIGNAL	0x2
 
-#define DRM_IOCTL_VGEM_FENCE_ATTACH	DRM_IOWR( DRM_COMMAND_BASE + DRM_VGEM_FENCE_ATTACH, struct drm_vgem_fence_attach)
-#define DRM_IOCTL_VGEM_FENCE_SIGNAL	DRM_IOW( DRM_COMMAND_BASE + DRM_VGEM_FENCE_SIGNAL, struct drm_vgem_fence_signal)
-
 struct drm_vgem_fence_attach {
 	__u32 handle;
 	__u32 flags;
@@ -55,6 +52,12 @@ struct drm_vgem_fence_signal {
 	__u32 flags;
 };
 
+/* Note: this is an enum so that it can be resolved by Rust bindgen. */
+enum {
+	DRM_IOCTL_VGEM_FENCE_ATTACH	= DRM_IOWR(DRM_COMMAND_BASE + DRM_VGEM_FENCE_ATTACH, struct drm_vgem_fence_attach),
+	DRM_IOCTL_VGEM_FENCE_SIGNAL	= DRM_IOW(DRM_COMMAND_BASE + DRM_VGEM_FENCE_SIGNAL, struct drm_vgem_fence_signal),
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.39.2

