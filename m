Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D14897027
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 15:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9CC8112AE6;
	Wed,  3 Apr 2024 13:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iwZ2gVLk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7162D112AE6
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 13:19:50 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1def3340682so55044405ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 06:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712150390; x=1712755190; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KUpuwFkhA/ZZkaJrm+5DUMvKoRunaI4/ZlB0ejZmZW4=;
 b=iwZ2gVLkSlchOpS+vGwEG9hBohSEPSTg66GgDGfMnIxvjBcfoR6Gmi4vj2fsONtRd9
 RgLOReDvvGIifaO7EtqUf3hGepSll91JJhONPfHouJwuz/fvVTyPfaafwnhRfpOhXV/T
 BvJRDTNaTOBwT+c8I48g3bXVwRCBBvi2UvEUPwZ9NCoKFXSA+NtZjlpiRkOVpDblmA8y
 vDF/2rbDDJeq6JPXtmDa2zsJf4x3+ZWuNhjSwVrVfR3gwkHLc+kBlJfK6o0jQCQGoall
 9S9cUdYG2N6pga6mukte6iDtASfuF2+zEMKKXxfsHkDqN+EWBXId5JrCFOydJ2ygoKqd
 O43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712150390; x=1712755190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KUpuwFkhA/ZZkaJrm+5DUMvKoRunaI4/ZlB0ejZmZW4=;
 b=tJt2MM++1Ldycf6HeGGvim586dOAkQkLgNjTzU1WsGMHYlrKzFHJsHXZktQ+ozYUAW
 flkNSQrAYfU8S9MX8N05B1VHkPa5s3fvUZ307m2cbBvcfIATzDWFK6cBeQSKwemYGSDT
 XKBIClvjZf2RXHg6t2eKJEy80geG4HPCm6LiaZSmdlRPLtt6+BgHyzTrXVdQz9HDwxMn
 IwO2Ygm8wpYtWchFgaSmSiKFNOc6vLur+FLiPuQB7eWyED3HdesRMHRedls1HoPdQKkK
 HOLI3uUoMN4xBII0cDtBpU978jJxS6FAs0OeCexXSFaOoYogTK89q6vO9gEXRWm2qi/V
 MwdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn6+k7YfKo78sCgTZP4H677HctFu7CyeseQz5OPSHD9NR0PO2iSPNqzFvQgrP06wZxytOTA1xoy8kjIZ1PrGVs3XIsuHKpQ1S8fpYhSE8H
X-Gm-Message-State: AOJu0YwYAKriRDkagCjjK+uPvkEcISknl2PJnyDljAoeXVng8wmU7fgX
 BRhceQeX9DKEf0KbGw3bDYLAGLzPAt58h0mQkgwPAp4E285MYCRY
X-Google-Smtp-Source: AGHT+IE/2OacMp/2cfvaRksBgAjGZgKxyI++pmI4VDvZRW0+d8012wJeFPX8kGKifNbdvVT4SH77dg==
X-Received: by 2002:a17:902:f68a:b0:1e2:9205:5254 with SMTP id
 l10-20020a170902f68a00b001e292055254mr1881147plg.7.1712150389795; 
 Wed, 03 Apr 2024 06:19:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a170902694a00b001e088a9e2bcsm13158796plt.292.2024.04.03.06.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 06:19:49 -0700 (PDT)
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
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, x86@kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH v3 04/15] kunit: Add documentation for warning backtrace
 suppression API
Date: Wed,  3 Apr 2024 06:19:25 -0700
Message-Id: <20240403131936.787234-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403131936.787234-1-linux@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
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

Document API functions for suppressing warning backtraces.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2:
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
v3:
- Rebased to v6.9-rc2

 Documentation/dev-tools/kunit/usage.rst | 30 ++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
index 22955d56b379..8d3d36d4103d 100644
--- a/Documentation/dev-tools/kunit/usage.rst
+++ b/Documentation/dev-tools/kunit/usage.rst
@@ -157,6 +157,34 @@ Alternatively, one can take full control over the error message by using
 	if (some_setup_function())
 		KUNIT_FAIL(test, "Failed to setup thing for testing");
 
+Suppressing warning backtraces
+------------------------------
+
+Some unit tests trigger warning backtraces either intentionally or as side
+effect. Such backtraces are normally undesirable since they distract from
+the actual test and may result in the impression that there is a problem.
+
+Such backtraces can be suppressed. To suppress a backtrace in some_function(),
+use the following code.
+
+.. code-block:: c
+
+	static void some_test(struct kunit *test)
+	{
+		DEFINE_SUPPRESSED_WARNING(some_function);
+
+		START_SUPPRESSED_WARNING(some_function);
+		trigger_backtrace();
+		END_SUPPRESSED_WARNING(some_function);
+	}
+
+SUPPRESSED_WARNING_COUNT() returns the number of suppressed backtraces. If the
+suppressed backtrace was triggered on purpose, this can be used to check if
+the backtrace was actually triggered.
+
+.. code-block:: c
+
+	KUNIT_EXPECT_EQ(test, SUPPRESSED_WARNING_COUNT(some_function), 1);
 
 Test Suites
 ~~~~~~~~~~~
@@ -857,4 +885,4 @@ For example:
 		dev_managed_string = devm_kstrdup(fake_device, "Hello, World!");
 
 		// Everything is cleaned up automatically when the test ends.
-	}
\ No newline at end of file
+	}
-- 
2.39.2

