Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 703392C6475
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:09:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F086EC39;
	Fri, 27 Nov 2020 12:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C356EC2E;
 Fri, 27 Nov 2020 12:08:25 +0000 (UTC)
IronPort-SDR: Oaqru7fhMmIxKAGDsZgZluFHL5d8jdqul0NNT0gOeen4I248QBhjyTXsbKBvta6UJS27plgwiQ
 XreK7qNb33kQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883439"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883439"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:08:25 -0800
IronPort-SDR: Y0xfn1J36HaRbM9kA4g+gYcDIcGZFLvAcyoc7VolMmoqpdvBtPPXHvv5uXTLL3ZhHa8gff6JQP
 4B9d7aIHcqhQ==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028711"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:08:23 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 032/162] drm/i915: Add object locking to vm_fault_cpu
Date: Fri, 27 Nov 2020 12:05:08 +0000
Message-Id: <20201127120718.454037-33-matthew.auld@intel.com>
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
bT4KClRha2UgYSBzaW1wbGUgbG9jayBzbyB3ZSBob2xkIHd3IGFyb3VuZCAodW4pcGluX3BhZ2Vz
IGFzIG5lZWRlZC4KClNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxh
bmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhl
bGxzdHJvbUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5
MTVfZ2VtX21tYW4uYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9tbWFuLmMgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fbW1hbi5jCmluZGV4IGMwMDM0ZDgxMWU1
MC4uMTYzMjA4YTYyNjBkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkx
NV9nZW1fbW1hbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9tbWFu
LmMKQEAgLTI0Niw2ICsyNDYsOSBAQCBzdGF0aWMgdm1fZmF1bHRfdCB2bV9mYXVsdF9jcHUoc3Ry
dWN0IHZtX2ZhdWx0ICp2bWYpCiAJCSAgICAgYXJlYS0+dm1fZmxhZ3MgJiBWTV9XUklURSkpCiAJ
CXJldHVybiBWTV9GQVVMVF9TSUdCVVM7CiAKKwlpZiAoaTkxNV9nZW1fb2JqZWN0X2xvY2tfaW50
ZXJydXB0aWJsZShvYmosIE5VTEwpKQorCQlyZXR1cm4gVk1fRkFVTFRfTk9QQUdFOworCiAJZXJy
ID0gaTkxNV9nZW1fb2JqZWN0X3Bpbl9wYWdlcyhvYmopOwogCWlmIChlcnIpCiAJCWdvdG8gb3V0
OwpAQCAtMjY5LDYgKzI3Miw3IEBAIHN0YXRpYyB2bV9mYXVsdF90IHZtX2ZhdWx0X2NwdShzdHJ1
Y3Qgdm1fZmF1bHQgKnZtZikKIAlpOTE1X2dlbV9vYmplY3RfdW5waW5fcGFnZXMob2JqKTsKIAog
b3V0OgorCWk5MTVfZ2VtX29iamVjdF91bmxvY2sob2JqKTsKIAlyZXR1cm4gaTkxNV9lcnJvcl90
b192bWZfZmF1bHQoZXJyKTsKIH0KIAotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
