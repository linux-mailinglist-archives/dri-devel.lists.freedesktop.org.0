Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A3AA79457
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCF810E8A7;
	Wed,  2 Apr 2025 17:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tx/UhFPw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73B010E899;
 Wed,  2 Apr 2025 17:43:01 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-3d46ef71b6cso826725ab.3; 
 Wed, 02 Apr 2025 10:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615781; x=1744220581; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=phnE7T3rE82X9afYdUepg2ZaVnfZbBYGopazv1dsHzc=;
 b=Tx/UhFPwcCVmluMOd0jv39M7yAm2KrFLDuhg5PwjylzijiOBSmNcPJ/EjrnDhYYfKB
 UrDeK+njbVIrjgOEsTsTkasEeoFfM9+mF5IaHAEtcf8c27M66KxyBfbSgzzg/q5Pbcyq
 JWXqv1qPNMbKA1dKssNMh7DtpjVSmEGasQPl8eHmvLuTUi9O8QBu2k6xJX7EU73VVoj5
 M6lLhyXW+9j8A6VmnaZr9FP4cdYN/1UjAC+Qr3wYKAeJCwxFjqMGTmmfpHC02YmXzFfF
 BDPzdibpkkm9OCXJ7+5KzXvbEyk4tV53vhJEpBuaePIHvKm+nFp8uT+PviSsbDfebb60
 6ZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615781; x=1744220581;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=phnE7T3rE82X9afYdUepg2ZaVnfZbBYGopazv1dsHzc=;
 b=Xf4NZFwwvq9agJdmSP8e7hpXmBqT+uQDdnfpVIQbdPIs+wzCQ0j189HtADe8GevSqm
 W6RCRSDVCNhwX0rRK9g5o5HC4V4sVOJLspRaWhVATOzF18KorLuC7S76k5VMhhQhECO9
 fYPL3SGreINEZZyMcnKFVStwWVoiRu9zqADbusltarvrY/LhVUke4v9cal0BiWs99J1s
 jZrL4yvFfgJlYhrhScF4aShTNUHchMo1srynU55jR1RPvNQqeCnFp9U4PLWg33vQJXr+
 bgrdJUnPs2hlqS+wDXWiQudV4UXOr7BTuU0zvtd0xqoXHC3mekgLaLvZMedZ+v2voGXQ
 BVhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw7fdjDqczbsyC0OMWiRk7krr+4b0OX3lp/Qd6bkq+372PgFm4uotB6UG+mIk5toduMhcJADl9@lists.freedesktop.org,
 AJvYcCVFrVvqn2Mii6Fr51NJjS9XphqX81JssyXT9I4vPA2dvgkb6VAig0s83L69Fx7q/weGFZHKlzR2o4GAfVrn3Q==@lists.freedesktop.org,
 AJvYcCWXFySf/b5C+S8UC2VsOAQHztCuciEOcWDGudAv0KMpTBkwqL8JplY+luq73QtuEH4YY2yQJuXGiJGM@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyA13URduWr/AmwPActFkegrwhfSpkMGih6IVibG0FZZO9NzQMz
 K8Zb0MWpePCoHvpycuFM4H8/HDXYVl3hlavMeax342MU+LQh6kjN
X-Gm-Gg: ASbGnctuuxSwMCL7RhCs7Oi0xSKhPOBEfNJIwa4LUiEsHfmpRIhEEcNjHAB1bF6pp3h
 NXQYRBGKpd0mN22xDFOsdOTvfIAZCtHr6FaAxIHKxx2DGRBHFq6ACARY0uErd4q5BgYHSNV8jUa
 v/mdySKHhZPKyAhvlMjHEQxlPMKeMyFxZai7USAXMRv4ZQm2dyAigODqHb4oMSN4KJnBTlPUuZx
 CCz8iSbUgI65O2K7yfYtT0cdHjPRpb+tYmNTWBUV8AaCS/okDqaO8fHD8aFVkXqhh4Vy85VoGAh
 Lil+7Aewl2vdYnNWK3+7VSk2AzCnC/GLnQl9ppyFL0SyEjJYIKeLpjZegARIBhiq8cdp3bMYEav
 bVQ==
X-Google-Smtp-Source: AGHT+IFuJV2A3WyeGyRKkWOVHXtPxLV1+Mi2JNfQFD+IYZFzlTa+4ZUBb0ebsjuh3kRTyYLqlLO2Zw==
X-Received: by 2002:a05:6e02:180a:b0:3d0:4bce:cfa8 with SMTP id
 e9e14a558f8ab-3d6ca5b1d53mr103006025ab.3.1743615780941; 
 Wed, 02 Apr 2025 10:43:00 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:43:00 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 48/54] drm-dyndbg: add DRM_CLASSMAP_USE to udl driver
Date: Wed,  2 Apr 2025 11:41:50 -0600
Message-ID: <20250402174156.1246171-49-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
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

The udl driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/udl/udl_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 3ebe2ce55dfd..ba57c14454e5 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -19,6 +19,8 @@
 
 #define NR_USB_REQUEST_CHANNEL 0x12
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 #define MAX_TRANSFER (PAGE_SIZE*16 - BULK_SIZE)
 #define WRITES_IN_FLIGHT (20)
 #define MAX_VENDOR_DESCRIPTOR_SIZE 256
-- 
2.49.0

