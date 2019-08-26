Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6C49D2A9
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 17:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56326E231;
	Mon, 26 Aug 2019 15:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B559C6E21D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 15:26:57 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E2E1828BCD0;
 Mon, 26 Aug 2019 16:26:55 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 04/21] drm/exynos: Fix potential unbalanced calls to
 pm_runtime_put
Date: Mon, 26 Aug 2019 17:26:32 +0200
Message-Id: <20190826152649.13820-5-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190826152649.13820-1-boris.brezillon@collabora.com>
References: <20190826152649.13820-1-boris.brezillon@collabora.com>
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGVuY29kZXItPmVuYWJsZSgpIGNhbid0IHJlcG9ydCBlcnJvcnMgYW5kIGlzIGV4cGVjdGVk
IHRvIGFsd2F5cwpzdWNjZWVkLiBJZiB3ZSBjYWxsIHBtX3J1bnRpbWVfcHV0KCkgaW4gdGhlIGV4
eW5vc19kc2lfZW5hYmxlKCkgZXJyb3IKcGF0aCAoYXMgY3VycmVudGx5IGRvbmUpIHdlJ2xsIGhh
dmUgdW5iYWxhbmNlZCBnZXQvcHV0IGNhbGxzIHdoZW4KZW5jb2Rlci0+ZGlzYWJsZSgpIGlzIGNh
bGxlZC4KClRoZSBzaXR1YXRpb24gaXMgbm90IGlkZWFsIHNpbmNlIGRybV9wYW5lbF97cHJlcGFy
ZSxlbmFibGV9KCkgY2FuCnRoZW9yZXRpY2FsbHkgcmV0dXJuIGFuIGVycm9yIChldmVuIGlmIGlu
IHByYWN0aWNlIEkgZG9uJ3QgdGhpbmsgYW55CnBhbmVsIGRyaXZlciBkb2VzIHRoYXQpLiBQdXR0
aW5nIGEgV0FSTl9PTigpIGlzIHRoZSBiZXN0IHdlIGNhbiBkbywKdW5mb3J0dW5hdGVseS4gTm90
ZSB0aGF0IC1FTk9TWVMgaXMgYWN0dWFsbHkgYSB2YWxpZCBjYXNlLCBpdCBqdXN0Cm1lYW5zIHRo
ZSBwYW5lbCBkcml2ZXIgZG9lcyBub3QgaW1wbGVtZW50IHRoZSBob29rLgoKU2lnbmVkLW9mZi1i
eTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KLS0tCkNo
YW5nZXMgaW4gdjI6CiogTmV3IHBhdGNoCi0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlu
b3NfZHJtX2RzaS5jIHwgMTQgKystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9l
eHlub3MvZXh5bm9zX2RybV9kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2Ry
bV9kc2kuYwppbmRleCA4ZTY1NWFlMWZiMGMuLmM1NTVjZWNmZTFmNSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9kc2kuYwpAQCAtMTM4Nyw4ICsxMzg3LDcgQEAgc3RhdGljIHZv
aWQgZXh5bm9zX2RzaV9lbmFibGUoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQogCiAJaWYg
KGRzaS0+cGFuZWwpIHsKIAkJcmV0ID0gZHJtX3BhbmVsX3ByZXBhcmUoZHNpLT5wYW5lbCk7Ci0J
CWlmIChyZXQgPCAwKQotCQkJZ290byBlcnJfcHV0X3N5bmM7CisJCVdBUk5fT04ocmV0ICYmIHJl
dCAhPSAtRU5PU1lTKTsKIAl9IGVsc2UgewogCQlkcm1fYnJpZGdlX3ByZV9lbmFibGUoZHNpLT5v
dXRfYnJpZGdlKTsKIAl9CkBAIC0xMzk4LDIyICsxMzk3LDEzIEBAIHN0YXRpYyB2b2lkIGV4eW5v
c19kc2lfZW5hYmxlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKIAogCWlmIChkc2ktPnBh
bmVsKSB7CiAJCXJldCA9IGRybV9wYW5lbF9lbmFibGUoZHNpLT5wYW5lbCk7Ci0JCWlmIChyZXQg
PCAwKQotCQkJZ290byBlcnJfZGlzcGxheV9kaXNhYmxlOworCQlXQVJOX09OKHJldCAmJiByZXQg
IT0gLUVOT1NZUyk7CiAJfSBlbHNlIHsKIAkJZHJtX2JyaWRnZV9lbmFibGUoZHNpLT5vdXRfYnJp
ZGdlKTsKIAl9CiAKIAlkc2ktPnN0YXRlIHw9IERTSU1fU1RBVEVfVklET1VUX0FWQUlMQUJMRTsK
IAlyZXR1cm47Ci0KLWVycl9kaXNwbGF5X2Rpc2FibGU6Ci0JZXh5bm9zX2RzaV9zZXRfZGlzcGxh
eV9lbmFibGUoZHNpLCBmYWxzZSk7Ci0JZHJtX3BhbmVsX3VucHJlcGFyZShkc2ktPnBhbmVsKTsK
LQotZXJyX3B1dF9zeW5jOgotCWRzaS0+c3RhdGUgJj0gfkRTSU1fU1RBVEVfRU5BQkxFRDsKLQlw
bV9ydW50aW1lX3B1dChkc2ktPmRldik7CiB9CiAKIHN0YXRpYyB2b2lkIGV4eW5vc19kc2lfZGlz
YWJsZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCi0tIAoyLjIxLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
