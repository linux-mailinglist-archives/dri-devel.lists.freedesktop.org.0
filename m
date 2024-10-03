Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 517B798FA45
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 01:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A861010E0B0;
	Thu,  3 Oct 2024 23:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IMMvu79L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C8C10E0B0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 23:09:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 153E6A43FD3;
 Thu,  3 Oct 2024 23:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B9AC4CEC5;
 Thu,  3 Oct 2024 23:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727996939;
 bh=DzQHCv1YgHZYR5hu7J+5iPetr1YSbCm6MTZAU6xv2oo=;
 h=From:To:Cc:Subject:Date:From;
 b=IMMvu79LVQfFX3ETLxZugfhepwunJuO+6XCzDcxcOVsLrNI5k5fpMk6TitACbAxsI
 LL7Xz8YPr8e7bEKeL4WO+GIsqDyB3KTZRUZ1saaqAkjAVkuS94mUVTGRL65yquQrJb
 D7xun4CDy9Wl+9QHefwwZvK31yVhSAy8WIgAbUP+B0MVIemQtT8AUWrHxNn36/C8yU
 gNwt/0NJ4MyQEklvE7o3UEgc7ssBMxdejVkz/d/Z+mGdBfuHlFzfnNOYNfUTnVp047
 3QBlD4MJhrOdUT++lTMzxQa+O0Q0y5CsNBC53aDJWR2Y+9Tu7dxJmI79zo+NPp8O5R
 Rbx5gTZy14l0A==
From: Miguel Ojeda <ojeda@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH] drm/panic: Select ZLIB_DEFLATE for DRM_PANIC_SCREEN_QR_CODE
Date: Fri,  4 Oct 2024 01:07:34 +0200
Message-ID: <20241003230734.653717-1-ojeda@kernel.org>
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

Under `CONFIG_DRM_PANIC_SCREEN_QR_CODE=y`, zlib is used:

    ld.lld: error: undefined symbol: zlib_deflate_workspacesize
    >>> referenced by drm_panic.c
    >>>               drivers/gpu/drm/drm_panic.o:(drm_panic_qr_init) in archive vmlinux.a

Thus select `CONFIG_ZLIB_DEFLATE`.

Fixes: cb5164ac43d0 ("drm/panic: Add a QR code panic screen")
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 drivers/gpu/drm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 1cb5a4f19293..cf5bc77e2362 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -152,6 +152,7 @@ config DRM_PANIC_SCREEN
 config DRM_PANIC_SCREEN_QR_CODE
 	bool "Add a panic screen with a QR code"
 	depends on DRM_PANIC && RUST
+	select ZLIB_DEFLATE
 	help
 	  This option adds a QR code generator, and a panic screen with a QR
 	  code. The QR code will contain the last lines of kmsg and other debug
--
2.46.2
