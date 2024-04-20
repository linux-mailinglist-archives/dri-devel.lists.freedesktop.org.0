Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD48E8ABCCF
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 20:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC4410E25E;
	Sat, 20 Apr 2024 18:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=usp.br header.i=@usp.br header.b="ynsgcbee";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EF010E23A
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 18:50:40 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1e9451d8b71so3520605ad.0
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 11:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1713639040; x=1714243840; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CWyAz1u4xj57V45jlhvKvlDv1eG35fXBf7jPQkau5eE=;
 b=ynsgcbee2L9Ky2dSogWYbvTVVCCCZr+AgK36FJ7rXLeEixkIEH7sJYC4p/xUrxIIKk
 TuI6RbJB5WkEhAE45qLXki7tn+xdqlCtDZVlPAqiI2LUPwp/h8/eavgP3c+ABbr0LVVr
 aCudEA5nB5j2w+O2WNycShdJYrqbqRR9wuyhWzPiWEmqclM3LbMZOlKnbd2DyEwykSlo
 rqhSHZ/JO51TRpKKCoGLZV5/0Sp2mQu+OOYO12As4cY9iEvC8d7Q+MgxU3cdDcohibfw
 fJ9RiUPRyLwQsZjg3hT+UF56JnGWRrduXtu6HalEepMTZCjY8vTV3DCTjpHLEGkOxYo3
 6XjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713639040; x=1714243840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CWyAz1u4xj57V45jlhvKvlDv1eG35fXBf7jPQkau5eE=;
 b=mw2xSH/rb/sF+3R2eYkOBkmSu+eKXxmmgQheTyzngVjMmHZmLZ5cIJWcKVfBphqnWW
 v/GesKLbtN+eh1O3CWFMsrnnWzKN/u2CKfCi1XXkhvF64av2LE/ykIWm8gtD/fWrjZt4
 ZHS2GjsuH4lYlCy8Q55DDqVxrBCfOi5+56akuCFNXw1Qna+P++tYtsFAH8/qgR8OEtCT
 Ecl1malht9IGnRFp7vf6LVNXNKhCM8YH905nVeHaVC7cdfVcqIUXhGmz/Ks6tAeX9Ceg
 tnpdM6YJ5Xe3F7zY1A5wjFZMhHwxfAfahG6ABn/QII3KKnyACyc73oA0uceJtOt4vvXg
 VMiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF+xqJKjjMe7gW6BcNf7tGSmJlTkT2cwl/K28y/klAX1Flh4D5WyEC8G6Dmeeh6wNvX/UjbJXCOkJE6N0ItSdYES+w1Dayn5VIDeY68wnD
X-Gm-Message-State: AOJu0YzuF7fHRsS5Lwr3nK4YBXQ5E+v8jitf7gvLZIIBGUYWBrnc5G2Z
 9S2ifNG3dcofZ4curkWozwnTZVAZ70Jc/zQkCb8uFv7BnyW4liyA/VIZhblbWQ==
X-Google-Smtp-Source: AGHT+IEo9kHV50Oez+zEhmV7fo1Ifywqglffw4YlvuyleNm+Ws53MueCqFrD12SgkDGOOd2ppyZEWw==
X-Received: by 2002:a17:902:b182:b0:1e2:1805:52c5 with SMTP id
 s2-20020a170902b18200b001e2180552c5mr4531576plr.16.1713639040397; 
 Sat, 20 Apr 2024 11:50:40 -0700 (PDT)
Received: from fedora.. ([2804:14c:71:5fb7::1001])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a170902d34500b001dd578121d4sm5321995plk.204.2024.04.20.11.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Apr 2024 11:50:40 -0700 (PDT)
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
Subject: [PATCH 2/4] drm/amd/display/test: Fix kunit test that is not running
Date: Sat, 20 Apr 2024 15:48:17 -0300
Message-ID: <20240420184929.97854-3-jppaulo11@usp.br>
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

The KUnit test file test/kunit/dc/dml/calcs/bw_fixed_test.c does not have the
correct path relative to the file being tested, dc/basics/bw_fixed.c.
Also, it is neither compiling nor running.
Therefore, change the test file path and import it conditionally in the file
dc/basics/bw_fixed.c to make it runnable.

Signed-off-by: Joao Paulo Pereira da Silva <jppaulo11@usp.br>
---
 drivers/gpu/drm/amd/display/dc/basics/bw_fixed.c               | 3 +++
 .../test/kunit/dc/{dml/calcs => basics}/bw_fixed_test.c        | 0
 2 files changed, 3 insertions(+)
 rename drivers/gpu/drm/amd/display/test/kunit/dc/{dml/calcs => basics}/bw_fixed_test.c (100%)

diff --git a/drivers/gpu/drm/amd/display/dc/basics/bw_fixed.c b/drivers/gpu/drm/amd/display/dc/basics/bw_fixed.c
index c8cb89e0d4d0..f18945fc84b9 100644
--- a/drivers/gpu/drm/amd/display/dc/basics/bw_fixed.c
+++ b/drivers/gpu/drm/amd/display/dc/basics/bw_fixed.c
@@ -186,3 +186,6 @@ struct bw_fixed bw_mul(const struct bw_fixed arg1, const struct bw_fixed arg2)
 	return res;
 }
 
+#if IS_ENABLED(CONFIG_DRM_AMD_DC_BASICS_KUNIT_TEST)
+#include "../../test/kunit/dc/basics/bw_fixed_test.c"
+#endif
diff --git a/drivers/gpu/drm/amd/display/test/kunit/dc/dml/calcs/bw_fixed_test.c b/drivers/gpu/drm/amd/display/test/kunit/dc/basics/bw_fixed_test.c
similarity index 100%
rename from drivers/gpu/drm/amd/display/test/kunit/dc/dml/calcs/bw_fixed_test.c
rename to drivers/gpu/drm/amd/display/test/kunit/dc/basics/bw_fixed_test.c
-- 
2.44.0

