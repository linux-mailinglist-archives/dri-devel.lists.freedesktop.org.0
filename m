Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D588B88AC74
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 18:53:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356D210EA29;
	Mon, 25 Mar 2024 17:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WJlrldyv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47C910EA27
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 17:53:02 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-6da202aa138so2147396b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 10:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711389182; x=1711993982; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E5DnhCN93QNiYO14tG2AocbiB+DMWlDa/rXDsAPUdjs=;
 b=WJlrldyvjm7A8/wLHaElesX1Lreumgv1yGLAqul3SIoOPjdiIs2ln1Wo5LKgbSbe0X
 vd3S3iLdabiYAbhpL+uvs7zhaPafBK10d6cHJYhSXCWz11WVwfYhGurWJLXoG9sjdQJA
 wjs8ZimoznHdAqKsSljGN/6XmMXEO/MyfdKMSULoxJJL8SQ1le6LcqX7AKl2gTs1T0Ny
 0qMcNgKUTgOwJ86epFB7j6nvyyFDl6UPYlH190AtYCl2FrxuKi0txCkq8L+gz88amk48
 EQY+mzB9yJ2wpjxnEDab05iYjC6JxHEjnw2upPBXqpwZMk04w42DzvzKRaiA0LIqdNIV
 Mb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711389182; x=1711993982;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=E5DnhCN93QNiYO14tG2AocbiB+DMWlDa/rXDsAPUdjs=;
 b=P24lBwQhjESVqbHhf0SWqmsz6y0zRHBpO6Xf8zRIrfjhYT22PRIB+mM0Ybc4aIAtEO
 Ywi4xVxu4oWRMJ7nwvJ5iGuMgoWokoAiXyum/tmIy8kWId2n3c3fnlgaNo1GVLjTRqj/
 CaU9pzwNlu85SO3xCysUxE9UdCcAM66vInW4nuLw4keVYjAsSuxpeW4fAv2U9zwpCseo
 bdfvkKXYawbLUmIBovHRDLuEcpRAMJP+FhLaJwEXQo55Xf9YwjHj6UYiFyrhTO3nLOwZ
 h9dlploboTOwrd/MzQJZ8JmHgdRDq98Ei7CLAGiwSZh6Dw4bEwgOQceXOVQSC4H9ulgO
 ubdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCURKnOrAtwPt1JTvtX41mfUABaT7kJBJ5Yf+0jF49xTXBzBoUwop2JvI+oSCgz37Zd+/vid5wi2qNy2oyAZ9XSBDaf2oSVWtAHRDixrt5mo
X-Gm-Message-State: AOJu0YwotgK5OFsXT4GWQvF02n2Am4w9U/KESOSF0obEJW9a02WusOmb
 hIq2BxIQnCTeXzfHma/8qebhyxeRMZKAPbkzI2k0Q9xvKzTYMtEX
X-Google-Smtp-Source: AGHT+IHUbFCxxsrPDRZqrZE3rVYi2h6yvmCQyCE4SU/FpvCJKM9Sju0fTz4yCOmRcDciiduCin1d7Q==
X-Received: by 2002:a05:6a00:9298:b0:6e8:b78a:29fb with SMTP id
 jw24-20020a056a00929800b006e8b78a29fbmr9626545pfb.2.1711389181672; 
 Mon, 25 Mar 2024 10:53:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 z24-20020a630a58000000b005e83b64021fsm5516536pgk.25.2024.03.25.10.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 10:53:01 -0700 (PDT)
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
 netdev@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH v2 04/14] kunit: Add documentation for warning backtrace
 suppression API
Date: Mon, 25 Mar 2024 10:52:38 -0700
Message-Id: <20240325175248.1499046-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240325175248.1499046-1-linux@roeck-us.net>
References: <20240325175248.1499046-1-linux@roeck-us.net>
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
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags

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

