Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 913E111444A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 17:01:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59976E159;
	Thu,  5 Dec 2019 16:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288AD6E97F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 16:01:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A17F0AFF6;
 Thu,  5 Dec 2019 16:01:45 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, noralf@tronnes.org,
 rong.a.chen@intel.com, ying.huang@intel.com, ville.syrjala@linux.intel.com,
 sam@ravnborg.org, emil.velikov@collabora.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v3 4/4] drm/fb-helper: Synchronize dirty worker with vblank
Date: Thu,  5 Dec 2019 17:01:42 +0100
Message-Id: <20191205160142.3588-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191205160142.3588-1-tzimmermann@suse.de>
References: <20191205160142.3588-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QmVmb3JlIHVwZGF0aW5nIHRoZSBkaXNwbGF5IGZyb20gdGhlIGNvbnNvbGUncyBzaGFkb3cgYnVm
ZmVyLCB0aGUgZGlydHkKd29ya2VyIG5vdyB3YWl0cyBmb3IgYSB2YmxhbmsuIFRoaXMgYWxsb3dz
IHNldmVyYWwgc2NyZWVuIHVwZGF0ZXMgdG8gcGlsZQp1cCBhbmQgYWN0cyBhcyBhIHJhdGUgbGlt
aXRlci4gSWYgYSBEUk0gbWFzdGVyIGlzIHByZXNlbnQsIGl0IGNvdWxkCmludGVyZmVyZSB3aXRo
IHRoZSB2YmxhbmsuIERvbid0IHdhaXQgaW4gdGhpcyBjYXNlLgoKdjM6CgkqIGFkZCBiYWNrIGhl
bHBlci0+bG9jawoJKiBhY3F1aXJlIERSTSBtYXN0ZXIgc3RhdHVzIHdoaWxlIHdhaXRpbmcgZm9y
IHZibGFuawp2MjoKCSogZG9uJ3QgaG9sZCBoZWxwZXItPmxvY2sgd2hpbGUgd2FpdGluZyBmb3Ig
dmJsYW5rCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIHwgMjEgKysrKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2ZiX2hlbHBlci5jCmluZGV4IGZiOWJmZjBmNDU4MS4uYmEyMGFkOTJmYjkwIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZmJfaGVscGVyLmMKQEAgLTQwNCw4ICs0MDQsMjkgQEAgc3RhdGljIHZvaWQgZHJtX2ZiX2hl
bHBlcl9kaXJ0eV93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKIAkJCQkJCSAgICBkaXJ0
eV93b3JrKTsKIAlzdHJ1Y3QgZHJtX2NsaXBfcmVjdCAqY2xpcCA9ICZoZWxwZXItPmRpcnR5X2Ns
aXA7CiAJc3RydWN0IGRybV9jbGlwX3JlY3QgY2xpcF9jb3B5OworCXN0cnVjdCBkcm1fY3J0YyAq
Y3J0YzsKIAl1bnNpZ25lZCBsb25nIGZsYWdzOwogCXZvaWQgKnZhZGRyOworCWludCByZXQ7CisK
KwkvKgorCSAqIFJhdGUtbGltaXQgdXBkYXRlIGZyZXF1ZW5jeSB0byB2YmxhbmsuIElmIHRoZXJl
J3MgYSBEUk0gbWFzdGVyCisJICogcHJlc2VudCwgaXQgY291bGQgaW50ZXJmZXJlIHdoaWxlIHdl
J3JlIHdhaXRpbmcgZm9yIHRoZSB2YmxhbmsKKwkgKiBldmVudC4gRG9uJ3Qgd2FpdCBpbiB0aGlz
IGNhc2UuCisJICovCisJbXV0ZXhfbG9jaygmaGVscGVyLT5sb2NrKTsKKwlpZiAoIWRybV9tYXN0
ZXJfaW50ZXJuYWxfYWNxdWlyZShoZWxwZXItPmRldikpIHsKKwkJZ290byB1bmxvY2s7CisJfQor
CWNydGMgPSBoZWxwZXItPmNsaWVudC5tb2Rlc2V0c1swXS5jcnRjOworCXJldCA9IGRybV9jcnRj
X3ZibGFua19nZXQoY3J0Yyk7CisJaWYgKCFyZXQpIHsKKwkJZHJtX2NydGNfd2FpdF9vbmVfdmJs
YW5rKGNydGMpOworCQlkcm1fY3J0Y192YmxhbmtfcHV0KGNydGMpOworCX0KKwlkcm1fbWFzdGVy
X2ludGVybmFsX3JlbGVhc2UoaGVscGVyLT5kZXYpOwordW5sb2NrOgorCW11dGV4X3VubG9jaygm
aGVscGVyLT5sb2NrKTsKIAogCXNwaW5fbG9ja19pcnFzYXZlKCZoZWxwZXItPmRpcnR5X2xvY2ss
IGZsYWdzKTsKIAljbGlwX2NvcHkgPSAqY2xpcDsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
