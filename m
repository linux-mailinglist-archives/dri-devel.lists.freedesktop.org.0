Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D76B3C51D
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 00:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480FA10E21C;
	Fri, 29 Aug 2025 22:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ccKGM/7o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2041210E21C
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 22:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756507292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tgn5qYQScec3mupnI3D3axlii7zkUPK1g6wgPdQSWcY=;
 b=ccKGM/7oi0WVk1Y7ZqmYeu2pIBLAlb/IzFZj2s9RIzp/z4L7sQuCJT2PbZhWjhvA6B9naY
 VqXFHE5/xpOsqIyEUd50aqgTKd83yrgP+dEhVu7US6F8HBB/TVhldZ/AoSsy0RY6fS4d2J
 a7kYFiTVLuYWG8lXVY9ezytBiI9aknI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-18-3dw07UJoO_-yDWLVlt_gtw-1; Fri,
 29 Aug 2025 18:41:29 -0400
X-MC-Unique: 3dw07UJoO_-yDWLVlt_gtw-1
X-Mimecast-MFC-AGG-ID: 3dw07UJoO_-yDWLVlt_gtw_1756507287
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 40A2319560B2; Fri, 29 Aug 2025 22:41:27 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.80.78])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 559311800447; Fri, 29 Aug 2025 22:41:23 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org (open list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b), 
 linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v3 00/14] Rust abstractions for shmem-backed GEM objects
Date: Fri, 29 Aug 2025 18:35:15 -0400
Message-ID: <20250829224116.477990-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
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

This is the next version of the shmem backed GEM objects series
originally from Asahi, previously posted by Daniel Almeida. Along with
bindings for shmem backed GEM objects.

This applies on top of Danilo and Abdiel's sgtable patches:

https://lkml.org/lkml/2025/8/28/1018

Asahi Lina (2):
  rust: helpers: Add bindings/wrappers for dma_resv_lock
  rust: drm: gem: shmem: Add DRM shmem helper abstraction

Lyude Paul (12):
  rust: drm: gem: Simplify use of generics
  rust: drm: gem: Add DriverFile type alias
  rust: drm: gem: Drop Object::SIZE
  rust: drm: gem: Support driver-private GEM object types
  rust: drm: gem: Add raw_dma_resv() function
  drm/gem/shmem: Extract drm_gem_shmem_init() from
    drm_gem_shmem_create()
  drm/gem/shmem: Extract drm_gem_shmem_release() from
    drm_gem_shmem_free()
  rust: gem: Introduce DriverObject::Args
  rust: drm: gem: Introduce SGTableRef
  rust: Add dma_buf stub bindings
  rust: drm: gem: Add export() callback
  rust: drm: gem: Add BaseObject::prime_export()

 drivers/gpu/drm/drm_gem_shmem_helper.c |  98 +++++--
 drivers/gpu/drm/nova/driver.rs         |   8 +-
 drivers/gpu/drm/nova/gem.rs            |  15 +-
 include/drm/drm_gem_shmem_helper.h     |   2 +
 rust/bindings/bindings_helper.h        |   3 +
 rust/helpers/dma-resv.c                |  13 +
 rust/helpers/drm.c                     |  48 +++-
 rust/helpers/helpers.c                 |   1 +
 rust/kernel/dma_buf.rs                 |  39 +++
 rust/kernel/drm/device.rs              |  17 +-
 rust/kernel/drm/driver.rs              |   5 +-
 rust/kernel/drm/gem/mod.rs             | 274 +++++++++++++++----
 rust/kernel/drm/gem/shmem.rs           | 365 +++++++++++++++++++++++++
 rust/kernel/lib.rs                     |   1 +
 14 files changed, 783 insertions(+), 106 deletions(-)
 create mode 100644 rust/helpers/dma-resv.c
 create mode 100644 rust/kernel/dma_buf.rs
 create mode 100644 rust/kernel/drm/gem/shmem.rs


base-commit: 09f90256e8902793f594517ef440698585eb3595
prerequisite-patch-id: 0e1b1f9a665317ff569a37df6ff49cd1880b04f8
prerequisite-patch-id: 178b864e6d1b88ee299dcc05d1a7a4c89ec7ed51
prerequisite-patch-id: 7f72c4bfd0e5f50b6d2f8ce96751782894a3ba81
prerequisite-patch-id: 62fa6de7d3ae99dc54c092087bd716e6749545fd
prerequisite-patch-id: 3d14d56ca93b0831837aa26b802100a250adeac6
prerequisite-patch-id: 7a12f4b0e7588874ce589b41b70671dc261b9468
prerequisite-patch-id: c44763ec35c4e4431e769df088b98424cbddf7df
prerequisite-patch-id: a9e008c179b1c2fbe76654a191e5018880383d49
prerequisite-patch-id: 1e9ce500ce25188c575be608cd39e15a59836f83
prerequisite-patch-id: 39ca3a210a6c365434924c07a0c98a074eb73b97
prerequisite-patch-id: a747e05834cdb8b8f727e1f7c8b110c636cadab8
prerequisite-patch-id: 24833689bdecd3fc7a604e13bfe203ccd2fca6f0
-- 
2.50.0

