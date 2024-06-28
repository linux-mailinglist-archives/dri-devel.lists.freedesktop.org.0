Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE4F91BA83
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 10:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7B210E10D;
	Fri, 28 Jun 2024 08:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T3IWZ7hz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4706810E10D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 08:58:10 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1faad409ca7so10058665ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 01:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719565090; x=1720169890; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p+oKp38c6s8xaT2ZLZhMjXUeTO03kiDRVYzSyaWPaE0=;
 b=T3IWZ7hzjI2rWRAS39SBtpAA0ZLsaBN/Ht/WpA9QKcsRQr+IOnS0eR33mOAynNZtqx
 c9wH5zJSoPE/6HyWxQkyXJwtFPbgcryl4AidkHiv4tLbR44ze+hlL5ebtdSQ5Ok3kDAO
 9nvgnlu59fk9EEOmoRTqQ5qQrXLXORgxDoKD8bkYCdkYR+neVPz6ySSbRF8qTB5W4b0w
 wNzz7r6Twh2SArlj3X0yd35rsuUOkOAqZ4J2HZJw1nf/pL/OSRQPmuyFxSJP72S3m/Tx
 xrGeswi0zZbVzSBfpVXHMol8si+8xln/HhsMGIXpF+zDb9lWaFNSZ2T0MGUVquXRw9P7
 Vqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719565090; x=1720169890;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p+oKp38c6s8xaT2ZLZhMjXUeTO03kiDRVYzSyaWPaE0=;
 b=eVd8Sax1IfLPIghvlqww39c0Skas6xWFI+MInsEeSLnAhn2/XJdAs1+Qwft1p0s+3w
 UsOFBA2VFyGcVTZWE2VsY8xYSxBYLUjQRNbQUk7AZGKO02BjBhYDAOCZJ8A2dBHtE/PS
 CPREy8TzOdBMDg62j/jhi8+qmAzFotaeg4iTuXTZnTRuWNrl1eFSQFI1CABhCfJJ7hp3
 JaSXv3if5SVruJ26ClRTl/Rpz9UHSntNlQVO7VEZbZfubjH7BtDlvVyghZAOfqwaaGMf
 c/b0jYA1Y36043mGTnZmuCvQzJCjPKu1be3nvH3feaE96j+FCktko0fuRdpkaVmh1mvO
 Ryog==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeYgjU4WBVfqHs9uU92CWObccbek5el9765vvXH2VSVGhDJLoPxtCH/IcbYL6pEJSMQATLmIeCSCu6na+dISfe2hz5UVOA4J1832Pm8uGN
X-Gm-Message-State: AOJu0YyKh6hQnv7x57C+0waXRUbSEfjfzxN514tKwLIPQWXoGDE8YcFV
 jJuTrk5OU1ZgK62ggM1HQZ8L1jhPKbFaUGFhYN6bI999Z7DQFntf
X-Google-Smtp-Source: AGHT+IHW5n7W+Hsi/3tpD3rJbrf7D7rBby69hy4/8oAP7PWGB8JzPIs+Xaa9S3prTCBl6bkFGCqEaA==
X-Received: by 2002:a17:902:daca:b0:1f9:f6c5:b483 with SMTP id
 d9443c01a7336-1fac7f0478bmr14804095ad.27.1719565089631; 
 Fri, 28 Jun 2024 01:58:09 -0700 (PDT)
Received: from localhost.localdomain ([39.144.106.153])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac1596728sm10270615ad.256.2024.06.28.01.57.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2024 01:58:09 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: torvalds@linux-foundation.org
Cc: ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org,
 catalin.marinas@arm.com, akpm@linux-foundation.org,
 penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 audit@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v4 00/11] Improve the copy of task comm
Date: Fri, 28 Jun 2024 16:57:39 +0800
Message-Id: <20240628085750.17367-1-laoar.shao@gmail.com>
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

