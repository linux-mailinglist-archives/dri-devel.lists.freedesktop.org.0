Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73665119D89
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 23:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1D76E9CC;
	Tue, 10 Dec 2019 22:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Tue, 10 Dec 2019 22:38:55 UTC
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9DD6E98F;
 Tue, 10 Dec 2019 22:38:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Dec 2019 14:31:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; d="scan'208";a="238326488"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.54.75.49])
 by fmsmga004.fm.intel.com with ESMTP; 10 Dec 2019 14:31:29 -0800
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm: Handle connector tile support only for modes that
 match tile size
Date: Tue, 10 Dec 2019 14:32:34 -0800
Message-Id: <20191210223238.12022-2-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20191210223238.12022-1-manasi.d.navare@intel.com>
References: <20191210223238.12022-1-manasi.d.navare@intel.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RFJNIEZiIGRyaXZlciBleHBlY3RzIG11bHRpcGxlIENSVENzIGlmIGl0IHNlZXMgY29ubmVjdG9y
LT5oYXNfdGlsZQppcyBzZXQsIGJ1dCB3ZSBuZWVkIHRvIGhhbmRsZSB0aWxlIHN1cHBvcnQgYW5k
IGxvb2sgZm9yIG11bHRpcGxlIENSVENzCm9ubHkgZm9yIHRoZSBtb2RlcyB0aGF0IG1hdGNoIHRo
ZSB0aWxlIHNpemUuIFRoZSBvdGhlciBtb2RlcyBzaG91bGQKYmUgYWJsZSB0byBiZSBkaXNwbGF5
ZWQgd2l0aG91dCB0aWxlIHN1cHBvcnQgb3IgdWlzbmcgc2luZ2xlIENSVEMuCgpUaGlzIHBhdGNo
IGFkZHMgdGhlIGNoZWNrIHRvIG1hdGNoIHRoZSB0aWxlIHNpemUgd2l0aCByZXF1ZXN0ZWQgbW9k
ZQp0byBoYW5kbGUgdGhlIHRpbGUgc3VwcG9ydC4KCkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4u
bGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBp
bnRlbC5jb20+CkNjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgpTaWduZWQtb2Zm
LWJ5OiBNYW5hc2kgTmF2YXJlIDxtYW5hc2kuZC5uYXZhcmVAaW50ZWwuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2ZiX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwppbmRleCBm
YjliZmYwZjQ1ODEuLjQ5NzgzNjM3MTRhOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9mYl9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCkBAIC0x
NTU4LDcgKzE1NTgsOSBAQCBzdGF0aWMgaW50IGRybV9mYl9oZWxwZXJfc2luZ2xlX2ZiX3Byb2Jl
KHN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIsCiAJCWZvciAoaiA9IDA7IGogPCBtb2Rl
X3NldC0+bnVtX2Nvbm5lY3RvcnM7IGorKykgewogCQkJc3RydWN0IGRybV9jb25uZWN0b3IgKmNv
bm5lY3RvciA9IG1vZGVfc2V0LT5jb25uZWN0b3JzW2pdOwogCi0JCQlpZiAoY29ubmVjdG9yLT5o
YXNfdGlsZSkgeworCQkJaWYgKGNvbm5lY3Rvci0+aGFzX3RpbGUgJiYKKwkJCSAgICBkZXNpcmVk
X21vZGUtPmhkaXNwbGF5ID09IGNvbm5lY3Rvci0+dGlsZV9oX3NpemUgJiYKKwkJCSAgICBkZXNp
cmVkX21vZGUtPnZkaXNwbGF5ID09IGNvbm5lY3Rvci0+dGlsZV92X3NpemUpIHsKIAkJCQlsYXN0
aCA9IChjb25uZWN0b3ItPnRpbGVfaF9sb2MgPT0gKGNvbm5lY3Rvci0+bnVtX2hfdGlsZSAtIDEp
KTsKIAkJCQlsYXN0diA9IChjb25uZWN0b3ItPnRpbGVfdl9sb2MgPT0gKGNvbm5lY3Rvci0+bnVt
X3ZfdGlsZSAtIDEpKTsKIAkJCQkvKiBjbG9uaW5nIHRvIG11bHRpcGxlIHRpbGVzIGlzIGp1c3Qg
Y3JhenktdGFsaywgc286ICovCi0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
