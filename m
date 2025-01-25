Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35066A1C175
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E925510EA68;
	Sat, 25 Jan 2025 06:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xpkc3EkJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD0710EA70;
 Sat, 25 Jan 2025 06:47:14 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-844e7bc6d84so90833939f.0; 
 Fri, 24 Jan 2025 22:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787634; x=1738392434; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JsyGIKm5KVw15Lrl3SAKRhPe64hFlD++7kUKJ3Bp+EU=;
 b=Xpkc3EkJUKy4Cbb9+/XGkxjREUQsi0MtB0sCrZJDE/IKUBGYsv4qurwZt9e+NRTi9B
 w20J64rfXz2secC5G0tXsPi+IIVe33opvXekSkVNVZ4wfImk9y1OVBiBPZ4oAGwI80/P
 smZYi7iMbCmut06+cc+20qOLxdKL9VRW3zUGS/RF22U9TbAqRM3z6EZHCQK8QPzoKdhZ
 Luj5zQB4GDbTCFKv9wM4U3hisTSIVlBL3+RXN2ehCJ42VLRAyqKkTsFp3tzhdYJMrMDf
 hUVKHbk3FyQbfKvJ3dTbAED2pxwl6rEiVAfw9txUOoOORSpnJ0blTHWM+ONfEAfeYfHY
 YWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787634; x=1738392434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JsyGIKm5KVw15Lrl3SAKRhPe64hFlD++7kUKJ3Bp+EU=;
 b=YTUaAZ6daxOfnc8mPUT+gwJw1IZ7O5qF7n0mxK8lQCfpD7XemSt7rD+SbbMXH7PcKw
 h9G4aQ95Upciag0lkeeXa5FpiRVfB2snGnb/gr41de7KUS6PC3+ntLB4zavqL+kbULSZ
 alg7Hftv5MPIA2uIqu60b2oOtpg7yYbFVMua1YRyQMrqiF73zKQDRu+0LVZLDEug3Wt4
 dZg5rbweSpRwIxdaKZUOaUKyC+Lxt4a9zdGQDtvxW0NE872DNsaoSFh8WTqzltrnpJzQ
 6ZsuL86zhZKL/Xz4n528+Xlghpdrc7bBkuIaKMCOR/3ucU1i6OhkVsr+waGIBK1C4MGk
 7z0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUROz5ohq3DEHoJ5c8r5lNZPMo/kBZUvvCaxnj4NzLLhl09mCNzWqXC+qVH9DXX0GVNZWh7Np8LSnqg@lists.freedesktop.org,
 AJvYcCUTDIYD6oxxVAna8JoZXE/CuMeDK5eL7Uqe5I5O0DEoB5AF5QBTCepgSx9e0FIoQ15sLzRDEFQKowdQWEzQBw==@lists.freedesktop.org,
 AJvYcCUXrSPZCmeM9s/y+UzdbvPs1t+xwarMV+2Vd0KWkCX8I1GiVQyCxbUOHzq6HimMv2Os8ILDO5UENadr@lists.freedesktop.org,
 AJvYcCWgDfKaeSufNYJCI6lXBBZeZ/8T+zwwO5oxwv9OZdX3tbWikhl9MFIoOxdDntwIenzAWrFQ5m+w@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrY6DkCXwz+CB1bjtnLZ8KoKDQoGw1lf5sQiEKpW2IJObheMVb
 t9hkP/iMIIId/5lxdBxPdLgfnZPU7kvW1hpuJGMRcO+bQjh+/l+z
X-Gm-Gg: ASbGncuC+G4vUcNhFHft5YZ0OruBHW68IrLTt6OiCiPq4V4wRnqXcMFHIicMyvqidHb
 YyRO5v+KVnfglsSSOOE/xEWWeJNp0Z6zbJeccmWWuiIbg8tIlxfin0+vAsFYFde57xNjiCQrgui
 SkNtBMMj48+R4GkLB8AxML+xAbEc19v+ma6PxGd6L3SpGeEMwet8iVhMwT29QHg7etNuf9HmwVU
 3AvXDvCO+d3aam1cv8mOrNCAWzssUyXa3cTBLlCzo+9yJ4e0zzOIpNVs/DATR8b0+4b8UxkNLps
 jsPkkKITLKE8zhMdpAhr71JPOfIEUu3mTdDilg==
X-Google-Smtp-Source: AGHT+IEO16ggXmzyfYHgop4tbbYRoiJ+jPn2ZC4cmvbjRlCrlzH1udV42UlgxC08+7x3doqhyHdvvQ==
X-Received: by 2002:a05:6602:6081:b0:841:ab27:acac with SMTP id
 ca18e2360f4ac-8521e1a91d5mr552474239f.2.1737787633949; 
 Fri, 24 Jan 2025 22:47:13 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:13 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 34/63] docs/dyndbg: explain new delimiters: comma, percent
Date: Fri, 24 Jan 2025 23:45:48 -0700
Message-ID: <20250125064619.8305-35-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 391e40a510c9..c3537f8689e6 100644
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
2.48.1

