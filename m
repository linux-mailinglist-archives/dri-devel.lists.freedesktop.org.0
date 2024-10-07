Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ED6992FC6
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 16:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0253310E0D0;
	Mon,  7 Oct 2024 14:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UrDW4LnX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271BD10E0D0
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 14:49:32 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-71e023635acso769132b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 07:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728312571; x=1728917371; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LUiVT68fLR3vW4CyEtRR57v0fZ51pf3YQeR56Ep4krg=;
 b=UrDW4LnX40v1nXSnepbhQQE/SKcciubdcxloSfM0UJFqBLgrah4x+lAXXDpNi8ZOB1
 AYeIZnZgeP+WVWML5Fp+/zoqt+SykHsBTZV2KDclBIjKsG6qN2F/xS0w5AZF+hqpxPO7
 dI5hPWNQd9xSKqa7SEXVVcjDm821CwDL746p+B0nXW+va5V++37puQK0mPCSW5uL6Rov
 NqhpWlmC3Izcnde+6/O2UkA0O88XKDICW1ynO/1mdSfONpaWrrRwRCWCWyyKYjQElS6S
 frBGGIrl9iY06AKHN0uSXbpK+2u0lGuz6Sd/HDWOIJvJEOJY7dtSK5yHDvPOgJSln48M
 mcrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728312571; x=1728917371;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LUiVT68fLR3vW4CyEtRR57v0fZ51pf3YQeR56Ep4krg=;
 b=oX1OxxBion0ldLHuKrAsPl191rEQCuZx3GZ2At0h3UaoLtrGMWAIsH+Ui3s5LxwWq/
 MMk+ZAQNENOPmvaYP7+RvCe/D6Mussst0Vyl7ewE/H/X/qidciI97/gAA8iSslVA9Hq/
 Os26nGm+mRY8LNuvJ0+Xg2+U2WGLoaac9H8+JbMRF0HVPAILJ1CQhxxxykRyy47C2WWU
 mr3QjAnENAy35tjbI9WniomBGXIgInN3BDjpP5b84IOg8OWhbfHDhYSBweso9kPlNas6
 vyoR9LkNaNv94rnogfC3BXMbvHfAau9ab4P8Yp4Y1SW79JjBeQFV8e+FQ4miYWfBUC+1
 sUVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAJkk3Jl4s0KWXXQoIzyBK252k4HrRTLCCVeLhDLZTavkqyHHPtWGFsgAd34Ra8E9is8sZ73K4e1g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtqzLd3BJHISnKT0wKFlj2PIL2qVAIsh49WqhnY6BzTPionTTu
 X1Pk4UIFXv6o++uP2zgXf0U8I0Oge+sa0II0AFtHCTlfPuvz6HM4
X-Google-Smtp-Source: AGHT+IFd5G5JZb9zGuck27vY3G5rfm6RRd7wrvlQcG7A8r1xXm54v9yJmOzv7wLCL4FHuPfrgLQA4A==
X-Received: by 2002:a05:6a00:3a14:b0:717:9768:a4f0 with SMTP id
 d2e1a72fcca58-71de22eb62bmr20503670b3a.0.1728312571513; 
 Mon, 07 Oct 2024 07:49:31 -0700 (PDT)
Received: from localhost.localdomain ([223.104.210.43])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71df0d7cf82sm4466432b3a.200.2024.10.07.07.49.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Oct 2024 07:49:30 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, keescook@chromium.org, alx@kernel.org,
 justinstitt@google.com, ebiederm@xmission.com,
 alexei.starovoitov@gmail.com, rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v9 0/7] Improve the copy of task comm
Date: Mon,  7 Oct 2024 22:49:04 +0800
Message-Id: <20241007144911.27693-1-laoar.shao@gmail.com>
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
PATCH #7:      strcpy

Please note that strncpy() is not included in this series as it is being
tracked by another effort. [1]

task_lock() is removed from get_task_comm() as it is unnecessary.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/all/CAHk-=wjAmmHUg6vho1KjzQi2=psR30+CogFd4aXrThr2gsiS4g@mail.gmail.com/ [0]

Changes:
v8->v9:
- Keep the BUILD_BUG_ON() in get_task_comm() (Kees)
- Keep strscpy_pad() in get_task_comm() (Kees)
- Replace more strcpy() with strscpy() in
  drivers/gpu/drm/i915/i915_gpu_error.c (Justin)
- Fix typos and commit improvement in patch #5 (Andy)
- Drop the change in net as it was fixed by
  b19f69a95830 ("net/ipv6: replace deprecated strcpy with strscpy")

v7->v8: https://lore.kernel.org/all/20240828030321.20688-1-laoar.shao@gmail.com/
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
  commit 0fe2356434e ("tsacct: replace strncpy() with strscpy()")

v3->v4: https://lore.kernel.org/linux-mm/20240729023719.1933-1-laoar.shao@gmail.com/
- Rename __kstrndup() to __kmemdup_nul() and define it inside mm/util.c
  (Matthew)
- Remove unused local variable (Simon)

v2->v3: https://lore.kernel.org/all/20240621022959.9124-1-laoar.shao@gmail.com/
- Deduplicate code around kstrdup (Andrew)
- Add commit log for dropping task_lock (Catalin)

v1->v2: https://lore.kernel.org/bpf/20240613023044.45873-1-laoar.shao@gmail.com/
- Add comment for dropping task_lock() in __get_task_comm() (Alexei)
- Drop changes in trace event (Steven)
- Fix comment on task comm (Matus)

v1: https://lore.kernel.org/all/20240602023754.25443-1-laoar.shao@gmail.com/

Yafang Shao (7):
  Get rid of __get_task_comm()
  auditsc: Replace memcpy() with strscpy()
  security: Replace memcpy() with get_task_comm()
  bpftool: Ensure task comm is always NUL-terminated
  mm/util: Fix possible race condition in kstrdup()
  mm/util: Deduplicate code in {kstrdup,kstrndup,kmemdup_nul}
  drm: Replace strcpy() with strscpy()

 drivers/gpu/drm/drm_framebuffer.c     |  2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c |  6 +--
 fs/exec.c                             | 10 -----
 fs/proc/array.c                       |  2 +-
 include/linux/sched.h                 | 28 +++++++++---
 kernel/auditsc.c                      |  6 +--
 kernel/kthread.c                      |  2 +-
 mm/util.c                             | 62 ++++++++++++---------------
 security/lsm_audit.c                  |  4 +-
 security/selinux/selinuxfs.c          |  2 +-
 tools/bpf/bpftool/pids.c              |  2 +
 11 files changed, 63 insertions(+), 63 deletions(-)

-- 
2.43.5

