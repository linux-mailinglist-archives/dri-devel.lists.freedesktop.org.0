Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B6336341
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 20:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1F5895A8;
	Wed,  5 Jun 2019 18:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE308895CA;
 Wed,  5 Jun 2019 18:17:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5B73E30BC569;
 Wed,  5 Jun 2019 18:17:42 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-66.ams2.redhat.com
 [10.36.116.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D53AD18E3C;
 Wed,  5 Jun 2019 18:17:40 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH 3/3] drm/i915/dsi: Read back pclk set by GOP and use that as
 pclk (v3)
Date: Wed,  5 Jun 2019 20:17:35 +0200
Message-Id: <20190605181735.7020-3-hdegoede@redhat.com>
In-Reply-To: <20190605181735.7020-1-hdegoede@redhat.com>
References: <20190605181735.7020-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Wed, 05 Jun 2019 18:17:42 +0000 (UTC)
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
aGUgdmJ0IGNvZGUgc2hvdWxkIG5vdCBiZSB0b3VjaGluZyB0aGUgaHcKClJldmlld2VkLWJ5OiBW
aWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpTaWduZWQtb2Zm
LWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L3Zsdl9kc2kuYyB8IDIyICsrKysrKysrKysrKysrKysrKy0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L3Zsdl9kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3Zsdl9k
c2kuYwppbmRleCA1OTUwMGM4MzhiOWQuLjZkOTY4OTE5ODRhNSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvdmx2X2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3Zsdl9k
c2kuYwpAQCAtMTg2NSw3ICsxODY1LDcgQEAgdm9pZCB2bHZfZHNpX2luaXQoc3RydWN0IGRybV9p
OTE1X3ByaXZhdGUgKmRldl9wcml2KQogCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsKIAlz
dHJ1Y3QgaW50ZWxfY29ubmVjdG9yICppbnRlbF9jb25uZWN0b3I7CiAJc3RydWN0IGRybV9jb25u
ZWN0b3IgKmNvbm5lY3RvcjsKLQlzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqZml4ZWRfbW9kZTsK
KwlzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqY3VycmVudF9tb2RlLCAqZml4ZWRfbW9kZTsKIAll
bnVtIHBvcnQgcG9ydDsKIAogCURSTV9ERUJVR19LTVMoIlxuIik7CkBAIC0xOTA5LDYgKzE5MDks
OSBAQCB2b2lkIHZsdl9kc2lfaW5pdChzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYp
CiAJaW50ZWxfY29ubmVjdG9yLT5nZXRfaHdfc3RhdGUgPSBpbnRlbF9jb25uZWN0b3JfZ2V0X2h3
X3N0YXRlOwogCiAJaW50ZWxfZW5jb2Rlci0+cG9ydCA9IHBvcnQ7CisJaW50ZWxfZW5jb2Rlci0+
dHlwZSA9IElOVEVMX09VVFBVVF9EU0k7CisJaW50ZWxfZW5jb2Rlci0+cG93ZXJfZG9tYWluID0g
UE9XRVJfRE9NQUlOX1BPUlRfRFNJOworCWludGVsX2VuY29kZXItPmNsb25lYWJsZSA9IDA7CiAK
IAkvKgogCSAqIE9uIEJZVC9DSFYsIHBpcGUgQSBtYXBzIHRvIE1JUEkgRFNJIHBvcnQgQSwgcGlw
ZSBCIG1hcHMgdG8gTUlQSSBEU0kKQEAgLTE5NDYsNiArMTk0OSwyMCBAQCB2b2lkIHZsdl9kc2lf
aW5pdChzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYpCiAJCWdvdG8gZXJyOwogCX0K
IAorCS8qIFVzZSBjbG9jayByZWFkLWJhY2sgZnJvbSBjdXJyZW50IGh3LXN0YXRlIGZvciBmYXN0
Ym9vdCAqLworCWN1cnJlbnRfbW9kZSA9IGludGVsX2VuY29kZXJfY3VycmVudF9tb2RlKGludGVs
X2VuY29kZXIpOworCWlmIChjdXJyZW50X21vZGUpIHsKKwkJRFJNX0RFQlVHX0tNUygiQ2FsY3Vs
YXRlZCBwY2xrICVkIEdPUCAlZFxuIiwKKwkJCSAgICAgIGludGVsX2RzaS0+cGNsaywgY3VycmVu
dF9tb2RlLT5jbG9jayk7CisJCWlmIChpbnRlbF9mdXp6eV9jbG9ja19jaGVjayhpbnRlbF9kc2kt
PnBjbGssCisJCQkJCSAgICBjdXJyZW50X21vZGUtPmNsb2NrKSkgeworCQkJRFJNX0RFQlVHX0tN
UygiVXNpbmcgR09QIHBjbGtcbiIpOworCQkJaW50ZWxfZHNpLT5wY2xrID0gY3VycmVudF9tb2Rl
LT5jbG9jazsKKwkJfQorCisJCWtmcmVlKGN1cnJlbnRfbW9kZSk7CisJfQorCiAJdmx2X2RwaHlf
cGFyYW1faW5pdChpbnRlbF9kc2kpOwogCiAJLyoKQEAgLTE5NjMsOSArMTk4MCw2IEBAIHZvaWQg
dmx2X2RzaV9pbml0KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdikKIAkJfQogCX0K
IAotCWludGVsX2VuY29kZXItPnR5cGUgPSBJTlRFTF9PVVRQVVRfRFNJOwotCWludGVsX2VuY29k
ZXItPnBvd2VyX2RvbWFpbiA9IFBPV0VSX0RPTUFJTl9QT1JUX0RTSTsKLQlpbnRlbF9lbmNvZGVy
LT5jbG9uZWFibGUgPSAwOwogCWRybV9jb25uZWN0b3JfaW5pdChkZXYsIGNvbm5lY3RvciwgJmlu
dGVsX2RzaV9jb25uZWN0b3JfZnVuY3MsCiAJCQkgICBEUk1fTU9ERV9DT05ORUNUT1JfRFNJKTsK
IAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
