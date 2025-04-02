Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D84A7945E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6EA510E8AE;
	Wed,  2 Apr 2025 17:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j5yP6fhX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B3010E8A2;
 Wed,  2 Apr 2025 17:43:00 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-3d5ebc2b725so325615ab.3; 
 Wed, 02 Apr 2025 10:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615780; x=1744220580; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JhoA9XaTmEGFO/43twqabJw5GWuyyTcgJpDDhp+La9k=;
 b=j5yP6fhXbIBHJz4bWrScnle5KeETvQzO8F5YBknZbJ/4QG2ieEWYz16e96ayLa6XQF
 vxD+OIqNdRPJ7KUTVnwCq53v4tZ9X13mpxRN39RgNOmtAFM9xodjOpuQhIpUf3cW7NwT
 FU///2cHPxsxpwqblOItIV5C7wWoikVHTreJSn2eqa/KW+iXgSlRuNB+WAjPC0EGZdHB
 Wzl3saWZ8TzvZJcWn/ZJThgiQkexTfwc1eAa2+Rd6F0RVs8xF1rzsrxri0mh2AIEeZIM
 WcdTrEkMHd38iaf7f5IomfoqflF9i6Pehe1bDjVCQ4H1oKOQZ7a3pBkONrpyzcXoQ+/M
 AFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615780; x=1744220580;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JhoA9XaTmEGFO/43twqabJw5GWuyyTcgJpDDhp+La9k=;
 b=ftHPAjW0TGpAXAiOBFkuljJBIMD5sdu+C8z89reTNY6gLeVZM13/zhfsaAIDoyf3/H
 BoV5RaWf9NUZA2Yp4PykBI9AII/7yS6taJkhQmwsSMO+dzhzERURl55d6yMDIJ354QHj
 GHJ5dJFe5Gd2lpXFUUkJk6wRyl299dQq8OqmvA876FrOzvOyOJTRQvI/ZqrwYySzt97W
 9R6QbpdX3AdmolkRYtdTOmTTN7uGHulHHiALFtEKsJ3FpjabtAklUh3y23AYobxiuo1s
 Yp1RL6kf5pYL/1lwbrvdezFWil7jq775vhBpErGb950H0zcYomnU9WPWTFu/hZgF3Cp1
 +lBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM/MrpNDzFsyvIt+wlvDjCkFzcdmxV5wKzvnKX0bqGFc6hHFJw8sJUzpum7YNueJHrvZiL/iiNu7eX@lists.freedesktop.org,
 AJvYcCUSbquapJZWl1QutJa5EkYxrTWDKYpGO2BEW7i/VwZnpm/WwQdikpi+Bg4taXCTPluUYjnEQhjVDf7OtzFJ7g==@lists.freedesktop.org,
 AJvYcCWo3B5Od5ufNLNrM5n00cdmgHDPTFMiun+AYg5vWgYX02w5wFS2YF7x6Ad0ryW+WeXqBDE9EGzf@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbLVifhnt8V4s30n04Sr2/1lZw+srrKK4YUb1aUg4GJSxOtzVw
 Zne61PPjZTJgroXftHhkrkixA7suqIPnXCQeaGt6sAO6aviZ1NPo
X-Gm-Gg: ASbGncu90pMzBkHLd7rt0XO8hieBXSvpoucAGinaP3h3ysrBbYSyAW4HOUDc37vkeF5
 sbFpk/jL0ERcaFYJMBiYzE2YTuFktUTsF0LE0xTk91PKz3+8gqtcqRcmt32ZJQCfLqH1aoXA824
 EqBGAf1X+yELXoCdL0on/al5UiytVXQI3MStMvPWz1mctbjNhMSU84NMi1i+xwBkHtOx6nudb4p
 SFcTYltPjpQsYdvdl+O03mDQD8zWGDmvT4obmhwEc35Z/FgRFdftjRJ8WNpdJAMfGAfj+1zKDzI
 IYl2JY8eSQygvhc6JZRRh63bn7s3xzvCakEQYnXLfue60hK7asTJBH7wH74WVk/k+kokjQf8y79
 dLg==
X-Google-Smtp-Source: AGHT+IFlUifTRIdBdJrWmohJtGkz5j2ZAgmAXuJf+hqwzf5FhiZ9fS2SCZmP2KeBUmNu/DQKgqx/aQ==
X-Received: by 2002:a05:6e02:1787:b0:3d5:893a:93ea with SMTP id
 e9e14a558f8ab-3d5e0934a71mr183638485ab.13.1743615779885; 
 Wed, 02 Apr 2025 10:42:59 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:59 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 47/54] drm-dyndbg: add DRM_CLASSMAP_USE to vkms driver
Date: Wed,  2 Apr 2025 11:41:49 -0600
Message-ID: <20250402174156.1246171-48-jim.cromie@gmail.com>
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

The vkms driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index e0409aba9349..4b9da64661fb 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -39,6 +39,8 @@
 
 static struct vkms_config *default_config;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static bool enable_cursor = true;
 module_param_named(enable_cursor, enable_cursor, bool, 0444);
 MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
-- 
2.49.0

