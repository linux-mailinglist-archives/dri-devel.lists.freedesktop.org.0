Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4427C909B
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 00:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E347010E657;
	Fri, 13 Oct 2023 22:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416A510E644;
 Fri, 13 Oct 2023 22:48:34 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3576121362eso5246275ab.1; 
 Fri, 13 Oct 2023 15:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697237313; x=1697842113; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1C+2NMg1JH09l8lpRwB0Ubzh+mfktnl5vVkwETAlRt8=;
 b=BQRUlr9ZYfUa2KQTYCD75B1w/wxApZ84cvYOk2gwy3kQOlo6e5oZI7poBjX+DglVgD
 TqxCF/+mOuEcRGcugKy2DPtlo101gVZEgk0Eb9wyniCGfQMQtlFp2JF0K34Kn1nT9Q4O
 KD9uKV158BV/v4ZOjvK0ETql/lWQKwOO6efJlZmj4Z3fqJKXJ+o5OG4c59RGvp/gNTXT
 3S/ZvnSDpu4AlPIsUZ2Nzuv1Kt2P7WI/doqsjY4nmPYfEJRu5XQCnYUzyxeJzFAnT+fe
 98gtVELp/H87WhwzhjyQ2OKQSWXptVybPMWfqG2rdoq6At8JEdWC/M/R/v6Vd3uRUMg0
 jgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697237313; x=1697842113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1C+2NMg1JH09l8lpRwB0Ubzh+mfktnl5vVkwETAlRt8=;
 b=Fiu0qz/RRHnfs6XBkUdsRDEMXusgA6a22LMhYUzpnINowc8FWRHMKhxu7Df9t8Q6rD
 bKuz6PrbEMHHfu9/txxnmEfE8tw2sDlFvsfbhcEEDHamrGfH2ekxRgcQyUV25y0sJaVu
 vKbanh4JldgZiw+OiznZZ3bQY447q0MRHrMZv/6p9w2RNg8j3vMA+0c4/TKgVQe03gIh
 dKKx/lkX7D2D9aD2fKwbu3029NEmYEQohkmEZQJhW+yrrKwJ0Xzmu2ujESXIcAws8UUX
 YUy05eVGR+c7NCNB0BbjZ+mfqDXXkeBYBsuWpljXt5XVCdxt4nt1uuopP5c4d/dYPUnh
 x90w==
X-Gm-Message-State: AOJu0Yy0EFltaePj817K2E8/bJPltV5s8kmSaHPG4BNJ6EW4L/wXTf55
 m5Ix0ffXRlxiA8LrWDDp0T4=
X-Google-Smtp-Source: AGHT+IERN8pJIP8+ddoE+eB01U1+UXtsDPSDnnzIVYSoLKnjpR6o8aO6/OIr3x06+l+lRtKcnjJmFQ==
X-Received: by 2002:a92:c56b:0:b0:34f:f5a4:3e68 with SMTP id
 b11-20020a92c56b000000b0034ff5a43e68mr37533699ilj.30.1697237313527; 
 Fri, 13 Oct 2023 15:48:33 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t10-20020a92dc0a000000b003512c3e8809sm1683071iln.71.2023.10.13.15.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 15:48:33 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7b 03/25] dyndbg: make ddebug_class_param union members same
 size
Date: Fri, 13 Oct 2023 16:47:55 -0600
Message-ID: <20231013224818.3456409-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013224818.3456409-1-jim.cromie@gmail.com>
References: <20231013224818.3456409-1-jim.cromie@gmail.com>
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
Cc: lb@semihalf.com, groeck@google.com, linux-doc@vger.kernel.org,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk,
 mcgrof@kernel.org, seanpaul@chromium.org, joe@perches.com, bleung@google.com,
 yanivt@google.com
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
index ceb3067a5c83..b984ce338921 100644
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

