Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DFF342D04
	for <lists+dri-devel@lfdr.de>; Sat, 20 Mar 2021 14:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A6B6EB14;
	Sat, 20 Mar 2021 13:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x549.google.com (mail-ed1-x549.google.com
 [IPv6:2a00:1450:4864:20::549])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACB46EB14
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Mar 2021 13:28:46 +0000 (UTC)
Received: by mail-ed1-x549.google.com with SMTP id q12so9064390edv.9
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Mar 2021 06:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=BBm8e3ljXuTB2RwWH86mMYMB3mSh/3i2elGx86nbt2k=;
 b=MvAnzc4LPFs0OPxKBAzRip81IjdvkOQq5oCx+Db7pRo/laL2njO2DR8M29LndXu/Ge
 QigKDtEnw2zlFQQJP9ZXbYZ8AeBvKm0WZB4spAk6kkJaVxuHCDavXwgSjgi36GHTeWSf
 Y2Nb4Krx7dXb3pWTVR4po3SRdHLNanY3GxrxDG9J7nInBnVMrUoPOui8nP3JSRDqMwud
 P2xvicA4GwseQB2c9W4L+nTW4Xo0cG+0WxnbntuDUSvgsY/6aA6IjAUXNUVZq08B9OLw
 YCXiZ+Tuaz8h2XBUklamg7YL2yOszHtvHe+ArcV2vcuUuWcbz3+v6Hv1mJt22A32H9Xn
 f+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=BBm8e3ljXuTB2RwWH86mMYMB3mSh/3i2elGx86nbt2k=;
 b=Jjr0XBf1zdi7LzoYoBKw9Ta0o0Vxa/b4dtw2vHhO4ZHkSMiaNhNUyjCnlZudsVy4Fk
 VOk5Oz+R6ayDW/HYyrWrmLgbe1KdTkC4QnyalKIgCmB5TaCi8KTLQx1TESdQecUkZhaw
 FsWT68WYgM0HmVHY8OiMRGHG3oE8R61d+wupOKOJDDhpoXbrakHVk2ogUauxZjJ/UWv4
 jMbS8AKg6hCubmpBZ7KVd557Gtyx4PEb799iDjm4WzNB2lIm++W7Ne9k+Ez4anqotVtn
 hRguylf6HZizpMw4QWBU0/hwcJDly4OAUNKc6jPv/UtmA5p7ZhR4l6YTWw90+ZR8DTRV
 KdXQ==
X-Gm-Message-State: AOAM5313TR1NaNG0Ans2T9uVzj7Fe09+7cEFUE7n7ZjxuWOLXBbYyFzu
 7e9J10zp3GC4/AVVOgfafy4BGb0ia6TF
X-Google-Smtp-Source: ABdhPJwPlInIesVyLJR/yWRN+uRqKL/K5/VS1q+KO2JbycUaR96xSyYa3dYnZk6gJduKpoluxtwJqqPtpmo3
X-Received: from dvyukov-desk.muc.corp.google.com
 ([2a00:79e0:15:13:84f2:bf18:7ada:738e])
 (user=dvyukov job=sendgmr) by 2002:a50:bb47:: with SMTP id
 y65mr15819702ede.305.1616246925213; Sat, 20 Mar 2021 06:28:45 -0700 (PDT)
Date: Sat, 20 Mar 2021 14:28:40 +0100
Message-Id: <20210320132840.1315853-1-dvyukov@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
Subject: [PATCH] drm/vkms: fix misuse of WARN_ON
From: Dmitry Vyukov <dvyukov@google.com>
To: daniel@ffwll.ch, airlied@linux.ie, hamohammed.sa@gmail.com, 
 melissa.srw@gmail.com, rodrigosiqueiramelo@gmail.com
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
Cc: syzbot+4fc21a003c8332eb0bdd@syzkaller.appspotmail.com,
 dri-devel@lists.freedesktop.org, Dmitry Vyukov <dvyukov@google.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

vkms_vblank_simulate() uses WARN_ON for timing-dependent condition
(timer overrun). This is a mis-use of WARN_ON, WARN_ON must be used
to denote kernel bugs. Use pr_warn() instead.

Signed-off-by: Dmitry Vyukov <dvyukov@google.com>
Reported-by: syzbot+4fc21a003c8332eb0bdd@syzkaller.appspotmail.com
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Melissa Wen <melissa.srw@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Change-Id: I7f01c288092bc7e472ec63af198f93ce3d8c49f7
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 0443b7deeaef6..758d8a98d96b3 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -18,7 +18,8 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 
 	ret_overrun = hrtimer_forward_now(&output->vblank_hrtimer,
 					  output->period_ns);
-	WARN_ON(ret_overrun != 1);
+	if (ret_overrun != 1)
+		pr_warn("%s: vblank timer overrun\n", __func__);
 
 	spin_lock(&output->lock);
 	ret = drm_crtc_handle_vblank(crtc);

base-commit: e94c55b8e0a0bbe9a026250cf31e2fa45957d776
-- 
2.31.0.291.g576ba9dcdaf-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
