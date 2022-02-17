Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BF04B9718
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 04:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5436510E79D;
	Thu, 17 Feb 2022 03:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4964010E793;
 Thu, 17 Feb 2022 03:48:48 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id t6so2173777ioj.12;
 Wed, 16 Feb 2022 19:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/iB17natQD1MoZXV2qkvWvbusYAfF8+WZi2MjQWQu/w=;
 b=qTiK1jRdbDaFcQDx4cC+rxVcCZ8P6wZaDMePsvS5oqxzwhZzFsPen2E3O6rCOSxtiA
 DessncBQIZpwkAo1jwFHEpBRUQcGQnZT43gcngp/B8U5FSKO0ZddtRZQMM3LjLjHqNep
 LEoPZz3WvGyMJi1ikGUAIH4vGeMDAnyGlbLgB3iA+hGgK4WwVgbeSDeEHWoEm0NNGq2m
 jHhdwz8+UoyFVLVXJHDqJsFfBqOWCr4Cio0d+nnldQlSY/xWYMoFTt8VfNNAjwXryYvC
 IPVepN0QxjTudnVEUuK3Do+0p5JhpLLYNizjiCFkrbRHwAs142s4qaQi3OapvpHue2eI
 ALRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/iB17natQD1MoZXV2qkvWvbusYAfF8+WZi2MjQWQu/w=;
 b=pjpy1SBH1NBIvx7BGMo4usog20rZ0jH8fPBU+VPPckwzkrb8qeMQz5LdqGTO/c6Nzv
 9dCiagkGdn9bx5AAT2hPSCWN5ORhLxM92VLy0JOQ67o1Wvwe34ro1SgTUsJhCPS91Wia
 95UlkL3L6to+3vkpecCHahpPC/fFiUuJjzoljP2+xF4KZW1gCmxqVFVsVO7LNohRcLAa
 /2GQ+UzGxCoSUNXYzHjcgQra0BVxrr31Yw4RfpOk0p9J6ytlkKqOGQSEuFyaCiSvma2Y
 OqkjhEHsnd/hTg6yQ9c3P0/aBrgr6TkTBnAzhm4P4RStpktb2CQAg+RkRzRwWoeuhRe9
 GVTw==
X-Gm-Message-State: AOAM532Dq7DAsE5dg1kd6RG5qbp3wmKsRkBmSNwi2E6yTiLzFYhRiApP
 tuQyUiuuFF/ZzUkXl8GN5P4=
X-Google-Smtp-Source: ABdhPJxOywT+Bw4mOSbi+xuyE29k5QgNi8ekJ3xSmi3CrQ8bBxZkdSh03E3QGwSUqfaeD1zoTLwAxA==
X-Received: by 2002:a05:6602:2e87:b0:60e:9b40:cd62 with SMTP id
 m7-20020a0566022e8700b0060e9b40cd62mr647311iow.204.1645069727595; 
 Wed, 16 Feb 2022 19:48:47 -0800 (PST)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::1b19])
 by smtp.googlemail.com with ESMTPSA id l16sm1127874ilc.54.2022.02.16.19.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 19:48:47 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 06/13] dyndbg: abstract dyndbg_site_is_printing
Date: Wed, 16 Feb 2022 20:48:22 -0700
Message-Id: <20220217034829.64395-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217034829.64395-1-jim.cromie@gmail.com>
References: <20220217034829.64395-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hide flags test in a macro.
no functional changes.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 664bb83778d2..106065244f73 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -56,7 +56,7 @@ struct _ddebug {
 #endif
 } __attribute__((aligned(8)));
 
-
+#define dyndbg_site_is_printing(desc)	(desc->flags & _DPRINTK_FLAGS_PRINT)
 
 #if defined(CONFIG_DYNAMIC_DEBUG_CORE)
 
-- 
2.35.1

