Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E32F143353
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501AC892CC;
	Thu, 13 Jun 2019 07:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7682489450
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:33:22 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id a93so6340287pla.7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 01:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YtcIT0Jg32O6R6ayXabHjP4bybCS1tEkrHIRDEcAfKg=;
 b=RHi9Ww58AE8IKXYNHESLthajR3PUIxL60CDc5258cowM9hl0tOgkHLj5SiJi7PfAlD
 JyNsw/fcScczer4FbYONbPgJAkLnXHovY0HGnexfSiB2vkxUDhcTrlorT8yaTjIkdbi7
 3zTdMvNjRz/cgS+JSvSZp9uHswrzK3zGvA7KzH0z2bh/Q40WXaf4ApS3hiQAioUqtUBP
 vLWDTV+o1ZiCGDTu4QZOE2zk+a73hEOa4+CkgOmF62P+dOXC58/j3zGGjZAfmMR7PdAA
 hXIQYNMMbbj/XUf/RtNW3rGocnVs3T3mkgfonbbv88KZT3LDX2vIM7ALCdtjOMc9SmJA
 aEfw==
X-Gm-Message-State: APjAAAU+jlMF5gA/46TblgAepFnqcRxotyviSp8ZTvKc2VatGQm0dnMI
 a4EMsoE+Buy9INX0hTd5Dljvsh8oxx8=
X-Google-Smtp-Source: APXvYqwbAe6w+pBXWpV/khAknaLn9mlo9tU7IuRdpdOReRnnZw5AJcw0sBxGVtGoOg7RDSyg5KHqbg==
X-Received: by 2002:a17:902:7246:: with SMTP id
 c6mr20639549pll.248.1560328401708; 
 Wed, 12 Jun 2019 01:33:21 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id d21sm18845991pfr.162.2019.06.12.01.33.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 01:33:20 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 10/15] drm/bridge: tc358767: Add support for address-only
 I2C transfers
Date: Wed, 12 Jun 2019 01:32:47 -0700
Message-Id: <20190612083252.15321-11-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190612083252.15321-1-andrew.smirnov@gmail.com>
References: <20190612083252.15321-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YtcIT0Jg32O6R6ayXabHjP4bybCS1tEkrHIRDEcAfKg=;
 b=gLfQOiMJREwfLUGXRDG7KOpR/5wG1izZ1Nif5YzwPV5Hj7i4bwIH2Mh2vYpcyc5nB6
 UvGNDCNyfSxrvL79GEHgWUCd6+NkBhjyPsGE0PntsfIRSQwaGylm1UPm/uSTSRIN43D9
 BDFn9H3lCoHIniq3aDXMFn2+LD4wha1P1UzvjwxwDtCGNl8a4h9Gubgd1PT71pe9sX7i
 TtpX3QXehQ4H60y2rKeMGHF3A0t+PsEQLqux0C0uEtcN3hsS1W8WTXCkPxRGNiN4H1tP
 YZpZf+jRWTkOqpmqqjoDKUMn8+vQVDb3cB1b5HSJEcwGeEkMQ+a+sq+a0ubdo8SwNI1F
 GxuQ==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Andrey Smirnov <andrew.smirnov@gmail.com>,
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
LnNtaXJub3ZAZ21haWwuY29tPgpSZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBz
YW1zdW5nLmNvbT4KQ2M6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CkNjOiBM
YXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CkNjOiBU
b21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgpDYzogQW5kcmV5IEd1c2Frb3Yg
PGFuZHJleS5ndXNha292QGNvZ2VudGVtYmVkZGVkLmNvbT4KQ2M6IFBoaWxpcHAgWmFiZWwgPHAu
emFiZWxAcGVuZ3V0cm9uaXguZGU+CkNjOiBDb3J5IFR1c2FyIDxjb3J5LnR1c2FyQHppaS5hZXJv
PgpDYzogQ2hyaXMgSGVhbHkgPGNwaGVhbHlAZ21haWwuY29tPgpDYzogTHVjYXMgU3RhY2ggPGwu
c3RhY2hAcGVuZ3V0cm9uaXguZGU+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
CkNjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS90YzM1ODc2Ny5jIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3RjMzU4NzY3LmMKaW5kZXggN2QwZmJiMTIxOTViLi40YmI5YjE1ZTEzMjQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3RjMzU4NzY3LmMKQEAgLTE0NSw2ICsxNDUsOCBAQAogCiAvKiBBVVggY2hhbm5l
bCAqLwogI2RlZmluZSBEUDBfQVVYQ0ZHMAkJMHgwNjYwCisjZGVmaW5lIERQMF9BVVhDRkcwX0JT
SVpFCUdFTk1BU0soMTEsIDgpCisjZGVmaW5lIERQMF9BVVhDRkcwX0FERFJfT05MWQlCSVQoNCkK
ICNkZWZpbmUgRFAwX0FVWENGRzEJCTB4MDY2NAogI2RlZmluZSBBVVhfUlhfRklMVEVSX0VOCQlC
SVQoMTYpCiAKQEAgLTMyNyw2ICszMjksMTggQEAgc3RhdGljIGludCB0Y19hdXhfcmVhZF9kYXRh
KHN0cnVjdCB0Y19kYXRhICp0Yywgdm9pZCAqZGF0YSwgc2l6ZV90IHNpemUpCiAJcmV0dXJuIHNp
emU7CiB9CiAKK3N0YXRpYyB1MzIgdGNfYXV4Y2ZnMChzdHJ1Y3QgZHJtX2RwX2F1eF9tc2cgKm1z
Zywgc2l6ZV90IHNpemUpCit7CisJdTMyIGF1eGNmZzAgPSBtc2ctPnJlcXVlc3Q7CisKKwlpZiAo
c2l6ZSkKKwkJYXV4Y2ZnMCB8PSBGSUVMRF9QUkVQKERQMF9BVVhDRkcwX0JTSVpFLCBzaXplIC0g
MSk7CisJZWxzZQorCQlhdXhjZmcwIHw9IERQMF9BVVhDRkcwX0FERFJfT05MWTsKKworCXJldHVy
biBhdXhjZmcwOworfQorCiBzdGF0aWMgc3NpemVfdCB0Y19hdXhfdHJhbnNmZXIoc3RydWN0IGRy
bV9kcF9hdXggKmF1eCwKIAkJCSAgICAgICBzdHJ1Y3QgZHJtX2RwX2F1eF9tc2cgKm1zZykKIHsK
QEAgLTMzNiw5ICszNTAsNiBAQCBzdGF0aWMgc3NpemVfdCB0Y19hdXhfdHJhbnNmZXIoc3RydWN0
IGRybV9kcF9hdXggKmF1eCwKIAl1MzIgYXV4c3RhdHVzOwogCWludCByZXQ7CiAKLQlpZiAoc2l6
ZSA9PSAwKQotCQlyZXR1cm4gMDsKLQogCXJldCA9IHRjX2F1eF93YWl0X2J1c3kodGMsIDEwMCk7
CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKQEAgLTM2Miw4ICszNzMsNyBAQCBzdGF0aWMgc3Np
emVfdCB0Y19hdXhfdHJhbnNmZXIoc3RydWN0IGRybV9kcF9hdXggKmF1eCwKIAlpZiAocmV0KQog
CQlyZXR1cm4gcmV0OwogCS8qIFN0YXJ0IHRyYW5zZmVyICovCi0JcmV0ID0gcmVnbWFwX3dyaXRl
KHRjLT5yZWdtYXAsIERQMF9BVVhDRkcwLAotCQkJICAgKChzaXplIC0gMSkgPDwgOCkgfCByZXF1
ZXN0KTsKKwlyZXQgPSByZWdtYXBfd3JpdGUodGMtPnJlZ21hcCwgRFAwX0FVWENGRzAsIHRjX2F1
eGNmZzAobXNnLCBzaXplKSk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIApAQCAtMzc3LDgg
KzM4NywxNCBAQCBzdGF0aWMgc3NpemVfdCB0Y19hdXhfdHJhbnNmZXIoc3RydWN0IGRybV9kcF9h
dXggKmF1eCwKIAogCWlmIChhdXhzdGF0dXMgJiBBVVhfVElNRU9VVCkKIAkJcmV0dXJuIC1FVElN
RURPVVQ7Ci0KLQlzaXplID0gRklFTERfR0VUKEFVWF9CWVRFUywgYXV4c3RhdHVzKTsKKwkvKgor
CSAqIEZvciBzb21lIHJlYXNvbiBhZGRyZXNzLW9ubHkgRFBfQVVYX0kyQ19XUklURSAoTU9UKSwg
c3RpbGwKKwkgKiByZXBvcnRzIDEgYnl0ZSB0cmFuc2ZlcnJlZCBpbiBpdHMgc3RhdHVzLiBUbyBk
ZWFsIHdlIHRoYXQKKwkgKiB3ZSBpZ25vcmUgYXV4X2J5dGVzIGZpZWxkIGlmIHdlIGtub3cgdGhh
dCB0aGlzIHdhcyBhbgorCSAqIGFkZHJlc3Mtb25seSB0cmFuc2ZlcgorCSAqLworCWlmIChzaXpl
KQorCQlzaXplID0gRklFTERfR0VUKEFVWF9CWVRFUywgYXV4c3RhdHVzKTsKIAltc2ctPnJlcGx5
ID0gRklFTERfR0VUKEFVWF9TVEFUVVMsIGF1eHN0YXR1cyk7CiAKIAlzd2l0Y2ggKHJlcXVlc3Qp
IHsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
