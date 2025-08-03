Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 255D4B191C1
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4169710E4A6;
	Sun,  3 Aug 2025 03:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e05QlMUM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D72810E3E5;
 Sun,  3 Aug 2025 03:58:41 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-3e3ea9e8154so15985435ab.2; 
 Sat, 02 Aug 2025 20:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193520; x=1754798320; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kfqa6P75QZanGMFi9p8HAZ4Dyz8oIWbnQ0m74z0/sC8=;
 b=e05QlMUMv7ZT4iQwciEQyd3i6fgeYcEQHacep5/7b9SCeIW/WP/v9BARvAOgz4epNv
 WMZR5jtM5OSNu9dtwKxah6Wkon5J3pxzPqej+0SfyuqLx0ugy/ut1JXuzVFA2UoBnbdZ
 BYatHvWFNGccnXxNs9vNUIMX8i3NHoFjdTl0eYnW9z95mhRq7LM3fsEYcxHZGU3CzHzK
 BuU/bwSPpyV+kQW+w79neilQRjbYcVXJVDMGzHrYKt7vxGNjhlF9FWtptekj9kQAJp4Y
 MqvzYRYWaAf6hrlEzBF8sKayjpJH2yKoJPUyfNB8+5e2bzZna2PZ8Y6xjb/91ICRRQo7
 u5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193520; x=1754798320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kfqa6P75QZanGMFi9p8HAZ4Dyz8oIWbnQ0m74z0/sC8=;
 b=ckHOC+y4iuOCyb6IPpVsOexvozhdH+DuRrZ/0vXp3hpsHhsWJ5TWzXexYJAGEWRCZB
 mumhCmCTlQTA+P3I7+Kzs+JmWsfpIhIT12PXCq79ma3FFQwjgl7S83aeAKCA1Jmvso1b
 Sc9349WokiHfLFoqssnCLJV0ul7/49BN9nmKstNL7hr0s04NvRoNSXA31h8WusWm42up
 swRh+c6+cOZNmvEO2txf+zULWREwwTSCLTFo//SANmI4qX/4GL+TEiY3aP0R83Anviyt
 l23Or00ovJHg/XjiZ20bgYmWtRQKkO/ad9dJ/xqxFOY33kWOXXY8lOiShrowTaUXS+mu
 2Pow==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6V6IZSdXIPVqNdZD5QduVk2cck/xdzBtLEwIIMH7AC0064nC1fGW18BsXaNlcizjynB60zR1gTe4X@lists.freedesktop.org,
 AJvYcCUeduMK3jgIHJAf8omb/EY4paBNUK36C5MVAILZd2OoB3u8J1FZMoM/ViJcjge9pTrAFJAOk8+c@lists.freedesktop.org,
 AJvYcCV0zW62AdV4BAJe7ZwkkeCHMFYuRHRoz83NnhVfvRAmdPp7sJ2kGkwte8zPab7b3LebTQfBs2K8RD5w7233AA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9gwBBljpHSxe21GUPfT2za6hsNrI7nN2oBhj2Rt0/OMD760yP
 R2fZ5wM/9ozgUj7zyr9sWgMDxB3ZFv7nA2MlEDVayxXUFEx7TL0mBoer
X-Gm-Gg: ASbGncshtgYsMfyMGp6wpoP7tkCPvil46VgWOE9qnjfnGq3wMVCGOWonlDAXeBK3Q/m
 EQDldkb3cV2P4ffSObVI3AOkf8G9sPcQUEGkD6bLxQ4TbpALttausUvVC/uBD9cAvuAQsM0GcC0
 woya8XEL6Kmvg4LreUhfUJbo26IF0m2+ChXlgB8nMC2wKNytYUrQUtOUP6BkuBc0jqWTx4EZ++x
 654QbhGHQlzyDFTaghgcyBS8clVUpzVeg/pfbzk+6HYHMenjJJHbKqdaVGo7OeZer9ePS0lsrpQ
 iQY/mbi9lsSRE6tGydt1Hr5JrVkawxaLpFlL8EeG4qRJkjGp196uoikb5lhyBDMM2vT/yCApcWz
 7qpwu8BFVGCi8J5YqGkOi73bP5H/5nAQ+Pptb/XlP8GO1AUmrtytPk7xn9vJf+kYsjJQHKLKw/o
 OgMQ==
X-Google-Smtp-Source: AGHT+IHF9fqXIQ9Dy28IS+EYItwaYkEB1EPsxWBXZaRJEXylDi+/C1dLpmjsAMSA//MVYJtcdRokew==
X-Received: by 2002:a05:6e02:360b:b0:3e2:c62c:5531 with SMTP id
 e9e14a558f8ab-3e41618bf16mr95994745ab.20.1754193520351; 
 Sat, 02 Aug 2025 20:58:40 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:58:40 -0700 (PDT)
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
Subject: [PATCH v4 05/58] dyndbg: make ddebug_class_param union members same
 size
Date: Sat,  2 Aug 2025 21:57:23 -0600
Message-ID: <20250803035816.603405-6-jim.cromie@gmail.com>
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

struct ddebug_class_param keeps a ref to the state-storage of the
param; make both class-types use the same unsigned long storage type.

ISTM this is simpler and safer; it avoids an irrelevant difference,
and if 2 users somehow get class-type mixed up (or refer to the wrong
union member), at least they will both see the same value.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 include/linux/dynamic_debug.h | 2 +-
 lib/dynamic_debug.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index ff44ec346162a..b9afc7731b7ca 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -124,7 +124,7 @@ struct _ddebug_info {
 struct ddebug_class_param {
 	union {
 		unsigned long *bits;
-		unsigned int *lvl;
+		unsigned long *lvl;
 	};
 	char flags[8];
 	const struct ddebug_class_map *map;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 147540c57154b..55df35df093b0 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -799,7 +799,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
+		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
 	default:
 		return -1;
 	}
-- 
2.50.1

