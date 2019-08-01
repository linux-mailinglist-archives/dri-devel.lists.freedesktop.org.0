Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D197DABF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 13:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD756E571;
	Thu,  1 Aug 2019 11:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757FF6E56A
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 11:56:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 89B12AF68;
 Thu,  1 Aug 2019 11:56:47 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, noralf@tronnes.org, airlied@linux.ie,
 rong.a.chen@intel.com, feng.tang@intel.com, ying.huang@intel.com,
 sean@poorly.run, maxime.ripard@bootlin.com,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 2/3] drm/ast: Map fbdev framebuffer while it's being displayed
Date: Thu,  1 Aug 2019 13:56:41 +0200
Message-Id: <20190801115642.21231-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190801115642.21231-1-tzimmermann@suse.de>
References: <20190801115642.21231-1-tzimmermann@suse.de>
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
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Sam Bobroff <sbobroff@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGdlbmVyaWMgZmJkZXYgZW11bGF0aW9uIHdpbGwgbWFwIGFuZCB1bm1hcCB0aGUgZnJhbWVi
dWZmZXIncyBtZW1vcnkKaWYgcmVxdWlyZWQuIEFzIGNvbnNvbGVzIGFyZSBtb3N0IG9mdGVuIHVw
ZGF0ZWQgd2hpbGUgYmVpbmcgb24gc2NyZWVuLAp3ZSBtYXAgdGhlIGZiZGV2IGJ1ZmZlciB3aGls
ZSBpdCdzIGJlaW5nIGRpc3BsYXllZC4gVGhpcyBhdm9pZHMgZnJlcXVlbnQKbWFwL3VubWFwIG9w
ZXJhdGlvbnMgaW4gdGhlIGZiZGV2IGNvZGUuIFRoZSBvcmlnaW5hbCBmYmRldiBjb2RlIGluIGFz
dAp1c2VkIHRoZSBzYW1lIHRyaWNrIHRvIGltcHJvdmUgcGVyZm9ybWFuY2UuCgpTaWduZWQtb2Zm
LWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpDYzogTm9yYWxmIFRyw7hubmVzIDxub3Jh
bGZAdHJvbm5lcy5vcmc+CkNjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgpDYzog
R3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6IFRob21h
cyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2
bmJvcmcub3JnPgpDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkNjOiBPbGVr
c2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+CkNj
OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzog
WXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgpDYzogU2FtIEJvYnJvZmYgPHNib2Jy
b2ZmQGxpbnV4LmlibS5jb20+CkNjOiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgpDYzog
IlkuQy4gQ2hlbiIgPHljX2NoZW5AYXNwZWVkdGVjaC5jb20+CkNjOiBSb25nIENoZW4gPHJvbmcu
YS5jaGVuQGludGVsLmNvbT4KQ2M6IEZlbmcgVGFuZyA8ZmVuZy50YW5nQGludGVsLmNvbT4KQ2M6
IEh1YW5nIFlpbmcgPHlpbmcuaHVhbmdAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
c3QvYXN0X21vZGUuYyB8IDIwICsrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
MjAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21v
ZGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYwppbmRleCBjNzkyMzYyMDI0YTUu
LjM1YmEyNTI2MmY1NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYwpAQCAtNTI5LDEzICs1MjksMjAg
QEAgc3RhdGljIGludCBhc3RfY3J0Y19kb19zZXRfYmFzZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMs
CiAJCQkJc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsCiAJCQkJaW50IHgsIGludCB5LCBpbnQg
YXRvbWljKQogeworCXN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIgPSBjcnRjLT5kZXYt
PmZiX2hlbHBlcjsKIAlzdHJ1Y3QgZHJtX2dlbV92cmFtX29iamVjdCAqZ2JvOwogCWludCByZXQ7
CiAJczY0IGdwdV9hZGRyOworCXZvaWQgKmJhc2U7CiAKIAlpZiAoIWF0b21pYyAmJiBmYikgewog
CQlnYm8gPSBkcm1fZ2VtX3ZyYW1fb2ZfZ2VtKGZiLT5vYmpbMF0pOwogCQlkcm1fZ2VtX3ZyYW1f
dW5waW4oZ2JvKTsKKworCQkvLyBVbm1hcCBmYmRldiBGQiBpZiBpdCdzIG5vdCBiZWluZyBkaXNw
bGF5ZWQKKwkJLy8gYW55IGxvbmdlci4KKwkJaWYgKGZiID09IGZiX2hlbHBlci0+YnVmZmVyLT5m
YikKKwkJCWRybV9nZW1fdnJhbV9rdW5tYXAoZ2JvKTsKIAl9CiAKIAlnYm8gPSBkcm1fZ2VtX3Zy
YW1fb2ZfZ2VtKGNydGMtPnByaW1hcnktPmZiLT5vYmpbMF0pOwpAQCAtNTUyLDYgKzU1OSwxNSBA
QCBzdGF0aWMgaW50IGFzdF9jcnRjX2RvX3NldF9iYXNlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywK
IAlhc3Rfc2V0X29mZnNldF9yZWcoY3J0Yyk7CiAJYXN0X3NldF9zdGFydF9hZGRyZXNzX2NydDEo
Y3J0YywgKHUzMilncHVfYWRkcik7CiAKKwkvLyBNYXAgZmJkZXYgRkIgd2hpbGUgaXQncyBiZWlu
ZyBkaXNwbGF5ZWQuIFRoaXMKKwkvLyBhdm9pZHMgZnJlcXVlbnQgbWFwcGluZyBhbmQgdW5tYXBw
aW5nIHdpdGhpbmcgdGhlCisJLy8gZmJkZXYgY29kZS4KKwlpZiAoY3J0Yy0+cHJpbWFyeS0+ZmIg
PT0gZmJfaGVscGVyLT5idWZmZXItPmZiKSB7CisJCWJhc2UgPSBkcm1fZ2VtX3ZyYW1fa21hcChn
Ym8sIHRydWUsIE5VTEwpOworCQlpZiAoSVNfRVJSKGJhc2UpKQorCQkJRFJNX0VSUk9SKCJmYWls
ZWQgdG8ga21hcCBmYmNvblxuIik7CisJfQorCiAJcmV0dXJuIDA7CiAKIGVycl9kcm1fZ2VtX3Zy
YW1fdW5waW46CkBAIC02MDUsMTAgKzYyMSwxNCBAQCBzdGF0aWMgdm9pZCBhc3RfY3J0Y19kaXNh
YmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKIAlEUk1fREVCVUdfS01TKCJcbiIpOwogCWFzdF9j
cnRjX2RwbXMoY3J0YywgRFJNX01PREVfRFBNU19PRkYpOwogCWlmIChjcnRjLT5wcmltYXJ5LT5m
YikgeworCQlzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqZmJfaGVscGVyID0gY3J0Yy0+ZGV2LT5mYl9o
ZWxwZXI7CiAJCXN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiID0gY3J0Yy0+cHJpbWFyeS0+ZmI7
CiAJCXN0cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0ICpnYm8gPQogCQkJZHJtX2dlbV92cmFtX29m
X2dlbShmYi0+b2JqWzBdKTsKIAorCQkvLyBVbm1hcCBpZiBpdCdzIHRoZSBmYmRldiBGQi4KKwkJ
aWYgKGZiID09IGZiX2hlbHBlci0+YnVmZmVyLT5mYikKKwkJCWRybV9nZW1fdnJhbV9rdW5tYXAo
Z2JvKTsKIAkJZHJtX2dlbV92cmFtX3VucGluKGdibyk7CiAJfQogCWNydGMtPnByaW1hcnktPmZi
ID0gTlVMTDsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
