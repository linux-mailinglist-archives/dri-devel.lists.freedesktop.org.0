Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F7BA6AD7F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C74210E695;
	Thu, 20 Mar 2025 18:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dl74LGsG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F4110E6AE;
 Thu, 20 Mar 2025 18:53:17 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-85b41281b50so31019739f.3; 
 Thu, 20 Mar 2025 11:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496797; x=1743101597; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pMU0x5TrIGi1TlXMZD5rXGa9j1LnP0o62QpnxxI3Tyc=;
 b=dl74LGsGfU/Pk+4z65r7vkTJ8wQps3pmzm8Va+kNbR5GOFwSHwJGHLGizpyAxKYYuf
 uuMMdLVCmOhzc4zZydzT1HDkdEX/LBU2PJe80BHUgm8P7lzNiyIxHyRrhwad18lS8DJi
 eLz7+iCScjp4Bs1sfGKh9Vkjwuc6NA0D//zu3ZDv83+pA7CxwjaRYCqN5GpdO3IKBDGK
 2zz+EkR5NwJNLfZ3dgk4QZYgsC2GvHOYXMJY8E8agPCs5O+tvJ/a3Y/wosXpLc42Ttt5
 pgw5suznyZV1zJI56gU7DfmEFtwcpg+YwkOCZ0xiUaoLvWmLQRFd5sZAH43FsJxGLd2E
 z07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496797; x=1743101597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pMU0x5TrIGi1TlXMZD5rXGa9j1LnP0o62QpnxxI3Tyc=;
 b=FpLnUF1qZeexiXVC0PLiCk936sO8Po33bRIyy87fzdnN0uOXexX/9gGW0P81KODKcB
 JmydRSYYi6oJdexC8/607sU4HFxdqpMHXTq6TIDTU2ZJ4XN1+Q5JY7DTS9Gm71b3z6fs
 kimawcEsZggRtGWSrGHb6740IyDp2Vgidhnu7bv41ABvWHPQSmJ4zP7wkaLS/zigZX1m
 gxb5KWI/n3SpYTeK8QyU4rvSZjiWjmdILXGjmT3gp/LMQanFHvYkL/tn2hZlBJJrfKo+
 tfP1yySz7B0CPZiBnN0hkfRAJXxuN3wkXuuO930YikT7xLGkHXkdg8QVEbYCTCfyYZoO
 hzSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbFnRCyWxq+1I58qFtPSlzF61UMOp37ljRq2XvGRwTf18NIxcBopw5lObNOBaIU0vMEv6aiqbRj9OpbssenO5bkw==@lists.freedesktop.org,
 AJvYcCUg1J2gPDc88gyestXoLcI99mmM366cqnbx5/7p3jm0EG+Q1c3RTe0Cq5G6Y40xWis0vGvtapzt@lists.freedesktop.org,
 AJvYcCVjGr95SSJSjbMSsdxPJqIEgVPp2+x5z5297msKQXO1CWmip9QYqGcBFCqYfZmFtfMkIJ1UeG1iGrNRB3cNmg==@lists.freedesktop.org,
 AJvYcCW0A3GrSQbhd/n89VjXKuCV90Eq5MjbTE7osLH+ylVjTNUCvzQDw5tN1bMAUljCmo18W+kOPn6IXjZn@lists.freedesktop.org,
 AJvYcCXZq3lq7nSF+tXsK5SdNWP+Xy5Y8Mqmpzs3iIXfwo7XCFUwfwvXSI451ErHUX2kEhVLJJWYYzXfLU/e@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUh/cutyp/KVpSMwPONygjL5IB0d+Hbkm3Q2xsxdsNCvoiatQE
 lGaP/YjAKurUhfJOGgyuYe+w0mcH/m0aCJTD7IzKDURrUiOCUKFQ
X-Gm-Gg: ASbGncsTxO1To56+idPIMf/KyZF1o6Z+MdvvEFqtvQa7xGYGnu0wLwJBclP1Pb+VaX/
 WLAXgJ+l8kploVw540J2KHZ00rDAJMFmWqj49dTXDUuTRbhqo/yT61LP6Ag6sQtYATX9JryR3ed
 oulahhkpSJWueR8N+rHzb1FUkwIRKUGDyUqAo1zUzkerDMPQM+a7cjt1ZbXP87X6D9mT0CyvvLX
 nFzVHCS/QqsFFDVOw40ALlNs9PTw39dT7Helct0Vd+L+fX8FcsaZOev0WS93LP/v2kzss93AbWt
 eqKAvIHjFCuHpZzTlsa3mjBY/q3hHAlZwTlUYAi9DmwJtYD28VYryqXsaa8AxR7lNhSr7QX3pOB
 BBnjPVmfwtZwC
X-Google-Smtp-Source: AGHT+IE5FnFrhXl2OsaLefG5e0LQc4fASL3FmWcjz9fvpoJJMFl+j0awErZ0XrOva1EzRD5jexTdnQ==
X-Received: by 2002:a05:6602:c89:b0:85d:aba6:4f4b with SMTP id
 ca18e2360f4ac-85e2ca388afmr47078939f.2.1742496796745; 
 Thu, 20 Mar 2025 11:53:16 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:16 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 13/59] dyndbg: add 2 new _DPRINTK_FLAGS_: INCL_LOOKUP,
 PREFIX_CACHED
Date: Thu, 20 Mar 2025 12:51:51 -0600
Message-ID: <20250320185238.447458-14-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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

Add _INCL_LOOKUP condition to separate +mfsl flags from +t, allowing
(after refactoring) to avoid a needless call-return.

Add a PREFIX_CACHED bit to remember that a pr-debug callsite is:

- enabled, with +p
- wants a dynamic-prefix, with _INCL_LOOKUP
- was previously called
- was thus saved in the prefix cache. NOT YET.

This allows (later) to cache part/all of the dynamic-prefix for each
pr_debug that gets called.

NOTES:

dyndbg's dynamic prefixing can get expensive; each enabled callsite's
prefix is sprintf'd into stack-mem, every time a pr_debug is called.

A cache would help, if callsites mark _DPRINTK_FLAGS_PREFIX_CACHED
after saving the prefix string.  But not yet.

-t  thread-id. not part of the "callsite" info, derived from current.
    doesn't belong in the cache. it would be wrong.
    can be done in outer: dynamic_emit_prefix()

-mfsl  module, function, source-file, line
    we cache these, composed into a sub-string.
    they are "lookups", currently to descriptor fields,.
    could be accessor macros to "compressed" tables.

All enabled together, they compose a prefix string like:

  # outer   -----inner-------------------
  "[tid] module:function:sourcfile:line: "

So this patch extracts _DPRINTK_FLAGS_INCL_LOOKUP macro out of
_DPRINTK_FLAGS_INCL_ANY macro, then redefs latter.

Next re-refactor dynamic_emit_prefix inner/outer fns accordingly.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index c388ab05a6e1..82eabaa6e827 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -38,11 +38,13 @@ struct _ddebug {
 #define _DPRINTK_FLAGS_INCL_LINENO	(1<<3)
 #define _DPRINTK_FLAGS_INCL_TID		(1<<4)
 #define _DPRINTK_FLAGS_INCL_SOURCENAME	(1<<5)
+#define _DPRINTK_FLAGS_PREFIX_CACHED	(1<<7)
 
-#define _DPRINTK_FLAGS_INCL_ANY		\
-	(_DPRINTK_FLAGS_INCL_MODNAME | _DPRINTK_FLAGS_INCL_FUNCNAME |\
-	 _DPRINTK_FLAGS_INCL_LINENO  | _DPRINTK_FLAGS_INCL_TID |\
-	 _DPRINTK_FLAGS_INCL_SOURCENAME)
+#define _DPRINTK_FLAGS_INCL_LOOKUP					\
+	(_DPRINTK_FLAGS_INCL_MODNAME | _DPRINTK_FLAGS_INCL_FUNCNAME |	\
+	 _DPRINTK_FLAGS_INCL_SOURCENAME | _DPRINTK_FLAGS_INCL_LINENO)
+#define _DPRINTK_FLAGS_INCL_ANY						\
+	(_DPRINTK_FLAGS_INCL_TID | _DPRINTK_FLAGS_INCL_LOOKUP)
 
 #if defined DEBUG
 #define _DPRINTK_FLAGS_DEFAULT _DPRINTK_FLAGS_PRINT
-- 
2.49.0

