Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E7B1B2813
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 15:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E1D6E0CB;
	Tue, 21 Apr 2020 13:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095626E0CB;
 Tue, 21 Apr 2020 13:37:02 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id p8so6764228pgi.5;
 Tue, 21 Apr 2020 06:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=EfV5lUR/cm42cpj8d7UKraNpmNLRtUjwYvtnqzSIGtI=;
 b=JVv6+HkWnBXsPUFZk3/H7kzkllExKUoTw+EWy7Mzkn/x7H2RuGKYY0+IEGaiJyixp4
 qRCTmc2LSxjNPCi/1cEpAp28duWvo9LVOmcmae2JMaPxiR7fSEOMMTLXkARWroXO6q/+
 cfuIWuoNOyEz8TjV+A+eYAQc2ei5YcZUajFdFjx+J17Xck/dCzy32/dk2QiAez87u9Hq
 JBMMDRIkm/r3o0oQ+S7ZAppK05ui5AFPMrhCNUP8rUphb1e4yAi9IXgd3ECdhXYpm+ya
 TN62zTAOPWMg9QCXKnPhcC/AUaqcTlD6Yi984wSBkN4NeX6r9oKbJO9HQJ9+W7XK9FGJ
 ENig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=EfV5lUR/cm42cpj8d7UKraNpmNLRtUjwYvtnqzSIGtI=;
 b=SYo7QOIoHtqnr4P7Ovwi3dyvQBpkmGSsIVdTVO3AXpxbf+lpGAj5aAYfrHSX2LdeUj
 v2mfpKlWcCf7DxXvW8ykn2uqY3YO9qVkXApG3DFsbVRaFvNfRYQ9GfcLmopQxX1fxa6v
 A52Ks0eH6mRTayPqWmCxfHwtqI3kWuN6xZiAVyU0FM94nO6FRGGRjLy/K8GYZ1H/0Kjj
 QukAKvrbhQzZRs385UWXX+VyL4TqSDhZ3PLXw13X0Rl+NpFbFn78fOux9OuuiqyyOoFk
 VS/cxN8zBSC5D+lMu7SclwZBixtT4rrlSIO2ShfVZx3LCgA1jgsvV/GyPBtUVR/P1Q/Z
 hV+A==
X-Gm-Message-State: AGi0PuZLO0cBPUXBrW5z4/PQ3ILu6usxVoN1jc0t3gO+iIFCe7Fzamqn
 qA7BwlxGzV+fcWyNb+gvJ6Kdip1J8x4=
X-Google-Smtp-Source: APiQypJswNGsTcF/MnOPeEaotUgYvlZ6iLD7nLtaMNrvzGvI9tDf4DvCcHLRjGGNBbKvaRPcyKyoPA==
X-Received: by 2002:aa7:819a:: with SMTP id g26mr7243456pfi.193.1587476222258; 
 Tue, 21 Apr 2020 06:37:02 -0700 (PDT)
Received: from yuq-Aspire-4738G.lan (li2017-195.members.linode.com.
 [172.105.124.195])
 by smtp.gmail.com with ESMTPSA id r23sm2551327pfr.64.2020.04.21.06.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 06:37:01 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 00/10] drm/lima: add suspend/resume support
Date: Tue, 21 Apr 2020 21:35:41 +0800
Message-Id: <20200421133551.31481-1-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Bhushan Shah <bshah@kde.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andreas Baierl <ichgeh@imkreisrum.de>, Qiang Yu <yuq825@gmail.com>,
 Erico Nunes <nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Suspend need to wait running jobs finish and put hardware in
poweroff state. Resume need to re-init hardware.

v2:
1. add misc patches to prepare enable runtime pm
2. fix pmu command wait time out on mali400 gpu
3. do power and clock gating when suspend
4. do runtime pm

Qiang Yu (10):
  drm/lima: use module_platform_driver helper
  drm/lima: print process name and pid when task error
  drm/lima: check vm != NULL in lima_vm_put
  drm/lima: always set page directory when switch vm
  drm/lima: add lima_devfreq_resume/suspend
  drm/lima: power down ip blocks when pmu exit
  drm/lima: add resume/suspend callback for each ip
  drm/lima: seperate clk/regulator enable/disable function
  drm/lima: add pm resume/suspend ops
  drm/lima: enable runtime pm

 drivers/gpu/drm/lima/lima_bcast.c    |  25 +++-
 drivers/gpu/drm/lima/lima_bcast.h    |   2 +
 drivers/gpu/drm/lima/lima_devfreq.c  |  24 ++++
 drivers/gpu/drm/lima/lima_devfreq.h  |   3 +
 drivers/gpu/drm/lima/lima_device.c   | 199 ++++++++++++++++++++++-----
 drivers/gpu/drm/lima/lima_device.h   |   5 +
 drivers/gpu/drm/lima/lima_dlbu.c     |  17 ++-
 drivers/gpu/drm/lima/lima_dlbu.h     |   2 +
 drivers/gpu/drm/lima/lima_drv.c      |  40 +++---
 drivers/gpu/drm/lima/lima_gp.c       |  21 ++-
 drivers/gpu/drm/lima/lima_gp.h       |   2 +
 drivers/gpu/drm/lima/lima_l2_cache.c |  37 +++--
 drivers/gpu/drm/lima/lima_l2_cache.h |   2 +
 drivers/gpu/drm/lima/lima_mmu.c      |  48 +++++--
 drivers/gpu/drm/lima/lima_mmu.h      |   2 +
 drivers/gpu/drm/lima/lima_pmu.c      |  77 ++++++++++-
 drivers/gpu/drm/lima/lima_pmu.h      |   2 +
 drivers/gpu/drm/lima/lima_pp.c       |  31 ++++-
 drivers/gpu/drm/lima/lima_pp.h       |   4 +
 drivers/gpu/drm/lima/lima_sched.c    |  63 ++++++---
 drivers/gpu/drm/lima/lima_vm.h       |   3 +-
 21 files changed, 496 insertions(+), 113 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
