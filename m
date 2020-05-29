Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CFB1E7710
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 09:41:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45A86E875;
	Fri, 29 May 2020 07:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FFC6E875;
 Fri, 29 May 2020 07:41:12 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id t16so758507plo.7;
 Fri, 29 May 2020 00:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cxdWIOmMtZof5Zd2ToCNUZnFH4PwEYqbI1WQa7Nahtk=;
 b=UZlrYH3upf5Y0Wev0dpd2tLxtfcL3DS9fRPNaLOqtPhi6ZymY7q21cSS3isnWyQIOg
 497/SMtbRG01y+S61hgJ8ER2FmPqwpB7M4IYjzUs6f1JNOSLnN5hh9npENOpbz1joXJd
 od+pKE42bbjWYE/9SNENg52fTQnX5mdbTIK6v6wEq0TNi9OFoK3haITKvhcaVUMMc5WE
 LjNCKg6ZbClwx6OOw3RLGoF9n0kMoL31X4JlmFdiDdGknO9N0hEmNAY7GxvD5lP7JRox
 hCDIzp31SgBKgohQM1C+ZZRwQciXmxFbiJAad0ao+mw7fQA6grYDhgj12c5TbtVEGYGZ
 HGAQ==
X-Gm-Message-State: AOAM531BDWu5oFJScz/atjIKe/g0yeEPf7I99JjGAi4+g6KJ7ROR93UJ
 DKUM7dqHGFqqrOyQWAlywow=
X-Google-Smtp-Source: ABdhPJx/Y2UkOfRCeSrfHd17IdoL/kq5WzGQ2U9aMMVJNt5xrKYQiwN4acpehMl/gpWlkneskvxS6A==
X-Received: by 2002:a17:90b:1002:: with SMTP id
 gm2mr8188726pjb.197.1590738072133; 
 Fri, 29 May 2020 00:41:12 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id s1sm6842049pjp.27.2020.05.29.00.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 00:41:10 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id E3ADF40605; Fri, 29 May 2020 07:41:09 +0000 (UTC)
From: Luis Chamberlain <mcgrof@kernel.org>
To: keescook@chromium.org, yzaikin@google.com, nixiaoming@huawei.com,
 ebiederm@xmission.com, axboe@kernel.dk, clemens@ladisch.de, arnd@arndb.de,
 gregkh@linuxfoundation.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, benh@kernel.crashing.org, rdna@fb.com,
 viro@zeniv.linux.org.uk, mark@fasheh.com, jlbec@evilplan.org,
 joseph.qi@linux.alibaba.com, vbabka@suse.cz, sfr@canb.auug.org.au,
 jack@suse.cz, amir73il@gmail.com, rafael@kernel.org, tytso@mit.edu
Subject: [PATCH 00/13] sysctl: spring cleaning
Date: Fri, 29 May 2020 07:40:55 +0000
Message-Id: <20200529074108.16928-1-mcgrof@kernel.org>
X-Mailer: git-send-email 2.23.0.rc1
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, julia.lawall@lip6.fr,
 Luis Chamberlain <mcgrof@kernel.org>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Me and Xiaoming are working on some kernel/sysctl.c spring cleaning.
During a recent linux-next merge conflict it became clear that
the kitchen sink on kernel/sysctl.c creates too many conflicts,
and so we need to do away with stuffing everyone's knobs on this
one file.

This is part of that work. This is not expected to get merged yet, but
since our delta is pretty considerable at this point, we need to piece
meal this and collect reviews for what we have so far. This follows up
on some of his recent work.

This series focuses on a new helper to deal with subdirectories and
empty subdirectories. The terminology that we will embrace will be
that things like "fs", "kernel", "debug" are based directories, and
directories underneath this are subdirectories.

In this case, the cleanup ends up also trimming the amount of
code we have for sysctls.

If this seems reasonable we'll kdocify this a bit too.

This code has been boot tested without issues, and I'm letting 0day do
its thing to test against many kconfig builds. If you however spot
any issues please let us know.

Luis Chamberlain (9):
  sysctl: add new register_sysctl_subdir() helper
  cdrom: use new sysctl subdir helper register_sysctl_subdir()
  hpet: use new sysctl subdir helper register_sysctl_subdir()
  i915: use new sysctl subdir helper register_sysctl_subdir()
  macintosh/mac_hid.c: use new sysctl subdir helper
    register_sysctl_subdir()
  ocfs2: use new sysctl subdir helper register_sysctl_subdir()
  test_sysctl: use new sysctl subdir helper register_sysctl_subdir()
  sysctl: add helper to register empty subdir
  fs: move binfmt_misc sysctl to its own file

Xiaoming Ni (4):
  inotify: simplify sysctl declaration with register_sysctl_subdir()
  firmware_loader: simplify sysctl declaration with
    register_sysctl_subdir()
  eventpoll: simplify sysctl declaration with register_sysctl_subdir()
  random: simplify sysctl declaration with register_sysctl_subdir()

 drivers/base/firmware_loader/fallback.c       |  4 +
 drivers/base/firmware_loader/fallback.h       | 11 +++
 drivers/base/firmware_loader/fallback_table.c | 22 ++++-
 drivers/cdrom/cdrom.c                         | 23 +----
 drivers/char/hpet.c                           | 22 +----
 drivers/char/random.c                         | 14 +++-
 drivers/gpu/drm/i915/i915_perf.c              | 22 +----
 drivers/macintosh/mac_hid.c                   | 25 +-----
 fs/binfmt_misc.c                              |  1 +
 fs/eventpoll.c                                | 10 ++-
 fs/notify/inotify/inotify_user.c              | 11 ++-
 fs/ocfs2/stackglue.c                          | 27 +-----
 include/linux/inotify.h                       |  3 -
 include/linux/poll.h                          |  2 -
 include/linux/sysctl.h                        | 21 ++++-
 kernel/sysctl.c                               | 84 +++++++++++--------
 lib/test_sysctl.c                             | 23 +----
 17 files changed, 144 insertions(+), 181 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
