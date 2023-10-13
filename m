Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6157C9102
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 00:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9477310E656;
	Fri, 13 Oct 2023 22:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A63810E64F;
 Fri, 13 Oct 2023 22:48:55 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3574cde48b4so9415405ab.1; 
 Fri, 13 Oct 2023 15:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697237334; x=1697842134; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PdhZKvxYwXdkWkdLVl73JQfyJJ5FbxfJO6rydQUwjqs=;
 b=LGT08OlobyPIr8RlOZyOPuMa5gK1RaH3/o98EdFvT3owMsyaaA1zBXbfK2q0k3uD2y
 GXyjrYonyDXLaizt18aJ5YteSYiI1HkFUWW0HcWbXQTHhyLZOgUbRNaVpsQF3uLngMyE
 9IjoeHvxET3W5fxDbctpEVhavo6c5Icf56y+fKNaO81pDrjMg3AKn1vIJ7ua2hqI+7Gp
 pOttuAN4cRe8F5lqxnoM68Fcvm0yoRiJQWAtjPpv14r4iSi04FYutFBvNPp5e7ZaEJqS
 bqrbKsjn/pKELsntVDuU/bvII1pidxAOeRJ0Sn0g9lX+UzR4q9QV/ixTjdNuFe/lrJwU
 Rvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697237334; x=1697842134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PdhZKvxYwXdkWkdLVl73JQfyJJ5FbxfJO6rydQUwjqs=;
 b=E24UHDNMqkvb7kb31W1pAUFSQo7mKzfrsK7LqnHRaVxt9YTFNgZKt78szNVzxcxrxD
 yzrZgV1AiLSj8O754kHzge7woe9dE6Y6NAy/PUBrGzdH9flRvSzxSKJKTc4mgDDO+CK3
 2WwfbNsyxT/UibMOJehrk/P1JezVUT9Rkrs7NNJc+g/lI9Nm1UnQLYcQHv7usriuMZiX
 bBjyF1z1K0JAO+r7Mk0rtEyfBDZMQKM+lfpL7c4Ka5+//LMEuytVkGyu/+M7Gy3+JM2p
 RVU1NVQ4KdfR9C6Fy4a1u4lE02wL1wJXZ/QTRRGB2kLqqNqRFtocYWbMT+8VUB8MgcuK
 oAEg==
X-Gm-Message-State: AOJu0YxW/ehHyEklqBSWOu1qwEgsXayq3vIKDrV8zZjSG+PuPXORyF//
 ghZL2JlrxWOFZQLtDWQiNTlvF5fWKn4X0Q==
X-Google-Smtp-Source: AGHT+IF3D17mL6y2d13cwyIjmP3+07yGtwbO19SBlnOyYbqXK1NWwD4Cm7hxH5ll2GZm/mnKj3kEZg==
X-Received: by 2002:a05:6e02:1c28:b0:34b:ba9f:679c with SMTP id
 m8-20020a056e021c2800b0034bba9f679cmr37397493ilh.16.1697237334576; 
 Fri, 13 Oct 2023 15:48:54 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t10-20020a92dc0a000000b003512c3e8809sm1683071iln.71.2023.10.13.15.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 15:48:54 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7b 20/25] dyndbg: add _DPRINTK_FLAGS_INCL_LOOKUP
Date: Fri, 13 Oct 2023 16:48:12 -0600
Message-ID: <20231013224818.3456409-21-jim.cromie@gmail.com>
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
index 927cb14f24e0..2237d454bc19 100644
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

