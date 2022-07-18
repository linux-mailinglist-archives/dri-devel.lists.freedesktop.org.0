Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2456B577BA2
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:41:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7AEA9DA8;
	Mon, 18 Jul 2022 06:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B9CA9D3E;
 Mon, 18 Jul 2022 06:39:03 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id n138so7290180iod.4;
 Sun, 17 Jul 2022 23:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fn4wAUPertAH2IA5+xSEy3cch5p5d8c17PURO4Ajqk0=;
 b=lVEQWHyYITJ4+0uYGwdqAqAfCGK2lKAyEBowEO80UDUa+yolFh6p2B/oXUOlxcrFAH
 asOb3GWPCUAYO0XH1AHvIO2lLLkqWHxmoYhzJ2X5q8d9KFcuPZpV/zd1WFyZt71ggc2+
 aNVcJRuryddz7TzzoQCHl8i+Kold+tyg7PHVri56NVFpda8Umf1G1Vpxi6FVmtzwN5Wa
 tvzagpyuQdKudrbhdIJW2CMLjvlpq/K7Iue0wQBAGo+OmeFVOBb5ptCmeex5NtKn/GRU
 K2sRGcKYyfef6ZymA2lQ03b5Q8D5vS+YAprXMZJYUkQ4dR2jXAisUWYiebpQB+GLUUbb
 TfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fn4wAUPertAH2IA5+xSEy3cch5p5d8c17PURO4Ajqk0=;
 b=zqzOOm6jSf49mbklHa15I3YDIeYn/1iRkz+YztTU2rJfyveAg9f3yWSYpuQfP9KeSh
 R+aoHaIO8iWLT0rZxfQKSv7ESkm1gKL8G2DfCiVwbhUUobUfh7PevmaePiDcufRiTP4p
 BgVcAFo8OYfuroAjWX6dV+Vu11eAvoQwnQ2FhfIsQgBkCDwQ+c+WuJ3rEu5cOeLH9tkF
 XXwgSQ/zTkm847wGHhSi9uKAfBpWmirAOlfiN4MvYs1eLY0R1PVFEpYtVojdLJ3Ajj4Z
 YMK4Lm7IrhYlBrPy0jnDj5z+Q8G+hAOTtl+eJ9nb26r2zXQavfQkCvO7AP/utV/h3xFt
 EC0w==
X-Gm-Message-State: AJIora+JNZqIsvsQ+H9qbfbb4wMV0r1qzMbcsLK96Hz3O7DXJnFcMLlR
 18EEbe9YLwV5tbQ0NWU37NQ=
X-Google-Smtp-Source: AGRyM1tykn1JmsOayzYo37PBCvpyIS8w2tA9wKnPxwe6SfwoeynLFqfjrZ6UFH7lrTWm4G74oRMSzQ==
X-Received: by 2002:a02:a918:0:b0:33f:2a28:a2c6 with SMTP id
 n24-20020a02a918000000b0033f2a28a2c6mr13822689jam.8.1658126342980; 
 Sun, 17 Jul 2022 23:39:02 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:39:02 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 30/39] dyndbg: add _DPRINTK_FLAGS_TRACE
Date: Mon, 18 Jul 2022 00:36:20 -0600
Message-Id: <20220718063641.9179-37-jim.cromie@gmail.com>
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

