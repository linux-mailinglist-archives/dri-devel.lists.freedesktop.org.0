Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2542303811
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 09:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659356E43D;
	Tue, 26 Jan 2021 08:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824776E3CE
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 02:01:20 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id g15so906382pjd.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 18:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cuvqgCacX4Pb/J8emd8ASYQj+aaRXfkyo5/tJUTXC18=;
 b=Q1nyIoOg9cA/NbhZwjGDZ1yfAR40idBgrI8GJtJYQD0Jy5i4RP5cMAnGe8d3sup0X9
 TtInhbmtjpHx5/vQC6JZ25GsSIDxUgJkKpRCryJVAUzjjG39MnQ33CfJtSDKLYdgc6du
 MQ9XR+oahIBNnUJIEzG9uyxkdZI3aRmVXxjRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cuvqgCacX4Pb/J8emd8ASYQj+aaRXfkyo5/tJUTXC18=;
 b=kqswEF7ineWtgFnWcdWxk5hPXTsH1KFZlS4+NnnH28iYFOAGgopU3mtcuuocnyhtcr
 nV8OkdPlL69JP/jpjv5K2RQuKIWzaaXUNMRI0By19/quV5hp4DnyqJYbw/xMWlQwnUcQ
 uZEEbDb3hszYkEh+DEwdiVtu46qGohXnAl3OtTJIHwusO63lFNvPbXf5CYWI0Hf9rPiw
 eddspYVfuvsd0wuJYAQMMTHlnDhxJNDHePIiW5MelFIwaOWHyPezhsC3of+athLhjD9c
 pAf18jFSQoJmzJqoTQe+I//P0qL8ntbSt0Vyu9BN3+IGFTW/y15KF7x5tB/EX46RUHDh
 GEHQ==
X-Gm-Message-State: AOAM532PzGWnnfOZjUnU8uSdo6Q/TG6NDlk/FzImxDdSgEY5Uoj5d6KN
 u4wSHjfeS1RlHwD7ISuf3j7FyA==
X-Google-Smtp-Source: ABdhPJw/S2YrtvvvxKvJJZka0jRnlXv6swbqbI0W46SZnmLlTUVuNP8AiVQFCtSIVh74m6nO4eXWsQ==
X-Received: by 2002:a17:90a:f318:: with SMTP id
 ca24mr3337732pjb.30.1611626480086; 
 Mon, 25 Jan 2021 18:01:20 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:1066:b437:97cd:2278])
 by smtp.gmail.com with ESMTPSA id n2sm16975028pfu.42.2021.01.25.18.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 18:01:19 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH] drm/msm/kms: Make a lock_class_key for each crtc mutex
Date: Mon, 25 Jan 2021 18:01:13 -0800
Message-Id: <20210126020117.2753615-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 26 Jan 2021 08:37:37 +0000
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krishna Manikandan <mkrishn@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lockdep complains about an AA deadlock when rebooting the device.

============================================
WARNING: possible recursive locking detected
5.4.91 #1 Not tainted
--------------------------------------------
reboot/5213 is trying to acquire lock:
ffffff80d13391b0 (&kms->commit_lock[i]){+.+.}, at: lock_crtcs+0x60/0xa4

but task is already holding lock:
ffffff80d1339110 (&kms->commit_lock[i]){+.+.}, at: lock_crtcs+0x60/0xa4

other info that might help us debug this:
Possible unsafe locking scenario:

CPU0
----
lock(&kms->commit_lock[i]);
lock(&kms->commit_lock[i]);

*** DEADLOCK ***

May be due to missing lock nesting notation

6 locks held by reboot/5213:
__arm64_sys_reboot+0x148/0x2a0
device_shutdown+0x10c/0x2c4
drm_atomic_helper_shutdown+0x48/0xfc
modeset_lock+0x120/0x24c
lock_crtcs+0x60/0xa4

stack backtrace:
CPU: 4 PID: 5213 Comm: reboot Not tainted 5.4.91 #1
Hardware name: Google Pompom (rev1) with LTE (DT)
Call trace:
dump_backtrace+0x0/0x1dc
show_stack+0x24/0x30
dump_stack+0xfc/0x1a8
__lock_acquire+0xcd0/0x22b8
lock_acquire+0x1ec/0x240
__mutex_lock_common+0xe0/0xc84
mutex_lock_nested+0x48/0x58
lock_crtcs+0x60/0xa4
msm_atomic_commit_tail+0x348/0x570
commit_tail+0xdc/0x178
drm_atomic_helper_commit+0x160/0x168
drm_atomic_commit+0x68/0x80

This is because lockdep thinks all the locks taken in lock_crtcs() are
the same lock, when they actually aren't. That's because we call
mutex_init() in msm_kms_init() and that assigns on static key for every
lock initialized in this loop. Let's allocate a dynamic number of
lock_class_keys and assign them to each lock so that lockdep can figure
out an AA deadlock isn't possible here.

Fixes: b3d91800d9ac ("drm/msm: Fix race condition in msm driver with async layer updates")
Cc: Krishna Manikandan <mkrishn@codeaurora.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/msm_kms.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index d8151a89e163..4735251a394d 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -157,6 +157,7 @@ struct msm_kms {
 	 * from the crtc's pending_timer close to end of the frame:
 	 */
 	struct mutex commit_lock[MAX_CRTCS];
+	struct lock_class_key commit_lock_keys[MAX_CRTCS];
 	unsigned pending_crtc_mask;
 	struct msm_pending_timer pending_timers[MAX_CRTCS];
 };
@@ -166,8 +167,11 @@ static inline int msm_kms_init(struct msm_kms *kms,
 {
 	unsigned i, ret;
 
-	for (i = 0; i < ARRAY_SIZE(kms->commit_lock); i++)
-		mutex_init(&kms->commit_lock[i]);
+	for (i = 0; i < ARRAY_SIZE(kms->commit_lock); i++) {
+		lockdep_register_key(&kms->commit_lock_keys[i]);
+		__mutex_init(&kms->commit_lock[i], "&kms->commit_lock[i]",
+			     &kms->commit_lock_keys[i]);
+	}
 
 	kms->funcs = funcs;
 

base-commit: 19c329f6808995b142b3966301f217c831e7cf31
-- 
https://chromeos.dev

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
