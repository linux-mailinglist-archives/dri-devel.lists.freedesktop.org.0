Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5004BCF6DFD
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 07:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E2910E48E;
	Tue,  6 Jan 2026 06:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UHI7YIrE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC73F10E48E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 06:19:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D6585417BD;
 Tue,  6 Jan 2026 06:19:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7D8C19423;
 Tue,  6 Jan 2026 06:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767680379;
 bh=nQISPNsvpgTbK/pW/zGIRHoRnprV4VUvh5jRhi1PzeE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=UHI7YIrE7+jzdpDVxinCiipfm2r+mu9jjGtt8T6FR3gdcUUXJyxv7G6gMlN6zWo1N
 iPPQSMGGrai3QG5d6w/9Q/RvOD8yiK/O+Sicr+kXsu2/pQiklXdQH0N5uK/25ER4zI
 R+kIJNP8u4lr+MwbXE62tr+c9nTZHWYT8HO6+F+ady6btX74eLCHh7gwuWvp3Z7/pj
 BW0gAxnvgCfQMnYyMasqh20iQiPIOJzxTW+VHi2866JtKHiN5nIYjbDSKnrpb0dCur
 k6+xrsg63elq4jA/3ueJsjNb24UcHPMKiaSpaE2T0YAHYStizdJag9VrjXcuQOVzoV
 4zOeRGU9bcR3A==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 05 Jan 2026 23:19:26 -0700
Subject: [PATCH 1/2] drm/panic: Ensure drm_panic_type is initialized to a
 valid value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-drm_panic-handle-invalid-drm_panic_screen-v1-1-55228bd4b0f8@kernel.org>
References: <20260105-drm_panic-handle-invalid-drm_panic_screen-v1-0-55228bd4b0f8@kernel.org>
In-Reply-To: <20260105-drm_panic-handle-invalid-drm_panic_screen-v1-0-55228bd4b0f8@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2063; i=nathan@kernel.org;
 h=from:subject:message-id; bh=nQISPNsvpgTbK/pW/zGIRHoRnprV4VUvh5jRhi1PzeE=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJkxK8t7mix/Fu25qml49gzPJ9laGY9e10Ua9+xubc77/
 i75UO2rjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjARl+2MDJ9efFb7EZQdkVDA
 snbPuc9/X59+FyO1afmK740aXyRFVU4xMqx/yGEkOePB6snfQlcZrTILU5twOk5t0jvp74UfTIL
 m/2QFAA==
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

If a user has set an invalid CONFIG_DRM_PANIC_SCREEN value (such as
"qr_code" without CONFIG_DRM_PANIC_SCREEN_QR_CODE=y due to missing or
incorrect Rust dependencies), there is a panic when accessing
/sys/module/drm/parameters/panic_screen:

  [   12.218375] BUG: unable to handle page fault for address: 0000000796dd8818
  [   12.219737] #PF: supervisor read access in kernel mode
  ...
  [   12.227167] RIP: 0010:drm_panic_type_get+0x1b/0x30

If drm_panic_type_set() does not find a valid drm_panic_type enumeration
in drm_panic_type_map based on the provided value, it does not change
drm_panic_type from the default -1 value, which is not a valid index for
accessing drm_panic_type_map in drm_panic_type_get(), resulting in the
crash.

Validate the value of CONFIG_DRM_PANIC_SCREEN at boot time via the
return value of drm_panic_type_set() in drm_panic_init() and explicitly
fall back to the default of "user" with a message to the user so that
they can adjust their configuration or fix missing dependencies.

  [    0.800697] Unsupported value for CONFIG_DRM_PANIC_SCREEN ('qr_code'), falling back to 'user'...

Fixes: e85e9ccf3f84 ("drm/panic: Report invalid or unsupported panic modes")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/drm_panic.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index eb7ef17b9c71..0cd574dd9d88 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -1072,8 +1072,11 @@ void drm_panic_unregister(struct drm_device *dev)
  */
 void __init drm_panic_init(void)
 {
-	if (drm_panic_type == -1)
-		drm_panic_type_set(CONFIG_DRM_PANIC_SCREEN, NULL);
+	if (drm_panic_type == -1 && drm_panic_type_set(CONFIG_DRM_PANIC_SCREEN, NULL)) {
+		pr_warn("Unsupported value for CONFIG_DRM_PANIC_SCREEN ('%s'), falling back to 'user'...\n",
+			CONFIG_DRM_PANIC_SCREEN);
+		drm_panic_type = DRM_PANIC_TYPE_USER;
+	}
 	drm_panic_qr_init();
 }
 

-- 
2.52.0

