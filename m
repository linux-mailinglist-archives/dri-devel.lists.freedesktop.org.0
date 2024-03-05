Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EE98726BF
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 19:40:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073C11127B1;
	Tue,  5 Mar 2024 18:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A6OEg3YI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B801127B1
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 18:40:40 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-36524116e30so3171055ab.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 10:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709664040; x=1710268840; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=YQLzgqGcJCQTSOmHQSBuR9Qy4cscbXhB7FIpF8lqDFg=;
 b=A6OEg3YINMt3ouUDMgtjKviRpqjxHZoODRLFaxcaGZw69/fhSPms1zfN2GrSzMmF+G
 je28i7ho3OTtXNGxMtfwYkF4B4laN+pDi0C8xn6/Vpqt8W1qurfWKt2W1piN8xDqvsJ/
 /4ZD+k+/WxSbV58pkJqSchWeFjW0wPrSUhCEMDA9z+WntS28wG73AiEtU7qIBTmBaojg
 eRE+7v2nTgexDJtkkJQl+XrRZw7ns4MNn8KK1gp/ijexgtr8ig7uKCRsnHSL7v3De0Mk
 3fZzBuRu0KMjTvxOAoJcDajSCoV26jZgUfe91uZwLokaXHnag9u8NZF8OvPR63KnyCvH
 695g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709664040; x=1710268840;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YQLzgqGcJCQTSOmHQSBuR9Qy4cscbXhB7FIpF8lqDFg=;
 b=pdAGnzKy+/oyj0ISpD7+T63XrB41kGTocFj5tb4pK0HIM//8KxFUGUXCl7Z8V9wCAs
 EygAJ0pQghaK5nvqG7i5BEW6onyuTF+KAJlS1ZfBeXGqnFE3mBEuJ48FzGfEMHe51nQt
 U6IE5LVQuXbD1Sinpq1FSu1R092YWEJlBaIu+EJ3KfBuHoBQ+9I9FNo2DTTyWYvmqXPX
 4YDa1whkk9FzwT7z4yrNyG4ZaKXm9hLPSpxcbEMMVfWILxDMEhx+wFFlibR1cbPm2w67
 29z85eoYOpQiSG+YDwjQCAJOFvHZdeBec25QtndtZ7GgylJGtqxBw0cs6WsM84bpNB1r
 eQ6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbCncO5hDVUR2un0Y3eRYuRENfVUYxdbcSf5ymSFcYFzVKVjUQD4Plb2V62roGPv5ayFhsTwWclFjQhy5Sy8OVgbnl0SDtDiqSUB5im5Y8
X-Gm-Message-State: AOJu0Yx/+OPAgNwL8wAf0hZfhvGwnsCbBaIiw3o9JkN6VjvHxKtxAWTZ
 kzTRrw7Csx8Ni/h1ustTP90WvxSIFrS89ulhiVupDHiSZe+cKPWJ
X-Google-Smtp-Source: AGHT+IHLOs8AkdboH9ufe3uVfCMuBj2myZQffsOSLGEYtVubGujAxHdd/KSSUYo1ed4iTaJle6dOCA==
X-Received: by 2002:a05:6e02:1564:b0:366:140:801 with SMTP id
 k4-20020a056e02156400b0036601400801mr1621302ilu.20.1709664040035; 
 Tue, 05 Mar 2024 10:40:40 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a63e311000000b005dc4da2121fsm9444697pgh.6.2024.03.05.10.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 10:40:38 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: [RFC PATCH 0/5] Add support for suppressing warning backtraces
Date: Tue,  5 Mar 2024 10:40:28 -0800
Message-Id: <20240305184033.425294-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
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
The second patch marks the warning message in drm_calc_scale() in the DRM
subsystem as intentional where warranted. This patch is intended to serve
as an example for the use of the functionality introduced with this series.
The last three patches in the series introduce the necessary architecture
specific changes for x86, arm64, and loongarch.

This series is based on the RFC patch and subsequent discussion at
https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-4b08-ba81-d94f3b691c9a@moroto.mountain/
and offers a more comprehensive solution of the problem discussed there.

Checkpatch note:
  Remaining checkpatch errors and warnings were deliberately ignored.
  Some are triggered by matching coding style or by comments interpreted
  as code, others by assembler macros which are disliked by checkpatch.
  Suggestions for improvements are welcome.

Some questions:

- Is the general approach promising ? If not, are there other possible
  solutions ?
- Function pointers are only added to the __bug_table section if both
  CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBOSE are enabled. This avoids image
  size increases if CONFIG_KUNIT=n. Downside is slightly more complex
  architecture specific assembler code. If function pointers were always
  added to the __bug_table section, vmlinux image size would increase by
  approximately 0.6-0.7%. Is the increased complexity in assembler code
  worth the reduced image size ? I think so, but I would like to hear
  other opinions.
- There are additional possibilities associated with storing the bug
  function name in the __bug_table section. It could be independent of
  KUNIT, it could be a configuration flag, and/or it could be used to
  display the name of the offending function in BUG/WARN messages.
  Is any of those of interest ?

----------------------------------------------------------------
Guenter Roeck (5):
      bug: Core support for suppressing warning backtraces
      drm: Suppress intentional warning backtraces in scaling unit tests
      x86: Add support for suppressing warning tracebacks
      arm64: Add support for suppressing warning tracebacks
      loongarch: Add support for suppressing warning tracebacks

 arch/arm64/include/asm/asm-bug.h      | 29 +++++++++++++-------
 arch/arm64/include/asm/bug.h          |  8 +++++-
 arch/loongarch/include/asm/bug.h      | 38 ++++++++++++++++++--------
 arch/x86/include/asm/bug.h            | 21 +++++++++++----
 drivers/gpu/drm/tests/drm_rect_test.c |  6 +++++
 include/asm-generic/bug.h             | 16 ++++++++---
 include/kunit/bug.h                   | 51 +++++++++++++++++++++++++++++++++++
 include/linux/bug.h                   | 13 +++++++++
 lib/bug.c                             | 51 ++++++++++++++++++++++++++++++++---
 lib/kunit/Makefile                    |  6 +++--
 lib/kunit/bug.c                       | 40 +++++++++++++++++++++++++++
 11 files changed, 243 insertions(+), 36 deletions(-)
 create mode 100644 include/kunit/bug.h
 create mode 100644 lib/kunit/bug.c
