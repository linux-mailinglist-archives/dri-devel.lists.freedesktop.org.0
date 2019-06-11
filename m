Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4453CC70
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 15:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B47891C5;
	Tue, 11 Jun 2019 13:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3C38919F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 13:03:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1FCEEAE8D;
 Tue, 11 Jun 2019 13:03:48 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 sean@poorly.run, sam@ravnborg.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/9] drm/gem-vram: Support pinning buffers to current
 location
Date: Tue, 11 Jun 2019 15:03:36 +0200
Message-Id: <20190611130344.18988-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190611130344.18988-1-tzimmermann@suse.de>
References: <20190611130344.18988-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGlubmluZyBhIGJ1ZmZlciBwcmV2ZW50cyBpdCBmcm9tIGJlaW5nIG1vdmVkIHRvIGEgZGlmZmVy
ZW50IG1lbW9yeQpsb2NhdGlvbi4gRm9yIHNvbWUgb3BlcmF0aW9ucywgc3VjaCBhcyBidWZmZXIg
dXBkYXRlcywgaXQgaXMgbm90CmltcG9ydGFudCB3aGVyZSB0aGUgYnVmZmVyIGlzIGxvY2F0ZWQu
IFNldHRpbmcgdGhlIHBpbiBmdW5jdGlvbidzCnBsX2ZsYWcgYXJndW1lbnQgdG8gMCB3aWxsIHBp
biB0aGUgYnVmZmVyIHRvIHdoZXJlZXZlciBpdCBpcyBzdG9yZWQuCgpTaWduZWQtb2ZmLWJ5OiBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vZHJtX2dlbV92cmFtX2hlbHBlci5jIHwgMTIgKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92
cmFtX2hlbHBlci5jCmluZGV4IDQyYWQ4MDg4OGRmNy4uMjE0ZjU0Yjg5MjBiIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKQEAgLTIyNCw3ICsyMjQsOSBAQCBFWFBPUlRfU1lN
Qk9MKGRybV9nZW1fdnJhbV9vZmZzZXQpOwogICoKICAqIFBpbm5pbmcgYSBidWZmZXIgb2JqZWN0
IGVuc3VyZXMgdGhhdCBpdCBpcyBub3QgZXZpY3RlZCBmcm9tCiAgKiBhIG1lbW9yeSByZWdpb24u
IEEgcGlubmVkIGJ1ZmZlciBvYmplY3QgaGFzIHRvIGJlIHVucGlubmVkIGJlZm9yZQotICogaXQg
Y2FuIGJlIHBpbm5lZCB0byBhbm90aGVyIHJlZ2lvbi4KKyAqIGl0IGNhbiBiZSBwaW5uZWQgdG8g
YW5vdGhlciByZWdpb24uIElmIHRoZSBwbF9mbGFnIGFyZ3VtZW50IGlzIDAsCisgKiB0aGUgYnVm
ZmVyIGlzIHBpbm5lZCBhdCBpdHMgY3VycmVudCBsb2NhdGlvbiAodmlkZW8gUkFNIG9yIHN5c3Rl
bQorICogbWVtb3J5KS4KICAqCiAgKiBSZXR1cm5zOgogICogMCBvbiBzdWNjZXNzLCBvcgpAQCAt
MjQyLDcgKzI0NCw5IEBAIGludCBkcm1fZ2VtX3ZyYW1fcGluKHN0cnVjdCBkcm1fZ2VtX3ZyYW1f
b2JqZWN0ICpnYm8sIHVuc2lnbmVkIGxvbmcgcGxfZmxhZykKIAlpZiAoZ2JvLT5waW5fY291bnQp
CiAJCWdvdG8gb3V0OwogCi0JZHJtX2dlbV92cmFtX3BsYWNlbWVudChnYm8sIHBsX2ZsYWcpOwor
CWlmIChwbF9mbGFnKQorCQlkcm1fZ2VtX3ZyYW1fcGxhY2VtZW50KGdibywgcGxfZmxhZyk7CisK
IAlmb3IgKGkgPSAwOyBpIDwgZ2JvLT5wbGFjZW1lbnQubnVtX3BsYWNlbWVudDsgKytpKQogCQln
Ym8tPnBsYWNlbWVudHNbaV0uZmxhZ3MgfD0gVFRNX1BMX0ZMQUdfTk9fRVZJQ1Q7CiAKQEAgLTY5
MSw3ICs2OTUsNyBAQCBpbnQgZHJtX2dlbV92cmFtX2RyaXZlcl9nZW1fcHJpbWVfcGluKHN0cnVj
dCBkcm1fZ2VtX29iamVjdCAqZ2VtKQogewogCXN0cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0ICpn
Ym8gPSBkcm1fZ2VtX3ZyYW1fb2ZfZ2VtKGdlbSk7CiAKLQlyZXR1cm4gZHJtX2dlbV92cmFtX3Bp
bihnYm8sIERSTV9HRU1fVlJBTV9QTF9GTEFHX1ZSQU0pOworCXJldHVybiBkcm1fZ2VtX3ZyYW1f
cGluKGdibywgMCk7CiB9CiBFWFBPUlRfU1lNQk9MKGRybV9nZW1fdnJhbV9kcml2ZXJfZ2VtX3By
aW1lX3Bpbik7CiAKQEAgLTcyMyw3ICs3MjcsNyBAQCB2b2lkICpkcm1fZ2VtX3ZyYW1fZHJpdmVy
X2dlbV9wcmltZV92bWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ2VtKQogCWludCByZXQ7CiAJ
dm9pZCAqYmFzZTsKIAotCXJldCA9IGRybV9nZW1fdnJhbV9waW4oZ2JvLCBEUk1fR0VNX1ZSQU1f
UExfRkxBR19WUkFNKTsKKwlyZXQgPSBkcm1fZ2VtX3ZyYW1fcGluKGdibywgMCk7CiAJaWYgKHJl
dCkKIAkJcmV0dXJuIE5VTEw7CiAJYmFzZSA9IGRybV9nZW1fdnJhbV9rbWFwKGdibywgdHJ1ZSwg
TlVMTCk7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
