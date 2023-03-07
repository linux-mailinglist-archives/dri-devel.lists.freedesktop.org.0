Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5BA6AE262
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 15:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B5F10E4BE;
	Tue,  7 Mar 2023 14:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D620D10E4BE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 14:28:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: linasend@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 7AEE7426E8;
 Tue,  7 Mar 2023 14:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678199305;
 bh=PLNwTx966zByawYI9/x7zPg7nR2YAfsS2pH/0itkzOI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=NzazbWrvDmMavYRtui5Bhfs+u+J04jGyXpZVZtoYyF3xQqMtKMYT2GZx5PvDRsm/e
 w3R2yDcXKlby6CeAko/nDjv33/b+TqqkjCDjjxqGZoryIAT09hbYc5lBBtC20slhoX
 PM4NsdCzE/6fPFfIZtI5Y8URge/uP2kj2LHqzKFieNg37kJBpwG8nP7nzj51FgWN4C
 /0LfQa+Re1R9H4/EB2yMqoE8dZhcitUfrwcLo44JkslEVJTwgQ14i+xnO3BdHQL0/N
 jIi1IOSkF6gG/2F2gFlcWSoWYUqhIkf2J8wOoWwGFMv5Qm1HHamYDJ81VZKLDWzQLY
 SFVO72HCjH8eA==
From: Asahi Lina <lina@asahilina.net>
Date: Tue, 07 Mar 2023 23:25:39 +0900
Subject: [PATCH RFC 14/18] rust: drm: gem: Add set_exportable() method
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-rust-drm-v1-14-917ff5bc80a8@asahilina.net>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
In-Reply-To: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Luben Tuikov <luben.tuikov@amd.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678199191; l=1043;
 i=lina@asahilina.net; s=20230221; h=from:subject:message-id;
 bh=PLNwTx966zByawYI9/x7zPg7nR2YAfsS2pH/0itkzOI=;
 b=MjFE04ydpFUIDjxSVNQLI84A5BtCxwGQPMyQgPalsSvbYqggHyxs6a9C0P0EIP/PLFM9RVKhD
 fHOskSTk3+WA8ZFMMr/ZHXxfKAlDqdNPAOYtZsZ2Vxzc7VvQoLpGV/a
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=Qn8jZuOtR1m5GaiDfTrAoQ4NE1XoYVZ/wmt5YtXWFC4=
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, asahi@lists.linux.dev,
 Asahi Lina <lina@asahilina.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mary <mary@mary.zone>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-sgx@vger.kernel.org,
 Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This allows drivers to control whether a given GEM object is allowed to
be exported via PRIME to other drivers.
---
 rust/kernel/drm/gem/mod.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index e66bdef35c2e..196252a25b5a 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -135,6 +135,13 @@ pub trait BaseObject: IntoGEMObject {
         self.gem_ref().size
     }
 
+    /// Sets the exportable flag, which controls whether the object can be exported via PRIME.
+    fn set_exportable(&mut self, exportable: bool) {
+        // SAFETY: gem_obj() is valid per the type invariant, and this is safe to write if we
+        // are the only holder (mutable ref).
+        unsafe { (*self.gem_obj()).exportable = exportable };
+    }
+
     /// Creates a new reference to the object.
     fn reference(&self) -> ObjectRef<Self> {
         // SAFETY: Having a reference to an Object implies holding a GEM reference

-- 
2.35.1

