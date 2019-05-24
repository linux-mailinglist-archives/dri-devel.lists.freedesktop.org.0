Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C75BC29C4C
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 18:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC7E6E129;
	Fri, 24 May 2019 16:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06166E129;
 Fri, 24 May 2019 16:30:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 66F1530C0DC9;
 Fri, 24 May 2019 16:30:42 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-47.ams2.redhat.com
 [10.36.112.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C25D6092D;
 Fri, 24 May 2019 16:30:37 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Daniel Vetter <daniel.vetter@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 4/4] drm/i915/dsi: Read back pclk set by GOP and use that as
 pclk (v3)
Date: Fri, 24 May 2019 18:30:20 +0200
Message-Id: <20190524163020.17099-5-hdegoede@redhat.com>
In-Reply-To: <20190524163020.17099-1-hdegoede@redhat.com>
References: <20190524163020.17099-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 24 May 2019 16:30:44 +0000 (UTC)
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEdPUCBzb21ldGltZXMgaW5pdGlhbGl6ZXMgdGhlIHBjbGsgYXQgYSAoc2xpZ2h0bHkpIGRp
ZmZlcmVudCBmcmVxdWVuY3kKdGhlbiB0aGUgcGNsayB3aGljaCB3ZSd2ZSBjYWxjdWxhdGVkLgoK
VGhpcyBjb21taXQgbWFrZXMgdGhlIERTSSBjb2RlIHJlYWQtYmFjayB0aGUgcGNsayBzZXQgYnkg
dGhlIEdPUCBhbmQKaWYgdGhhdCBpcyB3aXRoaW4gYSByZWFzb25hYmxlIG1hcmdpbiBvZiB0aGUg
Y2FsY3VsYXRlZCBwY2xrLCB1c2VzCnRoYXQgaW5zdGVhZC4KClRoaXMgZml4ZXMgdGhlIGZpcnN0
IG1vZGVzZXQgYmVpbmcgYSBmdWxsIG1vZGVzZXQgaW5zdGVhZCBvZiBhCmZhc3QgbW9kZXNldCBv
biBzeXN0ZW1zIHdoZXJlIHRoZSBHT1AgcGNsayBpcyBkaWZmZXJlbnQuCgpDaGFuZ2VzIGluIHYy
OgotVXNlIGludGVsX2VuY29kZXJfY3VycmVudF9tb2RlKCkgdG8gZ2V0IHRoZSBwY2xrIHNldHVw
IGJ5IHRoZSBHT1AKCkNoYW5nZXMgaW4gdjM6Ci1CYWNrIHRvIHRoZSByZWFkYmFjayBhcHByb2Fj
aCwgc2tpcHBpbmcgdGhlIGRzaV9wbGwuY3RybCAvIC5kZXYgY2hlY2tzCiBpbiBpbnRlbF9waXBl
X2NvbmZpZ19jb21wYXJlKCkgd2hlbiBhZGp1c3QgaXMgc2V0IGxlYWRzIHRvOgogW2RybTpwaXBl
X2NvbmZpZ19lcnIgW2k5MTVdXSAqRVJST1IqIG1pc21hdGNoIGluIGRzaV9wbGwuY3RybCAoLi4u
KQogW2RybTpwaXBlX2NvbmZpZ19lcnIgW2k5MTVdXSAqRVJST1IqIG1pc21hdGNoIGluIGRzaV9w
bGwuZGl2ICguLi4pCi1EbyB0aGUgcmVhZGJhY2sgYW5kIHBjbGsgb3ZlcnJpZGluZyBmcm9tIHZs
dl9kc2lfaW5pdCgpLCByYXRoZXIgdGhlbiBmcm9tCiBpbnRlbF9kc2lfdmJ0X2luaXQoKSBhcyB0
aGUgdmJ0IGNvZGUgc2hvdWxkIG5vdCBiZSB0b3VjaGluZyB0aGUgaHcKClNpZ25lZC1vZmYtYnk6
IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2k5MTUvdmx2X2RzaS5jIHwgMjIgKysrKysrKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDE4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvdmx2X2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvdmx2X2RzaS5j
CmluZGV4IDMzMjljY2YzYjM0Ni4uNDk5NzVkZDg0ZmY0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS92bHZfZHNpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvdmx2X2RzaS5j
CkBAIC0xNzAxLDcgKzE3MDEsNyBAQCB2b2lkIHZsdl9kc2lfaW5pdChzdHJ1Y3QgZHJtX2k5MTVf
cHJpdmF0ZSAqZGV2X3ByaXYpCiAJc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyOwogCXN0cnVj
dCBpbnRlbF9jb25uZWN0b3IgKmludGVsX2Nvbm5lY3RvcjsKIAlzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubmVjdG9yOwotCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpmaXhlZF9tb2RlOworCXN0
cnVjdCBkcm1fZGlzcGxheV9tb2RlICpjdXJyZW50X21vZGUsICpmaXhlZF9tb2RlOwogCWVudW0g
cG9ydCBwb3J0OwogCiAJRFJNX0RFQlVHX0tNUygiXG4iKTsKQEAgLTE3NDUsNiArMTc0NSw5IEBA
IHZvaWQgdmx2X2RzaV9pbml0KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdikKIAlp
bnRlbF9jb25uZWN0b3ItPmdldF9od19zdGF0ZSA9IGludGVsX2Nvbm5lY3Rvcl9nZXRfaHdfc3Rh
dGU7CiAKIAlpbnRlbF9lbmNvZGVyLT5wb3J0ID0gcG9ydDsKKwlpbnRlbF9lbmNvZGVyLT50eXBl
ID0gSU5URUxfT1VUUFVUX0RTSTsKKwlpbnRlbF9lbmNvZGVyLT5wb3dlcl9kb21haW4gPSBQT1dF
Ul9ET01BSU5fUE9SVF9EU0k7CisJaW50ZWxfZW5jb2Rlci0+Y2xvbmVhYmxlID0gMDsKIAogCS8q
CiAJICogT24gQllUL0NIViwgcGlwZSBBIG1hcHMgdG8gTUlQSSBEU0kgcG9ydCBBLCBwaXBlIEIg
bWFwcyB0byBNSVBJIERTSQpAQCAtMTc4Miw2ICsxNzg1LDIwIEBAIHZvaWQgdmx2X2RzaV9pbml0
KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdikKIAkJZ290byBlcnI7CiAJfQogCisJ
LyogVXNlIGNsb2NrIHJlYWQtYmFjayBmcm9tIGN1cnJlbnQgaHctc3RhdGUgZm9yIGZhc3Rib290
ICovCisJY3VycmVudF9tb2RlID0gaW50ZWxfZW5jb2Rlcl9jdXJyZW50X21vZGUoaW50ZWxfZW5j
b2Rlcik7CisJaWYgKGN1cnJlbnRfbW9kZSkgeworCQlEUk1fREVCVUdfS01TKCJDYWxjdWxhdGVk
IHBjbGsgJWQgR09QICVkXG4iLAorCQkJICAgICAgaW50ZWxfZHNpLT5wY2xrLCBjdXJyZW50X21v
ZGUtPmNsb2NrKTsKKwkJaWYgKGludGVsX2Z1enp5X2Nsb2NrX2NoZWNrKGludGVsX2RzaS0+cGNs
aywKKwkJCQkJICAgIGN1cnJlbnRfbW9kZS0+Y2xvY2spKSB7CisJCQlEUk1fREVCVUdfS01TKCJV
c2luZyBHT1AgcGNsa1xuIik7CisJCQlpbnRlbF9kc2ktPnBjbGsgPSBjdXJyZW50X21vZGUtPmNs
b2NrOworCQl9CisKKwkJa2ZyZWUoY3VycmVudF9tb2RlKTsKKwl9CisKIAl2bHZfZHBoeV9wYXJh
bV9pbml0KGludGVsX2RzaSk7CiAKIAkvKgpAQCAtMTc5OSw5ICsxODE2LDYgQEAgdm9pZCB2bHZf
ZHNpX2luaXQoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2KQogCQl9CiAJfQogCi0J
aW50ZWxfZW5jb2Rlci0+dHlwZSA9IElOVEVMX09VVFBVVF9EU0k7Ci0JaW50ZWxfZW5jb2Rlci0+
cG93ZXJfZG9tYWluID0gUE9XRVJfRE9NQUlOX1BPUlRfRFNJOwotCWludGVsX2VuY29kZXItPmNs
b25lYWJsZSA9IDA7CiAJZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgY29ubmVjdG9yLCAmaW50ZWxf
ZHNpX2Nvbm5lY3Rvcl9mdW5jcywKIAkJCSAgIERSTV9NT0RFX0NPTk5FQ1RPUl9EU0kpOwogCi0t
IAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
