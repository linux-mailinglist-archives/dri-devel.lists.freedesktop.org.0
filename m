Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0C8AC4061
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 15:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21D110E2F2;
	Mon, 26 May 2025 13:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DbVPeuYA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196C910E22F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 13:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748266098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CaDjeuor3qvehrWwyZqxrxslYPrtt2O/kVi0sHBOQXY=;
 b=DbVPeuYA9UXFk3J25RRyRQcu9QuxWnMAybuD2CBM/SEb5G9eZa2OJ6ZTK9Nbg/48w1NSjB
 4PIJ31MHZfyFr+fjQX369akd67SmMF8+g7Jc6pkB6vmezQB96quRPHF+CKue1XU42Ri0Lm
 OEH9UE489bwcIhTHnVJZyeitKERXHcQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-s9FMVNumPNCthP1wQBs_8g-1; Mon, 26 May 2025 09:28:16 -0400
X-MC-Unique: s9FMVNumPNCthP1wQBs_8g-1
X-Mimecast-MFC-AGG-ID: s9FMVNumPNCthP1wQBs_8g_1748266095
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a4cfda0ab8so649459f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 06:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748266095; x=1748870895;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CaDjeuor3qvehrWwyZqxrxslYPrtt2O/kVi0sHBOQXY=;
 b=UerhFobR5BOweCHbW6RBx9XQgB7EHnZPDTbFGd9KHMZyAgDqbSf1gERYsaXnoAY484
 9jwQgvPZF3it4Y8UUWJ++JX4hxPsD5CDL+LArhIv1S5/7qQyHRQK/bn9ACX6hd2iQlE0
 ThM+CFGcbrRul6qZ6AoGULJjfQ0wj/7DveIeQu+x8YNa1RVvkyxZwwWM5Vo3OUc682jT
 /xnAR/snw1jzquvkdu7DwxItKqo4fV9MN1k2lEnjMNpOazLR1C2d8fNke/U/3i3FybQl
 k2bgF19IMRS7fv9E8WbMV0pY877fSfiGRj8jG54UB45qAQdyQP1Kc9GjGpq0OSYpR9DB
 HOgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgTovlhcMvoKo+YE/undWcmmszQSltx/vTdwPvRPxfsENHFvQqGD7IWZCI7VUa3Lof+osnZB6KdEU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yznm4wDdARANZ0zFDhmZCR0hKajDSyE0HNm6Sn7jxt+Z7+SyYDJ
 yvm/mZx7PO/TuriCU0f+RqtDpgHSnLP4Y+jDjhPvcZh2XldG3D13h+jh+gkIGd2HzC2mkpFrhCT
 5xsm4pOjp+gj1NMRelaC2je16rR4LLZQq546dk3NQi25b4Xgt0zJkfa6U2QxWR0ApfvdiKg==
X-Gm-Gg: ASbGncuX/KJ+ef/omMGsmpvvo9DPJrxC2Oz6WkZAjmi4WkibKZPDXk/7sd1CCwetQeJ
 /umKN5+Y6hvEPs8tjdufIE+zxhyjaqaoPcG1wL7Xt14o3lfwp43iwPtjeCaH9bN+KuMAmQiuSm5
 P+eMDfNxKbgmgAZvD67DyLS8Zoiyl1i3h4c2pYPLKz11CPmf8Yf9WQgtQsIlT2SJXhMhy/bu8RD
 LkJnl56DTI1yVILOvTUEG/v7kBDt8hsFu4ShJvS/Q7z5kfoeq6o/O/iKXaPb4iaEeM7dRH6t992
 99bcWYcVGZefPdrJ
X-Received: by 2002:a05:6000:2301:b0:3a4:da87:3a73 with SMTP id
 ffacd0b85a97d-3a4da873b5dmr1710145f8f.42.1748266094788; 
 Mon, 26 May 2025 06:28:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeYvbzrZNcWcmW1qUBxQajDh+d2LT6ajoVkh4KOQZsRA+0DvHZ1ZoRl+TxtNrpzzd9byku2A==
X-Received: by 2002:a05:6000:2301:b0:3a4:da87:3a73 with SMTP id
 ffacd0b85a97d-3a4da873b5dmr1710127f8f.42.1748266094346; 
 Mon, 26 May 2025 06:28:14 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3a4c8455e7dsm8836663f8f.9.2025.05.26.06.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 06:28:13 -0700 (PDT)
From: Alessandro Carminati <acarmina@redhat.com>
To: linux-kselftest@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Guenter Roeck <linux@roeck-us.net>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v5 0/5] kunit: Add support for suppressing warning backtraces
Date: Mon, 26 May 2025 13:27:50 +0000
Message-Id: <20250526132755.166150-1-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: obr9wefTq93GWnGbNyBKDMwXe3qj8jwpZ4F5-mZmUCU_1748266095
X-Mimecast-Originator: redhat.com
Content-type: text/plain
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

Some unit tests intentionally trigger warning backtraces by passing bad
parameters to kernel API functions. Such unit tests typically check the
return value from such calls, not the existence of the warning backtrace.

Such intentionally generated warning backtraces are neither desirable
nor useful for a number of reasons:
- They can result in overlooked real problems.
- A warning that suddenly starts to show up in unit tests needs to be
  investigated and has to be marked to be ignored, for example by
  adjusting filter scripts. Such filters are ad hoc because there is
  no real standard format for warnings. On top of that, such filter
  scripts would require constant maintenance.

One option to address the problem would be to add messages such as
"expected warning backtraces start/end here" to the kernel log.
However, that would again require filter scripts, might result in
missing real problematic warning backtraces triggered while the test
is running, and the irrelevant backtrace(s) would still clog the
kernel log.

Solve the problem by providing a means to identify and suppress specific
warning backtraces while executing test code. Support suppressing multiple
backtraces while at the same time limiting changes to generic code to the
absolute minimum.

Overview:
Patch#1 Introduces the suppression infrastructure.
Patch#2 Mitigate the impact at WARN*() sites.
Patch#3 Adds selftests to validate the functionality.
Patch#4 Demonstrates real-world usage in the DRM subsystem.
Patch#5 Documents the new API and usage guidelines.

Design Notes:
The objective is to suppress unwanted WARN*() generated messages.

Although most major architectures share common bug handling via `lib/bug.c`
and `report_bug()`, some minor or legacy architectures still rely on their
own platform-specific handling. This divergence must be considered in any
such feature. Additionally, a key challenge in implementing this feature is
the fragmentation of `WARN*()` messages emission: specific part in the
macro, common with BUG*() part in the exception handler.
As a result, any intervention to suppress the message must occur before the
illegal instruction.

Lessons from the Previous Attempt
In earlier iterations, suppression logic was added inside the
`__report_bug()` function to intercept WARN*() messages not producing
messages in the macro.
To implement the check in the check in the bug handler code, two strategies
were considered:

* Strategy #1: Use `kallsyms` to infer the originating functionid, namely
  a pointer to the function. Since in any case, the user interface relies
  on function names, they must be translated in addresses at suppression-
  time or at check-time.
  Assuming to translate at suppression-time, the `kallsyms` subsystem needs
  to be used to determine the symbol address from the name, and again to
  produce the functionid from `bugaddr`. This approach proved unreliable
  due to compiler-induced transformations such as inlining, cloning, and
  code fragmentation. Attempts to preventing them is also unconvenient
  because several `WARN()` sites are in functions intentionally declared 
  as `__always_inline`.

* Strategy #2: Store function name `__func__` in `struct bug_entry` in
  the `__bug_table`. This implementation was used in the previous version.
  However, `__func__` is a compiler-generated symbol, which complicates
  relocation and linking in position-independent code. Workarounds such as
  storing offsets from `.rodata` or embedding string literals directly into
  the table would have significantly either increased complexity or
  increase the __bug_table size. 
  Additionally, architectures not using the unified `BUG()` path would 
  still require ad-hoc handling. Because current WARN*() message production
  strategy, a few WARN*() macros still need a check to suppress the part of
  the message produced in the macro itself.

Current Proposal: Check Directly in the `WARN()` Macros.
This avoids the need for function symbol resolution or ELF section
modification.
Suppression is implemented directly in the `WARN*()` macros.

A helper function, `__kunit_is_suppressed_warning()`, is used to determine
whether suppression applies. It is marked as `noinstr`, since some `WARN*()`
sites reside in non-instrumentable sections. As it uses `strcmp`, a
`noinstr` version of `strcmp` was introduced.
The implementation is deliberately simple and avoids architecture-specific
optimizations to preserve portability. Since this mechanism compares
function names and is intended for test usage only, performance is not a
primary concern.

This series is based on the RFC patch and subsequent discussion at
https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-4b08-ba81-d94f3b691c9a@moroto.mountain/
and offers a more comprehensive solution of the problem discussed there.

Changes since RFC:
- Introduced CONFIG_KUNIT_SUPPRESS_BACKTRACE
- Minor cleanups and bug fixes
- Added support for all affected architectures
- Added support for counting suppressed warnings
- Added unit tests using those counters
- Added patch to suppress warning backtraces in dev_addr_lists tests

Changes since v1:
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
  [I retained those tags since there have been no functional changes]
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option, enabled by
  default.

Changes since v2:
- Rebased to v6.9-rc2
- Added comments to drm warning suppression explaining why it is needed.
- Added patch to move conditional code in arch/sh/include/asm/bug.h
  to avoid kerneldoc warning
- Added architecture maintainers to Cc: for architecture specific patches
- No functional changes

Changes since v3:
- Rebased to v6.14-rc6
- Dropped net: "kunit: Suppress lock warning noise at end of dev_addr_lists tests"
  since 3db3b62955cd6d73afde05a17d7e8e106695c3b9
- Added __kunit_ and KUNIT_ prefixes.
- Tested on interessed architectures.

Changes since v4:
- Rebased to v6.15-rc7
- Dropped all code in __report_bug()
- Moved all checks in WARN*() macros.
- Dropped all architecture specific code.
- Made __kunit_is_suppressed_warning nice to noinstr functions.

Alessandro Carminati (2):
  bug/kunit: Core support for suppressing warning backtraces
  bug/kunit: Suppressing warning backtraces reduced impact on WARN*()
    sites

Guenter Roeck (3):
  Add unit tests to verify that warning backtrace suppression works.
  drm: Suppress intentional warning backtraces in scaling unit tests
  kunit: Add documentation for warning backtrace suppression API

 Documentation/dev-tools/kunit/usage.rst |  30 ++++++-
 drivers/gpu/drm/tests/drm_rect_test.c   |  16 ++++
 include/asm-generic/bug.h               |  48 +++++++----
 include/kunit/bug.h                     |  62 ++++++++++++++
 include/kunit/test.h                    |   1 +
 lib/kunit/Kconfig                       |   9 ++
 lib/kunit/Makefile                      |   9 +-
 lib/kunit/backtrace-suppression-test.c  | 105 ++++++++++++++++++++++++
 lib/kunit/bug.c                         |  54 ++++++++++++
 9 files changed, 316 insertions(+), 18 deletions(-)
 create mode 100644 include/kunit/bug.h
 create mode 100644 lib/kunit/backtrace-suppression-test.c
 create mode 100644 lib/kunit/bug.c

-- 
2.34.1

