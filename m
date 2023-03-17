Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0355C6BE8F6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 13:13:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2261D10EEEA;
	Fri, 17 Mar 2023 12:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B1D10EEEA
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 12:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nTYBkYCblFkwBHgG9q0aOgj8flBeXdfCK2fgcYiRCHg=; b=VO5QbHxcoCf19WVbI+4RRVA1Kk
 Pmhp5LJrvnuz+PKv/gLafDwUHMYckIGupYpgJOJqLy2aU3dsSVRy8PBhMvJVSKz/g/1lvgLl0LcLy
 o3ofU9L+FxZ+T14eS1fUHlwHLUNVEjQqeIh4o6g2PzJR1a9+MxN6tibO6TzPRNRKNyC3wWLwNhnLL
 3fFhLOVOv83EMl1Y/2UDVBOOEvL/AT4Siarjljhyn/3qtLOCt+0WE2XEbFDevK6j881fSO8pDUzH2
 FscMwQaVULQ68T/067DssNa/aDwwfrct85h0dbij57W6BvMkeQn8acrQacFZtduk2mML9MneFSyAp
 ZFD0IdfQ==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pd8x4-00FrGz-UD; Fri, 17 Mar 2023 13:12:55 +0100
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
Subject: [RFC PATCH 0/9] Rust version of the VGEM driver
Date: Fri, 17 Mar 2023 09:12:04 -0300
Message-Id: <20230317121213.93991-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
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

This is my first take on using the DRM Rust abstractions [1] to convert a DRM
driver, written originally in C, to Rust. This patchset consists of a conversion
of the vgem driver to a DRM Rust driver. This new driver has the exactly same
functionalities of the original C driver, but takes advantages of all the Rust
features.

These patches are based primarily on the Rust DRM abstractions [1], sent as a
RFC to the mailing list last week. Also, it depends on some Device abstractions
[2] and on the Timer abstraction [3] developed by Boqun Feng.

This patchset introduces some changes to the DRM abstractions proposed in [1]
and also introduces a new abstraction to DMA reservation. Finally, introduces a
fully functional vgem driver written in Rust.

* Patch #1: Introduces a safe abstraction to the DMA Reservation.
* Patch #2 - #5: Introduces some increments to the DRM abstractions, adding
  methods and exposing attributes.
* Patch #6: Makes an adaptation to the UAPI, in order to be interpreted by bindgen.
* Patch #7 - #8: Introduces the vgem driver.
* Patch #9: Makes it possible to use the kernel::declare_drm_ioctls! macro.

The driver was tested with IGT, using the tests `vgem_basic`, `vgem_slow` and
`dmabuf_sync_file`. Also, I incremented some invalid tests to `vgem_basic` [4]
to assure the proper error handling of the driver.

A branch with all the dependencies and ready for compilation is available at
[5].

Note that patch #8 is necessary to deal with the current
kernel::declare_drm_ioctls! macro. Currently, the macro
kernel::declare_drm_ioctls! considers that the IOCTLs are in the right order and
there are no gaps, which is not true for vgem. The vgem IOCTLs starts at 0x01,
so there is a gap for IOCTL 0x00. To bypass this problem I'm currently using a
dummy IOCTL as IOCTL 0x00, but this solution should be temporary. I would love
to hear suggestions on how to address this problem.

Any suggestions and SAFETY reviews are welcomed!

[1] https://lore.kernel.org/dri-devel/20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net/T/
[2] https://github.com/Rust-for-Linux/linux/pull/982
[3] https://github.com/fbq/linux-rust/commit/c31a2a3ce7420b43bda2c6f1b43227baf0d13661
[4] https://patchwork.freedesktop.org/series/114912/
[5] https://github.com/mairacanal/linux/tree/vgem/wip-dma

Best Regards,
- Maíra Canal

Maíra Canal (9):
  rust: dma_resv: add DMA Reservation abstraction
  rust: drm: gem: add method to return DmaResv from GEMObject
  rust: dma_fence: add method to return an indication if the fence is signaled
  rust: dma_fence: expose the fence's seqno publically
  rust: drm: gem: shmem: set map_wc on gem_create_object callback
  drm/vgem: move IOCTLs numbers to enum
  drm/rustgem: implement a Rust version of VGEM
  drm/rustgem: implement timeout to prevent hangs
  drm/rustgem: create dummy IOCTL with number 0x00

 drivers/gpu/drm/Kconfig          |  11 +++
 drivers/gpu/drm/Makefile         |   1 +
 drivers/gpu/drm/rustgem/Makefile |   3 +
 drivers/gpu/drm/rustgem/fence.rs |  83 ++++++++++++++++++
 drivers/gpu/drm/rustgem/file.rs  | 143 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/rustgem/gem.rs   |  31 +++++++
 drivers/gpu/drm/rustgem/vgem.rs  | 105 +++++++++++++++++++++++
 include/uapi/drm/vgem_drm.h      |  11 ++-
 rust/bindings/bindings_helper.h  |   2 +
 rust/helpers.c                   |  25 ++++++
 rust/kernel/dma_fence.rs         |  12 +++
 rust/kernel/dma_resv.rs          |  75 ++++++++++++++++
 rust/kernel/drm/gem/mod.rs       |   7 ++
 rust/kernel/drm/gem/shmem.rs     |   5 ++
 rust/kernel/lib.rs               |   1 +
 15 files changed, 513 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/rustgem/Makefile
 create mode 100644 drivers/gpu/drm/rustgem/fence.rs
 create mode 100644 drivers/gpu/drm/rustgem/file.rs
 create mode 100644 drivers/gpu/drm/rustgem/gem.rs
 create mode 100644 drivers/gpu/drm/rustgem/vgem.rs
 create mode 100644 rust/kernel/dma_resv.rs

-- 
2.39.2

