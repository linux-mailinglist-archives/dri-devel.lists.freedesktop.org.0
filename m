Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAEF76BA5B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 19:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1E910E42D;
	Tue,  1 Aug 2023 17:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DED210E427;
 Tue,  1 Aug 2023 17:03:26 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-348ddac3a09so43515ab.1; 
 Tue, 01 Aug 2023 10:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690909405; x=1691514205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FwG/t09lzKH4vpOX7xC63yDDKsVGwGMxzSidRaMZ9O8=;
 b=MvFvlOqxSTxkUjWyeHVbt5COPbx69GHi8iLxoojIibfF0X6a64n5rbp0R/Q1+VYf1W
 VmTe5HNPv0jQOMI2zox6Kap/PxtAUa8oVU3l6ufNlwa+dVHxBUFjtwmcaeKunH9OBn7j
 4+GaYidG4ARdSJEZ9c4ISkWVHHsL8AOuV/uyHFl8Ov1V1qZJZNa9ZUPLpNcEX1JmHMnk
 emSbJ3e5X9cl0OBUtshD1lKoreiTcXd1prr6gFU/k9gnzsmi+Mvyh4ZzfSk8tSzvMJef
 Hk87a41eWG3gJIqOd/ZBMHNuxdUfUO4WSL7TV0PBDB1Ve1utsxht7FyZzY4i8mfXIW5m
 zE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690909405; x=1691514205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FwG/t09lzKH4vpOX7xC63yDDKsVGwGMxzSidRaMZ9O8=;
 b=IR5VTup/jfDdMR8ALPOcn8tVvjJ1nRkj8GC/C6dO7gkAk+AOF9rzSKuXxH7tggPFGb
 KaH4x8e4zAD/lIesoSeJ/piMBAI2M8GqhUOjUbeyM34712ce+MqZmOU8gfCe7z/G2Tca
 TkSq87e50uNoSmS3c0oauFZFxr2UwmsQmcPyOgdkUO9C0bqa9YGuKdEBtMGHSQXHM5Lp
 cQV3YNAGrGbrh1CzHsIhW9GOep4VcH10wq2iW8+zMtsn8zsBWv7I8CUIZvJaohdS1+VW
 GpRjiOrgY5dtfyn8xXA3trkaNIzui3QZNs12jxXN67RpskzKz0h96dufrQb9qF5iI6Ty
 gf/Q==
X-Gm-Message-State: ABy/qLbPmu8pgK72i2Hcc0eAsgWbMJyGR7LHBjH+gGzSR622pWWsMhm3
 Ix/gQM3jo1MmEdcVTkce0pw7sRF0ytIzC1Ah
X-Google-Smtp-Source: APBJJlFSK7GfkOXPJ8LM7Dl3khr4eyz3CWu6Ob++B/ZOX6BM13b3O/NQh9abJbXSDSZtYQDzxAbkfw==
X-Received: by 2002:a05:6e02:13ea:b0:348:d3e3:9a8f with SMTP id
 w10-20020a056e0213ea00b00348d3e39a8fmr11667577ilj.11.1690909405355; 
 Tue, 01 Aug 2023 10:03:25 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o20-20020a02c6b4000000b0042b144abf71sm3768577jan.179.2023.08.01.10.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 10:03:24 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, daniel@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 07/22] dyndbg: drop NUM_TYPE_ARRAY
Date: Tue,  1 Aug 2023 11:02:39 -0600
Message-ID: <20230801170255.163237-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801170255.163237-1-jim.cromie@gmail.com>
References: <20230801170255.163237-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ARRAY_SIZE works here, since array decl is complete.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 596d0664c29f..719c5b6ad0f9 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -104,11 +104,9 @@ struct ddebug_class_map {
 		.mod_name = KBUILD_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.length = ARRAY_SIZE(_var##_classnames),		\
 		.class_names = _var##_classnames,			\
 	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-        (sizeof((eltype[]){__VA_ARGS__}) / sizeof(eltype))
 
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
-- 
2.41.0

