Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D059856725
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 16:19:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FBED10E96C;
	Thu, 15 Feb 2024 15:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="Y86fEEoC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-149.mail.qq.com (out203-205-221-149.mail.qq.com
 [203.205.221.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 992B410E97A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 15:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1708010332; bh=GdlaqzFKM80ZsVjtRjGY2DrS/4ZVHFTtMqyIKcMEX5Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Y86fEEoC1FfZ7Pe4oTil2FOHJhP9TMM56Thlw16MOEinNvycsJEC8OQJ0eNUwzLDy
 LnfSrbYaBNv0ekxcYZDfLXQQGTk2qosu5MOF79CJ8Xolv5dZZNPbuO1HAzMcWiwlpk
 aYnEMMkDIxizKtYp0JKd1+YpFkI4zG/DWsH8e4MM=
Received: from pek-lxu-l1.wrs.com ([36.129.58.158])
 by newxmesmtplogicsvrsza1-0.qq.com (NewEsmtp) with SMTP
 id 31D23276; Thu, 15 Feb 2024 23:12:29 +0800
X-QQ-mid: xmsmtpt1708009949to99cy6cr
Message-ID: <tencent_C325B38DA11227DDA7DDBE192E4FE88DEC07@qq.com>
X-QQ-XMAILINFO: NyTsQ4JOu2J2XJgPSToOrHJXu6orh1i/m37N8he/BSYlqBP1gu3V2ffeK2pdzx
 gtmkWJsBqyaUPESqEKhxkHe/KtKA5+aRuLaOmAsqjTxy9JwHzMtvFP8VFOh+y0afVj0fUdNilt1H
 dQsoEjlJFZzzGM3UAZmER6vNallbPcU5g7hK4ShvY6F3UKOn8M9HC9BvZunu9Qzjma13Nhj5UGT4
 jRIcGtP8/LETUn4nhi+rxuoycg4OzZA8jHu/S5cIk9JGAwIl4Kub9NC1G1SSipPtAVPEAYm2CDbD
 Ho/wlE94Cm56+dSXdV1gVSkyOgb/MeCPLNBRY8SQ8eZJdjtyXRMfIIiQbPhAnB37LNvKyoiCTM+b
 WQeRJFwkxrtz6Irf2PQckEoWb2f/YNNZi3E8gt8SWH8wBYiEyramMOPzl4XLJekzR6yoHAiRc1F8
 CTVmjM8Rn/fbtldI0Zlb6OK64CgFnAEbVDALEIg5NM+CaNn1DnihTo5YIyVjmQCx8ucEoqL1ol/y
 X6RN9f0BW6b4jJ/jD4NpWlAQLx6hDSj0N2wFVKWy3R5NfSnmFAWB05gbNsLLVWrO7aXO5mpF6Xtf
 NxdlHYJpWCGgck4dOv9qRhJ3bJCOezfVy+ad290PGR4co9bBqSyUFykqW0V9NnJWIEUK3qQDQPqL
 oYUOnlO7IsfIiiiOmfWdBRpmKE2xz3NhADvMwMawVdJs7jcMtpZrWk9F5b39lAzVsBR9HQeEG6Tq
 Zkki5R3L8j7sDDOEXIGU7ZVD27H4ajolWHs6CQ+iB9Vrsv3x1RsbisZc+i8XhSXLwZPs7qOFUq/7
 NGDoddg1KtdomqAaXPTYQpJgvJrZzH/8jJRe/WRYlH1q3jPIbBgy0A7LgjIdep1x2aLIvwUrXOLw
 3Y8XzS37elZLpJUO0jQt+2OZUI+ALAmREz7cX3lrB9rUUq2WygSXtMo6WZmSrtQQ==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+0f999d26a4fd79c3a23b@syzkaller.appspotmail.com
Cc: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
Subject: [PATCH v2] drm/atomic-helpers: fix uaf in
 drm_atomic_helper_wait_for_vblanks
Date: Thu, 15 Feb 2024 23:12:29 +0800
X-OQ-MSGID: <20240215151228.828086-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <000000000000ec4c32061143ec95@google.com>
References: <000000000000ec4c32061143ec95@google.com>
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

To briefly summarize the issues reported by syzbot, there are two task call stacks
as follows:

Task A                                 Task B
------------------------------------   ----------------------------------
                                       drm_atomic_commit
                                       drm_atomic_helper_commit
commit_work
commit_tail
drm_atomic_helper_commit_tail          commit_tail 
                                       drm_atomic_helper_commit_tail
                                       drm_client_modeset_commit_atomic
                                       drm_atomic_state_default_clear
drm_atomic_helper_wait_for_vblanks

When two prerequisites are met simultaneously, the current issue will be triggered:
1. There is an overlap in the memory range occupied by the crtcs member set contained
   in the instance state of "struct drm_atomic_state" created by Task A and Task B
2. The context of drm_atomic_helper_commit_tail() has no lock protection, resulting
   in the instance state->crtcs sub item being released by other task

The solution is to add a lock in drm_atomic_helper_commit_tail() to ensure that
there is no other task interference when accessing the instance state.

Reported-and-tested-by: syzbot+0f999d26a4fd79c3a23b@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 39ef0a6addeb..b16ff9020097 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1743,7 +1743,9 @@ EXPORT_SYMBOL(drm_atomic_helper_wait_for_flip_done);
 void drm_atomic_helper_commit_tail(struct drm_atomic_state *old_state)
 {
 	struct drm_device *dev = old_state->dev;
+	static DEFINE_MUTEX(lock);
 
+	mutex_lock(&lock);
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
 
 	drm_atomic_helper_commit_planes(dev, old_state, 0);
@@ -1757,6 +1759,7 @@ void drm_atomic_helper_commit_tail(struct drm_atomic_state *old_state)
 	drm_atomic_helper_wait_for_vblanks(dev, old_state);
 
 	drm_atomic_helper_cleanup_planes(dev, old_state);
+	mutex_unlock(&lock);
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_tail);
 
-- 
2.43.0

