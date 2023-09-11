Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6E779AC3D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 01:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92DA10E32C;
	Mon, 11 Sep 2023 23:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44AD10E1CF;
 Mon, 11 Sep 2023 23:08:46 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-7926a450a0aso172883839f.3; 
 Mon, 11 Sep 2023 16:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694473726; x=1695078526; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mmy4CQw8YdfUBsoDy2sZHYo8FTokxGCRVZcEnly2Jnk=;
 b=i4quwF8/GrHr5U3hjdwSV95I1qU2Da2fZhSqm6cj5xRqYnNH4NGPXZi3nbebhHl9p7
 e/ejafLVarv+0y47e4IuZ4nGMMFwqNKAGTzwCXr0qhQr7UKFLslhBcqZcl3gOwCZ/3xS
 K0KytC+56LmOI23yu12Xq6Faw7mK3qOBcJwM7b5faTGinpWCMgD4a5TLnUJgbNyYQNyF
 nqrT7Wuj6jT4F3hQ0r1SNYShMT5b9u182NryzMukTSS4xdR4UufARydcFCjTFelV+dCS
 O5FtRt56FUtDNaBP2RFyX5aW95tzPkFPKA+O/Qtj5thTCMFLFnktmtDIoE1ZMEKM1K5C
 ic7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694473726; x=1695078526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mmy4CQw8YdfUBsoDy2sZHYo8FTokxGCRVZcEnly2Jnk=;
 b=s23sjwLUeDLMYAkExQABpaTp3376idvAvJY6fvhLsE43MwbYVzu7R2lBjie9g2etXC
 pyDnRBgtye2dpq0xVR+rSD34+sIYiapDhFWaeJHbxh/rapVqh2qwG6hdgGJboAGxsyBU
 IZ+yW4HEiCjmIDCUyi4GOFFCsNofyEdDAiIgChzvsJgKdKPIWbjtYxqtXJA4wCU755wj
 +pTJWqgTCnHtR/tsJaFysWwRxO/9R7TkvSb7JJvOoaTUbFI5XLrCTGlDxjIJJeLwljG8
 cx8oFA7rHvetQimlQEcQ8+UZ2OTBUrEbAZPxUaMdOPTbOA/7w50Dv75Hg/pmZ3h80JR6
 0h7Q==
X-Gm-Message-State: AOJu0YzGcly8joQv9GsJWFYE2TIQj440ygMY672iWUd2zMOOiFuI2InR
 vs59iAQBVF2Hh9ac6ckElss=
X-Google-Smtp-Source: AGHT+IHLAdJUICDJlpY2SLsUaMJZhDgX9mAPnhl1PjVBKn7g0kArqTJLgGWW4MmaywrbY9ZEQTsn9Q==
X-Received: by 2002:a05:6602:197:b0:791:1b1c:b758 with SMTP id
 m23-20020a056602019700b007911b1cb758mr13933894ioo.19.1694473725817; 
 Mon, 11 Sep 2023 16:08:45 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 z4-20020a029f04000000b00423240c7296sm2512607jal.69.2023.09.11.16.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 16:08:45 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, mcgrof@kernel.org,
 daniel.vetter@ffwll.ch
Subject: [PATCH v6 02/22] dyndbg: make ddebug_class_param union members same
 size
Date: Mon, 11 Sep 2023 17:08:18 -0600
Message-ID: <20230911230838.14461-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230911230838.14461-1-jim.cromie@gmail.com>
References: <20230911230838.14461-1-jim.cromie@gmail.com>
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
Cc: linux-doc@vger.kernel.org, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct ddebug_class_param keeps a ref to the state-storage of the
param, make both flavors use the same unsigned long under-type.
ISTM this is simpler and safer.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 2 +-
 lib/dynamic_debug.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 4fcbf4d4fd0a..5231aaf361c4 100644
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
index fea732db7323..6fee76fcddd1 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -796,7 +796,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
+		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
 	default:
 		return -1;
 	}
-- 
2.41.0

