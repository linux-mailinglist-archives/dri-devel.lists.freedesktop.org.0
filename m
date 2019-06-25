Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8805593B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 22:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8984B6E23D;
	Tue, 25 Jun 2019 20:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E306E22C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 20:42:19 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id e3so29053371edr.10
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 13:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0DSYgb9aonHfnDZhSr9L4wZg7nFbljE2Y+5VozO9vs0=;
 b=G8vVKebhx6LFnk5rmEH46S6M0ckymEsDsekL2slEWqzoFz6paPo+XgJZKyu2Bi8oiJ
 Tx6XjKAYqgncoCtRozlgK0+Yry64Co8N6IqcHtdjp0QHAEY5SJHDv1aAKeWYC2imXnq8
 c2SObMprjmN7O3XrrwlLxfEnRKjRJ4ufP7665SHN0syeJ3Ma7Anq05DB2oPQzzACIUdb
 UiFQyVgfi1IiWHnbdS8/RSlqi5FB2FJLTNoKU3vPXgTLtkzuGc4YUKz1Aa+xYEXzAkBt
 fXyLNy0MeBEF3bsJvVS6Kk+wX7yPTEkKDqLB9UuoqyW7hAWms6HGGxtCqt5Pa9+jhvd9
 3hyA==
X-Gm-Message-State: APjAAAXzjPM9ZyTli5+Q/rgp+IgIx69cYil9zAR73Cz1HAJ9AJJJsHNe
 pgTmhZ9PwY/MEiczJjGieVKAkZeXifk=
X-Google-Smtp-Source: APXvYqyGRhODXn/gilTyRQ8sMRjwlvREVn5+5CCRL8e6AH2uLRjcRLK4QKh2kkdiuL4+bk9WSztjqA==
X-Received: by 2002:a17:906:6a89:: with SMTP id p9mr507513ejr.44.1561495337301; 
 Tue, 25 Jun 2019 13:42:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id u9sm5187262edm.71.2019.06.25.13.42.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 13:42:16 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/7] drm/vc4: Use drm_gem_fb_prepare_fb
Date: Tue, 25 Jun 2019 22:42:04 +0200
Message-Id: <20190625204208.5614-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625204208.5614-1-daniel.vetter@ffwll.ch>
References: <20190625204208.5614-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0DSYgb9aonHfnDZhSr9L4wZg7nFbljE2Y+5VozO9vs0=;
 b=Q3enBxpjusayBOw0Jh50TtLOeecXRU8mmS4ktxWzEkFRe2jfLrURwEAir4xRPnhJ00
 exs4u4FqwF1CfrJgLhnCAZtJsqtNyG2obABuSkEA5I5NpmIuIkXT/fG/1Pcsy4lPk2k3
 VQyv57EvwTvEn66erEFdon/CheZ1+eEo4cBek=
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dmM0IGhhcyBzd2l0Y2hlZCB0byB1c2luZyBkcm1fZmItPm9ialtdLCBzbyB3ZSBjYW4ganVzdCB1
c2UgdGhlIGhlbHBlcgp1bmNoYW5nZWQuCgp2MjogTWFrZSBpdCBjb21waWxlIC4uLiBvb3BzLgoK
Q2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+CkNjOiBFbWlsIFZlbGlrb3YgPGVtaWwu
dmVsaWtvdkBjb2xsYWJvcmEuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfcGxhbmUuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3ZjNC92YzRfcGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3BsYW5l
LmMKaW5kZXggMGEwMjA3YzM1MGE1Li5hOTk2Y2E4ZmY5NzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS92YzQvdmM0X3BsYW5lLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfcGxh
bmUuYwpAQCAtMjAsNiArMjAsNyBAQAogI2luY2x1ZGUgPGRybS9kcm1fZmJfY21hX2hlbHBlci5o
PgogI2luY2x1ZGUgPGRybS9kcm1fcGxhbmVfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9h
dG9taWNfdWFwaS5oPgorI2luY2x1ZGUgPGRybS9kcm1fZ2VtX2ZyYW1lYnVmZmVyX2hlbHBlci5o
PgogCiAjaW5jbHVkZSAidWFwaS9kcm0vdmM0X2RybS5oIgogI2luY2x1ZGUgInZjNF9kcnYuaCIK
QEAgLTExMjMsNyArMTEyNCw2IEBAIHN0YXRpYyBpbnQgdmM0X3ByZXBhcmVfZmIoc3RydWN0IGRy
bV9wbGFuZSAqcGxhbmUsCiAJCQkgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnN0YXRlKQogewog
CXN0cnVjdCB2YzRfYm8gKmJvOwotCXN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlOwogCWludCByZXQ7
CiAKIAlpZiAoIXN0YXRlLT5mYikKQEAgLTExMzEsOCArMTEzMSw3IEBAIHN0YXRpYyBpbnQgdmM0
X3ByZXBhcmVfZmIoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAKIAlibyA9IHRvX3ZjNF9ibygm
ZHJtX2ZiX2NtYV9nZXRfZ2VtX29iaihzdGF0ZS0+ZmIsIDApLT5iYXNlKTsKIAotCWZlbmNlID0g
cmVzZXJ2YXRpb25fb2JqZWN0X2dldF9leGNsX3JjdShiby0+YmFzZS5iYXNlLnJlc3YpOwotCWRy
bV9hdG9taWNfc2V0X2ZlbmNlX2Zvcl9wbGFuZShzdGF0ZSwgZmVuY2UpOworCWRybV9nZW1fZmJf
cHJlcGFyZV9mYihwbGFuZSwgc3RhdGUpOwogCiAJaWYgKHBsYW5lLT5zdGF0ZS0+ZmIgPT0gc3Rh
dGUtPmZiKQogCQlyZXR1cm4gMDsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
