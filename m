Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2482A1C1B8
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:48:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C0E10EAA4;
	Sat, 25 Jan 2025 06:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mqYXlZDN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17BD10EA91;
 Sat, 25 Jan 2025 06:47:41 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-844e7bc6d84so90840639f.0; 
 Fri, 24 Jan 2025 22:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787661; x=1738392461; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+bbcbstf8Ee+MxLJpu3h+uVTQLGeXiuyn2e5gcDq12M=;
 b=mqYXlZDNkxZkbFrliGYdz8huc7eGiwedEee7Ldsl+NHrkzEYJ2lQLluPE1C99pN6NS
 Jsqnfu5xasBrsduCUwawr/BYmaOssCuSfgRfxbxeB/vPMvCvFI6RtfwjxYUCPxMr/b+9
 7Y6tzE/qf0ge58ExqyhhChjuywOELMHcewmS74+KPncDJ0HABeXRMwgY2x8MLaOeeey1
 p8G5dEGrkkbh3dw0PBw/uxddhp4g62sy1/DbsIL67JdHAOjfTrKYoJ1sq3toMZeL7qoa
 Gp+N5SOqWDDDv5K2ngOjctMWKbn260pVidCEX+rKjSfS5abCU/7aLQj87c4eyDWERqsD
 C0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787661; x=1738392461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+bbcbstf8Ee+MxLJpu3h+uVTQLGeXiuyn2e5gcDq12M=;
 b=ScftDLik+mvZhty044UJpawDYcd5JEAg3m+hTVUPjIGn4rlG0hSdD7l78YI1C8ce3Y
 zAYd3mZf/jtp+RSFxKq7ZsY/T/YnisAe5U8VQSoFE6LdKBGlk/dLYRpZC38TX0KGFa9z
 7XFAPzx7G367Lhh0VnMtLvFgLQZkHQTzyF5N361a2HB/A5BuRWwQ1H57GwSF2u63EXaA
 /jiurvHnsJxGM91eQFwfMmBxOKQO8NEHt3FLKQRnUFZ8cL4JSOef49/fusEobajd2gJk
 uV3AzOMDw6be3VHStHD1SMMGzP4HE5pL1HyX5ev+2f9cFkrP/7lQ4mhzrSuS3um1W9Ru
 6Ppg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVISG5baV9Ze+u29rc1pNvGmlK6x5eUW6uOOTFsq16F2lUzb/leXXYm9sZk4FTIifrjMdIPGnz4ivY0Eovxzw==@lists.freedesktop.org,
 AJvYcCVXZruiyMQL7tzDfMaI5dgsozHLAk0rFF1/Otxq4aHZDk/eR5H08kHFR9bkAbluQV2XelY6BKFR@lists.freedesktop.org,
 AJvYcCW20k+gkD7TuaeuCGVrnkujnqd0OESYMMoYHyC/d78+j963zpI0v4eccyXj58NuPX+i5TKlq8yqDVAc@lists.freedesktop.org,
 AJvYcCXX14DJokAkrL9cT0g8WAYkxsNynoSwjvytwazDNHuIFwOewDjTSxQojtJcHchZku0qPREqv5P5pWNL@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRuTubFRgFtK1d+PW5FFFq8oW1EyIYCHuaGxs+5z+A0rdV4IuM
 p3d69uVdowTYwxR+mdU8nj7ltVvV/WbOHZCpXgfZ9mpgRqQRGaqi
X-Gm-Gg: ASbGnctKX8oh6lKafeGpiMqQoLAykj5n7ADG9HXSCDoUqYd3CuLUthF1lAJOX/1MBAh
 CjvLOSe8UwfoaElBoIxZxEv9OzSQZCLY8mDy56jMC9VxSrq/tonpnE1Pf6gjmobZXx/SE8MK9NM
 +skju9U+MuTfwio73Jj+UTPo6jFYjKH/G8IrkVPYjgJ78+avpG8NpoWRSZTc1JAL13yHmnu3Fry
 TypIp++lUA4TARQtfuryaMDEXoDVdpR6G4j1f+kUxkOjCph52APP9GtFxOWVqpQBglgd3nQ2aty
 LKNmXBGd55vi1gNkZ12nla6eUIDCZU6ZwOrGfg==
X-Google-Smtp-Source: AGHT+IEYJEfd8pDXzuBkvGlPdRY1WjVugZUcIO5koXeqdz2TVEIoZMex7iC8QoXTB4/lAL5ptLR8YA==
X-Received: by 2002:a5d:9649:0:b0:841:9225:1f56 with SMTP id
 ca18e2360f4ac-8521e32b3camr488498839f.3.1737787661025; 
 Fri, 24 Jan 2025 22:47:41 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:40 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 60/63] drm-dyndbg: add DRM_CLASSMAP_USE to the gud driver
Date: Fri, 24 Jan 2025 23:46:14 -0700
Message-ID: <20250125064619.8305-61-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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

The gud driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/gud/gud_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 09ccdc1dc1a2..20b526c39392 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -32,6 +32,8 @@
 
 #include "gud_internal.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /* Only used internally */
 static const struct drm_format_info gud_drm_format_r1 = {
 	.format = GUD_DRM_FORMAT_R1,
-- 
2.48.1

