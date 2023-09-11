Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 665D779AC73
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 01:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC0410E39A;
	Mon, 11 Sep 2023 23:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22EA410E381;
 Mon, 11 Sep 2023 23:09:07 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-34e2aad3f8bso15566505ab.1; 
 Mon, 11 Sep 2023 16:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694473746; x=1695078546; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ESkE1bZNfU1HWAKelmlyxfVO/PhQytfAXhWjbkh3sXk=;
 b=kWok+0e/G+w/bVnDnSbCiERy0y9ATIM7irQisJrIAQDsLnpYmvJz4qfZuY7IaiYxcJ
 Ebee0iOE1Yq3sz89uMqslTk9IjN3KtlMIWli5hFpkn9XcefGdFp+W5/i0zG/7dI5K3SW
 iliCq7dWODLsrLH3bRH+DbOZ5kaH8Qs2zc6HyWIvAEICd4IvkF6oGwpkxLIiPagHQ5ZN
 UgAlehSob9/gnAFAQvScPzwBXXNTFMN9s7VwJRk2EEd/kX9Ukd/rIKsQXGIIo+g1qfaI
 7o+dys0uJlxh6AyrwHSK/4RnkR3bl+CxWnzFvDdwKQWzRXQ6M/9ZjQjiufquRl4r5hNG
 WUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694473746; x=1695078546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ESkE1bZNfU1HWAKelmlyxfVO/PhQytfAXhWjbkh3sXk=;
 b=qnI0U9ix4Y0AsX/oM8IQWQSFf0skNYOadnWPwmRKUt608COHM473wdW9Xbc7Lk3EIy
 SP9ZWO5deXZt/HCH3d3rmZ3gKLXMDQo++vieytcxLbwjZRF8nx83nRj6XNx/1DG2HnuH
 nLvlFQ24WSPHrPvdNFHR6wBuBtp1mE27XI5CUSHlgjwRpo65/XVFxw0zMWrAPlWNWO3+
 bjeA31fMYNQrdsMXR6PsOP7txK1n9DKM48Z3Q5WLp9o2l9hLsGNdgLlR0y9G43PbztnP
 4wV3r80gEOrOhtYqkT1/BdWky33SpSP3LcZyfhAwWDZCy0APdakTOaRdbEaNVmcsfkJ6
 xbmg==
X-Gm-Message-State: AOJu0YxF4ll0hGxKIte9E0J0SnZHVaKTjZRHpEaUC1WkCiKOOLN0UBm7
 /Z3svKd+iJd+HpUlGju2rZ9js2MvgBbQXQ==
X-Google-Smtp-Source: AGHT+IHNuCLf8PX+N8HFzY2KIxhpLtrrXX7XbHvVmw+f5uCzl6ZDWoiAWyY7Py4er03hU5zXqdzM6g==
X-Received: by 2002:a05:6e02:1bae:b0:34c:c8e8:ca87 with SMTP id
 n14-20020a056e021bae00b0034cc8e8ca87mr14120307ili.20.1694473746384; 
 Mon, 11 Sep 2023 16:09:06 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 z4-20020a029f04000000b00423240c7296sm2512607jal.69.2023.09.11.16.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 16:09:06 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, mcgrof@kernel.org,
 daniel.vetter@ffwll.ch
Subject: [PATCH v6 19/22] dyndbg: add _DPRINTK_FLAGS_INCL_LOOKUP
Date: Mon, 11 Sep 2023 17:08:35 -0600
Message-ID: <20230911230838.14461-20-jim.cromie@gmail.com>
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

dyndbg's dynamic prefixing (by +tmfsl flags) is needlessly expensive.

When an enabled (with +p) pr_debug is called, _DPRINTK_FLAGS_INCL_ANY
prefix decorations are sprintf'd into stack-mem for every call.

This string (or part of it) could be cached once its 1st generated,
and retreived thereafter, as long as its deleted any time the
callsite's flags are changed afterwards.

So consider the prefix/decoration flags: 'tmfsl', and what should be
in the cache:

-t  thread-id. not part of the "callsite" info, derived from current.
    doesnt belong in the cache. it would be wrong.
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
index bdb0d12b13ec..c5609560ca1b 100644
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

