Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5EB3D15B0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 19:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C886EB9B;
	Wed, 21 Jul 2021 17:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7F56EB9B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 17:56:03 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id c68so2858188qkf.9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 10:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eJajPBJwhf0xkvC8Oc1cscrVWsD0SBsh6BLFW6m+BMo=;
 b=Y+nsyUWFzVgiQIYW7sTA3tIlsuW/nl99urrJ3NdUug231lxe3jrgAvDWvFQE7tCbI5
 21YruvE83bUgTlRbdEE+z4BWfW1HF2y3MGRFAvJgyD98XbJ0/y/MGXJKX2AsVX8CM53J
 A9wTDCCvnUCLoXfiWS6x4lrlBxBTs5/Qz4R6QtZAJt6B1+JX0GHfeXKUPRxc6QDKnV1W
 9+lWbYPKbPQNMsT8t3kcyKTyQdCHarHowm/W56WlnfNGV7M7c2gO/jLkMNb90PWoveNz
 irYV2/aA7L4/fKVj+7DU27pqyzPpmKgrjGJqe8EnGxv1mfZ97BAXld31uvSejB38UxWD
 eHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eJajPBJwhf0xkvC8Oc1cscrVWsD0SBsh6BLFW6m+BMo=;
 b=LqlQXYzcZ2gXkQnl36yHAENXp0O2UUveQAOPc3b/GRC1Z4j8NQlaI+KzfgOY5fe9yv
 NjCZM8t46q4F30SPt+WaHAT/dTDumErBtarACRwLAXiq8fo9QZELKuD/iwrKibnGwwKS
 2bQZNQEaALfKDcT1p1jbBp4LzlGY+6LDsLP3zMAQKM8nv8GmSwjZjJ3MxEseVippsEvQ
 cWnlf2sH9NNW2d70+axnj6ucvyOGcDFW48BGf+8xq/FqBYmZVsp1IHK38ViEn64oMSbC
 Wh2aJSuVhxFhLgS9JzJ+PsL9Z742p16O2tj9Co4TVxuxesi+8WP3lkmodToBA6ytWNoY
 IqvA==
X-Gm-Message-State: AOAM530LoMio5u2pAY22sq+aDfoUQtsOFgqODyS9kL9NaueVczLC8+yf
 ZobcHjAQ46WuN0qIvryPGVMW5IacwxSCNA==
X-Google-Smtp-Source: ABdhPJzWRa/fAH7WwN/95bHK8iq5i7MUlrXC1A1uaG0usBMGrf7krfV6gtM2+zieR1s8y8XzyOrCPw==
X-Received: by 2002:a37:a647:: with SMTP id p68mr35490185qke.133.1626890162671; 
 Wed, 21 Jul 2021 10:56:02 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id q206sm11670559qka.19.2021.07.21.10.56.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 21 Jul 2021 10:56:02 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@linux.ie,
 daniel.vetter@ffwll.ch
Subject: [RESEND PATCH v6 07/14] drm/etnaviv: Change buffer dump checks to
 target syslog
Date: Wed, 21 Jul 2021 13:55:14 -0400
Message-Id: <20210721175526.22020-8-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210721175526.22020-1-sean@poorly.run>
References: <20210721175526.22020-1-sean@poorly.run>
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
Cc: etnaviv@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
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

