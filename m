Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2406D1E1C3D
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 09:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5055F6E0B8;
	Tue, 26 May 2020 07:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1FA89F2A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 14:39:27 +0000 (UTC)
Received: from fsav305.sakura.ne.jp (fsav305.sakura.ne.jp [153.120.85.136])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 04PEd4LM067589;
 Mon, 25 May 2020 23:39:04 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav305.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav305.sakura.ne.jp);
 Mon, 25 May 2020 23:39:04 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav305.sakura.ne.jp)
Received: from localhost.localdomain (M106072142033.v4.enabler.ne.jp
 [106.72.142.33]) (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 04PEctGu067422
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 25 May 2020 23:39:04 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: DRI <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/vkms: Don't warn hrtimer_forward_now failure.
Date: Mon, 25 May 2020 23:38:49 +0900
Message-Id: <20200525143849.4964-1-penguin-kernel@I-love.SAKURA.ne.jp>
X-Mailer: git-send-email 2.18.2
X-Mailman-Approved-At: Tue, 26 May 2020 07:26:30 +0000
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
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Shayenne Moura <shayenneluzmoura@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 3a0709928b172a41 ("drm/vkms: Add vblank events simulated by
hrtimers") introduced ret_overrun variable. And that variable was an
unused-but-set-variable until commit 09ef09b4ab95dc40 ("drm/vkms:
WARN when hrtimer_forward_now fails") added WARN_ON(ret_overrun != 1).

Now, syzbot is hitting this WARN_ON() using a simple reproducer that
does open("/dev/dri/card1") followed by ioctl(DRM_IOCTL_WAIT_VBLANK),
and a debug printk() patch says that syzbot is getting

   output->vblank_hrtimer.base->get_time()=93531904774 (which is uptime)
   output->period_ns=0
   ret_overrun=216994

. I can't understand what "verify the hrtimer_forward_now return" in
that commit wants to say. hrtimer_forward_now() must return, and the
return value of hrtimer_forward_now() is not a boolean. Why comparing
with 1 ? Anyway, this failure is not something that worth crashing the
system. Let's remove the ret_overrun variable and WARN_ON() test.

Link: https://syzkaller.appspot.com/bug?id=0ba17d70d062b2595e1f061231474800f076c7cb
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Reported-by: syzbot+0871b14ca2e2fb64f6e3@syzkaller.appspotmail.com
Fixes: 09ef09b4ab95dc40 ("drm/vkms: WARN when hrtimer_forward_now fails")
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index ac85e17428f8..cc1811ce6092 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -13,12 +13,9 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 						  vblank_hrtimer);
 	struct drm_crtc *crtc = &output->crtc;
 	struct vkms_crtc_state *state;
-	u64 ret_overrun;
 	bool ret;
 
-	ret_overrun = hrtimer_forward_now(&output->vblank_hrtimer,
-					  output->period_ns);
-	WARN_ON(ret_overrun != 1);
+	hrtimer_forward_now(&output->vblank_hrtimer, output->period_ns);
 
 	spin_lock(&output->lock);
 	ret = drm_crtc_handle_vblank(crtc);
-- 
2.18.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
