Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 386DE556A8
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 20:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214076E203;
	Tue, 25 Jun 2019 18:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADF46E1BD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 18:02:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 2ECC328626E
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/4] drm/imx: notify drm core before sending event during
 crtc disable
Date: Tue, 25 Jun 2019 18:59:13 +0100
Message-Id: <066eb916ec920e0515367548e4af2ee28f9d0a43.1561483965.git.bob.beckett@collabora.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1561483965.git.bob.beckett@collabora.com>
References: <cover.1561483965.git.bob.beckett@collabora.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 NXP Linux Team <linux-imx@nxp.com>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm90aWZ5IGRybSBjb3JlIGJlZm9yZSBzZW5kaW5nIHBlbmRpbmcgZXZlbnRzIGR1cmluZyBjcnRj
IGRpc2FibGUuClRoaXMgZml4ZXMgdGhlIGZpcnN0IGV2ZW50IGFmdGVyIGRpc2FibGUgaGF2aW5n
IGFuIG9sZCBzdGFsZSB0aW1lc3RhbXAKYnkgaGF2aW5nIGRybV9jcnRjX3ZibGFua19vZmYgdXBk
YXRlIHRoZSB0aW1lc3RhbXAgdG8gbm93LgoKVGhpcyB3YXMgc2VlbiB3aGlsZSBkZWJ1Z2dpbmcg
d2VzdG9uIGxvZyBtZXNzYWdlOgpXYXJuaW5nOiBjb21wdXRlZCByZXBhaW50IGRlbGF5IGlzIGlu
c2FuZTogLTgyMTIgbXNlYwoKVGhpcyBvY2N1cmVkIGR1ZSB0bzoKMS4gZHJpdmVyIHN0YXJ0cyB1
cAoyLiBmYmNvbiBjb21lcyBhbG9uZyBhbmQgcmVzdG9yZXMgZmJkZXYsIGVuYWJsaW5nIHZibGFu
awozLiB2YmxhbmtfZGlzYWJsZV9mbiBmaXJlcyB2aWEgdGltZXIgZGlzYWJsaW5nIHZibGFuaywg
a2VlcGluZyB2YmxhbmsKc2VxIG51bWJlciBhbmQgdGltZSBzZXQgYXQgY3VycmVudCB2YWx1ZQoo
c29tZSB0aW1lIGxhdGVyKQo0LiB3ZXN0b24gc3RhcnRzIGFuZCBkb2VzIGEgbW9kZXNldAo1LiBh
dG9taWMgY29tbWl0IGRpc2FibGVzIGNydGMgd2hpbGUgaXQgZG9lcyB0aGUgbW9kZXNldAo2LiBp
cHVfY3J0Y19hdG9taWNfZGlzYWJsZSBzZW5kcyB2Ymxhbmsgd2l0aCBvbGQgc2VxIG51bWJlciBh
bmQgdGltZQoKRml4ZXM6IGE0NzQ0Nzg2NDJkNSAoImRybS9pbXg6IGZpeCBjcnRjIHZibGFuayBz
dGF0ZSByZWdyZXNzaW9uIikKClNpZ25lZC1vZmYtYnk6IFJvYmVydCBCZWNrZXR0IDxib2IuYmVj
a2V0dEBjb2xsYWJvcmEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtY3J0Yy5j
IHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtY3J0Yy5jIGIvZHJpdmVy
cy9ncHUvZHJtL2lteC9pcHV2My1jcnRjLmMKaW5kZXggOWNjMWQ2Nzg2NzRmLi5lMDRkNmVmZmYx
YjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtY3J0Yy5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtY3J0Yy5jCkBAIC05MSwxNCArOTEsMTQgQEAgc3RhdGlj
IHZvaWQgaXB1X2NydGNfYXRvbWljX2Rpc2FibGUoc3RydWN0IGRybV9jcnRjICpjcnRjLAogCWlw
dV9kY19kaXNhYmxlKGlwdSk7CiAJaXB1X3ByZ19kaXNhYmxlKGlwdSk7CiAKKwlkcm1fY3J0Y192
Ymxhbmtfb2ZmKGNydGMpOworCiAJc3Bpbl9sb2NrX2lycSgmY3J0Yy0+ZGV2LT5ldmVudF9sb2Nr
KTsKIAlpZiAoY3J0Yy0+c3RhdGUtPmV2ZW50KSB7CiAJCWRybV9jcnRjX3NlbmRfdmJsYW5rX2V2
ZW50KGNydGMsIGNydGMtPnN0YXRlLT5ldmVudCk7CiAJCWNydGMtPnN0YXRlLT5ldmVudCA9IE5V
TEw7CiAJfQogCXNwaW5fdW5sb2NrX2lycSgmY3J0Yy0+ZGV2LT5ldmVudF9sb2NrKTsKLQotCWRy
bV9jcnRjX3ZibGFua19vZmYoY3J0Yyk7CiB9CiAKIHN0YXRpYyB2b2lkIGlteF9kcm1fY3J0Y19y
ZXNldChzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCi0tIAoyLjE4LjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
