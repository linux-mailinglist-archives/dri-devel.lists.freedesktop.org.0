Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AFF64683
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 14:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FF06E0C1;
	Wed, 10 Jul 2019 12:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABB46E0C1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 12:51:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jul 2019 05:51:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,474,1557212400"; d="scan'208";a="156493671"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 10 Jul 2019 05:51:47 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 10 Jul 2019 15:51:46 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/dsc: Fix bogus cpu_to_be16() usage
Date: Wed, 10 Jul 2019 15:51:40 +0300
Message-Id: <20190710125143.9965-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190710125143.9965-1-ville.syrjala@linux.intel.com>
References: <20190710125143.9965-1-ville.syrjala@linux.intel.com>
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 David Francis <David.Francis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCl9f
YmUxNiA9IGNwdV90b19iZTE2KF9fYmUxNikgaXMgbm9uc2Vuc2UuIERvIGl0IHJpZ2h0LgoKLi4v
ZHJpdmVycy9ncHUvZHJtL2RybV9kc2MuYzoyMTg6NTM6IHdhcm5pbmc6IGluY29ycmVjdCB0eXBl
IGluIGFzc2lnbm1lbnQgKGRpZmZlcmVudCBiYXNlIHR5cGVzKQouLi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RzYy5jOjIxODo1MzogICAgZXhwZWN0ZWQgcmVzdHJpY3RlZCBfX2JlMTYKLi4vZHJpdmVy
cy9ncHUvZHJtL2RybV9kc2MuYzoyMTg6NTM6ICAgIGdvdCBpbnQKLi4vZHJpdmVycy9ncHUvZHJt
L2RybV9kc2MuYzoyMjU6MjU6IHdhcm5pbmc6IGNhc3QgZnJvbSByZXN0cmljdGVkIF9fYmUxNgou
Li9kcml2ZXJzL2dwdS9kcm0vZHJtX2RzYy5jOjIyNToyNTogd2FybmluZzogaW5jb3JyZWN0IHR5
cGUgaW4gYXJndW1lbnQgMSAoZGlmZmVyZW50IGJhc2UgdHlwZXMpCi4uL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHNjLmM6MjI1OjI1OiAgICBleHBlY3RlZCB1bnNpZ25lZCBzaG9ydCBbdXNlcnR5cGVd
IHZhbAouLi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RzYy5jOjIyNToyNTogICAgZ290IHJlc3RyaWN0
ZWQgX19iZTE2Ci4uL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHNjLmM6MjI1OjI1OiB3YXJuaW5nOiBj
YXN0IGZyb20gcmVzdHJpY3RlZCBfX2JlMTYKLi4vZHJpdmVycy9ncHUvZHJtL2RybV9kc2MuYzoy
MjU6MjU6IHdhcm5pbmc6IGNhc3QgZnJvbSByZXN0cmljdGVkIF9fYmUxNgoKQ2M6IE1hbmFzaSBO
YXZhcmUgPG1hbmFzaS5kLm5hdmFyZUBpbnRlbC5jb20+CkNjOiBEYXZpZCBGcmFuY2lzIDxEYXZp
ZC5GcmFuY2lzQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUu
c3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kc2MuYyB8
IDEyICsrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RzYy5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9kc2MuYwppbmRleCA3N2Y0ZTVhZTQxOTcuLmYyZmM0N2YxMjNkMiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kc2MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RzYy5jCkBAIC0yMTYsMTMgKzIxNiwxMSBAQCB2b2lkIGRybV9kc2NfcHBzX3BheWxvYWRf
cGFjayhzdHJ1Y3QgZHJtX2RzY19waWN0dXJlX3BhcmFtZXRlcl9zZXQgKnBwc19wYXlsb2FkLAog
CSAqLwogCWZvciAoaSA9IDA7IGkgPCBEU0NfTlVNX0JVRl9SQU5HRVM7IGkrKykgewogCQlwcHNf
cGF5bG9hZC0+cmNfcmFuZ2VfcGFyYW1ldGVyc1tpXSA9Ci0JCQkoKGRzY19jZmctPnJjX3Jhbmdl
X3BhcmFtc1tpXS5yYW5nZV9taW5fcXAgPDwKLQkJCSAgRFNDX1BQU19SQ19SQU5HRV9NSU5RUF9T
SElGVCkgfAotCQkJIChkc2NfY2ZnLT5yY19yYW5nZV9wYXJhbXNbaV0ucmFuZ2VfbWF4X3FwIDw8
Ci0JCQkgIERTQ19QUFNfUkNfUkFOR0VfTUFYUVBfU0hJRlQpIHwKLQkJCSAoZHNjX2NmZy0+cmNf
cmFuZ2VfcGFyYW1zW2ldLnJhbmdlX2JwZ19vZmZzZXQpKTsKLQkJcHBzX3BheWxvYWQtPnJjX3Jh
bmdlX3BhcmFtZXRlcnNbaV0gPQotCQkJY3B1X3RvX2JlMTYocHBzX3BheWxvYWQtPnJjX3Jhbmdl
X3BhcmFtZXRlcnNbaV0pOworCQkJY3B1X3RvX2JlMTYoKGRzY19jZmctPnJjX3JhbmdlX3BhcmFt
c1tpXS5yYW5nZV9taW5fcXAgPDwKKwkJCQkgICAgIERTQ19QUFNfUkNfUkFOR0VfTUlOUVBfU0hJ
RlQpIHwKKwkJCQkgICAgKGRzY19jZmctPnJjX3JhbmdlX3BhcmFtc1tpXS5yYW5nZV9tYXhfcXAg
PDwKKwkJCQkgICAgIERTQ19QUFNfUkNfUkFOR0VfTUFYUVBfU0hJRlQpIHwKKwkJCQkgICAgKGRz
Y19jZmctPnJjX3JhbmdlX3BhcmFtc1tpXS5yYW5nZV9icGdfb2Zmc2V0KSk7CiAJfQogCiAJLyog
UFBTIDg4ICovCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
