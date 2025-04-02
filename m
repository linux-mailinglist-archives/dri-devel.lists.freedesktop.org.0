Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C5CA79424
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 223DE10E89B;
	Wed,  2 Apr 2025 17:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C/0/R564";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B766910E89A;
 Wed,  2 Apr 2025 17:42:40 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-3cf82bd380bso913535ab.0; 
 Wed, 02 Apr 2025 10:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615760; x=1744220560; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/waPSOuN2eIL+7EriTAVG2KiDua5Tq+VfuPCwO/f/0I=;
 b=C/0/R564LtFNdJgVG/ZITVYPGKXTUfYz74VquCW5G6vzNzGmgxMeUj9foApCGFEfud
 XXlFzp0NvdAYKHwR2BhLaPwTyaNsk6jq92woS0of97njn3xQanG5J4KqoTQTY7qN1L48
 OZi+HBGAxmWITPbZkSR4K7D4VSc6qh19qYGVng9VVLLTNydmVhvyExoATazRS8bhwLWm
 kCgmqvGpgrh3WcLmJkq2WNtJD1oGVyvYJevEswf0Huy5uvpFK+a8yKrpVBVXgrRJrXm2
 BPJMJGnhQSaOB4vW1OnS18aiz+NgBZWlZM2grYwzBL2Y0Brsd7CprU/NkfX2B8zOE2Eu
 YR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615760; x=1744220560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/waPSOuN2eIL+7EriTAVG2KiDua5Tq+VfuPCwO/f/0I=;
 b=g7Qmi/QIxxTExIg9Z12fSvK3imBl02lKUn5G0Jl7EPgds6uJ9/eUiTDB/08vv7XppU
 t5U9uZBEd2bwkvGegqR7HywjFlej0YYNeQDn78iALZq/4NZmqU1MLwroexCadDRaGD3W
 lfv2iQTy88QeqrwTfh2/rT8Bc0SobHjqiLaTz2JY2IrB7FY7PLf1Z7lKUOzaRpl/wdDJ
 rLEXVDGw9yQR5LRoqsD+6R1BawAKTXoB21Msroq7h9iG7akQsAAhv5rHUX9GYflkbfpp
 a5W60j+g/hvUK62i2/+5x/LyBK54uhZk/k1h3U65pYzyHEhV7CN8Hhj4JCq73cTodBZF
 87+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE32awE8decYqxKW/ji7fE00/9CNoKvnpnzrpy8ogkF9f3MFjL/crObENSbv3/5sDwBlV5aI5C0q5K@lists.freedesktop.org,
 AJvYcCXLnBc2MY/ffllXzcZGp+UPbUY9rM2cPS4Uq4xUovBtpMqBr5ZeY1abxzzLJVxcZd8frLBm8W0g@lists.freedesktop.org,
 AJvYcCXlFsBdysFrFwdz6Ac/b9u6snIv8X0qGTKtPFx5aGRF+2OeIYCIa2PN1AR9Ny4nmj7pQleckIUMDmv+C1LnvA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZuEi4RTy7Y0Zwz4Zn+D+FbsmSlDmWIbUX5iu2vBoMb5SmNhd6
 yBppSEpT0M9BTXcmW0+NZjUCe/xTOnZNsvDEZ+dP5A8TyXvDZ/O9
X-Gm-Gg: ASbGncvISMYPf53l7B2Vibkl5xSQL+ca0wfAVVpoL/fzYpio/AD2TD3FiKIVocQuwqq
 +aW3E0xbMQ0JjjLTyLhl4pB+9hN8js6OU136cZq2I4C9nUgmz3GGnm4+f0/VzJzpjbBr4cvQAjU
 kMFTGPRVi+nNKCUuiutHy22DI3MKfKj5c5xR/4unic+4p+QF8d8veq2QSjHVIqOq2/hgWr6Jis9
 lAcjw9N+yLVQGJ2tEWBOu29rTApA0bjDqaQrpp6Pe6B27Ic1xaI8srGkp3ISoppfk7zLNCKs3t1
 F+73AxnKGXpDKjiBtUAoPn7wGUaRxYQkbIP/AkU9YazRKdEM7n3lpAzbFnPXfoXySTiSbj+amCS
 L2JQV4AwrbpCm
X-Google-Smtp-Source: AGHT+IG19in7YD9+mh+jCwJ3JHA6ycW6ni6Gib0Ldr3L9sgEpAkmq214gUIhXmK9w5BqErQZ9ZspIw==
X-Received: by 2002:a05:6e02:2587:b0:3d4:337f:121b with SMTP id
 e9e14a558f8ab-3d6d54a305amr33630345ab.8.1743615759986; 
 Wed, 02 Apr 2025 10:42:39 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:39 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 26/54] dyndbg: change __dynamic_func_call_cls* macros into
 expressions
Date: Wed,  2 Apr 2025 11:41:28 -0600
Message-ID: <20250402174156.1246171-27-jim.cromie@gmail.com>
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

The Xe driver's XE_IOCTL_DBG macro calls drm_dbg() from inside an if
(expression).  This breaks when CONFIG_DRM_USE_DYNAMIC_DEBUG=y because
the invoked macro has a do-while-0 wrapper.

   if (cond && (drm_dbg("expr-form"),1)) {
      ... do some more stuff
   }

Fix for this usage by changing __dynamic_func_call_cls{,_no_desc}
macros into expressions, by replacing the do-while-0s with a ({ })
wrapper.  In the common usage, the trailing ';' converts the
expression into a statement.

   drm_dbg("statement form");

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
---
 include/linux/dynamic_debug.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index ce221a702f84..2d87cca27544 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -337,20 +337,20 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
  * (|_cls):	adds in _DPRINT_CLASS_DFLT as needed
  * (|_no_desc):	former gets callsite descriptor as 1st arg (for prdbgs)
  */
-#define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {	\
-	DEFINE_DYNAMIC_DEBUG_METADATA_CLS((id), cls, fmt);	\
+#define __dynamic_func_call_cls(id, cls, fmt, func, ...) ({	\
+	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);	\
 	if (DYNAMIC_DEBUG_BRANCH(id))				\
-		func(&id, ##__VA_ARGS__);			\
-} while (0)
+		func(&(id), ##__VA_ARGS__);			\
+})
 #define __dynamic_func_call(id, fmt, func, ...)				\
 	__dynamic_func_call_cls(id, _DPRINTK_CLASS_DFLT, fmt,		\
 				func, ##__VA_ARGS__)
 
-#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) do {	\
+#define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) ({	\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);		\
 	if (DYNAMIC_DEBUG_BRANCH(id))					\
 		func(__VA_ARGS__);					\
-} while (0)
+})
 #define __dynamic_func_call_no_desc(id, fmt, func, ...)			\
 	__dynamic_func_call_cls_no_desc(id, _DPRINTK_CLASS_DFLT,	\
 					fmt, func, ##__VA_ARGS__)
-- 
2.49.0

