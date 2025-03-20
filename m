Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4295A6ADB2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EEE10E6CC;
	Thu, 20 Mar 2025 18:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f2PKK+6g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB4A10E687;
 Thu, 20 Mar 2025 18:53:39 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-85b515e4521so36864639f.1; 
 Thu, 20 Mar 2025 11:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496819; x=1743101619; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xYthOB5BI90Xc0sNqdHCeRWErBOeeonKxchWCKHo1mE=;
 b=f2PKK+6geYXUjcpAKg2c/6SuRyIWQL0IjBmhRsNCcHiWkd39i8PiPkLotSdtgNPhVV
 jdD083uAvlHqP0djt6B5Dquq72Wg1PglOMtKLyWhmHpGS/F46OgE/Qu+5ReyD7BMVky5
 Fc8zZVzrE8gKsTQ0Z3HqZCVogMBdNN2NMhQW8mZIiY219G5mgph1UrXH9jxCEQPwNGpO
 m2gxmzUA0CPVY827bRbu7SvWX2l0kjijJyfBbkCg8uD9ENJwm2+m1WOoPmHsLMq/IPlR
 sBdETZ1sC8pr07jPmYdFvQOYKbfO7wMe7fwqc+/4EALc4jDqCNJuPSHnOSmYiOvIWNp9
 4jGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496819; x=1743101619;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xYthOB5BI90Xc0sNqdHCeRWErBOeeonKxchWCKHo1mE=;
 b=kurVxJ2xkDAzsvl/VevJYS+exTCTPWfOO54f70v0Ucug11CdwiY6HYdwEPJMzXZimx
 mSuT/VPyn/7P5e2u5X+7BFKRJhkyxZO6mi4i+dPTYVWncaFN+yEc+P8KitTg6D59Kv4A
 VUiPW2mxlzcCtHukgoNyiM+W0m6K/LiKAzGq3vopnOcZy34kGGbJYUL+uEkXhoGpamlX
 MGdA/McTztzz7KitbJ+xffSsxkokXZaYnI3Ivy9q9P502f8vDQmrFE8KZl+vqiSPWPxs
 Vf4oGjUmKSmKiPmbOlxV6Izxdj3XdAirVhlgCSFCkAM0XJ1wzGmRcUsO3jkLBtTqbRUq
 H2Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaBRVajBaup5KxHQyUhSgOzyBmuVUJMXdFMUeCmJ/Wh5ZO/gLXHt6ZfPYjDvG42JTWoeDfVPx+1dTw@lists.freedesktop.org,
 AJvYcCUiVnLo50/5ZYeXrnpJx6iSo5++iT6QS02gEIBXE8B+4Hi6nasCgdYjOvJU/tUJUU4iIgIShIse/VtFieKBxw==@lists.freedesktop.org,
 AJvYcCVhOpOoZy1N6LoOxkt+824d7+CTNVy36EglVppxm7V5DCdHKIVB9CBZW5VeK6eV+KpOwBlc/Omnzkbt@lists.freedesktop.org,
 AJvYcCXUxvRuUCTekIEUxUZ6eMDcy7d4SckMyO7ylLQtE//VPTZtOz+yi5j45MhL+RZvo43d/blElJYsBRzCdIIw6EJlOg==@lists.freedesktop.org,
 AJvYcCXlWXVYtWr2+fKYx5NWr8ZgaXD6hY+xOFTIR8liTb0Rg8vLPieXvBHBadWvnnFqNG+XhkGiCPU0@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyv+FLwwVLZ/t5XpU0vx4wHbXVSobmCbKlW6CrfjdgFiNv7+J0a
 9r3/z+tgcnfBvE9lSQ/q6jLOyyAIQ9v/Mxg3dKBvJBs2CamAMxS4
X-Gm-Gg: ASbGnct3doq6y2cUzgiDPamXEbDv2KWAJpCjff2Sy1XPt+GXB8SNvkIvL2SQ76YKgSU
 NVadoC0IivVEzlI/fYyYc92CDRy1QfyQd++AcFnz7W0KT5ZrG7mG0V0CfTbuVshyUkI2N9sjtFB
 fr+HT8kCp3VTkMFme67My02BV9syyJRNktClStZuoldb4N0gc/5RFjI72yqHhh98lRkE7RG2VKg
 cXlyNcZCsy38aXWtUN7sZcbSuNPpv1gqhdI+3KcAWYD3ZXnXXT/aYtjAT2QFAkOVs5Ils2Q08Ry
 6Jenr0V14vDUqn6DWxjE5cGFHZ0uFfOFJTHgXp49f+ad0L7pMkeG62mjqtPUK9MfiDRUw9KYshe
 M4Q==
X-Google-Smtp-Source: AGHT+IG1ZN1PdCnSE/0Y/ZVD9TfRAzj/99OndZsm+wv+t2UNLScww8gqg4Ce5ePaZukZWiLiOE/e0A==
X-Received: by 2002:a05:6602:720f:b0:85e:1860:4757 with SMTP id
 ca18e2360f4ac-85e2c909634mr64857939f.0.1742496818693; 
 Thu, 20 Mar 2025 11:53:38 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:38 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>,
 linux-doc@vger.kernel.org
Subject: [PATCH v2 31/59] docs/dyndbg: explain new delimiters: comma, percent
Date: Thu, 20 Mar 2025 12:52:09 -0600
Message-ID: <20250320185238.447458-32-jim.cromie@gmail.com>
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

Add mention of comma and percent delimiters into the respective
paragraphs describing their equivalents: space and newline.

cc: linux-doc@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 4ac18c0a1d95..8e2083605bd7 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -78,16 +78,19 @@ Command Language Reference
 ==========================
 
 At the basic lexical level, a command is a sequence of words separated
-by spaces or tabs.  So these are all equivalent::
+by spaces, tabs, or commas.  So these are all equivalent::
 
   :#> ddcmd file svcsock.c line 1603 +p
   :#> ddcmd "file svcsock.c line 1603 +p"
   :#> ddcmd '  file   svcsock.c     line  1603 +p  '
+  :#> ddcmd file,svcsock.c,line,1603,+p
 
-Command submissions are bounded by a write() system call.
-Multiple commands can be written together, separated by ``;`` or ``\n``::
+Command submissions are bounded by a write() system call.  Multiple
+commands can be written together, separated by ``%``, ``;`` or ``\n``::
 
-  :#> ddcmd "func pnpacpi_get_resources +p; func pnp_assign_mem +p"
+  :#> ddcmd func foo +p % func bar +p
+  :#> ddcmd func foo +p \; func bar +p
+  :#> ddcmd "func foo +p ; func bar +p"
   :#> ddcmd <<"EOC"
   func pnpacpi_get_resources +p
   func pnp_assign_mem +p
@@ -109,7 +112,6 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
-
 A match specification is a keyword, which selects the attribute of
 the callsite to be compared, and a value to compare against.  Possible
 keywords are:::
@@ -133,7 +135,6 @@ keywords are:::
   ``line-range`` cannot contain space, e.g.
   "1-30" is valid range but "1 - 30" is not.
 
-
 The meanings of each keyword are:
 
 func
@@ -158,9 +159,11 @@ module
     The given string is compared against the module name
     of each callsite.  The module name is the string as
     seen in ``lsmod``, i.e. without the directory or the ``.ko``
-    suffix and with ``-`` changed to ``_``.  Examples::
+    suffix and with ``-`` changed to ``_``.
+
+    Examples::
 
-	module sunrpc
+	module,sunrpc	# with ',' as token separator
 	module nfsd
 	module drm*	# both drm, drm_kms_helper
 
-- 
2.49.0

