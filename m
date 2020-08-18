Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A2F248FE0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 23:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06906E15F;
	Tue, 18 Aug 2020 21:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DC16E15F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 21:05:30 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id v1so8429808qvn.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 14:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=eJajPBJwhf0xkvC8Oc1cscrVWsD0SBsh6BLFW6m+BMo=;
 b=bA/MkqMVEoqPMDDqXGTMcOuh3vgMaMyUv5v8E918SbT5O5/Bmpo0lcPtKj3mswdGzm
 t+R1/VaUG4eNeek3lywAebsyEL0uCcBsP8pFrOwrucewqM+1s/ZrbX9P3Ikqt/MKUQi+
 An6e45jeHGHbiOXpeHrSrxyn1WD5fWZokV0KgtzAsEhqYAtSmzU6iT2h8V4wEm853a81
 +930vtTmZk9p2WRtgRCUPtWUhrX8SAtYHfLeLmFEFh9UVwqHCKAEf7UbjC+ldfPpnST6
 JR7zEPPvTZ4xHTy8nil8KUrWiVdVz7CDZ5BabXkECZYI4AFZwrQkdI1MTG13ftSb1ByB
 RU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=eJajPBJwhf0xkvC8Oc1cscrVWsD0SBsh6BLFW6m+BMo=;
 b=Joy++KxIznDIzMxX/JiEObwajnjSPIG3VxRv66v1ZzqVQo5jV5PrFcMRShy9SQ2QY2
 4U6gXp8CCWzYTFmQC3YmTyw31aV0hI6/lMFXDIBRiSCAi/2jVcQQecm5+CeNMh6sRIfk
 Di8CtxUbyIyLiwSo1Tt/mXdicUA2TuXZKnfpSVyQglHpnAXbdlzcawJeIi/59ECEyrjY
 udBfbh4q1GSFaYn1tJoumm2og9g+CqQBIm2run4xnLgrnkcRa61O9kLt3L8Bo8i/IOLs
 OClGf1huT75zQMXmbxMq7Wat6cYICGWUyFrYXDJTrhUEEDBohbDTaMGwRGM0tx7XjWQq
 PKXA==
X-Gm-Message-State: AOAM5316kZYDVZ+kn9/YtiUpXzjuU/tSamQG8oibqzHVGkPn0C6oTQfB
 SpTntSOmZlNDmitKOCG7B7i/XKMyr391hw==
X-Google-Smtp-Source: ABdhPJzFRkhP42kRmIrA72EsPkSlVhVJTe/SUAeZKOcCep0nWKpuXKb8zPuX4Qi0U296GzXp53UHuA==
X-Received: by 2002:a0c:c409:: with SMTP id r9mr21332693qvi.123.1597784729953; 
 Tue, 18 Aug 2020 14:05:29 -0700 (PDT)
Received: from localhost (mobile-166-177-184-140.mycingular.net.
 [166.177.184.140])
 by smtp.gmail.com with ESMTPSA id c70sm22194733qke.109.2020.08.18.14.05.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Aug 2020 14:05:29 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 seanpaul@chromium.org, airlied@linux.ie
Subject: [PATCH v6 07/14] drm/etnaviv: Change buffer dump checks to target
 syslog
Date: Tue, 18 Aug 2020 17:05:03 -0400
Message-Id: <20200818210510.49730-8-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818210510.49730-1-sean@poorly.run>
References: <20200818210510.49730-1-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Since the logs protected by these checks specifically target syslog,
use the new drm_debug_syslog_enabled() call to avoid triggering
these prints when only trace is enabled.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-8-sean@poorly.run #v5

Changes in v5:
-Added to the set
Changes in v6:
-None
---
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
index 76d38561c910..7713474800e8 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
@@ -353,7 +353,7 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
 
 	lockdep_assert_held(&gpu->lock);
 
-	if (drm_debug_enabled(DRM_UT_DRIVER))
+	if (drm_debug_syslog_enabled(DRM_UT_DRIVER))
 		etnaviv_buffer_dump(gpu, buffer, 0, 0x50);
 
 	link_target = etnaviv_cmdbuf_get_va(cmdbuf,
@@ -509,13 +509,13 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
 		 etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_mapping)
 		 + buffer->user_size - 4);
 
-	if (drm_debug_enabled(DRM_UT_DRIVER))
+	if (drm_debug_syslog_enabled(DRM_UT_DRIVER))
 		pr_info("stream link to 0x%08x @ 0x%08x %p\n",
 			return_target,
 			etnaviv_cmdbuf_get_va(cmdbuf, &gpu->mmu_context->cmdbuf_mapping),
 			cmdbuf->vaddr);
 
-	if (drm_debug_enabled(DRM_UT_DRIVER)) {
+	if (drm_debug_syslog_enabled(DRM_UT_DRIVER)) {
 		print_hex_dump(KERN_INFO, "cmd ", DUMP_PREFIX_OFFSET, 16, 4,
 			       cmdbuf->vaddr, cmdbuf->size, 0);
 
@@ -534,6 +534,6 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
 				    VIV_FE_LINK_HEADER_PREFETCH(link_dwords),
 				    link_target);
 
-	if (drm_debug_enabled(DRM_UT_DRIVER))
+	if (drm_debug_syslog_enabled(DRM_UT_DRIVER))
 		etnaviv_buffer_dump(gpu, buffer, 0, 0x50);
 }
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
