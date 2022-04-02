Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F154F03EA
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 16:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1C410E13D;
	Sat,  2 Apr 2022 14:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F7B10E13D
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Apr 2022 14:25:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 362FACE09CF;
 Sat,  2 Apr 2022 14:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C765C340EC;
 Sat,  2 Apr 2022 14:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1648909516;
 bh=TW2BmUxWsqV9iauo5cJ7Ef3GsEmIt9N+oPHkkfUNXTI=;
 h=Subject:To:Cc:From:Date:From;
 b=tks42PdbKcbGXL2Rr3fd53RcPwOw5Fiq2k3ELxbqAkPWA/rcnWICuclceNOPsGR1w
 qszFxntXd5UDU581ZEKBdO0gOqLthajectb+gYWPwK83RKBRQbfJouMk9wXggDVeug
 dMzRpfrQmHNmu0Tp0Hq0Sa/OZsfX/4WCB3jdSaWw=
Subject: Patch "drm/dp: Fix off-by-one in register cache size" has been added
 to the 5.15-stable tree
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, gustavoars@kernel.org, keescook@chromium.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, treding@nvidia.com,
 tzimmermann@suse.de
From: <gregkh@linuxfoundation.org>
Date: Sat, 02 Apr 2022 16:23:20 +0200
Message-ID: <164890940053122@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/dp: Fix off-by-one in register cache size

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-dp-fix-off-by-one-in-register-cache-size.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From d4da1f27396fb1dde079447a3612f4f512caed07 Mon Sep 17 00:00:00 2001
From: Kees Cook <keescook@chromium.org>
Date: Thu, 24 Feb 2022 19:56:09 -0800
Subject: drm/dp: Fix off-by-one in register cache size

From: Kees Cook <keescook@chromium.org>

commit d4da1f27396fb1dde079447a3612f4f512caed07 upstream.

The pcon_dsc_dpcd array holds 13 registers (0x92 through 0x9E). Fix the
math to calculate the max size. Found from a -Warray-bounds build:

drivers/gpu/drm/drm_dp_helper.c: In function 'drm_dp_pcon_dsc_bpp_incr':
drivers/gpu/drm/drm_dp_helper.c:3130:28: error: array subscript 12 is outside array bounds of 'const u8[12]' {aka 'const unsigned char[12]'} [-Werror=array-bounds]
 3130 |         buf = pcon_dsc_dpcd[DP_PCON_DSC_BPP_INCR - DP_PCON_DSC_ENCODER];
      |               ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/drm_dp_helper.c:3126:39: note: while referencing 'pcon_dsc_dpcd'
 3126 | int drm_dp_pcon_dsc_bpp_incr(const u8 pcon_dsc_dpcd[DP_PCON_DSC_ENCODER_CAP_SIZE])
      |                              ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Fixes: e2e16da398d9 ("drm/dp_helper: Add support for Configuring DSC for HDMI2.1 Pcon")
Cc: stable@vger.kernel.org
Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Link: https://lore.kernel.org/lkml/20211214001849.GA62559@embeddedor/
Signed-off-by: Kees Cook <keescook@chromium.org>
Link: https://lore.kernel.org/r/20220105173310.2420598-1-keescook@chromium.org
Signed-off-by: Thierry Reding <treding@nvidia.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20220225035610.2552144-2-keescook@chromium.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/drm/drm_dp_helper.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -455,7 +455,7 @@ struct drm_panel;
 # define DP_FEC_BIT_ERROR_COUNT_CAP	    (1 << 3)
 
 /* DP-HDMI2.1 PCON DSC ENCODER SUPPORT */
-#define DP_PCON_DSC_ENCODER_CAP_SIZE        0xC	/* 0x9E - 0x92 */
+#define DP_PCON_DSC_ENCODER_CAP_SIZE        0xD	/* 0x92 through 0x9E */
 #define DP_PCON_DSC_ENCODER                 0x092
 # define DP_PCON_DSC_ENCODER_SUPPORTED      (1 << 0)
 # define DP_PCON_DSC_PPS_ENC_OVERRIDE       (1 << 1)


Patches currently in stable-queue which might be from keescook@chromium.org are

queue-5.15/stack-constrain-and-fix-stack-offset-randomization-w.patch
queue-5.15/coredump-also-dump-first-pages-of-non-executable-elf-libraries.patch
queue-5.15/selftests-lkdtm-add-ubsan-config.patch
queue-5.15/fs-binfmt_elf-fix-at_phdr-for-unusual-elf-files.patch
queue-5.15/gcc-plugins-stackleak-exactly-match-strings-instead-.patch
queue-5.15/exec-force-single-empty-string-when-argv-is-empty.patch
queue-5.15/drm-dp-fix-off-by-one-in-register-cache-size.patch
queue-5.15/pstore-don-t-use-semaphores-in-always-atomic-context-code.patch
