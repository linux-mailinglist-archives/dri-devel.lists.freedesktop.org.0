Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 496DA8CA141
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 19:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A5D10E536;
	Mon, 20 May 2024 17:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZSfJyjAN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B7810E3E1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 17:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716225869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ieml4cQgLdOB6f1Tq+rgmDncA9spVWDVEosV1A4OpmA=;
 b=ZSfJyjANNpNEwnbiu0txkm4VuRZRVk5BcOU4WLrJJNrP1iF2DFG+oAy4y1wg3SUN7IflHa
 yW7M4ZU1FpeeFZ7ibED0iWkTxWFtVl59UhNqCI57PpWniAfXSHTGEGBY2prbFbTY7iX1rY
 hvT1ECR9vLkjXvOU5ahA/5P27peE4Yc=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-MkAuPxTON9GTG674C2DSyA-1; Mon, 20 May 2024 13:24:27 -0400
X-MC-Unique: MkAuPxTON9GTG674C2DSyA-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2e2ec0c8807so85763141fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 10:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716225866; x=1716830666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ieml4cQgLdOB6f1Tq+rgmDncA9spVWDVEosV1A4OpmA=;
 b=srRX0ogWGgR4eF7bkZA2z0i0Y2Mu6u235QF+uAO1D8KlZnji0hKakP8/p8iI92OGsz
 sc2LjfbGaUXyCkvx5nnb15h2WXTiRsfqqDE9yYGPC/jJc1c1+gSbqC5JbY9qMzGaq5b5
 fZwXuRcIeC9eXNqO10t/KoeTv968VIeaQUwf4MhzKUcz6xjRl9MAW87QeTuagKlBblqG
 5U7rWQJ0J5YtCcTHFNpxmHBlViYRkj1odqoseBjqwNbFjfeW9uifXLL+RvMnjuOWylZv
 9NY88TQp+josS+bWXBR+9ueuW+GcZvOBO3qd6kWFsDYqLC4xHbUGvu9Y9aW/sd81uSbl
 7QRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPNZRRqKEfFZjPIrkpb7QC5H5E6JJV+cCmTEjJ+J6heqe66ul20z/0FfJiVM93YdLmVpW5TvA7NI4WpuxaGlVCzWDfocxpHnV60JfkEWxw
X-Gm-Message-State: AOJu0YzUuHCw2u6yJayN1/MAnanK60K+IXkGdKjs0qchQI+SBzNq0b/7
 CrLyez0z5pOYo2HNHzYHYbocEABNAhcxQZWqLlPr9OYIM4gzvBMp3OcMD4+4YCdWo2s/U5LT0cv
 GOTK9ZhU3h/D8yLbvm7tw+f73xLyjkNvL9c1OdPNId20Ojqluv7dwl1UTG91dGDIS9A==
X-Received: by 2002:a2e:8654:0:b0:2e5:6add:e863 with SMTP id
 38308e7fff4ca-2e714547d3emr54063791fa.53.1716225865736; 
 Mon, 20 May 2024 10:24:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMpsCQkOJtvD6AnOHOUhRrq0Egu+U6M7/zg6S8BPHCPo8n8IiM12UdEpbE9vwd95n/xh9GOQ==
X-Received: by 2002:a2e:8654:0:b0:2e5:6add:e863 with SMTP id
 38308e7fff4ca-2e714547d3emr54063441fa.53.1716225865309; 
 Mon, 20 May 2024 10:24:25 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f87b2653bsm462686635e9.4.2024.05.20.10.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 10:24:24 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, fujita.tomonori@gmail.com,
 lina@asahilina.net, pstanner@redhat.com, ajanulgu@redhat.com,
 lyude@redhat.com, gregkh@linuxfoundation.org
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [RFC PATCH 4/8] rust: drm: implement `AsRef` for DRM device
Date: Mon, 20 May 2024 19:24:16 +0200
Message-ID: <20240520172422.181763-1-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520172059.181256-1-dakr@redhat.com>
References: <20240520172059.181256-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

Implement `AsRef<device::Device>` for `drm::device::Device` such that
`dev_*` print macros can be used conveniently.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/kernel/drm/device.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index f72bab8dd42d..aef947893dab 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -79,6 +79,14 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
     }
 }
 
+impl<T: drm::drv::Driver> AsRef<device::Device> for Device<T> {
+    fn as_ref(&self) -> &device::Device {
+        // SAFETY: `bindings::drm_device::dev` is valid as long as the DRM device itself is valid,
+        // which is guaranteed by the type invariant.
+        unsafe { device::Device::as_ref((*self.as_raw()).dev) }
+    }
+}
+
 // SAFETY: `Device` only holds a pointer to a C device, which is safe to be used from any thread.
 unsafe impl<T: drm::drv::Driver> Send for Device<T> {}
 
-- 
2.45.1

