Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8166A2C64E0
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:11:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36AF6EC97;
	Fri, 27 Nov 2020 12:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5055C6EC91;
 Fri, 27 Nov 2020 12:09:41 +0000 (UTC)
IronPort-SDR: CJnyTKoBcbTTU1QrPascpLU+JF/lbjpvYfhTh60DSZpXGwTpgtggDeKinKG0qLTmDPslZYrj1M
 L1sWAAUHlqDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540696"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540696"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:40 -0800
IronPort-SDR: w8tilsrL6iiGcfLuHfhluGzliTXbSpLb1UUgnlGPnFLAQeezZP+dq3yE3hNHP9frrlY9OZVIqJ
 n09z85tb1v4Q==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029036"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:39 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 073/162] drm/i915: Reference contending lock objects
Date: Fri, 27 Nov 2020 12:05:49 +0000
Message-Id: <20201127120718.454037-74-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AaW50ZWwuY29tPgoKV2hl
biB3ZSBsb2NrIG9iamVjdHMgaW4gbGVhZiBmdW5jdGlvbnMsIGZvciBleGFtcGxlIGR1cmluZyBl
dmljdGlvbiwKdGhleSBtYXkgZGlzYXBwZWFyIGFzIHNvb24gYXMgd2UgdW5yZWZlcmVuY2UgdGhl
bSwgYW5kIHRoZSBsb2NraW5nCmNvbnRleHQgY29udGVuZGVkIHBvaW50ZXIgdGhlbiBwb2ludHMg
dG8gYSBmcmVlIG9iamVjdC4KRml4IHRoaXMgYnkgdGFraW5nIGEgcmVmZXJlbmNlIG9uIHRoYXQg
b2JqZWN0LCBhbmQgYWxzbyB1bmxvY2sgdGhlCmNvbnRlbmRpbmcgb2JqZWN0IGFzIHNvb24gYXMg
d2UndmUgZG9uZSB0aGUgd3cgdHJhbnNhY3Rpb24gcmVsYXhhdGlvbjoKVGhlIHJlc3RhcnRlZCB0
cmFuc2FjdGlvbiBtYXkgbm90IGV2ZW4gbmVlZCB0aGUgY29udGVuZGluZyBvYmplY3QsCmFuZCBr
ZWVwaW5nIHRoZSBsb2NrIGlzIG5vdCBuZWVkZWQgdG8gcHJldmVudCBzdGFydmF0aW9uLgpLZWVw
aW5nIHRoYXQgbG9jayB3aWxsIHVubmVjZXNzYXJpbHkgcmVxdWlyaW5nIHVzIHRvIHJlZmVyZW5j
ZSBjb3VudAphbGwgbG9ja3Mgb24gdGhlIGxpc3QgYW5kIGFsc28gY3JlYXRlcyBsb2NraW5nIGNv
bmZ1c2lvbiBhcm91bmQKLUVBTFJFQURZLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHLD
tm0gPHRob21hcy5oZWxsc3Ryb21AaW50ZWwuY29tPgpDYzogTWF0dGhldyBBdWxkIDxtYXR0aGV3
LmF1bGRAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9v
YmplY3QuaCB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtLmMgICAgICAgICAg
ICB8IDkgKysrKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1f
b2JqZWN0LmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fb2JqZWN0LmgKaW5k
ZXggZDU2NjQzYjNiNTE4Li42MGUyNzczOGMzOWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2dlbS9pOTE1X2dlbV9vYmplY3QuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
ZW0vaTkxNV9nZW1fb2JqZWN0LmgKQEAgLTE2Myw3ICsxNjMsNyBAQCBzdGF0aWMgaW5saW5lIGlu
dCBfX2k5MTVfZ2VtX29iamVjdF9sb2NrKHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmos
CiAJCXJldCA9IDA7CiAKIAlpZiAocmV0ID09IC1FREVBRExLKQotCQl3dy0+Y29udGVuZGVkID0g
b2JqOworCQl3dy0+Y29udGVuZGVkID0gaTkxNV9nZW1fb2JqZWN0X2dldChvYmopOwogCiAJcmV0
dXJuIHJldDsKIH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dlbS5jCmluZGV4IGVmNjZjMDkyNmFmNi4uMjI0
OGU2NWNmNWY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dlbS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtLmMKQEAgLTEzNzAsOSArMTM3MCwxNiBA
QCBpbnQgX19tdXN0X2NoZWNrIGk5MTVfZ2VtX3d3X2N0eF9iYWNrb2ZmKHN0cnVjdCBpOTE1X2dl
bV93d19jdHggKnd3KQogCWVsc2UKIAkJZG1hX3Jlc3ZfbG9ja19zbG93KHd3LT5jb250ZW5kZWQt
PmJhc2UucmVzdiwgJnd3LT5jdHgpOwogCisJLyoKKwkgKiBVbmxvY2tpbmcgdGhlIGNvbnRlbmRl
ZCBsb2NrIGFnYWluLCBhcyBtaWdodCBub3QgbmVlZCBpdCBpbgorCSAqIHRoZSByZXRyaWVkIHRy
YW5zYWN0aW9uLiBUaGlzIGRvZXMgbm90IGluY3JlYXNlIHN0YXJ2YXRpb24sCisJICogYnV0IGl0
J3Mgb3BlbmluZyB1cCBmb3IgYSB3YWtldXAgZmxvb2QgaWYgdGhlcmUgYXJlIG1hbnkKKwkgKiB0
cmFuc2FjdGlvbnMgcmVsYXhpbmcgb24gdGhpcyBvYmplY3QuCisJICovCiAJaWYgKCFyZXQpCi0J
CWxpc3RfYWRkX3RhaWwoJnd3LT5jb250ZW5kZWQtPm9ial9saW5rLCAmd3ctPm9ial9saXN0KTsK
KwkJZG1hX3Jlc3ZfdW5sb2NrKHd3LT5jb250ZW5kZWQtPmJhc2UucmVzdik7CiAKKwlpOTE1X2dl
bV9vYmplY3RfcHV0KHd3LT5jb250ZW5kZWQpOwogCXd3LT5jb250ZW5kZWQgPSBOVUxMOwogCiAJ
cmV0dXJuIHJldDsKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
