Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AAD8726C3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 19:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08885112C2D;
	Tue,  5 Mar 2024 18:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fdOuVrtr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F02112C31
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 18:40:45 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6e627596554so1853083b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 10:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709664045; x=1710268845; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NGQg+0HBD/PmNnv+fI5fQqG3IGlyLsIaZmNJE7ZYwjo=;
 b=fdOuVrtruGJIpnPhghGIHfsJ1/96UmznxkqxXJYZYhfcRD2U6g3fe9xN7rZAihOxKS
 3FwVFP1UDccyYrfTzxXYVuNFo8Msif4CG8g8OxXs39A28DOhcW1Zi1qL0y2Cy+6olv9E
 PtACGst6z3VHHyRXIhp0IQ3Pma+lghkbKmj16B+CQeuwrVySFhd9KmOdv0R46xQcjz7z
 qko4dTzKV4s9TtkXi+1INF3kKh50phPKiZNtO2zfffWMzVU+M93Mt3suRBqj7lqto93y
 5gJQvYhjZpp3L7r/N+4PAV5LcN92xv+gFZMoWRoDzOcvLKGnOGXog/Izge/jv/Ola+5E
 Rm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709664045; x=1710268845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NGQg+0HBD/PmNnv+fI5fQqG3IGlyLsIaZmNJE7ZYwjo=;
 b=c92lwRgZlPvRvTTZ8SjX+M3TYtsgFb6AmPm5cCDEHRWjeH8i2N91Rg7HXtrc2P0bm0
 HGzNuWGn6quG8PhoEA0Tw0Vrwb72b9XKNppAlTrxsZUdhglTZA4uipvouDpfbwcbyt5w
 eDI1fQttgNmxVfzFsV3XokwO63eARC5wsv4kgc6XwVMBjAWoJ+i0kR3eq5A4noyqY9ui
 RdX8BlN1Gmxrf9uSTlcpml9gi3YnbUxAIpo22aai2MwoTeJLUBMIrEFk/A/mEDeLnV+w
 McMXUc6fb8Ym3dzXC4/jFXMB8pkfAKUqnVxS5HAPajuJn5JEfHnGEOecGw64gwYpl5z4
 6c6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYlHRFn/7K0YUO42a9FjHgca45mZxiM/21+19YkIOejXSZ7wD0Fuec38abDfJ65dSxozyTqIycy3QKRyH5wzO/lKZ5T9UEydCyXuW3A6KS
X-Gm-Message-State: AOJu0YwliGwSqq9A3NxF7QTknnM65aIkF+EMDJkvYcdSLsqn/mfkxN85
 d7D13mCOq2S0c0hF4LRWFFfBBuGn/A2gZ3KnSJZfPPtbfyQP4H9u
X-Google-Smtp-Source: AGHT+IEEib95LASlxflZmOGoKOqjWt2O08nr6/dUyPF5bkMtYTcUru+1PyW5JqlUhb0RbpsxEBo7Nw==
X-Received: by 2002:a05:6a21:8cc5:b0:1a1:47cb:9709 with SMTP id
 ta5-20020a056a218cc500b001a147cb9709mr3127651pzb.44.1709664045282; 
 Tue, 05 Mar 2024 10:40:45 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 b5-20020aa78ec5000000b006e50c083b90sm9219955pfr.212.2024.03.05.10.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 10:40:43 -0800 (PST)
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: [RFC PATCH 2/5] drm: Suppress intentional warning backtraces in
 scaling unit tests
Date: Tue,  5 Mar 2024 10:40:30 -0800
Message-Id: <20240305184033.425294-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240305184033.425294-1-linux@roeck-us.net>
References: <20240305184033.425294-1-linux@roeck-us.net>
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

The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tests
intentionally trigger warning backtraces by providing bad parameters to
the tested functions. What is tested is the return value, not the existence
of a warning backtrace. Suppress the backtraces to avoid clogging the
kernel log.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/gpu/drm/tests/drm_rect_test.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
index 76332cd2ead8..75614cb4deb5 100644
--- a/drivers/gpu/drm/tests/drm_rect_test.c
+++ b/drivers/gpu/drm/tests/drm_rect_test.c
@@ -406,22 +406,28 @@ KUNIT_ARRAY_PARAM(drm_rect_scale, drm_rect_scale_cases, drm_rect_scale_case_desc
 
 static void drm_test_rect_calc_hscale(struct kunit *test)
 {
+	DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
 	const struct drm_rect_scale_case *params = test->param_value;
 	int scaling_factor;
 
+	START_SUPPRESSED_WARNING(drm_calc_scale);
 	scaling_factor = drm_rect_calc_hscale(&params->src, &params->dst,
 					      params->min_range, params->max_range);
+	END_SUPPRESSED_WARNING(drm_calc_scale);
 
 	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
 }
 
 static void drm_test_rect_calc_vscale(struct kunit *test)
 {
+	DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
 	const struct drm_rect_scale_case *params = test->param_value;
 	int scaling_factor;
 
+	START_SUPPRESSED_WARNING(drm_calc_scale);
 	scaling_factor = drm_rect_calc_vscale(&params->src, &params->dst,
 					      params->min_range, params->max_range);
+	END_SUPPRESSED_WARNING(drm_calc_scale);
 
 	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
 }
-- 
2.39.2

