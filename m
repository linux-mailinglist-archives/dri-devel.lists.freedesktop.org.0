Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 930D2B49B00
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 22:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED21810E206;
	Mon,  8 Sep 2025 20:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pnELPuDs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94D110E206
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 20:25:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D389B40198;
 Mon,  8 Sep 2025 20:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 502CBC4CEF1;
 Mon,  8 Sep 2025 20:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757363105;
 bh=EeZ5Fym6ni/5xsYhCIpDQXvwsj73UciVjDEiIfrAChk=;
 h=From:Date:Subject:To:Cc:From;
 b=pnELPuDs4BOhFPrizo3HkfcR9yX8smoxf6KaKfD1VpNbRyeRIM3hca26QHQOnnOxc
 DoQ3JsdgPXDrp/zXAxgcUbWNIbKM/s2rlvKaz1p6W0pQCwBQnDryA18kwg2eNBjLb1
 EHE1656r7Q+uApM+P4wNoqJmWS1jCg7pn08ZmZR5VQPK47rck91XwZ3THInY1XE56w
 Pp3kqbIw+W7w/uVJrPVO8+iHiR4dEH7UYVdpDxyu0Se4fuw/Nb3D/TpiMV+rxLL4FF
 rE3lJT7JhFRDMr/SIdd0j8e+Bi11b711873fox+cZ1e+AmW9UcPwuIfXy8MrZGaCIk
 aEft8Skn9xEBw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 08 Sep 2025 13:24:59 -0700
Subject: [PATCH] drm/pixpaper: Fix return type of pixpaper_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-drm-pixpaper-fix-mode_valid-return-type-v1-1-705ceaf03757@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJo7v2gC/x2NUQrCMBAFr1L224UktdB6FRGJ5qkLNl02tVRK7
 27wc2CY2ajABIVOzUaGRYpMuYI/NHR/xfwES6pMwYXODa7nZCOrrBoVxg9ZeZwSrkt8S2LD/LH
 M81fBxxB6dK33Q3ujWlNDtf+n82Xff//xYT55AAAA
X-Change-ID: 20250908-drm-pixpaper-fix-mode_valid-return-type-4228e531193b
To: LiangCheng Wang <zaq14760@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2088; i=nathan@kernel.org;
 h=from:subject:message-id; bh=EeZ5Fym6ni/5xsYhCIpDQXvwsj73UciVjDEiIfrAChk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBn7reczaZ050WkvkJfa5tW3fKds3RTObQITubY6hG85H
 ya17lFhRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZjI5xhGhivHPIMf/XO7xOg8
 12LGHscHd47fUnAuNIrJ+X/ZsftIWQ/DX9E6oVXWZ+88Ejo1M71Sf85SibMsna+VHt34un3q6dc
 LRNkA
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

When building with -Wincompatible-function-pointer-types-strict, a
warning designed to catch kernel control flow integrity (kCFI) issues at
build time, there is an instance in the new tiny DRM pixpaper driver:

  drivers/gpu/drm/tiny/pixpaper.c:982:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_crtc *, const struct drm_display_mode *)' with an expression of type 'int (struct drm_crtc *, const struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
    982 |         .mode_valid = pixpaper_mode_valid,
        |                       ^~~~~~~~~~~~~~~~~~~

While 'int' and 'enum drm_mode_status' are ABI compatible, hence no
regular warning from -Wincompatible-function-pointer-types, the mismatch
will trigger a kCFI violation when pixpaper_mode_valid() is called
indirectly.

Update the return type of pixpaper_mode_valid() to be
'enum drm_mode_status' to clear up the warning and kCFI violation.

Fixes: c9e70639f591 ("drm: tiny: Add support for Mayqueen Pixpaper e-ink panel")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/tiny/pixpaper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/pixpaper.c b/drivers/gpu/drm/tiny/pixpaper.c
index b1379cb5f030..32598fb2fee7 100644
--- a/drivers/gpu/drm/tiny/pixpaper.c
+++ b/drivers/gpu/drm/tiny/pixpaper.c
@@ -968,8 +968,8 @@ static const struct drm_crtc_funcs pixpaper_crtc_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
 };
 
-static int pixpaper_mode_valid(struct drm_crtc *crtc,
-			       const struct drm_display_mode *mode)
+static enum drm_mode_status
+pixpaper_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode *mode)
 {
 	if (mode->hdisplay == PIXPAPER_WIDTH &&
 	    mode->vdisplay == PIXPAPER_HEIGHT) {

---
base-commit: 490b30fbaca2abbd6afa8bdc7e2df329b5d82412
change-id: 20250908-drm-pixpaper-fix-mode_valid-return-type-4228e531193b

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>

