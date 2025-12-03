Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DF8C9FE9D
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 17:23:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2777910E83D;
	Wed,  3 Dec 2025 16:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YQk3yGBl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com
 [74.125.224.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C6C10E15D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 16:23:31 +0000 (UTC)
Received: by mail-yx1-f47.google.com with SMTP id
 956f58d0204a3-6443b62daf6so416176d50.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 08:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764779011; x=1765383811; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mNK//JpS9hirQN90oXpJD1gUxWiQ6E+9iQMheM4lBcw=;
 b=YQk3yGBlaA2g2nKFit0VdCvlASg08QsskANuQEMEN3CnOXIpKVp7VGiXSWmG1uHrtP
 Y3NTy9zYbFoDbC/SbjJ914+c96RiShtPNvAB694PVJP63xA3GeR9EoVuQcL6dTGQVF2C
 F0urlF6OXkx7ZTIVSviO8SRBwyidB5n9bgdiVfR0VNMZmuUxlpw6YrnjiHmFmcbHsvud
 G37KgX6ur8j/PLWUxWdSEaES1xF0/PC1j3QYtsnb0ENJgVX7q0qUaIF2NVgXQopus9lV
 uG2s0xTTbpmaZg7jg913AyqA4IldbdBr6OiTtLT6ZTl8ZH6RcIG+BXvCXdtHyQiK0miu
 2Z4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764779011; x=1765383811;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mNK//JpS9hirQN90oXpJD1gUxWiQ6E+9iQMheM4lBcw=;
 b=boB1W0aHkRU8hdnO92UBmj1j6Uqm6ftV9NPINXpHEb0S5a8LPAjLgZddP7/oI7C9xT
 swK8DpgsgoMgL3WpyU5OX4cwcu3qOJ+iViL+EtBU6Qwc6u8hY0JTzvzZrJtvu9l9QqSO
 BP6qb4yBb7rRbyBK8Js6RI+ItyrA/6YudMNNKnKDDv80GlHh7/iew9TLQFEeKl7wO7XG
 DYbRlG+gA6mXTLxB3kwSTPjRfDBv+BAkxSPbRZnM9pdvl/XS5zXFcxZqmTVBf+1uX4Uf
 5MfwdegiuRNEPPV5rZEP1cfZX8sBIxDZ0a2fFpDbqoxljLgnGrl/JMSgNrT1Cgqgk49U
 aVTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvYtorL1rbqnju8g+87aioNIWD8bAYvmJf8oCe8SNkNim4xwI1mwvbFIhT/ENwV7cHa8UwAivpEZk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCAKjHjh5RyilTDg400O9r6bqQhLU4RzSwgCK55azio+8uJ9ER
 pGvEPn6n3t4EHwPKrFWCFmUnnRwqsaHy9dpk9vLal6pmMrcUa14MX3iZ
X-Gm-Gg: ASbGncv55W+7LhMfsebTddkeGWS30tYMIUNYfENP5hvm7x2878MJiRxWiErxHwbQx0m
 MqEEOBqM7IpxCa06ACMzivy3lxeI8/fS44sLg+B4Yh7k+fncmjWXLBaJB+/mSZW7EHwYbsZ/wdI
 GBBNPpNg8jNl2lvKYjB4Cz93e2YjFEPRxOCcHBQTkqXO1GIXmVQHGMZAHz7Ph7573g9Ugn99o3j
 mzAih60ruKot4GSsnT7Q4fqZPMcD9HnNxWBH6QzmjmEdn//TcF3tA6KIOEI2yDh0idZAsxN+hiX
 1lxvrK9xbrj9ivJO+/ilKIwRWUiXGzQAtW2oxH5OZluZeFXENiXU3NZjnujq10zS18su3djHCKj
 f+gkYeIXUPgDEqRg0lGxE+nnSrhWXC1nVkjSy22xOf6OhGZGLdIOrmSNVA+Bp/FUBPRZYnnwvtK
 zMQjgYKHo=
X-Google-Smtp-Source: AGHT+IFbqbKS7r+NlCXK/8J98hJM3a/US0gzPftZwuaa3JUY2EfeVswum0kC2L5AoZFpIWqi7rzeVg==
X-Received: by 2002:a05:690e:e8d:b0:63f:af64:ae5a with SMTP id
 956f58d0204a3-6443704b94amr2258748d50.58.1764779011007; 
 Wed, 03 Dec 2025 08:23:31 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:3422:8bf9:97bc:b085])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-78ad0d3f600sm75866767b3.9.2025.12.03.08.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 08:23:30 -0800 (PST)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: [PATCH v2 0/4] Unload linux/kernel.h
Date: Wed,  3 Dec 2025 11:23:21 -0500
Message-ID: <20251203162329.280182-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
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

kernel.h hosts declarations that can be placed better.

Testing (0-Day):
alpha                               defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251202    gcc-8.5.0
arc                   randconfig-002-20251202    gcc-12.5.0
arm                                 defconfig    clang-22
arm                   randconfig-001-20251202    clang-17
arm                   randconfig-002-20251202    clang-22
arm                   randconfig-003-20251202    clang-22
arm                   randconfig-004-20251202    gcc-14.3.0
arm                       spear13xx_defconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251202    clang-22
arm64                 randconfig-002-20251202    clang-22
arm64                 randconfig-003-20251202    clang-16
arm64                 randconfig-004-20251202    clang-22
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251202    gcc-13.4.0
csky                  randconfig-002-20251202    gcc-15.1.0
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251202    clang-22
hexagon               randconfig-002-20251202    clang-22
i386                             allmodconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251202    clang-20
i386        buildonly-randconfig-002-20251202    gcc-14
i386        buildonly-randconfig-003-20251202    clang-20
i386        buildonly-randconfig-004-20251202    clang-20
i386        buildonly-randconfig-005-20251202    clang-20
i386        buildonly-randconfig-006-20251202    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251202    clang-20
i386                  randconfig-002-20251202    gcc-14
i386                  randconfig-003-20251202    gcc-14
i386                  randconfig-004-20251202    clang-20
i386                  randconfig-005-20251202    gcc-14
i386                  randconfig-006-20251202    clang-20
i386                  randconfig-007-20251202    clang-20
i386                  randconfig-011-20251202    clang-20
i386                  randconfig-012-20251202    clang-20
i386                  randconfig-013-20251202    gcc-14
i386                  randconfig-014-20251202    gcc-14
i386                  randconfig-015-20251202    gcc-14
i386                  randconfig-016-20251202    clang-20
i386                  randconfig-017-20251202    clang-20
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251202    gcc-15.1.0
loongarch             randconfig-002-20251202    clang-22
m68k                                defconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
nios2                         10m50_defconfig    gcc-11.5.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251202    gcc-8.5.0
nios2                 randconfig-002-20251202    gcc-8.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                generic-32bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20251202    gcc-9.5.0
parisc                randconfig-002-20251202    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251202    clang-22
powerpc               randconfig-002-20251202    gcc-10.5.0
powerpc64             randconfig-001-20251202    clang-22
powerpc64             randconfig-002-20251202    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                    nommu_k210_defconfig    clang-22
riscv                 randconfig-001-20251202    gcc-9.5.0
riscv                 randconfig-002-20251202    clang-22
s390                              allnoconfig    clang-22
s390                                defconfig    clang-22
s390                  randconfig-001-20251202    clang-17
s390                  randconfig-002-20251202    gcc-13.4.0
sh                                allnoconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251202    gcc-15.1.0
sh                    randconfig-002-20251202    gcc-12.5.0
sh                          rsk7269_defconfig    gcc-15.1.0
sh                     sh7710voipgw_defconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251202    gcc-8.5.0
sparc                 randconfig-002-20251202    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251202    gcc-8.5.0
sparc64               randconfig-002-20251202    gcc-10.5.0
um                                allnoconfig    clang-22
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251202    clang-17
um                    randconfig-002-20251202    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251202    gcc-14
x86_64      buildonly-randconfig-002-20251202    gcc-14
x86_64      buildonly-randconfig-003-20251202    clang-20
x86_64      buildonly-randconfig-004-20251202    gcc-13
x86_64      buildonly-randconfig-005-20251202    gcc-14
x86_64      buildonly-randconfig-006-20251202    gcc-13
x86_64                              defconfig    gcc-14
x86_64                randconfig-011-20251202    clang-20
x86_64                randconfig-012-20251202    gcc-13
x86_64                randconfig-013-20251202    gcc-14
x86_64                randconfig-014-20251202    clang-20
x86_64                randconfig-015-20251202    clang-20
x86_64                randconfig-016-20251202    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251202    gcc-11.5.0
xtensa                randconfig-002-20251202    gcc-11.5.0

v1: https://lore.kernel.org/all/20251129195304.204082-1-yury.norov@gmail.com/
v2: 
 - more historical context for STACK_MAGIC removal (Christophe);
 - place STACK_MAGIC in i915_selftest.h (Jan);
 - new patch #2: moduleparam: include required headers explicitly (Petr);
 - align Documentation/filesystems/sysfs.rst (Andy);
 - more motivation for linux/tracing.h (Andy, Steven);

Yury Norov (NVIDIA) (4):
  kernel.h: drop STACK_MAGIC macro
  moduleparam: include required headers explicitly
  kernel.h: move VERIFY_OCTAL_PERMISSIONS() to sysfs.h
  tracing: move tracing declarations from kernel.h to a dedicated header

 Documentation/filesystems/sysfs.rst           |   2 +-
 MAINTAINERS                                   |   1 +
 .../drm/i915/gt/selftest_ring_submission.c    |   1 +
 drivers/gpu/drm/i915/i915_selftest.h          |   2 +
 include/linux/kernel.h                        | 209 +-----------------
 include/linux/moduleparam.h                   |   7 +-
 include/linux/sysfs.h                         |  13 ++
 include/linux/tracing.h                       | 203 +++++++++++++++++
 8 files changed, 228 insertions(+), 210 deletions(-)
 create mode 100644 include/linux/tracing.h

-- 
2.43.0

