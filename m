Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91557A53DE7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 00:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F6010E2AE;
	Wed,  5 Mar 2025 23:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="izWF8Wu3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8119410E2AE
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 23:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741215865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7i6VZtR9ncH+PyS1/fptP+oSURE1FTX3ATuRQ0Yy1d0=;
 b=izWF8Wu3kRAxp7e9Zv0u9wODqzw6cebwmjF/nMFd53+XvBOTE3AobzfIMGS6gtS5XyAJwW
 SPcEwAivaeM4WxmWENsOEqyzTGw156vMswldFocaKq0zIQ3FWdZNq44izaSSAOr2Ei+dOp
 ZaA86hhhafkOEDkrKeIq1roDWoqDEq0=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-111-uR6j-B1qOqqwMnOYXxZ1xA-1; Wed,
 05 Mar 2025 18:04:22 -0500
X-MC-Unique: uR6j-B1qOqqwMnOYXxZ1xA-1
X-Mimecast-MFC-AGG-ID: uR6j-B1qOqqwMnOYXxZ1xA_1741215860
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F323919560AF; Wed,  5 Mar 2025 23:04:18 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.81])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A887B300019E; Wed,  5 Mar 2025 23:04:13 +0000 (UTC)
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
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Subject: [RFC v3 00/33] Rust bindings for KMS + RVKMS
Date: Wed,  5 Mar 2025 17:59:16 -0500
Message-ID: <20250305230406.567126-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p3ba6l64NzGoF2u_8Aa9M1bjXkke-5qFqoUgtPuxeEs_1741215860
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

Hi! It's been a while but I think I'm quite happy with where this patch
series is at the moment. I've gone through most of the changes suggested
on the mailing list last, and have also gone and done quite a lot of
cleanup. Here's some of the big changes I've made across the patch
series:

* Cleaned up pretty much all of the WIP bits, I think I'm more confident with
  the design here now
* Limited the scope of the patches a bit more and removed:
  * Plane state iterators (I think people get the idea, we want these but
    there's nothing I have to use these just yet)
  * Some unused bindings for drm_format_info
* We use the faux driver subsytem now in response to some of Greg's comments
* All DRM types should have functions for converting from Opaque variants, and
  we now use a fancy macro for implementing this (this will make adding
  iterators in the future super easy as well)
* Lots of documentation cleanups
* Lots of safety comment cleanups
* Ensure type IDs for encoders, connectors, etc. are all fully defined using
  more fancy macro
* We now have special types for handling unregistered variants of mode objects,
  which fixes the last soundness issue I'm aware of.

There's a lot of other changes that I've noted in each patch as well. It's
entirely possible with how many changes that I missed some feedback along the
way, but I think I did a pretty thorough job of documenting all of the changes I
did made (thanks squash!).

The only thing I think is still up in the air is documentation - I've linked in
a few additional spots back to kernel headers/kernel documentation, but ideally
I would like us to be able to link back to the relevant C function for almost
every binding to try to slim down how much duplicate documentation we maintain.

This patch series still depends on the base branch that I've been maintaining as
we still have a handful of dependencies that I'm working on getting upstream,
you can find the base branch here:

https://gitlab.freedesktop.org/lyudess/linux/-/commits/rvkms-base

As well, you can find the previous version of this patch series here:

https://lore.kernel.org/dri-devel/C75763C3-A2A4-410F-934D-582B44A3B550@collabora.com/T/

ALSO!!!!!

Please help review it is ok if you don't know rust, or if you know rust but
don't know DRM. I honestly trust the DRM/rust community enough to know that
y'all will ask questions in earnest and I'm happy to do my best to answer them
:).

Lyude Paul (33):
  rust: drm: Add a small handful of fourcc bindings
  rust: drm: Add traits for registering KMS devices
  rust: drm/kms: Introduce the main ModeConfigObject traits
  rust: drm/kms: Add drm_connector bindings
  rust: drm/kms: Add drm_plane bindings
  rust: drm/kms: Add drm_crtc bindings
  rust: drm/kms: Add drm_encoder bindings
  rust: drm/kms: Add UnregisteredConnector::attach_encoder()
  rust: drm/kms: Add DriverConnector::get_mode callback
  rust: drm/kms: Add ConnectorGuard::add_modes_noedid()
  rust: drm/kms: Add ConnectorGuard::set_preferred_mode
  rust: drm/kms: Add RawConnector and RawConnectorState
  rust: drm/kms: Add RawPlane and RawPlaneState
  rust: drm/kms: Add OpaqueConnector and OpaqueConnectorState
  rust: drm/kms: Add OpaqueCrtc and OpaqueCrtcState
  rust: drm/kms: Add OpaquePlane and OpaquePlaneState
  rust: drm/kms: Add OpaqueEncoder
  rust: drm/kms: Add drm_atomic_state bindings
  rust: drm/kms: Add DriverCrtc::atomic_check()
  rust: drm/kms: Add DriverPlane::atomic_update()
  rust: drm/kms: Add DriverPlane::atomic_check()
  rust: drm/kms: Add RawCrtcState::active()
  rust: drm/kms: Add RawPlaneState::crtc()
  rust: drm/kms: Add RawPlaneState::atomic_helper_check()
  rust: drm/kms: Add drm_framebuffer bindings
  rust: drm/kms: Add RawPlane::framebuffer()
  rust: drm/kms: Add DriverCrtc::atomic_begin() and atomic_flush()
  rust: drm/kms: Add DriverCrtc::atomic_enable() and atomic_disable()
  rust: drm: Add Device::event_lock()
  rust: drm/kms: Add Device::num_crtcs()
  rust: drm/kms: Add VblankSupport
  rust: drm/kms: Add Kms::atomic_commit_tail
  drm: Introduce RVKMS!

 drivers/gpu/drm/Kconfig            |    2 +
 drivers/gpu/drm/Makefile           |    1 +
 drivers/gpu/drm/rvkms/Kconfig      |    3 +
 drivers/gpu/drm/rvkms/Makefile     |    1 +
 drivers/gpu/drm/rvkms/connector.rs |   55 ++
 drivers/gpu/drm/rvkms/crtc.rs      |  245 ++++++
 drivers/gpu/drm/rvkms/encoder.rs   |   31 +
 drivers/gpu/drm/rvkms/file.rs      |   19 +
 drivers/gpu/drm/rvkms/gem.rs       |   29 +
 drivers/gpu/drm/rvkms/output.rs    |   36 +
 drivers/gpu/drm/rvkms/plane.rs     |   73 ++
 drivers/gpu/drm/rvkms/rvkms.rs     |  140 ++++
 rust/bindings/bindings_helper.h    |   14 +
 rust/helpers/drm/atomic.c          |   32 +
 rust/helpers/drm/drm.c             |    5 +
 rust/helpers/drm/vblank.c          |    8 +
 rust/kernel/drm/device.rs          |   17 +-
 rust/kernel/drm/drv.rs             |   56 +-
 rust/kernel/drm/fourcc.rs          |   20 +
 rust/kernel/drm/gem/mod.rs         |    4 +
 rust/kernel/drm/gem/shmem.rs       |    4 +
 rust/kernel/drm/kms.rs             |  574 ++++++++++++++
 rust/kernel/drm/kms/atomic.rs      |  717 ++++++++++++++++++
 rust/kernel/drm/kms/connector.rs   | 1003 +++++++++++++++++++++++++
 rust/kernel/drm/kms/crtc.rs        | 1109 ++++++++++++++++++++++++++++
 rust/kernel/drm/kms/encoder.rs     |  413 +++++++++++
 rust/kernel/drm/kms/framebuffer.rs |   73 ++
 rust/kernel/drm/kms/plane.rs       | 1077 +++++++++++++++++++++++++++
 rust/kernel/drm/kms/vblank.rs      |  448 +++++++++++
 rust/kernel/drm/mod.rs             |    2 +
 30 files changed, 6202 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpu/drm/rvkms/Kconfig
 create mode 100644 drivers/gpu/drm/rvkms/Makefile
 create mode 100644 drivers/gpu/drm/rvkms/connector.rs
 create mode 100644 drivers/gpu/drm/rvkms/crtc.rs
 create mode 100644 drivers/gpu/drm/rvkms/encoder.rs
 create mode 100644 drivers/gpu/drm/rvkms/file.rs
 create mode 100644 drivers/gpu/drm/rvkms/gem.rs
 create mode 100644 drivers/gpu/drm/rvkms/output.rs
 create mode 100644 drivers/gpu/drm/rvkms/plane.rs
 create mode 100644 drivers/gpu/drm/rvkms/rvkms.rs
 create mode 100644 rust/helpers/drm/atomic.c
 create mode 100644 rust/helpers/drm/vblank.c
 create mode 100644 rust/kernel/drm/fourcc.rs
 create mode 100644 rust/kernel/drm/kms.rs
 create mode 100644 rust/kernel/drm/kms/atomic.rs
 create mode 100644 rust/kernel/drm/kms/connector.rs
 create mode 100644 rust/kernel/drm/kms/crtc.rs
 create mode 100644 rust/kernel/drm/kms/encoder.rs
 create mode 100644 rust/kernel/drm/kms/framebuffer.rs
 create mode 100644 rust/kernel/drm/kms/plane.rs
 create mode 100644 rust/kernel/drm/kms/vblank.rs

-- 
2.48.1

