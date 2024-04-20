Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 420C88ABCCB
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 20:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918D810E02C;
	Sat, 20 Apr 2024 18:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=usp.br header.i=@usp.br header.b="Kf56nHIO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4890210E02C
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 18:50:26 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1e65b29f703so24054305ad.3
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 11:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1713639026; x=1714243826; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=69d0O+5fM8Yt3nBud30EjYozGnnBdHocwTktgDdGO/c=;
 b=Kf56nHIOaKqYh8mrUNcb04x7tZ5s/L6kjSszHtX6jKJ/f468spxPe/QOC3boLjalp6
 Te0lanktw++9uqPvtC2IGnFzhnENzJRda5JD3nQI/R9YzjXP2XabsLNR1kmon+pdQK3m
 diva0i/vQQfEcdv9i75/bO4zYMpBTcMnohPF4JcU0s/mTkUY3fMkE8ty2NCDaZ5q6Se3
 +hW8ck0Pa8zJJHAAW4Le1Qx9bU3VuKaMtbgtRNfvex6Ty+y45QK5Sio9DJKDc3hPJeeX
 rg2ZjxLT5ArR9YvUQKzSRuT2QVxI10Q3+qcTEjDGELEcnfm6JWHaKIIu8XRZp8boZr/4
 yKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713639026; x=1714243826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=69d0O+5fM8Yt3nBud30EjYozGnnBdHocwTktgDdGO/c=;
 b=SqRxHZgUBzH+CWgHpRT/kUi+ybgd9RK3s5JAMp/BJ8+FXyJqh1tcABMjZsPmOqUcYT
 fzcNPo4JB58pi1ppl4hxE0XKp1htiEshZHrLHAG0Hj7V4cCvjbjOf8H1S5USimS3Hvvt
 VT80naG7fpF76F49eXqby/u5SDDP7SLvGEHPc/Z+21PeZgankIp7TzbbGtTjKpIDkLoE
 zFOXVmq4iuzImS6prkqSAHhLRl2H94BMa701BS24r2ui1CK01p4BiYAOI+12EOt1OwXx
 PGfmU7aR/FNdQgdOGY2gWh3GRAUilz2Ksj6HtCwnjPHjrNO/anjGPg8umFTRnxrWIfWA
 rmAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0/uKMIgLLmM6MIi07wiDq44rzrAZ1UEjWO08Lqds4xVjW13JD7wVexV79N0+/aLCcMfWWDQSIRpFwLbW/3K2egu9YZMOJp094F0B65pfT
X-Gm-Message-State: AOJu0Yy7geIRtuY3RDInU/P8p8ZJgFO/rIz2wx5nikyP/+AYCtJvs6Bb
 XDlj8kZAyojUumh5cKpmBF+oGXxN0AfTprGB13MjxMmuFeLVn3qnLeLRASDwUA==
X-Google-Smtp-Source: AGHT+IG7wdpD31V/mV9SZ9Z9bEhieOqV6SqkRO2QWssC+nP2fRjbcc/5NQPLDZMSiwwhJKYxFzsQ8g==
X-Received: by 2002:a17:902:c952:b0:1e2:7356:aa36 with SMTP id
 i18-20020a170902c95200b001e27356aa36mr7754665pla.42.1713639026179; 
 Sat, 20 Apr 2024 11:50:26 -0700 (PDT)
Received: from fedora.. ([2804:14c:71:5fb7::1001])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a170902d34500b001dd578121d4sm5321995plk.204.2024.04.20.11.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Apr 2024 11:50:25 -0700 (PDT)
From: Joao Paulo Pereira da Silva <jppaulo11@usp.br>
To: rodrigo.siqueira@amd.com, airlied@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, corbet@lwn.net, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 Xinhui.Pan@amd.com
Cc: paulormm@ime.usp.br, airlied@linux.ie, amd-gfx@lists.freedesktop.org,
 andrealmeid@riseup.net, davidgow@google.com, dlatypov@google.com,
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com,
 hersenxs.wu@amd.com, isabbasso@riseup.net, javierm@redhat.com,
 kunit-dev@googlegroups.com, magalilemes00@gmail.com, mairacanal@riseup.net,
 mwen@igalia.com, nicholas.choi@amd.com, sunpeng.li@amd.com,
 tales.aparecida@gmail.com, twoerner@gmail.com,
 Joao Paulo Pereira da Silva <jppaulo11@usp.br>, linux-doc@vger.kernel.org
Subject: [PATCH 0/4] drm/amd/display: Update Display Core unit tests
Date: Sat, 20 Apr 2024 15:48:15 -0300
Message-ID: <20240420184929.97854-1-jppaulo11@usp.br>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240222155811.44096-1-Rodrigo.Siqueira@amd.com>
References: <20240222155811.44096-1-Rodrigo.Siqueira@amd.com>
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

Hey, I'm interested in contributing for display tests from this patch-set.
I've noticed potential updates related to both refactoring and optimization.
This patch-set applies these suggestions.


[WHY]

1.	The single test suite in the file
	test/kunit/dc/dml/calcs/bw_fixed_test.c, which tests some static
	functions defined in the dc/basics/bpw_fixed.c, is not being run.
	According to kunit documentation
	(https://www.kernel.org/doc/html/latest/dev-tools/kunit/usage.html#testing-static-functions),
	there are two strategies for testing
	static functions, but none of them seem to be configured. Additionally,
	it appears that the Config DCE_KUNIT_TEST should be associated with this
	test, since it was introduced in the same patch of the test
	(https://lore.kernel.org/amd-gfx/20240222155811.44096-3-Rodrigo.Siqueira@amd.com/),
	but it is not being used anywhere in the display driver.

2.	Also, according to the documentation, "The display/tests folder replicates
	the folder hierarchy of the display folder". However, note that this test file
	(test/kunit/dc/dml/calcs/bw_fixed_test.c) has a conflicting path with the file
	that is being tested (dc/basics/bw_fixed.c).

3.	Config Names and Helps are a bit misleading and don't follow a strict
	pattern. For example, the config DML_KUNIT_TEST indicates that it is used
	to activate tests for the Display Core Engine, but instead activates tests
	for the Display Core Next. Also, note the different name patterns in
	DML_KUNIT_TEST and AMD_DC_BASICS_KUNIT_TEST.

4.	The test suite dcn21_update_bw_bounding_box_test_suite configures an init
	function that doesn't need to be executed before every test, but only once
	before the suite runs.

5.	There are some not updated info in the Documentation, such as the
	recommended command to run the tests:
	$ ./tools/testing/kunit/kunit.py run --arch=x86_64 \
	--kunitconfig=drivers/gpu/drm/amd/display/tests
	(it doesn't work since there is no .kunitconfig in
	drivers/gpu/drm/amd/display/tests)


[HOW]

1. Revise Config names and Help blocks.

2.	Change the path of the test file bw_fixed_test from
	test/kunit/dc/dml/calcs/bw_fixed_test.c to test/kunit/dc/basics/bw_fixed_test.c
	to make it consistent with the Documentation and the other display driver
	tests. Make this same test file run by importing it conditionally in the file
	dc/basics/bw_fixed_test.c.

3.	Turn the test init function of the suite
	dcn21_update_bw_bounding_box_test_suite into a suite init.

4.	Update Documentation

Joao Paulo Pereira da Silva (4):
  drm/amd/display: Refactor AMD display KUnit tests configs
  drm/amd/display/test: Fix kunit test that is not running
  drm/amd/display/test: Optimize kunit test suite
    dml_dcn20_fpu_dcn21_update_bw_bounding_box_test
  Documentation/gpu: Update AMD Display Core Unit Test documentation

 .../gpu/amdgpu/display/display-test.rst       | 20 ++++++------
 drivers/gpu/drm/amd/display/Kconfig           | 31 ++++++-------------
 .../gpu/drm/amd/display/dc/basics/bw_fixed.c  |  3 ++
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  |  2 +-
 .../dc/dml/dcn20/display_mode_vba_20.c        |  2 +-
 .../dc/dml/dcn20/display_rq_dlg_calc_20.c     |  2 +-
 .../drm/amd/display/test/kunit/.kunitconfig   |  7 ++---
 .../gpu/drm/amd/display/test/kunit/Makefile   |  4 +--
 .../dc/{dml/calcs => basics}/bw_fixed_test.c  |  0
 .../test/kunit/dc/dml/dcn20/dcn20_fpu_test.c  |  6 ++--
 10 files changed, 32 insertions(+), 45 deletions(-)
 rename drivers/gpu/drm/amd/display/test/kunit/dc/{dml/calcs => basics}/bw_fixed_test.c (100%)

-- 
2.44.0

