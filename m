Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F01A7945D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8706110E8AA;
	Wed,  2 Apr 2025 17:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bqvF0wmi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FAC10E899;
 Wed,  2 Apr 2025 17:43:02 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-3d4436ba324so1030995ab.2; 
 Wed, 02 Apr 2025 10:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615781; x=1744220581; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=av5O5WnsuBn1uC/IGfMHk77btJQzrlTi1UNrBIeIfGA=;
 b=bqvF0wmiVhtvVNd71rzvV3Jr1OUIZ4/cx7sBBKYEwgsvdjD3Fu7Z9L7erbO3EBPcCR
 gLklbQXQAqFqxT4qLWSHGrTxYajA0g0dukGO40k2T9ij5jIkXEjr4Ooe3RiivO1Hjil1
 hs9NZtlOGEgBBkIinrdETbEcBrY3h/0DT719Vc7gICYTAFpRTuIWMyAQmnGAYrtTe0B7
 HVg2chhiZtL/cRtXd51e8XPCk3rhQznnkYiw8x+UQovKq8uqS+oCek2GMmVsm7tdzykR
 kJA1heKULF+DGXs4L0fWGZ8ePDMPolBWYFLLecdyiXV4XfzE2sAZyqXBk0nqTOtbLmox
 pADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615781; x=1744220581;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=av5O5WnsuBn1uC/IGfMHk77btJQzrlTi1UNrBIeIfGA=;
 b=HSW7Ui/rDphvcJHFuUjL5bxvQsDS4CcleY0/9ohuUeQ4L3UMPbUM8jPam/gqnkhims
 jFuCBfHMXH64N83MWVBN3jAvwNYcVNiEEld8cshlI5uB8cIy/SwEoYjuJToKpeldiVnx
 UiK72DmQ8zNkpfqfBLI1PhlD0ik8+vKxgWEHlPf7KEUWG+cGg20GnjGIuDxd6bPEh93r
 /i01m8rQm/ecQ2toej83jKTKInDkcmbfE/JBQGx5CEr1AT10Ri947vMeP6iaTBfJcRDs
 oOSTuBJYJ+GNNjFj4oPhKNrwxgTaSmUiykRwtgxsywuXMSbfMFyM5vtgQqKDQlpKBqp+
 a5og==
X-Forwarded-Encrypted: i=1;
 AJvYcCVanmket21df7tBaK9ihsO2eupiYpRqdaxbLyUSvYdaA2h4Pn5XGPEjNNn7qQHbWL+MA5sCvZCM@lists.freedesktop.org,
 AJvYcCVzlMnpK3iv99KUDCmdCqaMcuMhOa2ixB3jPc8XeRmztwQWmbAWAfOVrTA6vDb0RMpLFdYwVXRLvEVg@lists.freedesktop.org,
 AJvYcCWYQ5KfXvv456+1YGmcvRMm3lEopTos0uW9ScSV7PoSU5gbzaO1KkLa2JQWLOU182Pl4Hj+cit5idaj7TfW0g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+uOFqvTMMKmBF8r9YpZnSXxdkg8XsALpZGkqZz3cIhsRfQpxR
 iE1bhajJhsFxJZ4ZhEoxStsBWINI2xnFGO8GU66BosM81YQXW3uD
X-Gm-Gg: ASbGncurjirRnbEisXU4FSwYMeMlzfOMgNxSbYYOdM4rxdUReSRpOHAB3TJSPvc4lzy
 qemLPgL0kpHaZhFqoOMEGcKo1Gu/hDQjNhqaSBQuLFtcAjGj0LWkbVksSPKcpVmVfbC0HTLqE/S
 lcimb7gYBcmGTobycmRUQQc0qenI4eButUJUlu+jcXndGGW+qLWHr/oM1g11POaQoze+3P1u3ka
 dvQeDwed13gVOaRekrjesebZCUwZ1f465OidPXcSySB38Yn11X7555EsbtV5oP0yvPbXBDXgIwF
 02b1CD81a7aKrtLbvbtYLxNEseUW26qyWcczld/G/1ECOTUSXga9tBw8wuNvhJJWpcGisJMEDW5
 d6w==
X-Google-Smtp-Source: AGHT+IG8XSmNVp+q/PMUM7nI1VXleBCEFjeSE8gGJHee5Xa3olHDY+LWA8eCwUT1fL6HdiRQkmnU2w==
X-Received: by 2002:a05:6e02:12cd:b0:3d5:deaf:b443 with SMTP id
 e9e14a558f8ab-3d5e08e251emr222409015ab.3.1743615781696; 
 Wed, 02 Apr 2025 10:43:01 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:43:01 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 49/54] drm-dyndbg: add DRM_CLASSMAP_USE to mgag200 driver
Date: Wed,  2 Apr 2025 11:41:51 -0600
Message-ID: <20250402174156.1246171-50-jim.cromie@gmail.com>
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

The mgag200 driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 069fdd2dc8f6..5b6ec1550da3 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -27,6 +27,8 @@ static int mgag200_modeset = -1;
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, mgag200_modeset, int, 0400);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 int mgag200_init_pci_options(struct pci_dev *pdev, u32 option, u32 option2)
 {
 	struct device *dev = &pdev->dev;
-- 
2.49.0

