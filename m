Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7E8A756E4
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 16:04:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B51D10E281;
	Sat, 29 Mar 2025 15:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DTDOxj/F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5612010E281
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 15:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743260685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9rZcFa00OKiutAluKujooWT6oAB0DkFh89UjHpXtZTM=;
 b=DTDOxj/FZO2gwVl/tOsvXe/ZggDEI6LglvEEgsuv4jncaYKdrOvciahpM3vvD+rHgRH4k7
 mcnXIi44ReQIH8gbA1MXdBytPiUc988YUaHQ4dgO7rVJzsZ6EkiiYnwvFfSZEuVfTzLVcA
 FhGsJ1R5Tz55imya+lAa8hbGDC1KCuc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-MfgXr_FRNPisILji1G56zg-1; Sat, 29 Mar 2025 11:04:44 -0400
X-MC-Unique: MfgXr_FRNPisILji1G56zg-1
X-Mimecast-MFC-AGG-ID: MfgXr_FRNPisILji1G56zg_1743260683
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3913b2d355fso1179810f8f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 08:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743260683; x=1743865483;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9rZcFa00OKiutAluKujooWT6oAB0DkFh89UjHpXtZTM=;
 b=P2Q97MRY9BpWCmZB+O6gtYvxKy08JI88yPlf6qgpXNtVwC9deFyXiRh2+VYYhLaT1H
 20ye+iVVPBWAC7imFyPMAvxQZM5Gm4Lfc+7KSwZFA7jklPN2ZNnhKP8Xz9+nb8I+hkUo
 A+dHDiIZKIHmVsTCOCfgRzdc3GeRlB/qnxaApzvtXXyLHoMHSQafKWvIAK1AdPei1NBu
 L+uNpmIQFGPFVFlj/KdkhImGefA0B34mwHAQC+D65HIRbpwssU1mWNPp+zPPPgTppcIn
 amLcYFYKYJCm6UOnPUERJGB3M0y3No7X0DR5y31vWdFCEZSN50TpqqH9oIG41tG0yV4U
 0SlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1yqL6VxqARpuRN8jzafwnZMXzjy+Z1mddXzxjI3vOQT8vt+Rs4ib+TvyYwX6Zb5vahYnpAg73KU8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywnyb+Fam84Gp0j4A9DfMlmMGFAk6YvR5E76E+4NcwRRcp3cKjK
 8LhY/fupjwvydukAhw8WNBHELKDw0O8hZEIWMKyCxIi6STXw37u9Ynmyx0Oe1C1GhenEz/1q6mu
 kLgaQIKOETc2t+zSGoiKXS2Qz2r1MzkP0XvYsOt89PyYmk5vs4OTcpJiQZpDbR9/Dzg==
X-Gm-Gg: ASbGnct14ZJkuWkZBhBj0IyqD0zFS9zbp7+nXztfh78j+u1cBYjMij8a//+aZKAlJdS
 qp7drN+GQa/QKzYz8UIp74Xg7nwiMEqQG6Mvkt8OZ3dUoDXY2MfySR3toDg1ZHB79jV3S0GEG0A
 yyXiScRqAQdVDVTm8vE9JPsw40afCdQlIYJiJmSndrsq9zrO1xQcOqtBpfJ5PaLs9Xo+C9usSeN
 mGFI425iMdGQnWSpsIFV5NMxynLrqHakBBjl6D8n6/X5eAZGKkqf+qK4nWDMNaZcp5nP2rEAL7/
 bWBJvInaIAylgK+39YhS
X-Received: by 2002:a5d:598c:0:b0:38d:e401:fd61 with SMTP id
 ffacd0b85a97d-39c12119db3mr2073766f8f.49.1743260682746; 
 Sat, 29 Mar 2025 08:04:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/2bHdcw2ELtkQnH3PJgr7VcNq4CZ6lA8znbzDKP3oWHKcunfSfI/tIlxfFak/s1ZEaKAEVg==
X-Received: by 2002:a5d:598c:0:b0:38d:e401:fd61 with SMTP id
 ffacd0b85a97d-39c12119db3mr2073713f8f.49.1743260682362; 
 Sat, 29 Mar 2025 08:04:42 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43d8ff042bcsm63073205e9.28.2025.03.29.08.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Mar 2025 08:04:41 -0700 (PDT)
From: Alessandro Carminati <acarmina@redhat.com>
To: linux-kselftest@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Guenter Roeck <linux@roeck-us.net>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Mickael Salaun <mic@digikod.net>,
 Kees Cook <kees@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-next@vger.kernel.org,
 Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH] kunit: fixes Compilation error on s390
Date: Sat, 29 Mar 2025 15:03:20 +0000
Message-Id: <20250329150320.331018-1-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _9NVuMHHHsirzz2nx7m7AR0utFueaPx1vMgW5icTVVw_1743260683
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

The current implementation of suppressing warning backtraces uses __func__,
which is a compile-time constant only for non -fPIC compilation.
GCC's support for this situation in position-independent code varies across
versions and architectures.

On the s390 architecture, -fPIC is required for compilation, and support
for this scenario is available in GCC 11 and later.

Fixes:  d8b14a2 ("bug/kunit: core support for suppressing warning backtraces")

Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 lib/kunit/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/kunit/Kconfig b/lib/kunit/Kconfig
index 201402f0ab49..6c937144dcea 100644
--- a/lib/kunit/Kconfig
+++ b/lib/kunit/Kconfig
@@ -17,6 +17,7 @@ if KUNIT
 
 config KUNIT_SUPPRESS_BACKTRACE
 	bool "KUnit - Enable backtrace suppression"
+	depends on (!S390 && CC_IS_GCC) || (CC_IS_GCC && GCC_VERSION >= 110000)
 	default y
 	help
 	  Enable backtrace suppression for KUnit. If enabled, backtraces
-- 
2.34.1

