Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C874CF6DF7
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 07:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A516F10E48D;
	Tue,  6 Jan 2026 06:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OFvHmsfo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F7F10E48D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 06:19:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D2AE444258;
 Tue,  6 Jan 2026 06:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB9BC19421;
 Tue,  6 Jan 2026 06:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767680377;
 bh=imiLwEBaT993UVCaeMAOWgSjk7AYRckTPdhPaGrRzzA=;
 h=From:Subject:Date:To:Cc:From;
 b=OFvHmsfoZrX3XS1pM8QjY435dwDTtavvTIbN77DCujkcICcVGvdc+G8O2cO6n9LOr
 8EaL/XkeYMYcjluJAPDBLQWTxUiN2VRQ1p9F8jgbihRO6TcRAV6ldQ66u1RBqj/D5O
 0cb8He8odFPEVV6mMvSBxh4q78RH/5cSEXEnB1jtlQmmK5dO16xY1McE+RvZEJYME8
 2KkNUOg6HpeNoSfhGi4NKMSTvKegKNQdKphyaOAkKW3DcaCHpk8xNhrLpaLd1V/oZm
 gaUsSFS29JuzJqWNwYm4o4Dn0ieTno/2MMErXXIEu/JOztxpPUJoegoIhV9I5cA+KD
 UxoNV27glPF5A==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/2] drm/panic: Avoid crash from invalid
 CONFIG_DRM_PANIC_SCREEN values
Date: Mon, 05 Jan 2026 23:19:25 -0700
Message-Id: <20260105-drm_panic-handle-invalid-drm_panic_screen-v1-0-55228bd4b0f8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG2pXGkC/0WN0QrCMAwAf2Xk2UJb5qT+isioadTIjCPRIYz9u
 3U++Hgc3M1gpEwG+2YGpYmNH1IhbBrAa5YLOS6VIfrY+eC3rui9H7MwuqrLUL1MeeDyF72hEon
 zaUdtohiwTVB7o9KZ3+vrcPyxvU43wud3AMvyAVXZkVmNAAAA
X-Change-ID: 20260105-drm_panic-handle-invalid-drm_panic_screen-097e49e21c49
To: Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112; i=nathan@kernel.org;
 h=from:subject:message-id; bh=imiLwEBaT993UVCaeMAOWgSjk7AYRckTPdhPaGrRzzA=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJkxK8sdH8VYOQo2aK2Kaphb/uTEQm7m//w7l/wXjlnQO
 b9shll7RykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZjImjSGP5xGa900t5ybvLn6
 ht4bXe9stgKBTSJ7tGf919AVD37Vu4Xhf1rzvA7dj2rNXrMv3X31677gnUVvfkxt+TtZmGebxMF
 SfRYA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

This series addresses a couple of issues I noticed when accessing
/sys/module/drm/parameters/panic_screen on my Arch Linux machines, which
have "qr_code" as the value of CONFIG_DRM_PANIC_SCREEN. This happened to
be unsupported in my configuration since I was missing some Rust
dependencies in my environment for CONFIG_DRM_PANIC_SCREEN_QR_CODE,
resulting in a kernel crash. Patch one addresses the root cause of the
crash and patch two addresses an inconsistency I noticed between this
new code and the documented value for CONFIG_DRM_PANIC_SCREEN in Kconfig
for qr_code.

If there are any issues, please let me know.

---
Nathan Chancellor (2):
      drm/panic: Ensure drm_panic_type is initialized to a valid value
      drm/panic: Fix expected string for QR_CODE in drm_panic_type_map

 drivers/gpu/drm/drm_panic.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)
---
base-commit: 349d4efadc1f831ebc0b872ba1e3a2b7dd58b72b
change-id: 20260105-drm_panic-handle-invalid-drm_panic_screen-097e49e21c49

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>

