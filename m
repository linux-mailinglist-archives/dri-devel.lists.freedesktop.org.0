Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 270DBD39BBE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 02:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D62210E302;
	Mon, 19 Jan 2026 01:11:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ePdh6OJ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B95B10E2FF
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 01:11:54 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id
 a640c23a62f3a-b873a14bb99so70014366b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 17:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768785113; x=1769389913; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VjUW8QutM1erT9rGZZG1L0OVEG29nCs3yzGVKhAVPiQ=;
 b=ePdh6OJ/TS6WNjPIoeTnKbTzjSjwxesMBC21IqqcBj/Bi0dXlrJgthvdQ7Xxw0leY8
 0h1dc3LUcw31a6ppkyyvfG26aUNnmJ8saxzUEArg8QU2kOYTmyCswJF6aWWAoQOXyipF
 4taJlIASTg449nY74LDF6MQPHUFMqsyz5zLOSgW3uMATpGH4X3FbjvE+l/6mCWPocjWe
 390S/MVs/3+OnRn7sGCqjvi4/tTjB694ugLcYyaTSKdAV7UIjlP9T7ERF0oiiNOE6Zi4
 Bc73TQWKXUsNAYjX0n93C6OvfijNhd2esB4KwRE+KPVDoFugES3TESb+uUyiy0Ysi9Ug
 7rdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768785113; x=1769389913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VjUW8QutM1erT9rGZZG1L0OVEG29nCs3yzGVKhAVPiQ=;
 b=r6EYO1veDXCnQgLLmxmIHwz8UBSnyJ2TReR6XMfm+mp9HiD9Lun/YFJDAdoxRIhyF9
 rPdZERKA5nXpa4u5azhaozcoHjWIM4XZ3XT+h5Dvr95O9NJE8wXI1ueXLgd2sEfQ8lkg
 3atljc7vd5Tc4keaJiJdYyT0Ep32t14vupEgOD6LsO3eyD9WsCMJK6NAfVK+4kSq1xeW
 LAUr2MdnsATrDE3YSAV6iSDXc95c0O1nidsIn13zvctrSRlb5nCmVQfKTJO3syTxnPXF
 GxObCCKy1aTEDVv3Dx7mTwH0bV5sKaodBZI1pxLDlULrGLvUfnzP4E5knv4OcgQkfplV
 R58w==
X-Forwarded-Encrypted: i=1;
 AJvYcCURGO6tPduyz9wYdB+Fp35aGdgHUnnsBUEXFcQVKR0WqPOnoe7u/9UJ9IJ5u86LoYuFYdSjqkTxy4s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw12UaJYhAoDp8edq2mpRogSZImQuqoZpQrlOhrL0yryc5R0igq
 iUVZFWDtEYoF3gE5xlRq0BxaQK4y6AazYpkgfr5puAHpfpkMwxyB4yGP
X-Gm-Gg: AY/fxX61esNWkgvU9ANwBcWe3l4LmupglUmO39Vym2+OxqGQE/iy6nd+Wq6ikdN33uN
 d1bXRqIhIDaz6QGXyV1Emma6ROFyr9BM/EjR7rSIht0KVCptDcNsrD8A6QlR3droDu3V3PHowZ+
 V2RqaUW08yUx2+R4n/he+PxSfhtOscUd5xUyLkxXLMcxJfZV0ZE8tQ53doWJP1FcarvGwEWWGgx
 6GkTrFer30Lkpq72RpizbiMNLIQaPcIF5wjBk9B7CAee0LzB0MW9PfWJzx1o1a9pkI9jVuR7oFC
 wf6CmotgF/x6kfS6HY1hTjjjlHOCPUcE9AQzXW3RcEPLP1lWVp0Dh0iVqs6htryDHvJQhEP8yUj
 Q0oZrG4IJ9Q0SOVdPxDmw0yKK5SW9R2sXTx6W44cERyyn25OHkepO7BptQ50DIXw6bQKGtBLltx
 tH8KV1CqwTugAOUFPkmXnoux+1xVtAzwdFz4AniopSPystLqBcsv+zjp2DpxZ3f6Qq
X-Received: by 2002:a05:6402:5242:b0:650:854c:454a with SMTP id
 4fb4d7f45d1cf-654524cdd07mr4619489a12.1.1768785112567; 
 Sun, 18 Jan 2026 17:11:52 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-654535c4912sm8989806a12.30.2026.01.18.17.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 17:11:52 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com
Subject: [PATCH 03/17] drm/amd/display: Check for VRR range in CEA AMD vsdb
Date: Mon, 19 Jan 2026 02:11:32 +0100
Message-ID: <20260119011146.62302-4-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119011146.62302-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260119011146.62302-1-tomasz.pakula.oficjalny@gmail.com>
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

[Why]
Some monitors only expose GTF ranges (or others, without Range Limits
Only flag). This breaks VRR even though they have explicit FreeSync
support.

Currently, if monitor ranges were missing, amdgpu only searched for AMD
vsdb in DisplayID but many monitors have it in CEA, just like HDMI.

[How]
For DP and eDP connections, check for VRR ranges provided in AMD vendor-
specific data block if VRR range wasn't detected.

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3894
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4457
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4747
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4856
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d83c65dc93d7..69f3dbfe4ca3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13270,6 +13270,12 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 
 	if (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
 	    sink->sink_signal == SIGNAL_TYPE_EDP) {
+		/*
+		 * Many monitors expose AMD vsdb in CAE even for DP and their
+		 * monitor ranges do not contain Range Limits Only flag
+		 */
+		if (valid_vsdb_cea && is_monitor_range_invalid(connector))
+			monitor_range_from_vsdb(connector, &vsdb_info);
 
 		if (dpcd_caps.allow_invalid_MSA_timing_param)
 			freesync_capable = copy_range_to_amdgpu_connector(connector);
-- 
2.52.0

