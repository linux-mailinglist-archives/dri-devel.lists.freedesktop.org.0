Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FDCA756EB
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 16:06:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BB210E28D;
	Sat, 29 Mar 2025 15:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Wi2kje19";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4874E10E28D
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 15:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743260814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=S8zI311lqbyq1Z4you2dOBLeU+B8GZ4SBxX1alQksoE=;
 b=Wi2kje19e+NFqtkcc4960/33cx2/D2F/nAHS7RE4cVUuR3PoZdsmqhe9RbpiARFB/jEFKz
 wLMbGN7KWtqDfKck4MccQeJuU0RgUSnum9SguHXIfcxeA2X854kv5rHLS/E/X72cZeLBwW
 7kKq2mjZFWK2x8axI29/YcBOPij1bf0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-IDcAzgOQMFqHvN-bZSYIwQ-1; Sat, 29 Mar 2025 11:06:52 -0400
X-MC-Unique: IDcAzgOQMFqHvN-bZSYIwQ-1
X-Mimecast-MFC-AGG-ID: IDcAzgOQMFqHvN-bZSYIwQ_1743260811
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43947a0919aso26605675e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 08:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743260811; x=1743865611;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S8zI311lqbyq1Z4you2dOBLeU+B8GZ4SBxX1alQksoE=;
 b=rQCx2xE4cro7sFzlMLKH6WCTcRRBsvDl9OG73ql6Gd1Enzao1dEDUvNvfv03NUMEEA
 r+pR5y4Pf5d4U0Bs90Gt2spZ7vC29FZl3fCnFgcftD93Vk/tJtNHMPU0Z+Neq/FA5Ds/
 bRn68bVLVgPCqzb7qA37PBcm6xmrAQJIjisg1uWw+m8tENICZ4DzKcBk2/ueh+hFuA8Z
 /LPd3q6610VESwj7wHVT3hPEw+n4vjkaX+EgKOteAXYses/0gjutotQVosd/rZS3+OtN
 bvX5oa3DwYUk8EyXQ1p198/E2e0DEMVcGCRGi5uhIdQm3zD00EYxfI+Mb5SiqDYU0f5e
 6pvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5UVMrxfpxost426EjMIFLk/XjyA5cTVaQH5aVUU1slnqeJGw2CmQVTykPtrRqk2k1DOSpvgxK+Hc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBt6iv1GrgzgxW1BWMiYU8UF2C4TOu3xSF2yu/8Mr7fL9SbMdj
 uMXl+BqDMiBeYyrKjUVgkguZrmCSf1+K7ODZwgojNnFh37DRbjBrmFkUhLaYwZVyXOfCHFAKL1b
 jLfrqHi2KBpXYngfOnCgyA/imKzB4SUaFCVtp3Z6sm3O6t1zrwfmXvJAoyhXg48q0bQ==
X-Gm-Gg: ASbGnctOjP5JyyZ3U6aPtKM7UznOscJZw5IJcSTiCfyifgW09Gs2eIpEDSdQQKB29Mi
 Tl8odXyMQUYpZCYxm/Ru5eNnoYNJ6qe2FoonUfSBitcysFssQrnl8hHhvQDJJzkMFooHjhGr5Z6
 2zJNZ/wFTiZRbx9HBUOvzHF+Yje7uVpGbF6hDDwRVgi/ZEM3QcmRfgfB52EbZOBCZ1M5mxCyaaK
 5Wmh0Z/0sSnqc5Jm3+7zPUPEf+sYyOaO7Vn8Azq6OhSeYjuWYRsdD7tiaYFGgjg6JpVvicqDOoG
 1pFfb9JsxMlZ8T4Trjuq
X-Received: by 2002:a05:6000:40cd:b0:38d:d666:5457 with SMTP id
 ffacd0b85a97d-39c12118f51mr2203367f8f.42.1743260811348; 
 Sat, 29 Mar 2025 08:06:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IET88jcJ/fUhMkJBzo9iXANXxVp80YEfKLaDkLOIVe2hPzsFQ5lK7sBVk2xeGnWFUm+16DMNw==
X-Received: by 2002:a05:6000:40cd:b0:38d:d666:5457 with SMTP id
 ffacd0b85a97d-39c12118f51mr2203328f8f.42.1743260810973; 
 Sat, 29 Mar 2025 08:06:50 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-39c0b662850sm5914994f8f.26.2025.03.29.08.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Mar 2025 08:06:50 -0700 (PDT)
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
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH] kunit: fixes backtrace suppression test module description
Date: Sat, 29 Mar 2025 15:05:29 +0000
Message-Id: <20250329150529.331215-1-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8urr1zJJNWKyjmxqrhRp7ekrpJfHES14azC81s1tA-o_1743260811
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

Adds module description to the backtrace suppression test

Fixes:  ("19f3496") kunit: add test cases for backtrace warning suppression

Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 lib/kunit/backtrace-suppression-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/kunit/backtrace-suppression-test.c b/lib/kunit/backtrace-suppression-test.c
index 8b4125af2481..d4c5df09bba6 100644
--- a/lib/kunit/backtrace-suppression-test.c
+++ b/lib/kunit/backtrace-suppression-test.c
@@ -102,3 +102,4 @@ static struct kunit_suite backtrace_suppression_test_suite = {
 kunit_test_suites(&backtrace_suppression_test_suite);
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("KUnit test to verify warning backtrace suppression");
-- 
2.34.1

