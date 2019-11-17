Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B35EFFF90D
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93BE6E2E2;
	Sun, 17 Nov 2019 11:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5C86E25F
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 07:11:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 61B6A28FCB1
Received: by earth.universe (Postfix, from userid 1000)
 id 0598E3C0CA1; Sun, 17 Nov 2019 03:41:40 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [RFCv1 21/42] drm/omap: dsi: use pixel-format and mode from attach
Date: Sun, 17 Nov 2019 03:40:07 +0100
Message-Id: <20191117024028.2233-22-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117024028.2233-1-sebastian.reichel@collabora.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 17 Nov 2019 11:44:18 +0000
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gb3JkZXIgdG8gcmVkdWNlIHRoZSBhbW91bnQgb2YgY3VzdG9tIGZ1bmN0aW9uYWxpdHksIHRo
aXMgbW92ZXMKaGFuZGxpbmcgb2YgcGl4ZWwgZm9ybWF0IGFuZCBEU0kgbW9kZSBmcm9tIHNldF9j
b25maWcoKSB0byBkc2kKYXR0YWNoLgoKU2lnbmVkLW9mZi1ieTogU2ViYXN0aWFuIFJlaWNoZWwg
PHNlYmFzdGlhbi5yZWljaGVsQGNvbGxhYm9yYS5jb20+Ci0tLQogLi4uL2dwdS9kcm0vb21hcGRy
bS9kaXNwbGF5cy9wYW5lbC1kc2ktY20uYyAgIHwgIDIgLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFw
ZHJtL2Rzcy9kc2kuYyAgICAgICAgICAgICB8IDIwICsrKysrKysrKysrKystLS0tLS0KIDIgZmls
ZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kaXNwbGF5cy9wYW5lbC1kc2ktY20uYyBiL2RyaXZl
cnMvZ3B1L2RybS9vbWFwZHJtL2Rpc3BsYXlzL3BhbmVsLWRzaS1jbS5jCmluZGV4IDk5NDg4MDAy
MmQwYy4uZTQxMjBkNDg0ZjRjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9k
aXNwbGF5cy9wYW5lbC1kc2ktY20uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kaXNw
bGF5cy9wYW5lbC1kc2ktY20uYwpAQCAtNTUwLDggKzU1MCw2IEBAIHN0YXRpYyBpbnQgZHNpY21f
cG93ZXJfb24oc3RydWN0IHBhbmVsX2Rydl9kYXRhICpkZGF0YSkKIAl1OCBpZDEsIGlkMiwgaWQz
OwogCWludCByOwogCXN0cnVjdCBvbWFwX2Rzc19kc2lfY29uZmlnIGRzaV9jb25maWcgPSB7Ci0J
CS5tb2RlID0gT01BUF9EU1NfRFNJX0NNRF9NT0RFLAotCQkucGl4ZWxfZm9ybWF0ID0gTUlQSV9E
U0lfRk1UX1JHQjg4OCwKIAkJLnZtID0gJmRkYXRhLT52bSwKIAkJLmhzX2Nsa19taW4gPSAxNTAw
MDAwMDAsCiAJCS5oc19jbGtfbWF4ID0gMzAwMDAwMDAwLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL29tYXBkcm0vZHNzL2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rz
aS5jCmluZGV4IDNjZDc0OWNhZTE1Yy4uMzIyNzE4NzBlNzRjIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vb21hcGRybS9kc3MvZHNpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0v
ZHNzL2RzaS5jCkBAIC00NTgzLDE4ICs0NTgzLDE5IEBAIHN0YXRpYyBpbnQgZHNpX3NldF9jb25m
aWcoc3RydWN0IG9tYXBfZHNzX2RldmljZSAqZHNzZGV2LAogewogCXN0cnVjdCBkc2lfZGF0YSAq
ZHNpID0gdG9fZHNpX2RhdGEoZHNzZGV2KTsKIAlzdHJ1Y3QgZHNpX2Nsa19jYWxjX2N0eCBjdHg7
CisJc3RydWN0IG9tYXBfZHNzX2RzaV9jb25maWcgY2ZnID0gKmNvbmZpZzsKIAlib29sIG9rOwog
CWludCByOwogCiAJbXV0ZXhfbG9jaygmZHNpLT5sb2NrKTsKIAotCWRzaS0+cGl4X2ZtdCA9IGNv
bmZpZy0+cGl4ZWxfZm9ybWF0OwotCWRzaS0+bW9kZSA9IGNvbmZpZy0+bW9kZTsKKwljZmcubW9k
ZSA9IGRzaS0+bW9kZTsKKwljZmcucGl4ZWxfZm9ybWF0ID0gZHNpLT5waXhfZm10OwogCi0JaWYg
KGNvbmZpZy0+bW9kZSA9PSBPTUFQX0RTU19EU0lfVklERU9fTU9ERSkKLQkJb2sgPSBkc2lfdm1f
Y2FsYyhkc2ksIGNvbmZpZywgJmN0eCk7CisJaWYgKGRzaS0+bW9kZSA9PSBPTUFQX0RTU19EU0lf
VklERU9fTU9ERSkKKwkJb2sgPSBkc2lfdm1fY2FsYyhkc2ksICZjZmcsICZjdHgpOwogCWVsc2UK
LQkJb2sgPSBkc2lfY21fY2FsYyhkc2ksIGNvbmZpZywgJmN0eCk7CisJCW9rID0gZHNpX2NtX2Nh
bGMoZHNpLCAmY2ZnLCAmY3R4KTsKIAogCWlmICghb2spIHsKIAkJRFNTRVJSKCJmYWlsZWQgdG8g
ZmluZCBzdWl0YWJsZSBEU0kgY2xvY2sgc2V0dGluZ3NcbiIpOwpAQCAtNDYwNSw3ICs0NjA2LDcg
QEAgc3RhdGljIGludCBkc2lfc2V0X2NvbmZpZyhzdHJ1Y3Qgb21hcF9kc3NfZGV2aWNlICpkc3Nk
ZXYsCiAJZHNpX3BsbF9jYWxjX2RzaV9mY2soZHNpLCAmY3R4LmRzaV9jaW5mbyk7CiAKIAlyID0g
ZHNpX2xwX2Nsb2NrX2NhbGMoY3R4LmRzaV9jaW5mby5jbGtvdXRbSFNESVZfRFNJXSwKLQkJY29u
ZmlnLT5scF9jbGtfbWluLCBjb25maWctPmxwX2Nsa19tYXgsICZkc2ktPnVzZXJfbHBfY2luZm8p
OworCQljZmcubHBfY2xrX21pbiwgY2ZnLmxwX2Nsa19tYXgsICZkc2ktPnVzZXJfbHBfY2luZm8p
OwogCWlmIChyKSB7CiAJCURTU0VSUigiZmFpbGVkIHRvIGZpbmQgc3VpdGFibGUgRFNJIExQIGNs
b2NrIHNldHRpbmdzXG4iKTsKIAkJZ290byBlcnI7CkBAIC00Nzg0LDYgKzQ3ODUsMTMgQEAgaW50
IG9tYXBfZHNpX2hvc3RfYXR0YWNoKHN0cnVjdCBtaXBpX2RzaV9ob3N0ICpob3N0LAogCX0KIAog
CWRzaS0+dmNbY2hhbm5lbF0uZGVzdCA9IGNsaWVudDsKKworCWRzaS0+cGl4X2ZtdCA9IGNsaWVu
dC0+Zm9ybWF0OworCWlmIChjbGllbnQtPm1vZGVfZmxhZ3MgJiBNSVBJX0RTSV9NT0RFX1ZJREVP
KQorCQlkc2ktPm1vZGUgPSBPTUFQX0RTU19EU0lfVklERU9fTU9ERTsKKwllbHNlCisJCWRzaS0+
bW9kZSA9IE9NQVBfRFNTX0RTSV9DTURfTU9ERTsKKwogCXJldHVybiAwOwogfQogCi0tIAoyLjI0
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
