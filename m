Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A17F1641A0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 11:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24D76EB54;
	Wed, 19 Feb 2020 10:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396F26EB36
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:21:52 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id w15so27527312wru.4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dh+h123bCHKEifl005lcLLj+b1SNMqbXcgH++6BKO1o=;
 b=iTjPsPk64jJsWTNo2ENnof9YjZO5s2n0SkROUEQHyg9XcovxzPHyLkZGo88QPvTVZq
 BlGIq9rXTHkbWSKHh3Eu7H33LZKAaiQ3mwjKg9UB/Jx7qQSND9pk5L7RL4qSULMmlL6E
 VCdJoMRI0Aie6qZUxs2ej0N2ExxIR5WEp8lZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dh+h123bCHKEifl005lcLLj+b1SNMqbXcgH++6BKO1o=;
 b=PN9hNS7U4Un2A0dA2ZUv+VzhymrMGz4qrTths9+uGPGhakZrIwtezuMVtjx6wTseFV
 abvKsrMMPpZJKFUodkO6tHDWxxUu30BMtP89qyXIIAx/ycqn/gtaq1zyNPdeMqde5H/7
 vc9npo1Y/BgKPGrdGXWh7ZHRCBT+yH/mrLPKqthAuuB3+timeZxxLgJH3ihD/9lu1Z3g
 4CkIXKKCkXkw/gTYn1bAxAApjcr4wqaxssRUyICIej0EP0Wx+YD2NV7XbVn1dIwliDlA
 pip6qhIQs9YOTjqWOY2f9rS60IELu1pMr7GTFMEzUks9hOHTHzYXhTKbjEzgv/JUyH4M
 7ZEA==
X-Gm-Message-State: APjAAAUesWBHJbzCibY6XCW6I2vJQ/D8kre9u2ecMBLk8iP91vRd7Vdj
 WrhuUYydNqJLhbks9UvXvNewO5p/h2o=
X-Google-Smtp-Source: APXvYqz1NarCJJY9ejf8GJKo+4Tu5qDpSLiZO3ySfykZSN4LQuAKGymih2Kog1Rx9tSbEZoirMHcow==
X-Received: by 2002:adf:c54e:: with SMTP id s14mr33820773wrf.385.1582107710557; 
 Wed, 19 Feb 2020 02:21:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:21:50 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 16/52] drm/repaper: Use drmm_add_final_kfree
Date: Wed, 19 Feb 2020 11:20:46 +0100
Message-Id: <20200219102122.1607365-17-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCB0aGlzIHdlIGNhbiBkcm9wIHRoZSBmaW5hbCBrZnJlZSBmcm9tIHRoZSByZWxlYXNlIGZ1
bmN0aW9uLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRl
bC5jb20+CkNjOiAiTm9yYWxmIFRyw7hubmVzIiA8bm9yYWxmQHRyb25uZXMub3JnPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS90aW55L3JlcGFwZXIuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3RpbnkvcmVwYXBlci5jIGIvZHJpdmVycy9ncHUvZHJtL3RpbnkvcmVwYXBlci5jCmluZGV4
IGY1ZWJjYWY3ZWUzYS4uZGY1NjU0ZWY1M2VlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dGlueS9yZXBhcGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RpbnkvcmVwYXBlci5jCkBAIC0z
MSw2ICszMSw3IEBACiAjaW5jbHVkZSA8ZHJtL2RybV9mb3JtYXRfaGVscGVyLmg+CiAjaW5jbHVk
ZSA8ZHJtL2RybV9nZW1fY21hX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fZ2VtX2ZyYW1l
YnVmZmVyX2hlbHBlci5oPgorI2luY2x1ZGUgPGRybS9kcm1fbWFuYWdlZC5oPgogI2luY2x1ZGUg
PGRybS9kcm1fbW9kZXMuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3JlY3QuaD4KICNpbmNsdWRlIDxk
cm0vZHJtX3Byb2JlX2hlbHBlci5oPgpAQCAtOTEwLDEzICs5MTEsMTAgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBkcm1fbW9kZV9jb25maWdfZnVuY3MgcmVwYXBlcl9tb2RlX2NvbmZpZ19mdW5jcyA9
IHsKIAogc3RhdGljIHZvaWQgcmVwYXBlcl9yZWxlYXNlKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0p
CiB7Ci0Jc3RydWN0IHJlcGFwZXJfZXBkICplcGQgPSBkcm1fdG9fZXBkKGRybSk7Ci0KIAlEUk1f
REVCVUdfRFJJVkVSKCJcbiIpOwogCiAJZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZHJtKTsKIAlk
cm1fZGV2X2ZpbmkoZHJtKTsKLQlrZnJlZShlcGQpOwogfQogCiBzdGF0aWMgY29uc3QgdWludDMy
X3QgcmVwYXBlcl9mb3JtYXRzW10gPSB7CkBAIC0xMDI0LDYgKzEwMjIsNyBAQCBzdGF0aWMgaW50
IHJlcGFwZXJfcHJvYmUoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSkKIAkJa2ZyZWUoZXBkKTsKIAkJ
cmV0dXJuIHJldDsKIAl9CisJZHJtbV9hZGRfZmluYWxfa2ZyZWUoZHJtLCBlcGQpOwogCiAJZHJt
X21vZGVfY29uZmlnX2luaXQoZHJtKTsKIAlkcm0tPm1vZGVfY29uZmlnLmZ1bmNzID0gJnJlcGFw
ZXJfbW9kZV9jb25maWdfZnVuY3M7Ci0tIAoyLjI0LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
