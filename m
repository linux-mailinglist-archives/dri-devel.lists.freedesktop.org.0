Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 766A65593E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 22:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3B96E22B;
	Tue, 25 Jun 2019 20:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0786E239
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 20:42:24 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id a14so29070841edv.12
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 13:42:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xOxa3agFGXpntwt5TgPLrmTD67v/sR+zPGKOjl1gysw=;
 b=UCdnjDDD8ZIGFLGQKrBehM4PXjkKw8aeqc3JIyRVlxvYp3Eeo2bkWuDjTckyKo9iQt
 J4iPm/UKOFAC5DfiuC107r9t4XaD8qNjg4D1cPwgs20tZ7tCaM+DMds39fraLe28MpXc
 vGE2we02dcvSrqVjBGOE3sI/Yy6K0KSKD5Tmnx9ur+wYs7UtdQBM2cRIbxYCO9es3aAu
 zmZf4E+AtPqxzDEPSzNrantaFwJJ6uJU8sg1EdrmkraG64PRO/hv0Ij38KOxp1LjIBJQ
 +3+4U/Tfd2KE5KQwbvc7tgs0bmnDBDAad457cty490VSdxj5VLQV5Z8gL+jT557bWVFd
 Vg4Q==
X-Gm-Message-State: APjAAAVXNej+gvOqg9Qj7f9gqEKARFQUcX42g/fyhA6lyt9NPUKSqIif
 pfHHzsE+WVf6DCLmEqYMWejW4cpHhx4=
X-Google-Smtp-Source: APXvYqy73j88HKfJt607wJuCUQz1ljYZTfxxakH0VUy15DPnb0IkqSj/UXLDgJ688R3TTI4HNJaHPA==
X-Received: by 2002:a17:906:9256:: with SMTP id
 c22mr503298ejx.172.1561495342663; 
 Tue, 25 Jun 2019 13:42:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id u9sm5187262edm.71.2019.06.25.13.42.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 13:42:22 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 7/7] drm/prime: Ditch gem_prime_res_obj hook
Date: Tue, 25 Jun 2019 22:42:08 +0200
Message-Id: <20190625204208.5614-8-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625204208.5614-1-daniel.vetter@ffwll.ch>
References: <20190625204208.5614-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xOxa3agFGXpntwt5TgPLrmTD67v/sR+zPGKOjl1gysw=;
 b=O/EKvRalUv6oY1wMF7pd+1olNcM4tmnsxhO74SyRiAd2sz/Th1FIimsaf/GJiVa4Ie
 28U6PbdLUJsJZGl2+ekKbGSsZmojjHl2scE4IKPu1mj2ZuAA0Nakg+U2OIOu9Jh3mKjb
 uBHGr3W7aPfW4/5OL7OVUb6Tbwk5gtfGoFDLg=
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RXZlcnlvbmUgaXMganVzdCB1c2luZyBnZW1fb2JqZWN0LT5yZXN2IG5vdy4KClJldmlld2VkLWJ5
OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgpTaWduZWQtb2ZmLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IERhdmlkIEFpcmxp
ZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4K
Q2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+
CkNjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgpDYzogU2VhbiBQ
YXVsIDxzZWFuQHBvb3JseS5ydW4+Ci0tLQogRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgIHwg
IDkgLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMgfCAgMyAtLS0KIGluY2x1
ZGUvZHJtL2RybV9kcnYuaCAgICAgICB8IDEyIC0tLS0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2Vk
LCAyNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJz
dCBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0CmluZGV4IGQ0OWMxY2M2ZGMyOC4uZTcxN2Yy
ODBmOWFlIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAorKysgYi9Eb2N1
bWVudGF0aW9uL2dwdS90b2RvLnJzdApAQCAtMTk2LDE1ICsxOTYsNiBAQCBNaWdodCBiZSBnb29k
IHRvIGFsc28gaGF2ZSBzb21lIGlndCB0ZXN0Y2FzZXMgZm9yIHRoaXMuCiAKIENvbnRhY3Q6IERh
bmllbCBWZXR0ZXIsIE5vcmFsZiBUcm9ubmVzCiAKLVJlbW92ZSB0aGUgLT5nZW1fcHJpbWVfcmVz
X29iaiBjYWxsYmFjawotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KLQotVGhlIC0+Z2VtX3ByaW1lX3Jlc19vYmogY2FsbGJhY2sgY2FuIGJlIHJlbW92ZWQgZnJv
bSBkcml2ZXJzIGJ5IHVzaW5nIHRoZQotcmVzZXJ2YXRpb25fb2JqZWN0IGluIHRoZSBkcm1fZ2Vt
X29iamVjdC4gSXQgbWF5IGFsc28gYmUgcG9zc2libGUgdG8gdXNlIHRoZQotZ2VuZXJpYyBkcm1f
Z2VtX3Jlc2VydmF0aW9uX29iamVjdF93YWl0IGhlbHBlciBmb3Igd2FpdGluZyBmb3IgYSBiby4K
LQotQ29udGFjdDogRGFuaWVsIFZldHRlcgotCiBpZHJfaW5pdF9iYXNlKCkKIC0tLS0tLS0tLS0t
LS0tLQogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX3ByaW1lLmMKaW5kZXggMTg5ZDk4MDQwMmFkLi5iM2IwNDRkNDA4OWEgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX3ByaW1lLmMKQEAgLTgzNSw5ICs4MzUsNiBAQCBzdHJ1Y3QgZG1hX2J1ZiAqZHJtX2dl
bV9wcmltZV9leHBvcnQoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosCiAJCS5yZXN2ID0gb2Jq
LT5yZXN2LAogCX07CiAKLQlpZiAoZGV2LT5kcml2ZXItPmdlbV9wcmltZV9yZXNfb2JqKQotCQll
eHBfaW5mby5yZXN2ID0gZGV2LT5kcml2ZXItPmdlbV9wcmltZV9yZXNfb2JqKG9iaik7Ci0KIAly
ZXR1cm4gZHJtX2dlbV9kbWFidWZfZXhwb3J0KGRldiwgJmV4cF9pbmZvKTsKIH0KIEVYUE9SVF9T
WU1CT0woZHJtX2dlbV9wcmltZV9leHBvcnQpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJt
X2Rydi5oIGIvaW5jbHVkZS9kcm0vZHJtX2Rydi5oCmluZGV4IDk5MjdmNGY4OTRlZi4uMzgwZTEz
NGM1NDE1IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZHJ2LmgKKysrIGIvaW5jbHVkZS9k
cm0vZHJtX2Rydi5oCkBAIC02MTgsMTggKzYxOCw2IEBAIHN0cnVjdCBkcm1fZHJpdmVyIHsKIAkg
Ki8KIAlzdHJ1Y3Qgc2dfdGFibGUgKigqZ2VtX3ByaW1lX2dldF9zZ190YWJsZSkoc3RydWN0IGRy
bV9nZW1fb2JqZWN0ICpvYmopOwogCi0JLyoqCi0JICogQGdlbV9wcmltZV9yZXNfb2JqOgotCSAq
Ci0JICogT3B0aW9uYWwgaG9vayB0byBsb29rIHVwIHRoZSAmcmVzZXJ2YXRpb25fb2JqZWN0IGZv
ciBhbiBidWZmZXIgd2hlbgotCSAqIGV4cG9ydGluZyBpdC4KLQkgKgotCSAqIEZJWE1FOiBUaGlz
IGhvb2sgaXMgZGVwcmVjYXRlZC4gVXNlcnMgb2YgdGhpcyBob29rIHNob3VsZCBiZSByZXBsYWNl
ZAotCSAqIGJ5IHNldHRpbmcgJmRybV9nZW1fb2JqZWN0LnJlc3YgaW5zdGVhZC4KLQkgKi8KLQlz
dHJ1Y3QgcmVzZXJ2YXRpb25fb2JqZWN0ICogKCpnZW1fcHJpbWVfcmVzX29iaikoCi0JCQkJc3Ry
dWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOwotCiAJLyoqCiAJICogQGdlbV9wcmltZV9pbXBvcnRf
c2dfdGFibGU6CiAJICoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
