Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEDE25D21B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B466EABC;
	Fri,  4 Sep 2020 07:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E076EA12
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 16:49:07 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id k15so2763097pfc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Sep 2020 09:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=idein-jp.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6MiY8KpFRQuV+ysL9DCr4xSTX/g1EShAORePMHqghL4=;
 b=pBJeQ23KIHbzXBpKfkghsW7b1CIt6Qx1Vp3wmzilz3HAqGrkHDgUFcG316QhnoVg+r
 nvqL11dmNNtd+EJXwcJuE8s00gtndEysHGVm0blg2WlJqIBVH/Zm2PRQlVBDnGboCo5o
 KufTnAveTOx9ABv0Wj7EqIiPpXaKkbqKtgp8bF+gbOA/D9sTKl4KqhDIkRW0rYT1DVOL
 jTagKidWnOrEMvBWSG9E18rm+iVgk+zGFuK4BnTHcMFo4U0xd5r2Yg8u9+Hg/lraW+uk
 NoVvbzqcO0iI0A7tzLjPCvt3pnnIn1xPp31Up2QLTxzItb9raLtCM7f51XlepmAsv5Dw
 c78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6MiY8KpFRQuV+ysL9DCr4xSTX/g1EShAORePMHqghL4=;
 b=MiGepYwCj9gg1WSxU9rzz+UoccAYiJRI7nTs5BL1lG727cf5Unl9Z0bC1OLCb0r7id
 /FtTn6BUXrZNaqVU2C9llBbnQT7SGVIGWVCPKPCK30C5FP9DvBOJZcanX0XZHhdLWJmO
 j1b72K9bmGSMLyCRo73C7bAxwBZtjVgZzGaDiKgHFy4fXuIr2kSr1viM6TNxFHALghQG
 o0kLyIS3Yv+L2QSfBCtiO+k7zfq2ljuFB9bz4Z/72e5NQ3P3Aiangoa4IAqYpHnQ+f6k
 zfumoWb38TG7Gqw3q1Kppf2bWpncHMl75f/MNBwFKadIKtPqdb8j41pwIzsPEfWYOfEh
 iTaQ==
X-Gm-Message-State: AOAM530Fk/VIS/t8fz19Cn9xPgd8GYM6yFkl21jbobe5hKkDm8swZRbx
 cFDmWzD9oMKLv2I5BWfVnSJzrxNS+LmY
X-Google-Smtp-Source: ABdhPJybP+T8oJ1hNnZmInif3Q0tj7JFnNJSSJPfsCWc/zw1uRGlGmlOmouoyyvw3yyvjzE6IuBkUA==
X-Received: by 2002:a63:5c66:: with SMTP id n38mr1438687pgm.217.1599151746775; 
 Thu, 03 Sep 2020 09:49:06 -0700 (PDT)
Received: from localhost.localdomain
 (i220-221-200-167.s41.a008.ap.plala.or.jp. [220.221.200.167])
 by smtp.googlemail.com with ESMTPSA id mw8sm2897411pjb.47.2020.09.03.09.49.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Sep 2020 09:49:05 -0700 (PDT)
From: Yukimasa Sugizaki <ysugi@idein.jp>
X-Google-Original-From: Yukimasa Sugizaki <i.can.speak.c.and.basic@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/v3d: CL/CSD job timeout fixes
Date: Fri,  4 Sep 2020 01:48:18 +0900
Message-Id: <20200903164821.2879-1-i.can.speak.c.and.basic@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:29 +0000
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
Cc: Yukimasa Sugizaki <ysugi@idein.jp>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yukimasa Sugizaki <ysugi@idein.jp>

Hi,

The current V3D scheduler has two issues where CSD jobs are resubmitted
regardless of the previous timed-out flag, and where the timer is not
restarted for timed-out CL/CSD jobs (which we wish to continue running).
The second one is due to the DRM scheduler API change and fixed in a
similar way to [1].  A kernel command-line option to set the default
timeout value is also added.

I tested this patchset with Piglit and our CSD programs in [2].  Because
it is hard to get the current upstream kernel to work on BCM2711, I used
the kernel from rpi-5.8.y tree [3].  There still are problems where some
Piglit tests get longer time to finish running (3610 minutes to 3650
minutes in total), and some ones result in the invalid memory read
errors with unknown reasons:

[17086.230959] v3d fec00000.v3d: MMU error from client CLE (4) at 0xac1000, pte invalid
[17086.238722] v3d fec00000.v3d: MMU error from client CLE (4) at 0x1b61000, pte invalid
[18643.303188] v3d fec00000.v3d: MMU error from client L2T (0) at 0x15bff00, pte invalid
[18655.933748] v3d fec00000.v3d: MMU error from client L2T (0) at 0x15bff00, pte invalid

However, most of the CL/CSD programs are now working happily without
kernel warnings and errors.

Regards,
Sugizaki

[1] https://patchwork.kernel.org/patch/11732895/
[2] https://github.com/Idein/py-videocore6
[3] https://github.com/raspberrypi/linux/tree/rpi-5.8.y

Yukimasa Sugizaki (3):
  drm/v3d: Don't resubmit guilty CSD jobs
  drm/v3d: Correctly restart the timer when progress is made
  drm/v3d: Add job timeout module param

 drivers/gpu/drm/v3d/v3d_sched.c | 62 +++++++++++++++++++++++++++++++++--------
 1 file changed, 51 insertions(+), 11 deletions(-)

--
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
