Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 133EA357CF
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 09:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C606895D7;
	Wed,  5 Jun 2019 07:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28EAE892C2
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 07:05:39 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id f97so9366317plb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 00:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lnLLdVOlusYEYXI+itkoU5Jat5K5TT8w7N1F2rwe390=;
 b=I2QhNzT78ZbtYuH3jNpEBWUpmfmdR2TajWNWBNzyLXJSVUnqWjNqKNthhYklx8DXOr
 o5Ff/KEPYPgYtdq+HpYRNa8C957hUPEaLnA6PmntJSJHG3KjzItDOj+P7NE90yQ6DXyI
 l+kngOts8zcOO8bttVhIUlxTnoIzWegiUekO9Pe9qR+DzBf4YoUZ7GfibVZuqicmG424
 GX5P41GFRq3+oA8s/wguoWNgClLguAtQ/ekBXVfveHpnBkSj5nm7UGzm6UsqYd4CfdYA
 EjDEsGvKHQv/CTNkc8aXDXVkemymbQpVUPG0osSLSFMy9nV1b/BeMAOpkGwjjo4pOw8B
 Zovw==
X-Gm-Message-State: APjAAAVxgitopVOAeRWMSPx6XVH4otWnh9g8zbKaT9nZPKVqqb+yIsuu
 94iKvS/3OkNfTDcRWvnsv9GtwV5P+yw=
X-Google-Smtp-Source: APXvYqxosOSGK/X48hpPYA1EtlqllcZl4FXcITFWzaZyuWAPxItNSho0urmjq/AA02M7XKgLnhenPQ==
X-Received: by 2002:a17:902:988b:: with SMTP id
 s11mr14564567plp.216.1559718337640; 
 Wed, 05 Jun 2019 00:05:37 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id d132sm6527348pfd.61.2019.06.05.00.05.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Jun 2019 00:05:37 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 10/15] drm/bridge: tc358767: Add support for address-only
 I2C transfers
Date: Wed,  5 Jun 2019 00:05:02 -0700
Message-Id: <20190605070507.11417-11-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190605070507.11417-1-andrew.smirnov@gmail.com>
References: <20190605070507.11417-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Jun 2019 07:33:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lnLLdVOlusYEYXI+itkoU5Jat5K5TT8w7N1F2rwe390=;
 b=XUdmC/bvWolT7eI9YQ2cUFGxT2x+UR40fKEvKzQytbCtCbLnVXn60ri7ZaGHoMx0GJ
 gHZMwaJ6ULtsNFeV3IRzhIAMLH9gi897sX3lZoyKqf1NqL389JgUcjcA938NcnXuyQxg
 zyy2gu9IBni0w5Y1sX4HSUvJxt+UaZK+svntZSnv0eWIgJyzhbx0Om8SL83kUCQ4dQlM
 Up5MZamVlHETacU8vcyB6GOrmyLuxwUD4XYMv1fgLBVVM04j8B1RDH1WDRYwyAhFuFo/
 SWhV8WXS23ZWu4J6clcwGKBzcCm7bZxM8l3G94IId7hQL6GyPWPH7tOkpvtmA06S5xok
 yZ4A==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Archit Taneja <architt@codeaurora.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VHJhbnNmZXIgc2l6ZSBvZiB6ZXJvIG1lYW5zIGEgcmVxdWVzdCB0byBkbyBhbiBhZGRyZXNzLW9u
bHkKdHJhbnNmZXIuIFNpbmNlIHRoZSBIVyBzdXBwb3J0IHRoaXMsIHdlIHByb2JhYmx5IHNob3Vs
ZG4ndCBiZSBqdXN0Cmlnbm9yaW5nIHN1Y2ggcmVxdWVzdHMuIFdoaWxlIGF0IGl0IGFsbG93IERQ
X0FVWF9JMkNfTU9UIGZsYWcgdG8gcGFzcwp0aHJvdWdoLCBzaW5jZSBpdCBpcyBzdXBwb3J0ZWQg
YnkgdGhlIEhXIGFzIHdlbGwuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgU21pcm5vdiA8YW5kcmV3
LnNtaXJub3ZAZ21haWwuY29tPgpDYzogQXJjaGl0IFRhbmVqYSA8YXJjaGl0dEBjb2RlYXVyb3Jh
Lm9yZz4KQ2M6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CkNjOiBMYXVyZW50
IFBpbmNoYXJ0IDxMYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CkNjOiBUb21pIFZh
bGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgpDYzogQW5kcmV5IEd1c2Frb3YgPGFuZHJl
eS5ndXNha292QGNvZ2VudGVtYmVkZGVkLmNvbT4KQ2M6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxA
cGVuZ3V0cm9uaXguZGU+CkNjOiBDb3J5IFR1c2FyIDxjb3J5LnR1c2FyQHppaS5hZXJvPgpDYzog
Q2hyaXMgSGVhbHkgPGNwaGVhbHlAZ21haWwuY29tPgpDYzogTHVjYXMgU3RhY2ggPGwuc3RhY2hA
cGVuZ3V0cm9uaXguZGU+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90
YzM1ODc2Ny5jIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Rj
MzU4NzY3LmMKaW5kZXggOTBlYzMzY2FhY2JjLi43Yjg0ZmJiNzI5NzMgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3RjMzU4NzY3LmMKQEAgLTE0NSw2ICsxNDUsOCBAQAogCiAvKiBBVVggY2hhbm5lbCAqLwog
I2RlZmluZSBEUDBfQVVYQ0ZHMAkJMHgwNjYwCisjZGVmaW5lIERQMF9BVVhDRkcwX0JTSVpFCUdF
Tk1BU0soMTEsIDgpCisjZGVmaW5lIERQMF9BVVhDRkcwX0FERFJfT05MWQlCSVQoNCkKICNkZWZp
bmUgRFAwX0FVWENGRzEJCTB4MDY2NAogI2RlZmluZSBBVVhfUlhfRklMVEVSX0VOCQlCSVQoMTYp
CiAKQEAgLTM0Nyw2ICszNDksMTggQEAgc3RhdGljIGludCB0Y19hdXhfcmVhZF9kYXRhKHN0cnVj
dCB0Y19kYXRhICp0Yywgdm9pZCAqZGF0YSwgc2l6ZV90IHNpemUpCiAJcmV0dXJuIHNpemU7CiB9
CiAKK3N0YXRpYyB1MzIgdGNfYXV4Y2ZnMChzdHJ1Y3QgZHJtX2RwX2F1eF9tc2cgKm1zZywgc2l6
ZV90IHNpemUpCit7CisJdTMyIGF1eGNmZzAgPSBtc2ctPnJlcXVlc3Q7CisKKwlpZiAoc2l6ZSkK
KwkJYXV4Y2ZnMCB8PSBGSUVMRF9QUkVQKERQMF9BVVhDRkcwX0JTSVpFLCBzaXplIC0gMSk7CisJ
ZWxzZQorCQlhdXhjZmcwIHw9IERQMF9BVVhDRkcwX0FERFJfT05MWTsKKworCXJldHVybiBhdXhj
ZmcwOworfQorCiBzdGF0aWMgc3NpemVfdCB0Y19hdXhfdHJhbnNmZXIoc3RydWN0IGRybV9kcF9h
dXggKmF1eCwKIAkJCSAgICAgICBzdHJ1Y3QgZHJtX2RwX2F1eF9tc2cgKm1zZykKIHsKQEAgLTM1
Niw5ICszNzAsNiBAQCBzdGF0aWMgc3NpemVfdCB0Y19hdXhfdHJhbnNmZXIoc3RydWN0IGRybV9k
cF9hdXggKmF1eCwKIAl1MzIgYXV4c3RhdHVzOwogCWludCByZXQ7CiAKLQlpZiAoc2l6ZSA9PSAw
KQotCQlyZXR1cm4gMDsKLQogCXJldCA9IHRjX2F1eF93YWl0X2J1c3kodGMsIDEwMCk7CiAJaWYg
KHJldCkKIAkJcmV0dXJuIHJldDsKQEAgLTM4Miw4ICszOTMsNyBAQCBzdGF0aWMgc3NpemVfdCB0
Y19hdXhfdHJhbnNmZXIoc3RydWN0IGRybV9kcF9hdXggKmF1eCwKIAlpZiAocmV0KQogCQlyZXR1
cm4gcmV0OwogCS8qIFN0YXJ0IHRyYW5zZmVyICovCi0JcmV0ID0gcmVnbWFwX3dyaXRlKHRjLT5y
ZWdtYXAsIERQMF9BVVhDRkcwLAotCQkJICAgKChzaXplIC0gMSkgPDwgOCkgfCByZXF1ZXN0KTsK
KwlyZXQgPSByZWdtYXBfd3JpdGUodGMtPnJlZ21hcCwgRFAwX0FVWENGRzAsIHRjX2F1eGNmZzAo
bXNnLCBzaXplKSk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIApAQCAtMzk3LDggKzQwNywx
NCBAQCBzdGF0aWMgc3NpemVfdCB0Y19hdXhfdHJhbnNmZXIoc3RydWN0IGRybV9kcF9hdXggKmF1
eCwKIAogCWlmIChhdXhzdGF0dXMgJiBBVVhfVElNRU9VVCkKIAkJcmV0dXJuIC1FVElNRURPVVQ7
Ci0KLQlzaXplID0gRklFTERfR0VUKEFVWF9CWVRFUywgYXV4c3RhdHVzKTsKKwkvKgorCSAqIEZv
ciBzb21lIHJlYXNvbiBhZGRyZXNzLW9ubHkgRFBfQVVYX0kyQ19XUklURSAoTU9UKSwgc3RpbGwK
KwkgKiByZXBvcnRzIDEgYnl0ZSB0cmFuc2ZlcnJlZCBpbiBpdHMgc3RhdHVzLiBUbyBkZWFsIHdl
IHRoYXQKKwkgKiB3ZSBpZ25vcmUgYXV4X2J5dGVzIGZpZWxkIGlmIHdlIGtub3cgdGhhdCB0aGlz
IHdhcyBhbgorCSAqIGFkZHJlc3Mtb25seSB0cmFuc2ZlcgorCSAqLworCWlmIChzaXplKQorCQlz
aXplID0gRklFTERfR0VUKEFVWF9CWVRFUywgYXV4c3RhdHVzKTsKIAltc2ctPnJlcGx5ID0gRklF
TERfR0VUKEFVWF9TVEFUVVMsIGF1eHN0YXR1cyk7CiAKIAlzd2l0Y2ggKHJlcXVlc3QpIHsKLS0g
CjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
