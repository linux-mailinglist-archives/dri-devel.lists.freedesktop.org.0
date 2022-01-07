Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CED487294
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 06:31:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1598211324F;
	Fri,  7 Jan 2022 05:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2630211323A;
 Fri,  7 Jan 2022 05:30:09 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id y70so5851472iof.2;
 Thu, 06 Jan 2022 21:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JbeTRv2Fyfg8UJiPWSnBwDsjkhtsGcD/brFxy1OI2So=;
 b=VK9Dj9vp/R6vihhAELn97CTPOQgU/Fn1YhQ4WuPOYiEBxoo0M5cBeUusxl5g7Ha4Ks
 WrSXQpzI9UTEbJuljMm74kc+SOYx4WA60VHSaWlMnqZLGSpzXGYHb5CjApMc8ayRHXdb
 WVxj63BzSSHT1ezgUPu83Zo54NGeKs9Zr8fg9VJ5Cce/XGIJIhdo3KaIQVI41J2/2Lf+
 ih/u+bokNAuNDPcsOTLlcmCFeGVo1AadQJrR31RrPEgAU2ShgFfYB6nhOEK8TtKNUXzi
 6mTbi2qAxMgfIuE5P3OOX5a39/63S/9+7gqCBnDd1OoaXvruf1pURBiPx2C3jbSLyZ5B
 2b6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JbeTRv2Fyfg8UJiPWSnBwDsjkhtsGcD/brFxy1OI2So=;
 b=BmjDXqVH5ZYFNEDb6uFGF7C9pcX+8PMg7Y3daCc7MRBTysNqxRIrgDGbDSaUjX0CiV
 /R9cwJeaJ8PFVwLApaU42/RcdFNEytf2TH+5EjNvjP9Tx7Gpu5DoqNUa3x7a4lBqG8Ql
 sHj0vSZ3eW9XuHox3rw8clezYfcsjEwy5U1GjcDrN9YKUR1/pWGkQ/IOGjH4xZaOiN+O
 qKBds/AeEKKVOJliimH3fK3R1TXkkIEwhqi1F+pDS7ZZ/TnvwNMDO5mVNtm5CXrk/ztL
 bhi5XwhbQ0fsDwuz9jK7ARsHHa4eQ9fMJlgExsNaVXBIzVkp1XGtXFOgSk2S4lgp56q8
 Hurg==
X-Gm-Message-State: AOAM531O7QrAOnF832hEcFXtct8//pLNsOGHv17Azn96M563JyvrUQeP
 55HN0NBGn8yyF+6GRtahjhg=
X-Google-Smtp-Source: ABdhPJyyRxeOryfv21hSwrmrhXKwCfWI/bo+N4N54ntb26BYYZ7XqFH1lAI3RsHnWdKPEMsyhDvqMQ==
X-Received: by 2002:a02:b603:: with SMTP id h3mr30604302jam.233.1641533408224; 
 Thu, 06 Jan 2022 21:30:08 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id c18sm1843446iod.18.2022.01.06.21.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 21:30:07 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, linux@rasmusvillemoes.dk,
 rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v11 15/19] drm_print: use _dynamic_func_call_no_desc_cls
Date: Thu,  6 Jan 2022 22:29:38 -0700
Message-Id: <20220107052942.1349447-16-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107052942.1349447-1-jim.cromie@gmail.com>
References: <20220107052942.1349447-1-jim.cromie@gmail.com>
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
Cc: quic_saipraka@quicinc.com, arnd@arndb.de, jim.cromie@gmail.com,
 catalin.marinas@arm.com, linux-arm-msm@vger.kernel.org, mingo@redhat.com,
 quic_psodagud@quicinc.com, maz@kernel.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Upgrade the current use of _dynamic_func_call_no_desc(), adding the
suffix and the category arg.  The arg has been available via the
macros implementing the drm.debug api, but dyndbg lacked a simple way
to represent it and use it until recently.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_print.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 8d6b74270c50..0c704610c770 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -31,6 +31,7 @@
 #include <linux/seq_file.h>
 #include <linux/device.h>
 #include <linux/debugfs.h>
+#include <linux/dynamic_debug.h>
 
 #include <drm/drm.h>
 
@@ -414,8 +415,8 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 	__drm_dev_dbg(dev, eCat, fmt, ##__VA_ARGS__)
 #else
 #define drm_dev_dbg(dev, eCat, fmt, ...)				\
-	_dynamic_func_call_no_desc(fmt, __drm_dev_dbg,			\
-				   dev, eCat, fmt, ##__VA_ARGS__)
+	_dynamic_func_call_no_desc_cls(fmt, eCat, __drm_dev_dbg,	\
+				       dev, eCat, fmt, ##__VA_ARGS__)
 #endif
 
 /**
@@ -524,11 +525,11 @@ __printf(1, 2)
 void __drm_err(const char *format, ...);
 
 #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
-#define __drm_dbg(fmt, ...)		___drm_dbg(fmt, ##__VA_ARGS__)
+#define __drm_dbg(fmt, ...)		___drm_dbg(NULL, fmt, ##__VA_ARGS__)
 #else
 #define __drm_dbg(eCat, fmt, ...)					\
-	_dynamic_func_call_no_desc(fmt, ___drm_dbg,			\
-				   eCat, fmt, ##__VA_ARGS__)
+	_dynamic_func_call_no_desc_cls(fmt, eCat, ___drm_dbg,		\
+				       eCat, fmt, ##__VA_ARGS__)
 #endif
 
 /* Macros to make printk easier */
-- 
2.33.1

