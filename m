Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 271707528CA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 18:37:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CA810E75B;
	Thu, 13 Jul 2023 16:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0EE10E763;
 Thu, 13 Jul 2023 16:37:04 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3461053677eso1987805ab.0; 
 Thu, 13 Jul 2023 09:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689266223; x=1691858223;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xtXcwS8d/IDIwtZ853/2GI+9Fn3yNRgVoZNcTx+O3Ew=;
 b=HlYsuUhPgjpXCZ9henX1PDwU0cw3h2N3V5/vsfI3JqIAfhpOmkW+trSjYWT65U3nyC
 jLebmc9PX5LkHYZtGISPEwFqP511fRUaV3p126UUUQ12cEoisYsRB0Ai0IFMoK/o+Zno
 rGguAhVV1T0Xtt56BsYcD8yFiSs4AzNYqyvja+HjPwA8MdQrfo408bDsxt9OJHXJyZ3y
 NcJt4Mr3dq/irqiTKq+AH7wN/d04UujVFnf3InP9dyq90JzGLKhF4XgF3DEE6WUMuJvX
 hlybq+IReegFZ0TKYVW5nMEdCMyQ4uQvKHiCH6vc07xhaWaOnWfaVWviGizRleqeG3TT
 UVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689266223; x=1691858223;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xtXcwS8d/IDIwtZ853/2GI+9Fn3yNRgVoZNcTx+O3Ew=;
 b=FyJsAeMwCWA15s+i8GmABq62rfXCCrUi+5cMSiHu6WbDzcQA0QFs13cinll2lOcddZ
 VsCAUYp90vR1jkthb6wItesV62QypkegzYkMInKV6ZQSSLO+uEgVI/QifWe7hg79TxUJ
 1LApAv6qpDvGXYmS5g0kNeBamoCcxZSjncMmBkgEaAz4bdLmBKPuD+gFLeeY51/xGRyD
 4CwIHZto9FjqL9AfODfWjbGatZ9QRtb9xM4rQ1eYyKkKyo4QdbeiCEgnxAnqlXIWPyIq
 ghMktL690JXPhjGvphLEhX27ZO4erJmDKfuCDvFUMbUf9S65FI4TjIBFhd4NnJHLWyvJ
 6MuQ==
X-Gm-Message-State: ABy/qLbAi8e1Emk1Yz/pK33KQTsSeBECVZ6Fiplwame19ae/t0K5+qRJ
 ujzyAZ7tSh6rjxmvwZ7q1x8BV5rgqWj5sA==
X-Google-Smtp-Source: APBJJlGKK8QkvWwdEzHjGRc5A1ATdY9Dfw8qrHFYEawb7ulcwGWCKqqAd0Mg8QH2SMEdwJLdP2dZ3w==
X-Received: by 2002:a92:6c0f:0:b0:346:7fc:4fb8 with SMTP id
 h15-20020a926c0f000000b0034607fc4fb8mr122786ilc.1.1689266223658; 
 Thu, 13 Jul 2023 09:37:03 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 s7-20020a92d907000000b00345950d7e94sm2147571iln.20.2023.07.13.09.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 09:37:03 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 18/21] compiler.h: RFC - s/__LINE__/__COUNTER__/ in
 __UNIQUE_ID fallback
Date: Thu, 13 Jul 2023 10:36:23 -0600
Message-ID: <20230713163626.31338-19-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, gregkh@linuxfoundation.org, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-sparse@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, seanpaul@chromium.org,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Tom Rix <trix@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We currently have 3 defns for __UNIQUE_ID(); gcc and clang are using
__COUNTER__ for real uniqueness, 3rd just uses __LINE__, which should
fail on this (and harder to avoid situations):

  DECLARE_FOO(); DECLARE_FOO();

Its 2023, can we haz a no-fallback __UNIQUE_ID ?

NOTE:

This also changes __UNIQUE_ID_ to _kaUID_.  Ive been getting
lkp-reports of collisions on names which should be unique; this
shouldnt happen on gcc & clang, but does on some older ones, on some
platforms, on some allyes & rand-configs.  Like this:

mips64-linux-ld:
drivers/gpu/drm/display/drm_dp_helper.o:(__dyndbg_class_users+0x0):
multiple definition of `__UNIQUE_ID_ddebug_class_user405';
drivers/gpu/drm/drm_gem_shmem_helper.o:(__dyndbg_class_users+0x0):
first defined here

Like above, the collision reports appear to always be 3-digit
counters, which look like line-numbers.  Changing to _kaUID_ in this
defn should make it more obvious (in *.i file) when a fallback has
happened.  To be clear, I havent seen it yet.  Nor have I seen the
multiple-defn problem above since adding this patch.

Lets see what lkp-robot says about this.

CC: Luc Van Oostenryck <luc.vanoostenryck@gmail.com> (maintainer:SPARSE CHECKER)
CC: Nathan Chancellor <nathan@kernel.org> (supporter:CLANG/LLVM BUILD SUPPORT)
CC: Nick Desaulniers <ndesaulniers@google.com> (supporter:CLANG/LLVM BUILD SUPPORT)
CC: Tom Rix <trix@redhat.com> (reviewer:CLANG/LLVM BUILD SUPPORT)
CC: linux-sparse@vger.kernel.org (open list:SPARSE CHECKER)
CC: linux-kernel@vger.kernel.org (open list)
CC: llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT)
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/compiler.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index d7779a18b24f..677d6c47cd9e 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -177,9 +177,9 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
 	__asm__ ("" : "=r" (var) : "0" (var))
 #endif
 
-/* Not-quite-unique ID. */
+/* JFTI: to fix Not-quite-unique ID */
 #ifndef __UNIQUE_ID
-# define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __LINE__)
+# define __UNIQUE_ID(prefix) __PASTE(__PASTE(_kaUID_, prefix), __COUNTER__)
 #endif
 
 /**
-- 
2.41.0

