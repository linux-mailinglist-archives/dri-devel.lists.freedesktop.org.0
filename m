Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF6124400
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 01:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6EB89211;
	Mon, 20 May 2019 23:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F02C89211;
 Mon, 20 May 2019 23:17:14 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b18so16330103wrq.12;
 Mon, 20 May 2019 16:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jWWkFF8qqNP1oyaV8DPzFg3zaBUl2kqL5tx2cpEwSt4=;
 b=XCY4ml8gFIM5/ulSC0st4Y54PVcX5lmQltDcDdx1y3StmjQPQlBRJL5jaMlnO69WDi
 3dDLUxz/+q8cGBi3fXc616HStoe/ofBOVKpUALrwu3FfNUX04LuLe+nzF79/GtBDlBCu
 3Lx01xmpQFfgHXKq8mnDcf2tkwO003aV2qNoLZYDXai4BQmib0vgHTx/wmrHA9hVQt0s
 Sl0C2Da/XJb62qxKO+igS3IxDbZZ3L1g0RXg5JZ9Vtpsjwz6uqazbH/gf/qDDwfFk4a9
 Wu18ESmSuxcZqeunTURZEY+c/Fc+BFT+2d1mY8OMlNzWHCb8eeykKq+kbbe4kIjzdh3P
 g+oA==
X-Gm-Message-State: APjAAAWcDqPquaNKL4rgvyTXQPHhhN1XHZXWjpicI+Bt6F5MY5XPtBgu
 23yb6TxRW9PHmQT7Sx3vDxyxCzAt+OHUwA==
X-Google-Smtp-Source: APXvYqzx/zP6ubKNDdOmlf6yFJ5Rzhj8cPIX/4o1hGkhOWhmx0lVlwAgurxizxUoOQkZtff/FdGtNw==
X-Received: by 2002:adf:df87:: with SMTP id z7mr21697443wrl.8.1558394233106;
 Mon, 20 May 2019 16:17:13 -0700 (PDT)
Received: from localhost.localdomain (ip-94-112-137-51.net.upcbroadband.cz.
 [94.112.137.51])
 by smtp.gmail.com with ESMTPSA id r3sm16254721wrn.5.2019.05.20.16.17.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 May 2019 16:17:12 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Nayan Deshmukh <nayan26deshmukh@gmail.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Eric Anholt <eric@anholt.net>, Sharat Masetty <smasetty@codeaurora.org>,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
Subject: [PATCH v2] drm/scheduler: Fix job cleanup without timeout handler
Date: Tue, 21 May 2019 01:16:49 +0200
Message-Id: <20190520231649.24595-1-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jWWkFF8qqNP1oyaV8DPzFg3zaBUl2kqL5tx2cpEwSt4=;
 b=fhhPHOUbnJjAKQ/oK9N32Q5BG/NnJA6uUABFa9IrkgVBrgxwYZzHDiJfspWhiuQ/eW
 gR5kDXd+Y+1yu9MwdNoxEq0+46NYDfinDG1ZbRvdaSHevEdKNyc+Wmo4tQWP2Lm9o24v
 EVcFPdYmLu1GdRw4LANoa/ru0vMKSp+auFea8UT/E5hPncNQij1cKj7vBo93qSPvBG3z
 ILWUVJpRF3MUIXUlgibGyPvJpq84OsWyGXHp/Tqq2UVs3S+SzX3itx6E69r1muTdNdhi
 0nC7Yx4IHOYK9FWVICRTjthAmSyK4E7abfLmIsxc+jlD0oX9QwO3BiR06ncxH4KbAw2L
 fjrw==
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
Cc: Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWZ0ZXIgIjU5MTgwNDVjNGVkNCBkcm0vc2NoZWR1bGVyOiByZXdvcmsgam9iIGRlc3RydWN0aW9u
Iiwgam9icyBhcmUKb25seSBkZWxldGVkIHdoZW4gdGhlIHRpbWVvdXQgaGFuZGxlciBpcyBhYmxl
IHRvIGJlIGNhbmNlbGxlZApzdWNjZXNzZnVsbHkuCgpJbiBjYXNlIG5vIHRpbWVvdXQgaGFuZGxl
ciBpcyBydW5uaW5nICh0aW1lb3V0ID09IE1BWF9TQ0hFRFVMRV9USU1FT1VUKSwKam9iIGNsZWFu
dXAgd291bGQgYmUgc2tpcHBlZCB3aGljaCBtYXkgcmVzdWx0IGluIG1lbW9yeSBsZWFrcy4KCkFk
ZCB0aGUgaGFuZGxpbmcgZm9yIHRoZSAodGltZW91dCA9PSBNQVhfU0NIRURVTEVfVElNRU9VVCkg
Y2FzZSBpbgpkcm1fc2NoZWRfY2xlYW51cF9qb2JzLgoKU2lnbmVkLW9mZi1ieTogRXJpY28gTnVu
ZXMgPG51bmVzLmVyaWNvQGdtYWlsLmNvbT4KQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21h
aW4uYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwppbmRleCBmOGYwZTFjMTkw
MDIuLjEwZDFkMzdlNjQ0YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9z
Y2hlZF9tYWluLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMK
QEAgLTYzMCw3ICs2MzAsOCBAQCBzdGF0aWMgdm9pZCBkcm1fc2NoZWRfY2xlYW51cF9qb2JzKHN0
cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpCiAJdW5zaWduZWQgbG9uZyBmbGFnczsKIAog
CS8qIERvbid0IGRlc3Ryb3kgam9icyB3aGlsZSB0aGUgdGltZW91dCB3b3JrZXIgaXMgcnVubmlu
ZyAqLwotCWlmICghY2FuY2VsX2RlbGF5ZWRfd29yaygmc2NoZWQtPndvcmtfdGRyKSkKKwlpZiAo
c2NoZWQtPnRpbWVvdXQgIT0gTUFYX1NDSEVEVUxFX1RJTUVPVVQgJiYKKwkgICAgIWNhbmNlbF9k
ZWxheWVkX3dvcmsoJnNjaGVkLT53b3JrX3RkcikpCiAJCXJldHVybjsKIAogCi0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
