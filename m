Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4DB7DDD9D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 09:14:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D54110E659;
	Wed,  1 Nov 2023 08:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169BE10E089
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 23:23:10 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id
 6a1803df08f44-67540aa0f5bso5503826d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 16:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1698794589; x=1699399389;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Sw2B6vE9G+G7w2w874BluWAOKQISQdBMx0gd2n/sE7M=;
 b=ePlFySXpgWQLbQkNBXd9Zlbr+UsCPe+0PqIEhVOS4m0p4wjkcLddrnsqX7CSzpiy5C
 4WIdLJf6v4g/F3nEnh7kjIniv8+uuV5ZIZFtF7rvKjilJxuuBWrBzeqtq1Fv5/k6BOkV
 bSG8IOcy1SfgNws3RBQp3iZ78e+cm+VL+Up40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698794589; x=1699399389;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sw2B6vE9G+G7w2w874BluWAOKQISQdBMx0gd2n/sE7M=;
 b=n9Wdl0bnPgS0JTRJDBxI0O3Ujn2jLip5nUyHLtBDhwHBP7CWyNUIAep3UsdBPoK6fM
 UUrmxNa4DlZ3sShgTH8PtLSMCR4/iyUeQC4CFSUfP+vp8+zrxe3Z49t0KQ8MBXNyvc7N
 j5FwGXZi6NkbOW17t8WSlKMa/Am/1TYlvf40pLN2jBUp69vbHffHpNTTPaR1CQYfDUnZ
 Jn3bOqkV513udMBlOph53t3fXJ+rMZyTEru6zkW7piWN7jF23aeDWloScU9YajJTKlBN
 D9i0aTdNa32f+XTVNbnVVjCSVseUnMwQeNWUh5/pFnz+Z+8qRTx9zsmN+kX2isORJBT9
 QWog==
X-Gm-Message-State: AOJu0YwYg79TGdtMXI4C6IDmFJsirYMj+O20OF7hCyE/QYp4Zn2o/NGN
 McHLZLk5/rbknLVfKJ8O9mABBw==
X-Google-Smtp-Source: AGHT+IELeE7KSX8SDWfKXXFosnM7eJQ87gPQKSBzDxY0zO3dL8fVjd9KroIOSfLXxROs54MZq4uAgw==
X-Received: by 2002:a05:6214:d09:b0:672:3f54:b94f with SMTP id
 9-20020a0562140d0900b006723f54b94fmr7618938qvh.7.1698794589164; 
 Tue, 31 Oct 2023 16:23:09 -0700 (PDT)
Received: from pazz.c.googlers.com.com
 (129.177.85.34.bc.googleusercontent.com. [34.85.177.129])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a0ccc82000000b0066d1d2242desm937757qvl.120.2023.10.31.16.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 16:23:08 -0700 (PDT)
From: Paz Zcharya <pazz@chromium.org>
X-Google-Original-From: Paz Zcharya <pazz@google.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH] drm/i915/display: Only fail fastset on PSR2
Date: Tue, 31 Oct 2023 23:21:57 +0000
Message-ID: <20231031232245.1331194-1-pazz@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 01 Nov 2023 08:14:02 +0000
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
Cc: dri-devel@lists.freedesktop.org, Luca Coelho <luciano.coelho@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Uma Shankar <uma.shankar@intel.com>, Mika Kahola <mika.kahola@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Subrata Banik <subratabanik@google.com>, intel-gfx@lists.freedesktop.org,
 Manasi Navare <navaremanasi@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Paz Zcharya <pazz@chromium.org>,
 Paz Zcharya <pazz@google.com>, linux-kernel@vger.kernel.org,
 Drew Davenport <ddavenport@chromium.org>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, i915 fails fastset if both the sink and the source support
any version of PSR and regardless of the configuration setting of the
driver (i.e., i915.enable_psr kernel argument). However, the
implementation of PSR1 enable sequence is already seamless
and works smoothly with fastset. Accordingly, do not fail fastset
if PSR2 is not enabled.

Signed-off-by: Paz Zcharya <pazz@google.com>
---

 drivers/gpu/drm/i915/display/intel_dp.c  | 4 ++--
 drivers/gpu/drm/i915/display/intel_psr.c | 2 +-
 drivers/gpu/drm/i915/display/intel_psr.h | 1 +
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index e0e4cb529284..a1af96e31518 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2584,8 +2584,8 @@ bool intel_dp_initial_fastset_check(struct intel_encoder *encoder,
 		fastset = false;
 	}
 
-	if (CAN_PSR(intel_dp)) {
-		drm_dbg_kms(&i915->drm, "[ENCODER:%d:%s] Forcing full modeset to compute PSR state\n",
+	if (CAN_PSR(intel_dp) && psr2_global_enabled(intel_dp)) {
+		drm_dbg_kms(&i915->drm, "[ENCODER:%d:%s] Forcing full modeset due to PSR2\n",
 			    encoder->base.base.id, encoder->base.name);
 		crtc_state->uapi.mode_changed = true;
 		fastset = false;
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 97d5eef10130..388bc3246db9 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -187,7 +187,7 @@ static bool psr_global_enabled(struct intel_dp *intel_dp)
 	}
 }
 
-static bool psr2_global_enabled(struct intel_dp *intel_dp)
+bool psr2_global_enabled(struct intel_dp *intel_dp)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 
diff --git a/drivers/gpu/drm/i915/display/intel_psr.h b/drivers/gpu/drm/i915/display/intel_psr.h
index 0b95e8aa615f..6f3c36389cd3 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.h
+++ b/drivers/gpu/drm/i915/display/intel_psr.h
@@ -21,6 +21,7 @@ struct intel_encoder;
 struct intel_plane;
 struct intel_plane_state;
 
+bool psr2_global_enabled(struct intel_dp *intel_dp);
 void intel_psr_init_dpcd(struct intel_dp *intel_dp);
 void intel_psr_pre_plane_update(struct intel_atomic_state *state,
 				struct intel_crtc *crtc);
-- 
2.42.0.820.g83a721a137-goog

