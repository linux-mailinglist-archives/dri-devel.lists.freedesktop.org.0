Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 550897DABE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 13:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68A76E56E;
	Thu,  1 Aug 2019 11:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFC46E56B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 11:56:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DB6DBAFC3;
 Thu,  1 Aug 2019 11:56:47 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, noralf@tronnes.org, airlied@linux.ie,
 rong.a.chen@intel.com, feng.tang@intel.com, ying.huang@intel.com,
 sean@poorly.run, maxime.ripard@bootlin.com,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 3/3] drm/mgag200: Map fbdev framebuffer while it's being
 displayed
Date: Thu,  1 Aug 2019 13:56:42 +0200
Message-Id: <20190801115642.21231-4-tzimmermann@suse.de>
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Armijn Hemel <armijn@tjaldur.nl>, Huang Rui <ray.huang@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
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
ZXJhdGlvbnMgaW4gdGhlIGZiZGV2IGNvZGUuIFRoZSBvcmlnaW5hbCBmYmRldiBjb2RlIGluIG1n
YWcyMDAKdXNlZCB0aGUgc2FtZSB0cmljayB0byBpbXByb3ZlIHBlcmZvcm1hbmNlLgoKU2lnbmVk
LW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CkZpeGVzOiA5
MGY0NzlhZTUxYWYgKCJkcm0vbWdhZzIwMDogUmVwbGFjZSBzdHJ1Y3QgbWdhX2ZiZGV2IHdpdGgg
Z2VuZXJpYyBmcmFtZWJ1ZmZlciBlbXVsYXRpb24iKQpDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+CkNjOiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9y
Zz4KQ2M6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CkNjOiBHcmVnIEtyb2FoLUhh
cnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgpDYzogVGhvbWFzIEdsZWl4bmVyIDx0
Z2x4QGxpbnV0cm9uaXguZGU+CkNjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4K
Q2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3Rp
YW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4KQ2M6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+CkNjOiBCYXJ0bG9taWVqIFpvbG5p
ZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+CkNjOiAiTWljaGHFgiBNaXJvc8WC
YXciIDxtaXJxLWxpbnV4QHJlcmUucW1xbS5wbD4KQ2M6IEFybWlqbiBIZW1lbCA8YXJtaWpuQHRq
YWxkdXIubmw+CkNjOiBSb25nIENoZW4gPHJvbmcuYS5jaGVuQGludGVsLmNvbT4KQ2M6IEZlbmcg
VGFuZyA8ZmVuZy50YW5nQGludGVsLmNvbT4KQ2M6IEh1YW5nIFlpbmcgPHlpbmcuaHVhbmdAaW50
ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jIHwgMjEg
KysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jIGIvZHJp
dmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMKaW5kZXggODIyZjJhMTM3NDhmLi5h
NjM5MTE0NGZlYjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBf
bW9kZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jCkBAIC04
NjAsMTMgKzg2MCwyMCBAQCBzdGF0aWMgaW50IG1nYV9jcnRjX2RvX3NldF9iYXNlKHN0cnVjdCBk
cm1fY3J0YyAqY3J0YywKIAkJCQlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwKIAkJCQlpbnQg
eCwgaW50IHksIGludCBhdG9taWMpCiB7CisJc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBl
ciA9IGNydGMtPmRldi0+ZmJfaGVscGVyOwogCXN0cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0ICpn
Ym87CiAJaW50IHJldDsKIAlzNjQgZ3B1X2FkZHI7CisJdm9pZCAqYmFzZTsKIAogCWlmICghYXRv
bWljICYmIGZiKSB7CiAJCWdibyA9IGRybV9nZW1fdnJhbV9vZl9nZW0oZmItPm9ialswXSk7CiAJ
CWRybV9nZW1fdnJhbV91bnBpbihnYm8pOworCisJCS8vIFVubWFwIGZiZGV2IEZCIGlmIGl0J3Mg
bm90IGJlaW5nIGRpc3BsYXllZAorCQkvLyBhbnkgbG9uZ2VyLgorCQlpZiAoZmIgPT0gZmJfaGVs
cGVyLT5idWZmZXItPmZiKQorCQkJZHJtX2dlbV92cmFtX2t1bm1hcChnYm8pOwogCX0KIAogCWdi
byA9IGRybV9nZW1fdnJhbV9vZl9nZW0oY3J0Yy0+cHJpbWFyeS0+ZmItPm9ialswXSk7CkBAIC04
ODIsNiArODg5LDE1IEBAIHN0YXRpYyBpbnQgbWdhX2NydGNfZG9fc2V0X2Jhc2Uoc3RydWN0IGRy
bV9jcnRjICpjcnRjLAogCiAJbWdhX3NldF9zdGFydF9hZGRyZXNzKGNydGMsICh1MzIpZ3B1X2Fk
ZHIpOwogCisJLy8gTWFwIGZiZGV2IEZCIHdoaWxlIGl0J3MgYmVpbmcgZGlzcGxheWVkLiBUaGlz
CisJLy8gYXZvaWRzIGZyZXF1ZW50IG1hcHBpbmcgYW5kIHVubWFwcGluZyB3aXRoaW5nIHRoZQor
CS8vIGZiZGV2IGNvZGUuCisJaWYgKGNydGMtPnByaW1hcnktPmZiID09IGZiX2hlbHBlci0+YnVm
ZmVyLT5mYikgeworCQliYXNlID0gZHJtX2dlbV92cmFtX2ttYXAoZ2JvLCB0cnVlLCBOVUxMKTsK
KwkJaWYgKElTX0VSUihiYXNlKSkKKwkJCURSTV9FUlJPUigiZmFpbGVkIHRvIGttYXAgZmJjb25c
biIpOworCX0KKwogCXJldHVybiAwOwogCiBlcnJfZHJtX2dlbV92cmFtX3VucGluOgpAQCAtMTQw
Myw5ICsxNDE5LDE0IEBAIHN0YXRpYyB2b2lkIG1nYV9jcnRjX2Rpc2FibGUoc3RydWN0IGRybV9j
cnRjICpjcnRjKQogCURSTV9ERUJVR19LTVMoIlxuIik7CiAJbWdhX2NydGNfZHBtcyhjcnRjLCBE
Uk1fTU9ERV9EUE1TX09GRik7CiAJaWYgKGNydGMtPnByaW1hcnktPmZiKSB7CisJCXN0cnVjdCBk
cm1fZmJfaGVscGVyICpmYl9oZWxwZXIgPSBjcnRjLT5kZXYtPmZiX2hlbHBlcjsKIAkJc3RydWN0
IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSBjcnRjLT5wcmltYXJ5LT5mYjsKIAkJc3RydWN0IGRybV9n
ZW1fdnJhbV9vYmplY3QgKmdibyA9CiAJCQlkcm1fZ2VtX3ZyYW1fb2ZfZ2VtKGZiLT5vYmpbMF0p
OworCisJCS8vIFVubWFwIGlmIGl0J3MgdGhlIGZiZGV2IEZCLgorCQlpZiAoZmIgPT0gZmJfaGVs
cGVyLT5idWZmZXItPmZiKQorCQkJZHJtX2dlbV92cmFtX2t1bm1hcChnYm8pOwogCQlkcm1fZ2Vt
X3ZyYW1fdW5waW4oZ2JvKTsKIAl9CiAJY3J0Yy0+cHJpbWFyeS0+ZmIgPSBOVUxMOwotLSAKMi4y
Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
