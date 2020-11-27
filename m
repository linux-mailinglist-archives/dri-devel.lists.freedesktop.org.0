Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F3B2C64C6
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD076EBA8;
	Fri, 27 Nov 2020 12:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D026EC87;
 Fri, 27 Nov 2020 12:09:24 +0000 (UTC)
IronPort-SDR: 99XnGpY+lNY5OaN6ZTFnepZSH4xqzjvzpwtFnM72v+V4tcjb0fMYhh8kdXgUDvD8MV0Yff26u1
 BefSto9iEW8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540665"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540665"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:24 -0800
IronPort-SDR: Q7G3L3vPqJCex8qIA5jRT06dHAijQZcRigBK0dIn5EIDySmT1Ntv4+4lGHHsF/mZeLQj7pa4nm
 cPKDkHe2vgWw==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028949"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:23 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 064/162] drm/i915/selftests: Prepare ring submission for
 obj->mm.lock removal
Date: Fri, 27 Nov 2020 12:05:40 +0000
Message-Id: <20201127120718.454037-65-matthew.auld@intel.com>
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
bT4KClVzZSB1bmxvY2tlZCB2ZXJzaW9ucyB3aGVuIHRoZSB3dyBsb2NrIGlzIG5vdCBoZWxkLgoK
U2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4
LmludGVsLmNvbT4KQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4
LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9zZWxmdGVzdF9yaW5nX3N1
Ym1pc3Npb24uYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9zZWxmdGVz
dF9yaW5nX3N1Ym1pc3Npb24uYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3NlbGZ0ZXN0X3Jp
bmdfc3VibWlzc2lvbi5jCmluZGV4IDMzNTBlN2M5OTViYy4uOTk2MDkyNzFjM2E3IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9zZWxmdGVzdF9yaW5nX3N1Ym1pc3Npb24uYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9zZWxmdGVzdF9yaW5nX3N1Ym1pc3Npb24uYwpA
QCAtMzUsNyArMzUsNyBAQCBzdGF0aWMgc3RydWN0IGk5MTVfdm1hICpjcmVhdGVfd2FsbHkoc3Ry
dWN0IGludGVsX2VuZ2luZV9jcyAqZW5naW5lKQogCQlyZXR1cm4gRVJSX1BUUihlcnIpOwogCX0K
IAotCWNzID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9tYXAob2JqLCBJOTE1X01BUF9XQyk7CisJY3Mg
PSBpOTE1X2dlbV9vYmplY3RfcGluX21hcF91bmxvY2tlZChvYmosIEk5MTVfTUFQX1dDKTsKIAlp
ZiAoSVNfRVJSKGNzKSkgewogCQlpOTE1X2dlbV9vYmplY3RfcHV0KG9iaik7CiAJCXJldHVybiBF
UlJfQ0FTVChjcyk7CkBAIC0yMTIsNyArMjEyLDcgQEAgc3RhdGljIGludCBfX2xpdmVfY3R4X3N3
aXRjaF93YShzdHJ1Y3QgaW50ZWxfZW5naW5lX2NzICplbmdpbmUpCiAJaWYgKElTX0VSUihiYikp
CiAJCXJldHVybiBQVFJfRVJSKGJiKTsKIAotCXJlc3VsdCA9IGk5MTVfZ2VtX29iamVjdF9waW5f
bWFwKGJiLT5vYmosIEk5MTVfTUFQX1dDKTsKKwlyZXN1bHQgPSBpOTE1X2dlbV9vYmplY3RfcGlu
X21hcF91bmxvY2tlZChiYi0+b2JqLCBJOTE1X01BUF9XQyk7CiAJaWYgKElTX0VSUihyZXN1bHQp
KSB7CiAJCWludGVsX2NvbnRleHRfcHV0KGJiLT5wcml2YXRlKTsKIAkJaTkxNV92bWFfdW5waW5f
YW5kX3JlbGVhc2UoJmJiLCAwKTsKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
