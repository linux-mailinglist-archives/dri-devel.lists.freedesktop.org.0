Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB503A53E25
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45B110E85F;
	Wed,  5 Mar 2025 23:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EmmWW1fX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8601110E85F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741216153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ky7nPuh5GrbUWyu2d6ZrknkHnXgJb5d1NGj1huVerQ=;
 b=EmmWW1fXSFKG5HgcvjUSWjbE9Vra0igT9teu78UN3q7Z+YhnJyjplPkDSTR93ePIgDpXry
 na3o2o7Sf5ewVEZrF6MfC50jUlm8R3UGXngmJQyudzu26aOA1go8jcrkJpy2sYt8lMCCYM
 Ct+0jXI6RcGC8Y8SJfEkyQ1ewwV3Vvk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-460-dvQIoEmzNHGzBncmaxMr1w-1; Wed,
 05 Mar 2025 18:08:54 -0500
X-MC-Unique: dvQIoEmzNHGzBncmaxMr1w-1
X-Mimecast-MFC-AGG-ID: dvQIoEmzNHGzBncmaxMr1w_1741216132
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 66278180025E; Wed,  5 Mar 2025 23:08:52 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0B3BB300019E; Wed,  5 Mar 2025 23:08:48 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>, mcanal@igalia.com,
 Alice Ryhl <aliceryhl@google.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <sima@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org (open list)
Subject: [RFC v3 30/33] rust: drm/kms: Add Device::num_crtcs()
Date: Wed,  5 Mar 2025 17:59:46 -0500
Message-ID: <20250305230406.567126-31-lyude@redhat.com>
In-Reply-To: <20250305230406.567126-1-lyude@redhat.com>
References: <20250305230406.567126-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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

A binding for checking drm_device.num_crtcs. We'll need this in a moment
for vblank support, since setting it up requires knowing the number of
CRTCs that a driver has initialized.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/kms.rs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/rust/kernel/drm/kms.rs b/rust/kernel/drm/kms.rs
index 429ce28229c9e..36a0b4c4454ba 100644
--- a/rust/kernel/drm/kms.rs
+++ b/rust/kernel/drm/kms.rs
@@ -311,6 +311,17 @@ pub fn mode_config_lock(&self) -> ModeConfigGuard<'_, T> {
         // held throughout ModeConfigGuard's lifetime.
         ModeConfigGuard(self.mode_config_mutex().lock(), PhantomData)
     }
+
+    /// Return the number of registered CRTCs
+    #[inline]
+    pub fn num_crtcs(&self) -> u32 {
+        // SAFETY:
+        // * This can only be modified during the single-threaded context before registration, so
+        //   this is safe
+        // * num_crtc could be >= 0, but no less - so casting to u32 is fine (and better to prevent
+        //   errors)
+        unsafe { (*self.as_raw()).mode_config.num_crtc as u32 }
+    }
 }
 
 /// A modesetting object in DRM.
-- 
2.48.1

