Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FCF8CF743
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 03:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC01510F75A;
	Mon, 27 May 2024 01:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jTp/rEP6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7796510F75A;
 Mon, 27 May 2024 01:20:39 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1f4a52b9589so1875145ad.3; 
 Sun, 26 May 2024 18:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716772839; x=1717377639; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zhri0/vJdPUtS20mPiUHFEviHxNxww/w5KVtbT8fjLg=;
 b=jTp/rEP6vId+0vBWZR+MyEKoBVD1CPvKRHJASfwIfU2x4QAHduHR5JB9xfaLrahL4c
 ijL1lduG92OkKo0dM9eFghU+KUQWJ8OzeMjnSATHBPmml/MyhSSdwR0RyUrJ9IHhEiXd
 RB1dVqgbxKAnxbOxMMGr+l7mRGtki6id/aqPDu7zHrPnbSrXtY5Du5EiVgQWR86r5e9I
 EWsm2J1iIJgAwPkRQIiyQQa8MwJ6HbXUPS//GeYrUTgboq6e5Uel4dvAYjMerjUFp4XL
 0ZLx+PluPVa0GO+op07oX98kkG0Ng+s2g3vFYQCazIUhz0V6AiJnFOJ3AhMio8sDfPOi
 nemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716772839; x=1717377639;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zhri0/vJdPUtS20mPiUHFEviHxNxww/w5KVtbT8fjLg=;
 b=bIJ9aamKRsGaMYWrq7CUxMi5cbahh4T6OoALIbhW9Jqg3lRWSfzo5DmA9/8qkoKAyk
 dJ26dwW+1dFYbqc5osoFrvLAtbGCoHrz7SdZ/GmwkDn8pA6a/c+HXRVRxfGKvkm6tAsw
 WYqTtf6rtulcIuWKC8okpDP3/at+pZo73E0rCr7UQtN0xUIgnBrmcdkjEbeanJDUtifN
 XioWroAzVUm/q3PIzMj85y0zguSwMR5g7OIE1TOfFoIme0Ztxp2SH99hpBBtmWzzL9Ko
 529AJDKCl+JlUAoK2p5x7iU8bBGOe9yzP6sM40WOj6lx2GEa/JTJ9ANUu7MPfG8MYnV5
 rJ5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKOk4mmtOSH4WroTzxzu9rBB7aY51E2HSuxxt86LAi38kRhSDO+A9CuxOSeTgFW8Av76Y6tX58JsY8dOBSTgpQmObjfRHL74itOHsLfJWQxRzOBW0/gtGkrIbsBzGBHpi9smLfJfJ2W3a8abxi7A==
X-Gm-Message-State: AOJu0YwwCcLtCns6k/9pm+wQ3KuXLKJpZIfqmCBrurh8p+8RitUiohIl
 aDm+pyCDuH4+7lr9xVZIgVd5aMHfBoZleeaS6Ndz4JW3kOJP/42v
X-Google-Smtp-Source: AGHT+IHs+AGu3AGCAaE5Icw6Mlc/9MAd2UZwxY4NIOH0MIQi/OpFV4Y12FGLctWzh8VZElCVzpEiVw==
X-Received: by 2002:a17:902:e810:b0:1f2:fab6:294 with SMTP id
 d9443c01a7336-1f4498e18f5mr89572135ad.56.1716772838461; 
 Sun, 26 May 2024 18:20:38 -0700 (PDT)
Received: from localhost.localdomain (140-211-169-189-openstack.osuosl.org.
 [140.211.169.189]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c9a8464sm50370265ad.230.2024.05.26.18.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 May 2024 18:20:38 -0700 (PDT)
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, chris@chrisdown.name,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rcu@vger.kernel.org, lance@osuosl.org
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH] drm/radeon/r100: enhance error handling in
 r100_cp_init_microcode
Date: Mon, 27 May 2024 01:20:18 +0000
Message-Id: <20240527012018.351223-1-zhouzhouyi@gmail.com>
X-Mailer: git-send-email 2.34.1
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

In r100_cp_init_microcode, if rdev->family don't match any of
if statement,  fw_name will be NULL, which will cause
gcc (11.4.0 powerpc64le-linux-gnu) complain:

In function ‘r100_cp_init_microcode’,
    inlined from ‘r100_cp_init’ at drivers/gpu/drm/radeon/r100.c:1136:7:
./include/linux/printk.h:457:44: warning: ‘%s’ directive argument is null [-Wformat-overflow=]
  457 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)

Above warning is emitted during the rcutorture test in
in PPC VM of Opensource Lab of Oregon State Univerisity.

Enhance error handling in r100_cp_init_microcode, let r100_cp_init_microcode
return with -EINVAL when none of chip families is matched.

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
 drivers/gpu/drm/radeon/r100.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
index 0b1e19345f43..4f8a1bdd9365 100644
--- a/drivers/gpu/drm/radeon/r100.c
+++ b/drivers/gpu/drm/radeon/r100.c
@@ -1055,6 +1055,11 @@ static int r100_cp_init_microcode(struct radeon_device *rdev)
 		   (rdev->family == CHIP_RV570)) {
 		DRM_INFO("Loading R500 Microcode\n");
 		fw_name = FIRMWARE_R520;
+	} else {
+		pr_err("radeon_cp: Failed to load firmware \"%d\"\n",
+			rdev->family);
+		err = -EINVAL;
+		goto out;
 	}
 
 	err = request_firmware(&rdev->me_fw, fw_name, rdev->dev);
@@ -1067,6 +1072,8 @@ static int r100_cp_init_microcode(struct radeon_device *rdev)
 		release_firmware(rdev->me_fw);
 		rdev->me_fw = NULL;
 	}
+
+out:
 	return err;
 }
 
-- 
2.34.1

