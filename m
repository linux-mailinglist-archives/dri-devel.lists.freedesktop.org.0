Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E696EE650
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 18:42:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B956E7A0;
	Mon,  4 Nov 2019 17:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C44A6E7A0
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 17:42:02 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id a18so6749790plm.10
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 09:42:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bhTEQnP8RxA0q/YUDgp2LWFOIs06F90qLkFMbfArLJ4=;
 b=I6kLdymqxGcRCu/zue3OJ4meH4AtsV4Vpxr9oNJS1P33lBWjGv+TnvSwirPV1K+PUw
 tRoaOLeO7OISU3/eO/5pKrImp1OuOdrUHbrdSSqpQxtgHBsZ1zys05mehWkPMhcQoGi5
 Hs7xE2AI1wpJJSDlKtMrTof0+wIiLq5kYLoVuxCkuzQ8C1KEfu6YOGubEbXGq5eDMGhD
 GR4NoQLRPNGFJ44Pjkhgo608Scnv+R2ggK7PBeWixc9Bw/dEEEXnL/3wZ8r+VoYSGVIf
 qGZXN19aBX+EVJ0JMjq/b3T+31OW2Hm1o3DrvbZWthqagOTaqbrT9u+mIxK+J/y9o0SK
 iJ3g==
X-Gm-Message-State: APjAAAUmSaGH+TUU+9LvBAzpJZWj5tr6OnWh+UX37Y+qxkPpKvZaOQ4o
 AJi2rrQpnDBmHmBVzRhRPa+IGqd9dYo=
X-Google-Smtp-Source: APXvYqxj7NUxsNzZ5uvdnA8/Jr0AxmR8ai/BmIlz7poN4i1CbMzixfFCPpxTjgrC3DYB9I08CU03WA==
X-Received: by 2002:a17:902:27:: with SMTP id 36mr28813529pla.28.1572889321382; 
 Mon, 04 Nov 2019 09:42:01 -0800 (PST)
Received: from localhost ([100.118.89.215])
 by smtp.gmail.com with ESMTPSA id b17sm18758746pfr.17.2019.11.04.09.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 09:42:00 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2 v2] drm/atomic: clear new_state pointers at hw_done
Date: Mon,  4 Nov 2019 09:37:37 -0800
Message-Id: <20191104173737.142558-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191104173737.142558-1-robdclark@gmail.com>
References: <20191104173737.142558-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bhTEQnP8RxA0q/YUDgp2LWFOIs06F90qLkFMbfArLJ4=;
 b=NOLeErTWRsJ7mN747WHY9/xb1Kg1Hmm4WyT9ASnpWW0NeBwlmbQZ3Z+5xAi5VUE9Sb
 4gM4OzKFJ/4Nb/zH2q6oy+JO+AFbAHT8SIm8kVgxoEaXVGXBEuG1GrZguZrwDAMINdBt
 kHKvu96X6R+599zqtFFa25k/ltlNyAaIkFbARSN1ZQhuDALuQoc9ITIRtP5ov1HBO4Mt
 1WspukrqvBEEd5PWvqO+ze040GR/D7uAg+xaMI1A26AMqmF4V02bqwvsz0lvMR2khAjG
 FtkE3BCZl1+/6HEqGysTfHFdTTJnpOGsYsikqtBLrsOrGg7rkCFeIUxRC2dxigKxNmT4
 fezA==
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKVGhlIG5ldyBzdGF0ZSBz
aG91bGQgbm90IGJlIGFjY2Vzc2VkIGFmdGVyIHRoaXMgcG9pbnQuICBDbGVhciB0aGUKcG9pbnRl
cnMgdG8gbWFrZSB0aGF0IGV4cGxpY2l0LgoKU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2Jk
Y2xhcmtAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBl
ci5jIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAz
MCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNf
aGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYwppbmRleCA2NDg0
OTRjODEzZTUuLmFlYzk3NTlkOWRmMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9h
dG9taWNfaGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMK
QEAgLTIyNDYsMTIgKzIyNDYsNDIgQEAgRVhQT1JUX1NZTUJPTChkcm1fYXRvbWljX2hlbHBlcl9m
YWtlX3ZibGFuayk7CiAgKi8KIHZvaWQgZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X2h3X2RvbmUo
c3RydWN0IGRybV9hdG9taWNfc3RhdGUgKm9sZF9zdGF0ZSkKIHsKKwlzdHJ1Y3QgZHJtX2Nvbm5l
Y3RvciAqY29ubmVjdG9yOworCXN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpvbGRfY29ubl9z
dGF0ZSwgKm5ld19jb25uX3N0YXRlOwogCXN0cnVjdCBkcm1fY3J0YyAqY3J0YzsKIAlzdHJ1Y3Qg
ZHJtX2NydGNfc3RhdGUgKm9sZF9jcnRjX3N0YXRlLCAqbmV3X2NydGNfc3RhdGU7CisJc3RydWN0
IGRybV9wbGFuZSAqcGxhbmU7CisJc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqb2xkX3BsYW5lX3N0
YXRlLCAqbmV3X3BsYW5lX3N0YXRlOwogCXN0cnVjdCBkcm1fY3J0Y19jb21taXQgKmNvbW1pdDsK
KwlzdHJ1Y3QgZHJtX3ByaXZhdGVfb2JqICpvYmo7CisJc3RydWN0IGRybV9wcml2YXRlX3N0YXRl
ICpvbGRfb2JqX3N0YXRlLCAqbmV3X29ial9zdGF0ZTsKIAlpbnQgaTsKIAorCS8qCisJICogQWZ0
ZXIgdGhpcyBwb2ludCwgZHJpdmVycyBzaG91bGQgbm90IGFjY2VzcyB0aGUgcGVybWFuZW50IG1v
ZGVzZXQKKwkgKiBzdGF0ZSwgc28gd2UgYWxzbyBjbGVhciB0aGUgbmV3X3N0YXRlIHBvaW50ZXJz
IHRvIG1ha2UgdGhpcworCSAqIHJlc3RyaWN0aW9uIGV4cGxpY2l0LgorCSAqCisJICogRm9yIHRo
ZSBDUlRDIHN0YXRlLCB3ZSBkbyB0aGlzIGluIHRoZSBzYW1lIGxvb3Agd2hlcmUgd2Ugc2lnbmFs
CisJICogaHdfZG9uZSwgc2luY2Ugd2Ugc3RpbGwgbmVlZCB0byBuZXdfY3J0Y19zdGF0ZSB0byBm
aXNoIG91dCB0aGUKKwkgKiBjb21taXQuCisJICovCisKKwlmb3JfZWFjaF9vbGRuZXdfY29ubmVj
dG9yX2luX3N0YXRlKG9sZF9zdGF0ZSwgY29ubmVjdG9yLCBvbGRfY29ubl9zdGF0ZSwgbmV3X2Nv
bm5fc3RhdGUsIGkpIHsKKwkJb2xkX3N0YXRlLT5jb25uZWN0b3JzW2ldLm5ld19zdGF0ZSA9IE5V
TEw7CisJfQorCisJZm9yX2VhY2hfb2xkbmV3X3BsYW5lX2luX3N0YXRlKG9sZF9zdGF0ZSwgcGxh
bmUsIG9sZF9wbGFuZV9zdGF0ZSwgbmV3X3BsYW5lX3N0YXRlLCBpKSB7CisJCW9sZF9zdGF0ZS0+
cGxhbmVzW2ldLm5ld19zdGF0ZSA9IE5VTEw7CisJfQorCisJZm9yX2VhY2hfb2xkbmV3X3ByaXZh
dGVfb2JqX2luX3N0YXRlKG9sZF9zdGF0ZSwgb2JqLCBvbGRfb2JqX3N0YXRlLCBuZXdfb2JqX3N0
YXRlLCBpKSB7CisJCW9sZF9zdGF0ZS0+cHJpdmF0ZV9vYmpzW2ldLm5ld19zdGF0ZSA9IE5VTEw7
CisJfQorCiAJZm9yX2VhY2hfb2xkbmV3X2NydGNfaW5fc3RhdGUob2xkX3N0YXRlLCBjcnRjLCBv
bGRfY3J0Y19zdGF0ZSwgbmV3X2NydGNfc3RhdGUsIGkpIHsKKwkJb2xkX3N0YXRlLT5jcnRjc1tp
XS5uZXdfc3RhdGUgPSBOVUxMOworCiAJCWNvbW1pdCA9IG5ld19jcnRjX3N0YXRlLT5jb21taXQ7
CiAJCWlmICghY29tbWl0KQogCQkJY29udGludWU7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
