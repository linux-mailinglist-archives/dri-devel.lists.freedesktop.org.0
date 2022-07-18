Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 297D3577BB7
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85124A9DD1;
	Mon, 18 Jul 2022 06:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA3AA9D27;
 Mon, 18 Jul 2022 06:39:11 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id r70so7398628iod.10;
 Sun, 17 Jul 2022 23:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fn4wAUPertAH2IA5+xSEy3cch5p5d8c17PURO4Ajqk0=;
 b=o7vgfSWR3tXafZcKGJ2PU5eZke8oBMpgN41f7vPcuJu9SjMP4Gy+R1PwIGRS+kf4oR
 XVDioRdq26RcGdznP6sfBGYDayQggBA+xDLXrR/CDM3ZLE+zMGDYDWhYj6y1yLLQDkJ8
 5gMfvxhQ38hlr9OZ7GW5H7URvrilfFJYQSRMXgsJNyx1MWht+Q33xse4+DEE15rY+cpi
 zHh0BS46qQsIdZRWQbsS+h4HNVhO1lWX/KG/IXcbcyw4B/TPvGUxawA+oniEydZA0LAj
 Naoh8Hr2DmAVV0Yzbne+XB00NYk8dc4CmMk/fENs05Rgu+RMLwsvb9OiQ3KoLSIF2Zd7
 i0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fn4wAUPertAH2IA5+xSEy3cch5p5d8c17PURO4Ajqk0=;
 b=hIz8nHQzmVZm73A8K3UFh634WLO78tSQbnGw9F6j4s2+k29Qs7GmgJlbnzrn9vietw
 k2xHEcJTamyDExf4Sk0LfzFNevauBVKxpWp6gNycsrfhvFGL3JmA+h+snZZXxirtFQrq
 sirElZLzQh/ZOj3t7RKZ4xul0Ido0X+gA4QN+S9MtIH8mNs9YloG02otFWe2tu/E3+bN
 JgQsXv1MfxBMrv9vXkeE/E4krvJU/3z9gK2xKUIeipdfBv47q+xXyTeKa0HKM46ghGke
 jKMfGJVWNfBCDiD9LYmSfnNuDH2/VONLjDV3bXYxUHWCVpks1gcxel/t9etHd3fQ5C/j
 f5QQ==
X-Gm-Message-State: AJIora+HnB4BHsa6Y4sURhmFQc0zWh8sbY4T0ju/r7KgMDae6PPEkNC+
 DfK5p1mQ5onpSNQxCaVhnak=
X-Google-Smtp-Source: AGRyM1sthRluS88XcwBJ6kNFJ79WCcWGCAzXSDxn2CBt/+Aw8odkG2qQJa5+/CjMwplbpqfpuFq80w==
X-Received: by 2002:a05:6602:2d8c:b0:678:b8aa:9e92 with SMTP id
 k12-20020a0566022d8c00b00678b8aa9e92mr12291049iow.184.1658126350265; 
 Sun, 17 Jul 2022 23:39:10 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:39:09 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 32/41] dyndbg: add _DPRINTK_FLAGS_TRACE
Date: Mon, 18 Jul 2022 00:36:25 -0600
Message-Id: <20220718063641.9179-42-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 vincent.whitchurch@axis.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

add new flag, and OR it into _DPRINTK_FLAGS_ENABLED definition

CC: vincent.whitchurch@axis.com
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 38cfdd5c0bdc..0752e6c21c6e 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -42,7 +42,9 @@ struct _ddebug {
 	(_DPRINTK_FLAGS_INCL_MODNAME | _DPRINTK_FLAGS_INCL_FUNCNAME |\
 	 _DPRINTK_FLAGS_INCL_LINENO  | _DPRINTK_FLAGS_INCL_TID)
 
-#define _DPRINTK_FLAGS_ENABLED		_DPRINTK_FLAGS_PRINTK
+#define _DPRINTK_FLAGS_TRACE		(1 << 5)
+#define _DPRINTK_FLAGS_ENABLED		(_DPRINTK_FLAGS_PRINTK | \
+					 _DPRINTK_FLAGS_TRACE)
 
 #if defined DEBUG
 #define _DPRINTK_FLAGS_DEFAULT _DPRINTK_FLAGS_PRINTK
-- 
2.36.1

