Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9420A7CFBCD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 15:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D1110E4D8;
	Thu, 19 Oct 2023 13:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7521710E4D8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 13:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697723821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=e5p++WBNM2L4lle+sU8T38vITF/7qRmeEbfPkETi0Q8=;
 b=SbIXsW3629lFG3aqV0JTR/KiYvQJS5lxoLoqWUVvv4yK5tGPP/6lNoITTR1dzAVvtkMyQH
 ZWDTT+tJ910EVpdbtIEREAZS3GFM29qErG6Xt3Ttzxr211Fpu/aaA/fvFKyUTX21ue/izf
 5mPclnC+2jpax8rYmjZZcSGhGuTT5kA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668--RF-dAV-MmmOfHtHinYSPw-1; Thu, 19 Oct 2023 09:57:00 -0400
X-MC-Unique: -RF-dAV-MmmOfHtHinYSPw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2FA13C025C6;
 Thu, 19 Oct 2023 13:56:59 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C90471121314;
 Thu, 19 Oct 2023 13:56:58 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 daniel@ffwll.ch
Subject: [PATCH] drm/mgag200: Flush the cache to improve latency
Date: Thu, 19 Oct 2023 15:55:46 +0200
Message-ID: <20231019135655.313759-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We found a regression in v5.10 on real-time server, using the
rt-kernel and the mgag200 driver. It's some really specialized
workload, with <10us latency expectation on isolated core.
After the v5.10, the real time tasks missed their <10us latency
when something prints on the screen (fbcon or printk)

The regression has been bisected to 2 commits:
0b34d58b6c32 ("drm/mgag200: Enable caching for SHMEM pages")
4862ffaec523 ("drm/mgag200: Move vmap out of commit tail")

The first one changed the system memory framebuffer from Write-Combine
to the default caching.
Before the second commit, the mgag200 driver used to unmap the
framebuffer after each frame, which implicitly does a cache flush.
Both regressions are fixed by the following patch, which forces a
cache flush after each frame, reverting to almost v5.9 behavior.
This is necessary only if you have strong realtime constraints, so I
put the cache flush under the CONFIG_PREEMPT_RT config flag.
Also clflush is only availabe on x86, (and this issue has only been
reproduced on x86_64) so it's also under the CONFIG_X86 config flag.

Fixes: 0b34d58b6c32 ("drm/mgag200: Enable caching for SHMEM pages")
Fixes: 4862ffaec523 ("drm/mgag200: Move vmap out of commit tail")
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index af3ce5a6a636..11660cd29cea 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -13,6 +13,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_cache.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_fourcc.h>
@@ -436,6 +437,10 @@ static void mgag200_handle_damage(struct mga_device *mdev, const struct iosys_ma
 
 	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
 	drm_fb_memcpy(&dst, fb->pitches, vmap, fb, clip);
+	/* On RT systems, flushing the cache reduces the latency for other RT tasks */
+#if defined(CONFIG_X86) && defined(CONFIG_PREEMPT_RT)
+	drm_clflush_virt_range(vmap, fb->height * fb->pitches[0]);
+#endif
 }
 
 /*

base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
-- 
2.41.0

