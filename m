Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33985A54E9
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 13:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA34989C0A;
	Mon,  2 Sep 2019 11:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8419489B4D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 11:31:48 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id n2so12834299wmk.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 04:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4cI0RzXFJqVYGs/mCO/Yp6qhv0wC7A7glB5J5f3Qjj0=;
 b=Utq/F3Fon49qvblyUhAQN4rzxkQ3VyYnHnQ9ry5EHzrPRBtmh6S9vFW6W/hjuvb299
 JVkPwc6OgHlQs5VnVsLawaqJ/+q501XGUAMoAtaoaU8b6HBBpwMu9V+EOWIEax7VqY+E
 cFoBSI5XQDG+Q8CKWFhnZ1BV9fVze6Re6zEVJ3YTQJEEZIQSPGwNfzIXarIi9ZDBYyyY
 6lumwRjgVxroEnhVSxnG1btGbA20lfcOP6/Gvtcx+ViPRTKEK/jRTsrsBfx9t5O7EYoH
 5BVMElX1O4byHhhZtWpTtjyA7IEHcnw6XtMn0JgWi3eAYUIaSXchmz3gPG/9BiEdAiDS
 zQsA==
X-Gm-Message-State: APjAAAVyGxuTiHCVDWeTtyImsz5DJsY2z+vpzivqO4J+XrMJgkKZ7AfI
 946hdOFZIC2f9wM4SKrpOnPA5Pcx
X-Google-Smtp-Source: APXvYqwCkEH/uhTaeY4o/td/dlm8rtvdHXLLkL77ZFGNzsqxAmhQr8z+YuZ/Y8z2W47fUn3HBCKbgA==
X-Received: by 2002:a1c:a713:: with SMTP id q19mr36161652wme.127.1567423906744; 
 Mon, 02 Sep 2019 04:31:46 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id g201sm12046579wmg.34.2019.09.02.04.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 04:31:45 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 11/21] drm/dp: Read eDP version from DPCD
Date: Mon,  2 Sep 2019 13:31:11 +0200
Message-Id: <20190902113121.31323-12-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190902113121.31323-1-thierry.reding@gmail.com>
References: <20190902113121.31323-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4cI0RzXFJqVYGs/mCO/Yp6qhv0wC7A7glB5J5f3Qjj0=;
 b=V2bKVBhNYFQ9jQjCmyDpvjGvibaqgv3HwUFqeI/hnccutRmQwVVhu7w3+XF3Pk7D7X
 voBltxtca5+O7qn336AiwnNerg6GpOvrNbNTZ93jb2ISkGmibPwxIcuGxfO0bDG99Iwx
 dIUoNiP3SVvpP/zPlVO0+BlDVzZsNUe8BmiafoMlZ9qK7Enm2ZwHD2idTbnuigCFP5Eb
 7EWZuxPPwVV6NdJmZ7LJ0MoDms/2+akYMOfJzwvCW/g8vQIZPcGYi2NJqTizDljLkUt1
 IdByB00sgCJnlwAVUBxkDSberE3RH79LLheS1j2SpkviIyJCSAZ81Sd4FxnBEepiIOpj
 4BRg==
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
