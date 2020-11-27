Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E292C64B7
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187836EC81;
	Fri, 27 Nov 2020 12:09:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7F56EC32;
 Fri, 27 Nov 2020 12:09:17 +0000 (UTC)
IronPort-SDR: pRJHYCtqxct6vLzatCOXap4dHhdMptwns8OkmF/W1Cf/TuMJzZsOfBb4k9lRuTiLznXmX4tbO8
 Rgt7wuXFY3mw==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540651"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540651"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:17 -0800
IronPort-SDR: nf4bcPQtPslqmq+MCumbeKNl8n7R4pgyBZPreoOS1pVgSBUc8dtMMuBPBAIdZI4mN6GhS5JyFo
 QEoJQvuEtpXQ==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028921"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:16 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 060/162] drm/i915/selftests: Prepare context selftest for
 obj->mm.lock removal
Date: Fri, 27 Nov 2020 12:05:36 +0000
Message-Id: <20201127120718.454037-61-matthew.auld@intel.com>
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
bT4KCk9ubHkgbmVlZHMgdG8gY29udmVydCBhIHNpbmdsZSBjYWxsIHRvIHRoZSB1bmxvY2tlZCB2
ZXJzaW9uLgoKU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hv
cnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0
cm9tQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9zZWxmdGVz
dF9jb250ZXh0LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2VsZnRl
c3RfY29udGV4dC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2VsZnRlc3RfY29udGV4dC5j
CmluZGV4IDFmNDAyMGU5MDZhOC4uZDliMGViYzkzOGYxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndC9zZWxmdGVzdF9jb250ZXh0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Qvc2VsZnRlc3RfY29udGV4dC5jCkBAIC04OCw4ICs4OCw4IEBAIHN0YXRpYyBpbnQgX19s
aXZlX2NvbnRleHRfc2l6ZShzdHJ1Y3QgaW50ZWxfZW5naW5lX2NzICplbmdpbmUpCiAJaWYgKGVy
cikKIAkJZ290byBlcnI7CiAKLQl2YWRkciA9IGk5MTVfZ2VtX29iamVjdF9waW5fbWFwKGNlLT5z
dGF0ZS0+b2JqLAotCQkJCQlpOTE1X2NvaGVyZW50X21hcF90eXBlKGVuZ2luZS0+aTkxNSkpOwor
CXZhZGRyID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9tYXBfdW5sb2NrZWQoY2UtPnN0YXRlLT5vYmos
CisJCQkJCQkgaTkxNV9jb2hlcmVudF9tYXBfdHlwZShlbmdpbmUtPmk5MTUpKTsKIAlpZiAoSVNf
RVJSKHZhZGRyKSkgewogCQllcnIgPSBQVFJfRVJSKHZhZGRyKTsKIAkJaW50ZWxfY29udGV4dF91
bnBpbihjZSk7Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
