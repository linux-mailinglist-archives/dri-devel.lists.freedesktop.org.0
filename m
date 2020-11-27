Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCF12C64C1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:10:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7E96EC7A;
	Fri, 27 Nov 2020 12:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0BFD6EC7A;
 Fri, 27 Nov 2020 12:09:26 +0000 (UTC)
IronPort-SDR: 0+YfMeVSz76W+45perDlNSC7hi7ocSTWsbs752nAGFtXQziz3crYqS91BLeqaM4qjj2jXRnMao
 /uhlfoVL20Nw==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540672"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540672"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:26 -0800
IronPort-SDR: Qof8VJe9+dnTKQ2HVDxgSKk8X8mKKsLDv39sH/aKZm4fHd3qjI0K1SEmdvMpPtkkzmoVJWEWWo
 Uj2mcREAJTAw==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028959"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:24 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 065/162] drm/i915/selftests: Prepare timeline tests for
 obj->mm.lock removal
Date: Fri, 27 Nov 2020 12:05:41 +0000
Message-Id: <20201127120718.454037-66-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNv
bT4KCldlIGNhbiBubyBsb25nZXIgY2FsbCBpbnRlbF90aW1lbGluZV9waW4gd2l0aCBhIG51bGwg
YXJndW1lbnQsCnNvIGFkZCBhIHd3IGxvb3AgdGhhdCBsb2NrcyB0aGUgYmFja2luZyBvYmplY3Qu
CgpTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGlu
dXguaW50ZWwuY29tPgpDYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGlu
dXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3NlbGZ0ZXN0X3RpbWVs
aW5lLmMgfCAyOCArKysrKysrKysrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d0L3NlbGZ0ZXN0X3RpbWVsaW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9zZWxm
dGVzdF90aW1lbGluZS5jCmluZGV4IDc0MzVhYmY1YTcwMy4uZDQ2ODE0N2EwM2RlIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9zZWxmdGVzdF90aW1lbGluZS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d0L3NlbGZ0ZXN0X3RpbWVsaW5lLmMKQEAgLTM3LDYgKzM3LDI2
IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIGh3c3BfY2FjaGVsaW5lKHN0cnVjdCBpbnRlbF90aW1l
bGluZSAqdGwpCiAJcmV0dXJuIChhZGRyZXNzICsgb2Zmc2V0X2luX3BhZ2UodGwtPmh3c3Bfb2Zm
c2V0KSkgLyBDQUNIRUxJTkVfQllURVM7CiB9CiAKK3N0YXRpYyBpbnQgc2VsZnRlc3RfdGxfcGlu
KHN0cnVjdCBpbnRlbF90aW1lbGluZSAqdGwpCit7CisJc3RydWN0IGk5MTVfZ2VtX3d3X2N0eCB3
dzsKKwlpbnQgZXJyOworCisJaTkxNV9nZW1fd3dfY3R4X2luaXQoJnd3LCBmYWxzZSk7CityZXRy
eToKKwllcnIgPSBpOTE1X2dlbV9vYmplY3RfbG9jayh0bC0+aHdzcF9nZ3R0LT5vYmosICZ3dyk7
CisJaWYgKCFlcnIpCisJCWVyciA9IGludGVsX3RpbWVsaW5lX3Bpbih0bCwgJnd3KTsKKworCWlm
IChlcnIgPT0gLUVERUFETEspIHsKKwkJZXJyID0gaTkxNV9nZW1fd3dfY3R4X2JhY2tvZmYoJnd3
KTsKKwkJaWYgKCFlcnIpCisJCQlnb3RvIHJldHJ5OworCX0KKwlpOTE1X2dlbV93d19jdHhfZmlu
aSgmd3cpOworCXJldHVybiBlcnI7Cit9CisKICNkZWZpbmUgQ0FDSEVMSU5FU19QRVJfUEFHRSAo
UEFHRV9TSVpFIC8gQ0FDSEVMSU5FX0JZVEVTKQogCiBzdHJ1Y3QgbW9ja19od3NwX2ZyZWVsaXN0
IHsKQEAgLTc4LDcgKzk4LDcgQEAgc3RhdGljIGludCBfX21vY2tfaHdzcF90aW1lbGluZShzdHJ1
Y3QgbW9ja19od3NwX2ZyZWVsaXN0ICpzdGF0ZSwKIAkJaWYgKElTX0VSUih0bCkpCiAJCQlyZXR1
cm4gUFRSX0VSUih0bCk7CiAKLQkJZXJyID0gaW50ZWxfdGltZWxpbmVfcGluKHRsLCBOVUxMKTsK
KwkJZXJyID0gc2VsZnRlc3RfdGxfcGluKHRsKTsKIAkJaWYgKGVycikgewogCQkJaW50ZWxfdGlt
ZWxpbmVfcHV0KHRsKTsKIAkJCXJldHVybiBlcnI7CkBAIC00NjQsNyArNDg0LDcgQEAgY2hlY2tl
ZF90bF93cml0ZShzdHJ1Y3QgaW50ZWxfdGltZWxpbmUgKnRsLCBzdHJ1Y3QgaW50ZWxfZW5naW5l
X2NzICplbmdpbmUsIHUzMgogCXN0cnVjdCBpOTE1X3JlcXVlc3QgKnJxOwogCWludCBlcnI7CiAK
LQllcnIgPSBpbnRlbF90aW1lbGluZV9waW4odGwsIE5VTEwpOworCWVyciA9IHNlbGZ0ZXN0X3Rs
X3Bpbih0bCk7CiAJaWYgKGVycikgewogCQlycSA9IEVSUl9QVFIoZXJyKTsKIAkJZ290byBvdXQ7
CkBAIC02NjQsNyArNjg0LDcgQEAgc3RhdGljIGludCBsaXZlX2h3c3Bfd3JhcCh2b2lkICphcmcp
CiAJaWYgKCF0bC0+aGFzX2luaXRpYWxfYnJlYWRjcnVtYiB8fCAhdGwtPmh3c3BfY2FjaGVsaW5l
KQogCQlnb3RvIG91dF9mcmVlOwogCi0JZXJyID0gaW50ZWxfdGltZWxpbmVfcGluKHRsLCBOVUxM
KTsKKwllcnIgPSBzZWxmdGVzdF90bF9waW4odGwpOwogCWlmIChlcnIpCiAJCWdvdG8gb3V0X2Zy
ZWU7CiAKQEAgLTgxMSw3ICs4MzEsNyBAQCBzdGF0aWMgaW50IHNldHVwX3dhdGNoZXIoc3RydWN0
IGh3c3Bfd2F0Y2hlciAqdywgc3RydWN0IGludGVsX2d0ICpndCkKIAlpZiAoSVNfRVJSKG9iaikp
CiAJCXJldHVybiBQVFJfRVJSKG9iaik7CiAKLQl3LT5tYXAgPSBpOTE1X2dlbV9vYmplY3RfcGlu
X21hcChvYmosIEk5MTVfTUFQX1dCKTsKKwl3LT5tYXAgPSBpOTE1X2dlbV9vYmplY3RfcGluX21h
cF91bmxvY2tlZChvYmosIEk5MTVfTUFQX1dCKTsKIAlpZiAoSVNfRVJSKHctPm1hcCkpIHsKIAkJ
aTkxNV9nZW1fb2JqZWN0X3B1dChvYmopOwogCQlyZXR1cm4gUFRSX0VSUih3LT5tYXApOwotLSAK
Mi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
