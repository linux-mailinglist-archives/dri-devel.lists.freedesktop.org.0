Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB8D8799B1
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 18:03:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0252C112F33;
	Tue, 12 Mar 2024 17:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dKzJ5u6o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BAA710E789
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 17:03:23 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1dd6198c4e2so41206415ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 10:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710263002; x=1710867802; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=36BrykVX1YEJvDrrNJGSTLQfgxZ1lgqGPC6PgqTTbEw=;
 b=dKzJ5u6ow4384ylJYo9FDIb0aBgQl5f2dMUFUyljPavfvI/pHhK0qi3W2BkPKkVJyw
 QGhQzXTs6rhc5gc87xDNwYBrTKvC8y4m+JEErHapltBcSvGpjeSDvmzgxUeHuLbK0XnY
 GezFWmyIp7z72+VE6vZxbHj/XVOSd59KP4xaWAzcAm/hl99pUo2IrPMIquxw4yIKVf1w
 7G+RbijbD0XKGCi8eHimo577p78x6NjCpqVtG4SpmrKEJKo4l5Zrxz27XOTJrapaPvaZ
 hZumf4f1JQVQUpfn2QTSO5eytDyRJiozJl2vCcAm6vGGV4HJvAo35BesRRpt9yJDt3RI
 RjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710263002; x=1710867802;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=36BrykVX1YEJvDrrNJGSTLQfgxZ1lgqGPC6PgqTTbEw=;
 b=unU9Kve2X/BdeR4znUHAzD1xRbXHBv4bFIyg3izh9ptn4Vn0OYliehVghHfAnmK7CU
 yx5c1/DF6pKzgPBjnEfO9VDMHQ3jd0RRDXqFjlW039W3sbQaei3re7Mo5nwnFgIQlSha
 CZXRjaW0Uibgeb7alpZjaFB6URxK9DoIlYr/wP7iPUjaQ/JdIp128m6ZjRu0YHfjQLHQ
 y5nudZ9qtcGcSYuf0p65VoOzxHV4BoFBLpdibWlx1izXQlZDZUHwA681IUeoQUIbsIDw
 MpnXZ22pUG1Es8w/Ynd86C6rAYKNA8Ih+Blm5veEudtw3K4e7+waCZUvUBdAWLs6d35/
 6Tpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjpqeVqeNct5Vu9/7Qj1jGPLiIi9i04edSQEoWnThuvF5lm8N8tQkbMTqwXF5j+wtWWrTX/s7wvlydL2toy1+TSP0yjHpa/F0c/BpZMg61
X-Gm-Message-State: AOJu0YyddaqvTEHevrBUbu2pUGqe7L0kLe80eMm3OeB2UbXVsMdQSOyJ
 o+YjzTw4IuiV+NV3jqkwI7+lCrPQZXX5Nf1KMElzeqBH4MCrmOZ0
X-Google-Smtp-Source: AGHT+IHYAZUPDqsFw7GWyh1RSbVI2Qwrh9Mdl1wKcQdsH3Ao31Ql441CQm7bvVJxkQ6v+AiS/8LElw==
X-Received: by 2002:a17:902:b198:b0:1dc:d8de:5664 with SMTP id
 s24-20020a170902b19800b001dcd8de5664mr9227736plr.33.1710263002517; 
 Tue, 12 Mar 2024 10:03:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a170902a3c100b001dbb6fef41fsm7095813plb.257.2024.03.12.10.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 10:03:21 -0700 (PDT)
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
 netdev@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 04/14] kunit: Add documentation for warning backtrace
 suppression API
Date: Tue, 12 Mar 2024 10:02:59 -0700
Message-Id: <20240312170309.2546362-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
References: <20240312170309.2546362-1-linux@roeck-us.net>
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

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
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

