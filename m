Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABF92C64AC
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D4B6EC77;
	Fri, 27 Nov 2020 12:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BFE6EC74;
 Fri, 27 Nov 2020 12:09:08 +0000 (UTC)
IronPort-SDR: z/93zCx2FhfptGZTFQO4Lb4VHmzvvmdMykBaSXP+GcMolQ+vaueTKhdOnzfqqz9vqh65EDTOBD
 X0hPFY2F3xRg==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540632"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540632"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:08 -0800
IronPort-SDR: p01Y3CJbHTjpu8e5Zu+b7w+VPQvELRm2tpLAiJcF/XAvW2yP5+iVIzjr0UBDnZSOX5rIAG+lg3
 yPZ2cwKJw25A==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028882"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:06 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 055/162] drm/i915/selftests: Prepare execbuf tests for
 obj->mm.lock removal.
Date: Fri, 27 Nov 2020 12:05:31 +0000
Message-Id: <20201127120718.454037-56-matthew.auld@intel.com>
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
bT4KCkFsc28gcXVpdGUgc2ltcGxlLCBhIHNpbmdsZSBjYWxsIG5lZWRzIHRvIHVzZSB0aGUgdW5s
b2NrZWQgdmVyc2lvbi4KClNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVu
Lmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFz
LmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2Vt
L3NlbGZ0ZXN0cy9pOTE1X2dlbV9leGVjYnVmZmVyLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9nZW0vc2VsZnRlc3RzL2k5MTVfZ2VtX2V4ZWNidWZmZXIuYyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2dlbS9zZWxmdGVzdHMvaTkxNV9nZW1fZXhlY2J1ZmZlci5jCmluZGV4IGUxZDUw
YTVhMTQ3Ny4uNGRmNTA1ZTRjNTNhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
ZW0vc2VsZnRlc3RzL2k5MTVfZ2VtX2V4ZWNidWZmZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9nZW0vc2VsZnRlc3RzL2k5MTVfZ2VtX2V4ZWNidWZmZXIuYwpAQCAtMTE2LDcgKzExNiw3
IEBAIHN0YXRpYyBpbnQgaWd0X2dwdV9yZWxvYyh2b2lkICphcmcpCiAJaWYgKElTX0VSUihzY3Jh
dGNoKSkKIAkJcmV0dXJuIFBUUl9FUlIoc2NyYXRjaCk7CiAKLQltYXAgPSBpOTE1X2dlbV9vYmpl
Y3RfcGluX21hcChzY3JhdGNoLCBJOTE1X01BUF9XQyk7CisJbWFwID0gaTkxNV9nZW1fb2JqZWN0
X3Bpbl9tYXBfdW5sb2NrZWQoc2NyYXRjaCwgSTkxNV9NQVBfV0MpOwogCWlmIChJU19FUlIobWFw
KSkgewogCQllcnIgPSBQVFJfRVJSKG1hcCk7CiAJCWdvdG8gZXJyX3NjcmF0Y2g7Ci0tIAoyLjI2
LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
