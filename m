Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4022C6588
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:14:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B3C6ED9D;
	Fri, 27 Nov 2020 12:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF666ED94;
 Fri, 27 Nov 2020 12:12:21 +0000 (UTC)
IronPort-SDR: fr5yYSOpQGS1vYCfIRJ1L4uMPpcCrbtstxsnwq5GQYkjDoX7+QmVI0h5WEoqb7XgcWH0/DK6lL
 kzX2xjplkWnA==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883863"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883863"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:20 -0800
IronPort-SDR: Ri+59kjqqMwEevS2pzVVe3shSifW+VFDLhoF9/cGtl1euNKDtM3Z2gSUN3kJ7KkOdZ2fzOs9PB
 pLlnlifAR/vw==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548030030"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:19 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 152/162] drm/i915: Perform execbuffer object locking as a
 separate step
Date: Fri, 27 Nov 2020 12:07:08 +0000
Message-Id: <20201127120718.454037-153-matthew.auld@intel.com>
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

RnJvbTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AaW50ZWwuY29tPgoKVGhp
cyBpcyBpbXBvcnRhbnQgdG8gaGVscCBhdm9pZCBldmljdGluZyBhbHJlYWR5IHJlc2lkZW50IGJ1
ZmZlcnMKZnJvbSB0aGUgYmF0Y2ggd2UncmUgcHJvY2Vzc2luZy4KClNpZ25lZC1vZmYtYnk6IFRo
b21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGludGVsLmNvbT4KQ2M6IE1hdHRoZXcg
QXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9pOTE1L2dlbS9p
OTE1X2dlbV9leGVjYnVmZmVyLmMgICAgfCAyNSArKysrKysrKysrKysrKysrLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZXhlY2J1ZmZlci5jIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2V4ZWNidWZmZXIuYwppbmRleCBlNzNhNzYxYTdkMWYu
LmM5ODhmOGZmZDM5ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVf
Z2VtX2V4ZWNidWZmZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1f
ZXhlY2J1ZmZlci5jCkBAIC05MTgsMjEgKzkxOCwzOCBAQCBzdGF0aWMgaW50IGViX2xvb2t1cF92
bWFzKHN0cnVjdCBpOTE1X2V4ZWNidWZmZXIgKmViKQogCXJldHVybiBlcnI7CiB9CiAKLXN0YXRp
YyBpbnQgZWJfdmFsaWRhdGVfdm1hcyhzdHJ1Y3QgaTkxNV9leGVjYnVmZmVyICplYikKK3N0YXRp
YyBpbnQgZWJfbG9ja192bWFzKHN0cnVjdCBpOTE1X2V4ZWNidWZmZXIgKmViKQogewogCXVuc2ln
bmVkIGludCBpOwogCWludCBlcnI7CiAKLQlJTklUX0xJU1RfSEVBRCgmZWItPnVuYm91bmQpOwot
CiAJZm9yIChpID0gMDsgaSA8IGViLT5idWZmZXJfY291bnQ7IGkrKykgewotCQlzdHJ1Y3QgZHJt
X2k5MTVfZ2VtX2V4ZWNfb2JqZWN0MiAqZW50cnkgPSAmZWItPmV4ZWNbaV07CiAJCXN0cnVjdCBl
Yl92bWEgKmV2ID0gJmViLT52bWFbaV07CiAJCXN0cnVjdCBpOTE1X3ZtYSAqdm1hID0gZXYtPnZt
YTsKIAogCQllcnIgPSBpOTE1X2dlbV9vYmplY3RfbG9jayh2bWEtPm9iaiwgJmViLT53dyk7CiAJ
CWlmIChlcnIpCiAJCQlyZXR1cm4gZXJyOworCX0KKworCXJldHVybiAwOworfQorCitzdGF0aWMg
aW50IGViX3ZhbGlkYXRlX3ZtYXMoc3RydWN0IGk5MTVfZXhlY2J1ZmZlciAqZWIpCit7CisJdW5z
aWduZWQgaW50IGk7CisJaW50IGVycjsKKworCUlOSVRfTElTVF9IRUFEKCZlYi0+dW5ib3VuZCk7
CisKKwllcnIgPSBlYl9sb2NrX3ZtYXMoZWIpOworCWlmIChlcnIpCisJCXJldHVybiBlcnI7CisK
Kwlmb3IgKGkgPSAwOyBpIDwgZWItPmJ1ZmZlcl9jb3VudDsgaSsrKSB7CisJCXN0cnVjdCBkcm1f
aTkxNV9nZW1fZXhlY19vYmplY3QyICplbnRyeSA9ICZlYi0+ZXhlY1tpXTsKKwkJc3RydWN0IGVi
X3ZtYSAqZXYgPSAmZWItPnZtYVtpXTsKKwkJc3RydWN0IGk5MTVfdm1hICp2bWEgPSBldi0+dm1h
OwogCiAJCWVyciA9IGViX3Bpbl92bWEoZWIsIGVudHJ5LCBldik7CiAJCWlmIChlcnIgPT0gLUVE
RUFETEspCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
