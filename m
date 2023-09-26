Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 715207AF3F0
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 21:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D41210E2A4;
	Tue, 26 Sep 2023 19:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EFA10E141
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 17:06:06 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id
 6a1803df08f44-65afcf18a13so32060956d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 10:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695747964; x=1696352764; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vGi8ygan/W5QqPnIt090uD2B1blSKwvwxQPwA51as8o=;
 b=cSMvV9cAGSJmFDGSWD/nU1ZpRm9+FPZvgLckSQoQzeYMrmr35vc4llaIyvjZHyoSOK
 oMLhOnmkeKHApwEHtIZDGlLXDwR927A7bYc0QtjpZgkn86PY5QGadGIqDziulJwgkNhu
 jiPXliTE5CynBdVdWj4f6NEzBE+noBCPVxhF/E+NmOxZ1gjkMTMUY0Qpa0CZ1Qocvyn4
 PBDlHK8q58MjFlPooDf+qUVQbdlUimEU9cNmDLD5B/u9jQqEnwS5BNn0gMApRcsQDPIC
 jSNMvppZJ+xTEwnVdYsXMTqZyzpfQpBuDOw97T3FhZiCuuCZYIMO1jKvhhTmMlkNFDkY
 EYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695747964; x=1696352764;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vGi8ygan/W5QqPnIt090uD2B1blSKwvwxQPwA51as8o=;
 b=n+t1OEV2tp6oUsE4RH5gvZyYpJ+cptS0pow5CFOJR7W0MA43cEI3JYx4kEp6Pnbchc
 rzgloxoRL1sBGWmgWZeZ1plqrbgZhzJ/ybGfwdkze3xd3xG0PIXKM3C6S1z/WL0Tt/br
 BxAzeAN/HZ4ZYFKLAtRmjLtVbVU3W+IwB9QjFVTRbI+u/AB3ZtnYX7EErk4d1I3+kozx
 z+nctfkuIuQm5Hxnip9zFL33PM0K3MeE0Xhrxa5VQ80gXNtzXlxqGieyI+mKPASuQFhe
 SEaci0xIzTO/C5VL0gwkL0hQsefy1HcTAaQqZMrVOSx7dMZwmFSkZwpAfaYOUvHjglW0
 TuAA==
X-Gm-Message-State: AOJu0YwUwLU0/uyL/WUCjSYCeBjMp5fgZ+hAKIqiRNl9PPGRpe2k2ms8
 eLaVRc1H4YIxLPYTXLOMClJi+taDmek=
X-Google-Smtp-Source: AGHT+IHhD4PVM0dcQJfIiKHiaFU5NwVFV6GlCmOX6rrwKJZ4OSpi+36u6ls+1ZFHhc1xcJn9VRIs3Q==
X-Received: by 2002:ad4:5f86:0:b0:65a:f1f2:470d with SMTP id
 jp6-20020ad45f86000000b0065af1f2470dmr12044197qvb.58.1695747964186; 
 Tue, 26 Sep 2023 10:06:04 -0700 (PDT)
Received: from localhost.localdomain
 (pool-100-0-243-27.bstnma.fios.verizon.net. [100.0.243.27])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a0ce447000000b0065b0fa22667sm2020506qvm.81.2023.09.26.10.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 10:06:03 -0700 (PDT)
From: Ray Strode <halfline@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/atomic: Perform blocking commits on workqueue
Date: Tue, 26 Sep 2023 13:05:49 -0400
Message-ID: <20230926170549.2589045-1-halfline@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Sep 2023 19:13:53 +0000
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
Cc: Ray Strode <rstrode@redhat.com>, daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com,
 mdaenzer@redhat.com, alexander.deucher@amd.com, airlied@redhat.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ray Strode <rstrode@redhat.com>

A drm atomic commit can be quite slow on some hardware. It can lead
to a lengthy queue of commands that need to get processed and waited
on before control can go back to user space.

If user space is a real-time thread, that delay can have severe
consequences, leading to the process getting killed for exceeding
rlimits.

This commit addresses the problem by always running the slow part of
a commit on a workqueue, separated from the task initiating the
commit.

This change makes the nonblocking and blocking paths work in the same way,
and as a result allows the task to sleep and not use up its
RLIMIT_RTTIME allocation.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2861
Signed-off-by: Ray Strode <rstrode@redhat.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 292e38eb6218..1a1e68d98d38 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2028,64 +2028,63 @@ int drm_atomic_helper_commit(struct drm_device *dev,
 	 * This is the point of no return - everything below never fails except
 	 * when the hw goes bonghits. Which means we can commit the new state on
 	 * the software side now.
 	 */
 
 	ret = drm_atomic_helper_swap_state(state, true);
 	if (ret)
 		goto err;
 
 	/*
 	 * Everything below can be run asynchronously without the need to grab
 	 * any modeset locks at all under one condition: It must be guaranteed
 	 * that the asynchronous work has either been cancelled (if the driver
 	 * supports it, which at least requires that the framebuffers get
 	 * cleaned up with drm_atomic_helper_cleanup_planes()) or completed
 	 * before the new state gets committed on the software side with
 	 * drm_atomic_helper_swap_state().
 	 *
 	 * This scheme allows new atomic state updates to be prepared and
 	 * checked in parallel to the asynchronous completion of the previous
 	 * update. Which is important since compositors need to figure out the
 	 * composition of the next frame right after having submitted the
 	 * current layout.
 	 *
 	 * NOTE: Commit work has multiple phases, first hardware commit, then
 	 * cleanup. We want them to overlap, hence need system_unbound_wq to
 	 * make sure work items don't artificially stall on each another.
 	 */
 
 	drm_atomic_state_get(state);
-	if (nonblock)
-		queue_work(system_unbound_wq, &state->commit_work);
-	else
-		commit_tail(state);
+	queue_work(system_unbound_wq, &state->commit_work);
+	if (!nonblock)
+		flush_work(&state->commit_work);
 
 	return 0;
 
 err:
 	drm_atomic_helper_cleanup_planes(dev, state);
 	return ret;
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit);
 
 /**
  * DOC: implementing nonblocking commit
  *
  * Nonblocking atomic commits should use struct &drm_crtc_commit to sequence
  * different operations against each another. Locks, especially struct
  * &drm_modeset_lock, should not be held in worker threads or any other
  * asynchronous context used to commit the hardware state.
  *
  * drm_atomic_helper_commit() implements the recommended sequence for
  * nonblocking commits, using drm_atomic_helper_setup_commit() internally:
  *
  * 1. Run drm_atomic_helper_prepare_planes(). Since this can fail and we
  * need to propagate out of memory/VRAM errors to userspace, it must be called
  * synchronously.
  *
  * 2. Synchronize with any outstanding nonblocking commit worker threads which
  * might be affected by the new state update. This is handled by
  * drm_atomic_helper_setup_commit().
  *
  * Asynchronous workers need to have sufficient parallelism to be able to run
  * different atomic commits on different CRTCs in parallel. The simplest way to
-- 
2.41.0

