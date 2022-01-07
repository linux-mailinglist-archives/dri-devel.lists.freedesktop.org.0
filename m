Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 703C9487260
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 06:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187AB113216;
	Fri,  7 Jan 2022 05:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F97113214;
 Fri,  7 Jan 2022 05:29:53 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id o1so3643459ilo.6;
 Thu, 06 Jan 2022 21:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CdkftQqQNv/OqkWYbExR0c5h8hkYftad3zXE6/ffMXs=;
 b=A05OlVZNEl+qPoFA0HUlJIfImnTZc2bA0RUaeqMLJ53X1friDFLgKSVSA6hmwwsy22
 tWI6wHkmVsrVd/coDCoALVwCK2ckhx/c7FGVj6bPB3CODaNSMK15IOakHnUWDYBrEASi
 zlGqGf3FtgUGoRvWM+zIm1gma8S0zNkWp4ptXQjJoS1HyRo+VZg1PNmhiR1UHSETBuAd
 2cUlAlMe++EBBBA8C2mZ6mj06cYagKW5LUyoZU98sDlUW4juW8l8i2u/KIn+t1RliDlf
 tbFKZ/FpBcQU7PK6RZoYCImQL/fk4OAWxlwRV4CxliXLLXSrUnRR23PbY/UKCbV4DWz+
 Kybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CdkftQqQNv/OqkWYbExR0c5h8hkYftad3zXE6/ffMXs=;
 b=4WZS0nO0AQZKWiQvh9ppZ2/404P2NHimUv0yh43W2KZDOd0G5Ysd/zSg1uQD3u2Bu5
 lFzWSz2AuIWqWqbuaRQMbhhXT2Jo5v4yIb+QHYJ9hq4jhbP1M5PvxyfJdSpCJOv+cJct
 mZhK/w5dKXD8lgOHAvlat2s8nH8HoV59L+gkmMf6A4w6QXQqER3Lyebz3GsP3B8sMB1e
 UpTz0aqg3O3QgvC/cd7w/qorUJDoQjsxA3g6swuoe+Q2uf4Vmev2g1EVCqixAinxFY5Z
 vXToYqb6l9sFsAl2CFU1BRpAdHnb8PBOgP3UeehvAYuGJSFDq/EIidWg4eQBacIV0++j
 /NpQ==
X-Gm-Message-State: AOAM530kV/2zGGP/GqjtaWuDs15sFhbLpBZTwS6xRKJLYsDo40HjwyZj
 M1MTqK4CfA3VLyv/QHgzclo=
X-Google-Smtp-Source: ABdhPJyUg6/UkVla9SknnWDUILQsZ44OvsYQsd/nvHiUBfrWChy+SNyC1BoBl8Avpv3Jww8vX10z9Q==
X-Received: by 2002:a05:6e02:1a86:: with SMTP id
 k6mr28045756ilv.223.1641533392219; 
 Thu, 06 Jan 2022 21:29:52 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id c18sm1843446iod.18.2022.01.06.21.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 21:29:51 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, linux@rasmusvillemoes.dk,
 rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v11 02/19] dyndbg: add _DPRINTK_FLAGS_TRACE
Date: Thu,  6 Jan 2022 22:29:25 -0700
Message-Id: <20220107052942.1349447-3-jim.cromie@gmail.com>
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
 catalin.marinas@arm.com, linux-arm-msm@vger.kernel.org,
 vincent.whitchurch@axis.com, mingo@redhat.com, quic_psodagud@quicinc.com,
 maz@kernel.org, will@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

add new flag, and OR it into _DPRINTK_FLAGS_ENABLED definition

CC: vincent.whitchurch@axis.com
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 257a7bcbbe36..e0c2d7c0938b 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -37,7 +37,9 @@ struct _ddebug {
 	(_DPRINTK_FLAGS_INCL_MODNAME | _DPRINTK_FLAGS_INCL_FUNCNAME |\
 	 _DPRINTK_FLAGS_INCL_LINENO  | _DPRINTK_FLAGS_INCL_TID)
 
-#define _DPRINTK_FLAGS_ENABLED		_DPRINTK_FLAGS_PRINTK
+#define _DPRINTK_FLAGS_TRACE		(1<<5)
+#define _DPRINTK_FLAGS_ENABLED		(_DPRINTK_FLAGS_PRINTK | \
+					 _DPRINTK_FLAGS_TRACE)
 
 #if defined DEBUG
 #define _DPRINTK_FLAGS_DEFAULT _DPRINTK_FLAGS_PRINTK
-- 
2.33.1

