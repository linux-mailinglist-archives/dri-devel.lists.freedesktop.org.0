Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF77B19200
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D9010E4C0;
	Sun,  3 Aug 2025 03:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LmDFJ46S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87BAE10E4B0;
 Sun,  3 Aug 2025 03:59:22 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-3e3d7b135c2so40562315ab.1; 
 Sat, 02 Aug 2025 20:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193562; x=1754798362; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WA9BT3YNmpiLht3dKaMvYWse8nMOfTq2XV6jwNxcq68=;
 b=LmDFJ46SCCQBkUxOY+LTkfKjvkYoDmVQnkLiZvQ9QuB8VPMEkLHW6zXkkjh3Fzr3t7
 7WVfJ4pJrMz2MhWpzv3930V3NuPxaHaksoaIO2mWRQSKLnkgAY56C4HAg9A1CP5BT0lL
 d754lc5U9F0PhpfuAlvOyelN5LMUh+p492KPn/1gx3zgt+eSyNsbhJombQGXdD/3+ZyT
 GNIlF8o3fKuV7LHRYxEdH3W+xlbJBPI9d0SLM4GRCpI2Xt/lpVqREW8F4tdlAazF283y
 WQbKfcSxo8NQDn7vke4hn5lwcTqBO8e+oefuy3+4KFKKb5DoHLPSggPxgzUcw8Pmd06l
 BGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193562; x=1754798362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WA9BT3YNmpiLht3dKaMvYWse8nMOfTq2XV6jwNxcq68=;
 b=U9ym9l20jMflO+fY25cIK9V/gRGL446cFBfo/jUdQC8vHc33dTevOLUhwCbo8bxAUt
 lxJuioO0Uzyc+6+mAs/lniwnZms4CJLqX8MpdHVTLgfcvTvGLWuHVMdai+s/OZLHt/Mv
 Jd9uFWMjk5gG6RSWFgrK0aOujoptacZkaE2/pEMQB+1fvfvhAOag37NFFN8iNSlyA/oU
 03JJwN5dVRDKl2zDZzpKzqWfZSTkXBPp2fsol3a+DTC9RBQ5a9wu9y5FaR54bBDt8ebr
 Od5c+fM2/Rpea1UWBDplPhfN3ec7DKJaS2m/f0ODF3ddZ4KwPx9mtDhIfIPLwSsZpnBS
 vvtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU13/YqaAyQ6XFg5s8/Eld5TOZd/Hp+23vGMnNFALLSxmVybRX+Vnk/YoTBPzaNAdVtSYyAn1HDbHRtSN7j4w==@lists.freedesktop.org,
 AJvYcCUMNDy/Wp4RD2+z8N0XZZXHvL3tJHzEitfwCRLXQYK5y1Hhf9/6wb2N+zxnRvQYHxJYJjWxMdBN@lists.freedesktop.org,
 AJvYcCWMK3hruot/Je1Wctjj34e2RvMoCRVpW5sk9B27qDptioL8g5/CYlCLjTKanPd1swhU/6t6p+mMml7J@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQT0NJoXDwi4EKE9wiaqx4+SJt6tPCzev2c6FOlW7WeZarP+0X
 0+qEzsik6EXrJoi6UQYXbbwHjGgFKAKXMslgERjJnpBi4wYM9n5/Us76
X-Gm-Gg: ASbGncvv1dMh7apNJaOcTkVFANjzbeb4Lln6ieFC7wolpn1IcmV6dx7/sLtkZiXpLYZ
 hz8AxZcNHPGliw5rKVSPu8l0SDldJkZde71gq62b18/MF7c5bdKyNbagH7WweM0s0+o0C8u0Oj5
 UBoaxFzcbcTYPodqHYFZ5xtWDGVNopKCSjG1diwqf6oGUHhcsAlpCmY/okEI5dX2aU8YPuZyPkL
 sdrrG4/25rlxuGV92kacylIZ+Q0EN0tD9Wko0QZlvbeFylzwy9uVa1tUHz1qn4aT3NoNdC+MqoH
 QqJAzUYDsf4pVO4MmE6OY1ed5cyRoB4KNXsdLAaoTUqRBC1zla9OlL3gUE72iYLCEIGjkMZDq3U
 Up6CqdbAWLbx3IUEUddFNrW2ZjP+lJeKq7oOfKlCXD6P0B5n+YNpvjB1CH6pRUZ2lVT+my19Jnu
 ImTg==
X-Google-Smtp-Source: AGHT+IHkYA6Ve5qjyBOl298LajPA2dLsLYiKeEEffa0px/i/mFWvep0iac35UJUfFk5w3QjlIsT70Q==
X-Received: by 2002:a05:6e02:2382:b0:3e2:a7a1:8cd8 with SMTP id
 e9e14a558f8ab-3e41611a075mr96109765ab.5.1754193561731; 
 Sat, 02 Aug 2025 20:59:21 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:21 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v4 32/58] dyndbg: refactor *dynamic_emit_prefix to split
 lookups
Date: Sat,  2 Aug 2025 21:57:50 -0600
Message-ID: <20250803035816.603405-33-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
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

Split dynamic_emit_prefix():

1. keep dynamic_emit_prefix() static inline
   check ANY flags before calling 2

2. __dynamic_emit_prefix()
   prints [TID] or <intr> if +t flag
   check LOOKUP flags before calling 3

3. __dynamic_emit_lookup()
   prints 1+ of: module, function, src-file, line

Notes:

With 3 only called when needed, print the trailing whitespace
unconditionally, and drop the pos_after_tid var.

By doing TID in 2, 3's output is cacheable in principle.

A prefix cache would allow de-duplicating the redundant data in the
_ddebug tables, and replacing them with space-efficient storage which
is not fast enough for every-time pr_debugs, but would work to fill
the cache the 1st time its enabled and invoked.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 40 +++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index c3e27637d9357..26261b5f99f05 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -824,19 +824,8 @@ static int remaining(int wrote)
 	return 0;
 }
 
-static char *__dynamic_emit_prefix(const struct _ddebug *desc, char *buf)
+static int __dynamic_emit_lookup(const struct _ddebug *desc, char *buf, int pos)
 {
-	int pos_after_tid;
-	int pos = 0;
-
-	if (desc->flags & _DPRINTK_FLAGS_INCL_TID) {
-		if (in_interrupt())
-			pos += snprintf(buf + pos, remaining(pos), "<intr> ");
-		else
-			pos += snprintf(buf + pos, remaining(pos), "[%d] ",
-					task_pid_vnr(current));
-	}
-	pos_after_tid = pos;
 	if (desc->flags & _DPRINTK_FLAGS_INCL_MODNAME)
 		pos += snprintf(buf + pos, remaining(pos), "%s:",
 				desc->modname);
@@ -849,8 +838,29 @@ static char *__dynamic_emit_prefix(const struct _ddebug *desc, char *buf)
 	if (desc->flags & _DPRINTK_FLAGS_INCL_LINENO)
 		pos += snprintf(buf + pos, remaining(pos), "%d:",
 				desc->lineno);
-	if (pos - pos_after_tid)
-		pos += snprintf(buf + pos, remaining(pos), " ");
+
+	/* we have a non-empty prefix, add trailing space */
+	if (remaining(pos))
+		buf[pos++] = ' ';
+
+	return pos;
+}
+
+static char *__dynamic_emit_prefix(struct _ddebug *desc, char *buf)
+{
+	int pos = 0;
+
+	if (desc->flags & _DPRINTK_FLAGS_INCL_TID) {
+		if (in_interrupt())
+			pos += snprintf(buf + pos, remaining(pos), "<intr> ");
+		else
+			pos += snprintf(buf + pos, remaining(pos), "[%d] ",
+					task_pid_vnr(current));
+	}
+
+	if (unlikely(desc->flags & _DPRINTK_FLAGS_INCL_LOOKUP))
+		pos += __dynamic_emit_lookup(desc, buf, pos);
+
 	if (pos >= PREFIX_SIZE)
 		buf[PREFIX_SIZE - 1] = '\0';
 
@@ -859,7 +869,7 @@ static char *__dynamic_emit_prefix(const struct _ddebug *desc, char *buf)
 
 static inline char *dynamic_emit_prefix(struct _ddebug *desc, char *buf)
 {
-	if (unlikely(desc->flags & _DPRINTK_FLAGS_INCL_ANY))
+	if (desc->flags & _DPRINTK_FLAGS_INCL_ANY)
 		return __dynamic_emit_prefix(desc, buf);
 	return buf;
 }
-- 
2.50.1

