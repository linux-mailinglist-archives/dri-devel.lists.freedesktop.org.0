Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C3A856442
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 14:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67D310E7C2;
	Thu, 15 Feb 2024 13:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="oUxoK9Y+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 982 seconds by postgrey-1.36 at gabe;
 Thu, 15 Feb 2024 13:25:03 UTC
Received: from out203-205-221-235.mail.qq.com (out203-205-221-235.mail.qq.com
 [203.205.221.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8170F10E7C2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 13:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1708003496; bh=74lDoTuQg5It9Dyrlq+T3M84frrgQFC8myhCS/1J5CQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=oUxoK9Y+5QI4qzDTHGGWPSwF8aWc+2sgeUWKu4umcoE7vqwN2TTE9BquhOATdEcA2
 ao/aTTT19Z9nY8jv7TnDaTR512/4OBtE2phUP3tNzZdZoXRyz6DNt+moiPhzh8pfkJ
 hW/yQauPXluwWW+xDwCWLGlg4A/WY1EBjRDUk9Bc=
Received: from pek-lxu-l1.wrs.com ([36.129.58.158])
 by newxmesmtplogicsvrszc5-2.qq.com (NewEsmtp) with SMTP
 id 8BA8E5C; Thu, 15 Feb 2024 21:02:11 +0800
X-QQ-mid: xmsmtpt1708002131tzf3vszm9
Message-ID: <tencent_9A767366D63D613790969436A84B2C74F509@qq.com>
X-QQ-XMAILINFO: NvH2zBBgt3uTOnUTxJcm5ftnkQHSoEL/UJYcdW9SZwScbnDxQrfu2FZmb6Dmv6
 Z46P9ZjBHsIB8gnvf/Xd650nMG0ZO8jZU9ATQ8tKfBcjw08/MrWAEgM/PVQv/GNLYLbgJJQpSWhO
 3CFy6SkNTTYidyDM0cGQ5G5+rZInMTrSVE5mMLcwLiaqQNy01OeV6WE/FgC0MZKYRI5BLS9Slszz
 MqDX7/3hV2m0sxKsXBDOlMWR2HwxkOircVZ9saEjmi5vQvzAC/tE0rJgv2496kXERx/CuTUrLaiD
 ooGdPVfXdSzNyEUVBYG/mfywkm2fsbp1sWqG5tM8E+LZUT2LocuXgtdf9xedw9/UNT5EHXRECZaW
 laHdY+sbEU2xllde563Lk5HDzu54Tn/+8tc+hzx5X66T0O5gxoLwGTKqC/L+vmgdCTL2AbVwRIQd
 /LYaDabXbF+R57p2RuJihQImvUr3Dz3RYGWz6RmrRc3FvMuKyzJHiTAD3goee25g0ykUU6hX96sW
 4BeFdblNyNtaTfES+Rc6WeBrNlTyitB/VsodnZ788JKb1UDgA9zBkOQyUo7l3jybnahXuz4+c6Jl
 qApk7OuScF6jcvy5uzq5E800DkfFor2IP9Z6squ458a8lpTRRU6Rb2Ri7TP0MFmWgpoxou3dl2k6
 rp6Xq9u5L5bsdY5Fj752BCeiKrQqkx9kYOM4RRdvJrlAkBLB11m0AVx3Ra8D6X7Snm1NbJfYHsJk
 ZjKnAyFDWF2oGmVjuNnzHn3+SIPNCGNUKV/9vHFnirTCt9OEA/zgnAW3SiyePr5vBgIwchRYtITW
 RZyy3O+u7hmAQsNxrtIlJQK9COznNcqwthB9M4zork/vWl3+m17xF2XLTYSGxXLhI/5RQ86LkzrE
 cxjZHTVX8CK6/ivXqnOb96BV0v9DBU+JYdp10ftKsl
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+0f999d26a4fd79c3a23b@syzkaller.appspotmail.com
Cc: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
Subject: [PATCH] drm/atomic-helpers: fix uaf in
 drm_atomic_helper_wait_for_vblanks
Date: Thu, 15 Feb 2024 21:02:12 +0800
X-OQ-MSGID: <20240215130211.769401-2-eadavis@qq.com>
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
drm_atomic_nonblocking_commit          drm_atomic_commit
drm_atomic_helper_commit               drm_atomic_helper_commit
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

