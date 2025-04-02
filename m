Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE094A793F2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6FB10E877;
	Wed,  2 Apr 2025 17:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l9ZLuySY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E13810E878;
 Wed,  2 Apr 2025 17:42:11 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3cf82bd380bso909965ab.0; 
 Wed, 02 Apr 2025 10:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615730; x=1744220530; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GcpeXIgBKTB5NFbofa9/asJwSsA0oVZhqq9QNH8OPg4=;
 b=l9ZLuySYV87vlRxbEwyi25618qiqtlUz9S7E8CGPPaGmVlBOxgqMws9v1ix1mn7P42
 T/KkKZ4dVghZllG+a1qavQKRtT090TbuP7+wvp86NIimKcLL8rn7a/DSx3iaQycwdo9T
 +BVSmu5zqnuUwOqc89pmIXv/zXsKBekooeV19akoN2cwvmwIF5EwVYe/Q5zitmKGG+3N
 VJx6W3pgep0koYFQJVlOrGWHLNbOn2sODu9S1fWxWFTVvhHvzpeT7Auh68vJODrKE/ec
 bbhErU1eBXuQUrE/3jgDFT7aD5a1i4oor3cRI6mL/1JZvUBDLTr1EeEwRmKXXlAf5Nl1
 y5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615730; x=1744220530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GcpeXIgBKTB5NFbofa9/asJwSsA0oVZhqq9QNH8OPg4=;
 b=ljxMiX/ecDdQq9CUkN+jxSdxmyLC7xt2hzrXVOQH/SYtWrfALbF1Nym/IAoOcRkCP1
 BQ/WgjCcyFcPQ8ftzDmGILlE6ApJzpMuSdke0gOY3F49OfW+SVSwNDMkP5+jAuQSF1/C
 Z8fC4MJCCPCT6sbm6D7ZMOknT6+Zn3qVH8UOXvKUTizfJbphP3M1VxYhLZtY67fziQ/+
 UNXrExZQrDRPdMKwMq4lv7OuMH6vQMxFS3zlsora5ihZGmjwtTOBxGL0zxHy9c0W67z2
 9bqCSvFBClAcDXmX5l6DdhFoT4ZvWDNYKdEC58TZ5RDGEsUDytK6/BI+3C4vsC8TSdGs
 WH7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIK3ry8YrD8Mw10czPTeGgTWImRAcxeQldTey0uz2iwOIwdATaFbI2yY/7ZzSdHsaTh8tXO3iz7VMv7jsLIA==@lists.freedesktop.org,
 AJvYcCXYxcEO7ZOvBGR01iFHyEox4CCi01pSfVuZ40Jg/lITbWJEDrY46xieRiXGMkkqvSR9rtdisqXy@lists.freedesktop.org,
 AJvYcCXoP8eBBClivlbqvMV2uI96hPPSFBXSMaO8rMusFx9tvEUHc+fsxwIDUg9hUnZDbBbK7qm+6osyHBhp@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywt8/2axpOOmyfqQWKraoO75KtsclATeGD30nA56gdICUrOG3pS
 UXCc5f/hfHjVeeOu9w0O7+cXZEFKp5vHHA8kHt4AtJgp9qH2FiN2
X-Gm-Gg: ASbGncs1PArIdycwTXo4etVguJXNHfR+4KtBXUw8zJiKJZ+GAv01udillZEPoeFbmXS
 keb/pBRyV2W7A5fqOyM+wZGlrZrG4O269y8aXBwuMf95f3QquqAczC3W9sywGhaGukeAKJqLuDC
 nU4MtwB0DIwGLCb5heK7RxUYj4e9jes1dVodNw/wXKuf3fMMMbWyTGBrTqpIsqK+DQxgKp8Dan/
 VkjYOkAZ2ElVx6LqGuvjFqrK4i+2XRYCJCEgsjTZR074yKNaa+mO9wGH+a41eiq7B3dSHgn3sql
 wu6sQPznvoQU8UGeTZUGwrvOj0+1UluhsiRo4jPbE1IALGinrzSaemJT37wbVYoxdKLtvIKXkf1
 3Uw==
X-Google-Smtp-Source: AGHT+IG7YC+Vg8rHRD/pZ45k6AmgmMsM50hI2xsY+GPn38wgc2sLRnIWJcTpkNONdPZL6YQH7t5jCQ==
X-Received: by 2002:a05:6e02:3006:b0:3d0:4c9c:965f with SMTP id
 e9e14a558f8ab-3d6d55761b0mr45283835ab.20.1743615730610; 
 Wed, 02 Apr 2025 10:42:10 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:10 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 01/54] vmlinux.lds.h: fixup HEADERED_SECTION{,_BY} macros
Date: Wed,  2 Apr 2025 11:41:03 -0600
Message-ID: <20250402174156.1246171-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
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

commit 1d926e259d8f ("vmlinux.lds.h: add HEADERED_SECTION_* macros")

I flubbed the defn of the outer 2 macros; they missed the extra arg
needed: _front/_hdr.  Fix it now, before anyone notices.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/asm-generic/vmlinux.lds.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 0d5b186abee8..c9c66089ea2f 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -219,10 +219,11 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
 	KEEP(*(.gnu.linkonce.##_sec_))					\
 	BOUNDED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_)
 
-#define HEADERED_SECTION_BY(_sec_, _label_)				\
-	HEADERED_SECTION_PRE_LABEL(_sec_, _label_, __start, __stop)
+#define HEADERED_SECTION_BY(_sec_, _label_, _front)			\
+	HEADERED_SECTION_PRE_LABEL(_sec_, _label_, __start, __stop, _front)
 
-#define HEADERED_SECTION(_sec)	 HEADERED_SECTION_BY(_sec, _sec)
+#define HEADERED_SECTION(_sec, _front) \
+	HEADERED_SECTION_BY(_sec, _sec, _front)
 
 #ifdef CONFIG_TRACE_BRANCH_PROFILING
 #define LIKELY_PROFILE()						\
-- 
2.49.0

