Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D95D39BC3
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 02:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C0810E308;
	Mon, 19 Jan 2026 01:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QkZ8lDQC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6AC610E303
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 01:12:00 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id
 a640c23a62f3a-b8718e54398so69201266b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 17:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768785119; x=1769389919; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LZXVwXnPctt9VEWjXx91N6i+1aICn1iOJ7TSOyayxAY=;
 b=QkZ8lDQCsX+8WRPu8nZ8XNcDKrzvDaX1r1oeugh1JuNfomx1+xbh4iqF8Wyx5wUcTQ
 dyEc3QOU6fFA6I5tgPSZQbeYKVE9kXtxp7Rf7fzXMaRatUF1cCf+WuYmq3+/DtYGbaHo
 3Ez+mjyaKAB2bLACAup70zndGn1f3aBBSYHNt7c2raPLMVoMie3PC+g+0V55lbbmvpPk
 Hb2lR34Doz5coe65eA3yET9GB8EUFSQU4d0Azbqzja8wlfuhNJTmmNW1ZnRVWa8tQad2
 F02V/F3vql0x1koaS5yu54Wak2WEpajZN2GoyXr9wKsXpuYFuEqT1k3/b5JtpfUxSnjZ
 wKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768785119; x=1769389919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LZXVwXnPctt9VEWjXx91N6i+1aICn1iOJ7TSOyayxAY=;
 b=WGTWPoYvvprIc/45TvQwdvoAjTAWifVgy8sGA2/xCdzr8Xpd3BgBWeHQXKlAHbeSR9
 zIo5PUK1S0uDQ7ZNjdSJ/ycrqoXokScMMeZu6OzYc3N2nOAJDSKmMrLHDSc5z2c9dhMU
 mGSSPeAqMb588q4FOd8vQih2Hbkg+gFasgqd/lKlolpKnaTGpREjabpZadQq2O4AWRC+
 nKbIHl0cOvHukYmO3dD7dD1uJrJKcuz2abgED56MhryMA+FwuT+hv+ZeuEnUUGdHkaG1
 x3I2CXE9kCYuoMiRtlM5kNNkl93sbKA46Zw3wubB4lBz9S2EUIaU1wULfe3obAa3DOy8
 f46g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSy10oImtpqyOqYqCVICvmZ0Ifyme5vxz/wlua6uCPhvX+xNcZLn+h3/QQydDDjjbJ/wPo2bZ+wlQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUV1dn2K6Zc5gpOx1IiaEBr/fKfJuQMhE/iVlbmg6pBOvyrQw7
 QfzVHToKvHnaxpk5Zu4DYu0GC359ksxxHIIXq7lWV3oAQVPCHidMVVkG
X-Gm-Gg: AY/fxX6I77gDKlykQEF66O29tW1o0ni1CkDCDeZP+LZuzyKv4Hheba2m1jo2fHBPXhp
 C5Le9GPb+s1NuT6l5cWrf+k14hwL/ysopHKYq5gE1/z1y/wixxo7oS6MJ3FlUkrefLP3hWgc+oO
 j563+Cz1A9WycJWx2tl2mY9VCInvVwtBhykRzLvwMbf2hZeBpL51/5FS3ZKfo0m9GW/8V2XGOE0
 zkcZL7cZGu3nS5kEa17O0BFX1L3cwpnLNyEFJFVqsemkiDVpMfkWABP6K9i4rCMUXmasfhu38kP
 ULF4FuJawSPoOj9M81/p5I2qciJkM0z56fv78rnh2lMHLuU0QGLEZznrWVSlkSSfUh2WbQT0fCt
 qEKyjvUFoBsHiQsf9hLC+rqEiHhiANDHqdisPCWO4KVTiATYJ/gLZBUAcoO/zS+Sp/C0fM7j5sj
 DDXczLSwU4W7kn9/t/VNXofpNiLNauDcrBlqRxGijp6tnJ42jCduVgB++RMk7gvX1fdVvUv2yvA
 +Y=
X-Received: by 2002:a05:6402:42d2:b0:64d:23ac:6cae with SMTP id
 4fb4d7f45d1cf-65452bce08amr4211650a12.6.1768785119145; 
 Sun, 18 Jan 2026 17:11:59 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-654535c4912sm8989806a12.30.2026.01.18.17.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 17:11:58 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com
Subject: [PATCH 07/17] drm/amd/display: Add CH7218 PCON ID
Date: Mon, 19 Jan 2026 02:11:36 +0100
Message-ID: <20260119011146.62302-8-tomasz.pakula.oficjalny@gmail.com>
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
Chrontel CH7218 found in Ugreen DP -> HDMI 2.1 adapter (model 85564)
works perfectly with VRR after testing. VRR and FreeSync compatibility
is explicitly advertised as a feature so it's addition is a formality.

Support FreeSync info packet passthrough and "generic" HDMI VRR.

[How]
Add CH7218's ID to dm_helpers_is_vrr_pcon_allowed()

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4773

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 1 +
 drivers/gpu/drm/amd/display/include/ddc_service_types.h   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 2ef515a4e1c4..37747f87b55a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -1390,6 +1390,7 @@ bool dm_helpers_is_vrr_pcon_allowed(const struct dc_link *link, const struct drm
 	case DP_BRANCH_DEVICE_ID_0060AD:
 	case DP_BRANCH_DEVICE_ID_00E04C:
 	case DP_BRANCH_DEVICE_ID_90CC24:
+	case DP_BRANCH_DEVICE_ID_2B02F0:
 		return true;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/include/ddc_service_types.h b/drivers/gpu/drm/amd/display/include/ddc_service_types.h
index 1c603b12957f..e838f7c1269c 100644
--- a/drivers/gpu/drm/amd/display/include/ddc_service_types.h
+++ b/drivers/gpu/drm/amd/display/include/ddc_service_types.h
@@ -36,6 +36,7 @@
 #define DP_BRANCH_DEVICE_ID_006037 0x006037
 #define DP_BRANCH_DEVICE_ID_001CF8 0x001CF8
 #define DP_BRANCH_DEVICE_ID_0060AD 0x0060AD
+#define DP_BRANCH_DEVICE_ID_2B02F0 0x2B02F0 /* Chrontel CH7218 */
 #define DP_BRANCH_HW_REV_10 0x10
 #define DP_BRANCH_HW_REV_20 0x20
 
-- 
2.52.0

