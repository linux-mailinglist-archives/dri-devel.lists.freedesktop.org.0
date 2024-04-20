Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E958ABCD3
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 20:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0409310E302;
	Sat, 20 Apr 2024 18:50:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=usp.br header.i=@usp.br header.b="tMfcQv6S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC4A10E302
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 18:50:54 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1e651a9f3ffso19167645ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 11:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1713639054; x=1714243854; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I1sf1nvfz3ifThSFMeOGabi7Qw/QWhFE4nU3ybk98Qw=;
 b=tMfcQv6SzG3lCVDC6Vrqc61UhlMugBal0ka1e/3heyX5uz6D5SP2JvGx0yXzJaQmWd
 oFCMXdi/z2XxvfaotEgqsVoOfLi7N/KIJmM7h+16vIk0QoXBh2L0GneDSpNW3JqHxYt7
 Sa7JXxCSalrXbmfFtTDw/FTW/3XrJ3Sy4NJfSHNpC8UY+H3+i5JEBElWg0mH4k3ClzRz
 uROJhnMevC5lVI4e+gSVC35hoMiWpbMx93dLbVSU4OKpB4qQxKMfJUpn2JKFcJNq4rzw
 JfHIWOKcrF8HRAOoisC3NQviyIAFQO+o8FOJ9l9sxlfvVChBsA/ewUXazTjlF/BWMgcs
 OQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713639054; x=1714243854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I1sf1nvfz3ifThSFMeOGabi7Qw/QWhFE4nU3ybk98Qw=;
 b=PCIEjmrb0DgQCqa3DWArVNQf17eymFbVNxu+Ytrqwsv/XNwqfb8bazhmys+0e7NP/P
 hmrivxJpcGd3Tg7sokDKfOWhgxmyqS7nQapil0NpXU+HXsM4mB1a9VbyZkodMpxSTvR4
 xo6bOAPcgFKhrX1pZWK3H+69h8SrPHB/YpcJOn1gAco2Y45fp2wIr8/kw2uj6X5If+tS
 THtvhZwbcOTBsQmgl46/VWVPhqelPu+U4wFH9MWKIHoZ7b0ofZBb4O/dRHkJC1LPyz7P
 eyQWLdHeKsowc/t4oX768N2C1L4FmRtJrVTQ6Eibujs364/9LZDfEAH3b2aoT54iLMSP
 R5BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCW+IKVce2iYy7NEqS6wfCg+npcEpHuXqEmr2ufAwus1Z0uKpQECBhlxTc9P1LnFyHXFGOFe+hnGh0vZFtRhSHs7fza3qCs7AvhEFVJkPE
X-Gm-Message-State: AOJu0YyyIHtJ1Aqqb6V7HURhAGKGiIS0tGtaagmHAydRi6flW4MUNODy
 cZGDudp2J05XbPXYC4nLV6JD4s3qYxNkewpeL94C5lBhHrDUdwNQJq0HAY2pIQ==
X-Google-Smtp-Source: AGHT+IGzl1CCAsssd/zVs54CpXRnh9dqBRX/qaai4shXGSmvCwo4Y777rzhz0iAAq2gNp7o278i00w==
X-Received: by 2002:a17:902:b40a:b0:1e8:6729:5146 with SMTP id
 x10-20020a170902b40a00b001e867295146mr5676662plr.57.1713639054524; 
 Sat, 20 Apr 2024 11:50:54 -0700 (PDT)
Received: from fedora.. ([2804:14c:71:5fb7::1001])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a170902d34500b001dd578121d4sm5321995plk.204.2024.04.20.11.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Apr 2024 11:50:54 -0700 (PDT)
From: Joao Paulo Pereira da Silva <jppaulo11@usp.br>
To: rodrigo.siqueira@amd.com
Cc: paulormm@ime.usp.br, Xinhui.Pan@amd.com, airlied@linux.ie,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 andrealmeid@riseup.net, christian.koenig@amd.com, daniel@ffwll.ch,
 davidgow@google.com, dlatypov@google.com, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, hersenxs.wu@amd.com, isabbasso@riseup.net,
 javierm@redhat.com, kunit-dev@googlegroups.com,
 maarten.lankhorst@linux.intel.com, magalilemes00@gmail.com,
 mairacanal@riseup.net, mripard@kernel.org, mwen@igalia.com,
 nicholas.choi@amd.com, sunpeng.li@amd.com, tales.aparecida@gmail.com,
 twoerner@gmail.com, tzimmermann@suse.de,
 Joao Paulo Pereira da Silva <jppaulo11@usp.br>
Subject: [PATCH 4/4] Documentation/gpu: Update AMD Display Core Unit Test
 documentation
Date: Sat, 20 Apr 2024 15:48:19 -0300
Message-ID: <20240420184929.97854-5-jppaulo11@usp.br>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240420184929.97854-1-jppaulo11@usp.br>
References: <20240222155811.44096-1-Rodrigo.Siqueira@amd.com>
 <20240420184929.97854-1-jppaulo11@usp.br>
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

Display Core unit tests documentation is a bit outdated, therefore
update it to follow current configuration.

Signed-off-by: Joao Paulo Pereira da Silva <jppaulo11@usp.br>
---
 .../gpu/amdgpu/display/display-test.rst       | 20 +++++++++----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/Documentation/gpu/amdgpu/display/display-test.rst b/Documentation/gpu/amdgpu/display/display-test.rst
index a8c136ce87b7..a9fddf0adae7 100644
--- a/Documentation/gpu/amdgpu/display/display-test.rst
+++ b/Documentation/gpu/amdgpu/display/display-test.rst
@@ -15,14 +15,14 @@ How to run the tests?
 =====================
 
 In order to facilitate running the test suite, a configuration file is present
-in ``drivers/gpu/drm/amd/display/tests/dc/.kunitconfig``. This configuration file
+in ``drivers/gpu/drm/amd/display/test/kunit/.kunitconfig``. This configuration file
 can be used to run the kunit_tool, a Python script (``tools/testing/kunit/kunit.py``)
 used to configure, build, exec, parse and run tests.
 
 .. code-block:: bash
 
-	$ ./tools/testing/kunit/kunit.py run --arch=x86_64 \
-	    --kunitconfig=drivers/gpu/drm/amd/display/tests
+    $ ./tools/testing/kunit/kunit.py run --arch=x86_64 \
+        --kunitconfig=drivers/gpu/drm/amd/display/test/kunit
 
 Currently, the Display Core Unit Tests are only supported on x86_64.
 
@@ -34,10 +34,9 @@ you might add the following config options to your ``.config``:
 
 	CONFIG_KUNIT=y
 	CONFIG_AMDGPU=m
-	CONFIG_AMD_DC_BASICS_KUNIT_TEST=y
-	CONFIG_AMD_DC_KUNIT_TEST=y
-	CONFIG_DCE_KUNIT_TEST=y
-	CONFIG_DML_KUNIT_TEST=y
+	CONFIG_DRM_AMD_DC_BASICS_KUNIT_TEST=y
+	CONFIG_DRM_AMD_DC_KUNIT_TEST=y
+	CONFIG_DRM_AMD_DC_DML_KUNIT_TEST=y
 
 Once the kernel is built and installed, you can load the ``amdgpu`` module
 to run all tests available.
@@ -49,10 +48,9 @@ following config options to your ``.config``:
 
 	CONFIG_KUNIT=y
 	CONFIG_AMDGPU=y
-	CONFIG_AMD_DC_BASICS_KUNIT_TEST=y
-	CONFIG_AMD_DC_KUNIT_TEST=y
-	CONFIG_DCE_KUNIT_TEST=y
-	CONFIG_DML_KUNIT_TEST=y
+	CONFIG_DRM_AMD_DC_BASICS_KUNIT_TEST=y
+	CONFIG_DRM_AMD_DC_KUNIT_TEST=y
+	CONFIG_DRM_AMD_DC_DML_KUNIT_TEST=y
 
 In order to run specific tests, you can check the filter options from KUnit on
 Documentation/dev-tools/kunit/kunit-tool.rst.
-- 
2.44.0

