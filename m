Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD3A76C103
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 01:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6130910E44C;
	Tue,  1 Aug 2023 23:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13FF10E44C
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 23:35:23 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-34915ceb5eeso10481415ab.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 16:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690932923; x=1691537723;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Vt/wHfetwQDHpRz65Llg9LjGES1lnjN8dFqGOHt2Ac=;
 b=Pb7dCw9BQCyJFEBzKw7pu8GkBlGzqTGf9OlqnQ7iYQUKBXTegCniwldHUJ0PnIZBB/
 Qcxtje5yc1TzOzstrF3vdwWPJI5sSoyfsY0BxV+VmX0WWs6Eza9XZwsGuIduRZWcp76h
 bHovkYQb81YhJ8ine6fX7c5ji/tL762ECE2C3BKhW5iIe8odjOkLFcy0TDaVK1/oTlPi
 Pj8P3T3Xpcmkvl1nLdEGoAAsU4GZ9iz50VsTlQUHFueK67CRwNIjCy2TenbnL4MY3FKg
 S75O2WmrexsL/wqqWvtplz0OP8oOn6C0WEsCLmjH0reLqkbtvHM1iVtGVzaSMqXAzX0f
 wmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690932923; x=1691537723;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Vt/wHfetwQDHpRz65Llg9LjGES1lnjN8dFqGOHt2Ac=;
 b=FnMjkZEp4CmTXg7QpFteEuiWeuksoHmHGK21oJmFRRbvtEGzWCZS9PmkXdHEMMw7Y5
 n90uF6UmVVAZ28/J0hk9rMwH/p+U3/FtOXaQq0QtZqRN7Ip1SdSiIslLFkR2rH5LyvVM
 j6WDigeDtYWaNV8JldBRm12RyzBhgAm9ZUvBV4ZzwsauRBA5C5i4m7co3qnEtAsm8j4A
 KgxE532/lcuiB9A87jeUhKHNJQHR70QvasaefyCOqPxJ3S9p9/NeV8jNBff8afO7cIkw
 MjwbJAAEUXqh+SdpgTU7/w6JoIJpf/TBjiTyVB5hTOBEd3FDfNi4vWE6ZRw8RvTrW0jV
 Eglw==
X-Gm-Message-State: ABy/qLYj98ZMumY4Vh1dYq7a9zQRMkjddl6NcYpB7dhiULwVHoqnQSjs
 JU/b8CzXipwmykL5nYT5Fx4=
X-Google-Smtp-Source: APBJJlHrVPwo2C2L4MpPygRs4TUYs4lniK9Y3SKLxBzBp5titU4gVtOFVdfTkWb6jJQhdQ66eIsvUg==
X-Received: by 2002:a05:6e02:13e7:b0:345:bfc7:d527 with SMTP id
 w7-20020a056e0213e700b00345bfc7d527mr11027555ilj.7.1690932923052; 
 Tue, 01 Aug 2023 16:35:23 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a92ca8d000000b00348d652a6b4sm4157967ilo.48.2023.08.01.16.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 16:35:22 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 03/23] dyndbg: make ddebug_class_param union members same
 size
Date: Tue,  1 Aug 2023 17:34:49 -0600
Message-ID: <20230801233515.166971-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801233515.166971-1-jim.cromie@gmail.com>
References: <20230801233515.166971-1-jim.cromie@gmail.com>
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

