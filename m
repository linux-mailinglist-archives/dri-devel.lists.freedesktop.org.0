Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD9F6BE8F9
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 13:13:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7202B10EEF1;
	Fri, 17 Mar 2023 12:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE8A10EEF0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 12:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hmWHlCmiofIyKwpwtriUZ+4xsHHrXTvx5Jjwzs3UrCw=; b=ZG8jDIQ/ZyfR4gr55yegtKZOhk
 h/qPeXAc5kJUB8mokOMDsC0gNKfFYHrKSBxp86ZO6euc8B/Uu7ngtj8UrCBp0BCgjDeysLqVSIDtr
 Kl4WFlW92pg+HFFBjXIRpgWgOWI7rvyhZDzP71l2OmtiYGRcBB3iqlu6y0kKcZnDU/lZ0FwUBXTjj
 RLimdGjJ40TAzlEwhwFFLboPwW0B6aMPsUF024UZ5uSOniqs5EZnCuCXlB16kJgu9iRKP2hNq0K6a
 jE58eM7QWYcWOirHwzvsaYxeCyrgeZDWlJC9LvvR3KKDK/vtgJGuXPBxZmVbGvNJIOJLOMaZefVgJ
 IbX9nB4Q==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pd8xG-00FrGz-8J; Fri, 17 Mar 2023 13:13:06 +0100
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
Subject: [RFC PATCH 2/9] rust: drm: gem: add method to return DmaResv from
 GEMObject
Date: Fri, 17 Mar 2023 09:12:06 -0300
Message-Id: <20230317121213.93991-3-mcanal@igalia.com>
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

A GEMObject, related to struct drm_gem_object, holds a pointer
to reservation object associated with the this GEM object. Therefore,
expose this reservation object through the DmaResv safe abstraction.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 rust/kernel/drm/gem/mod.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index c4a42bb2f718..dae95e5748a7 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -11,6 +11,7 @@ use alloc::boxed::Box;
 
 use crate::{
     bindings,
+    dma_resv::DmaResv,
     drm::{device, drv, file},
     error::{to_result, Result},
     prelude::*,
@@ -136,6 +137,12 @@ pub trait BaseObject: IntoGEMObject {
         self.gem_obj().size
     }
 
+    /// Returns the pointer to reservation object associated with this GEM object.
+    fn resv(&self) -> DmaResv {
+        // SAFETY: Every GEM object holds a reference to a reservation object
+        unsafe { DmaResv::from_raw(self.gem_obj().resv) }
+    }
+
     /// Sets the exportable flag, which controls whether the object can be exported via PRIME.
     fn set_exportable(&mut self, exportable: bool) {
         self.mut_gem_obj().exportable = exportable;
-- 
2.39.2

