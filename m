Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECAB2C64DC
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392D16EC96;
	Fri, 27 Nov 2020 12:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11D86EC4A;
 Fri, 27 Nov 2020 12:09:37 +0000 (UTC)
IronPort-SDR: NqGnzGkDeQREX13lOR7pFJImQtxHVyjhxqDUfJUerF1p2rDskIa3PKxP8ovfIosjwnAp47Kh+i
 6evltONPfIOA==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540688"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540688"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:37 -0800
IronPort-SDR: yvFgliHsEaeTzonbwThJyW7FsYdHtEV8vYsM1rU82454mwbHZEGQsCW41fPl9h08ajjROkF88m
 sLzwkIvEvlWg==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029019"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:35 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 071/162] drm/i915: Keep userpointer bindings if seqcount
 is unchanged, v2.
Date: Fri, 27 Nov 2020 12:05:47 +0000
Message-Id: <20201127120718.454037-72-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNv
bT4KCkluc3RlYWQgb2YgZm9yY2UgdW5iaW5kaW5nIGFuZCByZWJpbmRpbmcgZXZlcnkgdGltZSwg
d2UgdHJ5IHRvIGNoZWNrCmlmIG91ciBub3RpZmllciBzZXFjb3VudCBpcyBzdGlsbCBjb3JyZWN0
IHdoZW4gcGFnZXMgYXJlIGJvdW5kLiBUaGlzCndheSB3ZSBvbmx5IHJlYmluZCB1c2VycHRyIHdo
ZW4gd2UgbmVlZCB0bywgYW5kIHByZXZlbnQgc3RhbGxzLgoKUmVwb3J0ZWQtYnk6IGtlcm5lbCB0
ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgpSZXBvcnRlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFu
LmNhcnBlbnRlckBvcmFjbGUuY29tPgpTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8
bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogVGhvbWFzIEhlbGxzdHLDtm0g
PHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2dlbS9pOTE1X2dlbV91c2VycHRyLmMgfCAyNyArKysrKysrKysrKysrKysrKystLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV91c2VycHRyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fdXNlcnB0ci5jCmluZGV4IGZiNGJjMzBmYmQ5YS4u
ZDFlY2MzMWI1ZTkwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9n
ZW1fdXNlcnB0ci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV91c2Vy
cHRyLmMKQEAgLTI3NSwxMiArMjc1LDMzIEBAIGludCBpOTE1X2dlbV9vYmplY3RfdXNlcnB0cl9z
dWJtaXRfaW5pdChzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqKQogCWlmIChyZXQpCiAJ
CXJldHVybiByZXQ7CiAKLQkvKiBNYWtlIHN1cmUgdXNlcnB0ciBpcyB1bmJvdW5kIGZvciBuZXh0
IGF0dGVtcHQsIHNvIHdlIGRvbid0IHVzZSBzdGFsZSBwYWdlcy4gKi8KLQlyZXQgPSBpOTE1X2dl
bV9vYmplY3RfdXNlcnB0cl91bmJpbmQob2JqLCBmYWxzZSk7CisJLyogb3B0aW1pc3RpY2FsbHkg
dHJ5IHRvIHByZXNlcnZlIGN1cnJlbnQgcGFnZXMgd2hpbGUgdW5sb2NrZWQgKi8KKwlpZiAoaTkx
NV9nZW1fb2JqZWN0X2hhc19wYWdlcyhvYmopICYmCisJICAgICFtbXVfaW50ZXJ2YWxfY2hlY2tf
cmV0cnkoJm9iai0+dXNlcnB0ci5ub3RpZmllciwKKwkJCQkgICAgICBvYmotPnVzZXJwdHIubm90
aWZpZXJfc2VxKSkgeworCQlzcGluX2xvY2soJmk5MTUtPm1tLm5vdGlmaWVyX2xvY2spOworCQlp
ZiAob2JqLT51c2VycHRyLnB2ZWMgJiYKKwkJICAgICFtbXVfaW50ZXJ2YWxfcmVhZF9yZXRyeSgm
b2JqLT51c2VycHRyLm5vdGlmaWVyLAorCQkJCQkgICAgIG9iai0+dXNlcnB0ci5ub3RpZmllcl9z
ZXEpKSB7CisJCQlvYmotPnVzZXJwdHIucGFnZV9yZWYrKzsKKworCQkJLyogV2UgY2FuIGtlZXAg
dXNpbmcgdGhlIGN1cnJlbnQgYmluZGluZywgdGhpcyBpcyB0aGUgZmFzdHBhdGggKi8KKwkJCXJl
dCA9IDE7CisJCX0KKwkJc3Bpbl91bmxvY2soJmk5MTUtPm1tLm5vdGlmaWVyX2xvY2spOworCX0K
KworCWlmICghcmV0KSB7CisJCS8qIE1ha2Ugc3VyZSB1c2VycHRyIGlzIHVuYm91bmQgZm9yIG5l
eHQgYXR0ZW1wdCwgc28gd2UgZG9uJ3QgdXNlIHN0YWxlIHBhZ2VzLiAqLworCQlyZXQgPSBpOTE1
X2dlbV9vYmplY3RfdXNlcnB0cl91bmJpbmQob2JqLCBmYWxzZSk7CisJfQogCWk5MTVfZ2VtX29i
amVjdF91bmxvY2sob2JqKTsKLQlpZiAocmV0KQorCWlmIChyZXQgPCAwKQogCQlyZXR1cm4gcmV0
OwogCisJaWYgKHJldCA+IDApCisJCXJldHVybiAwOworCiAJbm90aWZpZXJfc2VxID0gbW11X2lu
dGVydmFsX3JlYWRfYmVnaW4oJm9iai0+dXNlcnB0ci5ub3RpZmllcik7CiAKIAlwdmVjID0ga3Zt
YWxsb2NfYXJyYXkobnVtX3BhZ2VzLCBzaXplb2Yoc3RydWN0IHBhZ2UgKiksIEdGUF9LRVJORUwp
OwotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
