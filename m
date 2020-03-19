Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2722B18C893
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 09:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14A06EAED;
	Fri, 20 Mar 2020 08:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661BB6EA6F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 20:35:01 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id r7so5666464wmg.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 13:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F9A5apcWfgHbzIqTxkzNkSW99c5Jwz5rXzLyR34TMAY=;
 b=F6XgOmwhJh/gwPXvcFQ3g35VhaqVS6H7wbZYGDdOZ/59xuk2dxFSNTlGYWF4EpX5SV
 Ibl1WkLnpvoi4S6W5lO50eCpeqljmiLyxcSl0OOrOi3f9o14+mVJrjSEc/0jLARtmzTw
 0PaNWhkJyZTJ2j3DnwzVbuqqJbnYgmQukFBanjDBkEfRu7Q7s9ioTHQ3AUokTwDCkBpX
 ssCSfhHL4HxNzZt1PJ6QER879pr2l7SHo+fnLSunY5bcj2xFJnT7iykt5ZfIX4IQJMrB
 Jjbv6CuhBup3i8Jkv4wwSgpFIBv/zsEFOl+ivz+aUs837Lt2f1EOiCty2OcbxtMR1xi5
 wLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F9A5apcWfgHbzIqTxkzNkSW99c5Jwz5rXzLyR34TMAY=;
 b=K7OVixBddBnjcUvSgFTRfs8EpK3PfdgOK4DUmvkyUM5LCMEfolQGFv3vfyvA5V+Lfy
 DP6cIP5xI1i6UFIH3iRtiEZftDlEVdedJLKzqL9Dw1eKwpuLWmWgdDD58YRzf/yak+jO
 qDbe9trKF1BW8uzkoR4Gy9bH7WoVNLQzdktrpxtMAyGe6mz0ibDcqxYpYhJw+y+xkwnr
 fFvZluFHjcE/M3a/m+eJOl0SAziXC8ndzukrqff0NhTd/DAv21qzl3gYKXN1zQSJ2Cb5
 z6zvC7cZATeTqD34o/LGRuoZDYHbANPXUcV03ZnaslI0YMj0D+ilX79S1GoddfxRXxfO
 Jl1Q==
X-Gm-Message-State: ANhLgQ0irjICmYu2xd//1zLJBMzkhCndiHRQU3EhavUQfgiLKvvFN9kL
 NZqJzzda6Eyl9xGHaChi0inVWtk93Is=
X-Google-Smtp-Source: ADFU+vue6L/D3vO5GpBh6ik04h+bVos1cH18QGewBBlQCMdLUaGmuiQ7UHEJrwRc08Fxtn+e7GR/OA==
X-Received: by 2002:a1c:bc84:: with SMTP id m126mr5722632wmf.171.1584650099865; 
 Thu, 19 Mar 2020 13:34:59 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13710ED00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3710:ed00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id r9sm4744968wma.47.2020.03.19.13.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 13:34:59 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: yuq825@gmail.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/2] drm: lima: devfreq and cooling device support
Date: Thu, 19 Mar 2020 21:34:25 +0100
Message-Id: <20200319203427.2259891-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 20 Mar 2020 08:01:24 +0000
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
Cc: tomeu.vizoso@collabora.com, linux-pm@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, steven.price@arm.com,
 linux-rockchip@lists.infradead.org, wens@csie.org,
 alyssa.rosenzweig@collabora.com, linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is my attempt at adding devfreq (and cooling device) support to
the lima driver.

Test results from a Meson8m2 board:
TEST #1: glmark2-es2-drm --off-screen in an infinite loop while cycling
         through all available frequencies using the userspace governor

     From  :   To
           : 182142857 318750000 425000000 510000000 637500000   time(ms)
  182142857:         0      1274      1274      1273      1279   5399468
  318750000:      1274         0      1274      1273      1272   5114700
  425000000:      1276      1274         0      1272      1271   5122008
  510000000:      1909      1273      1273         0       636   5274292
* 637500000:       640      1272      1272      1273         0   5186796
Total transition : 24834

TEST #2: glmark2-es2-drm --off-screen in an infinite loop with the
         simple_ondemand governor
     From  :   To
           : 182142857 318750000 425000000 510000000 637500000   time(ms)
  182142857:         0         0         0         0       203    318328
  318750000:        53         0         0         0        21     56044
  425000000:        27        18         0         0         2     34172
  510000000:        27         6        14         0         1     41348
* 637500000:        95        50        33        48         0   2085312


Changes since RFC v3 at [2]:
- fix devfreq init error handling and allow lima_devfreq_fini to be
  called multiple times (thanks Qiang)
- switch from atomic counter to a simple int which is only accessed
  under the devfreq spinlock (thanks Qiang)
- union lock areas in same function (thanks Qiang)
- select DEVFREQ_GOV_SIMPLE_ONDEMAND like panfrost does (thanks Qiang)
- move lima_devfreq struct to lima_devfreq.h (thanks Qiang)
- fix duplicate variable in lima_sched_pipe_task_done
- only call dev_pm_opp_of_remove_table if dev_pm_opp_of_add_table
  succeeded previously
- update copyright year to 2020
- rebased on top of drm-misc-next
- dropped RFC status

Changes since RFC v2 at [1]:
- added #cooling-cells to the dt-bindings (new patch #1)
- skip devfreq initialization when the operating-points-v2 property is
  absent
- call dev_pm_opp_set_regulators() so devfreq will actually manage the
  mali-supply regulator
- rebased on top of drm-misc-next-2020-02-21

Changes since RFC v1 at [0]:
- added lock to protect the statistics as these can be written
  concurrently for example when the GP and PP IRQ are firing at the
  same time. Thanks to Qiang Yu for the suggestion!
- updated the copyright notice of lima_devfreq.c to indicate that the
  code is derived from panfrost_devfreq.c. Thanks to  Chen-Yu Tsai  for
  the suggestion!
- I did not unify the code with panfrost yet because I don't know where
  to put the result. any suggestion is welcome though!


[0] https://patchwork.freedesktop.org/series/70967/
[1] https://patchwork.kernel.org/cover/11311293/
[2] https://patchwork.kernel.org/cover/11398365/


Martin Blumenstingl (2):
  dt-bindings: gpu: mali-utgard: Add the #cooling-cells property
  drm/lima: Add optional devfreq and cooling device support

 .../bindings/gpu/arm,mali-utgard.yaml         |   4 +
 drivers/gpu/drm/lima/Kconfig                  |   2 +
 drivers/gpu/drm/lima/Makefile                 |   3 +-
 drivers/gpu/drm/lima/lima_devfreq.c           | 234 ++++++++++++++++++
 drivers/gpu/drm/lima/lima_devfreq.h           |  41 +++
 drivers/gpu/drm/lima/lima_device.c            |   4 +
 drivers/gpu/drm/lima/lima_device.h            |   3 +
 drivers/gpu/drm/lima/lima_drv.c               |  14 +-
 drivers/gpu/drm/lima/lima_sched.c             |   7 +
 drivers/gpu/drm/lima/lima_sched.h             |   3 +
 10 files changed, 312 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/lima/lima_devfreq.c
 create mode 100644 drivers/gpu/drm/lima/lima_devfreq.h

-- 
2.25.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
