Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E684102E5D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 22:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6E66E40A;
	Tue, 19 Nov 2019 21:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B71E6E40A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 21:42:46 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id d5so25084002ljl.4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 13:42:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XQwbcad//Pe4uYDzL68QH8A/dhMUUQ9ecZejem5rxiM=;
 b=UbFee8TO48uc0yoQRm7Fahh5s245tcbuL0VclfVkR2KZHhcQG/xjd3BVy7N4caQzvy
 lKc/tMvndPKkOnMsiCmdxKGEFnplB9pJPYT2ttXsrqTLsA79/5Bz3OntcUE55a4MnzeT
 HHXPK7gLMRhbqm79CXsivt2CBKcoQuumfy6qwCykrk4SFjJRW4OjkfcOVaeLKI3hQOym
 wdc8jiIAyj6cBIkeZashn3VS9srgdoEmSHUSgrzw4+5qGNsvRham0vKKZwgWDnEnhB9b
 TU1BTnOBpM8yJXjXKkQ5iU6svHir0N9VxbGLix65AQCQu1oa7Y9RYEolsLvMKlrxNJaj
 mJAg==
X-Gm-Message-State: APjAAAUaVdiotPczEAqq84Tb+BRyoXY2NKjkEwOb8q62uiAFsthbJUce
 MVGxqsOIbAEg7iHQpbanV2pXqhKng3SOSw==
X-Google-Smtp-Source: APXvYqwN/eyaWDtN0T2DivmihiRjPrfTNLBpp4c8KNaDgHf+GGH+luUgDARapbxJL6lM1g3J5KLPpg==
X-Received: by 2002:a05:651c:95:: with SMTP id 21mr5805470ljq.40.1574199764396; 
 Tue, 19 Nov 2019 13:42:44 -0800 (PST)
Received: from localhost.bredbandsbolaget
 (c-79c8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.200.121])
 by smtp.gmail.com with ESMTPSA id u5sm10829885ljg.68.2019.11.19.13.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 13:42:43 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/mcde: Support using DSI in LP mode
Date: Tue, 19 Nov 2019 22:42:34 +0100
Message-Id: <20191119214234.27932-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XQwbcad//Pe4uYDzL68QH8A/dhMUUQ9ecZejem5rxiM=;
 b=cGYm68rHZuLOe1+MxZNpcDmEEX13/yAjIzEFaSwcLvgbinvb59QiB2trvkZdyePMly
 KUB2rdO9t8xA4j2pMhLlZtuM9poWU70pdeb78rQGxjjNbHKI6Da9oGVRi7nPFpEAgnyK
 HC6coOrYA72lun1398rVBEdelKiIvxm2Lfz/il23K4nv9vEutoTgJPHGnRj+Qs9YhMEJ
 CrQH3RA7CHc4FnTdXFRQ9cKkcHc3jVnPQPOXr6Mah9++DjFMCxzAP8oN1S8cKP6K4XTm
 TJxhIP3dCYTrYwSp/iaSkOfTawDnwKyVaxfd1FQyegH+Q6GztRnuCh2yQIbAln1RjpRs
 oXKg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Stephan Gerhold <stephan@gerhold.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgaXMgcG9zc2libGUgdG8gc2V0IGEgZmxhZyBpbiB0aGUgc3RydWN0IG1pcGlfZHNpX2Rldmlj
ZQpzbyB0aGUgcGFuZWwgaXMgaGFuZGxlZCBpbiBsb3cgcG93ZXIgKExQKSBtb2RlLiBTb21lIGRp
c3BsYXlzCm9ubHkgc3VwcG9ydCB0aGlzIG1vZGUgYW5kIGl0IGlzIGFsc28gZ29vZCBmb3IgdGVz
dGluZy4KCkNjOiBTdGVwaGFuIEdlcmhvbGQgPHN0ZXBoYW5AZ2VyaG9sZC5uZXQ+ClNpZ25lZC1v
ZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2RzaS5jIHwgMTAgKysrKysrLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWNkZS9tY2RlX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kc2ku
YwppbmRleCA4ODljMzllZmE4MGMuLmQ0YTEyZmU3ZmYwMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21jZGUvbWNkZV9kc2kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2Rz
aS5jCkBAIC02NDgsMTAgKzY0OCwxMSBAQCBzdGF0aWMgdm9pZCBtY2RlX2RzaV9zdGFydChzdHJ1
Y3QgbWNkZV9kc2kgKmQpCiAJLyogQ29tbWFuZCBtb2RlLCBjbGVhciBJRjEgSUQgKi8KIAl2YWwg
PSByZWFkbChkLT5yZWdzICsgRFNJX0NNRF9NT0RFX0NUTCk7CiAJLyoKLQkgKiBJZiB3ZSBlbmFi
bGUgbG93LXBvd2VyIG1vZGUgaGVyZSwgd2l0aAotCSAqIHZhbCB8PSBEU0lfQ01EX01PREVfQ1RM
X0lGMV9MUF9FTgorCSAqIElmIHdlIGVuYWJsZSBsb3ctcG93ZXIgbW9kZSBoZXJlLAogCSAqIHRo
ZW4gZGlzcGxheSB1cGRhdGVzIGJlY29tZSByZWFsbHkgc2xvdy4KIAkgKi8KKwlpZiAoZC0+bWRz
aS0+bW9kZV9mbGFncyAmIE1JUElfRFNJX01PREVfTFBNKQorCQl2YWwgfD0gRFNJX0NNRF9NT0RF
X0NUTF9JRjFfTFBfRU47CiAJdmFsICY9IH5EU0lfQ01EX01PREVfQ1RMX0lGMV9JRF9NQVNLOwog
CXdyaXRlbCh2YWwsIGQtPnJlZ3MgKyBEU0lfQ01EX01PREVfQ1RMKTsKIApAQCAtNzQwLDEwICs3
NDEsMTEgQEAgc3RhdGljIHZvaWQgbWNkZV9kc2lfYnJpZGdlX3ByZV9lbmFibGUoc3RydWN0IGRy
bV9icmlkZ2UgKmJyaWRnZSkKIAkJLyogQ29tbWFuZCBtb2RlLCBjbGVhciBJRjEgSUQgKi8KIAkJ
dmFsID0gcmVhZGwoZC0+cmVncyArIERTSV9DTURfTU9ERV9DVEwpOwogCQkvKgotCQkgKiBJZiB3
ZSBlbmFibGUgbG93LXBvd2VyIG1vZGUgaGVyZSB3aXRoCi0JCSAqIHZhbCB8PSBEU0lfQ01EX01P
REVfQ1RMX0lGMV9MUF9FTgorCQkgKiBJZiB3ZSBlbmFibGUgbG93LXBvd2VyIG1vZGUgaGVyZQog
CQkgKiB0aGUgZGlzcGxheSB1cGRhdGVzIGJlY29tZSByZWFsbHkgc2xvdy4KIAkJICovCisJCWlm
IChkLT5tZHNpLT5tb2RlX2ZsYWdzICYgTUlQSV9EU0lfTU9ERV9MUE0pCisJCQl2YWwgfD0gRFNJ
X0NNRF9NT0RFX0NUTF9JRjFfTFBfRU47CiAJCXZhbCAmPSB+RFNJX0NNRF9NT0RFX0NUTF9JRjFf
SURfTUFTSzsKIAkJd3JpdGVsKHZhbCwgZC0+cmVncyArIERTSV9DTURfTU9ERV9DVEwpOwogCX0K
LS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
