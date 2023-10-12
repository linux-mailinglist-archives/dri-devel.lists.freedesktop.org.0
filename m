Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D4D7C7488
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 19:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBCF10E573;
	Thu, 12 Oct 2023 17:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6351210E55D;
 Thu, 12 Oct 2023 17:22:09 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-79f82b26abfso44116339f.1; 
 Thu, 12 Oct 2023 10:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697131328; x=1697736128; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Up+jtzbTdtnzlWrrE+sdUGzE+nElHLMssOQwxdsM2uU=;
 b=iI6Q906u1/6XeZm1OKEDHCavW0NbnzBj00xhWs3tuylzg1hyggss/jJqdj2gtUfYEe
 hRMLhqv9GRUnclwvaD4efCLBLE9IvIN7hDpW/U+VQwVQ3HBZ21wwoH+WqL6n5o9IR6Ab
 ylZmckyd0aF6JwTJisPADlxCWBtLmRwpYyTcvAW/xOAeX8CQssPVjlN1Fz0TuKtxdeX0
 CMQ3cs5ej9C0z7XWTK46TRigGEH2M7YbQLlvlb5+AIjqxhrkZ5S0ELhfMNtPoSaBhYGh
 Kp3c+7b5s/gl8CpGlsXBBhR+I2HDGxDEKABG6Oxkbbo+E6if5rl/5EJ9x7cbmzc1g3hw
 PKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697131328; x=1697736128;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Up+jtzbTdtnzlWrrE+sdUGzE+nElHLMssOQwxdsM2uU=;
 b=X6sqjjDCGoV3DYpn/HRQvAzZs/rpSebVHUn2K1gWOTTDvXTuGQRx5QeDjIr6umzCgx
 yQSp9DbsmM1oTsaj6PA1vLlYumWNjntkbsSUc4zpwA/grUK1Mb87SSUTCwZi0X41/t58
 bZyo0eINYd/lEBsOMGPfa8gZSoLBUDJKIBIukepwtcExhfEVsvaABbyZ4fxwuvBvg+u0
 4N+TUHo/TluPPTwq2z4W4HGl2+hsykkLvfQxiocQxM2AE24pVxrKwIKILS2UwxhkgswA
 yZuJhD6Z2HS4HoQl0eL1k8q5No7ai0uapfRgcXsjYHSOoUoRevOAwYv8oFwXT+2Fl61C
 WhCQ==
X-Gm-Message-State: AOJu0YwD7s3V7XYgzgsPqkM3Tf8yMvsquieNII64gS4CKLPX+Gy5UgeS
 2T7ZSMIzTTAegMvHZlSCSdA=
X-Google-Smtp-Source: AGHT+IFhH10q9YRcd9Uilgk1TM8FglNlaccSNgA5BcstdZvhPCyd+xtyXeDVvKuF+6sCVu3pt1NPsA==
X-Received: by 2002:a5e:cb03:0:b0:792:792e:6619 with SMTP id
 p3-20020a5ecb03000000b00792792e6619mr28840462iom.2.1697131328646; 
 Thu, 12 Oct 2023 10:22:08 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 r25-20020a028819000000b0043cef0711c1sm3992211jai.158.2023.10.12.10.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 10:22:08 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 20/25] dyndbg: add _DPRINTK_FLAGS_INCL_LOOKUP
Date: Thu, 12 Oct 2023 11:21:31 -0600
Message-ID: <20231012172137.3286566-21-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012172137.3286566-1-jim.cromie@gmail.com>
References: <20231012172137.3286566-1-jim.cromie@gmail.com>
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
Cc: groeck@google.com, linux-doc@vger.kernel.org, jani.nikula@intel.com,
 daniel.vetter@ffwll.ch, yanivt@google.com, seanpaul@chromium.org,
 bleung@google.com
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

