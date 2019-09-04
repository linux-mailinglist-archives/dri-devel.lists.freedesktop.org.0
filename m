Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DA7A818F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 13:57:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DBB899B5;
	Wed,  4 Sep 2019 11:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3C5898C6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 11:56:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BDB9BAD54;
 Wed,  4 Sep 2019 11:56:52 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, noralf@tronnes.org, airlied@linux.ie,
 rong.a.chen@intel.com, feng.tang@intel.com, ying.huang@intel.com,
 sean@poorly.run, maxime.ripard@bootlin.com,
 maarten.lankhorst@linux.intel.com, dave@stgolabs.net
Subject: [PATCH v2 2/3] drm/ast: Map fbdev framebuffer while it's being
 displayed
Date: Wed,  4 Sep 2019 13:56:43 +0200
Message-Id: <20190904115644.7620-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190904115644.7620-1-tzimmermann@suse.de>
References: <20190904115644.7620-1-tzimmermann@suse.de>
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
dAp1c2VkIHRoZSBzYW1lIHRyaWNrIHRvIGltcHJvdmUgcGVyZm9ybWFuY2UuCgp2MjoKCSogZml4
IHR5cG8gaW4gY29tbWVudAoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+CkNjOiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4K
Q2M6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CkNjOiBHcmVnIEtyb2FoLUhhcnRt
YW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgpDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4
QGxpbnV0cm9uaXguZGU+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBH
ZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KQ2M6IE9sZWtzYW5kciBBbmRydXNoY2hl
bmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KQ2M6IENLIEh1IDxjay5odUBt
ZWRpYXRlay5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpD
YzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlh
biBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBZdWVIYWliaW5nIDx5dWVo
YWliaW5nQGh1YXdlaS5jb20+CkNjOiBTYW0gQm9icm9mZiA8c2JvYnJvZmZAbGludXguaWJtLmNv
bT4KQ2M6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+CkNjOiAiWS5DLiBDaGVuIiA8eWNf
Y2hlbkBhc3BlZWR0ZWNoLmNvbT4KQ2M6IFJvbmcgQ2hlbiA8cm9uZy5hLmNoZW5AaW50ZWwuY29t
PgpDYzogRmVuZyBUYW5nIDxmZW5nLnRhbmdAaW50ZWwuY29tPgpDYzogSHVhbmcgWWluZyA8eWlu
Zy5odWFuZ0BpbnRlbC5jb20+CkNjOiBEYXZpZGxvaHIgQnVlc28gPGRhdmVAc3Rnb2xhYnMubmV0
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyB8IDE5ICsrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9k
ZS5jCmluZGV4IGQzNDljNzIxNTAxYy4uYzEwZmZmNjUyMjI4IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9k
ZS5jCkBAIC01MjksMTMgKzUyOSwyMCBAQCBzdGF0aWMgaW50IGFzdF9jcnRjX2RvX3NldF9iYXNl
KHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAkJCQlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwK
IAkJCQlpbnQgeCwgaW50IHksIGludCBhdG9taWMpCiB7CisJc3RydWN0IGRybV9mYl9oZWxwZXIg
KmZiX2hlbHBlciA9IGNydGMtPmRldi0+ZmJfaGVscGVyOwogCXN0cnVjdCBkcm1fZ2VtX3ZyYW1f
b2JqZWN0ICpnYm87CiAJaW50IHJldDsKIAlzNjQgZ3B1X2FkZHI7CisJdm9pZCAqYmFzZTsKIAog
CWlmICghYXRvbWljICYmIGZiKSB7CiAJCWdibyA9IGRybV9nZW1fdnJhbV9vZl9nZW0oZmItPm9i
alswXSk7CiAJCWRybV9nZW1fdnJhbV91bnBpbihnYm8pOworCisJCS8vIFVubWFwIGZiZGV2IEZC
IGlmIGl0J3Mgbm90IGJlaW5nIGRpc3BsYXllZAorCQkvLyBhbnkgbG9uZ2VyLgorCQlpZiAoZmIg
PT0gZmJfaGVscGVyLT5idWZmZXItPmZiKQorCQkJZHJtX2dlbV92cmFtX2t1bm1hcChnYm8pOwog
CX0KIAogCWdibyA9IGRybV9nZW1fdnJhbV9vZl9nZW0oY3J0Yy0+cHJpbWFyeS0+ZmItPm9ialsw
XSk7CkBAIC01NTIsNiArNTU5LDE0IEBAIHN0YXRpYyBpbnQgYXN0X2NydGNfZG9fc2V0X2Jhc2Uo
c3RydWN0IGRybV9jcnRjICpjcnRjLAogCWFzdF9zZXRfb2Zmc2V0X3JlZyhjcnRjKTsKIAlhc3Rf
c2V0X3N0YXJ0X2FkZHJlc3NfY3J0MShjcnRjLCAodTMyKWdwdV9hZGRyKTsKIAorCS8vIE1hcCBm
YmRldiBGQiB3aGlsZSBpdCdzIGJlaW5nIGRpc3BsYXllZC4gVGhpcyBhdm9pZHMgZnJlcXVlbnQK
KwkvLyBtYXBwaW5nIGFuZCB1bm1hcHBpbmcgd2l0aGluIHRoZSBmYmRldiBjb2RlLgorCWlmIChj
cnRjLT5wcmltYXJ5LT5mYiA9PSBmYl9oZWxwZXItPmJ1ZmZlci0+ZmIpIHsKKwkJYmFzZSA9IGRy
bV9nZW1fdnJhbV9rbWFwKGdibywgdHJ1ZSwgTlVMTCk7CisJCWlmIChJU19FUlIoYmFzZSkpCisJ
CQlEUk1fRVJST1IoImZhaWxlZCB0byBrbWFwIGZiY29uXG4iKTsKKwl9CisKIAlyZXR1cm4gMDsK
IAogZXJyX2RybV9nZW1fdnJhbV91bnBpbjoKQEAgLTYwNSwxMCArNjIwLDE0IEBAIHN0YXRpYyB2
b2lkIGFzdF9jcnRjX2Rpc2FibGUoc3RydWN0IGRybV9jcnRjICpjcnRjKQogCURSTV9ERUJVR19L
TVMoIlxuIik7CiAJYXN0X2NydGNfZHBtcyhjcnRjLCBEUk1fTU9ERV9EUE1TX09GRik7CiAJaWYg
KGNydGMtPnByaW1hcnktPmZiKSB7CisJCXN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIg
PSBjcnRjLT5kZXYtPmZiX2hlbHBlcjsKIAkJc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSBj
cnRjLT5wcmltYXJ5LT5mYjsKIAkJc3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3QgKmdibyA9CiAJ
CQlkcm1fZ2VtX3ZyYW1fb2ZfZ2VtKGZiLT5vYmpbMF0pOwogCisJCS8vIFVubWFwIGlmIGl0J3Mg
dGhlIGZiZGV2IEZCLgorCQlpZiAoZmIgPT0gZmJfaGVscGVyLT5idWZmZXItPmZiKQorCQkJZHJt
X2dlbV92cmFtX2t1bm1hcChnYm8pOwogCQlkcm1fZ2VtX3ZyYW1fdW5waW4oZ2JvKTsKIAl9CiAJ
Y3J0Yy0+cHJpbWFyeS0+ZmIgPSBOVUxMOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
