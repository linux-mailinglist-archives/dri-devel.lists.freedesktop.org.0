Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 003F36C105
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 20:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C57B6E299;
	Wed, 17 Jul 2019 18:33:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0AF6E299
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 18:33:57 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id k8so47416957iot.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 11:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1UIlM7SqWsgXXGozfeMCqufFvDydJKnsrEypmQVIzCo=;
 b=NSAij7v2lJegyqYqz+tlXfL1JKMNnsA/NhaoCgJU3GxFjeIpflVPBxBFvQywRnz9VA
 N0+IJOXH1MLT82VY1SM9VWBvaL4pDjvOa8Ki18aeBZFIGIIyQItFvw8sunkamx/Lv2tD
 RvUi1zbtQlhq54BKf9XaHdg2wFckTbx4LTt27fcVY6io2AyLIwqREz7c2ab8xrNzowFV
 MBVehfK/THZzA4rzCA+sIM8QPqDMiRgEp+X8GFp7DtTt1SLW4R1RxjgAwrypA2HWrG9t
 T2PdNH1H/ch5v9jGOnDtmMn8mdXXkiSXLetLNCroyHSVdvEhsg2KHRgBtARP4vsf+cJx
 VF6A==
X-Gm-Message-State: APjAAAWJrxEqaDd/GbCNZStAwQN+Pe4gCTnhBg7boH+Qa6rqPTSYW7CF
 HrlMOqZNVxlgQg8ytsvUuYpfiX8=
X-Google-Smtp-Source: APXvYqw4PXgKz44TiD4w7CoMw8wlhAGfC3U8GKAu5D1K2rSvA0ApTMBlVfs2ygyv/XWRBVEBq15d1g==
X-Received: by 2002:a05:6602:220a:: with SMTP id
 n10mr38905737ion.205.1563388436085; 
 Wed, 17 Jul 2019 11:33:56 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.255])
 by smtp.googlemail.com with ESMTPSA id v10sm22109472iob.43.2019.07.17.11.33.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 17 Jul 2019 11:33:54 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/panfrost: Split panfrost_mmu_map SG list mapping to
 its own function
Date: Wed, 17 Jul 2019 12:33:49 -0600
Message-Id: <20190717183352.22519-2-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190717183352.22519-1-robh@kernel.org>
References: <20190717183352.22519-1-robh@kernel.org>
MIME-Version: 1.0
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gcHJlcGFyYXRpb24gdG8gY3JlYXRlIHBhcnRpYWwgR1BVIG1hcHBpbmdzIG9mIEJPcyBvbiBw
YWdlIGZhdWx0cywKc3BsaXQgb3V0IHRoZSBTRyBsaXN0IGhhbmRsaW5nIG9mIHBhbmZyb3N0X21t
dV9tYXAoKS4KCkNjOiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgpD
YzogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KQ2M6IFJv
YmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+CkNjOiBTdGV2ZW4gUHJpY2UgPHN0ZXZl
bi5wcmljZUBhcm0uY29tPgpDYzogQWx5c3NhIFJvc2VuendlaWcgPGFseXNzYUByb3Nlbnp3ZWln
LmlvPgpTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYyB8IDUyICsrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMKaW5kZXggZjUwMmU5
MWJlNDJhLi41MzgzYjgzN2YwNGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9z
dC9wYW5mcm9zdF9tbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rf
bW11LmMKQEAgLTE2NywyNyArMTY3LDEzIEBAIHN0YXRpYyBzaXplX3QgZ2V0X3Bnc2l6ZSh1NjQg
YWRkciwgc2l6ZV90IHNpemUpCiAJcmV0dXJuIFNaXzJNOwogfQogCi1pbnQgcGFuZnJvc3RfbW11
X21hcChzdHJ1Y3QgcGFuZnJvc3RfZ2VtX29iamVjdCAqYm8pCitzdGF0aWMgaW50IG1tdV9tYXBf
c2coc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYsIHU2NCBpb3ZhLAorCQkgICAgICBpbnQg
cHJvdCwgc3RydWN0IHNnX3RhYmxlICpzZ3QpCiB7Ci0Jc3RydWN0IGRybV9nZW1fb2JqZWN0ICpv
YmogPSAmYm8tPmJhc2UuYmFzZTsKLQlzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldiA9IHRv
X3BhbmZyb3N0X2RldmljZShvYmotPmRldik7Ci0Jc3RydWN0IGlvX3BndGFibGVfb3BzICpvcHMg
PSBwZmRldi0+bW11LT5wZ3RibF9vcHM7Ci0JdTY0IGlvdmEgPSBiby0+bm9kZS5zdGFydCA8PCBQ
QUdFX1NISUZUOwogCXVuc2lnbmVkIGludCBjb3VudDsKIAlzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNn
bDsKLQlzdHJ1Y3Qgc2dfdGFibGUgKnNndDsKLQlpbnQgcmV0OwotCi0JaWYgKFdBUk5fT04oYm8t
PmlzX21hcHBlZCkpCi0JCXJldHVybiAwOwotCi0Jc2d0ID0gZHJtX2dlbV9zaG1lbV9nZXRfcGFn
ZXNfc2d0KG9iaik7Ci0JaWYgKFdBUk5fT04oSVNfRVJSKHNndCkpKQotCQlyZXR1cm4gUFRSX0VS
UihzZ3QpOwotCi0JcmV0ID0gcG1fcnVudGltZV9nZXRfc3luYyhwZmRldi0+ZGV2KTsKLQlpZiAo
cmV0IDwgMCkKLQkJcmV0dXJuIHJldDsKKwlzdHJ1Y3QgaW9fcGd0YWJsZV9vcHMgKm9wcyA9IHBm
ZGV2LT5tbXUtPnBndGJsX29wczsKKwl1NjQgc3RhcnRfaW92YSA9IGlvdmE7CiAKIAltdXRleF9s
b2NrKCZwZmRldi0+bW11LT5sb2NrKTsKIApAQCAtMjAwLDE4ICsxODYsNDIgQEAgaW50IHBhbmZy
b3N0X21tdV9tYXAoc3RydWN0IHBhbmZyb3N0X2dlbV9vYmplY3QgKmJvKQogCQl3aGlsZSAobGVu
KSB7CiAJCQlzaXplX3QgcGdzaXplID0gZ2V0X3Bnc2l6ZShpb3ZhIHwgcGFkZHIsIGxlbik7CiAK
LQkJCW9wcy0+bWFwKG9wcywgaW92YSwgcGFkZHIsIHBnc2l6ZSwgSU9NTVVfV1JJVEUgfCBJT01N
VV9SRUFEKTsKKwkJCW9wcy0+bWFwKG9wcywgaW92YSwgcGFkZHIsIHBnc2l6ZSwgcHJvdCk7CiAJ
CQlpb3ZhICs9IHBnc2l6ZTsKIAkJCXBhZGRyICs9IHBnc2l6ZTsKIAkJCWxlbiAtPSBwZ3NpemU7
CiAJCX0KIAl9CiAKLQltbXVfaHdfZG9fb3BlcmF0aW9uKHBmZGV2LCAwLCBiby0+bm9kZS5zdGFy
dCA8PCBQQUdFX1NISUZULAotCQkJICAgIGJvLT5ub2RlLnNpemUgPDwgUEFHRV9TSElGVCwgQVNf
Q09NTUFORF9GTFVTSF9QVCk7CisJbW11X2h3X2RvX29wZXJhdGlvbihwZmRldiwgMCwgc3RhcnRf
aW92YSwgaW92YSAtIHN0YXJ0X2lvdmEsCisJCQkgICAgQVNfQ09NTUFORF9GTFVTSF9QVCk7CiAK
IAltdXRleF91bmxvY2soJnBmZGV2LT5tbXUtPmxvY2spOwogCisJcmV0dXJuIDA7Cit9CisKK2lu
dCBwYW5mcm9zdF9tbXVfbWFwKHN0cnVjdCBwYW5mcm9zdF9nZW1fb2JqZWN0ICpibykKK3sKKwlz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiA9ICZiby0+YmFzZS5iYXNlOworCXN0cnVjdCBwYW5m
cm9zdF9kZXZpY2UgKnBmZGV2ID0gdG9fcGFuZnJvc3RfZGV2aWNlKG9iai0+ZGV2KTsKKwlzdHJ1
Y3Qgc2dfdGFibGUgKnNndDsKKwlpbnQgcmV0OworCWludCBwcm90ID0gSU9NTVVfUkVBRCB8IElP
TU1VX1dSSVRFOworCisJaWYgKFdBUk5fT04oYm8tPmlzX21hcHBlZCkpCisJCXJldHVybiAwOwor
CisJc2d0ID0gZHJtX2dlbV9zaG1lbV9nZXRfcGFnZXNfc2d0KG9iaik7CisJaWYgKFdBUk5fT04o
SVNfRVJSKHNndCkpKQorCQlyZXR1cm4gUFRSX0VSUihzZ3QpOworCisJcmV0ID0gcG1fcnVudGlt
ZV9nZXRfc3luYyhwZmRldi0+ZGV2KTsKKwlpZiAocmV0IDwgMCkKKwkJcmV0dXJuIHJldDsKKwor
CW1tdV9tYXBfc2cocGZkZXYsIGJvLT5ub2RlLnN0YXJ0IDw8IFBBR0VfU0hJRlQsIHByb3QsIHNn
dCk7CisKIAlwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KHBmZGV2LT5kZXYpOwogCXBtX3J1bnRp
bWVfcHV0X2F1dG9zdXNwZW5kKHBmZGV2LT5kZXYpOwogCWJvLT5pc19tYXBwZWQgPSB0cnVlOwot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
