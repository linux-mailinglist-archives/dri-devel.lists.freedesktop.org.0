Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA1F52FCEE
	for <lists+dri-devel@lfdr.de>; Sat, 21 May 2022 15:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70D610E043;
	Sat, 21 May 2022 13:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A854510E043
 for <dri-devel@lists.freedesktop.org>; Sat, 21 May 2022 13:40:16 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id x12so9930050pgj.7
 for <dri-devel@lists.freedesktop.org>; Sat, 21 May 2022 06:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jAJixGMVFpkfIDAJCzoK7weTRChQrwecDtTtHlEWeJY=;
 b=iAupqJl6Da9K4mdDBSjhyNvzu9d8DtPVpD/ObNTjxPA3S5Zf1DpUTtJser3f9eeoeL
 ILND4Y963iRCGSzs3bZi6wWR/Tqhh55hxPty+fWYPW7F1kBkgZWMSzZsyntyo09IaUGN
 8Bh/JBA7VUKnJt9zBG4fvAbvbPpmo1RVteReREiX0vKyZ+dT0DMbc7rNZxonW+tE8wUy
 2sX/6nhDOozQBWat8Z1Xyo/nct0vK5KfHEut3M6fLlSpEXQp3lnXvX45FWZbI1xoQ/kx
 ltxGg2hRPt0FIFFkxwD9TCkm8zSq89zCcePWXqVe64v1MEvgrN6av8Q0Y8fqlgYRYOxB
 wCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=jAJixGMVFpkfIDAJCzoK7weTRChQrwecDtTtHlEWeJY=;
 b=ewteU+DsMAYnHSDEgsgrDzl7EZx9c3raPXt1/D2Y4qLfGznDRFe4iicUB6NCEKSA8L
 yox7L5pK9bo1DNVVwPkg3jkmFtwWWbhtLocCcrKvhA2rLa/EGbYVoBLPbT3CLDOcrC+/
 mC1itiR9Zn2PJwn2r9RBLzsNHL6ZvDHzxvF+JFwrdI7HaxjINklJxrTwveAicqefrxKz
 4vPqxsfzSWn6FZPb0FFEBNBnKyJDNEtzCCKUbbzSDcgB/VO3VV68KRXBFzWme559pP3Q
 hde0eGLMm43KZVSIUKmF9L0C/k4AXEmTGs264gqZ+Q665RoS9T8indQ5R0Cfwh59nz2X
 rkxA==
X-Gm-Message-State: AOAM530mB/ZK4tFK47g6ySTx9rtMyhvO1uYe+qQO6rt5IB1JjN0mBqko
 URrhp8hsaz7HLL88mKqpk9s=
X-Google-Smtp-Source: ABdhPJz4GnMORdXuaZ1sOjmvJusZNWoMQxRFOU1Xe3wCBa/URO3KBpWnCtLrWQTBLhjQF20oarbgtw==
X-Received: by 2002:a63:f545:0:b0:3c2:8620:af6b with SMTP id
 e5-20020a63f545000000b003c28620af6bmr12512655pgk.569.1653140416217; 
 Sat, 21 May 2022 06:40:16 -0700 (PDT)
Received: from localhost.localdomain (1-162-90-116.dynamic-ip.hinet.net.
 [1.162.90.116]) by smtp.gmail.com with ESMTPSA id
 y66-20020a62ce45000000b0050dc7628138sm3821609pfg.18.2022.05.21.06.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 06:40:15 -0700 (PDT)
From: Huacai Chen <chenhuacai@kernel.org>
X-Google-Original-From: Huacai Chen <chenhuacai@loongson.cn>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH] drivers/firmware: Move sysfb_init() from device_initcall to
 subsys_initcall_sync
Date: Sat, 21 May 2022 21:41:10 +0800
Message-Id: <20220521134110.2330908-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.27.0
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
Cc: dri-devel@lists.freedesktop.org, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Consider a configuration like this:
1, efifb (or simpledrm) is built-in;
2, a native display driver (such as radeon) is also built-in.

Because efifb, radeon and sysfb are all in device_initcall() level, the
order in practise is like this:

efifb registered at first, but no "efi-framebuffer" device yet. radeon
registered later, and /dev/fb0 created. sysfb_init() comes at last, it
registers "efi-framebuffer" and then causes an error message "efifb: a
framebuffer is already registered". Make sysfb_init() to be subsys_
initcall_sync() can avoid this. But Javier Martinez Canillas has a more
general solution.

However, this patch still makes sense because it can make the screen
display as early as possible (We cannot move to subsys_initcall, since
sysfb_init() should be executed after PCI enumeration).

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/firmware/sysfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
index 2bfbb05f7d89..aecf91517e54 100644
--- a/drivers/firmware/sysfb.c
+++ b/drivers/firmware/sysfb.c
@@ -80,4 +80,4 @@ static __init int sysfb_init(void)
 }
 
 /* must execute after PCI subsystem for EFI quirks */
-device_initcall(sysfb_init);
+subsys_initcall_sync(sysfb_init);
-- 
2.27.0

