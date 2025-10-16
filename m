Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B118BE5852
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 23:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2909810EA9B;
	Thu, 16 Oct 2025 21:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Fb4M6qMT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CD810E382
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 21:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760649011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bSFtuYgH2BUE7b0Y6VbIld74OQ3SSNfLT2B5QuYLJi0=;
 b=Fb4M6qMTRhHtlNWe2oblOeLq7RfMPl6Wb+1xaCCl8a2tFnva0nMSeYo24PYbOAv0iBz4kJ
 u6sQAskRBwxuW5aidnHEUjnEr4Vf9/jpDh7nxee6IDNe6vKlWUjI4MPqBBTbX1ZZ/B5yJu
 ohZkDtxaTNxdDsZ8m/HadUihSTcOaVw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-605-37rPDTwoOeKXzM6ciyYhUQ-1; Thu,
 16 Oct 2025 17:10:06 -0400
X-MC-Unique: 37rPDTwoOeKXzM6ciyYhUQ-1
X-Mimecast-MFC-AGG-ID: 37rPDTwoOeKXzM6ciyYhUQ_1760649004
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E615018002F9; Thu, 16 Oct 2025 21:10:03 +0000 (UTC)
Received: from chopper.lan (unknown [10.22.80.252])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B519D300019F; Thu, 16 Oct 2025 21:10:01 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v4 0/9] Rust bindings for gem shmem + iosys_map
Date: Thu, 16 Oct 2025 17:08:13 -0400
Message-ID: <20251016210955.2813186-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ktZjLU_3ICO0tIVd2xkeyPWRN2ZaGfG2WUVdhEDLr8g_1760649004
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

This is the next version of the shmem backed GEM objects series
originally from Asahi, previously posted by Daniel Almeida.

One of the major changes in this patch series is a much better interface
around vmaps, which we acheive by introducing a new set of rust bindings
for iosys_map.

This patch applies to drm-rust-next with two additional commits from
drm-misc-next:

e3f4bdaf2c5b ("drm/gem/shmem: Extract drm_gem_shmem_init() from drm_gem_shmem_create()")
c08c931060c7 ("drm/gem/shmem: Extract drm_gem_shmem_release() from drm_gem_shmem_free()")

The previous version of this patch series can be found here:

  https://lwn.net/Articles/1035785/

Asahi Lina (2):
  rust: helpers: Add bindings/wrappers for dma_resv_lock
  rust: drm: gem: shmem: Add DRM shmem helper abstraction

Lyude Paul (7):
  Partially revert "rust: drm: gem: Implement AlwaysRefCounted for all
    gem objects automatically"
  rust/drm: Add gem::impl_aref_for_gem_obj!
  rust: drm: gem: Add raw_dma_resv() function
  rust: gem: Introduce DriverObject::Args
  rust: drm: gem: Introduce shmem::SGTable
  rust: Introduce iosys_map bindings
  rust: drm/gem: Add vmap functions to shmem bindings

 drivers/gpu/drm/nova/gem.rs     |   5 +-
 rust/bindings/bindings_helper.h |   3 +
 rust/helpers/dma-resv.c         |  13 +
 rust/helpers/drm.c              |  48 ++-
 rust/helpers/helpers.c          |   2 +
 rust/helpers/iosys_map.c        |  15 +
 rust/kernel/drm/gem/mod.rs      |  85 ++--
 rust/kernel/drm/gem/shmem.rs    | 427 ++++++++++++++++++++
 rust/kernel/iosys_map.rs        | 686 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   1 +
 10 files changed, 1259 insertions(+), 26 deletions(-)
 create mode 100644 rust/helpers/dma-resv.c
 create mode 100644 rust/helpers/iosys_map.c
 create mode 100644 rust/kernel/drm/gem/shmem.rs
 create mode 100644 rust/kernel/iosys_map.rs


base-commit: 1d5cffebd930d61588c32198f85fbe541ab97b8f
prerequisite-patch-id: ed9c46db079eee47b437d10234dac813197bc33e
prerequisite-patch-id: a2c6c70700e6a333d0b4daf97978fd2e07e24156
-- 
2.51.0

