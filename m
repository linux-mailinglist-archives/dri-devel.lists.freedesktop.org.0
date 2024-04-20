Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D21208ABCD1
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 20:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8F110E22E;
	Sat, 20 Apr 2024 18:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=usp.br header.i=@usp.br header.b="zoVJhBOb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0168D10E286
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 18:50:47 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1e8b03fa5e5so19818445ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 11:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1713639047; x=1714243847; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VQjFYwxXugp5kZIt490GmWy6VzHRTTztx48u5ltsIaI=;
 b=zoVJhBObPfeOGDqtIWkaj0HlbvdR1UjYQh6k4GLCCFlTR6aKJ3OSXeDbaKRqW6wkjc
 eH9Ac5Y0f2zmhSXipDxG2JPfjk2RXwR++weZp019MlAcTMDUMdyLmII6DZQnGv76WszL
 kiJ4dfsIlzv/roGbQQ0NsUNz8gz6kBMEG+X0SWAnb9vbRuO3jaTtCRmIQNlYCF1ZMN27
 /qMbXbXUJJ0UxWSBkYTYJxO7GYxhkvH+QlqrlrbjBwaXI9lRUiv/9STP5Johh3AAoABt
 IiQNh0oM7jk34bI2o0Hfx9ID884Gnm02BS5OQhpsyA/9v0SEPuYglfdrvO52wjz5dy9z
 6DpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713639047; x=1714243847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VQjFYwxXugp5kZIt490GmWy6VzHRTTztx48u5ltsIaI=;
 b=vfjjvItYT/mTClLyijztUvMOYPoyKga1149LAVSQegTKymle0BQkauGb+TElTZ+jG6
 XpY9fiTOLz6Js3GXAXK5DIlrDo81eqP+pOmwcd+w5E38Hg7hkuea/JYZqF8qeNTGRtXf
 DqCSQ0zGSnrceuCe3NoT6sY6pCANZi1YfqKtMq8sSUE4S0CHfCNYRhTfM/G7qShvtiL9
 wDkk1k+CRN5z0Ug6hBb7ZYl5XQKSxG8U/4N9UslYFtoHmWfVVDE60bBOHWxNoDmy4jxV
 3xVKn/D8jGBVKA2fuBzwgFUum83EgxZqTZGFClD7KhiXbI4CgCiNKijv7x/YjOuaajXY
 hCeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK7t9kshUfQtSp1IYH+lSO9S62fA4VvOv8a34tWFRGN1ZGsP7KVMRnDB8fTiVp7jcKObBCfLEhmD0V2w4H+cG9htUnyLKLs3W04fFzVI/i
X-Gm-Message-State: AOJu0YwH79oGY+kowtXbI7tSRC1peWyQjhfvgpLkNaSP4KKZNi70Q+a4
 W4W44kkdjxoH+f0hKBFoJ5gLmnBsf5gSPmmR58oTsuYhK/ZtPI4Fty5v6fgT8A==
X-Google-Smtp-Source: AGHT+IHH4/m+EBY2e4cPGddiRdYGqBEbkiiJFT9yYcnFl8IC8VOHlIKkMncZx2O2K29kEMQSVBhUBw==
X-Received: by 2002:a17:902:e807:b0:1e5:d021:cf58 with SMTP id
 u7-20020a170902e80700b001e5d021cf58mr8150095plg.36.1713639047490; 
 Sat, 20 Apr 2024 11:50:47 -0700 (PDT)
Received: from fedora.. ([2804:14c:71:5fb7::1001])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a170902d34500b001dd578121d4sm5321995plk.204.2024.04.20.11.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Apr 2024 11:50:47 -0700 (PDT)
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
Subject: [PATCH 3/4] drm/amd/display/test: Optimize kunit test suite
 dml_dcn20_fpu_dcn21_update_bw_bounding_box_test
Date: Sat, 20 Apr 2024 15:48:18 -0300
Message-ID: <20240420184929.97854-4-jppaulo11@usp.br>
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

The KUnit init function of the suite
dml_dcn20_fpu_dcn21_update_bw_bounding_box_test does not need to be executed
before every test, but only once before the test suite, since it's just
used to store backup copies of DCN global structures.
So, turn it into a suite_init.

Signed-off-by: Joao Paulo Pereira da Silva <jppaulo11@usp.br>
---
 .../amd/display/test/kunit/dc/dml/dcn20/dcn20_fpu_test.c    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/test/kunit/dc/dml/dcn20/dcn20_fpu_test.c b/drivers/gpu/drm/amd/display/test/kunit/dc/dml/dcn20/dcn20_fpu_test.c
index c51a0afbe518..b13a952e0227 100644
--- a/drivers/gpu/drm/amd/display/test/kunit/dc/dml/dcn20/dcn20_fpu_test.c
+++ b/drivers/gpu/drm/amd/display/test/kunit/dc/dml/dcn20/dcn20_fpu_test.c
@@ -449,10 +449,10 @@ static struct _vcs_dpi_soc_bounding_box_st original_dcn2_1_soc;
 static struct _vcs_dpi_ip_params_st original_dcn2_1_ip;
 
 /**
- * dcn20_fpu_dcn21_update_bw_bounding_box_test_init - Store backup copies of DCN global structures
+ * dcn20_fpu_dcn21_update_bw_bounding_box_test_suite_init - Store backup copies of DCN global structures
  * @test: represents a running instance of a test.
  */
-static int dcn20_fpu_dcn21_update_bw_bounding_box_test_init(struct kunit *test)
+static int dcn20_fpu_dcn21_update_bw_bounding_box_test_suite_init(struct kunit_suite *suite)
 {
 	memcpy(&original_dcn2_1_soc, &dcn2_1_soc, sizeof(struct _vcs_dpi_soc_bounding_box_st));
 	memcpy(&original_dcn2_1_ip, &dcn2_1_ip, sizeof(struct _vcs_dpi_ip_params_st));
@@ -553,7 +553,7 @@ static struct kunit_case dcn20_fpu_dcn21_update_bw_bounding_box_test_cases[] = {
 
 static struct kunit_suite dcn21_update_bw_bounding_box_test_suite = {
 	.name = "dml_dcn20_fpu_dcn21_update_bw_bounding_box_test",
-	.init = dcn20_fpu_dcn21_update_bw_bounding_box_test_init,
+	.suite_init = dcn20_fpu_dcn21_update_bw_bounding_box_test_suite_init,
 	.exit = dcn20_fpu_dcn21_update_bw_bounding_box_test_exit,
 	.test_cases = dcn20_fpu_dcn21_update_bw_bounding_box_test_cases,
 };
-- 
2.44.0

