Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAF42C64B9
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:10:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8366EC7F;
	Fri, 27 Nov 2020 12:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC8B6EC76;
 Fri, 27 Nov 2020 12:09:15 +0000 (UTC)
IronPort-SDR: lvh49qx9jCrly2Nf4dbgcDYwSCtRPTLz7+w6d34YZuN9jHvLIbkHZ2G06dC308mbHmvEG/QHzZ
 9g018Qbgo+5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540645"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540645"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:14 -0800
IronPort-SDR: 02w1LyX07iG5dh7/o/vdhhxhJhjG48H2SzY7YAxebC5Q0g/CT2uIInyJlG1khxlb3Tjbfx1UZk
 yWAkHlQSQ+Hw==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028906"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:12 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 058/162] drm/i915/selftests: Prepare object blit tests for
 obj->mm.lock removal.
Date: Fri, 27 Nov 2020 12:05:34 +0000
Message-Id: <20201127120718.454037-59-matthew.auld@intel.com>
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
bT4KClVzZSBzb21lIHVubG9ja2VkIHZlcnNpb25zIHdoZXJlIHdlJ3JlIG5vdCBob2xkaW5nIHRo
ZSB3dyBsb2NrLgoKU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFu
a2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVs
bHN0cm9tQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vc2Vs
ZnRlc3RzL2k5MTVfZ2VtX29iamVjdF9ibHQuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2dlbS9zZWxmdGVzdHMvaTkxNV9nZW1fb2JqZWN0X2JsdC5jIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ2VtL3NlbGZ0ZXN0cy9pOTE1X2dlbV9vYmplY3RfYmx0LmMKaW5kZXggMjNi
NmUxMWJiYzNlLi5lZTk0OTZmM2QxMWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2dlbS9zZWxmdGVzdHMvaTkxNV9nZW1fb2JqZWN0X2JsdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2dlbS9zZWxmdGVzdHMvaTkxNV9nZW1fb2JqZWN0X2JsdC5jCkBAIC0yNjIsNyArMjYy
LDcgQEAgc3RhdGljIGludCBpZ3RfZmlsbF9ibHRfdGhyZWFkKHZvaWQgKmFyZykKIAkJCWdvdG8g
ZXJyX2ZsdXNoOwogCQl9CiAKLQkJdmFkZHIgPSBpOTE1X2dlbV9vYmplY3RfcGluX21hcChvYmos
IEk5MTVfTUFQX1dCKTsKKwkJdmFkZHIgPSBpOTE1X2dlbV9vYmplY3RfcGluX21hcF91bmxvY2tl
ZChvYmosIEk5MTVfTUFQX1dCKTsKIAkJaWYgKElTX0VSUih2YWRkcikpIHsKIAkJCWVyciA9IFBU
Ul9FUlIodmFkZHIpOwogCQkJZ290byBlcnJfcHV0OwpAQCAtMzgwLDcgKzM4MCw3IEBAIHN0YXRp
YyBpbnQgaWd0X2NvcHlfYmx0X3RocmVhZCh2b2lkICphcmcpCiAJCQlnb3RvIGVycl9mbHVzaDsK
IAkJfQogCi0JCXZhZGRyID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9tYXAoc3JjLCBJOTE1X01BUF9X
Qik7CisJCXZhZGRyID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9tYXBfdW5sb2NrZWQoc3JjLCBJOTE1
X01BUF9XQik7CiAJCWlmIChJU19FUlIodmFkZHIpKSB7CiAJCQllcnIgPSBQVFJfRVJSKHZhZGRy
KTsKIAkJCWdvdG8gZXJyX3B1dF9zcmM7CkBAIC00MDAsNyArNDAwLDcgQEAgc3RhdGljIGludCBp
Z3RfY29weV9ibHRfdGhyZWFkKHZvaWQgKmFyZykKIAkJCWdvdG8gZXJyX3B1dF9zcmM7CiAJCX0K
IAotCQl2YWRkciA9IGk5MTVfZ2VtX29iamVjdF9waW5fbWFwKGRzdCwgSTkxNV9NQVBfV0IpOwor
CQl2YWRkciA9IGk5MTVfZ2VtX29iamVjdF9waW5fbWFwX3VubG9ja2VkKGRzdCwgSTkxNV9NQVBf
V0IpOwogCQlpZiAoSVNfRVJSKHZhZGRyKSkgewogCQkJZXJyID0gUFRSX0VSUih2YWRkcik7CiAJ
CQlnb3RvIGVycl9wdXRfZHN0OwotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
