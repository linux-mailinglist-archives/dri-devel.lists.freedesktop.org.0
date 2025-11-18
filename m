Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D36C6B92A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:20:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEAA410E51C;
	Tue, 18 Nov 2025 20:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nWQuscW5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A718F10E528
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:19:23 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-43380a6fe8cso39324815ab.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763497163; x=1764101963; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=soWf0YG/+Srs0WepiWrUk4JAonJuGIy1dByc0giWUH4=;
 b=nWQuscW5cwFx4v/Fj7f49YtYbkZVXK5SHmRYTsjNkBvn0l5rrqElUYtRXQvHEiWfRI
 IKMg+KW2//yDLb2smKJnx6bZvwWR2Uo7vcxjnSMncqs+dG7bBp0MRYAhVP+chFFJ5J9V
 H00E6D6cbofkw2QCTj73N78q74rgJCo/AzRZ+0hvcZCsQucJGhnaCXcj0fi3WdWXPq2Y
 Xu069rVtOExaBL2cmHEYTQmF42Z8xqdfThY8dO8Gn3+vQKR22oQt/oamOnOaooa5wug3
 pHTZzt0RTefHfLvi5KDfDaxHGm6twwNdemn07PxbddlnXY3pdzfNFx88aaNIudGKwsCQ
 qWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763497163; x=1764101963;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=soWf0YG/+Srs0WepiWrUk4JAonJuGIy1dByc0giWUH4=;
 b=Tb41GpB02jvud2Fbf73KviOLuHLCOBL/UyiXgtwq4ukV0HVPIRfe/MPrO8JB0pqOs5
 h7O0JbmA/YKYC+XpXScDR8ySh4tCkltuHp5a3HmW+UbavPdDbVf4NLEq7KEeo0j574nF
 swTSJ7CI66Kqt/hMyW8zXVmhQSSJiOoS5Y6mqBuxwbmv2olsyAvE/bgVidSA+CxVItis
 tV4ZB0LzpTK6/XvaN/9E38qZZILjPKYRuKAYas/Ws74rYwRawec7tGZkCEGRcOikXnCQ
 e4psZL6DYFll/4dP+CYra/uO+3L7q1FdoKPSUQ/+25/17TYWTl0oaQsZ06whDqdNQLf9
 9xAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD5opI0p8dwb78n2WCsknlSlBJSiMDqTh/e3tB0u6JVBu7dZlQiBAMgK4TMrBrpDS5AW7ufTmqXp8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqRfLWdXAyjz94fRh1TMkcpLXsYeCCfdeNd9zlPKSTygtC3ZeB
 O7vMKNgmQ8BobSHYOAVuuxePlm9IAZ8wOHvhsAy05YyXC7875hQigjlD
X-Gm-Gg: ASbGncsN4sybpPWMylYOoaFJENiOIiCqjUybQj0N/pyz+8dQRBrYxLvIEmJT9jLTX3V
 gXkNdFHzYUl69R/4+kGbeRK1Ul9Vyi+usg690tSDenQqWbVL3k5MZfosYHKOZPMUa0CZi4B0NJz
 xuCGsKybWNhy6R0Wupch4RQzgw8UpGLiaQQ9d7Hj/WtO8z/UcFxcyvp4zujjo+1+Ku0tUS9wGCw
 fb/Nqof4r4/gYnU0wBhVgcP6x/9+IJq/b40hQQSXpZG2WJ7peGB98Eefhg700zrl0THZ5SHV8Ss
 /eczZD6zC6VAPPjqv+YgqE4wZ4OyNxUyP6DIhDVoLY85l9Rr/vcsph0X3YjkboAIOQgkzKtHuTU
 60bLAHll6e5msv60PVwmAw/5JKcgODz1ZlHBmr0YTFyqs1DKlO8iOZ0vv89f44atzfry1ZTzn6l
 hNHQKXr1FEHyMjkzWqlXNbCyUgLLvsRtdemRozjkxLRp3yEJMbBlTbcS5je7t9n1npx9wQbmqXE
 ACa6Q==
X-Google-Smtp-Source: AGHT+IERLZKtgnyjJfukFnqSJ6ABnoOP6yH5yt9IMBZXmZSftzdAMsB5udG44uwdyeCiZqRzEkdbag==
X-Received: by 2002:a05:6e02:2282:b0:434:a88d:f80f with SMTP id
 e9e14a558f8ab-434a88dfaa8mr90252745ab.5.1763497162910; 
 Tue, 18 Nov 2025 12:19:22 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:19:22 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 20/31] dyndbg: change __dynamic_func_call_cls* macros into
 expressions
Date: Tue, 18 Nov 2025 13:18:30 -0700
Message-ID: <20251118201842.1447666-21-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118201842.1447666-1-jim.cromie@gmail.com>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
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

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
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
2.51.1

