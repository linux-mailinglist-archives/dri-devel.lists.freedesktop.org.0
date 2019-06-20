Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 528C64C754
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 08:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83F66E4CE;
	Thu, 20 Jun 2019 06:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CFC6E4CD
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 06:15:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2185F81F1B;
 Thu, 20 Jun 2019 06:15:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-212.ams2.redhat.com
 [10.36.116.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78C8C1001B3D;
 Thu, 20 Jun 2019 06:15:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 81A6D1750C; Thu, 20 Jun 2019 08:15:47 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm: add mmap() to drm_gem_object_funcs
Date: Thu, 20 Jun 2019 08:15:45 +0200
Message-Id: <20190620061547.8664-2-kraxel@redhat.com>
In-Reply-To: <20190620061547.8664-1-kraxel@redhat.com>
References: <20190620061547.8664-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Thu, 20 Jun 2019 06:15:53 +0000 (UTC)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtX2dlbV9vYmplY3RfZnVuY3MtPnZtX29wcyBhbG9uZSBjYW4ndCBoYW5kbGUKZXZlcnl0aGlu
ZyBtbWFwKCkgbmVlZHMuICBBZGQgYSBuZXcgY2FsbGJhY2sgZm9yIGl0LgoKU2lnbmVkLW9mZi1i
eTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Ci0tLQogaW5jbHVkZS9kcm0vZHJt
X2dlbS5oICAgICB8IDkgKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jIHwgNCAr
KysrCiAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNs
dWRlL2RybS9kcm1fZ2VtLmggYi9pbmNsdWRlL2RybS9kcm1fZ2VtLmgKaW5kZXggYTkxMjFmZTY2
ZWEyLi4yZTY4MGEwNjU0NzAgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9nZW0uaAorKysg
Yi9pbmNsdWRlL2RybS9kcm1fZ2VtLmgKQEAgLTE0NCw2ICsxNDQsMTUgQEAgc3RydWN0IGRybV9n
ZW1fb2JqZWN0X2Z1bmNzIHsKIAkgKi8KIAl2b2lkICgqdnVubWFwKShzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QgKm9iaiwgdm9pZCAqdmFkZHIpOwogCisJLyoqCisJICogQG1tYXA6CisJICoKKwkgKiBD
YWxsZWQgYnkgZHJtX2dlbV9tbWFwKCkgZm9yIGFkZGl0aW9uYWwgY2hlY2tzL3NldHVwLgorCSAq
CisJICogVGhpcyBjYWxsYmFjayBpcyBvcHRpb25hbC4KKwkgKi8KKwlpbnQgKCptbWFwKShzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpOworCiAJ
LyoqCiAJICogQHZtX29wczoKIAkgKgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9n
ZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMKaW5kZXggYThjNDQ2OGYwM2Q5Li4xZGVh
ZTFiNzBmMzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9nZW0uYwpAQCAtMTE5Miw2ICsxMTkyLDEwIEBAIGludCBkcm1fZ2Vt
X21tYXAoc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQogCXJl
dCA9IGRybV9nZW1fbW1hcF9vYmoob2JqLCBkcm1fdm1hX25vZGVfc2l6ZShub2RlKSA8PCBQQUdF
X1NISUZULAogCQkJICAgICAgIHZtYSk7CiAKKwlpZiAocmV0ID09IDApCisJCWlmIChvYmotPmZ1
bmNzLT5tbWFwKQorCQkJcmV0ID0gb2JqLT5mdW5jcy0+bW1hcChvYmosIHZtYSk7CisKIAlkcm1f
Z2VtX29iamVjdF9wdXRfdW5sb2NrZWQob2JqKTsKIAogCXJldHVybiByZXQ7Ci0tIAoyLjE4LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
