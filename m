Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9069B38862
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 13:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D670989B9F;
	Fri,  7 Jun 2019 11:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63FAC89B9A;
 Fri,  7 Jun 2019 11:02:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jun 2019 04:02:13 -0700
X-ExtLoop1: 1
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 07 Jun 2019 04:02:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/edid: abstract override/firmware EDID retrieval
Date: Fri,  7 Jun 2019 14:05:12 +0300
Message-Id: <20190607110513.12072-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, Harish Chegondi <harish.chegondi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWJzdHJhY3QgdGhlIGRlYnVnZnMgb3ZlcnJpZGUgYW5kIHRoZSBmaXJtd2FyZSBFRElEIHJldHJp
ZXZhbApmdW5jdGlvbi4gV2UnbGwgYmUgbmVlZGluZyBpdCBpbiB0aGUgZm9sbG93LXVwLiBObyBm
dW5jdGlvbmFsIGNoYW5nZXMuCgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpD
YzogSGFyaXNoIENoZWdvbmRpIDxoYXJpc2guY2hlZ29uZGlAaW50ZWwuY29tPgpTaWduZWQtb2Zm
LWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZWRpZC5jIHwgMjUgKysrKysrKysrKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9lZGlkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwppbmRl
eCBjMzI5NmE3MmZmZjkuLmM1OWExZThjNWFkYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2RybV9lZGlkLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKQEAgLTE1NzMsNiAr
MTU3MywyMCBAQCBzdGF0aWMgdm9pZCBjb25uZWN0b3JfYmFkX2VkaWQoc3RydWN0IGRybV9jb25u
ZWN0b3IgKmNvbm5lY3RvciwKIAl9CiB9CiAKKy8qIEdldCBvdmVycmlkZSBvciBmaXJtd2FyZSBF
RElEICovCitzdGF0aWMgc3RydWN0IGVkaWQgKmRybV9nZXRfb3ZlcnJpZGVfZWRpZChzdHJ1Y3Qg
ZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQoreworCXN0cnVjdCBlZGlkICpvdmVycmlkZSA9IE5V
TEw7CisKKwlpZiAoY29ubmVjdG9yLT5vdmVycmlkZV9lZGlkKQorCQlvdmVycmlkZSA9IGRybV9l
ZGlkX2R1cGxpY2F0ZShjb25uZWN0b3ItPmVkaWRfYmxvYl9wdHItPmRhdGEpOworCisJaWYgKCFv
dmVycmlkZSkKKwkJb3ZlcnJpZGUgPSBkcm1fbG9hZF9lZGlkX2Zpcm13YXJlKGNvbm5lY3Rvcik7
CisKKwlyZXR1cm4gSVNfRVJSKG92ZXJyaWRlKSA/IE5VTEwgOiBvdmVycmlkZTsKK30KKwogLyoq
CiAgKiBkcm1fZG9fZ2V0X2VkaWQgLSBnZXQgRURJRCBkYXRhIHVzaW5nIGEgY3VzdG9tIEVESUQg
YmxvY2sgcmVhZCBmdW5jdGlvbgogICogQGNvbm5lY3RvcjogY29ubmVjdG9yIHdlJ3JlIHByb2Jp
bmcKQEAgLTE2MDAsMTUgKzE2MTQsMTAgQEAgc3RydWN0IGVkaWQgKmRybV9kb19nZXRfZWRpZChz
dHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAogewogCWludCBpLCBqID0gMCwgdmFsaWRf
ZXh0ZW5zaW9ucyA9IDA7CiAJdTggKmVkaWQsICpuZXc7Ci0Jc3RydWN0IGVkaWQgKm92ZXJyaWRl
ID0gTlVMTDsKLQotCWlmIChjb25uZWN0b3ItPm92ZXJyaWRlX2VkaWQpCi0JCW92ZXJyaWRlID0g
ZHJtX2VkaWRfZHVwbGljYXRlKGNvbm5lY3Rvci0+ZWRpZF9ibG9iX3B0ci0+ZGF0YSk7Ci0KLQlp
ZiAoIW92ZXJyaWRlKQotCQlvdmVycmlkZSA9IGRybV9sb2FkX2VkaWRfZmlybXdhcmUoY29ubmVj
dG9yKTsKKwlzdHJ1Y3QgZWRpZCAqb3ZlcnJpZGU7CiAKLQlpZiAoIUlTX0VSUl9PUl9OVUxMKG92
ZXJyaWRlKSkKKwlvdmVycmlkZSA9IGRybV9nZXRfb3ZlcnJpZGVfZWRpZChjb25uZWN0b3IpOwor
CWlmIChvdmVycmlkZSkKIAkJcmV0dXJuIG92ZXJyaWRlOwogCiAJaWYgKChlZGlkID0ga21hbGxv
YyhFRElEX0xFTkdUSCwgR0ZQX0tFUk5FTCkpID09IE5VTEwpCi0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
