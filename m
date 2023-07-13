Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F7D75289A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 18:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C6A10E726;
	Thu, 13 Jul 2023 16:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2798810E712;
 Thu, 13 Jul 2023 16:36:49 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3465ec72cc8so3988305ab.0; 
 Thu, 13 Jul 2023 09:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689266209; x=1691858209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Vt/wHfetwQDHpRz65Llg9LjGES1lnjN8dFqGOHt2Ac=;
 b=glp7P9GjRU67Gp1MffApNvQw8LEldcVlfVMrc0FYDz/Ji+gCup2prH6rGPmMYwhPQ9
 8WmCpif59LAubxHCev8KU04P+nmlye8BjKr5dbHWKECz/C7PeUWtC//KYGEmzQEb9J5i
 xtD9nlmLiOIczFi9lyOuv8b31P3RMMKazReNtv96JbPeII5OObkeKXmXw7exZaQEfvuj
 v1/Z6fDnEonb5+7mgIbJVB0k+Vd1tUMKG8fUGg554pzJ+CL03akaAEDnrz7cYQgr7eTo
 bW3HJnaRoF5cyZgslcOlYe9DCDbIXQRz04Y4iJ+UPR1IJE/cvcDIMLis/yPM3ve1fcQA
 LLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689266209; x=1691858209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Vt/wHfetwQDHpRz65Llg9LjGES1lnjN8dFqGOHt2Ac=;
 b=UFhjSNzA3Ega6k5MRAgxAUIVEYd9XboSiOP4lbLXKeDgpBrxic02Y24BekWiHMSO/D
 s57kqGIbhSqooGsHulxJbxBmQwzyUrNnjojQWdlSFzXZcUhqlJUaDh6I1ceMF8sAJwuu
 DhvUco8VblguO44QAHYtz483ptT+NrcoBoVVj0bo5hx2ti+ne+ueC09o8wVSgeZQaIzI
 obvJHQ3dGxkyBGiqKSV9+XA1bSDpZJqTgkS5wgESf3wGY1mUwwl7LvowgRwNBgG1BuRw
 QshTpSz2RZJ2YPe77K7ylNpYAamF4Oli88Dlt9WtjvaBaKm38X2ip+8V5Kux5bITcTPQ
 QZ/Q==
X-Gm-Message-State: ABy/qLY/0ftORvlJayBQIUvFzmRA8ecntm/I0J+UfoOVoeTO4qt/4gw4
 2+4hrROLRZklw57v0HrhaM4=
X-Google-Smtp-Source: APBJJlGjqgEAcsN5h6ZfXb2PbVphArrccvvvD1WEJPQj8xEO/XamMG9APO5ITE1rMXWOtSczogeXdg==
X-Received: by 2002:a92:c6c1:0:b0:346:5aeb:44ec with SMTP id
 v1-20020a92c6c1000000b003465aeb44ecmr2256251ilm.22.1689266208806; 
 Thu, 13 Jul 2023 09:36:48 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 s7-20020a92d907000000b00345950d7e94sm2147571iln.20.2023.07.13.09.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 09:36:48 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 03/21] dyndbg: make ddebug_class_param union members same
 size
Date: Thu, 13 Jul 2023 10:36:08 -0600
Message-ID: <20230713163626.31338-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713163626.31338-1-jim.cromie@gmail.com>
References: <20230713163626.31338-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, gregkh@linuxfoundation.org, seanpaul@chromium.org
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
index 061dd84d09f3..dc41e70dc2e1 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -122,7 +122,7 @@ struct _ddebug_info {
 struct ddebug_class_param {
 	union {
 		unsigned long *bits;
-		unsigned int *lvl;
+		unsigned long *lvl;
 	};
 	char flags[8];
 	const struct ddebug_class_map *map;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index fdd6d9800a70..22a3182bf89f 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -795,7 +795,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
+		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
 	default:
 		return -1;
 	}
-- 
2.41.0

