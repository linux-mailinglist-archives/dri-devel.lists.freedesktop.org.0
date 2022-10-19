Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 813AB603AB0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 09:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891F310F16F;
	Wed, 19 Oct 2022 07:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D64910F16F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 07:33:02 +0000 (UTC)
Received: by mail-pl1-x649.google.com with SMTP id
 a17-20020a170902ecd100b0018463d1748dso11301704plh.12
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 00:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=OFBlhkYS8e4Y++xggTk7x762ubjdCZQL5LyxpmWeUCA=;
 b=Ozsq01M1gRGtGtoH/cesMFHrQcZgb+x4tyXdANAkVr2929UYFp/CQCJNXnoeFXDiNU
 BZzmFTWGkBpJuzxNNTEUt8mg3kaO/D4gk78C8xiYyqpZN5wlBBvwHPrU/+3GTP7Q3aVF
 GUn+1EEzrZprmxQZAO7uIhpSmiGFbxtWtGzAb3ReiY4nqkAzN09e1ovJBDEs/q4o5knY
 3Y54xYIdGEZXD/yShY+i5YkBn74VennWUUnxZEZN1CDFNTvNUGzk4Aqu3wN6j3pmmeRq
 MIa8VNaNxL+7+TQnDMEKpKDjXF7BmcCe8b84+M2DjcOL7+la4vlYESzSQBniYQYrWIg0
 3OLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OFBlhkYS8e4Y++xggTk7x762ubjdCZQL5LyxpmWeUCA=;
 b=3E9xvWuu767yRab4DCUHh8KFNRimFRtyQAFLzF7aB+wWxN/siPDNA4K4M3ikRE8BnV
 oBiBeA0AINoCT+MsX1+3bKukw68S5pDH9FAGdAQhv/+ZIZ/ljfbYqibYmS6PDh8YTSu1
 hNCmUSSNM2J79ivJmcHHBFhdiq14l8elfETjr7Lo4qQp+NrnG3UHKrtLwyplAzOOr3+E
 bTg+AhK2a00WEFOj8tIBbmNLEvN/kTMosfFq7L1d/oI3cqRO8MvfRXQeWECmF7G2LdRg
 nsE/zAqbU3B/9Rdp+TAYMFYGsfjeYn1YZ7udFlYDNTJA/21fNYNrtSKwuKT86uzc3i2G
 pFqA==
X-Gm-Message-State: ACrzQf3HFm5nMDvhkW/Ofgr1rGSczzUa6I6FLQOJLTm9I8Ug3PkcaQ/y
 hkDXF4AzKONsMAXecfyY2DLZXT5DzraeGg==
X-Google-Smtp-Source: AMsMyM4sOm/YKLPaiW4toZ1Q1K+zqroG9h4PkVBmHim0IP5UnC6FuUX/WvPm+qCKMpmkixjA3plQjM513FTWEA==
X-Received: from slicestar.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a17:90a:c986:b0:205:f08c:a82b with SMTP
 id w6-20020a17090ac98600b00205f08ca82bmr2707194pjt.1.1666164781481; Wed, 19
 Oct 2022 00:33:01 -0700 (PDT)
Date: Wed, 19 Oct 2022 15:32:40 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
Message-ID: <20221019073239.3779180-1-davidgow@google.com>
Subject: [PATCH] drm: tests: Fix a buffer overflow in format_helper_test
From: David Gow <davidgow@google.com>
To: "=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?=" <jose.exposito89@gmail.com>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <maxime@cerno.tech>, 
 Naresh Kamboju <naresh.kamboju@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 David Gow <davidgow@google.com>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The xrgb2101010 format conversion test (unlike for other formats) does
an endianness conversion on the results. However, it always converts
TEST_BUF_SIZE 32-bit integers, which results in reading from (and
writing to) more memory than in present in the result buffer. Instead,
use the buffer size, divided by sizeof(u32).

The issue could be reproduced with KASAN:
./tools/testing/kunit/kunit.py run --kunitconfig drivers/gpu/drm/tests \
	--kconfig_add CONFIG_KASAN=y --kconfig_add CONFIG_KASAN_VMALLOC=y \
	--kconfig_add CONFIG_KASAN_KUNIT_TEST=y \
	drm_format_helper_test.*xrgb2101010

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Fixes: 453114319699 ("drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_xrgb2101010()")
Signed-off-by: David Gow <davidgow@google.com>
---

This is a fix for the issue reported here:
https://lore.kernel.org/dri-devel/CA+G9fYsuc9G+RO81E=vHMqxYStsmLURLdOB0NF26kJ1=K8pRZA@mail.gmail.com/

Note that it may conflict with the KUNIT_EXPECT_MEMEQ() series here:
https://lore.kernel.org/linux-kselftest/20221018190541.189780-1-mairacanal@riseup.net/

Cheers,
-- David

---
 drivers/gpu/drm/tests/drm_format_helper_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 8d86c250c2ec..2191e57f2297 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -438,7 +438,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
 	iosys_map_set_vaddr(&src, xrgb8888);
 
 	drm_fb_xrgb8888_to_xrgb2101010(&dst, &result->dst_pitch, &src, &fb, &params->clip);
-	buf = le32buf_to_cpu(test, buf, TEST_BUF_SIZE);
+	buf = le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
 }
 
-- 
2.38.0.413.g74048e4d9e-goog

