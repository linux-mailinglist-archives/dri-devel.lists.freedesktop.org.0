Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADB17CE3DC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 19:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838F410E445;
	Wed, 18 Oct 2023 17:06:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F68B10E435;
 Wed, 18 Oct 2023 17:06:34 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-7a67c3d62a3so20013839f.1; 
 Wed, 18 Oct 2023 10:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697648794; x=1698253594; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m1uXLDmoVzvN2oJUe3cXywX9ZoHLJ5owNDwFWfeTZCY=;
 b=lJpanxktvi8M3dHgA/lx4DmMz/Cdjg0RmZyE2jZcQAd4qajQRbi6ReW2TF5dywAzis
 dVEGB3AQ3ijDB+bELOPWGMNinHJsVMhikh1xWMtGiz3drzNqRdIHS9QoVBC4bBGDhaFD
 SVAMGAo/BgKasNeyxmnfdOL0zi5q/vOgd9wpetVzNDRF40LCKn88MEJo3ZHLPSQKKsGc
 tZLV/6qvb2/R69o2iH4DFooUTaEmnMYOXnd2hyBlMsuf/NTuJeX9odJHkFs+b8JQgAuF
 QeRjpPwySfIZX6xFmpacky4RFKy6KGSzk+nV9XoJiCIBarEFmuJj49RIrRJr+aWHp2lS
 YJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697648794; x=1698253594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m1uXLDmoVzvN2oJUe3cXywX9ZoHLJ5owNDwFWfeTZCY=;
 b=k+uwYl9Q2oAHAFLt91G90oDyn4WDYQkENvbyqMUOeTalJr00W6bxqTonXAdt4ezvRV
 6Zfd3aqTnm7P9CUzAkwAUzm6geUq1Sg0eI/VEN9DsPQnVJb6OnczQG4W8OS9mDYcSY/t
 ooepNfaENyPcT4L+EntLi+TMSi+n24o0+V1YUNjh/a0i7KgjaLKACm9piE3vCht1Wj3g
 g2nv6Yy7erbXk5i7LvRGJJpOCfaTV70KDUbwjymx3FNCeDZ6URnQEMyMRGF7w0b0FzJ0
 M4kE/fiQYd/Eddh2Lc+/FDdB7LDgTB24MGuDca1BLh7pED5Pe5aeruWWQLu4Ejh5Puof
 kY9w==
X-Gm-Message-State: AOJu0YxCEDK/Xd9UeYvODkpbZzpCT3MwVxVNRSykJ79OzBAFLomkpLMM
 a4dRsVJDvcJsCD6ZHievD6k=
X-Google-Smtp-Source: AGHT+IHDhIJWKLlsUjUBf2pstUmVVUXI2KBM3lV1WAlou8KYnpqF5nM32qgWdz8lmvtKHbmk8V74eQ==
X-Received: by 2002:a05:6602:48e:b0:79f:9eb4:3ea1 with SMTP id
 y14-20020a056602048e00b0079f9eb43ea1mr8307541iov.3.1697648793755; 
 Wed, 18 Oct 2023 10:06:33 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 n4-20020a5d8244000000b0079fa1a7cd36sm1228944ioo.30.2023.10.18.10.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 10:06:33 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7c 20/24] dyndbg: refactor *dynamic_emit_prefix
Date: Wed, 18 Oct 2023 11:06:00 -0600
Message-ID: <20231018170604.569042-21-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018170604.569042-1-jim.cromie@gmail.com>
References: <20231018170604.569042-1-jim.cromie@gmail.com>
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
 rostedt@goodmis.org, mcgrof@kernel.org, seanpaul@chromium.org, joe@perches.com,
 bleung@google.com, yanivt@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Refactor the split of duties between outer & inner fns.

The outer fn was previously just an inline unlikely forward to inner,
which did all the work.

Now, outer handles +t and +l flags itself, and calls inner only when
_DPRINTK_FLAGS_INCL_LOOKUP is needed.

No functional change.

But it does make the results of the inner-fn more cache-friendly
(fewer entries, reused more often):

1- no spurious [TID] or <intr> noise
2- no LINE-number to bloat the cache (avg 9 pr_debugs/fn)
3- only LOOKUP stuff

Currently LOOKUPs are descriptor-field refs but could be replaced by
accessor functions.  This would allow the __dyndbg_sites section to be
de-duplicated and reclaimed; currently module, filename fields are
~90% repeated.  As the accessors get more expensive, the value of
caching part of the prefix goes up.

Also change inner-fn to return count of extra chars written to the
buffer, and drop "inline" from outer, let the compiler decide.  Maybe
also change name accordingly.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
fixup whitespace
---
 lib/dynamic_debug.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index a6ee142668bf..9db797a0cf82 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -774,11 +774,28 @@ static int remaining(int wrote)
 	return 0;
 }
 
-static char *__dynamic_emit_prefix(const struct _ddebug *desc, char *buf)
+static int __dynamic_emit_prefix(const struct _ddebug *desc, char *buf, int pos)
+{
+	if (desc->flags & _DPRINTK_FLAGS_INCL_MODNAME)
+		pos += snprintf(buf + pos, remaining(pos), "%s:",
+				desc->modname);
+	if (desc->flags & _DPRINTK_FLAGS_INCL_FUNCNAME)
+		pos += snprintf(buf + pos, remaining(pos), "%s:",
+				desc->function);
+	if (desc->flags & _DPRINTK_FLAGS_INCL_SOURCENAME)
+		pos += snprintf(buf + pos, remaining(pos), "%s:",
+				trim_prefix(desc->filename));
+	return pos;
+}
+
+static char *dynamic_emit_prefix(struct _ddebug *desc, char *buf)
 {
 	int pos_after_tid;
 	int pos = 0;
 
+	if (likely(!(desc->flags & _DPRINTK_FLAGS_INCL_ANY)))
+		return buf;
+
 	if (desc->flags & _DPRINTK_FLAGS_INCL_TID) {
 		if (in_interrupt())
 			pos += snprintf(buf + pos, remaining(pos), "<intr> ");
@@ -787,15 +804,10 @@ static char *__dynamic_emit_prefix(const struct _ddebug *desc, char *buf)
 					task_pid_vnr(current));
 	}
 	pos_after_tid = pos;
-	if (desc->flags & _DPRINTK_FLAGS_INCL_MODNAME)
-		pos += snprintf(buf + pos, remaining(pos), "%s:",
-				desc->modname);
-	if (desc->flags & _DPRINTK_FLAGS_INCL_FUNCNAME)
-		pos += snprintf(buf + pos, remaining(pos), "%s:",
-				desc->function);
-	if (desc->flags & _DPRINTK_FLAGS_INCL_SOURCENAME)
-		pos += snprintf(buf + pos, remaining(pos), "%s:",
-				trim_prefix(desc->filename));
+
+	if (unlikely(desc->flags & _DPRINTK_FLAGS_INCL_LOOKUP))
+		pos += __dynamic_emit_prefix(desc, buf, pos);
+
 	if (desc->flags & _DPRINTK_FLAGS_INCL_LINENO)
 		pos += snprintf(buf + pos, remaining(pos), "%d:",
 				desc->lineno);
@@ -807,13 +819,6 @@ static char *__dynamic_emit_prefix(const struct _ddebug *desc, char *buf)
 	return buf;
 }
 
-static inline char *dynamic_emit_prefix(struct _ddebug *desc, char *buf)
-{
-	if (unlikely(desc->flags & _DPRINTK_FLAGS_INCL_ANY))
-		return __dynamic_emit_prefix(desc, buf);
-	return buf;
-}
-
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...)
 {
 	va_list args;
-- 
2.41.0

