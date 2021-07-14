Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CBB3C7F8D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 09:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91516E193;
	Wed, 14 Jul 2021 07:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD83F6E156
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 04:09:32 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id x16so868765plg.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 21:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=dNtQuwwmGDuffyzJJxrC7J0rgzq3v1ZDzE0BZBmT5ME=;
 b=sxOlB05EOu4kn6zBdjcf/8lnqNeshmDp+JV2COQqQu3eiCOXAlCW2olxWyiux6I+cR
 m1fQCMhPWt1EJf3XgyTYjmTyqbItav6hVhx49OHEZ/1tiuLt+nG2C1YfW+X/dFO+2y1w
 kWxr5DUB8320YFJTUu/6OTMiDjYcGoxW/0xsOyX2GPbvaopJhuLL0Wau/Po7AITJgeuy
 ajetYOHwZWIofp8OCYSqVtWcIWIwJ/yFAMvylIkaFesFCjTCeLuAUkvXckFOx99zitMk
 9kh0djrXPHWJSLcJAIae59fRH8vXJ+ZiOtfWy566QkZZG7leZeWM+CUb02iH2qDQ3jTj
 0gaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=dNtQuwwmGDuffyzJJxrC7J0rgzq3v1ZDzE0BZBmT5ME=;
 b=DYi1FR9/hSx/2M5Q4tQHkyBA43yDIvjOSTgImuUiI7cTUT52JI2P0SG9Sq7XoNWwSW
 X8fvULabRdkFfVpXxdDvQ7cW+XZ26HVliCxXqnekLJQwChVNu6MhLEiNIwZT4Pl/yuIh
 7tCq8CXOQKdxNuNfX2ACcZ3Xmh2ilSTuqY4OhCdLIyI5iX/qRUtBFMAjVCsRQs4vXCTP
 UqrJM/nV8IoWYw5Hn9LiA/9sSQMhdDYwc8MGThyLTqs9ZTTzc+rU99jBroGU9AB5zkvo
 lObl4swZSbXSQom3tx+IiM28c/Ot8x7r2ykmSgAn0F1NeC9XbIWPQqOXKDBaD1tt6qJU
 n3VQ==
X-Gm-Message-State: AOAM531S30Q8u59Q1re1nbI+iM+n5idjm/7JAFfNeZ3ya3I1qTzqzSeD
 rK5i66NqolOXyhoXI3e0kSbEKnfT8UgfcGg=
X-Google-Smtp-Source: ABdhPJxaKwld9avLXJiiCQB2C3ZpjTPxhGiFfOKosko60ULcCDLejOTZxvqG/4n0ipsTr8oB8dEiTA==
X-Received: by 2002:a17:90a:db53:: with SMTP id
 u19mr7808849pjx.4.1626235772271; 
 Tue, 13 Jul 2021 21:09:32 -0700 (PDT)
Received: from vultr.guest ([107.191.53.97])
 by smtp.gmail.com with ESMTPSA id v23sm3675964pje.33.2021.07.13.21.09.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Jul 2021 21:09:31 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] video: fbdev: kyro: fix a DoS bug by restricting user input
Date: Wed, 14 Jul 2021 04:09:22 +0000
Message-Id: <1626235762-2590-1-git-send-email-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Wed, 14 Jul 2021 07:44:22 +0000
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
Cc: linux-fbdev@vger.kernel.org, Zheyu Ma <zheyuma97@gmail.com>,
 sam@ravnborg.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The user can pass in any value to the driver through the 'ioctl'
interface. The driver dost not check, which may cause DoS bugs.

The following log reveals it:

divide error: 0000 [#1] PREEMPT SMP KASAN PTI
RIP: 0010:SetOverlayViewPort+0x133/0x5f0 drivers/video/fbdev/kyro/STG4000OverlayDevice.c:476
Call Trace:
 kyro_dev_overlay_viewport_set drivers/video/fbdev/kyro/fbdev.c:378 [inline]
 kyrofb_ioctl+0x2eb/0x330 drivers/video/fbdev/kyro/fbdev.c:603
 do_fb_ioctl+0x1f3/0x700 drivers/video/fbdev/core/fbmem.c:1171
 fb_ioctl+0xeb/0x130 drivers/video/fbdev/core/fbmem.c:1185
 vfs_ioctl fs/ioctl.c:48 [inline]
 __do_sys_ioctl fs/ioctl.c:753 [inline]
 __se_sys_ioctl fs/ioctl.c:739 [inline]
 __x64_sys_ioctl+0x19b/0x220 fs/ioctl.c:739
 do_syscall_64+0x32/0x80 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
Changes in v2:
    - Validate the inputs on a higher level
---
 drivers/video/fbdev/kyro/fbdev.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/video/fbdev/kyro/fbdev.c b/drivers/video/fbdev/kyro/fbdev.c
index 8fbde92ae8b9..eb0cbd1d12d5 100644
--- a/drivers/video/fbdev/kyro/fbdev.c
+++ b/drivers/video/fbdev/kyro/fbdev.c
@@ -372,6 +372,11 @@ static int kyro_dev_overlay_viewport_set(u32 x, u32 y, u32 ulWidth, u32 ulHeight
 		/* probably haven't called CreateOverlay yet */
 		return -EINVAL;
 
+	if (ulWidth == 0 || ulWidth == 0xffffffff ||
+		ulHeight == 0 || ulHeight == 0xffffffff ||
+		(x < 2 && ulWidth + 2 == 0))
+		return -EINVAL;
+
 	/* Stop Ramdac Output */
 	DisableRamdacOutput(deviceInfo.pSTGReg);
 
-- 
2.17.6

