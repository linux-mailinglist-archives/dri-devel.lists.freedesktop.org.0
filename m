Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 958516BAC0C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 10:23:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6E110E973;
	Wed, 15 Mar 2023 09:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48AB810E973
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 09:23:06 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-17ab3a48158so4071471fac.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 02:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678872185;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YIlDmOhHfzUv00AnBDlY+LrTEjW0fV7JmMX/NObYM/0=;
 b=jMwS04iE8sVc508yTw9rVt892u9Rx8nIWzDE5QGMJFsTaUDANTrUlNIsCG6yP5o3pu
 LDq2LfysPHaMkjGL3j9ODWL1DA3syFL55sDXFj70tGRHmR6FlSiD87AkrDjb3TPJqvjH
 NyvgT/ZmlxD/mplejH8J3tRK9SroSe/gXIiUXr4kjiN6w3+4Js+9XZjU4XRY1TGZtfC1
 V/xY2lkfNuaU6Xzsb1UT4vH9MPGKqL5KAkCNxKTSgucGvV3ratbp1Bn1e8d04rpmfE5j
 V49tuMg/Be72TYhgkZymUVkjjrEPICEUok0rFpXWcTx1OGVG8kIQctvpTa934wxhR7Bt
 nlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678872185;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YIlDmOhHfzUv00AnBDlY+LrTEjW0fV7JmMX/NObYM/0=;
 b=DE80Be3xIcexpZCicdlHphdYMOukN+pEOK5ewAQw/6TNaBo80LFIa8EVeh5ok6jboW
 WsF8mBAXDAhrjhBcqRaWjsNcTgal4BP/0Dn07Q4jMslWgo3aXx+OJ8gKXQf7x1dX4TXq
 GAja8wJGDvp123MTfy7kiYKR3+MLbQRANVF1z/W6ZmUVRLF2gvCtHkCaKzTnbu7Sordf
 7bFr9FY3lnJS+7I6o4tG2WGSS1SIVrue5TzPciXCtYSES30R6u1lZE5X2/Dw2A9oFCID
 2CHIugh82BN2tMJEBH1rQt7KmUHvxM07ejpRw5oO5YrtNWooTkB7dGm4QFP+SGVvXcJa
 1Ocw==
X-Gm-Message-State: AO0yUKUD85nw6BV29YJZWS9lvRMjmRC0ZOSZPbAHBCh20fLm8yMwLtcX
 VIA7DPqmk9K1eqPcI/3B89j17zEgLfSXBVxj
X-Google-Smtp-Source: AK7set8yMP0V/w7VMNSJFYtaq7Neq+UbYjbv3HegPrjxBGGWs99G4sBOjg56b7JQRhAyGxJeYGeFJw==
X-Received: by 2002:a05:6870:a446:b0:17a:c38e:823f with SMTP id
 n6-20020a056870a44600b0017ac38e823fmr1205376oal.51.1678872185553; 
 Wed, 15 Mar 2023 02:23:05 -0700 (PDT)
Received: from chcpu13.cse.ust.hk (191host119.mobilenet.cse.ust.hk.
 [143.89.191.119]) by smtp.gmail.com with ESMTPSA id
 v5-20020a056870e28500b00176209a6d6asm2037335oad.10.2023.03.15.02.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 02:23:05 -0700 (PDT)
From: Wei Chen <harperchen1110@gmail.com>
To: deller@gmx.de
Subject: [PATCH] fbdev: au1200fb: Fix potential divide by zero
Date: Wed, 15 Mar 2023 09:22:54 +0000
Message-Id: <20230315092254.1042615-1-harperchen1110@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Wei Chen <harperchen1110@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

var->pixclock can be assigned to zero by user. Without
proper check, divide by zero would occur when invoking
macro PICOS2KHZ in au1200fb_fb_check_var.

Error out if var->pixclock is zero.

Signed-off-by: Wei Chen <harperchen1110@gmail.com>
---
 drivers/video/fbdev/au1200fb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/au1200fb.c b/drivers/video/fbdev/au1200fb.c
index 81c315454428..b6b22fa4a8a0 100644
--- a/drivers/video/fbdev/au1200fb.c
+++ b/drivers/video/fbdev/au1200fb.c
@@ -1040,6 +1040,9 @@ static int au1200fb_fb_check_var(struct fb_var_screeninfo *var,
 	u32 pixclock;
 	int screen_size, plane;
 
+	if (!var->pixclock)
+		return -EINVAL;
+
 	plane = fbdev->plane;
 
 	/* Make sure that the mode respect all LCD controller and
-- 
2.25.1

