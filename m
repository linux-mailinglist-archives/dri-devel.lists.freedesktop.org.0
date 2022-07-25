Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4412580854
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 01:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676A210E9EB;
	Mon, 25 Jul 2022 23:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0438D10E5A7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 23:37:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A8B60B81017;
 Mon, 25 Jul 2022 23:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C32BBC341C6;
 Mon, 25 Jul 2022 23:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658792264;
 bh=+T4z1E56ig294fgsdgVrPcM/eeCX5DkWMlE7eJwNtKk=;
 h=From:To:Cc:Subject:Date:From;
 b=AhahugvCsBz3fF3YLZE79oj2+uJabN3WHicYdsOOBSlv2zTtwbdNfZomepBfH7lM0
 fTlx4UA7fylq4fh4wDt3Hu0pIY7YJ2Zy4AlGYpB0CQweSNUbERbuepTBagiFSMLc7R
 TopTgnt57STx9vSPlwXcx50pIzWv5cEKG6n9Tc3jk1gI5LPJuGsZ7YKblw1NIdR/zb
 RAyGEJ4mcVXLUX28FyvYsV+eWX/gby1kZvzSIHtBktMww4wchqwVZyYWqrTlpGbKAM
 k1acG0nQlL46SBNJljCUk2M+pGn5FS98XiTeciTLwg+sjqvLWlfRgAsXcDD3LDi4Ha
 xRMXAWuSqfSdA==
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH] drm/simpledrm: Fix return type of
 simpledrm_simple_display_pipe_mode_valid()
Date: Mon, 25 Jul 2022 16:36:29 -0700
Message-Id: <20220725233629.223223-1-nathan@kernel.org>
X-Mailer: git-send-email 2.37.1
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
Cc: =?UTF-8?q?Tomasz=20Pawe=C5=82=20Gajc?= <tpgxyz@gmail.com>,
 Kees Cook <keescook@chromium.org>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, stable@vger.kernel.org,
 Sami Tolvanen <samitolvanen@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When booting a kernel compiled with clang's CFI protection
(CONFIG_CFI_CLANG), there is a CFI failure in
drm_simple_kms_crtc_mode_valid() when trying to call
simpledrm_simple_display_pipe_mode_valid() through ->mode_valid():

[    0.322802] CFI failure (target: simpledrm_simple_display_pipe_mode_valid+0x0/0x8):
...
[    0.324928] Call trace:
[    0.324969]  __ubsan_handle_cfi_check_fail+0x58/0x60
[    0.325053]  __cfi_check_fail+0x3c/0x44
[    0.325120]  __cfi_slowpath_diag+0x178/0x200
[    0.325192]  drm_simple_kms_crtc_mode_valid+0x58/0x80
[    0.325279]  __drm_helper_update_and_validate+0x31c/0x464
...

The ->mode_valid() member in 'struct drm_simple_display_pipe_funcs'
expects a return type of 'enum drm_mode_status', not 'int'. Correct it
to fix the CFI failure.

Cc: stable@vger.kernel.org
Fixes: 11e8f5fd223b ("drm: Add simpledrm driver")
Link: https://github.com/ClangBuiltLinux/linux/issues/1647
Reported-by: Tomasz Paweł Gajc <tpgxyz@gmail.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/tiny/simpledrm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 768242a78e2b..5422363690e7 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -627,7 +627,7 @@ static const struct drm_connector_funcs simpledrm_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int
+static enum drm_mode_status
 simpledrm_simple_display_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
 				    const struct drm_display_mode *mode)
 {

base-commit: e0dccc3b76fb35bb257b4118367a883073d7390e
-- 
2.37.1

