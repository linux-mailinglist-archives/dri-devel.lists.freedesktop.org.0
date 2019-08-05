Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7705581928
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 14:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB93C6E42B;
	Mon,  5 Aug 2019 12:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2C96E429
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 12:24:08 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w13so78528739eds.4
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 05:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4cI0RzXFJqVYGs/mCO/Yp6qhv0wC7A7glB5J5f3Qjj0=;
 b=Vy3YdX7Ei9um0Z03DGD6zJF7cTTzRFjkB0wPcdqxX1QwF3PW1Lb5XzGWrDJx+Adv0R
 XFAQWSawfj6TMOs1mDaTRYU7w/tELn7ESOj2bC1lsmUmBSiCAtWyEMmXb0iOo8KUdFQv
 i7WEDk43vf8DuKmFhlJ4NeLTTdYo/2YQkKqgd6OkfGwocFWWCw2qNdgYDlP2gS3s0slh
 qoK0sOO4UwCMjhWvdMl/noIRHM2XLj6JhRekhi7n7zkD6QySFbBrmqvDHDiH3kzOd//H
 o4wfFEqR+5JemmUm+4rnCP19VTPdQr66zr8msBghfHds4jFgu5w+p7vlKqI/VzaFkaVC
 xMYg==
X-Gm-Message-State: APjAAAXh2mC/ZPjT1J/KDtZ+KwXh5rlqaMd4/RWvExDQZxeOnoWI+Lxh
 +uWILX/0aNtx+YpxlgpiDF3+pehi
X-Google-Smtp-Source: APXvYqwI9sWiNjfTnH15aRelOui5zLcwfHWOUCcSH0PAai941hdm0KvAbhYkSrRwVKlcfpVTM41Njw==
X-Received: by 2002:a17:906:264a:: with SMTP id
 i10mr117462859ejc.10.1565007846711; 
 Mon, 05 Aug 2019 05:24:06 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id e24sm11034673ejb.53.2019.08.05.05.24.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 05:24:06 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/21] drm/dp: Read eDP version from DPCD
Date: Mon,  5 Aug 2019 14:23:40 +0200
Message-Id: <20190805122350.8838-11-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805122350.8838-1-thierry.reding@gmail.com>
References: <20190805122350.8838-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4cI0RzXFJqVYGs/mCO/Yp6qhv0wC7A7glB5J5f3Qjj0=;
 b=nBnK6WCopvwpIEZ4CSrFzg7ktMvCp+k065vWnfbJuhHMZXB+FqpMelPkIJ9xAryhfK
 oQ0aj9DpoEwtSDJMlgBoLaaqZHLcAmugRbBhVQ/lpx5DllA6FtLEbsveTiiLtkSpig8X
 7bOXK+rer282ghtdyQnVHPMoJ0O4N5tJmC6aJEx3XRwJ/iZzcRivnYwkpRCeOjOF/n1M
 f+l6FJVE6gXQk53K1xLy8EEijX0pcNHW/yf4ZMV1u7usQvc9woH11h7EpROmizxhxECR
 xfkIRJeKx2o6d+Xfylfkud3CoounIFrbicQBPBb0todmQi88d5/kzZ4OwV2HvSwJcu4z
 puhA==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCklmIHRoZSBzaW5rIHN1
cHBvcnRzIGVEUCwgcmVhZCB0aGUgZURQIHJldmlzaW9uIGZyb20gaXQncyBEUENELgoKU2lnbmVk
LW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIHwgMTYgKysrKysrKysrKysrKysrLQogaW5jbHVkZS9k
cm0vZHJtX2RwX2hlbHBlci5oICAgICB8ICAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2RwX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwppbmRleCBhY2Fi
OGRjNDhlMmMuLjViMzZlOGUzOWNhNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCkBAIC0zODIs
NiArMzgyLDcgQEAgc3RhdGljIHZvaWQgZHJtX2RwX2xpbmtfcmVzZXQoc3RydWN0IGRybV9kcF9s
aW5rICpsaW5rKQogCWxpbmstPm1heF9sYW5lcyA9IDA7CiAKIAlkcm1fZHBfbGlua19jYXBzX3Jl
c2V0KCZsaW5rLT5jYXBzKTsKKwlsaW5rLT5lZHAgPSAwOwogCiAJbGluay0+cmF0ZSA9IDA7CiAJ
bGluay0+bGFuZXMgPSAwOwpAQCAtNDE4LDkgKzQxOSwyMiBAQCBpbnQgZHJtX2RwX2xpbmtfcHJv
YmUoc3RydWN0IGRybV9kcF9hdXggKmF1eCwgc3RydWN0IGRybV9kcF9saW5rICpsaW5rKQogCWxp
bmstPmNhcHMuZmFzdF90cmFpbmluZyA9IGRybV9kcF9mYXN0X3RyYWluaW5nX2NhcCh2YWx1ZXMp
OwogCWxpbmstPmNhcHMuY2hhbm5lbF9jb2RpbmcgPSBkcm1fZHBfY2hhbm5lbF9jb2Rpbmdfc3Vw
cG9ydGVkKHZhbHVlcyk7CiAKLQlpZiAoZHJtX2RwX2FsdGVybmF0ZV9zY3JhbWJsZXJfcmVzZXRf
Y2FwKHZhbHVlcykpCisJaWYgKGRybV9kcF9hbHRlcm5hdGVfc2NyYW1ibGVyX3Jlc2V0X2NhcCh2
YWx1ZXMpKSB7CisJCXN0YXRpYyBjb25zdCB1OCBlZHBfcmV2c1tdID0geyAweDExLCAweDEyLCAw
eDEzLCAweDE0IH07CisJCXU4IHZhbHVlOworCiAJCWxpbmstPmNhcHMuYWx0ZXJuYXRlX3NjcmFt
Ymxlcl9yZXNldCA9IHRydWU7CiAKKwkJZXJyID0gZHJtX2RwX2RwY2RfcmVhZGIoYXV4LCBEUF9F
RFBfRFBDRF9SRVYsICZ2YWx1ZSk7CisJCWlmIChlcnIgPCAwKQorCQkJcmV0dXJuIGVycjsKKwor
CQlpZiAodmFsdWUgPj0gQVJSQVlfU0laRShlZHBfcmV2cykpCisJCQlEUk1fRVJST1IoInVuc3Vw
cG9ydGVkIGVEUCB2ZXJzaW9uOiAlMDJ4XG4iLCB2YWx1ZSk7CisJCWVsc2UKKwkJCWxpbmstPmVk
cCA9IGVkcF9yZXZzW3ZhbHVlXTsKKwl9CisKIAlsaW5rLT5yYXRlID0gbGluay0+bWF4X3JhdGU7
CiAJbGluay0+bGFuZXMgPSBsaW5rLT5tYXhfbGFuZXM7CiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUv
ZHJtL2RybV9kcF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAppbmRleCBm
OWY2NWJjMTNkZjUuLjEzYzUwZTkwNTIwNSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Rw
X2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaApAQCAtMTQwNSw2ICsx
NDA1LDcgQEAgdm9pZCBkcm1fZHBfbGlua19jYXBzX2NvcHkoc3RydWN0IGRybV9kcF9saW5rX2Nh
cHMgKmRlc3QsCiAgKiBAbWF4X3JhdGU6IG1heGltdW0gY2xvY2sgcmF0ZSBzdXBwb3J0ZWQgb24g
dGhlIGxpbmsKICAqIEBtYXhfbGFuZXM6IG1heGltdW0gbnVtYmVyIG9mIGxhbmVzIHN1cHBvcnRl
ZCBvbiB0aGUgbGluawogICogQGNhcHM6IGNhcGFiaWxpdGllcyBzdXBwb3J0ZWQgb24gdGhlIGxp
bmsgKHNlZSAmZHJtX2RwX2xpbmtfY2FwcykKKyAqIEBlZHA6IGVEUCByZXZpc2lvbiAoMHgxMTog
ZURQIDEuMSwgMHgxMjogZURQIDEuMiwgLi4uKQogICogQHJhdGU6IGN1cnJlbnRseSBjb25maWd1
cmVkIGxpbmsgcmF0ZQogICogQGxhbmVzOiBjdXJyZW50bHkgY29uZmlndXJlZCBudW1iZXIgb2Yg
bGFuZXMKICAqLwpAQCAtMTQxNCw2ICsxNDE1LDcgQEAgc3RydWN0IGRybV9kcF9saW5rIHsKIAl1
bnNpZ25lZCBpbnQgbWF4X2xhbmVzOwogCiAJc3RydWN0IGRybV9kcF9saW5rX2NhcHMgY2FwczsK
Kwl1bnNpZ25lZCBjaGFyIGVkcDsKIAogCXVuc2lnbmVkIGludCByYXRlOwogCXVuc2lnbmVkIGlu
dCBsYW5lczsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
