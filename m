Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9866BE8FB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 13:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A3B10EEF7;
	Fri, 17 Mar 2023 12:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E83710EEF7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 12:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VCIAue9sPRRBRwR7VXuYy3+00JJGub0y0AdfNvYDsPA=; b=LlhCielTqX7+UtDofy9HguL/oQ
 rqCFRRUsBa3vHPRLBW381bTj/ELcx4pJL9haBsXunGpE7cYlJqqeW2XYC80LXDySAVpZk5DZ1HstL
 t+ziIa7QJjb5yVVM/gOv4VJKGX5aDPp/35VurpFRucRtD+PSq747ANhcL4xVx7K7cViuKPOZPlPcG
 yh5TXOCjA10lGy1glK0X94AYMr2Bsizj1rnhX5fsJQEMAzMhkQHbxjRM2QlDSxPyknSJt6Siocd9O
 rYsCW3oayxUwJNWvk4EoWZGGecUjlmGlCPbgflD8plm957/jwaRqnGgmforuBwuKz05cTPf3aA8fo
 56To5DxQ==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pd8xZ-00FrGz-7y; Fri, 17 Mar 2023 13:13:25 +0100
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
Subject: [RFC PATCH 5/9] rust: drm: gem: shmem: set map_wc on
 gem_create_object callback
Date: Fri, 17 Mar 2023 09:12:09 -0300
Message-Id: <20230317121213.93991-6-mcanal@igalia.com>
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

Some drivers use the gem_create_object callback to define the mapping of
the object write-combined (map_wc). Currently, the DRM Rust abstractions
doesn't allow such operation. So, add a constant to the DriverObject trait
to allow drivers to set map_wc on the gem_create_object callback. By
default, the constant returns false, which is the shmem default value.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 rust/kernel/drm/gem/shmem.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 8f17eba0be99..d6c56b3cfa71 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -24,6 +24,9 @@ use gem::BaseObject;
 pub trait DriverObject: gem::BaseDriverObject<Object<Self>> {
     /// Parent `Driver` for this object.
     type Driver: drv::Driver;
+
+    /// Define the map object write-combined
+    const MAP_WC: bool = false;
 }
 
 // FIXME: This is terrible and I don't know how to avoid it
@@ -110,6 +113,8 @@ unsafe extern "C" fn gem_create_object<T: DriverObject>(
     let new: &mut Object<T> = unsafe { &mut *(p as *mut _) };
 
     new.obj.base.funcs = &Object::<T>::VTABLE;
+    new.obj.map_wc = <T>::MAP_WC;
+
     &mut new.obj.base
 }
 
-- 
2.39.2

