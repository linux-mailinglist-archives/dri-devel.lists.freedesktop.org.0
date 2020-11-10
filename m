Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD282AE459
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 00:47:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F1089D64;
	Tue, 10 Nov 2020 23:47:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C626389D63
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 23:47:06 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id b17so4197283ljf.12
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 15:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GSgt/pPBiOJZ6llJdG2JMoW9+H1DFAY+cbBM7SnOX6s=;
 b=YC3lkdEJ3jzc+Wi6dNJdRwwt0CgK2Ay+vzqMAyNvVymYQu5s5jL/Xf2/5+16rxfAF8
 7OHX3EAwWqMgrU6MGDtPx/z3icV8zckmYbUivHsWGu4LsOKHnR5dCqJYAiVVpX5lpa4j
 pY9tjHJoTs2KtmeGJzhpuMG3BdREhQ0nnMUct7GT+Mx0TQEF69OHpD++QQePuXgrxGsM
 edb6Ng8x/WK13sgBapkwT4uElVBJ+D1ci1nZwVSTfZ10tMiu+VjGgMbvdngYqKVWeVZp
 TYmIofOZI6LndFHOkGBgo2hl+TanJnDtchqILKrWYq3s8Fox/8cxc1Av3jUxjzOQyEvu
 55IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GSgt/pPBiOJZ6llJdG2JMoW9+H1DFAY+cbBM7SnOX6s=;
 b=jFsixtZmLg58XP+rrHexf2FANAtAuGCGHbv49eYYVG7ZwY6upGJAMoi57tJYcd062t
 /pKf7wPyFNDpgApcyKegu3rIk4B8nFgJt/sJS8jVew0DWQdrdb3fIwRSG9PgdtwtYIJ3
 UusDuAZ8HK89IO1ZN10C1lAzCI9a1q6riFa8+ULCrQ8XZV1S9PM2hwq9QUrkjmwY+efR
 ApnNHmV3XrTTgyN2Ent0YoVmWqkRawqzDxeP/T5/+tpJ5MV9+007ovnHg47Yqo7jPX7M
 6XWeA1WIm1F4OHsqUygDLePrfR0oBNGUAA0+NqX6YQIm00EGj45P7uRouGM4dssKnFw+
 ussQ==
X-Gm-Message-State: AOAM531QlyEHAvEbXmQUfNHiMb8BuuTP2Ms9+CGeJ2mzsS29jvCaS9Nt
 0LRGLy6tl4YCS+PRVfUpfEI9G6Se+qPGtpKX
X-Google-Smtp-Source: ABdhPJxsgdAc7zos0+Bo9IFM/D2bfc33il0pXf61SW91nFotffpQKHyw3bhTsjmetpaRJIEQS0IdrA==
X-Received: by 2002:a2e:9798:: with SMTP id y24mr8619126lji.341.1605052025204; 
 Tue, 10 Nov 2020 15:47:05 -0800 (PST)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id y65sm39883lff.73.2020.11.10.15.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 15:47:04 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 4/5] drm/panel: s6e63m0: Support 3WIRE protocol
Date: Wed, 11 Nov 2020 00:46:52 +0100
Message-Id: <20201110234653.2248594-5-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201110234653.2248594-1-linus.walleij@linaro.org>
References: <20201110234653.2248594-1-linus.walleij@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHBhbmVsIGNhbiBiZSBjb25uZWN0ZWQgdXNpbmcgM1dJUkUsIHRoZW4gaXQgaXMKaG93ZXZl
ciBuZWNlc3NhcnkgdGhhdCB0aGUgZmxhZyBTUElfM1dJUkUgaXMgcHJlc2VydmVkCm9uIHRoZSBk
ZXZpY2UsIGFzIHdlIHNldCB0aGlzIGZyb20gZ2VuZXJpYyBkZXZpY2UgdHJlZQpwYXJzaW5nIGNv
ZGUgKG9yIHNpbWlsYXIpLiBKdXN0IHw9IHRoZSBTUEkgbW9kZS4KCkNjOiBTdGVwaGFuIEdlcmhv
bGQgPHN0ZXBoYW5AZ2VyaG9sZC5uZXQ+CkNjOiBQYXdlxYIgQ2htaWVsIDxwYXdlbC5taWtvbGFq
LmNobWllbEBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndh
bGxlaWpAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2Ftc3Vu
Zy1zNmU2M20wLXNwaS5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwt
c2Ftc3VuZy1zNmU2M20wLXNwaS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNhbXN1
bmctczZlNjNtMC1zcGkuYwppbmRleCBlNDc2NDdmNDE4ZmYuLmIxYWRmOGY4OWM2MiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNhbXN1bmctczZlNjNtMC1zcGkuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2Ftc3VuZy1zNmU2M20wLXNwaS5jCkBA
IC03Miw3ICs3Miw4IEBAIHN0YXRpYyBpbnQgczZlNjNtMF9zcGlfcHJvYmUoc3RydWN0IHNwaV9k
ZXZpY2UgKnNwaSkKIAlpbnQgcmV0OwogCiAJc3BpLT5iaXRzX3Blcl93b3JkID0gOTsKLQlzcGkt
Pm1vZGUgPSBTUElfTU9ERV8zOworCS8qIFByZXNlcnZlIGUuZy4gU1BJXzNXSVJFIHNldHRpbmcg
Ki8KKwlzcGktPm1vZGUgfD0gU1BJX01PREVfMzsKIAlyZXQgPSBzcGlfc2V0dXAoc3BpKTsKIAlp
ZiAocmV0IDwgMCkgewogCQlkZXZfZXJyKGRldiwgInNwaSBzZXR1cCBmYWlsZWQuXG4iKTsKLS0g
CjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
