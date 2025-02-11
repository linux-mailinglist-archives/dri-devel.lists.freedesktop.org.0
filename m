Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B538A30973
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 12:09:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD9010E667;
	Tue, 11 Feb 2025 11:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QJ661njl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE98D10E665
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 11:09:23 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43948021a45so16704025e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 03:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739272162; x=1739876962; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W0Gp3OVIpEw4+ISZmLwuTXl1/B9vTRIzRehit5QWGf8=;
 b=QJ661njlpGlRWuF1a3oveGxidJ2W2wb0xIuyENe+w62oINbNfkzI++FqkmZV9ugA1U
 8v1JH5JmvJ5SyYB+DdHPd/cyCDRcs8wZaX6Ajvrz9vMTPyklieFxA/G8100NN3froHYC
 /RjjIvpyVluM96I+S1o8a1Ym9F6qibzKaJ9tb+QtyC88bffQ1Z7FDcjAQl4GE+ROXXes
 1fn8/Ck1kvWMq32c7esdlJ8AJGbhFic2NIsGanl+kbzYRG5YW0LdG+K27KfPaGwRRR7A
 OkLYGmrVRFRfVFV6+pdDOzu/6oWMlxz9sYW9xD9t1iF1fGEBHmD1sDiNy/P4r13gu5pV
 4eJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739272162; x=1739876962;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W0Gp3OVIpEw4+ISZmLwuTXl1/B9vTRIzRehit5QWGf8=;
 b=URfwb2rLlgOpuuOO/w0jaO9miLjcK00VwITNLlRuS/wIhKyvWML8KLFNGvme1eR22z
 0Tplf5EkE1SyA7kXRjO/azvArsJE37Pd3GJ0WOunlG3tAJ11EBa3XztVwWPeUGpfFMaD
 hb4DjaR/te6esp65k6XLq8mzGNKEKtC8Xv1PLifeObZr6NAvMikqc5eA7HfXyNE8pRhG
 BfR0tSIJiP8izrN7mNOfT6qDvVXXtr2mcINncZFtqcD2DnYlROGRNE70fFJkRs/Q2mwn
 2IUZaGCOsnzUn4dyaFe9VIOVPT1yjG8eDwzcQcXf9w8m+NWGv0S+FS3Km2BEI0KxBmGV
 lyDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn0q2dQxJ17sngpV3U3IKrP2u2s3aHIXsbw1TsaOctd3Ju11gyfPpJNrcSN8iBIbJwC0KfY1fNLww=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyi4rqUOM4OgGsgTuYUKBAguxRuNDtPf0O/mIATyQdA27u/rCw7
 OQcUXK82qO3LxUxo1o7YqKUqNlX/O3ERrP7lp3vP7G57gjUzqSol3+kg7qB+
X-Gm-Gg: ASbGncsUBVVB9nVhmL0E5vX8sefqHQ8qXOxYd/3sk2bxHb+yC3MpYGkxiLkYS4Sga0H
 YrbRlxqLOAWc3qkMGTUvZB5L7hNHamrTfXFf1AAaXJ7I1+cWHZx7Jq2uvUFsMRiQ+Ip6Rr8CS5p
 HYuNQy6A1nDfAky66gnqrSPwVlcJXhlLhzqlFa4UBuGzYac+eqll5i5xoEfEQtZRsDJWCnJMr4j
 POKdWuuUx151LpFTIKRt+lbX7HtxWteGHz+5TS6hkWXdm7QeBV+akC2gqT7qFwsMuqVbAuG/8Oy
 85RrzY+VIAxrnFMS
X-Google-Smtp-Source: AGHT+IHxO8sxD6ByWF8Vz/3btBqccYzxj5h/r13NKofQMWlSJ2LWLuz7YcIp8j0DEqyrs5/QM0e0gg==
X-Received: by 2002:a05:6000:1f89:b0:38c:5c9a:eaca with SMTP id
 ffacd0b85a97d-38dc8d9b8ffmr14516579f8f.3.1739272161939; 
 Tue, 11 Feb 2025 03:09:21 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcb55b7a5sm11814417f8f.14.2025.02.11.03.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 03:09:21 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH v2 04/15] drm/vkms: Add KUnit test scaffolding
Date: Tue, 11 Feb 2025 12:09:01 +0100
Message-ID: <20250211110912.15409-5-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211110912.15409-1-jose.exposito89@gmail.com>
References: <20250211110912.15409-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add the required boilerplate to start creating KUnit test.

To run the tests:

    $ ./tools/testing/kunit/kunit.py run \
      --kunitconfig=drivers/gpu/drm/vkms/tests

Co-developed-by: Arthur Grillo <arthurgrillo@riseup.net>
Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/Kconfig                  | 15 +++++++++++++++
 drivers/gpu/drm/vkms/Makefile                 |  1 +
 drivers/gpu/drm/vkms/tests/.kunitconfig       |  4 ++++
 drivers/gpu/drm/vkms/tests/Makefile           |  3 +++
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 19 +++++++++++++++++++
 5 files changed, 42 insertions(+)
 create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/vkms/tests/Makefile
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_config_test.c

diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
index 9def079f685b..d4665e913de7 100644
--- a/drivers/gpu/drm/vkms/Kconfig
+++ b/drivers/gpu/drm/vkms/Kconfig
@@ -14,3 +14,18 @@ config DRM_VKMS
 	  a VKMS.
 
 	  If M is selected the module will be called vkms.
+
+config DRM_VKMS_KUNIT_TESTS
+	tristate "KUnit tests for VKMS." if !KUNIT_ALL_TESTS
+	depends on DRM_VKMS && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This builds unit tests for VKMS. This option is not useful for
+	  distributions or general kernels, but only for kernel
+	  developers working on VKMS.
+
+	  For more information on KUnit and unit tests in general,
+	  please refer to the KUnit documentation in
+	  Documentation/dev-tools/kunit/.
+
+	  If in doubt, say "N".
diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index 6b0615c424f2..45ef4b89379e 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -10,3 +10,4 @@ vkms-y := \
 	vkms_connector.o
 
 obj-$(CONFIG_DRM_VKMS) += vkms.o
+obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += tests/
diff --git a/drivers/gpu/drm/vkms/tests/.kunitconfig b/drivers/gpu/drm/vkms/tests/.kunitconfig
new file mode 100644
index 000000000000..70e378228cbd
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/.kunitconfig
@@ -0,0 +1,4 @@
+CONFIG_KUNIT=y
+CONFIG_DRM=y
+CONFIG_DRM_VKMS=y
+CONFIG_DRM_VKMS_KUNIT_TESTS=y
diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
new file mode 100644
index 000000000000..b78371d08aa9
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += vkms_config_test.o
diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
new file mode 100644
index 000000000000..1177e62e19cb
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <kunit/test.h>
+
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
+
+static struct kunit_case vkms_config_test_cases[] = {
+	{}
+};
+
+static struct kunit_suite vkms_config_test_suite = {
+	.name = "vkms-config",
+	.test_cases = vkms_config_test_cases,
+};
+
+kunit_test_suite(vkms_config_test_suite);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Kunit test for vkms config utility");
-- 
2.48.1

