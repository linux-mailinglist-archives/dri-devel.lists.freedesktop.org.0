Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D732AC405D
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 15:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C9810E2E2;
	Mon, 26 May 2025 13:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="A8ubggNr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99AEB10E134
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 13:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748266106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=piebsVU5QZFL/FeYXj8vMs1AI4HP2ZYK+Wi3o0pUrOA=;
 b=A8ubggNrNkDX1RKJqF1qPqkz0ydjr5LpCOonG7x5bJ603FJplLcE1tVS89qofimyVSSsUE
 zzIYc1Xw3HSXQSmvzlOqq8rXkdePLo+BNgRFXYPwiFo94jCwS+sQ4vu57C/wjvZpCXEQBi
 AB/xQo/txrNxx+FEs3vaDyGpWET5MM4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-RJYg5QX5NliI1OlajL9f4Q-1; Mon, 26 May 2025 09:28:25 -0400
X-MC-Unique: RJYg5QX5NliI1OlajL9f4Q-1
X-Mimecast-MFC-AGG-ID: RJYg5QX5NliI1OlajL9f4Q_1748266104
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43cf5196c25so13283785e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 06:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748266104; x=1748870904;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=piebsVU5QZFL/FeYXj8vMs1AI4HP2ZYK+Wi3o0pUrOA=;
 b=D0R0km7wba80deEHGExPW5dDuMhVvBOYon1TzNdUDqRi4A8JGE+dNgz1UUttejfHRI
 yLy2faOMBmKibnP49Ze9nScPwg8YP3l/U9koo6i5+bAd8oMNgvyLwtHVsMa2D7B94hO4
 Jdf9R6ttWOzDEBqNr1vnf40dYQWHgSwjmnyJGbMue7zSEVNH9ri/ZWa1gkG+K8nK20WL
 in6XN5jlmohCbLur34yzB5/K76ibU3kFXiXITxurvJvkMEv+FDwuvMojo9XX6sgR21OA
 R+GdUOeWnF2dkNCK6yq7Yi1J4nsCGOv+XeDYoQizod/0lNqZF3C1SbAiQhhEMycsL9Bq
 PYrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQUMQw54KXQXbL0OF/h0vwxTJk0EH+cRoU/Q/cSAI2JVb0Pj4Xeawb7+mpvLDYXpMNbEbH5Dfc3D0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlulrEwCOloc/fwAlIZZYj6wS+KODd+c5uXuL6Vhcts5B3RlP0
 nxevS6fy3+0WlVHBsp9PQ8O0pJ0g9Bs4anNEG7ZtknUDpxltImo14Hh6/m6viUavH5aIEUUdedc
 t2jpj3qE4/lXswZbIozfUTdrIVd1wVblg9MeJDC1YNUWt+aURxgMdzZcD0rMlkMP27ScaRg==
X-Gm-Gg: ASbGncvIcuzHeSfQVUskOXP+zSiGKaEPVrFYAV6AzpBB5DaAC5cXTd/iIUMDbLnPvOt
 YZoxSn9ThltUEAl3DM5+P0WYGLZ+KbVDeanMyENA8WUFGVY54qbdOmhRereh43WnNCTqx7u0wzx
 vnd5eVA8rYIbclrvN2dvKv+bSS6s93X1tpJC5arfG1udTwW+GDy3AvdsmO7FAjazsFslcRnWbbt
 kdYujgKDqsbgQTRODnHn3IcmM9xif+jR/cBThwaaH0kGLXWH6jJSEzP4PbJzOONQOj9hdM/ssbM
 oei3lK83R5MAjOw+
X-Received: by 2002:a05:600c:511f:b0:442:f482:c429 with SMTP id
 5b1f17b1804b1-44c919e1212mr72338695e9.8.1748266104410; 
 Mon, 26 May 2025 06:28:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaaobnHeigG/eBkWZXd1t3qpSgOSBx99XMBgFVTdHMNgY3fiyKRZ23Lqf2VAX1TTWLq2keaQ==
X-Received: by 2002:a05:600c:511f:b0:442:f482:c429 with SMTP id
 5b1f17b1804b1-44c919e1212mr72338525e9.8.1748266103966; 
 Mon, 26 May 2025 06:28:23 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3a4c8455e7dsm8836663f8f.9.2025.05.26.06.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 06:28:23 -0700 (PDT)
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
Subject: [PATCH v5 5/5] kunit: Add documentation for warning backtrace
 suppression API
Date: Mon, 26 May 2025 13:27:55 +0000
Message-Id: <20250526132755.166150-6-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526132755.166150-1-acarmina@redhat.com>
References: <20250526132755.166150-1-acarmina@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: asIDb6wP_kQpGQ6GP-fvGh_indLmL_FNNJl4FRk5WWs_1748266104
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

From: Guenter Roeck <linux@roeck-us.net>

Document API functions for suppressing warning backtraces.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 Documentation/dev-tools/kunit/usage.rst | 30 ++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
index 22955d56b379..b2f1e56d53b4 100644
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
+		KUNIT_START_SUPPRESSED_WARNING(some_function);
+		trigger_backtrace();
+		KUNIT_END_SUPPRESSED_WARNING(some_function);
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
2.34.1

