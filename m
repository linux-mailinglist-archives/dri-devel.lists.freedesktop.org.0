Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA967148F0D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 21:03:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7345072BAC;
	Fri, 24 Jan 2020 20:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9A372BA9;
 Fri, 24 Jan 2020 20:03:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 12:02:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,358,1574150400"; d="scan'208";a="293997529"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 24 Jan 2020 12:02:31 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 24 Jan 2020 22:02:31 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/8] drm/edid: Check the number of detailed timing descriptors
 in the CEA ext block
Date: Fri, 24 Jan 2020 22:02:24 +0200
Message-Id: <20200124200231.10517-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
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
Cc: Allen Chen <allen.chen@ite.com.tw>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkNF
QS04NjEgc2F5cyA6CiJkID0gb2Zmc2V0IGZvciB0aGUgYnl0ZSBmb2xsb3dpbmcgdGhlIHJlc2Vy
dmVkIGRhdGEgYmxvY2suCiBJZiBubyBkYXRhIGlzIHByb3ZpZGVkIGluIHRoZSByZXNlcnZlZCBk
YXRhIGJsb2NrLCB0aGVuIGQ9NC4KIElmIG5vIERURHMgYXJlIHByb3ZpZGVkLCB0aGVuIGQ9MC4i
CgpTbyBsZXQncyBub3QgbG9vayBmb3IgRFREcyB3aGVuIGQ9PTAuIEluIGZhY3QgbGV0J3MganVz
dCBtYWtlIHRoYXQKPDQgc2luY2UgdGhvc2UgdmFsdWVzIHdvdWxkIGp1c3QgbWVhbiB0aGF0IGhl
IERURHMgb3ZlcmxhcCB0aGUgYmxvY2sKaGVhZGVyLiBBbmQgbGV0J3MgYWxzbyBjaGVjayB0aGF0
IGQgaXNuJ3Qgc28gYmlnIGFzIHRvIGRlY2xhcmUKdGhlIGRlc2NyaXB0b3JzIHRvIGxpdmUgcGFz
dCB0aGUgYmxvY2sgZW5kLCBhbHRob3VnaCB0aGUgY29kZQpkb2VzIGFscmVhZHkgc3Vydml2ZSB0
aGF0IGNhc2UgYXMgd2UnZCBqdXN0IGVuZCB1cCB3aXRoIGEgbmVnYXRpdmUKbnVtYmVyIG9mIGRl
c2NyaXB0b3JzIGFuZCB0aGUgbG9vcCB3b3VsZCBub3QgZG8gYW55dGhpbmcuCgpDYzogQWxsZW4g
Q2hlbiA8YWxsZW4uY2hlbkBpdGUuY29tLnR3PgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rs
w6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9k
cm1fZWRpZC5jIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9lZGlkLmMKaW5kZXggOTk3NjlkNmM5Zjg0Li4xYjZlNTQ0Y2Y1Yzcg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZWRpZC5jCkBAIC0yMjAxLDEwICsyMjAxLDEzIEBAIHR5cGVkZWYgdm9pZCBkZXRh
aWxlZF9jYihzdHJ1Y3QgZGV0YWlsZWRfdGltaW5nICp0aW1pbmcsIHZvaWQgKmNsb3N1cmUpOwog
c3RhdGljIHZvaWQKIGNlYV9mb3JfZWFjaF9kZXRhaWxlZF9ibG9jayh1OCAqZXh0LCBkZXRhaWxl
ZF9jYiAqY2IsIHZvaWQgKmNsb3N1cmUpCiB7Ci0JaW50IGksIG4gPSAwOworCWludCBpLCBuOwog
CXU4IGQgPSBleHRbMHgwMl07CiAJdTggKmRldF9iYXNlID0gZXh0ICsgZDsKIAorCWlmIChkIDwg
NCB8fCBkID4gMTI3KQorCQlyZXR1cm47CisKIAluID0gKDEyNyAtIGQpIC8gMTg7CiAJZm9yIChp
ID0gMDsgaSA8IG47IGkrKykKIAkJY2IoKHN0cnVjdCBkZXRhaWxlZF90aW1pbmcgKikoZGV0X2Jh
c2UgKyAxOCAqIGkpLCBjbG9zdXJlKTsKLS0gCjIuMjQuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
