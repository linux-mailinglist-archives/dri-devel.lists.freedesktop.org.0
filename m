Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0FF8ABCCD
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 20:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F83A10E123;
	Sat, 20 Apr 2024 18:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=usp.br header.i=@usp.br header.b="fr/LFBwC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4F110E123
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 18:50:33 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1e4f341330fso26730645ad.0
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 11:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1713639033; x=1714243833; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PieGTUoeUoPUyJ/WAcCyTEgeTw+KTCl8GBwssHjdTQc=;
 b=fr/LFBwCpMzLAaKV7b8pXxWYpNq4W++rHRGTzHH8yLDMnJQfWwWtYTozFSHuvtCxiK
 EA58DpkY/IHUh4ksls4bMJCJtvLleum2AEQxpS8g+i5gNKgcWwurKMMBIk9AwtbioSS5
 rZamFZIROXunyS+LH8ngyzGx7LpGPVjcORTnGwXJlCzj7/yoQ90Gri6oa6YeKIzsW2DW
 Xht03Tm9JGAYD9Mq6JuhCDVpvSz4iVSeD50cNwBgSBKA/ACzVeQr9W1rlQlsNNRfgebO
 qu0OJUevBzlEcC6oScJGE7uQQSw5FbgSfw9Gcf8jsek9kzjrhBIHIJ7/lA9x5VWQw/zM
 oFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713639033; x=1714243833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PieGTUoeUoPUyJ/WAcCyTEgeTw+KTCl8GBwssHjdTQc=;
 b=aM12IcXMpSDDMZXNCq9MomELuxDoQqbEn4P05RYIoOQK22vbTLcFiW/H+qgsWHmJMo
 WrWT8G13oupx9nWNDhuCl0kXkLloy2zOHVsWseWe6O+rWAe9JE6P/UPaRil4x/UJV8Pn
 ivct1jLFbN4cZBNj0/atumX0lGNC4ZsEp1lnkQOrAp91Dz3iE9ncwoCY3KdHQfdugyii
 eg88Nm06Qtbw3BHh82pG8rXERNdvX7Vagl/cPVf/+FwrGmWTSGFWvkrHhPZanfKZULVj
 9TxdJa+UMWd8joAzQTwszpJf0XqaWS9oal2p2HA5Jp0mm82Cvl5IqczHwO12Ien3To2H
 3wFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4mDnMthI37KCMd8dFSGg7319b669yuQlTXhrR6ELKZBpOOjJE/FH4o/y0ZjahAdQmoWONXbJMREWUc9OSRXA3LSytkY2e2Esl24K5iiSo
X-Gm-Message-State: AOJu0YzaFGvrsq3AuuCzGnY8N8/cOjEzGvxKXThTH1yklAu8nVfQb4hr
 OrS32XCBFWEjzMKcByxxSw0dLtnMj8OFyam2eOXyKaRRrT0mEcf+fk2abkfBAw==
X-Google-Smtp-Source: AGHT+IF10OVWcIxXR+/jI2HaoOasu5Km/LkS4jGDpfYyt2YIipuAwCog32t23cw71qSjx6QKDtKGoQ==
X-Received: by 2002:a17:903:244e:b0:1e5:870a:b2c0 with SMTP id
 l14-20020a170903244e00b001e5870ab2c0mr8267848pls.14.1713639033291; 
 Sat, 20 Apr 2024 11:50:33 -0700 (PDT)
Received: from fedora.. ([2804:14c:71:5fb7::1001])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a170902d34500b001dd578121d4sm5321995plk.204.2024.04.20.11.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Apr 2024 11:50:32 -0700 (PDT)
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
Subject: [PATCH 1/4] drm/amd/display: Refactor AMD display KUnit tests configs
Date: Sat, 20 Apr 2024 15:48:16 -0300
Message-ID: <20240420184929.97854-2-jppaulo11@usp.br>
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

Configs in AMD display KUnit tests can be clarified. Remove unnecessary
configs, rename configs to follow a pattern, and update config Help
blocks.

Signed-off-by: Joao Paulo Pereira da Silva <jppaulo11@usp.br>
---
 drivers/gpu/drm/amd/display/Kconfig           | 31 ++++++-------------
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  |  2 +-
 .../dc/dml/dcn20/display_mode_vba_20.c        |  2 +-
 .../dc/dml/dcn20/display_rq_dlg_calc_20.c     |  2 +-
 .../drm/amd/display/test/kunit/.kunitconfig   |  7 ++---
 .../gpu/drm/amd/display/test/kunit/Makefile   |  4 +--
 6 files changed, 17 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index 11b0e54262f3..b2760adb3da9 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -51,25 +51,25 @@ config DRM_AMD_SECURE_DISPLAY
 	  This option enables the calculation of crc of specific region via
 	  debugfs. Cooperate with specific DMCU FW.
 
-config DCE_KUNIT_TEST
-	bool "Run all KUnit tests for DCE" if !KUNIT_ALL_TESTS
+config DRM_AMD_DC_KUNIT_TEST
+	bool "Enable KUnit tests for the root of DC" if !KUNIT_ALL_TESTS
 	depends on DRM_AMD_DC && KUNIT
 	default KUNIT_ALL_TESTS
 	help
-		Enables unit tests for the Display Controller Engine. Only useful for kernel
-		devs running KUnit.
+		Enables unit tests for files in the root of the Display Core directory.
+		Only useful for kernel devs running KUnit.
 
 		For more information on KUnit and unit tests in general please refer to
 		the KUnit documentation in Documentation/dev-tools/kunit/.
 
 		If unsure, say N.
 
-config DML_KUNIT_TEST
+config DRM_AMD_DC_DML_KUNIT_TEST
 	bool "Run all KUnit tests for DML" if !KUNIT_ALL_TESTS
 	depends on DRM_AMD_DC_FP && KUNIT
 	default KUNIT_ALL_TESTS
 	help
-		Enables unit tests for the Display Controller Engine. Only useful for kernel
+		Enables unit tests for the Display Controller Next. Only useful for kernel
 		devs running KUnit.
 
 		For more information on KUnit and unit tests in general please refer to
@@ -77,26 +77,13 @@ config DML_KUNIT_TEST
 
 		If unsure, say N.
 
-config AMD_DC_BASICS_KUNIT_TEST
+config DRM_AMD_DC_BASICS_KUNIT_TEST
 	bool "Enable KUnit tests for the 'basics' sub-component of DAL" if !KUNIT_ALL_TESTS
 	depends on DRM_AMD_DC && KUNIT
 	default KUNIT_ALL_TESTS
 	help
-		Enables unit tests for the Display Core. Only useful for kernel
-		devs running KUnit.
-
-		For more information on KUnit and unit tests in general please refer to
-		the KUnit documentation in Documentation/dev-tools/kunit/.
-
-		If unsure, say N.
-
-config AMD_DC_KUNIT_TEST
-	bool "Enable KUnit tests for the 'utils' sub-component of DAL" if !KUNIT_ALL_TESTS
-	depends on DRM_AMD_DC && KUNIT
-	default KUNIT_ALL_TESTS
-	help
-		Enables unit tests for the basics folder of Display Core. Only useful for
-		kernel devs running KUnit.
+		Enables unit tests for the basics folder of the Display Core. Only useful
+		for kernel devs running KUnit.
 
 		For more information on KUnit and unit tests in general please refer to
 		the KUnit documentation in Documentation/dev-tools/kunit/.
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index 7aafdfeac60e..7efd4768b0d7 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -1439,6 +1439,6 @@ bool dc_wake_and_execute_gpint(const struct dc_context *ctx, enum dmub_gpint_com
 	return result;
 }
 
-#if IS_ENABLED(CONFIG_AMD_DC_KUNIT_TEST)
+#if IS_ENABLED(CONFIG_DRM_AMD_DC_KUNIT_TEST)
 #include "../test/kunit/dc/dc_dmub_srv_test.c"
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
index aea6e29fd6e5..5c5be75c08e0 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
@@ -5117,6 +5117,6 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 	}
 }
 
-#if IS_ENABLED(CONFIG_DML_KUNIT_TEST)
+#if IS_ENABLED(CONFIG_DRM_AMD_DC_DML_KUNIT_TEST)
 #include "../../test/kunit/dc/dml/dcn20/display_mode_vba_20_test.c"
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
index 45f75a7f84c7..aab34156e9ae 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
@@ -1684,6 +1684,6 @@ static void calculate_ttu_cursor(struct display_mode_lib *mode_lib,
 	}
 }
 
-#if IS_ENABLED(CONFIG_DML_KUNIT_TEST)
+#if IS_ENABLED(CONFIG_DRM_AMD_DC_DML_KUNIT_TEST)
 #include "../../../test/kunit/dc/dml/dcn20/display_rq_dlg_calc_20_test.c"
 #endif
diff --git a/drivers/gpu/drm/amd/display/test/kunit/.kunitconfig b/drivers/gpu/drm/amd/display/test/kunit/.kunitconfig
index 4c5861ad58bd..1dede9da74d3 100644
--- a/drivers/gpu/drm/amd/display/test/kunit/.kunitconfig
+++ b/drivers/gpu/drm/amd/display/test/kunit/.kunitconfig
@@ -3,7 +3,6 @@ CONFIG_PCI=y
 CONFIG_DRM=y
 CONFIG_DRM_AMDGPU=y
 CONFIG_DRM_AMD_DC=y
-CONFIG_AMD_DC_BASICS_KUNIT_TEST=y
-CONFIG_AMD_DC_KUNIT_TEST=y
-CONFIG_DCE_KUNIT_TEST=y
-CONFIG_DML_KUNIT_TEST=y
+CONFIG_DRM_AMD_DC_BASICS_KUNIT_TEST=y
+CONFIG_DRM_AMD_DC_KUNIT_TEST=y
+CONFIG_DRM_AMD_DC_DML_KUNIT_TEST=y
diff --git a/drivers/gpu/drm/amd/display/test/kunit/Makefile b/drivers/gpu/drm/amd/display/test/kunit/Makefile
index a6ad449f9885..4eb08477d6dc 100644
--- a/drivers/gpu/drm/amd/display/test/kunit/Makefile
+++ b/drivers/gpu/drm/amd/display/test/kunit/Makefile
@@ -3,11 +3,11 @@
 # Makefile for the KUnit Tests for DC
 #
 
-ifdef CONFIG_AMD_DC_BASICS_KUNIT_TEST
+ifdef CONFIG_DRM_AMD_DC_BASICS_KUNIT_TEST
 	DC_TESTS += dc/basics/fixpt31_32_test.o
 endif
 
-ifdef CONFIG_DML_KUNIT_TEST
+ifdef CONFIG_DRM_AMD_DC_DML_KUNIT_TEST
 	CFLAGS_$(AMDDALPATH)/test/kunit/dc/dml/display_mode_vba_test.o := $(dml_ccflags)
 	CFLAGS_$(AMDDALPATH)/test/kunit/dc/dml/dcn20/dcn20_fpu_test.o := $(dml_ccflags)
 	DC_TESTS += dc/dml/display_mode_vba_test.o dc/dml/dcn20/dcn20_fpu_test.o
-- 
2.44.0

