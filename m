Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D2655A9E7
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 14:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFDA10E5AD;
	Sat, 25 Jun 2022 12:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E34110E608
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 12:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656159903;
 bh=Wnq6p+d4InGf1wEYwUrelD14sX0XHJhP1IW1KPsYRwM=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=NW+j1aQ75KqxlsNCALZWLBxL7zNmtgc+mY1V44/K+/cQOWJ6Jy6oz2EgEL/dATLEa
 0Udp9WMfkHNlHosICwsbsyiz47RtOmhbQ4snGAUx2iVLTowEYi3j1ym/amT5G+WRRN
 71wW/PCAtYi9x5hOixGUViFjWNzpDmzd9TFTsrIg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.162.44]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mof5H-1nKxSY34un-00p6vw; Sat, 25
 Jun 2022 14:25:03 +0200
From: Helge Deller <deller@gmx.de>
To: linux-fbdev@vger.kernel.org, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, deller@gmx.de
Subject: [PATCH v2 3/4] fbmem: Fix input parameter checks for user-provided
 screen resolution changes
Date: Sat, 25 Jun 2022 14:25:01 +0200
Message-Id: <20220625122502.68095-4-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220625122502.68095-1-deller@gmx.de>
References: <20220625122502.68095-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+NXCwtedkW7UnMcnTWz1RmraG/kMiUP51rYZeRfjHHYTKNIllcY
 tR9MyUPFfObHshIYx+rJsAHWBxu2zn/htbNhONqaEWB+kO5uWAt+V/Bt009BhAoo0O3sH+g
 9jNhRmDLMHpvTR+EpE/+FwXeJkpxhOlu2e4Jw/EFOv4fuQI5esj5XBLEtPNy4Ko9/P3d0RI
 7YAmVqq7A1PlB8iGlETXg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/gZfrfcIOvY=:ZDyG0rsg7xLKq+3LE1ET1v
 g/npmexOg0aO4vA1bQ30/uXTM2NsxFl8XjzOsbFR91yih2y38v2qYzH841v4ubU7i4vW6C7eu
 7igWul+LTZ9CrtFEBfnyRTN7UxSLu7Ng0gT7C7tNxaXGkokiWD3O2Drh0Ai33FdwDOgAoTf1b
 d49WxvCswQrw07dJKXXkel+quTfHL1buafx924X8QGEVY4dhU7X+Lvm+Prer/ocO3CRYHQthS
 0D6RYsqe8350TbkOKiNNGrUucB9KGl3xn9Eyw8ENmleEx8JjSh9so5N/iRVCyE9w6UAmPsz4l
 n+MQ5ycbrFNZ97WuEMlNU+5puHMOXHSONb/xecFRle/s0fJ7q9k7+97gkbZgLMTNvDwhop4Er
 1L8VafK8+9ztUYOvZ7zqu6jjwO1qMbdQAfdg7pW90/ZAVDcjCmBF/SOxKCA9kUFJCzCHqByg1
 qt3Xv1wqg5kqo1vW/J9Qeb/CAjiIN1O9q192myBAKGiL1Pue+uHtk26I/SElzPAESsq41TzZo
 nDDn9MWtaBlPwzjJDIbD6e6bTzaHbTS01ml9LGWOSV5oLXY5Z0sANkP/LJJyPqqO6q0f5Xm11
 a2hkb6imZk9u1Y8SULRZvIUfMeX8BwwTzXFUdUld1vt1u0iewEHShjqs+M8UMwxb83xbQtRs+
 2fIivXkHZTdM7U5oaMABMYzqsz4reLPa0WAj3NAsx+1RAHPGuoUAu3OcXXPNl6Kokuek8ice+
 gB5AUfB0OedvSyH+8YtQkqonGZ9NKSD6X1CGlveLVkhIgF641MfBjgZP5TSZhKAn4g6Q0sh04
 Q7ZWmviWeTrSft+CTYFK4iBdVqTgcy2AId7ZgLbByyRrRTrf9Mbw0HLczyqiOJ0EQ3Ny7Zwn9
 h/L6Fp3op99L66yXfpLYXxzV7JJ/fhNRizAzT5z/WcoA2i5epcfqrgWJxPhDF4qRMZkID+Qe8
 qeJrbnejnR0+ZwLX2oVExEr6XUbfAWm/VI/WqDRqROkL73a/0rLpw5K8VBzkIhnLsWS1C5gJE
 t+KEYu6SVHOAYHwydK2boXzj4vMQXaOS3KicDAv//9BJCV1TbgTYDHF8u4JOzEp9IkBRiMoqW
 yz5jx9XgE5X97kFqsM5/DCvX7Ch/t3GSMtVZui6Jn0uJ3EyMkzvwkuv0w==
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

Enhance the checks in the FBIOPUT_VSCREENINFO ioctl handler to verify
the user-provided new screen size for:

a) virtual screen size >=3D physical screen size, and

b) new screen size is bigger than currently configured console font size.

Return -EINVAL on invalid input.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # v5.4+
=2D--
 drivers/video/fbdev/core/fbmem.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/f=
bmem.c
index afa2863670f3..50fb66b954d6 100644
=2D-- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1106,7 +1106,13 @@ static long do_fb_ioctl(struct fb_info *info, unsig=
ned int cmd,
 			return -EFAULT;
 		console_lock();
 		lock_fb_info(info);
-		ret =3D fb_set_var(info, &var);
+		if (var.xres_virtual < var.xres ||
+		    var.yres_virtual < var.yres)
+			ret =3D -EINVAL;
+		if (!ret)
+			ret =3D fbcon_modechange_possible(info, &var);
+		if (!ret)
+			ret =3D fb_set_var(info, &var);
 		if (!ret)
 			fbcon_update_vcs(info, var.activate & FB_ACTIVATE_ALL);
 		unlock_fb_info(info);
=2D-
2.35.3

