Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B37EA5F2C3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 12:44:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4205710E855;
	Thu, 13 Mar 2025 11:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WqugVzZ8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E404B10E856
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 11:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741866271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Vi3vqlZEjhRyke+tn+Q3MD+zw3p/H2XxVRSJ9/S1eBk=;
 b=WqugVzZ8f+Vx4UvGl1aA/yks2AB7/6BChGCJWwALmPCbRn0Fbewym9uuHr5Cf131YKFec+
 QSkNzqUK5AlT8yL/BQgHiCDaiw4iFcZeq32LuUnzss/PqyCAhSAIPNuj0PxnJ+NZL6zQCE
 rmF1KRpf/R1UxtfVqq+V+JUhqrvUA0I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-exjk8KdVOVObjWHFSvL5tg-1; Thu, 13 Mar 2025 07:44:30 -0400
X-MC-Unique: exjk8KdVOVObjWHFSvL5tg-1
X-Mimecast-MFC-AGG-ID: exjk8KdVOVObjWHFSvL5tg_1741866269
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3912d9848a7so1017330f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 04:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741866269; x=1742471069;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vi3vqlZEjhRyke+tn+Q3MD+zw3p/H2XxVRSJ9/S1eBk=;
 b=OegvXNNoJmNvt9PErsIiln7GCqaE4sswmF9WoxV0ph6f9mGdz1LETQa2TzcNBVFk5A
 EMNY90iLBFVOpTOXRwIpfXaMsoV8WlXoFzQiyiNyIYqkP4WdnBRWTqIMb0wl568j9lti
 JXRbPBuhSivPDIdfzOIWQo5sv2nkwWiT+0QQAHrc5jPwrbsZGFMlA+Z3imHueH+bEF6q
 IorPJqP2Yyr5XD/BTFdOfPY9OcXifmQaMqeigwEfK/mNUWbTreGdfHemA+Fko2WhkA+v
 zJNZZmt4VQCuOZwY1qP6fi8VUzRLP/RU0VvuEWR4qp3jCt7tNA/S9xx7j8XWiOdMc7Fw
 RZGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRi8WzVl/VOF/6QssqbBF3n/9Uyn8rPJCMtUTp7JrjDAlWC9eaLmjaXxPr/9u/JoGaGPNjVMsHI9c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUHwdNuJ5vAnqYZd+m7Rh0lAI+Q9svkfuTauXxoVBnnvHNWfg6
 PpkYC5ND9TGJzToCsswO3Aj5j0J8hQDOziCpH/UgLAJ/UvEwpQMAijc2wqJiHZFMS04TLP7vP8T
 1iYXsf/iolbn3XC2EndhnCVdhChsTh1eiUM8Gin2mebkKob9+yuEmUdpDbT2cORKcKg==
X-Gm-Gg: ASbGncsKWDlLmhPPZFlg18rv3ISKfRFzZ7SA63dujelVOA/jx8hcT48fu9Uv1rXzFw4
 66uY8jNn6Ry/tOfEZO1xmxIH3j4ae154p2Rynnn/Miu5j4Pisb2Bjdn9r5klteneN8R3T5Lf8j1
 kfsYjO84285ixYFJmSZFVPSlUVsiyVMYlgVQkqxAdJxSvqHbN1OxgC/vvCf2QtIVqBG966zCPHO
 SaPSQX2+Wu3vkKgv//PJcbvkPLztRDyDcR9E62zTFq0C/UYRVWufCtB4hs4wPm0sqR+KjdUfqaq
 97KQOLG+4AM1qCFtPXcw
X-Received: by 2002:a5d:64cb:0:b0:38f:23c4:208c with SMTP id
 ffacd0b85a97d-395b954ea75mr1784236f8f.18.1741866269100; 
 Thu, 13 Mar 2025 04:44:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5B4S8E4d5tF3TI1rIoUvKO0tSV0G2B0BPE1gxY0qJz2LBrnTYS6FEhx79I2sbOMPQrE3jHw==
X-Received: by 2002:a5d:64cb:0:b0:38f:23c4:208c with SMTP id
 ffacd0b85a97d-395b954ea75mr1784186f8f.18.1741866268630; 
 Thu, 13 Mar 2025 04:44:28 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 04:44:27 -0700 (PDT)
From: Alessandro Carminati <acarmina@redhat.com>
To: linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Guenter Roeck <linux@roeck-us.net>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 loongarch@lists.linux.dev, x86@kernel.org,
 Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 00/14] Add support for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:15 +0000
Message-Id: <20250313114329.284104-1-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HUJ8eDgilnV-XP7h4fSO0SqeVJFrjM7-4rnfJh_wJIY_1741866269
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
nor useful for a number of reasons.
- They can result in overlooked real problems.
- A warning that suddenly starts to show up in unit tests needs to be
  investigated and has to be marked to be ignored, for example by
  adjusting filter scripts. Such filters are ad-hoc because there is
  no real standard format for warnings. On top of that, such filter
  scripts would require constant maintenance.

One option to address problem would be to add messages such as "expected
warning backtraces start / end here" to the kernel log.  However, that
would again require filter scripts, it might result in missing real
problematic warning backtraces triggered while the test is running, and
the irrelevant backtrace(s) would still clog the kernel log.

Solve the problem by providing a means to identify and suppress specific
warning backtraces while executing test code. Support suppressing multiple
backtraces while at the same time limiting changes to generic code to the
absolute minimum. Architecture specific changes are kept at minimum by
retaining function names only if both CONFIG_DEBUG_BUGVERBOSE and
CONFIG_KUNIT are enabled.

The first patch of the series introduces the necessary infrastructure.
The second patch introduces support for counting suppressed backtraces.
This capability is used in patch three to implement unit tests.
Patch four documents the new API.
The next two patches add support for suppressing backtraces in drm_rect
and dev_addr_lists unit tests. These patches are intended to serve as
examples for the use of the functionality introduced with this series.
The remaining patches implement the necessary changes for all
architectures with GENERIC_BUG support.

With CONFIG_KUNIT enabled, image size increase with this series applied is
approximately 1%. The image size increase (and with it the functionality
introduced by this series) can be avoided by disabling
CONFIG_KUNIT_SUPPRESS_BACKTRACE.

This series is based on the RFC patch and subsequent discussion at
https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-4b08-ba81-d94f3b691c9a@moroto.mountain/
and offers a more comprehensive solution of the problem discussed there.

Design note:
  Function pointers are only added to the __bug_table section if both
  CONFIG_KUNIT_SUPPRESS_BACKTRACE and CONFIG_DEBUG_BUGVERBOSE are enabled
  to avoid image size increases if CONFIG_KUNIT is disabled. There would be
  some benefits to adding those pointers all the time (reduced complexity,
  ability to display function names in BUG/WARNING messages). That change,
  if desired, can be made later.

Checkpatch note:
  Remaining checkpatch errors and warnings were deliberately ignored.
  Some are triggered by matching coding style or by comments interpreted
  as code, others by assembler macros which are disliked by checkpatch.
  Suggestions for improvements are welcome.

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

----
Guenter Roeck (14):
  bug/kunit: Core support for suppressing warning backtraces
  kunit: bug: Count suppressed warning backtraces
  kunit: Add test cases for backtrace warning suppression
  kunit: Add documentation for warning backtrace suppression API
  drm: Suppress intentional warning backtraces in scaling unit tests
  x86: Add support for suppressing warning backtraces
  arm64: Add support for suppressing warning backtraces
  loongarch: Add support for suppressing warning backtraces
  parisc: Add support for suppressing warning backtraces
  s390: Add support for suppressing warning backtraces
  sh: Add support for suppressing warning backtraces
  sh: Move defines needed for suppressing warning backtraces
  riscv: Add support for suppressing warning backtraces
  powerpc: Add support for suppressing warning backtraces

 Documentation/dev-tools/kunit/usage.rst |  30 ++++++-
 arch/arm64/include/asm/asm-bug.h        |  27 ++++--
 arch/arm64/include/asm/bug.h            |   8 +-
 arch/loongarch/include/asm/bug.h        |  42 +++++++---
 arch/parisc/include/asm/bug.h           |  29 +++++--
 arch/powerpc/include/asm/bug.h          |  37 +++++++--
 arch/riscv/include/asm/bug.h            |  38 ++++++---
 arch/s390/include/asm/bug.h             |  17 +++-
 arch/sh/include/asm/bug.h               |  28 ++++++-
 arch/x86/include/asm/bug.h              |  21 +++--
 drivers/gpu/drm/tests/drm_rect_test.c   |  16 ++++
 include/asm-generic/bug.h               |  16 +++-
 include/kunit/bug.h                     |  56 +++++++++++++
 include/kunit/test.h                    |   1 +
 include/linux/bug.h                     |  13 +++
 lib/bug.c                               |  51 +++++++++++-
 lib/kunit/Kconfig                       |   9 ++
 lib/kunit/Makefile                      |   7 +-
 lib/kunit/backtrace-suppression-test.c  | 104 ++++++++++++++++++++++++
 lib/kunit/bug.c                         |  42 ++++++++++
 20 files changed, 519 insertions(+), 73 deletions(-)
 create mode 100644 include/kunit/bug.h
 create mode 100644 lib/kunit/backtrace-suppression-test.c
 create mode 100644 lib/kunit/bug.c

-- 
2.34.1

