Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C767961C74
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 05:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF2310E459;
	Wed, 28 Aug 2024 03:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dhd/cwMX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE9C10E459
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 03:03:36 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-714186ce2f2so4835060b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 20:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724814216; x=1725419016; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u96++TBbJ71oR+HkQgBso+tiWoljyvGONtmx4MFc6sw=;
 b=Dhd/cwMXgwS3oPxkQfj6sMSEDrd69nEqTdXo6k//AbDNP728ygifjnA9xOpldpxlPA
 DWv8ES5iz9e/Ino+x6ApiIX4s1HL+XPceQsAwZLh9MzW1ZeGDR2QDQw1DrsY4ZxiEHPT
 jO8ZsSm7SQP1Naqh1MQ2cGs2E+C8bNllQs9gS8wjJvjRpLEkEGTUU/1aEKT6OQ/+q/s+
 1d5EBjCoajCyO2ai80jBxd/PSsqCG2spisXUf/GJJ22Wrt5j76Zk0GUChez7nRjdo/w8
 5idNPdbikatPj2pD2V3l5LC10An/RWwwhtbSZVpRy5OAXA/I6y15y0eWCHHcyCHXCaBJ
 3I9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724814216; x=1725419016;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u96++TBbJ71oR+HkQgBso+tiWoljyvGONtmx4MFc6sw=;
 b=oMclOoev6UH841TebBriuRGAs7Nv5AwsUvsrCYespnQ6w3ZC4h6RJaprisF45IX3sY
 bGr062HmLf5PRXUCwjAOnAEE/tM+sGyPWh5fsrdgxhSdM3bcjg9CfVWsDDuumx5vxBEz
 NANbQB/ZTc+KB5+vBFIc+iDtTn3bdAdq2Zk6QNggRgf9u2VlGDblcmqdA34UFp5FmRIt
 1FCU9mioduY84i0lgTS6ROZiKc7JfXWHPdMG/Oby/1E2QKDs5JwGnnX8TVUgFwAz1J4V
 09jmGhvzOaPRH012bCZPWd0ZpQw4NXpEtaSMQOy77HZhCluxL9o5QNUgnQMvILSSRenn
 snfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz2tjf7A6s2F1c9d4c/AFK5DSI0HbV2FxXcE3EvW/IwKfmTJQrdBjdGzCzqin0W8lp1EkNlZxIOfY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMYnUigF8pnJqx26QZeE6SATYN/6bBQAipi737zQI+2F4zFQ+I
 1itfRaFaXpG7CLqi/Pi/s34XEaC2qPbnqIC7caEIPx/+UqeK1lAx
X-Google-Smtp-Source: AGHT+IHibExtxV8dBZTZD5JORthJOms4iDv1rvcr+QvHWcHAfAXxuXG3hLg0KOZ+K8PqosjKn4N4Iw==
X-Received: by 2002:a05:6a20:9c89:b0:1c3:a63a:cef2 with SMTP id
 adf61e73a8af0-1cc89dc90ecmr15627538637.28.1724814215888; 
 Tue, 27 Aug 2024 20:03:35 -0700 (PDT)
Received: from localhost.localdomain ([39.144.104.43])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d8445db8f6sm317977a91.1.2024.08.27.20.03.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2024 20:03:35 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, alx@kernel.org, justinstitt@google.com,
 ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, penguin-kernel@i-love.sakura.ne.jp,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v8 0/8] Improve the copy of task comm
Date: Wed, 28 Aug 2024 11:03:13 +0800
Message-Id: <20240828030321.20688-1-laoar.shao@gmail.com>
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

Using {memcpy,strncpy,strcpy,kstrdup} to copy the task comm relies on the
length of task comm. Changes in the task comm could result in a destination
string that is overflow. Therefore, we should explicitly ensure the
destination string is always NUL-terminated, regardless of the task comm.
This approach will facilitate future extensions to the task comm.

As suggested by Linus [0], we can identify all relevant code with the
following git grep command:

  git grep 'memcpy.*->comm\>'
  git grep 'kstrdup.*->comm\>'
  git grep 'strncpy.*->comm\>'
  git grep 'strcpy.*->comm\>'

PATCH #2~#4:   memcpy
PATCH #5~#6:   kstrdup
PATCH #7~#8:   strcpy

Please note that strncpy() is not included in this series as it is being
tracked by another effort. [1]

In this series, we have removed __get_task_comm() because the task_lock()
and BUILD_BUG_ON() within it are unnecessary.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/all/CAHk-=wjAmmHUg6vho1KjzQi2=psR30+CogFd4aXrThr2gsiS4g@mail.gmail.com/ [0]

Changes:
v7->v8:
- Avoid '+1' and '-1' in string copy. (Alejandro)

v6->v7: https://lore.kernel.org/all/20240817025624.13157-1-laoar.shao@gmail.com/
- Improve the comment (Alejandro)
- Drop strncpy as it is being tracked by another effort (Justin)
  https://github.com/KSPP/linux/issues/90 [1]

v5->v6: https://lore.kernel.org/linux-mm/20240812022933.69850-1-laoar.shao@gmail.com/
- Get rid of __get_task_comm() (Linus)
- Use ARRAY_SIZE() in get_task_comm() (Alejandro)

v4->v5: https://lore.kernel.org/all/20240804075619.20804-1-laoar.shao@gmail.com/
- Drop changes in the mm/kmemleak.c as it was fixed by
  commit 0b84780134fb ("mm/kmemleak: replace strncpy() with strscpy()")
- Drop changes in kernel/tsacct.c as it was fixed by
  commmit 0fe2356434e ("tsacct: replace strncpy() with strscpy()")

v3->v4: https://lore.kernel.org/linux-mm/20240729023719.1933-1-laoar.shao@gmail.com/
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

Yafang Shao (8):
  Get rid of __get_task_comm()
  auditsc: Replace memcpy() with strscpy()
  security: Replace memcpy() with get_task_comm()
  bpftool: Ensure task comm is always NUL-terminated
  mm/util: Fix possible race condition in kstrdup()
  mm/util: Deduplicate code in {kstrdup,kstrndup,kmemdup_nul}
  net: Replace strcpy() with strscpy()
  drm: Replace strcpy() with strscpy()

 drivers/gpu/drm/drm_framebuffer.c     |  2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c |  2 +-
 fs/exec.c                             | 10 -----
 fs/proc/array.c                       |  2 +-
 include/linux/sched.h                 | 32 +++++++++++---
 kernel/auditsc.c                      |  6 +--
 kernel/kthread.c                      |  2 +-
 mm/util.c                             | 62 ++++++++++++---------------
 net/ipv6/ndisc.c                      |  2 +-
 security/lsm_audit.c                  |  4 +-
 security/selinux/selinuxfs.c          |  2 +-
 tools/bpf/bpftool/pids.c              |  2 +
 12 files changed, 66 insertions(+), 62 deletions(-)

-- 
2.43.5

