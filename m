Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F38C92B42C
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB8E89C54;
	Mon, 27 May 2019 12:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE6B89700
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 04:51:35 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id n19so8855831pfa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2019 21:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nTNnUu5Pg74lFPYV76pxj/avOtvPxN38IgfsN4zW7KQ=;
 b=gds9nZewTh6BAOg1jzq7w1Wx+BYjz0CpoW8x2keOv3CyIOydRNmdozloMSFg3VfHHb
 ar+b1IRI4Ocoze+YarMefF8BIzzniQ0DRMwrnIykSdY1vj8c5nV1NTgdrPdHZgwUDSGW
 c2izGWl2K8mPSq04wOUCPM5Gq4dSKAGLriaK8rweEtF77kim1AWfhrcKRFHo30uQAJAg
 CV7oUSA5DBP9RGL/QCT73KZzM2Ooml1elUQJqG8rb/sV3w/8ptzlPtmTgt3abqkfqWG4
 K7cAZJilGd5u+F/eg/hwHsCe/uzwEDBKL4deAVbvIrOke/qghMIRpoO6Q2WoSMdsGt9f
 4iKg==
X-Gm-Message-State: APjAAAWKtrAdFvhDV23wSFsTc/0Dfi0/41CRd5WtnSUH6QUf0eobMM0P
 6yOjTA+OHsYFoqPLrHNIw4pQmw==
X-Google-Smtp-Source: APXvYqx8WppvdjWZOUQtU7qfCXOcLLa/ChE21AsiaFIreNV8ZZUyC8OHhrhAkIaKUz2GmqI9e+qn3Q==
X-Received: by 2002:a17:90a:fa09:: with SMTP id
 cm9mr28441942pjb.137.1558932695346; 
 Sun, 26 May 2019 21:51:35 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id t18sm8082745pgm.69.2019.05.26.21.51.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 26 May 2019 21:51:34 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] drm: mediatek: remove clk_unprepare() in
 mtk_drm_crtc_destroy()
Date: Mon, 27 May 2019 12:50:53 +0800
Message-Id: <20190527045054.113259-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190527045054.113259-1-hsinyi@chromium.org>
References: <20190527045054.113259-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nTNnUu5Pg74lFPYV76pxj/avOtvPxN38IgfsN4zW7KQ=;
 b=fjbKiekoEYOoJBE0nUV6/Q9YCysuZfEp+pEMPPi41BXxdQCweXz3u6dxC632AR4SmS
 y2yCfjzWKum60A/UdH1QkxrFpcR111NmZhwY2ZqRwh9ElglQSnMEFWXz4doFbAksG3fj
 /Q/d3ScgIQ/QIeK6u0PHG4rbgVSsL949aTXQg=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUgaXMgbm8gY2xrX3ByZXBhcmUoKSBjYWxsZWQgaW4gbXRrX2RybV9jcnRjX3Jlc2V0KCks
IHdoZW4gdW5iaW5kaW5nCmRybSBkZXZpY2UsIG10a19kcm1fY3J0Y19kZXN0cm95KCkgd2lsbCBi
ZSB0cmlnZ2VyZWQsIGFuZCB0aGUgY2xvY2tzIHdpbGwKYmUgZGlzYWJsZWQgYW5kIHVucHJlcGFy
ZWQgaW4gbXRrX2NydGNfZGRwX2Nsa19kaXNhYmxlLiBJZiBjbGtfdW5wcmVwYXJlKCkKaXMgY2Fs
bGVkIGhlcmUsIHdlJ2xsIGdldCB3YXJuaW5nc1sxXSwgc28gcmVtb3ZlIGNsa191bnByZXBhcmUo
KSBoZXJlLgoKWzFdClsgICAxOS40MTYwMjBdIG1tX2Rpc3Bfb3ZsMCBhbHJlYWR5IHVucHJlcGFy
ZWQKLi4uLgpbICAgMTkuNDg3NTM2XSBwc3RhdGU6IDYwMDAwMDA1IChuWkN2IGRhaWYgLVBBTiAt
VUFPKQpbICAgMTkuNDkyMzI1XSBwYyA6IGNsa19jb3JlX3VucHJlcGFyZSsweDFkOC8weDIyMApb
ICAgMTkuNDk2ODUxXSBsciA6IGNsa19jb3JlX3VucHJlcGFyZSsweDFkOC8weDIyMApbICAgMTku
NTAxMzczXSBzcCA6IGZmZmZmZjgwMTdiYmJhMzAKWyAgIDE5LjUwNDY4MV0geDI5OiBmZmZmZmY4
MDE3YmJiYTUwIHgyODogZmZmZmZmZjNmNzk3ODAwMApbICAgMTkuNTA5OTg5XSB4Mjc6IDAwMDAw
MDAwMDAwMDAwMDAgeDI2OiAwMDAwMDAwMDAwMDAwMDAwClsgICAxOS41MTUyOThdIHgyNTogMDAw
MDAwMDA0NDAwMDAwMCB4MjQ6IGZmZmZmZmYzZjc5NzgwMDAKWyAgIDE5LjUyMDYwNV0geDIzOiAw
MDAwMDAwMDAwMDAwMDYwIHgyMjogZmZmZmZmOTY4OGE4OWY0OApbICAgMTkuNTI1OTEyXSB4MjE6
IGZmZmZmZmYzZjg3NTU1NDAgeDIwOiAwMDAwMDAwMDAwMDAwMDAwClsgICAxOS41MzEyMTldIHgx
OTogZmZmZmZmZjNmOWQ1Y2EwMCB4MTg6IDAwMDAwMDAwZmZmZWJkMTgKWyAgIDE5LjUzNjUyNl0g
eDE3OiAwMDAwMDAwMDAwMDAwMDNjIHgxNjogZmZmZmZmOTY4ODE0NThlNApbICAgMTkuNTQxODMz
XSB4MTU6IDAwMDAwMDAwMDAwMDAwMDUgeDE0OiA3MDY1NzI3MDZlNzUyMDc5ClsgICAxOS41NDcx
NDBdIHgxMzogZmZmZmZmODAwODVjYzk1MCB4MTI6IDAwMDAwMDAwMDAwMDAwMDAKWyAgIDE5LjU1
MjQ0Nl0geDExOiAwMDAwMDAwMDAwMDAwMDAwIHgxMDogMDAwMDAwMDAwMDAwMDAwMApbICAgMTku
NTU3NzU0XSB4OSA6IDFiMGZhMjFmMGVjMGQ4MDAgeDggOiAxYjBmYTIxZjBlYzBkODAwClsgICAx
OS41NjMwNjBdIHg3IDogMDAwMDAwMDAwMDAwMDAwMCB4NiA6IGZmZmZmZjk2ODhiNWRkMDcKWyAg
IDE5LjU2ODM2Nl0geDUgOiAwMDAwMDAwMDAwMDAwMDAwIHg0IDogMDAwMDAwMDAwMDAwMDAwMApb
ICAgMTkuNTczNjczXSB4MyA6IDAwMDAwMDAwMDAwMDAwMDAgeDIgOiBmZmZmZmZmM2ZmZmEwMjQ4
ClsgICAxOS41Nzg5NzldIHgxIDogZmZmZmZmZjNmZmY5N2EwMCB4MCA6IDAwMDAwMDAwMDAwMDAw
MWYKWyAgIDE5LjU4NDI4OF0gQ2FsbCB0cmFjZToKWyAgIDE5LjU4NjczNF0gIGNsa19jb3JlX3Vu
cHJlcGFyZSsweDFkOC8weDIyMApbICAgMTkuNTkwOTE0XSAgY2xrX3VucHJlcGFyZSsweDMwLzB4
NDAKWyAgIDE5LjU5NDQ5MV0gIG10a19kcm1fY3J0Y19kZXN0cm95KzB4MzAvMHg1YwpbICAgMTku
NTk4NjcyXSAgZHJtX21vZGVfY29uZmlnX2NsZWFudXArMHgxMjQvMHgyOTAKWyAgIDE5LjYwMzI4
Nl0gIG10a19kcm1fdW5iaW5kKzB4NDQvMHg1YwpbICAgMTkuNjA2OTQ2XSAgdGFrZV9kb3duX21h
c3RlcisweDQwLzB4NTQKWyAgIDE5LjYxMDc3NV0gIGNvbXBvbmVudF9tYXN0ZXJfZGVsKzB4NzAv
MHg5NApbICAgMTkuNjE0OTUyXSAgbXRrX2RybV9yZW1vdmUrMHgyOC8weDQ0ClsgICAxOS42MTg2
MTJdICBwbGF0Zm9ybV9kcnZfcmVtb3ZlKzB4MjgvMHg1MApbICAgMTkuNjIyNzAyXSAgZGV2aWNl
X3JlbGVhc2VfZHJpdmVyX2ludGVybmFsKzB4MTM4LzB4MWVjClsgICAxOS42Mjc5MjFdICBkZXZp
Y2VfcmVsZWFzZV9kcml2ZXIrMHgyNC8weDMwClsgICAxOS42MzIxODVdICB1bmJpbmRfc3RvcmUr
MHg5MC8weGRjClsgICAxOS42MzU2NjddICBkcnZfYXR0cl9zdG9yZSsweDNjLzB4NTQKWyAgIDE5
LjYzOTMyN10gIHN5c2ZzX2tmX3dyaXRlKzB4NTAvMHg2OApbICAgMTkuNjQyOTg2XSAga2VybmZz
X2ZvcF93cml0ZSsweDEyYy8weDFjOApbICAgMTkuNjQ2OTk3XSAgX192ZnNfd3JpdGUrMHg1NC8w
eDE1YwpbICAgMTkuNjUwNDgyXSAgdmZzX3dyaXRlKzB4Y2MvMHgxODgKWyAgIDE5LjY1Mzc5Ml0g
IGtzeXNfd3JpdGUrMHg3OC8weGQ4ClsgICAxOS42NTcxMDRdICBfX2FybTY0X3N5c193cml0ZSsw
eDIwLzB4MmMKWyAgIDE5LjY2MTAyN10gIGVsMF9zdmNfY29tbW9uKzB4OWMvMHhmYwpbICAgMTku
NjY0Njg2XSAgZWwwX3N2Y19jb21wYXRfaGFuZGxlcisweDJjLzB4MzgKWyAgIDE5LjY2OTAzOV0g
IGVsMF9zdmNfY29tcGF0KzB4OC8weDE4ClsgICAxOS42NzI2MDldIC0tLVsgZW5kIHRyYWNlIDQx
Y2U5NTQ4NTVjZGE2ZjAgXS0tLQoKRml4ZXM6IDExOWY1MTczNjI4YSAoImRybS9tZWRpYXRlazog
QWRkIERSTSBEcml2ZXIgZm9yIE1lZGlhdGVrIFNvQyBNVDgxNzMuIikKU2lnbmVkLW9mZi1ieTog
SHNpbi1ZaSBXYW5nIDxoc2lueWlAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2NydGMuYyB8IDQgLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0
Yy5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jCmluZGV4IGFjYWQw
ODgxNzNkYS4uYzJiMzg5OTdhYzhiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9jcnRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
Y3J0Yy5jCkBAIC05OCwxMCArOTgsNiBAQCBzdGF0aWMgdm9pZCBtdGtfZHJtX2ZpbmlzaF9wYWdl
X2ZsaXAoc3RydWN0IG10a19kcm1fY3J0YyAqbXRrX2NydGMpCiBzdGF0aWMgdm9pZCBtdGtfZHJt
X2NydGNfZGVzdHJveShzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCiB7CiAJc3RydWN0IG10a19kcm1f
Y3J0YyAqbXRrX2NydGMgPSB0b19tdGtfY3J0YyhjcnRjKTsKLQlpbnQgaTsKLQotCWZvciAoaSA9
IDA7IGkgPCBtdGtfY3J0Yy0+ZGRwX2NvbXBfbnI7IGkrKykKLQkJY2xrX3VucHJlcGFyZShtdGtf
Y3J0Yy0+ZGRwX2NvbXBbaV0tPmNsayk7CiAKIAltdGtfZGlzcF9tdXRleF9wdXQobXRrX2NydGMt
Pm11dGV4KTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
