Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 990D998B0DD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 01:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F7910E2FE;
	Mon, 30 Sep 2024 23:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QHb/SIgy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C99010E2BC
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 23:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727739436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5py8CHDHdUI1arKUsbT6Fs+1klEClD8saXMsGJd6CQw=;
 b=QHb/SIgy8pq9zW3H7U4AwfEXUqd0xUQTuM60UxPwd1/bHRN3SPsxOxtdIOdCdYbR1jDJE2
 lEHrOD9gASIzkNBuWlJUMfOxx/NtZSaXt976kPzx4qIaqHcJeRSH/rC+cYXgcB0Ye1PuJd
 e9AdChYmgZw1WIcpqa/iKJqgqcO9Kig=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-207-Bw0FwPucMzu3hcvzrY4UGQ-1; Mon,
 30 Sep 2024 19:37:12 -0400
X-MC-Unique: Bw0FwPucMzu3hcvzrY4UGQ-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown
 [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BE271193EB06; Mon, 30 Sep 2024 23:37:09 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.32.36])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A8A853003DEC; Mon, 30 Sep 2024 23:37:04 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@kernel.org>,
 mcanal@igalia.com, airlied@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Subject: [WIP RFC v2 00/35] Rust bindings for KMS + RVKMS
Date: Mon, 30 Sep 2024 19:09:43 -0400
Message-ID: <20240930233257.1189730-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi again! It's been a while since the last time I sent this, there's
still a good bit of work to do here but I think there's more then enough
to start reviewing the design I have so far :) - especially since I'll
be presenting this work at XDC2024 this year.  This patch series
introduces a WIP set of bindings for KMS drivers written in rust, based
on top of the work of quite a number of people:

* Garry Guo's #[unique] macro for #[vtable]
  (used for getting consistent memory addresses for C vtables, which we
  need for Opaque* object types)
* Andreas Hindborg's hrtimer bindings
  For vblank emulation in rvkms. Note: the version of the patch series
  used here is slightly older then the one he last sent upstream, but
  API wise it's more or less identical, with some additions I need to
  upstream.
* My IRQ bindings for rust + SpinlockIrq type
* Misc. Lock additions from me that need to be cleaned up + upstreamed
* Asahi Lina and María Canal's platform driver bindings + resource
  management patches
  I need to clean these up quite a bit and work on upstreaming these
* Asahi Lina and Danilo Krummrich's DRM device bindings for rust
* Asahi Lina's gem shmem bindings
* Some misc. DRM fixes from me

All of these dependencies are either in the process of currently being
upstreamed, or are planned by me to be upstreamed.

Since this is still a WIP, I've done my best to mark all of the patches
where I think there's still work to be done - along with leaving TODOs
in various comments, and in the commit descriptions for each WIP patch.
Some general TODOs series-wide to keep in mind here:

* I don't have code examples in the documentation yet, consider rvkms to
  be that example for the time being
* This compiles with a lot of warnings. I will hopefully have these
  cleaned up soon, but didn't have the time to sort through all of them
  since some of them are leftover from various dependencies we have
* Most of the documentation has been typed up, but don't be surprised if
  you find a few formatting issues (feel free to point them out though!)
* I need to go through and add appropriate SPDX copyright notices
* I need to make sure these compile independently. I think they should,
  but it's been a while since I checked
* I've left some currently unused bindings out, including:
  * CRTC commit_data equivalents
  * "Ephemeral data" - e.g. data in Crtc, Plane, and Connector objects
    that is embedded within the main modeset objects themselves but can
    only be accessed during an atomic commit.
  * Misc. DRM helpers (currently just a drm_rect port to rust)
* I still need to make the device registration in rvkms static,
  currently we do device probing/creation in the legacy fashion.

Because of the pretty substantial number of dependencies this patch
series relies on, I currently have a tag for this on my freedesktop
branch:

https://gitlab.freedesktop.org/lyudess/linux/-/commits/rvkms-xdc2024-base

Additionally, you can see the rest of the work I've done so far
(including the patches I omitted for this series) here:

https://gitlab.freedesktop.org/lyudess/linux/-/commits/rvkms-wip

And finally, I do have these patches applied on a branch also available
on my gitlab:

https://gitlab.freedesktop.org/lyudess/linux/-/commits/rvkms-xdc2024

And of course - since the last time I sent out these patches, I've split
things up quite a bit to make it easier to go through.

Cheers!

Lyude Paul (35):
  WIP: rust/drm: Add fourcc bindings
  WIP: rust: drm: Add traits for registering KMS devices
  rust: drm/kms/fbdev: Add FbdevShmem
  rust: drm/kms: Introduce the main ModeConfigObject traits
  rust: drm/kms: Add bindings for drm_connector
  rust: drm/kms: Add drm_plane bindings
  WIP: rust: drm/kms: Add drm_crtc bindings
  rust: drm/kms: Add bindings for drm_encoder
  WIP: rust: drm/kms: Add Connector.attach_encoder()
  rust: drm/kms: Add DriverConnector::get_mode callback
  rust: drm/kms: Add ConnectorGuard::add_modes_noedid()
  rust: drm/kms: Add ConnectorGuard::set_preferred_mode
  WIP: rust: drm/kms: Add OpaqueConnector and OpaqueConnectorState
  WIP: rust: drm/kms: Add OpaqueCrtc and OpaqueCrtcState
  WIP: rust: drm/kms: Add OpaquePlane and OpaquePlaneState
  rust: drm/kms: Add RawConnector and RawConnectorState
  rust: drm/kms: Add RawCrtc and RawCrtcState
  rust: drm/kms: Add RawPlane and RawPlaneState
  WIP: rust: drm/kms: Add OpaqueEncoder
  WIP: rust: drm/kms: Add drm_atomic_state bindings
  rust: drm/kms: Introduce DriverCrtc::atomic_check()
  rust: drm/kms: Add DriverPlane::atomic_update()
  rust: drm/kms: Add DriverPlane::atomic_check()
  rust: drm/kms: Add RawCrtcState::active()
  rust: drm/kms: Add RawPlaneState::crtc()
  WIP: rust: drm/kms: Add RawPlaneState::atomic_helper_check()
  rust: drm/kms: Add drm_framebuffer bindings
  rust: drm/kms: Add RawPlane::framebuffer()
  rust: drm/kms: Add DriverCrtc::atomic_begin() and atomic_flush()
  rust: drm/kms: Add DriverCrtc::atomic_enable() and atomic_disable()
  rust: drm: Add Device::event_lock()
  rust: drm/kms: Add Device::num_crtcs()
  WIP: rust: drm/kms: Add VblankSupport
  WIP: rust: drm/kms: Add Kms::atomic_commit_tail
  WIP: drm: Introduce RVKMS!

 drivers/gpu/drm/Kconfig            |   2 +
 drivers/gpu/drm/Makefile           |   1 +
 drivers/gpu/drm/rvkms/Kconfig      |   3 +
 drivers/gpu/drm/rvkms/Makefile     |   1 +
 drivers/gpu/drm/rvkms/connector.rs |  53 ++
 drivers/gpu/drm/rvkms/crtc.rs      | 253 ++++++++
 drivers/gpu/drm/rvkms/encoder.rs   |  33 +
 drivers/gpu/drm/rvkms/file.rs      |  22 +
 drivers/gpu/drm/rvkms/gem.rs       |  30 +
 drivers/gpu/drm/rvkms/output.rs    |  55 ++
 drivers/gpu/drm/rvkms/plane.rs     |  81 +++
 drivers/gpu/drm/rvkms/rvkms.rs     | 168 +++++
 rust/bindings/bindings_helper.h    |  11 +
 rust/helpers/drm/atomic.c          |  32 +
 rust/helpers/drm/drm.c             |   5 +
 rust/helpers/drm/vblank.c          |   8 +
 rust/kernel/drm/device.rs          |  25 +-
 rust/kernel/drm/drv.rs             |  45 +-
 rust/kernel/drm/fourcc.rs          | 127 ++++
 rust/kernel/drm/kms.rs             | 475 +++++++++++++++
 rust/kernel/drm/kms/atomic.rs      | 774 +++++++++++++++++++++++
 rust/kernel/drm/kms/connector.rs   | 831 +++++++++++++++++++++++++
 rust/kernel/drm/kms/crtc.rs        | 944 +++++++++++++++++++++++++++++
 rust/kernel/drm/kms/encoder.rs     | 303 +++++++++
 rust/kernel/drm/kms/fbdev.rs       |  51 ++
 rust/kernel/drm/kms/fbdev/shmem.rs |  33 +
 rust/kernel/drm/kms/framebuffer.rs |  58 ++
 rust/kernel/drm/kms/plane.rs       | 875 ++++++++++++++++++++++++++
 rust/kernel/drm/kms/vblank.rs      | 454 ++++++++++++++
 rust/kernel/drm/mod.rs             |   2 +
 30 files changed, 5747 insertions(+), 8 deletions(-)
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
 create mode 100644 rust/kernel/drm/kms/fbdev.rs
 create mode 100644 rust/kernel/drm/kms/fbdev/shmem.rs
 create mode 100644 rust/kernel/drm/kms/framebuffer.rs
 create mode 100644 rust/kernel/drm/kms/plane.rs
 create mode 100644 rust/kernel/drm/kms/vblank.rs

-- 
2.46.1

