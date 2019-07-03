Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD2E5DFD3
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 10:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47DE6E0B8;
	Wed,  3 Jul 2019 08:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BB66E0B8
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 08:33:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 18BC9AF70;
 Wed,  3 Jul 2019 08:33:09 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 sean@poorly.run, noralf@tronnes.org, sam@ravnborg.org,
 yc_chen@aspeedtech.com
Subject: [PATCH 2/5] drm/fb-helper: Unmap BO for shadow-buffered framebuffer
 console
Date: Wed,  3 Jul 2019 10:32:59 +0200
Message-Id: <20190703083302.2609-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703083302.2609-1-tzimmermann@suse.de>
References: <20190703083302.2609-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHNoYWRvdy1idWZmZXJlZCBmcmFtZWJ1ZmZlciBjb25zb2xlIG9ubHkgbmVlZHMgdGhlIGJ1
ZmZlciBvYmplY3QKdG8gYmUgbWFwcGVkIGR1cmluZyB1cGRhdGVzLiBXaGlsZSBub3QgYmVpbmcg
dXBkYXRlZCBmcm9tIHRoZSBzaGFkb3cKYnVmZmVyLCB0aGUgYnVmZmVyIG9iamVjdCBjYW4gcmVt
YWluIHVubWFwcGVkLgoKQW4gdW5tYXBwZWQgYnVmZmVyIG9iamVjdCBjYW4gYmUgZXZpY3RlZCB0
byBzeXN0ZW0gbWVtb3J5IGFuZCBkb2VzCm5vdCBjb25zdW1lIHZpZGVvIHJhbSB1bnRpbCBkaXNw
bGF5ZWQuIFRoaXMgYWxsb3dzIHRvIHVzZSBnZW5lcmljIGZiZGV2CmVtdWxhdGlvbiB3aXRoIGRy
aXZlcnMgZm9yIGxvdy1tZW1vcnkgZGV2aWNlcywgc3VjaCBhcyBhc3QgYW5kIG1nYWcyMDAuCgpT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIHwgMTQgKysrKysrKysrKysrKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZmJfaGVscGVyLmMKaW5kZXggMTk4NGU1YzU0ZDU4Li4yYTY1MzhmMjI5ZTMgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9mYl9oZWxwZXIuYwpAQCAtNDAzLDYgKzQwMyw3IEBAIHN0YXRpYyB2b2lkIGRybV9mYl9oZWxw
ZXJfZGlydHlfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCiAJc3RydWN0IGRybV9jbGlw
X3JlY3QgKmNsaXAgPSAmaGVscGVyLT5kaXJ0eV9jbGlwOwogCXN0cnVjdCBkcm1fY2xpcF9yZWN0
IGNsaXBfY29weTsKIAl1bnNpZ25lZCBsb25nIGZsYWdzOworCXZvaWQgKnZhZGRyOwogCiAJc3Bp
bl9sb2NrX2lycXNhdmUoJmhlbHBlci0+ZGlydHlfbG9jaywgZmxhZ3MpOwogCWNsaXBfY29weSA9
ICpjbGlwOwpAQCAtNDEyLDEwICs0MTMsMTggQEAgc3RhdGljIHZvaWQgZHJtX2ZiX2hlbHBlcl9k
aXJ0eV93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKIAogCS8qIGNhbGwgZGlydHkgY2Fs
bGJhY2sgb25seSB3aGVuIGl0IGhhcyBiZWVuIHJlYWxseSB0b3VjaGVkICovCiAJaWYgKGNsaXBf
Y29weS54MSA8IGNsaXBfY29weS54MiAmJiBjbGlwX2NvcHkueTEgPCBjbGlwX2NvcHkueTIpIHsK
KwogCQkvKiBHZW5lcmljIGZiZGV2IHVzZXMgYSBzaGFkb3cgYnVmZmVyICovCi0JCWlmIChoZWxw
ZXItPmJ1ZmZlcikKKwkJaWYgKGhlbHBlci0+YnVmZmVyKSB7CisJCQl2YWRkciA9IGRybV9jbGll
bnRfYnVmZmVyX3ZtYXAoaGVscGVyLT5idWZmZXIpOworCQkJaWYgKElTX0VSUih2YWRkcikpCisJ
CQkJcmV0dXJuOwogCQkJZHJtX2ZiX2hlbHBlcl9kaXJ0eV9ibGl0X3JlYWwoaGVscGVyLCAmY2xp
cF9jb3B5KTsKKwkJfQogCQloZWxwZXItPmZiLT5mdW5jcy0+ZGlydHkoaGVscGVyLT5mYiwgTlVM
TCwgMCwgMCwgJmNsaXBfY29weSwgMSk7CisKKwkJaWYgKGhlbHBlci0+YnVmZmVyKQorCQkJZHJt
X2NsaWVudF9idWZmZXJfdnVubWFwKGhlbHBlci0+YnVmZmVyKTsKIAl9CiB9CiAKQEAgLTIyMzEs
NiArMjI0MCw5IEBAIGludCBkcm1fZmJfaGVscGVyX2dlbmVyaWNfcHJvYmUoc3RydWN0IGRybV9m
Yl9oZWxwZXIgKmZiX2hlbHBlciwKIAkJZmJpLT5mYmRlZmlvID0gJmRybV9mYmRldl9kZWZpbzsK
IAogCQlmYl9kZWZlcnJlZF9pb19pbml0KGZiaSk7CisKKwkJLyogdW5tYXBwZWQgYnkgZGVmYXVs
dCAqLworCQlkcm1fY2xpZW50X2J1ZmZlcl92dW5tYXAoZmJfaGVscGVyLT5idWZmZXIpOwogCX0K
IAogCXJldHVybiAwOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
