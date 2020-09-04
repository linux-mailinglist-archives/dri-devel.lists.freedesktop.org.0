Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7911C25D352
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 10:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494B96E23F;
	Fri,  4 Sep 2020 08:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1056E23F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 08:16:38 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id h12so3948124pgm.7
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 01:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=idein-jp.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RdnFFDOOaQRmzIcwEYuO7yCKZFTYGlaz+RBlzXbbZDE=;
 b=2B64R9dcgFSpWa/W4ayxtauF3+u5aMZT87yVYz15LP43pJY2G3stwvgntDb1oZSX75
 /9W2H9DZMfNHhd0mto09o3gAtAZHRayJO7EXDt9WRugTLCbkM755BguTMd2zkmNrUV3Y
 BkpO1rwbPrXZ9kJgPLHMi3unfRt9IO7AbQX4zD+CZSLHxjlYq3GH0SHEDobaQZrHAWcS
 gDqthKcrQyNkaolgtfKHN1rq4soGgnj9iKSG5cezGQGrwyorNFGjmF3pPi+k7QI8VPM1
 /qABO+deQcEO/ScGpwY83l+5fE6LLqbFjjRDeHzmM71bg+9XwV4VjnGjjGtajwpyrOa7
 AY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RdnFFDOOaQRmzIcwEYuO7yCKZFTYGlaz+RBlzXbbZDE=;
 b=VurdnpPqzUah4BXUodPP/Q8eb8l5irZeXzLlE5HzBf9lUzBovKzP6UnFWPbB00ikqo
 BfNsOOH9esIgqBzENQ4qzwcQQ6RIDBjPlisfNcr1YSurpKj3/hVQndMbnimvmBxaQf/G
 XEox+RZxq1OHXrIvhjP3BedvM88+FPxki/dfELD8IcWNAxAfEXA682pFpcJHmMO81bT5
 GH+dbK6drbaiE1X0qXfs4vBwiRh4NPZtvMgTEFGJ6ue6+cGIMuq30MK9xkj29zH5x2Om
 F1pMiy7vx/CRDV3UIlwdX5dUx+wRf2dwpb22+gHxe6B/x0XscAZFrV6X5k0kFNIIyPM1
 UB/g==
X-Gm-Message-State: AOAM533RxEwafI3lbjwMMtOffdbpaE1H24Hjt9HqhYiwuzQMMoQfY7FS
 MUeOkfq4MtT7mGY718XOu1UQIyHcFH3Df/bykw==
X-Google-Smtp-Source: ABdhPJzYUH1+pgUCH2v7xQKgt720sjNY28Xv1eTa1s60/rm6bEtvFXOtNiI0Euvk8kigmyxfWkr0Ug==
X-Received: by 2002:aa7:9a8c:: with SMTP id w12mr7694356pfi.73.1599207397606; 
 Fri, 04 Sep 2020 01:16:37 -0700 (PDT)
Received: from localhost.localdomain
 (i220-221-200-167.s41.a008.ap.plala.or.jp. [220.221.200.167])
 by smtp.googlemail.com with ESMTPSA id i16sm20202630pjv.0.2020.09.04.01.16.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Sep 2020 01:16:36 -0700 (PDT)
From: Yukimasa Sugizaki <ysugi@idein.jp>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/v3d: CL/CSD job timeout fixes
Date: Fri,  4 Sep 2020 17:15:50 +0900
Message-Id: <20200904081552.38052-1-ysugi@idein.jp>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
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

(Re-sending this series because I failed to post the previous one to
dri-devel.)

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
