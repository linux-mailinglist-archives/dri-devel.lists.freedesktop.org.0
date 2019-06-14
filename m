Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E525A45494
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 08:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85D7892B0;
	Fri, 14 Jun 2019 06:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F18892F3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 06:18:33 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id z25so1810850edq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 23:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3C/qUXp8aczHmHtf8/5/PFxFflnNtEfB9brG9+Ex3bU=;
 b=Vsj9F1GALLJr0OvhzdCAQOXU1q70+QB+fvbNabDotCMxV6BJdouj7r/aZR1tQcrQ85
 eX+qAgYFQPsrjJTbDKMP8vL1Hp2p65DOLHOmG5vK7NJJmgyj23f3N/dLOBXIaS4cl05G
 qN7ZHwcRQofRsvhbjqOdlb8ckeP1rjzSJ5owG5k/wL+zFQhJZ1UEckx+kwmndRchLtTF
 LzVZShtR7dXw2NDWvmNKRONu65Z3a+RjxUOYFF1CYXUq6dH73l300wLJWacWFrr23EmJ
 ei/ST2Z1yqcgsxHfOXkW0Ef3S6XIJo55OahfoKCeqBe0psZ770M51+f6h7hI7cIUeT4w
 m19w==
X-Gm-Message-State: APjAAAWOfj0iEm4aOLaH6blHOAFt0lrnAyneFIgRbzObvsMU6t8ve2KS
 nnfJkI4hVqpStMC4iDVcz880y1LqiL8=
X-Google-Smtp-Source: APXvYqxkVdkll9QjFd6tFY0aZxoRukIgkdwq8DHzIg/GYLU7EFMLsvwb1i6Apq4/QTxK8bUDlQhrMw==
X-Received: by 2002:a50:9107:: with SMTP id e7mr13817081eda.280.1560493112131; 
 Thu, 13 Jun 2019 23:18:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id s27sm576873eda.36.2019.06.13.23.18.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 23:18:31 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/kms: Catch mode_object lifetime errors
Date: Fri, 14 Jun 2019 08:17:23 +0200
Message-Id: <20190614061723.1173-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3C/qUXp8aczHmHtf8/5/PFxFflnNtEfB9brG9+Ex3bU=;
 b=E0RUy5xsqdQAaLwT747kPTnkJmPd2WRa8OFKVrhckgEHmxNYeP3/slvqo2oUBXBnhq
 wHI3Rr0P3CV4wWvjBpBRjkGD1Ek0DM2DgE9LMx9Ftsd0PHOJ+b9IiQO33/FwehNE7V8H
 UJTIsJS+YTCslqneojLNzq8zVamv1l62qOHSM=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T25seSBkeW5hbWljIG1vZGUgb2JqZWN0cywgaS5lLiB0aG9zZSB3aGljaCBhcmUgcmVmY291bnRl
ZCBhbmQgaGF2ZSBhIGZyZWUKY2FsbGJhY2ssIGNhbiBiZSBhZGRlZCB3aGlsZSB0aGUgb3ZlcmFs
bCBkcm1fZGV2aWNlIGlzIHZpc2libGUgdG8KdXNlcnNwYWNlLiBBbGwgb3RoZXJzIG11c3QgYmUg
YWRkZWQgYmVmb3JlIGRybV9kZXZfcmVnaXN0ZXIgYW5kCnJlbW92ZWQgYWZ0ZXIgZHJtX2Rldl91
bnJlZ2lzdGVyLgoKU21hbGwgaXNzdWUgYXJvdW5kIGRyaXZlcnMgc3RpbGwgdXNpbmcgdGhlIGxv
YWQvdW5sb2FkIGNhbGxiYWNrcywgd2UKbmVlZCB0byBtYWtlIHN1cmUgd2Ugc2V0IGRldi0+cmVn
aXN0ZXJlZCBzbyB0aGF0IGxvYWQvdW5sb2FkIGNvZGUgaW4KdGhlc2UgY2FsbGJhY2tzIGRvZXNu
J3QgdHJpZ2dlciBmYWxzZSB3YXJuaW5ncy4gT25seSBhIHNtYWxsCmFkanVzdGVtZW50IGluIGRy
bV9kZXZfcmVnaXN0ZXIgd2FzIG5lZWRlZC4KCk1vdGl2YXRlZCBieSBzb21lIGlyYyBkaXNjdXNz
aW9ucyBhYm91dCBvYmplY3QgaWRzIG9mIGR5bmFtaWMgb2JqZWN0cwpsaWtlIGJsb2JzIGJlY29t
ZSBpbnZhbGlkLCBhbmQgbWUgZ29pbmcgb24gYSBiaXQgYW4gYXVkaXQgc3ByZWUuCgpTaWduZWQt
b2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX2Rydi5jICAgICAgICAgfCA0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9k
cm1fbW9kZV9vYmplY3QuYyB8IDQgKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYu
YyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMKaW5kZXggY2I2ZjAyNDVkZTdjLi40OGM4NGUz
ZTE5MzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9kcnYuYwpAQCAtOTk3LDE0ICs5OTcsMTQgQEAgaW50IGRybV9kZXZfcmVn
aXN0ZXIoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgbG9uZyBmbGFncykKIAlpZiAo
cmV0KQogCQlnb3RvIGVycl9taW5vcnM7CiAKLQlkZXYtPnJlZ2lzdGVyZWQgPSB0cnVlOwotCiAJ
aWYgKGRldi0+ZHJpdmVyLT5sb2FkKSB7CiAJCXJldCA9IGRldi0+ZHJpdmVyLT5sb2FkKGRldiwg
ZmxhZ3MpOwogCQlpZiAocmV0KQogCQkJZ290byBlcnJfbWlub3JzOwogCX0KIAorCWRldi0+cmVn
aXN0ZXJlZCA9IHRydWU7CisKIAlpZiAoZHJtX2NvcmVfY2hlY2tfZmVhdHVyZShkZXYsIERSSVZF
Ul9NT0RFU0VUKSkKIAkJZHJtX21vZGVzZXRfcmVnaXN0ZXJfYWxsKGRldik7CiAKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9vYmplY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fbW9kZV9vYmplY3QuYwppbmRleCAxYzZlNTExMzU5NjIuLmMzNTViYThlNmQ1ZCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX29iamVjdC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fbW9kZV9vYmplY3QuYwpAQCAtNDIsNiArNDIsOCBAQCBpbnQgX19kcm1fbW9kZV9v
YmplY3RfYWRkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fbW9kZV9vYmplY3Qg
Km9iaiwKIHsKIAlpbnQgcmV0OwogCisJV0FSTl9PTihkZXYtPnJlZ2lzdGVyZWQgJiYgIW9ial9m
cmVlX2NiKTsKKwogCW11dGV4X2xvY2soJmRldi0+bW9kZV9jb25maWcuaWRyX211dGV4KTsKIAly
ZXQgPSBpZHJfYWxsb2MoJmRldi0+bW9kZV9jb25maWcub2JqZWN0X2lkciwgcmVnaXN0ZXJfb2Jq
ID8gb2JqIDogTlVMTCwKIAkJCTEsIDAsIEdGUF9LRVJORUwpOwpAQCAtMTAyLDYgKzEwNCw4IEBA
IHZvaWQgZHJtX21vZGVfb2JqZWN0X3JlZ2lzdGVyKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiB2
b2lkIGRybV9tb2RlX29iamVjdF91bnJlZ2lzdGVyKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJ
CQkJc3RydWN0IGRybV9tb2RlX29iamVjdCAqb2JqZWN0KQogeworCVdBUk5fT04oZGV2LT5yZWdp
c3RlcmVkICYmICFvYmplY3QtPmZyZWVfY2IpOworCiAJbXV0ZXhfbG9jaygmZGV2LT5tb2RlX2Nv
bmZpZy5pZHJfbXV0ZXgpOwogCWlmIChvYmplY3QtPmlkKSB7CiAJCWlkcl9yZW1vdmUoJmRldi0+
bW9kZV9jb25maWcub2JqZWN0X2lkciwgb2JqZWN0LT5pZCk7Ci0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
