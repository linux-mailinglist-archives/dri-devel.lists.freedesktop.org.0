Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9A1B1741E
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 17:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0B310E283;
	Thu, 31 Jul 2025 15:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c+4g5dFa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E3710E283
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 15:49:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 361A65C309E;
 Thu, 31 Jul 2025 15:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD85C4CEEF;
 Thu, 31 Jul 2025 15:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753976971;
 bh=EPnS+85CCZB3YSSlWabEu+epgy+Y4fGVAt01JDMlEv0=;
 h=From:To:Cc:Subject:Date:From;
 b=c+4g5dFaReZzRCC9XACkiV5iNmmll02yrMuGGFUYQuPCcV0sS7pZUXpJiXDN6S+CW
 cuIxLT/kFWJqKbW1QiL3cTnyqGP76pU4quzXb1UzPiPhfIHo56Au61R3fa58/wKloz
 h2FsqjHjQ7oRc/7DUezSMCA9vi37xGkB9d8HglbRAhsi1ygk33gqjeqffUHexMU221
 uZIetj/SQCfl5epNmmcGwE+BgU7mwPMYFf/LfmkmImPD3gmhCxFwQUA0KJ6HIMspNi
 azHCDjCG5dTOuwLnxFD7m00N4uvmg2iu46SGH3yFBSKIbAGLTeljQqRoX/SfyZHc4B
 c0xERPu52GP7A==
From: Danilo Krummrich <dakr@kernel.org>
To: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com,
 urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 0/4] Alloc and drm::Device fixes
Date: Thu, 31 Jul 2025 17:48:05 +0200
Message-ID: <20250731154919.4132-1-dakr@kernel.org>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
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

This patch series replaces aligned_size() with Kmalloc::aligned_layout(), which
is subsequently used to obtain a kmalloc() compatible Layout for
__drm_dev_alloc() in drm::Device::new().

It also contains two additional drm::Device fixes; the commits are based on
next-20250731.

Danilo Krummrich (4):
  rust: alloc: replace aligned_size() with Kmalloc::aligned_layout()
  rust: drm: ensure kmalloc() compatible Layout
  rust: drm: remove pin annotations from drm::Device
  rust: drm: don't pass the address of drm::Device to drm_dev_put()

 rust/kernel/alloc/allocator.rs | 30 ++++++++++++++++++------------
 rust/kernel/drm/device.rs      | 32 +++++++++++++++++++++++++-------
 2 files changed, 43 insertions(+), 19 deletions(-)


base-commit: 84b92a499e7eca54ba1df6f6c6e01766025943f1
-- 
2.50.0

