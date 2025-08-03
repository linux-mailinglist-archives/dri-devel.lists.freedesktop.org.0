Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F99B1921E
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7064E10E4C9;
	Sun,  3 Aug 2025 03:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fKkaaWEN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6F810E4B0;
 Sun,  3 Aug 2025 03:59:40 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-3e3d0cba6a7so12047035ab.0; 
 Sat, 02 Aug 2025 20:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193580; x=1754798380; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YE/O3uk9iB25GeoIbDmsvAu+mgQCi7QyigFWvEFq3Wk=;
 b=fKkaaWENRQpEE4bP+au0dtK7h+Jh+kkap7lnDKO/+6UKd3koHxEh5429ysUh4zfQi5
 9wmwEG4WRoiYJObw0xZ4MeT+lpxIQ2/AFdVDWRUyFSCLJZMEYcH6eny5/3MDEgv5l1Lq
 yYvi//YaeUstj07lVj5zNY/jHIdWJOPyXiXY1+fHFXz5Z4wTGW3TDHUMcUK1e+1qTBTI
 6KoAAt1ldjvzY6s2/ng6EH5nqZzfbLqiBNNN4eKYnPyI8HAHs01DYPeIGzFSvkU0ua76
 IGE9Brlbt+LB2PNecJQZVWqRwoAP3iE+XSIHkSUHyI4XmAa5XUlw94IjveMst6z53nQ/
 /0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193580; x=1754798380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YE/O3uk9iB25GeoIbDmsvAu+mgQCi7QyigFWvEFq3Wk=;
 b=HmvjNiZ2ixqXntCxDmnvH2uK/mS9Orak4Oylbat27Oixt9DaehOMQev3MJhnPHPO5w
 HkZqkm75cRo8XaTcQPqbmc4soEfNCm7WNyHN0vHtWiWphsowEpEw9DMcTO5BCAy/6EC2
 BUdebSPnDvy/vguWVeejp4ACWAV4+X6CiqFbOJvhb9HYBoltS91I+hBaERzrT4m487eM
 OFkFL69qBkotVRwFkJ2fVp6kTpGa/QJi2oBrly2SC1d7O2sIuKrMBLeMUEWR9H52pgc+
 k+RYrGBUK22V+yuEJ/uRaUjsRKq6KulMATvcFQF1mlW0M6wvc+Yl3ZoU66sDMrndFxv0
 f88Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3NYO4ypZhHpZPw54brQkpWZyMjEVmS71VqG7dEKvcgza0YMcopXWpZjEHdAJkwzpUIes1WsDx@lists.freedesktop.org,
 AJvYcCUpFtNC2io8c68MILNlRzcBudAESwNxri/FNbBIAoct1n7XecqvMP+uh+eTKQpnHHG9lHlgnHSS4qCLUCvK2A==@lists.freedesktop.org,
 AJvYcCWYJQNOJeBEkdUDnkrA91R+VQIRm+Q6ce/AFd+bHPgr5Esx2AaWnb4PyRgFPzo83SwtuMn87+c+EptQ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeYQ0xAFXPK2sq6T6j0JeJs/U/gkNFrLLIgZ6VcJcx/aqfzImL
 Qto+x+mz7Z0Frdbv5/TD8O9qDrKFzpRmgC5sdMto74EJNaOD1lRzrQIv
X-Gm-Gg: ASbGncusbyYKe16a7ufoSIfUMYtOFYpTj5SH/MRrGTjJQ0yaSi+9WCFs1UMAvGOzU5h
 Cje4DSz+iUQEXYCuRbFtzdpnPYaQxoZIMuHiJuKrh2h+szDqdwdg48rAtCD1MHoXm5oQeVmtPgD
 POykhtG+qWlAvEZZfZfEfXw561r54BgtXYQdxX9BXFa6T8AsHxjzHMj4R/DRyhd9WAlzuAHThLN
 MBOREWz16hlg7bsrDCunLbBj6IO3Xzmmja36Il00VSQuYwF6g6JFPy8AFbBGkRhQyGXMft+eejN
 gxb8Mf8ZE6MZYDIHLhh7yvHijNk6yyliqn/s10vEEI3mEN9iEXrWaB/DzAD7vJHqdQJkHSHUAjz
 ZHoPJ37KEhy89kuAE2oEV4cOd6q7TrQkFkFpRWIogD70c5jeCGgbRv/qYXL2jx8FCi/MEg5vkp5
 N8CSFPsSma6/+o
X-Google-Smtp-Source: AGHT+IHMF0Stckwb4tgrilrVESFlmaGnVXMaPmoUxRg8HxQvWlfXjPvvkTeyvK1bWCUd/wSr8kLBNQ==
X-Received: by 2002:a05:6e02:2707:b0:3e3:f9fa:2c8b with SMTP id
 e9e14a558f8ab-3e41610837bmr85829345ab.8.1754193579730; 
 Sat, 02 Aug 2025 20:59:39 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:39 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v4 45/58] drm-dyndbg: add DRM_CLASSMAP_USE to bochs
Date: Sat,  2 Aug 2025 21:58:03 -0600
Message-ID: <20250803035816.603405-46-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
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

tiny/bochs has 5 DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/tiny/bochs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 8706763af8fba..dbcc8ba70dfa5 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -59,6 +59,8 @@ static int bochs_modeset = -1;
 static int defx = 1024;
 static int defy = 768;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 module_param_named(modeset, bochs_modeset, int, 0444);
 MODULE_PARM_DESC(modeset, "enable/disable kernel modesetting");
 
-- 
2.50.1

