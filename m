Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 839DD24ECC7
	for <lists+dri-devel@lfdr.de>; Sun, 23 Aug 2020 12:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E448E6E49A;
	Sun, 23 Aug 2020 10:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896586E497
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 10:45:55 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id j15so2971597lfg.7
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 03:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N6N46LpxOxVN6dAnm9F7KtaktSmWE/xBhpj2MxaGLjI=;
 b=J5x660c2/IA/IV+ILWhui4IclOPYvqSTcXdYD4T6rNYSCqGqqQfyKGtQJ3av1telWb
 wgIKGaYkqZ3Z35H05g3DJSlEQ1IRnaiaw1ulgVEdIKIwpvFUY16YJseSkAGWBnxJ9OG4
 TvqXcosjeidil4CxpFNCmH22G0TdQ83/bpxz/c/3NUvrAKJ+PYzNNCn3BRQi/nsWGrbT
 k+oPduiycGJ2gck364w5KnYthB1VN0LQzpMTQAVmj4lhKpAO7q7Qd1/Be5nz7uUE06zJ
 TPKoWBxWi5D/QpPR+pfdxMJNIJk/T7/9k35NxdGjbKuo2a4EZC9n1JbMB10Mjc0GeW7w
 wxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=N6N46LpxOxVN6dAnm9F7KtaktSmWE/xBhpj2MxaGLjI=;
 b=FOF07Bk9L3/uJz+PLgNx5dIp9D/cA8YE2RfncLTKH876kTEJ1D3ClPKOGETO77uDE2
 E40cEWhMkMduJr+dIkW+On/t5LrXS3i1BOdyfkS334mWz+ArbvX/7DRNyNeLPXUBK/f8
 0mtwBX7CALqeglZOFbvK9ARds5ZWy7GteW8S4VVLAVswiq6LPICygEUlyMBtbtGuY5Wu
 U77DjR2L+RFeA1C/YKKq1rEpdOTpBjzfiQd4n5o48kGhikfrOOQu0eYn20kQCuwOa56x
 rcA4R07FF5IyVVikjuZiztMsTpq3gQXalau5uzVIBHJj//sKqzI9CcxeeyLKVhGnYu2O
 7pwg==
X-Gm-Message-State: AOAM532GbL150oozUeNTyGuwCB6HP6bg44QyAHgexiQz85xqO9za6e/S
 KSZ9386gPnM86jL8i9zNnU9W2Y1BG/eFdQ==
X-Google-Smtp-Source: ABdhPJxqyh/kD2Eec9HkAD0Ekqj986e6MT1i+8V2dC2ET3JQmabFWklihGxyRh/kTyz6He0XQOvoTw==
X-Received: by 2002:ac2:4d16:: with SMTP id r22mr422847lfi.21.1598179553810;
 Sun, 23 Aug 2020 03:45:53 -0700 (PDT)
Received: from saturn.localdomain ([2a00:fd00:805f:db00:2509:20d7:e461:9c16])
 by smtp.gmail.com with ESMTPSA id
 h13sm1516301lji.134.2020.08.23.03.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2020 03:45:53 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v2 01/24] backlight: Silently fail backlight_update_status()
 if no device
Date: Sun, 23 Aug 2020 12:45:09 +0200
Message-Id: <20200823104532.1024798-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200823104532.1024798-1-sam@ravnborg.org>
References: <20200823104532.1024798-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

backlight_update_status() may be called from code that does not have
any valid backlight device. To avoid ifdeffery and too much conditionals
silently fail if the backlight_device is NULL.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 include/linux/backlight.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 614653e07e3a..190963ffb7fc 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -348,6 +348,9 @@ static inline int backlight_update_status(struct backlight_device *bd)
 {
 	int ret = -ENOENT;
 
+	if (!bd)
+		return 0;
+
 	mutex_lock(&bd->update_lock);
 	if (bd->ops && bd->ops->update_status)
 		ret = bd->ops->update_status(bd);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
