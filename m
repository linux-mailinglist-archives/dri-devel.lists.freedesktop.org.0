Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 869CEA6AD70
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B373710E6BC;
	Thu, 20 Mar 2025 18:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qwz9dQLF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8464110E6B4;
 Thu, 20 Mar 2025 18:53:18 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-85db7a3da71so81499939f.1; 
 Thu, 20 Mar 2025 11:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496798; x=1743101598; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I11xVBXKQ+hF/QWDzrpW4DMDNxkmWPkILnOV6Dv+FVE=;
 b=Qwz9dQLFaN2KKWM3oOtj/LTtD/+54QFZR8YtGRQsVxi6ebCZZEtw95eM7c5BT9pThj
 hjWZ07d48yypctNnS7O0UMD1ggTrOcHKuE+hXI/VM5LBeEESEipm5BlscESI/xSCDNoj
 9eZk0tcrER3BwDsHH5yxiGqO6eMlMC8ODT2bTWIPJ5RUCPSI3Kk9toe+/cxlVuJRn2OW
 R9f4oCMJ4MXGX1M3cl035lBbaSAPbzHFP4tCQ26sm7iGLaPigOCkFQdIrd7FuSS+ZJAj
 7DHbwNubBRLa0LXqVfBxr6JktUZ2Q3a64dD9sAsuLQK8we2OaNVSfuKVAAOA1M5CNSHx
 PbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496798; x=1743101598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I11xVBXKQ+hF/QWDzrpW4DMDNxkmWPkILnOV6Dv+FVE=;
 b=YB9I0a/MmyADuuH73472BRROpA93WiYrkf6nwUS7Pmp3V4IMoi2rOgst798CQ6Kwdy
 fI0Fuq11k43kMo5gNiJSJvmMg4fCwGp38HGE27zO4zTGW6Cn2pAc3a2N6+K6hxBvAyB3
 DXv6LM0i8Sd1r8Uwbs9/kkJEg269Y2gf3+cK4gZoelqv27AW46+ztxGdmKvGfEgOKR0d
 ++ETHh4WcnJ9uR532h7lbeWbptrVZy+VR9+/W/VoWngtKA6PvK9UZRWNTsIlv0OFDi2p
 LfbO5+ThWCykDUYsULOVv6avBEuw7lIVo8uqN3ZDPP3M7mBtD/+X7/VhU76G1AnLCm5G
 C3Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkTfRg+0BnCR05qrwTxeeF4H+VKVEHmOCWYMNtZCvNnPLhImD7gU7TUgECdiA0S1s3dj6ITfCXOgbK@lists.freedesktop.org,
 AJvYcCVLT4+5ow47AIIxYeXsdhcxuQzvWNMCsDTMUZ+35P5rSs7K063eVlqSr+Frnzo5pSAERYEGAEeOAKQdHr7v89BLYQ==@lists.freedesktop.org,
 AJvYcCWn9cpXiFhjP63q9EolBPPwBIpB6+N8NwO07T/EyWJcNea96GHTlpB2U9Uw316c/n4+MvWkUOw+lYoFwOTY/g==@lists.freedesktop.org,
 AJvYcCWuFRSxTBDf/OcEPOoLVC45KZPcXNcd5vtQeL3rowJuhiaiCTHNZW2mzgIEU0p+PjD692WhPGRX8Vyq@lists.freedesktop.org,
 AJvYcCXfWSb/K4sBQOcX/8tva3jJPvNnRAXVjgLJSKFnBg9kBSLyXXdLswTlv9KtwkHGccp8BVAwiOJP@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNkYftmIUNc7eqy8PCu7SSMYG6XxY433v5y3r6adE0FoR4lTPm
 F91UdpY4ynDi3WLsqsfWJZNiZgSqZ8ILO8AQg+JDFOiXyNkTyZeY
X-Gm-Gg: ASbGncvgkf92gh2cwdRCrtAwV5vQrp8FkuVshYZfeKpIzuqJbIwLxNSz9+bBgFT+5AS
 q+/yIahSuz22gbtOe45o5VqqzkP0xGuFCTlikW1tgbxHAH2AmOa9Jf6aMAQ1wvoEWUmZb04eD3F
 5BkFq3WYDWoR1FAfD7Jk8ibIMCncsfzvVyISpn/X282uHkEFo40tNnST9o89wNKUft+9+CBr8Ek
 ig6SXvinEDyi2qMZOOYxObOQsUKdcKVgUpdXqIRv3Qx1t+sApiznTrnIZqIG7zoEVQRxLp8xNTj
 1IWZ35bDX+aAD682chBQHFx68pb+ReGI+yI5qTFK5sFBejEpNFZR9zLfQyUXKsjcpFL+qIZET7l
 qBw==
X-Google-Smtp-Source: AGHT+IEtCf2Gpyn2UFZqee/mhr53XbcO/kcuDLQe2NGqup147/L1yuCpY56bd5EokVyHN82kmeirhA==
X-Received: by 2002:a05:6602:2988:b0:85d:9f44:4421 with SMTP id
 ca18e2360f4ac-85e2cabfc2emr39548439f.8.1742496797837; 
 Thu, 20 Mar 2025 11:53:17 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:17 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 14/59] dyndbg: split _emit_lookup() out of
 dynamic_emit_prefix()
Date: Thu, 20 Mar 2025 12:51:52 -0600
Message-ID: <20250320185238.447458-15-jim.cromie@gmail.com>
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

Split dynamic_emit_prefix() to separate out _INCL_LOOKUPs:

1. keep dynamic_emit_prefix() static inline
   check _INCL_ANY flags before calling 2

2. __dynamic_emit_prefix()
   prints [TID] or <intr> and trailing space if +t flag
   check _INCL_LOOKUP flags before calling 3

3. __dynamic_emit_lookup()
   prints ONLY module, function, src, line, and trailing space
   TID isn't "callsite" specific info.
   result is "cacheable"

Notes:

2,3 are gated, only called when theyve something to emit, so they just
add trailing space.  This obsoletes the pos_after_tid var and logic.

__dynamic_emit_lookup() adds line too, so the result is "whole".
While this would enlarge a naive cache vs add-line-after-caching, we
dont even have a naive one yet.

And some clever indexing on store() might be able to fold the flags
setting in, such that the prefix stored with +mf flags only (-l),
could be returned for all pr_debugs in that function which also had
+mf flags. While still supporting +mfsl prefixes (with cache
expansion) as they're used.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 40 +++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 663c125006d0..f7ec2365ab40 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -850,19 +850,8 @@ static int remaining(int wrote)
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
@@ -875,8 +864,29 @@ static char *__dynamic_emit_prefix(const struct _ddebug *desc, char *buf)
 	if (desc->flags & _DPRINTK_FLAGS_INCL_LINENO)
 		pos += snprintf(buf + pos, remaining(pos), "%d:",
 				desc->lineno);
-	if (pos - pos_after_tid)
-		pos += snprintf(buf + pos, remaining(pos), " ");
+
+	/* cuz LOOKUP, we've emitted, so add trailing space if room */
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
 
@@ -885,7 +895,7 @@ static char *__dynamic_emit_prefix(const struct _ddebug *desc, char *buf)
 
 static inline char *dynamic_emit_prefix(struct _ddebug *desc, char *buf)
 {
-	if (unlikely(desc->flags & _DPRINTK_FLAGS_INCL_ANY))
+	if (desc->flags & _DPRINTK_FLAGS_INCL_ANY)
 		return __dynamic_emit_prefix(desc, buf);
 	return buf;
 }
-- 
2.49.0

