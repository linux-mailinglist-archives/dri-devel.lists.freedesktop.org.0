Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A85FF3087
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 14:52:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFD3889A5;
	Thu,  7 Nov 2019 13:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A626F69E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 13:52:19 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2005)
 id 01C2168C4E; Thu,  7 Nov 2019 14:52:18 +0100 (CET)
In-Reply-To: <20191107135018.0A04068BE1@verein.lst.de>
References: <20191107135018.0A04068BE1@verein.lst.de>
From: Torsten Duwe <duwe@lst.de>
Date: Tue, 29 Oct 2019 13:16:57 +0100
Subject: [PATCH v5 4/7] drm/bridge: Prepare Analogix anx6345 support
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Harald Geyer <harald@ccbib.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>
Message-Id: <20191107135218.01C2168C4E@verein.lst.de>
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
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGJpdCBkZWZpbml0aW9ucyByZXF1aXJlZCBmb3IgdGhlIGFueDYzNDUgYW5kIGFkZCBhCnNh
bml0eSBjaGVjayBpbiBhbnhfZHBfYXV4X3RyYW5zZmVyLgoKU2lnbmVkLW9mZi1ieTogSWNlbm93
eSBaaGVuZyA8aWNlbm93eUBhb3NjLmlvPgpTaWduZWQtb2ZmLWJ5OiBWYXNpbHkgS2hvcnV6aGlj
ayA8YW5hcnNvdWxAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBUb3JzdGVuIER1d2UgPGR1d2VA
c3VzZS5kZT4KUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeC1pMmMtZHB0eC5j
ICAgICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtaTJj
LWRwdHguaCAgICAgfCA4ICsrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4
L2FuYWxvZ2l4LWkyYy10eGNvbW1vbi5oIHwgMyArKysKIDMgZmlsZXMgY2hhbmdlZCwgMTIgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9h
bmFsb2dpeC9hbmFsb2dpeC1pMmMtZHB0eC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
YW5hbG9naXgvYW5hbG9naXgtaTJjLWRwdHguYwpAQCAtMTE2LDcgKzExNiw3IEBAIHNzaXplX3Qg
YW54X2RwX2F1eF90cmFuc2ZlcihzdHJ1Y3QgcmVnbWEKIAllbHNlCS8qIEZvciBub24temVyby1z
aXplZCBzZXQgdGhlIGxlbmd0aCBmaWVsZC4gKi8KIAkJY3RybDEgfD0gKG1zZy0+c2l6ZSAtIDEp
IDw8IFNQX0FVWF9MRU5HVEhfU0hJRlQ7CiAKLQlpZiAoKG1zZy0+cmVxdWVzdCAmIERQX0FVWF9J
MkNfUkVBRCkgPT0gMCkgeworCWlmICgobXNnLT5zaXplID4gMCkgJiYgKChtc2ctPnJlcXVlc3Qg
JiBEUF9BVVhfSTJDX1JFQUQpID09IDApKSB7CiAJCS8qIFdoZW4gV1JJVEUgfCBNT1Qgd3JpdGUg
dmFsdWVzIHRvIGRhdGEgYnVmZmVyICovCiAJCWVyciA9IHJlZ21hcF9idWxrX3dyaXRlKG1hcF9k
cHR4LAogCQkJCQlTUF9EUF9CVUZfREFUQTBfUkVHLCBidWZmZXIsCi0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtaTJjLWRwdHguaAorKysgYi9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWkyYy1kcHR4LmgKQEAgLTcyLDcgKzcyLDEx
IEBACiAjZGVmaW5lIFNQX0NIQV9TVEEJCQlCSVQoMikKIC8qIEJpdHMgZm9yIERQIFN5c3RlbSBD
b250cm9sIFJlZ2lzdGVyIDMgKi8KICNkZWZpbmUgU1BfSFBEX1NUQVRVUwkJCUJJVCg2KQorI2Rl
ZmluZSBTUF9IUERfRk9SQ0UJCQlCSVQoNSkKKyNkZWZpbmUgU1BfSFBEX0NUUkwJCQlCSVQoNCkK
ICNkZWZpbmUgU1BfU1RSTV9WQUxJRAkJCUJJVCgyKQorI2RlZmluZSBTUF9TVFJNX0ZPUkNFCQkJ
QklUKDEpCisjZGVmaW5lIFNQX1NUUk1fQ1RSTAkJCUJJVCgwKQogLyogQml0cyBmb3IgRFAgU3lz
dGVtIENvbnRyb2wgUmVnaXN0ZXIgNCAqLwogI2RlZmluZSBTUF9FTkhBTkNFRF9NT0RFCQlCSVQo
MykKIApAQCAtMTE3LDYgKzEyMSw5IEBACiAjZGVmaW5lIFNQX0xJTktfQldfU0VUX01BU0sJCTB4
MWYKICNkZWZpbmUgU1BfSU5JVElBTF9TTElNX01fQVVEX1NFTAlCSVQoNSkKIAorLyogRFAgTGFu
ZSBDb3VudCBTZXR0aW5nIFJlZ2lzdGVyICovCisjZGVmaW5lIFNQX0RQX0xBTkVfQ09VTlRfU0VU
X1JFRwkweGExCisKIC8qIERQIFRyYWluaW5nIFBhdHRlcm4gU2V0IFJlZ2lzdGVyICovCiAjZGVm
aW5lIFNQX0RQX1RSQUlOSU5HX1BBVFRFUk5fU0VUX1JFRwkweGEyCiAKQEAgLTEzMCw2ICsxMzcs
NyBAQAogCiAvKiBEUCBMaW5rIFRyYWluaW5nIENvbnRyb2wgUmVnaXN0ZXIgKi8KICNkZWZpbmUg
U1BfRFBfTFRfQ1RSTF9SRUcJCTB4YTgKKyNkZWZpbmUgU1BfRFBfTFRfSU5QUk9HUkVTUwkJMHg4
MAogI2RlZmluZSBTUF9MVF9FUlJPUl9UWVBFX01BU0sJCTB4NzAKICMgIGRlZmluZSBTUF9MVF9O
T19FUlJPUgkJMHgwMAogIyAgZGVmaW5lIFNQX0xUX0FVWF9XUklURV9FUlJPUgkJMHgwMQotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4LWkyYy10eGNvbW1vbi5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtaTJjLXR4Y29t
bW9uLmgKQEAgLTE3Nyw2ICsxNzcsOSBAQAogI2RlZmluZSBTUF9WQklUCQkJCUJJVCgxKQogI2Rl
ZmluZSBTUF9BVURJT19MQVlPVVQJCQlCSVQoMCkKIAorLyogQW5hbG9nIERlYnVnIFJlZ2lzdGVy
IDEgKi8KKyNkZWZpbmUgU1BfQU5BTE9HX0RFQlVHMV9SRUcJCTB4ZGMKKwogLyogQW5hbG9nIERl
YnVnIFJlZ2lzdGVyIDIgKi8KICNkZWZpbmUgU1BfQU5BTE9HX0RFQlVHMl9SRUcJCTB4ZGQKICNk
ZWZpbmUgU1BfRk9SQ0VfU1dfT0ZGX0JZUEFTUwkJMHgyMApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
