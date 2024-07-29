Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDAC93EB51
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 04:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC1010E180;
	Mon, 29 Jul 2024 02:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QJNBXhfS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4433B10E180
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 02:38:23 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2cb57e25387so2195417a91.3
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 19:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722220703; x=1722825503; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BoXVnJDl1DBrc1Y4CS2cvJgm86xrff8Hli3dvn72knc=;
 b=QJNBXhfSS657Ol0o1S92zxTz6SdZw65SLRtQD45qRPl1FqSgTT7ZrfcS1B4GzptCt7
 F9Jsu184XjpF7VxjSj+SVOlSzBZxNmeRo4Zt+D3LzUor7rYdWq1vW9MCh9dMVG4vrOSw
 t1dbGzSkRElY+fGqHbVWNkRKupe0e3cDX5xlpSeEcHyjjv3reM9qLNB4vEUQclWZf/q7
 2J56YRPETM/uLSvqnI0Nrp7dZNT9pS5YwKf0GtOR/ruB6CGajG1i6Hlpdo9/TI0CZdPy
 jEVTiM/hukbEVrovVUtE0aEBNPndmgMjuLu625b55XXkUvkNNEF7623i7heqRXx7HT+r
 ha4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722220703; x=1722825503;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BoXVnJDl1DBrc1Y4CS2cvJgm86xrff8Hli3dvn72knc=;
 b=bjoajpfYw60zQ2nyAYI6Ph2FjbR2fzekK7yb0m6NMEp6+ELCha7XsO59vp4NhoMfa0
 T1N5aLxoSGm6zm33tOlsi5s7Kbph6wohmEwNemPtj3yXzk87FXLvqpNSEKD/IMgJmDBI
 zuqxarOCM41yNOSyVjxPKdgz+xw9gjlTPx1ow8IG6TlG1ZYi4WegMjEPtB1gZzcQB2UE
 gdBUVtIqETISfIrqCQ5Mxxvx29H+uokeiWe6+YM3qG22NOeU52hJsUcy70F9F0MTMkkU
 0AFd6xrK23DuvFUuEu52Of+zDVm8AuwqEC5kp6RcyzBGyLav2ni26wBrdganO9bkLNXr
 0Zaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz+ZyS4o2u6B2JRrPACsa1guBEd99KEhbKPXkJs8kEaXqe1NcdIGKrtEg/khytILcZPiPz9tsLbrLuePYbpAJBAd9FBao2922h+0d88i7Y
X-Gm-Message-State: AOJu0YxVpDkSbVDaBBiVqYaKG45VM2FbIPUwFv71tz40qa1eD70DW/DP
 uNR5CEbutW0azKvRqpEG3eSoP4RBO3J5Aje/LfAAVUksh+Yrqxd7
X-Google-Smtp-Source: AGHT+IHeVJuzyb2EwGW+50qWRtjvsFUnfcwe8AV+hJIj0aUlJNPkNbWdN0SRhTofBR2ODO0UIaMdgg==
X-Received: by 2002:a17:90b:384d:b0:2c9:7f3d:6aea with SMTP id
 98e67ed59e1d1-2cf7e5f4b7cmr7481617a91.32.1722220702568; 
 Sun, 28 Jul 2024 19:38:22 -0700 (PDT)
Received: from localhost.localdomain ([223.104.210.31])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cf28c55a38sm7332247a91.10.2024.07.28.19.37.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Jul 2024 19:38:22 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH resend v4 00/11] Improve the copy of task comm
Date: Mon, 29 Jul 2024 10:37:08 +0800
Message-Id: <20240729023719.1933-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
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

Hello Andrew,

Is it appropriate for you to apply this to the mm tree?

Using {memcpy,strncpy,strcpy,kstrdup} to copy the task comm relies on the
length of task comm. Changes in the task comm could result in a destination
string that is overflow. Therefore, we should explicitly ensure the destination
string is always NUL-terminated, regardless of the task comm. This approach
will facilitate future extensions to the task comm.

As suggested by Linus [0], we can identify all relevant code with the
following git grep command:

  git grep 'memcpy.*->comm\>'
  git grep 'kstrdup.*->comm\>'
  git grep 'strncpy.*->comm\>'
  git grep 'strcpy.*->comm\>'

PATCH #2~#4:   memcpy
PATCH #5~#6:   kstrdup
PATCH #7~#9:   strncpy
PATCH #10~#11: strcpy

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/all/CAHk-=wjAmmHUg6vho1KjzQi2=psR30+CogFd4aXrThr2gsiS4g@mail.gmail.com/ [0]

Changes:
v3->v4:
- Rename __kstrndup() to __kmemdup_nul() and define it inside mm/util.c
  (Matthew)
- Remove unused local varaible (Simon)

v2->v3: https://lore.kernel.org/all/20240621022959.9124-1-laoar.shao@gmail.com/
- Deduplicate code around kstrdup (Andrew)
- Add commit log for dropping task_lock (Catalin)

v1->v2: https://lore.kernel.org/bpf/20240613023044.45873-1-laoar.shao@gmail.com/
- Add comment for dropping task_lock() in __get_task_comm() (Alexei)
- Drop changes in trace event (Steven)
- Fix comment on task comm (Matus)

v1: https://lore.kernel.org/all/20240602023754.25443-1-laoar.shao@gmail.com/

Yafang Shao (11):
  fs/exec: Drop task_lock() inside __get_task_comm()
  auditsc: Replace memcpy() with __get_task_comm()
  security: Replace memcpy() with __get_task_comm()
  bpftool: Ensure task comm is always NUL-terminated
  mm/util: Fix possible race condition in kstrdup()
  mm/util: Deduplicate code in {kstrdup,kstrndup,kmemdup_nul}
  mm/kmemleak: Replace strncpy() with __get_task_comm()
  tsacct: Replace strncpy() with __get_task_comm()
  tracing: Replace strncpy() with __get_task_comm()
  net: Replace strcpy() with __get_task_comm()
  drm: Replace strcpy() with __get_task_comm()

 drivers/gpu/drm/drm_framebuffer.c     |  2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c |  2 +-
 fs/exec.c                             | 10 ++++-
 include/linux/sched.h                 |  4 +-
 kernel/auditsc.c                      |  6 +--
 kernel/trace/trace.c                  |  2 +-
 kernel/trace/trace_events_hist.c      |  2 +-
 kernel/tsacct.c                       |  2 +-
 mm/kmemleak.c                         |  8 +---
 mm/util.c                             | 61 ++++++++++++---------------
 net/ipv6/ndisc.c                      |  2 +-
 security/lsm_audit.c                  |  4 +-
 security/selinux/selinuxfs.c          |  2 +-
 tools/bpf/bpftool/pids.c              |  2 +
 14 files changed, 51 insertions(+), 58 deletions(-)

-- 
2.43.5

