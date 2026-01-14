Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 722D7D1C02A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 02:59:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08F310E596;
	Wed, 14 Jan 2026 01:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iYR+qHe8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f66.google.com (mail-oa1-f66.google.com
 [209.85.160.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8567010E59F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:59:12 +0000 (UTC)
Received: by mail-oa1-f66.google.com with SMTP id
 586e51a60fabf-3f9ebb269c3so3790356fac.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 17:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768355952; x=1768960752; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pKljsU8Xmw+/foisR3SYsx7mqK9N8s1wNDUiE0Eb/VY=;
 b=iYR+qHe8N5qSqJ/MzEQa8M0HDsM4KbAsKo5HTqOvwBPDcsmghqsxoQiqycBRRhdO8q
 kR9qXOshJZFC9Afnbo05qR/bI5nSiLqd30TR3lIcpxsStc4i8/hvrBR9PvNbaOX08/2i
 9mp0UVvFT2NDcRkasVtLLxaaEz1fiuq4xNxQ4RDcZsegxNdXhmOjSunODeGkv5BTLZ0W
 to6d9HX9Q8biya7Cbz61jZ7Db5+eRHTKpAWKSWrPCoExTp/+KlZrCEoGzQrK5IlGF+Fg
 677nwrTqzk8pw60QMllMqGCZpTqgYiFRzSiSHr+IIBYNu0qsQg/E6SFN1g8GFuvjEf5q
 EVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768355952; x=1768960752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pKljsU8Xmw+/foisR3SYsx7mqK9N8s1wNDUiE0Eb/VY=;
 b=jjgrsw0qS1atd33CQyn0X037ZxMrxa/PI4dapMOZVdcOuDA7C8qHlTp0mS/IpcjCjH
 gz1cs/KP55p8YqBNZGwyEsOJIS2jK1iP0/E16bYaUF0Os246gHxKjdCg3ZoywnaD1QlZ
 yjwtB5TGBqzRvTDP1QGfkKlEtOj/Lt/znqnYW+QUBfrHLjOv5yzkVC8L8pOeC5EySePM
 JTs9R7phIOl7iVHcn2XuAddczCgyLWgY/JvC+aYQ2p5ua2zlEEthY0+IoahnKIBffN/U
 kiy69wMo2EnR35JxSV059NIXZe3Et/Q2jRT51TbXiyX38mz4gYmvceoxgugI/mvMlwiD
 B/CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5cQ4vzsY10Tdgz94pYOG6LhEVD9U7gfOE+AIuCO4HW98jalJEGNGhgiGqQ1aS5QhLcNlTITWq/8I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHiW7rA3paYVwsbju6Nv/QlbzTPaiYB0jhKgL3yU/FNeI3Jwmz
 3ad0SUG3mKBGHz0y+Ytbn/i5HCDUK686EoZG6LIuhX+zD7GrXBTVutze
X-Gm-Gg: AY/fxX68OVchNcAFVI4t4FCCrYLOVQz7LjJKL/vsUlx6fXIvFWC5A2S5pO5sCUhfR1h
 i5rDpLqa6JuQGoV3tJsZYpR2zLRjJFnaq0kstuytHHGYBClu1sFQhcS7fQ4yWmTuf7r3r+NBl4+
 TltgHhFmTTo9msfRbTKjJnMKU1GsDrgxkdvEUQMIcIbagJ7OwNEzEnXRqkmxxSqF6bz+hMeG18d
 Sx8mM+k+Mv4JOYJBHTWOvOSIrzOQhZiu9dDyJLz3CJZV77Du+q2UWMVTFbJ7E9Vz2CnmoVsqNIS
 9I54/t8W/3DdeT0AAfD9zZv7oL+vcIFizhC80kUy6asHPssg45mu00uhkJymwsZdyvtJvG4Rsbw
 +6t8ivKg8DDGT+CdY1vUWgKdqjHtfEKf4aDoySVAu8gHNjsAZu6sLJEtHwXgyK7g1yiGgvJT8ty
 dv+mJPb8F4A0gek4K47N+5U8+E7L3YXSQ7bodm
X-Received: by 2002:a05:6820:168e:b0:65b:3c3b:699d with SMTP id
 006d021491bc7-66102df2cb6mr449232eaf.64.1768355951696; 
 Tue, 13 Jan 2026 17:59:11 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 006d021491bc7-65f48bbb3f1sm9740809eaf.4.2026.01.13.17.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 17:59:11 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>,
 =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Petr Mladek <pmladek@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH v8 07/31] dyndbg: make ddebug_class_param union members same
 size
Date: Tue, 13 Jan 2026 18:57:23 -0700
Message-ID: <20260114015815.1565725-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114015815.1565725-1-jim.cromie@gmail.com>
References: <20260114015815.1565725-1-jim.cromie@gmail.com>
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 2 +-
 lib/dynamic_debug.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 98a36e2f94b6..4b7c3b997657 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -103,7 +103,7 @@ struct _ddebug_info {
 struct ddebug_class_param {
 	union {
 		unsigned long *bits;
-		unsigned int *lvl;
+		unsigned long *lvl;
 	};
 	char flags[8];
 	const struct ddebug_class_map *map;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index cb171088850c..d2ff203d0873 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -810,7 +810,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
+		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
 	default:
 		return -1;
 	}
-- 
2.52.0

