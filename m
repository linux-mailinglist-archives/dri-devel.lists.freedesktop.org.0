Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 564DFC41725
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 20:32:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D15810E002;
	Fri,  7 Nov 2025 19:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RCFnnEzm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D092210E002
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 19:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762543940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=+M/hTarl6Axuw1Mn1ciL73V74gFHO/xeAJFqO2OKURk=;
 b=RCFnnEzmN4A2Kq0fDRyvla8OHeyF6shzNghitEFK+nfFNj5pp1xnq2EU8Hz3Cc34Usu/TX
 1yVHs1RbrusgT6KNWj4T7KlQTtfV0APJZ11tefCRWfm6eDxD4/xR2LLbXFjN5p9yyNM9Pd
 7VzlDGVTLc5Lw5PzLZ5kmHVxUB39AK4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-629-eWXdUic0OYy9LQDsX6DXnQ-1; Fri,
 07 Nov 2025 14:32:17 -0500
X-MC-Unique: eWXdUic0OYy9LQDsX6DXnQ-1
X-Mimecast-MFC-AGG-ID: eWXdUic0OYy9LQDsX6DXnQ_1762543935
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0549F195606F; Fri,  7 Nov 2025 19:32:15 +0000 (UTC)
Received: from chopper.lan (unknown [10.22.81.9])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9DD761945110; Fri,  7 Nov 2025 19:32:11 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 0/2] rust: drm: Introduce DeviceCtx
Date: Fri,  7 Nov 2025 14:23:52 -0500
Message-ID: <20251107193204.398657-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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

One of the unsolved issues we still have with the rust DRM bindings is
the ability to limit certain Device operations to contexts where we can
guarantee that a Device has been fully initialized and registered with
userspace, or vice-versa (e.g. must be unregistered). This is a bit of
an issue for KMS bindings, since we need to be able to limit the
creation of static resources like CRTCs such that they only happen
before userspace registration.

While the previous solution for this that I had was simply not exposing
drm::Device at all until the device has been registered with userspace,
unfortunately this isn't enough since:

* As we found out with Tyr, drivers occasionally need to be able to
  create GEM objects before device registration
* We would still need to be able to handle KMS callbacks which could be
  invoked after KMS init but before userspace registration (not handled
  in this series specifically, but DeviceCtx will be required for
  handling this).

This patch series provides a pretty nice solution to this, by
implementing a very similar solution to kernel::device::DeviceCtx:
introducing our own DeviceCtx type state. In the future, we'll likely
add a DeviceCtx state specifically for KMS devices that aren't
guaranteed to be registered with userspace.

Lyude Paul (2):
  rust: drm: Introduce DeviceCtx
  rust/drm/gem: Use DeviceCtx with GEM objects

 drivers/gpu/drm/nova/driver.rs |  10 +-
 drivers/gpu/drm/nova/gem.rs    |  11 +-
 drivers/gpu/drm/tyr/driver.rs  |  15 ++-
 drivers/gpu/drm/tyr/gem.rs     |   3 +-
 rust/kernel/drm/device.rs      | 181 ++++++++++++++++++++++++++-------
 rust/kernel/drm/driver.rs      |  37 +++++--
 rust/kernel/drm/gem/mod.rs     |  66 ++++++++----
 rust/kernel/drm/mod.rs         |   4 +
 8 files changed, 244 insertions(+), 83 deletions(-)


base-commit: ade19c5060dfa39b84a9475a4a6b05e2a8a2b3ac
-- 
2.51.1

