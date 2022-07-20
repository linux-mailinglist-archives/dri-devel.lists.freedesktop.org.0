Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6FC57BA77
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B4C8F5C5;
	Wed, 20 Jul 2022 15:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 344358F47E;
 Wed, 20 Jul 2022 15:33:32 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id n138so13302034iod.4;
 Wed, 20 Jul 2022 08:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fn4wAUPertAH2IA5+xSEy3cch5p5d8c17PURO4Ajqk0=;
 b=mr8Gswd2cc9v8Du1Yt0yFJChjQwcyqg68HNE6uzMzghTHPFn4XaaL4TdOeWJPahiFS
 Vl7Laeb87dmYBvTk6CykO2Ln7CO1HOD8L+jXY6UkoLLtmxuRTo8IxIZCh2ScYRu+kViA
 fSXKt5JahrsBlJ5J3IHzqOevhlG0Bd/e/7FT/G4EGUFP2fKaFqt7pjJ06C0HVUDIsPi9
 xd/Wg1WZ2kU5EZWeXE9j6JgBNgI47AlWYFyhkTOO0F8pp3aYv4EYIumWnARXH8mqbjjt
 vfFgN7/k8dTY3BGvCRAEJ6LdShBYaf2Qsg5vQa0phVe3yjJrd8revxeIW+A1v1MZLCZP
 cb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fn4wAUPertAH2IA5+xSEy3cch5p5d8c17PURO4Ajqk0=;
 b=jEqggEM5V5sXnluMjQwxiltBQvgc83fNcht0a2tXP6fzDCGmx6GYmqpc3S+txL0yKi
 KTxtMAyBGCRYCr3yb7L5KNqY5OUBXIjQLFBxQuiMANP5kUvTDvmOoziPmcA83/xvHy/V
 hVrnEYfjsN395c1Gd1pYFPhHiUKMtgVImUY1xk/6KPJtgpVwSaPZ1nDGiniX9PzJfk3W
 TDhkCrCyQAg/9VyL6tji0llrGok8q4miY0C1+46Od3ysdw+xPTrKe6GuZJY96yjCT62f
 30qgOLrMSlbZDEtLDty8TaD98pvzTDSE4OEE0Kz1MJ7kgAgOGX2cZfdq3QERazPpTV6u
 IMHw==
X-Gm-Message-State: AJIora+E+kOJfZa/IwTIMKR1IrnqTg6jXfQ4GPDQzh14SdtSz64769pW
 npaSEFzTJOUGhh119VLV4yOAEdPuv0HMTQ==
X-Google-Smtp-Source: AGRyM1tdWCYkuCs8yU/PkEenGKltCcGXlTSLcX0zHEHz4orbRJWsgT+JmJ5MjoFau5Cy3o5Exe2jJg==
X-Received: by 2002:a6b:3f46:0:b0:67b:cd9c:4dc5 with SMTP id
 m67-20020a6b3f46000000b0067bcd9c4dc5mr16447369ioa.213.1658331211490; 
 Wed, 20 Jul 2022 08:33:31 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:31 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 32/41] dyndbg: add _DPRINTK_FLAGS_TRACE
Date: Wed, 20 Jul 2022 09:32:24 -0600
Message-Id: <20220720153233.144129-33-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720153233.144129-1-jim.cromie@gmail.com>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
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
Cc: vincent.whitchurch@axis.com
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

