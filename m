Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01459A8191
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 13:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C53898C6;
	Wed,  4 Sep 2019 11:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93886898ED
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 11:56:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F171FAE22;
 Wed,  4 Sep 2019 11:56:52 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, noralf@tronnes.org, airlied@linux.ie,
 rong.a.chen@intel.com, feng.tang@intel.com, ying.huang@intel.com,
 sean@poorly.run, maxime.ripard@bootlin.com,
 maarten.lankhorst@linux.intel.com, dave@stgolabs.net
Subject: [PATCH v2 3/3] drm/mgag200: Map fbdev framebuffer while it's being
 displayed
Date: Wed,  4 Sep 2019 13:56:44 +0200
Message-Id: <20190904115644.7620-4-tzimmermann@suse.de>
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
YWcyMDAKdXNlZCB0aGUgc2FtZSB0cmljayB0byBpbXByb3ZlIHBlcmZvcm1hbmNlLgoKdjI6Cgkq
IGZpeCB0eXBvIGluIGNvbW1lbnQKClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPgpGaXhlczogOTBmNDc5YWU1MWFmICgiZHJtL21nYWcyMDA6IFJl
cGxhY2Ugc3RydWN0IG1nYV9mYmRldiB3aXRoIGdlbmVyaWMgZnJhbWVidWZmZXIgZW11bGF0aW9u
IikKQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpDYzogTm9yYWxm
IFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+CkNjOiBEYXZlIEFpcmxpZSA8YWlybGllZEBy
ZWRoYXQuY29tPgpDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZz4KQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgpDYzogR2VyZCBI
b2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkNjOiBIdWFuZyBSdWkgPHJheS5odWFuZ0Bh
bWQuY29tPgpDYzogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1
bmcuY29tPgpDYzogIk1pY2hhxYIgTWlyb3PFgmF3IiA8bWlycS1saW51eEByZXJlLnFtcW0ucGw+
CkNjOiBBcm1pam4gSGVtZWwgPGFybWlqbkB0amFsZHVyLm5sPgpDYzogUm9uZyBDaGVuIDxyb25n
LmEuY2hlbkBpbnRlbC5jb20+CkNjOiBGZW5nIFRhbmcgPGZlbmcudGFuZ0BpbnRlbC5jb20+CkNj
OiBIdWFuZyBZaW5nIDx5aW5nLmh1YW5nQGludGVsLmNvbT4KQ2M6IERhdmlkbG9ociBCdWVzbyA8
ZGF2ZUBzdGdvbGFicy5uZXQ+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9t
b2RlLmMgfCAyMCArKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21v
ZGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jCmluZGV4IDVlNzc4
YjVmMWExMC4uN2I5NWM1OTM0MWY1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIw
MC9tZ2FnMjAwX21vZGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21v
ZGUuYwpAQCAtODYwLDEzICs4NjAsMjAgQEAgc3RhdGljIGludCBtZ2FfY3J0Y19kb19zZXRfYmFz
ZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJCQkJc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIs
CiAJCQkJaW50IHgsIGludCB5LCBpbnQgYXRvbWljKQogeworCXN0cnVjdCBkcm1fZmJfaGVscGVy
ICpmYl9oZWxwZXIgPSBjcnRjLT5kZXYtPmZiX2hlbHBlcjsKIAlzdHJ1Y3QgZHJtX2dlbV92cmFt
X29iamVjdCAqZ2JvOwogCWludCByZXQ7CiAJczY0IGdwdV9hZGRyOworCXZvaWQgKmJhc2U7CiAK
IAlpZiAoIWF0b21pYyAmJiBmYikgewogCQlnYm8gPSBkcm1fZ2VtX3ZyYW1fb2ZfZ2VtKGZiLT5v
YmpbMF0pOwogCQlkcm1fZ2VtX3ZyYW1fdW5waW4oZ2JvKTsKKworCQkvLyBVbm1hcCBmYmRldiBG
QiBpZiBpdCdzIG5vdCBiZWluZyBkaXNwbGF5ZWQKKwkJLy8gYW55IGxvbmdlci4KKwkJaWYgKGZi
ID09IGZiX2hlbHBlci0+YnVmZmVyLT5mYikKKwkJCWRybV9nZW1fdnJhbV9rdW5tYXAoZ2JvKTsK
IAl9CiAKIAlnYm8gPSBkcm1fZ2VtX3ZyYW1fb2ZfZ2VtKGNydGMtPnByaW1hcnktPmZiLT5vYmpb
MF0pOwpAQCAtODgyLDYgKzg4OSwxNCBAQCBzdGF0aWMgaW50IG1nYV9jcnRjX2RvX3NldF9iYXNl
KHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAogCW1nYV9zZXRfc3RhcnRfYWRkcmVzcyhjcnRjLCAo
dTMyKWdwdV9hZGRyKTsKIAorCS8vIE1hcCBmYmRldiBGQiB3aGlsZSBpdCdzIGJlaW5nIGRpc3Bs
YXllZC4gVGhpcyBhdm9pZHMgZnJlcXVlbnQKKwkvLyBtYXBwaW5nIGFuZCB1bm1hcHBpbmcgd2l0
aGluIHRoZSBmYmRldiBjb2RlLgorCWlmIChjcnRjLT5wcmltYXJ5LT5mYiA9PSBmYl9oZWxwZXIt
PmJ1ZmZlci0+ZmIpIHsKKwkJYmFzZSA9IGRybV9nZW1fdnJhbV9rbWFwKGdibywgdHJ1ZSwgTlVM
TCk7CisJCWlmIChJU19FUlIoYmFzZSkpCisJCQlEUk1fRVJST1IoImZhaWxlZCB0byBrbWFwIGZi
Y29uXG4iKTsKKwl9CisKIAlyZXR1cm4gMDsKIAogZXJyX2RybV9nZW1fdnJhbV91bnBpbjoKQEAg
LTE0MDMsOSArMTQxOCwxNCBAQCBzdGF0aWMgdm9pZCBtZ2FfY3J0Y19kaXNhYmxlKHN0cnVjdCBk
cm1fY3J0YyAqY3J0YykKIAlEUk1fREVCVUdfS01TKCJcbiIpOwogCW1nYV9jcnRjX2RwbXMoY3J0
YywgRFJNX01PREVfRFBNU19PRkYpOwogCWlmIChjcnRjLT5wcmltYXJ5LT5mYikgeworCQlzdHJ1
Y3QgZHJtX2ZiX2hlbHBlciAqZmJfaGVscGVyID0gY3J0Yy0+ZGV2LT5mYl9oZWxwZXI7CiAJCXN0
cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiID0gY3J0Yy0+cHJpbWFyeS0+ZmI7CiAJCXN0cnVjdCBk
cm1fZ2VtX3ZyYW1fb2JqZWN0ICpnYm8gPQogCQkJZHJtX2dlbV92cmFtX29mX2dlbShmYi0+b2Jq
WzBdKTsKKworCQkvLyBVbm1hcCBpZiBpdCdzIHRoZSBmYmRldiBGQi4KKwkJaWYgKGZiID09IGZi
X2hlbHBlci0+YnVmZmVyLT5mYikKKwkJCWRybV9nZW1fdnJhbV9rdW5tYXAoZ2JvKTsKIAkJZHJt
X2dlbV92cmFtX3VucGluKGdibyk7CiAJfQogCWNydGMtPnByaW1hcnktPmZiID0gTlVMTDsKLS0g
CjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
