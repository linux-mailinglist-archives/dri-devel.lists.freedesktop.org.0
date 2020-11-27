Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 320C32C64B4
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EE66EC7D;
	Fri, 27 Nov 2020 12:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48DD06EC7B;
 Fri, 27 Nov 2020 12:09:16 +0000 (UTC)
IronPort-SDR: o7KJUWJZ4ATk99d5K6sylAxGoahSllONZYKoZbRrvfTTnV42KvkX0edY0i/L46BYHDdmsvaZYG
 AlEBCTFHHCxg==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540649"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540649"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:16 -0800
IronPort-SDR: iI/L6KuehGt4k3A2Hls/pyUemxvrohtX+ik5kKHXJGV9AbueYYQS1nIBk3Wx6sZSyZCqY6eMqg
 d2IXMK9uIL0Q==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028915"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:14 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 059/162] drm/i915/selftests: Prepare igt_gem_utils for
 obj->mm.lock removal
Date: Fri, 27 Nov 2020 12:05:35 +0000
Message-Id: <20201127120718.454037-60-matthew.auld@intel.com>
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
bT4KCmlndF9lbWl0X3N0b3JlX2R3IG5lZWRzIHRvIHVzZSB0aGUgdW5sb2NrZWQgdmVyc2lvbiwg
YXMgaXQncyBub3QKaG9sZGluZyBhIGxvY2suIFRoaXMgZml4ZXMgaWd0X2dwdV9maWxsX2R3KCkg
d2hpY2ggaXMgdXNlZCBieQpzb21lIG90aGVyIHNlbGZ0ZXN0cy4KClNpZ25lZC1vZmYtYnk6IE1h
YXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBU
aG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL3NlbGZ0ZXN0cy9pZ3RfZ2VtX3V0aWxzLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vc2VsZnRlc3RzL2lndF9nZW1fdXRpbHMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9zZWxmdGVzdHMvaWd0X2dlbV91dGlscy5jCmluZGV4
IGUyMWI1MDIzY2E3ZC4uZjRlODViNGEzNDdkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9nZW0vc2VsZnRlc3RzL2lndF9nZW1fdXRpbHMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9nZW0vc2VsZnRlc3RzL2lndF9nZW1fdXRpbHMuYwpAQCAtNTQsNyArNTQsNyBAQCBpZ3Rf
ZW1pdF9zdG9yZV9kdyhzdHJ1Y3QgaTkxNV92bWEgKnZtYSwKIAlpZiAoSVNfRVJSKG9iaikpCiAJ
CXJldHVybiBFUlJfQ0FTVChvYmopOwogCi0JY21kID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9tYXAo
b2JqLCBJOTE1X01BUF9XQyk7CisJY21kID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9tYXBfdW5sb2Nr
ZWQob2JqLCBJOTE1X01BUF9XQyk7CiAJaWYgKElTX0VSUihjbWQpKSB7CiAJCWVyciA9IFBUUl9F
UlIoY21kKTsKIAkJZ290byBlcnI7Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
