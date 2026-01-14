Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 730D6D1C063
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 03:00:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B366510E5BC;
	Wed, 14 Jan 2026 02:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gBw9jC+o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F5910E5BC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 02:00:04 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-7cdae63171aso6074314a34.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 18:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768356003; x=1768960803; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kgJaffb+G8M2IXpwFpfYggq/3ogV1jI3bmNBB+yiGR4=;
 b=gBw9jC+o/U3dwd/gxv+hKV2TV578idmU6Qk3ngKkZ4I0+SUNAZSaBRKltgZyPyWqop
 jvYqTSvIiaN5gI++DqKImSzFqcZFM8U9ICJu69AOIa0SCsot3j3SuNvSWIoOrjbZktWn
 iJllNWLoRdmr7wSIAyTAV7aJ1Lqh7BCt8GlDSfE6I03ANdhiMGFW1I+ebongLkQj76If
 Nrqei6nvZDYa6DM7sCxqLKG7mU5W5s0H+MtPkiTyTC3NBwZwhYrNpfu2k21tH3C8KiVS
 cbzM11S+Jp7oEENZdiIY+A5OeqIUgZ+4icBN9kzfYi7qzdCbQ+phVIMWu0l0dEIiIv0B
 c+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768356003; x=1768960803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kgJaffb+G8M2IXpwFpfYggq/3ogV1jI3bmNBB+yiGR4=;
 b=mqNqAUzhz012ggRvlhIOGjnutWsysVlNagcTQiNFaz1qtz1fd97IYQ4E3tAqBJlnJH
 oOnE5lCKZPI5BiDh+HT07RuyY/YA26RWlX7qE8DS7hZyaD09rOgra4QwgK2nudZeSqLM
 Rd7/NRMVeBRL/erMz3MOXByT+DOFjun2Aq+GH/o6jEgqILVxXtKduGb+pOHaU7EtmhxI
 livbIxC5xebJTph918P/dmJx01aKbhRBrUF2qdmVHnrPFH3fUwhZNQqVN1ldG+0doLmY
 phj+0YG0erLshlpvXDVvWVAKx+4wEzQrMe8wvxoZtPFr6CJHbuTso/vVLUtZwTSgH2Ww
 e++g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd355d36FppVNuOqBKHR9LyrZo9e6aE0+63Bcx0vIGi7iVQ89CjMlkuXH+GAWzq31wSOZN24ERZ4g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUVauHK8FzD46izyErle0t284NYo1lgnDljV/bndlMInrSSIke
 gEbN+A4h25AAhw7lcp7l9M7XDS6dYIkLIjY59H2VS3F5PAx+G9keHRe1
X-Gm-Gg: AY/fxX6avqE/ZOAL09eCvwOwy6iN0CB0cLOddeDoIg+jAiEA/iM0TZ2BjZ5Hw9i/K42
 9X0Q/1Qmw0WFGti2R3q+VzRxvaf6DnutRnUD8KwdmqXpVJIEmPMzQIsHEPLl2WxG+qb1y9iEByd
 OO3PyN0y+YxTmc6JJO5zXDwq4Ju/sMTFqEYq02sFDwPBND89F6l3PkjWVgGdGES9sOAEatjC1/d
 mM+RKD9chX9NWxuOCCRUd8eCZmtqA1vDKh84eClq48cvs5h4a0wTDGedMlvIBJ6l79r5IsmAz4C
 gWZurf9y+hGrxjh7YQZ94fNaAmwZKwI+6bnKcQTz6qEucb2bfGNfyvR4YlGBXil4VS8PFVLl0a5
 6+nhAqgre/mQaXw6SDThwwS2urOeWb5oVKLApMCJ5QJvXk8ha/hCFfnbcdEPVRMnIJiQPSNosb8
 pVXmGndoC3s53w89JwRIczPbiRazHpBtYJ1fV2SBA50iM3Lx0=
X-Received: by 2002:a05:6830:3110:b0:7ca:f639:4be6 with SMTP id
 46e09a7af769-7cfc8b29b3emr1059472a34.19.1768356003373; 
 Tue, 13 Jan 2026 18:00:03 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 46e09a7af769-7ce478ede43sm16651614a34.27.2026.01.13.18.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 18:00:02 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>,
 =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Petr Mladek <pmladek@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH v8 20/31] dyndbg: change __dynamic_func_call_cls* macros into
 expressions
Date: Tue, 13 Jan 2026 18:57:36 -0700
Message-ID: <20260114015815.1565725-21-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114015815.1565725-1-jim.cromie@gmail.com>
References: <20260114015815.1565725-1-jim.cromie@gmail.com>
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
the invoked macro has a do-while-0 wrapper, and is not an expression.

   if (cond && (drm_dbg("expr-form"),1)) {
      ... do some more stuff
   }

Fix for this usage by changing __dynamic_func_call_cls{,_no_desc}
macros into expressions, by replacing the do-while-0s with a ({ })
wrapper.  In the common usage, the trailing ';' converts the
expression into a statement.

   drm_dbg("statement form");

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index d543b84d447e..c4ebbccca5d1 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -217,20 +217,20 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
  * (|_cls):	adds in _DPRINT_CLASS_DFLT as needed
  * (|_no_desc):	former gets callsite descriptor as 1st arg (for prdbgs)
  */
-#define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {	\
+#define __dynamic_func_call_cls(id, cls, fmt, func, ...) ({	\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);	\
 	if (DYNAMIC_DEBUG_BRANCH(id))				\
 		func(&id, ##__VA_ARGS__);			\
-} while (0)
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
2.52.0

