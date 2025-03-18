Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D7BA67D2F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 20:38:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D5110E03C;
	Tue, 18 Mar 2025 19:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="ISq/xUWV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F7110E0B7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 19:38:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742325776; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=YN3yBo7fSY6NtgndMEoltJs5TFH03pgIF/PKO1UCJqseBIzZE/CIaPrQKLxSTFLA0x/hIcAsZmHuyoKYSd4yhJYu9DsbHoG0wYA/ERz4RFJwJVeIqBSLmfAU1BxTzsVgRn7pJ3zXdIZ8WutcpFLIBgm4cuYkx7tqY2mQODkN+ZY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742325776;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=rz6R4RVDyxCD4ijy0dJnSvOrF4NkRk+ghOw9yCNP7Hg=; 
 b=CbT7wfUmf5zuX6X7gMqj9ZTv65dSM3aFyxkp5P1jjfC1g1kVVPkgjbqZn5cN9jHIYGRyJVtYEgstwSCtzkXn9LFShMhqJdxvkqbuXKxRPh7uiTcFVstMFlD9KT+IsJUfuxpbrKZjz0YWjaNF53pFZOmb4VMSsfQuBbsPtlOEClY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742325776; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=rz6R4RVDyxCD4ijy0dJnSvOrF4NkRk+ghOw9yCNP7Hg=;
 b=ISq/xUWVsYkrLhJ7g4KMNX6TvL5jONcig7h+YUaygwRPZPjSMlEzT8NfFGaiOnk6
 +hL+BDFdfvsX7O6cvfe8WtBMu4Y3SES5tsC6BNKmT/1Sjb4OtNA5fDZ+Y6bmWGJLhJa
 xrAWlRFBeVNfxzu+t3p80FPJXPh7WsWYXlaigOk0=
Received: by mx.zohomail.com with SMTPS id 174232577443424.905915853504553;
 Tue, 18 Mar 2025 12:22:54 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH 0/7] Rust abstractions for shmem-backed GEM objects
Date: Tue, 18 Mar 2025 16:22:34 -0300
Message-Id: <20250318-drm-gem-shmem-v1-0-64b96511a84f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPrH2WcC/yWMQQqDMBBFryKzbsCMmai9SnEx0YlmEW0TWwri3
 Rvq5sP78N4BWVKQDPfqgCSfkMO2FtC3CsaF11lUmAoD1kh1ozs1pahmiSovsWznnDWts9bpEYr
 zTOLD9997DBcneb1Ldr9OcJxFjVuMYb9XdYvIjTdeExliw0h+0mic7YmYSrvvBBuG4Tx/+sGlE
 KsAAAA=
X-Change-ID: 20250318-drm-gem-shmem-8bb647b66b1c
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>, 
 Asahi Lina <lina@asahilina.net>, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External
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

Hi all,

This series picks up the work carried out by the Asahi project for
shmem-backed GEM objects. This initial version is meant to kickstart the
discussion on this topic, as the bindings will be clearly needed by Tyr
and other drivers.

It has been tested on both AGX and Tyr successfully.

I did provide a minor fix for a missing #include, but I did not touch
this code otherwise so far. Even the rebase was done by Janne Grunnau.

Applies on top of

commit 0722a3f4f15545a4a25fd124b6955a5b6498e23a
Author: Danilo Krummrich <dakr@kernel.org>
Date:   Tue Oct 15 17:19:27 2024 +0200

    nova: add initial driver stub
    

---
Asahi Lina (7):
      drm/shmem-helper: Add lockdep asserts to vmap/vunmap
      drm/gem-shmem: Export VM ops functions
      rust: helpers: Add bindings/wrappers for dma_resv_lock
      rust: drm: gem: shmem: Add DRM shmem helper abstraction
      drm/gem: Add a flag to control whether objects can be exported
      rust: drm: gem: Add set_exportable() method
      rust: drm: gem: shmem: Add share_dma_resv() function

 drivers/gpu/drm/drm_gem.c              |   1 +
 drivers/gpu/drm/drm_gem_shmem_helper.c |  13 +-
 drivers/gpu/drm/drm_prime.c            |   5 +
 include/drm/drm_gem.h                  |   8 +
 include/drm/drm_gem_shmem_helper.h     |   3 +
 rust/bindings/bindings_helper.h        |   4 +
 rust/helpers/dma-resv.c                |  13 +
 rust/helpers/drm.c                     |  46 ++++
 rust/helpers/helpers.c                 |   2 +
 rust/helpers/scatterlist.c             |  13 +
 rust/kernel/drm/gem/mod.rs             |  15 ++
 rust/kernel/drm/gem/shmem.rs           | 457 +++++++++++++++++++++++++++++++++
 12 files changed, 577 insertions(+), 3 deletions(-)
---
base-commit: 0722a3f4f15545a4a25fd124b6955a5b6498e23a
change-id: 20250318-drm-gem-shmem-8bb647b66b1c

Best regards,
-- 
Daniel Almeida <daniel.almeida@collabora.com>

