Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CF02C647A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C936EC43;
	Fri, 27 Nov 2020 12:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C38F6EC28;
 Fri, 27 Nov 2020 12:08:09 +0000 (UTC)
IronPort-SDR: UEzfYPRrNshX9HGUp9kBSTZZIdsX1yo5V+mjI8QmMwlhRrIDChUo5yU/rZy3Tp8vhPR7PY3kFR
 CIXwrHnHHbRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883408"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883408"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:08:08 -0800
IronPort-SDR: 12hh1l8f5JcbiN7eYZfdxpXb7dO9vgx6Mw2i9S1uQXJgy61ievX5GtXfl35jlXMNiE6aK+xN8Z
 vXdJ8s7Woz7Q==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028661"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:08:06 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 023/162] drm/i915: Reject UNSYNCHRONIZED for userptr, v2.
Date: Fri, 27 Nov 2020 12:04:59 +0000
Message-Id: <20201127120718.454037-24-matthew.auld@intel.com>
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
bT4KCldlIHNob3VsZCBub3QgYWxsb3cgdGhpcyBhbnkgbW9yZSwgYXMgaXQgd2lsbCBicmVhayB3
aXRoIHRoZSBuZXcgdXNlcnB0cgppbXBsZW1lbnRhdGlvbiwgaXQgY291bGQgc3RpbGwgYmUgbWFk
ZSB0byB3b3JrLCBidXQgdGhlcmUncyBubyBwb2ludCBpbgpkb2luZyBzby4KClNpZ25lZC1vZmYt
Ynk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+
CkNjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3VzZXJwdHIuYyB8IDEwICsr
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3VzZXJwdHIu
YyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV91c2VycHRyLmMKaW5kZXggNjRh
OTQ2ZDVmNzUzLi4yNDFmODY1MDc3YjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2dlbS9pOTE1X2dlbV91c2VycHRyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5
MTVfZ2VtX3VzZXJwdHIuYwpAQCAtMjI0LDcgKzIyNCw3IEBAIGk5MTVfZ2VtX3VzZXJwdHJfaW5p
dF9fbW11X25vdGlmaWVyKHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmosCiAJc3RydWN0
IGk5MTVfbW11X29iamVjdCAqbW87CiAKIAlpZiAoZmxhZ3MgJiBJOTE1X1VTRVJQVFJfVU5TWU5D
SFJPTklaRUQpCi0JCXJldHVybiBjYXBhYmxlKENBUF9TWVNfQURNSU4pID8gMCA6IC1FUEVSTTsK
KwkJcmV0dXJuIC1FTk9ERVY7CiAKIAlpZiAoR0VNX1dBUk5fT04oIW9iai0+dXNlcnB0ci5tbSkp
CiAJCXJldHVybiAtRUlOVkFMOwpAQCAtMjc0LDEzICsyNzQsNyBAQCBzdGF0aWMgaW50CiBpOTE1
X2dlbV91c2VycHRyX2luaXRfX21tdV9ub3RpZmllcihzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVj
dCAqb2JqLAogCQkJCSAgICB1bnNpZ25lZCBmbGFncykKIHsKLQlpZiAoKGZsYWdzICYgSTkxNV9V
U0VSUFRSX1VOU1lOQ0hST05JWkVEKSA9PSAwKQotCQlyZXR1cm4gLUVOT0RFVjsKLQotCWlmICgh
Y2FwYWJsZShDQVBfU1lTX0FETUlOKSkKLQkJcmV0dXJuIC1FUEVSTTsKLQotCXJldHVybiAwOwor
CXJldHVybiAtRU5PREVWOwogfQogCiBzdGF0aWMgdm9pZAotLSAKMi4yNi4yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
