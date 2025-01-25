Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BD0A1C134
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:46:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3618610E273;
	Sat, 25 Jan 2025 06:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z2O8vyM7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D1410E299;
 Sat, 25 Jan 2025 06:46:41 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-84a1ce51187so77809639f.1; 
 Fri, 24 Jan 2025 22:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787600; x=1738392400; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g9s7OD1sQ4+HufNRNHWDoATH13uKXMFeEAmrzFZExds=;
 b=Z2O8vyM70V/E+CNGvE2Z5t8pbaRy7dbMK42QbId9OQWSuI5PKwvWCPV+9MMWUu98qj
 IpAdfqGmXnbFyt2visvrb8+9smAW0rm/ML/zWLOXKVPWRTdcXJiil94Y1lq+KXAABilp
 rEnA+03HqRXYNoALw5+IBv7yrYkEDxgUTROO5V24cxgXKgkt12pfCGufP7Q0Bqt8wvXd
 h6YAc3n0wHZY9EAKQ+PeKYlKHOVXAP38WOlBap1Afr4ID0EO8f6OpZEO1U50IIg75iDL
 bYEHbsE3QkgQfCy3hFluuSozFyUJaaGaNjcU1rKB08WKKgz4/vVqphpry2ziut53EWyU
 V89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787600; x=1738392400;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g9s7OD1sQ4+HufNRNHWDoATH13uKXMFeEAmrzFZExds=;
 b=a4WkYGKwzWCBRJGJ7qK8w2pBBxxuZ/+ho7Ym/br9arEVDbabFMPOKs3iu1ltPLkhWK
 VwFBAeVl43RQATieJ+oMP0gx0VQKGCPezWOuxNrxXNgkqiTsbNxaxQ036gYJ0PFRkTt5
 ptw8nTwx1e1/gLKFLndboIfLIvltoNyHLb6rcmujAM0sz+FUIrgsnDwe/OBzwS0yF3nT
 8BDfBv6w6QVz7sw4KiZOQUd4JgHLlem6VEeb8h5EXE4Fat5yo4SLhqmhrs0dlDnn4/QZ
 u3X50sUsYFj82UXb3SfPuhr1TgSuDyr+AzwtZsHjP3ic8Qe5KjNwst0By9JDHT2KagR6
 DI9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ0zI+X4ItUBXs0yE1gAw4sBbXQiMAk4S6aSDbtPWgHt1w1thc5a8CRgKtUE/y92a49vBA9kDInjFibyg6iA==@lists.freedesktop.org,
 AJvYcCUcndZYbqc/VuF7dVCZSkjIFgRRmU/5G3Kxb7Ds4H/gwW458f4AWGD0KAPrEwnzclDlTK7oWeZ+/syp@lists.freedesktop.org,
 AJvYcCVLvGI7i3gwDIh1Mf9rkMreI21ySIZyj5NC9/41VUC7bbOXEm6LxscWzb1l5mgkmaUutP/xcY9k@lists.freedesktop.org,
 AJvYcCWmAsaeHOg8oE872Y7SzVUtxdR5fhZ/9Cj3iN0hcnLVRpyjBQV7vIBmp+a/rnh0t0UqOpbttFsBrfi/@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUNtoPPUFy+FIZSXlgB27D2GZXZHv08W0LzVoEO6HuqKa7qhIs
 EgGwPcOUCHmlPJ5lYM9Yx+hT67yyfz1wlM42SIW91fy8pLYUaSqH
X-Gm-Gg: ASbGncv4eNnSCTO78T7cTlDb26zA7J/ZHk+H2QuzaMeLE3v22D9M193xzBoI5K+CKCp
 XB8VpsdQxP64j+inmW78kHx3dvJxCzXOTJD2Tn+GXjq6SIh94qjVR6sBh02B/dmi1VEqbg9Rd2j
 gYQm9+PusuanjIbqlMwKUCkJNXJRdIvW2n9mKdoSDsPU0sEGBVOLQyYwg8pl00u+snRg9Ff+KaE
 CnVQRWZIsSd0mszbg5SXdezgQ1b8n8Cdoyf7/BPnHh4HZWl6UMFFBmOXRfK/jOrwVpOSqc7shJY
 pxQxH4kXqMpjfjYaMmdc1RbP43vNhjyxqFHaPg==
X-Google-Smtp-Source: AGHT+IHgbpWAw3ToF51VNapcA24BXvqXwUUtA2PGPS4mT2XtqGWGo3JjVejPDRtbOWoXeUzU8vi6VA==
X-Received: by 2002:a05:6e02:1381:b0:3cf:b7c0:8809 with SMTP id
 e9e14a558f8ab-3cfb7c08be4mr109840195ab.8.1737787600600; 
 Fri, 24 Jan 2025 22:46:40 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:46:40 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 04/63] dyndbg: make ddebug_class_param union members same size
Date: Fri, 24 Jan 2025 23:45:18 -0700
Message-ID: <20250125064619.8305-5-jim.cromie@gmail.com>
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

struct ddebug_class_param keeps a ref to the state-storage of the
param; make both class-types use the same unsigned long storage type.

ISTM this is simpler and safer; it avoids an irrelevant difference,
and if 2 users somehow get class-type mixed up (or refer to the wrong
union member), at least they will both see the same value.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 2 +-
 lib/dynamic_debug.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index ff44ec346162..b9afc7731b7c 100644
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
index 147540c57154..55df35df093b 100644
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
2.48.1

