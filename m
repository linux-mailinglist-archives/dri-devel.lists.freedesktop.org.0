Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 261F2B32885
	for <lists+dri-devel@lfdr.de>; Sat, 23 Aug 2025 14:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1715810E1C9;
	Sat, 23 Aug 2025 12:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.b="TZpicumQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 553 seconds by postgrey-1.36 at gabe;
 Sat, 23 Aug 2025 12:26:21 UTC
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FAE010E1C9
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 12:26:21 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BC1E441491
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 12:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1755951427;
 bh=tHRlOV1gcalzCWbpUniF1ug9QqZWPgVHTvYS8H+hUMA=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=TZpicumQwx9P//l5pS7RKN21LIiNy8BQKnnuI0ltCmfbNzNAnDULaxK81NYYFzRI+
 ph8OrWZXkA2nxRnSarj59BPiZfSeQLwvZp6yqiqkGMCueTLLwjtWof5dz7n7+h4+sv
 wYMFdG6lkrGl80VpvtVUqR0+MFEnYkC2+XHQCKVuMEQqslBSno8nzejczher4P4B4A
 luCDtLMxXrQtdwjgYHdf94JgUg1isPRP3oirXGfk7ni8CsKI5SidgTf2dQmtIGYG1r
 6/xhhDWoLr3xyV2dhJ0ZO+MwfQRbhNjQfcgVZ0aF+GrN7u5YM2xDPPy6JaAphQVq5H
 LIbAVN/GwMjRA==
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b2955f64b1so84293651cf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Aug 2025 05:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755951426; x=1756556226;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tHRlOV1gcalzCWbpUniF1ug9QqZWPgVHTvYS8H+hUMA=;
 b=BT2Pi/E1VPYm/7trL9vAgUB5dGHc3Ao+Qki+f57lJDrwk1yUIhLth7/5EXlDzFaYxY
 68iLil4qOQCeN/859e+t49ge5r2igraQNBxMSj4LbA9Ny/moCQWiHFSGRC4iossdek4C
 lx0eZ0YYCOt6MBJ+t/xrIY3APH5Bm1jR4VaC1eLMx74QtCUKwlzl0O0u2LJ0cw1HxFaR
 cNCxQ4PS2eCAkmldNowSqCVW6Bj9Bfwg9xEcmV269v0tIM9idkqE81ynXpDLTLlKVPyW
 bnohGNnB10q1h7rLqDRViSH3/JvBMczx6J/Th8dKtUSUcdBDPQUYK6OtImxiqQBE3TBO
 HLEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQeie77THlG/RuC3G0sFWFCuysCl9BczvriJoXDT/BU9dq8zgtRTQggUKBw3/CM79aoX5zAD0mVKI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw00qbWgDgYdcDEkP3wVhSpR0Jt8EVKmA6jZ18Dz8+vsr9x8wfV
 IsZmBxuL8cJDVeMSoz9ZI2zmFHG6v8BCO+DSFvERTjgQ5eiX/wp1pmrsNyY4Yra5Lcm6HWnnhcZ
 Cl4GKX8ipdJSAmb30XehYbgxq+C/1wIqjMKZ90+v+s0Q6PdIKIBx7hUV0/Th576MaTI6eEDJCXQ
 AqtLv4l/7N5A==
X-Gm-Gg: ASbGnctGuxDCSE8tSSN910P+2xIMKoKsEH+z3GfiAmDyv07elQlWSHK4dLI5NORBwAW
 /86zLEIcexhPayiOZDXw66YMoiZ8n4rqDU1nGIwvNehajc8TzTFevyK/rNzDW5l7eWZhVH8j/9C
 WAXdwRTpe+DOFi438FhdIQcDUb514YPgi4c1tVjHCkohO2EteMo/sZSM+thO+XoMBRoFVXX6iqf
 5DSXrbX2CInvKv6HHypqkZxTApC0EiPRLKArBxkqKViBJzJ/t9phWvD6MtxEWFrVCw7bFgHtJsC
 vi5rlZg/t5ZpBT7CeqdP1owVor3pWxqSLo1oR16rO2qnOeqWS5Hv945v
X-Received: by 2002:a05:622a:a:b0:4b2:8ac4:ef5d with SMTP id
 d75a77b69052e-4b2aab546bamr68378011cf.84.1755951426352; 
 Sat, 23 Aug 2025 05:17:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnIKajDSfV7NO4Hfrf80vUm5NXdkjXXgtLCjExMGkFAp2FhrBW40tEeu25Y2rj3Y+K0BtRNA==
X-Received: by 2002:a05:622a:a:b0:4b2:8ac4:ef5d with SMTP id
 d75a77b69052e-4b2aab546bamr68377701cf.84.1755951426018; 
 Sat, 23 Aug 2025 05:17:06 -0700 (PDT)
Received: from localhost.localdomain ([162.213.32.233])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b2b8c618ddsm15429971cf.10.2025.08.23.05.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Aug 2025 05:17:05 -0700 (PDT)
From: Aaron Ma <aaron.ma@canonical.com>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch, suraj.kandpal@intel.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/backlight: Honor VESA eDP backlight luminance
 control capability
Date: Sat, 23 Aug 2025 20:16:47 +0800
Message-ID: <20250823121647.275834-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.43.0
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

The VESA AUX backlight failed to be enabled becaused luminance_set is
false always.
Fix it by using luminance support control capabitliy.

Fixes: e13af5166a359 ("drm/i915/backlight: Use drm helper to initialize edp backlight")
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 41228478b21c7..0a3a3f6a5f9d8 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -546,7 +546,7 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
 				     luminance_range->max_luminance,
 				     panel->vbt.backlight.pwm_freq_hz,
 				     intel_dp->edp_dpcd, &current_level, &current_mode,
-				     false);
+				     panel->backlight.edp.vesa.luminance_control_support);
 	if (ret < 0)
 		return ret;
 
-- 
2.43.0

