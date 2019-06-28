Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2967559601
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 10:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B31B6E880;
	Fri, 28 Jun 2019 08:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B2D6E87E;
 Fri, 28 Jun 2019 08:25:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jun 2019 01:25:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,427,1557212400"; d="scan'208";a="170688056"
Received: from slisovsk-lenovo-ideapad-720s-13ikb.fi.intel.com
 ([10.237.66.154])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Jun 2019 01:25:47 -0700
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm: Add helper to compare edids.
Date: Fri, 28 Jun 2019 11:24:52 +0300
Message-Id: <20190628082454.16345-2-stanislav.lisovskiy@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190628082454.16345-1-stanislav.lisovskiy@intel.com>
References: <20190628082454.16345-1-stanislav.lisovskiy@intel.com>
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
Cc: paul.kocialkowski@bootlin.com, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, martin.peres@intel.com,
 Stanislav.Lisovskiy@intel.com, simon.ser@intel.com, jani.saarinen@intel.com
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
L2RybS9kcm1fZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKaW5kZXggOWQ4ZjJi
OTUyMDA0Li5lYWFkNTE1NWZiZGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRp
ZC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCkBAIC0xMzYxLDYgKzEzNjEsMzkg
QEAgc3RhdGljIGJvb2wgZHJtX2VkaWRfaXNfemVybyhjb25zdCB1OCAqaW5fZWRpZCwgaW50IGxl
bmd0aCkKIAlyZXR1cm4gdHJ1ZTsKIH0KIAorLyoqCisgKiBkcm1fZWRpZF9hcmVfZXF1YWwgLSBj
b21wYXJlIHR3byBlZGlkIGJsb2JzLgorICogQGVkaWQxOiBwb2ludGVyIHRvIGZpcnN0IGJsb2IK
KyAqIEBlZGlkMjogcG9pbnRlciB0byBzZWNvbmQgYmxvYgorICogVGhpcyBoZWxwZXIgY2FuIGJl
IHVzZWQgZHVyaW5nIHByb2JpbmcgdG8gZGV0ZXJtaW5lIGlmCisgKiBlZGlkIGhhZCBjaGFuZ2Vk
LgorICovCitib29sIGRybV9lZGlkX2FyZV9lcXVhbChzdHJ1Y3QgZWRpZCAqZWRpZDEsIHN0cnVj
dCBlZGlkICplZGlkMikKK3sKKwlpbnQgZWRpZDFfbGVuLCBlZGlkMl9sZW47CisJYm9vbCBlZGlk
MV9wcmVzZW50ID0gZWRpZDEgIT0gTlVMTDsKKwlib29sIGVkaWQyX3ByZXNlbnQgPSBlZGlkMiAh
PSBOVUxMOworCisJaWYgKGVkaWQxX3ByZXNlbnQgIT0gZWRpZDJfcHJlc2VudCkKKwkJcmV0dXJu
IGZhbHNlOworCisJaWYgKGVkaWQxKSB7CisKKwkJZWRpZDFfbGVuID0gRURJRF9MRU5HVEggKiAo
MSArIGVkaWQxLT5leHRlbnNpb25zKTsKKwkJZWRpZDJfbGVuID0gRURJRF9MRU5HVEggKiAoMSAr
IGVkaWQyLT5leHRlbnNpb25zKTsKKworCQlpZiAoZWRpZDFfbGVuICE9IGVkaWQyX2xlbikKKwkJ
CXJldHVybiBmYWxzZTsKKworCQlpZiAobWVtY21wKGVkaWQxLCBlZGlkMiwgZWRpZDFfbGVuKSkK
KwkJCXJldHVybiBmYWxzZTsKKwl9CisKKwlyZXR1cm4gdHJ1ZTsKK30KK0VYUE9SVF9TWU1CT0wo
ZHJtX2VkaWRfYXJlX2VxdWFsKTsKKworCiAvKioKICAqIGRybV9lZGlkX2Jsb2NrX3ZhbGlkIC0g
U2FuaXR5IGNoZWNrIHRoZSBFRElEIGJsb2NrIChiYXNlIG9yIGV4dGVuc2lvbikKICAqIEByYXdf
ZWRpZDogcG9pbnRlciB0byByYXcgRURJRCBibG9jawpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0v
ZHJtX2VkaWQuaCBiL2luY2x1ZGUvZHJtL2RybV9lZGlkLmgKaW5kZXggYjk3MTk0MThjM2QyLi43
MTY5NjRmNjMzMTIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9lZGlkLmgKKysrIGIvaW5j
bHVkZS9kcm0vZHJtX2VkaWQuaApAQCAtMzU0LDYgKzM1NCwxNSBAQCBkcm1fbG9hZF9lZGlkX2Zp
cm13YXJlKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiB9CiAjZW5kaWYKIAorLyoq
CisgKiBkcm1fZWRpZF9hcmVfZXF1YWwgLSBjb21wYXJlIHR3byBlZGlkIGJsb2JzLgorICogQGVk
aWQxOiBwb2ludGVyIHRvIGZpcnN0IGJsb2IKKyAqIEBlZGlkMjogcG9pbnRlciB0byBzZWNvbmQg
YmxvYgorICogVGhpcyBoZWxwZXIgY2FuIGJlIHVzZWQgZHVyaW5nIHByb2JpbmcgdG8gZGV0ZXJt
aW5lIGlmCisgKiBlZGlkIGhhZCBjaGFuZ2VkLgorICovCitib29sIGRybV9lZGlkX2FyZV9lcXVh
bChzdHJ1Y3QgZWRpZCAqZWRpZDEsIHN0cnVjdCBlZGlkICplZGlkMik7CisKIGludAogZHJtX2hk
bWlfYXZpX2luZm9mcmFtZV9mcm9tX2Rpc3BsYXlfbW9kZShzdHJ1Y3QgaGRtaV9hdmlfaW5mb2Zy
YW1lICpmcmFtZSwKIAkJCQkJIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCi0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
