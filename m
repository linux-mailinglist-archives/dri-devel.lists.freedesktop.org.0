Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2497DDA06
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 01:27:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FEE510E600;
	Wed,  1 Nov 2023 00:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1067510E60E;
 Wed,  1 Nov 2023 00:26:45 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-359341749e5so4363145ab.1; 
 Tue, 31 Oct 2023 17:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698798404; x=1699403204; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2r2Xy/LUqkHG59xFuO4NDcaCnT0VxXpDLDYMeh9aWn8=;
 b=lfmYHpoL8DDM7edNq07vdc0k317v5YVVfXXz01FBIJLbX3C1kYqIKGf4DgQeKq9UB5
 zyarWlUQKEj8efCvhTNwXSbgEvS7Y7rdOFEr51wViWaYFMw/fFEIXoy3hCQD1j3fhHN4
 LwW3Mv3u2u5YV8mj82iX0vW+aKS6Aym3JhCLZ2NoXeqAf9PgNf+1F7NtCvDGwgd0jXnW
 OAJp6Bgt9auzHNl1PnUKbxtWtG+6SS75DFBrVnSwx7fzU7LfXX4c6saRAJsOzLe/tmq2
 8FYVfoJfx5v6akckMtlt/tkuG6JCM54ZpeDZGqv7gsXkSg4vOs8dlN/Qmx2bpNR7tNF7
 LMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698798404; x=1699403204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2r2Xy/LUqkHG59xFuO4NDcaCnT0VxXpDLDYMeh9aWn8=;
 b=QKGC9TsVWIZcVLypxzEY+IzCWPq2yRtOggdx+DVEvSGcmWdgcvRsS9PK1EXyFhvpTV
 MXgp1Cq+/DWfEYZXOUZCZ/rgbVLJWm7ucv0mSfquJVdxkcdBDu7ZXetJ4OOiyCYC5qug
 R/+1uIJ1/b1ZJ6W5ew2VuCaHrWdUQO7UlxdZzOOWhLj6HbKeMrnYbUIxKaZgyEiE1HeL
 PTLmcsFJZdYBQR32s+gH5i9SFv8N71JaW93ygYyRQvNdintjZ5BA3/0M+eUaj3nYCHO5
 8NauXe9QAjkwCvKg5RPPgoCnc0ryxjKJ87dkW57OSCjvx54/79kfUBJ9cC7I4DvMf0bh
 Bq6Q==
X-Gm-Message-State: AOJu0Yyota/LdK6wCYJm2hGacT+b0aOdtcWAegfrV1u9U7RbFDu6DTMf
 CvvQC2VeIze1Tp1yt0kDnF4=
X-Google-Smtp-Source: AGHT+IFJ+EO25MFzuh5tK6lN7VgLWzxSfGJvEw3xuzQxhOciZy5mpoFNsIJKMGKNq9pPh0T4ilf3hg==
X-Received: by 2002:a05:6e02:330d:b0:359:3754:e6bb with SMTP id
 bm13-20020a056e02330d00b003593754e6bbmr3823026ilb.21.1698798404300; 
 Tue, 31 Oct 2023 17:26:44 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t1-20020a92c901000000b00357cc8df1d5sm141701ilp.68.2023.10.31.17.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 17:26:43 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7d 19/23] dyndbg: add _DPRINTK_FLAGS_INCL_LOOKUP
Date: Tue, 31 Oct 2023 18:26:05 -0600
Message-ID: <20231101002609.3533731-20-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101002609.3533731-1-jim.cromie@gmail.com>
References: <20231101002609.3533731-1-jim.cromie@gmail.com>
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
Cc: quic_saipraka@quicinc.com, linux-doc@vger.kernel.org,
 daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, will@kernel.org,
 groeck@google.com, maz@kernel.org, mcgrof@kernel.org, mingo@redhat.com,
 catalin.marinas@arm.com, arnd@arndb.de, jani.nikula@intel.com,
 linux-arm-msm@vger.kernel.org, seanpaul@chromium.org,
 linux-arm-kernel@lists.infradead.org, lb@semihalf.com, yanivt@google.com,
 quic_psodagud@quicinc.com, joe@perches.com, bleung@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dyndbg's dynamic prefixing (by +tmfsl flags) is needlessly expensive.

When an enabled (with +p) pr_debug is called, _DPRINTK_FLAGS_INCL_ANY
prefix decorations are sprintf'd into stack-mem for every call.

This string (or part of it) could be cached once its 1st generated,
and retrieved thereafter, as long as its deleted any time the
callsite's flags are changed afterwards.

So consider the prefix/decoration flags: 'tmfsl', and what should be
in the cache:

-t  thread-id. not part of the "callsite" info, derived from current.
    doesn't belong in the cache. it would be wrong.
    can be done in outer: dynamic_emit_prefix()

-l  line number
    this could be part of the prefix, but would bloat the cache
    can also be done in outer: dynamic_emit_prefix()

-mfs  module, function, source-file
    we cache these, composed into a sub-string.
    they are "lookups", currently to descriptor fields,
    could be accessor macros to "compressed" tables.
    cache saves more access work.

All enabled together, they compose a prefix string like:

  # outer   -----inner----------   outer
  "[tid] module:function:sourcfile:line: "

So this patch extracts _DPRINTK_FLAGS_INCL_LOOKUP macro out of
_DPRINTK_FLAGS_INCL_ANY macro, then redefs latter.

Next re-refactor dynamic_emit_prefix inner/outer fns accordingly.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 4ffddf5e9152..b4550f80cfd5 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -40,10 +40,12 @@ struct _ddebug {
 #define _DPRINTK_FLAGS_INCL_SOURCENAME	(1<<5)
 #define _DPRINTK_FLAGS_PREFIX_CACHED	(1<<7)
 
-#define _DPRINTK_FLAGS_INCL_ANY		\
-	(_DPRINTK_FLAGS_INCL_MODNAME | _DPRINTK_FLAGS_INCL_FUNCNAME |\
-	 _DPRINTK_FLAGS_INCL_LINENO  | _DPRINTK_FLAGS_INCL_TID |\
+#define _DPRINTK_FLAGS_INCL_LOOKUP					\
+	(_DPRINTK_FLAGS_INCL_MODNAME | _DPRINTK_FLAGS_INCL_FUNCNAME |	\
 	 _DPRINTK_FLAGS_INCL_SOURCENAME)
+#define _DPRINTK_FLAGS_INCL_ANY						\
+	(_DPRINTK_FLAGS_INCL_LINENO | _DPRINTK_FLAGS_INCL_TID |		\
+	 _DPRINTK_FLAGS_INCL_LOOKUP)
 
 #if defined DEBUG
 #define _DPRINTK_FLAGS_DEFAULT _DPRINTK_FLAGS_PRINT
-- 
2.41.0

