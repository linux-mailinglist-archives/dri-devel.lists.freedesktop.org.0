Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A98086547
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 17:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BCE6E85C;
	Thu,  8 Aug 2019 15:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1B16E85E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 15:11:59 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1C17928C53D;
 Thu,  8 Aug 2019 16:11:58 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RFC 04/19] drm/exynos: Get rid of exynos_dsi->out_bridge
Date: Thu,  8 Aug 2019 17:11:35 +0200
Message-Id: <20190808151150.16336-5-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190808151150.16336-1-boris.brezillon@collabora.com>
References: <20190808151150.16336-1-boris.brezillon@collabora.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93IHRoYXQgd2UgaGF2ZSBhbiBvZmZpY2lhbCB3YXkgdG8gcmVxdWVzdCBjdXN0b20gZW5jb2Rl
ci9icmlkZ2UKZW5hYmxlL2Rpc2FibGUgc2VxdWVuY2VzIHdlIGNhbiBnZXQgcmlkIG9mIHRoZSBl
eHRyYSAtPm91dF9icmlkZ2UgZmllbGQKYW5kIHVzZSB0aGUgZW5jb2RlciBvbmUuCgpTaWduZWQt
b2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kc2kuYyB8IDE3ICsrKysrLS0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMKaW5kZXggNzI3MjZmMmM3
YTlmLi44NTkzYzg3YmRmOTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5
bm9zX2RybV9kc2kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNp
LmMKQEAgLTI1NSw3ICsyNTUsNiBAQCBzdHJ1Y3QgZXh5bm9zX2RzaSB7CiAJc3RydWN0IG1pcGlf
ZHNpX2hvc3QgZHNpX2hvc3Q7CiAJc3RydWN0IGRybV9jb25uZWN0b3IgY29ubmVjdG9yOwogCXN0
cnVjdCBkcm1fcGFuZWwgKnBhbmVsOwotCXN0cnVjdCBkcm1fYnJpZGdlICpvdXRfYnJpZGdlOwog
CXN0cnVjdCBkZXZpY2UgKmRldjsKIAogCXZvaWQgX19pb21lbSAqcmVnX2Jhc2U7CkBAIC0xMzkw
LDcgKzEzODksNyBAQCBzdGF0aWMgdm9pZCBleHlub3NfZHNpX2VuYWJsZShzdHJ1Y3QgZHJtX2Vu
Y29kZXIgKmVuY29kZXIpCiAJCWlmIChyZXQgPCAwKQogCQkJZ290byBlcnJfcHV0X3N5bmM7CiAJ
fSBlbHNlIHsKLQkJZHJtX2JyaWRnZV9wcmVfZW5hYmxlKGRzaS0+b3V0X2JyaWRnZSk7CisJCWRy
bV9icmlkZ2VfcHJlX2VuYWJsZShlbmNvZGVyLT5icmlkZ2UpOwogCX0KIAogCWV4eW5vc19kc2lf
c2V0X2Rpc3BsYXlfbW9kZShkc2kpOwpAQCAtMTQwMSw3ICsxNDAwLDcgQEAgc3RhdGljIHZvaWQg
ZXh5bm9zX2RzaV9lbmFibGUoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQogCQlpZiAocmV0
IDwgMCkKIAkJCWdvdG8gZXJyX2Rpc3BsYXlfZGlzYWJsZTsKIAl9IGVsc2UgewotCQlkcm1fYnJp
ZGdlX2VuYWJsZShkc2ktPm91dF9icmlkZ2UpOworCQlkcm1fYnJpZGdlX2VuYWJsZShlbmNvZGVy
LT5icmlkZ2UpOwogCX0KIAogCWRzaS0+c3RhdGUgfD0gRFNJTV9TVEFURV9WSURPVVRfQVZBSUxB
QkxFOwpAQCAtMTQyNiwxMCArMTQyNSwxMCBAQCBzdGF0aWMgdm9pZCBleHlub3NfZHNpX2Rpc2Fi
bGUoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQogCWRzaS0+c3RhdGUgJj0gfkRTSU1fU1RB
VEVfVklET1VUX0FWQUlMQUJMRTsKIAogCWRybV9wYW5lbF9kaXNhYmxlKGRzaS0+cGFuZWwpOwot
CWRybV9icmlkZ2VfZGlzYWJsZShkc2ktPm91dF9icmlkZ2UpOworCWRybV9icmlkZ2VfZGlzYWJs
ZShlbmNvZGVyLT5icmlkZ2UpOwogCWV4eW5vc19kc2lfc2V0X2Rpc3BsYXlfZW5hYmxlKGRzaSwg
ZmFsc2UpOwogCWRybV9wYW5lbF91bnByZXBhcmUoZHNpLT5wYW5lbCk7Ci0JZHJtX2JyaWRnZV9w
b3N0X2Rpc2FibGUoZHNpLT5vdXRfYnJpZGdlKTsKKwlkcm1fYnJpZGdlX3Bvc3RfZGlzYWJsZShl
bmNvZGVyLT5icmlkZ2UpOwogCWRzaS0+c3RhdGUgJj0gfkRTSU1fU1RBVEVfRU5BQkxFRDsKIAlw
bV9ydW50aW1lX3B1dF9zeW5jKGRzaS0+ZGV2KTsKIH0KQEAgLTE1MjEsOCArMTUyMCw2IEBAIHN0
YXRpYyBpbnQgZXh5bm9zX2RzaV9ob3N0X2F0dGFjaChzdHJ1Y3QgbWlwaV9kc2lfaG9zdCAqaG9z
dCwKIAlvdXRfYnJpZGdlICA9IG9mX2RybV9maW5kX2JyaWRnZShkZXZpY2UtPmRldi5vZl9ub2Rl
KTsKIAlpZiAob3V0X2JyaWRnZSkgewogCQlkcm1fYnJpZGdlX2F0dGFjaChlbmNvZGVyLCBvdXRf
YnJpZGdlLCBOVUxMKTsKLQkJZHNpLT5vdXRfYnJpZGdlID0gb3V0X2JyaWRnZTsKLQkJZW5jb2Rl
ci0+YnJpZGdlID0gTlVMTDsKIAl9IGVsc2UgewogCQlpbnQgcmV0ID0gZXh5bm9zX2RzaV9jcmVh
dGVfY29ubmVjdG9yKGVuY29kZXIpOwogCkBAIC0xNTg0LDEwICsxNTgxLDYgQEAgc3RhdGljIGlu
dCBleHlub3NfZHNpX2hvc3RfZGV0YWNoKHN0cnVjdCBtaXBpX2RzaV9ob3N0ICpob3N0LAogCQlk
c2ktPnBhbmVsID0gTlVMTDsKIAkJZHNpLT5jb25uZWN0b3Iuc3RhdHVzID0gY29ubmVjdG9yX3N0
YXR1c19kaXNjb25uZWN0ZWQ7CiAJCW11dGV4X3VubG9jaygmZHJtLT5tb2RlX2NvbmZpZy5tdXRl
eCk7Ci0JfSBlbHNlIHsKLQkJaWYgKGRzaS0+b3V0X2JyaWRnZS0+ZnVuY3MtPmRldGFjaCkKLQkJ
CWRzaS0+b3V0X2JyaWRnZS0+ZnVuY3MtPmRldGFjaChkc2ktPm91dF9icmlkZ2UpOwotCQlkc2kt
Pm91dF9icmlkZ2UgPSBOVUxMOwogCX0KIAogCWlmIChkcm0tPm1vZGVfY29uZmlnLnBvbGxfZW5h
YmxlZCkKQEAgLTE2ODYsNyArMTY3OSw3IEBAIHN0YXRpYyBpbnQgZXh5bm9zX2RzaV9iaW5kKHN0
cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAogCiAJZHJtX2VuY29kZXJf
aW5pdChkcm1fZGV2LCBlbmNvZGVyLCAmZXh5bm9zX2RzaV9lbmNvZGVyX2Z1bmNzLAogCQkJIERS
TV9NT0RFX0VOQ09ERVJfVE1EUywgTlVMTCk7Ci0KKwllbmNvZGVyLT5jdXN0b21fYnJpZGdlX2Vu
YWJsZV9kaXNhYmxlX3NlcSA9IDE7CiAJZHJtX2VuY29kZXJfaGVscGVyX2FkZChlbmNvZGVyLCAm
ZXh5bm9zX2RzaV9lbmNvZGVyX2hlbHBlcl9mdW5jcyk7CiAKIAlyZXQgPSBleHlub3NfZHJtX3Nl
dF9wb3NzaWJsZV9jcnRjcyhlbmNvZGVyLCBFWFlOT1NfRElTUExBWV9UWVBFX0xDRCk7Ci0tIAoy
LjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
