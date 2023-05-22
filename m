Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9F170D6EA
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 10:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B4510E3E8;
	Tue, 23 May 2023 08:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4906310E35F;
 Mon, 22 May 2023 15:50:37 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-76efc56e1cfso248911839f.1; 
 Mon, 22 May 2023 08:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684770636; x=1687362636;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G5EoxSWTbZ7f4uUwHdfO8oRaR8Zf3HbYw6LZWLrtj7o=;
 b=aYjyZeDKbWw1WoAP+tDEvTQT1TD+BXo/51E9aS5/pArAaKrVLxr48PvyaP7jTiJJaz
 TAf5CKdO7dGCBePScjP2d0Kg0STVGh5vWX48aPZypMqefD7HAC8LDMTIilIUm2ICWmG+
 rRueQ3vvpi8+69m39hTKR6yoTA2d+fJfGqkE3Qy+XeSP6I3zXXhFNkg5CkF/VlDCjsfa
 fHPDeO/GxOtlZz0eVqg0AuKqHkOBefRH3qtfDK6yFEG0RCcFNH7JkrFSO9rCoE+JZvq8
 jXtLfthtCJUhvje5mHJcckh+PB9bKXqrrMLg1VAPNvnZa6C/pIsyo+LllUYZBFMk4QAL
 T8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684770636; x=1687362636;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G5EoxSWTbZ7f4uUwHdfO8oRaR8Zf3HbYw6LZWLrtj7o=;
 b=A7kVL53j6/wWtXgsoDrHePzXBnxwHSwg4CMNivHHfyqrhPdnJTymdqrVPvFyHzImNo
 r3za44SArlMj9dD18gGPv0WcN/3ZdgkTVxNLgcetD/Nvrdo0dk8cINsFdDimIRGKFn5X
 g4daOKqbumRurafLgJD+16RhNS+Y9Fpk+22KTcanw2AnAklXmLPPe13A0ple71lr9yri
 oxtt80wssKHdKemBxQb6/F6UxXJbe6tPfpkgKFWZRQrztiO0M0HqNzr66WtA8vApkUl6
 vWb8v3S0x1a5mf2A0ajFcpQbjIwr7OeVlBu8dsfeGRZ6wrZbTfMs4Slc3KVT7woGWHun
 icFA==
X-Gm-Message-State: AC+VfDxRpcj011PfhwV5Xas9gsdGAR+Cy1efrhus8qqekpJM5Do0J317
 JLhKQX0k246o9q+dio6NxOU=
X-Google-Smtp-Source: ACHHUZ5bmd8UsBXwNVhG+/oYOyAjgR2LVwt3rBvruoZvMBljZmso4tozgBnOlHjQpZH9bjPF/mWoig==
X-Received: by 2002:a92:d8cb:0:b0:332:f72b:3b30 with SMTP id
 l11-20020a92d8cb000000b00332f72b3b30mr7240899ilo.10.1684770635830; 
 Mon, 22 May 2023 08:50:35 -0700 (PDT)
Received: from azeems-kspp.c.googlers.com.com
 (54.70.188.35.bc.googleusercontent.com. [35.188.70.54])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a056638020200b00418b8f08187sm1854683jaq.126.2023.05.22.08.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 08:50:35 -0700 (PDT)
From: Azeem Shaikh <azeemshaikh38@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>
Subject: [PATCH] drm/radeon: Replace all non-returning strlcpy with strscpy
Date: Mon, 22 May 2023 15:50:32 +0000
Message-ID: <20230522155032.2336283-1-azeemshaikh38@gmail.com>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 23 May 2023 08:13:57 +0000
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

strlcpy() reads the entire source buffer first.
This read may exceed the destination size limit.
This is both inefficient and can lead to linear read
overflows if a source string is not NUL-terminated [1].
In an effort to remove strlcpy() completely [2], replace
strlcpy() here with strscpy().
No return values were used, so direct replacement is safe.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy
[2] https://github.com/KSPP/linux/issues/89

Signed-off-by: Azeem Shaikh <azeemshaikh38@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/atom.c        |    2 +-
 drivers/gpu/drm/radeon/radeon_atombios.c |    4 ++--
 drivers/gpu/drm/radeon/radeon_combios.c  |    4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
index 1c5d9388ad0b..5f610e9a5f0f 100644
--- a/drivers/gpu/drm/amd/amdgpu/atom.c
+++ b/drivers/gpu/drm/amd/amdgpu/atom.c
@@ -1509,7 +1509,7 @@ struct atom_context *amdgpu_atom_parse(struct card_info *card, void *bios)
 	str = CSTR(idx);
 	if (*str != '\0') {
 		pr_info("ATOM BIOS: %s\n", str);
-		strlcpy(ctx->vbios_version, str, sizeof(ctx->vbios_version));
+		strscpy(ctx->vbios_version, str, sizeof(ctx->vbios_version));
 	}
 
 	atom_rom_header = (struct _ATOM_ROM_HEADER *)CSTR(base);
diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/radeon/radeon_atombios.c
index 4ad5a328d920..bf3c411a55c5 100644
--- a/drivers/gpu/drm/radeon/radeon_atombios.c
+++ b/drivers/gpu/drm/radeon/radeon_atombios.c
@@ -2105,7 +2105,7 @@ static int radeon_atombios_parse_power_table_1_3(struct radeon_device *rdev)
 			const char *name = thermal_controller_names[power_info->info.
 								    ucOverdriveThermalController];
 			info.addr = power_info->info.ucOverdriveControllerAddress >> 1;
-			strlcpy(info.type, name, sizeof(info.type));
+			strscpy(info.type, name, sizeof(info.type));
 			i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
 		}
 	}
@@ -2355,7 +2355,7 @@ static void radeon_atombios_add_pplib_thermal_controller(struct radeon_device *r
 				struct i2c_board_info info = { };
 				const char *name = pp_lib_thermal_controller_names[controller->ucType];
 				info.addr = controller->ucI2cAddress >> 1;
-				strlcpy(info.type, name, sizeof(info.type));
+				strscpy(info.type, name, sizeof(info.type));
 				i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
 			}
 		} else {
diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
index 783a6b8802d5..795c3667f6d6 100644
--- a/drivers/gpu/drm/radeon/radeon_combios.c
+++ b/drivers/gpu/drm/radeon/radeon_combios.c
@@ -2702,7 +2702,7 @@ void radeon_combios_get_power_modes(struct radeon_device *rdev)
 				struct i2c_board_info info = { };
 				const char *name = thermal_controller_names[thermal_controller];
 				info.addr = i2c_addr >> 1;
-				strlcpy(info.type, name, sizeof(info.type));
+				strscpy(info.type, name, sizeof(info.type));
 				i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
 			}
 		}
@@ -2719,7 +2719,7 @@ void radeon_combios_get_power_modes(struct radeon_device *rdev)
 				struct i2c_board_info info = { };
 				const char *name = "f75375";
 				info.addr = 0x28;
-				strlcpy(info.type, name, sizeof(info.type));
+				strscpy(info.type, name, sizeof(info.type));
 				i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
 				DRM_INFO("Possible %s thermal controller at 0x%02x\n",
 					 name, info.addr);

