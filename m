Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EDFAB407
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 10:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26596E1EE;
	Fri,  6 Sep 2019 08:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621E26E1B1;
 Fri,  6 Sep 2019 08:28:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Sep 2019 01:28:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,472,1559545200"; d="scan'208";a="195378399"
Received: from slisovsk-lenovo-ideapad-720s-13ikb.fi.intel.com ([10.237.72.89])
 by orsmga002.jf.intel.com with ESMTP; 06 Sep 2019 01:28:48 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 1/3] drm: Add helper to compare edids.
Date: Fri,  6 Sep 2019 11:26:34 +0300
Message-Id: <20190906082636.3103-2-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190906082636.3103-1-stanislav.lisovskiy@intel.com>
References: <20190906082636.3103-1-stanislav.lisovskiy@intel.com>
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
Cc: simon.ser@intel.com, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, martin.peres@intel.com,
 Stanislav.Lisovskiy@intel.com, jani.saarinen@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWFueSBkcml2ZXJzIHdvdWxkIGJlbmVmaXQgZnJvbSB1c2luZwpkcm0gaGVscGVyIHRvIGNvbXBh
cmUgZWRpZCwgcmF0aGVyCnRoYW4gYm90aGVyaW5nIHdpdGggb3duIGltcGxlbWVudGF0aW9uLgoK
djI6IEFkZGVkIGRvY3VtZW50YXRpb24gZm9yIHRoaXMgZnVuY3Rpb24uCgpTaWduZWQtb2ZmLWJ5
OiBTdGFuaXNsYXYgTGlzb3Zza2l5IDxzdGFuaXNsYXYubGlzb3Zza2l5QGludGVsLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwogaW5jbHVkZS9kcm0vZHJtX2VkaWQuaCAgICAgfCAgOSArKysrKysrKysKIDIg
ZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKaW5kZXggODJhNGNl
ZWQzZmNmLi4wNjM5ZGI5ZmQyM2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRp
ZC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCkBAIC0xMzYyLDYgKzEzNjIsMzkg
QEAgc3RhdGljIGJvb2wgZHJtX2VkaWRfaXNfemVybyhjb25zdCB1OCAqaW5fZWRpZCwgaW50IGxl
bmd0aCkKIAlyZXR1cm4gdHJ1ZTsKIH0KIAorLyoqCisgKiBkcm1fZWRpZF9hcmVfZXF1YWwgLSBj
b21wYXJlIHR3byBlZGlkIGJsb2JzLgorICogQGVkaWQxOiBwb2ludGVyIHRvIGZpcnN0IGJsb2IK
KyAqIEBlZGlkMjogcG9pbnRlciB0byBzZWNvbmQgYmxvYgorICogVGhpcyBoZWxwZXIgY2FuIGJl
IHVzZWQgZHVyaW5nIHByb2JpbmcgdG8gZGV0ZXJtaW5lIGlmCisgKiBlZGlkIGhhZCBjaGFuZ2Vk
LgorICovCitib29sIGRybV9lZGlkX2FyZV9lcXVhbChjb25zdCBzdHJ1Y3QgZWRpZCAqZWRpZDEs
IGNvbnN0IHN0cnVjdCBlZGlkICplZGlkMikKK3sKKwlpbnQgZWRpZDFfbGVuLCBlZGlkMl9sZW47
CisJYm9vbCBlZGlkMV9wcmVzZW50ID0gZWRpZDEgIT0gTlVMTDsKKwlib29sIGVkaWQyX3ByZXNl
bnQgPSBlZGlkMiAhPSBOVUxMOworCisJaWYgKGVkaWQxX3ByZXNlbnQgIT0gZWRpZDJfcHJlc2Vu
dCkKKwkJcmV0dXJuIGZhbHNlOworCisJaWYgKGVkaWQxKSB7CisKKwkJZWRpZDFfbGVuID0gRURJ
RF9MRU5HVEggKiAoMSArIGVkaWQxLT5leHRlbnNpb25zKTsKKwkJZWRpZDJfbGVuID0gRURJRF9M
RU5HVEggKiAoMSArIGVkaWQyLT5leHRlbnNpb25zKTsKKworCQlpZiAoZWRpZDFfbGVuICE9IGVk
aWQyX2xlbikKKwkJCXJldHVybiBmYWxzZTsKKworCQlpZiAobWVtY21wKGVkaWQxLCBlZGlkMiwg
ZWRpZDFfbGVuKSkKKwkJCXJldHVybiBmYWxzZTsKKwl9CisKKwlyZXR1cm4gdHJ1ZTsKK30KK0VY
UE9SVF9TWU1CT0woZHJtX2VkaWRfYXJlX2VxdWFsKTsKKworCiAvKioKICAqIGRybV9lZGlkX2Js
b2NrX3ZhbGlkIC0gU2FuaXR5IGNoZWNrIHRoZSBFRElEIGJsb2NrIChiYXNlIG9yIGV4dGVuc2lv
bikKICAqIEByYXdfZWRpZDogcG9pbnRlciB0byByYXcgRURJRCBibG9jawpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9kcm0vZHJtX2VkaWQuaCBiL2luY2x1ZGUvZHJtL2RybV9lZGlkLmgKaW5kZXggYjk3
MTk0MThjM2QyLi5iMGM2OGIyZDc5ZWQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9lZGlk
LmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2VkaWQuaApAQCAtMzU0LDYgKzM1NCwxNSBAQCBkcm1f
bG9hZF9lZGlkX2Zpcm13YXJlKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiB9CiAj
ZW5kaWYKIAorLyoqCisgKiBkcm1fZWRpZF9hcmVfZXF1YWwgLSBjb21wYXJlIHR3byBlZGlkIGJs
b2JzLgorICogQGVkaWQxOiBwb2ludGVyIHRvIGZpcnN0IGJsb2IKKyAqIEBlZGlkMjogcG9pbnRl
ciB0byBzZWNvbmQgYmxvYgorICogVGhpcyBoZWxwZXIgY2FuIGJlIHVzZWQgZHVyaW5nIHByb2Jp
bmcgdG8gZGV0ZXJtaW5lIGlmCisgKiBlZGlkIGhhZCBjaGFuZ2VkLgorICovCitib29sIGRybV9l
ZGlkX2FyZV9lcXVhbChjb25zdCBzdHJ1Y3QgZWRpZCAqZWRpZDEsIGNvbnN0IHN0cnVjdCBlZGlk
ICplZGlkMik7CisKIGludAogZHJtX2hkbWlfYXZpX2luZm9mcmFtZV9mcm9tX2Rpc3BsYXlfbW9k
ZShzdHJ1Y3QgaGRtaV9hdmlfaW5mb2ZyYW1lICpmcmFtZSwKIAkJCQkJIHN0cnVjdCBkcm1fY29u
bmVjdG9yICpjb25uZWN0b3IsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
